unit atualiza;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdFTP, idftpcommon, Gauges,
  ExtCtrls, Urlmon, IdAntiFreezeBase, IdAntiFreeze, IdHTTP, ShellAPI,
  ShlObj, ComObj, ActiveX, ACBrBase, ACBrDownload, ACBrDownloadClass,
  httpsend, blcksock, Tlhelp32, PSAPI, SevenZip;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Timer1: TTimer;
    Label1: TLabel;
    Gauge1: TGauge;
    IdHTTP1: TIdHTTP;
    IdAntiFreeze1: TIdAntiFreeze;
    Timer2: TTimer;
    Timer3: TTimer;
    ACBrDownload: TACBrDownload;
    lConnectionInfo: TLabel;
    Button1: TButton;
    IdHTTP2: TIdHTTP;
    procedure FormCreate(Sender: TObject);
    procedure IdFTP1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdFTP1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure IdHTTP1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdHTTP1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdHTTP1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure ACBrDownloadHookMonitor(Sender: TObject;
      const BytesToDownload, BytesDownloaded: Integer;
      const AverageSpeed: Double; const Hour, Min, Sec: Word);
    procedure HookStatus(Sender: TObject; Reason: THookSocketReason;
      const BytesToDownload, BytesDownloaded: Integer);
    procedure Button1Click(Sender: TObject);
    procedure IdHTTP2Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdHTTP2WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdHTTP2WorkEnd(ASender: TObject; AWorkMode: TWorkMode);

  private
    tamanho, tentativas, tamArquivo: Integer;
    pasta: String;
    procedure CopiarArquivos(Origem, Destino, Filtro: String);
    Function CountChar(Texto: String; C: Char): Integer;
    function buscaNomeExec(): String;
    function ExtractIt(Const FFilename: String; FDir: string): boolean;
    procedure BaixaAtualizacao;
    procedure ExtraiAtualizacao;
    procedure deletaArquivosTemporarios;
    procedure fimDownload;
    procedure copiaExecutavel(LANurl: String);
    function GetDesktopPath: string;
    function TerminarProcesso(sFile: String): boolean;
    procedure copiaControlwexeSeTiverMaisArquivosComMesmoNomeLak(var arq : TStringList);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
function DownloadFile(Source, Dest: string): boolean;

implementation

uses Math, funcoesdav;

{$R *.dfm}

procedure TForm1.fimDownload;
begin
  if FileExists(pasta + 'controlw.rar') then
  begin
    WinExec(pansichar(pasta + 'ControlW.rar'), SW_SHOWNORMAL);
  end;

  Application.Terminate;
  exit;
  try
    try
      if FileExists(pasta + 'controlw.exe') then
      begin
        if FileExists(pasta + 'controlw.old') then
        begin
          DeleteFile(pasta + 'ControlW.old1');
          RenameFile(pasta + 'ControlW.exe', pasta + 'ControlW.old1');
          Memo1.Lines.Add('Control.exe renomeado para ControlW.old1');
        end
        else
          Memo1.Lines.Add('controlw.old não encontrado');
      end
      else
      begin
        Memo1.Lines.Add(pasta + 'ControlW.exe não encontrado');
      end;

      if FileExists(pasta + 'ControlW.old') then
      begin
        Form1.Update;
        if RenameFile(pasta + 'ControlW.old', pasta + 'ControlW.exe') then
          Memo1.Lines.Add('Arquivo de atualização renomeado para ControlW.exe')
        else
          Memo1.Lines.Add('Não foi possivel renomear a Atualização');
      end
      else
      begin
        Memo1.Lines.Add('Arquivo de atualização não encontrado');
      end;
    except
      on e: Exception do
      begin
        Memo1.Lines.Add('Ocorreu um Errro: ' + e.Message);
        if pos('Sock', e.Message) > 0 then
          Memo1.Lines.Add('Verifique a conexão com a internet');
      end;
    end;
  Finally
    if not FileExists(pasta + 'controlw.exe') then
    begin
      RenameFile(pasta + 'controlw.old1', pasta + 'controlw.exe');
    end;
  end;

  WinExec(pansichar(pasta + 'ControlW.exe'), SW_SHOWNORMAL);
  // sleep(10000);
  Application.Terminate;
end;

function DownloadFile(Source, Dest: string): boolean;
begin
  try
    Result := UrlDownloadToFile(nil, PChar(Source), PChar(Dest), 0, nil) = 0;
  except
    Result := False;
  end;
end;

procedure TForm1.deletaArquivosTemporarios;
begin
  if FileExists(pasta + 'ControlW.old') then
  begin
    DeleteFile(pasta + 'ControlW.old');
  end;
  if FileExists(pasta + 'ControlW.old1') then
  begin
    DeleteFile(pasta + 'ControlW.old1');
  end;
end;

procedure TForm1.ACBrDownloadHookMonitor(Sender: TObject;
  const BytesToDownload, BytesDownloaded: Integer; const AverageSpeed: Double;
  const Hour, Min, Sec: Word);
var
  sConnectionInfo: string;
begin
  Gauge1.Progress := BytesDownloaded;

  sConnectionInfo := sConnectionInfo + '  -  ' + Format('%.2d:%.2d:%.2d',
    [Sec div 3600, (Sec div 60) mod 60, Sec mod 60]);

  sConnectionInfo := FormatFloat('0.00 KB/s', AverageSpeed) + sConnectionInfo;
  sConnectionInfo := FormatFloat('###,###,##0', BytesDownloaded / 1024) + ' / '
    + FormatFloat('###,###,##0', BytesToDownload / 1024) + ' KB  -  ' +
    sConnectionInfo;

  lConnectionInfo.Caption := sConnectionInfo;
end;

procedure TForm1.BaixaAtualizacao;
var
  test: Integer;
  arquivo1: TFileStream;
  site, retSite: string;
  arq: TStringList;
begin
  Label1.Visible := true;
  //lConnectionInfo.Visible := true;

  Memo1.Clear;
  Memo1.Lines.Add('Iniciando Atualização');

  if tentativas > 6 then
  begin
    Memo1.Lines.Add('Tentativas de Atualização Esgotadas!');
    Application.Terminate;
  end;


  Memo1.Lines.Add('Buscando Versão....');
  retSite := buscaNomeExec;

  arq := TStringList.Create;
  LE_CAMPOS(arq, '|'+ retSite + '|', '|', false);

  retSite     := arq.Values['0'];
  tamArquivo  := StrToIntDef(arq.Values['1'], 0);

  Memo1.Lines.Add('Versão : ' + retSite);
  Memo1.Lines.Add('Tamanho: ' + FormatCurr('0.00',(tamArquivo / 1048576)) + ' MB');

  if FileExists(ExtractFileDir(ParamStr(0)) + '\ControlW.7z') then
    DeleteFile(ExtractFileDir(ParamStr(0)) + '\ControlW.7z');

  lConnectionInfo.Caption := '0/' + FormatCurr('0.00',(tamArquivo / 1048576)) + ' MB';
  lConnectionInfo.Visible := true;

  arquivo1 := TFileStream.Create(ExtractFileDir(ParamStr(0)) + '\' +
    'ControlW.7z', fmCreate);
  IdHTTP2.Request.UserAgent :=
    'Mozilla/5.0 (Windows NT 5.1; rv:2.0b8) Gecko/20100101 Firefox/4.' + '0b8';
  IdHTTP2.HTTPOptions := [hoForceEncodeParams];
  site := 'http://controlw.blog.br/si2/verarqallatu.php';

  try
    IdHTTP2.Get(site, arquivo1);
  except
    on e: Exception do
    begin
      Memo1.Lines.Add('erro218: ' + e.Message);
    end;
  end;

  arquivo1.Free;
  Memo1.Lines.Add('Extraindo Atualização...');
  ExtraiAtualizacao;

  Memo1.Lines.Add('Processo de extração Completo!');
  // Application.Terminate;

  exit;

  try
    test := 0;
    if FileExists(pasta + 'ControlW.old') then
      DeleteFile(pasta + 'ControlW.old');
    arquivo1 := TFileStream.Create(pasta + 'ControlW.old', fmCreate);
    tamanho := 1;
    Memo1.Lines.Add('Iniciou o Download');
    Application.ProcessMessages;
    Gauge1.Visible := true;
    Label1.Visible := true;
    IdHTTP1.Request.UserAgent :=
      'Mozilla/5.0 (Windows NT 5.1; rv:2.0b8) Gecko/20100101 Firefox/4.' +
      '0b8';
    IdHTTP1.HTTPOptions := [hoForceEncodeParams];
    IdHTTP1.Get('http://controlw.blog.br/si2/uploads/ControlW.7z', arquivo1);
    Memo1.Lines.Clear;
    arquivo1.Free;

    Memo1.Lines.Add('Download Concluído');

    fimDownload;
    // Memo1.Lines.SaveToFile(pasta + 'bd0.fdb');

    Gauge1.Visible := False;
    Label1.Visible := False;
  except
    on e: Exception do
    begin
      Memo1.Lines.Add('Erro: ' + e.Message);
    end;
  end;
  // ver se o controlw.exe existe na pasta

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  op: TOpenDialog;
  dir: String;
begin
  op := TOpenDialog.Create(self);
  op.Execute;
  dir := InputBox('','',ExtractFileDir(ParamStr(0)) + '\');
  if not DirectoryExists(dir) then
    ForceDirectories(dir);
  ExtractIt(op.FileName, dir);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  tamanho := 0;
  tentativas := 0;
end;

procedure TForm1.IdFTP1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCountMax: Integer);
begin
  Gauge1.Progress := 0;
  if AWorkCountMax > 0 then
    Gauge1.MaxValue := AWorkCountMax
  else
    Gauge1.MaxValue := tamanho;
end;

procedure TForm1.IdFTP1Work(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
begin
  Gauge1.Progress := AWorkCount;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  pasta := ExtractFileDir(ParamStr(0)) + '\';

  if ParamStr(1) = '-c' then
  begin
    Timer3.Enabled := true;
    exit;
  end;

  if ParamStr(1) = '-h' then
  begin
    Timer2.Enabled := true;
    exit;
  end;

  Timer1.Enabled := true;
  // ShowMessage(pasta);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  if tamanho = 0 then
    BaixaAtualizacao;
end;

procedure TForm1.IdHTTP1Work(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
begin
  Gauge1.Progress := AWorkCount;
end;

procedure TForm1.IdHTTP1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCountMax: Integer);
begin
  Gauge1.MaxValue := tamArquivo;
end;

procedure TForm1.IdHTTP1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
  Gauge1.Progress := 0;
  // fimDownload;
end;

procedure TForm1.IdHTTP2Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  Gauge1.Progress := AWorkCount;
  lConnectionInfo.Caption := FormatCurr('0.00',(AWorkCount / 1048576)) +'/' + FormatCurr('0.00',(tamArquivo / 1048576)) + ' MB';
end;

procedure TForm1.IdHTTP2WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  Gauge1.MaxValue := tamArquivo;
  Memo1.Lines.Add('Download Começou...');
end;

procedure TForm1.IdHTTP2WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  Memo1.Lines.Add('Download Finalizado!');
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  pasta := ExtractFileDir(ParamStr(0)) + '\';
  if FileExists(pasta + 'ControlW.old') then
  begin
    DeleteFile(pasta + 'ControlW.old1');
    RenameFile(pasta + 'ControlW.exe', pasta + 'ControlW.old1');
    RenameFile(pasta + 'ControlW.old', pasta + 'ControlW.exe');
  end;

  Application.Terminate;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
  Timer3.Enabled := False;

  copiaExecutavel(ParamStr(1));
end;

procedure TForm1.copiaExecutavel(LANurl: String);
var
  cont: Integer;
  lista : TStringList;
  i : integer;
begin
  cont := 0;
  Memo1.Lines.Add('----------------------------------------');
  Memo1.Lines.Add('Iniciando Copia de Arquivos....');
  Memo1.Lines.Add('----------------------------------------');
  while true do
  begin
    Application.ProcessMessages;
    if cont > 10 then
    begin
      break;
    end;

    try
      if FileExists(ExtractFileDir(ParamStr(0)) + '\ControlW.old') then begin
        if FileExists(ExtractFileDir(ParamStr(0)) + '\ControlWD.exe') then DeleteFile(ExtractFileDir(ParamStr(0)) + '\ControlWD.exe');

        lista := listaArquivos(ExtractFileDir(ParamStr(0))+'\ControlW*.exe');
        RenameFile(ExtractFileDir(ParamStr(0)) + '\ControlW.exe',ExtractFileDir(ParamStr(0)) + '\ControlWD.exe');
        
        for i := 0 to lista.Count -1 do begin
          //ShowMessage(ExtractFileDir(ParamStr(0)) + '\ControlW.old' + #13 +ExtractFileDir(ParamStr(0)) + lista[i]);
          try
           //ShowMessage(pwidechar(ExtractFileDir(ParamStr(0)) + '\ControlW.old') + #13 + pwidechar(ExtractFileDir(ParamStr(0)) + lista[i]));

           //ShowMessage('1');
            CopyFile(pchar(ExtractFileDir(ParamStr(0)) + '\ControlW.old'), pchar(ExtractFileDir(ParamStr(0)) +'\'+ lista[i]), false);
            //ShowMessage(ExtractFileDir(ParamStr(0)) + lista[i]);
          except
            on e:exception do begin
              ShowMessage('erro:' + e.Message);
            end;
          end;
        end;

        RenameFile(ExtractFileDir(ParamStr(0)) + '\ControlW.old',ExtractFileDir(ParamStr(0)) + '\ControlW.exe');



        if FileExists(ExtractFileDir(ParamStr(0)) + '\ControlW.exe') then break;
      end;
    except
      if not FileExists(ExtractFileDir(ParamStr(0)) + '\ControlW.exe') then
      begin
        RenameFile(ExtractFileDir(ParamStr(0)) + '\ControlWD.exe',
          ExtractFileDir(ParamStr(0)) + '\ControlW.exe');
      end;
    end;

    cont := cont + 1;

    Memo1.Lines.Add('Tentativas: ' + IntToStr(cont));
    Application.ProcessMessages;

    sleep(4000);
  end;


  DeleteFile(ExtractFileDir(ParamStr(0)) + '\ControlW.old');
  Memo1.Lines.Add('Atualizado com sucesso!');
  sleep(2000);

  if FileExists(GetDesktopPath + 'ControlW.lnk') then
    ShellExecute(0, nil, PChar(GetDesktopPath + 'ControlW.lnk'), nil, nil,
      SW_SHOWNORMAL);
  Application.Terminate;
end;

function TForm1.GetDesktopPath: string;
// get the location of the Desktop folder
var
  DesktopPidl: PItemIDList;
  DesktopPath: array [0 .. MAX_PATH] of Char;
begin
  SHGetSpecialFolderLocation(0, CSIDL_DESKTOP, DesktopPidl);
  SHGetPathFromIDList(DesktopPidl, DesktopPath);
  Result := IncludeTrailingPathDelimiter(DesktopPath);
end; (* GetDesktopPath *)

procedure TForm1.HookStatus(Sender: TObject; Reason: THookSocketReason;
  const BytesToDownload, BytesDownloaded: Integer);
begin
  case Reason of
    HR_Connect:
      begin
        Gauge1.Progress := 0;
        Memo1.Lines.Add('Conectado no Servidor.');
      end;
    HR_ReadCount:
      begin
        Gauge1.MaxValue := BytesToDownload;
        Gauge1.Progress := BytesDownloaded;
        Label1.Visible := true;
        Label1.Caption := 'Baixando...';
        Memo1.Lines.Add('Iniciando Download')
      end;
    HR_SocketClose:
      begin
        case ACBrDownload.DownloadStatus of
          stStop:
            begin
              Gauge1.Progress := 100;
              lConnectionInfo.Caption := 'Download Encerrado...';
            end;

          stPause:
            lConnectionInfo.Caption := 'Download Pausado...';

          stDownload:
            begin
              Label1.Caption := 'Download Finalizado.';
              ExtraiAtualizacao;
            end;
        end;
      end;
  end;
end;

function TForm1.TerminarProcesso(sFile: String): boolean;
var
  verSystem: TOSVersionInfo;
  hdlSnap, hdlProcess: THandle;
  bPath, bLoop: Bool;
  peEntry: TProcessEntry32;
  arrPid: Array [0 .. 1023] of DWord;
  iC: DWord;
  k, iCount: Integer;
  arrModul: Array [0 .. 299] of Char;
  hdlModul: HMODULE;
begin
  Result := False;
  if ExtractFileName(sFile) = sFile then
    bPath := False
  else
    bPath := true;
  verSystem.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
  GetVersionEx(verSystem);
  if verSystem.dwPlatformId = VER_PLATFORM_WIN32_WINDOWS then
  begin
    hdlSnap := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    peEntry.dwSize := SizeOf(peEntry);
    bLoop := Process32First(hdlSnap, peEntry);
    while Integer(bLoop) <> 0 do
    begin
      if bPath then
      begin
        if CompareText(peEntry.szExeFile, sFile) = 0 then
        begin
          TerminateProcess(OpenProcess(PROCESS_TERMINATE, False,
            peEntry.th32ProcessID), 0);
          Result := true;
        end;
      end
      else
      begin
        if CompareText(ExtractFileName(peEntry.szExeFile), sFile) = 0 then
        begin
          TerminateProcess(OpenProcess(PROCESS_TERMINATE, False,
            peEntry.th32ProcessID), 0);
          Result := true;
        end;
      end;
      bLoop := Process32Next(hdlSnap, peEntry);
    end;
    CloseHandle(hdlSnap);
  end
  else if verSystem.dwPlatformId = VER_PLATFORM_WIN32_NT then
  begin
    EnumProcesses(@arrPid, SizeOf(arrPid), iC);
    iCount := iC div SizeOf(DWord);
    for k := 0 to Pred(iCount) do
    begin
      hdlProcess := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ,
        False, arrPid[k]);
      if (hdlProcess <> 0) then
      begin
        EnumProcessModules(hdlProcess, @hdlModul, SizeOf(hdlModul), iC);
        GetModuleFilenameEx(hdlProcess, hdlModul, arrModul, SizeOf(arrModul));
        if bPath then
        begin
          if CompareText(arrModul, sFile) = 0 then
          begin
            TerminateProcess(OpenProcess(PROCESS_TERMINATE or
              PROCESS_QUERY_INFORMATION, False, arrPid[k]), 0);
            Result := true;
          end;
        end
        else
        begin
          if CompareText(ExtractFileName(arrModul), sFile) = 0 then
          begin
            TerminateProcess(OpenProcess(PROCESS_TERMINATE or
              PROCESS_QUERY_INFORMATION, False, arrPid[k]), 0);
            Result := true;
          end;
        end;
        CloseHandle(hdlProcess);
      end;
    end;
  end;
end;

function TForm1.ExtractIt(Const FFilename: String; FDir: string): boolean;
begin
  Result := False;
  if DirectoryExists(FDir) = False then
    ForceDirectories(FDir);

  with CreateInArchive(CLSID_CFormat7z) do
  begin
    Memo1.Lines.Add('Abrindo Arquivo.');
    try
      OpenFile(FFilename);
    except
      on e: Exception do
      begin
        tentativas := tentativas + 1;
        Memo1.Lines.Add('Ocorreu um Erro: ' + e.Message);
        Memo1.Lines.Add('O Sistema está Reconectando...');
        Memo1.Lines.Add('Aguarde um Instante...');
        sleep(10000);
        Timer1.Enabled := true;
        exit;
      end
    end;
    Memo1.Lines.Add('Extraindo...');
    ExtractTo(FDir);
    Result := true;
  end;
end;

procedure TForm1.ExtraiAtualizacao;
var
  arq, config: TStringList;
  pastaServer: String;
begin
  if not FileExists(ExtractFileDir(ParamStr(0)) + '\ControlW.7z') then
  begin
    Memo1.Lines.Add('Arquivo ControlW.7z Não Encontrado!');
    sleep(3000);
    Application.Terminate;
    exit;
  end;

  Memo1.Lines.Add('Encerrando Aplicações...');

  TerminarProcesso('DavNFCe.exe');
  TerminarProcesso('ControlW.exe');
  TerminarProcesso('PDV.exe');
  Memo1.Lines.Add('Descompactando Atualização');
  if not ExtractIt(ExtractFileDir(ParamStr(0)) + '\ControlW.7z',ExtractFileDir(ParamStr(0)) + '\temp\') then exit;

  if FileExists(ExtractFileDir(ParamStr(0)) + '\copy.bat') then
    DeleteFile(ExtractFileDir(ParamStr(0)) + '\copy.bat');

  arq := TStringList.Create;
  config := TStringList.Create;
  pastaServer := '';

  if FileExists(ExtractFileDir(ParamStr(0)) + '\config.dat') then
  begin
    config.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\config.dat');
    if CountChar(config.Values['BDRemoto'], ':') >= 2 then
    begin
      pastaServer := '\\' + copy(config.Values['BDRemoto'], 1,
        pos(':', config.Values['BDRemoto']) - 1) + '\ControlW\';
      { try
        CopiarArquivos(ExtractFileDir(ParamStr(0)) + '\temp\', pastaServer + 'temp1\', '*.*');
        Memo1.Lines.Add('Descompactado com Sucesso: ' + pastaServer);
        except
        on e:exception do begin
        Memo1.Lines.Add('Erro em descompactar para: ' + pastaServer + #13 + e.Message);
        end;
        end; }
    end;

    config.Free;
  end;

  arq.Add('timeout /t 3 /nobreak');
  arq.Add('xcopy ' + ExtractFileDir(ParamStr(0)) + '\temp\*.*' + ' ' + ExtractFileDir(ParamStr(0)) + '\' + ' /y /e');

  copiaControlwexeSeTiverMaisArquivosComMesmoNomeLak(arq);

  if pastaServer <> '' then
  begin
    arq.Add('xcopy ' + ExtractFileDir(ParamStr(0)) + '\temp\*.*' + ' ' + pastaServer + ' /y /e');
  end;
  arq.Add('rd /S /Q ' + ExtractFileDir(ParamStr(0)) + '\temp\');
  arq.SaveToFile(ExtractFileDir(ParamStr(0)) + '\copy.bat');
  Memo1.Lines.Add('Sistema Atualizado Com Sucesso!');
  sleep(2000);
  ShellExecute(Handle, nil, PChar(ExtractFileDir(ParamStr(0)) + '\copy.bat'),
    nil, nil, SW_SHOWNORMAL);
  // sleep(2000);

  Application.Terminate;
end;

function TForm1.buscaNomeExec(): String;
var
  site: String;
begin
  Result := '';
  IdHTTP1.Request.UserAgent :=
    'Mozilla/5.0 (Windows NT 5.1; rv:2.0b8) Gecko/20100101 Firefox/4.' + '0b8';
  IdHTTP1.HTTPOptions := [hoForceEncodeParams];
  site := 'http://controlw.blog.br/si2/atuver.php';
  try
    Result := IdHTTP1.Get(site);
  except
  end;
end;

Function TForm1.CountChar(Texto: String; C: Char): Integer;
var
  i, vTot: Integer;
begin
  vTot := 0;
  For i := 1 to length(Texto) do
  begin
    If (Texto[i] = C) or (LowerCase(Texto[i]) = LowerCase(C)) then
      vTot := vTot + 1;
  end; // For
  Result := vTot;
end; // Function

procedure TForm1.CopiarArquivos(Origem, Destino, Filtro: String);
var
  Arquivos: TSearchRec;
  Encontrou: Integer;
begin
  if Origem[length(Origem)] = '\' then
    Origem := Origem + '\'; // Muito importante terminar com "\"
  if Origem[length(Destino)] = '\' then
    Destino := Destino + '\';
  SetCurrentDir(Origem);
  Encontrou := FindFirst('*' + Filtro, faArchive, Arquivos);
  while Encontrou = 0 do
  begin
    CopyFile(PChar(Origem + '\' + Arquivos.Name),
      PChar(Destino + '\' + Arquivos.Name), False);
    // Coloque como True se quiser que se já existir o arquivo ele seja sobrescrito
    Encontrou := FindNext(Arquivos);
  end;
  FindClose(Arquivos);
  Encontrou := FindFirst('*', faDirectory, Arquivos);
  while Encontrou = 0 do
  begin
    // Faz mais uma vez a verificação se é um Diretório e se ele não é uma pasta anterior a ele (. e ..)
    if (Arquivos.Attr = faDirectory) and (Arquivos.Name <> '.') and
      (Arquivos.Name <> '..') then
      CopiarArquivos(Origem + '\' + Arquivos.Name, Destino, Filtro);
    Encontrou := FindNext(Arquivos);
  end;
end;


procedure TForm1.copiaControlwexeSeTiverMaisArquivosComMesmoNomeLak(var arq : TStringList);
var
  lista : TStringList;
  i : integer;
  pasta : String;
begin
  pasta := ExtractFileDir(ParamStr(0));
  lista := listaArquivos(pasta+'\ControlW*.exe');
  for i := 0 to lista.Count -1 do begin
    arq.Add('xcopy '+ pasta + '\temp\ControlW.exe ' + pasta +'\'+ lista[i] + ' /y /e');
    //CopyFile(pchar(pasta + '\temp\ControlW.exe'), pchar(pasta + lista[i]), true);
  end;

  FreeAndNil(lista);
end;

end.

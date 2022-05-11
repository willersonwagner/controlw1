unit qrcodePIX;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ACBrDelphiZXingQRCode, RLReport,
  Vcl.StdCtrls, Vcl.ExtCtrls, ACBrImage, TlHelp32, Vcl.Imaging.jpeg, ShellApi, func;

type
  TForm84 = class(TForm)
    image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PrintDialog1: TPrintDialog;
    Timer1: TTimer;
    Button1: TButton;
    Timer2: TTimer;
    Button2: TButton;
    Timer3: TTimer;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
  private
    { Private declarations }
  public
    arqPIX : TStringList;
    txid1, qrcodePIX, caminhoEXE_com_barra_no_final : String;
    cont, cont1, cont2 : integer;
    function PIXConsulta(txid : String) : string;
    function recebePIX(valor : currency; descricao : String) : string;
    procedure PIXcriarCobranca(valor : currency;desc, chave : String; var arq : TStringList);
    function PIXacessToken : string;
    function ProcessExists(exeFileName: string): Boolean;
    { Public declarations }
  end;

var
  Form84: TForm84;

implementation

{$R *.dfm}


procedure TForm84.Button1Click(Sender: TObject);
var
  ret : String;
begin
  
end;

procedure TForm84.Button2Click(Sender: TObject);
var
  OffScreen : TJPEGImage;
  bmp : TBitmap;
begin
  //OffScreen := TJPEGImage.Create;
  //image1.Picture.Bitmap.Canvas.LineTo.Color := clWhite;
  //image1.Canvas.Draw(0, 10, );
  bmp := TBitmap.Create;
  bmp.LoadFromFile('img.bmp');
  bmp.Canvas.LineTo(image1.Width, 0);

  Image1.Picture.Bitmap.Assign(bmp);
  //Image1.Picture.Bitmap.Canvas.TextOut(50, 50, 'teste de sistema');
end;

procedure TForm84.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer1.Enabled := false;
  Timer2.Enabled := false;
end;

procedure TForm84.FormCreate(Sender: TObject);
begin
  txid1 := '';
  arqPIX := tstringlist.create;
  caminhoEXE_com_barra_no_final := ExtractFileDir(ParamStr(0)) + '\';
  cont1 := 0;
  cont2 := 0;
end;

procedure TForm84.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (UpCase(Chr(Key)) = 'P') then begin
    PrintDialog1.Execute(self.Handle);
    self.Print;
  end;
end;

procedure TForm84.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
  
end;

procedure TForm84.FormShow(Sender: TObject);
begin
  //Timer3.Enabled := true

  //if cont = 3 then begin
    Timer1.Enabled := true;
    Timer2.Enabled := true;
  //end;


  PintarQRCode(qrcodePIX, Image1.Picture.Bitmap, qrAuto);

end;

procedure TForm84.Timer1Timer(Sender: TObject);
var
  ret : String;
begin
  Timer1.Enabled := false;

  ret := PIXConsulta(txid1);
  Label2.Caption := 'Estado: ' + ret;

  if trim(ret) = 'CONCLUIDA' then Label3.Caption := 'Recebimento Concluido com Sucesso!';

  Timer1.Enabled:=true;
end;

procedure TForm84.Timer2Timer(Sender: TObject);
begin
  if Label3.Caption = 'Recebimento Concluido com Sucesso!' then begin
    Timer2.Enabled := false;
    Timer1.Enabled := false;

    txid1     := '';
    qrcodePIX := '';
    close;
  end;


  if Label3.Caption = 'Aguardando Pagamento' then begin
    Label3.Caption := 'Aguardando Pagamento.';
    exit;
  end;

  if Label3.Caption = 'Aguardando Pagamento.' then begin
    Label3.Caption := 'Aguardando Pagamento..';
    exit;
  end;

  if Label3.Caption = 'Aguardando Pagamento..' then begin
    Label3.Caption := 'Aguardando Pagamento...';
    exit;
  end;

  if Label3.Caption = 'Aguardando Pagamento...' then begin
    Label3.Caption := 'Aguardando Pagamento';
    exit;
  end;
end;

procedure TForm84.Timer3Timer(Sender: TObject);
var
  bmp : TBitmap;
  kodoquad: TRect;
  i, a : integer;
begin
  Timer3.Enabled := false;
  cont1 := (cont1 + 20);
  bmp := TBitmap.Create;
  bmp.LoadFromFile('img.bmp');
  bmp.Canvas.Font.Size := 20;
  bmp.Canvas.TextOut(0, cont1, 'Aguarde...');
  Image1.Picture.Bitmap.Assign(bmp);

  if cont1 > bmp.Height then begin
    cont1 := 0;
  end;




  //PintarQRCode(IntToStr(cont1), Image1.Picture.Bitmap, qrAuto);

{
  cont1 := (cont1 + 20);

  bmp := TBitmap.Create;
  bmp.LoadFromFile('img.bmp');

  if cont1 > bmp.Height then begin
    cont1 := 0;
    cont2 := cont2 + 1;
  end;
  kodoquad.Left := 0;
   kodoquad.Right := bmp.Width;
   kodoquad.Top := cont1;
   kodoquad.Bottom := cont1 + 20;
   bmp.Canvas.Brush.Color:=clBlack;

   i := 0;
   a := cont1;
   while True do begin
     inc(i);
     if cont2 = 0 then cont2 := 1;
       bmp.Canvas.Rectangle(kodoquad);

     if i = cont2 then break;

     a := a -20;

     bmp.Canvas.MoveTo(0, a -20);
     bmp.Canvas.Rectangle(kodoquad);

   end;
   bmp.Canvas.Brush.Color:=clBlack;
//  bmp.Canvas.Rectangle(image1.Width, 20,  0, cont1);

  Image1.Picture.Bitmap.Assign(bmp);  }
  if qrcodePIX <> '' then exit;


  Timer3.Enabled := true;


end;

function TForm84.PIXConsulta(txid : String) : string;
var
  cont : integer;
begin
  Result := '';
  arqPIX.Clear;
  arqPIX.Add('comando=consultarPIX');
  arqPIX.Add('txid='+ txid);
  arqPIX.SaveToFile(caminhoEXE_com_barra_no_final + 'PIXenv.dat');

  cont := 0;
  while true do begin
    if FileExists(caminhoEXE_com_barra_no_final + 'PIXrec.dat') then begin
      arqPIX.LoadFromFile(caminhoEXE_com_barra_no_final + 'PIXrec.dat');
      DeleteFile(caminhoEXE_com_barra_no_final + 'PIXrec.dat');

      Result := arqPIX.Values['estado'];
      exit;
    end;

    cont := cont + 1;
    if cont > 20 then begin
      Result := 'Sem Resp.';
      exit;
    end;

    sleep(1000);
  end;
end;

function TForm84.PIXacessToken : string;
var
  cont : integer;
begin
  Result := '';
  arqPIX.Clear;
  arqPIX.Add('comando=gerarAcessToken');
  arqPIX.SaveToFile(caminhoEXE_com_barra_no_final + 'PIXenv.dat');

  cont := 0;
  while true do begin
    Application.ProcessMessages;
    if FileExists(caminhoEXE_com_barra_no_final + 'PIXrec.dat') then begin
      arqPIX.LoadFromFile(caminhoEXE_com_barra_no_final + 'PIXrec.dat');
      DeleteFile(caminhoEXE_com_barra_no_final + 'PIXrec.dat');

      if arqPIX.Values['ok'] = '1' then Result := 'ok';
      exit;
    end;

    cont := cont + 1;
    if cont > 15 then begin
      ShowMessage('Tempo esgotado sem resposta.');
      exit;
    end;

    sleep(1000);
  end;
end;

procedure TForm84.PIXcriarCobranca(valor : currency;desc, chave : String; var arq : TStringList);
var
  cont : integer;
begin
  if ProcessExists('PIX.EXE') = false then begin
    ShellExecute(handle, 'open', PChar(ExtractFileDir(ParamStr(0)) +'\PIX.exe'), '', '', SW_SHOWNORMAL);
  end;

  DeleteFile(caminhoEXE_com_barra_no_final + 'PIXrec.dat');


  arq.Clear;
  arqPIX.Clear;
  arqPIX.Add('comando=criarQrcode');
  arqPIX.Add('valor='+ CurrToStr(valor));
  arqPIX.Add('desc='+ desc);
  arqPIX.Add('chave='+ chave);
  arqPIX.SaveToFile(caminhoEXE_com_barra_no_final + 'PIXenv.dat');

  cont := 0;
  while true do begin
    Application.ProcessMessages;
    if FileExists(caminhoEXE_com_barra_no_final + 'PIXrec.dat') then begin
      Timer3.Enabled := false;

      form84.Label3.Caption := 'Aguardando Pagamento';

      arqPIX.LoadFromFile(caminhoEXE_com_barra_no_final + 'PIXrec.dat');
      arq.Text := arqPIX.Text;
      arqPIX.Clear;
      DeleteFile(caminhoEXE_com_barra_no_final + 'PIXrec.dat');
      exit;
    end;

    cont := cont + 1;
    if cont > 20 then begin
      ShowMessage('Tempo esgotado sem resposta.');
      exit;
    end;

    sleep(1000);
  end;
end;

function TForm84.recebePIX(valor : currency; descricao : String) : string;
var
  arq, passos : TStringList;
begin
  arq := TStringList.Create;
  passos := TStringList.Create;
  cont := 0;

  Timer3.Enabled := true;

  Label4.Caption := 'Valor R$: ' + FormatCurr('#,###,###0.00', valor);
  Result := '';
  mensagemEnviandoNFCE('Aguarde...', true, false);

  DeleteFile(caminhoEXE_com_barra_no_final + 'PIXrec.dat');

  while True do begin
    inc(cont);

    PIXcriarCobranca(valor, descricao, 'a1f4102e-a446-4a57-bcce-6fa48899c1d1', arq);
    qrcodePIX := arq.Values['qrcode'];
    form84.Label2.Caption := 'Estado: ...' ;
    txid1 := arq.Values['txid'];

    passos.Add('**' + IntToStr(cont) + '**');
    passos.Add(arq.GetText);

    if ((arq.Values['ret'] = '200') or (arq.Values['ret'] = '201') and (Length(arq.Values['qrcode']) > 50)) then break;
    if cont = 5 then break;


    if arq.Values['ret'] = '401' then begin
      PIXacessToken;

      passos.Add('PIXacessToken **' + IntToStr(cont) + '**');
      passos.Add(arq.GetText);

      arq.Clear;
    end;

    sleep(1000);
  end;

  if ((qrcodePIX  = '') or (Length(qrcodePIX) < 50)) then begin
    mensagemEnviandoNFCE('Aguarde, Enviando NFCe...', false, true);
    ShowMessage('sem informação de cobrança');
    exit;
  end;



  mensagemEnviandoNFCE('Aguarde, Enviando NFCe...', false, true);
  passos.SaveToFile('passos.txt');

  form84.Label3.Caption := 'Aguardando Pagamento';
  form84.cont := 3;
  Form84.ShowModal;
  arq.Free;
  if pos('Recebimento Concluido', form84.Label3.Caption) > 0 then Result := 'OK';
end;


function TForm84.ProcessExists(exeFileName: string): Boolean;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
  i : integer;
begin
  i := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  Result := False;
  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then
    begin
      Result := True;
      i      := i + 1;
      break;
    end;
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);

  //if i >= 1 then Result := true
    //else Result := false;
end;




end.

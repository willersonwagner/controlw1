unit untDtmMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Forms,Dialogs, IniFiles,
  ImgList, Controls, DB, StdCtrls, ComCtrls, ExtCtrls,
  ACBrNFeDANFEClass, ACBrNFeDANFeESCPOS,   
  ACBrBase, ACBrBAL, ACBrLCB, ACBrSocket, ACBrIBPTax, ACBrDFe,
  IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient, IdSNTP, ACBrECF,
  ACBrECFVirtual, ACBrECFVirtualBuffer, ACBrECFVirtualPrinter,
  ACBrECFVirtualNFCe, ACBrPosPrinter, ACBrDevice, ACBrNFeDANFeRLClass,
  ACBrDANFCeFortesFr, ACBrNFe,  
  IdTCPConnection, IdTCPClient, ACBrDFeReport, ACBrDFeDANFeReport, untnfceForm,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Comp.Client,
  ACBrNFeDANFEFR, FireDAC.Comp.DataSet, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  ACBrGAV;

type
  TdtmMain = class(TDataModule)
    imlMain: TImageList;
    OpenDlg: TOpenDialog;
    DANFE: TACBrNFeDANFCeFortes;
    IBQuery1: TFDQuery;
    IBTransaction1: TFDTransaction;
    IBQuery2: TFDQuery;
    IBQuery3: TFDQuery;
    IBTransaction2: TFDTransaction;
    ACBrBAL1: TACBrBAL;
    IBQuery4: TFDQuery;
    ACBrNFeDANFeESCPOS1: TACBrNFeDANFeESCPOS;
    ACBrIBPTax1: TACBrIBPTax;
    IBQueryServer1: TFDQuery;
    IBTransaction3: TFDTransaction;
    IBQueryServer2: TFDQuery;
    IdSNTP1: TIdSNTP;
    ACBrECFVirtualNFCe1: TACBrECFVirtualNFCe;
    ACBrECF1: TACBrECF;
    ACBrPosPrinter1: TACBrPosPrinter;
    ACBrNFeDANFeRL1: TACBrNFeDANFeRL;
    ACBrNFe: TACBrNFe;
    ACBrNFeDANFEFR1: TACBrNFeDANFEFR;
    ACBrPosPrinter2: TACBrPosPrinter;
    ACBrNFeDANFeESCPOS2: TACBrNFeDANFeESCPOS;
    IdTCPClient1: TIdTCPClient;
    bd: TFDConnection;
    BD_Servidor: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    ACBrGAV1: TACBrGAV;
    FDTransaction1: TFDTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private    { Private declarations }
    procedure LerDadosArquivo();
  public     { Public declarations }
    bdPronto : boolean;
    pastaControlW_Servidor : String;
    function Incrementa_Generator(Gen_name : string; valor_incremento : integer; var query : TFDQuery) : string;
    procedure sincronizaca_de_dados();
    function conectaBD_Servidor() : boolean;
    function sincronizaEstoque()  : boolean;
    function sincronizaUsuarios()  : boolean;
    function sincronizaNFCe()  : boolean;
    procedure le_estoque(var listaprod : TStringList);
    procedure copiaProduto(cod : integer);
    procedure ajustaHoraPelaInternet();
    procedure copiaVendas(nota : integer; var notaNova : integer);
    procedure copiaNFCes(chave : String; nota, notaNova : integer );
    function ServerIsRunning(const AHost: string; const APort: Integer): Boolean;
  end;


var
  dtmMain: TdtmMain;

procedure progresso(label1 : String; ini, fim : integer; novo, fechar : boolean);

const
  sqlSinc : String = 'select p.cod, hash(nome || codbar || cast(p_venda as varchar(20))'+
  ' ||unid||classif||aliquota||is_pis||p.cod_ispis) as hash from produto p';

implementation

uses FileCtrl, pcnNFe, pcnConversao, ACBrNFeNotasFiscais, DateUtils,
  frmStatus, dialog, untConfiguracoesNFCe;

{$R *.DFM}

procedure TdtmMain.LerDadosArquivo();
var
 IniFile, usarBD, erro  : String;
 Ini                    : TIniFile;
 cont, acc : Smallint;
begin

 if FileExists(ExtractFileDir(ParamStr(0)) + '\ControlW.ini') then
   begin
     IniFile    := ExtractFileDir(ParamStr(0)) + '\ControlW.ini';
     //exit;
   end
 else
   begin
     IniFile    := ChangeFileExt( Application.ExeName, '.ini') ;
   end;

// if not file
 Ini        := TIniFile.Create(IniFile);

 if Ini.ReadString('SERVER','usarServidorRemoto', 'N') = 'S' then bdPronto := true
   else bdPronto := false;

 pastaControlW_Servidor :=  Ini.ReadString('SERVER','pastaServidor', '');
 if copy(pastaControlW_Servidor, Length(pastaControlW_Servidor) -1, 1) <> '\' then pastaControlW_Servidor := pastaControlW_Servidor + '\';

 BD_Servidor.ConnectionName    := Ini.ReadString('SERVER','conexaoBD', '');
 BD_Servidor.Params.Values['Database'] := BD_Servidor.ConnectionName;

 ACBrPosPrinter1.Porta  := Ini.ReadString('Geral','PortaImpNFCE', '');
 ACBrPosPrinter1.Modelo := TACBrPosPrinterModelo(ini.Readinteger('Geral','impIndex', 0));

 cont := 0;
 acc  := 0;
 if ACBrPosPrinter1.Porta <> '' then
   begin
     if ACBrPosPrinter1.Modelo in [ppEscBematech] then
       begin
         while true do
           begin
             if ACBrPosPrinter1.Inicializada = false then
               begin
                 try
                   ACBrPosPrinter1.Inicializar;
                   acc := acc + 1;
                 except
                   on e:exception do
                     begin
                       erro := e.Message;
                       //MessageDlg(e.Message+ 'XX', mtError, [mbOK], 1);
                     end;
                 end;
               end
             else break;
             cont := cont + 1;
             
             if cont > 20 then break; 
           end;

         if acc = 0 then
           begin
             MessageDlg('O Sistema N�o Conseguiu Inicializar a Porta!'+  #13+
            'Verifique as Configura��es de Porta da Impressora.' + #13
            +erro+ ' XX', mtError, [mbOK], 1);

            frmConfiguracoesNFe := TfrmConfiguracoesNFe.Create(self);
            frmConfiguracoesNFe.PageControl3.TabIndex := 5;
            frmConfiguracoesNFe.ShowModal;
            frmConfiguracoesNFe.Free;
           end; 
       end;
   end;

 try
   if ACBrPosPrinter1.Porta <> '' then ACBrPosPrinter1.Inicializar;
 except
   on e:exception do
     begin
       //MessageDlg(e.Message, mtError, [mbOK], 1);
     end;
 end;

 Ini.Free;
end;


procedure TdtmMain.DataModuleCreate(Sender: TObject);
begin
  LerDadosArquivo;
end;

function TdtmMain.conectaBD_Servidor() : boolean;
var
  servidor : String;
begin
  Result := false;
  servidor := BD_Servidor.ConnectionName;

  if BD_Servidor.ConnectionName <> '' then begin
    servidor := copy(servidor, 1, pos(':', servidor) -1);
  end
  else exit;

  if ServerIsRunning(servidor, 3050) = false then begin
    ShowMessage('Servidor '+servidor+' N�o est� Acess�vel: ');
    exit;
  end;

  try
    Result := conectaBD2(BD_Servidor, true);
  except
  end;
end;

function TdtmMain.sincronizaUsuarios()  : boolean;
var
  ini, fim, atu : integer;
begin
  if bdPronto = false then exit;
  if conectaBD_Servidor = false then exit;

  IBQueryServer1.Close;
  IBQueryServer1.SQL.Text := 'select * from usuario';
  IBQueryServer1.Open;
  IBQueryServer1.FetchAll;

  progresso('Sincronizando Usu�rios...',1,2,true,false);
  ini := 0;
  atu := 0;
  fim := IBQueryServer1.RecordCount;

  while not IBQueryServer1.Eof do
    begin
      ini := ini + 1;
      progresso('Sincronizando Usu�rios...',ini,fim,false,false);

      IBQuery1.Close;
      IBQuery1.SQL.Text := 'update or insert into usuario(cod, nome, senha, acesso, usu, nom, vendedor, configu)' +
      'values(:cod, :nome, :senha, :acesso, :usu, :nom, :vendedor, :configu)';
      IBQuery1.ParamByName('cod').AsInteger      := IBQueryServer1.fieldbyname('cod').AsInteger;
      IBQuery1.ParamByName('nome').AsString      := IBQueryServer1.fieldbyname('nome').AsString;
      IBQuery1.ParamByName('senha').AsString     := IBQueryServer1.fieldbyname('senha').AsString;
      IBQuery1.ParamByName('acesso').AsString    := IBQueryServer1.fieldbyname('acesso').AsString;
      IBQuery1.ParamByName('usu').AsString       := IBQueryServer1.fieldbyname('usu').AsString;
      IBQuery1.ParamByName('nom').AsString       := IBQueryServer1.fieldbyname('nom').AsString;
      IBQuery1.ParamByName('vendedor').AsInteger := IBQueryServer1.fieldbyname('vendedor').AsInteger;
      IBQuery1.ParamByName('configu').AsString   := IBQueryServer1.fieldbyname('configu').AsString;
      IBQuery1.ExecSQL;

      IBQueryServer1.Next;
    end;

  progresso('Sincronizando Usuarios...',ini,fim,false,true);

  IBQueryServer1.Close;
  IBQueryServer1.SQL.Text := 'select * from vendedor';
  IBQueryServer1.Open;
  IBQueryServer1.FetchAll;

  progresso('Sincronizando Vendedores...',1,2,true,false);
  ini := 0;
  atu := 0;
  fim := IBQueryServer1.RecordCount;

  while not IBQueryServer1.Eof do
    begin
      ini := ini + 1;
      progresso('Sincronizando Vendedores...',ini,fim,false,false);

      IBQuery1.Close;
      IBQuery1.SQL.Text := 'update or insert into VENDEDOR(cod, nome) values(:cod, :nome)';
      IBQuery1.ParamByName('cod').AsInteger      := IBQueryServer1.fieldbyname('cod').AsInteger;
      IBQuery1.ParamByName('nome').AsString      := IBQueryServer1.fieldbyname('nome').AsString;
      IBQuery1.ExecSQL;

      IBQueryServer1.Next;
    end;
    
  if ini > 0 then
    begin
      if IBQuery1.Transaction.Active then IBQuery1.Transaction.Commit;
    end;

  IBQueryServer1.Close;
  BD_Servidor.Connected := false;  
end;

function TdtmMain.sincronizaEstoque()  : boolean;
var
  lista : TStringList;
  ini, fim, atu : integer;
begin
  if bdPronto = false then exit;
  if conectaBD_Servidor = false then exit;

  IBQueryServer1.Close;
  IBQueryServer1.SQL.Text := sqlSinc;
  IBQueryServer1.Open;
  IBQueryServer1.FetchAll;

  lista := TStringList.Create;
  lista.Clear;
  le_estoque(lista);

  progresso('Sincronizando Estoque...',1,2,true,false);
  ini := 0;
  atu := 0;
  fim := IBQueryServer1.RecordCount;

  while not IBQueryServer1.Eof do
    begin
      progresso('Sincronizando Estoque...',ini,fim,false,false);

      IF lista.Count = 0 then copiaProduto(IBQueryServer1.FieldByName('cod').AsInteger);
      
      {if IBQueryServer1.FieldByName('hash').AsString <> lista.Values[IBQueryServer1.FieldByName('cod').AsString] then
        begin
          copiaProduto(IBQueryServer1.FieldByName('cod').AsInteger);
          atu := atu + 1;
        end;}

      ini := ini + 1;  
      IBQueryServer1.Next;
    end;

  progresso('Sincronizando Estoque...',ini,fim,false,true);
  if atu > 0 then
    begin
      MessageDlg('Quantidade de Registros Atualizados: ' + IntToStr(atu) + ' Produtos', mtInformation, [mbOK], 1);
      if IBQuery1.Transaction.Active then IBQuery1.Transaction.Commit;
    end;
end;

procedure TdtmMain.le_estoque(var listaprod : TStringList);
var
  ini, fim : integer;
begin
  listaprod := TStringList.Create;
  IBQuery1.Close;
  IBQuery1.SQL.Text := sqlSinc;
  IBQuery1.Open;
  IBQuery1.FetchAll;

  progresso('Lendo Estoque',1,2,true,false);
  ini := 0;
  fim := IBQuery1.RecordCount;

  while not IBQuery1.Eof do
    begin
      ini := ini + 1;
      progresso('Lendo Estoque',ini,fim,false,false);
      listaprod.Add(IBQuery1.fieldbyname('cod').AsString + '=' + IBQuery1.fieldbyname('hash').AsString);
      IBQuery1.Next;
    end;

  progresso('Lendo Estoque',ini,fim,false,true);
end;

procedure progresso(label1 : String; ini, fim : integer; novo, fechar : boolean);
begin
  if novo then
    begin
      pergunta1 := tpergunta1.Create(Application);
      pergunta1.Show;
      pergunta1.Caption := 'ControlW PDV';
      pergunta1.Gauge1.Progress := 0;
      pergunta1.Gauge1.Visible := true;
      pergunta1.Label1.Caption := label1;
      pergunta1.maxlengt := 5;
      pergunta1.cont     := 0;
    end;

  if fechar then
    begin
      pergunta1.Close;
      pergunta1.Gauge1.Visible := false;
      pergunta1.Free;
      exit;
    end;

  Application.ProcessMessages;
  //pergunta1.Gauge1.Progress := trunc(ini / fim * 100);
  pergunta1.cont := trunc(ini / fim * 100);
  if pergunta1.cont >= pergunta1.maxlengt then
    begin
      pergunta1.maxlengt := pergunta1.maxlengt + 5;
      pergunta1.Gauge1.Progress := pergunta1.maxlengt;
    end;

  //if b >= 100 then pergunta1.close;  
end;

procedure TdtmMain.copiaProduto(cod : integer);
begin
  IBQueryServer2.Close;
  if cod > 0 then
    begin
      IBQueryServer2.SQL.Text := 'select cod,nome, codbar, quant, p_venda, unid, classif, aliquota, is_pis, cod_ispis from produto' +
      ' where cod = :cod';
      IBQueryServer2.ParamByName('cod').AsInteger := cod;
    end
  else IBQueryServer2.SQL.Text := 'select cod,nome, codbar, quant, p_venda, unid, classif, aliquota, is_pis, cod_ispis from produto';
  IBQueryServer2.Open;

  IBQuery1.Close;
  IBQuery1.SQL.Text := 'update or insert into produto(cod, quant, nome, codbar, p_venda, unid, classif, aliquota, is_pis, cod_ispis, grupo)' +
  ' values(:cod, :quant, :nome, :codbar, :p_venda, :unid, :classif, :aliquota, :is_pis, :cod_ispis, 0)';
  IBQuery1.ParamByName('quant').AsCurrency   := IBQueryServer2.fieldbyname('quant').AsCurrency;
  IBQuery1.ParamByName('cod').AsInteger      := IBQueryServer2.fieldbyname('cod').AsInteger;
  IBQuery1.ParamByName('nome').AsString      := IBQueryServer2.fieldbyname('nome').AsString;
  IBQuery1.ParamByName('codbar').AsString    := IBQueryServer2.fieldbyname('codbar').AsString;
  IBQuery1.ParamByName('p_venda').AsCurrency := IBQueryServer2.fieldbyname('p_venda').AsCurrency;
  IBQuery1.ParamByName('unid').AsString      := IBQueryServer2.fieldbyname('unid').AsString;
  IBQuery1.ParamByName('classif').AsString   := IBQueryServer2.fieldbyname('classif').AsString;
  IBQuery1.ParamByName('aliquota').AsString  := IBQueryServer2.fieldbyname('aliquota').AsString;
  IBQuery1.ParamByName('is_pis').AsString    := IBQueryServer2.fieldbyname('is_pis').AsString;
  IBQuery1.ParamByName('cod_ispis').AsString := IBQueryServer2.fieldbyname('cod_ispis').AsString;
  IBQuery1.ExecSQL;
end;

procedure TdtmMain.sincronizaca_de_dados();
begin
  sincronizaEstoque;
  sincronizaUsuarios;
  sincronizaNFCe;

  if BD_Servidor.Connected then BD_Servidor.Connected := false; 
end;

procedure TdtmMain.ajustaHoraPelaInternet();
var
  data : TDateTime;
  SystemTime : TSystemTime;
begin
  exit;
  try
    data := IdSNTP1.DateTime;
  except
    exit;
  end;
  
  SystemTime.wYear   := YearOf(data);
  SystemTime.wMonth  := MonthOf(data);
  SystemTime.wDay    :=  DayOf(data);
  SystemTime.wHour   := HourOf(data);
  SystemTime.wMinute := MinuteOf(data);
  SystemTime.wSecond := SecondOf(data);
  SetLocalTime(SystemTime);
end;


function TdtmMain.sincronizaNFCe()  : boolean;
var
  lista : TStringList;
  ini, fim, atu, notaVenda : integer;
begin
  if bdPronto = false then exit;
  if conectaBD_Servidor = false then exit;

  if IBQueryServer1.Transaction.Active then IBQueryServer1.Transaction.Commit;
  IBQueryServer1.Transaction.StartTransaction;

  IBQuery1.Close;
  IBQuery1.SQL.Text := 'select chave, nota from nfce where adic = '''' and exportado = 0';
  IBQuery1.Open;
  IBQuery1.FetchAll;

  progresso('Sincronizando Vendas...',1,2,true,false);
  ini := 0;
  atu := 0;
  fim := IBQuery1.RecordCount;

  while not IBQuery1.Eof do
    begin
      ini := ini + 1;
      progresso('Sincronizando Vendas...',ini,fim,false,false);

      copiaVendas(IBQuery1.fieldbyname('nota').AsInteger, notaVenda);
      copiaNFCes(IBQuery1.fieldbyname('chave').AsString,IBQuery1.fieldbyname('nota').AsInteger, notaVenda);

      IBQuery1.Next;
    end;

  progresso('Sincronizando Vendas...',ini,fim,false,true);
  if ini > 0 then
    begin
      if IBQuery2.Transaction.Active then IBQuery2.Transaction.Commit;
      if IBQueryServer1.Transaction.Active then IBQueryServer1.Transaction.Commit;
    end;

  BD_Servidor.Connected := false;
  //BD_Servidor.Close;
end;

procedure TdtmMain.copiaVendas(nota : integer; var notaNova : integer);
begin
  IBQuery2.Close;
  IBQuery2.SQL.Text := 'select * from venda where nota = :nota';
  IBQuery2.ParamByName('nota').AsInteger := nota;
  IBQuery2.Open;

  if IBQuery2.IsEmpty then exit;

  notaNova := StrToInt(Incrementa_Generator('venda', 1, IBQueryServer1));

  IBQueryServer1.Close;
  IBQueryServer1.SQL.Text := 'insert into venda(nota, data, total, vendedor, cliente, desconto, entrega, hora,'+
  'codhis, cancelado, prazo, entrada, ok, crc, usuario) values(:nota, :data, :total, :vendedor, :cliente, :desconto, :entrega, :hora,'+
  ':codhis, :cancelado, :prazo, :entrada, :ok, :crc, :usuario)';
  IBQueryServer1.ParamByName('nota').AsInteger       := notaNova;
  IBQueryServer1.ParamByName('data').AsDate          := IBQuery2.fieldbyname('data').AsDateTime;
  IBQueryServer1.ParamByName('total').AsCurrency     := IBQuery2.fieldbyname('total').AsCurrency;
  IBQueryServer1.ParamByName('vendedor').AsInteger   := IBQuery2.fieldbyname('vendedor').AsInteger;
  IBQueryServer1.ParamByName('cliente').AsInteger    := IBQuery2.fieldbyname('cliente').AsInteger;
  IBQueryServer1.ParamByName('desconto').AsCurrency  := IBQuery2.fieldbyname('desconto').AsCurrency;
  IBQueryServer1.ParamByName('entrega').AsString     := IBQuery2.fieldbyname('entrega').AsString;
  IBQueryServer1.ParamByName('hora').AsTime          := IBQuery2.fieldbyname('hora').AsDateTime;
  IBQueryServer1.ParamByName('codhis').AsInteger     := IBQuery2.fieldbyname('codhis').AsInteger;
  IBQueryServer1.ParamByName('cancelado').AsInteger  := IBQuery2.fieldbyname('cancelado').AsInteger;
  IBQueryServer1.ParamByName('prazo').AsInteger      := IBQuery2.fieldbyname('prazo').AsInteger;
  IBQueryServer1.ParamByName('entrada').AsCurrency   := IBQuery2.fieldbyname('entrada').AsCurrency;
  IBQueryServer1.ParamByName('ok').AsString          := IBQuery2.fieldbyname('ok').AsString;
  IBQueryServer1.ParamByName('crc').AsString         := IBQuery2.fieldbyname('crc').AsString;
  IBQueryServer1.ParamByName('usuario').AsInteger    := IBQuery2.fieldbyname('usuario').AsInteger;
  IBQueryServer1.ExecSQL;

  IBQuery2.Close;
  IBQuery2.SQL.Text := 'select * from item_venda where nota = :nota';
  IBQuery2.ParamByName('nota').AsInteger := nota;
  IBQuery2.Open;

  while not IBQuery2.Eof do
    begin
      IBQueryServer1.Close;
      IBQueryServer1.SQL.Text := 'insert into item_venda(nota, cod, quant, p_venda, total, aliquota, data, unid)' +
      ' values(:nota, :cod, :quant, :p_venda, :total, :aliquota, :data, :unid)';
      IBQueryServer1.ParamByName('nota').AsInteger     := notaNova;
      IBQueryServer1.ParamByName('cod').AsInteger      := IBQuery2.fieldbyname('cod').AsInteger;
      IBQueryServer1.ParamByName('quant').AsCurrency   := IBQuery2.fieldbyname('quant').AsCurrency;
      IBQueryServer1.ParamByName('p_venda').AsCurrency := IBQuery2.fieldbyname('p_venda').AsCurrency;
      IBQueryServer1.ParamByName('total').AsCurrency   := IBQuery2.fieldbyname('total').AsCurrency;
      IBQueryServer1.ParamByName('aliquota').AsString  := IBQuery2.fieldbyname('aliquota').AsString;
      IBQueryServer1.ParamByName('data').AsDate        := IBQuery2.fieldbyname('data').AsDateTime;
      IBQueryServer1.ParamByName('unid').AsString      := IBQuery2.fieldbyname('unid').AsString;
      IBQueryServer1.ExecSQL;

      IBQuery2.Next;
    end;
end;

procedure TdtmMain.copiaNFCes(chave : String;nota, notaNova : integer );
begin
  IBQuery2.Close;
  IBQuery2.SQL.Text := 'select * from nfce where chave = :nota';
  IBQuery2.ParamByName('nota').AsString := chave;
  IBQuery2.Open;

  IBQueryServer1.Close;
  IBQueryServer1.SQL.Text := 'insert into nfce(nota, data, chave, adic, cliente, EXPORTADO)' +
  ' values(:nota, :data, :chave, :adic, :cliente, :EXPORTADO)';
  IBQueryServer1.ParamByName('nota').AsInteger      := notaNova;
  IBQueryServer1.ParamByName('data').AsDate         := IBQuery2.fieldbyname('data').AsDateTime;
  IBQueryServer1.ParamByName('chave').AsString      := IBQuery2.fieldbyname('chave').AsString;
  IBQueryServer1.ParamByName('adic').AsString       := IBQuery2.fieldbyname('adic').AsString;
  IBQueryServer1.ParamByName('cliente').AsInteger   := nota;
  IBQueryServer1.ParamByName('EXPORTADO').AsInteger := IBQuery2.fieldbyname('EXPORTADO').AsInteger;
  try
    IBQueryServer1.ExecSQL;

    if not DirectoryExists(pastaControlW_Servidor + 'NFCe\EMIT\') then ForceDirectories(pastaControlW_Servidor + 'NFCe\EMIT\');
    CopyFile(pchar(ExtractFileDir(ParamStr(0)) + '\NFCe\EMIT\' + IBQuery2.fieldbyname('chave').AsString + '-nfe.xml'), pchar(pastaControlW_Servidor + 'NFCe\EMIT\' + IBQuery2.fieldbyname('chave').AsString + '-nfe.xml'), true);

    IBQuery2.Close;
    IBQuery2.SQL.Text := 'update nfce set exportado = 1 where chave = :chave';
    IBQuery2.ParamByName('chave').AsString := chave;
    IBQuery2.ExecSQL;
  except
  end;
end;


function TdtmMain.Incrementa_Generator(Gen_name : string; valor_incremento : integer; var query : TFDQuery) : string;
begin
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select gen_id('+ Gen_name +','+ IntToStr(valor_incremento) +') as venda from rdb$database');
  query.Open;

  Result := '';
  Result := query.fieldbyname('venda').AsString;

  query.Close;
end;


function TdtmMain.ServerIsRunning(const AHost: string; const APort: Integer): Boolean;
begin
  Result := False;
  with TIdTCPClient.Create(nil) do
  begin
    Host := AHost;
    Port := APort;
    try
      ConnectTimeout := 1000;
      Connect;
      Disconnect;
      Result := TRue;
    except
    end;
    Free;
  end;
end;


end.

                                         -

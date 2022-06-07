unit Unit1;

interface

uses
  SysUtils, Classes,   DB,  
    DBClient, Provider, Dialogs,
  ACBrNFeDANFEClass, ACBrDANFCeFortesFr, ACBrNFeDANFeESCPOS, ACBrBase, ACBrSocket,
   ACBrIBPTax, forms, ACBrDFe, ACBrNFeDANFeRLClass, ACBrETQ, IdBaseComponent,
   IdAntiFreezeBase, IdAntiFreeze, ACBrNFe, ACBrPosPrinter, ACBrConsultaCNPJ,
  ACBrCargaBal, ACBrCEP,   FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Intf, FireDAC.Comp.UI, ACBrMail,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.PG, FireDAC.Phys.Oracle, FireDAC.Comp.Client, StdCtrls, Controls, Windows, Messages, Variants,
  Graphics,  ACBrDFeReport, ACBrDFeDANFeReport, ACBrNCMs,
  ACBrTEFAPIComum, ACBrTEFAPI, ACBrTEFD, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util, ACBrNFeDANFEFR, FireDAC.Comp.Script, FireDAC.Comp.DataSet,
  ACBrPIXCD;


type
  Tdm = class(TDataModule)
    IBselect: TFDQuery;
    ds1: TDataSource;
    IBQuery2: TFDQuery;
    entrada: TDataSource;
    IBSQL: TFDQuery;
    ds: TDataSource;
    bd: TFDConnection;
    IBTransaction2: TFDTransaction;
    formpagttable: TFDQuery;
    Dsformpagto: TDataSource;
    formpagttableCOD: TIntegerField;
    formpagttableNOME: TStringField;
    formpagttableDINHEIRO: TStringField;
    formpagttableDESC_PAG: TBCDField;
    formpagttableDESC_ANT: TBCDField;
    formpagttableCODGRU: TStringField;
    formpagttableCODHIS: TStringField;
    formpagttableREG_CAIXA: TStringField;
    formpagttablePRAZO: TBCDField;
    formpagttableIMP_FISCAL: TStringField;
    IBTransaction1: TFDTransaction;
    IBQuery1: TFDQuery;
    produto: TFDQuery;
    dsprod: TDataSource;
    produtotemp: TFDQuery;
    dsprodtemp: TDataSource;
    IBTransaction3: TFDTransaction;
    ProdutoQY: TFDQuery;
    IBQuery3: TFDQuery;
    IBQuery4: TFDQuery;
    IBTable1: TFDTable;
    TabelaOrdem: TFDTable;
    TabelaOrdemCOD: TIntegerField;
    TabelaOrdemDATA: TDateField;
    TabelaOrdemNOME: TStringField;
    TabelaOrdemUSUARIO: TSmallintField;
    TabelaOrdemCLIENTE: TIntegerField;
    TabelaOrdemEQUIP: TStringField;
    TabelaOrdemMARCA: TStringField;
    TabelaOrdemMODELO: TStringField;
    TabelaOrdemSERIE: TStringField;
    TabelaOrdemDEFEITO: TStringField;
    TabelaOrdemTECNICO: TStringField;
    TabelaOrdemVENDEDOR: TSmallintField;
    TabelaOrdemOBS: TStringField;
    TabelaOrdemSAIDA: TDateField;
    TabelaOrdemSITUACAO: TStringField;
    TabelaOrdemDIAG: TStringField;
    TabelaOrdemPARECER: TStringField;
    TabelaOrdemH_ENT: TTimeField;
    TabelaOrdemH_SAI: TTimeField;
    TabelaOrdemPAGO: TBCDField;
    TabelaOrdemORDEM: TStringField;
    TabelaOrdemusu: TStringField;
    TabelaOrdemnomCli: TStringField;
    queryCupons: TFDQuery;
    ACBrIBPTax1: TACBrIBPTax;
    IdAntiFreeze1: TIdAntiFreeze;
    ACBrETQ1: TACBrETQ;
    DANFE: TACBrNFeDANFCeFortes;
    ACBrPosPrinter1: TACBrPosPrinter;
    ACBrNFeDANFeRL1: TACBrNFeDANFeRL;
    ACBrConsultaCNPJ1: TACBrConsultaCNPJ;
    ACBrCargaBal1: TACBrCargaBal;
    ACBrCEP1: TACBrCEP;
    ACBrNFeDANFEFR1: TACBrNFeDANFEFR;
    ACBrMail1: TACBrMail;
    ACBrNFeDANFeESCPOS1: TACBrNFeDANFeESCPOS;
    ACBrNFe: TACBrNFe;
    bd1: TFDConnection;
    FDGUIxWaitCursor2: TFDGUIxWaitCursor;
    FDPhysOracleDriverLink1: TFDPhysOracleDriverLink;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    IBQueryServico: TFDQuery;
    IBTransaction4: TFDTransaction;
    IBStoredProc1: TFDStoredProc;
    IBScript1: TFDScript;
    IBTransaction5: TFDTransaction;
    IBcid: TFDQuery;
    IBTransaction6: TFDTransaction;
    IBTransaction7: TFDTransaction;
    ACBrNCMs1: TACBrNCMs;
    ACBrTEFD1: TACBrTEFD;
    ACBrTEFAPI1: TACBrTEFAPI;
    ACBrPixCD1: TACBrPixCD;
    procedure TabelaOrdemCalcFields(DataSet: TDataSet);
    procedure ACBrNFeGerarLog(const Mensagem: String);
    procedure DataModuleCreate(Sender: TObject);
    procedure ACBrNFeStatusChange(Sender: TObject);
    procedure ACBrMail1AfterMailProcess(Sender: TObject);
    procedure ACBrMail1BeforeMailProcess(Sender: TObject);
    procedure ACBrMail1MailException(const AMail: TACBrMail; const E: Exception;
      var ThrowIt: Boolean);
    procedure ACBrMail1MailProcess(const AMail: TACBrMail;
      const aStatus: TMailStatus);

   private
    { Private declarations }
  public
    tentativasEnviarEmail : integer;
    abortarScroll : boolean;
    execucaoEmail : byte;
    erroMail : String;

    { Public declarations }
  end;

var
  dm: Tdm;
  filtro:boolean;
implementation

uses StrUtils, Math, func, principal, email;
{$R *.dfm}


procedure Tdm.TabelaOrdemCalcFields(DataSet: TDataSet);
begin
  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select nome from usuario where cod = :cod';
  dm.IBselect.ParamByName('cod').AsInteger := TabelaOrdemUSUARIO.AsInteger;
  dm.IBselect.Open;
  TabelaOrdemusu.AsString := dm.IBselect.fieldbyname('nome').AsString;
  dm.IBselect.Close;

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select nome from CLIENTE where cod = :cod';
  dm.IBselect.ParamByName('cod').AsInteger := TabelaOrdemCLIENTE.AsInteger;
  dm.IBselect.Open;

  TabelaOrdemnomCli.AsString := dm.IBselect.fieldbyname('nome').AsString;
end;

procedure Tdm.ACBrMail1AfterMailProcess(Sender: TObject);
begin
  execucaoEmail := 2;
  sleep(5000);
  form70.Button1.Enabled := true;
  form70.Button1.SetFocus;
end;

procedure Tdm.ACBrMail1BeforeMailProcess(Sender: TObject);
begin
  execucaoEmail := 1;
  erroMail      := '';
  form70.ProgressBar1.Max := 10;
  form70.Show;
  form70.Button1.Enabled := false;
end;

procedure Tdm.ACBrMail1MailException(const AMail: TACBrMail; const E: Exception;
  var ThrowIt: Boolean);
begin
  execucaoEmail := 3;
  erroMail      := e.Message;

  ThrowIt := False;
  Form70.Memo1.Lines.Add('*** Erro ao Enviar o email: ' + AMail.Subject);
  Form70.Memo1.Lines.Add(e.Message);

  if (Contido('UNABLE TO LOGIN', UpperCase(e.Message))) and (Contido('controlwsistemas@gmail.com', ACBrMail1.Username)) then begin
    funcoes.configuraMail(ACBrMail1, 1);
    ACBrMail1.Send(true);
  end;

  form70.Button1.Enabled := true;
  form70.Button1.SetFocus;
end;

procedure Tdm.ACBrMail1MailProcess(const AMail: TACBrMail;
  const aStatus: TMailStatus);
begin
  form70.ProgressBar1.Position := Integer(aStatus);

  case aStatus of
    pmsStartProcess:
      Form70.Memo1.Lines.Add('Iniciando processo de envio.');
    pmsConfigHeaders:
      Form70.Memo1.Lines.Add('Configurando o cabeçalho do e-mail.');
    pmsLoginSMTP:
      Form70.Memo1.Lines.Add('Logando no servidor de e-mail.');
    pmsStartSends:
      Form70.Memo1.Lines.Add('Iniciando os envios.');
    pmsSendTo:
      Form70.Memo1.Lines.Add('Processando lista de destinatários.');
    pmsSendCC:
      Form70.Memo1.Lines.Add('Processando lista CC.');
    pmsSendBCC:
      Form70.Memo1.Lines.Add('Processando lista BCC.');
    pmsSendReplyTo:
      Form70.Memo1.Lines.Add('Processando lista ReplyTo.');
    pmsSendData:
      Form70.Memo1.Lines.Add('Enviando dados.');
    pmsLogoutSMTP:
      Form70.Memo1.Lines.Add('Fazendo Logout no servidor de e-mail.');
    pmsDone:
      begin
        Form70.Memo1.Lines.Add('Terminando e limpando.');

        Form70.Memo1.SelAttributes.Style := [fsBold];
        Form70.Memo1.SelAttributes.Size := 12;
        Form70.Memo1.Lines.Add('Email Enviado com Sucesso!');

        form70.ProgressBar1.Position := form70.ProgressBar1.Max;
      end;
  end;

  Form70.Memo1.Lines.Add('   ' + AMail.Subject);

  Application.ProcessMessages;
end;

procedure Tdm.ACBrNFeGerarLog(const Mensagem: String);
begin
  funcoes.WriteToTXT(caminhoEXE_com_barra_no_final + 'LOGNFE.txt', Mensagem + CRLF +
  '-------------------------------------------------------------------------------------' + #13);
end;

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  abortarScroll := false;
  execucaoEmail := 0;

  //ShowMessage(bd.GDSLibrary.LibraryName);
end;

procedure Tdm.ACBrNFeStatusChange(Sender: TObject);
begin
  Application.ProcessMessages;
end;

end.

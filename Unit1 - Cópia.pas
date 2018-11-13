unit Unit1;

interface

uses
  SysUtils, Classes, IBQuery, IBDatabase, DB, IBCustomDataSet, IBTable,
  IBSQL, IBUpdateSQL, DBClient, Provider, IBStoredProc,Dialogs,
  ACBrNFeDANFEClass, ACBrDANFCeFortesFr, ACBrNFeDANFeESCPOS, ACBrBase, ACBrSocket,
   ACBrIBPTax, forms, ACBrDFe, ACBrNFeDANFeRLClass, ACBrETQ, IdBaseComponent,
   IdAntiFreezeBase, IdAntiFreeze, ACBrNFe, ACBrPosPrinter, ACBrConsultaCNPJ,
  ACBrCargaBal, ACBrCEP, ACBrNFeDANFEFRDM, ACBrNFeDANFEFR, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Intf, FireDAC.Comp.UI, ACBrMail,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.PG, FireDAC.Phys.Oracle, FireDAC.Comp.Client;


type
  Tdm = class(TDataModule)
    IBselect: TIBQuery;
    ds1: TDataSource;
    IBQuery2: TIBQuery;
    entrada: TDataSource;
    IBSQL: TIBSQL;
    ds: TDataSource;
    bd: TIBDatabase;
    IBTransaction2: TIBTransaction;
    formpagttable: TIBQuery;
    Dsformpagto: TDataSource;
    formpagttableCOD: TIntegerField;
    formpagttableNOME: TIBStringField;
    formpagttableDINHEIRO: TIBStringField;
    formpagttableDESC_PAG: TIBBCDField;
    formpagttableDESC_ANT: TIBBCDField;
    formpagttableCODGRU: TIBStringField;
    formpagttableCODHIS: TIBStringField;
    formpagttableREG_CAIXA: TIBStringField;
    formpagttablePRAZO: TIBBCDField;
    formpagttableIMP_FISCAL: TIBStringField;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    produto: TIBQuery;
    dsprod: TDataSource;
    produtotemp: TIBQuery;
    dsprodtemp: TDataSource;
    IBTransaction3: TIBTransaction;
    ProdutoQY: TIBQuery;
    IBQuery3: TIBQuery;
    IBQuery4: TIBQuery;
    IBTable1: TIBTable;
    TabelaOrdem: TIBTable;
    TabelaOrdemCOD: TIntegerField;
    TabelaOrdemDATA: TDateField;
    TabelaOrdemNOME: TIBStringField;
    TabelaOrdemUSUARIO: TSmallintField;
    TabelaOrdemCLIENTE: TIntegerField;
    TabelaOrdemEQUIP: TIBStringField;
    TabelaOrdemMARCA: TIBStringField;
    TabelaOrdemMODELO: TIBStringField;
    TabelaOrdemSERIE: TIBStringField;
    TabelaOrdemDEFEITO: TIBStringField;
    TabelaOrdemTECNICO: TIBStringField;
    TabelaOrdemVENDEDOR: TSmallintField;
    TabelaOrdemOBS: TIBStringField;
    TabelaOrdemSAIDA: TDateField;
    TabelaOrdemSITUACAO: TIBStringField;
    TabelaOrdemDIAG: TIBStringField;
    TabelaOrdemPARECER: TIBStringField;
    TabelaOrdemH_ENT: TTimeField;
    TabelaOrdemH_SAI: TTimeField;
    TabelaOrdemPAGO: TIBBCDField;
    TabelaOrdemORDEM: TIBStringField;
    TabelaOrdemusu: TIBStringField;
    TabelaOrdemnomCli: TStringField;
    queryCupons: TIBQuery;
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
    procedure TabelaOrdemCalcFields(DataSet: TDataSet);
    procedure ACBrNFeGerarLog(const Mensagem: String);
    procedure DataModuleCreate(Sender: TObject);
    procedure ACBrNFeStatusChange(Sender: TObject);
    procedure ACBrMail1AfterMailProcess(Sender: TObject);
    procedure ACBrMail1BeforeMailProcess(Sender: TObject);
    procedure ACBrMail1MailException(const AMail: TACBrMail; const E: Exception;
      var ThrowIt: Boolean);

   private
    { Private declarations }
  public
    abortarScroll : boolean;
    execucaoEmail : byte;

    { Public declarations }
  end;

var
  dm: Tdm;
  filtro:boolean;
implementation

uses StrUtils, Math, func, principal;
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
end;

procedure Tdm.ACBrMail1BeforeMailProcess(Sender: TObject);
begin
  execucaoEmail := 1;
end;

procedure Tdm.ACBrMail1MailException(const AMail: TACBrMail; const E: Exception;
  var ThrowIt: Boolean);
begin
  execucaoEmail := 3;
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
end;

procedure Tdm.ACBrNFeStatusChange(Sender: TObject);
begin
  Application.ProcessMessages;
end;

end.

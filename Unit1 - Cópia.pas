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
  FireDAC.Phys.PG, FireDAC.Phys.Oracle, FireDAC.Comp.Client;


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

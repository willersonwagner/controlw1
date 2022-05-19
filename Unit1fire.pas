unit Unit1;

interface

uses
  SysUtils, Classes,   DB,  
    DBClient, Provider, Dialogs,
  ACBrNFeDANFEClass, ACBrDANFCeFortesFr, ACBrNFeDANFeESCPOS, ACBrBase, ACBrSocket,
   ACBrIBPTax, forms, ACBrDFe, ACBrNFeDANFeRLClass, ACBrETQ, IdBaseComponent,
   IdAntiFreezeBase, IdAntiFreeze, ACBrNFe, ACBrPosPrinter, ACBrConsultaCNPJ,
  ACBrCargaBal, ACBrCEP,   FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.Oracle, FireDAC.Phys.FB, FireDAC.Phys.IB,
  FireDAC.Phys.PG;


type
  Tdm = class(TDataModule)
    ds1: TDataSource;
    entrada: TDataSource;
    IBSQL: TFDQuery;
    ds: TDataSource;
    Dsformpagto: TDataSource;
    dsprod: TDataSource;
    dsprodtemp: TDataSource;
    IBTable1: TFDTable;
    ACBrNFe: TACBrNFe;
    ACBrNFeDANFeESCPOS1: TACBrNFeDANFeESCPOS;
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
    FDPhysOracleDriverLink1: TFDPhysOracleDriverLink;
    bd1: TFDConnection;
    IBTransaction1: TFDTransaction;
    IBQuery1: TFDQuery;
    IBselect: TFDQuery;
    IBQuery2: TFDQuery;
    IBTransaction2: TFDTransaction;
    IBTransaction3: TFDTransaction;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    formpagttable: TFDQuery;
    produto: TFDQuery;
    produtotemp: TFDQuery;
    IBQuery4: TFDQuery;
    IBQuery3: TFDQuery;
    ProdutoQY: TFDQuery;
    queryCupons: TFDQuery;
    FDTable1: TFDTable;
    IBTable1CODGRU: TIntegerField;
    IBTable1VENCIMENTO: TDateField;
    IBTable1DOCUMENTO: TIntegerField;
    IBTable1TOTAL: TBCDField;
    IBTable1CODHIS: TIntegerField;
    IBTable1PAGO: TBCDField;
    IBTable1FORNEC: TIntegerField;
    IBTable1USUARIO: TIntegerField;
    IBTable1VENDEDOR: TIntegerField;
    IBTable1DATAMOV: TDateField;
    IBTable1FORMPAGTO: TSmallintField;
    IBTable1PREVISAO: TDateField;
    IBTable1VALOR: TBCDField;
    IBTable1CONT: TSmallintField;
    IBTable1DATA: TDateField;
    IBTable1COD: TIntegerField;
    IBTable1ValorCalc: TCurrencyField;
    IBTable1SALDO: TBCDField;
    FDTable1HISTORICO: TStringField;
    FDTable1NOTA: TIntegerField;
    contasReceber: TFDTable;
    contasReceberCODGRU: TIntegerField;
    contasReceberDOCUMENTO: TIntegerField;
    contasReceberVENCIMENTO: TDateField;
    contasReceberTOTAL: TBCDField;
    contasReceberCODHIS: TIntegerField;
    contasReceberHISTORICO: TStringField;
    contasReceberPAGO: TBCDField;
    contasReceberFORNEC: TIntegerField;
    contasReceberUSUARIO: TIntegerField;
    contasReceberVENDEDOR: TIntegerField;
    contasReceberDATAMOV: TDateField;
    contasReceberFORMPAGTO: TSmallintField;
    contasReceberPREVISAO: TDateField;
    contasReceberVALOR: TBCDField;
    contasReceberCONT: TSmallintField;
    contasReceberDATA: TDateField;
    contasReceberCOD: TIntegerField;
    contasReceberSALDO: TBCDField;
    contasReceberNOTA: TIntegerField;
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
    TabelaOrdemVENDA: TIntegerField;
    TabelaOrdemnomCli: TStringField;
    TabelaOrdemusu: TStringField;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    procedure TabelaOrdemCalcFields(DataSet: TDataSet);
    procedure ACBrNFeGerarLog(const Mensagem: String);
    procedure DataModuleCreate(Sender: TObject);
    procedure ACBrNFeStatusChange(Sender: TObject);
    procedure produtoAfterOpen(DataSet: TDataSet);
    procedure IBQuery1AfterOpen(DataSet: TDataSet);
    procedure IBselectAfterOpen(DataSet: TDataSet);
    procedure IBQuery2AfterOpen(DataSet: TDataSet);
    procedure formpagttableAfterOpen(DataSet: TDataSet);
    procedure produtotempAfterOpen(DataSet: TDataSet);
    procedure IBQuery4AfterOpen(DataSet: TDataSet);
    procedure IBQuery3AfterOpen(DataSet: TDataSet);
    procedure ProdutoQYAfterOpen(DataSet: TDataSet);
    procedure contasReceberAfterOpen(DataSet: TDataSet);

   private
    { Private declarations }
  public
    abortarScroll : boolean;

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

procedure Tdm.ACBrNFeGerarLog(const Mensagem: String);
begin
  funcoes.WriteToTXT(caminhoEXE_com_barra_no_final + 'LOGNFE.txt', Mensagem + CRLF +
  '-------------------------------------------------------------------------------------' + #13);
end;

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  abortarScroll := false;
end;

procedure Tdm.formpagttableAfterOpen(DataSet: TDataSet);
begin
  funcoes.bdgridLabelMaiuculo(DataSet);
end;

procedure Tdm.IBQuery1AfterOpen(DataSet: TDataSet);
begin
  funcoes.bdgridLabelMaiuculo(DataSet);
end;

procedure Tdm.IBQuery2AfterOpen(DataSet: TDataSet);
begin
  funcoes.bdgridLabelMaiuculo(DataSet);
end;

procedure Tdm.IBQuery3AfterOpen(DataSet: TDataSet);
begin
  funcoes.bdgridLabelMaiuculo(DataSet);
end;

procedure Tdm.IBQuery4AfterOpen(DataSet: TDataSet);
begin
  funcoes.bdgridLabelMaiuculo(DataSet);
end;

procedure Tdm.IBselectAfterOpen(DataSet: TDataSet);
begin
  funcoes.bdgridLabelMaiuculo(DataSet);
end;

procedure Tdm.produtoAfterOpen(DataSet: TDataSet);
begin
  funcoes.bdgridLabelMaiuculo(DataSet);
end;

procedure Tdm.ProdutoQYAfterOpen(DataSet: TDataSet);
begin
  funcoes.bdgridLabelMaiuculo(DataSet);
end;

procedure Tdm.produtotempAfterOpen(DataSet: TDataSet);
begin
  funcoes.bdgridLabelMaiuculo(DataSet);
end;

procedure Tdm.ACBrNFeStatusChange(Sender: TObject);
begin
  Application.ProcessMessages;
end;

procedure Tdm.contasReceberAfterOpen(DataSet: TDataSet);
begin
  funcoes.bdgridLabelMaiuculo(DataSet);
end;

end.

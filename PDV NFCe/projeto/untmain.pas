unit untMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Math,
  Dialogs, ComCtrls, ActnList, Menus, ActnCtrls, ToolWin, ActnMan, ActnMenus,
  ExtCtrls, shellapi, jpeg, StdCtrls, ImgList,
  XPStyleActnCtrls, jsedit1, funcoesdav, func, TLHelp32, PsAPI,

  {Biblioteca P4InfoVarejo!!}
  untnfceForm, System.Actions, DB;

type
  TfrmMain = class(TForm)
    stb: TStatusBar;
    Panel1: TPanel;
    // VisualizaDOSPRINT1: TVisualizaDOSPRINT;
    mnm: TMainMenu;
    act: TActionManager;
    Image1: TImage;
    OpenDialog: TOpenDialog;
    Arquivp1: TMenuItem;
    actLogin: TAction;
    actLogoff: TAction;
    actFechar: TAction;
    actSair: TAction;
    Login1: TMenuItem;
    Logoff1: TMenuItem;
    Fechar1: TMenuItem;
    Sair1: TMenuItem;
    Rotinas: TMenuItem;
    actEmissaoCupomFiscalCFe: TAction;
    EmissodeCupomFiscalEletrnicoCFe1: TMenuItem;
    actConfiguracoes: TAction;
    N1: TMenuItem;
    Configuraes1: TMenuItem;
    actCNFeNaoEmitidas: TAction;
    N2: TMenuItem;
    CNFeNoEmitidas1: TMenuItem;
    actCancelamentoNFCe: TAction;
    CancelamentodeNFCe1: TMenuItem;
    actConsultarNFCe: TAction;
    ConsultarCupons1: TMenuItem;
    OutrasRotinas1: TMenuItem;
    EstadodoServio1: TMenuItem;
    PDV1: TMenuItem;
    ConfigurarECF1: TMenuItem;
    MenuFiscal1: TMenuItem;
    LeituraX1: TMenuItem;
    ReduoZ1: TMenuItem;
    EspelhoMFD1: TMenuItem;
    CadastrodeFormas1: TMenuItem;
    IdentificaPAFECF1: TMenuItem;
    ImpressoraFiscal1: TMenuItem;
    Aliquotas1: TMenuItem;
    LimparVendas1: TMenuItem;
    PorData1: TMenuItem;
    PorCOO1: TMenuItem;
    LeituradaMemriaFiscal1: TMenuItem;
    PorReduo1: TMenuItem;
    ImprimePorReduo1: TMenuItem;
    Sangria1: TMenuItem;
    Suprimento1: TMenuItem;
    PorReduo2: TMenuItem;
    PorData2: TMenuItem;
    LMS1: TMenuItem;
    LMFC1: TMenuItem;
    LX1: TMenuItem;
    CAT321: TMenuItem;
    Button1: TButton;
    AtualizarTabelaIBPT1: TMenuItem;
    ZerarTentativasdeEnvioEsgotadas1: TMenuItem;
    ConfiguraesPIX1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure actLogoffExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure actEmissaoCupomFiscalCFeExecute(Sender: TObject);
    procedure actConfiguracoesExecute(Sender: TObject);
    procedure actCNFeNaoEmitidasExecute(Sender: TObject);
    procedure actCancelamentoNFCeExecute(Sender: TObject);
    procedure actConsultarNFCeExecute(Sender: TObject);
    procedure EstadodoServio1Click(Sender: TObject);
    procedure PDV1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ConfigurarECF1Click(Sender: TObject);
    procedure LeituraX1Click(Sender: TObject);
    procedure CadastrodeFormas1Click(Sender: TObject);
    procedure IdentificaPAFECF1Click(Sender: TObject);
    procedure Aliquotas1Click(Sender: TObject);
    procedure LimparVendas1Click(Sender: TObject);
    procedure PorData1Click(Sender: TObject);
    procedure PorCOO1Click(Sender: TObject);
    procedure PorReduo1Click(Sender: TObject);
    procedure ImprimePorReduo1Click(Sender: TObject);
    procedure Sangria1Click(Sender: TObject);
    procedure Suprimento1Click(Sender: TObject);
    procedure PorReduo2Click(Sender: TObject);
    procedure ReduoZ1Click(Sender: TObject);
    procedure PorData2Click(Sender: TObject);
    procedure CAT321Click(Sender: TObject);
    procedure LX1Click(Sender: TObject);
    procedure LMS1Click(Sender: TObject);
    procedure LMFC1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure AtualizarTabelaIBPT1Click(Sender: TObject);
    procedure ZerarTentativasdeEnvioEsgotadas1Click(Sender: TObject);
    procedure ConfiguraesPIX1Click(Sender: TObject);
  private { Private declarations }
    formatual: string;
  public { Public declarations }
    intervaloTimer: String;
    // davXXX.rca
    procedure reiniciaDAVNFCe();
    function geraRelFechamento(opcao: integer = 1): Smallint;
    function geraReducao(): Smallint;
    procedure criaArquivoReducao();
    procedure gerarel();
    function TerminarProcesso(sFile: String): Boolean;
  end;

var
  frmMain: TfrmMain;

const
  CRLF: String = #13#10;

implementation

uses untDtmMain, untCupomFiscalSAT, untConfiguracoesNFCe,
  untCancelaNFCe, untVendaPDV, configImp,
  cadFormaPagto, identifica, ACBrECF, ACBrECFClass, frmStatus, login,
  cadecf1, StrUtils, importapedido, buscaSelecao, Unit14, Unit15;

{$R *.dfm}
{ ===============================
  |   Procedimentos de Eventos!!  |
  ================================ }

function TfrmMain.geraReducao(): Smallint;
var
  ini, fim: integer;
  erro: Boolean;
  sim1: String;
  arq: TStringList;
begin
  sim1 := dialogo('generico', 0, 'SN', 0, true, 'S', 'Control for Windows:',
    'Deseja Emitir a Redução Z, O ECF pode fechar o movimento diário!', 'N');
  if ((sim1 = '*') or (sim1 = 'N')) then
    exit;

  // if not dtmMain.ACBrECF1.Device.Ativo then dtmMain.ACBrECF1.Ativar;
  erro := false;

  mostraMensagem('Aguarde, Emitindo Redução Z...', true);
  // dtmMain.ACBrECF1.DadosReducaoZ;

  criaArquivoReducao();
  // a funcao acima cria um arquivo com os dados de reducoes Z

  erro := true;

  dtmMain.IBQuery1.Close;
  dtmMain.IBQuery1.SQL.Text :=
    'update or insert into SPED_REDUCAOZ(cod, data, ecf, CONT_REINICIO, CONT_REDUCAOZ, CONT_OP, TOT_GERAL, TOT_CANC, TOT_ALIQ01, TOT_ALIQ02, TOT_ALIQ03, TOT_ALIQ04, '
    + 'TOT_ALIQ05, TOT_ALIQ06, TOT_ALIQ07, TOT_ALIQ08, TOT_DESC, TOT_FF, TOT_II, TOT_NN, VENDABRUTA) values('
    + Incrementa_Generator('SPED_REDUCAOZ', 1) +
    ', :data, :ecf, :CONT_REINICIO, :CONT_REDUCAOZ, :CONT_OP, :TOT_GERAL, :TOT_CANC, :TOT_ALIQ01, :TOT_ALIQ02, :TOT_ALIQ03, :TOT_ALIQ04, '
    + ':TOT_ALIQ05, :TOT_ALIQ06, :TOT_ALIQ07, :TOT_ALIQ08, :TOT_DESC, :TOT_FF, :TOT_II, :TOT_NN, :VENDABRUTA)';

  { try
    dtmMain.IBQuery1.ParamByName('data').AsDate   := now;
    with dtmMain.ACBrECF1.DadosReducaoZClass do
    begin
    dtmMain.IBQuery1.ParamByName('ecf').AsInteger            := StrToIntDef(dtmMain.ACBrECF1.NumECF, 0);
    dtmMain.IBQuery1.ParamByName('CONT_REINICIO').AsInteger  := CRO;
    dtmMain.IBQuery1.ParamByName('CONT_REDUCAOZ').AsInteger  := CRZ + 1;
    dtmMain.IBQuery1.ParamByName('CONT_OP').AsInteger        := COO + 1;
    dtmMain.IBQuery1.ParamByName('TOT_GERAL').AsCurrency     := ValorGrandeTotal;
    dtmMain.IBQuery1.ParamByName('TOT_CANC').AsCurrency      := CancelamentoICMS;

    ini := -1;
    fim := ICMS.Count -1;
    while true do
    begin
    ini := ini + 1;
    if ini <= fim then  dtmMain.IBQuery1.ParamByName('TOT_ALIQ0' + IntToStr(ini + 1)).AsCurrency  := ICMS[ini].Total
    else dtmMain.IBQuery1.ParamByName('TOT_ALIQ0' + IntToStr(ini + 1)).AsCurrency  := 0;

    if ini = 7 then break;
    end;

    dtmMain.IBQuery1.ParamByName('TOT_DESC').AsCurrency      := DescontoICMS;
    dtmMain.IBQuery1.ParamByName('TOT_FF').AsCurrency        := SubstituicaoTributariaICMS;
    dtmMain.IBQuery1.ParamByName('TOT_II').AsCurrency        := IsentoICMS;
    dtmMain.IBQuery1.ParamByName('TOT_NN').AsCurrency        := NaoTributadoICMS;
    dtmMain.IBQuery1.ParamByName('VENDABRUTA').AsCurrency    := ValorVendaBruta;
    end;

    dtmMain.IBQuery1.ExecSQL;
    dtmMain.IBQuery1.Transaction.Commit;


    except
    on e:exception do
    begin
    MessageDlg('Erro: ' + e.Message, mtError, [mbOK], 1);
    mostraMensagem('Aguarde, Emitindo Redução Z...', false);
    end;
    end;

    try
    dtmMain.ACBrECF1.ReducaoZ(now);
    except
    on e:exception do
    begin
    MessageDlg('Erro: ' + e.Message, mtError, [mbOK], 1);
    end;
    end;
  }
  mostraMensagem('Aguarde, Emitindo Redução Z...', false);
  ShowMessage('Redução Z Executada com Sucesso');
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  indxImp, velo: integer;
  porta, porta1, usaDLL, velobal, tipobal, portabal, intervalo: String;
  lista: TList;
begin
  stb.panels[0].Text := 'Usuário: ' + '';
  stb.panels[1].Text := '';
  Caption := application.Title;
  // glbCFOP := LerConfiguracaoCFOP;

  porta := '';
  velo := 0;
  // LerParametrosACBrECF(indxImp, velo, porta1, usaDLL, portabal, velobal, tipobal, intervalo);

  { form1.intervaloVenda := intervalo;
    if porta <> '' then
    begin
    //setParametrosACBrECF(dtmMain.ACBrECF1, dtmMain.ACBrBAL1, indxImp, velo, porta, velobal, portabal, tipobal);
    end; }
  //
  actEmissaoCupomFiscalCFeExecute(Sender);
  //
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if MessageDlg('Tem Certeza que Deseja Finaliza Sistema ?', mtConfirmation,
    [MbYes, MbNo], 0) = idyes then
  begin
    // CanClose := true;
    application.Terminate;
  end
  else
    CanClose := false;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  { Configura sistema!! }

  { ShortDateFormat := 'dd/mm/yyyy';
    ShortTimeFormat := 'hh:mm:ss';
    DateSeparator := '/';
    TimeSeparator := ':'; }
  // LeRegistroSistema;
  // dtmMain.conmain.Disconnect;
  try
    // dtmMain.conmain.DatabaseName := 'D:\clientes\nfce\exe\BDHOMOLOGA.GDB';//RegConexao;
    // dtmMain.conmain.Username     := 'sysdba';//RegUsuario;
    // dtmMain.conmain.Password     := 'masterkey';//RegSenha;
    // dtmMain.conmain.Connect;
  except
    begin
      MessageDlg('Erro ao Conectar Em Banco de Dados.', mtError, [mbok], 0);
    end;
  end;
  stb.panels[1].Text := 'Usuário: ';
  stb.panels[2].Text := dtmMain.bd.ConnectionName;

end;

procedure TfrmMain.actLogoffExecute(Sender: TObject);
begin
  // if FinalizarTransacao(dtmmain.trnmain) = mrcancel then  exit;
  // DesConfigurarPermissoes(self);
  // FecharTodosForms;
  /// ZerarVariaveisConexao;        // zerar variaveis de conexao: usuario, computador, formulario, permissao
  // AtivarAction(act, false);     // desabilitar todas as opções do menu disponibilizando apenas login e sair

  stb.panels[0].Text := 'Desconectado';
  formatual := '';
  Repaint;
  Close;
end;

procedure TfrmMain.actFecharExecute(Sender: TObject);
begin
  if formatual <> '' then
  begin
    // if FinalizarTransacao(dtmmain.trnmain) = mrcancel then  exit;
    // DestruirFormAtual(formatual,dtmMain.trnMain);
  end;
end;

procedure TfrmMain.actSairExecute(Sender: TObject);
begin
  if MessageDlg('Tem Certeza que Deseja Finaliza Sistema ?', mtConfirmation,
    [MbYes, MbNo], 0) = idyes then
  begin
    application.Terminate;
  end;
end;

procedure TfrmMain.actEmissaoCupomFiscalCFeExecute(Sender: TObject);
begin
  form3 := tform3.Create(self);
  CtrlResize(TForm(form3));
  form3.ShowModal;
  try
    jsedit.LiberaMemoria(form3);
  except
  end;
  form3.Free;
end;

procedure TfrmMain.actConfiguracoesExecute(Sender: TObject);
begin
  Configuracoes_NFCe();
end;

procedure TfrmMain.actCNFeNaoEmitidasExecute(Sender: TObject);
begin
  // dlgTransferenciaCF('');
end;

procedure TfrmMain.actCancelamentoNFCeExecute(Sender: TObject);
begin
  // dlgCancelaNFCe;
  cadECF := TcadECF.Create(self);
  cadECF.ShowModal;
  cadECF.Free;
end;

procedure TfrmMain.actConsultarNFCeExecute(Sender: TObject);
begin
  { if lowercase(formatual) = 'frmConsultaNotas'      then exit;
    if FinalizarTransacao(dtmmain.trnMain) = mrcancel then exit;
    if not ExisteFormulario('frmConsultaNotas')       then frmConsultaNotas := TfrmConsultaNotas.Create(frmMain);
    configform(frmConsultaNotas, formatual);
  }

  { frmConsultaNotas := tfrmConsultaNotas.Create(self);
    frmConsultaNotas.ShowModal;
    frmConsultaNotas.Free; }
end;

procedure TfrmMain.EstadodoServio1Click(Sender: TObject);
begin
  Verifica_Status_NFe;
end;

procedure TfrmMain.PDV1Click(Sender: TObject);
begin
  Form2 := tform2.Create(self);
  Form2.ShowModal;
  Form2.Free;
end;

procedure TfrmMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    Close;
end;

procedure TfrmMain.ConfiguraesPIX1Click(Sender: TObject);
begin
  form15.ShowModal;
end;

procedure TfrmMain.ConfigurarECF1Click(Sender: TObject);
begin
  form6 := tform6.Create(self);
  form6.ShowModal;
  form6.Free;
end;

procedure TfrmMain.LeituraX1Click(Sender: TObject);
begin
  // if not dtmMain.ACBrECF1.Device.Ativo then dtmMain.ACBrECF1.Ativar;
  try
    mostraMensagem('Aguarde, Emitindo Leitura X...', true);
    // dtmMain.ACBrECF1.LeituraX;
  finally
    mostraMensagem('Aguarde, Emitindo Leitura X...', false);
  end;
end;

procedure TfrmMain.CadastrodeFormas1Click(Sender: TObject);
begin
  cadFormas := tcadFormas.Create(self);
  cadFormas.ShowModal;
  cadFormas.Free;
end;

procedure TfrmMain.IdentificaPAFECF1Click(Sender: TObject);
begin
  form8 := tform8.Create(self);
  form8.ShowModal;
  form8.Free;
end;

procedure TfrmMain.Aliquotas1Click(Sender: TObject);
var
  aliq: string;
  ini, fim: integer;
begin
  { if not dtmMain.ACBrECF1.Device.Ativo then dtmMain.ACBrECF1.Ativar;

    fim  := dtmMain.ACBrECF1.Aliquotas.Count -1;
    aliq := '';
    for ini := 0 to fim do
    begin
    if dtmMain.ACBrECF1.Aliquotas[ini].Indice[1] = 'T' then
    aliq := aliq + dtmMain.ACBrECF1.Aliquotas[ini].Indice + ' -' + CompletaOuRepete('', formataCurrency(dtmMain.ACBrECF1.Aliquotas[ini].Aliquota), '0', 5) + #13;
    end;

    ShowMessage('Aliquotas' + #13 + #13 + aliq); }
end;

procedure TfrmMain.AtualizarTabelaIBPT1Click(Sender: TObject);
begin
  form1.atualizaTabelaIBPT(true);
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  reiniciaDAVNFCe;
  ShowMessage('Comando Executado com Sucesso!');
end;

procedure TfrmMain.LimparVendas1Click(Sender: TObject);
begin
  dtmMain.IBQuery1.Close;
  dtmMain.IBQuery1.SQL.Text := 'update venda set ok = ''S''';

  try
    dtmMain.IBQuery1.ExecSQL;
    dtmMain.IBQuery1.Transaction.Commit;
    ShowMessage('Comando Executado com Sucesso');
  except
    on e: exception do
    begin
      ShowMessage('Erro:' + #13 + e.Message);
    end;
  end;

end;

procedure TfrmMain.PorData1Click(Sender: TObject);
var
  dini, dfim: string;
  linhas: TStringList;
  ini: integer;
begin
  { if not dtmMain.ACBrECF1.Device.Ativo then dtmMain.ACBrECF1.Ativar;
    dini := dialogo('data',0,'',0,true,'','Control for Windows:','Qual a Data Inicial','');
    if dini = '*' then exit;

    dfim := dialogo('data',0,'',0,true,'','Control for Windows:','Qual a Data Final','');
    if dfim = '*' then exit;

    try
    mostraMensagem('Aguarde, Lendo Memória Fiscal...', true);
    mfd := tmfd.Create(self);
    linhas := TStringList.Create;
    dtmMain.ACBrECF1.LeituraMFDSerial(StrToDate(dini), StrToDate(dfim), linhas);
    mfd.RichEdit1.Clear;
    for ini := 0 to linhas.Count -1 do
    begin
    mfd.RichEdit1.Lines.Add(linhas[ini]);
    end;
    mfd.ShowModal;
    finally
    mostraMensagem('Aguarde, Lendo Memória Fiscal...', false);
    linhas.Free;
    mfd.Free;
    end;
  }
end;

procedure TfrmMain.PorCOO1Click(Sender: TObject);
var
  dini, dfim: string;
  linhas: TStringList;
  ini: integer;
begin
  { if not dtmMain.ACBrECF1.Device.Ativo then dtmMain.ACBrECF1.Ativar;
    dini := dialogo('generico',0,'1234567890,.'+#8,0,true,'','Control for Windows:','Qual o COO Inicial','');
    if dini = '*' then exit;

    dfim := dialogo('generico',0,'1234567890,.'+#8,0,true,'','Control for Windows:','Qual o COO Final','');
    if dfim = '*' then exit;

    try
    mostraMensagem('Aguarde, Lendo Memória Fiscal...', true);
    mfd := tmfd.Create(self);
    linhas := TStringList.Create;
    dtmMain.ACBrECF1.LeituraMFDSerial(StrToIntDef(dini, 1), StrToIntDef(dfim, 1), linhas);
    mfd.RichEdit1.Clear;
    for ini := 0 to linhas.Count -1 do
    begin
    mfd.RichEdit1.Lines.Add(linhas[ini]);
    end;
    mfd.ShowModal;
    finally
    mostraMensagem('Aguarde, Lendo Memória Fiscal...', false);
    linhas.Free;
    mfd.Free;
    end; }
end;

procedure TfrmMain.PorReduo1Click(Sender: TObject);
var
  dini, dfim: string;
  linhas: TStringList;
  ini: integer;
begin
  // if not dtmMain.ACBrECF1.Device.Ativo then dtmMain.ACBrECF1.Ativar;
  dini := dialogo('generico', 0, '1234567890,.' + #8, 0, true, '',
    'Control for Windows:', 'Qual a Redução Inicial', '');
  if dini = '*' then
    exit;

  dfim := dialogo('generico', 0, '1234567890,.' + #8, 0, true, '',
    'Control for Windows:', 'Qual a Redução Final', '');
  if dfim = '*' then
    exit;

  { try
    mostraMensagem('Aguarde, Lendo Memória Fiscal...', true);
    mfd := tmfd.Create(self);
    linhas := TStringList.Create;
    dtmMain.ACBrECF1.LeituraMemoriaFiscalSerial(StrToIntDef(dini, 1), StrToIntDef(dfim, 1), linhas);
    mfd.RichEdit1.Clear;
    for ini := 0 to linhas.Count -1 do
    begin
    mfd.RichEdit1.Lines.Add(linhas[ini]);
    end;
    mfd.ShowModal;
    finally
    mostraMensagem('Aguarde, Lendo Memória Fiscal...', false);
    linhas.Free;
    mfd.Free;
    end; }
end;

procedure TfrmMain.ImprimePorReduo1Click(Sender: TObject);
var
  dini, dfim: string;
  linhas: TStringList;
  ini: integer;
begin
  /// if not dtmMain.ACBrECF1.Device.Ativo then dtmMain.ACBrECF1.Ativar;
  dini := dialogo('generico', 0, '1234567890,.' + #8, 0, true, '',
    'Control for Windows:', 'Qual a Redução Inicial', '');
  if dini = '*' then
    exit;

  dfim := dialogo('generico', 0, '1234567890,.' + #8, 0, true, '',
    'Control for Windows:', 'Qual a Redução Final', '');
  if dfim = '*' then
    exit;

  { try
    mostraMensagem('Aguarde, Lendo Memória Fiscal...', true);
    mfd := tmfd.Create(self);
    linhas := TStringList.Create;
    dtmMain.ACBrECF1.LeituraMemoriaFiscal(StrToIntDef(dini, 1), StrToIntDef(dfim, 1));
    mfd.RichEdit1.Clear;
    for ini := 0 to linhas.Count -1 do
    begin
    mfd.RichEdit1.Lines.Add(linhas[ini]);
    end;
    mfd.ShowModal;
    finally
    mostraMensagem('Aguarde, Lendo Memória Fiscal...', false);
    linhas.Free;
    mfd.Free;
    end;^ }
end;

procedure TfrmMain.Sangria1Click(Sender: TObject);
var
  cValor, cdesc: String;
begin
  // if not dtmMain.ACBrECF1.Device.Ativo then dtmMain.ACBrECF1.Ativar;

  cValor := dialogo('numero', 0, '1234567890,.' + #8, 0, false, 'ok',
    'Control for Windows:', 'Qual o Valor de Sangria ?', '0,01');
  if cValor = '*' then
    exit;

  cdesc := dialogo('normal', 200, '', 200, false, '', 'Control for Windows:',
    'Informe uma Observação para esta Sangria ?', '');
  if cValor = '*' then
    exit;

  // dtmMain.ACBrECF1.Sangria(StrToCurr(cValor), cdesc);
end;

procedure TfrmMain.Suprimento1Click(Sender: TObject);
var
  cValor, cdesc: String;
begin
  // if not dtmMain.ACBrECF1.Device.Ativo then dtmMain.ACBrECF1.Ativar;

  cValor := dialogo('numero', 0, '1234567890,.' + #8, 0, false, 'ok',
    'Control for Windows:', 'Qual o Valor de Sangria ?', '0,01');
  if cValor = '*' then
    exit;

  cdesc := dialogo('normal', 200, '', 200, false, '', 'Control for Windows:',
    'Informe uma Observação para esta Sangria ?', '');
  if cValor = '*' then
    exit;

  // dtmMain.ACBrECF1.Suprimento(StrToCurr(cValor), cdesc);
end;

procedure TfrmMain.PorReduo2Click(Sender: TObject);
var
  dini, dfim: string;
  linhas: TStringList;
  ini: integer;
begin
  { if not dtmMain.ACBrECF1.Device.Ativo then dtmMain.ACBrECF1.Ativar;

    dini := localizar1('Localizar Redução', 'SPED_REDUCAOZ', '*', 'CONT_OP', '', '', 'DATA', FALSE, FALSE, FALSE, '', '', 400, nil);
    if dini = '' then exit;

    try
    mostraMensagem('Aguarde, Lendo Memória Fiscal...', true);
    mfd := tmfd.Create(self);
    linhas := TStringList.Create;
    dtmMain.ACBrECF1.LeituraMFDSerial(StrToIntDef(dini, 1), StrToIntDef(dini, 1), linhas);
    mfd.RichEdit1.Clear;
    for ini := 0 to linhas.Count -1 do
    begin
    mfd.RichEdit1.Lines.Add(linhas[ini]);
    end;
    mfd.ShowModal;
    finally
    mostraMensagem('Aguarde, Lendo Memória Fiscal...', false);
    linhas.Free;
    mfd.Free;
    end; }
end;

procedure TfrmMain.ReduoZ1Click(Sender: TObject);
begin
  geraReducao();
end;

procedure TfrmMain.PorData2Click(Sender: TObject);
var
  dini, dfim: string;
  ini: integer;
begin
  // if not dtmMain.ACBrECF1.Device.Ativo then dtmMain.ACBrECF1.Ativar;
  dini := dialogo('data', 0, '', 0, true, '', 'Control for Windows:',
    'Qual a Data Inicial', '');
  if dini = '*' then
    exit;

  dfim := dialogo('data', 0, '', 0, true, '', 'Control for Windows:',
    'Qual a Data Final', '');
  if dfim = '*' then
    exit;

  try
    mostraMensagem('Aguarde, Lendo Memória Fiscal...', true);
    // dtmMain.ACBrECF1.LeituraMemoriaFiscal(StrToDate(dini), StrToDate(dfim));
  finally
    mostraMensagem('Aguarde, Lendo Memória Fiscal...', false);
  end;

end;

procedure TfrmMain.CAT321Click(Sender: TObject);
var
  DirArquivos: string;
  dini, dfim: string;
begin
  // if not dtmMain.ACBrECF1.Device.Ativo then dtmMain.ACBrECF1.Ativar;
  dini := dialogo('data', 0, '', 0, true, '', 'Control for Windows:',
    'Qual a Data Inicial', '');
  if dini = '*' then
    exit;

  dfim := dialogo('data', 0, '', 0, true, '', 'Control for Windows:',
    'Qual a Data Final', '');
  if dfim = '*' then
    exit;

  DirArquivos := ExtractFilePath(ParamStr(0)) + 'CAT52';
  if not DirectoryExists(DirArquivos) then
    ForceDirectories(DirArquivos);

  // dtmMain.ACBrECF1.PafMF_GerarCAT52(StrToDate(dini), StrToDate(dfim), DirArquivos);

  ShowMessage(Format('Arquivos gerados com sucesso em:'#13#10' "%s"',
    [DirArquivos]));
end;

procedure TfrmMain.LX1Click(Sender: TObject);
begin
  // dtmMain.ACBrECF1.PafMF_LX_Impressao;
end;

procedure TfrmMain.LMS1Click(Sender: TObject);
var
  DirArquivos: string;
  dini, dfim: string;
begin
  // if not dtmMain.ACBrECF1.Device.Ativo then dtmMain.ACBrECF1.Ativar;
  dini := dialogo('data', 0, '', 0, true, '', 'Control for Windows:',
    'Qual a Data Inicial', '');
  if dini = '*' then
    exit;

  dfim := dialogo('data', 0, '', 0, true, '', 'Control for Windows:',
    'Qual a Data Final', '');
  if dfim = '*' then
    exit;

  DirArquivos := ExtractFilePath(ParamStr(0)) + 'arq1.tmp';
  // dtmMain.ACBrECF1.PafMF_LMFS_Espelho(StrToDate(dini), StrToDate(dfim), DirArquivos);

  mfd := Tmfd.Create(self);
  mfd.RichEdit1.Clear;
  mfd.RichEdit1.Lines.LoadFromFile(DirArquivos);
  mfd.ShowModal;
  mfd.Free;

  // ShowMessage(Format('Arquivos gerados com sucesso em:'#13#10' "%s"', [DirArquivos]));
end;

procedure TfrmMain.LMFC1Click(Sender: TObject);
var
  DirArquivos: string;
  dini, dfim: string;
begin
  // if not dtmMain.ACBrECF1.Device.Ativo then dtmMain.ACBrECF1.Ativar;
  dini := dialogo('data', 0, '', 0, true, '', 'Control for Windows:',
    'Qual a Data Inicial', '');
  if dini = '*' then
    exit;

  dfim := dialogo('data', 0, '', 0, true, '', 'Control for Windows:',
    'Qual a Data Final', '');
  if dfim = '*' then
    exit;

  DirArquivos := ExtractFilePath(ParamStr(0)) + 'arq1.tmp';
  // dtmMain.ACBrECF1.PafMF_LMFC_Espelho(StrToDate(dini), StrToDate(dfim), DirArquivos);

  mfd := Tmfd.Create(self);
  mfd.RichEdit1.Clear;
  mfd.RichEdit1.Lines.LoadFromFile(DirArquivos);
  mfd.ShowModal;
  mfd.Free;
end;

procedure TfrmMain.criaArquivoReducao();
var
  arq: TStringList;
  ini, fim: integer;
  pasta: String;
begin
  arq := TStringList.Create;
  arq.Values['ReducaoZdia'] := FormatDateTime('dd/mm/yyyy', now);
  {
    with dtmMain.ACBrECF1.DadosReducaoZClass do
    begin
    arq.Values['ecf'] := dtmMain.ACBrECF1.NumECF;
    arq.Values['CONT_REINICIO'] := IntToStr(CRO);
    arq.Values['CONT_REDUCAOZ'] := IntToStr(CRZ + 1);
    arq.Values['CONT_OP'] := IntToStr(COO + 1);
    arq.Values['TOT_GERAL'] := CurrToStr(ValorGrandeTotal);
    arq.Values['TOT_CANC'] := CurrToStr(CancelamentoICMS);

    ini := -1;
    fim := ICMS.Count -1;
    while true do
    begin
    ini := ini + 1;

    if ini <= fim then  arq.Values['TOT_ALIQ0' + IntToStr(ini + 1)]      := CurrToStr(ICMS[ini].Total)
    else arq.Values['TOT_ALIQ0' + IntToStr(ini + 1)]      := '0';

    if ini = 7 then break;
    end;

    arq.Values['TOT_DESC']   := CurrToStr(DescontoICMS);
    arq.Values['TOT_FF']     := CurrToStr(SubstituicaoTributariaICMS);
    arq.Values['TOT_II']     := CurrToStr(IsentoICMS);
    arq.Values['TOT_NN']     := CurrToStr(NaoTributadoICMS);
    arq.Values['VENDABRUTA'] := CurrToStr(ValorVendaBruta);

    pasta := ExtractFileDir(ParamStr(0)) + '\';
    if not DirectoryExists(pasta + 'ReducoesZ\') then ForceDirectories(pasta + 'ReducoesZ\');

    arq.SaveToFile(pasta + 'ReducoesZ\' + 'ReducaoZ-' + FormatDateTime('dd', now) +
    FormatDateTime('mm', now) + FormatDateTime('yy', now) + '-' + IntToStr(CRZ + 1) + '.txt');
    //arq.SaveToFile(pasta + 'ReducoesZ\' + 'ReducaoZ-' + IntToStr(CRZ + 1) + '.txt');
    arq.Free;
    end; }
end;

function TfrmMain.geraRelFechamento(opcao: integer = 1): Smallint;
var
  total, desconto, SEMCRC, totvenda: currency;
  data, fim, vend, h1, USU, formpagto, nomPagto, confCaixa : String;
  datarel: TDate;
  CONT: Char;
  lista, forma: TStringList;
  i: integer;
begin
  dtmMain.IBQuery1.Close;
  dtmMain.IBQuery1.SQL.Text := 'SELECT COD,NOME FROM USUARIO WHERE COD = :COD';
  dtmMain.IBQuery1.ParamByName('cod').AsString := form1.codUsuario;
  dtmMain.IBQuery1.Open;

  USU := 'USUARIO: ' + dtmMain.IBQuery1.fieldbyname('cod').AsString + ' - ' +
    dtmMain.IBQuery1.fieldbyname('nome').AsString;
  dtmMain.IBQuery1.Close;

  lista := TStringList.Create;
  forma := TStringList.Create;

  if opcao = 1 then
  begin
    data := dialogo('data', 0, '', 0, true, '', 'Control for Windows:',
      'Qual a Data Inicial do Movimento?', FormatDateTime('dd/mm/yy',
      form1.datamov));
    if data = '*' then
      exit;

    fim := dialogo('data', 0, '', 0, true, '', 'Control for Windows:',
      'Qual a Data Final do Movimento?', FormatDateTime('dd/mm/yy',
      form1.datamov));
    if fim = '*' then
      exit;

    CONT := 'x';
    { vend := dialogo('generico',0,'1234567890' + #8,0,false,'','Control for Windows:','Qual o Código do Usuário?', form1.codUsuario);
      if vend = '*' then exit;

      if vend = '' then
      begin
      vend := localizar1('Localizar Usuario','usuario','cod,nome','cod','','nome','nome',false,false,false,'', '', 300, nil);
      //if vend = '' then exit;
      end; }

    confCaixa := dialogo('generico', 0, 'SN' + #8, 0, false, 'S',
      'Control for Windows:', 'Deseja fazer a Conferência de Caixa (Informar os Recebimentos) ?', 'N');
    if confCaixa = '*' then exit;

    if confCaixa = 'S' then begin
        if FORM14.ClientDataSet1.Active then FORM14.ClientDataSet1.Close;

        FORM14.ClientDataSet1.CreateDataSet;
    end;

    h1 := '';

    if FileExists(ExtractFileDir(ParamStr(0)) + '\NEMIT.dat') then begin
      dtmMain.IBQuery1.Close;
      dtmMain.IBQuery1.SQL.Text :=
      'select (v.codhis) as forma, v.entrada, f.nome, v.total as valor, v.desconto as desconto  from venda v left join formpagto f on (v.codhis = f.cod) where (v.cancelado = 0)  and '
      + h1 + ' ((v.data >= :data) and (v.data <= :fim))';
      dtmMain.IBQuery1.ParamByName('data').AsDate := StrToDate(data);
      dtmMain.IBQuery1.ParamByName('fim').AsDate := StrToDate(fim);
      dtmMain.IBQuery1.Open;
    end
    else begin
      dtmMain.IBQuery1.Close;
      dtmMain.IBQuery1.SQL.Text :=
      'select (v.codhis) as forma, v.entrada, f.nome, v.total as valor, v.desconto as desconto  from venda v left join formpagto f on (v.codhis = f.cod) where (v.cancelado = 0) and (entrega = ''E'') and (substring(v.crc from 8 for 9) = :crc) and '
      + h1 + ' ((v.data >= :data) and (v.data <= :fim))';
      dtmMain.IBQuery1.ParamByName('crc').AsString := strzero(getSerieNFCe, 2);
      dtmMain.IBQuery1.ParamByName('data').AsDate := StrToDate(data);
      dtmMain.IBQuery1.ParamByName('fim').AsDate := StrToDate(fim);
      dtmMain.IBQuery1.Open;
    end;

    while not dtmMain.IBQuery1.Eof do
    begin
      totvenda := dtmMain.IBQuery1.fieldbyname('valor').AsCurrency;
      total := total + totvenda;
      desconto := desconto + dtmMain.IBQuery1.fieldbyname('desconto')
        .AsCurrency;
      formpagto := dtmMain.IBQuery1.fieldbyname('forma').AsString;

      if dtmMain.IBQuery1.fieldbyname('entrada').AsCurrency > 0 then
      begin
        forma.Values['1'] := CurrToStr(StrToCurrDef(forma.Values['1'], 0) +
          dtmMain.IBQuery1.fieldbyname('entrada').AsCurrency);
        totvenda := totvenda - dtmMain.IBQuery1.fieldbyname('entrada')
          .AsCurrency;
      end;

      forma.Values[formpagto] := CurrToStr(StrToCurrDef(forma.Values[formpagto],
        0) + totvenda);
      dtmMain.IBQuery1.Next;
    end;
  end
  else if opcao = 2 then
  begin
    CONT := 'x';
    data := dialogo('data', 0, '', 0, true, '', 'Control for Windows:',
      'Qual a Data Inicial do Movimento?', FormatDateTime('dd/mm/yy',
      form1.datamov));
    if data = '*' then
      exit;

    fim := dialogo('data', 0, '', 0, true, '', 'Control for Windows:',
      'Qual a Data Final do Movimento?', FormatDateTime('dd/mm/yy',
      form1.datamov));
    if fim = '*' then
      exit;

    vend := dialogo('generico', 0, '1234567890' + #8, 0, false, '',
      'Control for Windows:', 'Qual o Código do Usuário?', form1.codUsuario);
    if vend = '*' then
      exit;

    if vend = '' then
    begin
      vend := localizar1('Localizar Usuario', 'usuario', 'cod,nome', 'cod', '',
        'nome', 'nome', false, false, false, '', '', 300, nil);
      // if vend = '' then exit;
    end;

    h1 := '';
    if vend <> '' then
      h1 := '(v.usuario = ' + StrNum(vend) + ') and';
    datarel := StrToDate(data);

    dtmMain.IBQuery1.Close;

    {dtmMain.IBQuery1.SQL.Text :=
      'select v.codhis as forma, f.nome, sum(v.total) as valor, sum(v.desconto) as desconto from venda v left join formpagto f on (v.codhis = f.cod) where (v.cancelado = 0) and (entrega = ''E'') and '
      + h1 + ' ((v.data >= :data) and (v.data <= :fim)) group by forma, f.nome';
    dtmMain.IBQuery1.ParamByName('data').AsDate := StrToDate(data);
    dtmMain.IBQuery1.ParamByName('fim').AsDate := StrToDate(fim);
    dtmMain.IBQuery1.Open; }

     dtmMain.IBQuery1.Close;
    dtmMain.IBQuery1.SQL.Text :=
      'select (v.codhis) as forma, v.entrada, f.nome, v.total as valor, v.desconto as desconto  from venda v left join formpagto f on (v.codhis = f.cod) where (v.cancelado = 0) and (entrega = ''E'') and (substring(v.crc from 8 for 9) = :crc) and '
      + h1 + ' ((v.data >= :data) and (v.data <= :fim))';
    dtmMain.IBQuery1.ParamByName('crc').AsString := strzero(getSerieNFCe, 2);
    dtmMain.IBQuery1.ParamByName('data').AsDate := StrToDate(data);
    dtmMain.IBQuery1.ParamByName('fim').AsDate := StrToDate(fim);
    dtmMain.IBQuery1.Open;


    while not dtmMain.IBQuery1.Eof do
    begin
      totvenda := dtmMain.IBQuery1.fieldbyname('valor').AsCurrency;
      total := total + totvenda;
      desconto := desconto + dtmMain.IBQuery1.fieldbyname('desconto')
        .AsCurrency;
      formpagto := dtmMain.IBQuery1.fieldbyname('forma').AsString;

      if dtmMain.IBQuery1.fieldbyname('entrada').AsCurrency > 0 then
      begin
        forma.Values['1'] := CurrToStr(StrToCurrDef(forma.Values['1'], 0) +
          dtmMain.IBQuery1.fieldbyname('entrada').AsCurrency);
        totvenda := totvenda - dtmMain.IBQuery1.fieldbyname('entrada')
          .AsCurrency;
      end;

      forma.Values[formpagto] := CurrToStr(StrToCurrDef(forma.Values[formpagto],
        0) + totvenda);
      dtmMain.IBQuery1.Next;
    end;
  end
  else if opcao = 3 then
  begin
    data := dialogo('data', 0, '', 0, true, '', 'Control for Windows:',
      'Qual a Data do Movimento?', FormatDateTime('dd/mm/yy', form1.datamov));
    if data = '*' then
      exit;

    vend := '%1';

    datarel := StrToDate(data);

    dtmMain.IBQuery1.Close;
    dtmMain.IBQuery1.SQL.Text :=
      'select v.codhis as forma, f.nome, sum(v.total) as valor, sum(v.desconto) as desconto from venda v left join formpagto f on (v.codhis = f.cod) where (v.cancelado = 0) and (v.data = :data) group by forma, f.nome';
    dtmMain.IBQuery1.ParamByName('data').AsDate := datarel;
    dtmMain.IBQuery1.Open;
  end;

  if vend <> '%1' then
  begin
    dtmMain.IBQuery2.Close;
    dtmMain.IBQuery2.SQL.Text := 'select nome from USUARIO where cod = :cod';
    dtmMain.IBQuery2.ParamByName('cod').AsString := StrNum(vend);
    dtmMain.IBQuery2.Open;

    vend := vend + ' - ' + LeftStr(dtmMain.IBQuery2.fieldbyname('nome')
      .AsString, 15);
  end
  else
    vend := 'TODOS';

  mfd := Tmfd.Create(self);
  mfd.RichEdit1.Clear;
  mfd.RichEdit1.Lines.Add(CompletaOuRepete('', '', '-', 39));
  mfd.RichEdit1.Lines.Add(CompletaOuRepete(centraliza('RELATORIO DE VENDAS',
    ' ', 39), '', '', 39));
  mfd.RichEdit1.Lines.Add(CompletaOuRepete('', '', '-', 39));
  if CONT = 'x' then
  begin
    mfd.RichEdit1.Lines.Add(CompletaOuRepete('MOV. DO DIA ' +
      FormatDateTime('dd/mm/yy', StrToDate(data)) + ' A ' +
      FormatDateTime('dd/mm/yy', StrToDate(fim)), '', ' ', 39));
    mfd.RichEdit1.Lines.Add(CompletaOuRepete('CAIXA: ' + strzero(getSerieNFCe,
      2), '', ' ', 39));
    mfd.RichEdit1.Lines.Add(CompletaOuRepete(USU, '', ' ', 39));
  end
  else
  begin
    mfd.RichEdit1.Lines.Add(CompletaOuRepete('MOV. DO DIA ' +
      FormatDateTime('dd/mm/yy', StrToDate(data)) + ' A ' +
      FormatDateTime('dd/mm/yy', StrToDate(fim)), '', ' ', 39));
    mfd.RichEdit1.Lines.Add(CompletaOuRepete('USUARIO: ' + vend, '', ' ', 39));
  end;
  mfd.RichEdit1.Lines.Add(CompletaOuRepete('', '', '-', 39));
  mfd.RichEdit1.Lines.Add(CompletaOuRepete('FORM PAGTO', 'VALOR', ' ', 39));
  mfd.RichEdit1.Lines.Add(CompletaOuRepete('', '', '-', 39));

  if not contido('-'+ IntToStr(opcao) + '-', '-1-2-') then
  begin
    total := 0;
    desconto := 0;
    while not dtmMain.IBQuery1.Eof do
    begin
      mfd.RichEdit1.Lines.Add
        (CompletaOuRepete(strzero(dtmMain.IBQuery1.fieldbyname('forma')
        .AsString, 2) + ' ' + CompletaOuRepete(dtmMain.IBQuery1.fieldbyname
        ('nome').AsString, '', ' ', 15),
        formataCurrency(dtmMain.IBQuery1.fieldbyname('valor').AsCurrency),
        ' ', 39));

      total := total + dtmMain.IBQuery1.fieldbyname('valor').AsCurrency;
      desconto := desconto + dtmMain.IBQuery1.fieldbyname('desconto').AsCurrency;
      dtmMain.IBQuery1.Next;
    end;
  end
  else
  begin
    for i := 0 to forma.Count - 1 do begin
      dtmMain.IBQuery2.Close;
      dtmMain.IBQuery2.SQL.Text := 'select nome from FORMPAGTO where cod = :cod';
      dtmMain.IBQuery2.ParamByName('cod').AsString := StrNum(forma.Names[i]);
      dtmMain.IBQuery2.Open;

      nomPagto := trim(dtmMain.IBQuery2.FieldByName('nome').AsString);
      if nomPagto = '' then nomPagto := 'DESCONHECIDO';

      mfd.RichEdit1.Lines.Add(CompletaOuRepete(CompletaOuRepete(LeftStr(strzero(forma.Names[i], 2) + '-' + nomPagto, 17),
        '', ' ', 17), formataCurrency(StrToCurr(forma.ValueFromIndex[i])),
        ' ', 39));

      if confCaixa = 'S' then begin
        form14.ClientDataSet1.Append;
        form14.ClientDataSet1CODIGO.AsString  := forma.Names[i];
        form14.ClientDataSet1PAG.AsString     := nomPagto;
        form14.ClientDataSet1VALOR.AsCurrency := StrToCurr(forma.ValueFromIndex[i]);
        form14.ClientDataSet1.Post;
      end;

    end;
  end;

  lista.Free;
  //forma.Free;

  if confCaixa = 'S' then begin
    form14.ClientDataSet1PAG.DisplayLabel       := 'Form. Pagto';
    form14.ClientDataSet1VALOR.DisplayLabel     := 'Total';
    form14.ClientDataSet1CONFERIDO.DisplayLabel := 'Valor Apurado';
    form14.ShowModal;
    //form14.Free;
  end;



  if desconto <> 0 then
  begin
    mfd.RichEdit1.Lines.Add(CompletaOuRepete(strzero('0', 2) + ' ' +
      CompletaOuRepete('DESCONTO', '', ' ', 15), formataCurrency(desconto),
      ' ', 39));
    // total := total + desconto;
  end;
  // soma os descontos no total

  dtmMain.IBQuery1.Close;
  dtmMain.IBQuery1.SQL.Text :=
    'select iif(tipo = ''1'', ''SANGRIA'', ''SUPRIMENTO'') as tipo' +
    ', sum(valor) as valor from sangria where cast(data_hora as date) >= :ini and cast(data_hora as date) <= :fim group by'
    + ' iif(tipo = ''1'', ''SANGRIA'', ''SUPRIMENTO'')';
  dtmMain.IBQuery1.ParamByName('ini').AsDate := StrToDate(data);
  dtmMain.IBQuery1.ParamByName('fim').AsDate := StrToDate(fim);
  dtmMain.IBQuery1.Open;

  while not dtmMain.IBQuery1.Eof do
  begin
    mfd.RichEdit1.Lines.Add
      (CompletaOuRepete(CompletaOuRepete(dtmMain.IBQuery1.fieldbyname('tipo')
      .AsString, '', ' ', 15),
      formataCurrency(dtmMain.IBQuery1.fieldbyname('valor').AsCurrency),
      ' ', 39));

    if trim(dtmMain.IBQuery1.fieldbyname('tipo').AsString) = 'SANGRIA' then
      total := total - dtmMain.IBQuery1.fieldbyname('valor').AsCurrency
    else
      total := total + dtmMain.IBQuery1.fieldbyname('valor').AsCurrency;
    dtmMain.IBQuery1.Next;
  end;

  dtmMain.IBQuery1.Close;
  dtmMain.IBQuery1.SQL.Text :=
    'select sum(v.total) as valor from venda v where (cancelado <> 0) and (entrega = ''E'') and '
    + h1 + ' ((v.data >= :data) and (v.data <= :fim))';
  dtmMain.IBQuery1.ParamByName('data').AsDate := StrToDate(data);
  dtmMain.IBQuery1.ParamByName('fim').AsDate := StrToDate(fim);
  dtmMain.IBQuery1.Open;

  desconto := StrToCurrDef(dtmMain.IBQuery1.fieldbyname('valor').AsString, 0);
  if desconto <> 0 then
    mfd.RichEdit1.Lines.Add(CompletaOuRepete(strzero('0', 2) + ' ' +
      CompletaOuRepete('CANCELAMENTOS', '', ' ', 15), formataCurrency(desconto),
      ' ', 39));

  mfd.RichEdit1.Lines.Add(CompletaOuRepete('', '', '-', 39));
  mfd.RichEdit1.Lines.Add(CompletaOuRepete('TOTAL => ', formataCurrency(total),
    ' ', 39));
  mfd.RichEdit1.Lines.Add(CompletaOuRepete('', '', '-', 39));

  dtmMain.IBQuery1.Close;

  dtmMain.IBQuery1.SQL.Text :=
    'SELECT COUNT(*) AS VALOR FROM NFCE WHERE ADIC = ''OFF''';
  dtmMain.IBQuery1.Open;

  if dtmMain.IBQuery1.fieldbyname('valor').AsInteger <> 0 then
  begin
    mfd.RichEdit1.Lines.Add(CompletaOuRepete(centraliza('NOTAS NAO ENVIADAS: ' +
      dtmMain.IBQuery1.fieldbyname('valor').AsString, ' ', 39), '', ' ', 39));
    mfd.RichEdit1.Lines.Add(CompletaOuRepete('', '', '-', 39));
  end;


  if confCaixa = 'S' then begin
    //if form14.ClientDataSet1.State in [dsedit] then form14.ClientDataSet1.Post;
    form14.ClientDataSet1.First;

    mfd.RichEdit1.Lines.Add(CompletaOuRepete('', '', '=', 39));
    mfd.RichEdit1.Lines.Add(CompletaOuRepete(centraliza('CONFERENCIA DE CAIXA ' , ' ', 39), '', ' ', 39));
    mfd.RichEdit1.Lines.Add('COD-DESCRICAO         VALOR    APURADO');
    mfd.RichEdit1.Lines.Add(CompletaOuRepete('', '', '=', 39));

    while not form14.ClientDataSet1.Eof do begin
      desconto := form14.ClientDataSet1CONFERIDO.AsCurrency - form14.ClientDataSet1VALOR.AsCurrency;

      mfd.RichEdit1.Lines.Add(CompletaOuRepete(LeftStr(strzero(form14.ClientDataSet1CODIGO.AsString, 2) + '-' + form14.ClientDataSet1PAG.AsString, 17),
        '', ' ', 17) + CompletaOuRepete('', formataCurrency(form14.ClientDataSet1VALOR.AsCurrency), ' ', 11) + CompletaOuRepete('', formataCurrency(form14.ClientDataSet1CONFERIDO.AsCurrency), ' ', 11));
      mfd.RichEdit1.Lines.Add(CompletaOuRepete('    Diferenca >>>', IfThen(desconto > 0, '+', '') + formataCurrency( desconto), ' ', 39));


      form14.ClientDataSet1.Next;
    end;

    mfd.RichEdit1.Lines.Add(CompletaOuRepete('', '', '=', 39));
    //form14.Free;
  end;

  mfd.ShowModal;
  mfd.Free;
  forma.Free;
  exit;
  mfd.imprime;
  mfd.Free;
end;

procedure TfrmMain.gerarel();
var
  data, fim, caixa, sit, impvenda: String;
  arq: TStringList;
  val, tot, totCanc: currency;
begin
  data := dialogo('data', 0, '', 0, true, '', 'Control for Windows:',
    'Qual a Data Inicial ?', FormatDateTime('dd/mm/yy', form1.datamov));
  if data = '*' then
    exit;

  fim := dialogo('data', 0, '', 0, true, '', 'Control for Windows:',
    'Qual a Data Final ?', FormatDateTime('dd/mm/yy', form1.datamov));
  if fim = '*' then
    exit;

  impvenda := dialogo('generico', 0, 'SN', 0, true, 'S', 'Control for Windows:',
    'Imprimir Todas as Vendas ?', 'N');
  if impvenda = '*' then
    exit;

  arq := TStringList.Create;
  mfd := Tmfd.Create(application);
  mfd.RichEdit1.Clear;
  mfd.RichEdit1.Lines.Add(CompletaOuRepete('', '', '-', 39));
  mfd.RichEdit1.Lines.Add(CompletaOuRepete(centraliza('RELATORIO DE VENDAS',
    ' ', 39), '', '', 39));
  mfd.RichEdit1.Lines.Add(CompletaOuRepete('', '', '-', 39));
  mfd.RichEdit1.Lines.Add(CompletaOuRepete('NFCES DE:', data + ' A ' + fim,
    ' ', 39));
  mfd.RichEdit1.Lines.Add(CompletaOuRepete('CAIXA: ' + strzero(getSerieNFCe, 3),
    '', ' ', 39));
  mfd.RichEdit1.Lines.Add(CompletaOuRepete('', '', '-', 39));
  if impvenda = 'S' then
    mfd.RichEdit1.Lines.Add(CompletaOuRepete('VENDA    NNF    SITUACAO',
      'VALOR', ' ', 39));
  if impvenda = 'S' then
    mfd.RichEdit1.Lines.Add(CompletaOuRepete('', '', '-', 39));

  dtmMain.IBQuery1.Close;
  dtmMain.IBQuery1.SQL.Text :=
    'select ADIC,chave, substring(chave from 23 for 3) from nfce where data >= :data and data <= :fim and substring(chave from 23 for 3) = :ser order by substring(chave from 26 for 9)';
  dtmMain.IBQuery1.ParamByName('data').AsDate := StrToDateDef(data, now);
  dtmMain.IBQuery1.ParamByName('fim').AsDate := StrToDateDef(fim, now);
  dtmMain.IBQuery1.ParamByName('ser').AsString := strzero(getSerieNFCe, 3);
  dtmMain.IBQuery1.Open;

  tot := 0;
  totCanc := 0;
  while not dtmMain.IBQuery1.Eof do
  begin
    if FileExists(buscaPastaNFCe(dtmMain.IBQuery1.fieldbyname('chave').AsString)
      + dtmMain.IBQuery1.fieldbyname('chave').AsString + '-nfe.xml') then
    begin
      arq.LoadFromFile(buscaPastaNFCe(dtmMain.IBQuery1.fieldbyname('chave')
        .AsString) + dtmMain.IBQuery1.fieldbyname('chave').AsString +
        '-nfe.xml');

      val := StrToCurrDef(StringReplace(Le_Nodo('vNF', arq.GetText), '.', ',',
        [rfReplaceAll, rfIgnoreCase]), 0);
      sit := Le_Nodo('cStat', arq.GetText);

      if dtmMain.IBQuery1.fieldbyname('adic').AsString = 'CANC' then
      begin
        sit := 'CANCELADA';
        totCanc := totCanc + val;
      end
      else if ((sit = '100') or (sit = '150')) then
      begin
        sit := 'AUTORIZADA';
        tot := tot + val;
      end
      else if sit = '' then
      begin
        sit := 'SEM PROT.';
        tot := tot + val;
      end;

      if impvenda = 'S' then
        mfd.RichEdit1.Lines.Add(strzero(Le_Nodo('cNF', arq.GetText), 6) + ' ' +
          strzero(Le_Nodo('nNF', arq.GetText), 6) + '   ' +
          CompletaOuRepete(sit, '', ' ', 11) + ' ' + CompletaOuRepete('',
          FormatCurr('0.00', val), ' ', 11));
    end;

    dtmMain.IBQuery1.Next;
  end;

  if impvenda = 'S' then
    mfd.RichEdit1.Lines.Add(CompletaOuRepete('', '', '-', 39));
  mfd.RichEdit1.Lines.Add(CompletaOuRepete('Total Autorizadas:', '', '.', 19) +
    CompletaOuRepete('', FormatCurr('0.00', tot), ' ', 10));
  mfd.RichEdit1.Lines.Add(CompletaOuRepete('Total  Canceladas:', '', '.', 19) +
    CompletaOuRepete('', FormatCurr('0.00', totCanc), ' ', 10));
  mfd.RichEdit1.Lines.Add(CompletaOuRepete('', '', '-', 39));
  mfd.ShowModal;
  mfd.Free;
  arq.Free;
end;

function TfrmMain.TerminarProcesso(sFile: String): Boolean;
var
  verSystem: TOSVersionInfo;
  hdlSnap, hdlProcess: THandle;
  bPath, bLoop: Bool;
  peEntry: TProcessEntry32;
  arrPid: Array [0 .. 1023] of DWORD;
  iC: DWORD;
  k, iCount: integer;
  arrModul: Array [0 .. 299] of Char;
  hdlModul: HMODULE;
begin
  Result := false;
  if ExtractFileName(sFile) = sFile then
    bPath := false
  else
    bPath := true;
  verSystem.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
  GetVersionEx(verSystem);
  if verSystem.dwPlatformId = VER_PLATFORM_WIN32_WINDOWS then
  begin
    hdlSnap := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    peEntry.dwSize := SizeOf(peEntry);
    bLoop := Process32First(hdlSnap, peEntry);
    while integer(bLoop) <> 0 do
    begin
      if bPath then
      begin
        if CompareText(peEntry.szExeFile, sFile) = 0 then
        begin
          TerminateProcess(OpenProcess(PROCESS_TERMINATE, false,
            peEntry.th32ProcessID), 0);
          Result := true;
        end;
      end
      else
      begin
        if CompareText(ExtractFileName(peEntry.szExeFile), sFile) = 0 then
        begin
          TerminateProcess(OpenProcess(PROCESS_TERMINATE, false,
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
    iCount := iC div SizeOf(DWORD);
    for k := 0 to Pred(iCount) do
    begin
      hdlProcess := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ,
        false, arrPid[k]);
      if (hdlProcess <> 0) then
      begin
        EnumProcessModules(hdlProcess, @hdlModul, SizeOf(hdlModul), iC);
        GetModuleFilenameEx(hdlProcess, hdlModul, arrModul, SizeOf(arrModul));
        if bPath then
        begin
          if CompareText(arrModul, sFile) = 0 then
          begin
            TerminateProcess(OpenProcess(PROCESS_TERMINATE or
              PROCESS_QUERY_INFORMATION, false, arrPid[k]), 0);
            Result := true;
          end;
        end
        else
        begin
          if CompareText(ExtractFileName(arrModul), sFile) = 0 then
          begin
            TerminateProcess(OpenProcess(PROCESS_TERMINATE or
              PROCESS_QUERY_INFORMATION, false, arrPid[k]), 0);
            Result := true;
          end;
        end;
        CloseHandle(hdlProcess);
      end;
    end;
  end;
end;

procedure TfrmMain.ZerarTentativasdeEnvioEsgotadas1Click(Sender: TObject);
begin
  dtmMain.IBQuery1.Close;
  dtmMain.IBQuery1.SQL.Text :=
    'update nfce set tentativa = 0 where tentativa > 9';
  dtmMain.IBQuery1.ExecSQL;
  dtmMain.IBQuery1.Transaction.Commit;

  ShowMessage('Comando Executado com Sucesso!' + #13 +
    IntToStr(dtmMain.IBQuery1.RowsAffected) + ' Registros Modificados.');
end;

procedure TfrmMain.reiniciaDAVNFCe();
var
  arq: TStringList;
begin
  if FileExists(ExtractFileDir(ParamStr(0)) + '\NEMIT.dat') then begin
    exit;
  end;


  arq := TStringList.Create;
  arq.SaveToFile(ExtractFileDir(ParamStr(0)) + '\davXXX.rca');
  arq.Free;
  TerminarProcesso('DavNfce.exe');
  ShellExecute(handle, 'open', PChar(ExtractFileDir(ParamStr(0)) +
    '\DavNFCe.exe'), '', '', SW_SHOWNORMAL);
end;

end.

unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, forms,
  Dialogs, DateUtils,Db, ExtCtrls,IniFiles, StdCtrls,  Menus, Buttons, JsBotao1,
  ExtDlgs, Grids, Calendar, Controls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP, IdMessage,
  IdIOHandler, IdIOHandlerSocket, IdAntiFreezeBase, IBSQL,
  IdAntiFreeze, printers, ibquery, dbclient, IdPOP3, AppEvnts,
  ComCtrls, jsedit1, treadproqy, Provider, classes1, untConfiguracoesNFCe,
  untnfceForm, funcoesdav, ACBrGIF, IdIPWatch,
  IdExplicitTLSClientServerBase, IdSMTPBase, IdAttachmentFile, Vcl.ImgList,
  PngSpeedButton, Vcl.Imaging.jpeg, pcnConversaoNFe;

type
  Ptr_comissao = ^Comissao;
  Comissao = record
    cod : integer;
    vendedor : String[40];
    nome : string[40];
    aprazo : currency;
    avista : currency;
    diferenciado_avista : currency;
    diferenciado_aprazo : currency;
    desconto : currency;
    total : currency;
  end;

type
  Ptr_Produto = ^Produto;
  Produto = record
    cod : integer;
    nome : string[40];
    qtd_atual : currency;
    p_compra : currency;
    p_venda : currency;
    minimo : currency;
    tot1 : currency;
    tot2 : currency;
    tot3 : currency;
  end;


type
  Ptr_Prod = ^Prod;
  Prod = record
    cod : integer;
    qtd : currency;
    total : currency;
  end;


type
  TForm2 = class(TForm)
    MainMenu1: TMainMenu;
    Estoque1: TMenuItem;
    Servios1: TMenuItem;
    Finanas1: TMenuItem;
    Posio1: TMenuItem;
    Relatrio1: TMenuItem;
    Cadastro1: TMenuItem;
    Utilitarios1: TMenuItem;
    Consultas1: TMenuItem;
    Vendas1: TMenuItem;
    Reimpresso1: TMenuItem;
    cancdenota1: TMenuItem;
    RequisioDepsito1: TMenuItem;
    RequisioDepsoto1: TMenuItem;
    SadadeEstoque1: TMenuItem;
    NotaFiscaldeVenda1: TMenuItem;
    NotaFiscalEletrnica1: TMenuItem;
    ransferencia1: TMenuItem;
    roca1: TMenuItem;
    Compras1: TMenuItem;
    FormasdePagamento1: TMenuItem;
    Oramento1: TMenuItem;
    AcertodeEstoque1: TMenuItem;
    Timer1: TTimer;
    CadastrarUsurio1: TMenuItem;
    data: TLabel;
    hora: TLabel;
    Fabricante1: TMenuItem;
    Fornecedores1: TMenuItem;
    GrupodeProduto1: TMenuItem;
    Vendedor1: TMenuItem;
    Convnio1: TMenuItem;
    GruposdeCaixa1: TMenuItem;
    HistricodeCaixa1: TMenuItem;
    Rotas1: TMenuItem;
    Agenda1: TMenuItem;
    FormasdePagamento2: TMenuItem;
    Produto1: TMenuItem;
    Cliente1: TMenuItem;
    ContasaReceber1: TMenuItem;
    ContasaPagar1: TMenuItem;
    FimdeEstoque1: TMenuItem;
    InventEstoque1: TMenuItem;
    abeladePreos1: TMenuItem;
    EtiquetasPreos1: TMenuItem;
    ProdComissoDif1: TMenuItem;
    Vendas2: TMenuItem;
    ResumoMensal1: TMenuItem;
    Comisses1: TMenuItem;
    Convnios1: TMenuItem;
    Clientes1: TMenuItem;
    MalaDireta1: TMenuItem;
    EstradasdeEstoque1: TMenuItem;
    OutrosRelatrios1: TMenuItem;
    Faturamento1: TMenuItem;
    Caixa1: TMenuItem;
    LivrodeCaixa1: TMenuItem;
    ResumoFinanceiro1: TMenuItem;
    MovPorHistrico1: TMenuItem;
    PorData1: TMenuItem;
    PorLocalidade1: TMenuItem;
    PorObservao1: TMenuItem;
    PorVendedor1: TMenuItem;
    PorFormaPagto1: TMenuItem;
    ResumoPRota1: TMenuItem;
    Consistncia1: TMenuItem;
    MdiadeAtraso1: TMenuItem;
    ExtratodeConta1: TMenuItem;
    ResumoPCliente1: TMenuItem;
    AlfabticaGeral1: TMenuItem;
    Numrica1: TMenuItem;
    NumricaPorCodBarras1: TMenuItem;
    NumricaSemCodBarras1: TMenuItem;
    AlfabticaPFornecedor1: TMenuItem;
    ItensdePesagem1: TMenuItem;
    AlfabticaPFornecedor2: TMenuItem;
    AlfabticaPFornecedor3: TMenuItem;
    AlfabticaPFornecedor4: TMenuItem;
    abelaPorRefOriginal1: TMenuItem;
    CodBarrasIguais1: TMenuItem;
    abelaPostodeGasolina1: TMenuItem;
    PreoAtacadoeVarejo1: TMenuItem;
    RefOriginalGrupo1: TMenuItem;
    abelaMercConv85011: TMenuItem;
    EstoqueNegativo1: TMenuItem;
    Grande1: TMenuItem;
    Pequena1: TMenuItem;
    PorNota1: TMenuItem;
    PorFechamento1: TMenuItem;
    PorCliente1: TMenuItem;
    PorFornecedor1: TMenuItem;
    PorGrupo1: TMenuItem;
    ClienteNoota1: TMenuItem;
    Cdigo1: TMenuItem;
    PorLocalidade2: TMenuItem;
    PorRota1: TMenuItem;
    PorVendedor2: TMenuItem;
    PorProd1: TMenuItem;
    MargemdeLucro1: TMenuItem;
    ResumodoDia1: TMenuItem;
    FornecedorCompra1: TMenuItem;
    MercDevolvidas1: TMenuItem;
    Geral1: TMenuItem;
    APrazo1: TMenuItem;
    AVista1: TMenuItem;
    AnaliticoProd1: TMenuItem;
    AnaliticoProd2: TMenuItem;
    AnaliticoProd3: TMenuItem;
    Servios2: TMenuItem;
    Aniversariantes1: TMenuItem;
    ClientesemAtraso1: TMenuItem;
    odosClientes1: TMenuItem;
    Oramento2: TMenuItem;
    SerialdeMercadorias1: TMenuItem;
    EtiquetasdePreos1: TMenuItem;
    SaldosEstoque1: TMenuItem;
    EntradasProduto1: TMenuItem;
    EntradasPorNota1: TMenuItem;
    FichadeEstoque1: TMenuItem;
    EmissodeFaturas1: TMenuItem;
    EmissodeDuplicatas1: TMenuItem;
    Timer2: TTimer;
    ParmetrosGerais1: TMenuItem;
    MovimentodeCaixa1: TMenuItem;
    ContasaReceber2: TMenuItem;
    ContasaPagar2: TMenuItem;
    LandeConvnios1: TMenuItem;
    NotaPromissoria1: TMenuItem;
    DuplicataNormal1: TMenuItem;
    DuplicataUnica1: TMenuItem;
    RecibodePagamento1: TMenuItem;
    ReciboAvulso1: TMenuItem;
    BoletodeCobrana1: TMenuItem;
    DuplicataFormContnuo1: TMenuItem;
    RevisarFechamentoCaixa1: TMenuItem;
    FechamentosdeVendas1: TMenuItem;
    ContaParcelada1: TMenuItem;
    ContadeCliente1: TMenuItem;
    Movimento1: TMenuItem;
    ContasReceber1: TMenuItem;
    ContasPagar1: TMenuItem;
    Usurios1: TMenuItem;
    SadasdeEstoque1: TMenuItem;
    FimdeEstoque2: TMenuItem;
    ConsultaNota1: TMenuItem;
    ConsultaInadiplentes1: TMenuItem;
    GrficoCtasPagar1: TMenuItem;
    GrficoCtasReceber1: TMenuItem;
    GrficoporHistrico1: TMenuItem;
    EstatsticadeCaixa1: TMenuItem;
    ControledeEntrada1: TMenuItem;
    PorData2: TMenuItem;
    PorCliente2: TMenuItem;
    PorHistrico1: TMenuItem;
    PorPagamento1: TMenuItem;
    Registrar1: TMenuItem;
    BloquearUsurio1: TMenuItem;
    NveisdeAcesso1: TMenuItem;
    teste1: TMenuItem;
    OutrasOpes1: TMenuItem;
    PapeldeParede1: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    NomePapeldeParede1: TMenuItem;
    RestaurarPadres1: TMenuItem;
    Nfe1: TMenuItem;
    CodOperaes1: TMenuItem;
    SitTribNotafisal1: TMenuItem;
    empresa: TLabel;
    InutilizarNfe1: TMenuItem;
    CancelarNFe1: TMenuItem;
    StatusdoServoo1: TMenuItem;
    ConsultarNFe1: TMenuItem;
    versao: TLabel;
    Image2: TImage;
    EnviarLogdeErrosViaEmail1: TMenuItem;
    mail: TIdSMTP;
    MAILMESSAGE: TIdMessage;
    CalcularEstoqueMnimo1: TMenuItem;
    Image1: TImage;
    AtualizarControlW1: TMenuItem;
    Reimpresso2: TMenuItem;
    IdIPWatch1: TIdIPWatch;
    AtualizarBD1: TMenuItem;
    AtualizarAliquotasSmallSoft2: TMenuItem;
    RecuperarNota1: TMenuItem;
    ExportaDAV1: TMenuItem;
    Sped1: TMenuItem;
    CadastrodeLeituraZECF1: TMenuItem;
    MovimentodeNotasFiscais1: TMenuItem;
    DadosAdicdeNotaFiscal1: TMenuItem;
    CadastrodeECF1: TMenuItem;
    CadastrodoContador1: TMenuItem;
    ConhecimentosdeFrete1: TMenuItem;
    GerarRemSpedPISCOFINS1: TMenuItem;
    GerarRemessaSpedFiscal1: TMenuItem;
    SadadeEstoque2: TMenuItem;
    OpesdeEstoque1: TMenuItem;
    SincronizarEstoque1: TMenuItem;
    ReceberEstFilial1: TMenuItem;
    ApagarOramentos1: TMenuItem;
    ZerarEstoque1: TMenuItem;
    ExportarNota1: TMenuItem;
    ReceberNota1: TMenuItem;
    CadastrodeUnidades1: TMenuItem;
    CartadeCorreo1: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    ExportarEmitidas1: TMenuItem;
    ReimpressodeCCE1: TMenuItem;
    Configurao1: TMenuItem;
    AcertarEstoque1: TMenuItem;
    RecalcularEstoque1: TMenuItem;
    ClientDataSet1: TClientDataSet;
    stb: TStatusBar;
    ReajustarPreos1: TMenuItem;
    Geral2: TMenuItem;
    Faixa1: TMenuItem;
    PorFornecedor2: TMenuItem;
    PorFabricante1: TMenuItem;
    VendanoAtacado1: TMenuItem;
    SuporteOnline1: TMenuItem;
    DataSetProvider1: TDataSetProvider;
    ProdutosporAliquotas1: TMenuItem;
    FazerBackUp1: TMenuItem;
    RecuperarumBackup1: TMenuItem;
    OrdemdeServio1: TMenuItem;
    Consulta1: TMenuItem;
    Cancelamento1: TMenuItem;
    SepararPeas1: TMenuItem;
    RelatrioPendentes1: TMenuItem;
    RelatrioEncerradas1: TMenuItem;
    RelatrioPSitDiag1: TMenuItem;
    RelatrioPClientes1: TMenuItem;
    Reimpresso3: TMenuItem;
    ConsultarEncerradas1: TMenuItem;
    Oramento3: TMenuItem;
    Sada1: TMenuItem;
    NFCe1: TMenuItem;
    EstadodoServio1: TMenuItem;
    Consultar1: TMenuItem;
    Cancelar1: TMenuItem;
    Configuraes1: TMenuItem;
    CupomEletrnicoCFe1: TMenuItem;
    Reimpresso4: TMenuItem;
    OutrasRotinas1: TMenuItem;
    EntradadeXML1: TMenuItem;
    ema1: TMenuItem;
    CriarCdigosdeBarras1: TMenuItem;
    NFePorCliente1: TMenuItem;
    NFePorCliente2: TMenuItem;
    PorProdutomaisVendido1: TMenuItem;
    NotasPendentes1: TMenuItem;
    ExportarEmitidas2: TMenuItem;
    ApplicationEvents2: TApplicationEvents;
    ReutilizarNumerao1: TMenuItem;
    Button1: TButton;
    PorVendedorPagamento1: TMenuItem;
    PorCliente3: TMenuItem;
    RefazerNFCe1: TMenuItem;
    CancelarPorNmerodeNFCe1: TMenuItem;
    InutilizarNumerao1: TMenuItem;
    AvanarNumerao1: TMenuItem;
    MarcarpeloArquivosNFe1: TMenuItem;
    avanumNFCe: TMenuItem;
    ReimprimirEvento1: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    NFCePorData1: TMenuItem;
    RecuperarNotaSemProtocolos1: TMenuItem;
    CriaXMLsNoEncontrados1: TMenuItem;
    ConsultarPorArquivo1: TMenuItem;
    ReimprimirPorXML1: TMenuItem;
    RelatriodePendnciasNFCe1: TMenuItem;
    AdicionarXMLs1: TMenuItem;
    ClientDataSet1nome: TStringField;
    ClientDataSet1cod: TIntegerField;
    ClientDataSet1MENU: TStringField;
    DataSource1: TDataSource;
    ContadoCliente1: TMenuItem;
    MarcarNFCesSemProtocolo1: TMenuItem;
    CEST1: TMenuItem;
    Promoes1: TMenuItem;
    VerificarVendas1: TMenuItem;
    VendasCanceladas1: TMenuItem;
    ProdutosVencidos1: TMenuItem;
    NFeSimplificada1: TMenuItem;
    ImageList1: TImageList;
    btnCadCliente: TPngSpeedButton;
    btnVendas: TPngSpeedButton;
    btnConsultaProd: TPngSpeedButton;
    btnNFE1: TPngSpeedButton;
    GerarCargaBalana1: TMenuItem;
    AlterarValidadesProdutosdePesagem1: TMenuItem;
    CriarSrie1: TMenuItem;
    PendnciasNFe1: TMenuItem;
    NFesCanceladas1: TMenuItem;
    EstruturarPastaNFCe1: TMenuItem;
    ContadeCliente2: TMenuItem;
    BoletodeCobrana2: TMenuItem;
    ConsultarCNPJ1: TMenuItem;
    ConsultarCPF1: TMenuItem;
    ConsultaCadastros1: TMenuItem;
    AliquotasdePISCOFINS1: TMenuItem;
    PorPisCST1: TMenuItem;
    FornecedorCliente1: TMenuItem;
    PorVendedorTicket1: TMenuItem;
    RestaurarCadastro1: TMenuItem;
    Button2: TButton;
    ManifestaodoDestinatrio1: TMenuItem;
    AdicionaExceoFireWall1: TMenuItem;
    PendentesdeEntrega1: TMenuItem;
    VerificarNFCes1: TMenuItem;
    FimdeEstoque3: TMenuItem;
    AtualizaCFOPs1: TMenuItem;
    EnviarporEmail1: TMenuItem;
    ExecutarComando1: TMenuItem;
    AtualizarTabelaIBPT1: TMenuItem;
    RestaurarBackup1: TMenuItem;
    EnviarXMLsPorEmail1: TMenuItem;
    EnviarPorEmail2: TMenuItem;
    NFCePorCliente1: TMenuItem;
    ReimpressoPorNumerodeVenda1: TMenuItem;
    ManutenoNFCe1: TMenuItem;
    InutilizaesNFeNFCe1: TMenuItem;
    PorVendedorNota1: TMenuItem;
    btnEntradaSimples: TPngSpeedButton;
    PapeldeParedeTerminal1: TMenuItem;
    ApagarLanamentosdecaixaDuplicados1: TMenuItem;
    ProdutoscomDivergencianaFichadoProduto1: TMenuItem;
    AcertosdeEstoque1: TMenuItem;
    AlfabticaGeralGrfico1: TMenuItem;
    Button3: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CadastrarUsurio1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Fabricante1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure GrupodeProduto1Click(Sender: TObject);
    procedure Vendedor1Click(Sender: TObject);
    procedure Convnio1Click(Sender: TObject);
    procedure GruposdeCaixa1Click(Sender: TObject);
    procedure HistricodeCaixa1Click(Sender: TObject);
    procedure Rotas1Click(Sender: TObject);
    procedure Agenda1Click(Sender: TObject);
    procedure FormasdePagamento2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure RequisioDepsito1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure AlfabticaGeral1Click(Sender: TObject);
    procedure Numrica1Click(Sender: TObject);
    procedure NumricaPorCodBarras1Click(Sender: TObject);
    procedure AlfabticaPFornecedor1Click(Sender: TObject);
    procedure EstoqueNegativo1Click(Sender: TObject);
    procedure ResumoMensal1Click(Sender: TObject);
    procedure AlfabticaPFornecedor2Click(Sender: TObject);
    procedure Consultas1Click(Sender: TObject);
    procedure NumricaSemCodBarras1Click(Sender: TObject);
    procedure AlfabticaPFornecedor3Click(Sender: TObject);
    procedure AlfabticaPFornecedor4Click(Sender: TObject);
    procedure CodBarrasIguais1Click(Sender: TObject);
    procedure abelaPorRefOriginal1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RefOriginalGrupo1Click(Sender: TObject);
    procedure ItensdePesagem1Click(Sender: TObject);
    procedure ParmetrosGerais1Click(Sender: TObject);
    procedure formatarExecute(Sender: TObject);
    procedure abelaPostodeGasolina1Click(Sender: TObject);
    procedure PreoAtacadoeVarejo1Click(Sender: TObject);
    procedure ContasaPagar2Click(Sender: TObject);
    procedure Lanamentos1Click(Sender: TObject);
    procedure Baixa1Click(Sender: TObject);
    procedure ContasPagar1Click(Sender: TObject);
    procedure MovimentodeCaixa1Click(Sender: TObject);
    procedure Movimento1Click(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure ContadeCliente1Click(Sender: TObject);
    procedure ContaParcelada1Click(Sender: TObject);
    procedure PorData2Click(Sender: TObject);
    procedure PorCliente2Click(Sender: TObject);
    procedure GrficoCtasPagar1Click(Sender: TObject);
    procedure GrficoCtasReceber1Click(Sender: TObject);
    procedure PorHistrico1Click(Sender: TObject);
    procedure PorPagamento1Click(Sender: TObject);
    procedure ContasaPagar1Click(Sender: TObject);
    procedure PorData1Click(Sender: TObject);
    procedure PorLocalidade1Click(Sender: TObject);
    procedure PorObservao1Click(Sender: TObject);
    procedure PorVendedor1Click(Sender: TObject);
    procedure LivrodeCaixa1Click(Sender: TObject);
    procedure ResumoFinanceiro1Click(Sender: TObject);
    procedure MovPorHistrico1Click(Sender: TObject);
    procedure Registrar1Click(Sender: TObject);
    procedure BloquearUsurio1Click(Sender: TObject);
    procedure NveisdeAcesso1Click(Sender: TObject);
    procedure ResumoPCliente1Click(Sender: TObject);
    procedure PorFormaPagto1Click(Sender: TObject);
    procedure ResumoPRota1Click(Sender: TObject);
    procedure ExtratodeConta1Click(Sender: TObject);
    procedure MdiadeAtraso1Click(Sender: TObject);
    procedure Reimpresso1Click(Sender: TObject);
    procedure teste1Click(Sender: TObject);
    procedure ConsultaNota1Click(Sender: TObject);
    procedure cancdenota1Click(Sender: TObject);
    procedure RequisioDepsoto1Click(Sender: TObject);
    procedure SadadeEstoque1Click(Sender: TObject);
    procedure ransferencia1Click(Sender: TObject);
    procedure roca1Click(Sender: TObject);
    procedure PorNota1Click(Sender: TObject);
    procedure ClienteNoota1Click(Sender: TObject);
    procedure PorCliente1Click(Sender: TObject);
    procedure MargemdeLucro1Click(Sender: TObject);
    procedure PorFornecedor1Click(Sender: TObject);
    procedure PapeldeParede1Click(Sender: TObject);
    procedure NomePapeldeParede1Click(Sender: TObject);
    procedure RestaurarPadres1Click(Sender: TObject);
    procedure Oramento1Click(Sender: TObject);
    procedure Nfe1Click(Sender: TObject);
    procedure DuplicataNormal1Click(Sender: TObject);
    procedure DuplicataUnica1Click(Sender: TObject);
    procedure NotaPromissoria1Click(Sender: TObject);
    procedure BoletodeCobrana1Click(Sender: TObject);
    procedure CancelarParcelamento1Click(Sender: TObject);
    procedure RecibodePagamento1Click(Sender: TObject);
    procedure ReciboAvulso1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure CodOperaes1Click(Sender: TObject);
    procedure SitTribNotafisal1Click(Sender: TObject);
    procedure NotaFiscalEletrnica1Click(Sender: TObject);
    procedure StatusdoServoo1Click(Sender: TObject);
    procedure CancelarNFe1Click(Sender: TObject);
    procedure ConsultarNFe1Click(Sender: TObject);
    procedure FormasdePagamento1Click(Sender: TObject);
    procedure AcertodeEstoque1Click(Sender: TObject);
    procedure Geral1Click(Sender: TObject);
    procedure AVista1Click(Sender: TObject);
    procedure APrazo1Click(Sender: TObject);
    procedure FimdeEstoque1Click(Sender: TObject);
    procedure EnviarLogdeErrosViaEmail1Click(Sender: TObject);
    procedure CalcularEstoqueMnimo1Click(Sender: TObject);
    procedure Compras1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure AtualizarControlW1Click(Sender: TObject);
    procedure Reimpresso2Click(Sender: TObject);
    procedure AtualizarBD1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure RecuperarNota1Click(Sender: TObject);
    procedure PorVendedor2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ExportaDAV1Click(Sender: TObject);
    procedure DadosAdicdeNotaFiscal1Click(Sender: TObject);
    procedure CadastrodoContador1Click(Sender: TObject);
    procedure SadadeEstoque2Click(Sender: TObject);
    procedure InventEstoque1Click(Sender: TObject);
    procedure GerarRemessaSpedFiscal1Click(Sender: TObject);
    procedure ResumodoDia1Click(Sender: TObject);
    procedure FechamentosdeVendas1Click(Sender: TObject);
    procedure PorFechamento1Click(Sender: TObject);
    procedure SincronizarEstoque1Click(Sender: TObject);
    procedure ReceberEstFilial1Click(Sender: TObject);
    procedure ZerarEstoque1Click(Sender: TObject);
    procedure ExportarNota1Click(Sender: TObject);
    procedure ReceberNota1Click(Sender: TObject);
    procedure CadastrodeUnidades1Click(Sender: TObject);
    procedure CartadeCorreo1Click(Sender: TObject);
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure ExportarEmitidas1Click(Sender: TObject);
    procedure PorRota1Click(Sender: TObject);
    procedure PorLocalidade2Click(Sender: TObject);
    procedure ReimpressodeCCE1Click(Sender: TObject);
    procedure Configurao1Click(Sender: TObject);
    procedure RecalcularEstoque1Click(Sender: TObject);
    procedure AcertarEstoque1Click(Sender: TObject);
    procedure Aniversariantes1Click(Sender: TObject);
    procedure ClientesemAtraso1Click(Sender: TObject);
    procedure Servios1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Geral2Click(Sender: TObject);
    procedure VendanoAtacado1Click(Sender: TObject);
    procedure Faixa1Click(Sender: TObject);
    procedure PorFornecedor2Click(Sender: TObject);
    procedure PorFabricante1Click(Sender: TObject);
    procedure SuporteOnline1Click(Sender: TObject);
    procedure AnaliticoProd1Click(Sender: TObject);
    procedure AnaliticoProd2Click(Sender: TObject);
    procedure SadasdeEstoque1Click(Sender: TObject);
    procedure Cdigo1Click(Sender: TObject);
    procedure ProdutosporAliquotas1Click(Sender: TObject);
    procedure FazerBackUp1Click(Sender: TObject);
    procedure RecuperarumBackup1Click(Sender: TObject);
    procedure EntradasPorNota1Click(Sender: TObject);
    procedure FichadeEstoque1Click(Sender: TObject);
    procedure OrdemdeServio1Click(Sender: TObject);
    procedure Consulta1Click(Sender: TObject);
    procedure SepararPeas1Click(Sender: TObject);
    procedure Reimpresso3Click(Sender: TObject);
    procedure Sada1Click(Sender: TObject);
    procedure Cancelamento1Click(Sender: TObject);
    procedure ConsultarEncerradas1Click(Sender: TObject);
    procedure Oramento3Click(Sender: TObject);
    procedure RelatrioPendentes1Click(Sender: TObject);
    procedure Configuraes1Click(Sender: TObject);
    procedure EstadodoServio1Click(Sender: TObject);
    procedure CupomEletrnicoCFe1Click(Sender: TObject);
    procedure Cancelar1Click(Sender: TObject);
    procedure Consultar1Click(Sender: TObject);
    procedure Reimpresso4Click(Sender: TObject);
    procedure CadastrodeECF1Click(Sender: TObject);
    procedure CadastrodeLeituraZECF1Click(Sender: TObject);
    procedure ConhecimentosdeFrete1Click(Sender: TObject);
    procedure GerarRemSpedPISCOFINS1Click(Sender: TObject);
    procedure EntradadeXML1Click(Sender: TObject);
    procedure NotaFiscaldeVenda1Click(Sender: TObject);
    procedure ema1Click(Sender: TObject);
    procedure CriarCdigosdeBarras1Click(Sender: TObject);
    procedure NFePorCliente1Click(Sender: TObject);
    procedure NFePorCliente2Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure PorProdutomaisVendido1Click(Sender: TObject);
    procedure NotasPendentes1Click(Sender: TObject);
    procedure ExportarEmitidas2Click(Sender: TObject);
    procedure ReutilizarNumerao1Click(Sender: TObject);
    procedure PorVendedorPagamento1Click(Sender: TObject);
    procedure PorCliente3Click(Sender: TObject);
    procedure RefazerNFCe1Click(Sender: TObject);
    procedure CancelarPorNmerodeNFCe1Click(Sender: TObject);
    procedure InutilizarNfe1Click(Sender: TObject);
    procedure InutilizarNumerao1Click(Sender: TObject);
    procedure AvanarNumerao1Click(Sender: TObject);
    procedure MarcarpeloArquivosNFe1Click(Sender: TObject);
    procedure rmaClick(Sender: TObject);
    procedure avanumNFCeClick(Sender: TObject);
    procedure ReimprimirEvento1Click(Sender: TObject);
    procedure NFCePorData1Click(Sender: TObject);
    procedure RecuperarNotaSemProtocolos1Click(Sender: TObject);
    procedure CriaXMLsNoEncontrados1Click(Sender: TObject);
    procedure ConsultarPorArquivo1Click(Sender: TObject);
    procedure ReimprimirPorXML1Click(Sender: TObject);
    procedure RelatriodePendnciasNFCe1Click(Sender: TObject);
    procedure AdicionarXMLs1Click(Sender: TObject);
    procedure ContadoCliente1Click(Sender: TObject);
    procedure MarcarNFCesSemProtocolo1Click(Sender: TObject);
    procedure CEST1Click(Sender: TObject);
    procedure Promoes1Click(Sender: TObject);
    procedure VerificarVendas1Click(Sender: TObject);
    procedure VendasCanceladas1Click(Sender: TObject);
    procedure NFeSimplificada1Click(Sender: TObject);
    procedure ProdutosVencidos1Click(Sender: TObject);
    procedure Panel2MouseEnter(Sender: TObject);
    procedure Panel2MouseLeave(Sender: TObject);
    procedure MovimentodeNotasFiscais1Click(Sender: TObject);
    procedure PorGrupo1Click(Sender: TObject);
    procedure PorProd1Click(Sender: TObject);
    procedure AtualizarAliquotasSmallSoft2Click(Sender: TObject);
    procedure GerarCargaBalana1Click(Sender: TObject);
    procedure AlterarValidadesProdutosdePesagem1Click(Sender: TObject);
    procedure CriarSrie1Click(Sender: TObject);
    procedure PendnciasNFe1Click(Sender: TObject);
    procedure EstruturarPastaNFCe1Click(Sender: TObject);
    procedure ContadeCliente2Click(Sender: TObject);
    procedure BoletodeCobrana2Click(Sender: TObject);
    procedure ConsultarCNPJ1Click(Sender: TObject);
    procedure ConsultarCPF1Click(Sender: TObject);
    procedure ConsultaCadastros1Click(Sender: TObject);
    procedure DuplicataFormContnuo1Click(Sender: TObject);
    procedure AliquotasdePISCOFINS1Click(Sender: TObject);
    procedure PorPisCST1Click(Sender: TObject);
    procedure FornecedorCliente1Click(Sender: TObject);
    procedure PorVendedorTicket1Click(Sender: TObject);
    procedure RestaurarCadastro1Click(Sender: TObject);
    procedure EntradasProduto1Click(Sender: TObject);
    procedure ControledeEntrada1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ManifestaodoDestinatrio1Click(Sender: TObject);
    procedure AdicionaExceoFireWall1Click(Sender: TObject);
    procedure PendentesdeEntrega1Click(Sender: TObject);
    procedure VerificarNFCes1Click(Sender: TObject);
    procedure FimdeEstoque3Click(Sender: TObject);
    procedure AtualizaCFOPs1Click(Sender: TObject);
    procedure EnviarporEmail1Click(Sender: TObject);
    procedure ExecutarComando1Click(Sender: TObject);
    procedure AtualizarTabelaIBPT1Click(Sender: TObject);
    procedure RestaurarBackup1Click(Sender: TObject);
    procedure EnviarXMLsPorEmail1Click(Sender: TObject);
    procedure EnviarPorEmail2Click(Sender: TObject);
    procedure NFCePorCliente1Click(Sender: TObject);
    procedure ReimpressoPorNumerodeVenda1Click(Sender: TObject);
    procedure ManutenoNFCe1Click(Sender: TObject);
    procedure InutilizaesNFeNFCe1Click(Sender: TObject);
    procedure PorVendedorNota1Click(Sender: TObject);
    procedure btnEntradaSimplesClick(Sender: TObject);
    procedure PapeldeParedeTerminal1Click(Sender: TObject);
    procedure ApagarLanamentosdecaixaDuplicados1Click(Sender: TObject);
    procedure ProdutoscomDivergencianaFichadoProduto1Click(Sender: TObject);
    procedure AcertosdeEstoque1Click(Sender: TObject);
    procedure AlfabticaGeralGrfico1Click(Sender: TObject);
    procedure Servios2Click(Sender: TObject);
  private
    b, cont : integer;
    ini : Smallint;
    tread : TTWThreadProdQY;
    tread1 : TTWtheadEnviaCupons;
    procedure cliqueMenu(const cod : String);
    procedure criaDatasetMenus();
    procedure WMSysCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;
    procedure inicializaComponentes();
    function lerComissoesDiferenciadasNameCodigo : TStringList;
    procedure mostraEnviaCupom();
//    procedure calcula_comissao(var mattDiferenciados : TStringList; const total, porc : currency; var valorAvista, valorAprazo : currency);
    { Private declarations }
  public
    grupo,fornec,fabric:string;
    nota : string;
    procedure atualizaLabel(cont1 : integer);
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses  CadUsuario,StrUtils,Math, dialog, cadfrabricante, cadfornecedor, cadgrupoprod,
  cadvendedor, cadhiscaixa, cadrota, agenda, cadformpagto,
  cadgrupodecaixa, cadproduto, cadcliente, entrasimples,
  vendas, prod, formpagtoformulario, func,  relatorio
, mensagem, principal, consulta, Unit1, cpagar, creceber, creceberbaixa,
  CpagarBaixa, MovCaixa, movcaixaposicao, buscaSelecao, creceberposicao,
  minilocalizar, registro, bloqusu, acesso, Unit38, caixaLista, param,
  posiUsu, Unit42, imprime1, nfe, cadCodOp, aliq, cadTransp, dadosTransp,
  backup, dm1, Unit45, Unit46, spedFiscal, unid, impriNovo,
  configImpressora, batepapo, CadServ, consultaOrdem, cadECF,
  cadReducaoZ, untMovto, acerto1, Unit56, envicupom, Unit59, cadCestNCM,
  PROMOC, cadNotasFiscais, U_Principal, ConsultaCPF, Unit67, Unit68, param1,
  Unit71, uConsultaCNPJ;

{$R *.dfm}
procedure calcula_comissao(var mattDiferenciados : TStringList; const total, porc : currency; var valorAvista, valorAprazo : currency);
var
  com : currency;
begin

end;

function TForm2.lerComissoesDiferenciadasNameCodigo : TStringList;
begin
  funcoes.iniciaDataset(dm.ibselect, 'select cod, comissao from produto where comissao <> 0');
  dm.IBselect.Open;
  Result := TStringList.Create;

  while not dm.IBselect.Eof do
    begin
      Result.Values[dm.IBselect.FieldByName('cod').AsString] := dm.IBselect.FieldByName('comissao').AsString; 
      dm.IBselect.Next;
    end;

  dm.IBselect.Close;  
end;

procedure TForm2.inicializaComponentes();
begin
  btnNFE1.Left := 10;
  //btnNFE1.Top := self.Height - stb.Height - btnNFE1.Height - 20;
  btnNFE1.Top := self.Height - stb.Height - btnNFE1.Height - 20;

  btnConsultaProd.Left := 169 + 20;
  btnConsultaProd.Top := self.Height - stb.Height - btnNFE1.Height - 20;

  btnCadCliente.Left := trunc(169 * 2) + 30;
  btnCadCliente.Top := self.Height - stb.Height - btnNFE1.Height - 20;

  btnVendas.Left := trunc(169 * 3) + 40;
  btnVendas.Top := self.Height - stb.Height - btnNFE1.Height - 20;

  btnEntradaSimples.Left := trunc(169 * 4) + 50;
  btnEntradaSimples.Top := self.Height - stb.Height - btnNFE1.Height - 20;

  stb.Panels[1].Text := funcoes.NomedoComputador();

  //componentes da barra acima
  data.Top    := trunc(((Image2.Height ) / 2) - (data.Height / 2));
  empresa.Top := trunc(((Image2.Height ) / 2) - (empresa.Height / 2));
  hora.Top    := trunc(((Image2.Height ) / 2) - (hora.Height / 2));

end;

procedure TForm2.WMSysCommand(var Msg: TWMSysCommand);
begin
if (Msg.CmdType = SC_MINIMIZE) then application.Minimize
else inherited;
end;

procedure Tform2.formatarExecute(Sender: TObject);
begin
   TcurrencyField(dm.produto.FieldByName('estoque')).DisplayFormat := '###,##0.00';
   TcurrencyField(dm.produto.FieldByName('preco')).DisplayFormat := '###,##0.00';
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   funcoes.VerAcesso('0');
   form22.Pgerais := nil;

   form22.Show;
   data.Caption := FormatDateTime('ddd,dd/mm/yy', form22.datamov);
   hora.Caption := FormatDateTime('hh:mm:ss', now);
end;

procedure TForm2.CadastrarUsurio1Click(Sender: TObject);
begin
   Form5 := Tform5.Create(Self);
   funcoes.CtrlResize(tform(form5));
   form5.showmodal;
   form5.Free;
end;

procedure TForm2.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #27 then close;
end;

procedure TForm2.Fabricante1Click(Sender: TObject);
begin
  Form6 := Tform6.Create(Self);
  funcoes.CtrlResize(tform(form6));
  form6.ShowModal;
  form6.Free;
end;

procedure TForm2.FornecedorCliente1Click(Sender: TObject);
var
  ini, fim, cod, nom, LISTA_PROD, NOMCLI, CODCLI, venda : String;
  fim1 : integer;
  TOTCLI, TOT : currency;

begin
  cod := funcoes.dialogo('generico',100,'1234567890' + #8,100,false,'',Application.Title,'Qual o C�d. do Fornecedor ?','');
  if cod = '*' then exit;

  ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?','');
  if ini = '*' then exit;

  fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?','');
  if fim = '*' then exit;

  {dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select cod, nome from fornecedor where cod = :cod';
  dm.IBselect.ParamByName('cod').AsInteger := StrToIntDef(strnum(cod), 0);
  dm.IBselect.Open;

  if dm.IBselect.IsEmpty then begin
    dm.IBselect.Close;
    ShowMessage('Fornecedor N�o Encontrado!');
    exit;
  end;

  nom := dm.IBselect.FieldByName('nome').AsString;}

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select i.cod, i.data, i.quant, i.total, v.cliente, iif(c.nome <> '''', c.nome, ''VENDA AO CONSUMIDOR'' ) as nomeCliente, p.nome from '+
  'item_venda i, produto p, venda v left join cliente c on (v.cliente = c.cod)'+
  ' where i.cod = p.cod and i.nota = v.nota and i.data >= :ini and i.data <= :fim'+
  ' and p.fornec = :cod and v.cancelado = 0  order by v.cliente';
  dm.IBselect.ParamByName('ini').AsDate    := StrToDate(ini);
  dm.IBselect.ParamByName('fim').AsDate    := StrToDate(fim);
  dm.IBselect.ParamByName('cod').AsInteger := StrToIntDef(strnum(cod), 0);
  dm.IBselect.Open;
  dm.IBselect.FetchAll;

  fim1 := dm.IBselect.RecordCount;

  form19.RichEdit1.Clear;
  addRelatorioForm19(funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'VENDAS DE '  + (ini) + ' a ' + fim, 79));
  addRelatorioForm19('  DATA     QUANT PRODUTO                                       TOTAL' + CRLF);
  addRelatorioForm19(CompletaOuRepete('', '', '-', 79) + crlf);

  funcoes.informacao(1,2,'Gerando Relat�rio...',true,false,2);

  CODCLI := 'XX';
  TOT    := 0;

  while not dm.IBselect.Eof do begin
    funcoes.informacao(dm.IBselect.RecNo, fim1,'Gerando Relat�rio...',false,false,2);

    if CODCLI <> dm.IBselect.FieldByName('cliente').AsString then begin
      if CODCLI <> 'XX' then begin
        addRelatorioForm19(CompletaOuRepete('SUB TOTAL CLIENTE ' + LeftStr(NOMCLI, 35) + ' => ',  formataCurrency(TOTCLI), ' ', 68) + crlf);
        addRelatorioForm19(CompletaOuRepete('', '', '-', 79) + crlf + crlf);
      end;

      CODCLI := dm.IBselect.FieldByName('cliente').AsString;
      NOMCLI := dm.IBselect.FieldByName('cliente').AsString + '-' +dm.IBselect.FieldByName('nomecliente').AsString;
      TOTCLI := 0;
    end;

    if dm.IBselect.FieldByName('total').AsCurrency <> 0 then begin
      addRelatorioForm19(formataDataDDMMYY(dm.IBselect.FieldByName('data').AsDateTime) + ' ' +
      CompletaOuRepete('',FormatCurr('0.00', dm.IBselect.FieldByName('quant').AsCurrency), ' ', 7) + ' ' +
      CompletaOuRepete(LeftStr(strzero(dm.IBselect.FieldByName('cod').AsInteger, 6) + '-' + dm.IBselect.FieldByName('nome').AsString, 35), '', ' ', 35) +
      ' ' + CompletaOuRepete('', formataCurrency(dm.IBselect.FieldByName('total').AsCurrency), ' ', 15) + crlf);

      TOTCLI := TOTCLI + dm.IBselect.FieldByName('total').AsCurrency;
      TOT    := TOT    + dm.IBselect.FieldByName('total').AsCurrency;
    end;


    dm.IBselect.Next;
  end;

  funcoes.informacao(dm.IBselect.RecNo, fim1,'Gerando Relat�rio...',false,true,2);
  addRelatorioForm19(CompletaOuRepete('SUB TOTAL CLIENTE ' + LeftStr(NOMCLI, 35) + ' => ',  formataCurrency(TOTCLI), ' ', 68) + crlf);
  addRelatorioForm19(CompletaOuRepete('', '', '-', 79) + crlf + crlf);

  addRelatorioForm19(CompletaOuRepete('TOTAL => ',  formataCurrency(TOT), '.', 68) + crlf);
  addRelatorioForm19(CompletaOuRepete('', '', '-', 79) + crlf + crlf);

  form19.ShowModal;
end;

procedure TForm2.Fornecedores1Click(Sender: TObject);
begin
   Form8 := Tform8.Create(Self);
   funcoes.CtrlResize(tform(form8));
   Form8.ShowModal;
   form8.Free;
end;

procedure TForm2.GrupodeProduto1Click(Sender: TObject);
begin
   Form3 := Tform3.Create(Self);
   funcoes.CtrlResize(tform(form3));
   Form3.ShowModal;
   form3.Free;
end;

procedure TForm2.Vendedor1Click(Sender: TObject);
begin
   Form4 := Tform4.Create(Self);
   funcoes.CtrlResize(tform(form4));
   Form4.ShowModal;
   form4.Free;
end;

procedure TForm2.Convnio1Click(Sender: TObject);
begin
   Form10 := Tform10.Create(Self);
   funcoes.CtrlResize(tform(form10));
   Form10.ShowModal;
   form10.Free;
end;

procedure TForm2.GruposdeCaixa1Click(Sender: TObject);
begin
   Form11 := Tform11.Create(Self);
   funcoes.CtrlResize(tform(form11));
   Form11.ShowModal;
   form11.Free;
end;

procedure TForm2.HistricodeCaixa1Click(Sender: TObject);
begin
   Form12 := Tform12.Create(Self);
   funcoes.CtrlResize(tform(form12));
   Form12.ShowModal;
   form12.Free;
end;

procedure TForm2.Rotas1Click(Sender: TObject);
begin
   Form13 := Tform13.Create(Self);
   funcoes.CtrlResize(tform(form13));
   Form13.ShowModal;
   form13.Free;
end;

procedure TForm2.Agenda1Click(Sender: TObject);
begin
   Form14 := Tform14.Create(Self);
   funcoes.CtrlResize(tform(form14));
   Form14.ShowModal;
   form14.Free;
end;

procedure TForm2.FormasdePagamento2Click(Sender: TObject);
begin
   Form15 := Tform15.Create(Self);
   funcoes.CtrlResize(tform(form15));
   Form15.ShowModal;
   form15.Free;
end;

procedure TForm2.FormShow(Sender: TObject);
var
  lista : TList;
  li : TStringList;
  dias : integer;
  cupons : TTWtheadEnviaCupons1;
begin
   {btnNFE1.Caption         := 'F2' + #13 + 'NFE';
   btnConsultaProd.Caption := 'F3' + #13 + 'PRODUTOS';
   btnCadCliente.Caption   := 'F4' + #13 + 'CLIENTES';
   btnVendas.Caption       := 'F5' + #13 + 'VENDAS';}
   //dias := 20;
   //funcoes.adicionaRegistroDataBloqueio(true, false, dias);

   if form22.usuario <> 'ADMIN' then RestaurarBackup1.Visible := false
     else RestaurarBackup1.Visible := true;

   if ConfParamGerais[10] <> '1' then begin
     UsaSped := true;
   end;

   IF FORM22.superUsu = 1 THEN
    BEGIN
      stb.Panels[2].Text := dm.bd.DatabaseName;
    END
   ELSE stb.Panels[2].Text := '';

   data.Caption := FormatDateTime('DDD,dd/mm/yy', form22.datamov);
   data.Caption := UpperCase(data.Caption[1]) + copy(data.Caption,2,length(data.Caption));
   b := 1;
   funcoes.CentralizaNoFormulario(twincontrol(empresa),tform(self));
   //Label1.Caption := dm.bd.DatabaseName;
//   Label1.Left := SpeedButton1.Left + SpeedButton1.Width + 10;

   //verifica se esta habilitado os botoes de atalho para o usuario
   if not NotaFiscalEletrnica1.Visible then btnNFE1.Enabled := false
   else btnNFE1.Enabled := true;

   if not RequisioDepsito1.Visible then btnEntradaSimples.Enabled := false
   else btnEntradaSimples.Enabled := true;

   if not Consultas1.Visible then btnCadCliente.Enabled := false
   else btnConsultaProd.Enabled := true;

   if not Cliente1.Visible then btnCadCliente.Enabled := false
   else btnCadCliente.Enabled := true;

   if not Vendas1.Visible then btnVendas.Enabled := false
   else btnVendas.Enabled := true;

   if ini = 1 then
     begin
       try
         funcoes.descompactaIBPT;
       except
         on e:exception do begin
           ShowMessage('ERRO: ' + e.Message);
         end;
       end;
       inicializaComponentes();
       lista := TList.Create;

       funcoes.transformaStringList(ConfParamGerais, li);

       lista.Add(dm.IBQuery1);
       lista.Add(dm.IBQuery2);
       lista.Add(dm.ACBrNFe);
       lista.Add(li);
       lista.Add(dm.DANFE);
       lista.Add(dm.ACBrNFeDANFeRL1);
       lista.Add(nil);
       lista.Add(dm.ACBrNFeDANFeESCPOS1);
       lista.Add(dm.ACBrIBPTax1);
       lista.Add(dm.ACBrNFeDANFEFR1);
       lista.Add(dm.ACBrMail1);
       setQueryNFCe(lista);

       LerConfiguracaoNFCe();
       dm.ACBrNFeDANFeRL1.MostrarPreview := preview;

       lerPathSalvar(caminhoEXE_com_barra_no_final);
       ini := 0;

       try
        funcoes.atualizaTabelaIBPT;
       except
         on e:exception do begin
           ShowMessage('Erro: ' + e.Message);
         end;
       end;

       if funcoes.le_configTerminalWindows(7, 'N') = 'S' then
         begin
           if funcoes.vercCountContigencia > 0 then
             begin
               Panel1.Left := Screen.Width - Panel1.Width - 10;
               Panel1.Top  := stb.Top - Panel1.Height;
               Panel1.Visible := true;
               cupons := TTWtheadEnviaCupons1.Create(true, Label1);
               cupons.FreeOnTerminate := true;
               cupons.Resume;
             end;
         end;
     end;

   criaDatasetMenus;
   if form22.usuario <> 'ADMIN' then VerificarVendas1.Visible := false;
  //timer2.Enabled := true;
  //mostraEnviaCupom();
end;

procedure TForm2.Produto1Click(Sender: TObject);
begin
   Form9 := Tform9.Create(Self);
   funcoes.CtrlResize(tform(form9));
   Form9.ShowModal;
   JsEdit.LiberaMemoria(form9);
   form9.Free;

   if funcoes.notaNFe <> '' then begin
     if funcoes.fornecNFe <> '' then begin
       funcoes.FiltraNota(funcoes.notaNFe, funcoes.fornecNFe);
     end;
   end;

end;

procedure TForm2.Cliente1Click(Sender: TObject);
begin
   Form16 := Tform16.Create(Self);
   funcoes.CtrlResize(tform(form16));
   Form16.ShowModal;
   JsEdit.LiberaMemoria(form16);
   form16.Free;
end;

procedure TForm2.RequisioDepsito1Click(Sender: TObject);
begin
   Form17 := Tform17.Create(Self);
   funcoes.CtrlResize(tform(form17));
   Form17.ShowModal;
   form17.Free;
end;

procedure TForm2.Vendas1Click(Sender: TObject);
begin
   //funcoes.OrdenaCamposVenda(funcoes.LerValorPGerais('ORDEMVENDA',form22.Pgerais));
   Form20 := Tform20.Create(Self);
   form20.tipoV := 'V';
   Form20.LabelVenda.Caption := 'Venda';
   form20.Modo_Venda := true;
   form20.origem := 1;
   form20.saidaDeEstoque := false;
   form20.finaliza       := false;
   form20.separaPecas    := false;

   funcoes.CtrlResize(tform(form20));

   //funcoes.AjustaForm(Form20);
   Form20.ShowModal;
   form20.Free;
end;

procedure TForm2.AlfabticaGeral1Click(Sender: TObject);
var
  sim, prec, h1, h2, h3, h4, ordem, estoqueZero : string;
  tam : integer;
begin
  form19.RichEdit1.Clear;
  b := 80;
  tam := 80;

  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#18+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS ALFABETICA', TAM)))));
  funcoes.PerguntasRel(dm.ProdutoQY,'12',false,'','') ;
  if not funcoes.Contido('*',grupo+fornec+fabric) then
    begin
      sim := funcoes.dialogo('generico',0,'SN'+#8,0,false,'S','Control For Windows','Imprimir Quantidade em Estoque?S/N:','N') ;
    end;
  if (sim = '*') then exit;

  ordem := funcoes.dialogo('generico',0,'123'+#8,0,false,'S','Control For Windows','Qual a Ordem (1-Nome 2-Quant.Cresc 3-Quant.Asc)?:','1') ;
  if ordem = '*' then exit;


  if      ordem = '1' then ordem := ' nome '
  else if ordem = '2' then ordem := ' quant asc '
  else if ordem = '3' then ordem := ' quant desc ';

  h1 := '';
  h2 := '';
  h3 := '';
  h4 := '';

  if fornec <> '' then h1 := ' (fornec = ' + StrNum(fornec) + ') and';
  if grupo  <> '' then h2 := ' (grupo = ' + StrNum(grupo) + ') and';
  if fabric <> '' then h3 := ' (fabric = ' + StrNum(fabric) + ') and';

  prec := funcoes.dialogo('generico',0,'12'+#8,0,false,'S','Control For Windows','Imprimir Pre�o de (1 - Venda, 2 - Compra)?:','1') ;
  if (prec = '*') then exit;

  if prec = '1' then prec := 'p_venda'
    else prec := 'p_compra';

  estoqueZero := funcoes.dialogo('not', 0, 'SN', 20, true, 'S', Application.Title, 'Imprimir Itens Com Estoque Zero (S-Sim, N-N�o) ?', 'S');
  if estoqueZero = '*' then exit;

  if estoqueZero = 'N' then begin
    h4 := ' (quant + deposito > 0) and ';
  end;

  dm.ProdutoQY.Close;
  dm.ProdutoQY.sql.Clear;
  dm.ProdutoQY.SQL.Add('select cod,unid as UN,emb,codbar,nome as DESCRICAO, '+ prec +' as Preco, quant as ESTOQUE,fabric,fornec,grupo from produto where '+h1+' '+h2+' '+h3+' '+h4+' (cod <> -1) order by ' + ordem);
  dm.ProdutoQY.Open;
  dm.ProdutoQY.FetchAll;


 { if (sim = 'S') and (sim <> '*') then
    begin
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((' CODIGO DESCRICAO DO PRODUTO                               QUANT           PRECO'+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-', tam) + #13+#10))));
      dm.ProdutoQY.First;
               funcoes.informacao(1,2,'AGUARDE... ',true,false,2);
               while not dm.ProdutoQY.Eof do
                 begin
                       if funcoes.PerguntasRel(dm.ProdutoQY,'12',true,'','') then
                          begin
                           if form19.RichEdit1.Lines.Count=b then
                            begin
                              b:=b+52;
                              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('-','','-', tam) + #12+#13+#10))));
                              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS ALFABETICA', tam)))));
                              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((' CODIGO DESCRICAO DO PRODUTO                               QUANT           PRECO'+#13+#10))));
                              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-', tam) + #13+#10))));
                            end;

                              funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,false,2);
                              addRelatorioForm19(funcoes.CompletaOuRepete(' ',dm.ProdutoQY.fieldbyname('COD').AsString,'0',7)+' '+funcoes.CompletaOuRepete(LeftStr(dm.ProdutoQY.fieldbyname('DESCRICAO').AsString, 39), '', ' ', 39) + ' ' + funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.000',StrToCurr(dm.ProdutoQY.fieldbyname('estoque').AsString)),' ',16)   + funcoes.CompletaOuRepete(' ',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('PRECO').AsString)),' ',16)+#13+#10);
                              if dm.ProdutoQY.RecNo=dm.ProdutoQY.RecordCount then form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-', tam) + #13+#10))));
                              dm.ProdutoQY.Next;
                        end
                         else dm.ProdutoQY.Next;
end;
end;
  if (sim='N') and (sim<>'*') then begin}

     if sim = 'S' then addRelatorioForm19(' CODIGO DESCRICAO DO PRODUTO                               QUANT           PRECO' + CRLF)
       else form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((' CODIGO DESCRICAO DO PRODUTO                               PRECO     UN    EMB'+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-', tam) + #13+#10))));

      dm.ProdutoQY.First;

      funcoes.informacao(1,2,'AGUARDE... ',true,false,2);
      b := 60;
      while not dm.ProdutoQY.Eof do begin
        if funcoes.PerguntasRel(dm.ProdutoQY,'12',true,'','') then begin
        if form19.RichEdit1.Lines.Count=b then begin
            b:=b+67;
            form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-', tam) + #13+#10))));
            addRelatorioForm19(#12);
            //form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('-','','-', tam) +CRLF))));
            form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((' s ' +funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS ALFABETICA', tam)))));

            if sim = 'S' then addRelatorioForm19(' CODIGO DESCRICAO DO PRODUTO                               QUANT           PRECO' + CRLF)
            else form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((' CODIGO DESCRICAO DO PRODUTO                               PRECO     UN    EMB'+#13+#10))));
            form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-', tam) + #13+#10))));
          end;

          funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,false,2);
          if sim = 'N' then addRelatorioForm19(funcoes.CompletaOuRepete(' ',dm.ProdutoQY.fieldbyname('COD').AsString,'0',7)+' '+funcoes.CompletaOuRepete(LeftStr(dm.ProdutoQY.fieldbyname('DESCRICAO').AsString, 39), '', ' ', 39) +' '+ funcoes.CompletaOuRepete(' ',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('PRECO').AsString)),' ',16) + ' ' + funcoes.CompletaOuRepete('',dm.ProdutoQY.fieldbyname('UN').AsString,' ',6)+ funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('emb').AsString,'',' ',10)+#13+#10)
           else addRelatorioForm19(funcoes.CompletaOuRepete(' ',dm.ProdutoQY.fieldbyname('COD').AsString,'0',7)+' '+funcoes.CompletaOuRepete(LeftStr(dm.ProdutoQY.fieldbyname('DESCRICAO').AsString, 39), '', ' ', 39) + ' ' + funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.000',StrToCurr(dm.ProdutoQY.fieldbyname('estoque').AsString)),' ',16)   + funcoes.CompletaOuRepete(' ',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('PRECO').AsString)),' ',16)+#13+#10);
          //addRelatorioForm19(funcoes.CompletaOuRepete(' ',dm.ProdutoQY.fieldbyname('COD').AsString,'0',7)+' '+funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('DESCRICAO').AsString,FormatCurr('#,###,###0.000',StrToCurr(dm.ProdutoQY.fieldbyname('estoque').AsString)),' ',56)+'     '   + funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('UN').AsString,'',' ',6)+ funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('emb').AsString,'',' ',10)+#13+#10);
          //form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(' ',dm.ProdutoQY.fieldbyname('COD').AsString,' ',7)+' '+funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('DESCRICAO').AsString,FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('PRECO').AsString)),' ',56)+'     '   + funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('UN').AsString,'',' ',6)+ funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('emb').AsString,'',' ',10)+#13+#10))));
          if dm.ProdutoQY.RecNo=dm.ProdutoQY.RecordCount then form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-', tam) +#13+#10))));
          //form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('CODbar').AsString,'',' ',15)+funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('DESCRICAO').AsString,FormatCurr('#,###,###0.000',StrToCurr(dm.ProdutoQY.fieldbyname('estoque').AsString)),' ',52)   +    funcoes.CompletaOuRepete(' ',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('PRECO').AsString)),' ',13)+#13+#10))));
          dm.ProdutoQY.Next;
        end
        else dm.ProdutoQY.Next;
      end;
  //end;
   if not funcoes.Contido('*',grupo+fornec+fabric+sim) then begin
     grupo:='';
     fornec:='';
     fabric:='';

     funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,true,2);
     form19.RichEdit1.SelStart:=1;
     dm.ProdutoQY.Close;


     funcoes.CharSetRichEdit(form19.richedit1);
     form19.ShowModal;
   end;
end;

procedure TForm2.AlfabticaGeralGrfico1Click(Sender: TObject);
var
  sim, prec, h1, h2, h3, h4, ordem, estoqueZero : string;
  tam : integer;
begin
  form19.RichEdit1.Clear;
  b := 80;
  tam := 80;

  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#18+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS ALFABETICA', TAM)))));
  funcoes.PerguntasRel(dm.ProdutoQY,'12',false,'','') ;
  if not funcoes.Contido('*',grupo+fornec+fabric) then
    begin
      sim := funcoes.dialogo('generico',0,'SN'+#8,0,false,'S','Control For Windows','Imprimir Quantidade em Estoque?S/N:','N') ;
    end;
  if (sim = '*') then exit;

  ordem := funcoes.dialogo('generico',0,'123'+#8,0,false,'S','Control For Windows','Qual a Ordem (1-Nome 2-Quant.Cresc 3-Quant.Asc)?:','1') ;
  if ordem = '*' then exit;


  if      ordem = '1' then ordem := ' nome '
  else if ordem = '2' then ordem := ' quant asc '
  else if ordem = '3' then ordem := ' quant desc ';

  h1 := '';
  h2 := '';
  h3 := '';
  h4 := '';

  if fornec <> '' then h1 := ' (fornec = ' + StrNum(fornec) + ') and';
  if grupo  <> '' then h2 := ' (grupo = ' + StrNum(grupo) + ') and';
  if fabric <> '' then h3 := ' (fabric = ' + StrNum(fabric) + ') and';

  prec := funcoes.dialogo('generico',0,'12'+#8,0,false,'S','Control For Windows','Imprimir Pre�o de (1 - Venda, 2 - Compra)?:','1') ;
  if (prec = '*') then exit;

  if prec = '1' then prec := 'p_venda'
    else prec := 'p_compra';

  estoqueZero := funcoes.dialogo('not', 0, 'SN', 20, true, 'S', Application.Title, 'Imprimir Itens Com Estoque Zero (S-Sim, N-N�o) ?', 'S');
  if estoqueZero = '*' then exit;

  if estoqueZero = 'N' then begin
    h4 := ' (quant + deposito > 0) and ';
  end;

  dm.ProdutoQY.Close;
  dm.ProdutoQY.sql.Clear;
  dm.ProdutoQY.SQL.Add('select cod,unid as UN,emb,codbar,nome, '+ prec +' as P_venda, quant,fabric,fornec,grupo from produto where '+h1+' '+h2+' '+h3+' '+h4+' (cod <> -1) order by ' + ordem);
  dm.ProdutoQY.Open;
  dm.ProdutoQY.FetchAll;

  if sim = 'N' then TCurrencyField(dm.ProdutoQY.FieldByName('quant')).DisplayFormat   := '_____________'
  else TCurrencyField(dm.ProdutoQY.FieldByName('quant')).DisplayFormat   := '###,##0.000';

  TCurrencyField(dm.ProdutoQY.FieldByName('p_venda')).DisplayFormat := '###,##0.00';

  imprime1.imprime.RLLabel10.Caption := form22.pgerais.Values['empresa'];
  imprime1.imprime.RLLabel11.Caption := FormatDateTime('dd/mm/yy', form22.datamov);
  imprime1.imprime.RLLabel12.Caption := FormatDateTime('hh:mm:ss', now);
  imprime1.imprime.DataSource1.DataSet := dm.ProdutoQY;
  //imprime1.imprime.RLReport2.PrintDialog := false;
  imprime1.imprime.RLReport2.Preview();

end;

procedure TForm2.Numrica1Click(Sender: TObject);
var sim:string;
begin
  form19.RichEdit1.Clear;
  b:=56;
  dm.ProdutoQY.sql.Clear;
  dm.ProdutoQY.SQL.Add('select cod,unid as UN,emb,codbar,nome as DESCRICAO, p_venda as Preco, quant as ESTOQUE,fabric,fornec,grupo from produto order by cod asc');
  dm.ProdutoQY.Open;

  tread := TTWThreadProdQY.Create(true);
  tread.FreeOnTerminate := true;
  tread.Resume;

  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#18+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS NUMERICA',80)))));
  funcoes.PerguntasRel(dm.ProdutoQY,'12',false,'','') ;

  if not funcoes.Contido('*',grupo+fornec+fabric) then
    begin
      sim:=funcoes.dialogo('generico',0,'SN'+#8,0,false,'S','Control For Windows','Imprimir Quantidade em Estoque?S/N:','N') ;
    end;

if (sim='S') and (sim<>'*') then
begin
   form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((' CODIGO DESCRICAO DO PRODUTO                               QUANT           PRECO'+#13+#10))));
   form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',82)))));

   dm.ProdutoQY.First;
               funcoes.informacao(1,2,'AGUARDE... ',true,false,2);
               while not dm.ProdutoQY.Eof do
                 begin
                   if form19.RichEdit1.Lines.Count=b then
                     begin
                       b:=b+56;
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('-',#12+#13+#10,'-',83)))));
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS NUMERICA',80)))));
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((' CODIGO DESCRICAO DO PRODUTO                               QUANT           PRECO'+#13+#10))));
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',82)))));
                     end;
                   funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,false,2);
                   if funcoes.PerguntasRel(dm.produtoqy,'12',true,'','') then  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',dm.ProdutoQY.fieldbyname('COD').AsString,' ',7)+' '+funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('DESCRICAO').AsString,FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('estoque').AsString)),' ',56)   +  funcoes.CompletaOuRepete(' ',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('PRECO').AsString)),' ',16)+#13+#10))));
                   //form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('CODbar').AsString,'',' ',15)+funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('DESCRICAO').AsString,FormatCurr('#,###,###0.000',StrToCurr(dm.ProdutoQY.fieldbyname('estoque').AsString)),' ',52)   +    funcoes.CompletaOuRepete(' ',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('PRECO').AsString)),' ',13)+#13+#10))));
                   dm.ProdutoQY.Next;

                 end;
end;
if (sim='N') and (sim<>'*') then
begin
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((' CODIGO DESCRICAO DO PRODUTO                               PRECO     UN    EMB'+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',82)))));

  dm.ProdutoQY.First;
               funcoes.informacao(1,2,'AGUARDE... ',true,false,2);
               while not dm.ProdutoQY.Eof do
                 begin
                   if form19.RichEdit1.Lines.Count=b then
                     begin
                       b:=b+56;
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('-',#12+#13+#10,'-',83)))));
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS NUMERICA',80)))));
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((' CODIGO DESCRICAO DO PRODUTO                               PRECO     UN    EMB'+#13+#10))));
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',82)))));
                     end;
                   funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,false,2);
                   if funcoes.PerguntasRel(dm.produtoqy,'12',true,'','') then form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(' ',dm.ProdutoQY.fieldbyname('COD').AsString,' ',7)+' '+funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('DESCRICAO').AsString,FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('PRECO').AsString)),' ',56)+'     '   + funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('UN').AsString,'',' ',6)+ funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('emb').AsString,'',' ',10)+#13+#10))));
                   //form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('CODbar').AsString,'',' ',15)+funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('DESCRICAO').AsString,FormatCurr('#,###,###0.000',StrToCurr(dm.ProdutoQY.fieldbyname('estoque').AsString)),' ',52)   +    funcoes.CompletaOuRepete(' ',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('PRECO').AsString)),' ',13)+#13+#10))));
                   dm.ProdutoQY.Next;
end;
end;
  if not funcoes.Contido('*',grupo+fornec+fabric+sim) then
   begin
     grupo:='';
     fornec:='';
     fabric:='';

     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)))));
     funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,true,2);
     form19.RichEdit1.SelStart:=1;
     dm.ProdutoQY.Close;
     form19.Show;
   end;

end;

procedure TForm2.NumricaPorCodBarras1Click(Sender: TObject);
var sim:string;
begin
  b:=56;
  dm.ProdutoQY.sql.Clear;
  dm.ProdutoQY.SQL.Add('select cod,unid as UN,emb,codbar,nome as DESCRICAO, p_venda as Preco, quant as ESTOQUE,fabric,fornec,grupo from produto order by codbar asc');
  dm.ProdutoQY.Open;


  form19.RichEdit1.Clear;
  funcoes.PerguntasRel(dm.ProdutoQY,'123',false,'','');

  dm.ProdutoQY.First;
  if not funcoes.Contido('*',grupo+fornec+fabric) then
    begin
      sim:=funcoes.dialogo('generico',0,'SN'+#8,0,false,'S','Control For Windows','Imprimir Quantidade em Estoque?S/N:','S') ;
    end;

  if not funcoes.Contido('*',grupo+fornec+fabric+sim) then
    begin
      funcoes.informacao(1,2,'AGUARDE... ',true,false,2);
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS NUMERICA POR CODBARRAS',80)))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('REFERENCIA    DESCRICAO DO PRODUTO                            QUANT        PRECO'+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',82)))));
    end;

  if (sim='S') and (sim<>'*') then
    begin
       while not dm.ProdutoQY.Eof do
         begin
           if form19.RichEdit1.Lines.Count=b then
                begin
                  b:=b+56;
                  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('-',#12+#13+#10,'-',83)))));
                  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS NUMERICA POR CODBARRAS',80)))));
                  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('REFERENCIA    DESCRICAO DO PRODUTO                            QUANT        PRECO'+#13+#10))));
                  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',82)))));
                end;
                //ShowMessage('tentando '+IntToStr(dm.ProdutoQY.RecNo));
                if dm.ProdutoQY.RecNo=dm.ProdutoQY.RecordCount then form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)))));

           if funcoes.PerguntasRel(dm.ProdutoQY,'123',true,'','') then
              begin
                form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('CODbar').AsString,'',' ',15)+funcoes.CompletaOuRepete(copy(dm.ProdutoQY.fieldbyname('DESCRICAO').AsString,1,39),FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('estoque').AsString)),' ',52)   +    funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('PRECO').AsString)),' ',13)+#13+#10))));
                dm.ProdutoQY.Next;
              end
              else dm.ProdutoQY.Next;

           funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,false,2);

     //fim do while not tabela.eof
       end;
    //fim do sim
     end;

    if (sim='N') and (sim<>'*') then
    begin
       while not dm.ProdutoQY.Eof do
         begin
           if form19.RichEdit1.Lines.Count=b then
                begin
                  b:=b+56;
                  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('-',#12+#13+#10,'-',83)))));
                  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS NUMERICA POR CODBARRAS',80)))));
                  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('REFERENCIA    DESCRICAO DO PRODUTO                            QUANT        PRECO'+#13+#10))));
                  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',82)))));
                end;
           if funcoes.PerguntasRel(dm.ProdutoQY,'123',true,'','') then
              begin
                form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('CODbar').AsString,'',' ',15)+funcoes.CompletaOuRepete(copy(dm.ProdutoQY.fieldbyname('DESCRICAO').AsString,1,39),'',' ',52)   +    funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('PRECO').AsString)),' ',13)+#13+#10))));
              end;

           funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,false,2);
           if dm.ProdutoQY.RecNo=dm.ProdutoQY.RecordCount then form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)))));
           dm.ProdutoQY.Next;
     //fim do while not tabela.eof
       end;
    //fim do sim
     end;

    if not funcoes.Contido('*',grupo+fornec+fabric+sim) then
       begin
         grupo:='';
         fornec:='';
         fabric:='';

         funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,true,2);
         form19.RichEdit1.SelStart:=1;
         dm.ProdutoQY.Close;
         form19.Show;
       end;

end;

procedure TForm2.AlfabticaPFornecedor1Click(Sender: TObject);
var fornec:string;
begin
 B:=52;
 fornec := funcoes.dialogo('generico',100,'1234567890'+#8,100,false,'','Control For Windows','Informe o C�digo do Fornecedor:','') ;

          if (fornec<>'') and (fornec<>'*') then
             begin
               dm.ProdutoQY.SQL.Clear;
               dm.ProdutoQY.SQL.Add('select cod as COD,UNID AS UN,codbar,nome as DESCRICAO, p_venda as Preco, quant as ESTOQUE from produto where fornec=:fornec order by nome asc');
               dm.ProdutoQY.ParamByName('fornec').AsString:=fornec;
               dm.ProdutoQY.Open;
             end;

             if (fornec='') and (fornec<>'*')  then
             begin
               dm.ProdutoQY.Close;
               dm.ProdutoQY.SQL.Clear;
               dm.ProdutoQY.SQL.Add('select cod as COD,UNID AS UN,codbar,nome as DESCRICAO, p_venda as Preco, quant as ESTOQUE from produto order by nome asc');
               dm.ProdutoQY.Open;
             end;


           if (fornec<>'*') then
             begin
               FORM19.RichEdit1.Clear;
               dm.ProdutoQY.FetchAll;
               form19.RichEdit1.Clear;
                   form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS ALFABETICA P/ FORNCEDOR',80)))));
                   form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('CODIGO     DESCRICAO DO PRODUTO                              UN            PRECO'+#13+#10))));
                   form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',82)))));
                   //form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(())));



               dm.ProdutoQY.First;
               funcoes.informacao(1,2,'AGUARDE... ',true,false,2);
               while not dm.ProdutoQY.Eof do
                 begin
                   if dm.ProdutoQY.RecNo=b then
                     begin
                       b:=b+52;
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('-',#12+#13+#10,'-',83)))));
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS ALFABETICA P/ FORNCEDOR',80)))));
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('CODIGO     DESCRICAO DO PRODUTO                              UN            PRECO'+#13+#10))));
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',82)))));
                     end;
                   funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,false,2);
                   form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',dm.ProdutoQY.fieldbyname('COD').AsString,' ',7)+'    '+funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('DESCRICAO').AsString,dm.ProdutoQY.fieldbyname('un').AsString,' ',52)   + funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('PRECO').AsString)),' ',17)+#13+#10))));
                   dm.ProdutoQY.Next;
                 end;
               funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,true,2);
               form19.RichEdit1.SelStart:=1;
               dm.ProdutoQY.Close;
               form19.Show;
              end;

 end;

procedure TForm2.EstoqueNegativo1Click(Sender: TObject);
begin
  form19.RichEdit1.Clear;
  b:=56;
  dm.ProdutoQY.sql.Clear;
  dm.ProdutoQY.SQL.Add('SELECT cod,nome,codbar,quant,deposito FROM produto WHERE quant+deposito<0');
  dm.ProdutoQY.Open;

  dm.ProdutoQY.FetchAll;

  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#18+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'RELATORIO DE ITENS COM ESTOQUE NEGATIVO',80)))));

      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('CODIGO COD. DE BARRAS  DESCRICAO                                 LOJA  DEPOSITO'+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',82)))));
      dm.ProdutoQY.First;
               funcoes.informacao(1,2,'AGUARDE... ',true,false,2);
               while not dm.ProdutoQY.Eof do
                 begin
                   if form19.RichEdit1.Lines.Count=b then
                     begin
                       b:=b+56;
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#12+#13+#10,'-',83)))));
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'RELATORIO DE ITENS COM ESTOQUE NEGATIVO',80)))));
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('CODIGO COD. DE BARRAS  DESCRICAO                                 LOJA  DEPOSITO'+#13+#10))));
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',82)))));
                     end;
                     funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,false,2);
                     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',dm.ProdutoQY.fieldbyname('COD').AsString,' ',6)+' '+funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('codbar').AsString,'',' ',16)+funcoes.CompletaOuRepete(copy(dm.ProdutoQY.fieldbyname('nome').AsString,1,37),'',' ',37)   + funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('quant').AsString)),' ',10)+ funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('deposito').AsString)),' ',10)+#13+#10))));
                     if dm.ProdutoQY.RecNo=dm.ProdutoQY.RecordCount then form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',82)))));
                     dm.ProdutoQY.Next;

                 end;

               funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,true,2);
               form19.RichEdit1.SelStart:=1;
               dm.ProdutoQY.Close;
               form19.Show;

end;

procedure TForm2.EstruturarPastaNFCe1Click(Sender: TObject);
var
  dini, dfim, pstaNfe,tmp, sit, NUMFALTA : string;
  dini1, dfim1 : TDate;
  arq, lista : TStringList;
  i1, f1 : integer;
  chav1 : TChaveDetalhes;
  tot, vnf, cancela : currency;
  cont, estad : integer;
begin
  pstaNfe := caminhoEXE_com_barra_no_final + 'NFCE\EMIT\';
  if not DirectoryExists(pstaNfe) then
    begin
      MessageDlg('Este Terminal n�o tem informa��es das Notas Emitidas', mtError, [mbOK], 1);
      exit;
    end;
       {
  dini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?','');
  if dini = '*' then exit;

  dfim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?','');
  if dfim = '*' then exit;  }

  pstaNfe := funcoes.dialogo('normal',0,'',2,true,'',Application.Title,'Qual a Pasta de NFe?', pstaNfe);
  if pstaNfe = '*' then exit;

 // dini1 := StrToDateTime(dini);
 // dfim1 := StrToDateTime(dfim);

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select adic, chave, nota, data from nfce order by CHAVE';
  //dm.IBselect.ParamByName('ini').AsDateTime := dini1;
  //dm.IBselect.ParamByName('fim').AsDateTime := dfim1;
  dm.IBselect.Open;
  dm.IBselect.FetchAll;
  i1 := dm.IBselect.RecordCount;

  cont := 0;
  funcoes.informacao(0, i1, 'Aguarde, Movendo Arquivos...', true, false, 2);

  while not dm.IBselect.Eof do
    begin
      funcoes.informacao(dm.IBselect.RecNo, i1, 'Aguarde, Movendo Arquivos...',false, false, 2);
      if FileExists(caminhoEXE_com_barra_no_final + 'NFCE\EMIT\' + dm.IBselect.FieldByName('chave').AsString + '-nfe.xml') then
        begin
          if DirectoryExists(buscaPastaNFCe(dm.IBselect.FieldByName('chave').AsString, false)) = false then ForceDirectories(buscaPastaNFCe(dm.IBselect.FieldByName('chave').AsString, false));

          MoveFile(pchar(caminhoEXE_com_barra_no_final + 'NFCE\EMIT\' + dm.IBselect.FieldByName('chave').AsString + '-nfe.xml'),
          pchar(buscaPastaNFCe(dm.IBselect.FieldByName('chave').AsString, false) + dm.IBselect.FieldByName('chave').AsString + '-nfe.xml'));
          cont := cont + 1;
        end;

      dm.IBselect.Next;
    end;

  funcoes.informacao(0, i1, 'Aguarde, Movendo Arquivos...', false, true, 2);
  dm.IBselect.Close;
  ShowMessage(IntToStr(cont) + ' NFCes Copiadas!' );
end;

procedure TForm2.ResumoMensal1Click(Sender: TObject);
var
  ini, fim, sim, desp, separa, tmpGru, icm, _COD, adic : string;
  _TOT, _QTD, _FRET, _ICM, QUANT_VENDA, CUSTO, DESCONTO, ENTR_CAIXA1, _TOTAL, AVISTA, tmp, despesas, _ENTDEP, FORNECE : currency;
  _SAIDEP, _RET, _FOR, LIQ, pag, _DESP :currency;
  i, a, fim1, fi   : integer;
  formas, caixaEnt, caixaSai, hisNomes  : TStringList;
  ICM_VENDA : boolean;
begin
  ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(StartOfTheMonth(form22.datamov)));
  if ini = '*' then exit;

  fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?', formatadataddmmyy(endOfTheMonth(form22.datamov)));
  if fim = '*' then exit;

  separa := funcoes.dialogo('generico',0,'12',0,false,'S','Control For Windows','Separar Despesas por (1-Hist�ricos 2-Grupo de Caixa) ?','1');
  if separa = '*' then exit;

  sim := funcoes.dialogo('generico',0,'SN',0,false,'S','Control For Windows','Calcular ICMS Integral Pelas Vendas','N');
  if sim = '*' then exit;

  if sim = 'S' then ICM_VENDA := true
    else ICM_VENDA := false;

  if ICM_VENDA then desp := funcoes.dialogo('numero',0,'',2,true,'S',Application.Title,'Qual o Percentual de Despesa Fixa ?','0,00');
  if desp = '*' then exit;

  _DESP := StrToCurrDef(desp, 0);
  _TOT := 0;
  _QTD        := 0;  _FRET       := 0;
  _RET := 0; _FOR := 0; _ENTDEP := 0; _SAIDEP := 0;  _ICM        := 0;
  DESCONTO    := 0;  ENTR_CAIXA1 := 0;  QUANT_VENDA := 0;  despesas    := 0;  CUSTO       := 0;
  FORNECE  := 0;

  formas     := TStringList.Create;
  caixaSai   := TStringList.Create;
  caixaEnt   := TStringList.Create;
  hisNomes   := TStringList.Create;

  dm.IBQuery2.Close;
  dm.IBQuery2.SQL.Clear;
  dm.IBQuery2.SQL.Add('select frete, basecred, basedeb from produto where cod = :cod');

  if ICM_VENDA then
    begin
      dm.IBselect.Close;
      dm.IBselect.SQL.Clear;
      dm.IBselect.SQL.Add('select i.total as p_total, i.p_venda, i.cod, i.origem, i.quant from item_venda i'+
      ' where ((i.data >= :dini) and (i.data <= :dfim)) and (i.cancelado = 0) order by i.cod');
      dm.IBselect.ParamByName('dini').AsDate := StrToDate(ini);
      dm.IBselect.ParamByName('dfim').AsDate := StrToDate(fim);
      dm.IBselect.Open;

      dm.IBselect.FetchAll;
      dm.IBselect.First;
      fi := dm.IBselect.RecordCount;
      funcoes.informacao(0, fi, 'Aguarde, Gerando Relat�rio...', true, false, 5);
      i := 0;

      _COD := dm.IBselect.fieldbyname('cod').AsString;
      while true do //varre os produtos da venda
        begin
          funcoes.informacao(dm.IBselect.RecNo, fi, 'Aguarde, Gerando Relat�rio...', false, false, 5);
          if dm.IBselect.Eof then break;

          IF dm.IBselect.fieldbyname('cod').AsString = _COD then
            begin
              IF not dm.IBselect.fieldbyname('cod').AsInteger = 3 then  //SE E CUMPRIMENTO DE REQUISICAO
                begin
                  _TOT := _TOT + dm.IBselect.fieldbyname('p_total').AsCurrency;
                  _QTD := _QTD + dm.IBselect.fieldbyname('p_compra').AsCurrency;
                end;
              dm.IBselect.Next;
            end
          else
            begin
              dm.IBQuery2.Close;
              dm.IBQuery2.ParamByName('cod').AsString  := dm.IBselect.fieldbyname('cod').AsString; //produto
              dm.IBQuery2.Open;

              if not dm.IBQuery2.IsEmpty then
                begin
                  _FRET := _FRET + ((_QTD * dm.IBQuery2.fieldbyname('frete').AsCurrency) / 100); //FRETE PELO CAD. PRODUTO
                  _QTD  := ((_QTD * dm.IBQuery2.fieldbyname('basecred').AsCurrency) / 100);      //TOTAL CREDITO ICMS
                  _TOT  := (_TOT * dm.IBQuery2.fieldbyname('basedeb').AsCurrency) / 100;         //TOTAL DEBITO ICMS
                  _TOT  := _TOT - _QTD;                                                          //ICMS TOTAL A PAGAR
                  _ICM  := _ICM + _TOT;                                                          //ACUMULA NO TOTAL GERAL
                end;

              _COD := dm.IBselect.fieldbyname('cod').AsString;
              _QTD := 0;
              _TOT := 0;
            end; //ELSE _COD <> dm.IBselect.fieldbyname('cod').AsString;
        end; //WHILE TRUE
    end//if ICM_VENDA
  else funcoes.informacao(0, fi, 'Aguarde, Gerando Relat�rio...', true, false, 5);

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select v.nota, v.total, v.desconto, v.entrada, v.codhis, i.p_compra, i.total as p_total, i.p_venda, i.cod,'+
  ' i.quant from venda v, item_venda i where ((v.data >= :dini) and (v.data <= :dfim)) and (v.cancelado = 0) and (v.nota = i.nota) order by v.nota');
  dm.IBselect.ParamByName('dini').AsDate := StrToDate(ini);
  dm.IBselect.ParamByName('dfim').AsDate := StrToDate(fim);
  dm.IBselect.Open;

  dm.IBselect.FetchAll;
  dm.IBselect.First;
  fi := dm.IBselect.RecordCount;

  i := 0;
  funcoes.informacao(i, fi, 'Aguarde, Gerando Relat�rio...', false, false, 5);
  Application.ProcessMessages;

  DESCONTO := DESCONTO + dm.IBselect.fieldbyname('desconto').AsCurrency;

  formas.Values[dm.IBselect.fieldbyname('codhis').AsString] := CurrToStr(StrToCurrDef(formas.Values[dm.IBselect.fieldbyname('codhis').AsString], 0) + dm.IBselect.fieldbyname('total').AsCurrency );
  nota     := dm.IBselect.fieldbyname('nota').AsString;
  while not dm.IBselect.Eof do
    begin
      funcoes.informacao(dm.IBselect.RecNo, fi, 'Aguarde, Gerando Relat�rio...', false, false, 5);

      if nota <> dm.IBselect.fieldbyname('nota').AsString then
        begin
          nota     := dm.IBselect.fieldbyname('nota').AsString;

          if dm.IBselect.fieldbyname('entrada').AsCurrency <> 0 then
            begin
              formas.Values['1'] := CurrToStr(StrToCurrDef(formas.Values['1'], 0) + (dm.IBselect.fieldbyname('entrada').AsCurrency));
              formas.Values[dm.IBselect.fieldbyname('codhis').AsString] := CurrToStr(StrToCurrDef(formas.Values[dm.IBselect.fieldbyname('codhis').AsString], 0) + (dm.IBselect.fieldbyname('total').AsCurrency - dm.IBselect.fieldbyname('entrada').AsCurrency));
            end
          else
            begin
              //aqui adiciona a forma de pagamento e o valor no stringlist
              formas.Values[dm.IBselect.fieldbyname('codhis').AsString] := CurrToStr(StrToCurrDef(formas.Values[dm.IBselect.fieldbyname('codhis').AsString], 0) + (dm.IBselect.fieldbyname('total').AsCurrency));
            end;
        end;


      CUSTO := CUSTO + (dm.IBselect.fieldbyname('p_compra').AsCurrency);

      dm.IBselect.Next;
    end;


  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select codgru, codhis, entrada, saida, formpagto from caixa where (cast(data as date) >= :dini) and ( cast(data as date) <= :dfim) and (not historico like ' + QuotedStr('%VENDAS DO%') + ')');
  dm.IBselect.ParamByName('dini').AsDateTime := StrToDateTimeDef(ini, form22.datamov);
  dm.IBselect.ParamByName('dfim').AsDateTime := StrToDateTimeDef(fim, form22.datamov);
  dm.IBselect.Open;
  dm.IBselect.FetchAll;

  fi := dm.IBselect.RecordCount;
  i := 0;

  if separa = '1' then tmpGru := 'codhis'
   else tmpGru := 'codgru';

  while not dm.IBselect.Eof do
    begin
      funcoes.informacao(dm.IBselect.RecNo, fi, 'Aguarde, Gerando Relat�rio...', false, false, 5);
      ENTR_CAIXA1 := ENTR_CAIXA1 + (dm.IBselect.fieldbyname('entrada').AsCurrency);

      caixaEnt.Values[dm.IBselect.fieldbyname(tmpGru).AsString] :=  CurrToStr(StrToCurrDef(caixaEnt.Values[dm.IBselect.fieldbyname(tmpGru).AsString], 0) + dm.IBselect.fieldbyname('entrada').AsCurrency);
      caixaSai.Values[dm.IBselect.fieldbyname(tmpGru).AsString] :=  CurrToStr(StrToCurrDef(caixaSai.Values[dm.IBselect.fieldbyname(tmpGru).AsString], 0) + dm.IBselect.fieldbyname('saida').AsCurrency);

      dm.IBselect.Next;
    end;

  AVISTA := 0;
  _TOTAL := 0;

  dm.IBselect.Close;
  dm.IBQuery2.Close;
  dm.IBQuery3.Close;

  form19.RichEdit1.Clear;
  addRelatorioForm19(funcoes.RelatorioCabecalho(form22.Pgerais.Values['empresa'], 'RESUMO MENSAL DE: ' + INI + ' A ' + FIM, 80));
  addRelatorioForm19('  ' + #13 + #10);

  fi := formas.Count -1;

  for i := 0 to fi do
    begin
      ini := formas.Names[i];
      if ini = '1' then
        begin
          AVISTA := AVISTA + StrToCurrDef(formas.Values[ini], 0);
        end;

      _TOTAL := _TOTAL + StrToCurrDef(formas.Values[ini], 0);

      dm.IBQuery2.Close;
      dm.IBQuery2.SQL.Clear;
      dm.IBQuery2.SQL.Add('select nome from FORMPAGTO where cod = :cod');
      dm.IBQuery2.ParamByName('cod').AsString := ini;
      dm.IBQuery2.Open;

      addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.CompletaOuRepete('', ini, ' ', 3) + ' - ' + funcoes.CompletaOuRepete(dm.IBQuery2.fieldbyname('nome').AsString, '', ' ', 15), '', ' ', 34) + '=>' + funcoes.CompletaOuRepete('', formataCurrency(StrToCurrDef(formas.Values[ini], 0)), ' ', 24) + CRLF);
    end;

  dm.IBQuery2.Close;
  addRelatorioForm19('  ' + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL GERAL DAS VENDAS            => ', FormatCurr('#,###,###0.00', _TOTAL), ' ', 60) + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('VENDAS A VISTA                    => ', FormatCurr('#,###,###0.00', AVISTA), ' ', 60) + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('VENDAS A PRAZO                    => ', FormatCurr('#,###,###0.00', _TOTAL - AVISTA), ' ', 60) + #13 + #10);
  addRelatorioForm19('  ' + #13 + #10);


   if separa = '1' then tmpGru := 'hiscaixa'
     else tmpGru := 'grupodecaixa';

   funcoes.iniciaDataset(dm.ibquery2, 'select cod, grupo from '+ tmpGru + ' order by cod');
   dm.IBQuery2.Open;

   //aqui cria o stringList com cod e nomes dos historicos
   while not dm.IBQuery2.Eof do
     begin
       hisNomes.Values[dm.IBQuery2.FieldByName('cod').AsString] := dm.IBQuery2.FieldByName('grupo').AsString;
       dm.IBQuery2.Next;
     end;
   dm.IBQuery2.Close;

   //aqui verifica se existe um historico que foi deletado e adiciona na lista de historicos
   fi := caixaSai.Count -1;
   for i := 0 to fi do
     begin
       if hisNomes.Values[caixasai.Names[i]] = '' then
         begin
           hisNomes.Values[caixasai.Names[i]] := 'DESCONHECIDO';
         end;
     end;

   IF _DESP <> 0 then
     begin
       hisNomes.Values['9999'] := 'DESPESA FIXA';
       caixaSai.Values['9999'] := CurrToStr((_TOTAL * _DESP)/100);
     end;

  if caixaSai.Count > 0 then
    begin
      addRelatorioForm19(funcoes.CompletaOuRepete('DESPESAS:                         ', '', ' ', 60) + CRLF);
      addRelatorioForm19('  ' + CRLF);

   {   dm.IBselect.Close;
      dm.IBselect.SQL.Clear;
      dm.IBselect.SQL.Add('select grupo from '+ tmpGru +' where cod = :cod');
    }

      fi := hisNomes.Count -1;
      for i := 0 to fi do
        begin
          ini := hisNomes.Names[i];
          fim := hisNomes.Values[ini];

          IF ICM_VENDA then
            begin
              if (funcoes.Contido('ICMS', fim)) OR (funcoes.Contido('IMPOSTO ESTADUAL', fim)) then caixaSai.Values[ini] := CurrToStr(_ICM);
              if (funcoes.Contido('FRETE', fim)) then caixaSai.Values[ini] := CurrToStr(_FRET);
            end
          ELSE
            begin
              IF (funcoes.Contido('ICMS', fim)) OR (funcoes.Contido('IMPOSTO ESTADUAL', fim)) then _ICM := StrToCurrDef(caixaSai.Values[ini], 0);
              IF (funcoes.Contido('FRETE', fim))then _FRET := StrToCurrDef(caixaSai.Values[ini], 0);
            end;

          _ENTDEP  := _ENTDEP + IfThen(Copy(fim, 1, 8) = 'DEPOSITO', StrToCurrDef(caixaEnt.Values[ini], 0), 0);
          _SAIDEP  := _SAIDEP + IfThen(Copy(fim, 1, 8) = 'DEPOSITO', StrToCurrDef(caixaSai.Values[ini], 0), 0);
          _RET     := _RET    + IfThen(Copy(fim, 1, 8) = 'RETIRADA', StrToCurrDef(caixaSai.Values[ini], 0), 0);
          _RET     := _RET    + IfThen(Copy(fim, 1, 5) = 'SAQUE',    StrToCurrDef(caixaSai.Values[ini], 0), 0);
          _FOR     := _FOR    + IfThen(ini = '101',     StrToCurrDef(caixaSai.Values[ini], 0), 0);
          //FORNECE  := FORNECE + IfThen(ini = '101', StrToCurrDef(caixaSai.Values[ini], 0), 0);

          if (StrToCurrDef(caixaSai.Values[ini], 0) <> 0) and (copy(fim, 1, 6) <> 'VENDAS') then
            begin
              adic := ' (' + formataCurrency(StrToCurrDef(caixaSai.Values[ini], 0) / IfThen(ConfParamGerais[25] = '3', _TOTAL,  CUSTO) * 100) + '% DE ' + formataCurrency(IfThen(ConfParamGerais[25] = '3', _TOTAL,  CUSTO)) + ' )';
              addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.CompletaOuRepete('', ini, ' ' , 7) + ' - ' + funcoes.CompletaOuRepete(copy(fim,1,25), '', ' ', 25), '', ' ', 35) + '=>' + funcoes.CompletaOuRepete('', formataCurrency(StrToCurrDef(caixaSai.Values[ini], 0)), ' ', 15) + adic + CRLF);

              if (StrToCurrDef(caixaSai.Values[ini], 0) <> 0) and (copy(fim, 1, 6) <> 'VENDAS') and (ini <> '101') and (LeftStr(fim, 8) <> 'RETIRADA') and
              (LeftStr(fim, 8) <> 'DEPOSITO') and (LeftStr(fim, 5) <> 'SAQUE') then
                begin
                  despesas := despesas + StrToCurrDef(caixaSai.Values[ini], 0);
                  //ShowMessage(caixaSai.Values[ini] + '=' + CurrToStr(despesas));
                end;
            end;
        end;

      addRelatorioForm19('  ' + CRLF);
    end;

  //despesas := despesas - _SAIDEP - _RET - _ICM - FORNECE;
  //despesas := despesas - _SAIDEP - _RET;
  ENTR_CAIXA1 := ENTR_CAIXA1 - _ENTDEP;
  //pag := _FOR + _FRET + _ICM;

  addRelatorioForm19(funcoes.CompletaOuRepete('INFORMACOES:                         ', '', ' ', 60) + #13 + #10);
  addRelatorioForm19('  ' + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL VENDAS A VISTA              => ', FormatCurr('#,###,###0.00', AVISTA), ' ', 60) + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('OUTRAS ENTRADAS EM CAIXA          => ', FormatCurr('#,###,###0.00', ENTR_CAIXA1), ' ', 60) + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL DE ENTRADAS                 => ', FormatCurr('#,###,###0.00', ENTR_CAIXA1 + AVISTA), ' ', 60) + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL GERAL DAS DESPESAS          => ', FormatCurr('#,###,###0.00', despesas), ' ', 60) + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('PAGTO FORNECEDOR/FRETE/ICMS       => ', FormatCurr('#,###,###0.00', _FOR + _FRET + _ICM), ' ', 60) + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('LUCRO BRUTO SOBRE VENDAS          => ', FormatCurr('#,###,###0.00', _TOTAL - CUSTO), ' ', 60) + #13 + #10);
  IF (_ENTDEP <> 0) OR (_SAIDEP <> 0) then addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL DEPOSITOS                   => ', formataCurrency(_ENTDEP) + ' => ' + formataCurrency(_SAIDEP), ' ', 60) + #13 + #10);

  addRelatorioForm19(funcoes.CompletaOuRepete('SALDO PERIODO (ENTRADAS-DESPESAS) => ' + formataCurrency(ENTR_CAIXA1 + AVISTA - despesas) + ' => ' + formataCurrency((ENTR_CAIXA1 + AVISTA - despesas) / IfThen(ConfParamGerais[25] = '3', _TOTAL,  CUSTO) * 100) + '%', '', ' ', 70) + #13 + #10);

  addRelatorioForm19('  ' + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('LUCRO LIQUIDO:                       ', '', ' ', 60) + #13 + #10);
  addRelatorioForm19('  ' + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL DAS VENDAS                  => ', FormatCurr('#,###,###0.00', _TOTAL), ' ', 60) + '+' + #13 + #10) ;
  addRelatorioForm19(funcoes.CompletaOuRepete('CUSTO DA MERCADORIA VENDIDA       => ', FormatCurr('#,###,###0.00', CUSTO), ' ', 60) + '- ' + formataCurrency(Arredonda((CUSTO)/(_TOTAL)*100, 2)) + '%' + #13 + #10);

  LIQ := _TOTAL - CUSTO - despesas;

  if ICM_VENDA then
    begin
      addRelatorioForm19(funcoes.CompletaOuRepete('FRETE DA MERCADORIA VENDIDA       => ', FormatCurr('#,###,###0.00', _FRET), ' ', 60) + '-'+ #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete('ICMS  DA MERCADORIA VENDIDA       => ', FormatCurr('#,###,###0.00', _ICM), ' ', 60) + '-'+ #13 + #10);
    end
  else
    begin
      addRelatorioForm19(funcoes.CompletaOuRepete('FRETE PAGO DURANTE O PERIODO      => ', FormatCurr('#,###,###0.00', _FRET), ' ', 60) + '-'+ #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete('ICMS  PAGO DURANTE O PERIODO      => ', FormatCurr('#,###,###0.00', _ICM), ' ', 60) + '-'+ #13 + #10);
    end;

  fim := ' (' + formataCurrency((despesas)/(_TOTAL)*100) + '% DE ' + formataCurrency(_TOTAL) + ')';
  addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL DE ENCARGOS                 => ' + formataCurrency(despesas) + '- '+ fim, '', ' ', 80) + #13 + #10 + CRLF);
 // addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL DE ENCARGOS                 => ' + formataCurrency(despesas - pag) + '- '+ fim, '', ' ', 80) + #13 + #10 + CRLF);

  fim := ' => ' + formataCurrency((LIQ)/ IfThen(ConfParamGerais[25] = '3', _TOTAL,  CUSTO) * 100) + '%' ;
  addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL LUCRO LIQUIDO               => ', FormatCurr('#,###,###0.00', LIQ), ' ', 60) + fim + #13 + #10);
  addRelatorioForm19('  ' + #13 + #10);

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('SELECT SUM(QUANT * P_COMPRA) AS QUANT_COMPRA, SUM(QUANT * P_VENDA) AS QUANT_VENDA, SUM(DEPOSITO * P_VENDA) AS DEP_VENDA, SUM(DEPOSITO * P_COMPRA) AS DEP_COMPRA FROM PRODUTO');
  dm.IBselect.Open;

  addRelatorioForm19(funcoes.CompletaOuRepete('ESTOQUE  LIQUIDO CUSTO            => ', FormatCurr('#,###,###0.00', dm.IBselect.fieldbyname('quant_compra').AsCurrency), ' ', 60) + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('ESTOQUE  LIQUIDO VENDA            => ', FormatCurr('#,###,###0.00', dm.IBselect.fieldbyname('quant_venda').AsCurrency), ' ', 60) + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('DEPOSITO LIQUIDO CUSTO            => ', FormatCurr('#,###,###0.00', dm.IBselect.fieldbyname('dep_compra').AsCurrency), ' ', 60) + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('DEPOSITO LIQUIDO VENDA            => ', FormatCurr('#,###,###0.00', dm.IBselect.fieldbyname('dep_venda').AsCurrency), ' ', 60) + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL    LIQUIDO CUSTO            => ', FormatCurr('#,###,###0.00', dm.IBselect.fieldbyname('quant_compra').AsCurrency + dm.IBselect.fieldbyname('dep_compra').AsCurrency), ' ', 60) + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL    LIQUIDO VENDA            => ', FormatCurr('#,###,###0.00', dm.IBselect.fieldbyname('quant_venda').AsCurrency + dm.IBselect.fieldbyname('dep_venda').AsCurrency), ' ', 60) + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 80) + #13 + #10);

  funcoes.informacao(0, fi, 'Aguarde, Gerando Relat�rio...', false, true, 5);
  caixaEnt.Free;
  caixaSai.Free;
  hisNomes.Free;
  dm.IBselect.Close;
  form19.ShowModal;
end;

procedure TForm2.AlfabticaPFornecedor2Click(Sender: TObject);
var
 sim, imp_pre, H2, h1 : string;
begin
  h1 := ''; h2 := '';
  grupo := funcoes.dialogo('generico',100,'1234567890'+#8,100,false,'','Control For Windows','Se Deseja Separa��o por GRUPO, Informe um C�d.:','') ;
  if grupo = '*' then exit;

  if grupo <> '' then h1 := ' and (grupo = '+StrNum(grupo)+')';

  fornec := funcoes.dialogo('generico',100,'1234567890'+#8,100,false,'','Control For Windows','Se Deseja Separa��o por FORNECEDOR, Informe um C�d.:','') ;
  if fornec = '*' then exit;

  if fornec <> '' then h2 := ' and (fornec = '+StrNum(fornec)+')';


  sim := funcoes.dialogo('generico',0,'SN'+#8,0,false,'S','Control For Windows','Imprimir Quantidade em Estoque?S/N:','N') ;
  if sim = '*' then exit;

  imp_pre := funcoes.dialogo('generico',0,'12',0,false,'S','Control For Windows','Imprimir Pre�o (1-Varejo 2-Atacado)?','1') ;
  if imp_pre = '*' then exit;

  b := 98;
  form19.RichEdit1.Clear;
  addRelatorioForm19('|' + #15 + '|' + CRLF);
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS ALFABETICA PARA CONFERENCIA',132)))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('CODIGO  DESCRICAO DO PRODUTO                    |  ESTOQUE       |   PRECO        | ENTRADAS          | SAIDAS                      |'+#13+#10))));
  addRelatorioForm19(funcoes.CompletaOuRepete('-','','-',132) + CRLF);
  //if not funcoes.grelatoriocima('select cod,codbar,nome as DESCRICAO, p_venda as Preco, quant as ESTOQUE from produto where grupo=:grupo order by nome asc ','select cod,codbar,nome as DESCRICAO, p_venda as Preco, quant as ESTOQUE from produto where fornec=:fornec order by nome asc','','select cod,codbar,nome as DESCRICAO, p_venda as Preco, quant as ESTOQUE from produto where grupo=:grupo and fornec=:fornec order by nome asc','select cod,codbar,nome as DESCRICAO, p_venda as Preco, quant as ESTOQUE from produto order by nome asc',funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS NUMERICA /S CODBARRAS',132),funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS ALFABETICA PARA CONFERENCIA',
  //'CODIGO  DESCRICAO DO PRODUTO                         ESTOQUE          PRECO     ENTRADAS   SAIDAS') then

  if Grupo <> '' then grupo := '(grupo = ' + StrNum(grupo) + ')';

  dm.ProdutoQY.Close;
  dm.ProdutoQY.SQL.Text := 'select cod,unid as UN,emb,codbar,nome as DESCRICAO, '+ IfThen(imp_pre = '1', 'p_venda', 'p_venda1') +' as Preco, quant as ESTOQUE,fabric,fornec,grupo from produto where (cod > 0) ' + h1 + h2 + ' order by nome';
  dm.ProdutoQY.Open;
  dm.ProdutoQY.FetchAll;

  dm.ProdutoQY.First;
  funcoes.informacao(1,2,'AGUARDE... ',true,false,2);
  while not dm.ProdutoQY.Eof do
    begin
      if form19.RichEdit1.Lines.Count >= b then
        begin
          b := b + 98;
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('-','','-',132) + CRLF + ' '))));
          addRelatorioForm19('|' + #12 + '|');

          addRelatorioForm19(CRLF + CRLF + CRLF + CRLF);

          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS ALFABETICA PARA CONFERENCIA',132)))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('CODIGO  DESCRICAO DO PRODUTO                    |  ESTOQUE       |   PRECO        | ENTRADAS          | SAIDAS                      |'+#13+#10))));
          addRelatorioForm19(funcoes.CompletaOuRepete('-','','-',132) + CRLF);
        end;

      funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,false,2);
      try
        addRelatorioForm19(funcoes.CompletaOuRepete('',dm.ProdutoQY.fieldbyname('COD').AsString,'0',6) + '  ' + funcoes.CompletaOuRepete(LeftStr(dm.ProdutoQY.fieldbyname('DESCRICAO').AsString, 39),'|','_',41)   + funcoes.CompletaOuRepete('',IfThen(sim = 'S' ,FormatCurr('#,###,###0.000',StrToCurr(dm.ProdutoQY.fieldbyname('estoque').AsString)), '') +' |',IfThen(sim = 'S', ' ', '_'),17)+   funcoes.CompletaOuRepete(' ',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('PRECO').AsString))+' |',' ',17)+funcoes.CompletaOuRepete('_','|','_',20)+funcoes.CompletaOuRepete('_','|','_',30)+ CRLF);
        addRelatorioForm19(funcoes.CompletaOuRepete('|','|',' ',49)+funcoes.CompletaOuRepete(' ','|',' ',17)+funcoes.CompletaOuRepete(' ','|',' ',17)+funcoes.CompletaOuRepete(' ','|',' ',20)+funcoes.CompletaOuRepete(' ','|',' ',30)+ CRLF);
      except
      end;

    dm.ProdutoQY.Next;
  end;

  addRelatorioForm19(funcoes.CompletaOuRepete('-','','-',132) + CRLF);

  funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,true,2);
  form19.RichEdit1.SelStart:=1;
  dm.ProdutoQY.Close;
  form19.Show;
end;

procedure TForm2.Consultas1Click(Sender: TObject);
var
  sim, sql : String;
begin
  {dm.produto.close;
  dm.produto.SQL.Clear;
  try
    sim := ConfParamGerais.Strings[43];
  except
    sim := 'N';
  end;

  if sim = 'S' then
    begin
      dm.produto.SQL.Add('select cod,nome as Descricao,p_venda as Preco,quant as estoque,refori as '+ refori1 +',deposito,unid,codbar,aplic as Aplicacao,localiza as Localizacao,igual as Equivalente, p_compra as custo from produto order by nome asc;');
      sql := 'select cod,nome as Descricao,p_venda as Preco,quant as estoque,refori as '+ refori1 +',deposito,unid,codbar,aplic as Aplicacao,localiza as Localizacao,igual as Equivalente, p_compra as custo from produto';
    end
   else
     begin
       dm.produto.SQL.Add('select cod,nome as Descricao,p_venda as Preco,quant as estoque,refori as '+ refori1 +',deposito,unid,codbar,aplic as Aplicacao,localiza as Localizacao,igual as Equivalente from produto order by nome asc;');
       sql := 'select cod,nome as Descricao,p_venda as Preco,quant as estoque,refori as '+ refori1 +',deposito,unid,codbar,aplic as Aplicacao,localiza as Localizacao,igual as Equivalente from produto';
     end;
  dm.produto.Open;

  funcoes.FormataCampos(dm.produto,2,'ESTOQUE',3);}


  { if ConfParamGerais.Strings[17] = 'S' then
     begin
       dm.produto.close;
       dm.produto.SQL.Clear;
       dm.produto.SQL.Add('select codbar,nome as Descricao,p_venda as preco,quant as estoque,refori as '+ refori1 +',deposito,unid,cod,aplic as Aplicacao,localiza as Localizacao,igual as Equivalente from produto order by nome asc;');
       dm.produto.Open;

       sql := 'select codbar,nome as Descricao,p_venda as preco,quant as estoque,refori as '+ refori1 +',deposito,unid,cod,aplic as Aplicacao,localiza as Localizacao,igual as Equivalente from produto';
     end;}


   //form24 := tform24.Create(self);
   funcoes.CtrlResize(tform(form24));
   form24.BuscaCOd := (codUlt);
   form24.sqlVenda := sql;
   form24.ShowModal;
   //form24.Free;
end;

procedure TForm2.NumricaSemCodBarras1Click(Sender: TObject);
var sim:string;
begin
  b:=56;
  dm.ProdutoQY.sql.Clear;
  dm.ProdutoQY.SQL.Add('select cod,unid as UN,emb,codbar,nome as DESCRICAO, p_venda as Preco, quant as ESTOQUE,fabric,fornec,grupo from produto where codbar = '+QuotedStr('')+ ' order by nome asc');
  dm.ProdutoQY.Open;
  dm.ProdutoQY.FetchAll;
  form19.RichEdit1.Clear;

  funcoes.PerguntasRel(dm.ProdutoQY,'12',false,'','');

  if funcoes.Contido('*',grupo + fornec + fabric) then exit;

  sim := funcoes.dialogo('generico',0,'SN'+#8,0,false,'S','Control For Windows','Imprimir Quantidade em Estoque?S/N:','N') ;
  if sim = '*' then
    begin
      dm.ProdutoQY.Close;
      exit;
    end;


  if sim = 'S' then
    begin
      funcoes.informacao(1,2,'AGUARDE... ',true,false,2);
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS NUMERICA POR CODBARRAS',80)))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('CODBAR         DESCRICAO DO PRODUTO                         QUANT          PRECO'+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',82)))));

      dm.ProdutoQY.First;
      while not dm.ProdutoQY.Eof do
        begin
          if dm.ProdutoQY.RecNo=b then
            begin
              b := b + 56;
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('-',#12+#13+#10,'-',83)))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS NUMERICA POR CODBARRAS',80)))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('CODBAR         DESCRICAO DO PRODUTO                         QUANT          PRECO'+#13+#10))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',82)))));
            end;

          if funcoes.PerguntasRel(dm.ProdutoQY,'12',true,'','') then
            begin
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',dm.ProdutoQY.fieldbyname('COD').AsString,' ',7)+'        '+funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('DESCRICAO').AsString,FormatCurr('#,###,###0.000',StrToCurr(dm.ProdutoQY.fieldbyname('estoque').AsString)),' ',52)   +    funcoes.CompletaOuRepete(' ',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('PRECO').AsString)),' ',13)+#13+#10))));
            end;

          funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,false,2);
          dm.ProdutoQY.Next;
        end;
    end
  else
    begin
      funcoes.informacao(1,2,'AGUARDE... ',true,false,2);
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS NUMERICA S/ CODBARRAS',80)))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((' CODIGO DESCRICAO DO PRODUTO                               PRECO     UN    EMB'+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',82)))));

      dm.ProdutoQY.First;
      while not dm.ProdutoQY.Eof do
        begin
          if dm.ProdutoQY.RecNo=b then
            begin
              b := b + 56;
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('-',#12+#13+#10,'-',83)))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS NUMERICA POR CODBARRAS',80)))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('CODBAR         DESCRICAO DO PRODUTO                         QUANT          PRECO'+#13+#10))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',82)))));
            end;

          if funcoes.PerguntasRel(dm.produtoqy,'12',true,'','') then form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(' ',dm.ProdutoQY.fieldbyname('COD').AsString,' ',7)+' '+funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('DESCRICAO').AsString,FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('PRECO').AsString)),' ',56)+'     '   + funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('UN').AsString,'',' ',6)+ funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('emb').AsString,'',' ',10)+#13+#10))));

          funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,false,2);
          dm.ProdutoQY.Next;

        end;
    end;

    fornec := '';
    fabric := '';
    grupo := '';

    funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,true,2);
    form19.RichEdit1.SelStart := 1;
    dm.ProdutoQY.Close;
    form19.Show;

end;

procedure TForm2.AlfabticaPFornecedor3Click(Sender: TObject);
var sim:string;
begin
  b:=88;
  form19.RichEdit1.Clear;
  //form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#15+#13))));
  addRelatorioForm19('|' + #15 + '|' + CRLF);
  if not funcoes.grelatoriocima('select cod,sugestao,p_compra,codbar,nome as DESCRICAO, p_venda as Preco, quant as ESTOQUE from produto where grupo=:grupo order by nome asc ','select cod,sugestao,p_compra,codbar,nome as DESCRICAO, p_venda as Preco, quant as ESTOQUE from produto where fornec=:fornec order by nome asc','','select cod,sugestao,p_compra,codbar,nome as DESCRICAO, p_venda as Preco, quant as ESTOQUE from produto where grupo=:grupo and fornec=:fornec order by nome asc','select cod,sugestao,p_compra,codbar,nome as DESCRICAO, p_venda as Preco, quant as ESTOQUE from produto order by nome asc',funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS  ALFABETICA PARA COMPRAS',131),funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS  ALFABETICA PARA COMPRAS',
  'CODIGO  DESCRICAO DO PRODUTO                         ESTOQUE          PRECO     ENTRADAS   SAIDAS') then
    begin
     sim:=funcoes.dialogo('generico',0,'SN'+#8,0,false,'S','Control For Windows','Imprimir Quantidade em Estoque?S/N:','N') ;
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('REFERENCIA     | DESCRICAO DO PRODUTO                |  PRECO 1 |  PRECO 2 |  PRECO 3 | PRECO 4  | P. COMPRA| QUANT.   | SUGESTAO |' +#13+#10))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','|'+#13+#10,'-',133)))));

     if (sim='S') and (sim<>'*') then
       begin
         dm.ProdutoQY.First;
         funcoes.informacao(1,2,'AGUARDE... ',true,false,2);
           while not dm.ProdutoQY.Eof do
             begin
               if form19.RichEdit1.Lines.Count>=b then
                 begin
                   b:=b+88;
                   form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('-',#4+#12+#13+#10,'-',134)))));
                   form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS  ALFABETICA PARA COMPRAS',131)))));
                   form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('REFERENCIA     | DESCRICAO DO PRODUTO                |  PRECO 1 |  PRECO 2 |  PRECO 3 | PRECO 4  | P. COMPRA| QUANT.   | SUGESTAO |'+#13+#10))));
                   form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',132)))));
                 end;
             funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,false,2);
            form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','|',' ',16)+funcoes.CompletaOuRepete(copy(dm.ProdutoQY.fieldbyname('DESCRICAO').AsString,1,37),'|',' ',38)   + funcoes.CompletaOuRepete('','|','_',11)+ funcoes.CompletaOuRepete('','|','_',11)+ funcoes.CompletaOuRepete('','|','_',11)+ funcoes.CompletaOuRepete('','|','_',11)+ funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('P_compra').AsString))+'|',' ',11)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('estoque').AsString))+'|',' ',11)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('sugestao').AsString))+'|',' ',11)+#13+#10))));
             form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(' ','|',' ',16)+funcoes.CompletaOuRepete(' ','|',' ',38)+funcoes.CompletaOuRepete(' ','|',' ',11)+funcoes.CompletaOuRepete(' ','|',' ',11)+funcoes.CompletaOuRepete(' ','|',' ',11)+funcoes.CompletaOuRepete(' ','|',' ',11)+funcoes.CompletaOuRepete(' ','|',' ',11)+funcoes.CompletaOuRepete(' ','|',' ',11)+funcoes.CompletaOuRepete(' ','|',' ',11)+#13+#10))));
             if dm.ProdutoQY.RecNo=dm.ProdutoQY.RecordCount then form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',132)))));
             dm.ProdutoQY.Next;

       end;
    funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,true,2);
    form19.RichEdit1.SelStart:=1;
    form19.Show;
end
  else if (sim='N') and (sim<>'*') then
    begin
      dm.ProdutoQY.First;
      funcoes.informacao(1,2,'AGUARDE... ',true,false,2);
        while not dm.ProdutoQY.Eof do
          begin
            dm.ProdutoQY.FetchAll;
            funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,false,2);
            if form19.RichEdit1.Lines.Count>=b then
              begin
                b:=b+88;
                form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('-',#4+#12+#13+#10,'-',134)))));
                form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS  ALFABETICA PARA COMPRAS',131)))));
                form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('REFERENCIA     | DESCRICAO DO PRODUTO                |  PRECO 1 |  PRECO 2 |  PRECO 3 | PRECO 4  | P. COMPRA| QUANT.   | SUGESTAO |'+#13+#10))));
                form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',132)))));
              end;
            form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','|',' ',16)+funcoes.CompletaOuRepete(copy(dm.ProdutoQY.fieldbyname('DESCRICAO').AsString,1,37),'|',' ',38)   + funcoes.CompletaOuRepete('','|','_',11)+ funcoes.CompletaOuRepete('','|','_',11)+ funcoes.CompletaOuRepete('','|','_',11)+ funcoes.CompletaOuRepete('','|','_',11)+ funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('P_compra').AsString))+'|',' ',11)+funcoes.CompletaOuRepete('','|','_',11)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('sugestao').AsString))+'|',' ',11)+#13+#10))));
            form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(' ','|',' ',16)+funcoes.CompletaOuRepete(' ','|',' ',38)+funcoes.CompletaOuRepete(' ','|',' ',11)+funcoes.CompletaOuRepete(' ','|',' ',11)+funcoes.CompletaOuRepete(' ','|',' ',11)+funcoes.CompletaOuRepete(' ','|',' ',11)+funcoes.CompletaOuRepete(' ','|',' ',11)+funcoes.CompletaOuRepete(' ','|',' ',11)+funcoes.CompletaOuRepete(' ','|',' ',11)+#13+#10))));
            if dm.ProdutoQY.RecNo=dm.ProdutoQY.RecordCount then form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',132)))));
            dm.ProdutoQY.Next;

    end;
    end;
    funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,true,2);
    form19.RichEdit1.SelStart:=1;
    dm.ProdutoQY.Close;
    form19.Show;

end;

end;

procedure TForm2.AlfabticaPFornecedor4Click(Sender: TObject);
var sql,separa:string;
begin
  b:=88;
  form19.RichEdit1.Clear;
  funcoes.PerguntasRel(dm.produtoqy,'123',false,'','');
  separa:=funcoes.dialogo('generico',0,'1234'+#8,0,false,'S','Control For Windows','Qual a Ordem (1-Alfab�tica, 2-Fornecedor, 3-Fabricante, 4-Localiza��o) ?','') ;
  //form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#15+#13))));
  addRelatorioForm19('|' + #15 + '|' + CRLF);

  if separa='' then sql:='select cod,fornec,fabric,grupo,codbar,nome as DESCRICAO, p_venda as Preco, quant as ESTOQUE,localiza from produto order by nome asc';
  if separa='1' then sql:='select cod,fornec,fabric,grupo,codbar,nome as DESCRICAO, p_venda as Preco, quant as ESTOQUE,localiza from produto order by nome asc';
  if separa='2' then sql:='select cod,fornec,fabric,grupo,codbar,nome as DESCRICAO, p_venda as Preco, quant as ESTOQUE,localiza from produto order by fornec asc';
  if separa='3' then sql:='select cod,fornec,fabric,grupo,codbar,nome as DESCRICAO, p_venda as Preco, quant as ESTOQUE,localiza from produto order by fabric asc';
  if separa='4' then sql:='select cod,fornec,fabric,grupo,codbar,nome as DESCRICAO, p_venda as Preco, quant as ESTOQUE,localiza from produto order by localiza asc';

  if not funcoes.Contido('*',fornec+fabric+grupo+separa) then
    begin

      dm.ProdutoQY.SQL.Clear;
      dm.ProdutoQY.SQL.Add(sql);
      dm.ProdutoQY.open;
      dm.ProdutoQY.FetchAll;

      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS POR LOCALIZACAO',131)))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('CODIGO REFERENCIA      LOCALIZA      DESCRICAO                                   PRECO      QUANT.|   LOJA  |  DEPOSITO|    TOTAL |' +#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','|'+#13+#10,'-',133)))));

         dm.ProdutoQY.First;
         funcoes.informacao(1,2,'AGUARDE... ',true,false,2);
           while not dm.ProdutoQY.Eof do
             begin
               if form19.RichEdit1.Lines.Count>=b then
                 begin
                   b:=b+88;
                   form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('-',#4+#12+#13+#10,'-',134)))));
                   form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS  ALFABETICA PARA COMPRAS',131)))));
                   form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('CODIGO REFERENCIA      LOCALIZA      DESCRICAO                                   PRECO      QUANT.|   LOJA  |  DEPOSITO|    TOTAL |'+#13+#10))));
                   form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',132)))));
                 end;
                 //ShowMessage(dm.ProdutoQY.fieldbyname('descricao').AsString+'   '+IntToStr(dm.ProdutoQY.RecNo));
               funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,false,2);
               if funcoes.PerguntasRel(dm.produtoqy,'123',true,'','') then form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',dm.ProdutoQY.fieldbyname('cod').AsString,' ',6)+' '+funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('codbar').AsString,'',' ',15)+funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('localiza').AsString,'',' ',15)+funcoes.CompletaOuRepete(copy(dm.ProdutoQY.fieldbyname('DESCRICAO').AsString,1,37),'',' ',37)   + funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('preco').AsString)),' ',12)+ funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('estoque').AsString)),' ',12)+ funcoes.CompletaOuRepete('|','|','_',11)+ funcoes.CompletaOuRepete('','|','_',11)+ funcoes.CompletaOuRepete('','|','_',11)+#13+#10))));
               if dm.ProdutoQY.RecNo=dm.ProdutoQY.RecordCount then form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',132)))));
               dm.ProdutoQY.Next;

             end;

    grupo:='';
    fornec:='';
    fabric:='';

    funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,true,2);
    form19.RichEdit1.SelStart:=1;
    dm.ProdutoQY.Close;
    form19.Show;
end;

end;

procedure TForm2.AliquotasdePISCOFINS1Click(Sender: TObject);
var
  COD_NAT, CST_PIS : String;
begin
  CST_PIS := '';
  CST_PIS := funcoes.dialogo('generico',0,'IMS'+#8,50,false,'S',Application.Title,'Qual a aliquota de PIS/COFINS (I-Isento, M-Monofasico, S-Substituicao)?',CST_PIS);
  if CST_PIS = '*' then exit;

  COD_NAT := '';
  COD_NAT := funcoes.dialogo('generico',0,'1234567890,.'+#8,50,false,'',Application.Title,'Qual o codigo da natureza da receita?',CST_PIS);
  if COD_NAT = '*' then exit;

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select cod, codbar, nome, is_pis, COD_ISPIS from produto where is_pis = :is_pis and COD_ISPIS = :COD_ISPIS';
  dm.IBselect.ParamByName('is_pis').AsString    := CST_PIS;
  dm.IBselect.ParamByName('COD_ISPIS').AsString := COD_NAT;
  dm.IBselect.Open;
  dm.IBselect.FetchAll;

  if dm.IBselect.IsEmpty then begin
    ShowMessage('Nenhum Produto Encontrado!');
    dm.IBselect.Close;
    exit;
  end;

  form19.RichEdit1.Clear;

  addRelatorioForm19(funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'Relatorio de Aliquotas de PIS/COFINS', 80));
  addRelatorioForm19('CODIGO  REFERENCIA       DESCRICAO DO PRODUTO                     ALIQ NAT'+#13+#10);
  addRelatorioForm19('-------------------------------------------------------------------------------'+#13+#10);

  while not dm.IBselect.Eof do begin
    addRelatorioForm19(strzero(dm.IBselect.FieldByName('cod').AsString, 6) + '  ' + CompletaOuRepete(LeftStr(dm.IBselect.FieldByName('codbar').AsString, 17), '', ' ', 17) +
    CompletaOuRepete(LeftStr(dm.IBselect.FieldByName('nome').AsString, 40), '', ' ', 40) + ' ' + CompletaOuRepete(LeftStr(dm.IBselect.FieldByName('is_pis').AsString, 4), '', ' ', 4) + ' ' +
    CompletaOuRepete(LeftStr(dm.IBselect.FieldByName('COD_ISPIS').AsString, 6), '', ' ', 6) + CRLF);
    dm.IBselect.Next;
  end;

  addRelatorioForm19('-------------------------------------------------------------------------------'+#13+#10);
  form19.ShowModal;
end;

procedure TForm2.AlterarValidadesProdutosdePesagem1Click(Sender: TObject);
begin
  funcoes.localizar('Alterar Validades', 'produto',
   'cod, nome, codbar, substring(codbar from 6 for 2) as  validade', '', '','', '',
   false, false, false, ' where left(codbar, 1) = ''2'' and char_length(codbar) <= 7 and char_length(codbar) >= 5', 500, nil);
end;

procedure TForm2.CodBarrasIguais1Click(Sender: TObject);
begin
  form19.RichEdit1.Clear;
  b:=56;
  dm.ProdutoQY.sql.Clear;
  dm.ProdutoQY.SQL.Add('SELECT cod,nome,codbar,p_venda FROM produto WHERE codbar IN ( SELECT codbar FROM produto GROUP BY codbar HAVING count(*) > 1) ORDER BY codbar,nome asc');
  dm.ProdutoQY.Open;

  dm.ProdutoQY.FetchAll;

  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#18+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'RELATORIO DE CODIGOS DE BARRAS IGUAIS',80)))));

      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('CODIGO NOME                                     COD. BARRAS                PRECO'+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',82)))));
      dm.ProdutoQY.First;
               funcoes.informacao(1,2,'AGUARDE... ',true,false,2);
               while not dm.ProdutoQY.Eof do
                 begin
                   if form19.RichEdit1.Lines.Count=b then
                     begin
                       b:=b+56;
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#12+#13+#10,'-',83)))));
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'RELATORIO DE CODIGOS DE BARRAS IGUAIS',80)))));
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('CODIGO NOME                                     COD. BARRAS                PRECO'+#13+#10))));
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',82)))));
                     end;
                     funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,false,2);
                     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',dm.ProdutoQY.fieldbyname('COD').AsString,' ',6)+' '+funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('nome').AsString,'',' ',41)   + funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('codbar').AsString,'',' ',16)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('p_venda').AsString)),' ',16)+#13+#10))));
                     if dm.ProdutoQY.RecNo=dm.ProdutoQY.RecordCount then form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',82)))));
                     dm.ProdutoQY.Next;

                 end;

               funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,true,2);
               form19.RichEdit1.SelStart:=1;
               dm.ProdutoQY.Close;
               form19.ShowModal;

end;

procedure TForm2.abelaPorRefOriginal1Click(Sender: TObject);
var
  sql,cod,estoquezero,ini,fim,entrereferencias,imprimiQTD,SelecaoStr, lin, usaCodbar, campoRef : string;
  separa,selecao,cabecalho:TStringList;
  linhas : integer;
begin
  linhas := 60;
  b := linhas;
  cabecalho:= TStringList.Create;
  cabecalho.Add('1=Loja+Deposito');
  cabecalho.Add('2=Loja');
  cabecalho.Add('3=Dep�sito');

  separa:= TStringList.Create;
  separa.Add('1=nome');
  separa.Add('2=fornec,nome');
  separa.Add('3=fabric,nome');
  separa.Add('4=cod');
  separa.Add('5=codbar');
  separa.Add('6=refori');


  selecao:= TStringList.Create;
  selecao.Add('1=quant+deposito as quant');
  selecao.Add('2=quant');
  selecao.Add('3=deposito as quant');
  selecao.Add('5=quant+deposito');
  selecao.Add('6=quant');
  selecao.Add('7=deposito');

  form19.RichEdit1.Clear;
  fornec:='';
  grupo:='';
  funcoes.PerguntasRel(dm.produtoqy,'3',false,'','');


  if fabric <> '*' then sql := funcoes.dialogo('generico',0,'123456',0,false,'S','Control For Windows','Qual a Ordem (1-Alfab�tica, 2-Fornecedor, 3-Fabricante, 4-Num�rica, 5-Codbarras, 6-Ref. Original) ?','1');
  if sql = '*' then exit;

  ini := funcoes.dialogo('normal',0,'1234567890'+#8,40,false,'','Control For Windows','Qual o C�digo Inicial?','');
  if ini = '*' then exit;

  fim := funcoes.dialogo('normal',0,'1234567890'+#8,40,false,'','Control For Windows','Qual o C�digo Final?','');
  if fim = '*' then exit;

  SelecaoStr := funcoes.dialogo('generico',0,'123',0,false,'S','Control For Windows','Qual o Crit�rio de Sele��o?(1-Loja+Dep�sito 2-Loja 3-Dep�sito)','1');
  if SelecaoStr = '*' then exit;

  lin := funcoes.dialogo('normal',0,'1234567890'+#8,40,false,'','Control For Windows','Imprimir Quantas Linhas por P�gina ?',IntToStr(linhas));
  if lin = '*' then exit;

  linhas := StrToIntDef(lin,60);

  usaCodbar := funcoes.dialogo('generico',0,'12',0,false,'S','Control For Windows','Imprimir Campo (1-Ref. Original, 2-Cod. Barras) ?','1');
  if usaCodbar = '*' then exit;

  if usaCodbar = '1' then campoRef := 'refori'
    else campoRef := 'codbar';


  if not funcoes.Contido('*',ini+fim+fabric+sql+SelecaoStr) then estoquezero := funcoes.dialogo('generico',0,'SN',0,false,'S','Control For Windows','Imprimir Itens Com Estoque Zero','S');
  if estoquezero='N' then estoquezero := 'where ('+funcoes.LerValorPGerais(IntToStr(strtoint(SelecaoStr)+4),selecao)+'>0)'
    else  estoquezero:='';

  //if (ini<>'') and (fim<>'') and funcoes.Contido('where',estoquezero) then entrereferencias:=' and  ('+campoRef+'>='+QuotedStr(ini)+' ) and ('+campoRef+'<='+QuotedStr(fim)+') ';
  //if (ini<>'') and (fim<>'') and not funcoes.Contido('where',estoquezero) then entrereferencias:= ' where ('+campoRef+'>='+QuotedStr(ini)+' ) and ('+campoRef+'<='+QuotedStr(fim)+') ';

  if (ini<>'') and (fim<>'') then begin
    if funcoes.Contido('where',estoquezero) then entrereferencias := ' and (left('+campoRef+', '+IntToStr(Length(fim))+') between '+QuotedStr(ini)+' and '+QuotedStr(fim)+') '
      else entrereferencias:= ' where (left('+campoRef+', '+IntToStr(Length(fim))+') between '+QuotedStr(ini)+' and '+QuotedStr(fim)+') ';
  end;

  //if (ini<>'') and (fim<>'') and not funcoes.Contido('where',estoquezero) then entrereferencias:= ' where (left('+campoRef+', '+IntToStr(Length(fim))+') between '+QuotedStr(ini)+' and '+QuotedStr(fim)+') ';

  if not funcoes.Contido('*',ini+fim+fabric+sql+SelecaoStr+estoquezero) then imprimiQTD:= funcoes.dialogo('generico',0,'SN',0,false,'S','Control For Windows','Imprimir Quantidade em Estoque?','S');
  

  //form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#15+#13))));
  addRelatorioForm19('|' + #15 + '|' + CRLF);
  if not funcoes.Contido('*',fabric+sql+SelecaoStr+estoquezero) then
    begin
      dm.ProdutoQY.SQL.Clear;
      dm.ProdutoQY.SQL.Add('select cod,unid,fornec,'+campoRef+' as refori,fabric,grupo,codbar,nome, p_venda,p_compra,'+funcoes.LerValorPGerais(SelecaoStr,selecao)+' from produto '+estoquezero+ ' '+entrereferencias +' order by '+funcoes.LerValorPGerais(sql,separa));
      dm.ProdutoQY.open;
      dm.ProdutoQY.FetchAll;

      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS POR REF. ORIGINAL   '+funcoes.LerValorPGerais(SelecaoStr,cabecalho),115)))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('FORNC  COD. REF. ORIGINAL        DESCRICAO DO PRODUTO                  UNID.          QTD.   P. COMPRA     P. VENDA' +#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',117)))));
      cod:='xxx';
         dm.ProdutoQY.First;
         funcoes.informacao(1,2,'AGUARDE... ',true,false,2);

        fornec:='';
        grupo:='';
           while not dm.ProdutoQY.Eof do
             begin
               if form19.RichEdit1.Lines.Count>=b then
                 begin
                   b := b + linhas + 6;
                   form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('-',#4+#12+#13+#10,'-',119)))));
                   addRelatorioForm19('.' + CRLF);
                   addRelatorioForm19('.' + CRLF);
                   addRelatorioForm19('.' + CRLF);
                   addRelatorioForm19('.' + CRLF);
                   form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS POR REF. ORIGINAL   '+funcoes.LerValorPGerais(SelecaoStr,cabecalho),115)))));
                   form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('FORNC  COD. REF. ORIGINAL        DESCRICAO DO PRODUTO                  UNID.          QTD.   P. COMPRA     P. VENDA' +#13+#10))));
                   //form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('FORNEC  CODIGO REF. ORIGINAL   DESCRICAO DO PRODUTO                  UNID.           QTD.    P. COMPRA     P. VENDA' +#13+#10))));
                   form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',117)))));
                 end;

               if sql='2' then
                 begin
                   if dm.ProdutoQY.fieldbyname('fornec').AsString<>cod then
                     begin
                       addRelatorioForm19('.' + CRLF);
                       cod:=dm.ProdutoQY.fieldbyname('fornec').AsString;
                       if (funcoes.BuscaNomeBD(dm.ibquery1,'nome','fornecedor','where cod='+cod))=''  then addRelatorioForm19(strzero(cod, 6)+'-FORNECEDOR N�O CADASTRADO'#13+#10)
                         else addRelatorioForm19(strzero(cod, 6)+'-'+ UpperCase(funcoes.BuscaNomeBD(dm.ibquery1,'nome','fornecedor','where cod='+cod))+#13+#10);
                       addRelatorioForm19('.' + CRLF);  
                     end;
                 end;

               funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,false,2);

               //filtro no dataset e ordenacao por fabric
               if funcoes.PerguntasRel(dm.produtoqy,'3',true,'','') then
                 begin
                   if sql='3' then
                     begin
                       if dm.ProdutoQY.fieldbyname('fabric').AsString<>cod then
                         begin
                           addRelatorioForm19('.' + CRLF);
                           cod:=dm.ProdutoQY.fieldbyname('fabric').AsString;
                           if (funcoes.BuscaNomeBD(dm.ibquery1,'nome','fabricante','where cod='+cod))=''  then addRelatorioForm19(strzero(cod, 6)+'-FABRICANTE N�O CADASTRADO'#13+#10)
                             else  addRelatorioForm19(strzero(cod, 6)+'-'+ UpperCase(funcoes.BuscaNomeBD(dm.ibquery1,'nome','fabricante','where cod='+cod))+#13+#10);

                           addRelatorioForm19('.' + CRLF);
                         end;
                     end;


             if imprimiQTD='S' then addRelatorioForm19(funcoes.CompletaOuRepete('',strzero(dm.ProdutoQY.fieldbyname('fornec').AsString, 4),' ',4)+' '+funcoes.CompletaOuRepete('',strzero(dm.ProdutoQY.fieldbyname('cod').AsString, 6),' ',6)+' '+funcoes.CompletaOuRepete(LeftStr(dm.ProdutoQY.fieldbyname('refori').AsString, 20),'',' ',20)+ ' ' +funcoes.CompletaOuRepete(LeftStr(dm.ProdutoQY.fieldbyname('nome').AsString,40),'',' ',40) +' '  + funcoes.CompletaOuRepete(LeftStr(dm.ProdutoQY.fieldbyname('unid').AsString, 3),'',' ',3)+ funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',dm.ProdutoQY.fieldbyname('quant').AsCurrency),' ',13)+ funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00', dm.ProdutoQY.fieldbyname('p_compra').AsCurrency),' ',12)+ funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00', dm.ProdutoQY.fieldbyname('p_venda').AsCurrency),' ',12)+#13+#10)
               else                 addRelatorioForm19(funcoes.CompletaOuRepete('',strzero(dm.ProdutoQY.fieldbyname('fornec').AsString, 4),' ',4)+' '+funcoes.CompletaOuRepete('',strzero(dm.ProdutoQY.fieldbyname('cod').AsString, 6),' ', 6)+' '+funcoes.CompletaOuRepete(LeftStr(dm.ProdutoQY.fieldbyname('refori').AsString, 20),'',' ',20)+ ' ' +funcoes.CompletaOuRepete(LeftStr(dm.ProdutoQY.fieldbyname('nome').AsString,40),'',' ',40)+' '   + funcoes.CompletaOuRepete(LeftStr(dm.ProdutoQY.fieldbyname('unid').AsString, 3),'',' ',5)+ funcoes.CompletaOuRepete('',                                                                              '','-',13)+ funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00', dm.ProdutoQY.fieldbyname('p_compra').AsCurrency),' ',12)+ funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00', dm.ProdutoQY.fieldbyname('p_venda').AsCurrency),' ',12)+#13+#10)
             end;

             if dm.ProdutoQY.RecNo = dm.ProdutoQY.RecordCount then addRelatorioForm19(funcoes.CompletaOuRepete('',#13+#10,'-',117));
             dm.ProdutoQY.Next;
      end;


    grupo:='';
    fornec:='';
    fabric:='';

    funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,true,2);
    form19.RichEdit1.SelStart:=1;
    dm.ProdutoQY.Close;
    form19.Show;
end;

end;

procedure TForm2.Button1Click(Sender: TObject);
var
  a:string;
  t : TextFile;
  op : TOpenDialog;
begin
 { dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select * from registro';
  dm.IBselect.Open;

  op := TOpenDialog.Create(self);
  op.Execute;
  dm.ACBrNFe.NotasFiscais.Clear;
  dm.ACBrNFe.NotasFiscais.LoadFromFile(op.FileName);
  dm.ACBrNFe.NotasFiscais[0].NFe.Emit.CNPJCPF := StrNum(dm.IBselect.fieldbyname('cnpj').AsString);
  dm.ACBrNFe.NotasFiscais[0].NFe.Ide.tpAmb := taHomologacao;
  dm.ACBrNFe.Enviar(0, false);
  imprimirNfce;

}{  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select nota from venda';
  dm.IBselect.Open;

  while not dm.IBselect.Eof do
    begin
      funcoes.cancelamentoDeNota(dm.IBselect.fieldbyname('nota').AsString);
      dm.IBselect.Next;
    end;

  ShowMessage('acabou');
  exit;
  //wi 4958
 } //he 7016
  printer.Create;
  //ShowMessage(IntToStr(printer.PageWidth) + #13 + IntToStr(printer.PageHeight));
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  //ShowMessage(funcoes.LerConfig(form22.Pgerais.Values['configu'], 12));
  exit;
  form71 := TForm71.Create(self);
  form71.ShowModal;
  form71.Free;
end;

procedure TForm2.RefOriginalGrupo1Click(Sender: TObject);
var estoquezero,sql:string;
var separa:TStringList;
begin
  separa:= TStringList.Create;
  separa.Add('1=nome');
  separa.Add('4=cod');
  form19.RichEdit1.Clear;
  b:=88;
  fornec:='';
  fabric:='';
  grupo:='';

  funcoes.PerguntasRel(dm.produtoqy,'1',false,'','');
  if not funcoes.Contido('*',grupo) then estoquezero := funcoes.dialogo('generico',0,'SN',0,false,'S','Control For Windows','Imprimir Itens Com Estoque Zero','S');
  if estoquezero='N' then estoquezero:='where quant+deposito>0' ;
  if not funcoes.Contido('*',grupo+estoquezero) then sql:=funcoes.dialogo('generico',0,'14',0,false,'S','Control For Windows','Qual a Ordem (1-Alfab�tica, 4-Num�rica) ?','1');
  //form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#15+#13))));
  addRelatorioForm19('|' + #15 + '|' + CRLF);
  if not funcoes.Contido('*',grupo+estoquezero+sql) then
    begin
      dm.ProdutoQY.SQL.Clear;
      dm.ProdutoQY.SQL.Add('select cod,unid,fornec,refori,fabric,grupo,codbar,nome, p_venda,p_compra,quant+deposito as quant from produto '+estoquezero+' order by '+funcoes.LerValorPGerais(sql,separa));
      dm.ProdutoQY.open;
      dm.ProdutoQY.FetchAll;

      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS POR REF. ORIGINAL   ',115)))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('FORNEC  CODIGO REF. ORIGINAL   DESCRICAO DO PRODUTO                  UNID.           SALDO   P. COMPRA     P. VENDA' +#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',117)))));

         dm.ProdutoQY.First;
         funcoes.informacao(1,2,'AGUARDE... ',true,false,2);

        fornec:='';
        fabric:='';
           while not dm.ProdutoQY.Eof do
             begin
               if form19.RichEdit1.Lines.Count>=b then
                 begin
                   b:=b+88;
                   form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('-',#4+#12+#13+#10,'-',119)))));
                   form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS POR REF. ORIGINAL   ',115)))));
                   form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('FORNEC  CODIGO REF. ORIGINAL   DESCRICAO DO PRODUTO                  UNID.           SALDO   P. COMPRA     P. VENDA' +#13+#10))));
                   form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',117)))));
                 end;

               funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,false,2);

               //filtro no dataset e ordenacao por fabric
               if funcoes.PerguntasRel(dm.produtoqy,'1',true,'','') then form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',dm.ProdutoQY.fieldbyname('fornec').AsString,' ',6)+' '+funcoes.CompletaOuRepete('',dm.ProdutoQY.fieldbyname('cod').AsString,' ',7)+' '+funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('refori').AsString,'',' ',15)+funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('nome').AsString,'',' ',40) +' '  + funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('unid').AsString,'',' ',5)+ funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('quant').AsString)),' ',13)+ funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('p_compra').AsString)),' ',13)+ funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('p_venda').AsString)),' ',13)+#13+#10))));
               if dm.ProdutoQY.RecNo=dm.ProdutoQY.RecordCount then form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',117)))));
               dm.ProdutoQY.Next;
      end;

    grupo:='';
    fornec:='';
    fabric:='';

    funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,true,2);
    form19.RichEdit1.SelStart:=1;
    dm.ProdutoQY.Close;
    form19.Show;
end;


end;

procedure TForm2.ItensdePesagem1Click(Sender: TObject);
  var sim:string;
begin
  form19.RichEdit1.Clear;
  b := 52;
  dm.ProdutoQY.sql.Clear;
  dm.ProdutoQY.SQL.Add('select cod,unid as UN,emb,codbar,nome as DESCRICAO, p_venda as Preco, quant as ESTOQUE,fabric,fornec,grupo from produto where (codbar like '+QuotedStr('2%')+') and (char_length(codbar)=5) order by nome asc');
  //ShowMessage(dm.produtoqy.Text);
  dm.ProdutoQY.Open;
  tread:=TTWThreadProdQY.Create(true);
  tread.FreeOnTerminate:=true;
  tread.Resume;

  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#18+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS DE ITENS DE PESAGEM',80)))));
  funcoes.PerguntasRel(dm.ProdutoQY,'12',false,'','') ;
  if not funcoes.Contido('*',grupo+fornec+fabric) then
    begin
      sim:=funcoes.dialogo('generico',0,'SN'+#8,0,false,'S','Control For Windows','Imprimir Quantidade em Estoque?S/N:','N') ;
    end;
  if (sim='S') and (sim<>'*') then
    begin
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((' CODIGO DESCRICAO DO PRODUTO                               QUANT           PRECO'+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',82)))));
      dm.ProdutoQY.First;
               funcoes.informacao(1,2,'AGUARDE... ',true,false,2);
               while not dm.ProdutoQY.Eof do
                 begin
                       if funcoes.PerguntasRel(dm.ProdutoQY,'12',true,'','') then
                          begin
                           if form19.RichEdit1.Lines.Count=b then
                            begin
                              b:=b+52;
                              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('-',#12+#13+#10,'-',83)))));
                              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS DE ITENS DE PESAGEM',80)))));
                              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((' CODIGO DESCRICAO DO PRODUTO                               QUANT           PRECO'+#13+#10))));
                              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',82)))));
                            end;
                              funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,false,2);
                              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(' ',dm.ProdutoQY.fieldbyname('COD').AsString,' ',7)+' '+funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('DESCRICAO').AsString,FormatCurr('#,###,###0.000',StrToCurr(dm.ProdutoQY.fieldbyname('estoque').AsString)),' ',56)   + funcoes.CompletaOuRepete(' ',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('PRECO').AsString)),' ',16)+#13+#10))));
                              if dm.ProdutoQY.RecNo=dm.ProdutoQY.RecordCount then form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',80)))));
                              dm.ProdutoQY.Next;
                        end
                         else dm.ProdutoQY.Next;
end;
end;
if (sim='N') and (sim<>'*') then
begin
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((' CODIGO DESCRICAO DO PRODUTO                               PRECO     UN    EMB'+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',82)))));

      dm.ProdutoQY.First;

               funcoes.informacao(1,2,'AGUARDE... ',true,false,2);
               while not dm.ProdutoQY.Eof do
                 begin
                   if funcoes.PerguntasRel(dm.ProdutoQY,'12',true,'','') then
                    begin

                   if form19.RichEdit1.Lines.Count=b then
                     begin
                       b:=b+52;
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('-',#12+#13+#10,'-',83)))));
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS ALFABETICA',80)))));
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((' CODIGO DESCRICAO DO PRODUTO                               PRECO     UN    EMB'+#13+#10))));
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',82)))));
                     end;
                       funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,false,2);
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(' ',dm.ProdutoQY.fieldbyname('COD').AsString,' ',7)+' '+funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('DESCRICAO').AsString,FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('PRECO').AsString)),' ',56)+'     '   + funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('UN').AsString,'',' ',6)+ funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('emb').AsString,'',' ',10)+#13+#10))));
                       if dm.ProdutoQY.RecNo=dm.ProdutoQY.RecordCount then form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',82)))));
                       dm.ProdutoQY.Next;

end
  else dm.ProdutoQY.Next;
end;
end;
   if not funcoes.Contido('*',grupo+fornec+fabric+sim) then
       begin
               grupo:='';
               fornec:='';
               fabric:='';

               funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,true,2);
               form19.RichEdit1.SelStart := 1;
               dm.ProdutoQY.Close;
               form19.Show;
       end;

end;

procedure TForm2.ParmetrosGerais1Click(Sender: TObject);
var
  paramGerais,paramGeraisteclas,trocaouescreve:TStringList;
  recno : integer;
begin
  if form22.usuario <> 'ADMIN' then
    begin
      MessageDlg('Este Usu�rio N�o tem Permiss�o para Acessar essa Rotina.', mtInformation, [mbOK], 1);
      exit;
    end;

  form40 := tform40.Create(self);
  form40.tipo := TStringList.Create;
  form40.tipo.Add('0=normal');
  form40.tipo.Add('1=normal');
  form40.tipo.Add('2=normal');
  form40.tipo.Add('3=normal');
  form40.tipo.Add('4=normal');
  form40.tipo.Add('5=normal');
  form40.tipo.Add('6=numero');
  form40.tipo.Add('7=not');
  form40.tipo.Add('8=not');
  form40.tipo.Add('9=normal');
  form40.tipo.Add('10=normal');
  form40.tipo.Add('11=numero');
  form40.tipo.Add('12=numero');
  form40.tipo.Add('13=normal');
  form40.tipo.Add('14=normal');
  form40.tipo.Add('15=normal');
  form40.tipo.Add('16=normal');
  form40.tipo.Add('17=normal');
  form40.tipo.Add('18=normal');
  form40.tipo.Add('19=normal');
  form40.tipo.Add('20=normal');
  form40.tipo.Add('21=normal');
  form40.tipo.Add('22=normal');
  form40.tipo.Add('23=normal');
  form40.tipo.Add('24=normal');
  form40.tipo.Add('25=generico');//23
  form40.tipo.Add('26=normal');
  form40.tipo.Add('27=normal');
  form40.tipo.Add('28=numero');
  form40.tipo.Add('29=numero');
  form40.tipo.Add('30=normal');
  form40.tipo.Add('31=normal');
  form40.tipo.Add('32=generico');
  form40.tipo.Add('33=generico');
  form40.tipo.Add('34=generico');
  form40.tipo.Add('35=normal');
  form40.tipo.Add('36=generico');
  form40.tipo.Add('37=generico');
  form40.tipo.Add('38=generico');
  form40.tipo.Add('39=generico');
  form40.tipo.Add('40=numero');
  form40.tipo.Add('41=generico');
  form40.tipo.Add('42=generico');
  form40.tipo.Add('43=generico');
  form40.tipo.Add('44=generico');
  form40.tipo.Add('45=generico');
  form40.tipo.Add('46=generico');
  form40.tipo.Add('47=generico');
  form40.tipo.Add('48=generico');
  form40.tipo.Add('49=generico');
  form40.tipo.Add('50=generico');
  form40.tipo.Add('51=generico');
  form40.tipo.Add('52=generico');
  form40.tipo.Add('53=generico');
  form40.tipo.Add('54=generico');
  form40.tipo.Add('55=generico');
  form40.tipo.Add('56=generico');
  form40.tipo.Add('57=generico');
  form40.tipo.Add('58=generico');
  form40.tipo.Add('59=generico');
  form40.tipo.Add('60=generico');
  form40.tipo.Add('61=generico');
  form40.tipo.Add('62=generico');
  form40.tipo.Add('63=generico');
  form40.tipo.Add('64=normal');
  form40.tipo.Add('65=generico');
  form40.tipo.Add('66=generico');
  form40.tipo.Add('67=normal');
  form40.tipo.Add('68=generico');
  form40.tipo.Add('69=generico');
  form40.tipo.Add('70=generico');
  form40.tipo.Add('71=generico');
  form40.tipo.Add('72=generico');
  form40.tipo.Add('73=generico');
  form40.tipo.Add('74=generico');
  form40.tipo.Add('75=generico');
  form40.tipo.Add('76=generico');
  form40.tipo.Add('77=generico');
  form40.tipo.Add('78=generico');
  form40.tipo.Add('79=generico');
  form40.tipo.Add('80=generico');
  form40.tipo.Add('81=generico');
  form40.tipo.Add('82=generico');
  form40.tipo.Add('83=generico');
  form40.tipo.Add('84=generico');
  form40.tipo.Add('85=generico');
  form40.tipo.Add('86=generico');
  form40.tipo.Add('87=generico');
  form40.tipo.Add('88=generico');
  form40.tipo.Add('89=generico');
  form40.tipo.Add('90=generico');
  form40.tipo.Add('91=generico');
  form40.tipo.Add('92=generico');
  form40.tipo.Add('93=generico');
  form40.tipo.Add('94=generico');
  form40.tipo.Add('95=generico');
  form40.tipo.Add('96=generico');
  form40.tipo.Add('97=generico');
  form40.tipo.Add('98=generico');
  form40.tipo.Add('99=normal');
  form40.tipo.Add('100=normal');
  form40.tipo.Add('101=normal');
  
  form40.troca := TStringList.Create;
  form40.troca.Add('0=S');
  form40.troca.Add('1= ');
  form40.troca.Add('2=S');
  form40.troca.Add('3=S');
  form40.troca.Add('4=S');
  form40.troca.Add('5=S');
  form40.troca.Add('6=');
  form40.troca.Add('7=');
  form40.troca.Add('8=');
  form40.troca.Add('9=S');
  form40.troca.Add('10=S');
  form40.troca.Add('11=');
  form40.troca.Add('12=');
  form40.troca.Add('13=S');
  form40.troca.Add('14=S');
  form40.troca.Add('15=S');
  form40.troca.Add('16=S');
  form40.troca.Add('17=S');
  form40.troca.Add('18=');
  form40.troca.Add('19=S');
  form40.troca.Add('20=S');
  form40.troca.Add('21=S');
  form40.troca.Add('22=');
  form40.troca.Add('23=S');//23
  form40.troca.Add('24=S');
  form40.troca.Add('25=S');
  form40.troca.Add('26=S');
  form40.troca.Add('27=S');
  form40.troca.Add('28=');
  form40.troca.Add('29=');
  form40.troca.Add('30=S');
  form40.troca.Add('31=S');
  form40.troca.Add('32=S');
  form40.troca.Add('33=S');
  form40.troca.Add('34=S');
  form40.troca.Add('35=');
  form40.troca.Add('36=S');
  form40.troca.Add('37=S');
  form40.troca.Add('38=S');
  form40.troca.Add('39=S');
  form40.troca.Add('40=');
  form40.troca.Add('39=S');
  form40.troca.Add('40=S');
  form40.troca.Add('41=S');
  form40.troca.Add('42=S');
  form40.troca.Add('43=S');
  form40.troca.Add('44=S');
  form40.troca.Add('45=S');
  form40.troca.Add('46=S');
  form40.troca.Add('47=S');
  form40.troca.Add('48=S');
  form40.troca.Add('49=S');
  form40.troca.Add('50=S');
  form40.troca.Add('51=S');
  form40.troca.Add('52=');
  form40.troca.Add('53=S');
  form40.troca.Add('54=S');
  form40.troca.Add('55=S');
  form40.troca.Add('56=S');
  form40.troca.Add('57=S');
  form40.troca.Add('57=S');
  form40.troca.Add('58=S');
  form40.troca.Add('59=S');
  form40.troca.Add('60=S');
  form40.troca.Add('61=S');
  form40.troca.Add('62=S');
  form40.troca.Add('63=S');
  form40.troca.Add('64=');
  form40.troca.Add('65=S');
  form40.troca.Add('66=S');
  form40.troca.Add('67=');
  form40.troca.Add('68=S');
  form40.troca.Add('69=S');
  form40.troca.Add('70=S');
  form40.troca.Add('71=S');
  form40.troca.Add('72=');
  form40.troca.Add('73=S');
  form40.troca.Add('74=S');
  form40.troca.Add('75=S');
  form40.troca.Add('76=S');
  form40.troca.Add('77=S');
  form40.troca.Add('78=S');
  form40.troca.Add('79=');
  form40.troca.Add('80=');
  form40.troca.Add('81=S');
  form40.troca.Add('82=S');
  form40.troca.Add('83=S');
  form40.troca.Add('84=');
  form40.troca.Add('85=S');
  form40.troca.Add('86=S');
  form40.troca.Add('87=');
  form40.troca.Add('88=S');
  form40.troca.Add('89=S');
  form40.troca.Add('90=S');
  form40.troca.Add('91=S');
  form40.troca.Add('92=S');
  form40.troca.Add('93=S');
  form40.troca.Add('94=S');
  form40.troca.Add('95=S');
  form40.troca.Add('96=');
  form40.troca.Add('97=');
  form40.troca.Add('98=');
  form40.troca.Add('99=');
  form40.troca.Add('100=');
  form40.troca.Add('101= ');

  form40.teclas := TStringList.Create;
  form40.teclas.Add('0=FT');
  form40.teclas.Add('1=0123456789'+#8);
  form40.teclas.Add('2=SNX');
  form40.teclas.Add('3=SN');
  form40.teclas.Add('4=SN');
  form40.teclas.Add('5=SN');
  form40.teclas.Add('6=');
  form40.teclas.Add('7=');
  form40.teclas.Add('8=0123456789'+#8);
  form40.teclas.Add('9=SN');
  form40.teclas.Add('10=123');
  form40.teclas.Add('11=');
  form40.teclas.Add('12=');
  form40.teclas.Add('13=SN');
  form40.teclas.Add('14=SN');
  form40.teclas.Add('15=SN');
  form40.teclas.Add('16=SN');
  form40.teclas.Add('17=SN');
  form40.teclas.Add('18=0123456789'+#8);
  form40.teclas.Add('19=SNPX');
  form40.teclas.Add('20=SN');
  form40.teclas.Add('21=SN');
  form40.teclas.Add('22=1234567890' + #8);
  form40.teclas.Add('23=SN');//23
  form40.teclas.Add('24=SN');
  form40.teclas.Add('25=123');
  form40.teclas.Add('26=SN');
  form40.teclas.Add('27=SN');
  form40.teclas.Add('28=SN');
  form40.teclas.Add('29=0123456789'+#8);
  form40.teclas.Add('30=SN');
  form40.teclas.Add('31=SN');
  form40.teclas.Add('32=SN');
  form40.teclas.Add('33=ABCDEFGHIJLMNOPKXYZWQRSTUVXZ');
  form40.teclas.Add('34=SN');
  form40.teclas.Add('35=');
  form40.teclas.Add('36=SN');
  form40.teclas.Add('37=SNP');
  form40.teclas.Add('38=123');
  form40.teclas.Add('39=SN');
  form40.teclas.Add('40=');
  form40.teclas.Add('39=SN');
  form40.teclas.Add('40=SN');
  form40.teclas.Add('41=SN');
  form40.teclas.Add('42=SN');
  form40.teclas.Add('43=SNC');
  form40.teclas.Add('44=SN');
  form40.teclas.Add('45=SN');
  form40.teclas.Add('46=SN');
  form40.teclas.Add('47=12');
  form40.teclas.Add('48=01');
  form40.teclas.Add('49=SN');
  form40.teclas.Add('50=SN');
  form40.teclas.Add('51=SN');
  form40.teclas.Add('52=1234567890' + #8);
  form40.teclas.Add('53=SN');
  form40.teclas.Add('54=SN');
  form40.teclas.Add('55=SN');
  form40.teclas.Add('56=SN');
  form40.teclas.Add('57=SNE');
  form40.teclas.Add('58=SN');
  form40.teclas.Add('59=SN');
  form40.teclas.Add('60=SN');
  form40.teclas.Add('61=SNC');
  form40.teclas.Add('62=SN');
  form40.teclas.Add('63=SN');
  form40.teclas.Add('64=');
  form40.teclas.Add('65=SN');
  form40.teclas.Add('66=SN');
  form40.teclas.Add('67=1234567890ABCDEFGHIJLMNOPKXYZWQRSTUVXZ');
  form40.teclas.Add('68=SN');
  form40.teclas.Add('69=DPN');
  form40.teclas.Add('70=SNC');
  form40.teclas.Add('71=SN');
  form40.teclas.Add('72=1234567890' + #8);
  form40.teclas.Add('73=SN');
  form40.teclas.Add('74=12345');
  form40.teclas.Add('75=SN');
  form40.teclas.Add('76=SN');
  form40.teclas.Add('77=SN');
  form40.teclas.Add('78=SN');
  form40.teclas.Add('79=1234567890' + #8);
  form40.teclas.Add('80=1234567890' + #8);
  form40.teclas.Add('81=SN');
  form40.teclas.Add('82=SN');
  form40.teclas.Add('83=SN');
  form40.teclas.Add('84=1234567890' + #8);
  form40.teclas.Add('85=SN');
  form40.teclas.Add('86=SN');
  form40.teclas.Add('87=0123456789'+#8);
  form40.teclas.Add('88=SN');
  form40.teclas.Add('89=SN');
  form40.teclas.Add('90=SN');
  form40.teclas.Add('91=SN');
  form40.teclas.Add('92=SNX');
  form40.teclas.Add('93=SN');
  form40.teclas.Add('94=12');
  form40.teclas.Add('95=SN');
  form40.teclas.Add('96=1234567890' + #8);
  form40.teclas.Add('97=1234567890' + #8);
  form40.teclas.Add('98=12');
  form40.teclas.Add('99=');
  form40.teclas.Add('100=SN');
  form40.troca.Add('101=');

  form40.ListBox1.Clear;
  form40.ListBox1.Items.Add('0=Qual o M�todo de Arredondamento(F-Financeiro,T-Trunca)?');
  form40.ListBox1.Items.Add('1=Qual a Sequ�ncia de Colunas na Venda(Padr�o:0123456789)?'+#13+#13+'0-C�digo de Sequencia '+#13+'1-Descri��o do Produto'+#13+'2-Pre�o de Venda'+#13+'3-Quantidade'+#13+'4-Unidade'+#13+'5-C�digo de Barras'+#13+'6-Aplica��o'+#13+'7-Refer�ncia Original'+#13+'8-Localiza��o'+#13+'9-Dep�sito');
  form40.ListBox1.Items.Add('2=Confirmar o Valor Total da Nota(S - Reais, N - Porcentagem, X - Ambos)?');
  form40.ListBox1.Items.Add('3=Qual o Padr�o Para Cliente Ativo no Cadastro de Clientes (S/N)? ');
  form40.ListBox1.Items.Add('4=Permitir Venda Sem Estoque Disponivel (S/N)? ');
  form40.ListBox1.Items.Add('5=Usar Recursos de Auto-Pe�as (S/N)? ');
  form40.ListBox1.Items.Add('6=Qual a Taxa Para Corre��o de Contas a Receber em Atraso (ao dia)? ');
  form40.ListBox1.Items.Add('7=Qual o Nome (Rota)? ');
  form40.ListBox1.Items.Add('8=Qual o Tipo Carn� (Padr�o-1, 3-Pequeno)? ');
  form40.ListBox1.Items.Add('9=Usar Nota Fiscal Eletr�nica? ');
  form40.ListBox1.Items.Add('10=Qual o Regime de Tributa��o(1-Simples Nacional 2-Simples C/ Excesso de Sublimite 3-Regime Normal/Lucro Presumido 4-Regime Normal/Lucro Real)? ');
  form40.ListBox1.Items.Add('11=Qual a Aliquota do PIS(Lucro Presumido=0,65% Lucro Real=1,65%)? ');
  form40.ListBox1.Items.Add('12=Qual a Aliquota do COFINS(Lucro Presumido=3,00% Lucro Real=7,60%)? ');
  form40.ListBox1.Items.Add('13=Usar Vendas por C�digo de Barras? ');
  form40.ListBox1.Items.Add('14=Usar Sistema de Servi�os? ');
  form40.ListBox1.Items.Add('15=Usar Informa��es de Frete na Nota Fiscal Eletr�nica? ');
  form40.ListBox1.Items.Add('16=Permitir Acesso do Vendedor ao Cadastro de Clientes? ');
  form40.ListBox1.Items.Add('17=Usar Rotina de Venda no Atacado ?');
  form40.ListBox1.Items.Add('18=Qual o Periodo para Calculo do Estoque M�nimo (em dias)?');
  form40.ListBox1.Items.Add('19=Imprime Nota na Venda (S/N/P-Perguntar padrao S/X-Perguntar Padrao N)?');
  form40.ListBox1.Items.Add('20=Imprime Parcelamento na Venda (S/N)?');
  form40.ListBox1.Items.Add('21=Exigir Confirma��o das notas de Pedido para o Movimento do dia (S/N)?');
  form40.ListBox1.Items.Add('22=Qual a Aliquota Padr�o no Cadastro de Produto ?');
  form40.ListBox1.Items.Add('23=Habilitar Funcionamento em Rede?');
  form40.ListBox1.Items.Add('24=Habilitar Sa�da de Estoque ?');
  form40.ListBox1.Items.Add('25=Comparar Lucro com 1-Custo da Nota, 2-Custo Real, 3-Pre�o de Venda?');
  form40.ListBox1.Items.Add('26=Usar NCM na Nota Fiscal Eletr�nica?');
  form40.ListBox1.Items.Add('27=Imprimir Endere�o do Cliente no Cupom da Venda?');
  form40.ListBox1.Items.Add('28=Qual o Desconto para Pagamento a Vista?');  // Padrao  � 20 %
  form40.ListBox1.Items.Add('29=Qual o Desconto para Pagamento em Cart�o de Cr�dito?'); //Padr�o � 15%
  form40.ListBox1.Items.Add('30=Usar Cadastro de Produtos em S�rie na Entrada Simples?');
  form40.ListBox1.Items.Add('31=Usar ROTA no Cadastro de Clientes?');
  form40.ListBox1.Items.Add('32=Fazer Opera��o de Troco na Rotina de Vendas?');
  form40.ListBox1.Items.Add('33=Qual o Unidade para Fazer Backup?');
  form40.ListBox1.Items.Add('34=Perguntar Quantidade no C�digo de Barras?');
  form40.ListBox1.Items.Add('35=Qual o Padr�o de Nomes Para o Sistema de Servi�os?');
  form40.ListBox1.Items.Add('36=Usar ACBrNFeMonitor?');
  form40.ListBox1.Items.Add('37=Usar DESCONTO no PDV (S-Venda P-Produtos N-Nenhum)?');
  form40.ListBox1.Items.Add('38=Qual a Informa��o contida na Etiqueta da balan�a (1-Quantidade 2-Pre�o Total 3-Nenhum) ?');
  form40.ListBox1.Items.Add('39=Usar Rotina de Acerto de Estoque ?');
  form40.ListBox1.Items.Add('40=Qual a Porcetagem para Calculo do Imposto na Nota Fiscal ?');
  form40.ListBox1.Items.Add('41=Usar Acerto de Estoque de Produtos em S�rie ?');
  form40.ListBox1.Items.Add('42=Usar Busca Por C�digo no PDV ?');
  form40.ListBox1.Items.Add('43=Usar Campo Pre�o de Custo na Consulta de Produtos? (S-Sim N-N�o C-Somente Usuarios sem Bloqueios)');
  form40.ListBox1.Items.Add('44=Perguntar Taxa de Juros para Contas a Receber em Atrado?');
  form40.ListBox1.Items.Add('45=Usar Cupom Eletr�nico em Contig�ncia Offline?');
  form40.ListBox1.Items.Add('46=Usar Consulta de Produtos Completa No Cad. de Produto ?');
  form40.ListBox1.Items.Add('47=Qual o M�todo de Busca(1-Come�o 2-Contido) ?');
  form40.ListBox1.Items.Add('48=Exibir Nome do Cliente no Relat�rio de Vendas Por Nota (0-Sim 1-N�o) ?');
  form40.ListBox1.Items.Add('49=Usar C�d. de Barras na Impress�o do Pedido LOCALIZA ?');
  form40.ListBox1.Items.Add('50=Usar Busca Cod. Barras na Entrada Simples ?');
  form40.ListBox1.Items.Add('51=Usar Or�amentos Individuais por Vendedor ?');
  form40.ListBox1.Items.Add('52=Qual o CFOP para Vendas do ECF ?');
  form40.ListBox1.Items.Add('53=Usar Cadastro de Cliente Simplificado na Ident. NFCe ?');
  form40.ListBox1.Items.Add('54=XX ?');
  form40.ListBox1.Items.Add('55=Usar Desconto M�ximo por Produto ?');
  form40.ListBox1.Items.Add('56=Imprimir Parcelamento na NFe ?');
  form40.ListBox1.Items.Add('57=Imprimir Entradas no Caixa no Relat�rio de Vendas por Nota (S-Ent. e Saidas/N-Nenhum/E-Entradas) ?');
  form40.ListBox1.Items.Add('58=Usar Controle de validade de Mercadorias (S/N) ?');
  form40.ListBox1.Items.Add('59=Bloquear a Venda de Produtos Fracionados Por Unidade de Medida (S/N) ?');
  form40.ListBox1.Items.Add('60=Usar C�d. de Barras na Tabela de Itens Vendidos (S/N) ?');
  form40.ListBox1.Items.Add('61=Usar Qual Campo na Sub-Consulta de Produtos (S-Refori/N-cod Seq./C-codbar) ?');
  form40.ListBox1.Items.Add('62=Desabilitar Ponteiro Ap�s Consulta Por C�digo de Barras ?');
  form40.ListBox1.Items.Add('63=Usar Venda de Mercadorias em Pe�as Sob Medida M2 (S/N) ?');
  form40.ListBox1.Items.Add('64=Confirme as Mercadorias de Venda Sob Medida:');
  form40.ListBox1.Items.Add('65=Buscar Por C�digo no Cadastro de Produtos ?');
  form40.ListBox1.Items.Add('66=Desabilitar Botao Excluir no Cadastro de Produtos ?');
  form40.ListBox1.Items.Add('67=Qual a Mensagem Padr�o no Pedido de Or�amentos ?');
  form40.ListBox1.Items.Add('68=Desabilitar Redimensionamento de Telas ?');
  form40.ListBox1.Items.Add('69=Para Vendas a Prazo, Imprimir no Fim da Veda (D-Duplicata P-Promissoria N-Nenhum) ?');
  form40.ListBox1.Items.Add('70=Emitir NFe no Final da Venda ? (S-NFe C-NFCe N-Nenhum)');
  form40.ListBox1.Items.Add('71=Confirmar Pre�o dos Produtos Sem Gravar como Desconto ?');
  form40.ListBox1.Items.Add('72=Quantidade de dias de vendas para sugest�o de compras:');
  form40.ListBox1.Items.Add('73=Usar mensagem individual para cada venda ?');
  form40.ListBox1.Items.Add('74=Imprimir no Pedido de Venda ? (1-Localizacao 2-Ref. Original 3-Cod Barras 4-Ref.Ori,Locali 5-Codbar,Localiza)');
  form40.ListBox1.Items.Add('75=Imprimir Ordem de Servi�o na Separa Pe�as ?');
  form40.ListBox1.Items.Add('76=Exigir dados completos do cliente no cadastro ?');
  form40.ListBox1.Items.Add('77=Abrir Consulta de Cod de Barras ao Entrar na Venda ?');
  form40.ListBox1.Items.Add('78=Buscar Conta a Pagar por Documento ?');
  form40.ListBox1.Items.Add('79=Qual o Limite de dias para Emissao de NFCe em Conting�ncia ?');
  form40.ListBox1.Items.Add('80=Qual o periodo de Dias para Backup de Vendas ?');
  form40.ListBox1.Items.Add('81=Imprimir SUBTOTAL no Ticket de Venda ?');
  form40.ListBox1.Items.Add('82=Bloquear Cadastro de Cod. Barras Duplicados ?');
  form40.ListBox1.Items.Add('83=Usar parcelamento na venda ?');
  form40.ListBox1.Items.Add('84=Qual o fator multiplicativo m�ximo para convers�o de unidades de medida? (Padrao 144)');
  form40.ListBox1.Items.Add('85=Enviar Email Automatico com NFe para o Destinatario ?');
  form40.ListBox1.Items.Add('86=Preencher CFOPs de Substitui��o Tributaria Automaticamente ?');
  form40.ListBox1.Items.Add('87=Imprimir Recibo de Pagamento de Contas a receber em Quantas Vias ?');
  form40.ListBox1.Items.Add('88=Imprimir Controle de Entrega no Pedido de Venda ?');
  form40.ListBox1.Items.Add('89=Organizar CAMPOS na compra igual a VENDA ?');
  form40.ListBox1.Items.Add('90=Usar Equival�ncias ?');
  form40.ListBox1.Items.Add('91=Filtrar por Fornecedor na COMPRA ?');
  form40.ListBox1.Items.Add('92=Qual o campo adicional na ficha de cliente: S-Local de trabalho N-Conjuge X-Suframa?');
  form40.ListBox1.Items.Add('93=Mostrar campo Refer�ncia na entrada Simples ?');
  form40.ListBox1.Items.Add('94=Qual a Ordem dos campos na Equivalencia (1-refori,codbar 2-codbar,refori) ?');
  form40.ListBox1.Items.Add('95=Usar Campo de Informa��es adicionais de produto no campo OBS do cadastro de Produto ?');
  form40.ListBox1.Items.Add('96=Qual o CFOP para vendas de mercadorias daquiridas DENTRO do estado ?(Padrao 5102)');
  form40.ListBox1.Items.Add('97=Qual o CFOP para vendas de mercadorias daquiridas FORA do estado ?(Padrao 6102)');
  form40.ListBox1.Items.Add('98=Qual o Estoque a ser Baixado nas vendas de Atacado ? (1-Loja 2-Deposito)');
  form40.ListBox1.Items.Add('99=Qual o C�digo do Plano de Contas para o Sped Contribui��es ?');
  form40.ListBox1.Items.Add('100=Permitir a venda de Produtos com valor (0) Zero ?');
  form40.ListBox1.Items.Add('101=Qual a Ordem da Tabela de Compra (Padr�o:0123456789)?'+#13+#13+'0-Descricao '+#13+'1-Pre�o de Compra'+#13+'2-M�nimo'+#13+'3-Estoque Loja'+#13+'4-Estoque Dep�sito'+#13+'5-Sugest�o'+#13+'6-Unidade'+#13+'7-Refer�ncia Original'+#13+'8-C�digo Barras'+#13+'9-Cod Sequ�ncia');

  Form40.ListBox1.Selected[0] := true;
  form40.showmodal;
end;

procedure TForm2.PendentesdeEntrega1Click(Sender: TObject);
var
  sim, cliente : String;
  tot, quant : currency;
begin
  sim := funcoes.dialogo('normal',0,'SN',30,false,'S',Application.Title,'Enviar para Impressora?(S/N)' + #13 + #10,'N');
  if (sim = '*') then exit;


  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select e.nota, sum(e.quant) from cont_entrega e ' +
  'group by e.nota having sum(e.quant) <> (select sum(quant) ' +
  'from item_venda i where i.nota = e.nota)';
  dm.IBselect.Open;

  if dm.IBselect.IsEmpty then begin
    dm.IBselect.Close;
    ShowMessage('N�o Existem Produtos a Serem Entregues!');
    exit;
  end;

  form19.RichEdit1.Clear;
  addRelatorioForm19(funcoes.RelatorioCabecalho(form22.Pgerais.Values['empresa'], 'PRODUTOS PENDENTES PARA ENTREGA', 78));
  addRelatorioForm19(funcoes.CompletaOuRepete('| Nota      Data    Cliente                                             Total', '|', ' ', 78) + CRLF);
  addRelatorioForm19(                         '+----------------------------------------------------------------------------+' + CRLF);
  
  tot := 0;
  while not dm.IBselect.Eof do
    begin
      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Text := 'select sum(total) as total from item_venda i where nota = :nota';
      dm.IBQuery1.ParamByName('nota').AsInteger := dm.IBselect.FieldByName('nota').AsInteger;
      dm.IBQuery1.Open;

      quant := dm.IBQuery1.FieldByName('total').AsCurrency;
      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Text := 'select sum(p.p_venda * e.quant) as total from cont_entrega'+
      ' e left join produto p on (p.cod = e.cod) where nota = :nota';
      dm.IBQuery1.ParamByName('nota').AsInteger := dm.IBselect.FieldByName('nota').AsInteger;
      dm.IBQuery1.Open;
      quant := quant - dm.IBQuery1.FieldByName('total').AsCurrency;

      tot := tot + quant;

      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Text := 'select v.data, v.cliente, c.nome from venda v '+
      'left join cliente c on (v.cliente = c.cod) where v.nota = :nota';
      dm.IBQuery1.ParamByName('nota').AsInteger := dm.IBselect.FieldByName('nota').AsInteger;
      dm.IBQuery1.Open;

      addRelatorioForm19(funcoes.CompletaOuRepete('', dm.IBselect.fieldbyname('nota').AsString, '0', 7) + '  ' + funcoes.CompletaOuRepete(FormatDateTime('dd/mm/yyyy', dm.IBQuery1.fieldbyname('data').AsDateTime), '', ' ', 11) +
       CompletaOuRepete(LeftStr(dm.IBQuery1.fieldbyname('cliente').AsString+'-'+dm.IBQuery1.fieldbyname('nome').AsString, 34), '', ' ', 34)+funcoes.CompletaOuRepete('', formataCurrency(quant), ' ', 23) + CRLF);
      dm.IBselect.Next;
    end;

  dm.IBselect.Close;
  dm.IBQuery1.Close;
  addRelatorioForm19('+----------------------------------------------------------------------------+' + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', ' ', 7) + '  ' + funcoes.CompletaOuRepete('', '', ' ', 11) + funcoes.CompletaOuRepete('', '', ' ', 11)+ funcoes.CompletaOuRepete('', 'T O T A L: ', ' ', 34) + funcoes.CompletaOuRepete('', formataCurrency(tot), ' ', 12) + CRLF);
  addRelatorioForm19('+----------------------------------------------------------------------------+' + CRLF);
  if sim = 'S' then imprime.textx('')
  else form19.ShowModal;
end;

procedure TForm2.PendnciasNFe1Click(Sender: TObject);
begin
  funcoes.verificaNFe;
end;

procedure TForm2.abelaPostodeGasolina1Click(Sender: TObject);
var sim,sql,grup:string;
begin
b:=88;
form19.RichEdit1.Clear;
//form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#15+#13))));
addRelatorioForm19('|' + #15 + '|' + CRLF);
sql:='';
grup := funcoes.dialogo('generico',0,'1234567890'+#8,0,false,'','Control For Windows','Se Deseja Separa��o por GRUPO, Informe um C�d.:','') ;
if (grupo<>'*') then  sim:=funcoes.dialogo('generico',0,'SN',0,false,'S','Control For Windows','Imprimir Quantidade Atual em Estoque?S/N:','N') ;
if grup<>'' then sql:='Where grupo='+grup;


if not funcoes.Contido('*',sim+grupo) then
 begin
   dm.ProdutoQY.SQL.Clear;
   dm.ProdutoQY.SQL.Add('select cod,unid,emb,nome, p_venda, quant,fabric,fornec,grupo from produto '+sql + ' order by nome');
   dm.ProdutoQY.Open;

   dm.ProdutoQY.FetchAll;
   funcoes.CharSetRichEdit(form19.richedit1);
   form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#218,'',#196,21)+funcoes.CompletaOuRepete(#194,'',#196,9)+funcoes.CompletaOuRepete(#194,'',#196,9)+funcoes.CompletaOuRepete(#194,'',#196,9)+funcoes.CompletaOuRepete(#194,'',#196,9)+funcoes.CompletaOuRepete(#194,'',#196,9)+funcoes.CompletaOuRepete(#194,'',#196,21)+funcoes.CompletaOuRepete(#194,'',#196,9)+funcoes.CompletaOuRepete(#194,'',#196,9)+funcoes.CompletaOuRepete(#194,'',#196,9)+funcoes.CompletaOuRepete(#194,'',#196,9)+funcoes.CompletaOuRepete(#194,#191,#196,10)+#13+#10))));
   form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+'    Descricao',#179,' ',22)+funcoes.CompletaOuRepete('Anterior',#179,' ',9)+funcoes.CompletaOuRepete(' atual ',#179,' ',9)+funcoes.CompletaOuRepete('Vendido',#179,' ',9)+funcoes.CompletaOuRepete('  Preco',#179,' ',9)+funcoes.CompletaOuRepete(' Total',#179,' ',9)+funcoes.CompletaOuRepete('      Descricao',#179,' ',21)+funcoes.CompletaOuRepete('Anterior',#179,' ',9)+funcoes.CompletaOuRepete(' Atual',#179,' ',9)+funcoes.CompletaOuRepete(' Vendido',#179,' ',9)+funcoes.CompletaOuRepete(' Preco',#179,' ',9)+funcoes.CompletaOuRepete(' Total',#179,' ',9)+#13+#10))));
   form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#195,'',#196,21)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,21)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,#180,#196,10)+#13+#10))));
 end;

if (sim='S') and not funcoes.Contido('*',sim+grupo) then
begin
   dm.ProdutoQY.First;
               funcoes.informacao(1,2,'AGUARDE... ',true,false,2);
               while not dm.ProdutoQY.Eof do
                 begin

                   funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,false,2);
                   form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+copy(dm.ProdutoQY.fieldbyname('nome').AsString,1,20),#179,' ',22)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.0',StrToCurr(dm.ProdutoQY.fieldbyname('quant').AsString))+#179,' ',9)+funcoes.CompletaOuRepete('',#179,' ',9)+funcoes.CompletaOuRepete('',#179,' ',9)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('p_venda').AsString))+#179,' ',9)+funcoes.CompletaOuRepete('',#179,' ',9)))));
                   dm.ProdutoQY.Next;

                   if not(dm.ProdutoQY.Eof) then
                     begin
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(copy(dm.ProdutoQY.fieldbyname('nome').AsString,1,20),#179,' ',21)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.0',StrToCurr(dm.ProdutoQY.fieldbyname('quant').AsString))+#179,' ',9)+funcoes.CompletaOuRepete('',#179,' ',9)+funcoes.CompletaOuRepete('',#179,' ',9)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('p_venda').AsString))+#179,' ',9)+funcoes.CompletaOuRepete('',#179,' ',9)+#13+#10))));
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#195,'',#196,21)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,21)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,#180,#196,10)+#13+#10))));
                     end
                   else
                     begin
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#179,' ',21)+funcoes.CompletaOuRepete('',#179,' ',9)+funcoes.CompletaOuRepete('',#179,' ',9)+funcoes.CompletaOuRepete('',#179,' ',9)+funcoes.CompletaOuRepete('',#179,' ',9)+funcoes.CompletaOuRepete('',#179,' ',9)+#13+#10))));
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#195,'',#196,21)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,21)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,#180,#196,10)+#13+#10))));
                     end;
                   if (form19.RichEdit1.Lines.Count>=b) then
                     begin
                       b:=b+88;
                       if b>88 then form19.RichEdit1.Lines.Delete(form19.RichEdit1.Lines.Count-1);
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#192,'',#196,21)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,21)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,#217,#196,10)+#12+#13+#10))));
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#218,'',#196,21)+funcoes.CompletaOuRepete(#194,'',#196,9)+funcoes.CompletaOuRepete(#194,'',#196,9)+funcoes.CompletaOuRepete(#194,'',#196,9)+funcoes.CompletaOuRepete(#194,'',#196,9)+funcoes.CompletaOuRepete(#194,'',#196,9)+funcoes.CompletaOuRepete(#194,'',#196,21)+funcoes.CompletaOuRepete(#194,'',#196,9)+funcoes.CompletaOuRepete(#194,'',#196,9)+funcoes.CompletaOuRepete(#194,'',#196,9)+funcoes.CompletaOuRepete(#194,'',#196,9)+funcoes.CompletaOuRepete(#194,#191,#196,10)+#13+#10))));
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+'    Descricao',#179,' ',22)+funcoes.CompletaOuRepete('Anterior',#179,' ',9)+funcoes.CompletaOuRepete(' atual ',#179,' ',9)+funcoes.CompletaOuRepete('Vendido',#179,' ',9)+funcoes.CompletaOuRepete('  Preco',#179,' ',9)+funcoes.CompletaOuRepete(' Total',#179,' ',9)+funcoes.CompletaOuRepete('      Descricao',#179,' ',21)+funcoes.CompletaOuRepete('Anterior',#179,' ',9)+funcoes.CompletaOuRepete(' Atual',#179,' ',9)+funcoes.CompletaOuRepete(' Vendido',#179,' ',9)+funcoes.CompletaOuRepete(' Preco',#179,' ',9)+funcoes.CompletaOuRepete(' Total',#179,' ',9)+#13+#10))));
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#195,'',#196,21)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,21)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,#180,#196,10)+#13+#10))));
                     end;
              dm.ProdutoQY.Next;
      end;
                 if dm.ProdutoQY.RecNo=dm.ProdutoQY.RecordCount then
                  begin
                    form19.RichEdit1.Lines.Delete(form19.RichEdit1.Lines.Count-1);
                    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#192,'',#196,21)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,21)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,#217,#196,10)+#13+#10))));
                  end;
               funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,true,2);
               form19.RichEdit1.SelStart:=1;
               form19.ShowModal;
end
  else if (sim='N') and not funcoes.Contido('*',sim+grupo) then
    begin
      dm.ProdutoQY.First;
               funcoes.informacao(1,2,'AGUARDE... ',true,false,2);
               while not dm.ProdutoQY.Eof do
                 begin

                   funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,false,2);
                   form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+copy(dm.ProdutoQY.fieldbyname('nome').AsString,1,20),#179,' ',22)+funcoes.CompletaOuRepete('',#179,' ',9)+funcoes.CompletaOuRepete('',#179,' ',9)+funcoes.CompletaOuRepete('',#179,' ',9)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('p_venda').AsString))+#179,' ',9)+funcoes.CompletaOuRepete('',#179,' ',9)))));
                   dm.ProdutoQY.Next;

                   if not(dm.ProdutoQY.Eof) then
                     begin
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(copy(dm.ProdutoQY.fieldbyname('nome').AsString,1,20),#179,' ',21)+funcoes.CompletaOuRepete('',#179,' ',9)+funcoes.CompletaOuRepete('',#179,' ',9)+funcoes.CompletaOuRepete('',#179,' ',9)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('p_venda').AsString))+#179,' ',9)+funcoes.CompletaOuRepete('',#179,' ',9)+#13+#10))));
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#195,'',#196,21)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,21)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,#180,#196,10)+#13+#10))));
                     end
                   else
                     begin
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#179,' ',21)+funcoes.CompletaOuRepete('',#179,' ',9)+funcoes.CompletaOuRepete('',#179,' ',9)+funcoes.CompletaOuRepete('',#179,' ',9)+funcoes.CompletaOuRepete('',#179,' ',9)+funcoes.CompletaOuRepete('',#179,' ',9)+#13+#10))));
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#195,'',#196,21)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,21)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,#180,#196,10)+#13+#10))));
                     end;
                   if (form19.RichEdit1.Lines.Count>=b) then
                     begin
                       b:=b+88;
                       if b>88 then form19.RichEdit1.Lines.Delete(form19.RichEdit1.Lines.Count-1);
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#192,'',#196,21)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,21)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,#217,#196,10)+#12+#13+#10))));
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#218,'',#196,21)+funcoes.CompletaOuRepete(#194,'',#196,9)+funcoes.CompletaOuRepete(#194,'',#196,9)+funcoes.CompletaOuRepete(#194,'',#196,9)+funcoes.CompletaOuRepete(#194,'',#196,9)+funcoes.CompletaOuRepete(#194,'',#196,9)+funcoes.CompletaOuRepete(#194,'',#196,21)+funcoes.CompletaOuRepete(#194,'',#196,9)+funcoes.CompletaOuRepete(#194,'',#196,9)+funcoes.CompletaOuRepete(#194,'',#196,9)+funcoes.CompletaOuRepete(#194,'',#196,9)+funcoes.CompletaOuRepete(#194,#191,#196,10)+#13+#10))));
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+'    Descricao',#179,' ',22)+funcoes.CompletaOuRepete('Anterior',#179,' ',9)+funcoes.CompletaOuRepete(' atual ',#179,' ',9)+funcoes.CompletaOuRepete('Vendido',#179,' ',9)+funcoes.CompletaOuRepete('  Preco',#179,' ',9)+funcoes.CompletaOuRepete(' Total',#179,' ',9)+funcoes.CompletaOuRepete('      Descricao',#179,' ',21)+funcoes.CompletaOuRepete('Anterior',#179,' ',9)+funcoes.CompletaOuRepete(' Atual',#179,' ',9)+funcoes.CompletaOuRepete(' Vendido',#179,' ',9)+funcoes.CompletaOuRepete(' Preco',#179,' ',9)+funcoes.CompletaOuRepete(' Total',#179,' ',9)+#13+#10))));
                       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#195,'',#196,21)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,21)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,'',#196,9)+funcoes.CompletaOuRepete(#197,#180,#196,10)+#13+#10))));
                     end;
              dm.ProdutoQY.Next;
      end;
                 if dm.ProdutoQY.RecNo=dm.ProdutoQY.RecordCount then
                  begin
                    form19.RichEdit1.Lines.Delete(form19.RichEdit1.Lines.Count-1);
                    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#192,'',#196,21)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,21)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,'',#196,9)+funcoes.CompletaOuRepete(#193,#217,#196,10)+#13+#10))));
                  end;
               funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,true,2);
               form19.RichEdit1.SelStart:=1;
               dm.ProdutoQY.Close;
               form19.ShowModal;
    end;
end;


procedure TForm2.PreoAtacadoeVarejo1Click(Sender: TObject);
var estoquezero:string;
begin
  b:=88;
  fornec:='';
  fabric:='';
  grupo:='';
  form19.RichEdit1.Clear;

  funcoes.PerguntasRel(dm.produtoqy,'2',false,'','');
  if not funcoes.Contido('*',grupo) then estoquezero:=funcoes.dialogo('generico',0,'SN',0,false,'S','Control For Windows','Imprimir Itens Com Estoque Zero','S');
  if estoquezero='N' then estoquezero:='where quant>0' ;
  //ShowMessage(grupo);
  //form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#15+#13))));
  addRelatorioForm19('|' + #15 + '|' + CRLF);
  if not funcoes.Contido('*',grupo+estoquezero) then
    begin
      dm.ProdutoQY.SQL.Clear;
      dm.ProdutoQY.SQL.Add('select cod,unid,fornec,refori,fabric,grupo,codbar,nome, p_venda,p_venda1,p_compra,quant from produto '+estoquezero+' order by nome');
      dm.ProdutoQY.open;
      dm.ProdutoQY.FetchAll;

      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS ATACADO E VAREJO   ',115)))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('FORNEC  CODIGO REF. ORIGINAL   DESCRICAO DO PRODUTO                  UNID.           QUANT     VAREJO       ATACADO' +#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',117)))));

         dm.ProdutoQY.First;
         funcoes.informacao(1,2,'AGUARDE... ',true,false,2);

        grupo:='';
        fabric:='';
           while not dm.ProdutoQY.Eof do
             begin
               if form19.RichEdit1.Lines.Count>=b then
                 begin
                   b:=b+88;
                   form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('-',#4+#12+#13+#10,'-',119)))));
                    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'TABELA DE PRECOS ATACADO E VAREJO   ',115)))));
                    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('FORNEC  CODIGO REF. ORIGINAL   DESCRICAO DO PRODUTO                  UNID.           QUANT     VAREJO       ATACADO' +#13+#10))));
                    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',117)))));

                 end;

               funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,false,2);

               //filtro no dataset e ordenacao por fabric
               if funcoes.PerguntasRel(dm.produtoqy,'2',true,'','') then form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',dm.ProdutoQY.fieldbyname('fornec').AsString,' ',6)+' '+funcoes.CompletaOuRepete('',dm.ProdutoQY.fieldbyname('cod').AsString,' ',7)+' '+funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('refori').AsString,'',' ',15)+funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('nome').AsString,'',' ',40) +' '  + funcoes.CompletaOuRepete(dm.ProdutoQY.fieldbyname('unid').AsString,'',' ',5)+ funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('quant').AsString)),' ',13)+ funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('p_venda').AsString)),' ',13)+ funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',StrToCurr(dm.ProdutoQY.fieldbyname('p_venda1').AsString)),' ',13)+#13+#10))));
               if dm.ProdutoQY.RecNo=dm.ProdutoQY.RecordCount then form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',#13+#10,'-',117)))));
               dm.ProdutoQY.Next;


      end;


    grupo:='';
    fornec:='';
    fabric:='';

    funcoes.informacao(dm.ProdutoQY.RecNo,dm.ProdutoQY.RecordCount,'AGUARDE... ',false,true,2);
    form19.RichEdit1.SelStart:=1;
    dm.ProdutoQY.Close;
    form19.Show;
end;



end;

procedure TForm2.ContasaPagar2Click(Sender: TObject);
begin
  lancContasPagar := tlancContasPagar.Create(self);
  funcoes.CtrlResize(tform(lancContasPagar));
  lancContasPagar.ShowModal;
  lancContasPagar.Free;
  {Form27 := Tform27.Create(Self);
  funcoes.CtrlResize(tform(form27));
  form27.ShowModal;
  form27.Free;}
end;

procedure TForm2.Lanamentos1Click(Sender: TObject);
begin
Form29 := Tform29.Create(Self);
funcoes.CtrlResize(tform(form29));
form29.ShowModal;
form29.Free;
end;

procedure TForm2.Baixa1Click(Sender: TObject);
begin
Form30 := Tform30.Create(Self);
funcoes.CtrlResize(tform(form30));
form30.ShowModal;
form30.Free;
end;

procedure TForm2.ContasPagar1Click(Sender: TObject);
var
  grupo, ini,fim,his,g1,h1, ordem:string;
begin
  grupo := funcoes.dialogo('generico',0,'1234567890'+#8,50,false,'',Application.Title,'Qual o Grupo?','');
  if grupo = '*' then exit;

  ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(StartOfTheMonth(form22.datamov)));
  if ini = '*' then exit;

  fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?', formatadataddmmyy(endOfTheMonth(form22.datamov)));
  if fim = '*' then exit;

  his := funcoes.dialogo('normal',0,'',150,false,'',Application.Title,'Qual o Hist�rico?','');
  if his = '*' then exit;

  ordem := '2';
  ordem := funcoes.dialogo('generico',0,'123',50,false,'',Application.Title,'Qual a Ordem (1-Vencimento Desc. 2-Vencimento Asc. 3-Historico)?', ordem);
  if ordem = '*' then exit;

  if ordem = '1' then ordem := ' order by c.vencimento desc'
  else if ordem = '2' then ordem := ' order by c.vencimento asc'
  else if ordem = '3' then ordem := ' order by c.historico';

    if grupo<>'' then g1:= ' (c.codgru='+grupo+') and ';
    if his<>'' then h1:=' and (c.historico like upper('+QuotedStr('%'+his+'%')+'))';

    Form31 := Tform31.Create(Self);
    funcoes.CtrlResize(tform(form31));
    try
    dm.IBselect.SQL.Clear;
    dm.IBselect.SQL.Add('select c.documento, c.vencimento, c.codhis, c.historico, c.valor,(''   ''||lpad(c.usuario, 2, ''0'') || ''-''|| u.nome) as usu, c.usuario ,c.codgru, c.cod '+
    '  from contaspagar c left join usuario u on (c.usuario = u.cod) where '+g1+' (c.pago=0) and (c.vencimento>=:ini) and (c.vencimento<=:fim) '+h1 + ordem);
    dm.IBselect.ParamByName('ini').AsDateTime := StrToDate(ini);
    dm.IBselect.ParamByName('fim').AsDateTime := StrToDate(fim);
    dm.IBselect.Open;
    dm.IBselect.FieldByName('usuario').Visible  := false;
    dm.IBselect.FieldByName('codgru').Visible   := false;
    dm.IBselect.FieldByName('cod').Visible      := false;
    dm.IBselect.FieldByName('usu').DisplayLabel := 'USUARIO';
    funcoes.FormataCampos(dm.ibselect,2,'valor',2);
    except
      on e : exception do
        begin
          ShowMessage('Erro: ' + e.Message + #13 + #10 + 'Verifique se as datas s�o v�lidas');
          exit;
        end;
    end;

    form31.DBGrid1.DataSource := dm.ds1;
    form31.ShowModal;
    form31.Free;
end;

procedure TForm2.ControledeEntrada1Click(Sender: TObject);
begin
  if RetornaAcessoUsuario > 0 then begin
    MessageDlg('Rotina Bloqueada!', mtInformation, [mbOK], 1);
    exit;
  end;

  nota := funcoes.dialogo('generico',0,'1234567890,.'+#8,100,false,'','Relat�rio de Entradas','Qual o N�mero da Nota ?','');
  if (nota = '*') or (nota = '') then exit;

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select nota from venda where cancelado = 0 and nota = :nota';
  dm.IBselect.ParamByName('nota').AsString := nota;
  dm.IBselect.Open;

  if dm.IBselect.IsEmpty then begin
    dm.IBselect.Close;
    ShowMessage('Venda N�o Encontrada!');
    exit;
  end;

  {dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select i.nota, i.data, i.cod, p.nome, i.quant from item_venda i'+
  ' left join produto p on (p.cod = i.cod) where i.nota = :nota';
  dm.IBselect.ParamByName('nota').AsString := nota;
  dm.IBselect.Open;

  dm.IBQuery2.Close;
  dm.IBQuery2.SQL.Text := 'select i.nota, i.DATA_ENTREGA, i.cod, p.nome, i.quant from CONT_ENTREGA ' +
  'i left join produto p on (i.cod = p.cod) where i.nota = :nota';
  dm.IBQuery2.ParamByName('nota').AsString := nota;
  dm.IBQuery2.Open;}

  form44 := TForm44.Create(self);
  form44.Label1.Caption := 'Produtos Entregues F4-Imprimir Entregues';
  form44.opcao := 2;
  form44.listaEntrega := TStringList.Create;
  form44.nota  := nota;
  form44.abreDataSetEntrega;
  form44.Caption := 'Entrega de Produtos';

  form44.ShowModal;
  form44.listaEntrega.Free;
  form44.Free;
  dm.IBQuery2.Close;
  dm.IBselect.Close;
end;

procedure TForm2.MovimentodeCaixa1Click(Sender: TObject);
begin
  movcaixalanc := tmovcaixalanc.Create(Self);
  funcoes.CtrlResize(tform(movcaixalanc));
  movcaixalanc.ShowModal;
  Movcaixalanc.Free;
end;

procedure TForm2.MovimentodeNotasFiscais1Click(Sender: TObject);
begin
  CadNotasFiscais1 := tCadNotasFiscais1.Create(self);
  funcoes.CtrlResize(tform(CadNotasFiscais1));
  CadNotasFiscais1.ShowModal;
  CadNotasFiscais1.Free;
end;

procedure TForm2.Movimento1Click(Sender: TObject);
var
  grupo,ini,fim,g1:string;
begin
  grupo := funcoes.dialogo('generico',0,'1234567890'+#8,50,false,'',Application.Title,'Qual o Grupo?','');
  if not funcoes.Contido('*',grupo) then ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(form22.datamov));
  if not funcoes.Contido('*',grupo+ini) then fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?',formatadataddmmyy(form22.datamov));

  if not funcoes.Contido('*',grupo+ini+fim) then
  begin
    if grupo<>'' then g1:= ' (codgru='+grupo+') and ';

    Form32 := Tform32.Create(Self);
    funcoes.CtrlResize(tform(form32));

    dm.IBselect.SQL.Clear;                                                                                                                                                                                                                         //and (usuario.cod = caixa.usuario)
    dm.IBselect.SQL.Add('select codgru as grupo,data,documento,historico,entrada,saida,codhis as hist,codmov,codentradasaida, tipo, vencimento,(select nome from usuario where usuario.cod = caixa.usuario) as usuario from caixa where '+g1+' ((cast(data as date) >= :ini) and (cast(data as date)<=:fim))  order by data DESC');
    dm.IBselect.ParamByName('ini').AsDateTime := StrToDate(ini);
    dm.IBselect.ParamByName('fim').AsDateTime := StrToDate(fim);
    dm.IBselect.Open;

    dm.IBselect.FieldByName('codentradasaida').Visible := false;
    dm.IBselect.FieldByName('tipo').Visible := false;
    dm.IBselect.FieldByName('codmov').Visible := false;
    funcoes.FormataCampos(dm.ibselect,2,'entrada',2);

    form32.DBGrid1.DataSource := dm.ds1;
    form32.ShowModal;
    form32.Free;
  end;


end;

procedure TForm2.Usurios1Click(Sender: TObject);
begin
 Form41 := Tform41.Create(Self);
 funcoes.CtrlResize(tform(form41));
 form41.ShowModal;
 form41.Free;
end;

procedure TForm2.ContadeCliente1Click(Sender: TObject);
begin
  form30 := TForm30.Create(self);
  funcoes.CtrlResize(tform(form30));
  form30.ShowModal;
  form30.Free;
end;

procedure TForm2.ContadeCliente2Click(Sender: TObject);
var
  ini,fim, acc, cli:string;
  i : integer;
  TOTV, TOTPG, TOTAREC : currency;
  matPag : TStringList;
begin
  ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(StartOfTheMonth(now)));
  if ini = '*' then exit;

  fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?',formatadataddmmyy(endOfTheMonth(now)));
  if fim = '*' then exit;

  cli := funcoes.dialogo('generico',0,'1234567890,.'+#8,50,false,'',Application.Title,'Qual o C�d do Cliente?','');
  if cli = '*' then exit;

  if (cli='') then cli := funcoes.localizar('Localizar Cliente','cliente','cod,nome,telres,telcom,cnpj,bairro','cod,nome','','nome','nome',true,false,false,'',0,nil);
  if (cli = '*') or (cli = '') then exit;
  if funcoes.Contido('-',cli) then
  begin
    acc := copy(cli,pos('-',cli)+1,length(cli));
    cli := copy(cli,1,pos('-',cli)-1);
  end;

  TOTV   := 0;
  TOTPG   := 0;
  TOTAREC := 0;
  matPag  := TStringList.Create;
  form19.RichEdit1.Clear;

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := ('select nome from cliente where cod = :cod');
  dm.IBselect.ParamByName('cod').AsInteger := StrToInt(cli);
  dm.IBselect.Open;

  acc   := dm.IBselect.FieldByName('nome').AsString;

  addRelatorioForm19(funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'RELATORIO DE CONTA DE CLIENTE ' + CLI + '-' + acc,80));

  //lendo vendas a prazo
  dm.IBselect.Close;
  dm.IBselect.SQL.Text := ('select total, data, nota from venda where (cancelado = 0) and'+
  ' (data >= :ini) and (data <= :fim) and (codhis = 2) and (cliente = :cli)' );
  dm.IBselect.ParamByName('ini').AsDateTime := StrToDate(ini);
  dm.IBselect.ParamByName('fim').AsDateTime := StrToDate(fim);
  dm.IBselect.ParamByName('cli').AsInteger  := StrToInt(cli);
  dm.IBselect.Open;

  while not dm.IBselect.Eof do begin
    addRelatorioForm19(formataDataDDMMYY(dm.IBselect.FieldByName('data').AsDateTime) +
    ' VENDA NOTA ' + strzero(dm.IBselect.FieldByName('nota').Asinteger, 6) + ' '     +
    CompletaOuRepete('', formataCurrency(dm.IBselect.FieldByName('total').AsCurrency), ' ', 13) + CRLF);

    TOTV := TOTV + dm.IBselect.FieldByName('total').AsCurrency;
    dm.IBselect.Next;
  end;

  if TOTV > 0 then begin
    addRelatorioForm19(CompletaOuRepete('TOTAL DAS VENDAS', formataCurrency(TOTV) , '.', 40) + CRLF);
    addRelatorioForm19(CompletaOuRepete('', '' , '-', 40) + CRLF + CRLF);
  end;

  //lendo contas pagas no caixa
  dm.IBselect.Close;
  dm.IBselect.SQL.Text := ('select entrada as total, cast(data as date) as data from caixa where '+
  ' (cast(data as date) >= :ini) and (cast(data as date) <= :fim)'+
  ' and (documento = :cli)' );
  dm.IBselect.ParamByName('ini').AsDateTime := StrToDate(ini);
  dm.IBselect.ParamByName('fim').AsDateTime := StrToDate(fim);
  dm.IBselect.ParamByName('cli').AsInteger  := StrToInt(cli);
  dm.IBselect.Open;

  while not dm.IBselect.Eof do begin
    matPag.Values[formataDataDDMMYY(dm.IBselect.FieldByName('data').AsDateTime)] := CurrToStr(StrToCurrDef(matPag.Values[formataDataDDMMYY(dm.IBselect.FieldByName('data').AsDateTime)], 0) +
    dm.IBselect.FieldByName('total').AsCurrency);

    TOTPG := TOTPG + dm.IBselect.FieldByName('total').AsCurrency;
    dm.IBselect.Next;
  end;

  for i := 0 to matPag.Count -1 do begin
    addRelatorioForm19(matPag.Names[i] + ' PAGO VALOR ' +
    CompletaOuRepete('', formataCurrency(StrToCurrDef(matPag.Values[matPag.Names[i]] , 0)), ' ', 20) + CRLF );
  end;

  if TOTPG > 0 then begin
    addRelatorioForm19(CompletaOuRepete('TOTAL PAGO      ', formataCurrency(TOTPG) , '.', 40) + CRLF);
    addRelatorioForm19(CompletaOuRepete('', '' , '-', 40) + CRLF + CRLF);
  end;

  matPag.Free;

  addRelatorioForm19(CRLF);
  //VERIFICANDO CONTAS A RECEBER
  dm.IBselect.Close;
  dm.IBselect.SQL.Text := ('select valor as total, historico, vencimento as data from contasreceber where '+
  ' (documento = :cli) and (pago = 0)' );
  dm.IBselect.ParamByName('cli').AsInteger  := StrToInt(cli);
  dm.IBselect.Open;

  while not dm.IBselect.Eof do begin
    addRelatorioForm19(formataDataDDMMYY(dm.IBselect.FieldByName('data').AsDateTime) +
    ' NOTA ' + strzero(LeftStr(dm.IBselect.FieldByName('historico').AsString, pos('-', dm.IBselect.FieldByName('historico').AsString) -1), 6) + ' A PAGAR '     +
    CompletaOuRepete('', formataCurrency(dm.IBselect.FieldByName('total').AsCurrency), ' ', 11) + CRLF);

    TOTAREC := TOTAREC + dm.IBselect.FieldByName('total').AsCurrency;
    dm.IBselect.Next;
  end;

  if TOTAREC > 0 then begin
    addRelatorioForm19(CompletaOuRepete('TOTAL A PAGAR   ', formataCurrency(TOTAREC) , '.', 40) + CRLF);
    addRelatorioForm19(CompletaOuRepete('', '' , '-', 40) + CRLF + CRLF);
  end;
  addRelatorioForm19(CompletaOuRepete('DIFERENCA       ', formataCurrency(TOTV - TOTPG - TOTAREC) , '.', 40) + CRLF);
  addRelatorioForm19(CompletaOuRepete('', '' , '-', 40) + CRLF + CRLF);

  dm.IBselect.Close;
  form19.RichEdit1.SelStart := 0;
  form19.ShowModal;
end;

procedure TForm2.ContaParcelada1Click(Sender: TObject);
begin
  form30 := TForm30.Create(self);
  form30.perguntarParcelas := 1;//conta parcelada
  funcoes.CtrlResize(tform(form30));
  form30.ShowModal;
  form30.Free;
  {form29 := TForm29.Create(self);
  funcoes.CtrlResize(tform(form29));
  form29.ShowModal;
  form29.Free;}
end;

procedure TForm2.PorData2Click(Sender: TObject);
var fim,g1:string;
var data1:TDateTime;
begin
  g1 := funcoes.dialogo('generico',0,'1234567890'+#8,50,false,'',Application.Title,'Qual o Grupo?','');
  if not funcoes.Contido('*',g1) then fim := funcoes.dialogo('data',0,'1234567890'+#8,50,true,'',Application.Title,'Qual a Data Final?',formatadataddmmyy(endOfTheMonth(now)));

  if not funcoes.Contido('*',g1+fim) then
  begin
    data1 := StrToDate(fim);
    Form34 := Tform34.Create(Self);
    form34.cont := 1;
    form34.IBTable1.Filtered := false;
    form34.IBTable1.Active:=true;

    if g1<>'' then form34.IBTable1.Filter := '(vencimento<='+QuotedStr(FormatDateTime('MM/DD/YYYY',data1))+') and (codgru='+g1+') and (pago = 0)'
    else form34.IBTable1.Filter := '(vencimento<='+QuotedStr(FormatDateTime('MM/DD/YYYY',data1))+') and (pago = 0)';
    form34.IBTable1.Filtered :=true;
    funcoes.CtrlResize(tform(form34));
    form34.DBGrid1.Font.Name := 'Courier New';
    form34.ShowModal;
    form34.Free;
  end;

end;

procedure TForm2.PorCliente2Click(Sender: TObject);
var
  cliente,acc,juros, pergJuros:string;
  juros1 : currency;
begin
  cliente := funcoes.dialogo('generico',0,'1234567890,.'+#8,50,false,'',Application.Title,'Qual o C�d do Cliente?','');
  if cliente = '*' then exit;
  if (cliente='') then cliente := funcoes.localizar('Localizar Cliente','cliente','cod,nome,telres,telcom,cnpj,bairro','cod,nome','','nome','nome',true,false,false,'',0,nil);
  if (cliente = '*') or (cliente = '') then exit;
  if funcoes.Contido('-',cliente) then
  begin
    acc := copy(cliente,pos('-',cliente)+1,length(cliente));
    cliente := copy(cliente,1,pos('-',cliente)-1);
  end;

  pergJuros := '';

  try
    pergJuros := ConfParamGerais[44];
  except
    pergJuros := 'S';
  end;

  dm.IBQuery2.Close;
  dm.IBQuery2.SQL.Clear;
  dm.IBQuery2.SQL.Add('select documento from contasreceber where (documento = '+cliente+') and (pago=0)');

  try
    dm.IBQuery2.Open;
  except
    ShowMessage('Erro Inesperado!!!');
    exit;
  end;

  if dm.IBQuery2.IsEmpty then
    begin
     dm.IBQuery2.Close;
     ShowMessage('N�o Consta D�bitos Deste Cliente!');
     exit;
    end;

  dm.IBQuery2.Close;
  dm.IBQuery2.SQL.Clear;
  dm.IBQuery2.SQL.Add('select documento from contasreceber where (documento = '+cliente+') and (vencimento <= :data) and (pago = 0)');
  dm.IBQuery2.ParamByName('data').AsDateTime :=  form22.datamov;
  try
    dm.IBQuery2.Open;
  except
    ShowMessage('Erro Inesperado!!!');
    exit;
  end;

  juros1 := StrToCurrDef(ConfParamGerais.Strings[6], 0);
  //juros ao dia

  Form34 := Tform34.Create(Self);
  if not dm.IBQuery2.IsEmpty then
    begin
      if Length(form22.Pgerais.Values['acessousu']) > 2 then
        begin
          form34.juros := juros1;
          juros := CurrToStr(juros1);
        end
      else
        begin
          if pergJuros = 'S' then
            begin
              if Contido('ROUPA NOVA', form22.Pgerais.Values['empresa']) then begin
              end;

              juros := funcoes.dialogo('numero',0,'',2,false,'',Application.Title,'Qual a Taxa de Juros?', formataCurrency(juros1));
              if juros = '*' then exit;
            end
          else
            begin
              juros := CurrToStr(juros1);
            end;

          form34.juros := StrToCurrDef(funcoes.ConverteNumerico(juros), 0);
        end;
    end;

  if acc <> '' then form34.cliente.Caption := acc
    else  form34.cliente.Caption := copy(funcoes.BuscaNomeBD(dm.ibquery2,'nome','cliente','where cod='+cliente),1,35);

  dm.IBQuery2.Close;
  form34.cont := 2;
  form34.juros := StrToCurr(funcoes.ConverteNumerico(juros));
  //ShowMessage(CurrToStr(form34.juros));

  //form34.IBTable1.Filtered := false;
  //form34.IBTable1.Filter := '(documento='+cliente+') and (pago=0)';
  form34.client1 := cliente;


  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select datamov,codgru, vencimento, documento, historico, previsao, valor, cod, valor as saldo  from contasreceber where ' +
  '(documento='+strnum(cliente)+') and (pago=0)';
  dm.IBselect.Open;

  funcoes.Ibquery_to_clienteDataSet(dm.IBselect, form34.ClientDataSet1);
  form34.DataSource1.DataSet := form34.ClientDataSet1;

  form34.copiaContasReceber(dm.IBselect);

//  form34.IBTable1.AddIndex('indice1', 'vencimento', [ixDescending]);
  try
    //form34.IBTable1.Filtered := true;
    //form34.IBTable1.Active   := true;
    //form34.IBTable1.IndexName := 'CONTASRECEBER_IDX1';
  except
    exit;
  end;

  funcoes.CtrlResize(tform(form34));

  if Screen.Width <= 1024 then begin
    form34.Width := Screen.Width - trunc(screen.Width * 0.02);
  end
  else form34.Width := Screen.Width - trunc(screen.Width * 0.15);

  form34.ShowModal;
  form34.Free;
end;

procedure TForm2.GrficoCtasPagar1Click(Sender: TObject);
var valor:array[1..6] of currency;
var a,b:string;
begin
valor[1]:=0;
valor[2]:=0;
valor[3]:=0;
valor[4]:=0;
valor[5]:=0;
valor[6]:=0;
  a := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(StartOfTheMonth(form22.datamov)));
  if a <> '*' then b := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(endOfTheMonth(form22.datamov)));
  if (a = '*') or (b = '*') then exit;

  form28 := TForm28.Create(self);
  funcoes.CtrlResize(tform(form28));
  form28.Caption := 'Gr�fico Contas a Pagar De: '+a+' a '+b;

  dm.IBQuery2.Close;
  dm.IBQuery2.SQL.Clear;
  dm.IBQuery2.SQL.Add('select * from contaspagar where (pago = 0) and ((vencimento >= :d1) and (vencimento <= :d2))');
  dm.IBQuery2.ParamByName('d1').AsDateTime := StrToDate(a);
  dm.IBQuery2.ParamByName('d2').AsDateTime := StrToDate(b);
  dm.IBQuery2.Open;
  dm.IBQuery2.First;
  while not dm.IBQuery2.Eof do
   begin
    valor[1] := valor[1] + dm.IBQuery2.fieldbyname('total').AsCurrency;
    if dm.IBQuery2.fieldbyname('vencimento').AsDateTime < form22.datamov then  valor[2] := valor[2] + dm.IBQuery2.fieldbyname('valor').AsCurrency;
    if dm.IBQuery2.fieldbyname('vencimento').AsDateTime - form22.datamov <= 8 then valor[3] := valor[3] + dm.IBQuery2.fieldbyname('valor').AsCurrency;
    if dm.IBQuery2.fieldbyname('vencimento').AsDateTime - form22.datamov <= 15 then valor[4] := valor[4] + dm.IBQuery2.fieldbyname('valor').AsCurrency;
    if dm.IBQuery2.fieldbyname('vencimento').AsDateTime - form22.datamov <= 30 then valor[5] := valor[5] + dm.IBQuery2.fieldbyname('valor').AsCurrency;
    if dm.IBQuery2.fieldbyname('vencimento').AsDateTime - form22.datamov > 30 then valor[6] := valor[6] + dm.IBQuery2.fieldbyname('valor').AsCurrency;
    dm.IBQuery2.Next;
   end;
  dm.IBQuery2.Close;

  if valor[1]=0 then form28.Chart1.Series[0].Add(0,'Total'+#13+'R$ '+FormatCurr('#,###,###0.00',valor[1]),form28.Chart1.Series[0].ValueColor[0])
  else form28.Chart1.Series[0].Add(int((valor[1]/valor[1])*100),'Total'+#13+'R$ '+FormatCurr('#,###,###0.00',valor[1]),form28.Chart1.Series[0].ValueColor[0]);

  if valor[2]=0 then form28.Chart1.Series[0].Add(0,'Em Atraso'+#13+'R$ '+FormatCurr('#,###,###0.00',valor[2]),form28.Chart1.Series[0].ValueColor[0])
  else form28.Chart1.Series[0].Add(int((valor[2]/valor[1])*100),'Em Atraso'+#13+'R$ '+FormatCurr('#,###,###0.00',valor[2]),form28.Chart1.Series[0].ValueColor[0]);

  if valor[3]=0 then form28.Chart1.Series[0].Add(0,'At� 8 Dias'+#13+'R$ '+FormatCurr('#,###,###0.00',valor[3]),form28.Chart1.Series[0].ValueColor[0])
  else form28.Chart1.Series[0].Add(int((valor[3]/valor[1])*100),'At� 8 Dias'+#13+'R$ '+FormatCurr('#,###,###0.00',valor[3]),form28.Chart1.Series[0].ValueColor[0]);

  if valor[4]=0 then form28.Chart1.Series[0].Add(0,'At� 15 Dias'+#13+'R$ '+FormatCurr('#,###,###0.00',valor[4]),form28.Chart1.Series[0].ValueColor[0])
  else form28.Chart1.Series[0].Add(int((valor[4]/valor[1])*100),'At� 15 Dias'+#13+'R$ '+FormatCurr('#,###,###0.00',valor[4]),form28.Chart1.Series[0].ValueColor[0]);

  if valor[5]=0 then form28.Chart1.Series[0].Add(0,'At� 30 Dias'+#13+'R$ '+FormatCurr('#,###,###0.00',valor[5]),form28.Chart1.Series[0].ValueColor[0])
  else form28.Chart1.Series[0].Add(int((valor[5]/valor[1])*100),'At� 30 Dias'+#13+'R$ '+FormatCurr('#,###,###0.00',valor[5]),form28.Chart1.Series[0].ValueColor[0]);

  if valor[6]=0 then form28.Chart1.Series[0].Add(0,'Acima 30 Dias'+#13+'R$ '+FormatCurr('#,###,###0.00',valor[6]),form28.Chart1.Series[0].ValueColor[0])
  else form28.Chart1.Series[0].Add(int((valor[6]/valor[1])*100),'Acima 30 Dias'+#13+'R$ '+FormatCurr('#,###,###0.00',valor[6]),form28.Chart1.Series[0].ValueColor[0]);

  form28.ShowModal;
  form28.Free;
end;

procedure TForm2.GrficoCtasReceber1Click(Sender: TObject);
var valor:array[1..6] of currency;
begin

valor[1]:=0;
valor[2]:=0;
valor[3]:=0;
valor[4]:=0;
valor[5]:=0;
valor[6]:=0;

form28 := TForm28.Create(self);
funcoes.CtrlResize(tform(form28));
form28.Caption := 'Gr�fico Contas a Receber';

dm.IBQuery2.Close;
dm.IBQuery2.SQL.Clear;
dm.IBQuery2.SQL.Add('select * from contasreceber where  pago = 0 ');
dm.IBQuery2.Open;
dm.IBQuery2.First;
valor[1] := 0;
while not dm.IBQuery2.Eof do
begin
 valor[1] := valor[1] + dm.IBQuery2.fieldbyname('total').AsCurrency;
 if dm.IBQuery2.fieldbyname('vencimento').AsDateTime<form22.datamov then  valor[2] := valor[2] + dm.IBQuery2.fieldbyname('valor').AsCurrency;
 if dm.IBQuery2.fieldbyname('vencimento').AsDateTime-form22.datamov<=8 then valor[3] := valor[3] + dm.IBQuery2.fieldbyname('valor').AsCurrency;
 if dm.IBQuery2.fieldbyname('vencimento').AsDateTime-form22.datamov<=15 then valor[4] := valor[4] + dm.IBQuery2.fieldbyname('valor').AsCurrency;
 if dm.IBQuery2.fieldbyname('vencimento').AsDateTime-form22.datamov<=30 then valor[5] := valor[5] + dm.IBQuery2.fieldbyname('valor').AsCurrency;
 if dm.IBQuery2.fieldbyname('vencimento').AsDateTime-form22.datamov>30 then valor[6] := valor[6] + dm.IBQuery2.fieldbyname('valor').AsCurrency;
 dm.IBQuery2.Next;
end;
  dm.IBQuery2.Close;
  if valor[1]=0 then form28.Chart1.Series[0].Add(0,'Total'+#13+'R$ '+FormatCurr('#,###,###0.00',valor[1]),form28.Chart1.Series[0].ValueColor[0])
  else form28.Chart1.Series[0].Add(int((valor[1]/valor[1])*100),'Total'+#13+'R$ '+FormatCurr('#,###,###0.00',valor[1]),form28.Chart1.Series[0].ValueColor[0]);

  if valor[2]=0 then form28.Chart1.Series[0].Add(0,'Em Atraso'+#13+'R$ '+FormatCurr('#,###,###0.00',valor[2]),form28.Chart1.Series[0].ValueColor[0])
  else form28.Chart1.Series[0].Add(int((valor[2]/valor[1])*100),'Em Atraso'+#13+'R$ '+FormatCurr('#,###,###0.00',valor[2]),form28.Chart1.Series[0].ValueColor[0]);

  if valor[3]=0 then form28.Chart1.Series[0].Add(0,'At� 8 Dias'+#13+'R$ '+FormatCurr('#,###,###0.00',valor[3]),form28.Chart1.Series[0].ValueColor[0])
  else form28.Chart1.Series[0].Add(int((valor[3]/valor[1])*100),'At� 8 Dias'+#13+'R$ '+FormatCurr('#,###,###0.00',valor[3]),form28.Chart1.Series[0].ValueColor[0]);

  if valor[4]=0 then form28.Chart1.Series[0].Add(0,'At� 15 Dias'+#13+'R$ '+FormatCurr('#,###,###0.00',valor[4]),form28.Chart1.Series[0].ValueColor[0])
  else form28.Chart1.Series[0].Add(int((valor[4]/valor[1])*100),'At� 15 Dias'+#13+'R$ '+FormatCurr('#,###,###0.00',valor[4]),form28.Chart1.Series[0].ValueColor[0]);

  if valor[5]=0 then form28.Chart1.Series[0].Add(0,'At� 30 Dias'+#13+'R$ '+FormatCurr('#,###,###0.00',valor[5]),form28.Chart1.Series[0].ValueColor[0])
  else form28.Chart1.Series[0].Add(int((valor[5]/valor[1])*100),'At� 30 Dias'+#13+'R$ '+FormatCurr('#,###,###0.00',valor[5]),form28.Chart1.Series[0].ValueColor[0]);

  if valor[6]=0 then form28.Chart1.Series[0].Add(0,'Acima 30 Dias'+#13+'R$ '+FormatCurr('#,###,###0.00',valor[6]),form28.Chart1.Series[0].ValueColor[0])
  else form28.Chart1.Series[0].Add(int((valor[6]/valor[1])*100),'Acima 30 Dias'+#13+'R$ '+FormatCurr('#,###,###0.00',valor[6]),form28.Chart1.Series[0].ValueColor[0]);

form28.ShowModal;
form28.Free;
end;

procedure TForm2.PorHistrico1Click(Sender: TObject);
var gru,his:string;
begin
  gru := funcoes.dialogo('generico',0,'1234567890'+#8,50,false,'',application.Title,'Qual o Grupo?','');
  if gru<>'*' then
  begin
    while his='' do
     begin
       his := funcoes.dialogo('normal',0,'',50,false,'',application.Title,'Qual o Hist�rico?','');
     end;
  end;
 if not funcoes.Contido('*',gru+his) then
  begin
    Form34 := Tform34.Create(Self);
    form34.cont := 1;
    form34.IBTable1.Filtered := false;
    form34.IBTable1.Active:=true;

    if gru<>'' then form34.IBTable1.Filter := '(historico like '+QuotedStr('%'+his+'%')+ ') and (codgru='+gru+')'
    else form34.IBTable1.Filter := 'historico like '+QuotedStr('%'+his+'%');
    form34.IBTable1.Filtered :=true;
    funcoes.CtrlResize(tform(form34));
    form34.ShowModal;
    form34.Free;
  end;



end;

procedure TForm2.PorPagamento1Click(Sender: TObject);
var pagto,sim:string;
begin
    pagto := funcoes.LerFormPato(0,'',true);
    if pagto = '*' then exit;
    sim := funcoes.dialogo('generico',0,'SN',0,false,'S',Application.Title,'Baixar Contas Com Valor Antecipado?','N') ;
    if not funcoes.Contido('*',pagto+sim) then
     begin
      Form34 := Tform34.Create(Self);
      form34.cont := 1;
      funcoes.CtrlResize(tform(form34));
      form34.ShowModal;
      form34.Free;
     end;
end;



procedure TForm2.PorPisCST1Click(Sender: TObject);
var
  ini,fim, _CST,  _ISPIS, cst_nome, XmlNaoEncontrado :string;
  TOT : currency;
  MAT_HIS, MAT_HIS_NOMES : TStringList;
  i, fim1 : integer;
  DadosNfe : TDadosNFe;
  xml : string[1];
  lista : TItensPISCOFINS;
begin
  ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(StartOfTheMonth(now)));
  if ini = '*' then exit;

  fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?',formatadataddmmyy(endOfTheMonth(now)));
  if fim = '*' then exit;

  _CST := funcoes.dialogo('generico',0,'DXIMR',50,false,'S',Application.Title,'Qual o CST de PIS/COFINS (I-Isento, M-Monofasico, R-Red. Aliq. Zero, ' +
  'X-Sem Incidencia, D-Aliq. Diferenciada) ?','');
  if _CST = '*' then exit;

  MAT_HIS       := TStringList.Create;
  MAT_HIS_NOMES := TStringList.Create;
  MAT_HIS_NOMES.Values['0'] := ' - TRIBUTADO        ';
  MAT_HIS_NOMES.Values['I'] := 'I- ISENTO           ';
  MAT_HIS_NOMES.Values['M'] := 'M- MONOFASICO       ';
  MAT_HIS_NOMES.Values['R'] := 'R- RED. ALIQ. ZERO  ';
  MAT_HIS_NOMES.Values['X'] := 'X- SEM INCIDENCIA   ';
  MAT_HIS_NOMES.Values['D'] := 'D- ALIQ DIFERENCIADA';

  form19.RichEdit1.Clear;
  addRelatorioForm19(funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'VENDAS POR CST PIS/COFINS ' + _ISPIS  + (ini) + ' a ' + fim, 79));
  addRelatorioForm19('CODIGO DESCRICAO                              QUANT      TOTAL DOC    TIPO CST' + CRLF);

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select * from nfce where data >= :ini and data <= :fim and adic = '''' ';
  dm.IBselect.ParamByName('ini').AsDate := StrToDate(ini);
  dm.IBselect.ParamByName('fim').AsDate := StrToDate(fim);
  dm.IBselect.Open;
  dm.IBselect.FetchAll;

  fim1 := dm.IBselect.RecordCount;

  listaProdutos := TItensProduto.Create;
  TOT := 0;

  informacao(0, 0, 'Lendo NFCes...', true, false, 5);

  {while not dm.IBselect.Eof do begin
    informacao(dm.IBselect.RecNo, fim1, 'Lendo NFCes...', false, false, 5);

    dm.IBQuery2.Close;
    dm.IBQuery2.SQL.Text := 'select i.cod, i.quant, i.total, p.nome, p.IS_PIS, p.COD_ISPIS from item_venda i left join ' +
    ' produto p on (p.cod = i.cod) where trim(p.IS_PIS) <> '''' and i.nota = :nota';
    dm.IBQuery2.ParamByName('nota').AsInteger := dm.IBselect.FieldByName('nota').AsInteger;
    dm.IBQuery2.Open;

    while not dm.IBQuery2.Eof do begin
      _ISPIS := trim(dm.IBQuery2.FieldByName('IS_PIS').AsString);
      if _ISPIS = '' then _ISPIS := '0';

      if _CST <> '' then begin
        if _ISPIS = _CST then begin
          MAT_HIS.Values[_ISPIS] := CurrToStr(StrToCurrDef(MAT_HIS.Values[_ISPIS], 0) + dm.IBQuery2.FieldByName('total').AsCurrency);
          TOT := TOT + dm.IBQuery2.FieldByName('total').AsCurrency;

          if _ISPIS = '0' then _ISPIS := '';

          addRelatorioForm19(strzero(dm.IBQuery2.FieldByName('cod').AsInteger, 6) + ' ' + CompletaOuRepete(LeftStr(dm.IBQuery2.FieldByName('nome').AsString, 33), '', ' ', 34) +
          CompletaOuRepete('', formataCurrency(dm.IBQuery2.FieldByName('quant').AsCurrency), ' ', 10) + ' ' + CompletaOuRepete('', formataCurrency(dm.IBQuery2.FieldByName('total').AsCurrency), ' ', 10) +
          ' ' + strzero(copy(dm.IBselect.FieldByName('chave').AsString, 26, 9), 6) + ' ' + 'NFCe ' + _ISPIS + CRLF);
        end;
      end
      else begin
        MAT_HIS.Values[_ISPIS] := CurrToStr(StrToCurrDef(MAT_HIS.Values[_ISPIS], 0) + dm.IBQuery2.FieldByName('total').AsCurrency);
        TOT := TOT + dm.IBQuery2.FieldByName('total').AsCurrency;

        if _ISPIS = '0' then _ISPIS := '';

        addRelatorioForm19(strzero(dm.IBQuery2.FieldByName('cod').AsInteger, 6) + ' ' + CompletaOuRepete(LeftStr(dm.IBQuery2.FieldByName('nome').AsString, 33), '', ' ', 34) +
          CompletaOuRepete('', formataCurrency(dm.IBQuery2.FieldByName('quant').AsCurrency), ' ', 10) + ' ' + CompletaOuRepete('', formataCurrency(dm.IBQuery2.FieldByName('total').AsCurrency), ' ', 10) +
          ' ' + strzero(copy(dm.IBselect.FieldByName('chave').AsString, 26, 9), 6) + ' ' + 'NFCe ' + _ISPIS + CRLF);
      end;

      dm.IBQuery2.Next;
    end;


    dm.IBselect.Next;
  end;


  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select chave, substring(chave from 36 for 8) as nota from nfe where data >= :ini and data <= :fim and estado = ''E'' ';
  dm.IBselect.ParamByName('ini').AsDate := StrToDate(ini);
  dm.IBselect.ParamByName('fim').AsDate := StrToDate(fim);
  dm.IBselect.Open;
  dm.IBselect.FetchAll;

  fim1 := dm.IBselect.RecordCount;

  listaProdutos := TItensProduto.Create;
  TOT := 0;

  informacao(0, 0, 'Lendo NFes...', false, true, 5);
  informacao(0, 0, 'Lendo NFes...', true, false, 5);

  while not dm.IBselect.Eof do begin
    informacao(dm.IBselect.RecNo, fim1, 'Lendo NFes...', false, false, 5);

    dm.IBQuery2.Close;
    dm.IBQuery2.SQL.Text := 'select i.cod, i.quant, i.total, p.nome, p.IS_PIS, p.COD_ISPIS from item_venda i left join ' +
    ' produto p on (p.cod = i.cod) where trim(p.IS_PIS) <> '''' and i.nota = :nota';
    dm.IBQuery2.ParamByName('nota').AsInteger := StrToInt(StrNum(copy(dm.IBselect.FieldByName('chave').AsString, 36, 8)));
    dm.IBQuery2.Open;

    while not dm.IBQuery2.Eof do begin
      _ISPIS := trim(dm.IBQuery2.FieldByName('IS_PIS').AsString);
      if _ISPIS = '' then _ISPIS := '0';

      if _CST <> '' then begin
        if _ISPIS = _CST then begin
          MAT_HIS.Values[_ISPIS] := CurrToStr(StrToCurrDef(MAT_HIS.Values[_ISPIS], 0) + dm.IBQuery2.FieldByName('total').AsCurrency);
          TOT := TOT + dm.IBQuery2.FieldByName('total').AsCurrency;

          if _ISPIS = '0' then _ISPIS := '';

          addRelatorioForm19(strzero(dm.IBQuery2.FieldByName('cod').AsInteger, 6) + ' ' + CompletaOuRepete(LeftStr(dm.IBQuery2.FieldByName('nome').AsString, 33), '', ' ', 34) +
          CompletaOuRepete('', formataCurrency(dm.IBQuery2.FieldByName('quant').AsCurrency), ' ', 10) + ' ' + CompletaOuRepete('', formataCurrency(dm.IBQuery2.FieldByName('total').AsCurrency), ' ', 10) +
          ' ' + strzero(copy(dm.IBselect.FieldByName('chave').AsString, 26, 9), 6) + ' ' + 'NFCe ' + _ISPIS + CRLF);
        end;
      end
      else begin
        MAT_HIS.Values[_ISPIS] := CurrToStr(StrToCurrDef(MAT_HIS.Values[_ISPIS], 0) + dm.IBQuery2.FieldByName('total').AsCurrency);
        TOT := TOT + dm.IBQuery2.FieldByName('total').AsCurrency;

        if _ISPIS = '0' then _ISPIS := '';

        addRelatorioForm19(strzero(dm.IBQuery2.FieldByName('cod').AsInteger, 6) + ' ' + CompletaOuRepete(LeftStr(dm.IBQuery2.FieldByName('nome').AsString, 33), '', ' ', 34) +
          CompletaOuRepete('', formataCurrency(dm.IBQuery2.FieldByName('quant').AsCurrency), ' ', 10) + ' ' + CompletaOuRepete('', formataCurrency(dm.IBQuery2.FieldByName('total').AsCurrency), ' ', 10) +
          ' ' + strzero(copy(dm.IBselect.FieldByName('chave').AsString, 26, 9), 6) + ' ' + 'NFCe ' + _ISPIS + CRLF);
      end;

      dm.IBQuery2.Next;
    end;


    dm.IBselect.Next;
  end;  }


  XmlNaoEncontrado := '';
  xml := '';

  while not dm.IBselect.Eof do begin
    informacao(dm.IBselect.RecNo, fim1, 'Lendo NFCes...', false, false, 5);
    //LE_XMLNFE('', listaProdutos, dm.IBQuery4, DadosNfe, dm.IBselect.FieldByName('chave').AsString);

    listaProdutos.Clear;
    LE_XMLNFCE(dm.IBselect.fieldbyname('chave').AsString, listaProdutos, dm.IBQuery4, DadosNfe, TRIB_ALIQ_PIS, TRIB_ALIQ_COFINS);

    if not FileExists(buscaPastaNFCe(dm.IBselect.fieldbyname('chave').AsString) + dm.IBselect.fieldbyname('chave').AsString + '-nfe.xml') then begin
      if xml = '' then begin
        xml := 'S';
        XmlNaoEncontrado := XmlNaoEncontrado + 'NFCe: ' + #13 + #13;
      end;

      XmlNaoEncontrado := XmlNaoEncontrado + dm.IBselect.fieldbyname('chave').AsString + #13;
    end;


    for i := 0 to listaProdutos.Count - 1 do begin
      dm.IBQuery2.Close;
      dm.IBQuery2.SQL.Text := 'select IS_PIS, COD_ISPIS from produto where cod = :cod';
      dm.IBQuery2.ParamByName('cod').AsInteger := listaProdutos[i].cod;
      dm.IBQuery2.Open;

      _ISPIS := trim(dm.IBQuery2.FieldByName('IS_PIS').AsString);
      if _ISPIS = '' then _ISPIS := '0';

      if _CST <> '' then begin
        if _ISPIS = _CST then begin
          MAT_HIS.Values[_ISPIS] := CurrToStr(StrToCurrDef(MAT_HIS.Values[_ISPIS], 0) + listaProdutos[i].total);
          TOT := TOT + listaProdutos[i].total;

          if _ISPIS = '0' then _ISPIS := '';

          addRelatorioForm19(strzero(listaProdutos[i].cod, 6) + ' ' + CompletaOuRepete(LeftStr(listaProdutos[i].nome, 33), '', ' ', 34) +
          CompletaOuRepete('', formataCurrency(listaProdutos[i].quant), ' ', 10) + ' ' + CompletaOuRepete('', formataCurrency(listaProdutos[i].total), ' ', 10) +
          ' ' + strzero(DadosNfe.nNF, 6) + ' ' + 'NFCe ' + _ISPIS + CRLF);
        end;
      end
      else begin
        MAT_HIS.Values[_ISPIS] := CurrToStr(StrToCurrDef(MAT_HIS.Values[_ISPIS], 0) + listaProdutos[i].total);
        TOT := TOT + listaProdutos[i].total;

        if _ISPIS = '0' then _ISPIS := '';

        addRelatorioForm19(strzero(listaProdutos[i].cod, 6) + ' ' + CompletaOuRepete(LeftStr(listaProdutos[i].nome, 33), '', ' ', 34) +
        CompletaOuRepete('', formataCurrency(listaProdutos[i].quant), ' ', 10) + ' ' + CompletaOuRepete('', formataCurrency(listaProdutos[i].total), ' ', 10) +
        ' ' + strzero(DadosNfe.nNF, 6) + ' ' + 'NFCe ' + _ISPIS + CRLF);
      end;
    end;

    dm.IBselect.Next;
  end;

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select * from nfe where data >= :ini and data <= :fim';
  dm.IBselect.ParamByName('ini').AsDate := StrToDate(ini);
  dm.IBselect.ParamByName('fim').AsDate := StrToDate(fim);
  dm.IBselect.Open;
  dm.IBselect.FetchAll;

  fim1 := dm.IBselect.RecordCount;

  listaProdutos := TItensProduto.Create;
  TOT := 0;
  xml := '';

  informacao(dm.IBselect.RecNo, fim1, 'Lendo NFes...', false, true, 5);
  informacao(0, 0, 'Lendo NFes...', true, false, 5);

  while not dm.IBselect.Eof do begin
    informacao(dm.IBselect.RecNo, fim1, 'Lendo NFes...', false, false, 5);
    listaProdutos.Clear;
    LE_XMLNFE('', listaProdutos, dm.IBQuery4, DadosNfe, dm.IBselect.FieldByName('chave').AsString);
    //LE_XMLNFCE(dm.IBselect.fieldbyname('chave').AsString, listaProdutos, dm.IBQuery4, DadosNfe, TRIB_ALIQ_PIS, TRIB_ALIQ_COFINS);

    if not FileExists(caminhoEXE_com_barra_no_final + 'NFe\emit\' + dm.IBselect.fieldbyname('chave').AsString + '-nfe.xml') then begin
      if xml = '' then begin
        xml := 'S';
        XmlNaoEncontrado := XmlNaoEncontrado + 'NFe: ' + #13 + #13;
      end;

      XmlNaoEncontrado := XmlNaoEncontrado + dm.IBselect.fieldbyname('chave').AsString + #13;
    end;

    for i := 0 to listaProdutos.Count - 1 do begin
      dm.IBQuery2.Close;
      dm.IBQuery2.SQL.Text := 'select IS_PIS, COD_ISPIS from produto where cod = :cod';
      dm.IBQuery2.ParamByName('cod').AsInteger := listaProdutos[i].cod;
      dm.IBQuery2.Open;

      _ISPIS := trim(dm.IBQuery2.FieldByName('IS_PIS').AsString);
      if _ISPIS = '' then _ISPIS := '0';

      if _CST <> '' then begin
        if _ISPIS = _CST then begin
          MAT_HIS.Values[_ISPIS] := CurrToStr(StrToCurrDef(MAT_HIS.Values[_ISPIS], 0) + listaProdutos[i].total);
          TOT := TOT + listaProdutos[i].total;

          if _ISPIS = '0' then _ISPIS := '';

          addRelatorioForm19(strzero(listaProdutos[i].cod, 6) + ' ' + CompletaOuRepete(LeftStr(listaProdutos[i].nome, 33), '', ' ', 34) +
          CompletaOuRepete('', formataCurrency(listaProdutos[i].quant), ' ', 10) + ' ' + CompletaOuRepete('', formataCurrency(listaProdutos[i].total), ' ', 10) +
          ' ' + strzero(DadosNfe.nNF, 6) + ' ' + 'NFe  ' + _ISPIS + CRLF);
        end;
      end
      else begin
        MAT_HIS.Values[_ISPIS] := CurrToStr(StrToCurrDef(MAT_HIS.Values[_ISPIS], 0) + listaProdutos[i].total);
        TOT := TOT + listaProdutos[i].total;

        if _ISPIS = '0' then _ISPIS := '';

        addRelatorioForm19(strzero(listaProdutos[i].cod, 6) + ' ' + CompletaOuRepete(LeftStr(listaProdutos[i].nome, 33), '', ' ', 34) +
        CompletaOuRepete('', formataCurrency(listaProdutos[i].quant), ' ', 10) + ' ' + CompletaOuRepete('', formataCurrency(listaProdutos[i].total), ' ', 10) +
        ' ' + strzero(DadosNfe.nNF, 6) + ' ' + 'NFe  ' + _ISPIS + CRLF);
      end;
    end;

    dm.IBselect.Next;
  end;

  informacao(dm.IBselect.RecNo, fim1, 'Lendo NFes...', false, true, 5);
  addRelatorioForm19(CompletaOuRepete('','','-', 79) + CRLF);

  for i := 0 to MAT_HIS.Count -1 do begin
    cst_nome := MAT_HIS_NOMES.Values[MAT_HIS.Names[i]];
    if trim(cst_nome) = '' then cst_nome := MAT_HIS.Names[i] + '- CST NAO CADASTRADO';

    addRelatorioForm19(CompletaOuRepete(cst_nome, formataCurrency(StrToCurrDef(MAT_HIS.ValueFromIndex[i], 0)), ' ', 40) + CRLF);
  end;

  addRelatorioForm19(CompletaOuRepete('','','-', 79) + CRLF);
  if XmlNaoEncontrado <> '' then begin
    addRelatorioForm19('XML Nao Encontrados: ' + #13 + XmlNaoEncontrado);
    addRelatorioForm19(CompletaOuRepete('','','-', 79) + CRLF);
  end;

  MAT_HIS.Free;
  MAT_HIS_NOMES.Free;
  dm.IBselect.Close;
  dm.IBQuery2.Close;
  DadosNfe.Free;
  listaProdutos.Free;


  form19.ShowModal;
end;

procedure TForm2.ContasaPagar1Click(Sender: TObject);
var
  grupo,ini,fim,his,g1,h1,imprimirtotaldia:string;
  totaldia,totalgeral:currency;
  dia:TDateTime;
  b:integer;
begin
  b :=62;
  totaldia := 0;
  totalgeral := 0;
  form19.RichEdit1.Clear;
  grupo := funcoes.dialogo('generico',0,'1234567890'+#8,50,false,'',Application.Title,'Qual o Grupo?','');
  if grupo = '*' then exit;

  ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(StartOfTheMonth(now)));
  if ini = '*' then exit;

  fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?',formatadataddmmyy(endOfTheMonth(now)));
  if fim = '*' then exit;

  his := funcoes.dialogo('normal',0,'',50,false,'',Application.Title,'Qual o Hist�rico?','');
  if his = '*' then exit;

  imprimirtotaldia := funcoes.dialogo('generico',0,'SN',20,false,'S',Application.Title,'Imprimir Totais a Pagar de Cada Dia?','S');
  if imprimirtotaldia = '*' then exit;

    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|'+#13+#10,' ',81)))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+'Relatorio de Contas a Pagar de: '+ini+' a '+fim,'HORA: '+FormatDateTime('tt',now)+'|'+#13+#10,' ',81)))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'#13+#10,'-',81)))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|Caixa| Vencto | Nr.Doc   | Historico                             |   Valor   |'+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
    if grupo<>'' then g1 := '(codgru='+grupo+') and';
    if his<>'' then h1 := ' and (historico like '+QuotedStr('%'+UpperCase(his)+'%')+')';
    dm.IBselect.Close;
    dm.IBselect.SQL.Clear;
    dm.IBselect.SQL.Add('select * from contaspagar where '+g1+' ((vencimento>=:v1) and (vencimento<=:v2) and (pago=0)) '+h1+' order by vencimento');
    dm.IBselect.ParamByName('v1').AsDateTime := StrToDate(ini);
    dm.IBselect.ParamByName('v2').AsDateTime := StrToDate(fim);
    dm.IBselect.Open;
    dm.IBselect.FetchAll;
    dm.IBselect.First;
    dia := dm.IBselect.fieldbyname('vencimento').AsDateTime;
    while not dm.IBselect.Eof do
     begin
       if form19.RichEdit1.Lines.Count>=b then
        begin
         b:=b + 67;
         form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
         addRelatorioForm19(#12);
         //form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((' '+#12+#13+#10))));
         form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('  '+funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
         form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|'+#13+#10,' ',81)))));
         form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+'Relatorio de Contas a Pagar de: '+ini+' a '+fim,'HORA: '+FormatDateTime('tt',now)+'|'+#13+#10,' ',81)))));
         form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'#13+#10,'-',81)))));
         form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|Caixa| Vencto | Nr.Doc   | Historico                             |   Valor   |'+#13+#10))));
         form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
        end;

       addRelatorioForm19(funcoes.CompletaOuRepete('|',dm.IBselect.FieldByName('codgru').AsString,' ',6)+' '+funcoes.CompletaOuRepete('',FormatDateTime('dd/mm/yy', dm.IBselect.FieldByName('vencimento').AsDateTime),' ',8)+' '+funcoes.CompletaOuRepete('',dm.IBselect.FieldByName('documento').AsString,' ',10)+'  '+funcoes.CompletaOuRepete(LeftStr(dm.IBselect.fieldbyname('historico').AsString, 37),'',' ',37)+' '+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',dm.IBselect.FieldByName('valor').AsCurrency)+'|',' ',13)+#13+#10);
       totalgeral := totalgeral + dm.IBselect.fieldbyname('valor').AsCurrency;
       if dia = dm.IBselect.fieldbyname('vencimento').AsDateTime then
        begin
           totaldia := totaldia + dm.IBselect.fieldbyname('valor').AsCurrency;
         end;
       if imprimirtotaldia='S' then if (dm.IBselect.RecNo=dm.IBselect.RecordCount) and (totaldia<>0) then form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+'TOTAL DIA => '+FormatCurr('#,###,###0.00',totaldia),'|',' ',79)+#13+#10))));
       dm.IBselect.Next;
       if dia <> dm.IBselect.fieldbyname('vencimento').AsDateTime then
        begin
          dia :=dm.IBselect.fieldbyname('vencimento').AsDateTime;
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+'TOTAL DIA => '+FormatCurr('#,###,###0.00',totaldia),'|',' ',79)+#13+#10))));
          totaldia := 0;
        end;

     end;
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+'TOTAL A PAGAR => '+FormatCurr('#,###,###0.00',totalgeral),'|',' ',79)+#13+#10))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
     form19.RichEdit1.SelStart := 0;

     funcoes.CharSetRichEdit(form19.richedit1, 1);
     form19.ShowModal;
end;

procedure TForm2.PorData1Click(Sender: TObject);
var grupo,ini,fim,his,g1,h1,imprimirtotaldia:string;
totaldia,totalgeral:currency;
dia:TDateTime;
b:integer;
begin
  Button1.Click;

  b:=55;
  totaldia := 0;
  totalgeral := 0;
  form19.RichEdit1.Clear;
  grupo := funcoes.dialogo('generico',0,'1234567890'+#8,50,false,'',Application.Title,'Qual o Grupo?','');
  if not funcoes.Contido('*',grupo) then ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(StartOfTheMonth(now)));
  if not funcoes.Contido('*',grupo+ini) then fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?',formatadataddmmyy(endOfTheMonth(now)));
  if not funcoes.Contido('*',grupo+ini+fim) then his := funcoes.dialogo('normal',0,'',50,false,'',Application.Title,'Qual o Hist�rico?','');
  if not funcoes.Contido('*',grupo+ini+fim+his) then imprimirtotaldia := funcoes.dialogo('generico',0,'SN',20,false,'S',Application.Title,'Imprimir Endere�o dos Clientes?','N');
  if not funcoes.Contido('*',grupo+ini+fim+his+imprimirtotaldia) then
   begin
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|'+#13+#10,' ',81)))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+'Relat�rio de Contas a Receber de: '+ini+' a '+fim,'HORA: '+FormatDateTime('tt',now)+'|'+#13+#10,' ',81)))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'#13+#10,'-',81)))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|Caixa| Vencto | Nr.Doc |   Historico                             |   Valor   |'+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
     if grupo<>'' then g1 := '(codgru='+grupo+') and';
     if his<>'' then h1 := ' and (historico like '+QuotedStr('%'+UpperCase(his)+'%')+')';
     dm.IBselect.Close;
     dm.IBselect.SQL.Clear;
     dm.IBselect.SQL.Add('select * from contasreceber where '+g1+' ((vencimento>=:v1) and (vencimento<=:v2) and (pago=0)) '+h1+' order by vencimento');
     dm.IBselect.ParamByName('v1').AsDateTime := StrToDate(ini);
     dm.IBselect.ParamByName('v2').AsDateTime := StrToDate(fim);
     dm.IBselect.Open;
     dm.IBselect.FetchAll;
     dm.IBselect.First;
     dia := dm.IBselect.fieldbyname('vencimento').AsDateTime;
     while not dm.IBselect.Eof do
     begin
       if form19.RichEdit1.Lines.Count>=b then
        begin
         b:=b+55;
         form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((' '+#12+#13+#10))));
         form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
         form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|'+#13+#10,' ',81)))));
         form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+'Relat�rio de Contas a Receber de: '+ini+' a '+fim,'HORA: '+FormatDateTime('tt',now)+'|'+#13+#10,' ',81)))));
         form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'#13+#10,'-',81)))));
         form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|Caixa| Vencto | Nr.Doc |   Historico                             |   Valor   |'+#13+#10))));
         form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
        end;
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|',dm.IBselect.FieldByName('codgru').AsString,' ',6)+' '+funcoes.CompletaOuRepete('',FormatDateTime('dd/mm/yy', dm.IBselect.FieldByName('vencimento').AsDateTime),' ',8)+' '+funcoes.CompletaOuRepete('',dm.IBselect.FieldByName('documento').AsString,' ',7)+'  '+funcoes.CompletaOuRepete(dm.IBselect.fieldbyname('historico').AsString,'',' ',40)+' '+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',dm.IBselect.FieldByName('valor').AsCurrency)+'|',' ',13)+#13+#10))));
       if imprimirtotaldia='S' then form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+funcoes.BuscaNomeBD(dm.ibquery1,'ende','cliente',' where cod='+dm.IBselect.fieldbyname('documento').AsString),'|',' ',79)+#13+#10))));
       totalgeral := totalgeral + dm.IBselect.fieldbyname('valor').AsCurrency;
       if dia = dm.IBselect.fieldbyname('vencimento').AsDateTime then
         begin
           totaldia := totaldia + dm.IBselect.fieldbyname('valor').AsCurrency;
         end;
       dm.IBselect.Next;
       if dia <> dm.IBselect.fieldbyname('vencimento').AsDateTime then
        begin
          dia :=dm.IBselect.fieldbyname('vencimento').AsDateTime;
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+'TOTAL DIA => '+FormatCurr('#,###,###0.00',totaldia),'|',' ',79)+#13+#10))));
          if imprimirtotaldia='S' then form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|','|','_',79)+#13+#10))));
          totaldia := 0;
        end;
       if (dm.IBselect.RecNo=dm.IBselect.RecordCount) and (totaldia<>0) then
        begin
         form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+'TOTAL DIA => '+FormatCurr('#,###,###0.00',totaldia),'|',' ',79)+#13+#10))));
         //if imprimirtotaldia='S' then form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|','|','_',79)+#13+#10))));
        end;
     end;
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+'TOTAL A PAGAR => '+FormatCurr('#,###,###0.00',totalgeral),'|',' ',79)+#13+#10))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
     form19.RichEdit1.SelStart := 0;
     form19.ShowModal;

   end;
end;


procedure TForm2.PorLocalidade1Click(Sender: TObject);
var grupo,ini,fim,his,g1,codigos:string;
totalgeral:currency;
b:integer;
begin
  codigos:='';
  b:=55;

  totalgeral := 0;
  form19.RichEdit1.Clear;
  grupo := funcoes.dialogo('generico',0,'1234567890'+#8,50,false,'',Application.Title,'Qual o Grupo?','');
  if not funcoes.Contido('*',grupo) then ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(StartOfTheMonth(now)));
  if not funcoes.Contido('*',grupo+ini) then fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?',formatadataddmmyy(endOfTheMonth(now)));
  if not funcoes.Contido('*',grupo+ini+fim) then his := funcoes.dialogo('normal',0,'',50,false,'',Application.Title,'Qual a Localidade?','');
  if not funcoes.Contido('*',grupo+ini+fim+his) then
   begin
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|'+#13+#10,' ',81)))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+'Relat�rio de Contas a Receber Por Localidade: '+his,'HORA: '+FormatDateTime('tt',now)+'|'+#13+#10,' ',81)))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'#13+#10,'-',81)))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|Caixa| Vencto | Nr.Doc |   Historico                             |   Valor   |'+#13+#10))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));

     dm.IBselect.Close;
     dm.IBselect.SQL.Clear;
     dm.IBselect.SQL.Add('select * from cliente where cid like '+QuotedStr('%'+his+'%'));
     dm.IBselect.Open;
     dm.IBselect.First;
     while not dm.IBselect.Eof do
      begin
       codigos := codigos + dm.IBselect.fieldbyname('cod').AsString+'-';
       dm.IBselect.Next;
      end;
     dm.IBselect.Close;
     if grupo<>'' then g1 := '(codgru='+grupo+') and';
     dm.IBselect.Close;
     dm.IBselect.SQL.Clear;
     dm.IBselect.SQL.Add('select * from contasreceber where '+g1+' ((vencimento>=:v1) and (vencimento<=:v2) and (pago=0)) order by vencimento');
     dm.IBselect.ParamByName('v1').AsDateTime := StrToDate(ini);
     dm.IBselect.ParamByName('v2').AsDateTime := StrToDate(fim);
     dm.IBselect.Open;
     dm.IBselect.FetchAll;
     dm.IBselect.First;
    while not dm.IBselect.Eof do
     begin
      if funcoes.Contido(dm.IBselect.FieldByName('documento').AsString,codigos) then
        begin

           if form19.RichEdit1.Lines.Count>=b then
            begin
              b:=b+55;
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((' '+#12+#13+#10))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|'+#13+#10,' ',81)))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+'Relat�rio de Contas a Receber de: '+ini+' a '+fim,'HORA: '+FormatDateTime('tt',now)+'|'+#13+#10,' ',81)))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'#13+#10,'-',81)))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|Caixa| Vencto | Nr.Doc |   Historico                             |   Valor   |'+#13+#10))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
            end;
            form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|',dm.IBselect.FieldByName('codgru').AsString,' ',6)+' '+funcoes.CompletaOuRepete('',FormatDateTime('dd/mm/yy', dm.IBselect.FieldByName('vencimento').AsDateTime),' ',8)+' '+funcoes.CompletaOuRepete('',dm.IBselect.FieldByName('documento').AsString,' ',7)+'  '+funcoes.CompletaOuRepete(dm.IBselect.fieldbyname('historico').AsString,'',' ',40)+' '+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',dm.IBselect.FieldByName('valor').AsCurrency)+'|',' ',13)+#13+#10))));
            totalgeral := totalgeral + dm.IBselect.fieldbyname('valor').AsCurrency;



        end;
      dm.IBselect.Next;
     end;
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+'TOTAL A PAGAR => '+FormatCurr('#,###,###0.00',totalgeral),'|',' ',79)+#13+#10))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
     form19.RichEdit1.SelStart := 0;
     form19.ShowModal;
   end;

end;



procedure TForm2.PorObservao1Click(Sender: TObject);
var grupo,ini,fim,his,g1,codigos:string;
totalgeral:currency;
b:integer;
begin
  codigos:='';
  b:=55;

  totalgeral := 0;
  form19.RichEdit1.Clear;
  grupo := funcoes.dialogo('generico',0,'1234567890'+#8,50,false,'',Application.Title,'Qual o Grupo?','');
  if not funcoes.Contido('*',grupo) then ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(StartOfTheMonth(now)));
  if not funcoes.Contido('*',grupo+ini) then fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?',formatadataddmmyy(endOfTheMonth(now)));
  if not funcoes.Contido('*',grupo+ini+fim) then his := funcoes.dialogo('normal',0,'',50,false,'',Application.Title,'Qual a Observa��o?','');
   if not funcoes.Contido('*',grupo+ini+fim+his) then
   begin
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|'+#13+#10,' ',81)))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+'Relat�rio de Contas a Receber Por Localidade: '+his,'HORA: '+FormatDateTime('tt',now)+'|'+#13+#10,' ',81)))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'#13+#10,'-',81)))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|Caixa| Vencto | Nr.Doc |   Historico                             |   Valor   |'+#13+#10))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));

     dm.IBselect.Close;
     dm.IBselect.SQL.Clear;
     dm.IBselect.SQL.Add('select * from cliente where obs like '+QuotedStr('%'+his+'%'));
     dm.IBselect.Open;
     dm.IBselect.First;
     while not dm.IBselect.Eof do
      begin
       codigos := codigos + dm.IBselect.fieldbyname('cod').AsString+'-';
       dm.IBselect.Next;
      end;
     dm.IBselect.Close;
     if grupo<>'' then g1 := '(codgru='+grupo+') and';
     dm.IBselect.Close;
     dm.IBselect.SQL.Clear;
     dm.IBselect.SQL.Add('select * from contasreceber where '+g1+' ((vencimento>=:v1) and (vencimento<=:v2) and (pago=0)) order by vencimento');
     dm.IBselect.ParamByName('v1').AsDateTime := StrToDate(ini);
     dm.IBselect.ParamByName('v2').AsDateTime := StrToDate(fim);
     dm.IBselect.Open;
     dm.IBselect.FetchAll;
     dm.IBselect.First;
    while not dm.IBselect.Eof do
     begin
      if funcoes.Contido(dm.IBselect.FieldByName('documento').AsString,codigos) then
        begin

           if form19.RichEdit1.Lines.Count>=b then
            begin
              b:=b+55;
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((' '+#12+#13+#10))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|'+#13+#10,' ',81)))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+'Relat�rio de Contas a Receber de: '+ini+' a '+fim,'HORA: '+FormatDateTime('tt',now)+'|'+#13+#10,' ',81)))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'#13+#10,'-',81)))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|Caixa| Vencto | Nr.Doc |   Historico                             |   Valor   |'+#13+#10))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
            end;
            form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|',dm.IBselect.FieldByName('codgru').AsString,' ',6)+' '+funcoes.CompletaOuRepete('',FormatDateTime('dd/mm/yy', dm.IBselect.FieldByName('vencimento').AsDateTime),' ',8)+' '+funcoes.CompletaOuRepete('',dm.IBselect.FieldByName('documento').AsString,' ',7)+'  '+funcoes.CompletaOuRepete(dm.IBselect.fieldbyname('historico').AsString,'',' ',40)+' '+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',dm.IBselect.FieldByName('valor').AsCurrency)+'|',' ',13)+#13+#10))));
            totalgeral := totalgeral + dm.IBselect.fieldbyname('valor').AsCurrency;



        end;
      dm.IBselect.Next;
     end;
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+'TOTAL A PAGAR => '+FormatCurr('#,###,###0.00',totalgeral),'|',' ',79)+#13+#10))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
     form19.RichEdit1.SelStart := 0;
     form19.ShowModal;
   end;


end;

procedure TForm2.PorVendedor1Click(Sender: TObject);
var grupo,ini,fim,his,g1,h1:string;
totalgeral:currency;
b:integer;
begin
  b:=55;
  totalgeral := 0;
  form19.RichEdit1.Clear;
  his:='';
  grupo:='';
  grupo := funcoes.dialogo('generico',0,'1234567890'+#8,50,false,'',Application.Title,'Qual o Grupo?','');
  if not funcoes.Contido('*',grupo) then ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(StartOfTheMonth(now)));
  if not funcoes.Contido('*',grupo+ini) then fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?',formatadataddmmyy(endOfTheMonth(now)));
  if not funcoes.Contido('*',grupo+ini+fim) then  his := funcoes.dialogo('normal',0,'',20,false,'',Application.Title,'Qual o Vendedor?','');
   if not funcoes.Contido('*',grupo+ini+fim+his) then
   begin
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|'+#13+#10,' ',81)))));
    if his<>'' then form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+'Relat�rio de Contas a Receber Por Vendedor: '+funcoes.BuscaNomeBD(dm.ibquery2,'nome','vendedor',' where cod='+his),'HORA: '+FormatDateTime('tt',now)+'|'+#13+#10,' ',81)))))
     else form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+'Relat�rio de Contas a Receber Por Vendedor: N�o Informado','HORA: '+FormatDateTime('tt',now)+'|'+#13+#10,' ',81)))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'#13+#10,'-',81)))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|Caixa| Vencto | Nr.Doc |   Historico                             |   Valor   |'+#13+#10))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));

     if grupo<>'' then g1 := '(codgru='+grupo+') and';
     if his<>'' then h1 := ' and (vendedor='+his+')';
     dm.IBselect.Close;
     dm.IBselect.SQL.Clear;
     dm.IBselect.SQL.Add('select * from contasreceber where '+g1+' ((vencimento>=:v1) and (vencimento<=:v2) and (pago=0)) '+h1+' order by vencimento');
     dm.IBselect.ParamByName('v1').AsDateTime := StrToDate(ini);
     dm.IBselect.ParamByName('v2').AsDateTime := StrToDate(fim);
     dm.IBselect.Open;
     dm.IBselect.FetchAll;
     dm.IBselect.First;
    while not dm.IBselect.Eof do
     begin
           if form19.RichEdit1.Lines.Count>=b then
            begin
              b:=b+55;
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((' '+#12+#13+#10))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|'+#13+#10,' ',81)))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+'Relat�rio de Contas a Receber de: '+ini+' a '+fim,'HORA: '+FormatDateTime('tt',now)+'|'+#13+#10,' ',81)))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'#13+#10,'-',81)))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|Caixa| Vencto | Nr.Doc |   Historico                             |   Valor   |'+#13+#10))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
            end;
            form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|',dm.IBselect.FieldByName('codgru').AsString,' ',6)+' '+funcoes.CompletaOuRepete('',FormatDateTime('dd/mm/yy', dm.IBselect.FieldByName('vencimento').AsDateTime),' ',8)+' '+funcoes.CompletaOuRepete('',dm.IBselect.FieldByName('documento').AsString,' ',7)+'  '+funcoes.CompletaOuRepete(dm.IBselect.fieldbyname('historico').AsString,'',' ',40)+' '+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',dm.IBselect.FieldByName('valor').AsCurrency)+'|',' ',13)+#13+#10))));
            totalgeral := totalgeral + dm.IBselect.fieldbyname('valor').AsCurrency;



       dm.IBselect.Next;
     end;
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+'TOTAL A PAGAR => '+FormatCurr('#,###,###0.00',totalgeral),'|',' ',79)+#13+#10))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
     form19.RichEdit1.SelStart := 0;
     form19.ShowModal;
   end;



end;

procedure TForm2.LivrodeCaixa1Click(Sender: TObject);
var
  grupo,ini,fim,g1,saldo,caixa,resumo,ies,nome,cnpj:string;
  totalgeral,entrada,saida,totalentrada,totalsaida,acc:currency;
  b,pag,i:integer;
  data : tdatetime;
  res:tstringlist;
  resuC : TClientDataSet;
begin
  pag := 1;
  b  := 88;
  acc := 0;
  totalgeral := 0;
  entrada :=0;
  saida := 0;
  totalentrada := 0;
  totalsaida := 0;

  form19.RichEdit1.Clear;
  grupo:='';
  grupo := funcoes.dialogo('generico',0,'1234567890'+#8,50,false,'',Application.Title,'Qual o Grupo?','');
  if not funcoes.Contido('*',grupo) then ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(form22.datamov));
  if not funcoes.Contido('*',grupo+ini) then fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?',formatadataddmmyy(form22.datamov));
  if not funcoes.Contido('*',grupo+ini+fim) then  saldo := funcoes.dialogo('generico',0,'SN',20,false,'S',Application.Title,'Considerar Saldo Anterior?','S');
  if not funcoes.Contido('*',grupo+ini+fim+saldo) then  caixa := funcoes.dialogo('generico',0,'SN',20,false,'S',Application.Title,'Imprimir em Formato de Livro Caixa?','N');
  if not funcoes.Contido('*',grupo+ini+fim+saldo) then  resumo := funcoes.dialogo('generico',0,'SN',20,false,'S',Application.Title,'Imprimir Resumo por Hist�rico?','N');
   if not funcoes.Contido('*',grupo+ini+fim+saldo+caixa+resumo) then
   begin
   if resumo='S' then
   begin
    //res   := tstringlist.Create;
    resuC := TClientDataSet.Create(self);
    resuC.FieldDefs.Add('cod', ftInteger);
    resuC.FieldDefs.Add('entrada', ftCurrency);
    resuC.FieldDefs.Add('saida'  , ftCurrency);
    resuC.IndexFieldNames := 'cod';
    resuC.CreateDataSet;
   end;
    dm.IBQuery2.Close;
    dm.IBQuery2.SQL.Clear;
    dm.IBQuery2.SQL.Add('select * from registro');
    dm.IBQuery2.Open;
    ies := dm.IBQuery2.fieldbyname('ies').AsString;
    nome := dm.IBQuery2.fieldbyname('nome').AsString;
    cnpj := dm.IBQuery2.fieldbyname('cnpj').AsString;
    dm.IBQuery2.Close;

    if grupo<>'' then g1 := '(codgru='+grupo+') and';

    if saldo='S' then
     begin
      dm.IBQuery2.SQL.Clear;
      dm.IBQuery2.SQL.Add('select (sum(entrada) - sum(saida)) as soma from caixa where '+g1+' (cast(data as date) < :d1)');
      dm.IBQuery2.ParamByName('d1').AsDateTime := StrToDate(ini);
      dm.IBQuery2.Open;

      if not dm.IBQuery2.IsEmpty then acc := dm.IBQuery2.fieldbyname('soma').AsCurrency;
      dm.IBQuery2.Close;
     end;

    //form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#15+#13+#10))));
    addRelatorioForm19('|' + #15 + '|' + CRLF);
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',116)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('| Raz�o Social:'+nome+'                Pagina:'+IntToStr(pag),'DATA: '+FormatDateTime('dd/mm/yy',form22.datamov)+'|',' ',116)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('| CNPJ:'+cnpj+'            INSC. EST.:'+ies,'|',' ',116)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+'Livro de Registros do Movimento de Caixa de: '+ini+' a '+fim,'HORA: '+FormatDateTime('tt',now)+'|',' ',116)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'#13+#10,'-',118)))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|  Data   | Nr.Doc | Historico                             |      Entrada  |        Saida |  Saldo Atual   | Grupo |'+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',118)))));

    dm.IBselect.Close;
    dm.IBselect.SQL.Clear;
    dm.IBselect.SQL.Add('select * from caixa where '+g1+' ((cast(data as date) >= :v1) and (cast(data as date) <=:v2) ) order by data');
    dm.IBselect.ParamByName('v1').AsDateTime := StrToDate(ini);
    dm.IBselect.ParamByName('v2').AsDateTime := StrToDate(fim);
    dm.IBselect.Open;
    dm.IBselect.FetchAll;
    dm.IBselect.First;
    data := dm.IBselect.fieldbyname('data').AsDateTime;
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|Saldo Transportado =>',FormatCurr('#,###,###0.00',acc)+'        |',' ',116)+#13+#10))));
    funcoes.informacao(dm.IBselect.RecNo,dm.IBselect.RecordCount,'Carregando...',true,false,5);
    while not dm.IBselect.Eof do
     begin
       funcoes.informacao(dm.IBselect.RecNo,dm.IBselect.RecordCount,'Carregando...',false,false,5);
       if resumo='S' then
         begin
           if dm.IBselect.FieldByName('entrada').AsCurrency = 0 then
            begin
              if resuC.FindKey([dm.IBselect.fieldbyname('codhis').AsString]) then
                begin
                  resuC.Edit;
                  resuC.FieldByName('saida').AsCurrency := resuC.FieldByName('saida').AsCurrency + dm.IBselect.fieldbyname('saida').AsCurrency;
                  resuC.Post;
                end
              else
                begin
                  resuC.Insert;
                  resuC.FieldByName('cod').AsString := dm.IBselect.fieldbyname('codhis').AsString;
                  resuC.FieldByName('saida').AsCurrency :=  dm.IBselect.fieldbyname('saida').AsCurrency;
                  resuC.Post;
                end;

            end
           else
            begin
              if resuC.FindKey([dm.IBselect.fieldbyname('codhis').AsString]) then
                begin
                  resuC.Edit;
                  resuC.FieldByName('entrada').AsCurrency := resuC.FieldByName('entrada').AsCurrency + dm.IBselect.fieldbyname('entrada').AsCurrency;
                  resuC.Post;
                end
              else
                begin
                  resuC.Insert;
                  resuC.FieldByName('cod').AsString       := dm.IBselect.fieldbyname('codhis').AsString;
                  resuC.FieldByName('entrada').AsCurrency :=  dm.IBselect.fieldbyname('entrada').AsCurrency;
                  resuC.Post;
                end;

              //entrada est� preenchido
           {   if   res.Values[dm.IBselect.fieldbyname('codhis').AsString + '-1'] = '' then res.Add(dm.IBselect.fieldbyname('codhis').AsString+'-1' + '=' + CurrToStr(dm.IBselect.fieldbyname('entrada').AsCurrency))
              else res.Values[dm.IBselect.fieldbyname('codhis').AsString + '-1'] := CurrToStr(StrToCurr(res.Values[dm.IBselect.fieldbyname('codhis').AsString+'-1']) + dm.IBselect.fieldbyname('entrada').AsCurrency);
            }end;
         end;

            if (caixa = 'S') and (data <> dm.IBselect.FieldByName('data').AsDateTime) then
            begin
              data := dm.IBselect.FieldByName('data').AsDateTime;
              for i:=form19.RichEdit1.Lines.Count to b do
              begin
                form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|','|',' ',116)+#13+#10))));
              end;
            end;
                 if form19.RichEdit1.Lines.Count>=b then
            begin
              pag := pag +1;
              b:=b+88;
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',116)+#13+#10))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|'+'TOTAL  =>                                                  '+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',entrada),' ',15)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',saida),' ',15)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',acc),' ',16)+'         |'+#13+#10))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',116)+#13+#10))));

              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((' '+#12+#13+#10))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',116)+#13+#10))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('| Raz�o Social:'+nome+'                Pagina:'+IntToStr(pag),'DATA: '+FormatDateTime('dd/mm/yy',form22.datamov)+'|',' ',116)+#13+#10))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('| CNPJ:'+cnpj+'            INSC. EST.:'+ies,'|',' ',116)+#13+#10))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+'Livro de Registros do Movimento de Caixa de: '+ini+' a '+fim,'HORA: '+FormatDateTime('tt',now)+'|',' ',116)+#13+#10))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'#13+#10,'-',118)))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|  Data   | Nr.Doc | Historico                             |      Entrada  |        Saida |  Saldo Atual           |'+#13+#10))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',118)))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|Saldo Transportado =>',FormatCurr('#,###,###0.00',acc)+'        |',' ',116)+#13+#10))));
              entrada :=0;
              saida := 0;
           end;
            acc:= acc + (dm.IBselect.fieldbyname('entrada').AsCurrency- dm.IBselect.fieldbyname('saida').AsCurrency);
            totalgeral := totalgeral + dm.IBselect.fieldbyname('entrada').AsCurrency;
            entrada := entrada + dm.IBselect.fieldbyname('entrada').AsCurrency;
            saida := saida + dm.IBselect.fieldbyname('saida').AsCurrency;
            totalentrada := totalentrada + dm.IBselect.fieldbyname('entrada').AsCurrency;
            totalsaida := totalsaida + dm.IBselect.fieldbyname('saida').AsCurrency;

       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|',' '+FormatDateTime('dd/mm/yy',dm.IBselect.FieldByName('data').AsDateTime),' ',10)+' '+funcoes.CompletaOuRepete('',dm.IBselect.FieldByName('documento').AsString,' ',9)+' '+funcoes.CompletaOuRepete(LeftStr(dm.IBselect.FieldByName('historico').AsString, 37),'',' ',37)+'  '+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',dm.IBselect.FieldByName('entrada').AsCurrency),' ',15)+'  '+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',dm.IBselect.FieldByName('saida').AsCurrency),' ',13)+'  '+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',acc),' ',15)+'  '+funcoes.CompletaOuRepete('',dm.IBselect.FieldByName('codgru').AsString+'|',' ',7)+#13+#10))));
       dm.IBselect.Next;
     end;
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',116)+#13+#10))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|'+'TOTAL GERAL  =>                                                '+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',totalentrada),' ',15)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',totalsaida),' ',15)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',acc),' ',16)+'     |'+#13+#10))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',116)+#13+#10))));
     dm.IBselect.Close;
     if resumo='S' then
     begin
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#13+#10))));
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+funcoes.LerValorPGerais('empresa',form22.Pgerais),FormatDateTime('dd/mm/yy',form22.datamov)+'|',' ',80)+#13+#10))));
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|RESUMO DE CAIXA POR HISTORICO',FormatDateTime('dd/mm/yy',form22.datamov)+'|',' ',80)+#13+#10))));
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|COD  |HISTORICO                                 |     ENTRADA   |        SAIDA|'+#13+#10))));
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
{       for i:=0 to res.Count-1 do
       begin
         if res.Values[copy(res.Names[i],1,pos('-',res.Names[i])-1) + '-1']='' then res.Add(copy(res.Names[i],1,pos('-',res.Names[i])-1)+'-1'+'='+'0');
         if res.Values[copy(res.Names[i],1,pos('-',res.Names[i])-1) + '-2']='' then res.Add(copy(res.Names[i],1,pos('-',res.Names[i])-1)+'-2'+'='+'0');
       end;

       res.Sort;
       i:=0;

       while i <= res.Count-1 do
       begin
         form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|',copy(res.Names[i],1,pos('-',res.Names[i])-1),' ',6)+' '+funcoes.CompletaOuRepete(funcoes.BuscaNomeBD(dm.ibquery2,'grupo','hiscaixa',' where cod='+copy(res.Names[i],1,pos('-',res.Names[i])-1)),'',' ',40)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',strtocurr(funcoes.ConverteNumerico(res.ValueFromIndex[i]))),' ',16)+ ' '+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',strtocurr(funcoes.ConverteNumerico(res.ValueFromIndex[i+1])))+'|',' ',16)+#13+#10))));
         i := i+2;
       end;
}
       resuC.First;
       while not resuC.Eof do
         begin
           form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|',resuC.fieldbyname('cod').AsString,' ',6)+' '+funcoes.CompletaOuRepete(funcoes.BuscaNomeBD(dm.ibquery2,'grupo','hiscaixa',' where cod='+ resuC.fieldbyname('cod').AsString),'',' ',40)
           + funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00', resuC.fieldbyname('entrada').AsCurrency),' ',16)+ ' '+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00', resuC.fieldbyname('saida').AsCurrency)+'|',' ',16)+#13+#10))));
           resuC.Next;
         end;

       resuC.Free;  
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((' '+#13+#10))));
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#13+#10))));

       dm.IBselect.Close;
       dm.IBselect.SQL.Clear;
       dm.IBselect.SQL.Add('select (sum(entrada)-sum(saida)) as saldo from caixa where '+g1+' ((cast(data as date)>=:v1) and (cast(data as date)<=:v2) )');
       dm.IBselect.ParamByName('v1').AsDateTime := StartOftheMonth(StrToDate(ini)-30);
       dm.IBselect.ParamByName('v2').AsDateTime := endOfTheMonth(StrToDate(ini)-30);
       dm.IBselect.Open;
       entrada := dm.IBselect.fieldbyname('saldo').AsCurrency;

       dm.IBselect.Close;
       dm.IBselect.SQL.Clear;
       dm.IBselect.SQL.Add('select (sum(entrada)-sum(saida)) as saldo from caixa where '+g1+'(codhis>=1000) and ((cast(data as date)>=:v1) and (cast(data as date)<=:v2) )');
       dm.IBselect.ParamByName('v1').AsDateTime := StartOftheMonth(StrToDate(ini)-30);
       dm.IBselect.ParamByName('v2').AsDateTime := endOfTheMonth(StrToDate(ini)-30);
       dm.IBselect.Open;
       saida := dm.IBselect.fieldbyname('saldo').AsCurrency;

       dm.IBselect.Close;
       dm.IBselect.SQL.Clear;
       dm.IBselect.SQL.Add('select (sum(entrada)-sum(saida)) as saldo from caixa where '+g1+'(codhis<1000) and ((cast(data as date)>=:v1) and (cast(data as date)<=:v2) )');
       dm.IBselect.ParamByName('v1').AsDateTime := StrToDate(ini);
       dm.IBselect.ParamByName('v2').AsDateTime := StrToDate(fim);
       dm.IBselect.Open;

       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('+-------------+-------------+-------------+-------------+-------------+-------------+'+#13+#10))));
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|  ANTERIOR   |  ENTRADAS   |     SAIDAS  | SALDO ATUAL |SALDO CAIXA  |SALDO BANCO  |'+#13+#10))));
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('+-------------+-------------+-------------+-------------+-------------+-------------+'+#13+#10))));
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|'+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',entrada),' ',13)+'|'+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',totalentrada),' ',13)+'|'+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',totalsaida),' ',13)+'|'+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',totalgeral),' ',13)+'|'+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',dm.IBselect.fieldbyname('saldo').AsCurrency),' ',13)+'|'+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',saida),' ',13)+'|'+#13+#10))));
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('+-------------+-------------+-------------+-------------+-------------+-------------+'+#13+#10))));
       dm.IBselect.Close;
     end;

     form19.RichEdit1.SelStart := 0;
     funcoes.informacao(dm.IBselect.RecNo,dm.IBselect.RecordCount,'Carregando...',false,true,5);
     form19.ShowModal;
   end;





end;

procedure TForm2.ResumoFinanceiro1Click(Sender: TObject);
var
  grupo,ini,fim,g1,saldo:string;
  entrada, saida, acc, anterior, banco :currency;
  b, i : integer;
  entradaLis, saidaLis : tstringlist;
begin
  b            := 88;
  acc          := 0;
  entrada      := 0;
  saida        := 0;
  banco        := 0; 

  form19.RichEdit1.Clear;
  grupo:='';
  grupo := funcoes.dialogo('generico',0,'1234567890'+#8,50,false,'',Application.Title,'Qual o Grupo?','');
  if grupo = '*' then exit;

  ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(form22.datamov));
  if ini = '*' then exit;

  fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?',formatadataddmmyy(form22.datamov));
  if fim = '*' then exit;

  saldo := funcoes.dialogo('generico',0,'SN',20,true,'S',Application.Title,'Considerar Saldo Anterior?','S');
  if saldo = '*' then exit;

  if grupo<>'' then g1 := '(codgru =' + grupo +') and';

  entradaLis := tstringlist.Create;
  saidaLis   := tstringlist.Create;

  dm.IBQuery2.Close;
  dm.IBQuery2.SQL.Clear;
  dm.IBQuery2.SQL.Add('select (sum(entrada) - sum(saida)) as soma from caixa where '+ g1 +' (cast(data as date) < :d1)');
  dm.IBQuery2.ParamByName('d1').AsDateTime := StrToDate(ini);
  dm.IBQuery2.Open;

  anterior := dm.IBQuery2.fieldbyname('soma').AsCurrency;

  if saldo = 'S' then
    begin
      acc := anterior;
    end;

     dm.IBselect.Close;
     dm.IBselect.SQL.Clear;
     dm.IBselect.SQL.Add('select codhis, entrada, saida from caixa where '+g1+' ((cast(data as date)>=:v1) and (cast(data as date)<=:v2) ) order by data');
     dm.IBselect.ParamByName('v1').AsDateTime := StrToDate(ini);
     dm.IBselect.ParamByName('v2').AsDateTime := StrToDate(fim);
     dm.IBselect.Open;
     dm.IBselect.FetchAll;
     dm.IBselect.First;

     funcoes.informacao(dm.IBselect.RecNo,dm.IBselect.RecordCount,'Carregando...',true,false,5);
    while not dm.IBselect.Eof do
     begin
       funcoes.informacao(dm.IBselect.RecNo,dm.IBselect.RecordCount,'Carregando...',false,false,5);

       if dm.IBselect.FieldByName('entrada').AsCurrency = 0 then
         begin
           //saida est� preenchido
           entradaLis.Values[dm.IBselect.fieldbyname('codhis').AsString] := CurrToStr(StrToCurrDef(entradaLis.Values[dm.IBselect.fieldbyname('codhis').AsString], 0));
           saidaLis.Values[dm.IBselect.fieldbyname('codhis').AsString]   := CurrToStr(StrToCurrDef(saidaLis.Values[dm.IBselect.fieldbyname('codhis').AsString], 0) + dm.IBselect.fieldbyname('saida').AsCurrency);
         end
       else
         begin
           //entrada est� preenchido
           saidaLis.Values[dm.IBselect.fieldbyname('codhis').AsString]   := CurrToStr(StrToCurrDef(saidaLis.Values[dm.IBselect.fieldbyname('codhis').AsString], 0));
           entradaLis.Values[dm.IBselect.fieldbyname('codhis').AsString] := CurrToStr(StrToCurrDef(entradaLis.Values[dm.IBselect.fieldbyname('codhis').AsString], 0) + dm.IBselect.fieldbyname('entrada').AsCurrency);
         end;

       if dm.IBselect.fieldbyname('codhis').AsInteger >= 1000 then banco := banco +  (dm.IBselect.fieldbyname('entrada').AsCurrency - dm.IBselect.fieldbyname('saida').AsCurrency);

       acc := acc   + (dm.IBselect.fieldbyname('entrada').AsCurrency - dm.IBselect.fieldbyname('saida').AsCurrency);
       entrada      := entrada + dm.IBselect.fieldbyname('entrada').AsCurrency;
       saida        := saida + dm.IBselect.fieldbyname('saida').AsCurrency;

       dm.IBselect.Next;
     end;
     dm.IBselect.Close;

     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#13+#10))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+funcoes.LerValorPGerais('empresa',form22.Pgerais),FormatDateTime('dd/mm/yy',form22.datamov)+'|',' ',80)+#13+#10))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|RESUMO DE CAIXA POR HISTORICO',FormatDateTime('dd/mm/yy',form22.datamov)+'|',' ',80)+#13+#10))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|COD  |HISTORICO                                 |     ENTRADA   |        SAIDA|'+#13+#10))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));

     i := 0;
     for i := 0 to entradaLis.Count -1 do
       begin
         addRelatorioForm19(funcoes.CompletaOuRepete('|',entradaLis.Names[i],' ',6) + ' ' + funcoes.CompletaOuRepete(funcoes.BuscaNomeBD(dm.ibquery2,'grupo','hiscaixa',' where cod='+ entradaLis.Names[i]),'',' ',40) + funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00', strtocurr(entradaLis.Values[entradaLis.Names[i]])),' ',16) + ' '+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',strtocurr(saidaLis.Values[entradaLis.Names[i]]))+'|',' ',16)+#13+#10);
       end;

     {while i <= res.Count-1 do
     begin
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar())));
       i := i+2;
     end;
     }
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((' '+#13+#10))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#13+#10))));

     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('+-------------+-------------+-------------+-------------+-------------+-------------+'+#13+#10))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|  ANTERIOR   |  ENTRADAS   |     SAIDAS  | SALDO ATUAL |SALDO CAIXA  |SALDO BANCO  |'+#13+#10))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('+-------------+-------------+-------------+-------------+-------------+-------------+'+#13+#10))));
     addRelatorioForm19('|'+funcoes.CompletaOuRepete('', formataCurrency(anterior),' ',13)+'|'+funcoes.CompletaOuRepete('', formataCurrency(entrada),' ',13)+'|'+funcoes.CompletaOuRepete('',formataCurrency(saida),' ',13)+
     '|'+funcoes.CompletaOuRepete('',formataCurrency(acc),' ',13)+'|'+funcoes.CompletaOuRepete('',formataCurrency(entrada - saida),' ',13)+'|'+funcoes.CompletaOuRepete('',formataCurrency(banco),' ',13)+'|'+#13+#10);
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('+-------------+-------------+-------------+-------------+-------------+-------------+'+#13+#10))));
     dm.IBselect.Close;
     entradaLis.Free;
     saidaLis.Free;

     form19.RichEdit1.SelStart := 0;
     funcoes.informacao(dm.IBselect.RecNo,dm.IBselect.RecordCount,'Carregando...',false,true,5);
     form19.ShowModal;

end;

procedure TForm2.MovPorHistrico1Click(Sender: TObject);
var
  grupo,ini,fim,g1,his,h1,saldo,caixa,resumo,ies,nome,cnpj:string;
  totalgeral,entrada,saida,totalentrada,totalsaida,acc:currency;
  b,pag,i:integer;
  data : tdatetime;
  res, pagamento:tstringlist;
begin
  pag:= 1;
  b:=88;
  acc:=0;
  totalgeral := 0;
  entrada :=0;
  saida := 0;
  totalentrada := 0;
  totalsaida := 0;

  form19.RichEdit1.Clear;
  grupo:='';

  grupo := funcoes.dialogo('generico',0,'1234567890'+#8,50,false,'',Application.Title,'Qual o Grupo?','');
  if grupo = '*' then exit;

  his := funcoes.dialogo('generico',0,'1234567890'+#8,50,false,'',Application.Title,'Informe o C�d. do Hist�rico?','');
  if his = '*' then exit;

  if his = '' then begin

    //his := funcoes.localizar('Localizar Hist�rico','hiscaixa','cod','cod','cod','grupo','grupo',false,false,false,'',0,sender);
    His := funcoes.localizar('Localizar Hist�rico','hiscaixa','cod,grupo','cod,grupo','','grupo','grupo',true,false,false,'',0,nil);
    His := copy(His,1,pos('-',His)-1);
  end;

  ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(form22.datamov));
  if ini = '*' then exit;

  fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?',formatadataddmmyy(form22.datamov));
  if fim = '*' then exit;

  saldo := funcoes.dialogo('generico',0,'SN',20,false,'S',Application.Title,'Considerar Saldo Anterior?','S');
  if saldo = '*' then exit;

  caixa := funcoes.dialogo('generico',0,'SN',20,false,'S',Application.Title,'Imprimir em Formato de Livro Caixa?','N');
  if caixa = '*' then exit;

  resumo := funcoes.dialogo('generico',0,'SN',20,false,'S',Application.Title,'Imprimir Resumo por Hist�rico?','N');
  if resumo = '*' then exit;



   if resumo='S' then
   begin
    res := tstringlist.Create;
   end;


   pagamento := tstringlist.Create;


    dm.IBQuery2.Close;
    dm.IBQuery2.SQL.Clear;
    dm.IBQuery2.SQL.Add('select * from registro');
    dm.IBQuery2.Open;
    ies := dm.IBQuery2.fieldbyname('ies').AsString;
    nome := dm.IBQuery2.fieldbyname('nome').AsString;
    cnpj := dm.IBQuery2.fieldbyname('cnpj').AsString;
    dm.IBQuery2.Close;
    if saldo='S' then
     begin
      dm.IBQuery2.SQL.Clear;
      dm.IBQuery2.SQL.Add('select (sum(entrada) - sum(saida)) as soma from caixa where cast(data as date)<= :d1');
      dm.IBQuery2.ParamByName('d1').AsDateTime := StrToDate(ini);
      dm.IBQuery2.Open;

      acc := dm.IBQuery2.fieldbyname('soma').AsCurrency;
      dm.IBQuery2.Close;
     end;

    //form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#15+#13+#10))));
    addRelatorioForm19('|' + #15 + '|' + CRLF);
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',116)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('| Raz�o Social:'+nome+'                Pagina:'+IntToStr(pag),'DATA: '+FormatDateTime('dd/mm/yy',form22.datamov)+'|',' ',116)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('| CNPJ:'+cnpj+'            INSC. EST.:'+ies,'|',' ',116)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+'Livro de Registros do Movimento de Caixa de: '+ini+' a '+fim,'HORA: '+FormatDateTime('tt',now)+'|',' ',116)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'#13+#10,'-',118)))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|  Data   | Nr.Doc | Historico                             |      Entrada  |        Saida |  Saldo Atual   | Grupo |'+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',118)))));

     if grupo<>'' then g1 := '(codgru='+grupo+') and';
     if his<>'' then h1 := 'and (codhis='+his+') ';
     dm.IBselect.Close;
     dm.IBselect.SQL.Clear;
     dm.IBselect.SQL.Add('select * from caixa where '+g1+' ((cast(data as date) >= :v1) and (cast(data as date) <= :v2) ) '+h1+' order by data');
     dm.IBselect.ParamByName('v1').AsDateTime := StrToDate(ini);
     dm.IBselect.ParamByName('v2').AsDateTime := StrToDate(fim);
     dm.IBselect.Open;
     dm.IBselect.FetchAll;
     dm.IBselect.First;
     data := dm.IBselect.fieldbyname('data').AsDateTime;
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|Saldo Transportado =>',FormatCurr('#,###,###0.00',acc)+'        |',' ',116)+#13+#10))));
     funcoes.informacao(dm.IBselect.RecNo,dm.IBselect.RecordCount,'Carregando...',true,false,5);
    while not dm.IBselect.Eof do
     begin
       funcoes.informacao(dm.IBselect.RecNo,dm.IBselect.RecordCount,'Carregando...',false,false,5);

       if resumo='S' then
         begin
           if dm.IBselect.FieldByName('entrada').AsCurrency = 0 then
            begin
              //saida est� preenchido
              if res.Values[dm.IBselect.fieldbyname('codhis').AsString+'-2']='' then res.Add(dm.IBselect.fieldbyname('codhis').AsString+'-2'+'='+dm.IBselect.fieldbyname('saida').AsString)
              else res.Values[dm.IBselect.fieldbyname('codhis').AsString+'-2']:=CurrToStr(StrToCurr(funcoes.ConverteNumerico(res.Values[dm.IBselect.fieldbyname('codhis').AsString+'-2']))+dm.IBselect.fieldbyname('saida').AsCurrency);
            end
           else
            begin
              //entrada est� preenchido
              if res.Values[dm.IBselect.fieldbyname('codhis').AsString+'-1']='' then res.Add(dm.IBselect.fieldbyname('codhis').AsString+'-1'+'='+CurrToStr(dm.IBselect.fieldbyname('entrada').AsCurrency))
              else res.Values[dm.IBselect.fieldbyname('codhis').AsString+'-1']:=CurrToStr(StrToCurr(funcoes.ConverteNumerico(res.Values[dm.IBselect.fieldbyname('codhis').AsString+'-1']))+dm.IBselect.fieldbyname('entrada').AsCurrency);
            end;
          end;

            if (caixa = 'S') and (data <> dm.IBselect.FieldByName('data').AsDateTime) then
            begin
              data := dm.IBselect.FieldByName('data').AsDateTime;
              for i:=form19.RichEdit1.Lines.Count to b do
              begin
                form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|','|',' ',116)+#13+#10))));
              end;
            end;
                 if form19.RichEdit1.Lines.Count>=b then
            begin
              pag := pag +1;
              b:=b+88;
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',116)+#13+#10))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|'+'TOTAL  =>                                                  '+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',entrada),' ',15)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',saida),' ',15)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',acc),' ',16)+'         |'+#13+#10))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',116)+#13+#10))));

              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((' '+#12+#13+#10))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',116)+#13+#10))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('| Raz�o Social:'+nome+'                Pagina:'+IntToStr(pag),'DATA: '+FormatDateTime('dd/mm/yy',form22.datamov)+'|',' ',116)+#13+#10))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('| CNPJ:'+cnpj+'            INSC. EST.:'+ies,'|',' ',116)+#13+#10))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+'Livro de Registros do Movimento de Caixa de: '+ini+' a '+fim,'HORA: '+FormatDateTime('tt',now)+'|',' ',116)+#13+#10))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'#13+#10,'-',118)))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|  Data   | Nr.Doc | Historico                             |      Entrada  |        Saida |  Saldo Atual           |'+#13+#10))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',118)))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|Saldo Transportado =>',FormatCurr('#,###,###0.00',acc)+'        |',' ',116)+#13+#10))));
              entrada :=0;
              saida := 0;

           end;
            acc:= acc + (dm.IBselect.fieldbyname('entrada').AsCurrency- dm.IBselect.fieldbyname('saida').AsCurrency);
            totalgeral := totalgeral + dm.IBselect.fieldbyname('entrada').AsCurrency;
            entrada := entrada + dm.IBselect.fieldbyname('entrada').AsCurrency;
            saida := saida + dm.IBselect.fieldbyname('saida').AsCurrency;
            totalentrada := totalentrada + dm.IBselect.fieldbyname('entrada').AsCurrency;
            totalsaida := totalsaida + dm.IBselect.fieldbyname('saida').AsCurrency;

       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|',' '+FormatDateTime('dd/mm/yy',dm.IBselect.FieldByName('data').AsDateTime),' ',10)+' '+funcoes.CompletaOuRepete('',dm.IBselect.FieldByName('documento').AsString,' ',6)+' '+funcoes.CompletaOuRepete('',dm.IBselect.FieldByName('codhis').AsString,' ',4)+' '+funcoes.CompletaOuRepete(dm.IBselect.FieldByName('historico').AsString,'',' ',35)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',dm.IBselect.FieldByName('entrada').AsCurrency),' ',15)+'  '+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',dm.IBselect.FieldByName('saida').AsCurrency),' ',15)+'  '+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',acc),' ',15)+'  '+funcoes.CompletaOuRepete('',dm.IBselect.FieldByName('codgru').AsString,' ',5)+' |'+#13+#10))));
       dm.IBselect.Next;
     end;
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',116)+#13+#10))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|'+'TOTAL GERAL  =>                                          '+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',totalentrada),' ',15)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',totalsaida),' ',17)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',acc),' ',17)+'        |'+#13+#10))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',116)+#13+#10))));
     dm.IBselect.Close;
     if resumo='S' then
     begin
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#13+#10))));
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+funcoes.LerValorPGerais('empresa',form22.Pgerais),FormatDateTime('dd/mm/yy',form22.datamov)+'|',' ',80)+#13+#10))));
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|RESUMO DE CAIXA POR HISTORICO',FormatDateTime('dd/mm/yy',form22.datamov)+'|',' ',80)+#13+#10))));
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|COD  |HISTORICO                                 |     ENTRADA   |        SAIDA|'+#13+#10))));
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
       for i:=0 to res.Count-1 do
       begin
         if res.Values[copy(res.Names[i],1,pos('-',res.Names[i])-1)+'-1']='' then res.Add(copy(res.Names[i],1,pos('-',res.Names[i])-1)+'-1'+'='+'0');
         if res.Values[copy(res.Names[i],1,pos('-',res.Names[i])-1)+'-2']='' then res.Add(copy(res.Names[i],1,pos('-',res.Names[i])-1)+'-2'+'='+'0');
       end;
       res.Sort;
       i:=0;
       while i <= res.Count-1 do
       begin
         form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|',copy(res.Names[i],1,pos('-',res.Names[i])-1),' ',6)+' '+funcoes.CompletaOuRepete(funcoes.BuscaNomeBD(dm.ibquery2,'grupo','hiscaixa',' where cod='+copy(res.Names[i],1,pos('-',res.Names[i])-1)),'',' ',40)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',strtocurr(funcoes.ConverteNumerico(res.ValueFromIndex[i]))),' ',16)+ ' '+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',strtocurr(funcoes.ConverteNumerico(res.ValueFromIndex[i+1])))+'|',' ',16)+#13+#10))));
         i := i+2;
       end;
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((' '+#13+#10))));
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#13+#10))));

       dm.IBselect.Close;
       dm.IBselect.SQL.Clear;
       dm.IBselect.SQL.Add('select (sum(entrada)-sum(saida)) as saldo from caixa where '+g1+' ((cast(data as date)>=:v1) and (cast(data as date)<=:v2) )');
       dm.IBselect.ParamByName('v1').AsDateTime := StartOftheMonth(StrToDate(ini)-30);
       dm.IBselect.ParamByName('v2').AsDateTime := endOfTheMonth(StrToDate(ini)-30);
       dm.IBselect.Open;
       entrada := dm.IBselect.fieldbyname('saldo').AsCurrency;

       dm.IBselect.Close;
       dm.IBselect.SQL.Clear;
       dm.IBselect.SQL.Add('select (sum(entrada)-sum(saida)) as saldo from caixa where '+g1+'(codhis>=1000) and ((cast(data as date)>=:v1) and (cast(data as date)<=:v2) )');
       dm.IBselect.ParamByName('v1').AsDateTime := StartOftheMonth(StrToDate(ini)-30);
       dm.IBselect.ParamByName('v2').AsDateTime := endOfTheMonth(StrToDate(ini)-30);
       dm.IBselect.Open;
       saida := dm.IBselect.fieldbyname('saldo').AsCurrency;

       dm.IBselect.Close;
       dm.IBselect.SQL.Clear;
       dm.IBselect.SQL.Add('select (sum(entrada)-sum(saida)) as saldo from caixa where '+g1+'(codhis<1000) and ((cast(data as date)>=:v1) and (cast(data as date)<=:v2) )');
       dm.IBselect.ParamByName('v1').AsDateTime := StrToDate(ini);
       dm.IBselect.ParamByName('v2').AsDateTime := StrToDate(fim);
       dm.IBselect.Open;

       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('+-------------+-------------+-------------+-------------+-------------+-------------+'+#13+#10))));
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|  ANTERIOR   |  ENTRADAS   |     SAIDAS  | SALDO ATUAL |SALDO CAIXA  |SALDO BANCO  |'+#13+#10))));
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('+-------------+-------------+-------------+-------------+-------------+-------------+'+#13+#10))));
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|'+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',entrada),' ',13)+'|'+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',totalentrada),' ',13)+'|'+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',totalsaida),' ',13)+'|'+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',totalgeral),' ',13)+'|'+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',dm.IBselect.fieldbyname('saldo').AsCurrency),' ',13)+'|'+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',saida),' ',13)+'|'+#13+#10))));
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('+-------------+-------------+-------------+-------------+-------------+-------------+'+#13+#10))));
       dm.IBselect.Close;
     end;

     form19.RichEdit1.SelStart := 0;
     funcoes.informacao(dm.IBselect.RecNo,dm.IBselect.RecordCount,'Carregando...',false,true,5);
     form19.ShowModal;
  
end;

procedure TForm2.Registrar1Click(Sender: TObject);
begin
  form35 := TForm35.Create(self);
  form35.ShowModal;
  form35.Free;
end;

procedure TForm2.BloquearUsurio1Click(Sender: TObject);
var
  usu, access : string;
begin
usu := funcoes.dialogo('normal',0,'',0,false,'',application.Title,'Qual o Usu�rio?','');
if (usu<>'*') and (usu<>'') then
 begin
   dm.IBQuery2.Close;
   dm.IBQuery2.SQL.Clear;
   dm.IBQuery2.SQL.Add('select * from usuario where nome='+QuotedStr(usu));
   dm.IBQuery2.Open;
   //ShowMessage('cod='+dm.IBQuery2.fieldbyname('cod').AsString+'   acesso='+dm.IBQuery2.fieldbyname('acesso').AsString);
 //0-estoque 1-financas 2-posicao 3-relatorio 4-cadastros 5-utilitarios 6-servi�os
  if (dm.IBQuery2.IsEmpty) then ShowMessage('Usu�rio N�o Encontrado!')
   else
    begin
        form36 := tform36.Create(self);
        form36.cont := 1;
        access := funcoes.DesCriptografar(dm.IBQuery2.fieldbyname('acesso').AsString);

        if funcoes.Contido('0', access) then form36.ListBox1.Items.Add('* '+copy(funcoes.DeletaChar('&',form2.MainMenu1.Items.Items[0].Caption),1,length(funcoes.DeletaChar('&',form2.MainMenu1.Items.Items[0].Caption))))
         else  form36.ListBox1.Items.Add(copy(funcoes.DeletaChar('&',form2.MainMenu1.Items.Items[0].Caption),1,length(funcoes.DeletaChar('&',form2.MainMenu1.Items.Items[0].Caption))));

        if funcoes.Contido('1', access) then form36.ListBox1.Items.Add('* '+copy(funcoes.DeletaChar('&',form2.MainMenu1.Items.Items[1].Caption),1,length(funcoes.DeletaChar('&',form2.MainMenu1.Items.Items[1].Caption))))
         else form36.ListBox1.Items.Add(copy(funcoes.DeletaChar('&',form2.MainMenu1.Items.Items[1].Caption),1,length(funcoes.DeletaChar('&',form2.MainMenu1.Items.Items[1].Caption))));

        if funcoes.Contido('2', access) then form36.ListBox1.Items.Add('* '+copy(funcoes.DeletaChar('&',form2.MainMenu1.Items.Items[2].Caption),1,length(funcoes.DeletaChar('&',form2.MainMenu1.Items.Items[2].Caption))))
         else form36.ListBox1.Items.Add(copy(funcoes.DeletaChar('&',form2.MainMenu1.Items.Items[2].Caption),1,length(funcoes.DeletaChar('&',form2.MainMenu1.Items.Items[2].Caption))));

        if funcoes.Contido('3', access) then form36.ListBox1.Items.Add('* '+copy(funcoes.DeletaChar('&',form2.MainMenu1.Items.Items[3].Caption),1,length(funcoes.DeletaChar('&',form2.MainMenu1.Items.Items[3].Caption))))
         else form36.ListBox1.Items.Add(copy(funcoes.DeletaChar('&',form2.MainMenu1.Items.Items[3].Caption),1,length(funcoes.DeletaChar('&',form2.MainMenu1.Items.Items[3].Caption))));

        if funcoes.Contido('4', access) then form36.ListBox1.Items.Add('* '+copy(funcoes.DeletaChar('&',form2.MainMenu1.Items.Items[4].Caption),1,length(funcoes.DeletaChar('&',form2.MainMenu1.Items.Items[4].Caption))))
         else form36.ListBox1.Items.Add(copy(funcoes.DeletaChar('&',form2.MainMenu1.Items.Items[4].Caption),1,length(funcoes.DeletaChar('&',form2.MainMenu1.Items.Items[4].Caption))));

        if funcoes.Contido('5', access) then form36.ListBox1.Items.Add('* '+copy(funcoes.DeletaChar('&',form2.MainMenu1.Items.Items[5].Caption),1,length(funcoes.DeletaChar('&',form2.MainMenu1.Items.Items[5].Caption))))
         else form36.ListBox1.Items.Add(copy(funcoes.DeletaChar('&',form2.MainMenu1.Items.Items[5].Caption),1,length(funcoes.DeletaChar('&',form2.MainMenu1.Items.Items[5].Caption))));

        if funcoes.Contido('6', access) then form36.ListBox1.Items.Add('* '+copy(funcoes.DeletaChar('&',form2.MainMenu1.Items.Items[6].Caption),1,length(funcoes.DeletaChar('&',form2.MainMenu1.Items.Items[6].Caption))))
         else form36.ListBox1.Items.Add(copy(funcoes.DeletaChar('&',form2.MainMenu1.Items.Items[6].Caption),1,length(funcoes.DeletaChar('&',form2.MainMenu1.Items.Items[6].Caption))));
        form36.Caption := 'Bloquear Usu�rio: '+usu;
        form36.codusu := dm.IBQuery2.fieldbyname('cod').AsString;
        dm.IBQuery2.Close;
        form36.ShowModal;
    end;
  end;
end;

procedure TForm2.NveisdeAcesso1Click(Sender: TObject);
begin
form37 := tform37.Create(self);
funcoes.CtrlResize(tform(form37));
form37.ShowModal;
form37.Free;
end;

procedure TForm2.ResumoPCliente1Click(Sender: TObject);
var
  sim, cliente : string;
  vencidoCurr,vencerCurr,totalgeral : currency;
  vencido,vencer,juros,total : TStringList;
  atual : TDateTime;
  i, b : integer;
begin
  sim := funcoes.dialogo('generico',0,'SN',30,false,'S',Application.Title,'Imprimir Clientes que Est�o em Dia?','N');
  if sim = '*' then exit;

  cliente := funcoes.dialogo('generico',0,'1234567890,.'+#8,50,false,'',Application.Title,'Qual o C�d do Cliente?','');
  if cliente = '*' then exit;

  if cliente <> '' then cliente := '(documento = ' + cliente + ') and';


  form19.RichEdit1.Clear;
  addRelatorioForm19('|' + #15 + '|' + CRLF);
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(form22.Pgerais.Values['empresa'],'RESUMO DE CONTAS A RECEBER POR CLIENTE',133)))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('CODIGO NOME DO CLIENTE                  TELEFONES                      VENCIDO   A VENCER      JUROS      TOTAL'+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('-------------------------------------------------------------------------------------------------------------------------------------'+#13+#10))));

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select cr.documento, cr.valor, iif(cr.vencimento > cr.previsao, cr.vencimento, cr.previsao) as vencimento  from contasreceber cr, cliente c where '+cliente+' (pago = 0) and (c.cod = cr.documento) order by c.nome');
  dm.IBselect.Open;
  dm.IBselect.First;

  vencido := TStringList.Create;
  total := TStringList.Create;
  vencer := TStringList.Create;
  juros := TStringList.Create;

  vencidoCurr := 0;
  vencerCurr := 0;
  totalgeral := 0;
  while not dm.IBselect.Eof do
    begin
      if vencido.Values[dm.IBselect.FieldByName('documento').AsString] = '' then vencido.Add(dm.IBselect.FieldByName('documento').AsString+'=0');
      if total.Values[dm.IBselect.FieldByName('documento').AsString] = '' then total.Add(dm.IBselect.FieldByName('documento').AsString+'=0');
      if vencer.Values[dm.IBselect.FieldByName('documento').AsString] = '' then vencer.Add(dm.IBselect.FieldByName('documento').AsString+'=0');
      if juros.Values[dm.IBselect.FieldByName('documento').AsString] = '' then juros.Add(dm.IBselect.FieldByName('documento').AsString+'=0');


      if dm.IBselect.FieldByName('vencimento').AsDateTime < form22.datamov then
        begin
          vencido.Values[dm.IBselect.FieldByName('documento').AsString] := CurrToStr(StrToCurr(vencido.Values[dm.IBselect.FieldByName('documento').AsString]) + dm.IBselect.FieldByName('valor').AsCurrency);
          juros.Values[dm.IBselect.FieldByName('documento').AsString] := CurrToStr(StrToCurr(juros.Values[dm.IBselect.FieldByName('documento').AsString]) + (dm.IBselect.FieldByName('valor').AsCurrency * StrToCurrDef(ConfParamGerais.Strings[6], 0)));
        end
      else vencer.Values[dm.IBselect.FieldByName('documento').AsString] := CurrToStr(StrToCurr(vencer.Values[dm.IBselect.FieldByName('documento').AsString]) + dm.IBselect.FieldByName('valor').AsCurrency);

      total.Values[dm.IBselect.FieldByName('documento').AsString] := CurrToStr(StrToCurr(total.Values[dm.IBselect.FieldByName('documento').AsString]) + dm.IBselect.FieldByName('valor').AsCurrency);
      totalgeral := totalgeral + StrToCurrDef(total.Values[dm.IBselect.FieldByName('documento').AsString], 0);
      dm.IBselect.Next;
    end;

    b := 94;

    for i:= 0 to total.Count-1 do
      begin
        dm.IBselect.Close;
        dm.IBselect.SQL.Clear;
        dm.IBselect.SQL.Add('select nome, tel, telres from cliente where cod = ' + total.Names[i]);
        dm.IBselect.Open;

        if StrToCurrDef(total.Values[total.Names[i]], 0) > 0 then begin
          if (sim = 'N') and (StrToCurr(vencido.Values[vencido.Names[i]]) <> 0) then begin
            addRelatorioForm19(funcoes.CompletaOuRepete('',strzero(total.Names[i], 6),' ',6)+' '+funcoes.CompletaOuRepete(copy(dm.IBselect.fieldbyname('nome').AsString,1,35),'',' ',35)+funcoes.CompletaOuRepete(LeftStr(dm.IBselect.fieldbyname('tel').AsString +' '+dm.IBselect.fieldbyname('telres').AsString, 21),'',' ',21)+'  '+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',StrToCurr(vencido.Values[vencido.Names[i]])),' ',13)+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',StrToCurr(vencer.Values[vencer.Names[i]])),' ',11)+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',StrToCurr(juros.Values[juros.Names[i]])),' ',10)+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',StrToCurr(total.Values[total.Names[i]])),' ',14) + funcoes.CompletaOuRepete('  ','','_',20) + #13+#10);
            vencidoCurr := vencidoCurr + StrToCurr(vencido.Values[vencido.Names[i]]);
            vencerCurr := vencerCurr + StrToCurr(vencer.Values[vencer.Names[i]]);
          end
          else begin
            addRelatorioForm19(funcoes.CompletaOuRepete('',strzero(total.Names[i], 6),' ',6)+' '+funcoes.CompletaOuRepete(copy(dm.IBselect.fieldbyname('nome').AsString,1,35),'',' ',35)+funcoes.CompletaOuRepete(LeftStr(dm.IBselect.fieldbyname('tel').AsString +' '+dm.IBselect.fieldbyname('telres').AsString, 21),'',' ',21)+'  '+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',StrToCurr(vencido.Values[vencido.Names[i]])),' ',13)+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',StrToCurr(vencer.Values[vencer.Names[i]])),' ',11)+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',StrToCurr(juros.Values[juros.Names[i]])),' ',10)+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',StrToCurr(total.Values[total.Names[i]])),' ',14) + funcoes.CompletaOuRepete('  ','','_',20) + #13+#10);
            vencidoCurr := vencidoCurr + StrToCurr(vencido.Values[vencido.Names[i]]);
            vencerCurr := vencerCurr + StrToCurr(vencer.Values[vencer.Names[i]]);
          end;
        end;

        if Form19.RichEdit1.Lines.Count > b then begin
          addRelatorioForm19('-------------------------------------------------------------------------------------------------------------------------------------' + CRLF);
          addRelatorioForm19(#12);
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(form22.Pgerais.Values['empresa'],'RESUMO DE CONTAS A RECEBER POR CLIENTE',133)))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('CODIGO NOME DO CLIENTE                  TELEFONES                      VENCIDO   A VENCER      JUROS      TOTAL'+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('-------------------------------------------------------------------------------------------------------------------------------------'+#13+#10))));


          b := b + 99;
        end;

      end;

    dm.IBselect.Close;
    totalgeral := vencidoCurr + vencerCurr;
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('-------------------------------------------------------------------------------------------------------------------------------------'+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('TOTAL VENCIDO =>'+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',vencidoCurr),' ',14)+'  TOTAL A VENCER =>'+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',vencerCurr),' ',14)+'  TOTAL GERAL =>'+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',totalgeral),' ',14)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('-------------------------------------------------------------------------------------------------------------------------------------'+#13+#10))));

    funcoes.CharSetRichEdit(form19.richedit1);
    form19.ShowModal;
end;

procedure TForm2.PorFormaPagto1Click(Sender: TObject);
var grupo,ini,fim,formpagto,g1,codigos:string;
totalgeral:currency;
totGeral,totDesconto,totAntecipado : TStringList;
linhas:integer;
begin
  codigos:='';
  linhas:=88;

  totalgeral := 0;
  form19.RichEdit1.Clear;
  grupo := funcoes.dialogo('generico',0,'1234567890'+#8,50,false,'',Application.Title,'Qual o Grupo?','');
  if not funcoes.Contido('*',grupo) then ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(StartOfTheMonth(now)));
  if not funcoes.Contido('*',grupo+ini) then fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?',formatadataddmmyy(endOfTheMonth(now)));
  if not funcoes.Contido('*',grupo+ini+fim) then formpagto := funcoes.dialogo('normal',0,'',50,false,'',Application.Title,'Qual a Forma de Pagamento?','');
  if not funcoes.Contido('*',grupo+ini+fim+formpagto) then
   begin
    totGeral := TStringList.Create;
    totDesconto := TStringList.Create;
    totAntecipado := TStringList.Create;
    if grupo<>'' then g1 := ' (codgru='+grupo+') and ';
    codigos:=formpagto;
    if formpagto<>'' then formpagto := ' and (formpagto='+formpagto+')';
    linhas:=88;
    totalgeral := 0;
    form19.RichEdit1.Clear;
    addRelatorioForm19('|' + #15 + '|' + CRLF);
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',107)))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',form22.datamov)+'|'+#13+#10,' ',107)))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+'Relat�rio de Contas a Receber Por Forma de Pagamento:'+codigos,'HORA: '+FormatDateTime('tt',now)+'|'+#13+#10,' ',107)))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'#13+#10,'-',107)))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|Caixa|Pagto| Vencto  | Nr.Doc| Historico                          |     Total| C/Desconto |  Antecipado|'+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',107)))));

    dm.IBQuery2.Close;
    dm.IBQuery2.SQL.Clear;
    dm.IBQuery2.SQL.Add('select * from contasreceber where '+g1+' (pago=0) '+formpagto);
    try
    dm.IBQuery2.Open;
    dm.IBQuery2.First;
    while not dm.IBQuery2.Eof do
     begin
       if form19.RichEdit1.Lines.Count >= linhas then
        begin
          linhas:= linhas + 88;
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((' '+#12+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',107)))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',form22.datamov)+'|'+#13+#10,' ',107)))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+'Relat�rio de Contas a Receber Por Forma de Pagamento:'+codigos,'HORA: '+FormatDateTime('tt',now)+'|'+#13+#10,' ',107)))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'#13+#10,'-',107)))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|Caixa|Pagto| Vencto  | Nr.Doc| Historico                          |     Total| C/Desconto |  Antecipado|'+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',107)))));

        end;
       if totGeral.Values[dm.IBQuery2.FieldByName('formpagto').AsString]='' then totGeral.Values[dm.IBQuery2.FieldByName('formpagto').AsString] := IntToStr(0);
       if totDesconto.Values[dm.IBQuery2.FieldByName('formpagto').AsString]='' then totDesconto.Values[dm.IBQuery2.FieldByName('formpagto').AsString] := IntToStr(0);
       if totAntecipado.Values[dm.IBQuery2.FieldByName('formpagto').AsString]='' then totAntecipado.Values[dm.IBQuery2.FieldByName('formpagto').AsString] := IntToStr(0);

       totGeral.Values[dm.IBQuery2.FieldByName('formpagto').AsString] := CurrToStr(StrToCurr(totGeral.Values[dm.IBQuery2.FieldByName('formpagto').AsString]) + dm.ibquery2.fieldbyname('valor').AsCurrency);
       totAntecipado.Values[dm.IBQuery2.FieldByName('formpagto').AsString] := CurrToStr(StrToCurr(totAntecipado.Values[dm.IBQuery2.FieldByName('formpagto').AsString]) + dm.ibquery2.fieldbyname('valor').AsCurrency);
       totDesconto.Values[dm.IBQuery2.FieldByName('formpagto').AsString] := CurrToStr(StrToCurr(totDesconto.Values[dm.IBQuery2.FieldByName('formpagto').AsString]) + dm.ibquery2.fieldbyname('valor').AsCurrency);

       totalgeral := totalgeral + dm.IBQuery2.fieldbyname('valor').AsCurrency;
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|'+funcoes.CompletaOuRepete('',dm.IBQuery2.fieldbyname('codgru').AsString,' ',5)+funcoes.centraliza(dm.IBQuery2.fieldbyname('formpagto').AsString,' ',6)+funcoes.centraliza(FormatDateTime('dd/mm/yy',dm.IBQuery2.fieldbyname('vencimento').AsDateTime),' ',10)+funcoes.centraliza(dm.IBQuery2.fieldbyname('documento').AsString,' ',9)+funcoes.CompletaOuRepete(dm.IBQuery2.FieldByName('historico').AsString,'',' ',35)+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',dm.IBQuery2.fieldbyname('valor').AsCurrency),' ',12)+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',dm.IBQuery2.fieldbyname('valor').AsCurrency),' ',13)+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',dm.IBQuery2.fieldbyname('valor').AsCurrency),' ',13)+'|'+#13+#10))));
       dm.IBQuery2.Next;
     end;
    except
    end;
//    ShowMessage('TOTAL GERAL'+#13+totGeral.GetText);
//    ShowMessage('TOTAL DES'+#13+totDesconto.GetText);
//    ShowMessage('TOTAL ANTE'+#13+totAntecipado.GetText);
    dm.IBQuery2.Close;
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',105)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('| FORMA DE PAGAMENTO              TOTAL    C/DESCONTO    ANTECIPADO                                     |'+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',105)+#13+#10))));
    for linhas := 0 to totGeral.Count -1 do
     begin
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((totGeral.Names[linhas]+' - '+funcoes.CompletaOuRepete(funcoes.BuscaNomeBD(dm.ibquery1,'nome','formpagto',' where cod='+totGeral.Names[linhas]),'',' ',15)+'=>'+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',StrToCurr(totGeral.Values[totGeral.Names[linhas]])),' ',17)+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',StrToCurr(totDesconto.Values[totDesconto.Names[linhas]])),' ',15)+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',StrToCurr(totAntecipado.Values[totAntecipado.Names[linhas]])),' ',14)+'                                     |'+#13+#10))));

     end;
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',105)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('| TOTAL GERAL =>    '+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',totalgeral),' ',19)+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',totalgeral),' ',14)+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',totalgeral),' ',14)+'                                     |'+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',105)+#13+#10))));
    form19.ShowModal;
   end;
end;

procedure TForm2.ResumoPRota1Click(Sender: TObject);
var sim,rota,r1 : string;
vencidoCurr,vencerCurr,totalgeral : currency;
vencido,vencer,juros,total : TStringList;
i : integer;
begin
  rota := funcoes.dialogo('not',0,'1234567890'+#8,30,false,'',Application.Title,'Qual a '+ConfParamGerais.Strings[7]+'?','');
  if rota = '' then rota := funcoes.localizar('Localizar Rotas de Distribui��o','rota','cod,nome','cod','','nome','nome',true,false,false,'',300,nil);
  if rota = '' then exit;
  if rota<>'*' then sim := funcoes.dialogo('generico',0,'SN',30,false,'S',Application.Title,'Imprimir Clientes que Est�o em Dia?','N');
  if not funcoes.Contido('*',sim+rota) then
    begin
      if rota<>'' then r1 := ' and (cliente.rota='+rota+')';
      form19.RichEdit1.Clear;
      addRelatorioForm19('|' + #15 + '|' + CRLF);
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(form22.Pgerais.Values['empresa'],'RESUMO DE CONTAS A RECEBER POR ROTA: '+rota+' - '+funcoes.BuscaNomeBD(dm.ibquery1,'nome','rota',' where cod='+rota ),133)))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('CODIGO NOME DO CLIENTE                  TELEFONES                      VENCIDO   A VENCER      JUROS      TOTAL'+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('-------------------------------------------------------------------------------------------------------------------------------------'+#13+#10))));

      dm.IBselect.Close;
      dm.IBselect.SQL.Clear;
      dm.IBselect.SQL.Add('select contasreceber.*,cliente.rota from contasreceber,cliente where (pago=0) and  (cliente.cod = contasreceber.documento) '+r1);
      dm.IBselect.Open;
      dm.IBselect.First;

      vencido := TStringList.Create;
      total := TStringList.Create;
      vencer := TStringList.Create;
      juros := TStringList.Create;
      vencidoCurr := 0;
      vencerCurr := 0;
      totalgeral := 0;
      while not dm.IBselect.Eof do
       begin
         if vencido.Values[dm.IBselect.FieldByName('documento').AsString]='' then vencido.Add(dm.IBselect.FieldByName('documento').AsString+'=0');
         if total.Values[dm.IBselect.FieldByName('documento').AsString]='' then total.Add(dm.IBselect.FieldByName('documento').AsString+'=0');
         if vencer.Values[dm.IBselect.FieldByName('documento').AsString]='' then vencer.Add(dm.IBselect.FieldByName('documento').AsString+'=0');
         if juros.Values[dm.IBselect.FieldByName('documento').AsString]='' then juros.Add(dm.IBselect.FieldByName('documento').AsString+'=0');

         if dm.IBselect.FieldByName('vencimento').AsDateTime < form22.datamov then vencido.Values[dm.IBselect.FieldByName('documento').AsString] := CurrToStr(StrToCurr(vencido.Values[dm.IBselect.FieldByName('documento').AsString]) + dm.IBselect.FieldByName('valor').AsCurrency);
         if dm.IBselect.FieldByName('vencimento').AsDateTime >= form22.datamov then vencer.Values[dm.IBselect.FieldByName('documento').AsString] := CurrToStr(StrToCurr(vencer.Values[dm.IBselect.FieldByName('documento').AsString]) + dm.IBselect.FieldByName('valor').AsCurrency);
         totalgeral := totalgeral + dm.IBselect.FieldByName('valor').AsCurrency;
         total.Values[dm.IBselect.FieldByName('documento').AsString] := CurrToStr(StrToCurr(total.Values[dm.IBselect.FieldByName('documento').AsString]) + dm.IBselect.FieldByName('valor').AsCurrency);
         dm.IBselect.Next;
       end;

      for i:= 0 to total.Count-1 do
       begin
         //ShowMessage(lista.Names[i]);
         dm.IBselect.Close;
         dm.IBselect.SQL.Clear;
         dm.IBselect.SQL.Add('select * from cliente where cod='+total.Names[i]);
         dm.IBselect.Open;
         if (sim='N') and (StrToCurr(vencido.Values[vencido.Names[i]])<>0) then
           begin
            form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',total.Names[i],' ',6)+' '+funcoes.CompletaOuRepete(copy(dm.IBselect.fieldbyname('nome').AsString,1,35),'',' ',35)+funcoes.CompletaOuRepete(dm.IBselect.fieldbyname('tel').AsString +'  '+dm.IBselect.fieldbyname('telres').AsString,'',' ',21)+'  '+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',StrToCurr(vencido.Values[vencido.Names[i]])),' ',13)+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',StrToCurr(vencer.Values[vencer.Names[i]])),' ',11)+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',StrToCurr(juros.Values[juros.Names[i]])),' ',10)+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',StrToCurr(total.Values[total.Names[i]])),' ',14)+#13+#10))));
            vencidoCurr := vencidoCurr + StrToCurr(vencido.Values[vencido.Names[i]]);
            vencerCurr := vencerCurr + StrToCurr(vencer.Values[vencer.Names[i]]);
           end;
         if (sim='S') then
           begin
             form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',total.Names[i],' ',6)+' '+funcoes.CompletaOuRepete(copy(dm.IBselect.fieldbyname('nome').AsString,1,35),'',' ',35)+funcoes.CompletaOuRepete(dm.IBselect.fieldbyname('tel').AsString +'  '+dm.IBselect.fieldbyname('telres').AsString,'',' ',21)+'  '+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',StrToCurr(vencido.Values[vencido.Names[i]])),' ',13)+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',StrToCurr(vencer.Values[vencer.Names[i]])),' ',11)+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',StrToCurr(juros.Values[juros.Names[i]])),' ',10)+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',StrToCurr(total.Values[total.Names[i]])),' ',14)+#13+#10))));
             vencidoCurr := vencidoCurr + StrToCurr(vencido.Values[vencido.Names[i]]);
             vencerCurr := vencerCurr + StrToCurr(vencer.Values[vencer.Names[i]]);
           end;
       end;

       dm.IBselect.Close;
       totalgeral := vencidoCurr + vencerCurr;
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('-------------------------------------------------------------------------------------------------------------------------------------'+#13+#10))));
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('TOTAL VENCIDO =>'+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',vencidoCurr),' ',14)+'  TOTAL A VENCER =>'+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',vencerCurr),' ',14)+'  TOTAL GERAL =>'+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',totalgeral),' ',14)+#13+#10))));
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('-------------------------------------------------------------------------------------------------------------------------------------'+#13+#10))));
      form19.ShowModal;
    end;

end;

procedure TForm2.ExtratodeConta1Click(Sender: TObject);
var
  ini,fim, ende,bairro,est,cid,empresa,telres,telcom,cli, h1:string;
  linhas,i : integer;
  total : currency;
begin
  ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(StartOfTheMonth(now)));
  if ini = '*' then exit;

  fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?',formatadataddmmyy(endOfTheMonth(now)));
  if fim = '*' then exit;

  CODCLI := funcoes.dialogo('generico',0,'1234567890,.'+#8,50,false,'',Application.Title,'Qual o C�d do Cliente?','');
  if CODCLI = '*' then exit;

  h1 := '';
  if CODCLI <> '' then begin
    h1 := ' and (documento = '+CODCLI+') ';
  end;

  total := 0;
  linhas := 0;
  cli := 'x';
  //ibselect e ibquery2
  dm.IBselect.Close;
      dm.IBselect.SQL.Text := ('select * from contasreceber where (pago=0) and (vencimento>=:ini) and (vencimento<=:fim) '+h1+' order by documento');

      dm.IBselect.ParamByName('ini').AsDateTime := StrToDate(ini);
      dm.IBselect.ParamByName('fim').AsDateTime := StrToDate(fim);
      try
       dm.IBselect.Open;
      except
       exit;
      end;

   if dm.IBselect.IsEmpty then begin
     ShowMessage('Nenhum Registro retornado!');
     dm.IBselect.Close;
     exit;
   end;

      dm.IBselect.First;
      form19.RichEdit1.Clear;
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|'+funcoes.centraliza('E X T R A T O    D E    C O N T A',' ',78)+'|'+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));

      dm.IBQuery2.Close;
      dm.IBQuery2.SQL.Clear;
      dm.IBQuery2.SQL.Add('select * from registro');
      dm.IBQuery2.Open;
      empresa := dm.IBQuery2.fieldbyname('empresa').AsString;
      ende := dm.IBQuery2.fieldbyname('ende').AsString;
      bairro := dm.IBQuery2.fieldbyname('bairro').AsString;
      telres := dm.IBQuery2.fieldbyname('telres').AsString;
      telcom := dm.IBQuery2.fieldbyname('telcom').AsString;
      cid := dm.IBQuery2.fieldbyname('CID').AsString;
      est := dm.IBQuery2.fieldbyname('est').AsString;
      dm.IBQuery2.Close;
      //cabecalho empresa
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|'+funcoes.CompletaOuRepete(empresa,'DATA: '+FormatDateTime('dd/mm/yy',form22.datamov),' ',78)+'|'+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+ende+'         -'+bairro,'|',' ',80)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|FONE: '+telres+'    FAX: '+telcom+'    CIDADE: '+cid+'    -'+est,'|',' ',80)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
      //cabecalho cliente
      dm.IBQuery2.Close;
      dm.IBQuery2.SQL.Clear;
      dm.IBQuery2.SQL.Add('select * from cliente where cod='+dm.IBselect.fieldbyname('documento').AsString);
      dm.IBQuery2.Open;

      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|'+funcoes.CompletaOuRepete('Nome: '+dm.IBQuery2.fieldbyname('cod').AsString +'-'+dm.IBQuery2.fieldbyname('nome').AsString,'',' ',78)+'|'+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|END: '+dm.IBQuery2.fieldbyname('ende').AsString+'         -'+dm.IBQuery2.fieldbyname('bairro').AsString,'|',' ',80)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|FONE: '+dm.IBQuery2.fieldbyname('telres').AsString+'    FAX: '+dm.IBQuery2.fieldbyname('telcom').AsString+'    CIDADE: '+dm.IBQuery2.fieldbyname('cid').AsString+'    -'+dm.IBQuery2.fieldbyname('est').AsString,'|',' ',80)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('| VENCTO  HISTORICO                                VLR. ORIGINAL VLR. CORRIGIDO|'+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));

      dm.IBQuery2.Close;

      cli := dm.IBselect.fieldbyname('documento').AsString;
      while not dm.IBselect.Eof do
      begin
        if dm.IBselect.fieldbyname('documento').AsString<>cli then
         begin
           cli := dm.IBselect.fieldbyname('documento').AsString;
           dm.IBQuery2.Close;
           dm.IBQuery2.SQL.Clear;
           dm.IBQuery2.SQL.Add('select * from cliente where cod='+dm.IBselect.fieldbyname('documento').AsString);
           dm.IBQuery2.Open;
           if linhas<40 then
            begin
              for i:= linhas to 40 do
               begin
                 form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|','|',' ',80)+#13+#10))));
               end;
            end;
            //escreve totais
           form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
           form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|'+funcoes.CompletaOuRepete('','',' ',43)+'TOTAIS:'+funcoes.CompletaOuRepete('',FormatCurr('#,##,###,0.00',total),' ',14)+funcoes.CompletaOuRepete('',FormatCurr('#,##,###,0.00',total),' ',14)+'|'+#13+#10))));
           linhas := 0;
           total := 0;
           form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
           form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((' '+#12+#13+#10))));
           form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
           form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|'+funcoes.centraliza('E X T R A T O    D E    C O N T A',' ',78)+'|'+#13+#10))));
           form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
           form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|'+funcoes.CompletaOuRepete(empresa,'DATA: '+FormatDateTime('dd/mm/yy',form22.datamov),' ',78)+'|'+#13+#10))));
           form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+ende+'         -'+bairro,'|',' ',80)+#13+#10))));
           form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|FONE: '+telres+'    FAX: '+telcom+'    CIDADE: '+cid+'    -'+est,'|',' ',80)+#13+#10))));
           form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
           form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|'+funcoes.CompletaOuRepete('Nome: '+dm.IBQuery2.fieldbyname('cod').AsString +'-'+dm.IBQuery2.fieldbyname('nome').AsString,'',' ',78)+'|'+#13+#10))));
           form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|END: '+dm.IBQuery2.fieldbyname('ende').AsString+'         -'+dm.IBQuery2.fieldbyname('bairro').AsString,'|',' ',80)+#13+#10))));
           form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|FONE: '+dm.IBQuery2.fieldbyname('telres').AsString+'    FAX: '+dm.IBQuery2.fieldbyname('telcom').AsString+'    CIDADE: '+dm.IBQuery2.fieldbyname('cid').AsString+'    -'+dm.IBQuery2.fieldbyname('est').AsString,'|',' ',80)+#13+#10))));
           form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
           form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('| VENCTO  HISTORICO                                VLR. ORIGINAL VLR. CORRIGIDO|'+#13+#10))));
           form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));

           form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|'+funcoes.CompletaOuRepete(FormatDateTime('dd/mm/yy',dm.IBselect.fieldbyname('vencimento').AsDateTime)+' '+dm.IBselect.fieldbyname('historico').AsString,'',' ',50)+funcoes.CompletaOuRepete('',FormatCurr('#,##,###,0.00',dm.IBselect.fieldbyname('valor').AsCurrency),' ',14)+funcoes.CompletaOuRepete('',FormatCurr('#,##,###,0.00',dm.IBselect.fieldbyname('valor').AsCurrency),' ',14)+'|'+#13+#10))));
           total := total + dm.IBselect.fieldbyname('valor').AsCurrency;
           DM.IBQuery2.Close;
         end
        else
         begin
          total := total + dm.IBselect.fieldbyname('valor').AsCurrency;
          linhas := linhas + 1;
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|'+funcoes.CompletaOuRepete(FormatDateTime('dd/mm/yy',dm.IBselect.fieldbyname('vencimento').AsDateTime)+' '+dm.IBselect.fieldbyname('historico').AsString,'',' ',50)+funcoes.CompletaOuRepete('',FormatCurr('#,##,###,0.00',dm.IBselect.fieldbyname('valor').AsCurrency),' ',14)+funcoes.CompletaOuRepete('',FormatCurr('#,##,###,0.00',dm.IBselect.fieldbyname('valor').AsCurrency),' ',14)+'|'+#13+#10))));
         end;
        dm.IBselect.Next;
      end;
      if linhas<40 then
            begin
              for i:= linhas to 40 do
               begin
                 form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|','|',' ',80)+#13+#10))));
               end;
            end;
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|'+funcoes.CompletaOuRepete('','',' ',43)+'TOTAIS:'+funcoes.CompletaOuRepete('',FormatCurr('#,##,###,0.00',total),' ',14)+funcoes.CompletaOuRepete('',FormatCurr('#,##,###,0.00',total),' ',14)+'|'+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
      dm.IBselect.Close;
      form19.RichEdit1.SelStart := 0;
      funcoes.CharSetRichEdit(Form19.RichEdit1);
      form19.ShowModal;
end;

procedure TForm2.MdiadeAtraso1Click(Sender: TObject);
var ini,fim,cli,c1:string;
totalgeral:currency;
b,dias,cont:integer;
totalD: extended;
begin
  b:=55;
  dias := 0;
  totalD := 0;
  cont := 0;
  totalgeral := 0;
  ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(StartOfTheMonth(form22.datamov)));
  if not funcoes.Contido('*',ini) then fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?',formatadataddmmyy(endOfTheMonth(form22.datamov)));
  if not funcoes.Contido('*',ini+fim) then  cli := funcoes.dialogo('normal',0,'',20,false,'',Application.Title,'Qual o cliente?','');
  if (not funcoes.Contido('*',cli)) and (cli='') then cli := funcoes.localizar('Localizar Cliente','cliente','cod,nome','cod','cod','nome','cod',false,false,false,'',0,nil);
  if  funcoes.Contido('*',ini+fim+cli) then exit;

  form19.RichEdit1.Clear;
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|'+#13+#10,' ',81)))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+'RELAT�RIO M�DIA DE DIAS DE ATRASO:: CLIENTE => '+cli,'HORA: '+FormatDateTime('tt',now)+'|'+#13+#10,' ',81)))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'#13+#10,'-',81)))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('| PAGTO    VENCTO  HISTORICO                               VALOR        ATRASO|'+#13+#10))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));


     if cli<>'' then c1 := ' and (documento='+cli+')';
     dm.IBselect.Close;
     dm.IBselect.SQL.Clear;
     dm.IBselect.SQL.Add('select * from contasreceber where  ((data>=:v1) and (data<=:v2) and (pago<>0)) '+c1+' order by vencimento');
     dm.IBselect.ParamByName('v1').AsDateTime := StrToDate(ini);
     dm.IBselect.ParamByName('v2').AsDateTime := StrToDate(fim);
     dm.IBselect.Open;
     dm.IBselect.FetchAll;
     dm.IBselect.First;
    while not dm.IBselect.Eof do
     begin
           if form19.RichEdit1.Lines.Count>=b then
            begin
              b:=b+55;
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((' '+#12+#13+#10))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',form22.datamov)+'|'+#13+#10,' ',81)))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+'RELAT�RIO M�DIA DE DIAS DE ATRASO: CLIENTE => '+cli,'HORA: '+FormatDateTime('tt',now)+'|'+#13+#10,' ',81)))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'#13+#10,'-',81)))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('| PAGTO    VENCTO  HISTORICO                               VALOR        ATRASO|'+#13+#10))));
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
            end;
            dias := trunc(dm.IBselect.FieldByName('data').AsDateTime - dm.IBselect.FieldByName('vencimento').AsDateTime);
            addRelatorioForm19('|'+funcoes.CompletaOuRepete('',FormatDateTime('dd/mm/yy',dm.IBselect.FieldByName('data').AsDateTime),' ',8)+' '+funcoes.CompletaOuRepete('',FormatDateTime('dd/mm/yy',dm.IBselect.FieldByName('vencimento').AsDateTime),' ',8)+' '+funcoes.CompletaOuRepete(dm.IBselect.fieldbyname('historico').AsString,'',' ',35)+' '+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',dm.IBselect.FieldByName('pago').AsCurrency),' ',12)+'  '+funcoes.CompletaOuRepete('',IntToStr(dias),' ',9)+'|'+ CRLF);
            totalgeral := totalgeral + dm.IBselect.fieldbyname('pago').AsCurrency;
            totalD := totalD + dias;
            cont := cont + 1;
       dm.IBselect.Next;
     end;
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|'+'ATRASO M�DIO => '+IntToStr(trunc(totalD/cont))+' DIAS'+'   TOTAL PAGO => '+FormatCurr('#,###,###0.00',totalgeral),'|',' ',79)+#13+#10))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+'+#13+#10,'-',81)))));
     form19.RichEdit1.SelStart := 0;
     form19.ShowModal;
end;

procedure TForm2.Reimpresso1Click(Sender: TObject);
var
  nota, tab, sql : string;
  ind : Smallint;
begin
  form39 := tform39.Create(self);
  form39.ListBox1.Items.Add('1 - VENDA');
  form39.ListBox1.Items.Add('2 - OR�AMENTO');
  form39.ListBox1.Items.Add('3 - COMPRA');

  //funcoes := Tfuncoes.Create(self);
  tab := funcoes.lista(sender, true);

  tab := trim(tab);

  if tab = '*' then exit;

  if tab = '3' then
    begin
      nota := Incrementa_Generator('compra', 0);
      sql := 'select nota from compra where (nota = :nota)';
    end
  else if tab = '2' then
    begin
      if funcoes.LerConfig(form22.Pgerais.Values['configu'], 9) = 'N' then
        begin
          MessageDlg('Rotina N�o Permitida!', mtWarning, [mbOK], 1);
          exit;
        end;

      if funcoes.buscaParamGeral(51, 'N') = 'S' then nota := funcoes.buscaUltimaVendaOrcamentoDoUsuario(StrToInt(strnum(form22.Pgerais.Values['codvendedor'])), 2)
        else nota := Incrementa_Generator('orcamento', 0);
      sql := 'select nota from orcamento where (nota = :nota)';
    end
  else
    begin
      if funcoes.buscaParamGeral(51, 'N') = 'S' then nota := funcoes.buscaUltimaVendaOrcamentoDoUsuario(StrToInt(strnum(form22.Pgerais.Values['codvendedor'])), 1)
        else nota := Incrementa_Generator('venda', 0);

      sql := 'select nota, cancelado from venda where ((nota = :nota) and (cancelado = 0))';
    end;


  nota := funcoes.dialogo('generico',0,'1234567890'+#8,100,false,'',Application.Title,'Informe o N�mero Da Nota:',nota);
  if nota = '*' then exit;

  dm.IBQuery2.Close;
  dm.IBQuery2.SQL.Clear;
  dm.IBQuery2.SQL.Add(sql);
  dm.IBQuery2.ParamByName('nota').AsString := nota;
  dm.IBQuery2.Open;

  if dm.IBQuery2.IsEmpty then
    begin
      ShowMessage('Nota N�o Encontrada!');
      dm.IBQuery2.Close;
     exit;
    end;

  funcoes.GeraNota(nota,form22.Pgerais.Values['nota'], 'S', StrToInt(tab));
  dm.IBQuery2.Close;
end;

procedure TForm2.teste1Click(Sender: TObject);
var
  usu, tmp : string;
  tipo,troca : TStringList;
  ini, fim : integer;
begin
 form39 := tform39.Create(self);
 funcoes.CtrlResize(tform(form39));
 form39.ListBox1.Clear;
 form39.ListBox1.Items.Add('USU�RIO');
 form39.ListBox1.Items.Add('TERMINAL');
 form39.ListBox1.Items.Add('IMPRESSORA');
 form39.ListBox1.Selected[0] := true;
 form39.Position := poScreenCenter;
 form39.BorderStyle := bsDialog;
 form39.ListBox1.Font.Size := 10;
 form39.Caption := 'Configura��es';
 form39.conf := 1;
 form39.ShowModal;
 form39.Free;
if funcoes.lista1 = '*' then exit;
//configura��o do usuario
if funcoes.lista1 = '0' then
 begin
   usu := funcoes.dialogo('normal',0,'',0,false,'',Application.Title,'Qual o Usu�rio?',form22.usuario);
   if usu = '*' then exit;
   dm.IBselect.Close;
   dm.IBselect.SQL.Clear;
   dm.IBselect.SQL.Add('select * from usuario where nome='+QuotedStr(usu));
   dm.IBselect.Open;

   if dm.IBselect.IsEmpty then
     begin
       ShowMessage('Usu�rio N�o Encontrado!');
       dm.IBselect.Close;
       exit;
     end;

   form36 := tform36.Create(self);
   form36.ListBox1.Font.Size := 10;
   form36.Position := poDesigned;
   form36.BorderStyle := bsSingle;
   form36.codusu := usu;
   form36.cont := 2;
   form36.ListBox1.Clear;
   form36.teclas := TStringList.Create;
   form36.troca := TStringList.Create;
   form36.tipo := TStringList.Create;

   form36.teclas.Add('1234567890,.'+#8);
   form36.teclas.Add('PLMGTDRAF');
   form36.teclas.Add('SNXP');
   form36.teclas.Add('SNX');
   form36.teclas.Add('SN');
   form36.teclas.Add('SN');
   form36.teclas.Add('SN');
   form36.teclas.Add('SN');//7
   form36.teclas.Add('SN');//8
   form36.teclas.Add('SNX');//9
   form36.teclas.Add('SN');//10
   form36.teclas.Add('SN');//11
   form36.teclas.Add('SN');//12

   form36.tipo.Add('numero');
   form36.tipo.Add('generico');
   form36.tipo.Add('generico');
   form36.tipo.Add('generico');
   form36.tipo.Add('generico');
   form36.tipo.Add('generico');
   form36.tipo.Add('generico');
   form36.tipo.Add('generico');//7
   form36.tipo.Add('generico');//8
   form36.tipo.Add('generico');//9
   form36.tipo.Add('generico');//10
   form36.tipo.Add('generico');//11
   form36.tipo.Add('generico');//12

   form36.troca.Add('');
   form36.troca.Add('S');
   form36.troca.Add('S');
   form36.troca.Add('S');
   form36.troca.Add('S');
   form36.troca.Add('S');
   form36.troca.Add('S');
   form36.troca.Add('S');//7
   form36.troca.Add('S');//8
   form36.troca.Add('S');//9
   form36.troca.Add('S');//10
   form36.troca.Add('S');//11
   form36.troca.Add('S');//12

   form36.ListBox1.Items.Add('0-Qual o Desconto M�ximo Permitido (de 0 a 99%)?');
   form36.ListBox1.Items.Add('1-Qual a Nota de Venda(T-Ticket,M-M�dia,G-Grande,L-Localiza,A-Atacado,R-Resumo,D-Dav, F-Ticket Gr�fico)?');
   form36.ListBox1.Items.Add('2-Confirma��o para o pre�o de produto na venda (S-Reais P-Porcent, X-Ambos, N-Nenhum) ?');
   form36.ListBox1.Items.Add('3-Imprimir Mensagem na Nota de Pedido(S-Sim  N-N�o  X-Apenas Or�amentos)?');
   form36.ListBox1.Items.Add('4-Imprime Endere�o do Cliente no Ticket?');
   form36.ListBox1.Items.Add('5-Solicitar C�digo do Cliente nas Vendas a Vista?');
   form36.ListBox1.Items.Add('6-Considerar Limite de Cr�dito do Cliente nas Vendas a Prazo?');
   form36.ListBox1.Items.Add('7-Permitir Venda Sem Estoque Disponivel (S/N)?');
   form36.ListBox1.Items.Add('8-Permitir Permitir Acrescimo na Venda (S/N)?');
   form36.ListBox1.Items.Add('9-Permitir a Impress�o de Or�amento (S-Sim/N-Nao/X-Perguntar)?');
   form36.ListBox1.Items.Add('10-Imprimir Ref. Original na Nota de Orcamento ?');
   form36.ListBox1.Items.Add('11-Permitir Venda de Quantidades Negativas (S/N)?');
   form36.ListBox1.Items.Add('12-Permitir Troca de Vendedor na Venda ?');

   form36.configu := dm.IBselect.fieldbyname('configu').AsString;
   dm.IBselect.Close;
   form36.ShowModal;
   form36.Free;
 end
 //configura��o do terminal
else if funcoes.lista1 = '1' then
 begin
   form39 := tform39.Create(self);
   form39.ListBox1.Font.Size := 10;
   form39.ListBox1.Font.Style := [fsbold];
   form39.Position := poScreenCenter;
   form39.BorderStyle := bsSingle;
   form39.AutoSize := false;
   form39.Caption := 'Configura��es do Terminal';
   form39.WindowState := wsMaximized;
   form39.Position := poDesigned;
   form39.ListBox1.Clear;
   form39.conf := 2;
   form39.ListBox1.Items.Add('0=Qual a Nota de Venda(T-Ticket,M-M�dia,G-Grande,L-Localiza,A-Atacado,R-Resumo,D-Dav,F-Ticket Gr�fico, X-Media G., E-Ticket Maior)?');
   form39.ListBox1.Items.Add('1=Qual a Porta Serial da Impressora Fiscal (1/2)? ');
   form39.ListBox1.Items.Add('2=Qual a Porta Serial do Leitor de Barras (1/2/3/4)? ');
   form39.ListBox1.Items.Add('3=Qual o Tamanho da Fonte da Impress�o (Ticket ou DAV)? ');
   form39.ListBox1.Items.Add('4=Usar Fonte em Negrito? (S/N)');
   form39.ListBox1.Items.Add('5=Imprimir Pedido na Venda em Quantas Vias?');
   form39.ListBox1.Items.Add('6=Habilitar Backup de BD em Rede?');
   form39.ListBox1.Items.Add('7=Usar NFe/NFCe ?');
   form39.ListBox1.Items.Add('8=Qual o tamanho do campo DESCRI��O na impressao do pedido de compra ?');
   form39.ListBox1.Items.Add('9=Quantos Produtos na Impressao do Pedido de Compra ?');
   form39.ListBox1.Items.Add('10=Qual Cor Usar para Diferenciar as Linhas da Tabela de Produtos ?');
   form39.ListBox1.Items.Add('11=Qual Cor Usar para nas Celulas Selecionadas da Tabela de Produtos ?');
   form39.ListBox1.Items.Add('12=Qual Cor da Fonte da Tabela de Produtos ?');
   form39.ListBox1.Items.Add('13=Quantas Linhas para Completar a Impressao da ordem de Servi�o M(Padrao 25) ?');
   form39.substitui := TStringList.Create;
   form39.substitui.Add('S');//0
   form39.substitui.Add('S');
   form39.substitui.Add('S');
   form39.substitui.Add('');
   form39.substitui.Add('S');
   form39.substitui.Add('S');
   form39.substitui.Add('S');//6
   form39.substitui.Add('S');
   form39.substitui.Add('');
   form39.substitui.Add('');//9
   form39.substitui.Add('M');//10
   form39.substitui.Add('M');//11
   form39.substitui.Add('M');//12
   form39.substitui.Add('');//13

   form39.teclas := TStringList.Create;
   form39.teclas.Add('TGMLADRFVXE');
   form39.teclas.Add('12');
   form39.teclas.Add('1234');
   form39.teclas.Add('1234567890' + #8);
   form39.teclas.Add('SN');
   form39.teclas.Add('1234567890' + #8);
   form39.teclas.Add('SN');
   form39.teclas.Add('SN');
   form39.teclas.Add('1234567890' + #8);
   form39.teclas.Add('1234567890' + #8);
   form39.teclas.Add('');
   form39.teclas.Add('');
   form39.teclas.Add('');
   form39.teclas.Add('1234567890' + #8);
   form39.ShowModal;
 end
else if funcoes.lista1 = '2' then
  begin
    form52 := tform52.Create(self);
    form52.ShowModal;
    form52.Free;
  end;
end;

procedure TForm2.ConsultaNota1Click(Sender: TObject);
var nota:string;
begin
 nota := Incrementa_Generator('venda', 0);
 nota := funcoes.dialogo('generico',0,'1234567890'+#8,90,false,'',Application.Title,'Informe o N�mero Da Nota:',nota);
 if ((nota = '*') or(nota = '')) then exit;

 dm.IBQuery2.Close;
 dm.IBQuery2.SQL.Clear;
 dm.IBQuery2.SQL.Add('select nota from venda where (nota='+nota + ')');
 dm.IBQuery2.Open;
 if not(dm.IBQuery2.IsEmpty) then funcoes.GeraNota(nota,form22.Pgerais.Values['nota'], 'N', 1)
  else ShowMessage('Nota N�o Encontrada!');
 dm.IBQuery2.Close;
end;

procedure TForm2.cancdenota1Click(Sender: TObject);
begin
  funcoes.cancelamentoDeNota('');
end;


procedure TForm2.RequisioDepsoto1Click(Sender: TObject);
begin
   Form20 := Tform20.Create(Self);
   form20.tipoV := 'D';
   Form20.LabelVenda.Caption := 'Requisi��o de Dep�sito';
   form20.Modo_Venda := true;
   form20.origem := 2;
   form20.saidaDeEstoque := false;
   form20.finaliza       := false;
   form20.separaPecas    := false;
   funcoes.CtrlResize(tform(form20));
   Form20.ShowModal;
   form20.Free;
end;

procedure TForm2.SadadeEstoque1Click(Sender: TObject);
begin
  Reorganizar;
end;

procedure TForm2.ransferencia1Click(Sender: TObject);
begin
  form21 := tform21.Create(self);
  funcoes.CtrlResize(tform(form21));
  form21.ShowModal;
  form21.Free;
end;

procedure TForm2.roca1Click(Sender: TObject);
begin
  //cancdenota1Click(sender);
  nota := funcoes.cancelamentoDeNota('', true);
  if (nota = '*') or (nota = '') or (nota = '0') then exit;

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select cod, quant from item_venda where nota= :nota');
  dm.IBselect.ParamByName('nota').AsString := nota;
  dm.IBselect.Open;
  dm.IBselect.First;

  Form20 := Tform20.Create(Self);
  form20.tipoV := 'T';
  form20.Modo_Venda := true;
  while not dm.IBselect.Eof do
    begin
      form20.adicioinaItem_Venda(dm.IBselect.fieldbyname('cod').AsString,dm.IBselect.fieldbyname('quant').AsCurrency, 0, true);
      dm.IBselect.Next;
    end;

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select cliente, prazo from venda where nota= :nota');
  dm.IBselect.ParamByName('nota').AsString := nota;
  dm.IBselect.Open;
  form20.JsEdit3.Text := dm.IBselect.fieldbyname('cliente').AsString;
  form20.JsEdit1.Text := dm.IBselect.fieldbyname('prazo').AsString;
  dm.IBselect.Close;

  form20.origem := 1;
  form20.saidaDeEstoque := false;
  form20.finaliza       := false;
  form20.separaPecas    := false;

  funcoes.CtrlResize(tform(form20));
  form20.DBGrid2.Update;

  funcoes.gravaAlteracao('Troca de Venda: ' + nota, 'TRC');
  form20.ShowModal;
  form20.Free;
end;

procedure TForm2.PorNota1Click(Sender: TObject);
var
  ini,fim,his,h1,imprimirtotaldia,notapul, grupo,
  imp_ent, h2, h3, data, tipoRegCaixa:string;
  sepUsu, codigoUsu, h4, usuario : String;
  totais, caixa : TStringList;
  TotalGeral, pendentes, ent, sai : currency;
  b,ContaNota,i, tam, fi:integer;
begin
  ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(form22.datamov));
  if ini = '*' then exit;

  fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?',formatadataddmmyy(form22.datamov));
  if fim = '*' then exit;

  his := funcoes.dialogo('generico',30,'1234567890' + #8,30,false,'',Application.Title,'Qual a Forma de Pagamento?','');
  if his = '*' then exit;

  grupo := '1';
  grupo := funcoes.dialogo('generico',30,'1234567890' + #8,30,false,'',Application.Title,'Qual o Grupo de Caixa?', '1');
  if grupo = '*' then exit;

  imprimirtotaldia := funcoes.dialogo('generico',0,'SN',20,false,'S',Application.Title,'Imprimir Todas as Notas?','S');
  if imprimirtotaldia = '*' then exit;

  sepUsu := funcoes.dialogo('generico',0,'SN',20,false,'S',Application.Title,'Deseja Separar as Vendas por Usu�rio ?','N');
  if sepUsu = '*' then exit;

  codigoUsu := '';
  h4        := '';
  if sepUsu = 'S' then begin
    codigoUsu := funcoes.dialogo('generico',30,'1234567890' + #8,30,false,'',Application.Title,'Qual o C�digo do Usu�rio ?', form22.codusario);
    if codigoUsu = '*' then exit;
  end;

  if codigoUsu <> '' then begin
    h4 := ' and usuario = ' + StrNum(codigoUsu);

    dm.IBselect.Close;
    dm.IBselect.SQL.Text := 'select nome from usuario where cod = :cod';
    dm.IBselect.ParamByName('cod').AsString := StrNum(codigoUsu);
    dm.IBselect.Open;

    if dm.IBselect.IsEmpty then usuario := codigoUsu + '-DESCONHECIDO'
      else usuario := codigoUsu + '-' + dm.IBselect.FieldByName('nome').AsString;
  end;

    totais := TStringList.Create;

    for b := 1 to 15 do
      begin
        totais.Add(IntToStr(b) + '=0');
      end;

  h3           := '';
  tipoRegCaixa := 'S';
  tipoRegCaixa := funcoes.dialogo('generico',0,'SN',20,false,'S',Application.Title,'Incluir Lan�amentos em Caixa no Resumo de Forma de Pagamento ?', tipoRegCaixa);
  if tipoRegCaixa = '*' then exit;

  if trim(LeftStr(form22.usuario, 5)) = 'CAIXA' then begin
    h3 := ' and trim(entrega) <> '''' ';
  end;

  imp_ent := funcoes.buscaParamGeral(57, 'S');

    b:=80;
    TotalGeral := 0;
    pendentes := 0;
    form19.RichEdit1.Clear;

    data :=  FormatDateTime('hh:mm:ss',now);

    funcoes.verificaLancamentosDuplicadosCaixa(ini, fim);

    if imprimirtotaldia = 'S' then begin
    if form22.Pgerais.Values['nota'] = 'T' then
      begin
        tam := 60;
        addRelatorioForm19('%');
        form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',60)+#13+#10))));
        form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.centraliza(form22.Pgerais.Values['empresa'],' ',60)+#13+#10))));
        form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',60)+#13+#10))));
        form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.centraliza('VENDAS DE: '+FormatDateTime('dd/mm/yy',StrToDateTime(ini)) + ' A '+ FormatDateTime('dd/mm/yy',StrToDateTime(fim)),' ',60)+#13+#10))));
        if h4 <> '' then  addRelatorioForm19(funcoes.centraliza('USUARIO: ' + usuario, ' ', 60) + CRLF);
        addRelatorioForm19(funcoes.centraliza('EMISSAO: ' + FormatDateTime('DD/MM/YY', NOW) + ' ' + DATA,' ',60)+#13+#10);
        form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',60)+#13+#10))));
        form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('DATA      NOTA VEND PAG       TOTAL          RECEBIDO'+#13+#10))));
        form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',60)+#13+#10))));
      end
   else
     begin
       tam := 80;
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|',' ',80)+#13+#10))));
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('VENDAS POR NOTA DE: '+FormatDateTime('dd/mm/yy',StrToDate(ini))+' A '+FormatDateTime('dd/mm/yy',StrToDate(fim)),'HORA: '+FormatDateTime('tt',now)+'|',' ',80)+#13+#10))));
       if h4 <> '' then  addRelatorioForm19('USUARIO: ' + usuario + CRLF);
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('DATA      NOTA  VEND PAG    TOTAL               PRAZO      CLIENTE               '+#13+#10))));
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
     end;
      end;

     if his <> '' then h1 := ' and (codhis='+his+')';
       //else h1 := ' and (codhis = 1)';

     dm.IBselect.Close;
     dm.IBselect.SQL.Clear;
     dm.IBselect.SQL.Add('select nota, vendedor, entrada, codhis, total, cancelado, ok, data, cliente, prazo from VENDA where ' +
     ' ((data >= :v1) and (data<=:v2)) '+h1+ h3+ h4 + ' order by nota');
     dm.IBselect.ParamByName('v1').AsDateTime := StrToDate(ini);
     dm.IBselect.ParamByName('v2').AsDateTime := StrToDate(fim);
     dm.IBselect.Open;
     dm.IBselect.FetchAll;
     dm.IBselect.First;
     ContaNota := dm.IBselect.fieldbyname('nota').AsInteger - 1;
     notapul := '';

     fi := dm.IBselect.RecordCount;

     funcoes.informacao(i, fi, 'Aguarde, Gerando Relat�rio...', true, false, 5);

     while not dm.IBselect.Eof do
     begin
       funcoes.informacao(dm.IBselect.RecNo, fi, 'Aguarde, Gerando Relat�rio...', false, false, 5);
       if ContaNota <> dm.IBselect.fieldbyname('nota').AsInteger then
         begin
          while ContaNota <> dm.IBselect.fieldbyname('nota').AsInteger -1 do
            begin
              notapul :=  notapul + IntToStr(ContaNota + 1) + '-' ;
              ContaNota := ContaNota + 1;
            end;
         end;
       ContaNota := ContaNota + 1;
       if form19.RichEdit1.Lines.Count >= b then
        begin
         b := b + 80;

         if form22.Pgerais.Values['nota'] = 'T' then
           begin
             addRelatorioForm19(funcoes.CompletaOuRepete('','','-',60)+#13+#10);
             addRelatorioForm19(' '+#13+#10 + #12);
             addRelatorioForm19(funcoes.CompletaOuRepete('','','-',60)+#13+#10);
             addRelatorioForm19(funcoes.centraliza(form22.Pgerais.Values['empresa'],' ',60)+#13+#10);
             addRelatorioForm19(funcoes.CompletaOuRepete('','','-',60)+#13+#10);
             addRelatorioForm19(funcoes.centraliza('VENDAS DE: '+FormatDateTime('dd/mm/yy',StrToDateTime(ini)) + ' A '+ FormatDateTime('dd/mm/yy',StrToDateTime(fim)),' ',60)+#13+#10);
             addRelatorioForm19(funcoes.CompletaOuRepete('','','-',60)+#13+#10);
             //form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('DATA      NOTA     VEND  PAG            TOTAL  RECEBIDO'+#13+#10))));
             addRelatorioForm19('DATA      NOTA VEND PAG       TOTAL          RECEBIDO'+#13+#10);
             addRelatorioForm19(funcoes.CompletaOuRepete('','','-',60)+#13+#10);
           end
         else
           begin
             //form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('DATA      NOTA     VEND  PAG            TOTAL  PRAZO    CLIENTE               '+#13+#10))));
             form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
             form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((' '+#13+#10 + #12))));
             form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
             form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|',' ',80)+#13+#10))));
             form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('VENDAS POR NOTA DE: '+FormatDateTime('dd/mm/yy',StrToDate(ini))+' A '+FormatDateTime('dd/mm/yy',StrToDate(fim)),'HORA: '+FormatDateTime('tt',now)+'|',' ',80)+#13+#10))));
             form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
             form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('DATA      NOTA  VEND PAG    TOTAL       PRAZO      CLIENTE               '+#13+#10))));
             form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
           end;
        end;

          if dm.IBselect.FieldByName('cancelado').AsCurrency = 0 then
            begin
              if (Trim(dm.IBselect.fieldbyname('ok').AsString) = 'N') or (Trim(dm.IBselect.fieldbyname('ok').AsString) = '') then
                begin
                  pendentes := pendentes + dm.IBselect.fieldbyname('total').AsCurrency;
                end;

              //aqui escreve no relatorio a venda
              //verifica se teve entrada, se tiver ent�o adiciona o valor da entrada na
              //forma de pagamento a vista e subtrai do valor da nota
              //if dm.IBselect.FieldByName('entrada').AsCurrency = 0 then
                // begin
               {    if form22.Pgerais.Values['nota'] = 'T' then form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((FormatDateTime('dd/mm/yy',dm.IBselect.fieldbyname('data').AsDateTime)+funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('nota').AsString,' ',8)+funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('vendedor').AsString,' ',7)+funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('codhis').AsString,' ',5) + funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',dm.IBselect.fieldbyname('total').AsCurrency),' ',17) + funcoes.CompletaOuRepete('',iif(Trim(dm.IBselect.fieldbyname('ok').AsString) = '','*', dm.IBselect.fieldbyname('ok').AsString),' ',5) +#13+#10))))
                     else form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((FormatDateTime('dd/mm/yy',dm.IBselect.fieldbyname('data').AsDateTime)+funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('nota').AsString,' ',8)+funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('vendedor').AsString,' ',7)+funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('codhis').AsString,' ',5) + funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',dm.IBselect.fieldbyname('total').AsCurrency),' ',17) + funcoes.CompletaOuRepete('',iif(Trim(dm.IBselect.fieldbyname('ok').AsString) = '','*', dm.IBselect.fieldbyname('ok').AsString),' ',5) +#13+#10))))
                 end
                else
                  begin
                }


                if imprimirtotaldia = 'S' then
                  begin
                    if form22.Pgerais.Values['nota'] = 'T' then
                      begin
                        addRelatorioForm19(FormatDateTime('dd/mm/yy',dm.IBselect.fieldbyname('data').AsDateTime)+' '+funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('nota').AsString,'0',6)+ ' ' +funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('vendedor').AsString,'0',3)+' '+
                        funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('codhis').AsString,'0',3)+' ' + funcoes.CompletaOuRepete('',FormatCurr('0.00',dm.IBselect.fieldbyname('total').AsCurrency - dm.IBselect.fieldbyname('entrada').AsCurrency),' ',10)+
                        funcoes.CompletaOuRepete(IfThen(dm.IBselect.fieldbyname('entrada').AsCurrency > 0,' + ' + FormatCurr('0.00',dm.IBselect.fieldbyname('entrada').AsCurrency), ''),'',' ',10)  +
                         funcoes.CompletaOuRepete('',iif(Trim(dm.IBselect.fieldbyname('ok').AsString) = '','*', LeftStr(dm.IBselect.fieldbyname('ok').AsString, 1)),' ',2) +#13+#10);
                      end
                     else
                       begin
                         dm.IBQuery3.Close;
                         dm.IBQuery3.SQL.Clear;
                         dm.IBQuery3.SQL.Add('select nome from cliente where cod = :cod');
                         dm.IBQuery3.ParamByName('cod').AsString := dm.IBselect.fieldbyname('cliente').AsString;
                         dm.IBQuery3.Open;
                         form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((FormatDateTime('dd/mm/yy',dm.IBselect.fieldbyname('data').AsDateTime)+funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('nota').AsString,' ',8)+ ' '+funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('vendedor').AsString,'0',3)+' '+funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('codhis').AsString,'0',3) + funcoes.CompletaOuRepete('',FormatCurr('0.00',dm.IBselect.fieldbyname('total').AsCurrency - dm.IBselect.fieldbyname('entrada').AsCurrency),' ',10) + funcoes.CompletaOuRepete(IfThen(dm.IBselect.fieldbyname('entrada').AsCurrency > 0,' + ' + FormatCurr('0.00',dm.IBselect.fieldbyname('entrada').AsCurrency), ''),'',' ',10) + funcoes.CompletaOuRepete('',iif(Trim(dm.IBselect.fieldbyname('ok').AsString) = '','*', dm.IBselect.fieldbyname('ok').AsString),' ',5) +
                         funcoes.CompletaOuRepete(' ' + dm.IBselect.fieldbyname('prazo').AsString,'',' ',4) + funcoes.CompletaOuRepete(' ' + copy(dm.IBQuery3.fieldbyname('nome').AsString, 1, 25),'',' ', 27) + #13 + #10))));
                       end;
                  end;
                 // end;

              //aqui adiciona os valores por forma te pagamento
              //foi feito uma mudan�a aqui em 16/05/2014 para adicionar a entrada
              // na  forma de pagamento a vista

              {ISSO FOI TIRADO EM 06/01/2016 PQ A ENTRADA FOI LANCADA EM CAIXA}

              //totais.Values[dm.IBselect.fieldbyname('codhis').AsString] := CurrToStr(StrToCurrDef(totais.Values[dm.IBselect.fieldbyname('codhis').AsString], 0) + dm.IBselect.fieldbyname('total').AsCurrency );

              if dm.IBselect.FieldByName('entrada').AsCurrency = 0 then
                begin
                  totais.Values[dm.IBselect.fieldbyname('codhis').AsString] := CurrToStr(StrToCurrDef(totais.Values[dm.IBselect.fieldbyname('codhis').AsString], 0) + dm.IBselect.fieldbyname('total').AsCurrency );
                end
              else
                begin
                  totais.Values['1'] := CurrToStr(StrToCurrDef(totais.Values['1'], 0) + dm.IBselect.fieldbyname('entrada').AsCurrency );
                  totais.Values[dm.IBselect.fieldbyname('codhis').AsString] := CurrToStr(StrToCurrDef(totais.Values[dm.IBselect.fieldbyname('codhis').AsString], 0) + (dm.IBselect.fieldbyname('total').AsCurrency - dm.IBselect.fieldbyname('entrada').AsCurrency));

                  {if dm.IBselect.fieldbyname('codhis').AsInteger <> 2 then
                    begin
                      totais.Values['1'] := CurrToStr(StrToCurrDef(totais.Values['1'], 0) + dm.IBselect.fieldbyname('entrada').AsCurrency );
                      totais.Values[dm.IBselect.fieldbyname('codhis').AsString] := CurrToStr(StrToCurrDef(totais.Values[dm.IBselect.fieldbyname('codhis').AsString], 0) + (dm.IBselect.fieldbyname('total').AsCurrency - dm.IBselect.fieldbyname('entrada').AsCurrency));
                    end
                  else begin
                    totais.Values[dm.IBselect.fieldbyname('codhis').AsString] := CurrToStr(StrToCurrDef(totais.Values[dm.IBselect.fieldbyname('codhis').AsString], 0) + dm.IBselect.fieldbyname('total').AsCurrency );
                  end;}

                  //totais.Values[dm.IBselect.fieldbyname('codhis').AsString] := CurrToStr(StrToCurrDef(totais.Values[dm.IBselect.fieldbyname('codhis').AsString], 0) + dm.IBselect.fieldbyname('total').AsCurrency );
                end;
            end
          else
            begin
              if imprimirtotaldia = 'S' then
                begin
                  //aqui escreve as vendas canceladas
                  if form22.Pgerais.Values['nota'] = 'T' then
                    begin
                      //form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((FormatDateTime('dd/mm/yy',dm.IBselect.fieldbyname('data').AsDateTime)+funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('nota').AsString,' ',8)+funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('vendedor').AsString,' ',7)+funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('codhis').AsString,' ',5)+funcoes.CompletaOuRepete('',FormatCurr('0.00',dm.IBselect.fieldbyname('total').AsCurrency),' ',13)+ IfThen(dm.IBselect.fieldbyname('entrada').AsCurrency > 0,funcoes.CompletaOuRepete(' + ', FormatCurr('0.00',dm.IBselect.fieldbyname('entrada').AsCurrency),' ',10), funcoes.CompletaOuRepete('','',' ',10))  +funcoes.CompletaOuRepete('','canc.:'+copy(funcoes.BuscaNomeBD(dm.ibquery1,'nome','usuario','where cod='+dm.IBselect.FieldByName('cancelado').AsString),1,9),' ',15)+#13+#10))))
                      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((FormatDateTime('dd/mm/yy',dm.IBselect.fieldbyname('data').AsDateTime)+' '+funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('nota').AsString,'0',6)+ ' ' +funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('vendedor').AsString,'0',3)+' '+
                        funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('codhis').AsString,'0',3)+' ' + funcoes.CompletaOuRepete('',FormatCurr('0.00',dm.IBselect.fieldbyname('total').AsCurrency - dm.IBselect.fieldbyname('entrada').AsCurrency),' ',10)+
                         funcoes.CompletaOuRepete(IfThen(dm.IBselect.fieldbyname('entrada').AsCurrency > 0,' + ' + FormatCurr('0.00',dm.IBselect.fieldbyname('entrada').AsCurrency), ''),'',' ',10)  +
                        funcoes.CompletaOuRepete('','canc.:'+copy(funcoes.BuscaNomeBD(dm.ibquery1,'nome','usuario','where cod='+dm.IBselect.FieldByName('cancelado').AsString),1,9),' ',15) +#13+#10))));
                    end
                    else form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((FormatDateTime('dd/mm/yy',dm.IBselect.fieldbyname('data').AsDateTime)+funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('nota').AsString,' ',8)+funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('vendedor').AsString,' ',7)+funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('codhis').AsString,' ',5)+funcoes.CompletaOuRepete('',FormatCurr('0.00',dm.IBselect.fieldbyname('total').AsCurrency),' ',13) + IfThen(dm.IBselect.fieldbyname('entrada').AsCurrency > 0,funcoes.CompletaOuRepete(' + ', FormatCurr('0.00',dm.IBselect.fieldbyname('entrada').AsCurrency),' ',13), funcoes.CompletaOuRepete('','',' ',13)) + funcoes.CompletaOuRepete('','canc.:'+copy(funcoes.BuscaNomeBD(dm.ibquery1,'nome','usuario','where cod='+dm.IBselect.FieldByName('cancelado').AsString),1,9),' ',15)+#13+#10))))
                end;
            end;

       dm.IBselect.Next;
     end;

     {if imprimirtotaldia = 'S' then
       begin
         form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',60)+#13+#10))));
         form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('------------------OUTRAS ENTRADAS EM CAIXA------------------'+#13+#10))));
      end
    else
      begin
        addRelatorioForm19(funcoes.RelatorioCabecalho(form22.Pgerais.Values['empresa'], 'OUTRAS ENTRADAS EM CAIXA', 80));
        addRelatorioForm19('  DATA   Nr.Doc HISTORICO                                    VALOR' + CRLF);
        addRelatorioForm19('-------------------------------------------------------------------------------' + CRLF);
      end;}
     if his <> '' then h1 := ' and (formpagto='+his+')';

     if grupo <> '' then grupo := '(codgru = '+ grupo +') and';
     h2 := '';

     if imp_ent = 'E' then h2 := '(saida = 0) and ';
     if imp_ent = 'N' then h2 := '(documento = -999) and ';


     dm.IBselect.Close;
     dm.IBselect.SQL.Clear;
     dm.IBselect.SQL.Text := ('select entrada, saida, data, historico, documento, formpagto, fornec from caixa where '+ h2 +' '+ grupo +' ((cast(data as date) >= :v1) and (tipo <> ''E'') and (cast(data as date) <= :v2) ) and (not historico like '+ QuotedStr('%VENDAS DO DIA%') + ') '+h1+ h4+' order by data');
     dm.IBselect.ParamByName('v1').AsDateTime := StrToDate(ini);
     dm.IBselect.ParamByName('v2').AsDateTime := StrToDate(fim);
     dm.IBselect.Open;
     dm.IBselect.FetchAll;
     //ShowMessage(IntToStr(dm.IBselect.RecordCount) + #13 + 'H2=' + h2 + 'H1=' + h1+ 'H4=' + h4 + 'grupo=' + grupo);

     totais.Add('out=0');
     ent := 0;
     sai := 0;

     caixa := TStringList.Create;
     while not dm.IBselect.Eof do
       begin
         if dm.IBselect.FieldByName('entrada').AsCurrency = 0 then begin
           b := 1;
           if (dm.IBselect.fieldbyname('formpagto').AsInteger > 1) then begin
             totais.Values[dm.IBselect.fieldbyname('formpagto').AsString] := CurrToStr(StrToCurr(totais.Values[dm.IBselect.fieldbyname('formpagto').AsString]) - dm.IBselect.fieldbyname('saida').AsCurrency);
           end
           else begin
             totais.Values['out'] := CurrToStr(StrToCurr(totais.Values['out']) - dm.IBselect.fieldbyname('saida').AsCurrency);
             sai := sai + dm.IBselect.fieldbyname('saida').AsCurrency;
           end;

           VLR_ICM := dm.IBselect.fieldbyname('saida').AsCurrency;
         end
         else begin
           b := 0;
           if (dm.IBselect.fieldbyname('formpagto').AsInteger > 1) then begin
             totais.Values[dm.IBselect.fieldbyname('formpagto').AsString] := CurrToStr(StrToCurr(totais.Values[dm.IBselect.fieldbyname('formpagto').AsString]) + dm.IBselect.fieldbyname('entrada').AsCurrency);
           end
           else begin
             totais.Values['out'] := CurrToStr(StrToCurr(totais.Values['out']) + dm.IBselect.fieldbyname('entrada').AsCurrency);
             ent     := ent + dm.IBselect.fieldbyname('entrada').AsCurrency;
           end;

           VLR_ICM := dm.IBselect.fieldbyname('entrada').AsCurrency;
         end;

         ///// bloco original 05/06/2018
        { if dm.IBselect.FieldByName('entrada').AsCurrency = 0 then
           begin
             b := 1;
             totais.Values['out'] := CurrToStr(StrToCurr(totais.Values['out']) - dm.IBselect.fieldbyname('saida').AsCurrency);
             VLR_ICM := dm.IBselect.fieldbyname('saida').AsCurrency;
           end
         else
           begin
              b := 0;

             //if dm.IBselect.fieldbyname('fornec').AsInteger  0  then

             totais.Values['out'] := CurrToStr(StrToCurr(totais.Values['out']) + dm.IBselect.fieldbyname('entrada').AsCurrency);
             VLR_ICM := dm.IBselect.fieldbyname('entrada').AsCurrency;
           end;} /// bloco original 05/06/2018

         {if form22.Pgerais.Values['nota'] = 'T' then
           begin
             form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((FormatDateTime('dd/mm/yy',dm.IBselect.fieldbyname('data').AsDateTime)+' '+funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('historico').AsString,' ',35)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',VLR_ICM) + IfThen(b = 1, '-', '+'),' ',16)+#13+#10))));
           end
         else form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((FormatDateTime('dd/mm/yy',dm.IBselect.fieldbyname('data').AsDateTime)+' '+ strzero(dm.IBselect.fieldbyname('documento').AsString, 6) +' ' +funcoes.CompletaOuRepete(dm.IBselect.fieldbyname('historico').AsString,'',' ',35)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00', VLR_ICM) + IfThen(b = 1, '-', '+'),' ',16)+#13+#10))));
         }

         if form22.Pgerais.Values['nota'] = 'T' then
           begin
             caixa.Add(FormatDateTime('dd/mm/yy',dm.IBselect.fieldbyname('data').AsDateTime)+' '+funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('historico').AsString,' ',35)+funcoes.CompletaOuRepete('',FormatCurr('0.00',VLR_ICM) + IfThen(b = 1, '-', '+'),' ',13) + IfThen((dm.IBselect.fieldbyname('formpagto').AsInteger > 2), ' ' + strzero(dm.IBselect.fieldbyname('formpagto').AsInteger, 3), ''));
           end
         else caixa.Add(FormatDateTime('dd/mm/yy',dm.IBselect.fieldbyname('data').AsDateTime)+' '+ strzero(dm.IBselect.fieldbyname('documento').AsString, 6) +' ' +funcoes.CompletaOuRepete(dm.IBselect.fieldbyname('historico').AsString,'',' ',35)+funcoes.CompletaOuRepete('',FormatCurr('0.00', VLR_ICM) + IfThen(b = 1, '-', '+'),' ',13) + IfThen((dm.IBselect.fieldbyname('formpagto').AsInteger > 2), ' ' + strzero(dm.IBselect.fieldbyname('formpagto').AsInteger, 3), ''));

         dm.IBselect.Next;
       end;

     if form22.Pgerais.Values['nota'] = 'T' then
      begin
        tam := 60;
      end
   else
     begin
       tam := 80;
     end;

   totais.Values['out'] := CurrToStr(ent - sai);
   //ShowMessage('ent=' + CurrToStr(ent) + #13 + 'sai=' + CurrToStr(sai)+ #13 +'soma=' + CurrToStr(ent - sai) + #13 + totais.Values['out']);


     if caixa.Count > 0 then begin
       if imprimirtotaldia = 'S' then begin
         addRelatorioForm19(funcoes.CompletaOuRepete('','','-',tam)+#13+#10);
         if tam = 80 then begin
           addRelatorioForm19('----------------------------OUTRAS ENTRADAS EM CAIXA----------------------------'+#13+#10);
           addRelatorioForm19('DATA     Nr.Doc HISTORICO                                     VALOR' + CRLF);
           addRelatorioForm19('--------------------------------------------------------------------------------'+#13+#10);
         end
         else begin
           addRelatorioForm19('------------------OUTRAS ENTRADAS EM CAIXA------------------'+#13+#10);
           //addRelatorioForm19('DATA    Nr.Doc   HISTORICO                                VALOR' + CRLF);
           //addRelatorioForm19('------------------------------------------------------------'+#13+#10);
         end;
       end
       else begin
         addRelatorioForm19(funcoes.RelatorioCabecalho(form22.Pgerais.Values['empresa'], 'OUTRAS ENTRADAS EM CAIXA', 80));
         addRelatorioForm19('  DATA   Nr.Doc HISTORICO                                    VALOR' + CRLF);
         addRelatorioForm19('-------------------------------------------------------------------------------' + CRLF);
       end;

       for b := 0 to caixa.Count -1 do begin
         addRelatorioForm19(caixa[b] + CRLF);
       end;
     end;

     if imprimirtotaldia <> 'S' then begin
      addRelatorioForm19(funcoes.CompletaOuRepete('','','-', tam)+#13+#10);
     end
       else addRelatorioForm19(funcoes.CompletaOuRepete('','','-', tam)+#13+#10);

     for b := 0 to totais.Count - 1 do
       begin
         if totais.Names[b] <> '2'  then TotalGeral := TotalGeral + StrToCurr(totais.Values[totais.Names[b]]);
         if totais.names[b] = 'out' then
           begin
             if strtocurr(totais.Values['out']) <> 0 then begin
               form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('OUTRAS ENTRADAS EM CAIXA','',' ',27) + funcoes.CompletaOuRepete('-',FormatCurr('#,###,###0.00',strtocurr(totais.Values['out'])),' ',14)+#13+#10))));
             end;
           end
          else
            begin
              if StrToCurrDef(totais.Values[totais.names[b]], 0) <> 0 then
              form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(totais.names[b]+' - '+copy(funcoes.BuscaNomeBD(dm.ibquery1,'nome','formpagto','where cod='+totais.names[b]),1,15),'',' ',27) + funcoes.CompletaOuRepete('-',FormatCurr('#,###,###0.00',strtocurr(totais.Values[totais.names[b]])),' ',14)+#13+#10))));
            end;
       end;
       
     if pendentes <> 0 then
       begin
         form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('TOTAL PEDIDOS PENDENTES','',' ',27) + funcoes.CompletaOuRepete('-',FormatCurr('#,###,###0.00',pendentes),' ',14)+#13+#10))));
       end;
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#13+#10))));
     form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('TOTAL GERAL: '+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',TotalGeral),' ',15)+funcoes.CompletaOuRepete(' (SEM VENDAS A PRAZO)','',' ',32)+#13+#10))));
     if imprimirtotaldia = 'S' then form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',60)+#13+#10))))
       else form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-', 80)+#13+#10))));


     addRelatorioForm19('EMISSAO: ' + FormatDateTime('DD/MM/YY', NOW) + ' ' + DATA + CRLF + CRLF);

   if h4 = '' then begin
     dm.IBselect.Close;
     dm.IBselect.SQL.Text := 'select a.codigo, p.nome, a.quant, a.deposito, a.nome as just from acerto a inner join produto p on (a.codigo = p.cod)' +
     ' where ((a.data >= :v1) and (a.data <= :v2))';
     dm.IBselect.ParamByName('v1').AsDateTime := StrToDate(ini);
     dm.IBselect.ParamByName('v2').AsDateTime := StrToDate(fim);
     dm.IBselect.Open;

     ContaNota := 0;
     while not dm.IBselect.Eof do
       begin
         if ContaNota = 0 then
           begin
             addRelatorioForm19('+-------------------------------------+' + CRLF);
             addRelatorioForm19('|        ACERTOS DE ESTOQUE           |' + CRLF);
             addRelatorioForm19('+-------------------------------------+' + CRLF);
           end;
         addRelatorioForm19(funcoes.CompletaOuRepete('| ' + LeftStr(dm.IBselect.fieldbyname('codigo').AsString + '-' + dm.IBselect.fieldbyname('nome').AsString, 35), ' |', ' ', 39) + CRLF);
         addRelatorioForm19('| Loja:' + funcoes.CompletaOuRepete('', formataCurrency(dm.IBselect.fieldbyname('quant').AsCurrency), ' ', 11) + '  Dep.:' + funcoes.CompletaOuRepete('', formataCurrency(dm.IBselect.fieldbyname('deposito').AsCurrency), ' ', 11) + '  |' + CRLF);
         addRelatorioForm19('| Justificativa:' + funcoes.CompletaOuRepete(LeftStr(dm.IBselect.fieldbyname('just').AsString, 20), '', ' ', 20) + '  |'  + CRLF);
         addRelatorioForm19('+-------------------------------------+' + CRLF);

         ContaNota := ContaNota + 1;
         dm.IBselect.Next;
       end;

       if notapul <> '' then begin
         ini := 'Notas N�o Encontradas: ' + #13 + #10;
         addRelatorioForm19(ini);
         while length(notapul) > 60 do
           begin
             ini := copy(notapul, 1, 59);
             addRelatorioForm19( ini + #13 + #10);
             notapul := copy(notapul, 60, length(notapul));
           end;
         addRelatorioForm19(notapul);
       end;
     end;

     funcoes.informacao(i, fi, 'Aguarde, Gerando Relat�rio...', false, true, 5);
     caixa.Free;
     totais.Free;
     dm.IBselect.Close;
     form19.RichEdit1.SelStart := 0;
     form19.ShowModal;
end;

procedure TForm2.ClienteNoota1Click(Sender: TObject);
var ini,fim,h1,cliente,ee:string;
totalGeral : currency;
i : integer;
begin
  cliente := funcoes.dialogo('generico',100,'1234567890'+#8,100,false,'',Application.Title,'Qual o C�digo do cliente?','');
  if cliente = '' then cliente := funcoes.localizar('Localizar Cliente','cliente','cod,nome,telres,telcom,cnpj,bairro','cod','','nome','nome',false,false,false,'',0,nil);
  if (cliente = '') or (cliente = '*') then exit;

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select * from cliente where cod='+cliente);
  dm.IBselect.Open;

  if dm.IBselect.IsEmpty then
    begin
      ShowMessage('Cliente N�o Encontrado!');
      dm.IBselect.Close;
      exit;
    end;
  dm.IBselect.Close;

  ini := funcoes.dialogo('data',0,'',50,true,'',Application.Title,'Qual a Data Inicial?','');
  if ini = '*' then exit;

  fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?','');
  if fim = '*' then exit;

  h1 := ' and (cliente='+cliente+')';

  form19.RichEdit1.Clear;
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|',' ',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('VENDAS POR CLIENTE/NOTA DE: '+FormatDateTime('dd/mm/yy',StrToDate(ini))+' A '+FormatDateTime('dd/mm/yy',StrToDate(fim)),'HORA: '+FormatDateTime('tt',now)+'|',' ',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('    NOTA  DATA    VENCIMENTO            VALOR'+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('CLIENTE: '+cliente+'-'+funcoes.BuscaNomeBD(dm.ibquery1,'nome','cliente','where cod='+cliente),'',' ',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#13+#10))));

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select nota,data,data + prazo as vencimento,total from venda where ((cancelado = 0) and(data >= :v1) and (data<=:v2)) and (cliente='+cliente+') ');
  dm.IBselect.ParamByName('v1').AsDateTime := StrToDate(ini);
  dm.IBselect.ParamByName('v2').AsDateTime := StrToDate(fim);
  dm.IBselect.Open;
  dm.IBselect.First;
  totalGeral := 0;
  b := 60;
  while not dm.IBselect.Eof do
    begin

      if form19.RichEdit1.Lines.Count >= b then
        begin
          b := b + 60;
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|',' ',80)+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('VENDAS POR CLIENTE/NOTA DE: '+FormatDateTime('dd/mm/yy',StrToDate(ini))+' A '+FormatDateTime('dd/mm/yy',StrToDate(fim)),'HORA: '+FormatDateTime('tt',now)+'|',' ',80)+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('    NOTA  DATA    VENCIMENTO            VALOR'+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('CLIENTE: '+cliente+'-'+funcoes.BuscaNomeBD(dm.ibquery1,'nome','cliente','where cod='+cliente),'',' ',80)+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#13+#10))));
        end;
      totalGeral := totalGeral + dm.IBselect.fieldbyname('total').AsCurrency;
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('nota').AsString,' ',8)+' '+funcoes.CompletaOuRepete(FormatDateTime('dd/mm/yy',dm.IBselect.fieldbyname('data').AsDateTime),'',' ',8)+'  '+funcoes.CompletaOuRepete(FormatDateTime('dd/mm/yy',dm.IBselect.fieldbyname('vencimento').AsDateTime),'',' ',8)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',dm.IBselect.fieldbyname('total').AsCurrency),' ',18)+#13+#10))));
      dm.IBselect.Next;
    end;

  dm.IBselect.Close;
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('TOTAL GERAL =>   '+FormatCurr('#,###,###0.00',totalGeral),'',' ',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  form19.ShowModal;
end;

procedure TForm2.PorCliente1Click(Sender: TObject);
var
  ini,fim,h1,cliente,ee, clix, ordem :string;
  totalGeral : currency;
  i : integer;
begin
  cliente := funcoes.dialogo('generico',30,'1234567890'+#8,30,false,'',Application.Title,'Qual o C�digo do cliente?','');
  if (cliente = '*') then exit;
  {if cliente = '' then cliente := funcoes.localizar('Localizar Cliente','cliente','cod,nome,telres,telcom,cnpj,bairro','cod','','nome','nome',false,false,false,'',0,nil);
  if (cliente = '') or (cliente = '*') then exit;

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select cod from cliente where cod = :cod');
  dm.IBselect.ParamByName('cod').AsString := cliente;
  dm.IBselect.Open;

  if dm.IBselect.IsEmpty then
    begin
      ShowMessage('Cliente N�o Encontrado!');
      dm.IBselect.Close;
      exit;
    end;
  dm.IBselect.Close;  }

  ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(StartOfTheMonth(form22.datamov)));
  if not funcoes.Contido('*',ini) then fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?',formatadataddmmyy(endOfTheMonth(form22.datamov)));
  if funcoes.Contido('*',ini+ fim) then exit;

  h1 := '';
  if cliente <> '' then h1 := ' and (cliente='+cliente+')';

  ordem := 'v.cliente, v.data';

  form19.RichEdit1.Clear;
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|',' ',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('VENDAS POR CLIENTE DE: '+FormatDateTime('dd/mm/yy',StrToDate(ini))+' A '+FormatDateTime('dd/mm/yy',StrToDate(fim)),'HORA: '+FormatDateTime('tt',now)+'|',' ',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('  DATA    COD   DESCRICAO                            QUANT        TOTAL     NOTA'+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select v.cliente, v.nota,v.data,i.cod,p.nome,i.quant,i.total from venda v,item_venda i,produto p where (v.nota = i.nota) and (v.cancelado = 0) and (i.cod = p.cod) and ((v.data >= :v1) and (v.data<=:v2)) '+h1+' order by ' + ordem);
  dm.IBselect.ParamByName('v1').AsDateTime := StrToDate(ini);
  dm.IBselect.ParamByName('v2').AsDateTime := StrToDate(fim);
  //dm.IBselect.ParamByName('cliente').AsInteger := StrToIntDef(cliente , 0);
  dm.IBselect.Open;
  dm.IBselect.First;
  totalGeral := 0;
  clix := 'xx';
  while not dm.IBselect.Eof do
    begin
      if clix <> dm.IBselect.FieldByName('cliente').AsString then begin
        dm.IBQuery2.Close;
        dm.IBQuery2.SQL.Text := 'select telres, telcom from cliente where cod = :cod';
        dm.IBQuery2.ParamByName('cod').AsString := dm.IBselect.FieldByName('cliente').AsString;
        dm.IBQuery2.Open;

        form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((CRLF))));
        form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(LeftStr('CLIENTE: '+dm.IBselect.FieldByName('cliente').AsString+'-'+funcoes.BuscaNomeBD(dm.ibquery1,'nome','cliente','where cod='+dm.IBselect.FieldByName('cliente').AsString) + ' ' + dm.IBQuery2.FieldByName('telres').AsString + ' ' + dm.IBQuery2.FieldByName('telcom').AsString, 78),'',' ',80)+#13+#10))));
        form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((CRLF))));
        clix := dm.IBselect.FieldByName('cliente').AsString;
      end;

      totalGeral := totalGeral + dm.IBselect.fieldbyname('total').AsCurrency;
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(FormatDateTime('dd/mm/yy',dm.IBselect.fieldbyname('data').AsDateTime),'',' ',8)+funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('cod').AsString,' ',6)+'-'+funcoes.CompletaOuRepete(copy(dm.IBselect.fieldbyname('nome').AsString,1,30),'',' ',30)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',dm.IBselect.fieldbyname('quant').AsCurrency),' ',13)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',dm.IBselect.fieldbyname('total').AsCurrency),' ',13)+funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('nota').AsString,' ',9)+#13+#10))));
      dm.IBselect.Next;
    end;

  dm.IBselect.Close;
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('TOTAL GERAL =>   '+FormatCurr('#,###,###0.00',totalGeral),'',' ',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  form19.ShowModal;
end;

procedure TForm2.MargemdeLucro1Click(Sender: TObject);
var ini,fim : string;
totalGeral,totalCompra,totalVenda,totVendas,totcomp,somaDesc,descMedio : currency;
i,linhas : integer;
quants,p_compra,p_venda,desconto,totais : TStringList;
begin
  ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?','');
  if not funcoes.Contido('*',ini) then fim := funcoes.dialogo('data',0,'1234567890'+#8,50,true,'',Application.Title,'Qual a Data Final?','');
  if funcoes.Contido('*',ini+ fim) then exit;

  quants   := TStringList.Create;
  p_compra := TStringList.Create;
  p_venda  := TStringList.Create;
  desconto := TStringList.Create;
  totais   := TStringList.Create;

  form19.RichEdit1.Clear;
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|',' ',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('VENDAS POR CLIENTE DE: '+FormatDateTime('dd/mm/yy',StrToDate(ini))+' A '+FormatDateTime('dd/mm/yy',StrToDate(fim)),'HORA: '+FormatDateTime('tt',now)+'|',' ',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('CODIGO DESCRICAO                      QUANT.        CUSTO       VENDA    LUCRO'+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select i.cod, i.quant, i.p_compra, i.nota, v.desconto, i.total as p_venda, v.total from item_venda i, venda v  where ((v.data >= :v1) and (v.data <= :v2)) and (v.cancelado = 0) and (i.nota = v.nota) order by i.cod');
  dm.IBselect.ParamByName('v1').AsDateTime := StrToDate(ini);
  dm.IBselect.ParamByName('v2').AsDateTime := StrToDate(fim);
  dm.IBselect.Open;
  dm.IBselect.First;
  totalGeral := 0;
  linhas := 55;

  while not dm.IBselect.Eof do
    begin
      if  quants.Values[dm.IBselect.FieldByName('cod').AsString] = '' then quants.Add(dm.IBselect.FieldByName('cod').AsString+'='+dm.IBselect.fieldbyname('quant').AsString)
        else quants.Values[dm.IBselect.FieldByName('cod').AsString] := CurrToStr(StrToCurr(quants.Values[dm.IBselect.FieldByName('cod').AsString]) + dm.IBselect.fieldbyname('quant').AsCurrency);

      if  p_compra.Values[dm.IBselect.FieldByName('cod').AsString] = '' then p_compra.Values[dm.IBselect.FieldByName('cod').AsString] := dm.IBselect.fieldbyname('p_compra').AsString
         else p_compra.Values[dm.IBselect.FieldByName('cod').AsString] := CurrToStr(StrToCurr(p_compra.Values[dm.IBselect.FieldByName('cod').AsString]) + dm.IBselect.fieldbyname('p_compra').AsCurrency);

      if  p_venda.Values[dm.IBselect.FieldByName('cod').AsString] = '' then p_venda.Values[dm.IBselect.FieldByName('cod').AsString] := dm.IBselect.fieldbyname('p_venda').AsString
         else  p_venda.Values[dm.IBselect.FieldByName('cod').AsString] := CurrToStr(StrToCurr(p_venda.Values[dm.IBselect.FieldByName('cod').AsString]) + dm.IBselect.fieldbyname('p_venda').AsCurrency);

      if dm.IBselect.FieldByName('desconto').AsCurrency <> 0 then if desconto.Values[dm.IBselect.FieldByName('nota').AsString] = '' then
        begin
         desconto.Values[dm.IBselect.FieldByName('nota').AsString] := dm.IBselect.fieldbyname('desconto').AsString;
         totais.Values[dm.IBselect.FieldByName('nota').AsString] := dm.IBselect.fieldbyname('total').AsString;
        end;
      dm.IBselect.Next;
    end;
  totVendas := 0;
  totcomp := 0;
  somaDesc := 0;
  descMedio := 0;
  if desconto.Count > 0 then
    begin
      for i := 0 to desconto.Count -1 do
        begin
          somaDesc := somaDesc + StrToCurr(desconto.Values[desconto.Names[i]]) ;
          descMedio := descMedio + (StrToCurr(desconto.Values[desconto.Names[i]]) * 100) / StrToCurr(totais.Values[desconto.Names[i]]);
        end;

        form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','0',' ',6)+'-'+funcoes.CompletaOuRepete('DESCONTO MEDIO => '+FormatCurr('#,###,###0.00',descMedio / desconto.Count)+'%','',' ',25)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',desconto.Count),' ',12)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',0),' ',13)+ funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',somaDesc),' ',13)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',100 - ((0 * 100)/somaDesc)),' ',9)+'%'+#13+#10))));
        totVendas := somaDesc;
    end;
  for i := 0 to quants.Count -1 do
    begin
      if form19.RichEdit1.Lines.Count >= linhas then
        begin
          linhas := linhas + 55;
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((' '+#12+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|',' ',80)+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('VENDAS POR CLIENTE DE: '+FormatDateTime('dd/mm/yy',StrToDate(ini))+' A '+FormatDateTime('dd/mm/yy',StrToDate(fim)),'HORA: '+FormatDateTime('tt',now)+'|',' ',80)+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('CODIGO DESCRICAO                      QUANT.        CUSTO       VENDA    LUCRO'+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
        end;

      totalCompra :=  StrToCurr(p_compra.Values[quants.Names[i]]);
      totalVenda := StrToCurr(p_venda.Values[quants.Names[i]]) ;

      totcomp := totcomp + totalCompra;
      totVendas := totVendas + totalVenda;

      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',quants.Names[i],' ',6)+'-'+funcoes.CompletaOuRepete(copy(funcoes.BuscaNomeBD(dm.ibquery2,'nome','produto','where cod='+quants.Names[i]),1,25),'',' ',25)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',StrToCurr(quants.Values[quants.Names[i]])),' ',12)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',totalCompra),' ',13)+ funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',totalVenda),' ',13)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',100 - ((totalCompra * 100)/totalVenda)),' ',9)+'%'+#13+#10))));
    end;

  dm.IBselect.Close;
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('COMPRAS =>'+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',totcomp),' ',14)+'  '+'VENDAS =>'+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',totVendas),' ',15)+'  '+'LUCRO BRUTO =>'+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',totVendas - totcomp),' ',14)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  p_compra.Clear;
  p_compra := nil;
  p_venda.Clear;
  p_venda := nil;
  quants.Clear;
  quants := nil;
  desconto.Clear;
  desconto := nil;
  form19.ShowModal;

end;

procedure TForm2.PorFornecedor1Click(Sender: TObject);
var ini,fim,minim : string;
totalGeral,totalCompra,totalVenda,totVendas,totcomp,somaDesc,descMedio,minima : currency;
i,linhas : integer;
quants,p_compra,p_venda,desconto,totais : TStringList;
begin
  fornec := funcoes.dialogo('generico',0,'1234567890'+#8+#27+#13,50,true,'',Application.Title,'Qual o fornecedor?','');
  if fornec = '*' then exit;
  ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?','');
  if not funcoes.Contido('*',ini) then fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?','');

  minim := funcoes.dialogo('generico',0,'1234567890'+#8+#27+#13,50,true,'',Application.Title,'Qual a Quantidade M�nima Vendida?','1');
  if minim = '*' then exit;

  minima := StrToCurrDef(funcoes.ConverteNumerico(minim), 1);
  if funcoes.Contido('*',ini+ fim) then exit;

  quants := TStringList.Create;
  p_compra := TStringList.Create;
  p_venda := TStringList.Create;
  desconto := TStringList.Create;
  totais := TStringList.Create;

  form19.RichEdit1.Clear;
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',form22.datamov)+'|',' ',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('VENDAS POR FORNECEDOR : '+fornec+' - '+FormatDateTime('dd/mm/yy',StrToDate(ini))+' A '+FormatDateTime('dd/mm/yy',StrToDate(fim)),'HORA: '+FormatDateTime('tt',now)+'|',' ',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('CODIGO DESCRICAO                      QUANT.        CUSTO       VENDA    LUCRO'+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;

  dm.IBselect.SQL.Add('select i.cod, i.quant, i.p_compra, i.nota, v.desconto, i.total as p_venda, v.total, p.fornec from');
  dm.IBselect.SQL.Add(' item_venda i,venda v,produto p where (v.cancelado = 0) and ((v.data >= :v1) and (v.data <= :v2)) and (i.nota = v.nota) and (i.cod = p.cod) ' + iif(fornec <> '', 'and (p.fornec = '+fornec+')', ''));
  dm.IBselect.ParamByName('v1').AsDateTime := StrToDate(ini);
  dm.IBselect.ParamByName('v2').AsDateTime := StrToDate(fim);
  dm.IBselect.Open;
  dm.IBselect.First;
  totalGeral := 0;
  linhas := 55;
  dm.IBselect.FetchAll;
  while not dm.IBselect.Eof do
    begin
      if quants.Values[dm.IBselect.FieldByName('cod').AsString] = '' then quants.Add(dm.IBselect.FieldByName('cod').AsString + '=' + dm.IBselect.fieldbyname('quant').AsString)
        else quants.Values[dm.IBselect.FieldByName('cod').AsString] := CurrToStr(StrToCurr(quants.Values[dm.IBselect.FieldByName('cod').AsString]) + dm.IBselect.fieldbyname('quant').AsCurrency);

      if  p_compra.Values[dm.IBselect.FieldByName('cod').AsString] = '' then p_compra.Values[dm.IBselect.FieldByName('cod').AsString] := dm.IBselect.fieldbyname('p_compra').AsString
         else p_compra.Values[dm.IBselect.FieldByName('cod').AsString] := CurrToStr(StrToCurr(p_compra.Values[dm.IBselect.FieldByName('cod').AsString]) + dm.IBselect.fieldbyname('p_compra').AsCurrency);

      if  p_venda.Values[dm.IBselect.FieldByName('cod').AsString] = '' then p_venda.Values[dm.IBselect.FieldByName('cod').AsString] := dm.IBselect.fieldbyname('p_venda').AsString
         else  p_venda.Values[dm.IBselect.FieldByName('cod').AsString] := CurrToStr(StrToCurr(p_venda.Values[dm.IBselect.FieldByName('cod').AsString]) + dm.IBselect.fieldbyname('p_venda').AsCurrency);

      if dm.IBselect.FieldByName('desconto').AsCurrency <> 0 then if desconto.Values[dm.IBselect.FieldByName('nota').AsString] = '' then
        begin
         desconto.Values[dm.IBselect.FieldByName('nota').AsString] := dm.IBselect.fieldbyname('desconto').AsString;
         totais.Values[dm.IBselect.FieldByName('nota').AsString] := dm.IBselect.fieldbyname('total').AsString;
        end;
      dm.IBselect.Next;
    end;
  totVendas := 0;
  totcomp := 0;
  somaDesc := 0;
  descMedio := 0;
  if desconto.Count > 0 then
    begin
      for i := 0 to desconto.Count -1 do
        begin
          somaDesc := somaDesc + StrToCurr(desconto.Values[desconto.Names[i]]) ;
          descMedio := descMedio + (StrToCurr(desconto.Values[desconto.Names[i]]) * 100) / StrToCurr(totais.Values[desconto.Names[i]]);
        end;

        form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','0',' ',6)+'-'+funcoes.CompletaOuRepete('DESCONTO MEDIO => '+FormatCurr('#,###,###0.00',descMedio / desconto.Count)+'%','',' ',25)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',desconto.Count),' ',12)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',0),' ',13)+ funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',somaDesc),' ',13)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',100 - ((0 * 100)/somaDesc)),' ',9)+'%'+#13+#10))));
        totVendas := somaDesc;
    end;
  funcoes.OrdenarValoresStringList(quants);

  for i := 0 to quants.Count -1 do
    begin
      if form19.RichEdit1.Lines.Count >= linhas then
        begin
          linhas := linhas + 55;
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((' '+#12+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|',' ',80)+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('VENDAS POR FORNECEDOR : '+fornec+' - '+FormatDateTime('dd/mm/yy',StrToDate(ini))+' A '+FormatDateTime('dd/mm/yy',StrToDate(fim)),'HORA: '+FormatDateTime('tt',now)+'|',' ',80)+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('CODIGO DESCRICAO                      QUANT.        CUSTO       VENDA    LUCRO'+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
        end;
      if StrToCurr(quants.Values[quants.Names[i]]) >= minima then
        begin
          totalCompra :=  StrToCurr(p_compra.Values[quants.Names[i]]);
          totalVenda := StrToCurr(p_venda.Values[quants.Names[i]]) ;

          totcomp := totcomp + totalCompra;
          totVendas := totVendas + totalVenda;
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',quants.Names[i],' ',6)+'-'+funcoes.CompletaOuRepete(copy(funcoes.BuscaNomeBD(dm.ibquery2,'nome','produto','where cod='+quants.Names[i]),1,25),'',' ',25)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',StrToCurr(quants.Values[quants.Names[i]])),' ',12)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',totalCompra),' ',13)+ funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',totalVenda),' ',13)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',100 - ((totalCompra * 100)/totalVenda)),' ',9)+'%'+#13+#10))));
        end;
    end;

  dm.IBselect.Close;
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('COMPRAS =>'+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',totcomp),' ',14)+'  '+'VENDAS =>'+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',totVendas),' ',15)+'  '+'LUCRO BRUTO =>'+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',totVendas - totcomp),' ',14)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  p_compra.Clear;
  p_compra := nil;
  p_venda.Clear;
  p_venda := nil;
  quants.Clear;
  quants := nil;
  desconto.Clear;
  desconto := nil;
  form19.ShowModal;

end;

procedure TForm2.Panel2MouseEnter(Sender: TObject);
begin
  TPanel(sender).Color      := clGreen;
end;

procedure TForm2.Panel2MouseLeave(Sender: TObject);
begin
  TPanel(sender).Color      := clWhite;
end;

procedure TForm2.PapeldeParede1Click(Sender: TObject);
var papel : TMemoryStream;
imagem : TJPEGImage;
begin
  OpenPictureDialog1.Filter := 'Imagens JPEG|*.jpg;*.jpeg;';
  if OpenPictureDialog1.Execute then
    begin
      if OpenPictureDialog1.FileName <> '' then
        begin
          Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
          dm.IBselect.Close;
          dm.IBselect.SQL.Clear;
          dm.IBselect.SQL.Add('select * from config_tema');
          dm.IBselect.Open;

          if (dm.IBselect.FieldByName('papel1').IsNull) and (dm.IBselect.IsEmpty)  then
            begin
              dm.IBselect.Close;
              dm.IBQuery1.Close;
              dm.IBQuery1.SQL.Clear;
              dm.IBQuery1.SQL.Add('insert into config_tema(papel1) values(:papel)');
              dm.IBQuery1.ParamByName('papel').LoadFromFile(OpenPictureDialog1.FileName,ftBlob);
              dm.IBQuery1.ExecSQL;
              try
                dm.IBQuery1.Transaction.Commit;
             except
                dm.IBQuery1.Transaction.Rollback;
                ShowMessage('Ocorreu um Erro. Por Favor Refa�a a Opera��o.');
                exit;
              end;
            end
          else
            begin
              dm.IBselect.Close;
              dm.IBQuery1.Close;
              dm.IBQuery1.SQL.Clear;
              dm.IBQuery1.SQL.Add('update config_tema set papel1 = :papel');
             dm.IBQuery1.ParamByName('papel').LoadFromFile(OpenPictureDialog1.FileName,ftBlob);
              dm.IBQuery1.ExecSQL;
              try
                dm.IBQuery1.Transaction.Commit;
              except
                dm.IBQuery1.Transaction.Rollback;
                ShowMessage('Ocorreu um Erro. Por Favor Refa�a a Opera��o.');
                exit;
              end;
            end;
        end;
    end;
end;

procedure TForm2.PapeldeParedeTerminal1Click(Sender: TObject);
var
  nomeExec : String;
begin
  OpenPictureDialog1.Filter := 'Imagens JPEG|*.jpg;*.jpeg;';
  if OpenPictureDialog1.Execute then
    begin
      if OpenPictureDialog1.FileName <> '' then
        begin
          nomeExec := funcoes.nomeExec;
          Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
          CopyFile(pchar(OpenPictureDialog1.FileName), pchar(caminhoEXE_com_barra_no_final+nomeExec + '.jpg'), true);
        end;
    end;
end;

procedure TForm2.NomePapeldeParede1Click(Sender: TObject);
var nome,left,top,cor : string;
tipocor : Smallint;
begin
   //nome := funcoes.dialogo('not',3,'',60,false,'','ControlW','Novo Nome:',Label1.Caption);
   if nome = '*' then exit;
 //  Label1.Caption := nome;

//   left := funcoes.dialogo('generico',3,'1234567890'+#8,60,true,'','ControlW','Posi��o Esquera:',IntToStr(Label1.Left));
   if left = '*' then exit;
   try
 //    Label1.Left := StrToInt(left);
   except
     ShowMessage('Ocorreu um Erro de Convers�o. Tente Novamente');
     exit;
   end;

//   top := funcoes.dialogo('generico',3,'1234567890'+#8,60,true,'','ControlW','Posi��o Superior:',IntToStr(Label1.Top));
   if top = '*' then exit;
   try
  //   Label1.Top := StrToInt(top);
   except
     ShowMessage('Ocorreu um Erro de Convers�o. Tente Novamente');
     exit;
   end;
  //  if Label1.Font.Color = clblack then tipocor := 1
//    else tipocor := 2;
   cor := funcoes.dialogo('generico',3,'12'+#8,60,true,'','ControlW','Cor (1 - Preto, 2 - Branco)?',IntToStr(tipocor));

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select * from config_tema');
  dm.IBselect.Open;

  if dm.IBselect.IsEmpty then
    begin
      dm.IBselect.Close;
      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Clear;
      dm.IBQuery1.SQL.Add('insert into config_tema(TOP,ESQ,NOME,COR) values ('+top+','+left+','+QuotedStr(nome)+','+cor+')');
      try
        dm.IBQuery1.ExecSQL;
        dm.IBQuery1.Transaction.Commit;
      except
        dm.IBQuery1.Transaction.Rollback;
        ShowMessage('Ocorreu um Erro. Tente Novamente');
      end;
    funcoes.GeraTemas;
    end
  else
    begin
      dm.IBselect.Close;
      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Clear;
      dm.IBQuery1.SQL.Add('update config_tema set top = '+top+', ESQ = '+left+',nome = '+QuotedStr(nome)+',cor = '+cor);
      try
        dm.IBQuery1.ExecSQL;
        dm.IBQuery1.Transaction.Commit;
      except
        dm.IBQuery1.Transaction.Rollback;
        ShowMessage('Ocorreu um Erro. Tente Novamente');
      end;
    funcoes.GeraTemas;
    end;
end;

procedure TForm2.RestaurarBackup1Click(Sender: TObject);
begin
  funcoes.restaurarbackup;
end;

procedure TForm2.RestaurarCadastro1Click(Sender: TObject);
begin
  fornec := funcoes.dialogo('generico',3,'1234567890'+#8,60,true,'','Restaurar Cadastro','Qual o C�digo ?','');
  if fornec = '*' then exit;

  restauraCadastroProduto(fornec, true);
end;

procedure TForm2.RestaurarPadres1Click(Sender: TObject);
begin
  form22.Pgerais.Values['conf_ter'] := GravarConfig(form22.Pgerais.Values['conf_ter'],'', 10);
  form22.Pgerais.Values['conf_ter'] := GravarConfig(form22.Pgerais.Values['conf_ter'],'', 11);
  form22.Pgerais.Values['conf_ter'] := GravarConfig(form22.Pgerais.Values['conf_ter'],'', 12);

  //ShowMessage(form22.Pgerais.Values['conf_ter']);
  funcoes.gravaConfigTerminal(form22.Pgerais.Values['conf_ter']);

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Clear;
  dm.IBQuery1.SQL.Add('delete from config_tema');
  try
    dm.IBQuery1.ExecSQL;
    dm.IBQuery1.Transaction.Commit;
    ShowMessage('Algumas Configura��es Ser�o Acionadas Ap�s o Rein�cio do Sistema.');
  except
    dm.IBQuery1.Transaction.Rollback;
    ShowMessage('Ocorreu Um Erro. Tente Novamente!');

  end;
 funcoes.GeraTemas;
end;

procedure TForm2.Oramento1Click(Sender: TObject);
begin
  Form20 := Tform20.Create(Self);
  form20.tipoV := 'O';
  form20.Modo_Venda := false;
  Form20.LabelVenda.Caption := 'Or�amento';
  form20.origem := 1;
  form20.Modo_Orcamento := true;
  form20.saidaDeEstoque := false;
  funcoes.CtrlResize(tform(form20));
  Form20.ShowModal;
  form20.Free;
end;

procedure TForm2.Nfe1Click(Sender: TObject);
begin
 //nfeverda := tnfeverda.Create(self);
 //funcoes.CtrlResize(tform(nfeverda));
// NfeVenda := TNfeVenda.Create(self);
// nfevenda.Show;
end;

procedure TForm2.DuplicataFormContnuo1Click(Sender: TObject);
begin
  funcoes.IMPBOLETO_Duplicata;
end;

procedure TForm2.DuplicataNormal1Click(Sender: TObject);
begin
  funcoes.imprimeDuplicata();
end;


procedure TForm2.DuplicataUnica1Click(Sender: TObject);
var
  pag : integer;
  i : integer;
  total : currency;
  ulti_venc : TDateTime;
  fatura, sim : string;
begin
   nota := funcoes.dialogo('not',0,'0123456789'+#8,50,true,'',Application.Title,'Qual o N�mero da Nota de Pedido?','');
  //nota := funcoes.dialogo('generico',0,'0123456789'+#8,30,false,'',Application.Title,'Qual o N�mero da Nota de Pedido?','');
  if (nota = '*') or (nota = '')  then exit;

  sim := funcoes.dialogo('normal',0,'SN',30,false,'S',Application.Title,'Enviar para Impressora?(S/N)' + #13 + #10,'N');
  if (sim = '*') then exit;

  total := 0;
  dm.IBQuery2.Close;
  dm.IBQuery2.SQL.Clear;
  dm.IBQuery2.SQL.Add('select ende,bairro,cnpj,telres,telcom from registro');
  dm.IBQuery2.Open;

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select * from contasreceber where nota = '+nota+' order by vencimento');
  try
    dm.IBselect.Open;
  except
    dm.IBselect.Close;
    exit;
  end;

  if dm.IBselect.IsEmpty then
    begin
      dm.IBselect.Close;
      ShowMessage('N�o Existem D�bitos Com Este N�mero de Pedido!');
      exit;
    end;

  while not dm.IBselect.Eof do
    begin
      total := total + dm.IBselect.fieldbyname('valor').AsCurrency;
      dm.IBselect.Next;
    end;
  ulti_venc := dm.IBselect.fieldbyname('vencimento').AsDateTime;
  dm.IBselect.First;

  form19.RichEdit1.Clear;
  funcoes.CharSetRichEdit(form19.RichEdit1);

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Clear;
  dm.IBQuery1.SQL.Add('select * from duplicatas where nota = '+ nota);
  dm.IBQuery1.Open;

  if dm.IBQuery1.IsEmpty then
    begin
      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Clear;
      fatura := funcoes.novocod('dupli_unica');
      dm.IBQuery1.SQL.Add('insert into duplicatas(nota,numero) values('+nota+','+fatura+')');
      try
        dm.IBQuery1.ExecSQL;
        dm.IBQuery1.Transaction.Commit;
      except
      end;
    end
  else
    begin
      fatura := dm.IBQuery1.fieldbyname('numero').AsString;
      dm.IBQuery1.Close;
    end;

  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#218,'',#196,57)+funcoes.CompletaOuRepete(#194,#191,#196,21)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+funcoes.centraliza(form22.Pgerais.Values['empresa'],' ',56),'',' ',57)+funcoes.CompletaOuRepete(#179+'   F A T U R A',#179,' ',21)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+funcoes.centraliza(dm.IBQuery2.fieldbyname('ende').AsString+' - '+dm.IBQuery2.fieldbyname('bairro').AsString,' ',56),'',' ',57)+funcoes.CompletaOuRepete(#179+funcoes.centraliza(fatura,' ',19),#179,' ',21)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+funcoes.centraliza('CNPJ: '+dm.IBQuery2.fieldbyname('cnpj').AsString,' ',56),'',' ',57)+funcoes.CompletaOuRepete(#195,#180,#196,21)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+funcoes.centraliza('FONE: '+dm.IBQuery2.fieldbyname('TELRES').AsString+'   FAX: '+dm.IBQuery2.fieldbyname('TELCOM').AsString,' ',56),'',' ',57)+funcoes.CompletaOuRepete(#179+'R$:'+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',total),' ',15),#179,' ',21)+#13+#10))));
  //form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,'',' ',57)+funcoes.CompletaOuRepete(#179+'     '+FormatDateTime('dd/mm/yy',form22.datamov),#179,' ',21)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#195,#194,#196,12)+funcoes.CompletaOuRepete('',#194,#196,9)+funcoes.CompletaOuRepete('',#194,#196,6)+funcoes.CompletaOuRepete('',#194,#196,12)+funcoes.CompletaOuRepete('',#194,#196,12)+funcoes.CompletaOuRepete(''+#196+#196+#196+#196+#196+#196+#193,#194,#196,9)+funcoes.CompletaOuRepete('',#194,#196,6)+funcoes.CompletaOuRepete('',#180,#196,12)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+ '   DATA' ,#179,' ',12)+funcoes.CompletaOuRepete(' PEDIDO',#179,' ',9)+funcoes.CompletaOuRepete('PARC.',#179,' ',6)+funcoes.CompletaOuRepete('   VALOR',#179,' ',12)+funcoes.CompletaOuRepete('   DATA',#179,' ',12)+funcoes.CompletaOuRepete(' PEDIDO',#179,' ',9)+funcoes.CompletaOuRepete('PARC.',#179,' ',6)+funcoes.CompletaOuRepete('   VALOR',#179,' ',12)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#195,#193,#196,12)+funcoes.CompletaOuRepete('',#193,#196,9)+funcoes.CompletaOuRepete('',#193,#196,6)+funcoes.CompletaOuRepete('',#197,#196,12)+funcoes.CompletaOuRepete('',#193,#196,12)+funcoes.CompletaOuRepete('',#193,#196,9)+funcoes.CompletaOuRepete('',#193,#196,6)+funcoes.CompletaOuRepete('',#180,#196,12)+#13+#10))));
  dm.IBselect.FetchAll;
  pag := 0;
  while not dm.IBselect.Eof do
    begin
      pag := pag + 1;
      if pag = 2 then
        begin
          addRelatorioForm19(funcoes.CompletaOuRepete(' '+FormatDateTime('dd/mm/yy',dm.IBselect.fieldbyname('vencimento').AsDateTime)+'  '+funcoes.CompletaOuRepete('',nota,' ',8)+funcoes.CompletaOuRepete('',copy(dm.IBselect.fieldbyname('historico').AsString,length(dm.IBselect.fieldbyname('historico').AsString)-5,length(dm.IBselect.fieldbyname('historico').AsString)),' ',6)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',dm.IBselect.fieldbyname('valor').AsCurrency),' ',12),#179,' ',39)+#13+#10);
          pag := 0;
        end;
      if pag = 1 then addRelatorioForm19(funcoes.CompletaOuRepete(#179+FormatDateTime('dd/mm/yy',dm.IBselect.fieldbyname('vencimento').AsDateTime)+'  '+funcoes.CompletaOuRepete('',nota,' ',8)+funcoes.CompletaOuRepete('',copy(dm.IBselect.fieldbyname('historico').AsString,length(dm.IBselect.fieldbyname('historico').AsString)-5,length(dm.IBselect.fieldbyname('historico').AsString)),' ',6)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',dm.IBselect.fieldbyname('valor').AsCurrency),' ',12),#179,' ',39));
      dm.IBselect.Next;

    end;
  if pag = 1 then  addRelatorioForm19(funcoes.CompletaOuRepete('',#179,' ',39)+#13+#10);
  if form19.RichEdit1.Lines.Count < 24 then
    begin
      for i := form19.RichEdit1.Lines.Count to 23 do
        begin
          addRelatorioForm19(funcoes.CompletaOuRepete(#179,#179,' ',39)+funcoes.CompletaOuRepete('',#179,' ',39)+#13+#10);
        end;
    end;


  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Clear;
  dm.IBQuery1.SQL.Add('select * from cliente where cod ='+ dm.IBselect.fieldbyname('documento').AsString);
  dm.IBQuery1.Open;

  addRelatorioForm19(funcoes.CompletaOuRepete(#195,#193,#196,39)+funcoes.CompletaOuRepete('',#180,#196,39)+#13#10);
  //addRelatorioForm19(funcoes.CompletaOuRepete(#179+'  SACADO: ',#179,' ',78)+#13+#10);

  addRelatorioForm19(funcoes.CompletaOuRepete(#179+'  SACADO: '+dm.IBQuery1.fieldbyname('nome').AsString,#179,' ',78)+#13+#10);
  addRelatorioForm19(funcoes.CompletaOuRepete(#179+'  ENDERECO: '+dm.IBQuery1.fieldbyname('ende').AsString+' - '+dm.IBQuery1.fieldbyname('bairro').AsString,#179,' ',78)+#13+#10);
  addRelatorioForm19(funcoes.CompletaOuRepete(#179+'  CIDADE: '+dm.IBQuery1.fieldbyname('cid').AsString+' - '+dm.IBQuery1.fieldbyname('est').AsString + ' CEP: ' + dm.IBQuery1.fieldbyname('CEP').AsString + ' TEL: ' + dm.IBQuery1.fieldbyname('telres').AsString,#179 ,' ',78)+#13+#10);
  addRelatorioForm19(funcoes.CompletaOuRepete(#195,#194,#196,45)+funcoes.CompletaOuRepete('',#180,#196,33)+#13+#10);
  addRelatorioForm19(funcoes.CompletaOuRepete(#179+dm.IBQuery1.fieldbyname('cid').AsString+'-'+dm.IBQuery1.fieldbyname('est').AsString+', '+FormatDateTime('DD',form22.datamov)+' DE '+UpperCase(FormatDateTime('mmmm',form22.datamov))+' DE '+FormatDateTime('YYYY',form22.datamov),#179,' ',45)+funcoes.CompletaOuRepete('     VENCIMENTO: '+FormatDateTime('dd/mm/yy',ulti_venc),#179,' ',33)+#13+#10);
  addRelatorioForm19(funcoes.CompletaOuRepete(#192,#193,#196,45)+funcoes.CompletaOuRepete('',#217,#196,33)+#13+#10);

   form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('  '+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('  '+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('  '+#13+#10))));

      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#218,'',#196,57)+funcoes.CompletaOuRepete(#194,#191,#196,21)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,'',' ',57)+funcoes.CompletaOuRepete(#179+' NAT. DA OPERACAO',#179,' ',21)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+funcoes.centraliza(form22.Pgerais.Values['empresa'],' ',56),'',' ',57)+funcoes.CompletaOuRepete(#179+'  VENDA A PRAZO',#179,' ',21)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+funcoes.centraliza(dm.IBQuery2.fieldbyname('ende').AsString+' - '+dm.IBQuery2.fieldbyname('bairro').AsString,' ',56),'',' ',57)+funcoes.CompletaOuRepete(#195,#180,#196,21)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+funcoes.centraliza('CNPJ: '+dm.IBQuery2.fieldbyname('cnpj').AsString,' ',56),'',' ',57)+funcoes.CompletaOuRepete(#179+' DATA DE EMISSAO ',#179,' ',21)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+funcoes.centraliza('FONE: '+dm.IBQuery2.fieldbyname('TELRES').AsString+'   FAX: '+dm.IBQuery2.fieldbyname('TELCOM').AsString,' ',56),'',' ',57)+funcoes.CompletaOuRepete(#179+'     '+FormatDateTime('dd/mm/yy',form22.datamov),#179,' ',21)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#192,'',#196,57)+funcoes.CompletaOuRepete(#193,#217,#196,21)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#218,#191,#196,12)+funcoes.CompletaOuRepete(#218,#194,#196,10)+funcoes.CompletaOuRepete('',#194,#196,13)+funcoes.CompletaOuRepete('',#194,#196,12)+funcoes.CompletaOuRepete('',#194,#196,11)+funcoes.CompletaOuRepete('',#194,#196,12)+funcoes.CompletaOuRepete('',#191,#196,8)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+' EMITENTE ',#179,' ',12)+funcoes.CompletaOuRepete(#179+ ' FATURA ',#179,' ',10)+funcoes.CompletaOuRepete('    VALOR',#179,' ',13)+funcoes.CompletaOuRepete(' DUPLICATA ',#179,' ',12)+funcoes.CompletaOuRepete('VENCIMENTO',#179,' ',11)+funcoes.CompletaOuRepete(' JUROS R$',#179,' ',12)+funcoes.CompletaOuRepete(' MULTA ',#179,' ',8)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',12)+funcoes.CompletaOuRepete(#195,#197,#196,10)+funcoes.CompletaOuRepete('',#197,#196,13)+funcoes.CompletaOuRepete('',#197,#196,12)+funcoes.CompletaOuRepete('',#197,#196,11)+funcoes.CompletaOuRepete('',#197,#196,12)+funcoes.CompletaOuRepete('',#180,#196,8)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+'',#179,' ',12)+funcoes.CompletaOuRepete(#179+ funcoes.centraliza(fatura,' ',8),#179,' ',10)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',total)+#179,' ',13)+funcoes.CompletaOuRepete(funcoes.centraliza('1/ 1',' ', 11),#179,' ',12) + funcoes.CompletaOuRepete(' '+FormatDateTime('dd/mm/yy',dm.IBselect.fieldbyname('vencimento').AsDateTime)+' ',#179,' ',11)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',Arredonda(dm.IBselect.fieldbyname('valor').AsCurrency * StrToCurr(funcoes.ConverteNumerico(ConfParamGerais.Strings[6])) /100,2))+'/dia'+#179,' ',12)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',Arredonda(dm.IBselect.fieldbyname('valor').AsCurrency * 2/100,2))  +#179,' ',8)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',12)+funcoes.CompletaOuRepete(#192,#193,#196,10)+funcoes.CompletaOuRepete('',#193,#196,13)+funcoes.CompletaOuRepete('',#193,#196,12)+funcoes.CompletaOuRepete('',#193,#196,11)+funcoes.CompletaOuRepete('',#193,#196,12)+funcoes.CompletaOuRepete('',#217,#196,8)+#13+#10))));

      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',12)+funcoes.CompletaOuRepete(#218+#196+#196+#196+'DADOS DO SACADO',#191,#196,66)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',12)+funcoes.CompletaOuRepete(#179+ '  NOME: '+dm.IBQuery1.fieldbyname('nome').AsString,#179,' ',66)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',12)+funcoes.CompletaOuRepete(#179+ '  END.: '+dm.IBQuery1.fieldbyname('ende').AsString+' - '+dm.IBQuery1.fieldbyname('bairro').AsString ,#179,' ',66)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',12)+funcoes.CompletaOuRepete(#179+ '  CIDADE: '+dm.IBQuery1.fieldbyname('cid').AsString+' - '+dm.IBQuery1.fieldbyname('est').AsString ,#179,' ',66)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',12)+funcoes.CompletaOuRepete(#179+ '  PRACA DE PAGTO: '+dm.IBQuery1.fieldbyname('cid').AsString+' - '+dm.IBQuery1.fieldbyname('est').AsString ,#179,' ',66)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',12)+funcoes.CompletaOuRepete(#179+ '  CPF/CNPJ: '+dm.IBQuery1.fieldbyname('CNPJ').AsString + ' TEL: ' + dm.IBQuery1.fieldbyname('TELRES').AsString,#179,' ',66)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',12)+funcoes.CompletaOuRepete(#192,#217,#196,66)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',12)+funcoes.CompletaOuRepete(#218+#196+#196+#196+'VALOR POR EXTENSO',#191,#196,66)+#13+#10))));
      funcoes.QuebraLinhas(funcoes.CompletaOuRepete(#179,#179,' ',12)+#179,#179,UpperCase(funcoes.valorPorExtenso(total)),78);
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',12)+funcoes.CompletaOuRepete(#195,#180,#196,66)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',12)+funcoes.CompletaOuRepete(#179+'      RECONHECO A EXATIDAO DESTA DUPLICATA DE VENDA MERCANTIL NA',#179,' ',66)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',12)+funcoes.CompletaOuRepete(#179+'IMPORTANCIA ACIMA QUE PAGAREI A EMPRESA EMITENTE DA MESMA  OU  A',#179,' ',66)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',12)+funcoes.CompletaOuRepete(#179+'SUA ORDEM NA PRACA E VENCIMENTO ACIMA MENCIONADOS.',#179,' ',66)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',12)+funcoes.CompletaOuRepete(#179,#179,' ',66)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',12)+funcoes.CompletaOuRepete(#179 +'  ACEITE: '+ FormatDateTime('dd/mm/yy',form22.datamov) ,#179,' ',66)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#192,#217,#196,12)+funcoes.CompletaOuRepete(#192+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+'Assinatura do Sacado',#217,#196,66)+#13+#10))));

  dm.IBselect.Close;
  dm.IBQuery2.Close;
  dm.IBQuery1.Close;

  if sim = 'S' then imprime.textxArq('')
    else form19.ShowModal;
end;

procedure TForm2.NotaPromissoria1Click(Sender: TObject);
begin
  funcoes.imprimePromissoria();
end;

procedure TForm2.BoletodeCobrana1Click(Sender: TObject);
begin
  //imprime.test := 1;
  nota := funcoes.dialogo('not',0,'0123456789'+#8,50,true,'',Application.Title,'Qual o N�mero da Nota de Pedido?','');
  if (nota = '*') or (nota = '')  then exit;

  funcoes.GeraCarne(nota,ConfParamGerais.Strings[8]);
end;

procedure TForm2.BoletodeCobrana2Click(Sender: TObject);
begin
  funcoes.IMPBOLETO;
end;

procedure TForm2.btnEntradaSimplesClick(Sender: TObject);
begin
  RequisioDepsito1.Click;
end;

procedure TForm2.CancelarParcelamento1Click(Sender: TObject);
 var
   sim, parcelamento : string;
begin
  nota := funcoes.dialogo('generico',0,'0123456789'+#8,30,false,'',Application.Title,'Qual o N�mero da Nota de Pedido?','');
  if (nota = '*') or (nota = '')  then exit;


  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select * from contasreceber where nota = '+nota);
  try
    dm.IBselect.Open;
  except
    dm.IBselect.Close;
    exit;
  end;

  if dm.IBselect.IsEmpty then
    begin
      dm.IBselect.Close;
      ShowMessage('N�o Existem D�bitos Com Este N�mero de Pedido!');
      exit;
    end;
  parcelamento := '';
  while not dm.IBselect.Eof do
    begin
      parcelamento := parcelamento + dm.IBselect.fieldbyname('historico').AsString+#13+#10;
      dm.IBselect.Next;
    end;
  sim := funcoes.dialogo('normal',0,'SN',30,false,'S',Application.Title,'Deseja Cancelar?'+#13+#10+parcelamento,'S');

end;

procedure TForm2.RecibodePagamento1Click(Sender: TObject);
var
  cliente,fatura,his,total, sim : string;
begin
  cliente := funcoes.dialogo('generico',0,'1234567890,.'+#8,50,false,'',Application.Title,'Qual o C�d do Cliente?','');
  if cliente = '*' then exit;

  if (cliente = '') then cliente := funcoes.localizar('Localizar Cliente','cliente','cod,nome','cod','','nome','nome',true,false,false,'',0,nil);
  if (cliente = '*') or (cliente = '') then exit;

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select nome,ende,bairro,cnpj from cliente where cod = '+cliente);
  dm.IBselect.Open;

  if dm.IBselect.IsEmpty then
    begin
      dm.IBselect.Close;
      ShowMessage('Cliente N�o Encontrado.');
      exit;
    end;


  his := funcoes.dialogo('not',0,'',50,true,'',Application.Title,'Confirme o Hist�rico:','');
  if his = '*' then exit;

  total := funcoes.dialogo('numero',0,'',2,true,'S',Application.Title,'Qual o Valor?','0,00');
  if total = '*' then exit;

  sim := funcoes.dialogo('normal',0,'SN',30,false,'S',Application.Title,'Enviar para Impressora?(S/N)' + #13 + #10,'N');
  if (sim = '*') then exit;


  dm.IBQuery2.Close;
  dm.IBQuery2.SQL.Clear;
  dm.IBQuery2.SQL.Add('select ende,bairro,cnpj,telres,telcom,cid,est from registro');
  dm.IBQuery2.Open;

  form19.RichEdit1.Clear;
  funcoes.CharSetRichEdit(form19.RichEdit1);

  //fatura := '2';
  fatura := funcoes.novocod('RECIBO_PAGA');

  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#218,'',#196,57)+funcoes.CompletaOuRepete(#194,#191,#196,21)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+funcoes.centraliza(form22.Pgerais.Values['empresa'],' ',56),'',' ',57)+funcoes.CompletaOuRepete(#179+'   R E C I B O',#179,' ',21)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+funcoes.centraliza(dm.IBQuery2.fieldbyname('ende').AsString+' - '+dm.IBQuery2.fieldbyname('bairro').AsString,' ',56),'',' ',57)+funcoes.CompletaOuRepete(#179+funcoes.centraliza(fatura,' ',19),#179,' ',21)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+funcoes.centraliza('CNPJ: '+dm.IBQuery2.fieldbyname('cnpj').AsString,' ',56),'',' ',57)+funcoes.CompletaOuRepete(#179,#179,' ',21)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+funcoes.centraliza('FONE: '+dm.IBQuery2.fieldbyname('TELRES').AsString+'   FAX: '+dm.IBQuery2.fieldbyname('TELCOM').AsString,' ',56),'',' ',57)+funcoes.CompletaOuRepete(#179+'R$:'+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',StrToCurr(total)),' ',15),#179,' ',21)+#13+#10))));
  //form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,'',' ',57)+funcoes.CompletaOuRepete(#179+'     '+FormatDateTime('dd/mm/yy',form22.datamov),#179,' ',21)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#195,'',#196,12)+funcoes.CompletaOuRepete('','',#196,9)+funcoes.CompletaOuRepete('','',#196,6)+funcoes.CompletaOuRepete('','',#196,12)+funcoes.CompletaOuRepete('','',#196,12)+funcoes.CompletaOuRepete(''+#196+#196+#196+#196+#196+#196+#193,'',#196,9)+funcoes.CompletaOuRepete('','',#196,6)+funcoes.CompletaOuRepete('',#180,#196,12)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+'  RECEBEMOS DE '+FORM22.Pgerais.Values['empresa'],'COD.: '+cliente+#179,' ',78)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',78)+#13+#10))));
  funcoes.QuebraLinhas(#179,#179,' A IMPORTANCIA DE '+UpperCase(funcoes.valorPorExtenso(StrToCurr(total))),78);
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',78)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+' REFERENTE A: ',#179,' ',78)+#13+#10))));
  funcoes.QuebraLinhas(#179,#179,' '+FormatDateTime('dd/mm/yy',form22.datamov)+'  '+his+'          '+FormatCurr('#,###,###0.00',StrToCurr(total)),78);
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',78)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',78)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',78)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',78)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',78)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',78)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',78)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#195,#180,#196,78)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+' EMITENTE: '+DM.IBselect.fieldbyname('nome').AsString,#179,' ',78)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+' ENDERECO: '+DM.IBselect.fieldbyname('ende').AsString+' - '+DM.IBselect.fieldbyname('bairro').AsString,#179,' ',78)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+' CPF/CNPJ: '+DM.IBselect.fieldbyname('cnpj').AsString,#179,' ',78)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#195,#194,#196,45)+funcoes.CompletaOuRepete('',#180,#196,33)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',45)+funcoes.CompletaOuRepete('',#179,' ',33)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+'   '+dm.IBQuery2.fieldbyname('cid').AsString+' - '+dm.IBQuery2.fieldbyname('est').AsString+', '+FormatDateTime('dd',form22.datamov)+' DE '+UpperCase(FormatDateTime('MMMM',form22.datamov))+' DE '+FormatDateTime('YYYY',form22.datamov),#179,' ',45)+funcoes.CompletaOuRepete('',#179,' ',33)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',45)+funcoes.CompletaOuRepete('            Assinatura',#179,' ',33)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#192,#193,#196,45)+funcoes.CompletaOuRepete('',#217,#196,33)+#13+#10))));
  DM.IBselect.Close;
  dm.IBQuery2.Close;
  dm.IBQuery1.Close;

  if sim = 'S' then imprime.textxArq('')
    else form19.ShowModal;
end;

procedure TForm2.ReciboAvulso1Click(Sender: TObject);
var cliente,fatura,his,total,venc, sim : string;
begin
  cliente := funcoes.dialogo('generico',0,'1234567890,.'+#8,50,false,'',Application.Title,'Qual o C�d do Cliente?','');
  if cliente = '*' then exit;
  if (cliente = '') then cliente := funcoes.localizar('Localizar Cliente','cliente','cod,nome','cod','','nome','nome',true,false,false,'',0,nil);
  if (cliente = '*') or (cliente = '') then exit;

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select nome,ende,bairro,cnpj from cliente where cod = '+cliente);
  dm.IBselect.Open;

  if dm.IBselect.IsEmpty then
    begin
      dm.IBselect.Close;
      ShowMessage('Cliente N�o Encontrado.');
      exit;
    end;


  his := funcoes.dialogo('not',0,'',50,true,'',Application.Title,'Confirme o Hist�rico:','');
  if his = '*' then
    begin
      dm.IBselect.Close;
      exit;
    end;

  total := funcoes.dialogo('numero',0,'',2,true,'S',Application.Title,'Qual o Valor?','0,00');
  if total = '*' then
    begin
      dm.IBselect.Close;
      exit;
    end;

  venc  := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Confirme o Vencimento:',formatadataddmmyy(form22.datamov));
  if venc = '*' then
    begin
      dm.IBselect.Close;
      exit;
    end;

  sim := funcoes.dialogo('normal',0,'SN',30,false,'S',Application.Title,'Enviar para Impressora?(S/N)' + #13 + #10,'N');
  if (sim = '*') then exit;

  form19.RichEdit1.Clear;
  funcoes.CharSetRichEdit(form19.RichEdit1);

  //fatura := '2';
  if ((form22.Pgerais.Values['nota'] = 'T') or (form22.Pgerais.Values['nota'] = 'R') or (form22.Pgerais.Values['nota'] = 'D')) then
    begin
      addRelatorioForm19(funcoes.CompletaOuRepete(#218,#191,#196, 40) + CRLF);
      addRelatorioForm19(#179 + funcoes.centraliza(form22.Pgerais.Values['empresa'],' ',38) + #179 + CRLF);
      addRelatorioForm19(funcoes.CompletaOuRepete(#195, #180, #196, 40) + CRLF);
      addRelatorioForm19(#179 + funcoes.centraliza('DATA: ' + formataDataDDMMYY(form22.datamov) + ' HORA: ' + FormatDateTime('hh:mm:ss', now),' ',38) + #179 + CRLF);
      addRelatorioForm19(funcoes.CompletaOuRepete(#195, #180, #196, 40) + CRLF);
      addRelatorioForm19(#179 + funcoes.centraliza('     R E C I B O   VALOR: ' + formataCurrency(StrToCurrDef(total, 0)),' ',38) + #179 + CRLF);
      addRelatorioForm19(funcoes.CompletaOuRepete(#195, #180, #196, 40) + CRLF);
      addRelatorioForm19(funcoes.CompletaOuRepete(#179,#179, ' ', 40) + CRLF);
      addRelatorioForm19(funcoes.CompletaOuRepete(#179 + 'RECEBEMOS DE: ',#179, ' ', 40) + CRLF);
      addRelatorioForm19(funcoes.CompletaOuRepete(#179 + copy(dm.IBselect.fieldbyname('nome').AsString, 1, 38),#179, ' ', 40) + CRLF);
      addRelatorioForm19(funcoes.CompletaOuRepete(#179,#179, ' ', 40) + CRLF);
      addRelatorioForm19(funcoes.CompletaOuRepete(#179 + 'A IMPORTANCIA DE R$ ' + formataCurrency(StrToCurrDef(total, 0)),#179, ' ', 40) + CRLF);
      addRelatorioForm19(funcoes.CompletaOuRepete(#179,#179, ' ', 40) + CRLF);
      addRelatorioForm19(funcoes.CompletaOuRepete(#179 + 'REFERENTE A:',#179, ' ', 40) + CRLF);
      addRelatorioForm19(funcoes.CompletaOuRepete(#179 + COPY(HIS, 1, 30), formataCurrency(StrToCurrDef(total, 0)) + #179, ' ', 40) + CRLF);
      addRelatorioForm19(funcoes.CompletaOuRepete(#195, #180, #196, 40) + CRLF);
      addRelatorioForm19(funcoes.CompletaOuRepete(#179,#179, ' ', 40) + CRLF);
      addRelatorioForm19(funcoes.CompletaOuRepete(#179 + 'RECEBIDO POR:',#179, ' ', 40) + CRLF);
      addRelatorioForm19(funcoes.CompletaOuRepete(#179,#179, ' ', 40) + CRLF);
      addRelatorioForm19(funcoes.CompletaOuRepete(#179,#179, ' ', 40) + CRLF);
      addRelatorioForm19(funcoes.CompletaOuRepete(#192,#217,#196, 40) + CRLF);
    end
  else
    begin
      fatura := funcoes.novocod('RECIBO_PAGA');
      dm.IBQuery2.Close;
      dm.IBQuery2.SQL.Clear;
      dm.IBQuery2.SQL.Add('select ende,bairro,cnpj,telres,telcom,cid,est from registro');
      dm.IBQuery2.Open;

      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#218,'',#196,57)+funcoes.CompletaOuRepete(#194,#191,#196,21)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+funcoes.centraliza(form22.Pgerais.Values['empresa'],' ',56),'',' ',57)+funcoes.CompletaOuRepete(#179+'   R E C I B O',#179,' ',21)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+funcoes.centraliza(dm.IBQuery2.fieldbyname('ende').AsString+' - '+dm.IBQuery2.fieldbyname('bairro').AsString,' ',56),'',' ',57)+funcoes.CompletaOuRepete(#179+funcoes.centraliza(fatura,' ',19),#179,' ',21)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+funcoes.centraliza('CNPJ: '+dm.IBQuery2.fieldbyname('cnpj').AsString,' ',56),'',' ',57)+funcoes.CompletaOuRepete(#179,#179,' ',21)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+funcoes.centraliza('FONE: '+dm.IBQuery2.fieldbyname('TELRES').AsString+'   FAX: '+dm.IBQuery2.fieldbyname('TELCOM').AsString,' ',56),'',' ',57)+funcoes.CompletaOuRepete(#179+'R$:'+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',StrToCurr(total)),' ',15),#179,' ',21)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#195,'',#196,12)+funcoes.CompletaOuRepete('','',#196,9)+funcoes.CompletaOuRepete('','',#196,6)+funcoes.CompletaOuRepete('','',#196,12)+funcoes.CompletaOuRepete('','',#196,12)+funcoes.CompletaOuRepete(''+#196+#196+#196+#196+#196+#196+#193,'',#196,9)+funcoes.CompletaOuRepete('','',#196,6)+funcoes.CompletaOuRepete('',#180,#196,12)+#13+#10))));

      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+' RECEBEMOS DE '+DM.IBselect.fieldbyname('nome').AsString,'COD.: '+cliente+#179,' ',78)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',78)+#13+#10))));
      funcoes.QuebraLinhas(#179,#179,' A IMPORTANCIA DE '+UpperCase(funcoes.valorPorExtenso(StrToCurr(total))),78);
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',78)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+' REFERENTE A: ',#179,' ',78)+#13+#10))));
      funcoes.QuebraLinhas(#179,#179,' '+FormatDateTime('dd/mm/yy',StrToDate(venc))+'  '+his+'          '+FormatCurr('#,###,###0.00',StrToCurr(total)),78);
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',78)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',78)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',78)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',78)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',78)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',78)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',78)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#195,#194,#196,30)+funcoes.CompletaOuRepete('',#194,#196,15)+funcoes.CompletaOuRepete('',#180,#196,33)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+' CHEQUE Nr.:',#179,' ',30)+funcoes.CompletaOuRepete(' BANCO:',#179,' ',15)+funcoes.CompletaOuRepete(' CONTA:',#179,' ',33)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',30)+funcoes.CompletaOuRepete('',#179,' ',15)+funcoes.CompletaOuRepete('',#179,' ',33)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#195+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#193,#197,#196,45)+funcoes.CompletaOuRepete('',#180,#196,33)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',45)+funcoes.CompletaOuRepete('',#179,' ',33)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+'   '+dm.IBQuery2.fieldbyname('cid').AsString+' - '+dm.IBQuery2.fieldbyname('est').AsString+', '+FormatDateTime('dd',form22.datamov)+' DE '+UpperCase(FormatDateTime('MMMM',form22.datamov))+' DE '+FormatDateTime('YYYY',form22.datamov),#179,' ',45)+funcoes.CompletaOuRepete('',#179,' ',33)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',45)+funcoes.CompletaOuRepete('            Assinatura',#179,' ',33)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#192,#193,#196,45)+funcoes.CompletaOuRepete('',#217,#196,33)+#13+#10))));
    end;
  DM.IBselect.Close;
  dm.IBQuery2.Close;
  dm.IBQuery1.Close;

  if sim = 'S' then imprime.textxArq('')
    else form19.ShowModal;
end;

procedure TForm2.Clientes1Click(Sender: TObject);
var
  completo,concessao,ini,fim,ordem,localidade,rota,todos,cond : string;
  b, fi : integer;
begin
   b := 65;
   cond := '';
  completo := funcoes.dialogo('generico',0,'SN',0,false,'S',Application.Title,'Imprimir Relat�rio Completo com Endere�os?','S');
  if completo = '*' then exit;
  {concessao := funcoes.dialogo('generico',0,'SN',0,false,'S',Application.Title,'Imprimir Campo Concess�o?','S');
  if concessao = '*' then exit;
  ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial de Movimento?',formatadataddmmyy(StartOfTheMonth(form22.datamov)));
  if ini = '*' then exit;
  fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final de Movimento?',DateToStr(EndOfTheMonth(form22.datamov)));
  if fim = '*' then exit;
  ordem := funcoes.dialogo('generico',0,'1234567890',0,false,'S',Application.Title,'Qual a Ordem (1-Alfab�tica, 2-Data Ultima Compra, 3-Valor de Compra) ?','1');
  if ordem = '*' then exit;
  }localidade := funcoes.dialogo('normal',0,'1234567890',0,false,'',Application.Title,'Qual a Localidade ?','');
  if localidade = '*' then exit;
  rota := funcoes.dialogo('generico',0,'1234567890'+#8,0,false,'S',Application.Title,'Qual a Rota ?','');
  if rota = '*' then exit;
  {todos := funcoes.dialogo('generico',0,'SN',0,false,'S',Application.Title,'Imprimir Todos os Clientes (S-Sim, N-Somente Inativos) ?','S');
  if todos = '*' then exit;
   }


  if (localidade <> '') and (rota <> '')  then cond := ' (rota = '+rota+') and (localidade like '+QuotedStr('%'+localidade+'%')+')';
  if (localidade <> '') and (rota = '') then  cond := ' (cid like '+QuotedStr('%'+localidade+'%')+')';
  if (localidade = '') and (rota <> '') then  cond := ' (rota = '+rota+')';

  if cond <> '' then cond := ' where '+ cond;

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select * from cliente '+cond+' order by nome');
  dm.IBselect.Open;
  dm.IBselect.FetchAll;

  form19.RichEdit1.Clear;
  addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80)+#13+#10);
  addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',form22.datamov),' ',80)+#13+#10);
  addRelatorioForm19(funcoes.CompletaOuRepete('RELAT�RIO DE CLIENTES ','HORA: '+FormatDateTime('tt',now),' ',80)+#13+#10);
  addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80)+#13+#10);

  fi := dm.IBselect.RecordCount;
  funcoes.informacao(i, fi, 'Aguarde, Gerando Relat�rio...', true, false, 5);

  while not dm.IBselect.Eof do
    begin
      funcoes.informacao(dm.IBselect.RecNo, fi, 'Aguarde, Gerando Relat�rio...', false, false, 5);
      if form19.RichEdit1.Lines.Count + 4 >= b then
        begin
          b := b + 75;
          if completo = 'N' then  addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80)+#12+#13+#10)
            else addRelatorioForm19(' '+#12+#13+#10);
          addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80)+#13+#10);
          addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',form22.datamov),' ',80)+#13+#10);
          addRelatorioForm19(funcoes.CompletaOuRepete('RELAT�RIO DE CLIENTES ','HORA: '+FormatDateTime('tt',now),' ',80)+#13+#10);
          addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80)+#13+#10);
        end;

   if completo = 'N' then  addRelatorioForm19(funcoes.CompletaOuRepete(dm.IBselect.fieldbyname('cod').AsString,'',' ',6)+' '+funcoes.CompletaOuRepete(dm.IBselect.fieldbyname('nome').AsString,'',' ',40)+'  '+funcoes.CompletaOuRepete(dm.IBselect.fieldbyname('telres').AsString,'',' ',13)+#13+#10)
   else
     begin
      addRelatorioForm19(' '+#13+#10);
      if (dm.IBselect.FieldByName('tipo').AsString = '1') or (dm.IBselect.FieldByName('tipo').AsString = '0') then //pessoa fisica
        begin
          addRelatorioForm19(funcoes.CompletaOuRepete(dm.IBselect.fieldbyname('cod').AsString,'',' ',6)+' '+funcoes.CompletaOuRepete(dm.IBselect.fieldbyname('nome').AsString,'',' ',40)+#13+#10);
          addRelatorioForm19('CPF: '+funcoes.CompletaOuRepete(dm.IBselect.fieldbyname('cnpj').AsString,'',' ',22)+' Doc. Ident.: '+funcoes.CompletaOuRepete(dm.IBselect.fieldbyname('ci').AsString,'',' ',10)+#13+#10);
          addRelatorioForm19(dm.IBselect.fieldbyname('ende').AsString+' - '+dm.IBselect.fieldbyname('bairro').AsString+#13+#10);
          addRelatorioForm19('OBS: '+dm.IBselect.fieldbyname('obs').AsString+#13+#10);
          addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80)+#13+#10);
        end //produtor rural
       else if dm.IBselect.FieldByName('tipo').AsString = '6' then
         begin
           addRelatorioForm19(funcoes.CompletaOuRepete(dm.IBselect.fieldbyname('cod').AsString,'',' ',6)+' '+funcoes.CompletaOuRepete(dm.IBselect.fieldbyname('nome').AsString,'',' ',40)+#13+#10);
           addRelatorioForm19('CPF: '+funcoes.CompletaOuRepete(dm.IBselect.fieldbyname('cnpj').AsString,'',' ',22)+' INSC. EST.: '+funcoes.CompletaOuRepete(dm.IBselect.fieldbyname('ies').AsString,'',' ',12)+#13+#10);
           addRelatorioForm19(dm.IBselect.fieldbyname('ende').AsString+' - '+dm.IBselect.fieldbyname('bairro').AsString+#13+#10);
           addRelatorioForm19('OBS: '+dm.IBselect.fieldbyname('obs').AsString+#13+#10);
           addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80)+#13+#10);
         end
       else //jur�dico
         begin
           addRelatorioForm19(funcoes.CompletaOuRepete(dm.IBselect.fieldbyname('cod').AsString,'',' ',6)+' '+funcoes.CompletaOuRepete(dm.IBselect.fieldbyname('nome').AsString,'',' ',40)+#13+#10);
           addRelatorioForm19('CNPJ: '+funcoes.CompletaOuRepete(dm.IBselect.fieldbyname('cnpj').AsString,'',' ',22)+' INSC. EST.: '+funcoes.CompletaOuRepete(dm.IBselect.fieldbyname('ies').AsString,'',' ',12)+#13+#10);
           addRelatorioForm19(dm.IBselect.fieldbyname('ende').AsString+' - '+dm.IBselect.fieldbyname('bairro').AsString+#13+#10);
           addRelatorioForm19('OBS: '+dm.IBselect.fieldbyname('obs').AsString+#13+#10);
           addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80)+#13+#10);
         end;
       end;
      dm.IBselect.Next;
    end;
   //addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80)+#13+#10);
   funcoes.informacao(i, fi, 'Aguarde, Gerando Relat�rio...', false, true, 5);
   funcoes.CharSetRichEdit(form19.RichEdit1);
   form19.ShowModal;
end;

procedure TForm2.CodOperaes1Click(Sender: TObject);
begin
  cadcp := tcadcp.Create(self);
  funcoes.CtrlResize(tform(cadcp));
  cadcp.ShowModal;
  cadcp.Free;
end;

procedure TForm2.SitTribNotafisal1Click(Sender: TObject);
var
  temp : string;
begin
  temp := funcoes.dialogo('normal',0,'SN'+#8,0,false,'S','Control For Windows','Aten��o, altere esta tabela somente com orienta��o de uma pessoa'+#13'autorizada e que conhe�a a Legisla��o do ICMS do seu estado. Qualquer'+#13+'muda�a nos dados desta tabela alterar� o calculo do ICMS na emiss�o'+#13+'da Nota Fiscal. Estes dados n�o alteram a emiss�o de Cupom Fiscal,'+#13+'pois o equipamento Fiscal j� vem programado pelo revendedor'+#13+'autorizado. Deseja Continuar (S/N) ?','N');
  if (temp = 'N') or (temp = '*') then exit;

  aliq1 := Taliq1.Create(self);
  funcoes.CtrlResize(tform(aliq1));
  aliq1.ShowModal;
  aliq1.Free;
end;

procedure TForm2.NotaFiscalEletrnica1Click(Sender: TObject);
begin
  funcoes.emiteNfe('', false);
end;

procedure TForm2.StatusdoServoo1Click(Sender: TObject);
begin
  NfeVenda := TNfeVenda.Create(self);
  try
    if ConfParamGerais[36] <> 'N' then
      begin
        fabric := NfeVenda.StatusServico;
        ShowMessage(fabric);
      end
    else NfeVenda.StatusServico1;
  except
    on e:exception do
      begin
        if funcoes.Contido('LENGTH', UpperCase(e.Message)) then
          begin
            //NfeVenda.GeraXml;
          END;
      end;
  end;

  NfeVenda.Free;
end;

procedure TForm2.CancelarNFe1Click(Sender: TObject);
begin
  NfeVenda := TNfeVenda.Create(self);
  try
    if ConfParamGerais[36] <> 'N' then NfeVenda.CancelamentoNFe
      else NfeVenda.CancelamentoNFe1;
  except
    on e:exception do
      begin
        if funcoes.Contido('LENGTH', UpperCase(e.Message)) then
          begin
            //NfeVenda.GeraXml;
          END;
      end;
  end;
  NfeVenda.Free;
end;

procedure TForm2.ConsultarNFe1Click(Sender: TObject);
begin
  NfeVenda := TNfeVenda.Create(self);
  try
    if ConfParamGerais[36] <> 'N' then NfeVenda.ConsultarNFe
      else NfeVenda.ConsultarNFe1;
  except
    on e:exception do
      begin
        if funcoes.Contido('LENGTH', UpperCase(e.Message)) then
          begin
            //NfeVenda.GeraXml;
          END;
      end;
  end;
  NfeVenda.Free;
end;

procedure TForm2.FormasdePagamento1Click(Sender: TObject);
var
  formpagto, vende, total, conf, pag, sim : string;
  valor, entrada, totVenda, recebido, entradaOrigi : currency;
  err1, ini : integer;
  pagtos : TStringList;
begin
  while true do begin
    nota := funcoes.dialogo('generico',0,'1234567890'+#8,50, false,'',Application.Title,'Qual a Nota de Venda?','');
    if nota = '*' then exit;

  if nota = '' then
    begin
      dm.IBQuery2.Close;
      dm.IBQuery2.SQL.Clear;
      dm.IBQuery2.SQL.Add('select v.nota, v.data, v.codhis as formapagto, a.nome as vendedor, v.desconto, v.total from venda v left join  vendedor a on (v.vendedor = a.cod) where (v.cancelado = 0) and ((v.ok = '+ QuotedStr('') +') or (v.ok = '+ QuotedStr('N') +' )) order by v.nota desc');
      dm.IBQuery2.Open;

      dm.IBselect.Close;
      dm.IBselect.SQL.Clear;
      dm.IBselect.SQL.Add('select p.cod, c.nome, p.quant, p.p_venda, p.total from item_venda p, produto c where (c.cod = p.cod) and (p.nota = :nota)');
      dm.IBselect.ParamByName('nota').AsString := dm.IBQuery2.fieldbyname('nota').AsString;
      dm.IBselect.Open;

      form44 := tform44.Create(self);
      form44.opcao := 1;
      form44.Caption := 'Vendas Pendentes';
      funcoes.FormataCampos(dm.ibquery2,2,'',2);
      funcoes.FormataCampos(dm.ibselect,2,'',2);

      form44.DBGrid1.DataSource := dm.entrada;
      form44.DBGrid2.DataSource := dm.ds1;
      form44.ShowModal;

      if funcoes.retornoLocalizar = '*' then begin
        funcoes.retornoLocalizar := '';
        form44.Free;
        exit;
      end;

      if funcoes.retornoLocalizar = '' then begin
        form44.Free;
        exit;
      end;

      try
        nota := form44.retorno.Strings[2];
      except
        form44.Free;
        exit;
      end;

      dm.IBselect.Close;
      dm.IBselect.SQL.Clear;
      dm.IBselect.SQL.Add('select total, codhis, entrada from venda where (nota = :nota) and (cancelado = 0)');
      dm.IBselect.ParamByName('nota').AsString := nota;
      dm.IBselect.Open;

      valor        := dm.IBselect.fieldbyname('total').AsCurrency;
      formpagto    := dm.IBselect.fieldbyname('codhis').AsString;
      entradaOrigi := dm.IBselect.fieldbyname('entrada').AsCurrency;
      pag := formpagto;
      dm.IBselect.Close;

      form44.Free;
      if nota = '*' then exit;
    end
  else
    begin
      dm.IBselect.Close;
      dm.IBselect.SQL.Clear;
      dm.IBselect.SQL.Add('select total, codhis, entrada from venda where (nota = :nota) and (cancelado = 0)');
      dm.IBselect.ParamByName('nota').AsString := nota;
      dm.IBselect.Open;

      if dm.IBselect.IsEmpty then
        begin
          ShowMessage('A Venda ' + nota + ' N�o Existe');
          dm.IBselect.Close;
          exit;
        end;

      valor        := dm.IBselect.fieldbyname('total').AsCurrency;
      formpagto    := dm.IBselect.fieldbyname('codhis').AsString;
      entradaOrigi := dm.IBselect.fieldbyname('entrada').AsCurrency;
      pag := formpagto;
      dm.IBselect.Close;
    end;

     err1    := 0;
     total   := '0';
     entrada := 0;
     pagtos := TStringList.Create;
     totVenda := valor;

      while true do
        begin
          formpagto := funcoes.LerFormPato(iif(StrToIntDef(formpagto, 0) -1 >= 0, StrToIntDef(formpagto, 0) -1, 0) ,'', true, formpagto);
          if formpagto = '*' then exit;

          if (StrNum(pag)  <> '2') and (StrNum(formpagto) = '2') then
            begin
              ShowMessage('Escolha outra forma de Pagamento');
              err1 := err1 + 1;
              pagtos.Clear;
              exit;
            end;

          if ((pag = '2')) then
            begin
              if formpagto <> '2' then
                begin
                  ShowMessage('Forma de Pagamento a A PRAZO n�o pode ser trocada no recebimento. '+ #13 +' Escolha outra forma de Pagamento');
                  err1 := err1 + 1;
                  exit;
                end;
            end;

          if err1 = 2 then
            begin
              MessageDlg('Forma de Pagamento Inv�lida, Favor Escolha Outra Forma de Pagamento!', mtInformation, [mbOK],1);
              exit;
            end;

          total := funcoes.dialogo('numero',0,'1234567890,.'+#8,2,false,'','Control For Windows','Qual o Valor Recebido?',FormatCurr('#,###,###0.00',valor));
          if total = '*' then Break;

          {if (Contido('-'+pag + '-', '-1-2-') = false) and (formpagto = '1') then
            begin
              entrada := entrada + StrToCurrDef(total, 0);
            end;}

          pagtos.Add(formpagto + '=' + total);

          valor := valor - StrToCurrDef(total, 0);

          if valor <= 0 then break;
        end;

      entrada  := 0;
      recebido := 0;

      if pagtos.Count >= 2 then begin
        for ini := 0 to pagtos.Count -1 do begin
          if pagtos.Names[ini] = '1' then entrada := entrada + StrToCurrDef(pagtos.ValueFromIndex[ini],0);
          if (pagtos.Names[ini] <> '2') and (pagtos.Names[ini] <> '1') then formpagto := pagtos.Names[ini];

          recebido := recebido + StrToCurrDef(pagtos.ValueFromIndex[ini],0);
        end;
      end
     else begin
       for ini := 0 to pagtos.Count -1 do begin
          recebido := recebido + StrToCurrDef(pagtos.ValueFromIndex[ini],0);
       end;
     end;

      if entrada > totVenda then entrada := totVenda;
      if entrada = totVenda then entrada := 0;

      if (recebido) > totVenda then
      funcoes.mostraValorDinheiroTela(recebido - totVenda);
    
      conf := '';
      conf := funcoes.dialogo('generico',25,'NS',25,true,'S',Application.Title,'Confirma O Recebimento da Venda '+ nota +' ?','S');
      if conf = '*' then exit;

      if pag = '2' then
        begin
          entrada   := entradaOrigi;
          formpagto := pag;
        end;

      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Clear;
      dm.IBQuery1.SQL.Add('update venda set ok =' + QuotedStr(conf) + ', codhis = :codhis, entrada = :entrada, usuario = :usu where nota = :nota' );
      dm.IBQuery1.ParamByName('nota').AsString      := nota;
      dm.IBQuery1.ParamByName('codhis').AsString    := formpagto;
      dm.IBQuery1.ParamByName('entrada').AsCurrency := entrada;
      dm.IBQuery1.ParamByName('usu').AsString       := form22.codusario;
      dm.IBQuery1.ExecSQL;

      try
        dm.IBQuery1.Transaction.Commit;
        dm.IBQuery1.Close;

        if MessageBox(handle, 'Deseja Emitir Cupom para Esta Venda', 'Cupom Eletr�nico', MB_YESNO + MB_DEFBUTTON2) = idyes then
          begin
            form22.enviNFCe(nota, '', recebido);
          end;
      except
        ShowMessage('Ocorreu um Erro. Tente Novamente');
      end;
  end;
end;

procedure TForm2.AcertodeEstoque1Click(Sender: TObject);
begin
   Form20 := Tform20.Create(Self);
   form20.tipoV := 'A';
   form20.Modo_Venda := true;
   form20.atacado            := true;
   form20.origem             := 1;
   form20.campoEstoque       := 'quant as estoque';
   if funcoes.buscaParamGeral(98, '1') = '2' then begin
     form20.origem       := 2;
     form20.campoEstoque := 'deposito as estoque';
     Form20.LabelVenda.Caption := 'Venda Atacado - Dep�sito';
   end
   else begin
     Form20.LabelVenda.Caption := 'Venda Atacado - Loja';
   end;
   form20.saidaDeEstoque := false;
   form20.finaliza       := false;
   form20.separaPecas    := false;
   funcoes.CtrlResize(tform(form20));
   Form20.ShowModal;
   form20.Free;
end;

procedure TForm2.AcertosdeEstoque1Click(Sender: TObject);
var
  ini, fim, DATA : String;
  ContaNota : integer;
 begin
  ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(form22.datamov));
  if ini = '*' then exit;

  fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?',formatadataddmmyy(form22.datamov));
  if fim = '*' then exit;

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select a.codigo, p.nome, p.codbar, a.quant, a.deposito, a.nome as just, a.data from acerto a inner join produto p on (a.codigo = p.cod)' +
  ' where ((a.data >= :v1) and (a.data <= :v2))';
  dm.IBselect.ParamByName('v1').AsDateTime := StrToDate(ini);
  dm.IBselect.ParamByName('v2').AsDateTime := StrToDate(fim);
  dm.IBselect.Open;

  form19.RichEdit1.Clear;

  addRelatorioForm19('+-------------------------------------+' + CRLF);
  addRelatorioForm19('|        ACERTOS DE ESTOQUE           |' + CRLF);
  addRelatorioForm19('+-------------------------------------+' + CRLF);

  ContaNota := 0;
  while not dm.IBselect.Eof do begin
    addRelatorioForm19(funcoes.CompletaOuRepete('| ' + LeftStr(dm.IBselect.fieldbyname('codigo').AsString + '-' + dm.IBselect.fieldbyname('nome').AsString, 35), ' |', ' ', 39) + CRLF);
    addRelatorioForm19('| Loja:' + funcoes.CompletaOuRepete('', formataCurrency(dm.IBselect.fieldbyname('quant').AsCurrency), ' ', 11) + '  Dep.:' + funcoes.CompletaOuRepete('', formataCurrency(dm.IBselect.fieldbyname('deposito').AsCurrency), ' ', 11) + '  |' + CRLF);
    addRelatorioForm19('| Data: ' + FormatDateTime('dd/mm/yyyy', dm.IBselect.fieldbyname('data').AsDateTime) + funcoes.CompletaOuRepete(' ' + LeftStr(dm.IBselect.fieldbyname('codbar').AsString, 19), '', ' ', 20)+ '|'  + CRLF);
    addRelatorioForm19('+-------------------------------------+' + CRLF);

    dm.IBselect.Next;
  end;

  form19.ShowModal;
end;

procedure TForm2.Geral1Click(Sender: TObject);
var
    dif, atra, avis,dini,dfim, venda, vended : string;
    i, fim : integer;
    total, totVende, desconto, totcomiAvista, TOT,
    totcomiAprazo, diferen, comiAvista, comiAprazo, totrel : currency;
    comissaoDiferenciada,
    com1, com2, com3, com4, com0, com5, descont1 : TStringList;
    avista : boolean;
    mattVal : array[1..4] of currency;
    produtos : TItensProduto;
begin
   avis := funcoes.dialogo('numero',0,'',2,false,'S',Application.Title,'Qual o Percentual de Comiss�o � VISTA (%)?','0,00');
   if avis = '*' then exit;

   atra := funcoes.dialogo('numero',0,'',2,false,'S',Application.Title,'Qual o Percentual de Comiss�o � PRAZO (%)?', avis);
   if atra = '*' then exit;

   dif := funcoes.dialogo('numero',0,'',2,true,'S',Application.Title,'Qual o fator de Redu��o A PRAZO para produtos diferenciados?','1,00');
   if dif = '*' then exit;

   dini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(StartOfTheMonth(form22.datamov)));
   if dini = '*' then exit;

   dfim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?',formatadataddmmyy(EndOfTheMonth(form22.datamov)));
   if dfim = '*' then exit;

   comiAvista := StrToCurr(avis);
   comiAprazo := StrToCurr(atra);

   form19.RichEdit1.Clear;
   addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80) + #13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete(form22.Pgerais.Values['empresa'],FormatDateTime('dd/mm/yy',form22.datamov), ' ', 80) + #13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete('RELATORIO DE COMISSOES DE ' + dini + ' ATE ' + dfim,FormatDateTime('tt',now),' ', 80) + #13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete('','+','-',17) + funcoes.CompletaOuRepete('','','-',11) + funcoes.CompletaOuRepete('','+','-',13) + funcoes.CompletaOuRepete('','','-',11) + funcoes.CompletaOuRepete('','+','-',13) + funcoes.CompletaOuRepete('','','-',15) + #13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete('','|',' ',17) + funcoes.CompletaOuRepete(funcoes.centraliza('A VISTA ' + avis + '%',' ',23),'|',' ',24) + funcoes.CompletaOuRepete(funcoes.centraliza('A PRAZO ' + atra + '%',' ',23),'|',' ',24) + funcoes.CompletaOuRepete('','',' ',15) + #13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete('COD.  VENDEDOR','|',' ',17) + funcoes.CompletaOuRepete('','+','-',24) + funcoes.CompletaOuRepete('','|','-',24) + funcoes.CompletaOuRepete('','TOTAL',' ',15) + #13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete('','|',' ',17) + funcoes.CompletaOuRepete('','NORMAL|',' ',11) + funcoes.CompletaOuRepete('','DIFERENCIADO|',' ',13) + funcoes.CompletaOuRepete('','NORMAL|',' ',11) + funcoes.CompletaOuRepete('','DIFERENCIADO|',' ',13) + funcoes.CompletaOuRepete('','',' ',15) + #13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete('','+','-',17) + funcoes.CompletaOuRepete('','+','-',11) + funcoes.CompletaOuRepete('','+','-',13) + funcoes.CompletaOuRepete('','+','-',11) + funcoes.CompletaOuRepete('','+','-',13) + funcoes.CompletaOuRepete('','','-',15) + #13 + #10);

   comissaoDiferenciada := lerComissoesDiferenciadasNameCodigo(); //ler as comissoes diferenciadas
   com1 := TStringList.Create;
   com2 := TStringList.Create;
   com3 := TStringList.Create;
   com4 := TStringList.Create;
   com0 := TStringList.Create;
   com5 := TStringList.Create;
   descont1 := TStringList.Create;
   totrel  := 0;

   {retirado abaixo pq ficou lento em 30/12/2014}
   { dm.IBselect.SQL.Clear;
    dm.IBselect.SQL.Add('select v.nota, p.comissao, v.prazo, v.codhis, i.total, i.quant, i.cod, i.p_venda,v.prazo, v.vendedor, v.desconto' +
    ' from item_venda i, venda v left join produto p on (p.cod = i.cod) where (i.nota = v.nota) and (v.cancelado = 0) '
    +' and ((v.data >= :dini) and (v.data <= :dfim)) order by v.vendedor, v.nota');
    dm.IBselect.ParamByName('dini').AsDateTime := StrToDateTimeDef(dini, form22.datamov);
    dm.IBselect.ParamByName('dfim').AsDateTime := StrToDateTimeDef(dfim, form22.datamov);
    dm.IBselect.Open;
    dm.IBselect.FetchAll;

    dm.IBselect.SQL.Clear;
    dm.IBselect.SQL.Add('select v.nota, v.total as total1, p.comissao, v.prazo, v.codhis, i.total, i.quant, i.cod, i.p_venda,v.prazo,' +
    ' v.vendedor, v.desconto from item_venda i left join produto p on (p.cod = i.cod) left join venda v on (i.nota = v.nota) ' +
    ' where ((v.data >= :dini) and (v.data <= :dfim)) and (v.cancelado = 0)  order by v.vendedor, v.nota');
    dm.IBselect.ParamByName('dini').AsDateTime := StrToDateTimeDef(dini, form22.datamov);
    dm.IBselect.ParamByName('dfim').AsDateTime := StrToDateTimeDef(dfim, form22.datamov);
    dm.IBselect.Open;
    dm.IBselect.FetchAll;  }

    dm.IBselect.Close;
    dm.IBselect.SQL.Text :=
    'select i.cod, i.p_venda, i.total, v.total as total1, v.nota, v.codhis, v.desconto, iif(p.comissao is null, 0,p.comissao) as comissao, i.quant, i.vendedor,'+
    'v.prazo from item_venda i left join venda v on (i.nota = v.nota) left join produto p on (p.cod = i.cod) where ((v.data >= :dini)'+
    ' and (v.data <= :dfim)) and v.cancelado = 0 order by i.vendedor, v.nota';
    dm.IBselect.ParamByName('dini').AsDateTime := StrToDateTime(dini);
    dm.IBselect.ParamByName('dfim').AsDateTime := StrToDateTime(dfim);
    dm.IBselect.Open;
    dm.IBselect.FetchAll;

    if dm.IBselect.IsEmpty then
    begin
      dm.IBselect.Close;
      ShowMessage('Nenhum Resultado na Pesquisa');
      exit;
    end;

    fim    := dm.IBselect.RecordCount;
    ini    := 0;
    venda  := 'xx';

    funcoes.informacao(0, fim, 'Aguarde, Calculando Comiss�es...', true, false, 5);

    while not dm.IBselect.Eof do
     begin
       if ((dm.IBselect.FieldByName('codhis').AsInteger = 2) or (dm.IBselect.FieldByName('prazo').AsInteger > 0)) then avista := false
         else avista := true;

       total := 0;
       mattVal[1] := 0;
       mattVal[2] := 0;
       mattVal[3] := 0;
       mattVal[4] := 0;

       if ((venda <> dm.IBselect.fieldbyname('nota').AsString)) then
         begin
           totrel := totrel + dm.IBselect.fieldbyname('total1').AsCurrency;

           desconto := dm.IBselect.fieldbyname('desconto').AsCurrency;
           venda    := dm.IBselect.fieldbyname('nota').AsString;
           vended   := dm.IBselect.fieldbyname('vendedor').AsString;

           if avista then
             begin
               com0.Values[dm.IBselect.fieldbyname('vendedor').AsString] := '0';                   // lista de cod de vendedores
               com3.Values[vended] := CurrToStr(StrToCurrDef(com3.Values[vended], 0) + (desconto * comiAvista / 100));
             end
           else
             begin
               com0.Values[dm.IBselect.fieldbyname('vendedor').AsString] := '0';                   // lista de cod de vendedores
               com4.Values[vended] := CurrToStr(StrToCurrDef(com4.Values[vended], 0) + (desconto * comiAprazo / 100));
             end;

         end;

       Application.ProcessMessages;
       funcoes.informacao(ini, fim, 'Aguarde, calculando Comiss�es...', false, false, 5);

       diferen := StrToCurrDef(comissaoDiferenciada.Values[dm.IBselect.FieldByName('cod').AsString], 0);
       tot     := dm.IBselect.fieldbyname('total').AsCurrency;

       //verifica se a comissao nao � diferenciada (produto.comissao <> 0)
       if diferen <> 0 then
         begin
           if avista then mattVal[1] := mattVal[1] + (tot * diferen / 100)
             else  mattVal[2] := mattVal[2] + (tot * diferen / 100);
         end
       else
         begin
           if avista then  mattVal[3] := mattVal[1] + (tot * comiAvista / 100)
             else          mattVal[4] := mattVal[2] + (tot * comiAprazo / 100);
         end;

         com0.Values[dm.IBselect.fieldbyname('vendedor').AsString] := '0';                   // lista de cod de vendedores
         com1.Values[dm.IBselect.fieldbyname('vendedor').AsString] := CurrToStr(StrToCurrDef(com1.Values[dm.IBselect.fieldbyname('vendedor').AsString], 0) + mattVal[1]);
         com2.Values[dm.IBselect.fieldbyname('vendedor').AsString] := CurrToStr(StrToCurrDef(com2.Values[dm.IBselect.fieldbyname('vendedor').AsString], 0) + mattVal[2]);
         com3.Values[dm.IBselect.fieldbyname('vendedor').AsString] := CurrToStr(StrToCurrDef(com3.Values[dm.IBselect.fieldbyname('vendedor').AsString], 0) + mattVal[3]);
         com4.Values[dm.IBselect.fieldbyname('vendedor').AsString] := CurrToStr(StrToCurrDef(com4.Values[dm.IBselect.fieldbyname('vendedor').AsString], 0) + mattVal[4]);

       dm.IBselect.Next; //next do dataset de venda
       ini := ini + 1;
     end;

    fim := com0.Count -1;
    for i := 0 to fim do
      begin

        //totVende := StrToCurr(com4.Values[com0.Names[i]]) + StrToCurr(com3.Values[com0.Names[i]]) + StrToCurr(com1.Values[com0.Names[i]]) + StrToCurr(com2.Values[com0.Names[i]]);
        totVende := 0;
        {totVende := totVende + Arredonda((StrToCurr(com3.Values[com0.Names[i]]) * (comiAvista / 100)),2);
        totVende := totVende + Arredonda((StrToCurr(com4.Values[com0.Names[i]]) * (comiAprazo / 100)),2);
        totVende := totVende + Arredonda((StrToCurr(com1.Values[com0.Names[i]]) * (comiAvista / 100)),2);
        totVende := totVende + Arredonda((StrToCurr(com2.Values[com0.Names[i]]) * (comiAprazo / 100)),2);}

        totVende := totVende + StrToCurrDef(com3.Values[com0.Names[i]], 0) + StrToCurrDef(com4.Values[com0.Names[i]], 0) +
        StrToCurrDef(com1.Values[com0.Names[i]], 0) + StrToCurrDef(com2.Values[com0.Names[i]], 0);

        addRelatorioForm19(funcoes.CompletaOuRepete(com0.Names[i] ,'',' ',3) + funcoes.CompletaOuRepete(copy(funcoes.BuscaNomeBD(dm.ibquery1,'nome','vendedor','where cod =' + com0.Names[i]),1 , 13),'|', ' ', 14) +
        funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00', Arredonda(StrToCurr(com3.Values[com0.Names[i]]),2) ) + '|',' ',11) + funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00', Arredonda(StrToCurr(com1.Values[com0.Names[i]]) ,2) ) + '|',' ',13) +
        funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00', Arredonda(StrToCurr(com4.Values[com0.Names[i]]),2) )  + '|',' ',11) + funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00', Arredonda(StrToCurr(com2.Values[com0.Names[i]]),2) ) + '|',' ',13) +
        funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00', totVende),' ',15) + #13 + #10);
        total := total + (totVende);
      end;
      
   addRelatorioForm19(funcoes.CompletaOuRepete('','','-', 80 ) +#13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL COMISSOES =>',FormatCurr('#,###,###0.00',total),' ', 30 ) +#13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL VENDAS    =>',FormatCurr('#,###,###0.00',totrel),' ', 30 ) +#13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete('','','-', 80 ) +#13 + #10);

   dm.IBselect.Close;
   dm.IBQuery2.Close;
   dm.IBQuery1.Close;
   funcoes.informacao(0, fim, 'Aguarde...', false, true, 5);

   form19.ShowModal;
end;

procedure TForm2.AVista1Click(Sender: TObject);
  var
    dif, atra, avis,dini,dfim : string;
    avista, aprazo : TStringList;
    total : currency;
    i, fim, ret, ini1, fim1 : integer;
    lista : TList;
    comissao1, comissao2 : ptr_comissao;
begin
   avis := funcoes.dialogo('numero',0,'',2,true,'S',Application.Title,'Qual o Percentual de Comiss�o � VISTA (%)?','0,00');
   if avis = '*' then exit;

   dini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(StartOfTheMonth(form22.datamov)));
   if dini = '*' then exit;

   dfim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?',formatadataddmmyy(EndOfTheMonth(form22.datamov)));
   if dfim = '*' then exit;

   form19.RichEdit1.Clear;
   addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80) + #13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete(form22.Pgerais.Values['empresa'],FormatDateTime('dd/mm/yy',form22.datamov), ' ', 80) + #13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete('RELATORIO DE COMISSOES A VISTA '+ formataCurrency(StrToCurrDef(avis,0)) +'% DE ' + dini + ' ATE ' + dfim,FormatDateTime('tt',now),' ', 80) + #13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete('','+','-',17) + funcoes.CompletaOuRepete('','','-',11) + funcoes.CompletaOuRepete('','+','-',13) + funcoes.CompletaOuRepete('','','-',11) + funcoes.CompletaOuRepete('','+','-',13) + funcoes.CompletaOuRepete('','','-',15) + #13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete('COD.  VENDEDOR','|',' ',17) + funcoes.CompletaOuRepete('     TOTAL DA VENDA','|',' ',24) + funcoes.CompletaOuRepete('     COMISSAO','|',' ',24) + funcoes.CompletaOuRepete('','TOTAL',' ',15) + #13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete('','+','-',17) + funcoes.CompletaOuRepete('','NORMAL--+','-',11) + funcoes.CompletaOuRepete('','DIFERENCIADO+','-',13) + funcoes.CompletaOuRepete('','NORMAL--+','-',11) + funcoes.CompletaOuRepete('','DIFERENCIADO+','-',13) + funcoes.CompletaOuRepete('','','-',15) + #13 + #10);

   dm.IBselect.Close;
   dm.IBselect.SQL.Clear;
   dm.IBselect.SQL.Add('select nota, desconto, vendedor, codhis, prazo, total from venda where cancelado = 0 and ((data >= :dini) and (data <= :dfim)) and ((prazo = 0) or (codhis <> 2)) order by vendedor');
   dm.IBselect.ParamByName('dini').AsDateTime := StrToDateTime(dini);
   dm.IBselect.ParamByName('dfim').AsDateTime := StrToDateTime(dfim);
   dm.IBselect.Open;
   dm.IBselect.FetchAll;
   dm.IBselect.First;
   lista := TList.Create;
   //dm.IBselect.SQL.Add('select total, quant, cod, p_venda from item_venda where ((data >= :dini) and (data <= :dfim))');
   fim1 := dm.IBselect.RecordCount;
   ini1 := 0;
   funcoes.informacao(ini, fim, 'Aguarde, calculando Comiss�es...', true, false, 5);

   while not dm.IBselect.Eof do
     begin
       ini1 := ini1 + 1;
       funcoes.informacao(ini1, fim1, 'Aguarde, calculando Comiss�es...', false, false, 5);
       dm.IBQuery1.Close;
       dm.IBQuery1.SQL.Clear;
       dm.IBQuery1.SQL.Add('select i.total, i.quant, i.cod, i.p_venda, p.comissao  from item_venda i,produto p where (p.cod = i.cod) and (nota = ' + dm.IBselect.fieldbyname('nota').AsString + ')');
       dm.IBQuery1.Open;

       total := 0;
       comissao1 := new(ptr_comissao);
       comissao1.cod := dm.IBselect.fieldbyname('vendedor').AsInteger;
       comissao1.diferenciado_avista := 0;
       comissao1.diferenciado_aprazo := 0;
       comissao1.aprazo := 0;
       comissao1.avista := 0;
       comissao1.total  := 0;
       comissao1.desconto := 0;

       while not dm.IBQuery1.Eof do
         begin
           //verifica se a comissao nao � diferenciada (produto.comissao <> 0)
           if dm.IBQuery1.FieldByName('comissao').AsCurrency > 0 then
             begin
               comissao1.diferenciado_avista := comissao1.diferenciado_avista + (dm.IBQuery1.fieldbyname('total').AsCurrency) * (dm.IBQuery1.fieldbyname('comissao').AsCurrency / 100);
               comissao1.total := comissao1.total + dm.IBQuery1.fieldbyname('total').AsCurrency;
             end
           else
             begin
               comissao1.avista := comissao1.avista + (dm.IBQuery1.fieldbyname('total').AsCurrency) * (StrToCurr(avis) / 100);
               comissao1.aprazo := comissao1.aprazo + dm.IBQuery1.fieldbyname('total').AsCurrency;
             end;

           dm.IBQuery1.Next;
         end;


       comissao1.aprazo := comissao1.aprazo + dm.IBselect.fieldbyname('desconto').AsCurrency;
       comissao1.desconto := comissao1.desconto + (dm.IBselect.fieldbyname('desconto').AsCurrency * StrToCurr(avis) / 100);

       // varre lista para adicionar o total dos itens(pre�o de venda X quantidade) no vendedor ou adiciona um novo vendedor
       ret := 0;
       if lista.Count > 0 then
         begin
           fim := lista.Count - 1;
           for i := 0 to fim do
             begin
               comissao2 := lista.Items[i];
               if comissao2.cod = comissao1.cod then
                 begin
                   ret := i;
                   if i = 0 then ret := -2;
                   break;
                 end;
             end;
         end;

       //se n�o achou vendedor RET = 0, se achou vendedor na lista mas � o primeiro = 0 ent�o retorna -2 para
       // saber se encotrou vendedor, se for igual a zero ent�o cria um novo vendedor na lista
       if ret = 0 then
         begin
           comissao1.cod := dm.IBselect.fieldbyname('vendedor').AsInteger;
           lista.Add(comissao1);
         end
       else
         begin
           if ret = -2 then ret := 0;
           comissao2 := lista.Items[ret];
           comissao2.aprazo := comissao2.aprazo + comissao1.aprazo;
           comissao2.avista := comissao2.avista + comissao1.avista;
           comissao2.diferenciado_avista := comissao2.diferenciado_avista + comissao1.diferenciado_avista;
           comissao2.diferenciado_aprazo := comissao2.diferenciado_aprazo + comissao1.diferenciado_aprazo;
           comissao2.total := comissao2.total + comissao1.total;
           comissao2.desconto := comissao2.desconto + comissao1.desconto;
         end;
       dm.IBselect.Next;
     end;

   funcoes.informacao(ini, fim, 'Aguarde, calculando Comiss�es...', false, true, 5);
   fim := lista.Count - 1;
   total := 0;
   for i := 0 to fim do
     begin
       comissao1 := lista.Items[i];
       addRelatorioForm19(funcoes.CompletaOuRepete(IntToStr(Comissao1.cod) ,'',' ',3) + funcoes.CompletaOuRepete(copy(funcoes.BuscaNomeBD(dm.ibquery1,'nome','vendedor','where cod =' +IntToStr(Comissao1.cod)),1 , 13),'|', ' ', 14) +
       funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',comissao1.aprazo) + '|',' ',11) +  {TOTAL DA VENDA NORMAL}
       funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00', comissao1.total) + '|',' ',13) +  {TOTAL DIFERENCIADO}
       funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',comissao1.avista + comissao1.desconto) + '|',' ',11) + {TOTAL COMISSAO NORMAL}
       funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',comissao1.diferenciado_avista ) + '|',' ',13) + {TOTAL COMISSAO DIFERENCIADA}
       funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',comissao1.avista + comissao1.diferenciado_avista + comissao1.desconto),' ',15) + #13 + #10); {TOTAL DE COMISSAO}
       total := total + comissao1.avista + comissao1.diferenciado_avista + comissao1.desconto;
     end;

   addRelatorioForm19(funcoes.CompletaOuRepete('','','-', 80 ) +#13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL GERAL =>',FormatCurr('#,###,###0.00',total),' ',  80) +#13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete('','','-', 80 ) +#13 + #10);
   dm.IBselect.Close;
   dm.IBQuery2.Close;
   dm.IBQuery1.Close;
   EmptyTList(lista);

   form19.ShowModal;
end;

procedure TForm2.APrazo1Click(Sender: TObject);
  var
    dif, atra, vende, dini, dfim, h1, vendeAtual : string;
    notas : TStringList;
    i, fim, linhas : integer;
    total, tot_ge : currency;
    comissao1, comissao2 : ptr_comissao;
begin
   dini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(StartOfTheMonth(form22.datamov)));
   if dini = '*' then exit;

   dfim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?',formatadataddmmyy(EndOfTheMonth(form22.datamov)));
   if dfim = '*' then exit;

   atra := funcoes.dialogo('numero',0,'',2,true,'S',Application.Title,'Qual o Percentual de Comiss�o para o Vendedor (%)?','0,00');
   if atra = '*' then exit;

   vende := funcoes.dialogo('generico',0,'0987654321' + #8 + #27,50, false,'',Application.Title,'Qual o N�mero do Vendedor?','');
   {if vende = '' then
     begin
       vende := funcoes.localizar('Localizar Vendedor','vendedor','cod,nome','cod','','nome','nome',true,false,false,'',300,nil);
     end;}
   //if (vende = '*') or (vende = '') then exit;

   dif := funcoes.dialogo('generico',0,'SN',50,true,'S',Application.Title,'Pagar Comiss�o Sobre Vendas n�o Recebidas?','N');
   if dif = '*' then exit;

   h1 := '';
   if vende <> '' then h1 := '(v.vendedor = '+StrNum(vende)+') and ';

   form19.RichEdit1.Clear;
   {form19.RichEdit1.Clear;
   addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80) + #13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete(form22.Pgerais.Values['empresa'],FormatDateTime('dd/mm/yy',form22.datamov), ' ', 80) + #13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete('RELATORIO DE COMISSOES DE ' + dini + ' ATE ' + dfim,FormatDateTime('tt',now),' ', 80) + #13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80)  + #13 + #10);
   addRelatorioForm19('  DATA    DOC    NOTA  CLIENTE                 RECEBIDO       COMISSAO          '  + #13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80)  + #13 + #10);}

   if dif = 'S' then
     begin
       dm.IBselect.Close;
       //dm.IBselect.SQL.Text := ('select v.data, v.nota, v.vendedor, c.historico,c.documento,  c.valor from contasreceber'+
       //' c left join venda v on ('+h1+' v.nota = c.nota and (v.data >= :dini and v.data <= :dfim) and v.cancelado = 0) where v.nota = c.nota and valor > 0 order by v.vendedor');

       dm.IBselect.SQL.Text := ('select v.data, v.nota, v.vendedor, c.historico,c.documento,  c.valor from contasreceber'+
       ' c left join venda v on ('+h1+' v.nota = c.nota and (v.data >= :dini and v.data <= :dfim) and v.cancelado = 0) where v.nota = c.nota and valor > 0 order by v.vendedor');
       dm.IBselect.ParamByName('dini').AsDateTime := StrToDateTime(dini);
       dm.IBselect.ParamByName('dfim').AsDateTime := StrToDateTime(dfim);
       dm.IBselect.Open;

     end
   else
     begin
       if vende <> '' then h1 := '(cr.vendedor = '+StrNum(vende)+') and ';
       dm.IBselect.Close;
       dm.IBselect.SQL.Text := ('SELECT cast(c.data as date) as data, c.historico, c.entrada, cr.vendedor,'+
       ' cr.documento, c.entrada as valor FROM CAIXA c'+
       ' left join contasreceber cr on (c.codentradasaida = cr.cod)' +
       ' where '+h1+' c.codentradasaida <> 0 and c.entrada > 0 and (cast(c.data as date) >= :dini and (cast(c.data as date) <= :dfim))' +
       ' order by cr.vendedor');
       dm.IBselect.ParamByName('dini').AsDateTime := StrToDateTime(dini);
       dm.IBselect.ParamByName('dfim').AsDateTime := StrToDateTime(dfim);
       dm.IBselect.Open;

       {dm.IBselect.Close;
       dm.IBselect.SQL.Text := ('select v.data, v.nota, v.vendedor,  c.historico,c.documento, c.total - c.valor as valor from'+
       ' contasreceber c left join venda v on ('+h1+' v.nota = c.nota and (v.data >= :dini and v.data <= :dfim) and v.cancelado = 0) where v.nota = c.nota and c.total - c.valor > 0 order by v.vendedor');
       dm.IBselect.ParamByName('dini').AsDateTime := StrToDateTimeDef(dini, form22.datamov);
       dm.IBselect.ParamByName('dfim').AsDateTime := StrToDateTimeDef(dfim, form22.datamov);
       dm.IBselect.Open;}
     end;

   tot_ge := 0;
   total  := 0;
   linhas := 60;
   vendeAtual := 'xxx';

   while not dm.IBselect.Eof do
     begin

       if vendeAtual <> dm.IBselect.FieldByName('vendedor').AsString then
         begin
           if vendeAtual <> 'xxx' then
             begin
               addRelatorioForm19(funcoes.CompletaOuRepete('','','-', 80 ) +#13 + #10);
               addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL GERAL =>',FormatCurr('#,###,###0.00',tot_ge),' ', 57 ) + funcoes.CompletaOuRepete('', formataCurrency(total), ' ', 13) +#13 + #10);
               addRelatorioForm19(funcoes.CompletaOuRepete('','','-', 80 ) +#13 + #10);
             end;

           total      := 0;
           tot_ge     := 0;
           vendeAtual := dm.IBselect.FieldByName('vendedor').AsString;
           addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80) + #13 + #10);
           addRelatorioForm19(funcoes.CompletaOuRepete(form22.Pgerais.Values['empresa'],FormatDateTime('dd/mm/yy',form22.datamov), ' ', 80) + #13 + #10);
           addRelatorioForm19(funcoes.CompletaOuRepete('COMISSAO A PRAZO  VENDEDOR: ' + vendeAtual + ' ' + dini + ' A ' + dfim,FormatDateTime('tt',now),' ', 80) + #13 + #10);
           addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80)  + #13 + #10);
           addRelatorioForm19('  DATA    DOC    NOTA  CLIENTE                   RECEBIDO       COMISSAO          '  + #13 + #10);
           addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80)  + #13 + #10);
         end;

       addRelatorioForm19(formataDataDDMMYY(dm.IBselect.fieldbyname('data').AsDateTime) + funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('documento').AsString, ' ', 7) + '    ' + funcoes.CompletaOuRepete(copy(dm.IBselect.fieldbyname('historico').AsString,1, 25),'', ' ', 25) + funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',dm.IBselect.fieldbyname('valor').AsCurrency), ' ', 13) + funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',Arredonda(dm.IBselect.fieldbyname('valor').AsCurrency * (StrToCurr(atra) /100), 2) ), ' ', 13)+ '  ' + atra + '%' + #13 + #10);
       total  := total  + Arredonda(dm.IBselect.fieldbyname('valor').AsCurrency * (StrToCurr(atra) /100), 2);
       tot_ge := tot_ge + dm.IBselect.fieldbyname('valor').AsCurrency;
       dm.IBselect.Next;
     end;

   {for i := 0 to fim do
     begin
       dm.IBselect.Close;
       dm.IBselect.SQL.Clear;
       dm.IBselect.SQL.Add('select total, historico, documento, pago from contasreceber where (nota = :nota) ' + iif(dif = 'N',' and (pago <> 0)',''));
       dm.IBselect.ParamByName('nota').AsString := notas.Strings[i];
       dm.IBselect.Open;

       while not dm.IBselect.Eof do
         begin
           if form19.RichEdit1.Lines.Count >= linhas then
             begin
               linhas := linhas + 60;
               addRelatorioForm19('  ' + #12 + #13 + #10);
               addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80) + #13 + #10);
               addRelatorioForm19(funcoes.CompletaOuRepete(form22.Pgerais.Values['empresa'],FormatDateTime('dd/mm/yy',form22.datamov), ' ', 80) + #13 + #10);
               addRelatorioForm19(funcoes.CompletaOuRepete('RELATORIO DE COMISSOES DE ' + dini + ' ATE ' + dfim,FormatDateTime('tt',now),' ', 80) + #13 + #10);
               addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80)  + #13 + #10);
               addRelatorioForm19('  DATA    DOC    NOTA  CLIENTE                 RECEBIDO       COMISSAO          '  + #13 + #10);
               addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80)  + #13 + #10);
             end;
           addRelatorioForm19(funcoes.CompletaOuRepete('',notas.Strings[i], ' ', 6) + funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('documento').AsString, ' ', 7) + '    ' + funcoes.CompletaOuRepete(copy(dm.IBselect.fieldbyname('historico').AsString,1, 25),'', ' ', 25) + funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',dm.IBselect.fieldbyname('total').AsCurrency), ' ', 13) + funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',Arredonda(dm.IBselect.fieldbyname('total').AsCurrency * (StrToCurr(atra) /100), 2) ), ' ', 13)+ '  ' + atra + '%' + #13 + #10);
           total := total + Arredonda(dm.IBselect.fieldbyname('total').AsCurrency * (StrToCurr(atra) /100), 2);
           dm.IBselect.Next;
         end;
     end;}

   addRelatorioForm19(funcoes.CompletaOuRepete('','','-', 80 ) +#13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL GERAL =>',FormatCurr('#,###,###0.00',tot_ge),' ', 57 ) + funcoes.CompletaOuRepete('', formataCurrency(total), ' ', 13) +#13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete('','','-', 80 ) +#13 + #10);
   //notas.Free;
   dm.IBselect.Close;

   form19.ShowModal;
end;

procedure TForm2.AtualizaCFOPs1Click(Sender: TObject);
begin
  funcoes.atualizaCFOPs(false);
  ShowMessage('CFOPs Atualizados Com Sucesso!');
end;

procedure TForm2.FimdeEstoque1Click(Sender: TObject);
var
  comissao1, comissao2 : Ptr_Produto;
  forne, ordem, h1, o1 : string;
  tot, a, b : integer;
  valor:array[1..6] of currency;
begin
  forne := funcoes.dialogo('generico',0,'1234567890'+#8,50,false,'',application.Title,'Qual o Fornecedor?','');
  if forne = '*' then exit;

  ordem := funcoes.dialogo('generico',0,'123'+#8,0,false,'S','Control For Windows','Qual a Ordem  (1-Alfab�tica 2-Diferen�a 3-Sugest�o)?:','1') ;
  if ordem = '*' then exit;

  form19.RichEdit1.Clear;
  forne := '';

  //addRelatorioForm19('  ' + #15 + #13 + #10);
  addRelatorioForm19('|' + #15 + '|' + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete('','','-',130) + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete(form22.Pgerais.Values['empresa'],'DATA: ' + FormatDateTime('dd/mm/yy',form22.datamov),' ',130) + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('RELATORIO DE FIM DE ESTOQUE: ' + iif(forne = '', 'TODOS OS FORNECEDORES', 'FORNECEDOR ' + forne ),'HORA: ' + FormatDateTime('tt',now),' ',130) + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('','','-',130) + #13 + #10);
  addRelatorioForm19('                                               |   ESTOQUE ATUAL   |   ESTOQUE MINIMO    |    DIFERENCA      |    SUGESTAO       |' + #13 + #10);
  addRelatorioForm19('CODIGO DESCRICAO DO PRODUTO                    +--------+----------+---------+-----------+--------+----------+--------+----------+' + #13 + #10);
  addRelatorioForm19('                                               |  QUANT.|       R$ |   QUANT.|        R$ |  QUANT.|       R$ |  QUANT.|       R$ |' + #13 + #10);
  addRelatorioForm19('-----------------------------------------------+--------+----------+---------+-----------+--------+----------+--------+----------+' + #13 + #10);

  h1 := '';
  o1 := '';
  if forne <> '' then h1 := ' and (fornecedor = '+ forne + ')';
  if ordem = '1' then o1 := ' order by nome'
  else if ordem = '2' then o1 := ' order by (quant + deposito) - estoque'
  else if ordem = '3' then o1 := ' order by sugestao';

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  //dm.IBselect.SQL.Add('select quant + deposito as soma, quant, estoque, deposito, cod, nome, p_compra, p_venda, sugestao from produto where (quant + deposito > estoque) ' + h1 + o1);
  //dm.IBselect.SQL.Add('select quant + deposito as soma, quant, estoque, deposito, cod, nome, p_compra, p_venda, sugestao from produto where (sugestao > 0) ' + h1 + o1);
  dm.IBselect.SQL.Add('select quant + deposito as soma, quant, estoque, deposito, cod, nome, p_compra, p_venda, sugestao from produto where (cod > 0) ' + h1 + o1);
  dm.IBselect.Open;

  dm.IBselect.FetchAll;
  tot := dm.IBselect.RecordCount;
  funcoes.informacao(0,tot,'AGUARDE...',TRUE,FALSE,5);
  a := 85;
  b := 0;
  valor[1] := 0;
  valor[2] := 0;
  valor[3] := 0;
  valor[4] := 0;

  while not dm.IBselect.Eof do
    begin
      b := b + 1;
      if a <= b then
        begin
          a := a + 85;
          addRelatorioForm19(funcoes.CompletaOuRepete('','','-',130) + #13 + #10);
          addRelatorioForm19('  ' + #12 + #13 + #10);
          addRelatorioForm19(funcoes.CompletaOuRepete('','','-',130) + #13 + #10);
          addRelatorioForm19(funcoes.CompletaOuRepete(form22.Pgerais.Values['empresa'],'DATA: ' + FormatDateTime('dd/mm/yy',form22.datamov),' ',130) + #13 + #10);
          addRelatorioForm19(funcoes.CompletaOuRepete('RELATORIO DE FIM DE ESTOQUE: ' + iif(forne = '', 'TODOS OS FORNECEDORES', 'FORNECEDOR ' + forne ),'HORA: ' + FormatDateTime('tt',now),' ',130) + #13 + #10);
          addRelatorioForm19(funcoes.CompletaOuRepete('','','-',130) + #13 + #10);
          addRelatorioForm19('                                               |   ESTOQUE ATUAL   |   ESTOQUE MINIMO    |    DIFERENCA      |    SUGESTAO       |' + #13 + #10);
          addRelatorioForm19('CODIGO DESCRICAO DO PRODUTO                    +--------+----------+---------+-----------+--------+----------+--------+----------+' + #13 + #10);
          addRelatorioForm19('                                               |  QUANT.|       R$ |   QUANT.|        R$ |  QUANT.|       R$ |  QUANT.|       R$ |' + #13 + #10);
          addRelatorioForm19('-----------------------------------------------+--------+----------+---------+-----------+--------+----------+--------+----------+' + #13 + #10);
        end;
      funcoes.informacao(dm.IBselect.RecNo,tot,'AGUARDE...',false,false,5);

      //if dm.IBselect.fieldbyname('soma').AsCurrency - dm.IBselect.fieldbyname('estoque').AsCurrency > 0 then begin
        //cod descricao estoqueAtual
        addRelatorioForm19(funcoes.CompletaOuRepete('', dm.IBselect.fieldbyname('cod').AsString, ' ', 6) + ' ' + funcoes.CompletaOuRepete(LeftStr(dm.IBselect.fieldbyname('nome').AsString, 40), '|', ' ', 41) + funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00', dm.IBselect.fieldbyname('soma').AsCurrency) + '|', ' ', 9) + funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00', Arredonda(dm.IBselect.fieldbyname('soma').AsCurrency * dm.IBselect.fieldbyname('p_compra').AsCurrency,2))+ '|', ' ', 11) +
        // EstoqueMinimo
        funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00', dm.IBselect.fieldbyname('estoque').AsCurrency) + '|', ' ', 10) + funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00', Arredonda(dm.IBselect.fieldbyname('estoque').AsCurrency * dm.IBselect.fieldbyname('p_compra').AsCurrency,2)) + '|', ' ', 12) +
        // Diferen�a
        funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00', abs(dm.IBselect.fieldbyname('soma').AsCurrency - dm.IBselect.fieldbyname('estoque').AsCurrency)) + '|', ' ', 9) + funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00', abs(Arredonda((dm.IBselect.fieldbyname('soma').AsCurrency * dm.IBselect.fieldbyname('p_compra').AsCurrency) - (dm.IBselect.fieldbyname('estoque').AsCurrency * dm.IBselect.fieldbyname('p_compra').AsCurrency),2))) + '|', ' ', 11) +
        // Sugestao
        funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00', dm.IBselect.fieldbyname('sugestao').AsCurrency) + '|', ' ', 9) + funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00', Arredonda(dm.IBselect.fieldbyname('sugestao').AsCurrency * dm.IBselect.fieldbyname('p_compra').AsCurrency,2)) + '|', ' ', 11) + #13 + #10 );
        valor[1] := valor[1] + Arredonda(dm.IBselect.fieldbyname('soma').AsCurrency * dm.IBselect.fieldbyname('p_compra').AsCurrency,2);
        valor[2] := valor[2] + Arredonda(dm.IBselect.fieldbyname('estoque').AsCurrency * dm.IBselect.fieldbyname('p_compra').AsCurrency,2);
        valor[3] := valor[3] + abs(Arredonda((dm.IBselect.fieldbyname('soma').AsCurrency * dm.IBselect.fieldbyname('p_compra').AsCurrency) - (dm.IBselect.fieldbyname('estoque').AsCurrency * dm.IBselect.fieldbyname('p_compra').AsCurrency),2));
        valor[4] := valor[4] + Arredonda(dm.IBselect.fieldbyname('sugestao').AsCurrency * dm.IBselect.fieldbyname('p_compra').AsCurrency,2);
      //end;

      dm.IBselect.Next;
    end;

  addRelatorioForm19(funcoes.CompletaOuRepete('','','-',130) + #13 + #10);
  addRelatorioForm19('TOTAIS >>> ' + funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00',valor[1]), ' ', 57) + funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00',valor[2]), ' ', 22) + funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00',valor[3]), ' ', 20) + funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00',valor[4]), ' ', 20)  + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('','','-',130) + #13 + #10);

  funcoes.informacao(100,100,'',false,true,5);
  form19.ShowModal;
end;

procedure TForm2.FimdeEstoque3Click(Sender: TObject);
var
  comissao1, comissao2 : Ptr_Produto;
  forne, ordem, h1, o1 : string;
  tot, a, b : integer;
  valor:array[1..6] of currency;
  arq : TStringList;
begin
  forne := funcoes.dialogo('generico',0,'1234567890'+#8,50,false,'',application.Title,'Qual o Fornecedor?','');
  if forne = '*' then exit;

  ordem := funcoes.dialogo('generico',0,'123'+#8,0,false,'S','Control For Windows','Qual a Ordem  (1-Alfab�tica 2-Diferen�a 3-Sugest�o)?:','1') ;
  if ordem = '*' then exit;

  forne := '';

  {
  form19.RichEdit1.Clear;
  //addRelatorioForm19('  ' + #15 + #13 + #10);
  addRelatorioForm19('|' + #15 + '|' + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete('','','-',130) + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete(form22.Pgerais.Values['empresa'],'DATA: ' + FormatDateTime('dd/mm/yy',form22.datamov),' ',130) + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('RELATORIO DE FIM DE ESTOQUE: ' + iif(forne = '', 'TODOS OS FORNECEDORES', 'FORNECEDOR ' + forne ),'HORA: ' + FormatDateTime('tt',now),' ',130) + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('','','-',130) + #13 + #10);
  addRelatorioForm19('                                               |   ESTOQUE ATUAL   |   ESTOQUE MINIMO    |    DIFERENCA      |    SUGESTAO       |' + #13 + #10);
  addRelatorioForm19('CODIGO DESCRICAO DO PRODUTO                    +--------+----------+---------+-----------+--------+----------+--------+----------+' + #13 + #10);
  addRelatorioForm19('                                               |  QUANT.|       R$ |   QUANT.|        R$ |  QUANT.|       R$ |  QUANT.|       R$ |' + #13 + #10);
  addRelatorioForm19('-----------------------------------------------+--------+----------+---------+-----------+--------+----------+--------+----------+' + #13 + #10);}

  h1 := '';
  o1 := '';
  if forne <> '' then h1 := ' and (fornecedor = '+ forne + ')';
  if ordem = '1' then o1 := ' order by nome'
  else if ordem = '2' then o1 := ' order by (quant + deposito) - estoque'
  else if ordem = '3' then o1 := ' order by sugestao';

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  //dm.IBselect.SQL.Add('select quant + deposito as soma, quant, estoque, deposito, cod, nome, p_compra, p_venda, sugestao from produto where (quant + deposito > estoque) ' + h1 + o1);
  //dm.IBselect.SQL.Add('select quant + deposito as soma, quant, estoque, deposito, cod, nome, p_compra, p_venda, sugestao from produto where (sugestao > 0) ' + h1 + o1);
  dm.IBselect.SQL.Add('select quant + deposito as soma, quant, estoque, deposito, cod, nome, p_compra, p_venda, sugestao from produto where (cod > 0) ' + h1 + o1);
  dm.IBselect.Open;

  dm.IBselect.FetchAll;
  tot := dm.IBselect.RecordCount;
  funcoes.informacao(0,tot,'AGUARDE...',TRUE,FALSE,5);
  a := 85;
  b := 0;
  valor[1] := 0;
  valor[2] := 0;
  valor[3] := 0;
  valor[4] := 0;

  arq := TStringList.Create;
  arq.Add('CODIGO;DESCRICAO;ESTO_ATUAL_QUANT;ESTO_ATUAL_REAIS;ESTO_MIN_QUANT;' +
  'ESTO_MIN_REAIS;DIF_QUANT;DIF_REAIS;SUGEST_QUANT;SUGEST_REAIS;');

  while not dm.IBselect.Eof do
    begin
      b := b + 1;
      funcoes.informacao(dm.IBselect.RecNo,tot,'AGUARDE...',false,false,5);

      //if dm.IBselect.fieldbyname('soma').AsCurrency - dm.IBselect.fieldbyname('estoque').AsCurrency > 0 then begin
        //cod descricao estoqueAtual

        arq.Add(dm.IBselect.fieldbyname('cod').AsString + ';' + LeftStr(dm.IBselect.fieldbyname('nome').AsString, 40) + ';' +
        FormatCurr('#,###,###0.00', dm.IBselect.fieldbyname('soma').AsCurrency) + ';' + FormatCurr('#,###,###0.00', Arredonda(dm.IBselect.fieldbyname('soma').AsCurrency * dm.IBselect.fieldbyname('p_compra').AsCurrency,2)) + ';' +
        // EstoqueMinimo
        FormatCurr('#,###,###0.00', dm.IBselect.fieldbyname('estoque').AsCurrency) + ';' + FormatCurr('#,###,###0.00', Arredonda(dm.IBselect.fieldbyname('estoque').AsCurrency * dm.IBselect.fieldbyname('p_compra').AsCurrency,2)) + ';' +
        // Diferen�a
        FormatCurr('#,###,###0.00', abs(dm.IBselect.fieldbyname('soma').AsCurrency - dm.IBselect.fieldbyname('estoque').AsCurrency)) + ';' + FormatCurr('#,###,###0.00', abs(Arredonda((dm.IBselect.fieldbyname('soma').AsCurrency * dm.IBselect.fieldbyname('p_compra').AsCurrency) - (dm.IBselect.fieldbyname('estoque').AsCurrency * dm.IBselect.fieldbyname('p_compra').AsCurrency),2))) + ';' +
        // Sugestao
        FormatCurr('#,###,###0.00', dm.IBselect.fieldbyname('sugestao').AsCurrency) + ';' + FormatCurr('#,###,###0.00', Arredonda(dm.IBselect.fieldbyname('sugestao').AsCurrency * dm.IBselect.fieldbyname('p_compra').AsCurrency,2)) + ';');

        valor[1] := valor[1] + Arredonda(dm.IBselect.fieldbyname('soma').AsCurrency * dm.IBselect.fieldbyname('p_compra').AsCurrency,2);
        valor[2] := valor[2] + Arredonda(dm.IBselect.fieldbyname('estoque').AsCurrency * dm.IBselect.fieldbyname('p_compra').AsCurrency,2);
        valor[3] := valor[3] + abs(Arredonda((dm.IBselect.fieldbyname('soma').AsCurrency * dm.IBselect.fieldbyname('p_compra').AsCurrency) - (dm.IBselect.fieldbyname('estoque').AsCurrency * dm.IBselect.fieldbyname('p_compra').AsCurrency),2));
        valor[4] := valor[4] + Arredonda(dm.IBselect.fieldbyname('sugestao').AsCurrency * dm.IBselect.fieldbyname('p_compra').AsCurrency,2);
      //end;

      dm.IBselect.Next;
    end;

  arq.Add(';;;;;;;;;;');
  arq.Add(';;;'+FormatCurr('#,###,###0.00',valor[1])+';;'+FormatCurr('#,###,###0.00',valor[2])+';;'+FormatCurr('#,###,###0.00',valor[3])+';;'+FormatCurr('#,###,###0.00',valor[4])+';');

  //addRelatorioForm19('TOTAIS >>> ' + funcoes.CompletaOuRepete('',  FormatCurr('#,###,###0.00',valor[1]), ' ', 57) + funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00',valor[2]), ' ', 22) + funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00',valor[3]), ' ', 20) + funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00',valor[4]), ' ', 20)  + #13 + #10);
  funcoes.informacao(100,100,'',false,true,5);
  funcoes.CriaDiretorio(caminhoEXE_com_barra_no_final + 'Mala direta\');
  arq.SaveToFile(caminhoEXE_com_barra_no_final + 'Mala direta\FimDeEstoque.csv');
  ShowMessage('Arquivo Gerado com Sucesso!');
  arq.Free;
  dm.IBselect.Close;
  //form19.ShowModal;
end;

procedure TForm2.EnviarLogdeErrosViaEmail1Click(Sender: TObject);
var
  caminho,texto, sim, msg : string;
  dadosEmail : TStringList;
  Idmessage: TIdMessage;
begin
  dadosEmail := TStringList.Create;
  Application.ProcessMessages;
  if not FileExists(caminhoEXE_com_barra_no_final + 'errolog.txt') then
     begin
       ShowMessage(caminhoEXE_com_barra_no_final + 'errolog.txt' + ' Arquivo n�o Econtrado!');
       exit;
     end;

   msg := funcoes.MensagemTextoInput('Mensagem E-Mail', '');

   funcoes.Mensagem(Application.Title ,'Aguarde, Enviando Email...',15,'Courier New',false,0,clred, false);
   Application.ProcessMessages;


  funcoes.configuraMail(dm.ACBrMail1);
  try
  //adiciona anexo
  dm.ACBrMail1.Clear;
  dm.ACBrMail1.AddAttachment(caminhoEXE_com_barra_no_final + 'errolog.txt', 'LOG de Erros');

  //TIdAttachmentFile.Create(MAILMESSAGE.MessageParts, TFileName(caminhoEXE_com_barra_no_final + 'errolog.txt'));
  dm.ACBrMail1.FromName := 'ControlW Sistemas';
  //dm.ACBrMail1.Sender.Address := 'controlwsistemas@gmail.com';

  //Assunto
  dm.ACBrMail1.Subject:='Log de erros ' + form22.Pgerais.Values['empresa'];
  //Body da mensagem
  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select empresa,telres,telcom,titular,ende,bairro,cid,est from registro');
  dm.IBselect.Open;

  texto := msg + #13 + #10 + #13 + #10;
  texto := texto + 'Empresa: ' + dm.IBselect.fieldbyname('empresa').AsString + #13 + #10;
  texto := texto + 'Telefones: ' + dm.IBselect.fieldbyname('telres').AsString + '  ' + dm.IBselect.fieldbyname('telcom').AsString + #13 + #10;
  texto := texto + 'Titular:' + dm.IBselect.fieldbyname('titular').AsString + #13 + #10;
  texto := texto + 'Endere�o: ' + dm.IBselect.fieldbyname('ende').AsString + ' - ' + dm.IBselect.fieldbyname('bairro').AsString + #13 + #10;
  texto := texto + 'Localidade: ' + dm.IBselect.fieldbyname('cid').AsString + '-' + dm.IBselect.fieldbyname('est').AsString + #13 + #10;
  texto := texto + 'Usu�rio: ' + form22.usuario + #13 + #10;
  texto := texto + #13 + #10 + #13 + #10 + #13 + #10;
  texto := texto + 'Este e um email automatico gerado por CONTROLW.';

  dm.IBselect.Close;

  dm.ACBrMail1.Body.SetText(pchar(texto));
  //E-mail para onde a mensagem ser� enviada

  dm.ACBrMail1.AddAddress('wagner.br.xx@gmail.com', 'Wagner');
  dm.ACBrMail1.From := 'wagner@controlestoque.tk';
  //MAILMESSAGE.From.DisplayName := 'ControlW SMTP';
  //dm.ACBrMail1.
  //envia a mensagem
  dm.ACBrMail1.Send(false);
  except
    on e :exception do begin
     funcoes.Mensagem('', '', 25, 'Courier New',False, 0, clRed, true);
     pergunta1.Free;
     ShowMessage('N�o Foi Poss�vel Enviar o Email. Verifique se a Conex�o com a Internet est� Funcionando Corretamente' + #13 + e.Message);
     // FreeAndNil(dadosEmail);
     dm.IBselect.Close;
     exit;
    end;
  end;
//  finally
  //Desconnecta do host
 // Mensagem('', '', 25, 'Courier New',False, 0, clRed, true);
 // pergunta1.Free;
  funcoes.Mensagem('', '', 25, 'Courier New',False, 0, clRed, true);
  pergunta1.Free;
  //FreeAndNil(dadosEmail);
  MAIL.Disconnect;
  //confirma o envio
  MessageDlg('E-Mail enviado com sucesso!',mtConfirmation,[mbOK],0);
  dm.IBselect.Close;
end;

procedure TForm2.EnviarporEmail1Click(Sender: TObject);
begin
  NfeVenda := TNfeVenda.Create(self);
  try
    NfeVenda.enviarPorEmail;
  except
    on e:exception do
      begin
        if funcoes.Contido('LENGTH', UpperCase(e.Message)) then
          begin
            //NfeVenda.GeraXml;
          END;
      end;
  end;
  NfeVenda.Free;
end;

procedure TForm2.EnviarPorEmail2Click(Sender: TObject);
begin
  funcoes.enviarSPED_Email;
end;

procedure TForm2.EnviarXMLsPorEmail1Click(Sender: TObject);
begin
  funcoes.enviaXMLsEmail;
end;

procedure TForm2.CalcularEstoqueMnimo1Click(Sender: TObject);
var
  dini, dfim, sim : string;
  ini, fim, dataSugestao, dataInicial, dataFinal : TDateTime;
  periodo, ultimo, alterados, diasCalculoSugestao : integer;
  periodoCalculoParGer, estoqueAtual, sugestao, minimo: currency;
  lista, sugestaoLista : TStringList;
begin
  alterados := 0;
  periodoCalculoParGer := StrToCurrDef(ConfParamGerais.Strings[18], 45);
  sim := funcoes.dialogo('not',0,'SN'+#8 + #27,0,false,'S','Control For Windows','Confirma C�lculo de Estoque M�nimo? S/N:','');
  if (sim = 'N') or (sim = '*') then exit;

  ini := form22.datamov - 180;
  fim := form22.datamov;

  dini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial de Movimento?',formatadataddmmyy(ini));
  if dini = '*' then exit;

  dfim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final de Movimento?',formatadataddmmyy(fim));
  if dfim = '*' then exit;
  periodo := 0;

  diasCalculoSugestao := StrToIntDef(funcoes.buscaParamGeral(72, '60'), 60);

  dataInicial := StrToDateTime(dini);
  dataFinal := StrToDateTime(dfim);
  dataSugestao := dataFinal - diasCalculoSugestao;
  periodo := DaysBetween(dataInicial , dataFinal);
  ShowMessage('Ser� Calculada uma M�dia pelo Movimento de ' + dini + ' at� ' + dfim + ' ('+ IntToStr(periodo) +' dias)');

  //prepara o sql de consulta do cadastro de produtos
  dm.IBQuery3.Close;
  dm.IBQuery3.SQL.Clear;
  dm.IBQuery3.SQL.Add('select cod, quant, deposito, estoque, sugestao from produto');
  dm.IBQuery3.Open;
  dm.IBQuery3.First;
  dm.IBQuery3.FetchAll;


  //prepara o sql de update do cadastro
  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Clear;
  dm.IBQuery1.SQL.Add('update produto set estoque = :minimo, sugestao = :sugestao where cod = :cod');

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select i.data,i.cod,i.quant from item_venda i left join venda v on (v.nota = i.nota) '+
  ' where (i.data >= :dini) and (i.data <= :dfim) and (i.total > 0) and (v.cancelado = 0)');
  dm.IBselect.ParamByName('dini').AsDateTime := dataInicial;
  dm.IBselect.ParamByName('dfim').AsDateTime := dataFinal;
  //dm.IBselect.ParamByName('cod').AsInteger := dm.IBQuery3.FieldByName('cod').AsInteger;
  dm.IBselect.Open;
  dm.IBselect.FetchAll;
  ultimo := dm.IBselect.RecordCount;

  lista    := TStringList.Create;
  sugestaoLista := TStringList.Create;

  funcoes.informacao(0, ultimo,'Lendo Vendas... ',true,false,2);
  while not dm.IBselect.Eof do begin
    funcoes.informacao(dm.IBselect.RecNo, ultimo, 'Calculando Estoque M�nimo... ',false,false,2);
    lista.Values[dm.IBselect.FieldByName('cod').AsString] := CurrToStr(StrToCurrDef(lista.Values[dm.IBselect.FieldByName('cod').AsString], 0) + dm.IBselect.FieldByName('quant').AsCurrency);

    if dm.IBselect.FieldByName('data').AsDateTime >= dataSugestao then begin
      sugestaoLista.Values[dm.IBselect.FieldByName('cod').AsString] := CurrToStr(StrToCurrDef(sugestaoLista.Values[dm.IBselect.FieldByName('cod').AsString], 0) + dm.IBselect.FieldByName('quant').AsCurrency);
    end;

    ///lista.Add(dm.IBselect.FieldByName('cod').AsString + '=' + dm.IBselect.FieldByName('quantVendida').AsString);
    dm.IBselect.Next;
  end;

  //jss. Reescrevendo o código a partir daqui, sem utilizar listaProds.
  //calcula o estoque mínimo de cada um, e já grava. Depois calcula a sugestão e grava

  ultimo := dm.IBQuery3.RecordCount;
   funcoes.informacao(dm.IBQuery3.RecNo, ultimo, 'AGUARDE CALCULANDO ESTOQUE M�NIMO... ',false,TRUE,5);
  funcoes.informacao(0, ultimo,'Calculando Estoque M�nimo... ',true,false,2);
  while not dm.IBQuery3.Eof do
    begin
      funcoes.informacao(dm.IBQuery3.RecNo, ultimo, 'Calculando Estoque M�nimo... ',false,false,2);
      //pega a quantidade vendida no período(mínimo)
      sugestao := StrToCurrDef(sugestaoLista.Values[dm.IBQuery3.FieldByName('cod').AsString], 0);
      minimo   := StrToCurrDef(Lista.Values[dm.IBQuery3.FieldByName('cod').AsString], 0);

      if sugestao > 0 then begin
        minimo := Arredonda( minimo / periodo * periodoCalculoParGer, 2);
      end;



      {if not dm.IBselect.IsEmpty then
        begin
          minimo := dm.IBselect.FieldByName('quantVendida').AsCurrency;
          //if dm.IBQuery3.FieldByName('cod').AsInteger = 370 then
          //  showmessage('Vendidos: ' + Currtostr(minimo) + ' Periodo Calculo: ' + Currtostr(periodoCalculoParGer));
          minimo := Arredonda( minimo / periodo * periodoCalculoParGer, 2);
        end;}

      //pega a quantidade vendida nos últimos 60 dias(sugestão)
      {dm.IBselect.Close;
      dm.IBselect.ParamByName('dini').AsDateTime := dataSugestao;
      dm.IBselect.Open;
      sugestao := 0;
      if not dm.IBselect.IsEmpty then sugestao := dm.IBselect.FieldByName('quantVendida').AsCurrency;
      dm.IBselect.Close;}

      estoqueAtual := dm.IBQuery3.FieldByName('quant').AsCurrency + dm.IBQuery3.FieldByName('deposito').AsCurrency;

      sugestao := sugestao - estoqueAtual;
      if sugestao < 0 then sugestao := 0;

      //atualiza no cadastro do produto os campos estoque minimo e sugestão de compra, se houve alteração

	    if ((dm.IBQuery3.FieldByName('estoque').AsCurrency <> minimo) or (dm.IBQuery3.FieldByName('sugestao').AsCurrency <> sugestao)) then begin
        dm.IBQuery1.ParamByName('minimo').AsCurrency   := minimo;
        dm.IBQuery1.ParamByName('sugestao').AsCurrency := sugestao;
        dm.IBQuery1.ParamByName('cod').AsInteger := dm.IBQuery3.FieldByName('cod').AsInteger;
        dm.IBQuery1.ExecSQL;
        dm.IBQuery1.Close;
        alterados := alterados + 1;
      end;

     //próximo produto
     dm.IBQuery3.Next;
    end;

  if dm.IBQuery1.Transaction.InTransaction then dm.IBQuery1.Transaction.Commit;
  funcoes.informacao(dm.IBQuery3.RecNo, ultimo, 'AGUARDE CALCULANDO ESTOQUE M�NIMO... ',false,TRUE,5);

  lista.Free;
  dm.IBselect.Close;
  dm.IBQuery1.Close;
  dm.IBQuery3.Close;
  ShowMessage('Calculo de Estoque M�nimo Conclu�do com Sucesso. (' + inttostr(alterados) + ' produtos alterados)');
{var
  dini, dfim, sim, cods : string;
  ini, fim, ret, mei60 : TDateTime;
  periodo, a, codAtual, idx, b: integer;
  temp, sum, sugest, minimo, deposito : currency;
  listaProds : TItensAcumProd;
begin
  sum := StrToCurrDef(ConfParamGerais.Strings[18], 1);
  sim := funcoes.dialogo('not',0,'SN'+#8 + #27,0,false,'S','Control For Windows','Confirma C�lculo de Estoque M�nimo? S/N:','');
  if (sim = 'N') or (sim = '*') then exit;

  ini := form22.datamov - 180;
  fim := form22.datamov;

  dini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial de Movimento?',formatadataddmmyy(ini));
  if dini = '*' then exit;

  dfim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final de Movimento?',formatadataddmmyy(fim));
  if dfim = '*' then exit;
  periodo := 0;

  mei60 := StrToDateTime(dfim) - 60;
  periodo := DaysBetween(StrToDateTime(dini) , StrToDateTime(dfim));
  ShowMessage('Ser� Calculada uma M�dia pelo Movimento de ' + dini + ' at� ' + dfim + ' ('+ IntToStr(periodo) +' dias)');

  dm.produto.Close;
  dm.produto.Open;
  dm.produto.First;
  dm.produto.FetchAll;

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select cod, origem, sum(quant)as quant from item_venda  where (data >= :dini) and (data <= :dfim) group by cod, origem order by cod, origem');
  dm.IBselect.ParamByName('dini').AsDateTime := StrToDateTime(dini);
  dm.IBselect.ParamByName('dfim').AsDateTime := StrToDateTime(dfim);
  dm.IBselect.Open;
  dm.IBselect.FetchAll;

  listaProds := TItensAcumProd.Create;

  a := dm.produto.RecordCount;
  funcoes.informacao(0,2,'AGUARDE CALCULANDO... ',true,false,2);
  cods := '|';
  if periodo <= 0 then periodo := 0;

  while not dm.IBselect.Eof do
    begin
      funcoes.informacao(dm.IBselect.RecNo,a,'AGUARDE CALCULANDO... ',false,false,2);

      idx := listaProds.Find(dm.IBselect.fieldbyname('cod').AsInteger);
      if idx < 0 then
        begin
          idx := listaProds.Add(TacumProd.Create);
          listaProds[idx].cod   := dm.IBselect.fieldbyname('cod').AsInteger;
          if (dm.IBselect.fieldbyname('origem').AsInteger = 2) then
            begin
              listaProds[idx].dep   := dm.IBselect.fieldbyname('QUANT').AsCurrency;
              listaProds[idx].quant := 0;
            end
          else
            begin
              listaProds[idx].dep   := 0;
              listaProds[idx].quant := dm.IBselect.fieldbyname('QUANT').AsCurrency;
            end;
        end
      else
        begin
          if (dm.IBselect.fieldbyname('origem').AsInteger = 2) then
            begin
              listaProds[idx].dep   := listaProds[idx].dep + dm.IBselect.fieldbyname('QUANT').AsCurrency;
            end
          else
            begin
              listaProds[idx].quant := listaProds[idx].quant + dm.IBselect.fieldbyname('QUANT').AsCurrency;
            end;
        end;

      dm.IBselect.Next;
    end;

  ShowMessage(listaProds.getText);
  b := listaProds.Count -1;
  a := 0;
  funcoes.informacao(a,b,'AGUARDE CALCULANDO... ',false,true,2);
  funcoes.informacao(a,b,'AGUARDE CALCULANDO... ',true,false,2);
  for a := 0 to b do
    begin
      cods := cods + IntToStr(listaProds[a].cod) + '|';
      funcoes.informacao(a,b,'AGUARDE CALCULANDO... ',false,false,2);
      dm.IBQuery4.Close;
      dm.IBQuery4.SQL.Text := 'select quant, deposito from produto where cod = :cod';
      dm.IBQuery4.ParamByName('cod').AsInteger := listaProds[a].cod;
      dm.IBQuery4.Open;

      if listaProds[a].cod = 10559 then
        begin
          ShowMessage('sugestao= ' + CurrToStr((listaProds[a].quant + listaProds[a].dep)) + ' - ' +
          CurrToStr((dm.IBQuery4.fieldbyname('quant').AsCurrency + dm.IBQuery4.fieldbyname('deposito').AsCurrency)) + #13 +
          '= ' + CurrToStr(ABS( (listaProds[a].quant + listaProds[a].dep) - (dm.IBQuery4.fieldbyname('quant').AsCurrency + dm.IBQuery4.fieldbyname('deposito').AsCurrency))) + #13 +
          'periodo=' +IntToStr(periodo) + #13 +
          'param geral=' + CurrToStr(sum) + #13 +
          'minimo= ' + CurrToStr(Arredonda((listaProds[a].quant + listaProds[a].dep)/ periodo * sum, 2)));
        end;

      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Clear;
      dm.IBQuery1.SQL.Add('update produto set estoque = :esto, sugestao = :su where cod= :cod');
      dm.IBQuery1.ParamByName('esto').AsCurrency := IfThen(periodo = 0, 0, Arredonda((listaProds[a].quant + listaProds[a].dep)/ periodo * sum, 2)) ;
      ///dm.IBQuery1.ParamByName('su').AsCurrency := MAIOR(0, ABS(listaProds[a].quant + listaProds[a].dep) - (dm.IBQuery4.fieldbyname('quant').AsCurrency + dm.IBQuery4.fieldbyname('deposito').AsCurrency) );
      dm.IBQuery1.ParamByName('su').AsCurrency := MAIOR(0,  ((listaProds[a].quant + listaProds[a].dep) - abs(dm.IBQuery4.fieldbyname('quant').AsCurrency + dm.IBQuery4.fieldbyname('deposito').AsCurrency)) );
      dm.IBQuery1.ParamByName('cod').AsInteger := listaProds[a].cod;
      dm.IBQuery1.ExecSQL;
    end;

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Clear;
  dm.IBQuery1.SQL.Add('update produto set estoque = 0, sugestao = -1 where position(''|'' || cod || ''|'' in '+QuotedStr(cods)+') = 0');
  //dm.IBQuery1.ParamByName('texto').AsString := cods;
  dm.IBQuery1.ExecSQL;
  dm.IBQuery1.Transaction.Commit;

  funcoes.informacao(dm.IBselect.RecNo,a,'AGUARDE SUGEST�ES DE ESTOQUE...',false,TRUE,5);
  dm.IBselect.Close;
  dm.IBQuery2.Close;
  dm.IBQuery1.Close;
  dm.produto.First;
  ShowMessage('Calculo de Estoque M�nimo Conclu�do com Sucesso');}
end;

procedure TForm2.Compras1Click(Sender: TObject);
begin
  form20 := TForm20.Create(self);
  form20.tipoV := 'C';
  form20.Compra := true;
  Form20.LabelVenda.Caption := 'Compra';
  form20.origem := 1;
  form20.Caption := 'Modo Compra';
  form20.saidaDeEstoque := false;
  form20.JsEditData1.Text := DateTimeToStr(form22.datamov);
  funcoes.CtrlResize(tform(form20));
  form20.ShowModal;
  form20.Free;    
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
   Vendas1Click(sender);
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
   Consultas1Click(sender);   
end;

procedure TForm2.AtualizarControlW1Click(Sender: TObject);
begin
  if not FileExists(caminhoEXE_com_barra_no_final + 'atualiza.exe') then
    begin
      ShowMessage('Arquivo (atualiza.exe) n�o foi encontrado na pasta do sistema.');
      exit;
    end;

  //fornec := copy(ParamStr(0),1, funcoes.PosFinal('\', ParamStr(0))) + 'atualiza.exe';
  WinExec(pansichar(ansistring(caminhoEXE_com_barra_no_final + 'atualiza.exe')),SW_SHOWNORMAL);
  Application.Terminate;
end;

procedure TForm2.AtualizarTabelaIBPT1Click(Sender: TObject);
begin
  funcoes.atualizaTabelaIBPT(true);
end;

procedure TForm2.Reimpresso2Click(Sender: TObject);
begin
  NfeVenda := TNfeVenda.Create(self);
  try
    if ConfParamGerais[36] <> 'N' then NfeVenda.Reimpressao
      else NfeVenda.Reimpressao1;
  except
    on e:exception do
      begin
        if funcoes.Contido('LENGTH', UpperCase(e.Message)) then
          begin
            //NfeVenda.GeraXml;
          END;
      end;
  end;    
  NfeVenda.Free;
end;

procedure TForm2.AtualizarAliquotasSmallSoft2Click(Sender: TObject);
begin
  funcoes.gravaConfigTerminal('');
  ShowMessage('Configura��es Excluidas com Sucesso!');
end;

procedure TForm2.AtualizarBD1Click(Sender: TObject);
begin
  //funcoes.VerificaVersao_do_bd;
  //ShowMessage('Banco de Dados Atualizado');

  funcoes.atualizaBD;
  Try
     //funcoes.VerificaVersao_do_bd; //atualizaBD
   except
     on e : exception do
       begin
         gravaErrosNoArquivo(e.Message, 'Project1', '152', 'funcoes.VerificaVersao_do_bd;');
       end;
   end;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  hora.Caption := FormatDateTime('hh:mm:ss', now);
end;

procedure TForm2.RecuperarNota1Click(Sender: TObject);
begin
  NfeVenda := TNfeVenda.Create(self);
  try
    if ConfParamGerais[36] <> 'N' then NfeVenda.RecuperarNota('')
      else NfeVenda.RecuperarNota1('');
  except
    on e:exception do
      begin
        if funcoes.Contido('LENGTH', UpperCase(e.Message)) then
          begin
            //NfeVenda.GeraXml;
          END;
      end;
  end;
  NfeVenda.Free;
end;

procedure TForm2.PorVendedor2Click(Sender: TObject);
begin
  funcoes.RelVendasPorVendedor('M');
end;

procedure TForm2.PorVendedorNota1Click(Sender: TObject);
var
  ini, fim, h1, vend, cliente, sim, no :string;
  totalGeral, desc, totVend : currency;
  i, l, tam, tmp, fim1, INDDESC : integer;
  listpag : TItensProduto;
  val : array[1..3] of currency;
begin
  vend := '';
  H1 := '';
  vend := funcoes.dialogo('generico',30,'1234567890'+#8,30, FALSE,'',Application.Title,'Qual o C�digo do Vendedor?','');
  if (vend = '*') then exit;

  if vend <> '' then
    begin
      dm.IBselect.Close;
      dm.IBselect.SQL.Clear;
      dm.IBselect.SQL.Add('select cod from vendedor where cod = :cod');
      dm.IBselect.ParamByName('cod').AsString := vend;
      dm.IBselect.Open;

      if dm.IBselect.IsEmpty then
        begin
          ShowMessage('Cliente N�o Encontrado!');
          dm.IBselect.Close;
          exit;
        end;
      dm.IBselect.Close;
    end;

  ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?','');
  if ini = '*' then exit;
  fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?','');
  if fim = '*' then exit;

  sim := funcoes.dialogo('generico',0,'SN',20,false,'S',Application.Title,'Imprimir Pre�o das Mercadorias?','N');
  if sim = '*' then exit;

  if vend <> '' then h1 := ' and (v.vendedor =' + vend + ')';
  i := 55;

  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select v.data, v.nota, v.vendedor, v.desconto, v.total, v.codhis, v.cliente from venda v' +
  ' where (v.cancelado = 0) and ((v.data >= :dini) and (v.data <= :dfim)) '+h1+' order by v.vendedor, v.data');
  dm.IBselect.ParamByName('dini').AsDateTime := StrToDateTimeDef(ini, form22.datamov);
  dm.IBselect.ParamByName('dfim').AsDateTime := StrToDateTimeDef(fim, form22.datamov);
  dm.IBselect.Open;
  dm.IBselect.FetchAll;

  if dm.IBselect.IsEmpty then
    begin
      dm.IBselect.Close;
      ShowMessage('Nenhum Resultado na Pesquisa');
      exit;
    end;

  listpag := TItensProduto.Create;
  //if vend = '' then vend := dm.IBselect.fieldbyname('vendedor').AsString;
  no   := 'xxx';
  desc := 0;
  totalGeral := 0;
  totVend := 0;

  if form22.Pgerais.Values['nota'] = 'T' then tam := 39
  else tam := 80;

  form19.RichEdit1.Clear;
  funcoes.informacao(0, 0, 'Aguarde, Gerando Relat�rio...', true, false, 5);

  addRelatorioForm19(funcoes.CompletaOuRepete('','','-', tam) + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete(LeftStr(funcoes.LerValorPGerais('empresa',form22.Pgerais), 25),'DATA: '+FormatDateTime('dd/mm/yy', now),' ',tam)+#13+#10);
  addRelatorioForm19(funcoes.CompletaOuRepete('VENDAS DE: ' + FormatDateTime('dd/mm/yy',StrToDateDef(ini, form22.datamov)) + ' A ' + FormatDateTime('dd/mm/yy',StrToDateDef(fim, form22.datamov)) ,'' ,' ',tam)+#13+#10);
  addRelatorioForm19('VENDEDOR: ' + VEND + ' - ' + copy(funcoes.BuscaNomeBD(dm.ibquery1, 'nome', 'vendedor', 'where cod = ' + vend), 1, 15) + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', tam) + #13 + #10);

  addRelatorioForm19('  NOTA   DATA    CLIENTE                         TOTAL' + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', tam) + #13 + #10);

  while not dm.IBselect.Eof do
    begin
      funcoes.informacao(dm.IBselect.RecNo, fim1, 'Aguarde, Gerando Relat�rio...', false, false, 5);

      cliente := dm.IBselect.FieldByName('cliente').AsString;
      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Text := 'select nome from cliente where cod = :cod';
      dm.IBQuery1.ParamByName('cod').AsString := strnum(cliente);
      dm.IBQuery1.Open;

      cliente := cliente + '-' + dm.IBQuery1.FieldByName('nome').AsString;
      cliente := LeftStr(cliente, 25);

      addRelatorioForm19(funcoes.CompletaOuRepete('', (dm.IBselect.FieldByName('nota').AsString),' ',6) + ' ' + FormatDateTime('dd/mm/yy', dm.IBselect.FieldByName('data').AsDateTime) + ' ' +
      funcoes.CompletaOuRepete(cliente, '', ' ', 25) + funcoes.CompletaOuRepete('', formataCurrency(dm.IBselect.FieldByName('total').AsCurrency), ' ', 14)  + #13 + #10);

      totalGeral := totalGeral + dm.IBselect.FieldByName('total').AsCurrency;

      dm.IBselect.Next;
    end;

      addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', tam) + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete('Total R$: ', formataCurrency(totalGeral), ' ', 39) + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', tam) + #13 + #10);

      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',tam)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('Total Geral =>',formataCurrency(totalGeral),' ',tam)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',tam)+ #13+ #10))));

      listpag.Free;
      dm.IBselect.Close;
      desc := 0;
      funcoes.informacao(dm.IBselect.RecNo, fim1, 'Aguarde, Gerando Relat�rio...', false, true, 5);
      form19.ShowModal;
end;

procedure TForm2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  cod : string;
begin
  if (ssCtrl in Shift) and (chr(Key) in ['M', 'm']) then
    begin
      cod := funcoes.localizar('Localizar Menu', 'menu', '','','','', '', true,false, false, '', 400, nil);
      cliqueMenu(COD);
    end;

  if (ssCtrl in Shift) and (chr(Key) in ['O', 'o']) then
    begin
      cod := funcoes.dialogo('generico',50,'1234567890'+#8,50,false,'','Control For Windows','Qual o C�digo do Menu ?','') ;
      cliqueMenu(COD);
    end;

  if key = 112 then funcoes.executaCalculadora //F1
  else if key = 113 then //F2
    begin
      if btnNFE1.Enabled then NotaFiscalEletrnica1Click(self);
    end
  else if key = 114 then  //F3
    begin
      if btnConsultaProd.Enabled then Consultas1Click(self);
    end
  else if key = 115 then  //F4
   begin
     if btnCadCliente.Enabled then Cliente1Click(self);
   end
  else if key = 116 then  //F5
    begin
      if btnVendas.Enabled then Vendas1Click(self);
    end
  else if key = 117 then  //F5
    begin
      if btnEntradaSimples.Enabled then btnEntradaSimples.Click;
    end;
end;

procedure TForm2.ExecutarComando1Click(Sender: TObject);
var
  sql : String;
begin
  sql := InputBox('Informe o Comando', 'SQL:', '');
  if sql = '' then exit;

  if contido('SELECT', UpperCase(sql)) then begin
    dm.IBselect.Close;
    dm.IBselect.SQL.Text := sql;
    dm.IBselect.Open;

    funcoes.busca(dm.IBselect, sql, '', '', '');

    {funcoes.CtrlResize(tform(form24));
    form24.sqlVenda := sql;
    form24.ShowModal;}

    exit;
  end;

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text := sql;
  dm.IBQuery1.ExecSQL;
  dm.IBQuery1.Transaction.Commit;

  ShowMessage('Comando Executado Com Sucesso!');
end;

procedure TForm2.ExportaDAV1Click(Sender: TObject);
var
  numPedido : string;
begin
  numPedido := funcoes.dialogo('generico',0,'1234567890'+#8,30, true,'',Application.Title,'Informe o N�mero Da Nota:',nota);
  if numPedido = '*' then exit;

  //funcoes.gravaVendaSmallPendente(numPedido);
end;

procedure TForm2.DadosAdicdeNotaFiscal1Click(Sender: TObject);
begin
  dadosAdicSped := TdadosAdicSped.Create(self);
  dadosAdicSped.ShowModal;
  dadosAdicSped.Free;
end;

procedure TForm2.CadastrodoContador1Click(Sender: TObject);
begin
   form46 := tform46.create(self);
   form46.ShowModal;
   form46.Free;
end;

procedure TForm2.SadadeEstoque2Click(Sender: TObject);
var
  saidaJustificativa : String;
begin
   Form20 := Tform20.Create(Self);
   form20.tipoV := 'S';
   form20.Modo_Venda := true;
   Form20.LabelVenda.Caption := 'Sa�da de Estoque';
   form20.origem := 1;
   form20.saidaDeEstoque := true;
   form20.Caption := 'Sa�da de Estoque: ';
   funcoes.CtrlResize(tform(form20));
   saidaJustificativa :='';

   while true do
     begin
       saidaJustificativa   := funcoes.dialogo('normal', 0, '',300, false,'','Justificativa de Sa�da','Qual a Justificativa?', saidaJustificativa); //funcoes.MensagemTextoInput('Justificativa De Sa�da', '');
       if saidaJustificativa = '*' then
         begin
           JsEdit.LiberaMemoria(form20);
           exit;
         end;

       if length(saidaJustificativa) >= 5 then Break;
     end;

   form20.justiSaida  := saidaJustificativa;

   Form20.ShowModal;
   form20.Free;
end;

procedure TForm2.InventEstoque1Click(Sender: TObject);
var
  dataInv, base, estoqueZero, fornec,
  fabric, codigo, aliquota, grupo, ordem, selecao, arredond, cond, tmp,
  impri, colIni, seqIni, nome : String;
  pag, tam : integer;
  reg : SmallInt;
  qtdade, preco1, total1, TOTGERAL : currency;
begin
  pag := 0;
  reg := 0;
  TOTGERAL := 0;
  dataInv := '';
  dataInv := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Confirme a data do invent�rio: ',formatadataddmmyy(EndOfTheMonth(StrToDateTime('01/12/' + FormatDateTime('yyyy', now)))));
  if dataInv = '*' then exit;

  base := funcoes.dialogo('not', 0, 'SNA', 20, true, 'S', Application.Title, 'Calcular com base no Pre�o da Venda (S-Sim, N-N�o, A-Atacado) ?', 'N');
  if base = '*' then exit;

  estoqueZero := funcoes.dialogo('not', 0, 'SN', 20, true, 'S', Application.Title, 'Imprimir Itens Com Estoque Zero (S-Sim, N-N�o) ?', 'N');
  if estoqueZero = '*' then exit;

  fornec := funcoes.dialogo('generico', 0, '1234567890' + #8, 50, false, '', Application.Title, 'Se Deseja Separa��o Por FORNECEDOR, Confirme com o C�digo:', '');
  if fornec = '*' then exit;

  fabric := funcoes.dialogo('generico', 0, '1234567890' + #8, 50, false, '', Application.Title, 'Se Deseja Separa��o Por FABRICANTE, Confirme com o C�digo:', '');
  if fabric = '*' then exit;

  aliquota := funcoes.dialogo('generico', 0, '1234567890' + #8, 50, false, '', Application.Title, 'Se Deseja Separa��o Por ALIQUOTA, Confirme com o C�digo:', '');
  if aliquota = '*' then exit;

  codigo := funcoes.dialogo('generico', 0, '1234567890' + #8, 50, false, '', Application.Title, 'Se Deseja Separa��o Por CODIGO, Qual o C�digo Inicial?', '');
  if codigo = '*' then exit;

  grupo := funcoes.dialogo('generico', 0, '1234567890' + #8, 50, false, '', Application.Title, 'Se Deseja Separa��o Por GRUPO, Confirme com o C�digo:', '');
  if grupo = '*' then exit;

  ordem := funcoes.dialogo('not', 0, '123', 50, true, 'S', Application.Title, 'Qual a Ordem do Relat�rio (1-Alfab�tica, 2-Fornecedor, 3-Fabricante) ?', '1');
  if ordem = '*' then exit;

  selecao := funcoes.dialogo('normal', 0, '123', 50, true, 'S', Application.Title, 'Qual o Crit�rio de Sele��o (1-Loja + Dep�sito, 2-Somente Loja, 3-Somente Dep�sito) ?', '1');
  if selecao = '*' then exit;

{  if selecao = '' then
    begin
      form39 := tform39.Create(self);
      form39.ListBox1.Items.Add('1 - LOJA + DEPOSITO');
      form39.ListBox1.Items.Add('2 - SOMENTE LOJA');
      form39.ListBox1.Items.Add('3 - SOMENTE DEPOSITO');
      form39.Position := poScreenCenter;
      selecao := funcoes.lista(Sender);
    end;
 }
  arredond := funcoes.dialogo('not', 0, 'SN', 20, true, 'S', Application.Title, 'Arrendondar Quantidades para Inteiro (S-Sim, N-N�o)?', 'S');
  if arredond = '*' then exit;

  impri := funcoes.dialogo('not', 0, 'SN', 20, true, 'S', Application.Title, 'Enviar para Impressora (S-Sim, N-N�o) ?', 'N');
  if impri = '*' then exit;

 // if impri = 'S' then
 //   begin
      colIni := funcoes.dialogo('generico', 0, '1234567890' + #8, 50, true, '', Application.Title, 'Confirme a Coluna Inicial de Impress�o:', '15');
      if colIni = '*' then exit;
//    end;

  seqIni := funcoes.dialogo('generico', 0, '1234567890' + #8, 50, true, '', Application.Title, 'Numera��o de Paginas Inicia em:', '1');
  if seqIni = '*' then exit;

  DM.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select * from registro');
  dm.IBselect.Open;

  if ordem = '1' then ordem := ' order by nome '
  else if ordem = '2' then ordem := ' order by fabric '
  else ordem := ' order by fornec ';

  if selecao = '1' then
    begin
      selecao := ' quant + deposito as quant ';
      tmp := 'quant + deposito';
    end
  else if selecao = '2' then
    begin
      selecao := ' quant ';
      tmp := 'quant';
    end
  else
    begin
      selecao := ' deposito as quant';
      tmp := 'deposito';
    end;

  if arredond = 'S' then selecao := 'cast(' + tmp + ' as integer) as quant ';


  if estoqueZero = 'N' then  estoqueZero := ' and (' + tmp + ' > 0) '
  else estoqueZero := '';

  if base = 'S' then base := 'p_venda'
  else if base = 'N' then base := 'p_compra as p_venda'
  else base := 'p_venda1 as p_venda';

  if fornec <> '' then fornec := ' and (fornec = ' + fornec + ') ';

  dm.IBQuery2.Close;
  dm.IBQuery2.SQL.Clear;
  dm.IBQuery2.SQL.Add('select cod,nome, unid, '+ base +', p_compra, '+ selecao +', deposito from produto where (substring(nome from 1 for 1) <> ''_'') ' + fornec + estoqueZero +  ' ' + ordem );
  dm.IBQuery2.Open;
  dm.IBQuery2.FetchAll;

  tam := 112;

  pag := StrToIntDef(seqIni, 1);
  pag := pag - 1;

  form19.RichEdit1.Clear;

  while not dm.IBQuery2.Eof do
    begin

      pag := pag + 1;
      //addRelatorioForm19('  ' + #15 + CRLF);
      addRelatorioForm19('|' + #15 + '|' + CRLF);
      addRelatorioForm19(funcoes.CompletaOuRepete('', '', ' ', StrToIntDef(colIni, 0)) +'________________________________________________________________________________________________________________' + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete('', '', ' ', StrToIntDef(colIni, 0)) +'|                                       REGISTRO DE INVENTARIO MODELO P7                                       |' + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete('', '', ' ', StrToIntDef(colIni, 0)) +funcoes.CompletaOuRepete('| FIRMA: ' + dm.IBselect.fieldbyname('nome').AsString, '|', ' ', tam) + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete('', '', ' ', StrToIntDef(colIni, 0)) +funcoes.CompletaOuRepete('| '+ funcoes.CompletaOuRepete('INSC. EST.: ' + dm.IBselect.fieldbyname('ies').AsString, '', ' ', 40) + 'CNPJ: ' + dm.IBselect.fieldbyname('cnpj').AsString, '|', ' ', tam) + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete('', '', ' ', StrToIntDef(colIni, 0)) +funcoes.CompletaOuRepete('| '+ funcoes.CompletaOuRepete('FOLHA: ' + IntToStr(pag), '', ' ', 40) + 'ESTOQUES EXISTENTES EM ' + FormatDateTime('dd', StrToDateTime(dataInv)) + ' DE ' + UpperCase(FormatDateTime('mmmm', StrToDateTime(dataInv))) + ' DE ' + FormatDateTime('yyyy', StrToDateTime(dataInv)), '|', ' ', tam) + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete('', '', ' ', StrToIntDef(colIni, 0)) +funcoes.CompletaOuRepete('|', '|', '_', tam) + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete('', '', ' ', StrToIntDef(colIni, 0)) +'|             |                                                |         |            |        VALORES         |' + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete('', '', ' ', StrToIntDef(colIni, 0)) +'|CLASSIFICACAO|                DISCRIMINACAO                   | UNIDADE | QUANTIDADE |________________________|' + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete('', '', ' ', StrToIntDef(colIni, 0)) +'|   FISCAL    |                                                |         |            | UNITARIO  |    TOTAL   |' + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete('', '', ' ', StrToIntDef(colIni, 0)) +'|_____________|________________________________________________|_________|____________|___________|____________|' + #13 + #10);

      reg := 0;



      for reg := 0 to 87 do
        begin
          if dm.IBQuery2.Eof then Break;
          qtdade := dm.IBQuery2.fieldbyname('quant').AsCurrency;
          preco1 := dm.IBQuery2.fieldbyname('p_venda').AsCurrency;
          total1 := Arredonda(qtdade * preco1, 2);
          nome := LeftStr(dm.IBQuery2.fieldbyname('nome').AsString, 48);

          if estoqueZero = 'N' then
            begin
              if qtdade > 0 then
                begin
                  addRelatorioForm19(funcoes.CompletaOuRepete('', '', ' ', StrToIntDef(colIni, 0)) +funcoes.CompletaOuRepete('|', '|', ' ', 15) + funcoes.CompletaOuRepete(nome, '|', ' ', 49) + funcoes.CompletaOuRepete(dm.IBQuery2.fieldbyname('unid').AsString, '|', ' ', 10) + funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00', qtdade) + '|', ' ', 13) + funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00', preco1) + '|', ' ', 12) + funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00', total1) + '|', ' ', 13) + #13 + #10);
                  TOTGERAL := TOTGERAL + total1;
                end;
            end
          else
            begin
              addRelatorioForm19(funcoes.CompletaOuRepete('', '', ' ', StrToIntDef(colIni, 0)) +funcoes.CompletaOuRepete('|', '|', ' ', 15) + funcoes.CompletaOuRepete(nome, '|', ' ', 49) + funcoes.CompletaOuRepete(dm.IBQuery2.fieldbyname('unid').AsString, '|', ' ', 10) + funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00', qtdade) + '|', ' ', 13) + funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00', preco1) + '|', ' ', 12) + funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00', total1) + '|', ' ', 13) + #13 + #10);
              TOTGERAL := TOTGERAL + total1;
            end;

          dm.IBQuery2.Next;
        end;

      if not dm.IBQuery2.Eof then
        begin
          addRelatorioForm19(funcoes.CompletaOuRepete('', '', ' ', StrToIntDef(colIni, 0)) + '_______________________________________________________________________________________________________________' + CRLF);
          addRelatorioForm19(#12);
        end
        else
          begin
            addRelatorioForm19(funcoes.CompletaOuRepete('', '', ' ', StrToIntDef(colIni, 0)) +funcoes.CompletaOuRepete('|', '|', '-', tam) + #13 + #10);
            addRelatorioForm19(funcoes.CompletaOuRepete('', '', ' ', StrToIntDef(colIni, 0)) +funcoes.CompletaOuRepete('| TOTAL GERAL R$ ',FormatCurr('#,###,###0.00', TOTGERAL)+ '|', '.', tam) + #13 + #10 );
            addRelatorioForm19(funcoes.CompletaOuRepete('', '', ' ', StrToIntDef(colIni, 0)) +funcoes.CompletaOuRepete('|', '|', '-', tam) + #13 + #10);
          end;
    end;


    dm.IBselect.Close;
    dm.IBQuery2.Close;

    if impri = 'S' then
      begin
        imprime.espac_dire := colIni;
        imprime.textxArq('');
        exit;
      end;

    funcoes.CharSetRichEdit(form19.richedit1);
    form19.ShowModal;
end;

procedure TForm2.GerarCargaBalana1Click(Sender: TObject);
begin
  funcoes.GeraCargaTXTBalanca;
end;

procedure TForm2.GerarRemessaSpedFiscal1Click(Sender: TObject);
begin
  REM_SPED;
end;

procedure TForm2.ResumodoDia1Click(Sender: TObject);
var
  ini, fim, ord, nota, impValores : string;
  TotalGeral, desconto, diferenca, quantTot : currency;
  b, ContaNota, i, fim1, ret, tam : integer;
  item : Ptr_Produto;
  lista : TList;
  tot_geral, tot_desc : TStringList;
begin
  ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(form22.datamov));
  if ini = '*' then exit;

  fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?',formatadataddmmyy(form22.datamov));
  if fim = '*' then exit;

  ord := funcoes.dialogo('generico', 0, '12', 50, true, 'S', Application.Title, 'Qual a Ordem (1-Descri��o, 2-C�digo)', '1');
  if ord = '*' then exit;

  impValores := funcoes.dialogo('generico', 0, 'SN', 50, true, 'S', Application.Title, 'Imprimir Valores ?', 'S');
  if impValores = '*' then exit;


  b        := 64;
  tam      := 60;
  quantTot := 0;

  if impValores = 'N' then begin
    tam := 40;
  end;


  form19.RichEdit1.Clear;
  addRelatorioForm19(funcoes.CompletaOuRepete('','','-',tam) + #13 + #10 );
  addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|',' ',tam)+#13+#10);
  if impValores = 'N' then addRelatorioForm19(funcoes.CompletaOuRepete('VENDAS DE: '+FormatDateTime('dd/mm/yy',StrToDate(ini))+' A '+FormatDateTime('dd/mm/yy',StrToDate(fim)),FormatDateTime('tt',now)+'|',' ',tam)+#13+#10)
  else addRelatorioForm19(funcoes.CompletaOuRepete('RESUMO DE VENDAS DE: '+FormatDateTime('dd/mm/yy',StrToDate(ini))+' A '+FormatDateTime('dd/mm/yy',StrToDate(fim)),'HORA: '+FormatDateTime('tt',now)+'|',' ',tam)+#13+#10);
  addRelatorioForm19(funcoes.CompletaOuRepete('','','-', tam)+#13+#10);
  if impValores = 'N' then addRelatorioForm19('CODIGO DESCRICAO                  QUANT.'+#13+#10)
  else addRelatorioForm19('CODIGO DESCRICAO                         QUANT.      VENDA'+#13+#10);
  addRelatorioForm19(funcoes.CompletaOuRepete('','','-', tam)+#13+#10);

  if ord = '2' then ord := 'i.cod'
    else ord := 'p.nome';

{  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select nota, desconto, total from VENDA where ((cancelado = 0) and ((data >= :v1) and (data <= :v2))) order by ' + ord);
  dm.IBselect.ParamByName('v1').AsDateTime := StrToDate(ini);
  dm.IBselect.ParamByName('v2').AsDateTime := StrToDate(fim);
  dm.IBselect.Open;
}
  desconto := 0;
  TotalGeral := 0;
  diferenca := 0;
  lista := TList.Create;

  dm.IBQuery2.Close;
  dm.IBQuery2.SQL.Clear;
  dm.IBQuery2.SQL.Add('select i.cod, i.total, i.nota, i.quant, v.desconto, v.total as tot_venda, p.nome from item_venda i, venda v, produto p where (p.cod = i.cod) and  (v.nota = i.nota) and ((i.data >= :v1) and (i.data <= :v2) and (v.cancelado = 0)) order by ' + ord);
  dm.IBQuery2.ParamByName('v1').AsDateTime := StrToDate(ini);
  dm.IBQuery2.ParamByName('v2').AsDateTime := StrToDate(fim);
  dm.IBQuery2.Open;

  nota := 'xx';
  tot_geral := TStringList.Create;
  tot_desc := TStringList.Create;

  while not dm.IBQuery2.Eof do
    begin
      fim1 := lista.Count - 1;
      ret := -1;

      for i := 0 to fim1 do
        begin
          item := lista[i];
          if item.cod = dm.IBQuery2.fieldbyname('cod').AsInteger then
            begin
              ret := i;
              break;
            end;
        end;

      if ret = -1 then
        begin
          item := new(ptr_produto);
          item.cod := dm.IBQuery2.fieldbyname('cod').AsInteger;
          item.qtd_atual := dm.IBQuery2.fieldbyname('quant').AsCurrency;
          item.nome := copy(dm.IBQuery2.fieldbyname('nome').AsString, 1, 33);
          item.tot1 := dm.IBQuery2.fieldbyname('total').AsCurrency;
          lista.Add(item);
        end
      else
        begin
          item := lista[ret];
          item.qtd_atual := item.qtd_atual + dm.IBQuery2.fieldbyname('quant').AsCurrency;
          item.tot1 := item.tot1 + dm.IBQuery2.fieldbyname('total').AsCurrency;
          item := lista[ret];
        end;

            //addRelatorioForm19(funcoes.CompletaOuRepete('', dm.IBQuery2.fieldbyname('cod').AsString,' ',6) + '-' + funcoes.CompletaOuRepete(copy(dm.IBQuery2.fieldbyname('nome').AsString, 1, 28), '',' ',28) + funcoes.CompletaOuRepete('', FormatCurr('##,###,###0.00', dm.IBQuery2.fieldbyname('quant').AsCurrency), ' ', 12) + funcoes.CompletaOuRepete('', FormatCurr('##,###,###0.00', dm.IBQuery2.fieldbyname('total').AsCurrency), ' ', 12) + #13 + #10);
    tot_geral.Values[dm.IBQuery2.fieldbyname('nota').AsString] := dm.IBQuery2.fieldbyname('tot_venda').AsString;
    tot_desc.Values[dm.IBQuery2.fieldbyname('nota').AsString] := dm.IBQuery2.fieldbyname('desconto').AsString;

    //TotalGeral := TotalGeral + dm.IBQuery2.fieldbyname('total').AsCurrency;
    dm.IBQuery2.Next;

    //desconto := desconto + dm.IBselect.fieldbyname('desconto').AsCurrency;
  end;
     fim1 := lista.Count - 1;

     desconto := 0;
     TotalGeral := 0;

     for i := 0 to tot_geral.Count - 1 do
       begin
         desconto := desconto + StrToCurrDef(tot_desc.ValueFromIndex[i], 0);
         TotalGeral := TotalGeral + StrToCurrDef(tot_geral.ValueFromIndex[i], 0);
       end;

     for i := 0 to fim1 do
       begin
         item := lista[i];

         if ((form19.RichEdit1.Lines.Count > b) and (impValores <> 'N')) then
           begin
             b := b + 80;
             addRelatorioForm19(funcoes.CompletaOuRepete('','','-',tam) + #12 + #13 + #10);
             addRelatorioForm19(funcoes.CompletaOuRepete('','','-',tam) + #13 + #10 );

             addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|',' ',tam)+#13+#10);
             if impValores = 'N' then addRelatorioForm19(funcoes.CompletaOuRepete('VENDAS DE: '+FormatDateTime('dd/mm/yy',StrToDate(ini))+' A '+FormatDateTime('dd/mm/yy',StrToDate(fim)),FormatDateTime('tt',now)+'|',' ',tam)+#13+#10)
             else addRelatorioForm19(funcoes.CompletaOuRepete('RESUMO DE VENDAS DE: '+FormatDateTime('dd/mm/yy',StrToDate(ini))+' A '+FormatDateTime('dd/mm/yy',StrToDate(fim)),'HORA: '+FormatDateTime('tt',now)+'|',' ',tam)+#13+#10);
             addRelatorioForm19(funcoes.CompletaOuRepete('','','-', tam)+#13+#10);
             if impValores = 'N' then addRelatorioForm19('CODIGO DESCRICAO                           QUANT.'+#13+#10)
             else addRelatorioForm19('CODIGO DESCRICAO                         QUANT.      VENDA'+#13+#10);
             addRelatorioForm19(funcoes.CompletaOuRepete('','','-', tam)+#13+#10);
           end;

         if impValores = 'N' then
           addRelatorioForm19
           (funcoes.CompletaOuRepete(copy(IntToStr(item.cod) + '-' +
           item.nome, 1, 34), '', ' ', 35) + funcoes.CompletaOuRepete
           ('', FormatCurr('0', item.qtd_atual), ' ', 5) + #13 + #10)
         else  addRelatorioForm19(funcoes.CompletaOuRepete('', IntToStr(item.cod),' ',6) + '-' + funcoes.CompletaOuRepete(item.nome , '',' ',33) + funcoes.CompletaOuRepete('', FormatCurr('##,###,###0.00', item.qtd_atual), ' ', 10) + funcoes.CompletaOuRepete('', FormatCurr('##,###,###0.00', item.tot1), ' ', 10) + #13 + #10);

         quantTot := quantTot  + item.qtd_atual;
       end;

     dm.IBQuery2.Close;
     dm.IBselect.Close;


     if desconto <> 0 then begin
        if impValores = 'N' then addRelatorioForm19(funcoes.CompletaOuRepete('', '0', ' ', 5) + '-' +
          funcoes.CompletaOuRepete('DESCONTO', '', ' ', 24) +
          funcoes.CompletaOuRepete('', FormatCurr('0.00', desconto), ' ', 10) +
          #13 + #10)
        else addRelatorioForm19(funcoes.CompletaOuRepete('', '0',' ',6) + '-' + funcoes.CompletaOuRepete('Desconto', '',' ',33) + funcoes.CompletaOuRepete('', FormatCurr('##,###,###0.00', 0), ' ', 10) + funcoes.CompletaOuRepete('', FormatCurr('##,###,###0.00', desconto), ' ', 10) + #13 + #10);
     end;
     addRelatorioForm19(funcoes.CompletaOuRepete('','','-', tam) + #13 + #10);
     if impValores = 'N' then addRelatorioForm19('TOTAL=>' + funcoes.CompletaOuRepete('', FormatCurr('0.00', TotalGeral), ' ', 10) + '   QUANT=>' + funcoes.CompletaOuRepete('', FormatCurr('0.00', quantTot), ' ', 12) + #13 + #10)
     else addRelatorioForm19('TOTAL RECEBIDO =>' + funcoes.CompletaOuRepete('', FormatCurr('##,###,###0.00', TotalGeral), ' ', 16) + '  DIFERENCA =>' + funcoes.CompletaOuRepete('', FormatCurr('##,###,###0.00', 0), ' ', 13) + #13 + #10);
     addRelatorioForm19(funcoes.CompletaOuRepete('','','-', tam) + #13 + #10);
     form19.RichEdit1.SelStart := 0;
     form19.ShowModal;
end;

procedure TForm2.FechamentosdeVendas1Click(Sender: TObject);
var
  sim, vend, imp, vendTemp : String;
  ValorFecha : integer;
begin
  sim := funcoes.dialogo('generico', 20, 'SN'+#8, 20, true,'S','Control For Windows','Confirma Fechamento de Vendas?SIM ou N�O (S/N):','') ;
  if (sim = '*') or (sim = 'N') then exit;

  vend := funcoes.dialogo('generico',0,'1234567890'+#8,0,false,'','Control For Windows','Informe o C�digo do Vendedor:','') ;
  if vend = '*' then exit;

  if vend <> '' then
    begin
      dm.IBselect.Close;
      dm.IBselect.SQL.Clear;
      dm.IBselect.SQL.Add('select cod from vendedor where cod = :cod');
      dm.IBselect.ParamByName('cod').AsString := vend;
      try
        dm.IBselect.Open;

        if dm.IBselect.IsEmpty then
          begin
            dm.IBselect.Close;
            ShowMessage('Vendedor n�o encontrado');
            exit;
          end;
      except
        ShowMessage('Vendedor n�o encontrado');
        dm.IBselect.Close;
        exit
      end;

    end;

  imp := funcoes.dialogo('generico',0,'SN'+#8,0,true,'S','Control For Windows','Enviar para Impressora?SIM ou N�O (S/N):','') ;
  if imp = '*' then exit;

  vendTemp := '';
  if vend <> '' then vendTemp := 'and (vendedor = '+ vend +')';
  ValorFecha := StrToInt(Incrementa_Generator('FECHAMENTO', 0));

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Clear;
  dm.IBQuery1.SQL.Add('UPDATE VENDA SET FECHAMENTO = :FECH WHERE (cancelado = 0) and (FECHAMENTO = 0) ' + vendTemp);
  dm.IBQuery1.ParamByName('FECH').AsInteger := ValorFecha;
  dm.IBQuery1.ExecSQL;

  dm.IBQuery1.Transaction.Commit;

  Incrementa_Generator('FECHAMENTO', 1);

  funcoes.geraRelFechamento(ValorFecha, vend);

  if imp = 'S' then imprime.textx('')
  else form19.ShowModal;


end;

procedure TForm2.PorFechamento1Click(Sender: TObject);
var
  fech, imp : string;
begin
  fech := IntToStr(StrToInt(Incrementa_Generator('FECHAMENTO', 0)) -1);
  if StrToIntDef(fech, -1) < 0 then fech := '0';

  fech := funcoes.dialogo('generico',0,'1234567890'+#8,0,false,'','Control For Windows','Qual o Numero de Fechamento?', fech) ;
  if fech = '*' then exit;

  imp := funcoes.dialogo('generico',0,'SN'+#8,0,true,'S','Control For Windows','Enviar para Impressora?SIM ou N�O (S/N):','') ;
  if imp = '*' then exit;

  funcoes.geraRelFechamento(StrToInt(fech), '');

  if imp = 'S' then imprime.textx('')
  else form19.ShowModal;

end;

procedure TForm2.SincronizarEstoque1Click(Sender: TObject);
VAR
  unid : String;
  listUnidades : String;
begin
  unid := '';
  listUnidades := funcoes.listaUnidades;

  if form22.usuario = 'ADMIN' then unid := funcoes.dialogo('generico',0,'CDEFGHIJ',50,false,'S',Application.Title,'Confirme o Drive para Gerar a Exporta��o ('+listUnidades+')?', ConfParamGerais[33])
  else unid := funcoes.dialogo('generico',0,listUnidades,50,false,'S',Application.Title,'Confirme o Drive para Gerar a Exporta��o ('+listUnidades+')?', ConfParamGerais[33]);
  if unid = '*' then exit;

  if ((not Contido(unid, listUnidades)) and (form22.usuario <> 'ADMIN')) then begin
    MessageDlg('Escolha Uma das Unidades Dispon�veis: ' + #13 + funcoes.listaUnidadesComDescricoes.GetText, mtConfirmation, [mbOK], 1);
    exit;
  end
  else begin
    dm.IBQuery1.Close;
    dm.IBQuery1.SQL.Text := 'update pgerais set valor = :valor where cod = 33';
    dm.IBQuery1.ParamByName('valor').AsString := unid;
    dm.IBQuery1.ExecSQL;
    dm.IBQuery1.Transaction.Commit;

    ConfParamGerais[33] := unid;
  end;

  unid := unid + ':\';
  
  if funcoes.SincronizarExtoque1(unid + 'MATRIZ.DAT') then ShowMessage('Sincroniza��o criada com sucesso.');
end;

procedure TForm2.ReceberEstFilial1Click(Sender: TObject);
VAR
  unid : String;
begin
  unid := '';
  unid := funcoes.dialogo('generico',0,'ABCDEFGHIJLMNOPKXYZWQRSTUVXZ',50,false,'S',Application.Title,'Confirme o Drive para Receber a Exporta��o?', ConfParamGerais[33]);
  if unid = '*' then exit;
  unid := unid + ':\';

  if funcoes.receberSincronizacaoExtoque1(unid + 'MATRIZ.DAT') then ShowMessage('Sincronizado com sucesso.');
end;

procedure TForm2.ZerarEstoque1Click(Sender: TObject);
var
  senha, sen, sim, nega, h1 : String;
begin
  WWMessage('Aten��o! Todos os Itens do Estoque Ter�o suas Quantidades Zeradas!',mtInformation,[mbOK],HexToTColor('FFD700'),true,false,HexToTColor('B22222'));
  senha := funcoes.dialogo('generico',30,'1234567890'+#8,30,false,'',Application.Title,'Qual a senha do Dia?','');
  if senha = '*' then exit;


  sen := IntToStr(StrToIntDef(FormatDateTime('dd', form22.datamov), 1) * StrToIntDef(FormatDateTime('mm', form22.datamov), 1));
  if senha <> sen then
    begin
      ShowMessage('Senha Incorreta');
      exit;
    end;

  sim := funcoes.dialogo('generico',30,'SN', 30, false,'S',Application.Title,'Confirma Proseguimento para Zerar Estoque?','N');
  if (sim = 'N') or (sim = '*') then exit;
  if dm.IBQuery1.Transaction.InTransaction then dm.IBQuery1.Transaction.Commit;
  nega := funcoes.dialogo('generico',30,'SN'+#8,30,true,'S',Application.Title,'Somente Negativos ?','N');
  if nega = '*' then exit;

  h1 := '';
  if nega = 'S' then  h1 := ' where (quant + deposito < 0)';
  

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Clear;
  dm.IBQuery1.SQL.Add('update produto set quant = 0, deposito = 0 ' + h1);
  dm.IBQuery1.ExecSQL;

  dm.IBQuery1.Transaction.Commit;

  ShowMessage('Produtos Zerados com Sucesso: ' + IntToStr(dm.IBselect.RowsAffected));

  //funcoes.VER_ESTOQUE('ACERTA', 'Lan�ando Acertos de Estoque', 'Acert');
end;

procedure TForm2.ExportarNota1Click(Sender: TObject);
var
  nota, linha, caminho : String;
  total : currency;
  arq : TStringList;
begin
  nota := funcoes.dialogo('generico',0,'1234567890'+#8,50,true,'',Application.Title,'Qual a N�mero da Nota de Pedido a ser Enviada para a Filial?','');
  if nota = '*' then exit;

  if ConfParamGerais[33] = '' then caminho := 'E'
  else caminho := ConfParamGerais[33];
  caminho := funcoes.dialogo('generico',0,'ABCDEFGHIJLMNOPKXYZWQRSTUVXZ',50,false,'S',Application.Title,'Confirme o Drive para Gerar a Exporta��o?', caminho);
  if caminho = '*' then exit;

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select vendedor, total from venda where nota = :nota');
  dm.IBselect.ParamByName('nota').AsString := nota;
  dm.IBselect.Open;

  if dm.IBselect.IsEmpty then
    begin
      ShowMessage('Nota n�o encontrada');
      dm.IBselect.Close;
      exit;
    end;
  total := dm.IBselect.fieldbyname('total').AsCurrency;

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select i.cod, i.unid, p.p_compra, i.quant, i.data, i.p_venda, p.nome, p.codbar from item_venda i left join produto p on (i.cod = p.cod) where nota = :nota');
  dm.IBselect.ParamByName('nota').AsString := nota;
  dm.IBselect.Open;

  arq := TStringList.Create;
  caminho := caminho + ':\REMESSA.DAT';
  // cria um arquivo de texto com indice para ser exportado para texto
  //0 - c�digo
  //1 - unidade
  //2 - decricao
  //3 - preco
  //4 - qtd
  //5 - nota
  //6 - total da nota
  //7 - data
  //8 - p_compra
  //9 - codbar

  while not dm.IBselect.Eof do
    begin
      linha := '-0- -1- -2- -3- -4- -5- -6- -7- -8- -9- -10- -11-';
      linha := GravarConfig(linha, dm.IBselect.fieldbyname('cod').AsString, 0);
      linha := GravarConfig(linha, dm.IBselect.fieldbyname('unid').AsString, 1);
      linha := GravarConfig(linha, dm.IBselect.fieldbyname('nome').AsString, 2);
      linha := GravarConfig(linha, dm.IBselect.fieldbyname('p_venda').AsString, 3);
      linha := GravarConfig(linha, dm.IBselect.fieldbyname('quant').AsString, 4);
      linha := GravarConfig(linha, nota, 5);
      linha := GravarConfig(linha, CurrToStr(total), 6);
      linha := GravarConfig(linha, FormatDateTime('dd/mm/yyyy', dm.IBselect.fieldbyname('data').AsDateTime), 7);
      linha := GravarConfig(linha, CurrToStr(dm.IBselect.fieldbyname('p_compra').AsCurrency), 8);
      linha := GravarConfig(linha, dm.IBselect.fieldbyname('codbar').AsString, 9);

      //linha := funcoes.Criptografar(linha);

      arq.Add(linha);
      dm.IBselect.Next;
    end;

   try
     arq.SaveToFile(caminho);
   except
     ShowMessage('Ocorreu um Erro. Verifique a Unidade de Grava��o');
     arq.Free;
     dm.IBselect.Close;
     exit;
   end;

   arq.Free;
   dm.IBselect.Close;

   ShowMessage('Nota Enviada para ' + caminho);
end;

procedure TForm2.ReceberNota1Click(Sender: TObject);
var
  nota, linha, caminho, sim, genProd : String;
  i, fim : integer;
  total : currency;
  arqi : TStringList;
begin
  caminho := funcoes.dialogo('generico',0,'ABCDEFGHIJLMNOPKXYZWQRSTUVXZ',50,false,'S',Application.Title,'Confirme a unidade para Recebimento da Remessa:', ConfParamGerais[33]);
  if caminho = '*' then exit;

  arqi := TStringList.Create;
  try
    arqi.LoadFromFile(caminho + ':\REMESSA.DAT');
  except
    ShowMessage('Ocorreu um Erro. Verifique a Unidade foi Informada Corretamente.');
    arqi.Free;
    exit;
  end;

  genProd := Incrementa_Generator('produto', 0);

  form33 := TForm33.Create(self);
  form33.Caption := 'Verifica��o de Itens de Entrada';

  form33.ClientDataSet1.FieldDefs.Clear;
  form33.ClientDataSet1.FieldDefs.Add('CODIGO'   , ftInteger);
  form33.ClientDataSet1.FieldDefs.Add('DESCRICAO', ftString, 40);
  form33.ClientDataSet1.FieldDefs.Add('CODBAR'   , ftString, 15);
  form33.ClientDataSet1.FieldDefs.Add('UNID'     , ftString, 3);
  form33.ClientDataSet1.FieldDefs.Add('P_VENDA'  , ftCurrency);
  form33.ClientDataSet1.FieldDefs.Add('P_COMPRA' ,ftCurrency);
  form33.ClientDataSet1.FieldDefs.Add('QUANT'    ,ftCurrency);

  form33.DataSource1.DataSet := form33.ClientDataSet1;
  Form33.DBGrid1.DataSource  := form33.DataSource1;

  form33.ClientDataSet1.CreateDataSet;
  form33.ClientDataSet1.LogChanges := false;
  form33.ClientDataSet1.FieldByName('unid').Visible := false;
  TCurrencyField(form33.ClientDataSet1.FieldByName('P_VENDA')).currency       := false;
  TCurrencyField(form33.ClientDataSet1.FieldByName('QUANT')).currency         := false;
  TCurrencyField(form33.ClientDataSet1.FieldByName('P_COMPRA')).currency      := false;
  TCurrencyField(form33.ClientDataSet1.FieldByName('QUANT')).DisplayFormat    := '#,###,###0.00';
  TCurrencyField(form33.ClientDataSet1.FieldByName('P_VENDA')).DisplayFormat  := '#,###,###0.00';
  TCurrencyField(form33.ClientDataSet1.FieldByName('P_COMPRA')).DisplayFormat := '#,###,###0.00';
  form33.campobusca := 'DESCRICAO';

  fim := arqi.Count - 1;

  //0 - c�digo
  //1 - unidade
  //2 - decricao
  //3 - preco
  //4 - qtd
  //5 - nota
  //6 - total da nota
  //7 - data
  //8 - p_compra
  //9 - codbar

  for i := 0 to fim do
    begin
      //arqi[i] := funcoes.DesCriptografar(arqi[i]);
    end;

  total := 0;
  for i := 0 to fim do
    begin
      linha := '';
      form33.ClientDataSet1.Open;
      form33.ClientDataSet1.Insert;
      form33.ClientDataSet1.FieldByName('codigo').AsString     := funcoes.LerConfig(arqi[i], 0);
      form33.ClientDataSet1.FieldByName('descricao').AsString  := funcoes.LerConfig(arqi[i], 2);
      form33.ClientDataSet1.FieldByName('unid').AsString       := copy(funcoes.LerConfig(arqi[i], 1), 1, 3);
      form33.ClientDataSet1.FieldByName('CODBAR').AsString     := funcoes.LerConfig(arqi[i], 9);
      form33.ClientDataSet1.FieldByName('P_COMPRA').AsCurrency := StrToCurrDef(funcoes.LerConfig(arqi[i], 8), 0);
      form33.ClientDataSet1.FieldByName('P_VENDA').AsCurrency  := StrToCurrDef(funcoes.LerConfig(arqi[i], 3), 0);
      form33.ClientDataSet1.FieldByName('quant').AsCurrency    := StrToCurrDef(funcoes.LerConfig(arqi[i], 4), 0);
      form33.ClientDataSet1.Post;
      nota := funcoes.LerConfig(arqi[i], 5);
      total := total + Arredonda(form33.ClientDataSet1.FieldByName('P_COMPRA').AsCurrency * form33.ClientDataSet1.FieldByName('quant').AsCurrency, 2);
    end;

 dm.IBselect.Close;
 dm.IBselect.SQL.Clear;
 dm.IBselect.SQL.Add('select nota from entrada where (nota = :nota) and (fornec = 0)');
 dm.IBselect.ParamByName('nota').AsString := nota;
 dm.IBselect.Open;

 if not dm.IBselect.IsEmpty then
   begin
     WWMessage('Esta nota n�o pode ser inserida pois j� existe uma nota com a numera��o ' + nota + '.',mtInformation,[mbOK],HexToTColor('FFD700'),true,false,HexToTColor('B22222'));
     dm.IBselect.Close;
     form33.ClientDataSet1.Free;
     form33.Free;
     exit;
   end;

 form33.Caption := 'Itens da Nota ' + nota;
 arqi.Free;
 form33.ShowModal;

 sim := funcoes.dialogo('generico',0,'SN'+#8,0,true,'S','Control For Windows','Confirma Recebimento da Nota '+ nota +' no Valor de R$ '+ FormatCurr('#,###,###0.00', total) +' ?SIM ou N�O (S/N):','') ;
 if ((sim = '*') or (sim = 'N')) then
   begin
     form33.ClientDataSet1.EmptyDataSet;
     form33.Free;
     dm.IBselect.Close;
     exit;
   end;

  if dm.IBQuery4.Transaction.InTransaction then dm.IBQuery4.Transaction.Commit;
  dm.IBQuery4.Transaction.StartTransaction;

  // Aqui vai verificar se o produto est� cadastrado, se nao existir ent�o cadastra
  Form33.ClientDataSet1.First;
  while not form33.ClientDataSet1.Eof do
    begin
      dm.IBselect.Close;
      dm.IBselect.SQL.Clear;
      dm.IBselect.SQL.Add('select cod from produto where cod = :cod');
      dm.IBselect.ParamByName('cod').AsString := form33.ClientDataSet1.fieldbyname('codigo').AsString;
      dm.IBselect.Open;

      if dm.IBselect.IsEmpty then
        begin
          dm.IBQuery1.Close;
          dm.IBQuery1.SQL.Clear;
          dm.IBQuery1.SQL.Add('insert into produto(cod, nome, unid, codbar, p_compra, p_venda) values(:cod, :nome, :unid, :codbar, :p_compra, :p_venda)');
          dm.IBQuery1.ParamByName('cod').AsString        := form33.ClientDataSet1.fieldbyname('codigo').AsString;
          dm.IBQuery1.ParamByName('nome').AsString       := form33.ClientDataSet1.fieldbyname('descricao').AsString;
          dm.IBQuery1.ParamByName('unid').AsString       := form33.ClientDataSet1.fieldbyname('unid').AsString;
          dm.IBQuery1.ParamByName('codbar').AsString     := form33.ClientDataSet1.fieldbyname('codbar').AsString;
          dm.IBQuery1.ParamByName('p_compra').AsCurrency := form33.ClientDataSet1.fieldbyname('P_COMPRA').AsCurrency;
          dm.IBQuery1.ParamByName('p_venda').AsCurrency  := form33.ClientDataSet1.fieldbyname('P_VENDA').AsCurrency;
          dm.IBQuery1.ExecSQL;
          dm.IBQuery1.Transaction.Commit;

          if form33.ClientDataSet1.fieldbyname('codigo').AsInteger > StrToInt(genProd) then // Se o c�digo deste produto for maior que
            begin                                                                           // o ultimo numero de cadastro ent�o pega ele como o ultimo
              reStartGenerator('produto', form33.ClientDataSet1.fieldbyname('codigo').AsInteger);
            end;

        end;

      form33.ClientDataSet1.Next;
    end;


  dm.IBQuery4.SQL.Clear;
  dm.IBQuery4.SQL.Add('update or insert into entrada(nota, data,chegada,total_nota,fornec) VALUES  (:nota, :data,:chegada,:total_nota,:fornec) matching(nota) ');
  dm.IBQuery4.ParamByName('nota').AsString         := nota;
  dm.IBQuery4.ParamByName('chegada').AsDateTime    := form22.datamov;
  dm.IBQuery4.ParamByName('total_nota').AsCurrency := total;
  dm.IBQuery4.ParamByName('data').AsDateTime       := form22.datamov;
  dm.IBQuery4.ParamByName('fornec').AsString       := '0';
  try
    dm.IBQuery4.ExecSQL;
  except
  end;

  form33.ClientDataSet1.First;

  while not form33.ClientDataSet1.Eof do
    begin
      dm.IBQuery4.Close;
      dm.IBQuery4.SQL.Clear;
      dm.IBQuery4.SQL.Add('insert into item_entrada(COD,codentrada, QUANT, P_COMPRA, DESTINO, USUARIO, NOTA, DATA,total) values(:COD,'+funcoes.novocod('entrada')+',:QUANT, :P_COMPRA, :DESTINO, :USUARIO,  :NOTA, :DATA,:total)');
      dm.IBQuery4.ParamByName('data').AsDateTime     := form22.datamov;
      dm.IBQuery4.ParamByName('cod').AsString        := form33.ClientDataSet1.fieldbyname('codigo').AsString;
      dm.IBQuery4.ParamByName('nota').AsString       := nota;
      dm.IBQuery4.ParamByName('quant').AsCurrency    := form33.ClientDataSet1.fieldbyname('quant').AsCurrency;
      dm.IBQuery4.ParamByName('P_compra').AsCurrency := form33.ClientDataSet1.fieldbyname('P_COMPRA').AsCurrency;
      dm.IBQuery4.ParamByName('destino').AsInteger   := 1;
      dm.IBQuery4.ParamByName('usuario').AsString    := form22.codusario;
      dm.IBQuery4.ParamByName('total').AsCurrency    := Arredonda(form33.ClientDataSet1.fieldbyname('P_COMPRA').AsCurrency * form33.ClientDataSet1.fieldbyname('QUANT').AsCurrency, 2);

      try
        dm.IBQuery4.ExecSQL;
      except
      end;

      dm.IBQuery4.Close;
      dm.IBQuery4.SQL.Clear;
      dm.IBQuery4.SQL.Add('update produto set nome = :nome, p_compra = :p_compra, p_venda = :p_venda, QUANT = QUANT + :quant where cod = :cod');
      dm.IBQuery4.ParamByName('nome').AsString        := form33.ClientDataSet1.fieldbyname('descricao').AsString;
      dm.IBQuery4.ParamByName('p_compra').AsCurrency  := form33.ClientDataSet1.fieldbyname('p_compra').AsCurrency;
      dm.IBQuery4.ParamByName('p_venda').AsCurrency   := form33.ClientDataSet1.fieldbyname('p_venda').AsCurrency;
      dm.IBQuery4.ParamByName('quant').AsCurrency     := form33.ClientDataSet1.fieldbyname('quant').AsCurrency;
      dm.IBQuery4.ParamByName('cod').AsString         := form33.ClientDataSet1.fieldbyname('codigo').AsString;
      try
        dm.IBQuery4.ExecSQL;
      except
      end;

      form33.ClientDataSet1.Next;
    end;

 dm.IBQuery4.Transaction.Commit;
 form33.Free;

end;

procedure TForm2.CadastrodeUnidades1Click(Sender: TObject);
begin
  form47 := tform47.Create(self);
  form47.ShowModal;
  form47.Free;
end;

procedure TForm2.CartadeCorreo1Click(Sender: TObject);
begin
  NfeVenda := TNfeVenda.Create(self);
  try
    if ConfParamGerais[36] <> 'N' then NfeVenda.cartaDeCorrecao()
      else NfeVenda.cartaDeCorrecao1();
  except
    on e:exception do
      begin
        if funcoes.Contido('LENGTH', UpperCase(e.Message)) then
          begin
            //NfeVenda.GeraXml;
          END;
      end;
  end;
  NfeVenda.Free;
end;

procedure TForm2.ApagarLanamentosdecaixaDuplicados1Click(Sender: TObject);
begin
  funcoes.verificaregistrosDuplicadosCaixa;
end;

procedure TForm2.ApplicationEvents1Minimize(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TForm2.FormHide(Sender: TObject);
begin
  hide;
end;

procedure TForm2.ExportarEmitidas1Click(Sender: TObject);
begin
  NfeVenda := TNfeVenda.Create(self);
  NfeVenda.ExportarNotasEmitidas1('');
  NfeVenda.Free;
end;

procedure TForm2.PorRota1Click(Sender: TObject);
var
  ini, fim, rota, r1 : string;
  TotalGeral, desconto, diferenca : currency;
  b, ContaNota, i, fim1, ret : integer;
  item : Ptr_Produto;
  lista : TList;
begin
  ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(form22.datamov));
  if ini = '*' then exit;

  fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?',formatadataddmmyy(form22.datamov));
  if fim = '*' then exit;

  rota := funcoes.dialogo('generico',0,'1234567890'+#8,50,FALSE,'', Application.Title,'Qual o C�d. da Rota??','');//funcoes.dialogo('generico',0,'',2,true,'0123456789',Application.Title,'Qual o C�d. da Rota?', '');
  if rota = '*' then exit;

  if rota = '' then
    begin
      rota := funcoes.localizar('Localizar Rotas de Distribui��o','rota','cod,nome','cod','','nome','nome',true,false,false,'',300, NIL);
    end;

  if ((rota = '*') or (rota = '')) then exit;

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select cod, nome from rota where cod = :cod');
  dm.IBselect.ParamByName('cod').AsString := rota;
  dm.IBselect.Open;

  if dm.IBselect.IsEmpty then
    begin
      ShowMessage('Rota '+ rota + ' N�o Cadastrada.');
      dm.IBselect.Close;
      exit;
    end;

  r1 := rota;

  rota := rota + '-' + dm.IBselect.fieldbyname('nome').AsString;
  rota := copy(rota, 1, 15);

  dm.IBselect.Close;
  b := 64;

  form19.RichEdit1.Clear;
  addRelatorioForm19(funcoes.CompletaOuRepete('','','-',60) + #13 + #10 );
  addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|',' ',60)+#13+#10);
  addRelatorioForm19(funcoes.CompletaOuRepete('RELATORIO DE VENDAS POR ROTA: ' + rota,'HORA: '+FormatDateTime('tt',now)+'|',' ',60)+#13+#10);
  addRelatorioForm19(funcoes.CompletaOuRepete('','','-', 60)+#13+#10);
  addRelatorioForm19('CODIGO DESCRICAO                         QUANT.      VENDA'+#13+#10);
  addRelatorioForm19(funcoes.CompletaOuRepete('','','-', 60)+#13+#10);

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select v.nota, v.desconto, v.total, v.cliente, c.rota from VENDA v left join cliente c on (c.cod = v.cliente)'+
  ' where ((cancelado = 0) and ((v.data >= :v1) and (v.data <= :v2)) and (c.rota = :rota)) order by nota');
  dm.IBselect.ParamByName('v1').AsDateTime := StrToDate(ini);
  dm.IBselect.ParamByName('v2').AsDateTime := StrToDate(fim);
  dm.IBselect.ParamByName('rota').AsString := r1;
  dm.IBselect.Open;

  desconto := 0;
  TotalGeral := 0;
  diferenca := 0;
  lista := TList.Create;

  dm.IBQuery2.Close;
  dm.IBQuery2.SQL.Clear;
  dm.IBQuery2.SQL.Add('select i.cod, i.total, p.nome, i.nota, i.quant from item_venda i left join produto p on (i.cod = p.cod) where nota = :nota order by p.nome ');

     while not dm.IBselect.Eof do
     begin
       dm.IBQuery2.Close;
       dm.IBQuery2.ParamByName('nota').AsString := dm.IBselect.fieldbyname('nota').AsString;
       dm.IBQuery2.Open;

        while not dm.IBQuery2.Eof do
          begin


            fim1 := lista.Count - 1;
            ret := -1;

            for i := 0 to fim1 do
              begin
                item := lista[i];
                if item.cod = dm.IBQuery2.fieldbyname('cod').AsInteger then
                  begin
                    ret := i;
                    break;
                  end;
              end;

            if ret = -1 then
              begin
                item := new(ptr_produto);
                item.cod := dm.IBQuery2.fieldbyname('cod').AsInteger;
                item.qtd_atual := dm.IBQuery2.fieldbyname('quant').AsCurrency;
                item.nome := copy(dm.IBQuery2.fieldbyname('nome').AsString, 1, 33);
                item.tot1 := dm.IBQuery2.fieldbyname('total').AsCurrency;
                lista.Add(item);
              end
            else
              begin
                item := lista[ret];
                item.qtd_atual := item.qtd_atual + dm.IBQuery2.fieldbyname('quant').AsCurrency;
                item.tot1 := item.tot1 + dm.IBQuery2.fieldbyname('total').AsCurrency;
                item := lista[ret];
              end;

            TotalGeral := TotalGeral + dm.IBQuery2.fieldbyname('total').AsCurrency;
            dm.IBQuery2.Next;
          end;


        desconto := desconto + dm.IBselect.fieldbyname('desconto').AsCurrency;
        dm.IBselect.Next;
     end;
     fim1 := lista.Count - 1;

     for i := 0 to fim1 do
       begin
         item := lista[i];

         if form19.RichEdit1.Lines.Count > b then
           begin
             b := b + 80;
             addRelatorioForm19(funcoes.CompletaOuRepete('','','-',60) + #12 + #13 + #10);
             addRelatorioForm19(funcoes.CompletaOuRepete('','','-',60) + #13 + #10 );

             addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|',' ',60)+#13+#10);
             addRelatorioForm19(funcoes.CompletaOuRepete('RELATORIO DE VENDAS POR ROTA: ' + rota,'HORA: '+FormatDateTime('tt',now)+'|',' ',60)+#13+#10);
             addRelatorioForm19(funcoes.CompletaOuRepete('','','-', 60)+#13+#10);
             addRelatorioForm19('CODIGO DESCRICAO                         QUANT.      VENDA'+#13+#10);
             addRelatorioForm19(funcoes.CompletaOuRepete('','','-', 60)+#13+#10);
           end;

         addRelatorioForm19(funcoes.CompletaOuRepete('', IntToStr(item.cod),' ',6) + '-' + funcoes.CompletaOuRepete(item.nome , '',' ',33) + funcoes.CompletaOuRepete('', FormatCurr('##,###,###0.00', item.qtd_atual), ' ', 10) + funcoes.CompletaOuRepete('', FormatCurr('##,###,###0.00', item.tot1), ' ', 10) + #13 + #10);
       end;


     dm.IBQuery2.Close;
     dm.IBselect.Close;
     if desconto <> 0 then addRelatorioForm19(funcoes.CompletaOuRepete('', '0',' ',6) + '-' + funcoes.CompletaOuRepete('Desconto', '',' ',33) + funcoes.CompletaOuRepete('', FormatCurr('##,###,###0.00', 0), ' ', 10) + funcoes.CompletaOuRepete('', FormatCurr('##,###,###0.00', desconto), ' ', 10) + #13 + #10);
     addRelatorioForm19(funcoes.CompletaOuRepete('','','-', 60) + #13 + #10);
     addRelatorioForm19('TOTAL RECEBIDO =>' + funcoes.CompletaOuRepete('', FormatCurr('##,###,###0.00', TotalGeral + desconto), ' ', 16) + '  DIFERENCA =>' + funcoes.CompletaOuRepete('', FormatCurr('##,###,###0.00', 0), ' ', 13) + #13 + #10);
     addRelatorioForm19(funcoes.CompletaOuRepete('','','-', 60) + #13 + #10);
     form19.RichEdit1.SelStart := 0;
     form19.ShowModal;
end;

procedure TForm2.PorLocalidade2Click(Sender: TObject);
var
  ini, fim, rota, r1 : string;
  TotalGeral, desconto, diferenca, totItem : currency;
  b, ContaNota, i, fim1, ret, rot : integer;
  item : Ptr_Produto;
  lista : TList;
begin
  ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?', '');
  if ini = '*' then exit;

  fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?', '');
  if fim = '*' then exit;

{  rota := funcoes.dialogo('generico',0,'1234567890'+#8,50,FALSE,'', Application.Title,'Qual o C�d. da Rota?','');//funcoes.dialogo('generico',0,'',2,true,'0123456789',Application.Title,'Qual o C�d. da Rota?', '');
  if rota = '*' then exit;

  if rota = '' then
    begin
      rota := funcoes.localizar('Localizar Rotas de Distribui��o','rota','cod,nome','cod','','nome','nome',true,false,false,'',300, NIL);
    end;

  if rota <> '' then
    begin
      dm.IBselect.Close;
      dm.IBselect.SQL.Clear;
      dm.IBselect.SQL.Add('select cod, nome from rota where cod = :cod');
      dm.IBselect.ParamByName('cod').AsString := rota;
      dm.IBselect.Open;

      if dm.IBselect.IsEmpty then
        begin
          ShowMessage('Rota '+ rota + ' N�o Cadastrada.');
          dm.IBselect.Close;
          exit;
        end;

      r1 := 'and (c.rota = ' + rota + ')';

      rota := rota + '-' + dm.IBselect.fieldbyname('nome').AsString;
      rota := copy(rota, 1, 15);
    end;

  dm.IBselect.Close;
}  b := 64;

  form19.RichEdit1.Clear;
  addRelatorioForm19('|' + #15 + '|' + CRLF);
  addRelatorioForm19( funcoes.CompletaOuRepete('','','-',60) + #13 + #10 );
  addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|',' ',60)+#13+#10);
  addRelatorioForm19(funcoes.CompletaOuRepete('RESUMO DE VENDAS POR ROTA '+FormatDateTime('dd/mm/yy',StrToDate(ini))+' A '+FormatDateTime('dd/mm/yy',StrToDate(fim)),'HORA: '+FormatDateTime('tt',now)+'|',' ',60)+#13+#10);
  addRelatorioForm19(funcoes.CompletaOuRepete('','','-', 60)+#13+#10);
  addRelatorioForm19('CODIGO DESCRICAO                         TOTAL'+#13+#10);
  addRelatorioForm19(funcoes.CompletaOuRepete('','','-', 60)+#13+#10);

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select v.nota, v.desconto, v.total, v.cliente, c.rota from VENDA v left join cliente c on (c.cod = v.cliente)'+
  ' where ((cancelado = 0) and ((v.data >= :v1) and (v.data <= :v2)) '+ r1 +') order by nota');
  dm.IBselect.ParamByName('v1').AsDateTime := StrToDate(ini);
  dm.IBselect.ParamByName('v2').AsDateTime := StrToDate(fim);
  //dm.IBselect.ParamByName('rota').AsString := r1;
  dm.IBselect.Open;

  desconto := 0;
  TotalGeral := 0;
  diferenca := 0;
  totItem := 0;

  lista := TList.Create;

  while not dm.IBselect.Eof do
    begin
      fim1 := lista.Count - 1;
      ret := -1;

      for i := 0 to fim1 do
        begin
          item := lista[i];
          if dm.IBselect.fieldbyname('rota').AsString = '' then rot := 0
            else rot := dm.IBselect.fieldbyname('rota').AsInteger;

          if item.cod = rot then
            begin
              ret := i;
              break;
            end;
        end;

      if ret = -1 then
        begin
          item := new(ptr_produto);
          item.cod := rot;
          item.tot1 := dm.IBselect.fieldbyname('total').AsCurrency;
          lista.Add(item);
        end
      else
        begin
          item := lista[ret];
          item.tot1 := item.tot1 + dm.IBselect.fieldbyname('total').AsCurrency;
          item := lista[ret];
        end;

      TotalGeral := TotalGeral + dm.IBselect.fieldbyname('total').AsCurrency;

      dm.IBselect.Next;
    end;



  fim1 := lista.Count - 1;

  for i := 0 to fim1 do
    begin
      item := lista[i];

      if form19.RichEdit1.Lines.Count > b then
        begin
          b := b + 80;
          addRelatorioForm19(funcoes.CompletaOuRepete('','','-',60) + #12 + #13 + #10);
          addRelatorioForm19(funcoes.CompletaOuRepete('','','-',60) + #13 + #10 );

          addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|',' ',60)+#13+#10);
          addRelatorioForm19(funcoes.CompletaOuRepete('RESUMO DE VENDAS POR ROTA: ' + rota,'HORA: '+FormatDateTime('tt',now)+'|',' ',60)+#13+#10);
          addRelatorioForm19(funcoes.CompletaOuRepete('','','-', 60)+#13+#10);
          addRelatorioForm19('CODIGO DESCRICAO                         TOTAL'+#13+#10);
          addRelatorioForm19(funcoes.CompletaOuRepete('','','-', 60)+#13+#10);
        end;

         addRelatorioForm19(funcoes.CompletaOuRepete('', IntToStr(item.cod),' ',6) + '-' + funcoes.CompletaOuRepete(UpperCase(funcoes.BuscaNomeBD(dm.ibquery1, 'nome','rota', 'where cod = ' + IntToStr(item.cod))) , '',' ',33) + funcoes.CompletaOuRepete('', FormatCurr('##,###,###0.00', item.tot1), ' ', 10) + #13 + #10);
    end;


  dm.IBQuery2.Close;
  dm.IBselect.Close;
  addRelatorioForm19(funcoes.CompletaOuRepete('','','-', 60) + #13 + #10);
  addRelatorioForm19('TOTAL RECEBIDO =>' + funcoes.CompletaOuRepete('', FormatCurr('##,###,###0.00', TotalGeral), ' ', 16) + '  DIFERENCA =>' + funcoes.CompletaOuRepete('', FormatCurr('##,###,###0.00', 0), ' ', 13) + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('','','-', 60) + #13 + #10);
  form19.RichEdit1.SelStart := 0;
  form19.ShowModal;
end;

procedure TForm2.ReimpressodeCCE1Click(Sender: TObject);
begin
  NfeVenda := TNfeVenda.Create(self);
  NfeVenda.ReimprimeCCECompleta();
  NfeVenda.Free;
end;

procedure TForm2.ReimpressoPorNumerodeVenda1Click(Sender: TObject);
var
  serie1 : String;
begin
  nota := funcoes.dialogo('not',200,'1234567890'+#8+#32,200,true,'',Application.Title,'Qual o N�mero da Venda ?','');
  if nota = '*' then exit;

  dm.IBselect.close;
  dm.ibselect.sql.Text := 'select * from nfce where nota = :nota';
  dm.ibselect.ParamByName('nota').asstring := nota;
  dm.ibselect.open;

  if dm.IBselect.IsEmpty then begin
    dm.IBselect.Close;
    ShowMessage('Nenhuma NFCe encontrada para esta venda!');
    exit;
  end;

  nota := copy(dm.IBselect.fieldbyname('chave').asstring, 26, 9);
  nota := IntToStr(StrToInt(nota));

  ShowMessage('NFCe Encontrada N�: ' + (nota));

  serie1 := funcoes.dialogo('not',0,'1234567890'+#8+#32,50,true,'',Application.Title,'Qual a S�rie ?', IntToStr(serie2));
  if serie1 = '*' then exit;

  try
    funcoes.Mensagem(Application.Title ,'Aguarde, Imprimindo NFCe...',15,'Courier New',false,0,clred, false);
    Application.ProcessMessages;
    Imprimir_DANFE_PDF(nota, nota, tipoIMPRESSAO <> 1, serie1);
    Button1Click(sender);
  finally
    funcoes.Mensagem('', '', 25, 'Courier New',False, 0, clRed, true);
  end;
end;

procedure TForm2.Configurao1Click(Sender: TObject);
begin
  NfeVenda := TNfeVenda.Create(self);
  NfeVenda.ShowModal;
  NfeVenda.Free;
end;

procedure TForm2.RecalcularEstoque1Click(Sender: TObject);
begin
 if RetornaAcessoUsuario > 0 then begin
   MessageDlg('Este Usu�rio N�o tem Permiss�o para Acessar essa Rotina.', mtInformation, [mbOK], 1);
   exit;
 end;

 if not funcoes.senhaDodia then exit;
 funcoes.VER_ESTOQUE('RECALCULA', 'Acertando Fichas de Produtos', 'Recalcul');
end;

procedure TForm2.AcertarEstoque1Click(Sender: TObject);
begin
  if form22.usuario <> 'ADMIN' then
    begin
      MessageDlg('Este Usu�rio N�o tem Permiss�o para Acessar essa Rotina.', mtInformation, [mbOK], 1);
      exit;
    end;

  if not funcoes.senhaDodia then exit;
  funcoes.VER_ESTOQUE('ACERTA', 'Lan�ando Acertos de Estoque', 'Acert');
end;

procedure TForm2.Aniversariantes1Click(Sender: TObject);
var
  pastaMala, linha, data, tmp : string;
  F : TextFile;
  ini, fim : integer;
begin
  data := funcoes.dialogo('generico',0,'1234567890'+#8,0,false,'','Control For Windows','Qual o M�s de Anivers�rio?', '1') ;
  if data = '*' then exit;

  pastaMala := caminhoEXE_com_barra_no_final + 'Mala Direta\';

  funcoes.CriaDiretorio(pastaMala);
  funcoes.CriarAtalho(pastaMala, '', 'C:\', 'Mala Direta ControlW', 'c:\');

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select cod as codigo, nome, tipo, ende as endereco, bairro, cep, cid as cidade,' +
  ' data, telres, est, data as extenso, current_date as hoje, titular from cliente ' +
  'where extract(MONTH from data) = :data');
  dm.IBselect.ParamByName('data').AsString := data;
  dm.IBselect.Open;
  dm.IBselect.FetchAll;

  if FileExists(pastaMala + 'ANIVERSARIANTES.TXT') then DeleteFile(pastaMala + 'ANIVERSARIANTES.TXT');

  AssignFile(F, pastaMala + 'ANIVERSARIANTES.TXT');
  Rewrite(F);

  linha := 'Codigo|Nome|Endereco|Bairro|Cep|Cidade|Data_Aniversario|Telefone|Extenso|Hoje' + #13 + #10;
  Write(F, linha);
  linha :=  '';

  funcoes.informacao(1, 2,'Aguarde, Copiando registros... ',true,false,2);
  fim := dm.IBselect.RecordCount;

  while not dm.IBselect.Eof do
    begin
      funcoes.informacao(dm.IBselect.RecNo, fim,'Aguarde, Copiando registros... ',false, false,2);
      linha := dm.IBselect.fieldbyname('codigo').AsString + '|' + IfThen(dm.IBselect.fieldbyname('tipo').AsString = '1', dm.IBselect.fieldbyname('nome').AsString, dm.IBselect.fieldbyname('titular').AsString) + '|' +
      dm.IBselect.fieldbyname('endereco').AsString + '|' + dm.IBselect.fieldbyname('bairro').AsString + '|' + dm.IBselect.fieldbyname('cep').AsString +
      '|' + dm.IBselect.fieldbyname('cidade').AsString + '-' + dm.IBselect.fieldbyname('est').AsString + '|' +
      FormatDateTime('dd/mm/yyyy', dm.IBselect.fieldbyname('data').AsDateTime) + '|' + dm.IBselect.fieldbyname('telres').AsString + '|' +
      FormatDateTime('d' ,dm.IBselect.fieldbyname('extenso').AsDateTime) + ' de ' + funcoes.primeiraLetraMaiuscula(FormatDateTime('mmmm' ,dm.IBselect.fieldbyname('extenso').AsDateTime)) + '|' +
      FormatDateTime('d' ,dm.IBselect.fieldbyname('hoje').AsDateTime) + ' de ' + funcoes.primeiraLetraMaiuscula(FormatDateTime('mmmm' ,dm.IBselect.fieldbyname('hoje').AsDateTime)) + ' de ' + FormatDateTime('yyyy' ,dm.IBselect.fieldbyname('hoje').AsDateTime) + #13 + #10;

      Write(F, linha);
      dm.IBselect.Next;
    end;

  funcoes.informacao(dm.IBselect.RecNo, fim,'Aguarde, Copiando registros... ',false, true,2);
  CloseFile(F);
  dm.IBselect.Close;

  ShowMessage('O arquivo foi criado em:' + #13 + pastaMala + 'ANIVERSARIANTES.TXT' + #13 + 'Est� dispon�vel um atalho na area de trabalho.');
end;

procedure TForm2.ClientesemAtraso1Click(Sender: TObject);
var
  cds : TClientDataSet;
  ini, fim, pastaMala, linha, data, _HOJE : string;
  F : TextFile;
  fim1 : integer;
begin
  ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial de Vencimento ?','');
  if ini = '*' then exit;
  fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final de Vencimento ?','');
  if fim = '*' then exit;

  pastaMala := caminhoEXE_com_barra_no_final + 'Mala Direta\';

  funcoes.CriaDiretorio(pastaMala);
  funcoes.CriarAtalho(pastaMala, '', 'C:\', 'Mala Direta ControlW', 'c:\');

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select valor, vencimento, documento, historico from contasreceber where ((pago = 0) and (vencimento >= :dini) and (vencimento <= :dfim))');
  dm.IBselect.ParamByName('dini').AsDateTime := StrToDateTime(ini);
  dm.IBselect.ParamByName('dfim').AsDateTime := StrToDateTime(fim);
  dm.IBselect.Open;
  dm.IBselect.FetchAll;
  fim1 := dm.IBselect.RecordCount;


  cds := TClientDataSet.Create(self);
  cds.FieldDefs.Add('cod', ftInteger);
  cds.FieldDefs.Add('valor', ftCurrency);
  cds.FieldDefs.Add('historico', ftMemo);
  cds.IndexFieldNames := 'cod';
  cds.CreateDataSet;
  //cds.IndexFieldNames := 'cod';

  if FileExists(pastaMala + 'ATRASO.TXT') then DeleteFile(pastaMala + 'ATRASO.TXT');

  funcoes.informacao(1, 2,'Verificando Contas de Clientes... ',true,false,2);
  while not dm.IBselect.Eof do
    begin
      funcoes.informacao(dm.IBselect.RecNo, fim1,'Verificando Contas de Clientes... ', false, false, 2);
      if cds.FindKey([dm.IBselect.FieldByName('documento').AsInteger]) then
        begin
          cds.Edit;
          cds.FieldByName('valor').AsCurrency := cds.FieldByName('valor').AsCurrency + dm.IBselect.fieldbyname('valor').AsCurrency;
          cds.FieldByName('historico').AsString := cds.FieldByName('historico').AsString + FormatDateTime('dd/mm/yyyy', dm.IBselect.fieldbyname('vencimento').AsDateTime) +
          ' ' + dm.IBselect.fieldbyname('historico').AsString + ' ' + CompletaOuRepete('', formataCurrency(dm.IBselect.fieldbyname('valor').AsCurrency), ' ', 12) + #13;
          cds.Post;
        end
      else
        begin
          cds.Insert;
          cds.FieldByName('cod').AsInteger := dm.IBselect.FieldByName('documento').AsInteger;
          cds.FieldByName('valor').AsCurrency := dm.IBselect.fieldbyname('valor').AsCurrency;
          cds.FieldByName('historico').AsString := FormatDateTime('dd/mm/yyyy', dm.IBselect.fieldbyname('vencimento').AsDateTime) +
          ' ' + dm.IBselect.fieldbyname('historico').AsString + ' ' + CompletaOuRepete('', formataCurrency(dm.IBselect.fieldbyname('valor').AsCurrency), ' ', 12) + #13;
          cds.Post;
        end;

      dm.IBselect.Next;
    end;
    funcoes.informacao(dm.IBselect.RecNo, fim1,'Verificando Contas de Clientes... ', false, true, 2);

   cds.First;
   fim1 := cds.RecordCount;

   AssignFile(F, pastaMala + 'ATRASO.TXT');
   Rewrite(F);
   linha := 'Codigo|Nome|Endereco|Bairro|Cep|Cidade|Telefone|Valor Total|Extenso|Hoje|Documentos' + CRLF;
   Write(F, linha);
   _HOJE := FormatDateTime('d' , now) + ' de ' + funcoes.primeiraLetraMaiuscula(FormatDateTime('mmmm' , now)) + ' de ' + FormatDateTime('yyyy' , now);

   funcoes.informacao(1, 2,'Organizando os Dados...',true,false,2);
   while not cds.Eof do
     begin
       funcoes.informacao(cds.RecNo, fim1,'Organizando os Dados...',true,false,2);

       dm.IBselect.Close;
       dm.IBselect.SQL.Text := ('select cod, nome, ende, bairro, cep, cid, telres, est from cliente where cod = :cod');
       dm.IBselect.ParamByName('cod').AsInteger := cds.fieldbyname('cod').AsInteger;
       dm.IBselect.Open;

       linha := dm.IBselect.fieldbyname('cod').AsString + '|' + dm.IBselect.fieldbyname('nome').AsString + '|' +
       dm.IBselect.fieldbyname('ende').AsString + '|' + dm.IBselect.fieldbyname('bairro').AsString + '|' + dm.IBselect.fieldbyname('cep').AsString +
       '|' + dm.IBselect.fieldbyname('cid').AsString + '-' + dm.IBselect.fieldbyname('est').AsString + '|' +
       dm.IBselect.fieldbyname('telres').AsString + '|' +  formataCurrency(cds.fieldbyname('valor').AsCurrency) + '|' +
       funcoes.primeiraLetraMaiuscula(funcoes.valorPorExtenso(cds.fieldbyname('valor').AsCurrency)) + '|' + _HOJE + '|' + cds.fieldbyname('historico').AsString + CRLF;

       Write(F, linha);

       cds.Next;
     end;

   funcoes.informacao(cds.RecNo, fim1,'Organizando os Dados...',false,true,2);
   dm.IBselect.Close;
   CloseFile(F);
   cds.Free;
   ShowMessage('O arquivo foi criado em:' + #13 + pastaMala + 'ATRASO.TXT' + #13 + 'Est� dispon�vel um atalho na area de trabalho.');
end;

procedure TForm2.Servios1Click(Sender: TObject);
begin
{  form50 := TForm50.Create(self);
  form50.ShowModal;
  form50.Free;}
end;

procedure TForm2.Servios2Click(Sender: TObject);
var
    dif, atra, avis,dini,dfim, venda, vended : string;
    i, fim : integer;
    total, totVende, desconto, totcomiAvista, TOT,
    totcomiAprazo, diferen, comiAvista, comiAprazo, totrel : currency;
    comissaoDiferenciada,
    com1, com2, com3, com4, com0, com5, descont1 : TStringList;
    avista : boolean;
    mattVal : array[1..4] of currency;
    produtos : TItensProduto;
begin
   avis := funcoes.dialogo('numero',0,'',2,false,'S',Application.Title,'Qual o Percentual de Comiss�o � VISTA (%)?','0,00');
   if avis = '*' then exit;

   atra := funcoes.dialogo('numero',0,'',2,false,'S',Application.Title,'Qual o Percentual de Comiss�o � PRAZO (%)?', avis);
   if atra = '*' then exit;

   dif := funcoes.dialogo('numero',0,'',2,true,'S',Application.Title,'Qual o fator de Redu��o A PRAZO para produtos diferenciados?','1,00');
   if dif = '*' then exit;

   dini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(StartOfTheMonth(form22.datamov)));
   if dini = '*' then exit;

   dfim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?',formatadataddmmyy(EndOfTheMonth(form22.datamov)));
   if dfim = '*' then exit;

   comiAvista := StrToCurr(avis);
   comiAprazo := StrToCurr(atra);

   form19.RichEdit1.Clear;
   addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80) + #13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete(form22.Pgerais.Values['empresa'],FormatDateTime('dd/mm/yy',form22.datamov), ' ', 80) + #13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete('RELATORIO DE COMISSOES DE ' + dini + ' ATE ' + dfim,FormatDateTime('tt',now),' ', 80) + #13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete('','+','-',17) + funcoes.CompletaOuRepete('','','-',11) + funcoes.CompletaOuRepete('','+','-',13) + funcoes.CompletaOuRepete('','','-',11) + funcoes.CompletaOuRepete('','+','-',13) + funcoes.CompletaOuRepete('','','-',15) + #13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete('','|',' ',17) + funcoes.CompletaOuRepete(funcoes.centraliza('A VISTA ' + avis + '%',' ',23),'|',' ',24) + funcoes.CompletaOuRepete(funcoes.centraliza('A PRAZO ' + atra + '%',' ',23),'|',' ',24) + funcoes.CompletaOuRepete('','',' ',15) + #13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete('COD.  VENDEDOR','|',' ',17) + funcoes.CompletaOuRepete('','+','-',24) + funcoes.CompletaOuRepete('','|','-',24) + funcoes.CompletaOuRepete('','TOTAL',' ',15) + #13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete('','|',' ',17) + funcoes.CompletaOuRepete('','NORMAL|',' ',11) + funcoes.CompletaOuRepete('','DIFERENCIADO|',' ',13) + funcoes.CompletaOuRepete('','NORMAL|',' ',11) + funcoes.CompletaOuRepete('','DIFERENCIADO|',' ',13) + funcoes.CompletaOuRepete('','',' ',15) + #13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete('','+','-',17) + funcoes.CompletaOuRepete('','+','-',11) + funcoes.CompletaOuRepete('','+','-',13) + funcoes.CompletaOuRepete('','+','-',11) + funcoes.CompletaOuRepete('','+','-',13) + funcoes.CompletaOuRepete('','','-',15) + #13 + #10);

   comissaoDiferenciada := lerComissoesDiferenciadasNameCodigo(); //ler as comissoes diferenciadas
   com1 := TStringList.Create;
   com2 := TStringList.Create;
   com3 := TStringList.Create;
   com4 := TStringList.Create;
   com0 := TStringList.Create;
   com5 := TStringList.Create;
   descont1 := TStringList.Create;
   totrel  := 0;

   {retirado abaixo pq ficou lento em 30/12/2014}
   { dm.IBselect.SQL.Clear;
    dm.IBselect.SQL.Add('select v.nota, p.comissao, v.prazo, v.codhis, i.total, i.quant, i.cod, i.p_venda,v.prazo, v.vendedor, v.desconto' +
    ' from item_venda i, venda v left join produto p on (p.cod = i.cod) where (i.nota = v.nota) and (v.cancelado = 0) '
    +' and ((v.data >= :dini) and (v.data <= :dfim)) order by v.vendedor, v.nota');
    dm.IBselect.ParamByName('dini').AsDateTime := StrToDateTimeDef(dini, form22.datamov);
    dm.IBselect.ParamByName('dfim').AsDateTime := StrToDateTimeDef(dfim, form22.datamov);
    dm.IBselect.Open;
    dm.IBselect.FetchAll;

    dm.IBselect.SQL.Clear;
    dm.IBselect.SQL.Add('select v.nota, v.total as total1, p.comissao, v.prazo, v.codhis, i.total, i.quant, i.cod, i.p_venda,v.prazo,' +
    ' v.vendedor, v.desconto from item_venda i left join produto p on (p.cod = i.cod) left join venda v on (i.nota = v.nota) ' +
    ' where ((v.data >= :dini) and (v.data <= :dfim)) and (v.cancelado = 0)  order by v.vendedor, v.nota');
    dm.IBselect.ParamByName('dini').AsDateTime := StrToDateTimeDef(dini, form22.datamov);
    dm.IBselect.ParamByName('dfim').AsDateTime := StrToDateTimeDef(dfim, form22.datamov);
    dm.IBselect.Open;
    dm.IBselect.FetchAll;  }

    dm.IBselect.Close;
    dm.IBselect.SQL.Text :=
    'select i.cod, i.p_venda, i.total, v.total as total1, v.nota, v.codhis, v.desconto, iif(p.comissao is null, 0,p.comissao) as comissao, i.quant, i.vendedor,'+
    'v.prazo from item_venda i left join venda v on (i.nota = v.nota) left join produto p on (p.cod = i.cod) where ((v.data >= :dini)'+
    ' and (v.data <= :dfim)) and (v.cancelado = 0) and (p.nome like ''SERV%'') order by i.vendedor, v.nota';
    dm.IBselect.ParamByName('dini').AsDateTime := StrToDateTime(dini);
    dm.IBselect.ParamByName('dfim').AsDateTime := StrToDateTime(dfim);
    dm.IBselect.Open;
    dm.IBselect.FetchAll;

    if dm.IBselect.IsEmpty then
    begin
      dm.IBselect.Close;
      ShowMessage('Nenhum Resultado na Pesquisa');
      exit;
    end;

    fim    := dm.IBselect.RecordCount;
    ini    := 0;
    venda  := 'xx';

    funcoes.informacao(0, fim, 'Aguarde, Calculando Comiss�es...', true, false, 5);

    while not dm.IBselect.Eof do
     begin
       if ((dm.IBselect.FieldByName('codhis').AsInteger = 2) or (dm.IBselect.FieldByName('prazo').AsInteger > 0)) then avista := false
         else avista := true;

       total := 0;
       mattVal[1] := 0;
       mattVal[2] := 0;
       mattVal[3] := 0;
       mattVal[4] := 0;

       if ((venda <> dm.IBselect.fieldbyname('nota').AsString)) then
         begin
           totrel := totrel + dm.IBselect.fieldbyname('total1').AsCurrency;

           desconto := dm.IBselect.fieldbyname('desconto').AsCurrency;
           venda    := dm.IBselect.fieldbyname('nota').AsString;
           vended   := dm.IBselect.fieldbyname('vendedor').AsString;

           if avista then
             begin
               com0.Values[dm.IBselect.fieldbyname('vendedor').AsString] := '0';                   // lista de cod de vendedores
               com3.Values[vended] := CurrToStr(StrToCurrDef(com3.Values[vended], 0) + (desconto * comiAvista / 100));
             end
           else
             begin
               com0.Values[dm.IBselect.fieldbyname('vendedor').AsString] := '0';                   // lista de cod de vendedores
               com4.Values[vended] := CurrToStr(StrToCurrDef(com4.Values[vended], 0) + (desconto * comiAprazo / 100));
             end;

         end;

       Application.ProcessMessages;
       funcoes.informacao(ini, fim, 'Aguarde, calculando Comiss�es...', false, false, 5);

       diferen := StrToCurrDef(comissaoDiferenciada.Values[dm.IBselect.FieldByName('cod').AsString], 0);
       tot     := dm.IBselect.fieldbyname('total').AsCurrency;

       //verifica se a comissao nao � diferenciada (produto.comissao <> 0)
       if diferen <> 0 then
         begin
           if avista then mattVal[1] := mattVal[1] + (tot * diferen / 100)
             else  mattVal[2] := mattVal[2] + (tot * diferen / 100);
         end
       else
         begin
           if avista then  mattVal[3] := mattVal[1] + (tot * comiAvista / 100)
             else          mattVal[4] := mattVal[2] + (tot * comiAprazo / 100);
         end;

         com0.Values[dm.IBselect.fieldbyname('vendedor').AsString] := '0';                   // lista de cod de vendedores
         com1.Values[dm.IBselect.fieldbyname('vendedor').AsString] := CurrToStr(StrToCurrDef(com1.Values[dm.IBselect.fieldbyname('vendedor').AsString], 0) + mattVal[1]);
         com2.Values[dm.IBselect.fieldbyname('vendedor').AsString] := CurrToStr(StrToCurrDef(com2.Values[dm.IBselect.fieldbyname('vendedor').AsString], 0) + mattVal[2]);
         com3.Values[dm.IBselect.fieldbyname('vendedor').AsString] := CurrToStr(StrToCurrDef(com3.Values[dm.IBselect.fieldbyname('vendedor').AsString], 0) + mattVal[3]);
         com4.Values[dm.IBselect.fieldbyname('vendedor').AsString] := CurrToStr(StrToCurrDef(com4.Values[dm.IBselect.fieldbyname('vendedor').AsString], 0) + mattVal[4]);

       dm.IBselect.Next; //next do dataset de venda
       ini := ini + 1;
     end;

    fim := com0.Count -1;
    for i := 0 to fim do
      begin

        //totVende := StrToCurr(com4.Values[com0.Names[i]]) + StrToCurr(com3.Values[com0.Names[i]]) + StrToCurr(com1.Values[com0.Names[i]]) + StrToCurr(com2.Values[com0.Names[i]]);
        totVende := 0;
        {totVende := totVende + Arredonda((StrToCurr(com3.Values[com0.Names[i]]) * (comiAvista / 100)),2);
        totVende := totVende + Arredonda((StrToCurr(com4.Values[com0.Names[i]]) * (comiAprazo / 100)),2);
        totVende := totVende + Arredonda((StrToCurr(com1.Values[com0.Names[i]]) * (comiAvista / 100)),2);
        totVende := totVende + Arredonda((StrToCurr(com2.Values[com0.Names[i]]) * (comiAprazo / 100)),2);}

        totVende := totVende + StrToCurrDef(com3.Values[com0.Names[i]], 0) + StrToCurrDef(com4.Values[com0.Names[i]], 0) +
        StrToCurrDef(com1.Values[com0.Names[i]], 0) + StrToCurrDef(com2.Values[com0.Names[i]], 0);

        addRelatorioForm19(funcoes.CompletaOuRepete(com0.Names[i] ,'',' ',3) + funcoes.CompletaOuRepete(copy(funcoes.BuscaNomeBD(dm.ibquery1,'nome','vendedor','where cod =' + com0.Names[i]),1 , 13),'|', ' ', 14) +
        funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00', Arredonda(StrToCurr(com3.Values[com0.Names[i]]),2) ) + '|',' ',11) + funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00', Arredonda(StrToCurr(com1.Values[com0.Names[i]]) ,2) ) + '|',' ',13) +
        funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00', Arredonda(StrToCurr(com4.Values[com0.Names[i]]),2) )  + '|',' ',11) + funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00', Arredonda(StrToCurr(com2.Values[com0.Names[i]]),2) ) + '|',' ',13) +
        funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00', totVende),' ',15) + #13 + #10);
        total := total + (totVende);
      end;

   addRelatorioForm19(funcoes.CompletaOuRepete('','','-', 80 ) +#13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL COMISSOES =>',FormatCurr('#,###,###0.00',total),' ', 30 ) +#13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL VENDAS    =>',FormatCurr('#,###,###0.00',totrel),' ', 30 ) +#13 + #10);
   addRelatorioForm19(funcoes.CompletaOuRepete('','','-', 80 ) +#13 + #10);

   dm.IBselect.Close;
   dm.IBQuery2.Close;
   dm.IBQuery1.Close;
   funcoes.informacao(0, fim, 'Aguarde...', false, true, 5);

   form19.ShowModal;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  ini  := 1;
  cont := 1;

  ClientDataSet1.CreateDataSet;
end;

procedure TForm2.Geral2Click(Sender: TObject);
var
 perce, sim : String;
 perc  : currency;
 ini, fim : integer;
begin
  if not funcoes.senhaDodia then exit;
  WWMessage('Aten��o! Esta Rotina Far� Reajuste Geral de Pre�os de Todo o Estoque',mtInformation,[mbOK],HexToTColor('FFD700'),true,false,HexToTColor('B22222'));

  perce := funcoes.dialogo('numero',0,'',2,true,'S',Application.Title,'Qual o valor do Percentual de Reajuste ?','0,00');
  if perce = '*' then exit;

  perc := StrToCurr(perce);
  sim := funcoes.dialogo('generico',0,'SN'+#8,0,false,'S','Control For Windows','Tem Certeza que deseja reajustar os pre�os em '+ formataCurrency(perc) +'% ?S/N','N') ;
  if ((sim = '*') or (sim = 'N')) then exit;

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select cod, p_venda from produto');
  dm.IBselect.Open;
  dm.IBselect.FetchAll;

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Clear;
  dm.IBQuery1.SQL.Add('update produto set p_venda = p_venda + :preco where cod = :cod');

  ini := 0;
  fim := dm.IBselect.RecordCount;
  funcoes.informacao(1,2,'Aguarde, Reajustando Pre�os ',true, false, 2);
  while not dm.IBselect.Eof do
    begin
      ini := ini + 1;
      funcoes.informacao(ini, fim, 'Aguarde, Reajustando Pre�os...', false, false, 2);

      dm.IBQuery1.ParamByName('preco').AsCurrency := (dm.IBselect.fieldbyname('p_venda').AsCurrency * perc / 100);
      dm.IBQuery1.ParamByName('cod').AsString     :=  dm.IBselect.fieldbyname('cod').AsString;
      dm.IBQuery1.ExecSQL;

      dm.IBselect.Next;
    end;
  funcoes.informacao(1,2,'Aguarde, Reajustando Pre�os ',false, true, 2);

  try
    dm.IBQuery1.Transaction.Commit;
  except
  end;  

  dm.IBselect.Close;
  ShowMessage('Reajuste Efetuado com Sucesso');  
end;

procedure TForm2.VendanoAtacado1Click(Sender: TObject);
var
 perce, sim : String;
 perc       : currency;
 ini, fim   : integer;
begin
  if not VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false then
    begin
      WWMessage('Rotina permitida apenas para usu�rios sem bloqueios',mtInformation,[mbOK],HexToTColor('FFD700'),true,false,HexToTColor('B22222'));
      exit;
    end;  

  perce := funcoes.dialogo('numero',0,'',2,true,'S',Application.Title,'Qual o desconto para venda no atacado ?','0,00');
  if perce = '*' then exit;

  perc := StrToCurr(perce);

  sim := funcoes.dialogo('generico',0,'SN'+#8,0,false,'S','Control For Windows','Confirma reajuste de pre�o de atacado com desconto de  '+ formataCurrency(perc) +'% ?S/N','N') ;
  if ((sim = '*') or (sim = 'N')) then exit;

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select cod, p_venda from produto');
  dm.IBselect.Open;
  dm.IBselect.FetchAll;

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Clear;
  dm.IBQuery1.SQL.Add('update produto set p_venda1 = p_venda - :preco where cod = :cod');

  fim := dm.IBselect.RecordCount;
  funcoes.informacao(1,2,'Reajustando Pre�o de Atacado...',true, false, 2);
  while not dm.IBselect.Eof do
    begin
      funcoes.informacao(dm.IBselect.RecNo, fim, 'Reajustando Pre�o de Atacado...', false, false, 2);

      dm.IBQuery1.ParamByName('preco').AsCurrency := Arredonda(dm.IBselect.fieldbyname('p_venda').AsCurrency * perc / 100, 2);
      dm.IBQuery1.ParamByName('cod').AsString     :=  dm.IBselect.fieldbyname('cod').AsString;
      dm.IBQuery1.ExecSQL;
      
      dm.IBselect.Next;
    end;
    
  funcoes.informacao(1,2,'Reajustando Pre�o de Atacado...',false, true, 2);

  try
    dm.IBQuery1.Transaction.Commit;
  except
  end;  

  dm.IBselect.Close;
  ShowMessage('Atualiza��o Conclu�da com Sucesso');
end;

procedure TForm2.Faixa1Click(Sender: TObject);
var
 perce, sim, piini,pifim : String;
 perc, pini, pfim  : currency;
 ini, fim, reg : integer;
begin
  if not funcoes.senhaDodia then exit;

  piini := funcoes.dialogo('numero',0,'',2,true,'S',Application.Title,'Qual o Pre�o Inicial  ?','0,00');
  if piini = '*' then exit;

  pifim := funcoes.dialogo('numero',0,'',2,true,'S',Application.Title,'Qual o Pre�o Final ?','0,00');
  if pifim = '*' then exit;

  perce := funcoes.dialogo('numero',0,'',2,true,'S',Application.Title,'Qual o Percentual de Reajuste ?','0,00');
  if perce = '*' then exit;

  perc := StrToCurr(perce);
  pini := StrToCurr(piini);
  pfim := StrToCurr(pifim);

  sim := funcoes.dialogo('generico',0,'SN'+#8,0,false,'S','Control For Windows','Confirma reajuste de '+ formataCurrency(perc) +'% para Pre�os Entre '+ formataCurrency(pini) +' e '+ formataCurrency(pfim) +' ?S/N','N') ;
  if ((sim = '*') or (sim = 'N')) then exit;

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select cod, p_venda from produto');
  dm.IBselect.Open;
  dm.IBselect.FetchAll;

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Clear;
  dm.IBQuery1.SQL.Add('update produto set p_venda = p_venda + :preco where cod = :cod');

  ini := 0;
  reg := 0;
  fim := dm.IBselect.RecordCount;
  funcoes.informacao(1,2,'Reajustando Pre�os...',true, false, 2);
  while not dm.IBselect.Eof do
    begin
      ini := ini + 1;
      funcoes.informacao(ini, fim, 'Reajustando Pre�os...', false, false, 2);

      if ((dm.IBselect.fieldbyname('p_venda').AsCurrency >= pini) AND (dm.IBselect.fieldbyname('p_venda').AsCurrency <= pfim)) then
        begin
          dm.IBQuery1.ParamByName('preco').AsCurrency := Arredonda(dm.IBselect.fieldbyname('p_venda').AsCurrency * perc / 100, 2);
          dm.IBQuery1.ParamByName('cod').AsString     :=  dm.IBselect.fieldbyname('cod').AsString;
          dm.IBQuery1.ExecSQL;
          reg := reg + 1;
        end;

      dm.IBselect.Next;
    end;
  funcoes.informacao(1,2,'Reajustando Pre�os de Atacado...',false, true, 2);

  try
    dm.IBQuery1.Transaction.Commit;
  except
  end;  

  dm.IBselect.Close;
  ShowMessage(IntToStr(reg) + ' Produtos Reajustos Com Sucesso');
end;

procedure TForm2.PorFornecedor2Click(Sender: TObject);
var
 perce, sim : String;
 perc  : currency;
 ini, fim, reg : integer;
begin
  if not funcoes.senhaDodia then exit;

  fornec := funcoes.dialogo('generico', 60,'1234567890'+#8, 50,false,'','Control For Windows','Qual o Fornecedor:','') ;
  if Fornec = '*' then exit;

  if fornec = '' then
    begin
      fornec := funcoes.localizar('Localizar Fornecedor','fornecedor','cod,nome','cod','','nome','nome',true,false,false,'',500, nil);
    end;
  if ((Fornec = '*') or (Fornec = '')) then exit;

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select cod from fornecedor where cod = :cod');
  dm.IBselect.ParamByName('cod').AsString := fornec;
  dm.IBselect.Open;

  if dm.IBselect.IsEmpty then
    begin
      ShowMessage('Fornecedor ' + fornec + ' N�o Encontrado');
      exit;
    end;
  dm.IBselect.Close;

  perce := funcoes.dialogo('numero',0,'',2,true,'S',Application.Title,'Qual o valor do Percentual de Reajuste ?','0,00');
  if perce = '*' then exit;

  perc := StrToCurr(perce);
  sim := funcoes.dialogo('generico',0,'SN'+#8,0,false,'S','Control For Windows','Confirma Reajuste de '+ formataCurrency(perc) +'% ?S/N','N') ;
  if ((sim = '*') or (sim = 'N')) then exit;

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select cod, fornec, p_venda from produto');
  dm.IBselect.Open;
  dm.IBselect.FetchAll;

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Clear;
  dm.IBQuery1.SQL.Add('update produto set p_venda = p_venda + :preco where cod = :cod');

  ini := 0;
  reg := 0;
  fim := dm.IBselect.RecordCount;
  funcoes.informacao(1,2,'Aguarde, Reajustando Pre�os ',true, false, 2);
  while not dm.IBselect.Eof do
    begin
      ini := ini + 1;
      funcoes.informacao(ini, fim, 'Aguarde, Reajustando Pre�os...', false, false, 2);

      if ((dm.IBselect.FieldByName('fornec').AsString = fornec) and (dm.IBselect.fieldbyname('p_venda').AsCurrency <> 0)) then
        begin
          dm.IBQuery1.ParamByName('preco').AsCurrency := (dm.IBselect.fieldbyname('p_venda').AsCurrency * perc / 100);
          dm.IBQuery1.ParamByName('cod').AsString     :=  dm.IBselect.fieldbyname('cod').AsString;
          dm.IBQuery1.ExecSQL;
          reg := reg + 1;
        end;

      dm.IBselect.Next;
    end;
  funcoes.informacao(1,2,'Aguarde, Reajustando Pre�os ',false, true, 2);

  try
    dm.IBQuery1.Transaction.Commit;
  except
  end;  

  dm.IBselect.Close;
  ShowMessage(IntToStr(reg) + ' Produtos Reajustos Com Sucesso');
end;

procedure TForm2.PorGrupo1Click(Sender: TObject);
var
  ini,fim,ee, h1, CODINI, CODFIM, orde, COD, prodzero:string;
  totalGeral : currency;
  i, fi, b, a : integer;
  listVend, listProd : TItensAcumProd;
begin
  ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(StartOfTheMonth(form22.datamov)));
  if ini = '*' then exit;

  fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?',formatadataddmmyy(endOfTheMonth(form22.datamov)));
  if fim = '*' then exit;

  //prodzero := funcoes.dialogo('generico',30,'SNA',20,true,'S',Application.Title,'Imprimir Produtos (S-Vendidos N-N�o Vendidos A-Ambos) ?', 'A');
  //if prodzero = '*' then exit;

  grupo := funcoes.dialogo('generico',30,'1234567890' + #8,70,false,'',Application.Title,'Qual o C�digo do Grupo ?', '');
  if prodzero = '*' then exit;

  h1 := '';
  if grupo <> '' then h1 := 'p.grupo = ' + StrNum(grupo) + ' and ';

  form19.RichEdit1.Clear;
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|',' ',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('PRODUTO MAIS VENDIDO DE: '+FormatDateTime('dd/mm/yy',StrToDate(ini))+' A '+FormatDateTime('dd/mm/yy',StrToDate(fim)),'HORA: '+FormatDateTime('tt',now)+'|',' ',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('CODIGO DESCRICAO                                   QUANT.   P. MEDIO       TOTAL'+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select i.cod, v.vendedor, i.quant, i.total from item_venda i inner join' +
  ' produto p on (p.cod = i.cod) left join venda v on (v.nota = i.nota) where  '+ h1 +' (v.cancelado = 0) and ((i.data >= :v1) and'+
  ' (i.data<=:v2)) order by i.cod';
  {dm.IBselect.SQL.Text := ('select p.cod, p.nome, v.vendedor, SUM(i.quant)as quant, SUM(i.total)as total  from item_venda i inner join' +
  ' produto p on (p.cod = i.cod) left join venda v on (v.nota = i.nota) where '+ h1 +' ((i.data >= :v1) and'+
  ' (i.data<=:v2)) group by p.cod, p.nome, v.vendedor'); }
  dm.IBselect.ParamByName('v1').AsDateTime := StrToDate(ini);
  dm.IBselect.ParamByName('v2').AsDateTime := StrToDate(fim);
  dm.IBselect.Open;
  dm.IBselect.First;
  dm.IBselect.FetchAll;
  totalGeral := 0;

  COD := '-';

  funcoes.informacao(0, fi, 'Aguade, Gerando Relat�rio...', true, false, 2);
  fi         := dm.IBselect.RecordCount;
  i          := 0;
  listVend   := TItensAcumProd.Create;
  listProd   := TItensAcumProd.Create;
  totalGeral := 0;

  while not dm.IBselect.Eof do
    begin
      funcoes.informacao(i, fi, 'Aguade, Gerando Relat�rio...', false, false, 2);
      i := i + 1;

      a := listProd.Find(dm.IBselect.fieldbyname('cod').AsInteger);
      if a = -1 then begin
        a := listProd.Add(TacumProd.Create);
        listProd[a].cod   := dm.IBselect.fieldbyname('cod').AsInteger;
        listProd[a].quant := dm.IBselect.fieldbyname('quant').AsCurrency;
        listProd[a].dep   := dm.IBselect.fieldbyname('total').AsCurrency;
      end
      else begin
        listProd[a].quant := listProd[a].quant + dm.IBselect.fieldbyname('quant').AsCurrency;
        listProd[a].dep   := listProd[a].dep   + dm.IBselect.fieldbyname('total').AsCurrency;
      end;

      b := listVend.Find(dm.IBselect.fieldbyname('vendedor').AsInteger);
      if b = -1 then begin
        b := listVend.Add(TacumProd.Create);
        listVend[b].cod   := dm.IBselect.fieldbyname('vendedor').AsInteger;
        listVend[b].quant := dm.IBselect.fieldbyname('quant').AsCurrency;
        listVend[b].dep   := dm.IBselect.fieldbyname('total').AsCurrency;
      end
      else begin
        listVend[b].quant := listVend[b].quant + dm.IBselect.fieldbyname('quant').AsCurrency;
        listVend[b].dep   := listVend[b].dep   + dm.IBselect.fieldbyname('total').AsCurrency;
      end;

      totalGeral := totalGeral + dm.IBselect.fieldbyname('quant').AsCurrency;
      dm.IBselect.Next;
    end;

  listProd.Sort(OrdenaPorQUANTTacumProd);

  for a := 0 to listProd.Count -1 do begin
    dm.IBselect.Close;
    dm.IBselect.SQL.Text := 'select nome from produto where cod = :cod';
    dm.IBselect.ParamByName('cod').AsInteger := listProd[a].cod;
    dm.IBselect.Open;

    prodzero := dm.IBselect.FieldByName('nome').AsString;
    if prodzero = '' then prodzero := 'DESCONHECIDO';

    addRelatorioForm19(funcoes.CompletaOuRepete('', IntToStr(listProd[a].cod),'0',6)+' '+funcoes.CompletaOuRepete(LeftStr(prodzero,35),'',' ',35)+
    funcoes.CompletaOuRepete('',FormatCurr('0.00',listProd[a].quant),' ',15) + funcoes.CompletaOuRepete('',FormatCurr('0.00',listProd[a].dep /Arredonda(listProd[a].quant, 2)),' ',11) +
    funcoes.CompletaOuRepete('',FormatCurr('0.00',Arredonda(listProd[a].dep, 2)),' ',12)  + CRLF);
  end;


  funcoes.informacao(i, fi, 'Aguade, Gerando Relat�rio...', false, true, 2);
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('TOTAL GERAL QTD =>   ',FormatCurr('#,###,###0.00',totalGeral),' ',57)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));

  listVend.Sort(OrdenaPorDEPTacumProdDESC);

  TOT := 0;
  for b := 0 to listVend.Count -1 do begin
    dm.IBselect.Close;
    dm.IBselect.SQL.Text := 'select nome from vendedor where cod = :cod';
    dm.IBselect.ParamByName('cod').AsInteger := listVend[b].cod;
    dm.IBselect.Open;

    prodzero := dm.IBselect.FieldByName('nome').AsString;
    if prodzero = '' then prodzero := 'DESCONHECIDO';

    prodzero := LeftStr(prodzero, 15);

    TOT := TOT + listVend[b].dep;

    addRelatorioForm19(CompletaOuRepete(IntToStr(listVend[b].cod) + ' ' + prodzero, formataCurrency(listVend[b].dep), ' ', 35) + CRLF);
  end;

  dm.IBselect.Close;
  listVend.Free;

  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',35)+#13+#10))));
  addRelatorioForm19(CompletaOuRepete('TOTAL >>', formataCurrency(TOT), ' ', 35) + CRLF);
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',35)+#13+#10))));

  form19.ShowModal;
end;

procedure TForm2.PorFabricante1Click(Sender: TObject);
var
 perce, sim : String;
 perc  : currency;
 ini, fim, reg : integer;
begin
  if not funcoes.senhaDodia then exit;

  fornec := funcoes.dialogo('generico', 60,'1234567890'+#8, 50,false,'','Control For Windows','Qual o Fabricante?','') ;
  if Fornec = '*' then exit;

  if fornec = '' then
    begin
      fornec := funcoes.localizar('Localizar Fabricante','fabricante','cod,nome','cod','','nome','nome',true,false,false,'',400, nil);
    end;
  if ((Fornec = '*') or (Fornec = '')) then exit;

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select cod from fabricante where cod = :cod');
  dm.IBselect.ParamByName('cod').AsString := fornec;
  dm.IBselect.Open;

  if dm.IBselect.IsEmpty then
    begin
      ShowMessage('Fabricante ' + fornec + ' N�o Encontrado');
      exit;
    end;
  dm.IBselect.Close;

  perce := funcoes.dialogo('numero',0,'',2,true,'S',Application.Title,'Qual o valor do Percentual de Reajuste ?','0,00');
  if perce = '*' then exit;

  perc := StrToCurr(perce);
  sim := funcoes.dialogo('generico',0,'SN'+#8,0,false,'S','Control For Windows','Confirma Reajuste de '+ formataCurrency(perc) +'% ?S/N','N') ;
  if ((sim = '*') or (sim = 'N')) then exit;

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select cod, fabric, p_venda from produto');
  dm.IBselect.Open;
  dm.IBselect.FetchAll;

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Clear;
  dm.IBQuery1.SQL.Add('update produto set p_venda = p_venda + :preco where cod = :cod');

  ini := 0;
  reg := 0;
  fim := dm.IBselect.RecordCount;
  funcoes.informacao(1,2,'Aguarde, Reajustando Pre�os ',true, false, 2);
  while not dm.IBselect.Eof do
    begin
      ini := ini + 1;
      funcoes.informacao(ini, fim, 'Aguarde, Reajustando Pre�os...', false, false, 2);

      if ((dm.IBselect.FieldByName('fabric').AsString = fornec) and (dm.IBselect.fieldbyname('p_venda').AsCurrency <> 0)) then
        begin
          dm.IBQuery1.ParamByName('preco').AsCurrency := (dm.IBselect.fieldbyname('p_venda').AsCurrency * perc / 100);
          dm.IBQuery1.ParamByName('cod').AsString     :=  dm.IBselect.fieldbyname('cod').AsString;
          dm.IBQuery1.ExecSQL;
          reg := reg + 1;
        end;  

      dm.IBselect.Next;
    end;
  funcoes.informacao(1,2,'Aguarde, Reajustando Pre�os ',false, true, 2);

  try
    dm.IBQuery1.Transaction.Commit;
  except
  end;

  dm.IBselect.Close;
  ShowMessage(IntToStr(reg) + ' Produtos Reajustos Com Sucesso');
end;

procedure TForm2.SuporteOnline1Click(Sender: TObject);
begin
  form54 := tform54.Create(self);
  form54.WebBrowser1.Navigate(site+'/si2');
  form54.ShowModal;
  form54.Free;
end;

procedure TForm2.AnaliticoProd1Click(Sender: TObject);
var
    dif, ven, avis,dini,dfim, venda, vended, porc : string;
    i, fim : integer;
    total, totVende, desconto, totcomiAvista, TOT,
    diferen, comiAvista : currency;
    comissaoDiferenciada,
    com1, com2, com3, com4, com0 : TStringList;
    avista : boolean;
    mattVal : array[1..3] of currency;
begin
  dini := funcoes.dialogo('data',0,'',2,true,'', Application.Title,'Qual a Data Inicial ?','');
  if dini = '*' then exit;

  dfim := funcoes.dialogo('data',0,'',2,true,'', Application.Title,'Qual a Data Final ?','');
  if dfim = '*' then exit;

  porc := funcoes.dialogo('numero',0,'',2,true,'S',Application.Title,'Qual o Percentual de Comiss�o (%)?','0,00');
  if porc = '*' then exit;

  comiAvista := StrToCurr(porc);

   comissaoDiferenciada := lerComissoesDiferenciadasNameCodigo(); //ler as comissoes diferenciadas
   com1 := TStringList.Create; //vendas
   com2 := TStringList.Create; //normal
   com3 := TStringList.Create; //diferenciado
   com4 := TStringList.Create; //descontos

   funcoes.informacao(0, fim, 'Aguarde, Calculando Comiss�es...', true, false, 5);

   Application.ProcessMessages;

   dm.IBselect.SQL.Clear;
   dm.IBselect.SQL.Add('select v.nota, v.prazo, i.data, p.nome, v.codhis, i.total, i.quant, i.cod, i.p_venda,v.prazo, i.vendedor, v.desconto' +
   ' from item_venda i left join produto p on (i.cod = p.cod), venda v where (i.nota = v.nota) and (v.cancelado = 0) and ((v.data >= :dini) and (v.data <= :dfim)) order by i.vendedor, i.nota');
   dm.IBselect.ParamByName('dini').AsDateTime := StrToDateTime(dini);
   dm.IBselect.ParamByName('dfim').AsDateTime := StrToDateTime(dfim);
   dm.IBselect.Open;
   dm.IBselect.FetchAll;

   fim    := dm.IBselect.RecordCount;
   ini    := 0;
   venda  := dm.IBselect.fieldbyname('nota').AsString;
   vended := dm.IBselect.fieldbyname('vendedor').AsString;
   desconto := dm.IBselect.fieldbyname('desconto').AsCurrency;
   ven    := vended;

   mattVal[1] := 0; //vendas
   mattVal[2] := 0; //normal
   mattVal[3] := 0; //dif

  form19.RichEdit1.Clear;
  addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80) + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete(form22.Pgerais.Values['empresa'], FormatDateTime('dd/mm/yy',form22.datamov), ' ', 80) + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('RELATORIO DE COMISSOES POR VENDEDOR: ' +  dm.IBselect.fieldbyname('vendedor').AsString + '-' + funcoes.BuscaNomeBD(dm.ibquery1, 'nome', 'vendedor', ' where cod = ' + dm.IBselect.fieldbyname('vendedor').AsString), FormatDateTime('tt',now),' ', 80) + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80) + #13 + #10);
  addRelatorioForm19('  DATA   DESCRICAO                            QUANT      TOTAL  COMISSAO        ' + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80) + #13 + #10);

   while not dm.IBselect.Eof do
     begin
       ini := ini + 1;
       funcoes.informacao(ini, fim, 'Aguarde, calculando Comiss�es...', false, false, 5);

       if ven <> dm.IBselect.fieldbyname('vendedor').AsString then
         begin
           com2.Values[ven] := CurrToStr(StrToCurr(com2.Values[ven]) + (desconto * (comiAvista / 100)));
           com1.Values[ven] := CurrToStr(StrToCurr(com1.Values[ven]) + desconto );
           addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80) + #13 + #10);
           addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL ' + ven + ' ===> ' + Funcoes.CompletaOuRepete('VENDAS:', formataCurrency(StrToCurr(com1.Values[ven])), ' ', 20) + ' ' + Funcoes.CompletaOuRepete('NORMAL:', formataCurrency(StrToCurr(com2.Values[ven])), ' ', 20) + ' ' + Funcoes.CompletaOuRepete('DIFERENCIADA:', formataCurrency(StrToCurr(com3.Values[ven])), ' ', 24),'',' ',80) + #13 + #10);
           addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-',80) + #13 + #10 + #12);

           ven := dm.IBselect.fieldbyname('vendedor').AsString;

           addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80) + #13 + #10);
           addRelatorioForm19(funcoes.CompletaOuRepete(form22.Pgerais.Values['empresa'], FormatDateTime('dd/mm/yy',form22.datamov), ' ', 80) + #13 + #10);
           addRelatorioForm19(funcoes.CompletaOuRepete('RELATORIO DE COMISSOES POR VENDEDOR: ' +  dm.IBselect.fieldbyname('vendedor').AsString + '-' + funcoes.BuscaNomeBD(dm.ibquery1, 'nome', 'vendedor', ' where cod = ' + dm.IBselect.fieldbyname('vendedor').AsString), FormatDateTime('tt',now),' ', 80) + #13 + #10);
           addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80) + #13 + #10);
           addRelatorioForm19('  DATA   DESCRICAO                            QUANT      TOTAL  COMISSAO        ' + #13 + #10);
           addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80) + #13 + #10);
         end;

       diferen := StrToCurrDef(comissaoDiferenciada.Values[dm.IBselect.FieldByName('cod').AsString], 0);
       tot     := dm.IBselect.fieldbyname('total').AsCurrency;

       total := 0;
       mattVal[1] := 0; //vendas
       mattVal[2] := 0; //normal
       mattVal[3] := 0; //dif

       if diferen <> 0 then
         begin
           totVende := (tot * (diferen / 100));
           mattVal[1] := mattVal[1] + dm.IBselect.fieldbyname('total').AsCurrency;
           mattVal[3] := mattVal[3] + totVende;

           addRelatorioForm19(formataDataDDMMYY(dm.IBselect.fieldbyname('data').AsDateTime) + ' ' + funcoes.CompletaOuRepete(copy(dm.IBselect.fieldbyname('cod').AsString + '-' + dm.IBselect.fieldbyname('nome').AsString, 1, 35), '', ' ', 35) + funcoes.CompletaOuRepete('', formataCurrency(dm.IBselect.fieldbyname('quant').AsCurrency), ' ', 8) +
           funcoes.CompletaOuRepete('', formataCurrency(dm.IBselect.fieldbyname('total').AsCurrency), ' ', 11) + funcoes.CompletaOuRepete('', formataCurrency(totVende), ' ', 8) + funcoes.CompletaOuRepete('', formataCurrency(diferen), ' ', 8) + '%' + #13 + #10) ;
         end
       else
         begin
            totVende := (tot * (comiAvista / 100));
            mattVal[2] := mattVal[2] + totVende;
            mattVal[1] := mattVal[1] + dm.IBselect.fieldbyname('total').AsCurrency;

            addRelatorioForm19(formataDataDDMMYY(dm.IBselect.fieldbyname('data').AsDateTime) + ' ' + funcoes.CompletaOuRepete(copy(dm.IBselect.fieldbyname('cod').AsString + '-' + dm.IBselect.fieldbyname('nome').AsString, 1, 35), '', ' ', 35) + funcoes.CompletaOuRepete('', formataCurrency(dm.IBselect.fieldbyname('quant').AsCurrency), ' ', 8) +
            funcoes.CompletaOuRepete('', formataCurrency(dm.IBselect.fieldbyname('total').AsCurrency), ' ', 11) + funcoes.CompletaOuRepete('', formataCurrency(totVende), ' ', 8) + funcoes.CompletaOuRepete('', formataCurrency(comiAvista), ' ', 8) + '%' + #13 + #10) ;
         end;

       if venda <> dm.IBselect.fieldbyname('nota').AsString then
         begin
           com2.Values[vended] := CurrToStr(StrToCurr(com2.Values[vended]) + (desconto * (comiAvista / 100)));
           com1.Values[vended] := CurrToStr(StrToCurr(com1.Values[vended]) + desconto );

           //com1.Values[vended] := CurrToStr(StrToCurr(com1.Values[vended]) + desconto );
           desconto := dm.IBselect.fieldbyname('desconto').AsCurrency;
           venda    := dm.IBselect.fieldbyname('nota').AsString;
           vended   := dm.IBselect.fieldbyname('vendedor').AsString;
         end
       else
         begin
           desconto := dm.IBselect.fieldbyname('desconto').AsCurrency;
           vended   := dm.IBselect.fieldbyname('vendedor').AsString;
         end;

       if com1.Values[dm.IBselect.fieldbyname('vendedor').AsString] <> '' then
         begin
           if mattVal[3] <> 0 then com3.Values[dm.IBselect.fieldbyname('vendedor').AsString] := CurrToStr(StrToCurr(com3.Values[dm.IBselect.fieldbyname('vendedor').AsString]) + mattVal[3]);
           if mattVal[1] <> 0 then com1.Values[dm.IBselect.fieldbyname('vendedor').AsString] := CurrToStr(StrToCurr(com1.Values[dm.IBselect.fieldbyname('vendedor').AsString]) + mattVal[1]);
           if mattVal[2] <> 0 then com2.Values[dm.IBselect.fieldbyname('vendedor').AsString] := CurrToStr(StrToCurr(com2.Values[dm.IBselect.fieldbyname('vendedor').AsString]) + mattVal[2]);
         end
       else
         begin
           com3.Values[dm.IBselect.fieldbyname('vendedor').AsString] := CurrToStr(mattVal[3]); //a vista
           com1.Values[dm.IBselect.fieldbyname('vendedor').AsString] := CurrToStr(mattVal[1]); //a vista dif
           com2.Values[dm.IBselect.fieldbyname('vendedor').AsString] := CurrToStr(mattVal[2]); //a prazo dif
         end;

       dm.IBselect.Next; //next do dataset de venda
     end;

     com2.Values[vended] := CurrToStr(StrToCurr(com2.Values[vended]) + (desconto * (comiAvista / 100)));
     com1.Values[vended] := CurrToStr(StrToCurr(com1.Values[vended]) + desconto );

     addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80) + #13 + #10);
     addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL ' + ven + ' ===> ' + Funcoes.CompletaOuRepete('VENDAS:', formataCurrency(StrToCurr(com1.Values[ven])), ' ', 20) + ' ' + Funcoes.CompletaOuRepete('NORMAL:', formataCurrency(StrToCurr(com2.Values[ven])), ' ', 20) + ' ' + Funcoes.CompletaOuRepete('DIFERENCIADA:', formataCurrency(StrToCurr(com3.Values[ven])), ' ', 24),'',' ',80) + #13 + #10);
     addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-',80) + #13 + #10);

    fim      := com1.Count -1;
    total    := 0;
    totVende := 0;

    for i := 0 to fim do
      begin
        totVende := totVende + StrToCurrDef(com2.Values[com1.Names[i]], 0) + StrToCurrDef(com3.Values[com1.Names[i]], 0);
        total := total       + StrToCurr(com1.Values[com1.Names[i]]);
      end;

    addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80) + #13 + #10);
    addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL GERAL => ' + Funcoes.CompletaOuRepete('VENDAS:', formataCurrency(total), ' ', 20) + ' ' + Funcoes.CompletaOuRepete('COMISSAO', formataCurrency(totVende), ' ', 25) ,'',' ',80) + #13 + #10);
    addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-',80) + #13 + #10 + #12);

   dm.IBselect.Close;
   dm.IBQuery2.Close;
   dm.IBQuery1.Close;
   com1.Free;
   com2.Free;
   com3.Free;
   funcoes.informacao(0, fim, 'Aguarde...', false, true, 5);

   form19.ShowModal;
end;

procedure TForm2.AnaliticoProd2Click(Sender: TObject);
var
    dif, ven, avis,dini,dfim, venda, vended, porc : string;
    i, fim : integer;
    total, totVende, desconto, totcomiAvista, TOT,
    diferen, comiAvista : currency;
    comissaoDiferenciada,
    com1, com2, com3, com4, com0 : TStringList;
    avista : boolean;
    mattVal : array[1..4] of currency;
begin
  dini := funcoes.dialogo('data',0,'',2,true,'', Application.Title,'Qual a Data Inicial ?','');
  if dini = '*' then exit;

  dfim := funcoes.dialogo('data',0,'',2,true,'', Application.Title,'Qual a Data Final ?','');
  if dfim = '*' then exit;

  porc := funcoes.dialogo('numero',0,'',2,true,'S',Application.Title,'Qual o Percentual de Comiss�o (%)?','0,00');
  if porc = '*' then exit;

  ven  := funcoes.dialogo('generico',0,'1234567890'+#8,0,false,'','Control For Windows','Qual o Vendedor?','') ;
  if ven = '*' then exit;

  comiAvista := StrToCurr(porc);

  comissaoDiferenciada := lerComissoesDiferenciadasNameCodigo(); //ler as comissoes diferenciadas
   com1 := TStringList.Create; //vendas
   com2 := TStringList.Create; //normal
   com3 := TStringList.Create; //diferenciado

   funcoes.informacao(0, fim, 'Aguarde, Calculando Comiss�es...', true, false, 5);

   Application.ProcessMessages;

   dm.IBselect.SQL.Clear;
   dm.IBselect.SQL.Add('select v.nota, v.prazo, v.cliente, c.nome, i.data, i.total, v.total as totnota, i.quant, i.cod, v.prazo, i.vendedor, v.desconto' +
   ' from item_venda i, venda v left join cliente c on (v.cliente = c.cod) where '+ IfThen(ven <> '', '(v.vendedor = ' + ven + ') and', '') +' (i.nota = v.nota) and (v.cancelado = 0) and ((v.data >= :dini) and (v.data <= :dfim)) order by i.vendedor, i.nota');
   dm.IBselect.ParamByName('dini').AsDateTime := StrToDateTime(dini);
   dm.IBselect.ParamByName('dfim').AsDateTime := StrToDateTime(dfim);
   dm.IBselect.Open;
   dm.IBselect.FetchAll;

   fim    := dm.IBselect.RecordCount;
   ini    := 0;
   venda  := dm.IBselect.fieldbyname('nota').AsString;
   vended := dm.IBselect.fieldbyname('vendedor').AsString;
   ven    := vended;

   mattVal[1] := 0; //vendas
   mattVal[2] := 0; //normal
   mattVal[3] := 0; //dif
   mattVal[4] := 0; //dif

  form19.RichEdit1.Clear;
  addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80) + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete(form22.Pgerais.Values['empresa'], FormatDateTime('dd/mm/yy',form22.datamov), ' ', 80) + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('RELATORIO DE COMISSOES POR VENDEDOR: ' +  dm.IBselect.fieldbyname('vendedor').AsString + '-' + funcoes.BuscaNomeBD(dm.ibquery1, 'nome', 'vendedor', ' where cod = ' + dm.IBselect.fieldbyname('vendedor').AsString), FormatDateTime('tt',now),' ', 80) + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80) + #13 + #10);
  addRelatorioForm19('  DATA    NOTA   CLIENTE                                        VALOR   COMISSAO' + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80) + #13 + #10);

  {
  com2 := TStringList.Create; //normal
   com3 := TStringList.Create; //diferenciado
  }
  funcoes.informacao(ini, fim, 'Aguarde, calculando Comiss�es...', true, false, 5);
  nota     := dm.IBselect.FieldByName('nota').AsString;
  while not dm.IBselect.Eof do begin
    ini := ini + 1;
    funcoes.informacao(ini, fim, 'Aguarde, calculando Comiss�es...', false, false, 5);

    if nota <> dm.IBselect.FieldByName('nota').AsString then begin
      dm.IBselect.Prior;

      //aqui pegou o desconto da ultima venda e lanca na comissao maior do vendedor
      desconto := dm.IBselect.FieldByName('desconto').AsCurrency;
      if CurrToStr(StrToCurrDef(com3.Values[ven], 0)) > CurrToStr(StrToCurrDef(com2.Values[ven], 0)) then begin
        com3.Values[ven] := CurrToStr(StrToCurrDef(com3.Values[ven], 0) + (desconto * (comiAvista / 100)));
      end
      else com2.Values[ven] := CurrToStr(StrToCurrDef(com2.Values[ven], 0) + (desconto * (comiAvista / 100)));
      //ja lancou o desconto

      addRelatorioForm19(formataDataDDMMYY(dm.IBselect.fieldbyname('data').AsDateTime) + ' ' + funcoes.CompletaOuRepete('', dm.IBselect.fieldbyname('nota').AsString, ' ', 7) + ' ' + funcoes.CompletaOuRepete(copy(dm.IBselect.fieldbyname('cliente').AsString + '-' + dm.IBselect.fieldbyname('nome').AsString, 1, 40), '', ' ', 40) + funcoes.CompletaOuRepete('', formataCurrency(dm.IBselect.fieldbyname('totnota').AsCurrency), ' ', 12) +
      funcoes.CompletaOuRepete('', formataCurrency(Arredonda(mattVal[1] + (desconto * (comiAvista / 100)), 2)), ' ', 11) + #13 + #10) ;
      dm.IBselect.Next;

      mattVal[1] := 0;
      nota := dm.IBselect.FieldByName('nota').AsString;
    end;

    if ven <> dm.IBselect.fieldbyname('vendedor').AsString then begin
      addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80) + #13 + #10);
      //addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL ' + ven + ' => ' + Funcoes.CompletaOuRepete('VENDAS:', formataCurrency(mattVal[1]), ' ', 20) + ' ' + Funcoes.CompletaOuRepete('NORMAL:', formataCurrency(mattVal[2]), ' ', 20) + ' ' + Funcoes.CompletaOuRepete('DIFERENCIADA:', formataCurrency(mattVal[3]), ' ', 24),'',' ',80) + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL ' + ven + ' => ' + Funcoes.CompletaOuRepete('VENDAS:', formataCurrency(StrToCurrDef(com1.Values[ven], 0)), ' ', 20) + ' ' +
      Funcoes.CompletaOuRepete('NORMAL:', formataCurrency(StrToCurrDef(com2.Values[ven], 0)), ' ', 20) + ' ' +
      Funcoes.CompletaOuRepete('DIFERENCIADA:', formataCurrency(StrToCurrDef(com3.Values[ven], 0)), ' ', 24),'',' ',80) + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-',80) + #13 + #10 + #12);

      ven := dm.IBselect.fieldbyname('vendedor').AsString;

      addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80) + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete(form22.Pgerais.Values['empresa'], FormatDateTime('dd/mm/yy',form22.datamov), ' ', 80) + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete('RELATORIO DE COMISSOES POR VENDEDOR: ' +  dm.IBselect.fieldbyname('vendedor').AsString + '-' + funcoes.BuscaNomeBD(dm.ibquery1, 'nome', 'vendedor', ' where cod = ' + dm.IBselect.fieldbyname('vendedor').AsString), FormatDateTime('tt',now),' ', 80) + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80) + #13 + #10);
      addRelatorioForm19('  DATA    NOTA   CLIENTE                                        VALOR   COMISSAO' + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80) + #13 + #10);
    end;

    diferen := StrToCurrDef(comissaoDiferenciada.Values[dm.IBselect.FieldByName('cod').AsString], 0);
    tot     := dm.IBselect.fieldbyname('total').AsCurrency;
    //mattVal[1] := mattVal[1] + dm.IBselect.fieldbyname('total').AsCurrency;

    if diferen <> 0 then begin
      com3.Values[ven] := CurrToStr(StrToCurrDef(com3.Values[ven], 0) + (TOT * (diferen / 100)));
      mattVal[1] := mattVal[1] + (TOT * (diferen / 100));
    end
    else begin
      com2.Values[ven] := CurrToStr(StrToCurrDef(com2.Values[ven], 0) + (TOT * (comiAvista / 100)));
      mattVal[1] := mattVal[1] + (TOT * (comiAvista / 100));
    end;

    //ShowMessage('com3.GetText=' +com3.GetText + #13 + #13 + 'com2.GetText='+com2.GetText);

    com1.Values[ven] := CurrToStr(StrToCurrDef(com1.Values[ven], 0) + TOT);
    dm.IBselect.Next;
  end;

  funcoes.informacao(ini, fim, 'Aguarde, calculando Comiss�es...', false, true, 5);


   {while not dm.IBselect.Eof do
     begin
       ini := ini + 1;
       funcoes.informacao(ini, fim, 'Aguarde, calculando Comiss�es...', false, false, 5);

       if ven <> dm.IBselect.fieldbyname('vendedor').AsString then
         begin
           addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80) + #13 + #10);
           //addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL ' + ven + ' => ' + Funcoes.CompletaOuRepete('VENDAS:', formataCurrency(mattVal[1]), ' ', 20) + ' ' + Funcoes.CompletaOuRepete('NORMAL:', formataCurrency(mattVal[2]), ' ', 20) + ' ' + Funcoes.CompletaOuRepete('DIFERENCIADA:', formataCurrency(mattVal[3]), ' ', 24),'',' ',80) + #13 + #10);
           addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL ' + ven + ' => ' + Funcoes.CompletaOuRepete('VENDAS:', formataCurrency(StrToCurr(com1.Values[ven])), ' ', 20) + ' ' + Funcoes.CompletaOuRepete('NORMAL:', formataCurrency(StrToCurr(com2.Values[ven])), ' ', 20) + ' ' + Funcoes.CompletaOuRepete('DIFERENCIADA:', formataCurrency(StrToCurr(com3.Values[ven])), ' ', 24),'',' ',80) + #13 + #10);
           addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-',80) + #13 + #10 + #12);

           ven := dm.IBselect.fieldbyname('vendedor').AsString;

           addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80) + #13 + #10);
           addRelatorioForm19(funcoes.CompletaOuRepete(form22.Pgerais.Values['empresa'], FormatDateTime('dd/mm/yy',form22.datamov), ' ', 80) + #13 + #10);
           addRelatorioForm19(funcoes.CompletaOuRepete('RELATORIO DE COMISSOES POR VENDEDOR: ' +  dm.IBselect.fieldbyname('vendedor').AsString + '-' + funcoes.BuscaNomeBD(dm.ibquery1, 'nome', 'vendedor', ' where cod = ' + dm.IBselect.fieldbyname('vendedor').AsString), FormatDateTime('tt',now),' ', 80) + #13 + #10);
           addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80) + #13 + #10);
           addRelatorioForm19('  DATA   DESCRICAO                            QUANT      TOTAL  COMISSAO        ' + #13 + #10);
           addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80) + #13 + #10);
         end;

       total      := 0;
       venda      := dm.IBselect.fieldbyname('nota').AsString;
       mattVal[1] := 0; //vendas
       mattVal[2] := 0; //normal
       mattVal[3] := 0; //dif
       mattVal[4] := 0; //dif

       while true do
         begin
           if dm.IBselect.Eof then break;
           if venda  <> dm.IBselect.fieldbyname('nota').AsString then
             begin
               dm.IBselect.Prior;
               Break;
             end;

           vended   := dm.IBselect.fieldbyname('vendedor').AsString;

           diferen := StrToCurrDef(comissaoDiferenciada.Values[dm.IBselect.FieldByName('cod').AsString], 0);
           tot     := dm.IBselect.fieldbyname('total').AsCurrency;
           mattVal[1] := mattVal[1] + dm.IBselect.fieldbyname('total').AsCurrency;

           if diferen <> 0 then
             begin
               totVende := (tot * (diferen / 100));
               mattVal[3] := mattVal[3] + totVende;
               mattVal[4] := mattVal[4] + totVende;
             end
           else
             begin
               totVende := (tot * (comiAvista / 100));
               mattVal[2] := mattVal[2] + totVende;
               mattVal[4] := mattVal[4] + totVende;
             end;

           dm.IBselect.Next;
         end;

       if com1.Values[vended] <> '' then
         begin
           if mattVal[3] <> 0 then com3.Values[vended] := CurrToStr(StrToCurr(com3.Values[vended]) + mattVal[3]);
           if mattVal[1] <> 0 then com1.Values[vended] := CurrToStr(StrToCurr(com1.Values[vended]) + mattVal[1]);
           if mattVal[2] <> 0 then com2.Values[vended] := CurrToStr(StrToCurr(com2.Values[vended]) + mattVal[2]);
         end
       else
         begin
           com3.Values[vended] := CurrToStr(mattVal[3]); //a vista
           com1.Values[vended] := CurrToStr(mattVal[1]); //a vista dif
           com2.Values[vended] := CurrToStr(mattVal[2]); //a prazo dif
         end;

       desconto := dm.IBselect.fieldbyname('desconto').AsCurrency;
       com2.Values[vended] := CurrToStr(StrToCurrDef(com2.Values[vended], 0) + (desconto * (comiAvista / 100)));
       com1.Values[vended] := CurrToStr(StrToCurrDef(com1.Values[vended], 0) + desconto );
       mattVal[4] := mattVal[4] + (desconto * (comiAvista / 100));

       addRelatorioForm19(formataDataDDMMYY(dm.IBselect.fieldbyname('data').AsDateTime) + ' ' + funcoes.CompletaOuRepete('', dm.IBselect.fieldbyname('nota').AsString, ' ', 7) + ' ' + funcoes.CompletaOuRepete(copy(dm.IBselect.fieldbyname('cliente').AsString + '-' + dm.IBselect.fieldbyname('nome').AsString, 1, 40), '', ' ', 40) + funcoes.CompletaOuRepete('', formataCurrency(dm.IBselect.fieldbyname('totnota').AsCurrency), ' ', 12) +
       funcoes.CompletaOuRepete('', formataCurrency(mattVal[4]), ' ', 11) + #13 + #10) ;
       mattVal[4] := 0;

       dm.IBselect.Next; //next do dataset de venda
     end;    }

     //aqui pegou o desconto da ultima venda e lanca na comissao maior do vendedor
      desconto := dm.IBselect.FieldByName('desconto').AsCurrency;
      if CurrToStr(StrToCurrDef(com3.Values[ven], 0)) > CurrToStr(StrToCurrDef(com2.Values[ven], 0)) then begin
        com3.Values[ven] := CurrToStr(StrToCurrDef(com3.Values[ven], 0) + (desconto * (comiAvista / 100)));
      end
      else com2.Values[ven] := CurrToStr(StrToCurrDef(com2.Values[ven], 0) + (desconto * (comiAvista / 100)));
      //ja lancou o desconto

      addRelatorioForm19(formataDataDDMMYY(dm.IBselect.fieldbyname('data').AsDateTime) + ' ' + funcoes.CompletaOuRepete('', dm.IBselect.fieldbyname('nota').AsString, ' ', 7) + ' ' + funcoes.CompletaOuRepete(copy(dm.IBselect.fieldbyname('cliente').AsString + '-' + dm.IBselect.fieldbyname('nome').AsString, 1, 40), '', ' ', 40) + funcoes.CompletaOuRepete('', formataCurrency(dm.IBselect.fieldbyname('totnota').AsCurrency), ' ', 12) +

      funcoes.CompletaOuRepete('', formataCurrency(Arredonda(mattVal[1] + (desconto * (comiAvista / 100)), 2)), ' ', 11) + #13 + #10) ;

     addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80) + #13 + #10);
     addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL ' + ven + ' => ' + Funcoes.CompletaOuRepete('VENDAS:', formataCurrency(StrToCurr(com1.Values[ven])), ' ', 20) + ' ' + Funcoes.CompletaOuRepete('NORMAL:', formataCurrency(Arredonda(StrToCurrDef(com2.Values[ven], 0), 2)), ' ', 20) + ' ' + Funcoes.CompletaOuRepete('DIFERENCIADA:', formataCurrency(Arredonda(StrToCurrDef(com3.Values[ven], 0), 2)), ' ', 24),'',' ',80) + #13 + #10);
     addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-',80) + #13 + #10);

    fim      := com1.Count -1;
    total    := 0;
    totVende := 0;

    for i := 0 to fim do
      begin
        totVende := totVende + StrToCurrDef(com2.Values[com1.Names[i]], 0) + StrToCurrDef(com3.Values[com1.Names[i]], 0);
        total := total       + StrToCurr(com1.Values[com1.Names[i]]);
      end;

    addRelatorioForm19(funcoes.CompletaOuRepete('','','-',80) + #13 + #10);
    addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL GERAL => ' + Funcoes.CompletaOuRepete('VENDAS:', formataCurrency(total), ' ', 20) + ' ' + Funcoes.CompletaOuRepete('COMISSAO', formataCurrency(totVende), ' ', 25) ,'',' ',80) + #13 + #10);
    addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-',80) + #13 + #10 + #12);

   dm.IBselect.Close;
   dm.IBQuery2.Close;
   dm.IBQuery1.Close;
   com1.Free;
   com2.Free;
   com3.Free;
   //funcoes.informacao(0, fim, 'Aguarde...', false, true, 5);

   form19.ShowModal;
end;

procedure TForm2.SadasdeEstoque1Click(Sender: TObject);
begin
  form19.RichEdit1.Clear;
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 85) + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.centraliza('SAIDAS DE ESTOQUE', ' ',85), '', '', 85) + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 85) + #13 + #10);
  addRelatorioForm19('DATA      NOTA JUSTIFICATIVA                         VOLUMES       VALOR      USUARIO' + #13 + #10);
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 85) + #13 + #10);

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select * from justificativa');
  dm.IBselect.Open;

  dm.IBQuery2.Close;
  dm.IBQuery2.SQL.Clear;
  dm.IBQuery2.SQL.Add('select v.usuario, u.nome  from venda v left join usuario u on (v.usuario = u.cod) where v.nota = :nota');

  while not dm.IBselect.Eof do
    begin
      dm.IBQuery2.Close;
      dm.IBQuery2.ParamByName('nota').AsString := dm.IBselect.fieldbyname('NOTA').AsString;
      dm.IBQuery2.Open;
      addRelatorioForm19(funcoes.CompletaOuRepete(formataDataDDMMYY(dm.IBselect.fieldbyname('data').AsDateTime) + ' ' + funcoes.CompletaOuRepete('', dm.IBselect.fieldbyname('NOTA').AsString, ' ', 7) + ' ' + funcoes.CompletaOuRepete(copy(dm.IBselect.fieldbyname('justificativa').AsString, 1, 38), '', ' ', 38)  + funcoes.CompletaOuRepete('', dm.IBselect.fieldbyname('VOLUMES').AsString, ' ', 4) + funcoes.CompletaOuRepete('', formataCurrency(dm.IBselect.fieldbyname('valor').AsCurrency), ' ', 13) + funcoes.CompletaOuRepete('', copy(IfThen(dm.IBQuery2.fieldbyname('nome').AsString = '',' ' + dm.IBQuery2.fieldbyname('usuario').AsString + '-Nao Encontrad', dm.IBQuery2.fieldbyname('nome').AsString), 1, 13), ' ', 13), '', ' ', 85) + #13 + #10);
      dm.IBselect.Next;
    end;

  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 85) + #13 + #10);
  dm.IBselect.Close;
  dm.IBQuery2.Close;
  form19.ShowModal;  
end;

procedure TForm2.Cdigo1Click(Sender: TObject);
var
  ini,fim,ee, CODINI, CODFIM, orde:string;
  totalGeral : currency;
  i, fi : integer;
  qtd, p_compra, total : TStringList;
begin

  ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(StartOfTheMonth(form22.datamov)));
  if ini = '*' then exit;

  fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?',formatadataddmmyy(endOfTheMonth(form22.datamov)));
  if fim = '*' then exit;

  CODINI := funcoes.dialogo('generico',90,'1234567890'+#8, 90, true,'','Control For Windows','Qual o C�d. Inicial?','') ;
  if CODINI = '*' then exit;

  CODFIM := funcoes.dialogo('generico', 90,'1234567890'+#8, 90, true,'','Control For Windows','Qual o C�d. Final?','') ;
  if CODFIM = '*' then exit;

  orde := funcoes.dialogo('generico', 90,'1234567890'+#8, 90, true,'','Control For Windows','Qual a Ordem (1 - Cod, 2 - Nome)?','2') ;
  if orde = '*' then exit;

  if orde = '2' then orde := 'p.nome'
    else orde := 'i.cod';

  qtd      := TStringList.Create;
  p_compra := TStringList.Create;
  total    := TStringList.Create;

  form19.RichEdit1.Clear;
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|',' ',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('VENDAS POR CODIGO DE: '+FormatDateTime('dd/mm/yy',StrToDate(ini))+' A '+FormatDateTime('dd/mm/yy',StrToDate(fim)),'HORA: '+FormatDateTime('tt',now)+'|',' ',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('CODIGO DESCRICAO                          QUANT.   CUSTO     VENDA       LUCRO '+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select v.nota,v.data,i.p_compra,i.cod,i.quant,i.total from venda v,item_venda i, produto p where (v.nota = i.nota) and (v.cancelado = 0) and ((i.cod >= :cini) and (i.cod <= :cfim))' +
  ' and (p.cod = i.cod) and ((v.data >= :v1) and (v.data<=:v2)) order by ' + orde);
  dm.IBselect.ParamByName('cini').AsInteger := StrToIntDef(CODINI, 0);
  dm.IBselect.ParamByName('cfim').AsInteger := StrToIntDef(CODFIM, 0);
  dm.IBselect.ParamByName('v1').AsDateTime := StrToDate(ini);
  dm.IBselect.ParamByName('v2').AsDateTime := StrToDate(fim);
  dm.IBselect.Open;
  dm.IBselect.First;
  totalGeral := 0;

  while not dm.IBselect.Eof do
    begin
      qtd.Values[dm.IBselect.fieldbyname('cod').AsString]      := CurrToStr(StrToCurrDef(     qtd.Values[dm.IBselect.fieldbyname('cod').AsString], 0) + dm.IBselect.fieldbyname('quant').AsCurrency);
      p_compra.Values[dm.IBselect.fieldbyname('cod').AsString] := CurrToStr(StrToCurrDef(p_compra.Values[dm.IBselect.fieldbyname('cod').AsString], 0) + dm.IBselect.fieldbyname('p_compra').AsCurrency);
      total.Values[dm.IBselect.fieldbyname('cod').AsString]    := CurrToStr(StrToCurrDef(   total.Values[dm.IBselect.fieldbyname('cod').AsString], 0) + dm.IBselect.fieldbyname('total').AsCurrency);

      totalGeral := totalGeral + dm.IBselect.fieldbyname('total').AsCurrency;
      dm.IBselect.Next;
    end;

  fi := qtd.Count -1;
  funcoes.iniciaDataset(dm.ibselect, 'select nome from produto where cod = :cod');

  for i := 0 to fi do
    begin
      dm.IBselect.Close;
      dm.IBselect.ParamByName('cod').AsString := qtd.Names[i];
      dm.IBselect.Open;

      addRelatorioForm19(funcoes.CompletaOuRepete('', qtd.Names[i],' ',6)+'-'+funcoes.CompletaOuRepete(copy(dm.IBselect.fieldbyname('nome').AsString,1,30),'',' ',30)+
      funcoes.CompletaOuRepete('',formataCurrency(StrToCurrDef(qtd.Values[qtd.Names[i]], 0)),' ',10) + ' ' + funcoes.CompletaOuRepete('',formataCurrency(StrToCurrDef(p_compra.Values[qtd.Names[i]], 0)),' ',10) + ' ' +
      funcoes.CompletaOuRepete('', formataCurrency(StrToCurrDef(total.Values[qtd.Names[i]], 0)),' ', 10) + ' ' + funcoes.CompletaOuRepete('', formataCurrency(StrToCurrDef(total.Values[qtd.Names[i]], 0) - StrToCurrDef(p_compra.Values[qtd.Names[i]], 0)),' ', 10) + CRLF);
    end;

  //form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(FormatDateTime('dd/mm/yy',dm.IBselect.fieldbyname('data').AsDateTime),'',' ',8)+funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('cod').AsString,' ',6)+'-'+funcoes.CompletaOuRepete(copy(dm.IBselect.fieldbyname('nome').AsString,1,30),'',' ',30)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',dm.IBselect.fieldbyname('quant').AsCurrency),' ',13)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',dm.IBselect.fieldbyname('total').AsCurrency),' ',13)+funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('nota').AsString,' ',9)+#13+#10))));
  dm.IBselect.Close;
  qtd.Free;
  total.Free;
  p_compra.Free;

  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('TOTAL GERAL =>   '+FormatCurr('#,###,###0.00',totalGeral),'',' ',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  form19.ShowModal;
end;

procedure TForm2.ProdutoscomDivergencianaFichadoProduto1Click(Sender: TObject);
begin
  funcoes.comparaProdutosComAFicha;
end;

procedure TForm2.ProdutosporAliquotas1Click(Sender: TObject);
var
  aliq, A1 : String;
  ini, fim : integer;
begin
  aliq := funcoes.dialogo('generico',50,'1234567890'+#8,50,false,'','Control For Windows','Informe o C�digo da Aliquota:','') ;
  if aliq = '*' then exit;

  if aliq = '' then aliq := funcoes.localizar('Localizar Aliquota', 'aliq', 'cod, aliq', 'cod', '', '', 'cod', false, false, false, '', 500, nil);
  if aliq = '' then
    begin
      if MessageBox(Handle, 'Deseja gerar este relat�rio de todos o produtos', pchar(Application.Title), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idno then exit;
    end;

  a1 := '';
  if aliq <> '' then a1 := 'where (cast(iif(trim(p.aliquota) = '''', ''2'', p.aliquota) as integer) = '+ aliq +')';

  form19.RichEdit1.Clear;

  addRelatorioForm19(funcoes.RelatorioCabecalho(form22.Pgerais.Values['empresa'], 'RELATORIO DE PRODUTOS POR ALIQUOTA: ' + aliq, 80 ));
  addRelatorioForm19('CODIGO DESCRICAO                                          ALIQUOTA' + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 80) + CRLF);
  funcoes.iniciaDataset(dm.ibselect, 'select p.cod, p.nome, a.aliq from produto p left join aliq a on (a.cod = cast(iif(trim(p.aliquota) = '''', ''2'', p.aliquota) as integer)) ' + a1);
  dm.IBselect.Open;
  dm.IBselect.FetchAll;

  fim := dm.IBselect.RecordCount;
  funcoes.informacao(0, fim, 'Gerando Relat�rio...', true, false, 5);
  ini := 0;

  while not dm.IBselect.Eof do
    begin
      ini := ini + 1;
      funcoes.informacao(ini, fim, 'Gerando Relat�rio...', false, false, 5);
      addRelatorioForm19(funcoes.CompletaOuRepete('', dm.IBselect.fieldbyname('cod').AsString, ' ', 6) + ' ' + funcoes.CompletaOuRepete(copy(dm.IBselect.fieldbyname('nome').AsString, 1, 40), '', ' ', 40) + ' ' + funcoes.CompletaOuRepete('', formataCurrency(dm.IBselect.fieldbyname('aliq').AsCurrency), ' ', 16) + CRLF);
      dm.IBselect.Next;
    end;
    
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 80) + CRLF);
  funcoes.informacao(0, fim, 'Gerando Relat�rio...', false, true, 5);
  dm.IBselect.Close;

  form19.ShowModal;
end;

procedure TForm2.FazerBackUp1Click(Sender: TObject);
begin
  funcoes.fazBackupDoBD(false);
end;

procedure TForm2.RecuperarumBackup1Click(Sender: TObject);
var
  op : TOpenDialog;
begin
  op := TOpenDialog.Create(self);
  if op.Execute = false then exit;

  if ExtractFileExt(op.FileName) = '.ZIP' then begin
    funcoes.Descomprimir(op.FileName, ExtractFileDir(op.FileName) + '\');
    ShowMessage('Descompress�o executada em:' + #13 + op.FileName);
  end
  else begin
  
  end;
end;

procedure TForm2.EntradasPorNota1Click(Sender: TObject);
var
  ini, fim, cons, cab : String;
  tot : currency;
begin
  ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(StartOfTheMonth(form22.datamov)));
  if ini = '*' then exit;

  fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?',formatadataddmmyy(endOfTheMonth(form22.datamov)));
  if fim = '*' then exit;

  cons := funcoes.dialogo('generico',0,'EC',0,false,'S','Control For Windows','Considerar: E-Data de Emiss�o C-Data de Chegada?','C') ;
  if cons = '*' then exit;

  if cons = 'C' then cons := 'chegada'
    else cons := 'data';

  cab := 'ENTRADAS POR NOTA => ' + IfThen(cons = 'chegada', 'CHEGADA ', 'EMISSAO ') + ' DE ' + INI + ' A ' + FIM;
  form19.RichEdit1.Clear;
  addRelatorioForm19(funcoes.RelatorioCabecalho(form22.Pgerais.Values['empresa'], cab, 78));
//  addRelatorioForm19('  ' + CRLF);
//  addRelatorioForm19('+----------------------------------------------------------------------------+' + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete('| Nota      Data    Chegada    Fornecedor                             Total', '|', ' ', 78) + CRLF);
  addRelatorioForm19(                         '+----------------------------------------------------------------------------+' + CRLF);
  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select e.nota, (select nome from fornecedor f where f.cod = e.fornec) as nome, e.fornec, e.data, e.chegada, (select sum(total) from item_entrada i where i.nota = e.nota and i.fornec = e.fornec) as total_nota from entrada e where ( ' + cons + ' >= :ini) and ('+ cons +' <= :fim)' ;
  try
    dm.IBselect.ParamByName('ini').AsDate := StrToDate(ini);
    dm.IBselect.ParamByName('fim').AsDate := StrToDate(fim);
  except
    ShowMessage('Datas Inv�lidas');
    exit;
  end;
  dm.IBselect.Open;
  dm.IBselect.FetchAll;

  tot := 0;
  while not dm.IBselect.Eof do
    begin
      addRelatorioForm19(funcoes.CompletaOuRepete('', dm.IBselect.fieldbyname('nota').AsString, '0', 7) + '  ' + funcoes.CompletaOuRepete(FormatDateTime('dd/mm/yyyy', dm.IBselect.fieldbyname('data').AsDateTime), '', ' ', 11) + funcoes.CompletaOuRepete(FormatDateTime('dd/mm/yyyy', dm.IBselect.fieldbyname('chegada').AsDateTime), '', ' ', 11) +
       CompletaOuRepete(LeftStr(dm.IBselect.fieldbyname('fornec').AsString+'-'+dm.IBselect.fieldbyname('nome').AsString, 34), '', ' ', 34)+funcoes.CompletaOuRepete('', formataCurrency(dm.IBselect.fieldbyname('total_nota').AsCurrency), ' ', 12) + CRLF);
      tot := tot + dm.IBselect.fieldbyname('total_nota').AsCurrency;
      dm.IBselect.Next;
    end;

  dm.IBselect.Close;  
  addRelatorioForm19('+----------------------------------------------------------------------------+' + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', ' ', 7) + '  ' + funcoes.CompletaOuRepete('', '', ' ', 11) + funcoes.CompletaOuRepete('', '', ' ', 11)+ funcoes.CompletaOuRepete('', 'T O T A L: ', ' ', 34) + funcoes.CompletaOuRepete('', formataCurrency(tot), ' ', 12) + CRLF);
  addRelatorioForm19('+----------------------------------------------------------------------------+' + CRLF);
  form19.ShowModal;
end;

procedure TForm2.EntradasProduto1Click(Sender: TObject);
var
  tempo, tipoPreco : String;
  preco, totVenda, totCusto : currency;
begin
  nota := funcoes.dialogo('generico',0,'1234567890,.'+#8,100,false,'','Relat�rio de Entradas','Qual o N�mero da Nota ?','');
  if (nota = '*') or (nota = '') then exit;

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select e.nota, e.fornec, f.nome, e.total_nota, e.data as emissao, e.chegada from entrada e' +
  ' left join fornecedor f on (e.fornec = f.cod) where e.nota = :nota';
  dm.IBselect.ParamByName('nota').AsInteger := StrToInt(StrNum(nota));
  dm.IBselect.Open;
  dm.IBselect.FetchAll;

  if dm.IBselect.IsEmpty then begin
    dm.IBselect.Close;
    ShowMessage('Nenhum Registro Encontrado!');
    exit;
  end;

  fornec := dm.IBselect.FieldByName('fornec').AsString;
  if dm.IBselect.RecordCount > 1 then begin
    fornec := funcoes.busca(dm.ibselect,'fornec','fornec', 'fornec', 'fornec');
  end;

  tipoPreco := funcoes.dialogo('generico',0,'SN',30,true,'S','Relat�rio de Entradas','Imprimir Pre�o de Venda ?','N');
  if (tipoPreco = '*') or (tipoPreco = '') then exit;

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select i.total,i.cod, i.p_compra, p.nome, v.chegada, v.data, p.refori, p.codbar, ' +
  'i.quant, p.p_venda from item_entrada i left join entrada v on ((v.nota = i.nota) and (i.fornec = v.fornec))' +
  ' left join produto p on (p.cod = i.cod) where i.nota = :nota and i.fornec = :fornec';
  dm.IBselect.ParamByName('nota').AsString   := nota;
  dm.IBselect.ParamByName('fornec').AsString := fornec;
  dm.IBselect.Open;

  Form19.RichEdit1.Clear;
  //addRelatorioForm19('|#15|' + CRLF);
  addRelatorioForm19('%');
  addRelatorioForm19(funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'RELATORIO DE ENTRADAS', 132));
  addRelatorioForm19('Nota        Data   Chegada  Tempo Codigo Descricao da Mercadoria                     Ref.Original Cod.de Barras    Quant.      Preco' + CRLF);
  addRelatorioForm19(CompletaOuRepete('', '', '-', 132) + crlf);

  totVenda := 0;
  totCusto := 0;

  while not dm.IBselect.Eof do begin
    tempo := '0';
    if tipoPreco = 'N' then preco := dm.IBselect.FieldByName('p_compra').AsCurrency
    else preco := dm.IBselect.FieldByName('p_venda').AsCurrency;

    addRelatorioForm19(CompletaOuRepete(nota,'', ' ', 8) + '  ' + formataDataDDMMYY(dm.IBselect.FieldByName('data').AsDateTime) + ' ' +
    formataDataDDMMYY(dm.IBselect.FieldByName('chegada').AsDateTime) + ' ' + CompletaOuRepete('', tempo, ' ', 5) +' ' + strzero(dm.IBselect.FieldByName('cod').AsString, 6) +
    ' ' + CompletaOuRepete(LeftStr(dm.IBselect.FieldByName('nome').AsString, 40), '', ' ', 40) + ' ' + CompletaOuRepete(LeftStr(dm.IBselect.FieldByName('refori').AsString, 15), '', ' ', 15) + ' ' +
    CompletaOuRepete(LeftStr(dm.IBselect.FieldByName('codbar').AsString, 13), '', ' ', 13) + ' ' + CompletaOuRepete('', FormatCurr('0.00',dm.IBselect.FieldByName('quant').AsCurrency), ' ', 10) +
    CompletaOuRepete('', FormatCurr('0.00',preco), ' ', 10) + crlf);

    totCusto := totCusto + dm.IBselect.FieldByName('total').AsCurrency;
    totVenda := totVenda + (dm.IBselect.FieldByName('quant').AsCurrency * dm.IBselect.FieldByName('p_venda').AsCurrency);

    dm.IBselect.Next;
  end;

  addRelatorioForm19(CompletaOuRepete('', '', '-', 132) + crlf);
  if tipoPreco = 'N' then begin
    addRelatorioForm19(CompletaOuRepete('TOTAL CUSTO =>', formataCurrency(totCusto), ' ', 29) + '  ' +
    CompletaOuRepete('TOTAL VENDA =>', formataCurrency(totVenda), ' ', 28)+ '  ' + CompletaOuRepete('LUCRO BRUTO =>', formataCurrency(totVenda - totCusto), ' ', 28) + crlf);
  end
  else begin
    addRelatorioForm19(CompletaOuRepete('TOTAL =>', formataCurrency(totVenda), ' ', 28) + crlf);
  end;

  addRelatorioForm19(CompletaOuRepete('', '', '-', 132) + crlf);

  form19.ShowModal;
end;

procedure TForm2.FichadeEstoque1Click(Sender: TObject);
var
  te : String;
begin
  te := '';
  funcoes.fichaDoProduto(sender, te, true);
end;

procedure TForm2.OrdemdeServio1Click(Sender: TObject);
begin
  form51 := tform51.Create(self);
  form51.ShowModal;
  form51.Free;
end;

procedure TForm2.Consulta1Click(Sender: TObject);
begin

  form55 := tform55.create(self);
  form55.condicao := 'where s.venda = 0';
  form55.showmodal;
  form55.Free;
end;

procedure TForm2.ConsultaCadastros1Click(Sender: TObject);
begin
  form67 := tform67.create(self);
  form67.ShowModal;
  form67.Free;
end;

procedure TForm2.SepararPeas1Click(Sender: TObject);
begin
  form55 := tform55.create(self);
  form55.condicao := 'where s.venda = 0';
  form55.orcamento     := false;
  form55.separaPeca    := true;
  form55.finalizaVenda := false;
  form55.showmodal;
  form55.Free;
end;

procedure TForm2.Reimpresso3Click(Sender: TObject);
var
  ordem  : TOrdem;
  BolOK  : boolean;
begin
  grupo := Incrementa_Generator('servico', 0);
  grupo := funcoes.dialogo('generico',0,'1234567890'+#8,50, true,'',Application.Title,'Qual o C�d. da Ordem de Servi�o?', grupo);
  if grupo = '*' then exit;

  BolOK := funcoes.lerServicoNoBdEcriaUmObjetoOrdem(grupo, ordem);
  if not BolOK then exit;

  funcoes.imprimeOrdemDeServico(ordem, false);
end;

procedure TForm2.Sada1Click(Sender: TObject);
begin
  form55 := tform55.create(self);
  form55.condicao := 'where s.venda = 0';
  form55.separaPeca    := true;
  form55.finalizaVenda := true;
  form55.orcamento     := false;
  form55.showmodal;
  form55.Free;
end;

procedure TForm2.Cancelamento1Click(Sender: TObject);
var
  sim : string;
begin
  if not VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false then
   begin
     WWMessage('Somente um Usu�rio Autorizado Pode Cancelar Esta Conta.',mtError,[mbok],HexToTColor('FFD700'),true,false,HexToTColor('B22222'));
     exit;
   end;

  grupo := funcoes.dialogo('generico',0,'1234567890'+#8,50, true,'',Application.Title,'Qual o C�d. da Ordem de Servi�o?', '');
  if grupo = '*' then exit;

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select cod, venda from servico where cod = :cod';
  dm.IBselect.ParamByName('cod').AsString := grupo;
  dm.IBselect.Open;

  if dm.IBselect.IsEmpty then
    begin
      dm.IBselect.Close;
      ShowMessage('Ordem de Servi�o ' + grupo + ' n�o encontrada');
      exit;
    end;

  fornec := dm.IBselect.fieldbyname('venda').AsString;
  funcoes.cancelamentoDeNota(fornec);

  sim := funcoes.dialogo('generico',0,'SN'+#8,0,false,'S','Control For Windows','Confirma Cancelamento da Entrada da Ordem de Servico ?','S') ;
  if ((sim = '*') or (sim = 'N')) then exit;

  if dm.IBQuery1.Transaction.InTransaction then dm.IBQuery1.Transaction.Commit;
  dm.IBQuery1.Transaction.StartTransaction;

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text := 'delete from servico where cod = :cod';
  dm.IBQuery1.ParamByName('cod').AsString := grupo;
  dm.IBQuery1.ExecSQL;

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text := 'delete from os_venda where nota = :cod';
  dm.IBQuery1.ParamByName('cod').AsString := grupo;
  dm.IBQuery1.ExecSQL;

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text := 'delete from os_itens where nota = :cod';
  dm.IBQuery1.ParamByName('cod').AsString := grupo;
  dm.IBQuery1.ExecSQL;

  dm.IBQuery1.Transaction.Commit;
  ShowMessage('Cancelamento Realizado com Sucesso');
end;

procedure TForm2.ConsultarEncerradas1Click(Sender: TObject);
begin
  form55 := tform55.create(self);
  form55.condicao := 'where s.venda <> 0';
  form55.Panel1.Caption := form55.Panel1.Caption + ' - F3 Ver Produtos'; 
  form55.showmodal;
  form55.Free;
end;

procedure TForm2.Oramento3Click(Sender: TObject);
begin
  form55 := tform55.create(self);
  form55.separaPeca    := true;
  form55.finalizaVenda := false;
  form55.orcamento     := true;
  form55.showmodal;
  form55.Free;
end;

procedure TForm2.RelatrioPendentes1Click(Sender: TObject);
var
  ini, fim, ordem, cond, cli : string;
  pen                        : integer;
begin
  ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?','');
  if ini = '*' then exit;

  fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?','');
  if fim = '*' then exit;

  grupo := funcoes.dialogo('generico',0,'123',0,true,'S','Control For Windows','Qual o Crit�rio de Sele��o (1-Pendentes 2-Encerradas 3-Todas)?','1') ;
  if grupo = '*' then exit;
  ordem := '';

  cli := funcoes.dialogo('generico',0,'1234567890,.'+#8,50,false,'',Application.Title,'Qual o C�d do Cliente?','');
  if cli = '*' then exit;

  if cli <> '' then
    begin
      dm.IBselect.Close;
      dm.IBselect.SQL.Text := 'select cod from cliente where cod = :cod';
      dm.IBselect.ParamByName('cod').AsString := cli;
      dm.IBselect.Open;
      if dm.IBselect.IsEmpty then
        begin
          dm.IBselect.Close;
          ShowMessage('Cliente ' + cli + ' N�o Encontrado');
          exit;
        end;
      dm.IBselect.Close;

      cli := '(s.cliente = '+ cli +') and ';
    end;

  if grupo = '1' then
    begin
      fornec := 'Pendentes';
      fabric := 's.data';
      ordem  := 'order by data';
      cond   := 'and ((s.venda is null) or (s.venda = 0))';
    end
  else if grupo = '2' then
    begin
      fornec := 'Encerradas';
      fabric := 's.saida';
      ordem  := 'order by saida';
      cond   := 'and (s.venda <> 0)';
    end
  else
    begin
      fornec := 'Todas';
      fabric := 's.data';
      ordem  := 'order by nome';
      cond   := '';
    end;

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select s.cod, ' + fabric + ' as data, s.equip, (select nome from cliente c where c.cod = s.cliente) as nome from servico s' +
  ' where '+ cli +' (' + fabric + ' >= :ini) and (' + fabric + ' <= :fim) ' + cond + ' ' + ordem;
  dm.IBselect.ParamByName('ini').AsDateTime := StrToDateTime(ini);
  dm.IBselect.ParamByName('fim').AsDateTime := StrToDateTime(fim);
  dm.IBselect.Open;
  dm.IBselect.FetchAll;

  form19.RichEdit1.Clear;

  addRelatorioForm19(funcoes.RelatorioCabecalho(form22.Pgerais.Values['empresa'], 'Relatorio de Ordem de Servicos: ' + fornec, 79) );
  addRelatorioForm19('|  Data  |Numero | Equipamento                  | Cliente                     |' + CRLF);
  addRelatorioForm19('+-----------------------------------------------------------------------------+' + CRLF);

  pen := 0;
  while not dm.IBselect.Eof do
    begin
      addRelatorioForm19('|' + formataDataDDMMYY(dm.IBselect.fieldbyname('data').AsDateTime) + '|' + funcoes.CompletaOuRepete('', dm.IBselect.fieldbyname('cod').AsString, ' ', 7) + '|' +
      funcoes.CompletaOuRepete(copy(dm.IBselect.fieldbyname('equip').AsString, 1, 30), '', ' ', 30) + '|' +  funcoes.CompletaOuRepete(copy(dm.IBselect.fieldbyname('nome').AsString,1, 29), '', ' ', 29) + '|' + CRLF);
      dm.IBselect.Next;
      pen := pen + 1;
    end;
  addRelatorioForm19('+-----------------------------------------------------------------------------+' + CRLF);
  addRelatorioForm19( funcoes.CompletaOuRepete('| ' + fornec + ' => ' + IntToStr(pen), '|', ' ', 79) + CRLF);
  addRelatorioForm19('+-----------------------------------------------------------------------------+' + CRLF);
  dm.IBselect.Close;

  form19.ShowModal;
end;

procedure TForm2.Configuraes1Click(Sender: TObject);
begin
  Configuracoes_NFCe();
end;

procedure TForm2.EstadodoServio1Click(Sender: TObject);
begin
  try
    funcoes.Mensagem(Application.Title ,'Aguarde, Verificando Estado do Servi�o...',15,'Courier New',false,0,clred, false);
    Application.ProcessMessages;
    Application.ProcessMessages;
    Verifica_Status_NFe();
  finally
    funcoes.Mensagem('', '', 25, 'Courier New',False, 0, clRed, true);
  end;
end;

procedure TForm2.CupomEletrnicoCFe1Click(Sender: TObject);
begin
  form22.enviNFCe();
{  envi := true;
  try
    if ConfParamGerais[45] = 'S' then envi := false
      else envi := true;
  except
  end;

  nota := funcoes.dialogo('not',0,'1234567890'+#8+#32,50,true,'',Application.Title,'Qual a Nota de Venda?','');
  if nota = '*' then exit;

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select nota, cliente from venda where (nota = :nota) and (cancelado = 0)';
  dm.IBselect.ParamByName('nota').AsString := nota;
  dm.IBselect.Open;

  if dm.IBselect.IsEmpty then
    begin
      dm.IBselect.Close;
      ShowMessage('Nota ' + nota + ' N�o Encontrada');
      exit;
    end;

  cliente := dm.IBselect.fieldbyname('cliente').AsString;  

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select nota, adic from nfce where (nota = :nota)';
  dm.IBselect.ParamByName('nota').AsString := nota;
  dm.IBselect.Open;

  if not dm.IBselect.IsEmpty then
    begin
      if dm.IBselect.FieldByName('adic').AsString = 'OFF' then
        begin
          msg := MessageDlg('Esta NFCe foi emitida em Contig�ncia Offline, Deseja Transmiti-la Agora por meio da Internet?',
                  mtInformation,[mbYes, mbNo, mbCancel],0);
          if msg = idyes then
            begin
              try
                funcoes.Mensagem(Application.Title ,'Aguarde, Enviando NFCe...',15,'Courier New',false,0,clred);
                Application.ProcessMessages;
                Application.ProcessMessages;
                EnviarCupomEletronico(nota, statu, true, false);
              finally
                Mensagem('', '', 25, 'Courier New',False, 0, clRed, true);
              end;
            end;
          exit;
        end;

      ShowMessage('A Nota ' +  nota + ' J� foi Transmitida');
      exit;
    end;

  cliente := funcoes.dialogo('generico',0,'1234567890,.'+#8,50,false,'',Application.Title,'Qual o C�digo do Cliente?',cliente);
  cliente := trim(cliente);

  if  cliente = '*' then exit;
  if (cliente = '') then cliente := funcoes.localizar('Localizar Cliente','cliente','cod,nome,telres,telcom,cnpj as cpfcnpj,bairro','cod','','nome','nome',false,false,false,'',450, nil);
  if (cliente = '*') or (cliente = '') then
    begin
      ShowMessage('Para emitir uma NFCe � necessario um cliente.');
      exit;
    end;

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select cod from cliente where (cod = :cod)';
  dm.IBselect.ParamByName('cod').AsString := cliente;
  dm.IBselect.Open;

  if dm.IBselect.IsEmpty then
    begin
      dm.IBselect.Close;
      ShowMessage('Cliente ' + nota + ' N�o Encontrado');
      exit;
    end;


  //if not funcoes.verificaSeExisteVenda(nota) then exit;

  try
    //envi := true;
    funcoes.Mensagem(Application.Title ,'Aguarde, Enviando NFCe...',15,'Courier New',false,0,clred);
    Application.ProcessMessages;
    while true do
      begin

        try
          if EnviarCupomEletronico1(nota, statu, xmot, tpemissao, envi, cliente) then break;
        except
        end;

        if statu = 'vali' then
          begin
            if funcoes.Contido('Duplicidade', xmot) then
              begin
                Incrementa_Generator('nfce', 1);
              end
            else break;
          end;


        if statu = 'OFF' then
          begin
            msg := MessageDlg('N�o Houve Comunica��o Com Servidor Por Falha Na Conex�o E A Nota N�o Foi Transmitida.'+chr(10)+chr(13)+
                  'Para Tentar Enviar Novamente, Selecione "SIM" Ou Selecione "N�O Para Enviar Modo OFFLINE e Transmit�-la Mais Tarde.',
                  mtInformation,[mbYes, mbNo, mbCancel],0);
            if msg = IDYES then
              begin

              end
            else if msg = IDNO then
              begin
                dm.ACBrNFe.Configuracoes.Geral.FormaEmissao := teOffLine;
                envi := false;
              end
            else if msg = IDCANCEL then
              begin
                break;
              end;
          end;

        if statu = 'OK' then
          begin
            break;
          end;
      end;
  finally
    Mensagem('', '', 25, 'Courier New',False, 0, clRed, true);
  end; }
end;

procedure TForm2.Cancelar1Click(Sender: TObject);
var
  Justificativa : String;
begin
  nota := funcoes.dialogo('not',0,'1234567890'+#8+#32,50,true,'',Application.Title,'Qual a Nota de Venda?','');
  if nota = '*' then exit;

  if not funcoes.verificaSeExisteVenda(nota) then exit;

  Justificativa := '';

  while length(trim(Justificativa)) < 15 do
    begin
      Justificativa := dialogo('normal',0,'',150,true,'',Application.Title,'Qual a Justificativa?',Justificativa);
      if Justificativa = '*' then Break;

      if Length(trim(Justificativa)) < 15 then ShowMessage('Justificativa Deve conter mais do que  14 caracteres');
    end;

  if Justificativa = '*' then exit;

  try
    funcoes.Mensagem(Application.Title ,'Aguarde, Cancelando NFCe...',15,'Courier New',false,0,clred, false);
    Application.ProcessMessages;
    Cancelamento_NFe1(nota, Justificativa);
  finally
    funcoes.Mensagem('', '', 25, 'Courier New',False, 0, clRed, true);
  end;
end;

procedure TForm2.Consultar1Click(Sender: TObject);
begin
  nota := funcoes.dialogo('not',0,'1234567890'+#8+#32,50,true,'',Application.Title,'Qual a Nota Fiscal?','');
  if nota = '*' then exit;

  //if not funcoes.verificaSeExisteVenda(nota) then exit;

  try
    funcoes.Mensagem(Application.Title ,'Aguarde, Consultando NFCe...',15,'Courier New',false,0,clred, false);
    Application.ProcessMessages;
    ConsultarNFe(nota);
  finally
    funcoes.Mensagem('', '', 25, 'Courier New',False, 0, clRed, true);
  end;
end;

procedure TForm2.ConsultarCNPJ1Click(Sender: TObject);
begin
  consultaCNPJ := TconsultaCNPJ.Create(self);
  consultaCNPJ.ShowModal;
  consultaCNPJ.Free;
  //F_Principal := TF_Principal.Create(self);
  //F_Principal.ShowModal;
  //F_Principal.Free;
end;

procedure TForm2.ConsultarCPF1Click(Sender: TObject);
begin
  ConsultaCPF1 := TConsultaCPF1.create(self);
  ConsultaCPF1.showmodal;
  ConsultaCPF1.free;
end;

procedure TForm2.Reimpresso4Click(Sender: TObject);
var
  serie1 : String;
begin
  nota := funcoes.dialogo('not',0,'1234567890'+#8+#32,50,true,'',Application.Title,'Qual a N�mero da Nota Fiscal ?','');
  if nota = '*' then exit;

  serie1 := funcoes.dialogo('not',0,'1234567890'+#8+#32,50,true,'',Application.Title,'Qual a S�rie ?', IntToStr(serie2));
  if serie1 = '*' then exit;

  //if not funcoes.verificaSeExisteVenda(nota) then exit;

  try
    funcoes.Mensagem(Application.Title ,'Aguarde, Imprimindo NFCe...',15,'Courier New',false,0,clred, false);
    Application.ProcessMessages;
    Imprimir_DANFE_PDF(nota, nota, tipoIMPRESSAO <> 1, serie1);
    Button1Click(sender);
  finally
    funcoes.Mensagem('', '', 25, 'Courier New',False, 0, clRed, true);
  end;
end;

procedure TForm2.CadastrodeECF1Click(Sender: TObject);
begin
  cadECF1 := TcadECF1.Create(self);
  cadECF1.ShowModal;
  cadECF1.Free;
end;

procedure TForm2.CadastrodeLeituraZECF1Click(Sender: TObject);
begin
  cadReducao := tcadReducao.Create(self);
  cadReducao.ShowModal;
  cadReducao.Free;
end;

procedure TForm2.ConhecimentosdeFrete1Click(Sender: TObject);
begin
  frmconhecimentofrete := TfrmConhecimentoFrete.Create(self);
  frmconhecimentofrete.ShowModal;
  jsedit.LiberaMemoria(frmconhecimentofrete);
  frmconhecimentofrete.Free;
end;

procedure TForm2.GerarRemSpedPISCOFINS1Click(Sender: TObject);
begin
  REM_CONTRIBUICOES();
end;

procedure TForm2.EntradadeXML1Click(Sender: TObject);
begin
  funcoes.importaXMLnaEntrada1;
end;

procedure TForm2.NotaFiscaldeVenda1Click(Sender: TObject);
begin
  acerto := Tacerto.Create(self);
  acerto.ShowModal;
  acerto.Free;
end;

procedure TForm2.ema1Click(Sender: TObject);
begin
  form56.ShowModal;
end;

procedure TForm2.CriarCdigosdeBarras1Click(Sender: TObject);
var
  tot : integer;
begin
  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select cod, nome from produto where codbar = ''''';
  dm.IBselect.Open;
  dm.IBselect.FetchAll;
  if dm.IBQuery1.Transaction.InTransaction then dm.IBQuery1.Transaction.Commit;
  dm.IBQuery1.Transaction.StartTransaction;
  tot := 0;

  while not dm.IBselect.Eof do
    begin
      tot := tot + 1;
      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Text := 'update produto set codbar = :codbar where cod = :cod';
      dm.IBQuery1.ParamByName('codbar').AsString := DIGEAN('789000' + funcoes.CompletaOuRepete('', dm.IBselect.fieldbyname('cod').AsString,'0',6));
      dm.IBQuery1.ParamByName('cod').AsString    := dm.IBselect.fieldbyname('cod').AsString; 
      dm.IBQuery1.ExecSQL;
      dm.IBselect.Next;
    end;

  dm.IBselect.Close;
  if dm.IBQuery1.Transaction.InTransaction then dm.IBQuery1.Transaction.Commit;
  ShowMessage('Total de C�digos Criados: ' + IntToStr(tot));
end;

procedure TForm2.CriarSrie1Click(Sender: TObject);
begin
  funcoes.criaSerieBD;
end;

procedure TForm2.NFePorCliente1Click(Sender: TObject);
var
  dini, dfim, pstaNfe,tmp, sit, cancel : string;
  dini1, dfim1 : TDate;
  arq, lista : TStringList;
  i1, f1, qtdnotas : integer;
  totVNF, totSai, totEnt, totCANC : currency;
begin
  pstaNfe := caminhoEXE_com_barra_no_final + 'NFE\EMIT\';
  if not DirectoryExists(pstaNfe) then
    begin
      MessageDlg('Este Terminal n�o tem informa��es das Notas Emitidas', mtError, [mbOK], 1);
      exit;
    end;

  {grupo := funcoes.dialogo('generico',0,'1234567890'+#8,50,false,'',Application.Title,'Qual o Cliente','');
  if grupo = '*' then exit;}

  dini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?','');
  if dini = '*' then exit;

  dfim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?','');
  if dfim = '*' then exit;

  pstaNfe := funcoes.dialogo('normal',0,'',2,true,'',Application.Title,'Qual a Pasta de NFe?', pstaNfe);
  if pstaNfe = '*' then exit;

  cancel := funcoes.dialogo('generico',50,'SC',50,true,'S',Application.Title,'Imprimir Todas (S-Todas, C-Somente Canceladas)?', 'S');
  if cancel = '*' then exit;

  dini1 := StrToDateTime(dini);
  dfim1 := StrToDateTime(dfim);

  form19.RichEdit1.Clear;
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 78) + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.centraliza(form22.Pgerais.Values['empresa'], ' ', 78), '', ' ', 78) + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.centraliza('RELATORIO DE NFE EMITIDAS POR CLIENTE DE ' + dini + ' A ' + dfim, ' ', 78), '', ' ', 78) + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 78) + CRLF);
  //addRelatorioForm19('  NOTA   DATA   CLIENTE                                       CHAVE                      SITUACAO' + CRLF);
  addRelatorioForm19('  NOTA   DATA   CLIENTE                                 SITUACAO         TOTAL' + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 78) + CRLF);

  arq     := TStringList.Create;
  totSai  := 0;
  totEnt  := 0;
  totCANC := 0;

  dm.IBselect.close;
  dm.IBselect.SQL.Text := 'select * from nfe where data >= :ini and data <= :fim ORDER BY NOTA';
  dm.IBselect.ParamByName('ini').AsDate := dini1;
  dm.IBselect.ParamByName('fim').AsDate := dfim1;
  dm.IBselect.Open;

  while not dm.IBselect.Eof do begin
    IF FileExists(pstaNfe + dm.IBselect.FieldByName('chave').AsString + '-nfe.xml') then begin
      arq.LoadFromFile(pstaNfe + dm.IBselect.FieldByName('chave').AsString + '-nfe.xml');
      sit := Le_Nodo('cStat', arq.GetText);
          if ((sit = '100') or (sit = '150')) then
            begin
              sit := 'AUTORIZADA';
              totVNF := totVNF + valXML(Le_Nodo('vNF', arq.GetText));
              if Le_Nodo('tpNF', arq.GetText) = '1' then totSai := totSai + StrToCurrDef(StringReplace(Le_Nodo('vNF', arq.GetText), '.', ',', [rfReplaceAll, rfIgnoreCase]), 0)
              else totEnt := totEnt + StrToCurrDef(StringReplace(Le_Nodo('vNF', arq.GetText), '.', ',', [rfReplaceAll, rfIgnoreCase]), 0);
            end
          else if sit = '101' then sit := 'CANCELADA'
          else if sit = '135' then begin
            sit := 'CANCELADA';
            totCANC := totCANC + valXML(Le_Nodo('vNF', arq.GetText));
          end
          else sit := 'NAO AUTOR.';

          if dm.IBselect.FieldByName('estado').AsString = 'C' then sit := 'CANCELADA';

          tmp := LeftStr(Le_Nodo('dhEmi', arq.GetText), 10);
          tmp := funcoes.dataInglesToBrasil(tmp);

          if cancel = 'S' then begin
            addRelatorioForm19(funcoes.CompletaOuRepete('', Le_Nodo('nNF', arq.GetText), '0', 6) + ' ' + FormatDateTime('dd/mm/yy', StrToDateDef(TMP, now)) + ' ' +funcoes.CompletaOuRepete(LeftStr(Le_Nodo('xNome',Le_Nodo('dest', arq.GetText)), 36), '', ' ', 36) + '   ' + CompletaOuRepete(SIT,'', ' ', 10) + ' ' + CompletaOuRepete('', FormatCurr('0.00',valXML(Le_Nodo('vNF', arq.GetText))), ' ', 12) + CRLF);
            qtdnotas := qtdnotas + 1;
          end
          else begin
            if sit = 'CANCELADA' then begin
              addRelatorioForm19(funcoes.CompletaOuRepete('', Le_Nodo('nNF', arq.GetText), '0', 6) + ' ' + FormatDateTime('dd/mm/yy', StrToDateDef(TMP, now)) + ' ' +funcoes.CompletaOuRepete(LeftStr(Le_Nodo('xNome',Le_Nodo('dest', arq.GetText)), 36), '', ' ', 36) + '   ' + CompletaOuRepete(SIT,'', ' ', 10) + ' ' + CompletaOuRepete('', FormatCurr('0.00',valXML(Le_Nodo('vNF', arq.GetText))), ' ', 12) + CRLF);
              totCANC := totCANC + valXML(Le_Nodo('vNF', arq.GetText));
              qtdnotas := qtdnotas + 1;
            end;
          end;
    end
    else begin
      if not dm.IBselect.FieldByName('xml').IsNull then begin
        arq.Text := dm.IBselect.FieldByName('xml').AsString;
        sit := Le_Nodo('cStat', arq.GetText);
        if ((sit = '100') or (sit = '150')) then begin
          sit := 'AUTORIZADA';

          if Le_Nodo('tpNF', arq.GetText) = '1' then totSai := totSai + StrToCurrDef(StringReplace(Le_Nodo('vNF', arq.GetText), '.', ',', [rfReplaceAll, rfIgnoreCase]), 0)
          else totEnt := totEnt + StrToCurrDef(StringReplace(Le_Nodo('vNF', arq.GetText), '.', ',', [rfReplaceAll, rfIgnoreCase]), 0);

          totVNF := totVNF + valXML(Le_Nodo('vNF', arq.GetText));
        end
        else if sit = '101' then begin
          sit := 'CANCELADA';
          totCANC := totCANC + valXML(Le_Nodo('vNF', arq.GetText));
        end
        else if sit = '135' then begin
          sit := 'CANCELADA';
          totCANC := totCANC + valXML(Le_Nodo('vNF', arq.GetText));
        end
        else sit := 'NAO AUTOR.';

        tmp := LeftStr(Le_Nodo('dhEmi', arq.GetText), 10);
        tmp := funcoes.dataInglesToBrasil(tmp);

        if cancel = 'S' then begin
          addRelatorioForm19(funcoes.CompletaOuRepete('', Le_Nodo('nNF', arq.GetText), '0', 6) + ' ' + FormatDateTime('dd/mm/yy', StrToDateDef(TMP, now)) + ' ' +funcoes.CompletaOuRepete(LeftStr(Le_Nodo('xNome',Le_Nodo('dest', arq.GetText)), 36), '', ' ', 36) + '   ' + CompletaOuRepete(SIT,'', ' ', 10) + ' ' + CompletaOuRepete('', FormatCurr('0.00',valXML(Le_Nodo('vNF', arq.GetText))), ' ', 12) + CRLF);
          qtdnotas := qtdnotas + 1;
        end
        else begin
          if sit = 'CANCELADA' then begin
            addRelatorioForm19(funcoes.CompletaOuRepete('', Le_Nodo('nNF', arq.GetText), '0', 6) + ' ' + FormatDateTime('dd/mm/yy', StrToDateDef(TMP, now)) + ' ' +funcoes.CompletaOuRepete(LeftStr(Le_Nodo('xNome',Le_Nodo('dest', arq.GetText)), 36), '', ' ', 36) + '   ' + CompletaOuRepete(SIT,'', ' ', 10) + ' ' + CompletaOuRepete('', FormatCurr('0.00',valXML(Le_Nodo('vNF', arq.GetText))), ' ', 12) + CRLF);
            totCANC := totCANC + valXML(Le_Nodo('vNF', arq.GetText));
            qtdnotas := qtdnotas + 1;
          end;
        end;
      end
      else begin
        addRelatorioForm19(funcoes.CompletaOuRepete('', '0', '0', 6) + ' ' + FormatDateTime('dd/mm/yy', dm.IBselect.FieldByName('data').AsDateTime) + ' ' +
        funcoes.CompletaOuRepete('XML NAO ENCONTRADO', '', ' ', 36) + '   ' + CompletaOuRepete('','', ' ', 10) + ' ' + CompletaOuRepete('', FormatCurr('0.00',0), ' ', 12) + CRLF);
      end;
    end;

    dm.IBselect.Next;
  end;

  {lista := funcoes.listaArquivos(pstaNfe + '*-nfe.xml');
  f1 := lista.Count -1;
  totVNF := 0;
  qtdnotas := 0;

  for i1 := 0 to f1 do
    begin
      arq.Clear;
      IF FileExists(pstaNfe + lista[i1]) then
        begin

      arq.LoadFromFile(pstaNfe + lista[i1]);
      tmp := Le_Nodo('dEmi', arq.GetText);

      try
      if tmp = '' then tmp := LeftStr(Le_Nodo('dhEmi', arq.GetText), 10);
      tmp := funcoes.dataInglesToBrasil(tmp);
      //muda o formato data yyyy-mm-dd para dd/mm/yyyy

      if ((StrToDateTime(tmp) >= dini1) and (StrToDateTime(tmp) <= dfim1)) then
        begin
          sit := Le_Nodo('cStat', arq.GetText);
          if ((sit = '100') or (sit = '150')) then
            begin
              sit := 'AUTORIZADA';
              totVNF := totVNF + valXML(Le_Nodo('vNF', arq.GetText));
            end
          else if sit = '101' then sit := 'CANCELADA'
          else if sit = '135' then sit := 'CANCELADA'
          else sit := 'NAO AUTOR.';

          if cancel = 'S' then begin
            addRelatorioForm19(funcoes.CompletaOuRepete('', Le_Nodo('nNF', arq.GetText), '0', 6) + ' ' + FormatDateTime('dd/mm/yy', StrToDateDef(TMP, now)) + ' ' +funcoes.CompletaOuRepete(LeftStr(Le_Nodo('xNome',Le_Nodo('dest', arq.GetText)), 36), '', ' ', 36) + '   ' + CompletaOuRepete(SIT,'', ' ', 10) + ' ' + CompletaOuRepete('', FormatCurr('0.00',valXML(Le_Nodo('vNF', arq.GetText))), ' ', 12) + CRLF);
            qtdnotas := qtdnotas + 1;
          end
          else begin
            if sit = 'CANCELADA' then begin
              addRelatorioForm19(funcoes.CompletaOuRepete('', Le_Nodo('nNF', arq.GetText), '0', 6) + ' ' + FormatDateTime('dd/mm/yy', StrToDateDef(TMP, now)) + ' ' +funcoes.CompletaOuRepete(LeftStr(Le_Nodo('xNome',Le_Nodo('dest', arq.GetText)), 36), '', ' ', 36) + '   ' + CompletaOuRepete(SIT,'', ' ', 10) + ' ' + CompletaOuRepete('', FormatCurr('0.00',valXML(Le_Nodo('vNF', arq.GetText))), ' ', 12) + CRLF);
              qtdnotas := qtdnotas + 1;
            end;
          end;
        end;
      except
      end;
      end;
    end; }

  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 78) + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete('ENTRADAS   ==>', FormatCurr('#,###,###0.00', totEnt) , '.', 78) + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete('SAIDAS     ==>', FormatCurr('#,###,###0.00', totSai) , '.', 78) + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete('T O T A L  ==>',FormatCurr('#,###,###0.00', totVNF)  , '.', 78) + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete('CANCELADAS ==>', FormatCurr('#,###,###0.00', totCANC), '.', 78) + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete('QUANTIDADES DE NOTAS => ' + IntToStr(qtdnotas), '', ' ', 78) + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 78) + CRLF);

  lista.Free;
  arq.Free;
  form19.ShowModal;
end;

procedure TForm2.NFePorCliente2Click(Sender: TObject);
var
  dini, dfim, pstaNfe,tmp, sit, cnpj, cnpjXML : string;
  dini1, dfim1 : TDate;
  arq, lista : TStringList;
  i1, f1 : integer;
  totitem, totgeral : currency;
begin
  pstaNfe := caminhoEXE_com_barra_no_final + 'NFE\EMIT\';
  if not DirectoryExists(pstaNfe) then
    begin
      MessageDlg('Este Terminal n�o tem informa��es das Notas Emitidas', mtError, [mbOK], 1);
      exit;
    end;

  grupo := funcoes.dialogo('generico',0,'1234567890'+#8,50,false,'',Application.Title,'Qual o Cliente','');
  if grupo = '*' then exit;

  if grupo = '' then
    begin
      grupo := funcoes.localizar('Localizar Cliente','cliente','cod,nome,telres,telcom,cnpj as cpfcnpj,bairro','cod','','nome','nome',false,false,false,'',450, nil);
    end;

  if grupo = '' then exit;

  dm.IBselect.Close;
  dm.IBselect.SQL.Text :=  'select cnpj, cod from cliente where cod = :cod';
  dm.IBselect.ParamByName('cod').AsString := StrNum(grupo);
  dm.IBselect.Open;


  if dm.IBselect.IsEmpty then
    begin
      dm.IBselect.Close;
      MessageDlg('Cliente ' + grupo + ' N�o Encontrado', mtError, [mbok], 1);
      exit;
    end;

  cnpj := StrNum(dm.IBselect.fieldbyname('cnpj').AsString);

  dini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?','');
  if dini = '*' then exit;

  dfim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?','');
  if dfim = '*' then exit;

  pstaNfe := funcoes.dialogo('normal',0,'',2,true,'',Application.Title,'Qual a Pasta de NFe?', pstaNfe);
  if pstaNfe = '*' then exit;

  dini1 := StrToDateTime(dini);
  dfim1 := StrToDateTime(dfim);

  form19.RichEdit1.Clear;
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 78) + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.centraliza(form22.Pgerais.Values['empresa'], ' ', 78), '', ' ', 78) + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.centraliza('RELATORIO DE NFE EMITIDAS POR CLIENTE DE ' + dini + ' A ' + dfim, ' ', 78), '', ' ', 78) + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 78) + CRLF);
  //addRelatorioForm19('  NOTA   DATA   CLIENTE                                       CHAVE                      SITUACAO' + CRLF);
  addRelatorioForm19('  NOTA   DATA     CLIENTE                                         SITUACAO' + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 78) + CRLF);

  arq := TStringList.Create;
  lista := funcoes.listaArquivos(pstaNfe + '*-nfe.xml');
  f1 := lista.Count -1;

  funcoes.informacao(1,2,'Aguarde, Gerando Relat�rio... ',true,false,2);
  totgeral := 0;

  for i1 := 0 to f1 do
    begin
      funcoes.informacao(i1,f1,'Aguarde, Gerando Relat�rio... ',false,false, 2);

      totitem := 0;
      arq.Clear;
      arq.LoadFromFile(pstaNfe + lista[i1]);
      tmp := Le_Nodo('dEmi', arq.GetText);

      if (tmp) = '' then tmp := LeftStr(Le_Nodo('dhEmi', arq.GetText), 10);
      tmp := funcoes.dataInglesToBrasil(tmp);
      //muda o formato data yyyy-mm-dd para dd/mm/yyyy

      if (StrNum(tmp) <> '0') then
        begin
          if ((StrToDateTime(tmp) >= dini1) and (StrToDateTime(tmp) <= dfim1)) then
            begin
              fornec := Le_Nodo('dest', arq.GetText);
              cnpjXML := IfThen(Le_Nodo('CNPJ', fornec) <> '', Le_Nodo('CNPJ', fornec), Le_Nodo('CPF', fornec));

              if cnpjXML = cnpj then
                begin
                  sit := Le_Nodo('cStat', arq.GetText);
                  if sit = '100' then sit := 'AUTORIZADA'
                  else if sit = '101' then sit := 'CANCELADA'
                  else if sit = '135' then sit := 'CANCELADA'
                  else sit := 'NAO AUTORIZADA';

                  totitem := StrToCurrDef(StringReplace(Le_Nodo('vNF', arq.GetText), '.', ',', [rfReplaceAll, rfIgnoreCase]), 0);
                  totgeral := totgeral + totitem;
                  addRelatorioForm19(funcoes.CompletaOuRepete('', Le_Nodo('nNF', arq.GetText), '0', 6) + ' ' + TMP + ' ' +funcoes.CompletaOuRepete(LeftStr(Le_Nodo('xNome',Le_Nodo('dest', arq.GetText)), 27), '', ' ', 27) + '  ' + funcoes.CompletaOuRepete(SIT, '', ' ', 17) + funcoes.CompletaOuRepete('', FormatCurr('0.00', totitem), ' ', 14)  +  CRLF);
                end;
            end;
        end;
    end;

  funcoes.informacao(i1,f1,'Aguarde, Gerando Relat�rio... ',false,true, 2);
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 78) + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL:', FormatCurr('#,###,###0.00', totgeral), '.', 78) + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 78) + CRLF);

  lista.Free;
  arq.Free;
  form19.ShowModal;
end;

procedure TForm2.mostraEnviaCupom();
begin
  // := tform58.Create(Application);
  //Panel1.Top  := form2.Height - Panel1.Height - stb.Height;
  //Panel1.Left := form2.Width  - Panel1.Width;
  //form58.Show;
end;


procedure TForm2.Timer2Timer(Sender: TObject);
var
  sim : string;
begin
  if funcoes.enviandoCupom then exit;
  sim := 'N';
  try
    sim := ConfParamGerais[45];
  except
  end;

  if sim = 'N' then
    begin
      Timer2.Enabled := false;
      exit;
    end;

  tread1 := TTWtheadEnviaCupons.Create(true);
  tread1.FreeOnTerminate := true;
  tread1.Resume;
end;

procedure TForm2.PorProd1Click(Sender: TObject);
var
  ini,fim,h1,produto,ee:string;
  totalGeral : currency;
  i : integer;
begin
  produto := funcoes.dialogo('generico',100,'1234567890'+#8,100,false,'',Application.Title,'Qual o C�digo do Produto ?','');
  if produto = '*' then exit;

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select cod, nome from produto where cod='+StrNum(produto));
  dm.IBselect.Open;

  if dm.IBselect.IsEmpty then
    begin
      ShowMessage('Produto N�o Encontrado!');
      dm.IBselect.Close;
      exit;
    end;

  ini := funcoes.dialogo('data',0,'',50,true,'',Application.Title,'Qual a Data Inicial?','');
  if ini = '*' then exit;

  fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?','');
  if fim = '*' then exit;

  if produto <> '' then h1 := ' (i.cod='+StrNum(produto)+') and';

  form19.RichEdit1.Clear;
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',78)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|',' ',78)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('VENDAS DE PRODUTO POR CLIENTE DE: ' +FormatDateTime('dd/mm/yy',StrToDate(ini))+' A '+FormatDateTime('dd/mm/yy',StrToDate(fim)),'HORA: '+FormatDateTime('tt',now)+'|',' ',78)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(LeftStr(produto+ '-' + dm.IBselect.FieldByName('nome').AsString, 46) ,'',' ',78)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',78)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('  DATA     QUANT CLIENTE                                                 TOTAL'+#13+#10))));
  //form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',78)+#13+#10))));

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select c.nome,i.cod, i.quant, i.total, i.data, v.cliente from item_venda i inner join venda v on (v.nota = i.nota) '+
  'left join cliente c on (c.cod = v.cliente) where ' +  h1 + ' i.data >= :ini and i.data <= :fim and v.cancelado = 0 order by v.cliente');
  dm.IBselect.ParamByName('ini').AsDateTime := StrToDate(ini);
  dm.IBselect.ParamByName('fim').AsDateTime := StrToDate(fim);
  dm.IBselect.Open;
  totalGeral := 0;
  b := 60;

  ee := 'XX';

  while not dm.IBselect.Eof do
    begin
      if ee <> dm.IBselect.FieldByName('cliente').AsString then begin
        ee := dm.IBselect.FieldByName('cliente').AsString;
        addRelatorioForm19(CompletaOuRepete('', '', '-', 78) + CRLF);
      end;

      addRelatorioForm19(FormatDateTime('dd/mm/yy', dm.IBselect.FieldByName('data').AsDateTime) + CompletaOuRepete('', FormatCurr('0.0', dm.IBselect.FieldByName('quant').AsCurrency), ' ', 8) + ' ' +
      strzero(dm.IBselect.FieldByName('cliente').AsString, 6) + '-' + CompletaOuRepete(LeftStr(dm.IBselect.FieldByName('nome').AsString, 40), '', ' ', 40) + CompletaOuRepete('', FormatCurr('#,###,###0.00', dm.IBselect.FieldByName('total').AsCurrency), ' ', 14) + CRLF);



      {if form19.RichEdit1.Lines.Count >= b then
        begin
          b := b + 60;
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|',' ',80)+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('VENDAS POR CLIENTE/NOTA DE: '+FormatDateTime('dd/mm/yy',StrToDate(ini))+' A '+FormatDateTime('dd/mm/yy',StrToDate(fim)),'HORA: '+FormatDateTime('tt',now)+'|',' ',80)+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('    NOTA  DATA    VENCIMENTO            VALOR'+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('CLIENTE: '+cliente+'-'+funcoes.BuscaNomeBD(dm.ibquery1,'nome','cliente','where cod='+cliente),'',' ',80)+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#13+#10))));
        end;}



      totalGeral := totalGeral + dm.IBselect.fieldbyname('total').AsCurrency;
      dm.IBselect.Next;
    end;

  dm.IBselect.Close;
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',78)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('TOTAL GERAL =>   '+FormatCurr('#,###,###0.00',totalGeral),'',' ',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',78)+#13+#10))));
  form19.ShowModal;
end;

procedure TForm2.PorProdutomaisVendido1Click(Sender: TObject);
var
  ini,fim,ee, h1, CODINI, CODFIM, orde, COD, prodzero:string;
  totalGeral : currency;
  i, fi : integer;
begin
  ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(StartOfTheMonth(form22.datamov)));
  if ini = '*' then exit;

  fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?',formatadataddmmyy(endOfTheMonth(form22.datamov)));
  if fim = '*' then exit;

  prodzero := funcoes.dialogo('generico',30,'SN',20,true,'S',Application.Title,'Imprimir Produtos (S-Vendidos N-N�o Vendidos A-Ambos) ?', 'A');
  if prodzero = '*' then exit;

  grupo := funcoes.dialogo('generico',30,'1234567890' + #8,20,false,'',Application.Title,'Qual o C�digo do Grupo ?', '');
  if prodzero = '*' then exit;

  h1 := '';
  if grupo <> '' then h1 := 'p.grupo = ' + StrNum(grupo) + ' and '; 

  form19.RichEdit1.Clear;
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|',' ',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('PRODUTO MAIS VENDIDO DE: '+FormatDateTime('dd/mm/yy',StrToDate(ini))+' A '+FormatDateTime('dd/mm/yy',StrToDate(fim)),'HORA: '+FormatDateTime('tt',now)+'|',' ',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('CODIGO   DESCRICAO                                             QUANT.'+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  dm.IBselect.Close;
  dm.IBselect.SQL.Text := ('select p.cod, p.nome, sum(i.quant) as quant from item_venda i inner join' +
  ' produto p on (p.cod = i.cod) where '+ h1 +' ((i.data >= :v1) and (i.data<=:v2)) group by p.cod, p.nome order by quant desc');
  dm.IBselect.ParamByName('v1').AsDateTime := StrToDate(ini);
  dm.IBselect.ParamByName('v2').AsDateTime := StrToDate(fim);
  dm.IBselect.Open;
  dm.IBselect.First;
  dm.IBselect.FetchAll;
  totalGeral := 0;

  COD := '-';

  funcoes.informacao(0, fi, 'Aguade, Gerando Relat�rio...', true, false, 2);
  fi := dm.IBselect.RecordCount;
  i  := 0;
  while not dm.IBselect.Eof do
    begin
      funcoes.informacao(i, fi, 'Aguade, Gerando Relat�rio...', false, false, 2);
      i := i + 1;
      Application.ProcessMessages;
      COD := COD + dm.IBselect.fieldbyname('cod').AsString + '-';
      if funcoes.Contido(prodzero, 'AS') then
        begin
          addRelatorioForm19(funcoes.CompletaOuRepete('', dm.IBselect.fieldbyname('cod').AsString,'0',6)+' - '+funcoes.CompletaOuRepete(copy(dm.IBselect.fieldbyname('nome').AsString,1,40),'',' ',40)+
          funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.000',dm.IBselect.fieldbyname('quant').AsCurrency),' ',20)  + CRLF);

          totalGeral := totalGeral + dm.IBselect.fieldbyname('quant').AsCurrency;
        end;
      dm.IBselect.Next;
    end;


  if funcoes.Contido(prodzero, 'AN') then
    begin
      dm.IBselect.Close;
      dm.IBselect.SQL.Text := 'select cod, nome from produto order by nome';
      dm.IBselect.Open;
      dm.IBselect.FetchAll;

      funcoes.informacao(i, fi, 'Aguade, Gerando Relat�rio...', false, true, 2);
      funcoes.informacao(0, fi, 'Aguade, Gerando Relat�rio...', true, false, 2);
      fi := dm.IBselect.RecordCount;
      i  := 0;

      while not dm.IBselect.Eof do
        begin
          i := i + 1;
          funcoes.informacao(i, fi, 'Aguade, Gerando Relat�rio...', false, false, 2);
          Application.ProcessMessages;
          if not funcoes.Contido('-' + dm.IBselect.fieldbyname('cod').AsString + '-', cod) then
            begin
              addRelatorioForm19(funcoes.CompletaOuRepete('', dm.IBselect.fieldbyname('cod').AsString,'0',6)+' - '+funcoes.CompletaOuRepete(copy(dm.IBselect.fieldbyname('nome').AsString,1,40),'',' ',40)+
              funcoes.CompletaOuRepete('','0,000',' ',20)  + CRLF);
            end;
          dm.IBselect.Next;
        end;
    end;

  funcoes.informacao(i, fi, 'Aguade, Gerando Relat�rio...', false, true, 2);  
  dm.IBselect.Close;
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('TOTAL GERAL QTD =>   '+FormatCurr('#,###,###0.000',totalGeral),'',' ',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  form19.ShowModal;
end;

procedure TForm2.NotasPendentes1Click(Sender: TObject);
var
  cont : integer;
begin
  dm.IBselect.Close;
  dm.IBselect.sql.Text := 'select chave from nfce where tentativa > 9';
  dm.IBselect.Open;
  dm.IBselect.FetchAll;
  cont := dm.IBselect.RecordCount;

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text := 'update nfce set tentativa = 0 where tentativa > 9';
  dm.IBQuery1.ExecSQL;
  dm.IBQuery1.Transaction.Commit;

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select chave from nfce where (adic = ''OFF'') and (substring(chave from 23 for 3) = :serie) ';
  dm.IBselect.ParamByName('serie').AsString := strzero(getSerieNFCe, 3);
  dm.IBselect.Open;
  dm.IBselect.FetchAll;

  ShowMessage('Total de Cupons N�o Enviados: ' + IntToStr(dm.IBselect.RecordCount) + #13 +
              'Registros Marcados  P/ Envio: ' + IntToStr(cont));
  dm.IBselect.Close;
end;

procedure TForm2.ExportarEmitidas2Click(Sender: TObject);
begin
  funcoes.exportaNFCeEmitidas;
end;

procedure TForm2.ReutilizarNumerao1Click(Sender: TObject);
var
  nota, nnf : String;
begin
  //form22.enviNFCe('', 'S');
  nota := funcoes.dialogo('not',0,'1234567890'+#8+#32,50,true,'',Application.Title,'Qual a Nota de Venda?','');
  if nota = '*' then exit;

  dm.IBQuery4.Close;
  dm.IBQuery4.SQL.Text := 'select chave, adic from nfce where (nota = :nota)';
  dm.IBQuery4.ParamByName('nota').AsString := nota;
  dm.IBQuery4.Open;

 { if dm.IBQuery4.FieldByName('adic').AsString = '' then
    begin
      dm.IBQuery4.Close;
      ShowMessage('Esta Nota J� foi Emitida');
      exit;
    end;}

  nnf := copy(dm.IBQuery4.fieldbyname('chave').AsString, 26, 9);

  nnf := funcoes.dialogo('not',0,'1234567890'+#8+#32,50,true,'',Application.Title,'Qual o NNF?',nnf);
  if nnf = '*' then exit;

  nnf := IntToStr(StrToIntDef(nnf, 0));
  if nnf = '0' then nnf := '';

  criaXMLs(nota, nnf, dm.IBQuery4.FieldByName('chave').AsString);
  ShowMessage('XML criado com sucesso');
end;

procedure TForm2.PorVendedorPagamento1Click(Sender: TObject);
var
  ini, fim, h1, vend,vendAnt, sim, no :string;
  totalGeral, desc, totVend : currency;
  i, l, tam, tmp, fim1, INDDESC : integer;
  listpag : TItensProduto;
  val : array[1..3] of currency;
begin
  vend := '';
  H1 := '';
  vend := funcoes.dialogo('generico',30,'1234567890'+#8,30, FALSE,'',Application.Title,'Qual o C�digo do Vendedor?','');
  if (vend = '*') then exit;

  if vend <> '' then
    begin
      dm.IBselect.Close;
      dm.IBselect.SQL.Clear;
      dm.IBselect.SQL.Add('select cod from vendedor where cod = :cod');
      dm.IBselect.ParamByName('cod').AsString := vend;
      dm.IBselect.Open;

      if dm.IBselect.IsEmpty then
        begin
          ShowMessage('Cliente N�o Encontrado!');
          dm.IBselect.Close;
          exit;
        end;
      dm.IBselect.Close;
    end;

  ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?','');
  if ini = '*' then exit;
  fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?','');
  if fim = '*' then exit;

  sim := funcoes.dialogo('generico',0,'SN',20,false,'S',Application.Title,'Imprimir Pre�o das Mercadorias?','N');
  if sim = '*' then exit;

  if vend <> '' then h1 := ' and (v.vendedor =' + vend + ')';
  i := 55;

  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select v.nota, v.vendedor, v.desconto, v.total, v.codhis from venda v' +
  ' where (v.cancelado = 0) and ((v.data >= :dini) and (v.data <= :dfim)) '+h1+' order by v.vendedor, v.codhis');
  dm.IBselect.ParamByName('dini').AsDateTime := StrToDateTimeDef(ini, form22.datamov);
  dm.IBselect.ParamByName('dfim').AsDateTime := StrToDateTimeDef(fim, form22.datamov);
  dm.IBselect.Open;
  dm.IBselect.FetchAll;

  if dm.IBselect.IsEmpty then
    begin
      dm.IBselect.Close;
      ShowMessage('Nenhum Resultado na Pesquisa');
      exit;
    end;

  listpag := TItensProduto.Create;
  //if vend = '' then vend := dm.IBselect.fieldbyname('vendedor').AsString;
  no   := 'xxx';
  vend := 'xxx';
  desc := 0;
  totalGeral := 0;
  totVend := 0;

  if form22.Pgerais.Values['nota'] = 'T' then tam := 39
  else tam := 80;

  form19.RichEdit1.Clear;

  funcoes.informacao(0, 0, 'Aguarde, Gerando Relat�rio...', true, false, 5);
  fim1 := dm.IBselect.RecordCount;
  vendAnt := dm.IBselect.fieldbyname('vendedor').AsString;
  INDDESC := listpag.Add(TregProd.Create);
  listpag[tmp].cod := 0;
  listpag[tmp].nome  := 'DESCONTO';
  listpag[tmp].total := 0;

  while not dm.IBselect.Eof do
    begin
      funcoes.informacao(dm.IBselect.RecNo, fim1, 'Aguarde, Gerando Relat�rio...', false, false, 5);

      if vend <> dm.IBselect.fieldbyname('vendedor').AsString then
        begin
          if vend <> 'xxx' then
            begin
              totVend := 0;
              i := listpag.Count -1;
              try
              for tmp := 0 to i do
                begin
                  if listpag[tmp].total <> 0 then
                    begin
                      if tam > 55 then
                        begin
                          addRelatorioForm19(funcoes.CompletaOuRepete('', IntToStr(listpag[tmp].cod),' ',6) + '-' + funcoes.CompletaOuRepete(copy(listpag[tmp].nome,1,15),'',' ',15) + funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',listpag[tmp].total),' ',18) + #13 + #10);
                        end
                      else
                        begin
                          addRelatorioForm19(funcoes.CompletaOuRepete('', IntToStr(listpag[tmp].cod),'0',5) + '-' + funcoes.CompletaOuRepete(copy(listpag[tmp].nome,1,15),'',' ',15) + funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00', listpag[tmp].total),' ',18) + #13 + #10);
                        end;
                    end;
                  totVend := totVend + listpag[tmp].total;
                  listpag[tmp].total := 0;
                end;
              except
               on e:exception do begin
                 ShowMessage('erro13203: ' + e.Message);
               end;
              end;

              totalGeral := totalGeral + totVend;
              addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', tam) + #13 + #10);
              addRelatorioForm19(funcoes.CompletaOuRepete('Total R$: ', formataCurrency(totVend), ' ', 39) + #13 + #10);
              addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', tam) + #13 + #10);
              ///listpag.Clear;
            end;
          vend := dm.IBselect.fieldbyname('vendedor').AsString;
          addRelatorioForm19(funcoes.CompletaOuRepete('','','-', tam) + #13 + #10);
          addRelatorioForm19(funcoes.CompletaOuRepete(LeftStr(funcoes.LerValorPGerais('empresa',form22.Pgerais), 25),'DATA: '+FormatDateTime('dd/mm/yy', now),' ',tam)+#13+#10);
          addRelatorioForm19(funcoes.CompletaOuRepete('VENDAS DE: ' + FormatDateTime('dd/mm/yy',StrToDateDef(ini, form22.datamov)) + ' A ' + FormatDateTime('dd/mm/yy',StrToDateDef(fim, form22.datamov)) ,'' ,' ',tam)+#13+#10);
          addRelatorioForm19('VENDEDOR: ' + VEND + ' - ' + copy(funcoes.BuscaNomeBD(dm.ibquery1, 'nome', 'vendedor', 'where cod = ' + vend), 1, 15) + #13 + #10);
          addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', tam) + #13 + #10);

          if tam > 55 then
            begin
              addRelatorioForm19('COD    NOME                VALOR' + CRLF);
              addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', tam) + #13 + #10);
            end
          else
            begin
              addRelatorioForm19('COD    NOME                VALOR' + CRLF);
              addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', tam) + #13 + #10);
            end;
        end;

      vendAnt := dm.IBselect.fieldbyname('vendedor').AsString;
      tmp     := listpag.Find(dm.IBselect.fieldbyname('codhis').AsInteger);
      desc    := desc + dm.IBselect.fieldbyname('desconto').AsCurrency;

      if tmp = -1 then
        begin
          tmp := listpag.Add(TregProd.Create);
          listpag[tmp].cod := dm.IBselect.fieldbyname('codhis').AsInteger;
          dm.IBQuery2.Close;
          dm.IBQuery2.SQL.Text := 'select nome from formpagto where cod = :cod';
          dm.IBQuery2.ParamByName('cod').AsInteger := listpag[tmp].cod;
          dm.IBQuery2.Open;
          listpag[tmp].nome  := copy(dm.IBQuery2.fieldbyname('nome').AsString, 1, 40);
          listpag[tmp].total := dm.IBselect.fieldbyname('total').AsCurrency;
        end
          else
            begin
              listpag[tmp].total := listpag[tmp].total + dm.IBselect.fieldbyname('total').AsCurrency;
            end;

          listpag[INDDESC].total := listpag[INDDESC].total + dm.IBselect.fieldbyname('desconto').AsCurrency;
          dm.IBselect.Next;
        end;

      totVend := 0;
      i := listpag.Count -1;
      for tmp := 0 to i do
        begin
        try
          if listpag[tmp].total <> 0 then
            begin
              if tam > 55 then
                begin
                  addRelatorioForm19(funcoes.CompletaOuRepete('', IntToStr(listpag[tmp].cod),' ',6) + '-' + funcoes.CompletaOuRepete(copy(listpag[tmp].nome,1,15),'',' ',15) + funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',listpag[tmp].total),' ',18) + #13 + #10);
                end
              else
                begin
                  addRelatorioForm19(funcoes.CompletaOuRepete('', IntToStr(listpag[tmp].cod),'0',5) + '-' + funcoes.CompletaOuRepete(copy(listpag[tmp].nome,1,15),'',' ',15) + funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00', listpag[tmp].total),' ',18) + #13 + #10);
                end;
            end;
        except
          on e:exception do begin
            ShowMessage('erro13203: ' + e.Message);
          end;
        end;

          totVend := totVend + listpag[tmp].total;
          listpag[tmp].total := 0;
        end;

      totalGeral := totalGeral + totVend;
      addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', tam) + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete('Total R$: ', formataCurrency(totVend), ' ', 39) + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', tam) + #13 + #10);

      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',tam)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('Total Geral =>',formataCurrency(totalGeral),' ',tam)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',tam)+ #13+ #10))));

      listpag.Free;
      dm.IBselect.Close;
      desc := 0;
      funcoes.informacao(dm.IBselect.RecNo, fim1, 'Aguarde, Gerando Relat�rio...', false, true, 5);
      form19.ShowModal;
  end;

procedure TForm2.PorVendedorTicket1Click(Sender: TObject);
begin
  funcoes.RelVendasPorVendedor('T');
end;

procedure TForm2.PorCliente3Click(Sender: TObject);
var
  sim, cliente, vencidas, h1 : string;
  totalgeral, vlpago, vlnpago : currency;
  atual : TDateTime;
  ini, fim : integer;
  pagos, npagos : TStringList;
  pago, npago : boolean;
begin
  cliente := funcoes.dialogo('generico',0,'1234567890,.'+#8,50,false,'',Application.Title,'Qual o C�d do Cliente?','');
  if cliente = '*' then exit;

  sim := funcoes.dialogo('generico',0,'123',30,false,'S',Application.Title,'Imprimir Contas (1-Todas, 2-Pagas, 3-N�o Pagas) ?','1');
  if sim = '*' then exit;

  if sim = '2' then sim := ' (pago <> 0) and '
  else if sim = '3' then sim := ' (pago = 0) and '
  else sim := '';
  h1       := '';
  vlpago   := 0;
  vlnpago  := 0;

  if cliente <> '' then
    begin
      h1 := ' (documento = ' + StrNum(cliente) + ') and ';
      dm.IBselect.Close;
      dm.IBselect.SQL.Text := 'select nome from cliente where cod = :cod';
      dm.IBselect.ParamByName('cod').AsString := StrNum(cliente);
      dm.IBselect.Open;

      cliente := cliente + ' - ' + dm.IBselect.fieldbyname('nome').AsString;
    end
  else cliente := 'TODOS';

  pago  := false;
  npago := false;
  pagos  := TStringList.Create;
  npagos := TStringList.Create;

  form19.RichEdit1.Clear;
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(form22.Pgerais.Values['empresa'],'CONTAS A RECEBER POR CLIENTE',80)))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('CLIENTE: ' + cliente+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('--------------------------------------------------------------------------------'+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('VENCIMENTO HISTORICO                                                       VALOR '+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('--------------------------------------------------------------------------------'+#13+#10))));

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'SELECT ENTRADA as valor, DATA, HISTORICO, documento from caixa v ' +
  ' WHERE (V.DOCUMENTO = '+StrNum(cliente)+') AND (ENTRADA > 0) ORDER BY V.DATA' ;
  //dm.IBselect.ParamByName('CLI').AsInteger := CLICOD;
  //dm.IBselect.ParamByName('INI').AsDate    := StrToDate(dataini);
  //dm.IBselect.ParamByName('FIM').AsDate    := StrToDate(datafim);
  dm.IBselect.Open;
  DM.IBselect.FetchAll;

  while not dm.IBselect.Eof do begin
    pagos.Add(CompletaOuRepete(formataDataDDMMYY(dm.IBselect.fieldbyname('data').AsDateTime), '', ' ', 8) + '   ' + strzero(dm.IBselect.fieldbyname('documento').AsString, 6) + '-'+
     CompletaOuRepete(LeftStr(dm.IBselect.fieldbyname('historico').AsString, 40), '', ' ', 40) + CompletaOuRepete('', formataCurrency(dm.IBselect.fieldbyname('valor').AsCurrency), ' ', 22));
    vlpago := vlpago + dm.IBselect.fieldbyname('valor').AsCurrency;
    dm.IBselect.Next;
  end;

  totalgeral := 0;
  totalgeral := totalgeral + vlpago;

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select cr.documento,pago, cr.historico, cr.valor, iif(cr.vencimento > cr.previsao, cr.vencimento, cr.previsao) as vencimento  from contasreceber cr, cliente c where '+sim+h1+' (c.cod = cr.documento) and (cr.pago = 0) order by vencimento');
  dm.IBselect.Open;
  dm.IBselect.First;

  while not dm.IBselect.Eof do
    begin
      if dm.IBselect.fieldbyname('valor').AsCurrency  > 0 then begin
          npagos.Add(CompletaOuRepete(formataDataDDMMYY(dm.IBselect.fieldbyname('vencimento').AsDateTime), '', ' ', 8) + '   ' + strzero(dm.IBselect.fieldbyname('documento').AsString, 6) + '-'+
          CompletaOuRepete(LeftStr(dm.IBselect.fieldbyname('historico').AsString, 40), '', ' ', 40) + CompletaOuRepete('', formataCurrency(dm.IBselect.fieldbyname('valor').AsCurrency), ' ', 22));
          vlnpago := vlnpago + dm.IBselect.fieldbyname('valor').AsCurrency;
          totalgeral := totalgeral + dm.IBselect.fieldbyname('valor').AsCurrency;
      end;
      {else begin
        pagos.Add(CompletaOuRepete(formataDataDDMMYY(dm.IBselect.fieldbyname('vencimento').AsDateTime), '', ' ', 8) + '   ' + strzero(dm.IBselect.fieldbyname('documento').AsString, 6) + '-'+
           CompletaOuRepete(LeftStr(dm.IBselect.fieldbyname('historico').AsString, 40), '', ' ', 40) + CompletaOuRepete('', formataCurrency(dm.IBselect.fieldbyname('valor').AsCurrency), ' ', 22));
        vlpago := vlpago + dm.IBselect.fieldbyname('valor').AsCurrency;
      end;   }

      dm.IBselect.Next;
    end;

  if pagos.Count > 0 then
    begin
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('--------------------------------------------------------------------------------'+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('CONTAS PAGAS'+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('--------------------------------------------------------------------------------'+#13+#10))));
      for ini := 0 to pagos.Count - 1 do
        begin
          addRelatorioForm19(pagos[ini] + CRLF);
        end;
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('--------------------------------------------------------------------------------'+#13+#10))));
      addRelatorioForm19(CompletaOuRepete('TOTAL:', formataCurrency(vlpago), '.', 80) + CRLF);
    end;

  if npagos.Count > 0 then
    begin
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('--------------------------------------------------------------------------------'+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('CONTAS NAO PAGAS'+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('--------------------------------------------------------------------------------'+#13+#10))));
      for ini := 0 to npagos.Count - 1 do
        begin
          addRelatorioForm19(npagos[ini] + CRLF);
        end;
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('--------------------------------------------------------------------------------'+#13+#10))));
      addRelatorioForm19(CompletaOuRepete('TOTAL:', formataCurrency(vlnpago), '.', 80)+ CRLF);
    end;

  dm.IBselect.Close;
  pagos.Free;
  npagos.Free;
  addRelatorioForm19(CompletaOuRepete('', '', '-', 80) + CRLF);
  addRelatorioForm19('TOTAL GERAL =>'+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',totalgeral),' ',66)+#13+#10);
  addRelatorioForm19(CompletaOuRepete('', '', '-', 80) + CRLF);
  form19.ShowModal;

end;

procedure TForm2.RefazerNFCe1Click(Sender: TObject);
begin
  form22.enviNFCeNaoEnviadas;
end;

procedure TForm2.CancelarPorNmerodeNFCe1Click(Sender: TObject);
var
  Justificativa : String;
begin
  nota := funcoes.dialogo('not',0,'1234567890'+#8+#32,50,true,'',Application.Title,'Qual o N�mero da NFCe?','');
  if nota = '*' then exit;

  Justificativa := '';

  while length(trim(Justificativa)) < 15 do
    begin
      Justificativa := dialogo('normal',0,'',150,true,'',Application.Title,'Qual a Justificativa?',Justificativa);
      if Justificativa = '*' then Break;

      if Length(trim(Justificativa)) < 15 then ShowMessage('Justificativa Deve conter mais do que  14 caracteres');
    end;

  if Justificativa = '*' then exit;

    funcoes.Mensagem(Application.Title ,'Aguarde, Cancelando NFCe...',15,'Courier New',false,2,clred, false);
    Application.ProcessMessages;
   try
     Cancelamento_NFePorNNF(nota, Justificativa);
   except
     on e:exception do
       begin
         ShowMessage(e.Message);
       end;
   end;

   funcoes.Mensagem('', '', 25, 'Courier New',False, 0, clRed, true);
end;

procedure TForm2.InutilizaesNFeNFCe1Click(Sender: TObject);
var
  dini, dfim, tipo : string;
begin
  dini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?','');
  if dini = '*' then exit;

  dfim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?','');
  if dfim = '*' then exit;

  form19.RichEdit1.Clear;
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 78) + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.centraliza(form22.Pgerais.Values['empresa'], ' ', 78), '', ' ', 78) + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.centraliza('RELATORIO DE INUTILIZACOES DE ' + dini + ' A ' + dfim, ' ', 78), '', ' ', 78) + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 78) + CRLF);
  //addRelatorioForm19('  NOTA   DATA   CLIENTE                                       CHAVE                      SITUACAO' + CRLF);
  addRelatorioForm19('  DATA     INICIO      FIM    SERIE    TIPO   ' + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 78) + CRLF);

  dm.IBselect.close;
  dm.IBselect.SQL.Text := 'select * from INUTILIZACAO where data >= :ini and data <= :fim ' +
  ' order by tipo, cod';
  dm.IBselect.ParamByName('ini').AsDate := StrToDate(dini);
  dm.IBselect.ParamByName('fim').AsDate := StrToDate(dfim);
  dm.IBselect.Open;

  while not dm.IBselect.Eof do begin
    if dm.IBselect.FieldByName('tipo').AsInteger = 55 then tipo := 'NFe'
      else tipo := 'NFCe';

    addRelatorioForm19(FormatDateTime('dd/mm/yy', dm.IBselect.FieldByName('data').AsDateTime) + ' ' + CompletaOuRepete('', dm.IBselect.FieldByName('inicio').AsString, '0', 8) + ' ' +
    CompletaOuRepete('', dm.IBselect.FieldByName('fim').AsString, '0', 8)+ '      ' + CompletaOuRepete('', dm.IBselect.FieldByName('serie').AsString, '0', 3) + '    ' +
    CompletaOuRepete('', tipo, ' ', 4) + CRLF);

    dm.IBselect.Next;
  end;
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 78) + CRLF);
  dm.IBselect.Close;
  form19.ShowModal;
end;

procedure TForm2.InutilizarNfe1Click(Sender: TObject);
var
  Justificativa, numIni, numFim : String;
begin
  numIni := funcoes.dialogo('not',0,'1234567890'+#8+#32,50,true,'',Application.Title,'Qual a Numera��o Inicial ?','');
  if numIni = '*' then exit;

  numFim := funcoes.dialogo('not',0,'1234567890'+#8+#32,50,true,'',Application.Title,'Qual a Numera��o Final ?','');
  if numFim = '*' then exit;

  Justificativa := '';

  while length(trim(Justificativa)) < 15 do
    begin
      Justificativa := dialogo('normal',0,'',150,true,'',Application.Title,'Qual a Justificativa?',Justificativa);
      if Justificativa = '*' then Break;

      if Length(trim(Justificativa)) < 15 then ShowMessage('Justificativa Deve conter mais do que  14 caracteres');
    end;

   if Justificativa = '*' then exit;

    funcoes.Mensagem(Application.Title ,'Aguarde...',15,'Courier New',false,2,clred, false);
    Application.ProcessMessages;

   try
     inutilizacaoNFCE(StrToInt(numIni), StrToInt(numFim), 55, Justificativa);
   except
     on e:exception do
       begin
         ShowMessage(e.Message);
       end;
   end;

   funcoes.Mensagem('', '', 25, 'Courier New',False, 0, clRed, true);
end;

procedure TForm2.InutilizarNumerao1Click(Sender: TObject);
begin
  funcoes.InutilizarNFCE();
end;

procedure TForm2.AvanarNumerao1Click(Sender: TObject);
var
  num : String;
begin
  num := Incrementa_Generator('nfe', 1);
  ShowMessage('Numera��o NFe: ' + num);
end;

procedure TForm2.MarcarpeloArquivosNFe1Click(Sender: TObject);
var
  op : TOpenDialog;
  ret : TStringList;
  ini : integer;
  chave : String;
begin
  op := TOpenDialog.Create(self);
  ret := TStringList.Create;
  if not op.Execute then exit;

  ret.LoadFromFile(op.FileName);
  for ini := 0 to ret.Count - 1 do
    begin
      if Contido('CHAVE:', RET[INI]) and Contido('PROTOCOLO', ret[ini]) then
        begin
          chave := copy(ret[ini], pos('CHAVE:', ret[ini]) + 7, length(ret[ini]));
          chave := StrNum(chave);

          dm.IBQuery1.Close;
          dm.IBQuery1.SQL.Text := 'update nfce set adic = ''OFF'' where chave = :chave';
          dm.IBQuery1.ParamByName('chave').AsString := chave;
          dm.IBQuery1.ExecSQL;
        end;
    end;

  if dm.IBQuery1.Transaction.InTransaction then dm.IBQuery1.Transaction.Commit;
  ret.Free;
  op.Free;

  ShowMessage('Notas Remarcadas para Envio');
end;

procedure TForm2.rmaClick(Sender: TObject);
var
  xml : String;
begin

  xml := GerarNFCeTexto(InputBox('','',''), '');

end;

procedure TForm2.avanumNFCeClick(Sender: TObject);
begin
  ShowMessage('Numera��o em: '+Incrementa_Generator('nfce', 1));
end;

procedure TForm2.ReimprimirEvento1Click(Sender: TObject);
var
  op : TOpenDialog;
  arq : TStringList;
  CHAVE : sTRING;
begin
  op := TOpenDialog.Create(self);
  if not op.Execute then
    begin
      op.Free;
      exit;
    end;

  arq := TStringList.Create;
  arq.LoadFromFile(op.FileName);
  CHAVE := Le_Nodo('chNFe', arq.Text);

  dm.ACBrNFe.NotasFiscais.Clear;
  dm.ACBrNFe.NotasFiscais.LoadFromFile( caminhoEXE_com_barra_no_final + 'NFE\EMIT\' + CHAVE + '-nfe.xml');
  dm.ACBrNFe.EventoNFe.Evento.Clear;
  dm.ACBrNFe.EventoNFe.LerXMLFromString(arq.GetText);
  dm.ACBrNFe.Configuracoes.Arquivos.PathEvento := caminhoEXE_com_barra_no_final + 'NFE\PDF\';
  //dm.ACBrNFeDANFERaveCB1.PathPDF := caminhoEXE_com_barra_no_final + 'NFE\PDF\';
  //dm.ACBrNFeDANFERaveCB1.MostrarPreview := true;
  dm.ACBrNFe.ImprimirEvento;
end;

procedure TForm2.NFCePorCliente1Click(Sender: TObject);
var
  dini, dfim, pstaNfe,tmp, sit, cnpj, cnpjXML : string;
  dini1, dfim1 : TDate;
  arq, lista : TStringList;
  i1, f1 : integer;
  totitem, totgeral : currency;
begin
   grupo := funcoes.dialogo('generico',0,'1234567890'+#8,50,false,'',Application.Title,'Qual o Cliente','');
  if grupo = '*' then exit;

  if grupo = '' then
    begin
      grupo := funcoes.localizar('Localizar Cliente','cliente','cod,nome,telres,telcom,cnpj as cpfcnpj,bairro','cod','','nome','nome',false,false,false,'',450, nil);
    end;

  if grupo = '' then exit;

  dm.IBselect.Close;
  dm.IBselect.SQL.Text :=  'select cnpj, cod from cliente where cod = :cod';
  dm.IBselect.ParamByName('cod').AsString := StrNum(grupo);
  dm.IBselect.Open;


  if dm.IBselect.IsEmpty then
    begin
      dm.IBselect.Close;
      MessageDlg('Cliente ' + grupo + ' N�o Encontrado', mtError, [mbok], 1);
      exit;
    end;

  cnpj := StrNum(dm.IBselect.fieldbyname('cnpj').AsString);

  dini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?','');
  if dini = '*' then exit;

  dfim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?','');
  if dfim = '*' then exit;

  {pstaNfe := funcoes.dialogo('normal',0,'',2,true,'',Application.Title,'Qual a Pasta de NFe?', pstaNfe);
  if pstaNfe = '*' then exit;}

  dini1 := StrToDateTime(dini);
  dfim1 := StrToDateTime(dfim);

  form19.RichEdit1.Clear;
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 78) + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.centraliza(form22.Pgerais.Values['empresa'], ' ', 78), '', ' ', 78) + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.centraliza('RELATORIO DE NFE EMITIDAS POR CLIENTE DE ' + dini + ' A ' + dfim, ' ', 78), '', ' ', 78) + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 78) + CRLF);
  //addRelatorioForm19('  NOTA   DATA   CLIENTE                                       CHAVE                      SITUACAO' + CRLF);
  addRelatorioForm19('  NOTA VENDA    DATA     CLIENTE                                      SITUACAO' + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 78) + CRLF);

  arq := TStringList.Create;
  //lista := funcoes.listaArquivos(pstaNfe + '*-nfe.xml');
  //f1 := lista.Count -1;

  funcoes.informacao(1,2,'Aguarde, Gerando Relat�rio... ',true,false,2);
  totgeral := 0;

  dm.IBselect.close;
  dm.IBselect.SQL.Text := 'select * from nfce where data >= :ini and data <= :fim';
  dm.IBselect.ParamByName('ini').AsDate := dini1;
  dm.IBselect.ParamByName('fim').AsDate := dfim1;
  dm.IBselect.Open;

  while not dm.IBselect.Eof do begin
    IF FileExists(buscaPastaNFCe(dm.IBselect.FieldByName('chave').AsString) + dm.IBselect.FieldByName('chave').AsString + '-nfe.xml') then begin
      arq.LoadFromFile(buscaPastaNFCe(dm.IBselect.FieldByName('chave').AsString) + dm.IBselect.FieldByName('chave').AsString + '-nfe.xml');
      fornec := Le_Nodo('dest', arq.GetText);
      cnpjXML := IfThen(Le_Nodo('CNPJ', fornec) <> '', Le_Nodo('CNPJ', fornec), Le_Nodo('CPF', fornec));

      if cnpjXML = cnpj then begin
        addRelatorioForm19(funcoes.CompletaOuRepete('', Le_Nodo('nNF', arq.GetText), '0', 6) + ' ' +
        funcoes.CompletaOuRepete('', RightStr(Le_Nodo('cNF', arq.GetText), 7), '0', 7) + ' ' +
         FormatDateTime('dd/mm/yy', StrToDateDef(TMP, now)) + ' ' +funcoes.CompletaOuRepete(LeftStr(Le_Nodo('xNome',Le_Nodo('dest', arq.GetText)), 28), '', ' ', 28) + '   ' + CompletaOuRepete(SIT,'', ' ', 10) + ' ' + CompletaOuRepete('', FormatCurr('0.00',valXML(Le_Nodo('vNF', arq.GetText))), ' ', 12) + CRLF);

         totitem := StrToCurrDef(StringReplace(Le_Nodo('vNF', arq.GetText), '.', ',', [rfReplaceAll, rfIgnoreCase]), 0);
         totgeral := totgeral + totitem;
      end;
    end;

    dm.IBselect.next;
  end;

            {
  for i1 := 0 to f1 do
    begin
      funcoes.informacao(i1,f1,'Aguarde, Gerando Relat�rio... ',false,false, 2);

      totitem := 0;
      arq.Clear;
      arq.LoadFromFile(pstaNfe + lista[i1]);
      tmp := Le_Nodo('dEmi', arq.GetText);

      if (tmp) = '' then tmp := LeftStr(Le_Nodo('dhEmi', arq.GetText), 10);
      tmp := funcoes.dataInglesToBrasil(tmp);
      //muda o formato data yyyy-mm-dd para dd/mm/yyyy

      if (StrNum(tmp) <> '0') then
        begin
          if ((StrToDateTime(tmp) >= dini1) and (StrToDateTime(tmp) <= dfim1)) then
            begin
              fornec := Le_Nodo('dest', arq.GetText);
              cnpjXML := IfThen(Le_Nodo('CNPJ', fornec) <> '', Le_Nodo('CNPJ', fornec), Le_Nodo('CPF', fornec));

              if cnpjXML = cnpj then
                begin
                  sit := Le_Nodo('cStat', arq.GetText);
                  if sit = '100' then sit := 'AUTORIZADA'
                  else if sit = '101' then sit := 'CANCELADA'
                  else if sit = '135' then sit := 'CANCELADA'
                  else sit := 'NAO AUTORIZADA';

                  totitem := StrToCurrDef(StringReplace(Le_Nodo('vNF', arq.GetText), '.', ',', [rfReplaceAll, rfIgnoreCase]), 0);
                  totgeral := totgeral + totitem;
                  addRelatorioForm19(funcoes.CompletaOuRepete('', Le_Nodo('nNF', arq.GetText), '0', 6) + ' ' + TMP + ' ' +funcoes.CompletaOuRepete(LeftStr(Le_Nodo('xNome',Le_Nodo('dest', arq.GetText)), 27), '', ' ', 27) + '  ' + funcoes.CompletaOuRepete(SIT, '', ' ', 17) + funcoes.CompletaOuRepete('', FormatCurr('0.00', totitem), ' ', 14)  +  CRLF);
                end;
            end;
        end;
    end;     }

  funcoes.informacao(i1,f1,'Aguarde, Gerando Relat�rio... ',false,true, 2);
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 78) + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL:', FormatCurr('#,###,###0.00', totgeral), '.', 78) + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 78) + CRLF);

  lista.Free;
  arq.Free;
  form19.ShowModal;
end;

procedure TForm2.NFCePorData1Click(Sender: TObject);
var
  dini, dfim, pstaNfe,tmp, sit, NUMFALTA : string;
  dini1, dfim1 : TDate;
  arq, lista : TStringList;
  i1, f1 : integer;
  chav1 : TChaveDetalhes;
  tot, vnf, cancela : currency;
  cont, estad : integer;
begin
  pstaNfe := caminhoEXE_com_barra_no_final + 'NFCE\EMIT\';
  if not DirectoryExists(pstaNfe) then
    begin
      MessageDlg('Este Terminal n�o tem informa��es das Notas Emitidas', mtError, [mbOK], 1);
      exit;
    end;

  {grupo := funcoes.dialogo('generico',0,'1234567890'+#8,50,false,'',Application.Title,'Qual o Cliente','');
  if grupo = '*' then exit;}

  dini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?','');
  if dini = '*' then exit;

  dfim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?','');
  if dfim = '*' then exit;

  pstaNfe := funcoes.dialogo('normal',0,'',2,true,'',Application.Title,'Qual a Pasta de NFe?', pstaNfe);
  if pstaNfe = '*' then exit;

  dini1 := StrToDateTime(dini);
  dfim1 := StrToDateTime(dfim);

  form19.RichEdit1.Clear;
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 78) + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.centraliza(form22.Pgerais.Values['empresa'], ' ', 78), '', ' ', 78) + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.centraliza('RELATORIO DE NFCE EMITIDAS' + dini + ' A ' + dfim, ' ', 78), '', ' ', 78) + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 78) + CRLF);
  addRelatorioForm19('NOTA FISCAL     VENDA SERIE    DATA    SITUACAO                          TOTAL' + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 78) + CRLF);

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select adic, chave, nota, data from nfce where data >= :ini and data <= :fim order by CHAVE';
  dm.IBselect.ParamByName('ini').AsDateTime := dini1;
  dm.IBselect.ParamByName('fim').AsDateTime := dfim1;
  dm.IBselect.Open;
  chav1 := TChaveDetalhes.Create;
  arq := TStringList.Create();
  arq.Clear;
  tot     := 0;
  cancela := 0;
  Ler_dados_pela_chave(chav1);
  cont := chav1.nnf;


  while not dm.IBselect.Eof do
    begin
      sit := '* * * SEM PROTOCOLO * * *';
      chav1.chave := dm.IBselect.fieldbyname('chave').AsString;
      Ler_dados_pela_chave(chav1);

      if cont <> chav1.nnf then
        begin
          while true do
            begin
              NUMFALTA := NUMFALTA + IntToStr(cont) + '-';
              if cont >= chav1.nnf then break;
              cont := cont + 1;
            end;
        end;

      vnf := 0;

      //if FileExists(caminhoEXE_com_barra_no_final + 'NFCE\EMIT\' + chav1.chave + '-nfe.xml') then
      if FileExists(buscaPastaNFCe(chav1.chave) + chav1.chave + '-nfe.xml') then
        begin
          //arq.LoadFromFile(caminhoEXE_com_barra_no_final + 'NFCE\EMIT\' + chav1.chave + '-nfe.xml');
          arq.LoadFromFile(buscaPastaNFCe(chav1.chave) + chav1.chave + '-nfe.xml');
          CST_PIS := Le_Nodo('cStat', arq.GetText);

          vnf := StrToCurrDef(StringReplace(Le_Nodo('vNF', arq.GetText), '.', ',', [rfReplaceAll, rfIgnoreCase]), 0);

          if Contido(TRIM(CST_PIS), '100-150') then
            begin
              sit := 'AUTORIZADA';
            end
           else if CST_PIS = '135' then sit := 'CANCELADA'
           else sit := IfThen(trim(CST_PIS) <> '', 'cStat: ' + CST_PIS, '* * * SEM PROTOCOLO1 * * *');
        end
     else sit := 'XML N.ENCONTRADO';

      if dm.IBselect.FieldByName('adic').AsString = 'CANC' then
        begin
          sit := 'CANCELADA';
        end;

      if sit = 'CANCELADA' then cancela := cancela + vnf;
      if sit = 'AUTORIZADA' then tot := tot + vnf;
      if dm.IBselect.FieldByName('adic').AsString = 'OFF' then
        begin
          sit := 'AGUARDANDO ENVIO';
          tot := tot + vnf;
        end;

      addRelatorioForm19(CompletaOuRepete('', IntToStr(chav1.nnf), '0', 10) + '  ' + CompletaOuRepete('', IntToStr(chav1.codnf), '0', 10) + ' ' + CompletaOuRepete('', Copy(chav1.chave, 23, 3), ' ', 3) + '   ' +
      FormatDateTime('dd/mm/yy',dm.IBselect.fieldbyname('data').AsDateTime) + ' ' + CompletaOuRepete(sit, '', ' ', 30) +  CompletaOuRepete('', formataCurrency(vnf), ' ', 10) + CRLF);
      dm.IBselect.Next;
      cont := cont + 1;
    end;

  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 78) + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete('EMITIDAS     ====>>', '', '.', 59) + CompletaOuRepete('', formataCurrency(tot), ' ', 10) + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete('CANCELADAS   ====>>', '', '.', 59) + CompletaOuRepete('', formataCurrency(cancela), ' ', 10) + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL        ====>>', '', '.', 59) + CompletaOuRepete('', formataCurrency(tot + cancela), ' ', 10) + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 78) + CRLF);
  {if NUMFALTA <> '' then
    begin
      NUMFALTA := 'NUM. FALTANDO: ' + NUMFALTA;
      funcoes.QuebraLinhas('|','|', NUMFALTA, 78);
    end;}
  form19.showmodal;
end;

procedure TForm2.RecuperarNotaSemProtocolos1Click(Sender: TObject);
var
  arq, tmp : TStringList;
  pasta : String;
  ini, fim : integer;
begin
  pasta := funcoes.BrowseForFolder('Informe a pasta e XMLs', '', true);
  if pasta = '' then exit;

  arq := funcoes.listaArquivos(pasta + '\*.xml');
  tmp := TStringList.Create;
  fim := arq.Count - 1;
  funcoes.Mensagem(Application.Title ,'Aguarde, Consultando NFCe...',15,'Courier New',false,0,clred, false);

  for ini := 0 to fim do
    begin
      tmp.LoadFromFile(pasta + '\' + arq[ini]);
      if Le_Nodo('cStat',tmp.GetText) = '' then
        begin
          nota := copy(arq[ini], length(arq[ini]) - 15, 7);
          funcoes.Mensagem(Application.Title ,'Aguarde, Consultando NFCe('+IntToStr(ini)+'/'+IntToStr(fim)+')',15,'Courier New',false,0,clred, false);
          try
            Application.ProcessMessages;
            ConsultarNFe(nota, false);
          except
          end;
          funcoes.Mensagem('', '', 25, 'Courier New',False, 0, clRed, true);
        end;
    end;
        
  tmp.Free;
  arq.Free;
  funcoes.Mensagem('', '', 25, 'Courier New',False, 0, clRed, true);
end;

procedure TForm2.CriaXMLsNoEncontrados1Click(Sender: TObject);
var
  ini, fim, emi, tudo : string;
  cont, fi, i     : integer;
begin
  //exit;
  emi := funcoes.dialogo('normal',0,'',2,true,'',Application.Title,'Qual o ADIC ?','');
  if emi = '*' then exit;

  tudo := funcoes.dialogo('generico',50,'SN',50,true,'S',Application.Title,'Gerar Tudo ?','N');
  if tudo = '*' then exit;

  if emi = '' then
    begin
      ini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(form22.datamov));
      if ini = '*' then exit;

      fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?',formatadataddmmyy(form22.datamov));
      if fim = '*' then exit;
    end;

  dm.IBselect.Close;          
  if emi = '' then
    begin
      dm.IBselect.SQL.Text := 'select * from nfce where data >= :ini and data <= :fim ORDER BY substring(CHAVE FROM 26 FOR 9)';
      dm.IBselect.ParamByName('ini').AsDate := StrToDate(ini);
      dm.IBselect.ParamByName('fim').AsDate := StrToDate(fim);
    end
  else
    begin
      dm.IBselect.SQL.Text := 'select * from nfce where adic = :adic ORDER BY substring(CHAVE FROM 26 FOR 9)';
      dm.IBselect.ParamByName('adic').AsString := emi;
    end;

  dm.IBselect.Open;
  dm.IBselect.FetchAll;
  cont := 0;
  i := 0;

  fi := dm.IBselect.RecordCount;
  funcoes.informacao(i, fi, 'Aguarde, Gerando Relat�rio...', true, false, 5);

  while not dm.IBselect.Eof do
    begin
      i := i + 1;
      funcoes.informacao(i, fi, 'Aguarde, Gerando Relat�rio...', false, false, 5);
      if tudo = 'S' then
        begin
          criaXMLs(dm.IBselect.fieldbyname('nota').AsString, copy(dm.IBselect.fieldbyname('chave').AsString, 26, 9), dm.IBselect.fieldbyname('chave').AsString);
          cont := cont + 1;
        end
      else
       begin
      //if not FileExists(caminhoEXE_com_barra_no_final + 'NFCE\EMIT\' + dm.IBselect.fieldbyname('chave').AsString + '-nfe.xml') then
      if not FileExists(buscaPastaNFCe(dm.IBselect.fieldbyname('chave').AsString) + dm.IBselect.fieldbyname('chave').AsString + '-nfe.xml') then
        begin
          chaveRecria := '';
          criaXMLs(dm.IBselect.fieldbyname('nota').AsString, copy(dm.IBselect.fieldbyname('chave').AsString, 26, 9), dm.IBselect.fieldbyname('chave').AsString);
          cont := cont + 1;
          chaveRecria := '';

          {try
            ACBrNFe.WebServices.Consulta.NFeChave := dm.IBselect.fieldbyname('chave').AsString;
            ACBrNFe.WebServices.Consulta.Executar;
            if Le_Nodo('cStat',ACBrNFe.WebServices.Consulta.RetornoWS) = '217' then
              begin
                criaXMLs(dm.IBselect.fieldbyname('nota').AsString, copy(dm.IBselect.fieldbyname('chave').AsString, 26, 9), dm.IBselect.fieldbyname('chave').AsString);
                cont := cont + 1;
              end;
          except
          end;    }
        end;
        end;

      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Text := 'update nfce set tentativa = 0 where chave = :chave' ;
      dm.IBQuery1.ParamByName('chave').AsString := dm.IBselect.fieldbyname('chave').AsString;
      dm.IBQuery1.ExecSQL;


      dm.IBselect.Next;
    end;

  if dm.IBQuery1.Transaction.InTransaction then dm.IBQuery1.Transaction.Commit;
    
  funcoes.informacao(i, fi, 'Aguarde, Gerando Relat�rio...', false, true, 5);
  ShowMessage(IntToStr(cont)+' NFCes Criadas.' );
end;

procedure TForm2.ConsultarPorArquivo1Click(Sender: TObject);
var
  arq : TOpenDialog;
begin
  arq := TOpenDialog.Create(self);
  if not arq.Execute then exit;

  nota := arq.FileName;
  //if not funcoes.verificaSeExisteVenda(nota) then exit;

  {dm.ACBrNFe.NotasFiscais.Clear;
  dm.ACBrNFe.NotasFiscais.LoadFromFile(nota);
  //dm.ACBrNFe.NotasFiscais.Validar;
  //dm.ACBrNFe.NotasFiscais.Assinar;
  dm.ACBrNFe.Consultar;}


  try
    funcoes.Mensagem(Application.Title ,'Aguarde, Consultando NFCe...',15,'Courier New',false,0,clred, false);
    Application.ProcessMessages;
    ConsultarNFe(nota);
  finally
    funcoes.Mensagem('', '', 25, 'Courier New',False, 0, clRed, true);
  end;
end;

procedure TForm2.ReimprimirPorXML1Click(Sender: TObject);
var
  arq : TOpenDialog;
begin
  arq := TOpenDialog.Create(self);
  if not arq.Execute then exit;

  nota := arq.FileName;
  //if not funcoes.verificaSeExisteVenda(nota) then exit;

  PRINTER.Create;

  dm.ACBrNFe.DANFE := dm.ACBrNFeDANFeRL1;
  dm.ACBrNFe.DANFE.MostrarPreview := true;
  dm.ACBrNFe.NotasFiscais.Clear;
  dm.ACBrNFe.NotasFiscais.LoadFromFile(nota);
  dm.ACBrNFe.NotasFiscais.Imprimir;
  {//dm.ACBrNFe.NotasFiscais.Validar;
  //dm.ACBrNFe.NotasFiscais.Assinar;
  dm.ACBrNFe.Consultar;}

  try
    funcoes.Mensagem(Application.Title ,'Aguarde, Imprimindo NFCe...',15,'Courier New',false,0,clred, false);
    Application.ProcessMessages;

    //imprimirNFe();
  finally
    funcoes.Mensagem('', '', 25, 'Courier New',False, 0, clRed, true);
  end;
end;

procedure TForm2.RelatriodePendnciasNFCe1Click(Sender: TObject);
begin
  funcoes.verificaNFCe;
end;

procedure TForm2.AdicionaExceoFireWall1Click(Sender: TObject);
begin
  funcoes.adicionarExcecao;
  ShowMessage('Exce��o Adicionada Com Sucesso!');
end;

procedure TForm2.AdicionarXMLs1Click(Sender: TObject);
var
  pasta, chave, tmp : String;
  arq, xml : TStringList;
  a, b, cont     : integer;
  chavb    : TChaveDetalhes;
  data     : TDateTime;
begin
  pasta := funcoes.BrowseForFolder('Procurar Pasta NFCe', '', true );
  if pasta = '' then exit;

  arq   := funcoes.listaArquivos(pasta + '\*-nfe.xml');
  xml   := TStringList.Create;
  chavb := TChaveDetalhes.Create;
  b   := arq.Count -1;
  cont := 0;
  for a := 0 to b do
    begin
      xml.LoadFromFile(pasta + '\' + arq[a]);
      chave := funcoes.entraXMLeRetornaChave(xml.GetText);
      chavb.chave := chave;
      Ler_dados_pela_chave(chavb);

      if Le_Nodo('cStat', xml.GetText) <> '' then
        begin
          dm.IBQuery1.Close;
          dm.IBQuery1.SQL.Text := 'select chave from nfce where chave = :chave';
          dm.IBQuery1.ParamByName('chave').AsString := chavb.chave;
          dm.IBQuery1.Open;

          if dm.IBQuery1.IsEmpty then
            begin
              tmp := LeftStr(Le_Nodo('dhEmi', xml.GetText), 10);
              tmp := funcoes.dataInglesToBrasil(tmp);
           
              data := StrToDate(tmp);

              dm.IBQuery1.Close;
              dm.IBQuery1.SQL.Text := 'update or insert into nfce(chave, nota, data, adic) values(:chave, :nota, :data, :adic)';
              dm.IBQuery1.ParamByName('chave').AsString  := chavb.chave;
              dm.IBQuery1.ParamByName('nota').AsInteger  := chavb.codnf;
              dm.IBQuery1.ParamByName('data').AsDate     := data;
              dm.IBQuery1.ParamByName('adic').AsString   := '';
              dm.IBQuery1.ExecSQL;
              dm.IBQuery1.Transaction.Commit;

              cont := cont + 1;
            end;
        end;
    end;

  if dm.IBQuery1.Transaction.InTransaction then dm.IBQuery1.Transaction.Commit;

  dm.IBQuery1.Close;
  arq.Free;
  xml.Free;
  chavb.Free;

  ShowMessage('XMLs Inseridos: ' + IntToStr(cont));
end;

procedure TForm2.criaDatasetMenus();
var
  i1, i2, i3, cont : integer;
begin
  ClientDataSet1.EmptyDataSet;
  cont := 0;
  for i1 := 0 to MainMenu1.Items.Count -1 do // Estoque Servi�os
    begin
      for i2 := 0 to MainMenu1.Items[i1].Count -1 do //vendas reimpressao
        begin
          if MainMenu1.Items[i1].Items[i2].Count > 0 then
            begin
              for i3 := 0 to MainMenu1.Items[i1].Items[i2].Count -1 do // atualizar bd, vendas por nota
                begin
                  cont := cont + 1;

                  IF MainMenu1.Items[i1].Items[i2].Visible then
                    begin
                      ClientDataSet1.Append;
                      ClientDataSet1MENU.AsString := LeftStr(UpperCase(MainMenu1.Items[i1].Items[i2].Caption), 30);
                      ClientDataSet1nome.AsString := LeftStr(UpperCase(MainMenu1.Items[i1].Items[i2].Items[i3].Caption), 30);
                      ClientDataSet1cod.AsInteger := cont;
                      ClientDataSet1.Post;
                    end;
                  //else ShowMessage(MainMenu1.Items[i1].Items[i2].Caption + ' > ' + MainMenu1.Items[i1].Items[i2].Items[i3].Caption);
                end;
            end
          else
            begin
              cont := cont + 1;
              if MainMenu1.Items[i1].Items[i2].Visible then
                begin
                  ClientDataSet1.Append;
                  ClientDataSet1MENU.AsString := LeftStr(UpperCase(MainMenu1.Items[i1].Caption), 30);
                  ClientDataSet1nome.AsString := LeftStr(UpperCase(MainMenu1.Items[i1].Items[i2].Caption), 30);
                  ClientDataSet1cod.AsInteger := cont;
                  ClientDataSet1.Post;
                end;
            end;
        end;
    end;
end;

procedure TForm2.cliqueMenu(const cod : String);
var
  i1, i2, i3, cont, cod1 : integer;
begin
  if cod = '' then exit;
  cod1 := StrToInt(StrNum(cod));

  cont := 0;
  for i1 := 0 to MainMenu1.Items.Count -1 do
    begin
      for i2 := 0 to MainMenu1.Items[i1].Count -1 do
        begin
          if MainMenu1.Items[i1].Items[i2].Count > 0 then
            begin
              for i3 := 0 to MainMenu1.Items[i1].Items[i2].Count -1 do
                begin
                  cont := cont + 1;
                  if cont = cod1 then
                    begin
                      if MainMenu1.Items[i1].Items[i2].Visible = false then
                        begin
                          MessageDlg('Este Usu�rio N�o tem Permiss�o para Usar Esta Rotina!', mtError, [mbOK], 1);
                          exit;
                        end;
                        
                      MainMenu1.Items[i1].Items[i2].Items[i3].Click;
                    end;
                end;
            end
          else
            begin
              cont := cont + 1;
              if cont = cod1 then
                begin
                  if MainMenu1.Items[i1].Items[i2].Visible = false then
                    begin
                      MessageDlg('Este Usu�rio N�o tem Permiss�o para Usar Esta Rotina!', mtError, [mbOK], 1);
                      exit;
                    end;
                  MainMenu1.Items[i1].Items[i2].Click;
                end;
            end;
        end;
    end;
end;

procedure TForm2.ContadoCliente1Click(Sender: TObject);
var
  cliente, nome, ini, dataini, datafim, sim : string;
  totalgeral, TOTVENDA, TOTPAG, TOTFALTA : currency;
  CLICOD : Integer;
begin
  dataini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?',formatadataddmmyy(StartOfTheMonth(now)));
  if dataini = '*' then exit;

  datafim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?',formatadataddmmyy(EndOfTheMonth(now)));
  if datafim = '*' then exit;

  cliente := funcoes.dialogo('generico',0,'1234567890,.'+#8,50,false,'',Application.Title,'Qual o C�d do Cliente?','');
  if cliente = '*' then exit;

  if cliente = '' then
    begin
      cliente := funcoes.localizar('Localizar Cliente','cliente','cod,nome,telres,telcom,cnpj,bairro','cod,nome','','nome','nome',FALSE,false,false,'',0,nil);
    end;

  if cliente = '' then
    begin
      exit;
    end;

  sim := funcoes.dialogo('generico',0,'SN',20,false,'S',Application.Title,'Imprimir Somente Resumo ?','N');
  if sim = '*' then exit;

  CLICOD := StrToIntDef(cliente, 0);

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select nome from cliente where cod = :cod';
  dm.IBselect.ParamByName('cod').AsInteger := CLICOD;
  dm.IBselect.Open;

  nome := cliente + ' - ' + dm.IBselect.fieldbyname('nome').AsString;

  form19.RichEdit1.Clear;

  if sim = 'N' then begin
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(form22.Pgerais.Values['empresa'],'VENDAS A PRAZO POR CLIENTE',66)))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('CLIENTE: ' + NOME+#13+#10))));
  addRelatorioForm19(CompletaOuRepete('', '', '-', 66) + CRLF);
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('  DATA          NOTA   VENDEDOR                              VALOR '+#13+#10))));
  addRelatorioForm19(CompletaOuRepete('', '', '-', 66) + CRLF);

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select V.NOTA, V.HORA, V.VENDEDOR, V.DATA, VE.NOME, v.total FROM VENDA V LEFT JOIN VENDEDOR VE ON (V.VENDEDOR = VE.COD) ' +
  ' WHERE V.CLIENTE = :CLI AND V.DATA >= :INI AND V.DATA <= :FIM ORDER BY V.DATA + V.HORA' ;
  dm.IBselect.ParamByName('CLI').AsInteger := CLICOD;
  dm.IBselect.ParamByName('INI').AsDate    := StrToDate(dataini);
  dm.IBselect.ParamByName('FIM').AsDate    := StrToDate(datafim);
  dm.IBselect.Open;
  dm.IBselect.First;

  totalgeral := 0;
  TOTVENDA   := 0;
  while not dm.IBselect.Eof do
    begin

      addRelatorioForm19(FormatDateTime('dd/mm/yy', dm.IBselect.fieldbyname('data').AsDateTime)+ ' ' + FormatDateTime('HH:MM', dm.IBselect.fieldbyname('HORA').AsDateTime) + ' '
      + strzero(dm.IBselect.fieldbyname('nota').Asstring, 7) + ' ' + CompletaOuRepete(LeftStr(dm.IBselect.fieldbyname('vendedor').AsString + '-' + dm.IBselect.fieldbyname('nome').AsString, 31), '', ' ', 31) +
      CompletaOuRepete('', FormatCurr('0.00', dm.IBselect.fieldbyname('total').AsCurrency), ' ', 12) + CRLF);

      TOTVENDA := TOTVENDA + dm.IBselect.fieldbyname('total').AsCurrency;
      dm.IBselect.Next;
    end;

  addRelatorioForm19(CompletaOuRepete('', '', '-', 66) + CRLF);
  addRelatorioForm19('TOTAL =>'+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00',TOTVENDA),' ',58)+#13+#10);
  addRelatorioForm19(CompletaOuRepete('', '', '-', 66) + CRLF);

  addRelatorioForm19(CRLF + CRLF);

  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(form22.Pgerais.Values['empresa'],'CONTAS RECEBIDAS POR CLIENTE',66)))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('CLIENTE: ' + NOME+#13+#10))));
  addRelatorioForm19(CompletaOuRepete('', '', '-', 66) + CRLF);
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('  DATA    HISTORICO                                          VALOR '+#13+#10))));
  addRelatorioForm19(CompletaOuRepete('', '', '-', 66) + CRLF);

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'SELECT ENTRADA, DATA, HISTORICO from caixa v ' +
  ' WHERE (V.DOCUMENTO = '+StrNum(IntToStr(CLICOD))+') AND (ENTRADA > 0)'+
  ' AND (cast(V.DATA as date) >= :INI) AND (cast(V.DATA as date) <= :FIM)'+
  ' ORDER BY V.DATA' ;
  //dm.IBselect.ParamByName('CLI').AsInteger := CLICOD;
  dm.IBselect.ParamByName('INI').AsDate    := StrToDate(dataini);
  dm.IBselect.ParamByName('FIM').AsDate    := StrToDate(datafim);
  dm.IBselect.Open;
  DM.IBselect.FetchAll;

  TOTPAG := 0;
  while not dm.IBselect.Eof do
    begin

      addRelatorioForm19(FormatDateTime('dd/mm/yy', dm.IBselect.fieldbyname('data').AsDateTime)+ ' ' + CompletaOuRepete(dm.IBselect.fieldbyname('historico').AsString, '', ' ', 35) +
      CompletaOuRepete('', FormatCurr('0.00', dm.IBselect.fieldbyname('entrada').AsCurrency), ' ', 22) + CRLF);

      TOTPAG := TOTPAG + dm.IBselect.fieldbyname('entrada').AsCurrency;
      dm.IBselect.Next;
    end;

  addRelatorioForm19(CompletaOuRepete('', '', '-', 66) + CRLF);
  addRelatorioForm19('TOTAL =>'+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00', TOTPAG),' ',58)+#13+#10);
  addRelatorioForm19(CompletaOuRepete('', '', '-', 66) + CRLF);


  addRelatorioForm19(CRLF + CRLF);

  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.RelatorioCabecalho(form22.Pgerais.Values['empresa'],'CONTAS A RECEBER POR CLIENTE',66)))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('CLIENTE: ' + NOME+#13+#10))));
  addRelatorioForm19(CompletaOuRepete('', '', '-', 66) + CRLF);
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('VENCIME. HISTORICO                                           VALOR '+#13+#10))));
  addRelatorioForm19(CompletaOuRepete('', '', '-', 66) + CRLF);

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'SELECT valor, DATA, HISTORICO, vencimento from contasreceber v ' +
  ' WHERE (V.DOCUMENTO = :CLI and v.pago = 0) '+
  //'and (vencimento >= :INI) and (vencimento <= :FIM)'+
  ' ORDER BY V.vencimento' ;
  dm.IBselect.ParamByName('CLI').AsInteger := CLICOD;
  //dm.IBselect.ParamByName('INI').AsDate    := StrToDate(dataini);
  //dm.IBselect.ParamByName('FIM').AsDate    := StrToDate(datafim);
  dm.IBselect.Open;
  dm.IBselect.First;

  TOTFALTA := 0;
  while not dm.IBselect.Eof do
    begin

      addRelatorioForm19(FormatDateTime('dd/mm/yy', dm.IBselect.fieldbyname('vencimento').AsDateTime)+ ' ' + CompletaOuRepete(dm.IBselect.fieldbyname('historico').AsString, '', ' ', 35) +
      CompletaOuRepete('', FormatCurr('0.00', dm.IBselect.fieldbyname('VALOR').AsCurrency), ' ', 22) + CRLF);

      TOTFALTA := TOTFALTA + dm.IBselect.fieldbyname('VALOR').AsCurrency;
      dm.IBselect.Next;
    end;

  addRelatorioForm19(CompletaOuRepete('', '', '-', 66) + CRLF);
  addRelatorioForm19('TOTAL =>'+funcoes.CompletaOuRepete('',FormatCurr('#,##,###0.00', TOTFALTA),' ',58)+#13+#10);
  addRelatorioForm19(CompletaOuRepete('', '', '-', 66) + CRLF);

  end;

  addRelatorioForm19('---------------------------------------' + CRLF);
  addRelatorioForm19('       * * * R E S U M O * * *' + CRLF);
  addRelatorioForm19('---------------------------------------' + CRLF);
  addRelatorioForm19(CompletaOuRepete('VENDAS....: ', FormatCurr('0.00', TOTVENDA), ' ', 39) + CRLF);
  addRelatorioForm19(CompletaOuRepete('PAGAS.....: ', FormatCurr('0.00', TOTPAG), ' ', 39) + CRLF);
  addRelatorioForm19(CompletaOuRepete('PENDENTES : ', FormatCurr('0.00', TOTFALTA), ' ', 39) + CRLF);
  addRelatorioForm19('---------------------------------------' + CRLF);


  form19.ShowModal;

end;

procedure TForm2.ManifestaodoDestinatrio1Click(Sender: TObject);
begin
  form68 := tform68.Create(self);
  form68.abredataset;
  form68.ShowModal;
  form68.Free;
end;

procedure TForm2.ManutenoNFCe1Click(Sender: TObject);
begin
  funcoes.manutencaoNFCe;
end;

procedure TForm2.MarcarNFCesSemProtocolo1Click(Sender: TObject);
var
  dini, dfim: string;
  dini1, dfim1 : TDate;
  arq : TStringList;
  chav1 : TChaveDetalhes;
  cont : integer;
begin
  if not DirectoryExists(caminhoEXE_com_barra_no_final + 'NFCE\EMIT\') then
    begin
      MessageDlg('Este Terminal n�o tem informa��es das Notas Emitidas', mtError, [mbOK], 1);
      exit;
    end;

  {grupo := funcoes.dialogo('generico',0,'1234567890'+#8,50,false,'',Application.Title,'Qual o Cliente','');
  if grupo = '*' then exit;}

  dini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?','');
  if dini = '*' then exit;

  dfim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?','');
  if dfim = '*' then exit;

  dini1 := StrToDateTime(dini);
  dfim1 := StrToDateTime(dfim);

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select adic, chave, nota, data from nfce where data >= :ini and data <= :fim order by CHAVE';
  dm.IBselect.ParamByName('ini').AsDateTime := dini1;
  dm.IBselect.ParamByName('fim').AsDateTime := dfim1;
  dm.IBselect.Open;
  
  chav1 := TChaveDetalhes.Create;
  arq := TStringList.Create();
  arq.Clear;
  cont := 0;
  Ler_dados_pela_chave(chav1);
  cont := chav1.nnf;

  while not dm.IBselect.Eof do
    begin
      chav1.chave := dm.IBselect.fieldbyname('chave').AsString;
      Ler_dados_pela_chave(chav1);

      if FileExists(buscaPastaNFCe(chav1.chave) + chav1.chave + '-nfe.xml') then
        begin
          arq.LoadFromFile(buscaPastaNFCe(chav1.chave) + chav1.chave + '-nfe.xml');
          CST_PIS := Le_Nodo('cStat', arq.Text);

          if CST_PIS = '' then
            begin
              dm.IBQuery1.Close;
              dm.IBQuery1.SQL.Text := 'update nfce set adic = ''OFF'' where chave = :chave';
              dm.IBQuery1.ParamByName('chave').AsString := chav1.chave;
              dm.IBQuery1.ExecSQL;
              cont := cont + 1;
            end;
        end
      else
        begin
          dm.IBQuery1.Close;
          dm.IBQuery1.SQL.Text := 'update nfce set adic = ''OFF'' where chave = :chave';
          dm.IBQuery1.ParamByName('chave').AsString := chav1.chave;
          dm.IBQuery1.ExecSQL;
          cont := cont + 1;
        end;
        
      dm.IBselect.Next;
    end;

  ShowMessage(IntToStr(cont) + ' NFCes Adicionadas Para Recuperar Protocolo!');
end;

procedure TForm2.CEST1Click(Sender: TObject);
begin
  form61 := tform61.Create(self);
  form61.ShowModal;
  form61.Free;
end;

procedure TForm2.Promoes1Click(Sender: TObject);
begin
  promocao := Tpromocao.Create(self);
  promocao.ShowModal;
  promocao.Free;
end;

procedure TForm2.VerificarNFCes1Click(Sender: TObject);
begin
  funcoes.arrumaDataRegistroNFCe;
end;

procedure TForm2.VerificarVendas1Click(Sender: TObject);
var
  dini, dfim : string;
  i : integer;
begin
  dini := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Inicial?','');
  if dini = '*' then exit;

  dfim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?','');
  if dfim = '*' then exit;

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select nota, total, desconto, (select sum(i.total)  from item_venda i'+
  ' where i.nota = v.nota) as total1  from venda v where v.total <> ((select sum(i.total)  from item_venda i ' +
  'where i.nota = v.nota) + v.desconto) and (data >= :ini) and (data <= :fim) and cancelado = 0';
  dm.IBselect.ParamByName('ini').AsDate := StrToDate(dini);
  dm.IBselect.ParamByName('fim').AsDate := StrToDate(dfim);
  dm.IBselect.Open;
  dm.IBselect.FetchAll;
  i := 0;

  while not dm.IBselect.Eof do
    begin
      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Text := 'update venda set desconto = :desconto where nota = :nota';
      dm.IBQuery1.ParamByName('desconto').AsCurrency := -(dm.IBselect.fieldbyname('total1').AsCurrency - dm.IBselect.fieldbyname('total').AsCurrency);
      dm.IBQuery1.ParamByName('nota').AsInteger      := dm.IBselect.fieldbyname('nota').AsInteger;
      dm.IBQuery1.ExecSQL;

      dm.IBselect.Next;
      i := i + 1;
    end;

  if dm.IBQuery1.Transaction.InTransaction then dm.IBQuery1.Transaction.Commit;
  ShowMessage(IntToStr(i)+' Vendas Alteradas');
  dm.IBselect.Close;
  dm.IBQuery1.Close;
end;

procedure TForm2.atualizaLabel(cont1 : integer);
begin
  if Panel1.Visible = false then Panel1.Visible := true;
  Label1.Caption := IntToStr(cont1);
end;

procedure TForm2.VendasCanceladas1Click(Sender: TObject);
var
  ini, fim : String;
  totalGeral : currency;
  b : integer;
begin
  ini := funcoes.dialogo('data',0,'',50,true,'',Application.Title,'Qual a Data Inicial?','');
  if ini = '*' then exit;

  fim := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data Final?','');
  if fim = '*' then exit;

  form19.RichEdit1.Clear;
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|',' ',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('VENDAS CANCELADAS DE: '+FormatDateTime('dd/mm/yy',StrToDate(ini))+' A '+FormatDateTime('dd/mm/yy',StrToDate(fim)),'HORA: '+FormatDateTime('tt',now)+'|',' ',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('    NOTA   DATA                 VALOR  USUARIO'+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  //form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#13+#10))));

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := ('select nota,data,total, u.nome from venda v left join usuario u on (u.cod = v.cancelado) where ((cancelado > 0) and(data >= :v1) and (data <= :v2))');
  dm.IBselect.ParamByName('v1').AsDateTime := StrToDate(ini);
  dm.IBselect.ParamByName('v2').AsDateTime := StrToDate(fim);
  dm.IBselect.Open;

  if dm.IBselect.IsEmpty then
    begin
      dm.IBselect.Close;
      MessageDlg('N�o Existe Venda Cancelada Nesse Per�odo!', mtInformation, [mbOK], 1);
      exit;
    end;

  totalGeral := 0;
  b := 60;
  while not dm.IBselect.Eof do
    begin

      {if form19.RichEdit1.Lines.Count >= b then
        begin
          b := b + 60;
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(funcoes.LerValorPGerais('empresa',form22.Pgerais),'DATA: '+FormatDateTime('dd/mm/yy',now)+'|',' ',80)+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('VENDAS POR CLIENTE/NOTA DE: '+FormatDateTime('dd/mm/yy',StrToDate(ini))+' A '+FormatDateTime('dd/mm/yy',StrToDate(fim)),'HORA: '+FormatDateTime('tt',now)+'|',' ',80)+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('    NOTA   DATA                 VALOR  USUARIO'+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('CLIENTE: '+cliente+'-'+funcoes.BuscaNomeBD(dm.ibquery1,'nome','cliente','where cod='+cliente),'',' ',80)+#13+#10))));
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#13+#10))));
        end;}
        
      totalGeral := totalGeral + dm.IBselect.fieldbyname('total').AsCurrency;
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('',dm.IBselect.fieldbyname('nota').AsString,' ',8)+' '+funcoes.CompletaOuRepete(FormatDateTime('dd/mm/yy',dm.IBselect.fieldbyname('data').AsDateTime),'',' ',8)+'  '+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',dm.IBselect.fieldbyname('total').AsCurrency),' ',18)+ '  ' + funcoes.CompletaOuRepete(dm.IBselect.fieldbyname('nome').AsString,'',' ',30) +#13+#10))));
      dm.IBselect.Next;
    end;

  dm.IBselect.Close;
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('TOTAL GERAL =>   '+FormatCurr('#,###,###0.00',totalGeral),'',' ',80)+#13+#10))));
  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',80)+#13+#10))));
  form19.ShowModal;
end;

procedure TForm2.NFeSimplificada1Click(Sender: TObject);
begin
  funcoes.emiteNfe('', true);
end;

procedure TForm2.ProdutosVencidos1Click(Sender: TObject);
var
  sim, prec, data, h1, ordem : string;
  tam, idx, atual : integer;
  produtos : TItensProduto;
  dataDeVencimento : TDateTime;
begin
  form19.RichEdit1.Clear;
  tam := 80;

  data := FormatDateTime('dd/mm/yy', IncMonth(form22.datamov));

  DATA := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data de Vencimento ?', data);
  if (DATA = '*') then exit;

  grupo := funcoes.dialogo('generico',0,'1234567890'+#8,50,false,'',Application.Title,'Qual o Grupo ?','');
  if grupo = '*' then exit;

  ordem := funcoes.dialogo('generico',0,'12',50,false,'S',Application.Title,'Qual a Ordem ? (1-CODIGO 2-DESCRICAO)','1');
  if ordem = '*' then exit;

  h1 := '';
  if grupo <> '' then begin
    h1 := ' and p.grupo = ' + StrNum(grupo);
  end;

  if ordem = '1' then ordem := 'i.cod'
    else ordem := 'p.nome';


  dataDeVencimento  := StrToDate(data);

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select i.cod, i.quant, p.nome, i.validade, i.nota, (p.quant + p.deposito) as estoque from item_entrada i left join produto p on (p.cod = i.cod) ' +
  'where i.validade >= ''01.01.2014'' '+h1+' order by '+ordem+', i.validade desc'; //jss-acrescentei ordem e campo validade
  //'where i.validade <= :data and i.validade >= ''01.01.2000'' order by i.cod, i.validade desc'; //jss-acrescentei ordem e campo validade
  //dm.IBselect.ParamByName('data').AsDate := dataDeVencimento;
  dm.IBselect.Open;
  dm.IBselect.FetchAll;

  produtos := TItensProduto.Create;
  addRelatorioForm19(funcoes.RelatorioCabecalho(funcoes.LerValorPGerais('empresa',form22.pgerais),'MERCADORIAS VENCIDAS ATE ' + DATA, TAM));
  addRelatorioForm19('CODIGO DESCRICAO                                 ESTOQUE     VENCIDO        NOTA' + CRLF);
  addRelatorioForm19(CompletaOuRepete('', '', '-', tam) + CRLF);

  while not dm.IBselect.Eof do
    begin
      //pega o código do produto atual
      atual := dm.IBselect.fieldbyname('cod').AsInteger;

      //busca o código atual na lista produtos
      idx := produtos.Find(atual);
      if idx = -1 then
        begin
          idx := produtos.Add(TregProd.Create);
          produtos[idx].cod    := atual;
          produtos[idx].nome   := dm.IBselect.fieldbyname('nome').AsString;
          produtos[idx].quant  := dm.IBselect.fieldbyname('estoque').AsCurrency; //estoque atual(loja + depósito)
          produtos[idx].total  := dm.IBselect.fieldbyname('estoque').AsCurrency; //inicializa unidades vencidas = estoque atual
          produtos[idx].codbar := dm.IBselect.fieldbyname('nota').AsString;
        end;

        //se essa entrada não está vencida, subtrai da quantidade de vencidos
        if dm.IBselect.fieldbyname('validade').AsDateTime > dataDeVencimento then
           produtos[idx].total  := produtos[idx].total - dm.IBselect.fieldbyname('quant').AsCurrency //quantidade de entrada
         else
           begin
             //se chegou aqui, econtrou a primeira entrada vencida, então pega a nota
             produtos[idx].codbar := dm.IBselect.fieldbyname('nota').AsString;

             //agora pula todos os demais registros desse produto
             while ((dm.IBselect.fieldbyname('cod').AsInteger = atual) and (not dm.IBselect.Eof))  do
               dm.IBselect.Next;
             if dm.IBselect.Eof then break;

             //volta um registro atrás
             dm.IBselect.Prior;
           end;

      dm.IBselect.Next;
    end;

  for idx := 0 to produtos.Count -1 do
    begin
      //pega só os itens que tem quantidade no estoque e que tem produtos vencidos
      if ((produtos[idx].quant > 0) and (produtos[idx].total > 0)) then
        addRelatorioForm19(CompletaOuRepete('', IntToStr(produtos[idx].cod), ' ', 6) + ' ' + CompletaOuRepete(LeftStr(produtos[idx].nome, 35), '', ' ', 35) +
        CompletaOuRepete('', FormatCurr('0.00', produtos[idx].quant), ' ', 14) + CompletaOuRepete('', FormatCurr('0.00', produtos[idx].total), ' ', 12)   +
        CompletaOuRepete('', produtos[idx].codbar, ' ', 12) + CRLF);
    end;

  dm.IBselect.Close;
  produtos.Free;
  addRelatorioForm19(CompletaOuRepete('', '', '-', tam) + CRLF);
  form19.RichEdit1.SelStart := 1;
  form19.ShowModal;
end;


end.









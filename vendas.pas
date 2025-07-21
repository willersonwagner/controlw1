unit vendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, JsEditData1, StdCtrls, JsEdit1, ExtCtrls, Buttons, Grids,
  DBGrids, DB,   ComCtrls, JsEditNumero1,
  JsEditInteiro1, DBClient, funcoesdav, provider, classes1, untnfceForm, ACBrUtil, FireDAC.Comp.Client;

type
  Ptr_Item = ^Item_venda;

  Item_venda = record
    codbar: String[15];
    cod: integer;
    nome: string[40];
    unid: string[6];
    quant: currency;
    p_venda: currency;
    total: currency;
    PercICMS: currency;
    VlrICMS: currency;
    DescICMS: currency;
    Aliq: string[2];
    Reducao: currency;
    CodAliq: Smallint;
    Total_Preco_Compra: currency; // Preço compra x quantidade
    Pis: string[1];
    Desconto: currency;
    Ncm: integer;
    p_compra: currency;
    Vlr_Frete: currency;
  end;

  TForm20 = class(TForm)
    Panel1: TPanel;
    DataSource2: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Timer1: TTimer;
    JsEditData1: JsEditData;
    JsEdit2: JsEditInteiro;
    JsEdit1: JsEditInteiro;
    JsEdit3: JsEditInteiro;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    desco: TLabel;
    Label7: TLabel;
    JsEditInteiro1: JsEditInteiro;
    Label8: TLabel;
    Label9: TLabel;
    Panel2: TPanel;
    LabelVenda: TLabel;
    panelTotal: TPanel;
    Panel4: TPanel;
    PanelValores: TPanel;
    labelValores: TLabel;
    total: TLabel;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Refori: TStringField;
    ClientDataSet1CODIGO: TIntegerField;
    ClientDataSet1grupo: TIntegerField;
    ClientDataSet1QUANT: TCurrencyField;
    ClientDataSet1PRECO: TCurrencyField;
    ClientDataSet1TOTAL: TCurrencyField;
    ClientDataSet1PRECO_ORIGI: TCurrencyField;
    ClientDataSet1TOT_ORIGI2: TCurrencyField;
    ClientDataSet1cod_seq: TIntegerField;
    ClientDataSet1minimo: TCurrencyField;
    ClientDataSet1p_total: TAggregateField;
    ClientDataSet1desc: TAggregateField;
    ClientDataSet1tot_p_ori: TAggregateField;
    ClientDataSet1DESCRICAO: TStringField;
    ClientDataSet1m2: TIntegerField;
    ClientDataSet1vendedor: TIntegerField;
    ClientDataSet1estado: TStringField;
    ClientDataSet1seqServ: TIntegerField;
    ClientDataSet1unid: TStringField;
    Timer2: TTimer;
    StaticText2: TPanel;
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure JsEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure ClientDataSet12AfterDelete(DataSet: TDataSet);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure JsEdit3KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure JsEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure JsEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure ClientDataSet12AfterPost(DataSet: TDataSet);
    procedure DBGrid2KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure JsEdit3Exit(Sender: TObject);
    procedure JsEdit3Enter(Sender: TObject);
    procedure JsEdit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure JsEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure DBGrid2Enter(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid2Exit(Sender: TObject);
    procedure ClientDataSet1AfterPost(DataSet: TDataSet);
    procedure ClientDataSet1AfterDelete(DataSet: TDataSet);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JsEdit1Enter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ClientDataSet1AfterOpen(DataSet: TDataSet);
    procedure Timer2Timer(Sender: TObject);

  private
    l1, l2, l3: TLabel;
    dinheiro, aprazoFormaDiferenteDe2 : string;
    entrada, avista, aprazo, troco, recebido, totVolumes, totVenda: currency;
    testa, EXPORTADO, tamanhoFonteTotal, tamFontDesc, CasasDecimaisQuantidade: Smallint;
    pedido, configUsuarioConfirmarPreco, NomeOrcamento, formaAlterada: string;
    bdSmall, vendaAPrazo: boolean;
    configUsuario, clienteNome, ultimaNota, ordemCompra, ENDE_ENTREGA, adicionarEntrega,
    tipoTrocaDescontoUsuario, ultOrcamentoRecuperado : String;
    semCliente: boolean;
    produtosServico: TStringList;
    podeGravarParcelamentoTabela : integer;
    MinimoPromoc : currency;
    function condicaoAumentarDBGRID2TrueZOOMnasDUAS : boolean ;
    procedure formataCamposPreco;
    procedure impNovo(TIPO1 : SMALLINT = 1);
    // function baixa
    function verificaSePodeVenderNegativo_X_NaVendaConfig11DoUsuario() : boolean;
    procedure adicionaEntregaTabela;
    procedure lancaDescontoPorFormaDePagamento(formapagamento: integer);
    function vendeProdutoM2: boolean;
    function somaValor(): currency;
    function precoPromocaoGrupo(codGrupo: integer; var cdsVenda: TClientDataSet)
      : currency;
    function buscaPreco(codigo: integer; quant1: currency): currency;
    procedure atualizaPrecoProduto(codigo: integer; preco1: currency);
    function buscaDesconto(cod: integer): currency;
    function buscaNomeCliente(): String;
    procedure insereEntrada(historico: String; vlrEnt: currency);
    procedure arrumaComponentes800();
    function somaDescontosVendaCDS(var tot_al: currency): currency;
    procedure FiltraCompraPorFornec();
    procedure escrveValor();
    procedure baixaProdutosDeOrdemDeServicos(commit: boolean = true);
    procedure habilitaDBGRIDs(const tr: boolean);
    procedure insereJustificativa_ibquery1_sem_commit(const nota, justi: String;
      dataJusti: TDateTime; const totVe, volumes: currency);
    procedure mostraDesconto(total22, desconto21: currency; aparece: boolean);
    function numReg: integer;
    procedure operacaoDeTroco(const valor: currency);
    function buscaCodigoBarras(opcao: integer = 0): String;
    function confirmaPrecoProduto(cod: String; var qtd, valor: String;
      opcao: Smallint; servico: boolean = false): string;
    procedure GeraParcelamento(cli123 : string);
    function gravaVenda : boolean;
    procedure gravaOrcamento;
    procedure gravaServico();
    procedure limpatela;
    function AchaFieldDbgrid(DB: TDBGrid; nome: string): integer;
    procedure ExcluiItemVenda();
    procedure gravaCompra;
    procedure RecuperaCompra(numCompra: string);
    procedure AddProdutoCDS_Compra(quanti, valor: currency);
    procedure AddProdutoCDS_Generico(cod: integer; quanti, valor: currency;
      permitirVendaNegativa: boolean = true);
    function somaDescontoVendaCDS: currency;
    function AdicionaListaSmall: boolean;
    procedure ordenaDatasetPorCampoBdgrid(campo, valor: String);
    procedure exclui_item_venda_dbgrid2;
    procedure alinhaComponentes();
    procedure buscaReferencia();
    procedure WMSysCommand(var Msg: TWMSysCommand);
    function geraCaptionTeclasDeAtalho(): String;
    procedure BuscaCodBar_F6_AutoPecas1;
    function validaVendedor() : boolean;
    procedure habilitaCamposFimVenda;
    { Private declarations }
  public

    ordenaCampos: boolean;
    decimaisPrecoUsuario : SmallInt;
    tamanho_nota, finalizouServico, fimVenda: integer;
    origem: integer;
    tipoV, CLIENTE_ENTREGA, CLIENTE_VENDA, condicaoSQL, numvenda: string;
    separaPecas, finaliza: boolean;
    Saiu, verificaCliente, Modo_Venda, Modo_Orcamento, atacado, Compra,
      saidaDeEstoque, separaVendaOrcamento: boolean;
    Parcelamento: TStringList;
    tipoVenda, codhis, cliente, ativo, novocod, desc, fim, ordem, justiSaida,
      COD_SERVICO, sqlVenda, campoEstoque: string;
    Desconto, total1, total_compras_a_prazo_cliente, total_A_Limitar,
      lim_compra, lim_atraso: Currency;
    minimo : double;
    ultimoCliente : String;
    function CalculaMinimoVendaCDS(var descDado: currency;var totOriginal: currency; var deuDesconto: boolean): currency;
    function CalculaMinimoVendaCDS1(var descDado: currency;var totOriginal: currency; var deuDesconto: boolean): currency;
    function buscaProdutoCDS(cod: String; Preco: currency; descri: string = '';
      m2: integer = 0): boolean;
    procedure recuperaServico(const nota: String);
    function ver_limites(CodUsu: string;
      AserAdicionadoNaContaDoClitente: currency): currency;
    function limitar_QTD_Estoque(quant: currency; cod: integer;
      buscaCDS: boolean = true): boolean;
    function adicioinaItem_Venda(cod: string; qtd: currency;
      Preco: currency = 0; abrirTabelaProduto: boolean = false;
      nome1: String = ''; vendedor: String = ''): boolean;
    procedure ImprimeNota(tipoNota: String = '');
    procedure BuscaCodBar_F6_AutoPecas(busc4: String; tipoBusca1: String = '');
    procedure lancaDescontoComDescItem;
    procedure lancaDescontoAtual;
    procedure lancaDescontoAtual_Antigo;
    procedure AddSegundaClienteDataSet(quanti, valor: currency;
      nome: String = ''; m2: integer = 0);
    procedure AddSegundaClienteDataSet_antigo(quanti, valor: double;
      nome: String = ''; m2: integer = 0);
    function VerificaForma_de_Pagamento_e_Prazo: Smallint;
    function RetornaString_Modo_Venda_ou_Orcamento: string;
    procedure SetaModo;
    procedure BuscaSelecao;
    procedure RecuperaOrcamento(numOrcamento: string);

    { Public declarations }
  end;

var
  Form20: TForm20;
  sair: boolean;
  procura: string;

  // const
  // : String = '|KG|ML|M|MP|MT|LT|M2|M3|';

implementation

uses Unit1, Math, localizar, entrasimples, func, formpagtoformulario,
  principal, subconsulta, Unit38, DateUtils, relatorio, imprime1,
  cadcliente, cadfornecedor, dm1, StrUtils, Unit2, Unit83, cadproduto, troco,
  Unit95;

{$R *.dfm}

procedure TForm20.baixaProdutosDeOrdemDeServicos(commit: boolean = true);
var
  quant: currency;
begin
  ClientDataSet1.First;
  while not ClientDataSet1.Eof do
  begin
    if (StrToCurrDef(produtosServico.Values
      [strnum(ClientDataSet1seqServ.AsString)], 0) -
      ClientDataSet1QUANT.AsCurrency) <> 0 then
    begin
      funcoes.baixaEstoque(ClientDataSet1CODIGO.AsString,
        (StrToCurrDef(produtosServico.Values
        [strnum(ClientDataSet1seqServ.AsString)], 0) -
        ClientDataSet1QUANT.AsCurrency), 1);
    end;

    ClientDataSet1.Next;
  end;

  if commit then
    if dm.bd.InTransaction then dm.bd.commit;
end;

procedure TForm20.recuperaServico(const nota: String);
var
  vend, vendOS: integer;
begin
  if not Assigned(produtosServico) then
    produtosServico := TStringList.Create;
  produtosServico.Clear;

  dm.IBselect.Close;
  dm.IBselect.SQL.Text :=
    'select codseq ,o.cod, o.quant, o.p_venda, p.p_venda1,p.codbar, o.total, p.nome, o.vendedor, p.unid from os_itens o left join produto p on (o.cod = p.cod) where nota = :nota order by data';
  dm.IBselect.ParamByName('nota').AsString := nota;
  dm.IBselect.Open;

  if dm.IBselect.IsEmpty then
  begin
    dm.IBselect.Close;
    exit;
  end;

  vendOS := 0;
  dm.IBselect1.Close;
  dm.IBselect1.SQL.Text := 'select vendedor from os_venda where nota = :nota';
  dm.IBselect1.ParamByName('nota').AsInteger := StrToIntDef(nota, 0);
  dm.IBselect1.Open;

  vendOS := dm.IBselect1.FieldByName('vendedor').AsInteger;
  dm.IBselect1.Close;

  while not dm.IBselect.Eof do
  begin
    vend := StrToInt(strnum(dm.IBselect.FieldByName('vendedor').AsString));
    if vend = 0 then
    begin
      vend := vendOS;
    end;

    produtosServico.Add(dm.IBselect.FieldByName('codseq').AsString + '=' +
      dm.IBselect.FieldByName('quant').AsString);

    ClientDataSet1.Insert;
    ClientDataSet1minimo.AsCurrency :=
      buscaDesconto(dm.IBselect.FieldByName('cod').AsInteger);
    ClientDataSet1CODIGO.AsString := dm.IBselect.FieldByName('cod').AsString;
    ClientDataSet1unid.AsString := dm.IBselect.FieldByName('unid').AsString;
    ClientDataSet1DESCRICAO.AsString := dm.IBselect.FieldByName('nome')
      .AsString;
    ClientDataSet1QUANT.AsCurrency := dm.IBselect.FieldByName('quant')
      .AsCurrency;
    ClientDataSet1PRECO.AsCurrency := dm.IBselect.FieldByName('p_venda')
      .AsCurrency;
    ClientDataSet1TOTAL.AsCurrency := dm.IBselect.FieldByName('total')
      .AsCurrency;
    ClientDataSet1TOT_ORIGI2.AsCurrency := dm.IBselect.FieldByName('total')
      .AsCurrency;
    ClientDataSet1Refori.AsString := dm.IBselect.FieldByName('codbar').AsString;
    ClientDataSet1estado.AsString := 'N';
    ClientDataSet1vendedor.AsInteger := vend;
    ClientDataSet1cod_seq.AsInteger := dm.IBselect.RecNo;
    ClientDataSet1seqServ.AsInteger := dm.IBselect.FieldByName('codseq')
      .AsInteger;
    ClientDataSet1m2.AsInteger := 0;
    ClientDataSet1.Post;
    dm.IBselect.Next;
  end;

  dm.IBselect.Close;
end;

procedure TForm20.gravaServico();
var
  vende: String;
  update: boolean;
begin
  if dm.bd.InTransaction then dm.bd.commit;
  //dm.IBQuery1.Transaction.StartTransaction;

  // baixaProdutosDeOrdemDeServicos(false);
  // primeiro baixa os produtos do estoque

  finalizouServico := 1;
  vende := '';
  dm.IBselect1.Close;
  dm.IBselect1.SQL.Text := 'select vendedor from os_venda where nota = :nota';
  dm.IBselect1.ParamByName('nota').AsString := COD_SERVICO;
  dm.IBselect1.Open;

  vende := dm.IBselect1.FieldByName('vendedor').AsString;
  if strnum(vende) = '0' then
    vende := form22.Pgerais.Values['codvendedor'];

  dm.IBselect1.Close;

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text :=
    'update or insert into os_venda(nota, total, data, cliente, vendedor)' +
    ' values(:nota, :total, :data, :cliente, :vendedor) matching(nota)';
  dm.IBQuery1.ParamByName('nota').AsString := COD_SERVICO;
  dm.IBQuery1.ParamByName('total').AsCurrency := total1;
  dm.IBQuery1.ParamByName('data').AsDateTime := form22.datamov;
  dm.IBQuery1.ParamByName('cliente').AsString := strnum(JsEdit3.Text);
  dm.IBQuery1.ParamByName('vendedor').AsString := strnum(vende);
  dm.IBQuery1.ExecSQL;

  ClientDataSet1.First;

  while not ClientDataSet1.Eof do
  begin
    if ClientDataSet1seqServ.AsString = '' then
    begin
      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Text :=
        'insert into OS_ITENS(nota, COD, QUANT, P_VENDA, TOTAL, vendedor, codseq, DATA)'
        + ' values(:nota, :COD, :QUANT, :P_VENDA, :TOTAL, :vendedor, gen_id(ositens, 1), :DATA)';
      dm.IBQuery1.ParamByName('nota').AsString := COD_SERVICO;
      dm.IBQuery1.ParamByName('COD').AsString := ClientDataSet1CODIGO.AsString;
      dm.IBQuery1.ParamByName('QUANT').AsCurrency := ClientDataSet1QUANT.AsCurrency;
      dm.IBQuery1.ParamByName('P_VENDA').AsCurrency := ClientDataSet1PRECO.AsCurrency;
      dm.IBQuery1.ParamByName('TOTAL').AsCurrency := ClientDataSet1TOTAL.AsCurrency;
      dm.IBQuery1.ParamByName('vendedor').AsString := strnum(JsEdit2.Text);
      dm.IBQuery1.ParamByName('data').AsDateTime := DateOf(form22.datamov) +
        TimeOf(NOW);
      dm.IBQuery1.ExecSQL;
    end;

    { if (StrToCurrDef(produtosServico.Values[strnum(ClientDataSet1seqServ.AsString)], 0) - dm.IBselect.FieldByName('quant').AsCurrency) <> 0 then begin
      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Text := 'update or insert into OS_ITENS(nota, COD, QUANT, P_VENDA, TOTAL, vendedor)' +
      ' values(:nota, :COD, :QUANT, :P_VENDA, :TOTAL, :vendedor) matching(nota, cod)';
      dm.IBQuery1.ParamByName('nota').AsString      := COD_SERVICO;
      dm.IBQuery1.ParamByName('COD').AsString       := ClientDataSet1CODIGO.AsString;
      dm.IBQuery1.ParamByName('QUANT').AsCurrency   := ClientDataSet1QUANT.AsCurrency;
      dm.IBQuery1.ParamByName('P_VENDA').AsCurrency := ClientDataSet1PRECO.AsCurrency;
      dm.IBQuery1.ParamByName('TOTAL').AsCurrency   := ClientDataSet1TOTAL.AsCurrency;
      dm.IBQuery1.ParamByName('vendedor').AsString  := strnum(JsEdit2.Text);
      dm.IBQuery1.ExecSQL;
      end; }

    ClientDataSet1.Next;
  end;

  dm.IBQuery1.Transaction.Commit;
end;

procedure TForm20.habilitaDBGRIDs(const tr: boolean);
begin
  DBGrid1.Enabled := tr;
  DBGrid2.Enabled := tr;
end;

procedure TForm20.insereJustificativa_ibquery1_sem_commit(const nota,
  justi: String; dataJusti: TDateTime; const totVe, volumes: currency);
begin
  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Clear;
  dm.IBQuery1.SQL.Add
    ('insert into justificativa(nota, justificativa, data, valor, volumes) values(:nota, :justi, :data, :valor, :volumes )');
  dm.IBQuery1.ParamByName('nota').AsInteger := StrToIntDef(nota, 0);
  dm.IBQuery1.ParamByName('justi').AsString := LeftStr(justi, 40);
  dm.IBQuery1.ParamByName('data').AsDateTime := dataJusti;
  dm.IBQuery1.ParamByName('valor').AsCurrency := totVe;
  dm.IBQuery1.ParamByName('volumes').AsCurrency := totVolumes;
  dm.IBQuery1.ExecSQL;
end;

function TForm20.geraCaptionTeclasDeAtalho(): String;
begin
  Result := '';

  if funcoes.buscaParamGeral(5, '') = 'S' then
    Result := Result + 'F1-Forma Pagamento'
  else
    Result := Result + 'F1-Calculadora';

  if Compra then
  begin
    Result := Result + '/F2-Recuperar Compra';
  end
  else
  begin
    Result := Result + '/F2-Modo Venda*Orçamento';
    Result := Result + '/F3-Recuperar Orçamento';
  end;

  if funcoes.buscaParamGeral(5, '') = 'S' then
  begin
    Result := Result + '/F4-Calculadora';
  end;

  Result := Result + '/F6-Busca por CodBar';

  if ((length(form22.Pgerais.Values['acessousu']) <= StrToIntDef(funcoes.buscaParamGeral(141, '2'), 2)) or (funcoes.LerConfig(form22.Pgerais.Values['configu'], 22) = 'S')) then Result := Result + '/F7-Ficha Prod';
  Result := Result + '/F8-Alternar Entre Tabelas';

  if funcoes.buscaParamGeral(13, '') = 'S' then
  begin
    Result := Result + '/F9 - Busca CodBar Série';
  end;

  if funcoes.buscaParamGeral(5, '') = 'S' then
  begin
    Result := Result + '/F9 - Equivalências';
  end;

  if Compra then
    Result := Result + '/F12-Filtrar por Fornec.';

end;

procedure TForm20.mostraDesconto(total22, desconto21: currency;
  aparece: boolean);
begin
  if aparece then
  begin
    total.Font.Size := tamFontDesc;
    // desco.Visible  := false;
    // Label9.Visible := true;
  end
  else
  begin
    total.Font.Size := tamanhoFonteTotal;
    escrveValor();
    // total.Caption := formataCurrency(StrToCurrDef(ClientDataSet1p_total.AsString, 0));
    // total.Caption   := 'R$ ' formataCurrency(total1);
    // total.Visible := true;
    // desco.Visible  := false;
    // Label6.Visible := true;
    // Label9.Visible := false;
    exit;
  end;

  // total22 := somaDescontoVendaCDS;
  total.Caption := '';
  total.Caption := 'Sub-Total' + funcoes.CompletaOuRepete('',
    formataCurrency(total22), '.', 13) + #13;
  if total22 = 0 then
    total.Caption := total.Caption + 'Desc(' +
      formataCurrency(funcoes.ArredondaFinanceiro(0, 2)) + '%)' +
      funcoes.CompletaOuRepete('', formataCurrency(desconto21), '.', 14) + #13
  else
    total.Caption := total.Caption + 'Desc(' +
      formataCurrency(funcoes.ArredondaFinanceiro(desconto21 / total22 * 100, 2)
      ) + '%)' + funcoes.CompletaOuRepete('', formataCurrency(desconto21), '.',
      14) + #13;
  total.Caption := total.Caption + 'Total...' + funcoes.CompletaOuRepete('',
    formataCurrency(total22 - desconto21), '.', 14) + #13;

  // Label9.Top  := DBGrid1.Height + DBGrid1.Top + 30;
  // Label9.Left := self.Width - Label9.Width - 30;
end;

function TForm20.numReg: integer;
begin
  Result := 1;
  if not ClientDataSet1.IsEmpty then
  begin
    Result := ClientDataSet1.RecordCount + 1;
  end;
end;

procedure TForm20.WMSysCommand(var Msg: TWMSysCommand);
begin
  if (Msg.CmdType = SC_MINIMIZE) then
    application.Minimize
  else
    inherited;
end;

function TForm20.buscaCodigoBarras(opcao: integer = 0): String;
var
  cod, qtd: string;
  quant: currency;
begin
  Result := '';
  qtd := '1';

  while true do
  begin
    cod := funcoes.dialogo('normal', 3, '', 60, true, '', 'ControlW',
      'Informe o Cód. de Barras:', '');
    if cod = '*' then
    begin
      Result := '*';
      exit;
    end;

    if opcao = 1 then
    begin
      if not dm.produto.Locate('codbar', strnum(cod), []) then
      begin
        ShowMessage('Código ' + cod + ' Não Encontrado!');
      end;

      exit;
    end;

    if funcoes.buscaParamGeral(34, '') = 'S' then
    begin
      qtd := funcoes.dialogo('numero', CasasDecimaisQuantidade, 'SN', CasasDecimaisQuantidade, false, 'S',
        'Control for Windows:', 'Quantidade:', '1,'+ CompletaOuRepete('','','0', CasasDecimaisQuantidade));
      if qtd = '*' then
        exit;
    end;

    quant := StrToCurrDef(qtd, 1);
    { dm.produtotemp.Close;
      dm.produtotemp.SQL.Clear;
      dm.produtotemp.SQL.Add('select p.codbar, p.cod from produto p left join codbarras c on (c.cod = p.cod) where (p.codbar = '+ QuotedStr( cod )+') or (c.codbar = '+QuotedStr( cod )+')');
      dm.produtotemp.Open; }

    dm.produtotemp.Close;
    dm.produtotemp.SQL.Clear;
    dm.produtotemp.SQL.Text := 'select codbar, cod from produto where codbar = '
      + QuotedStr(cod);
    dm.produtotemp.Open;

    if dm.produtotemp.IsEmpty then
    begin
      dm.produtotemp.Close;
      dm.produtotemp.SQL.Clear;
      dm.produtotemp.SQL.Text :=
        'select codbar, cod from codbarras where codbar = ' + QuotedStr(cod);
      dm.produtotemp.Open;
    end;

    if not dm.produtotemp.IsEmpty then
    begin
      adicioinaItem_Venda(dm.produtotemp.FieldByName('cod').AsString, quant);
    end
    else
      ShowMessage('Produto não Encontrado');

    dm.produtotemp.Close;

  end;
end;

procedure TForm20.operacaoDeTroco(const valor: currency);
var
  rece: string;
begin
  rece := funcoes.dialogo('numero', 0, 'SN', 0, false, 'S',
    'Control for Windows:', 'Qual o valor recebido?',
    FormatCurr('#,###,###0.00', valor));
  if (rece = '*') or (StrToCurrDef(rece, 0) = 0) then
  begin
    troco := 0;
    recebido := 0;
    exit;
  end;

  recebido := StrToCurr(rece);
  troco := recebido - valor;

  form86.pago.Caption := FormatCurr('#,###,###0.00', recebido);
  form86.total.Caption := FormatCurr('#,###,###0.00', total1);
  form86.troco.Caption := FormatCurr('#,###,###0.00', troco);
  form86.ShowModal;

  //ShowMessage('O valor do troco é: R$ ' + FormatCurr('#,###,###0.00', troco));
end;

procedure TForm20.buscaReferencia();
var
  temp, res: string;
begin
  temp := funcoes.dialogo('normal', 3, '', 60, true, '', 'ControlW',
    'Selecionar Por:', '');
  if temp = '*' then
    exit;

  res := '';

  dm.produtotemp.Close;
  dm.produtotemp.SQL.Clear;
  dm.produtotemp.SQL.Add
    ('select cod, refori from produto where upper(refori) like (' +
    QuotedStr(temp + '%') + ') order by ' + refori1);
  dm.produtotemp.Open;

  funcoes.FormataCampos(dm.produtotemp, 2, '', 3);

  if dm.produtotemp.IsEmpty then
  begin
    dm.produtotemp.Close;
    ShowMessage('Não encontrado');
    exit;
  end;

  res := dm.produtotemp.FieldByName('cod').AsString;
  funcoes.ordernaDataSetVenda(refori1, res, sqlVenda, DBGrid1, '',
    ordenaCampos);
  funcoes.BuscaResizeDBgrid(DBGrid1, 'FORM20');


  { form25 := tform25.Create(self);
    funcoes.CtrlResize(tform(form25));
    form25.DBGrid1.DataSource := dm.dsprodtemp;
    form25.ShowModal; }
end;

function TForm20.confirmaPrecoProduto(cod: String; var qtd, valor: String;
  opcao: Smallint; servico: boolean = false): string;
var
  porcDesc, p_venda, temp1, p_vendatemp: Double;
  tipoDesconto, podeDarAcrescimo, campo: String;
begin
  valor := '0';
  Result := '0';

  if opcao = 0 then begin
    qtd := funcoes.dialogo('numero', CasasDecimaisQuantidade, 'SN', CasasDecimaisQuantidade, false, 'S',
      'Control for Windows:', 'Quantidade:', '0,'+ CompletaOuRepete('','','0', CasasDecimaisQuantidade));
    if ((qtd = '*') or (StrToCurrDef(qtd, 0) = 0)) then
    begin
      valor := '*';
      Result := valor;
      exit;
    end;
  end;


  campo := 'p_venda';
  if atacado then
    campo := 'p_venda1 as p_venda';

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select desconto, ' + campo +
    '  from produto where cod = :cod');
  dm.IBselect.ParamByName('cod').AsString := cod;
  dm.IBselect.Open;

  porcDesc := StrToCurrDef(funcoes.LerConfig(form22.Pgerais.Values
    ['configu'], 0), 0);
  p_venda := dm.IBselect.FieldByName('p_venda').AsCurrency;
  p_vendatemp := p_venda;

  if funcoes.buscaParamGeral(55, 'N') = 'S' then
  begin
    if dm.IBselect.FieldByName('desconto').AsCurrency > 0 then
    begin
      porcDesc := dm.IBselect.FieldByName('desconto').AsCurrency;
    end;
  end;

  // calcula o minimo a partir do preco com o desconto maximo configurado na conta do usuario
  minimo := ArredondaFinanceiro(p_venda - ((p_venda * porcDesc) / 100), 2);

  dm.IBselect.Close;

  tipoDesconto := configUsuarioConfirmarPreco;
  if trim(tipoDesconto) = '' then
    tipoDesconto := 'N';
  podeDarAcrescimo := funcoes.LerConfig(form22.Pgerais.Values['configu'], 8);

  if servico then
  begin
    tipoDesconto := 'S';
    podeDarAcrescimo := 'S';
  end;

  if tipoDesconto = 'S' then begin
    fim := CurrToStr(p_venda);

    if funcoes.buscaParamGeral(5, 'N') = 'S' then
    begin
      avista := StrToCurrDef(funcoes.buscaParamGeral(28, ''), 0);
      aprazo := StrToCurrDef(funcoes.buscaParamGeral(29, ''), 0);

      if codhis = '1' then
        avista := ArredondaFinanceiro(p_venda - (p_venda * (avista / 100)), 2)
      else if StrToIntDef(codhis, 0) > 2 then
        avista := ArredondaFinanceiro(p_venda - (p_venda * (aprazo / 100)), 2)
      else
        avista := p_venda;
      fim := CurrToStr(avista);
      //fim := CurrToStr(p_venda);
    end;

    // fim := '-999999';
    while true do begin
      fim := funcoes.dialogo('numero', decimaisPrecoUsuario, '1234567890,.' + #8, decimaisPrecoUsuario, false, 'ok',
        'Control for Windows:', 'Confirme o Preço(Minimo: R$ ' +
        FormatCurr('#,###,###0.00', minimo) + ':', FormatCurr('###,##0.' + CompletaOuRepete('','','0',decimaisPrecoUsuario),
        StrToCurr(fim)));
      if fim = '*' then
      begin
        Result := fim;
        exit;
      end;

      temp1 := StrToFloatDef(fim, 0);

      if ((podeDarAcrescimo = 'S') and (temp1 > p_venda)) then
      begin
        break;
      end;

      if (((temp1 >= minimo) and (temp1 <= p_venda) and (temp1 > 0)) or
        ((temp1 > p_venda) and
        VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false)) then
      begin
        break;
      end;

      if ((temp1 < minimo) and (temp1 > 0) and
        (VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false)) then
      begin
        break;
      end;
    end;

    Result := FloatToStr(temp1);
    valor := FloatToStr(temp1);

   exit;
  end
  else if tipoDesconto = 'P' then
  begin
    desc := '99999999';
    while true do
    begin
      desc := funcoes.dialogo('numero', 0, '1234567890,.' + #8, 0, false, 'ok',
        'Control for Windows:', 'Qual o Percentual de Desconto (Máximo=' +
        FormatCurr('#,###,###0.000', porcDesc) + '%) (%)?:', '0,000');
      if desc = '*' then
      begin
        Result := desc;
        exit;
      end;

      if (StrToCurrDef(desc, 0) = porcDesc) then
        break;
      if ((StrToCurr(desc) > porcDesc) and
        (VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false)) then
        break;

      if (StrToCurr(desc) <= porcDesc) then
        break;
    end;

    temp1 := StrToFloatDef(desc, 0);
    Result := FloatToStr(ArredondaFinanceiro(p_venda - (p_venda * temp1 / 100), 2));
    valor := Result;
    exit;
  end
  else if tipoDesconto = 'X' then
  begin
    desc := '99999999';
    while true do
    begin
      desc := funcoes.dialogo('numero', 0, '1234567890,.' + #8, 0, false, 'ok',
        'Control for Windows:', 'Qual o Percentual de Desconto (Máximo=' +
        FormatCurr('#,###,###0.000', porcDesc) + '%) (%)?:', '0,000');
      if desc = '*' then
      begin
        Result := desc;
        exit;
      end;

      if (StrToCurrDef(desc, 0) = porcDesc) then
        break;
      if ((StrToCurr(desc) > porcDesc) and
        (VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false)) then
        break;

      if (StrToCurr(desc) <= porcDesc) then
        break;
    end;

    temp1 := StrToFloatDef(desc, 0);
    if temp1 = 0 then
      p_vendatemp := p_vendatemp
    else
      p_vendatemp := ArredondaFinanceiro(p_venda - (p_venda * temp1 / 100), 2);

    fim := '-999999';
    while true do
    begin
      // funcoes.dialogo('numero',3,'1234567890,.'+#8,3,false,'ok','Control for Windows:','Confirme o Preço(Minimo: R$ '+ FormatCurr('#,###,###0.00',minimo) + ':',FormatCurr('###,##0.000',p_venda));
      fim := funcoes.dialogo('numero', 3, '1234567890,.' + #8, 3, false, 'ok',
        'Control for Windows:', 'Confirme o Preço(Minimo: R$ ' +
        FormatCurr('#,###,###0.000', minimo) + ':',
        FormatCurr('###,##0.000', p_vendatemp));
      if fim = '*' then
      begin
        Result := fim;
        exit;
      end;

      temp1 := StrToFloatDef(fim, 0);

//       ShowMessage('minimo=' + FloatToStr(minimo) + #13 + 'p_vendatemp=' +  FloatToStr(p_vendatemp) +#13 +'p_venda=' + FloatToStr(p_venda) +
//      #13 + 'temp1=' + FloatToStr(temp1)+ #13 + #13 + FloatToStr(temp1) + ' >= ' + FloatToStr(minimo) +  ' and ' );

      if ((podeDarAcrescimo = 'S') and (temp1 > p_venda)) then
      begin
        break;
      end;


      if (((temp1 >= minimo) and (temp1 <= p_venda) and (temp1 > 0)) or
        ((temp1 > p_venda) and
        VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false)) then
      begin
        break;
      end;

      if ((temp1 < minimo) and (temp1 > 0) and
        (VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false)) then
      begin
        break;
      end;

      { if ((podeDarAcrescimo = 'S') and (temp1 > p_venda)) then
        break;
        if (((temp1 >= minimo) and (temp1 <= p_venda)) or
        ((temp1 > p_venda) and
        VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false)) then
        begin
        break;
        end;
        if ((temp1 < minimo) and
        (VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false)) then
        break; }

    end;

    Result := FloatToStr(temp1);
    valor := Result;
    exit;
  end
  else
  begin
    Result := '*';
    exit;
  end;

  Result := valor;
end;

{ function TForm20.confirmaPrecoProduto1(cod : String;var qtd , valor : String; opcao : smallint) : string;
  var
  temp : currency;
  seq  : integer;
  begin
  if opcao = 0 then
  begin
  qtd := funcoes.dialogo('numero',3,'SN',3,false,'S','Control for Windows:','Quantidade:','0,000');
  if (qtd = '*') or (StrToCurrDef(funcoes.ConverteNumerico(qtd),0) = 0) then
  begin
  valor := '*';
  exit;
  end;
  end;

  temp := 0;
  temp := ClientDataSet1PRECO_ORIGI.AsCurrency;
  minimo := temp - Arredonda(((temp * StrToCurrDef(funcoes.LerConfig(form22.Pgerais.Values['configu'],0), 0))/100),2);

  valor := '0';
  // repeticao se para mudar o preco do item na venda
  while true do //StrToCurrDef(ativo, 0) < minimo do
  begin
  valor := funcoes.dialogo('numero',3,'SN',3,false,'S','Control for Windows:','Confirme o Preço(Minimo: R$ '+ FormatCurr('#,###,###0.000',minimo) +'):',FormatCurr('#,###,###0.000', temp));
  if (valor = '*') then
  begin
  valor := '*';
  Result := valor;
  exit;
  end;
  if ((StrToCurrDef(valor, 0) >= minimo) or (VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false)) then Break;
  end;

  ClientDataSet1.Edit;
  ClientDataSet1.FieldByName('preco').AsCurrency := StrToCurrDef(valor, 0);
  ClientDataSet1.FieldByName('total').AsCurrency := Arredonda(ClientDataSet1.FieldByName('preco').AsCurrency * ClientDataSet1.FieldByName('quant').AsCurrency, 2);
  ClientDataSet1.Post;
  end; }

procedure TForm20.alinhaComponentes();
begin
  DBGrid2.Height := (StaticText2.Top) - (Label5.Top + Label5.Height);
  DBGrid2.Top := StaticText2.Top - DBGrid2.Height;

  panelTotal.Left := self.Width - panelTotal.Width - 50;
  panelTotal.Top := (DBGrid2.Top + DBGrid2.Height) - panelTotal.Height;
  Panel4.Top := panelTotal.Top - Panel4.Height;
  Panel4.Left := panelTotal.Left;

  PanelValores.Top := Panel4.Top - PanelValores.Height;
  PanelValores.Left := Panel4.Left;

  if DBGrid2.Width + DBGrid2.Left > panelTotal.Left then
  begin
    panelTotal.Left := DBGrid2.Width + DBGrid2.Left + 10;
    Panel4.Left := panelTotal.Left;
    PanelValores.Left := Panel4.Left;
  end;

  total.Font.Size := 48;
  tamanhoFonteTotal := total.Font.Size;
  tamFontDesc := 22;

  if screen.Width= 1024 then
  begin
    StaticText2.Font.Style := [];
    StaticText2.Font.Size  := 9;
    tamFontDesc := 14;
    DBGrid2.Font.Size := 7;
    DBGrid2.Font.Style := [];

    panelTotal.Width := screen.Width - (DBGrid2.Left + DBGrid2.Width) - 20;
    PanelValores.Width := panelTotal.Width;
    Panel4.Width := panelTotal.Width;
    tamanhoFonteTotal := 38;
    total.Font.Size := tamanhoFonteTotal;
  end;

  if screen.Width = 800 then
  begin
    StaticText2.Font.Style := [];
    StaticText2.Font.Size  := 7;
    panelTotal.Width := self.Width - DBGrid2.Width + DBGrid2.Left;
    Panel4.Width := panelTotal.Width;
    PanelValores.Width := panelTotal.Width;
    panelTotal.Left := DBGrid2.Width + DBGrid2.Left;
    Panel4.Left := panelTotal.Left;
    PanelValores.Left := Panel4.Left;

    DBGrid2.Font.Size := 6;
    DBGrid2.Repaint;

    total.Font.Size := 36;
    tamanhoFonteTotal := total.Font.Size;
    tamFontDesc := 14;
  end;

  // para quando o total sair da tela
  if (panelTotal.Left + panelTotal.Width) > self.Width then
  begin
    panelTotal.Width := panelTotal.Width - trunc(panelTotal.Width * 0.1);
    DBGrid2.Width := (self.Width - panelTotal.Width - 30);
    DBGrid2.Left := 2;
    panelTotal.Left := DBGrid2.Left + DBGrid2.Width + 5;
    Panel4.Width := panelTotal.Width;
    PanelValores.Width := panelTotal.Width;
    Panel4.Left := panelTotal.Left;
    PanelValores.Left := Panel4.Left;
  end;

  if screen.Width = 1024 then
  begin
    DBGrid2.Width := panelTotal.Left - 20;
  end;

end;

procedure TForm20.exclui_item_venda_dbgrid2;
begin
  if funcoes.dialogo('generico', 2, 'SN', 15, false, 'S', application.Title,
    'Deseja Excluir Todos os Itens Desta Nota (S/N)?', 'S') = 'S' then
  begin
    ClientDataSet1.EmptyDataSet;
    ClientDataSet1.Open;
    total.Caption := '0,00';
    ultOrcamentoRecuperado := '';
  end;
end;

procedure TForm20.ordenaDatasetPorCampoBdgrid(campo, valor: String);
var
  temp1, cod, campo1: string;
begin
  campo1 := DBGrid1.SelectedField.DisplayName;
  cod := DBGrid1.DataSource.DataSet.FieldByName('cod').AsString;

  //TFDQuery(DBGrid1.DataSource.DataSet).IndexFieldNames := campo1;
  dm.produto.IndexFieldNames := campo1;

  {DBGrid1.DataSource.DataSet.Locate('cod', cod, []);
  funcoes.FormataCampos(TFDQuery(DBGrid1.DataSource.DataSet), 2, '', 2);
  funcoes.OrdenaCamposVenda(funcoes.buscaParamGeral(1, ''));}
end;

function TForm20.AdicionaListaSmall: boolean;
var
  regDav: integer;
  qtd, tot: currency;
  vend: string;
begin
end;

function TForm20.somaDescontoVendaCDS: currency;
begin
  Result := 0;
  try
    ClientDataSet1.DisableControls;
    ClientDataSet1.First;
    while not ClientDataSet1.Eof do
    begin
      Result := Result + (ClientDataSet1TOT_ORIGI2.AsCurrency -
        ClientDataSet1TOTAL.AsCurrency);
      ClientDataSet1.Next;
    end;
    ClientDataSet1.First;
    ClientDataSet1.EnableControls;
  except
    ClientDataSet1.First;
    ClientDataSet1.EnableControls;
  end;
end;

function TForm20.CalculaMinimoVendaCDS(var descDado: currency;
  var totOriginal: currency; var deuDesconto: boolean): currency;
var
  porcMaxima, minimotemp, porcentMaior: currency;
begin
  Result := 0;
  descDado := 0;
  minimotemp := 0;
  totOriginal := 0;
  try
    ClientDataSet1.DisableControls;
    ClientDataSet1.First;
    while not ClientDataSet1.Eof do
    begin
      if (ClientDataSet1TOT_ORIGI2.AsCurrency -
        ClientDataSet1TOTAL.AsCurrency) >= 0 then
      begin
        Result := Result + ClientDataSet1TOT_ORIGI2.AsCurrency;
        descDado := descDado + (ClientDataSet1TOT_ORIGI2.AsCurrency -
          ClientDataSet1TOTAL.AsCurrency);

        if funcoes.buscaParamGeral(55, 'N') = 'S' then begin
          porcentMaior := StrToCurrDef(funcoes.LerConfig(form22.Pgerais.Values['configu'], 0), 0);

          if ClientDataSet1minimo.AsCurrency > porcentMaior then porcentMaior := ClientDataSet1minimo.AsCurrency;
          if funcoes.buscaDescontoProduto(ClientDataSet1CODIGO.AsInteger) > 0 then porcentMaior := funcoes.buscaDescontoProduto(ClientDataSet1CODIGO.AsInteger);

          //minimotemp := minimotemp + (Arredonda(ClientDataSet1TOT_ORIGI2.AsCurrency * (porcentMaior / 100), 2));
          minimotemp := minimotemp + (ClientDataSet1TOT_ORIGI2.AsCurrency * (porcentMaior / 100));
        end;
      end;

      totOriginal := totOriginal + ClientDataSet1TOT_ORIGI2.AsCurrency;

      ClientDataSet1.Next;
    end;

    deuDesconto := false;
    if descDado <> 0 then
      deuDesconto := true;

    if minimotemp > 0 then
    begin
      Result := minimotemp - descDado;

      ClientDataSet1.First;
      ClientDataSet1.EnableControls;
      exit;
    end;

    porcMaxima := StrToCurrDef
      (funcoes.LerConfig(form22.Pgerais.Values['configu'], 0), 0);
    // totVolumes é o desconto mmáximo que pode ser dado nesta venda
    totVolumes := funcoes.ArredondaTrunca((Result * porcMaxima) / 100, 2);

    Result := totVolumes - descDado;

    ClientDataSet1.First;
    ClientDataSet1.EnableControls;
    exit;
  except
    Result := 0;
    ClientDataSet1.First;
    ClientDataSet1.EnableControls;
  end;
end;

function TForm20.CalculaMinimoVendaCDS1(var descDado: currency;
  var totOriginal: currency; var deuDesconto: boolean): currency;
var
  porcMaxima, minimotemp, porcentMaior, acc: currency;
begin
  Result := 0;
  descDado := 0;
  minimotemp := 0;
  totOriginal := 0;
  try
    ClientDataSet1.DisableControls;
    ClientDataSet1.First;

    while not ClientDataSet1.Eof do begin
      //se colocou desconto por forma de pagamento F1
      if ((tipoTrocaDescontoUsuario = 'F')) then begin
        descDado := descDado + (ClientDataSet1TOT_ORIGI2.AsCurrency - ClientDataSet1TOTAL.AsCurrency);
        //somou os descontos que ja foram dados

        acc := (ClientDataSet1minimo.AsCurrency + StrToCurrDef(funcoes.LerConfig(configUsuario, 0), 0));
        if acc > 100 then acc := 100;
        
        acc := (ClientDataSet1PRECO_ORIGI.AsCurrency * (acc / 100));
        //soma os desconto maximo por unidade, desconto maximo por 1 unidade

        //ShowMessage(CurrToStr(acc));
        acc :=  ArredondaTrunca(ClientDataSet1QUANT.AsCurrency * acc, 2);
        //multiplica pela quantidade

        acc := acc - (ClientDataSet1TOT_ORIGI2.AsCurrency - ClientDataSet1TOTAL.AsCurrency);
        //ShowMessage(ClientDataSet1PRECO_ORIGI.AsString + #13 + ClientDataSet1minimo.AsString + #13 +'acc='+ CurrToStr(acc) + #13 + CurrToStr(descDado) + #13 + ClientDataSet1TOT_ORIGI2.AsString + #13 + ClientDataSet1TOTAL.AsString);


        acc := ArredondaTrunca(acc, 2);
        if acc < 0 then acc := 0;
        
        Result := Result + acc;
      end
      else begin
       if (ClientDataSet1TOT_ORIGI2.AsCurrency - ClientDataSet1TOTAL.AsCurrency) >= 0 then begin
        Result := Result + ClientDataSet1TOT_ORIGI2.AsCurrency;
        descDado := descDado + (ClientDataSet1TOT_ORIGI2.AsCurrency - ClientDataSet1TOTAL.AsCurrency);

        if funcoes.buscaParamGeral(55, 'N') = 'S' then begin
          porcentMaior := StrToCurrDef(funcoes.LerConfig(form22.Pgerais.Values['configu'], 0), 0);

          if ClientDataSet1minimo.AsCurrency > porcentMaior then porcentMaior := ClientDataSet1minimo.AsCurrency;
          if funcoes.buscaDescontoProduto(ClientDataSet1CODIGO.AsInteger) > 0 then porcentMaior := funcoes.buscaDescontoProduto(ClientDataSet1CODIGO.AsInteger);

          //minimotemp := minimotemp + (Arredonda(ClientDataSet1TOT_ORIGI2.AsCurrency * (porcentMaior / 100), 2));
          minimotemp := minimotemp + (ClientDataSet1TOT_ORIGI2.AsCurrency * (porcentMaior / 100));
        end;
       end;
      end;

      totOriginal := totOriginal + ClientDataSet1TOT_ORIGI2.AsCurrency;

      ClientDataSet1.Next;
    end;

    deuDesconto := false;
    if tipoTrocaDescontoUsuario = 'F' then begin
      ClientDataSet1.First;
      ClientDataSet1.EnableControls;
      exit;
    end;

    if descDado <> 0 then
      deuDesconto := true;

    if minimotemp > 0 then begin
      Result := minimotemp - descDado;

      ClientDataSet1.First;
      ClientDataSet1.EnableControls;
      exit;
    end;

    porcMaxima := StrToCurrDef
      (funcoes.LerConfig(form22.Pgerais.Values['configu'], 0), 0);
    // totVolumes é o desconto mmáximo que pode ser dado nesta venda
    totVolumes := funcoes.ArredondaTrunca((Result * porcMaxima) / 100, 2);

    Result := totVolumes - descDado;

    ClientDataSet1.First;
    ClientDataSet1.EnableControls;
    exit;
  except
    Result := 0;
    ClientDataSet1.First;
    ClientDataSet1.EnableControls;
  end;
end;

function TForm20.somaDescontosVendaCDS(var tot_al: currency): currency;
begin
  Result := 0;
  tot_al := 0;
  try
    ClientDataSet1.DisableControls;
    ClientDataSet1.First;
    while not ClientDataSet1.Eof do
    begin
      if ClientDataSet1PRECO_ORIGI.AsString = '' then
        Result := Result + 0
      else
      begin
        // Result := Result + (ClientDataSet1TOT_ORIGI2.AsCurrency - ClientDataSet1TOTAL.AsCurrency);
      end;

      Result := Result + (ClientDataSet1TOT_ORIGI2.AsCurrency -
        ClientDataSet1TOTAL.AsCurrency);
      tot_al := tot_al + ClientDataSet1TOT_ORIGI2.AsCurrency;
      ClientDataSet1.Next;
    end;
    ClientDataSet1.First;
    ClientDataSet1.EnableControls;
  except
    ClientDataSet1.First;
    ClientDataSet1.EnableControls;
  end;
end;

procedure TForm20.AddProdutoCDS_Generico(cod: integer; quanti, valor: currency;
  permitirVendaNegativa: boolean = true);
begin
  if DBGrid1.DataSource.DataSet.Locate('cod', cod, []) = false then
  begin
    MessageDlg('Produto Código ' + IntToStr(cod) + ' Não Foi Encontrado!',
      mtInformation, [mbok], 1);
    exit;
  end;

  if permitirVendaNegativa = false then
  begin
    if limitar_QTD_Estoque(quanti, cod) = false then
      exit;
  end;

  if buscaProdutoCDS(IntToStr(cod), valor, '', 0) then
  begin
    ClientDataSet1.Open;
    ClientDataSet1.Edit;
    ClientDataSet1QUANT.AsCurrency := ClientDataSet1QUANT.AsCurrency + quanti;
    ClientDataSet1TOTAL.AsCurrency := ClientDataSet1TOTAL.AsCurrency +
      trunca(quanti * valor, 2);
    ClientDataSet1TOT_ORIGI2.AsCurrency := ClientDataSet1TOT_ORIGI2.AsCurrency +
      trunca(quanti * dm.produto.FieldByName('preco').AsCurrency, 2);
    ClientDataSet1.Post;

    ClientDataSet1.IndexFieldNames := 'cod_seq';
  end
  else
  begin
    ClientDataSet1.Open;
    ClientDataSet1.Insert;
    ClientDataSet1minimo.AsCurrency := valor;
    ClientDataSet1CODIGO.AsInteger := dm.produto.FieldByName('cod').AsInteger;
    ClientDataSet1DESCRICAO.AsString :=
      dm.produto.FieldByName('descricao').AsString;
    ClientDataSet1unid.AsString := dm.produto.FieldByName('unid').AsString;
    ClientDataSet1Refori.AsString := dm.produto.FieldByName('codbar').AsString;
    ClientDataSet1QUANT.AsCurrency := quanti;
    ClientDataSet1PRECO.AsCurrency := valor;
    ClientDataSet1TOTAL.AsCurrency := trunca(quanti * valor, 2);
    ClientDataSet1PRECO_ORIGI.AsCurrency := dm.produto.FieldByName('preco')
      .AsCurrency;
    ClientDataSet1TOT_ORIGI2.AsCurrency :=
      trunca(quanti * dm.produto.FieldByName('preco').AsCurrency, 2);
    ClientDataSet1cod_seq.AsInteger := numReg;
    ClientDataSet1vendedor.AsInteger := StrToInt(strnum(JsEdit2.Text));
    ClientDataSet1estado.AsString := 'N';
    ClientDataSet1.Post;
  end;

  ClientDataSet1.Close;
  ClientDataSet1.Open;
  ClientDataSet1.Last;
end;

procedure TForm20.AddProdutoCDS_Compra(quanti, valor: currency);
begin
  if ClientDataSet1.Locate('codigo', dm.produto.FieldByName('cod').AsInteger, [])
  then
  begin
    ClientDataSet1.Open;
    ClientDataSet1.Edit;
    ClientDataSet1QUANT.AsCurrency := ClientDataSet1QUANT.AsCurrency + quanti;
    ClientDataSet1TOTAL.AsCurrency := ClientDataSet1TOTAL.AsCurrency +
      Arredonda(quanti * valor, 2);
    ClientDataSet1TOT_ORIGI2.AsCurrency := ClientDataSet1TOT_ORIGI2.AsCurrency +
      Arredonda(quanti * dm.produto.FieldByName('preco').AsCurrency, 2);
    ClientDataSet1.Post;

    ClientDataSet1.IndexFieldNames := 'cod_seq';
  end
  else
  begin
    ClientDataSet1.Open;
    ClientDataSet1.Insert;
    ClientDataSet1minimo.AsCurrency :=
      buscaDesconto(dm.produto.FieldByName('cod').AsInteger);
    ClientDataSet1CODIGO.AsInteger := dm.produto.FieldByName('cod').AsInteger;
    ClientDataSet1DESCRICAO.AsString :=
      dm.produto.FieldByName('descricao').AsString;

    dm.IBselect1.Close;
    dm.IBselect1.SQL.Text := 'select cod, unid from produto where cod = :cod';
    dm.IBselect1.ParamByName('cod').AsInteger := dm.produto.FieldByName('cod').AsInteger;
    dm.IBselect1.Open;

    ClientDataSet1unid.AsString := dm.IBselect1.FieldByName('unid').AsString;
    ClientDataSet1Refori.AsString := dm.produto.FieldByName('codbar').AsString;
    ClientDataSet1QUANT.AsCurrency := quanti;
    ClientDataSet1PRECO.AsCurrency := valor;
    ClientDataSet1TOTAL.AsCurrency := Arredonda(quanti * valor, 2);
    ClientDataSet1PRECO_ORIGI.AsCurrency := dm.produto.FieldByName('preco')
      .AsCurrency;
    ClientDataSet1TOT_ORIGI2.AsCurrency :=
      Arredonda(quanti * dm.produto.FieldByName('preco').AsCurrency, 2);
    ClientDataSet1cod_seq.AsInteger := numReg;
    ClientDataSet1vendedor.AsInteger := StrToInt(strnum(JsEdit2.Text));
    ClientDataSet1estado.AsString := 'N';
    ClientDataSet1.Post;
  end;

  ClientDataSet1.Close;
  ClientDataSet1.Open;
  ClientDataSet1.Last;

  dm.produto.Next;

end;

procedure TForm20.RecuperaCompra(numCompra: string);
var
  i: integer;
begin
  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add
    ('select cod, quant, p_compra from item_compra where nota = ' + numCompra);
  try
    dm.IBselect.Open;
  except
    ShowMessage('Ocorreu um Erro Inesperado. Por Favor Tente Novamente.');
    exit;
  end;

  dm.IBselect.FetchAll;
  i := dm.produto.RecNo - 1;
  dm.produto.DisableControls;
  dm.IBselect.First;
  while not dm.IBselect.Eof do
  begin
    dm.produto.Locate('cod', dm.IBselect.FieldByName('cod').AsString, []);
    AddProdutoCDS_Compra(dm.IBselect.FieldByName('quant').AsCurrency,
      dm.IBselect.FieldByName('p_compra').AsCurrency);
    dm.IBselect.Next;
  end;
  dm.produto.First;
  dm.produto.MoveBy(i);
  dm.produto.EnableControls;
  dm.IBselect.Close;
  tipoV := tipoV + 'C';
end;

procedure TForm20.RecuperaOrcamento(numOrcamento: string);
var
  i: integer;
  numvend, nome1, mult: String;
  quant, total : currency;
begin
  if funcoes.buscaParamGeral(120, '') = 'S' then begin
    mult := funcoes.dialogo('numero', 0, '', 2, False, 'X', Application.Title,'Confirme a Quantidade:', '1,00');
    if mult = '*' then mult := '1';
  end;

  if Contido('-'+numOrcamento+ '-',ultOrcamentoRecuperado) then begin
    MessageDlg('O Orçamento Não Pode ser Recuperado mais de 1 vez, Refaça a Operação!', TMsgDlgType.mtError, [mbOK], 1);
    exit;
  end
  else begin
    ultOrcamentoRecuperado := ultOrcamentoRecuperado + '-'+numOrcamento+ '-';
  end;


  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add
    ('select codhis from orcamento where nota = ' + numOrcamento);
  try
    dm.IBselect.Open;
  except
    ShowMessage('Ocorreu um Erro 1457 Inesperado. Por Favor Tente Novamente.');
    exit;
  end;

  if funcoes.buscaParamGeral(105, 'N') = 'S' then begin
    codhis := dm.IBselect.FieldByName('codhis').AsString;
    formaAlterada := codhis;
  end;


  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add
    ('select i.vendedor,i.cod, i.quant, i.p_venda as total, i.nome, p.quant as quanti, p.unid from '
    + 'item_orcamento i left join produto p on (p.cod = i.cod) where nota = ' +
    numOrcamento);
  try
    dm.IBselect.Open;
  except
    ShowMessage('Ocorreu um Erro Inesperado. Por Favor Tente Novamente.');
    exit;
  end;

  dm.IBselect.FetchAll;
  i := dm.produto.RecNo - 1;
  dm.produto.DisableControls;
  dm.IBselect.First;

  while not dm.IBselect.Eof do begin
    quant := dm.IBselect.FieldByName('quant').AsCurrency;
    total := dm.IBselect.FieldByName('TOTAL').AsCurrency;

    if ((funcoes.buscaParamGeral(120, '') = 'S') and (StrToCurrDef(mult, 1) <> 1)) then begin
      quant := quant * (StrToCurrDef(mult, 1));
      //total := total * (StrToCurrDef(mult, 1));
    end;


    nome1 := dm.IBselect.FieldByName('nome').AsString;
    // dm.produto.Locate('cod',dm.IBselect.fieldbyname('cod').AsString,[]);
    if dm.IBselect.FieldByName('quanti').AsCurrency - dm.IBselect.FieldByName
      ('quant').AsCurrency < 1 then
    begin
      if MessageDlg('Atenção! ' + dm.IBselect.FieldByName('nome').AsString +
        ' Sem Estoque, Recuperar?', mtConfirmation, [mbyes, mbNo], 0) = mrYes
      then
      begin
        adicioinaItem_Venda(dm.IBselect.FieldByName('cod').AsString,
          quant,
          total, true, nome1,
          dm.IBselect.FieldByName('vendedor').AsString);
      end;
    end
    else
      adicioinaItem_Venda(dm.IBselect.FieldByName('cod').AsString,
        quant,
        total, true, nome1,
        dm.IBselect.FieldByName('vendedor').AsString);
    dm.IBselect.Next;
  end;

  { dm.IBselect.Close;
    dm.IBselect.SQL.Text := 'select vendedor from ORCAMENTO where nota = :nota';
    dm.IBselect.ParamByName('nota').AsString := numOrcamento;
    dm.IBselect.Open;

    if dm.IBselect.fieldbyname('vendedor').AsInteger <> 0 then
    begin
    JsEdit2.Text := dm.IBselect.fieldbyname('vendedor').AsString;
    end; }

  JsEdit2.Enabled := false;

  dm.IBselect.Close;

  dm.produto.First;
  dm.produto.MoveBy(i);
  dm.produto.EnableControls;
  tipoV := tipoV + 'O';
end;

procedure TForm20.ImprimeNota(tipoNota: String = '');
var
  tipo, txt, refOriCodbar, imprRef, imprRefxx, codigo1, nomevol, tmp: string;
  total, sub, entrada, total_item, desc1, p_venda0, subtotal: currency;
  i, l, tam, tamDescri, linFim: integer;
  descItem, ImpSepara: boolean;
begin
  
  if separaPecas and (separaVendaOrcamento = true) then
  begin
    exit; // aqui é separa peças de orçamento
  end;

  if separaPecas and (separaVendaOrcamento = false) then
  begin
    ImpSepara := true; // aqui é separa peças

    if funcoes.buscaParamGeral(75, 'N') = 'N' then
    begin
      exit;
    end;
  end;

  tipo := form22.Pgerais.Values['nota'];
  if tipoNota <> '' then
    tipo := tipoNota;

  txt := form22.Pgerais.Values['mens'];
  if funcoes.buscaParamGeral(73, 'N') = 'S' then
    txt := '';

  if Modo_Venda then begin
    pedido := 'VENDA';

  end
  else
  begin
    pedido := 'ORCAMENTO';
    txt := form22.Pgerais.Values['mensORC'];
  end;



  if Compra then
  begin
    tipo := 'COM';
    pedido := 'COMPRA';
    txt := '';
  end;

  if (Compra = false) and (Modo_Venda = false) and (Modo_Orcamento = true) then
  begin
    if funcoes.LerConfig(form22.Pgerais.Values['configu'], 9) = 'N' then
      exit;

    if funcoes.LerConfig(form22.Pgerais.Values['configu'], 9) = 'X' then
    begin
      if contido('CAMALEAO', UpperCase(form22.Pgerais.Values['empresa'])) then begin

        tmp := funcoes.dialogo('generico', 0, 'SN' + #8, 50, true, 'S', application.Title, 'Deseja Separar as Peças do Orçamento ? S-SIM N-NAO', '');
        if tmp = 'N' then begin
           imprime1.imprime.impOrcamentoSegundaImp := 'N';
        end;


      end
      else begin
        if MessageDlg('Deseja Imprimir o Orçamento ?', mtConfirmation,[mbyes, mbNo], 1) = idno then exit;
      end;
    end;

  end;

  if Modo_Orcamento then
  begin
    if tipo = 'D' then
      tipo := 'T';
  end;

  if tipoNota = '' then
    form19.RichEdit1.Clear;

  if tipo='DAV' then
    begin
    if funcoes.LerConfig(form22.Pgerais.Values['conf_ter'], 3) <> '' then
    begin
    //Termica elgin ou bematech
    imprime.fontDif := true;
    imprime.tamaFonte := StrToIntDef(funcoes.LerConfig(form22.Pgerais.Values['conf_ter'], 3), 11);
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',tamanho_nota)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('NOTA: '+novocod,'',' ',tamanho_nota)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('VENDEDOR: '+JsEdit2.Text+'-'+copy(funcoes.BuscaNomeBD(dm.ibquery1,'nome','vendedor','where cod='+JsEdit2.Text),1,10),'',' ',tamanho_nota)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('FORMA PAGTO: '+ codhis + '-' + (funcoes.BuscaNomeBD(dm.ibquery1,'nome','formpagto','where cod='+codhis)), '', ' ',tamanho_nota)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('DATA: ' + FormatDateTime('DD/MM/YYYY', StrToDate(JsEditData1.Text)), '',' ',tamanho_nota)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('VALOR:' + FormatCurr('#,###,###0.00',total1),'',' ',tamanho_nota)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',tamanho_nota)+#13+#10))));
  //  imprime.textx('texto.txt');
    exit;
    end;

    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',tamanho_nota)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(' NOTA: '+novocod,'  VENDEDOR: '+JsEdit2.Text+'-'+copy(funcoes.BuscaNomeBD(dm.ibquery1,'nome','vendedor','where cod='+JsEdit2.Text),1,10),' ',tamanho_nota)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('FORMA PAGTO: '+codhis+'-'+(funcoes.BuscaNomeBD(dm.ibquery1,'nome','formpagto','where cod='+codhis))+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('DATA: '+FormatDateTime('DD/MM/YY',StrToDate(JsEditData1.Text))+' VALOR:'+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',total1),' ',11)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',tamanho_nota)+#13+#10))));

  //  imprime.textx('texto.txt');
    exit;
   end;

   if tipo='D' then
    begin
    if funcoes.LerConfig(form22.Pgerais.Values['conf_ter'], 3) <> '' then
    begin
    //Termica elgin ou bematech
    imprime.fontDif := true;
    imprime.tamaFonte := StrToIntDef(funcoes.LerConfig(form22.Pgerais.Values['conf_ter'], 3), 11);
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',tamanho_nota)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('NOTA: '+novocod,'',' ',tamanho_nota)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('VENDEDOR: '+JsEdit2.Text+'-'+copy(funcoes.BuscaNomeBD(dm.ibquery1,'nome','vendedor','where cod='+JsEdit2.Text),1,10),'',' ',tamanho_nota)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('FORMA PAGTO: '+ codhis + '-' + (funcoes.BuscaNomeBD(dm.ibquery1,'nome','formpagto','where cod='+codhis)), '', ' ',tamanho_nota)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('DATA: ' + FormatDateTime('DD/MM/YYYY', StrToDate(JsEditData1.Text)), '',' ',tamanho_nota)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('VALOR:' + FormatCurr('#,###,###0.00',total1),'',' ',tamanho_nota)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',tamanho_nota)+#13+#10))));
    imprime.textx('texto.txt');
    exit;
    end;

    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',tamanho_nota)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(' NOTA: '+novocod,'  VENDEDOR: '+JsEdit2.Text+'-'+copy(funcoes.BuscaNomeBD(dm.ibquery1,'nome','vendedor','where cod='+JsEdit2.Text),1,10),' ',tamanho_nota)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('FORMA PAGTO: '+codhis+'-'+(funcoes.BuscaNomeBD(dm.ibquery1,'nome','formpagto','where cod='+codhis))+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('DATA: '+FormatDateTime('DD/MM/YY',StrToDate(JsEditData1.Text))+' VALOR:'+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',total1),' ',11)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',tamanho_nota)+#13+#10))));

    imprime.textx('texto.txt');
    exit;
   end;


  if tipo = 'D' then
  begin
    if not contido(form22.Pgerais.Values['nota'], 'ETD') then
    begin
      tam := 78;
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
        + #10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar((funcoes.CompletaOuRepete('| ' + pedido + ' Nr:' + novocod
        + '     PAGTO: ' + codhis + '-' + (funcoes.BuscaNomeBD(dm.IBQuery1,
        'nome', 'formpagto', 'where cod=' + codhis)),
        'EMISSAO: ' + FormatDateTime('dd/mm/yy', form22.datamov) + ' ' +
        FormatDateTime('hh:mm:ss', NOW) + ' |', ' ', tam) + #13 + #10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
        + #10))));
      if Desconto <> 0 then
      begin
        form19.RichEdit1.Perform(EM_REPLACESEL, 1,
          Longint(PChar((funcoes.CompletaOuRepete('|',
          funcoes.CompletaOuRepete('Sub-Total:', FormatCurr('#,###,###0.00',
          total), '.', 28) + ' |', ' ', tam) + #13 + #10))));

        if Desconto > 0 then
          Desconto := 0;
        form19.RichEdit1.Perform(EM_REPLACESEL, 1,
          Longint(PChar((funcoes.CompletaOuRepete('|',
          funcoes.CompletaOuRepete('Desconto(' + FormatCurr('#,###,###0.00',
          (Desconto * 100) / total) + '%):', FormatCurr('#,###,###0.00',
          Desconto), '.', 28) + ' |', ' ', tam) + #13 + #10))));
      end;

      if {contido(funcoes.LerConfig(form22.Pgerais.Values['configu'], 3), 'XS')
        and} (txt <> '') then
      begin
        form19.RichEdit1.Perform(EM_REPLACESEL, 1,
          Longint(PChar((funcoes.CompletaOuRepete('|OBS: ' + txt, '|', ' ',
          tam) + #13 + #10))));
        form19.RichEdit1.Perform(EM_REPLACESEL, 1,
          Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
          + #10))));
        try
          funcoes.atualizaMensagemUsuario(txt, novocod);
        except
        end;
      end;

      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar((funcoes.CompletaOuRepete('| Volumes: ' +
        funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00', sub), ' ', 9),
        funcoes.CompletaOuRepete('Total:', FormatCurr('#,###,###0.00', total1),
        '.', 28) + ' |', ' ', tam) + #13 + #10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
        + #10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar(('| Vendedor: ' + funcoes.CompletaOuRepete
        (copy(JsEdit2.Text + '-' + funcoes.BuscaNomeBD(dm.IBQuery1, 'nome',
        'vendedor', 'where cod=' + JsEdit2.Text), 1, 16), '|', ' ',
        17) + funcoes.CompletaOuRepete('Recebido Por: ', '|', ' ', 49) + #13
        + #10))));

      if StrToInt(strnum(codhis)) = 2 then
      begin
        form19.RichEdit1.Perform(EM_REPLACESEL, 1,
          Longint(PChar(('| Vencimento: ' +
          CompletaOuRepete(FormatDateTime('DD/MM/YY',
          StrToDateDef(Parcelamento.Values['vencto'], NOW)), '|', ' ',
          15) + CompletaOuRepete('', '|', ' ', 49) + #13 + #10))));
        dm.IBQuery1.Close;
      end;

      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
        + #10))));
      exit;
    end;

    if form22.Pgerais.Values['nota'] = 'E' then
    begin
      tam := 30;
      addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', tam) + CRLF);
      addRelatorioForm19(funcoes.CompletaOuRepete('NOTA: ' + novocod,
        FormatDateTime('DD/MM/YY', form22.datamov), ' ', tam) + CRLF);
      addRelatorioForm19('PAGTO: ' + codhis + '-' +
        (funcoes.BuscaNomeBD(dm.IBQuery1, 'nome', 'formpagto',
        'where cod=' + codhis)) + CRLF);
      addRelatorioForm19('VALOR:' + funcoes.CompletaOuRepete('',
        FormatCurr('0.00', total1), ' ', 11) + CRLF);
      addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', tam) + CRLF);
      exit;
    end;

    if funcoes.LerConfig(form22.Pgerais.Values['conf_ter'], 3) <> '' then
    begin
      imprime.negrito :=
        iif(funcoes.LerConfig(form22.Pgerais.Values['conf_ter'], 4) = 'S',
        true, false);
      imprime.fontDif := true;
      imprime.tamaFonte :=
        StrToIntDef(funcoes.LerConfig(form22.Pgerais.Values
        ['conf_ter'], 3), 11);
      addRelatorioForm19(' ' + #13 + #10);
    end;

    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('', '', '-', tamanho_nota)
      + CRLF))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('NOTA: ' + novocod,
      '  VENDEDOR: ' + JsEdit2.Text + '-' +
      copy(funcoes.BuscaNomeBD(dm.IBQuery1, 'nome', 'vendedor',
      'where cod=' + JsEdit2.Text), 1, 10), ' ', tamanho_nota) + CRLF))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((CRLF))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar(('FORMA PAGTO: ' + codhis + '-' +
      (funcoes.BuscaNomeBD(dm.IBQuery1, 'nome', 'formpagto',
      'where cod=' + codhis)) + CRLF))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((CRLF))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar(('DATA: ' + FormatDateTime('DD/MM/YY', form22.datamov) +
      ' VALOR:' + funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00',
      total1), ' ', 11) + CRLF))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('', '', '-', tamanho_nota)
      + CRLF))));
    { form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('-' + CRLF))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('-' + CRLF))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('-' + CRLF)))); }

    // imprime.textx('texto.txt');

    if tipoNota <> '' then
      exit;
  end;

  if tipo = 'L' then
  begin
    tam := 78;
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('', '', '-', tam) + CRLF))));
    addRelatorioForm19
      ('*  *    *    *    *   S E M    V A L O R    F I S C A L   *    *    *     *  *'
      + CRLF);
    // imprRef := funcoes.buscaParamGeral(54, 'N');
    imprRef := funcoes.LerConfig(form22.Pgerais.Values['configu'], 10);
    // txt := '';


    if funcoes.LerConfig(form22.Pgerais.Values['configu'], 3) = 'S' then
    begin
      txt := funcoes.dialogo('not', 70, '', 200, false, '',
        'Mensagem no Pedido', 'Confirme:', txt);
      if txt = '*' then
        txt := '';
      // txt := 'OBS: ' + txt;
    end;

    if ((funcoes.LerConfig(form22.Pgerais.Values['configu'], 3) = 'X') and (Contido('ORCAMEN', pedido))) then
    begin
      txt := funcoes.dialogo('not', 70, '', 200, false, '',
        'Mensagem no Pedido1', 'Confirme:', txt);
      if txt = '*' then
        txt := '';
      // txt := 'OBS: ' + txt;
    end;

    refOriCodbar := ' refori ';

    try
      if funcoes.buscaParamGeral(49, '') = 'S' then
        refOriCodbar := ' codbar as refori ';
    except
    end;

    total := 0;
    dm.IBQuery2.Close;
    dm.IBQuery2.SQL.Clear;
    dm.IBQuery2.SQL.Add('select * from registro');
    dm.IBQuery2.Open;

    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete(#18 + '+', '+', '-', tam) + #13
      + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| ' + pedido + ' Nr:' + novocod +
      '     PAGTO: ' + codhis + '-' + (funcoes.BuscaNomeBD(dm.IBQuery1, 'nome',
      'formpagto', 'where cod=' + codhis)), 'EMISSAO: ' + JsEditData1.Text + ' '
      + FormatDateTime('hh:mm:ss', NOW) + ' |', ' ', tam) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
      + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| ' + form22.Pgerais.Values
      ['empresa'], 'CNPJ: ' + dm.IBQuery2.FieldByName('cnpj').AsString + ' |',
      ' ', tam) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| ' + dm.IBQuery2.FieldByName
      ('ende').AsString + '  - ' + dm.IBQuery2.FieldByName('bairro').AsString,
      '|', ' ', tam) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| Fone: ' +
      dm.IBQuery2.FieldByName('telres').AsString + ' ' + dm.IBQuery2.FieldByName
      ('telcom').AsString + '  ' + dm.IBQuery2.FieldByName('cid').AsString +
      ' - ' + dm.IBQuery2.FieldByName('est').AsString,
      'IE: ' + dm.IBQuery2.FieldByName('ies').AsString + ' |', ' ', tam) + #13
      + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| Obs: ' +
      dm.IBQuery2.FieldByName('obs').AsString, '|', ' ', tam) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
      + #10))));
    // form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(,'|',' ',35) ,'CPF/CNPJ: ' +  + #13 + #10))));
    addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.CompletaOuRepete
      (copy('| Cliente: ' + iif(funcoes.buscaParamGeral(27, '') = 'N',
      JsEdit3.Text + '-', '') + funcoes.BuscaNomeBD(dm.IBQuery1, 'nome',
      'cliente', 'where cod=' + JsEdit3.Text), 1, 38), '', ' ', 39) +
      funcoes.CompletaOuRepete('|CPF/CNPJ: ' + funcoes.BuscaNomeBD(dm.IBQuery1,
      'cnpj', 'cliente', 'where cod=' + JsEdit3.Text), '', ' ', 37), '|', ' ',
      tam) + #13 + #10);
    if funcoes.buscaParamGeral(27, '') = 'S' then
    begin
      dm.IBQuery4.Close;
      dm.IBQuery4.SQL.Clear;
      dm.IBQuery4.SQL.Add
        ('select cod, nome, ende, bairro, cid, obs, cnpj, tipo, ies, tel,telres,telcom from cliente where cod = :cod');
      dm.IBQuery4.ParamByName('cod').AsString := JsEdit3.Text;
      dm.IBQuery4.Open;

      addRelatorioForm19(funcoes.CompletaOuRepete
        (funcoes.CompletaOuRepete(copy('| Endereco: ' + dm.IBQuery4.FieldByName
        ('ende').AsString, 1, 38), '', ' ', 39) + funcoes.CompletaOuRepete
        ('|INSC. EST.: ' + dm.IBQuery4.FieldByName('ies').AsString, '', ' ',
        37), '|', ' ', tam) + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete
        (funcoes.CompletaOuRepete(copy('| Bairro: ' + dm.IBQuery4.FieldByName
        ('bairro').AsString + ' - ' + dm.IBQuery4.FieldByName('cid').AsString,
        1, 38), '', ' ', 39) + funcoes.CompletaOuRepete('|Codigo: ' +
        dm.IBQuery4.FieldByName('cod').AsString, '', ' ', 37), '|', ' ', tam) +
        #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete
        (funcoes.CompletaOuRepete(copy('| Obs: ' + dm.IBQuery4.FieldByName
        ('obs').AsString, 1, 38), '', ' ', 39) + funcoes.CompletaOuRepete
        ('|Fone: ' + dm.IBQuery4.FieldByName('telres').AsString, '', ' ', 37),
        '|', ' ', tam) + #13 + #10);
      dm.IBQuery4.Close;
    end;
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
      + #10))));
    // form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|Codigo| Unid |  Qtd. |    Descricao das Mercadorias     |Unitario|    Total   |'+#13+#10))));
    // form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('+------+------+-------+----------------------------------+--------+------------+'+#13+#10))));
    // form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|Codigo| Unid |  Qtd.   |  Descricao das Mercadorias     |Unitario|   Total  |'+#13+#10))));
    // form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('+------+------+---------+--------------------------------+--------+----------+'+#13+#10))));

    { addRelatorioForm19('%'+
      '|Codigo| Unid. | Qtd.   |  Descricao das Mercadorias            | Unitario |   Total   | Referencia      | Localizacao     |' + CRLF);
      addRelatorioForm19('+------+-------+--------+---------------------------------------+----------+-----------+-----------------+-----------------+' + CRLF); }

    // addRelatorioForm19('%'+
    // '| Codigo | Unid. | Qtd.   |  Descricao das Mercadorias              | Unitario |   Total   | Referencia      | Localizacao     |' + CRLF);
    // addRelatorioForm19('+--------+-------+--------+-----------------------------------------+----------+-----------+-----------------+-----------------+' + CRLF);
    addRelatorioForm19
      ('%' + '| Codigo | Unid. | Qtd.     |  Descricao das Mercadorias              | Unitario|   Total  | Referencia      | Localizacao     |'
      + CRLF);
    addRelatorioForm19
      ('+--------+-------+----------+-----------------------------------------+---------+----------+-----------------+-----------------+'
      + CRLF);

    dm.IBQuery2.Close;
    ClientDataSet1.DisableControls;
    ClientDataSet1.First;
    sub := 0;
    total := 0;
    while not ClientDataSet1.Eof do
    begin
      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Clear;
      dm.IBQuery1.SQL.Add('select unid, codbar, nome, localiza,' + refOriCodbar
        + ' from produto where cod=' + ClientDataSet1.FieldByName('codigo')
        .AsString);
      dm.IBQuery1.Open;
      sub := sub + ClientDataSet1.FieldByName('quant').AsCurrency;

      // p_venda0 := IfThen(ClientDataSet1PRECO.AsCurrency > ClientDataSet1PRECO_ORIGI.AsCurrency, ClientDataSet1PRECO.AsCurrency, ClientDataSet1PRECO_ORIGI.AsCurrency);
      // totVenda := IfThen(ClientDataSet1TOT_ORIGI2.AsCurrency > ClientDataSet1TOTAL.AsCurrency, ClientDataSet1TOT_ORIGI2.AsCurrency, ClientDataSet1TOTAL.AsCurrency);

      p_venda0 := ClientDataSet1PRECO.AsCurrency;
      totVenda := ClientDataSet1TOTAL.AsCurrency;

      if Modo_Orcamento then
      begin
        if imprRef = 'S' then
        begin
          imprRefxx := copy(dm.IBQuery1.FieldByName('refori').AsString, 1, 17);
        end
        else
          imprRefxx := '';
      end
      else
      begin
        imprRefxx := copy(dm.IBQuery1.FieldByName('refori').AsString, 1, 17);
      end;

      addRelatorioForm19('|' + funcoes.CompletaOuRepete('',
        ClientDataSet1.FieldByName('codigo').AsString + '|', ' ', 9) +
        funcoes.CompletaOuRepete('', dm.IBQuery1.FieldByName('unid').AsString +
        '|', ' ', 8) + funcoes.CompletaOuRepete('', FormatCurr('0.00',
        ClientDataSet1.FieldByName('quant').AsCurrency) + '|', ' ', 11) +
        funcoes.CompletaOuRepete(copy(dm.IBQuery1.FieldByName('nome').AsString,
        1, 40), '|', ' ', 42) + funcoes.CompletaOuRepete('',
        FormatCurr('0.00', p_venda0) + '|', ' ', 10) + funcoes.CompletaOuRepete
        ('', FormatCurr('0.00', totVenda) + '|', ' ', 11) +

        funcoes.CompletaOuRepete(imprRefxx, '|', ' ', 18) +
        funcoes.CompletaOuRepete(copy(dm.IBQuery1.FieldByName('localiza')
        .AsString, 1, 18), '|', ' ', 18) + #13 + #10);

      // form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|'+funcoes.CompletaOuRepete('', ClientDataSet1.fieldbyname('codigo').AsString+'|',' ',7)+funcoes.CompletaOuRepete('',dm.ibquery1.fieldbyname('unid').AsString+'|',' ',7)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',ClientDataSet1.fieldbyname('quant').AsCurrency)+'|',' ',10)+funcoes.CompletaOuRepete(copy(dm.ibquery1.fieldbyname('nome').AsString,1,32),'|',' ',33)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00', ClientDataSet1.fieldbyname('preco').AsCurrency)+'|',' ',9)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00', ClientDataSet1.fieldbyname('total').AsCurrency)+'|',' ',11)+#13+#10))));
      // form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|'+funcoes.CompletaOuRepete('',ClientDataSet1.fieldbyname('codigo').AsString+'|',' ',7)+funcoes.CompletaOuRepete('',dm.ibquery1.fieldbyname('unid').AsString+'|',' ',7)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.000',ClientDataSet1.fieldbyname('quant').AsCurrency)+'|',' ',8)+funcoes.CompletaOuRepete(copy(dm.ibquery1.fieldbyname('nome').AsString,1,34),'|',' ',35)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',ClientDataSet1.fieldbyname('preco').AsCurrency)+'|',' ',9)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',ClientDataSet1.fieldbyname('total').AsCurrency)+'|',' ',13)+#13+#10))));
      // total := total + ClientDataSet1.fieldbyname('total').AsCurrency;
      total := total + totVenda;
      ClientDataSet1.Next;
    end;
    dm.IBQuery1.Close;
    ClientDataSet1.First;
    ClientDataSet1.EnableControls;

    addRelatorioForm19('&');

    try
      if funcoes.ExisteParcelamento(novocod) and
        (funcoes.buscaParamGeral(20, '') = 'S') then
      // (form22.Pgerais.Strings[20] = 'S') then
      begin
        form19.RichEdit1.Perform(EM_REPLACESEL, 1,
          Longint(PChar
          (('|      |      |       |                                  |        |          |'))
          ));
        funcoes.ImprimeParcelamento('|      |      |       |    ',
          '    |        |          |', FormatCurr('#,###,###0.00',
          StrToCurr(Parcelamento.Values['entrada'])), novocod);
      end;
    except
      on e: exception do
      begin
        gravaErrosNoArquivo(e.Message, 'Form20', '808',
          'NotaMedia - ImprimeNota');
      end;
    end;

    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
      + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('|',
      funcoes.CompletaOuRepete('Sub-Total:', FormatCurr('#,###,###0.00', total),
      '.', 28) + ' |', ' ', tam) + #13 + #10))));
    if Desconto > 0 then
      Desconto := 0;
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('|',
      funcoes.CompletaOuRepete('Desconto(' + FormatCurr('#,###,###0.00',
      (Desconto * 100) / total) + '%):', FormatCurr('#,###,###0.00', Desconto),
      '.', 28) + ' |', ' ', tam) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| Volumes: ' +
      funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00', sub), ' ', 9),
      funcoes.CompletaOuRepete('Total:', FormatCurr('#,###,###0.00', total1),
      '.', 28) + ' |', ' ', tam) + #13 + #10))));

    if (funcoes.LerConfig(form22.Pgerais.Values['configu'], 3) = 'S') and
      (txt <> '') then
    begin
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
        + #10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar((funcoes.CompletaOuRepete('|OBS: ' + txt, '|', ' ',
        tam) + #13 + #10))));
      try
        funcoes.atualizaMensagemUsuario(txt, novocod);
      except
      end;
    end;


    if ((funcoes.LerConfig(form22.Pgerais.Values['configu'], 3) = 'X') and
      (txt <> '') AND (Contido('ORCAMENT', PEDIDO))) then
    begin
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
        + #10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar((funcoes.CompletaOuRepete('|OBS: ' + txt, '|', ' ',
        tam) + #13 + #10))));
     { try
        funcoes.atualizaMensagemUsuario(txt, novocod);
      except
      end;}
    end;
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
      + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar(('| Vendedor: ' + funcoes.CompletaOuRepete(copy(JsEdit2.Text
      + '-' + funcoes.BuscaNomeBD(dm.IBQuery1, 'nome', 'vendedor',
      'where cod=' + JsEdit2.Text), 1, 16), '|', ' ',
      17) + funcoes.CompletaOuRepete('Recebido Por: ', '|', ' ', 49) + #13
      + #10))));

    if StrToInt(strnum(codhis)) = 2 then
    begin
      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Text :=
        'select vencimento as data from contasreceber where nota = :nota order by vencimento';
      dm.IBQuery1.ParamByName('nota').AsString := novocod;
      dm.IBQuery1.Open;

      if dm.IBQuery1.FieldByName('data').AsDateTime >= StrToDate('01/01/2020') then begin

      addRelatorioForm19('| Vencimento: ' + CompletaOuRepete(FormatDateTime
        ('DD/MM/YY', dm.IBQuery1.FieldByName('data').AsDateTime), '|', ' ',
        15) + CompletaOuRepete('', '|', ' ', 49) + #13 + #10);
      dm.IBQuery1.Close;
      end
      else begin
      addRelatorioForm19('|             ' + CompletaOuRepete('', '|', ' ', 15) + CompletaOuRepete('', '|', ' ', 49) + #13 + #10);
      end;
    end;

    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
      + #10))));

    { exit;





      total := 0;
      dm.IBQuery2.Close;
      dm.IBQuery2.SQL.Clear;
      dm.IBQuery2.SQL.Add('select * from registro');
      dm.IBQuery2.Open;


      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+ CRLF))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('| '+pedido+' Nr:'+novocod+'     PAGTO: '+codhis+'-'+(funcoes.BuscaNomeBD(dm.ibquery1,'nome','formpagto','where cod='+codhis)),'EMISSAO: '+JsEditData1.Text+' |',' ',80)+ CRLF))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+ CRLF))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('| '+form22.Pgerais.Values['empresa'],'CNPJ: '+dm.IBQuery2.fieldbyname('cnpj').AsString+' |',' ',80)+ CRLF))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('| '+dm.IBQuery2.fieldbyname('ende').AsString+'  - '+dm.IBQuery2.fieldbyname('bairro').AsString,'|',' ',80)+ CRLF))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('| Fone: '+dm.IBQuery2.fieldbyname('telres').AsString+'       '+dm.IBQuery2.fieldbyname('telcom').AsString+ '  '+ dm.IBQuery2.fieldbyname('cid').AsString+' - '+dm.IBQuery2.fieldbyname('est').AsString,'IE: '+dm.IBQuery2.fieldbyname('ies').AsString+' |',' ',80)+ CRLF))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('| Obs: '+dm.IBQuery2.FieldByName('obs').AsString,'|',' ',80)+ CRLF))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+ CRLF))));
      //  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(,'|',' ',35) ,'CPF/CNPJ: ' +  + #13 + #10))));
      addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.CompletaOuRepete(copy('| Cliente: ' + JsEdit3.Text + '-' +funcoes.BuscaNomeBD(dm.ibquery1,'nome','cliente','where cod=' + JsEdit3.Text), 1, 40), '', ' ', 41) + funcoes.CompletaOuRepete('|CPF/CNPJ: ' + funcoes.BuscaNomeBD( dm.ibquery1, 'cnpj', 'cliente', 'where cod=' + JsEdit3.Text) , '', ' ', 37), '|',' ',80) + CRLF);

      if ConfParamGerais.Strings[27] = 'S' then
      begin
      dm.IBQuery4.Close;
      dm.IBQuery4.SQL.Clear;
      dm.IBQuery4.SQL.Add('select nome, ende, bairro, cid, obs, iif(tipo = 1, cpf, cnpj) as cpf, cnpj, tipo, ies, tel,telres,telcom from cliente where cod = :cod');
      dm.IBQuery4.ParamByName('cod').AsString := JsEdit3.Text;
      dm.IBQuery4.Open;

      addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.CompletaOuRepete(copy('| Endereco: ' + dm.IBQuery4.fieldbyname('ende').AsString,1,40), '', ' ', 41) + funcoes.CompletaOuRepete('|INSC. EST.: ' + dm.IBQuery4.fieldbyname('cpf').AsString , '', ' ', 37), '|',' ',80) + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.CompletaOuRepete(copy('| Bairro: ' + dm.IBQuery4.fieldbyname('bairro').AsString + ' - ' + dm.IBQuery4.fieldbyname('cid').AsString, 1, 40), '', ' ', 41) + funcoes.CompletaOuRepete('|Codigo: ' + dm.IBQuery4.fieldbyname('ies').AsString , '', ' ', 37),'|',' ',80) + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.CompletaOuRepete(copy('| Obs: ' + dm.IBQuery4.fieldbyname('obs').AsString, 1, 40) , '', ' ', 41) + funcoes.CompletaOuRepete('|Fone: ' + dm.IBQuery4.fieldbyname('tel').AsString , '', ' ', 37),'|',' ',80) + #13 + #10);
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
      dm.IBQuery4.Close;
      end
      else form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));

      test := 1;
      //form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#15 + ''))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#15+'| Codigo | Unid. | Qtd. | Descricao das Mercadorias |Unitario|  Total  | Referencia | Localizacao |'+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('+--------+-------+------+---------------------------+--------+---------+------------+-------------+'+#13+#10))));

      dm.IBQuery2.Close;
      dm.IBQuery2.SQL.Clear;
      dm.IBQuery2.SQL.Add('select * from item_venda where nota='+novocod);
      dm.IBQuery2.Open;
      dm.IBQuery2.First;
      sub := 0;
      total := 0;
      while not dm.IBQuery2.Eof do
      begin
      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Clear;
      dm.IBQuery1.SQL.Add('select codbar, unid, nome, refori, localiza from produto where cod='+dm.IBQuery2.fieldbyname('cod').AsString);
      dm.IBQuery1.Open;
      total := total + dm.IBQuery2.fieldbyname('total').AsCurrency;
      sub := sub + dm.IBQuery2.fieldbyname('quant').AsCurrency;
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|'+funcoes.CompletaOuRepete('',dm.IBQuery2.fieldbyname('cod').AsString+'|',' ',9)+funcoes.CompletaOuRepete('',dm.ibquery1.fieldbyname('unid').AsString+'|',' ',8)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.000',dm.IBQuery2.fieldbyname('quant').AsCurrency)+'|',' ',7)+funcoes.CompletaOuRepete(copy(dm.ibquery1.fieldbyname('nome').AsString,1,27),'|',' ',28)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',dm.ibquery2.fieldbyname('p_venda').AsCurrency)+'|',' ',9)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',dm.IBQuery2.fieldbyname('total').AsCurrency)+'|',' ',10)+funcoes.CompletaOuRepete(copy(dm.IBQuery1.fieldbyname('refori').AsString,1,13),'|',' ',13)+funcoes.CompletaOuRepete(copy(dm.IBQuery1.fieldbyname('localiza').AsString,1,13),'|',' ',14)+#13+#10))));
      dm.IBQuery2.Next;
      end;
      dm.IBQuery1.Close;

      try
      if funcoes.ExisteParcelamento(novocod) and (ConfParamGerais.Strings[20] = 'S') then //(form22.Pgerais.Strings[20] = 'S') then
      begin
      //'|        |       |      |                           |        |         |            |             |'
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|        |       |      |                           |        |         |            |             |'))));
      funcoes.ImprimeParcelamento('|        |       |      |',' |        |         |            |             |',FormatCurr('#,###,###0.00',StrToCurr(Parcelamento.Values['entrada'])),novocod);
      end;
      except
      on e:exception do
      begin
      gravaErrosNoArquivo(e.Message, 'Form20', '808', 'NotaMedia - ImprimeNota');
      end;
      end;

      if form19.RichEdit1.Lines.Count < 50 then
      begin
      for i := form19.RichEdit1.Lines.Count to 50 do
      begin
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|'+funcoes.CompletaOuRepete('','|',' ',9)+funcoes.CompletaOuRepete('','|',' ',8)+funcoes.CompletaOuRepete('','|',' ',7)+funcoes.CompletaOuRepete('','|',' ',28)+funcoes.CompletaOuRepete('','|',' ',9)+funcoes.CompletaOuRepete('','|',' ',10)+funcoes.CompletaOuRepete('','|',' ',13)+funcoes.CompletaOuRepete('','|',' ',14)+#13+#10))));
      end;
      end;
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((#18+funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|',funcoes.CompletaOuRepete('Sub-Total:',FormatCurr('#,###,###0.00',total),'.',28)+' |',' ',80)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('|',funcoes.CompletaOuRepete('Desconto('+FormatCurr('#,###,###0.00',(desconto * 100)/ total)+'%):',FormatCurr('#,###,###0.00',desconto),'.',28)+' |',' ',80)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('| Volumes: '+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',sub),' ',9),funcoes.CompletaOuRepete('Total:',FormatCurr('#,###,###0.00',total1),'.',28)+' |',' ',80)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('| Vendedor: '+funcoes.CompletaOuRepete(copy(JsEdit2.Text+'-'+funcoes.BuscaNomeBD(dm.ibquery1,'nome','vendedor','where cod='+JsEdit2.Text),1,16),'|',' ',17)+funcoes.CompletaOuRepete('Recebido Por: ','|',' ',51)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('| Vencimento: '+funcoes.CompletaOuRepete(FormatDateTime('DD/MM/YY',StrToDate(JsEditData1.Text)),'|',' ',15)+funcoes.CompletaOuRepete('','|',' ',51)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
      //imprime.textx('texto.txt'); }
  end;

  if tipo = 'A' then
  begin
    total := 0;
    dm.IBQuery2.Close;
    dm.IBQuery2.SQL.Clear;
    dm.IBQuery2.SQL.Add('select * from registro');
    dm.IBQuery2.Open;

    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', 80) + #13
      + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| ' + pedido + ' Nr:' + novocod +
      '     PAGTO: ' + codhis + '-' + (funcoes.BuscaNomeBD(dm.IBQuery1, 'nome',
      'formpagto', 'where cod=' + codhis)), 'EMISSAO: ' + JsEditData1.Text +
      ' |', ' ', 80) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', 80) + #13
      + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| ' + form22.Pgerais.Values
      ['empresa'], 'CNPJ: ' + dm.IBQuery2.FieldByName('cnpj').AsString + ' |',
      ' ', 80) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| ' + dm.IBQuery2.FieldByName
      ('ende').AsString + '  - ' + dm.IBQuery2.FieldByName('bairro').AsString,
      '|', ' ', 80) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| Fone: ' +
      dm.IBQuery2.FieldByName('telres').AsString + '  ' +
      dm.IBQuery2.FieldByName('telcom').AsString + '  ' +
      dm.IBQuery2.FieldByName('cid').AsString + ' - ' + dm.IBQuery2.FieldByName
      ('est').AsString, 'IE: ' + dm.IBQuery2.FieldByName('ies').AsString + ' |',
      ' ', 80) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| Obs: ' +
      dm.IBQuery2.FieldByName('obs').AsString, '|', ' ', 80) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', 80) + #13
      + #10))));
    // form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(,'|',' ',35) ,'CPF/CNPJ: ' +  + #13 + #10))));
    addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.CompletaOuRepete
      (copy('| Cliente: ' + JsEdit3.Text + '-' + funcoes.BuscaNomeBD
      (dm.IBQuery1, 'nome', 'cliente', 'where cod=' + JsEdit3.Text), 1, 40), '',
      ' ', 41) + funcoes.CompletaOuRepete('|CPF/CNPJ: ' +
      funcoes.BuscaNomeBD(dm.IBQuery1, 'cnpj', 'cliente',
      'where cod=' + JsEdit3.Text), '', ' ', 37), '|', ' ', 80) + #13 + #10);

    if funcoes.buscaParamGeral(27, '') = 'S' then
    begin
      dm.IBQuery4.Close;
      dm.IBQuery4.SQL.Clear;
      dm.IBQuery4.SQL.Add
        ('select nome, ende, bairro, cid, obs, iif(tipo = 1, cpf, cnpj) as cpf, cnpj, tipo, ies, tel,telres,telcom from cliente where cod = :cod');
      dm.IBQuery4.ParamByName('cod').AsString := JsEdit3.Text;
      dm.IBQuery4.Open;

      addRelatorioForm19(funcoes.CompletaOuRepete
        (funcoes.CompletaOuRepete(copy('| Endereco: ' + dm.IBQuery4.FieldByName
        ('ende').AsString, 1, 40), '', ' ', 41) + funcoes.CompletaOuRepete
        ('|INSC. EST.: ' + dm.IBQuery4.FieldByName('cpf').AsString, '', ' ',
        37), '|', ' ', 80) + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete
        (funcoes.CompletaOuRepete(copy('| Bairro: ' + dm.IBQuery4.FieldByName
        ('bairro').AsString + ' - ' + dm.IBQuery4.FieldByName('cid').AsString,
        1, 40), '', ' ', 41) + funcoes.CompletaOuRepete('|Codigo: ' +
        dm.IBQuery4.FieldByName('ies').AsString, '', ' ', 37), '|', ' ', 80) +
        #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete
        (funcoes.CompletaOuRepete(copy('| Obs: ' + dm.IBQuery4.FieldByName
        ('obs').AsString, 1, 40), '', ' ', 41) + funcoes.CompletaOuRepete
        ('|Fone: ' + dm.IBQuery4.FieldByName('tel').AsString, '', ' ', 37), '|',
        ' ', 80) + #13 + #10);
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', 80) + #13
        + #10))));
      dm.IBQuery4.Close;
    end
    else
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', 80) + #13
        + #10))));

    test := 1;
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((#15 + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar
      (('| Codigo | Cod. Barras |Unid. | Qtd. | Descricao das Mercadorias |Desconto |Unitario |   Total   |'
      + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar
      (('+--------+-------------+------+------+---------------------------+---------+---------+-----------+'
      + #13 + #10))));

    dm.IBQuery2.Close;
    sub := 0;
    total := 0;
    ClientDataSet1.DisableControls;
    ClientDataSet1.First;
    while not ClientDataSet1.Eof do
    begin
      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Clear;
      dm.IBQuery1.SQL.Add('select unid, nome, codbar from produto where cod=' +
        ClientDataSet1.FieldByName('codigo').AsString);
      dm.IBQuery1.Open;
      // total := total + ClientDataSet1.fieldbyname('total').AsCurrency;
      total := total + ClientDataSet1TOT_ORIGI2.AsCurrency;
      sub := sub + ClientDataSet1.FieldByName('quant').AsCurrency;
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar(('|' + funcoes.CompletaOuRepete('',
        ClientDataSet1.FieldByName('codigo').AsString + '|', ' ',
        9) + funcoes.CompletaOuRepete('', dm.IBQuery1.FieldByName('codbar')
        .AsString + '|', ' ', 14) + funcoes.CompletaOuRepete('',
        dm.IBQuery1.FieldByName('unid').AsString + '|', ' ',
        7) + funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.000',
        ClientDataSet1.FieldByName('quant').AsCurrency) + '|', ' ',
        7) + funcoes.CompletaOuRepete(copy(dm.IBQuery1.FieldByName('nome')
        .AsString, 1, 27), '|', ' ', 28) + funcoes.CompletaOuRepete('',
        FormatCurr('#,###,###0.00', 0) + '|', ' ',
        10) + funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00',
        ClientDataSet1.FieldByName('preco').AsCurrency) + '|', ' ',
        10) + funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00',
        ClientDataSet1.FieldByName('total').AsCurrency) + '|', ' ', 12) + #13
        + #10))));
      ClientDataSet1.Next;
    end;
    ClientDataSet1.EnableControls;
    dm.IBQuery1.Close;

    try
      if funcoes.ExisteParcelamento(novocod) and
        (funcoes.buscaParamGeral(20, '') = 'S') then
      // (form22.Pgerais.Strings[20] = 'S') then
      begin
        // |        |             |      |      |                           |         |         |           |
        form19.RichEdit1.Perform(EM_REPLACESEL, 1,
          Longint(PChar
          (('|      |      |       |                                  |        |            |'))
          ));

        funcoes.ImprimeParcelamento('|      |      |       |    ',
          '    |        |            |', FormatCurr('#,###,###0.00',
          StrToCurr(Parcelamento.Values['entrada'])), novocod);
      end;
    except
      on e: exception do
      begin
        gravaErrosNoArquivo(e.Message, 'Form20', '808',
          'NotaMedia - ImprimeNota');
      end;
    end;

    if form19.RichEdit1.Lines.Count < 50 then
    begin
      for i := form19.RichEdit1.Lines.Count to 50 do
      begin
        form19.RichEdit1.Perform(EM_REPLACESEL, 1,
          Longint(PChar(('|' + funcoes.CompletaOuRepete('', '|', ' ',
          9) + funcoes.CompletaOuRepete('', '|', ' ',
          14) + funcoes.CompletaOuRepete('', '|', ' ',
          7) + funcoes.CompletaOuRepete('', '|', ' ',
          7) + funcoes.CompletaOuRepete('', '|', ' ',
          28) + funcoes.CompletaOuRepete('', '|', ' ',
          10) + funcoes.CompletaOuRepete('', '|', ' ',
          10) + funcoes.CompletaOuRepete('', '|', ' ', 12) + #13 + #10))));
      end;
    end;
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((#18 + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', 80) + #13
      + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('|',
      funcoes.CompletaOuRepete('Sub-Total:', FormatCurr('#,###,###0.00', total),
      '.', 28) + ' |', ' ', 80) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('|',
      funcoes.CompletaOuRepete('Desconto(' + FormatCurr('#,###,###0.00',
      (Desconto * 100) / total) + '%):', FormatCurr('#,###,###0.00', Desconto),
      '.', 28) + ' |', ' ', 80) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| Volumes: ' +
      funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00', sub), ' ', 9),
      funcoes.CompletaOuRepete('Sub-Total:', FormatCurr('#,###,###0.00',
      total1), '.', 28) + ' |', ' ', 80) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', 80) + #13
      + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar(('| Vendedor: ' + funcoes.CompletaOuRepete(copy(JsEdit2.Text
      + '-' + funcoes.BuscaNomeBD(dm.IBQuery1, 'nome', 'vendedor',
      'where cod=' + JsEdit2.Text), 1, 16), '|', ' ',
      17) + funcoes.CompletaOuRepete('Recebido Por: ', '|', ' ', 51) + #13
      + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar(('| Vencimento: ' + funcoes.CompletaOuRepete
      (FormatDateTime('DD/MM/YY', form22.datamov), '|', ' ',
      15) + funcoes.CompletaOuRepete('', '|', ' ', 51) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', 80) + #13
      + #10))));

    // imprime.textx('texto.txt');

  end;

  if tipo = 'COM' then
  begin
    //if form22.Pgerais.Values['nota'] = 'B' then begin
    if funcoes.LerConfig(form22.Pgerais.Values['conf_ter'], 16) = 'S' then begin
      funcoes.imprimeCompraFortesA4(novocod, 3);
      exit;
    end;


    tipo := funcoes.dialogo('generico', 0, 'SN', 0, false, 'S',
      'Control for Windows:', 'Imprime os Preços das Mercadorias? S/N', 'N');
    if tipo = '*' then
      exit;

    tam := 78;
    total := 0;
    l := 48;
    linFim := StrToIntDef(funcoes.LerConfig(form22.Pgerais.Values
      ['conf_ter'], 9), 50);

    if funcoes.buscaParamGeral(5, '') = 'S' then
    begin
      tamDescri := 44;
      tam := 78;
    end
    else
    begin
      tamDescri := StrToIntDef
        (funcoes.LerConfig(form22.Pgerais.Values['conf_ter'], 8), 35);
      tam := tam - 35;
      tam := tam + tamDescri;
    end;

    dm.IBQuery2.Close;
    dm.IBQuery2.SQL.Clear;
    dm.IBQuery2.SQL.Add('select * from registro');
    dm.IBQuery2.Open;
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| PEDIDO DE COMPRA Nr:' + novocod
      + '     PAGTO: ' + codhis + '-' + (funcoes.BuscaNomeBD(dm.IBQuery1,
      'nome', 'formpagto', 'where cod=' + codhis)),
      'EMISSAO: ' + JsEditData1.Text + ' |', ' ', tam) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
      + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| ' + dm.IBQuery2.FieldByName
      ('nome').AsString, 'CNPJ: ' + dm.IBQuery2.FieldByName('cnpj').AsString +
      ' |', ' ', tam) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| ' + dm.IBQuery2.FieldByName
      ('ende').AsString + '  - ' + dm.IBQuery2.FieldByName('bairro').AsString,
      'CEP: ' + dm.IBQuery2.FieldByName('cep').AsString + '|', ' ', tam) + #13
      + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| Fone: ' +
      dm.IBQuery2.FieldByName('telres').AsString + '  Cel: ' +
      dm.IBQuery2.FieldByName('telcom').AsString + '  ' +
      dm.IBQuery2.FieldByName('cid').AsString + ' - ' + dm.IBQuery2.FieldByName
      ('est').AsString, 'IE: ' + dm.IBQuery2.FieldByName('ies').AsString + ' |',
      ' ', tam) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| Obs: ' +
      dm.IBQuery2.FieldByName('obs').AsString,
      'SUFRAMA: ' + LeftStr(dm.IBQuery2.FieldByName('suframa').AsString,
      13) + '|', ' ', tam) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
      + #10))));

    dm.IBQuery1.Close;
    dm.IBQuery1.SQL.Clear;
    dm.IBQuery1.SQL.Add
      ('select nome, endereco, bairro, estado, cidade, fone, fax, obs, cod from fornecedor where cod ='
      + JsEdit3.Text);
    dm.IBQuery1.Open;

    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| Fornec: ' +
      funcoes.CompletaOuRepete(LeftStr(trim(dm.IBQuery1.FieldByName('nome')
      .AsString), 40), '', ' ', 40),
      'Fone: ' + trim(dm.IBQuery1.FieldByName('fone').AsString) + ' |', ' ',
      tam) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| Endereco: ' +
      dm.IBQuery1.FieldByName('endereco').AsString + ' - ' +
      dm.IBQuery1.FieldByName('bairro').AsString, dm.IBQuery1.FieldByName('fax')
      .AsString + ' |', ' ', tam) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| Cidade: ' +
      funcoes.CompletaOuRepete(dm.IBQuery1.FieldByName('cidade').AsString +
      ' - ' + dm.IBQuery1.FieldByName('estado').AsString, '', ' ', 41),
      'Codigo: ' + dm.IBQuery1.FieldByName('cod').AsString + ' |', ' ',
      tam) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| Obs: ' +
      funcoes.CompletaOuRepete(LeftStr(dm.IBQuery1.FieldByName('obs').AsString,
      40), '', ' ', 41), ' |', ' ', tam) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
      + #10))));

    if funcoes.buscaParamGeral(5, '') = 'S' then
    begin
      addRelatorioForm19
        ('|  Referencia      |Unid | Qtd.    | Descricao das Mercadorias               |'
        + CRLF);
      addRelatorioForm19('+------------------+-----+---------+' +
        CompletaOuRepete('', '', '-', 41) + '+' + CRLF);
    end
    else
    begin
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar(('|Codigo|Unid|  Qtd.  |' +
        CompletaOuRepete('    Descricao das Mercadorias      ', '', ' ',
        tamDescri) + '|Unitario|  Total   |' + #13 + #10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar(('+------+----+--------+' +
        CompletaOuRepete('-----------------------------------', '', '-',
        tamDescri) + '+--------+----------+' + #13 + #10))));
    end;

    ClientDataSet1.DisableControls;
    ClientDataSet1.First;;
    dm.IBQuery2.First;
    sub := 0;
    total := 0;
    while not ClientDataSet1.Eof do
    begin
      { if ClientDataSet1.RecNo >= l then
        begin
        l := l + 60;
        form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
        addRelatorioForm19('  ' + #12 + #13 + #10);
        form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
        if ConfParamGerais[5] = 'S' then
        begin
        addRelatorioForm19('|  Referencia   | Unid.  | Qtd.    | Descricao das Mercadorias                |' + CRLF);
        addRelatorioForm19('+---------------+--------+---------+------------------------------------------+' + CRLF);
        end
        else
        begin
        form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|Codigo|Unid|   Qtd.  |    Descricao das Mercadorias     |Unitario|    Total   |'+#13+#10))));
        form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('+------+----+---------+----------------------------------+--------+------------+'+#13+#10))));
        end;
        end; }

      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Clear;
      dm.IBQuery1.SQL.Add
        ('select unid, nome, codbar, refori from produto where cod=' +
        ClientDataSet1.FieldByName('codigo').AsString);
      dm.IBQuery1.Open;
      // total := total + ClientDataSet1.fieldbyname('total').AsCurrency;
      total := total + ClientDataSet1TOT_ORIGI2.AsCurrency;
      sub := sub + ClientDataSet1.FieldByName('quant').AsCurrency;

      if funcoes.buscaParamGeral(5, '') = 'S' then
      begin
        // addRelatorioForm19(CompletaOuRepete('|' + dm.IBQuery1.fieldbyname('refori').AsString, '|', ' ', 17) + CompletaOuRepete(dm.IBQuery1.fieldbyname('unid').AsString, '|', ' ', 9) + CompletaOuRepete('', formataCurrency(ClientDataSet1QUANT.AsCurrency) + '|', ' ', 10) +
        addRelatorioForm19
          (CompletaOuRepete('|' + dm.IBQuery1.FieldByName('codbar').AsString,
          '|', ' ', 20) + CompletaOuRepete(dm.IBQuery1.FieldByName('unid')
          .AsString, '|', ' ', 6) + CompletaOuRepete('',
          formataCurrency(ClientDataSet1QUANT.AsCurrency) + '|', ' ', 10) +
          CompletaOuRepete(LeftStr(dm.IBQuery1.FieldByName('nome').AsString,
          41), '|', ' ', 42) + CRLF);
      end
      else
      begin
        if tipo = 'S' then
        begin
          addRelatorioForm19('|' + funcoes.CompletaOuRepete('',
            ClientDataSet1.FieldByName('codigo').AsString + '|', ' ', 7) +
            funcoes.CompletaOuRepete('', LeftStr(dm.IBQuery1.FieldByName('unid')
            .AsString, 5) + '|', ' ', 5) + funcoes.CompletaOuRepete('',
            FormatCurr('0.00', ClientDataSet1.FieldByName('quant').AsCurrency) +
            '|', ' ', 9) + funcoes.CompletaOuRepete
            (copy(dm.IBQuery1.FieldByName('nome').AsString, 1, tamDescri), '|',
            ' ', tamDescri + 1) + funcoes.CompletaOuRepete('',
            FormatCurr('0.00', ClientDataSet1.FieldByName('preco').AsCurrency) +
            '|', ' ', 9) + funcoes.CompletaOuRepete('', FormatCurr('0.00',
            ClientDataSet1.FieldByName('total').AsCurrency) + '|', ' ',
            11) + CRLF);
        end
        else
        begin
          addRelatorioForm19('|' + funcoes.CompletaOuRepete('',
            ClientDataSet1.FieldByName('codigo').AsString + '|', ' ', 7) +
            funcoes.CompletaOuRepete('', LeftStr(dm.IBQuery1.FieldByName('unid')
            .AsString, 5) + '|', ' ', 5) + funcoes.CompletaOuRepete('',
            FormatCurr('0.00', ClientDataSet1.FieldByName('quant').AsCurrency) +
            '|', ' ', 9) + funcoes.CompletaOuRepete
            (copy(dm.IBQuery1.FieldByName('nome').AsString, 1, tamDescri), '|',
            ' ', tamDescri + 1) + IfThen(test = 1, funcoes.CompletaOuRepete('',
            FormatCurr('0.00', ClientDataSet1.FieldByName('preco').AsCurrency) +
            '|', ' ', 9), funcoes.CompletaOuRepete('', '|', '_', 9)) +
            IfThen(test = 1, funcoes.CompletaOuRepete('', '|', '_', 11),
            funcoes.CompletaOuRepete('', '|', '_', 11)) + CRLF);
        end;

        // if test = 1 then add('|'+funcoes.CompletaOuRepete('',ClientDataSet1.fieldbyname('codigo').AsString+'|',' ',7)+funcoes.CompletaOuRepete('',LeftStr(dm.ibquery1.fieldbyname('unid').AsString, 5)+'|',' ',5)+funcoes.CompletaOuRepete('',FormatCurr('0.00',ClientDataSet1.fieldbyname('quant').AsCurrency)+'|',' ',10)+funcoes.CompletaOuRepete(copy(dm.ibquery1.fieldbyname('nome').AsString,1, tamDescri -1),'|',' ', tamDescri)+funcoes.CompletaOuRepete('',FormatCurr('0.00',ClientDataSet1.fieldbyname('preco').AsCurrency)+'|',' ',9)+funcoes.CompletaOuRepete('',FormatCurr('0.00',ClientDataSet1.fieldbyname('total').AsCurrency)+'|',' ',13)+#13+#10))))
        // else  form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|'+funcoes.CompletaOuRepete('',ClientDataSet1.fieldbyname('codigo').AsString+'|',' ',7)+funcoes.CompletaOuRepete('',LeftStr(dm.ibquery1.fieldbyname('unid').AsString, 5)+'|',' ',5)+funcoes.CompletaOuRepete('',FormatCurr('0.00',ClientDataSet1.fieldbyname('quant').AsCurrency)+'|',' ',10)+funcoes.CompletaOuRepete(copy(dm.ibquery1.fieldbyname('nome').AsString,1,tamDescri -1),'|',' ',tamDescri)+funcoes.CompletaOuRepete('','|','_',9)+funcoes.CompletaOuRepete('','|','_',13)+#13+#10))));
      end;

      ClientDataSet1.Next;
    end;
    ClientDataSet1.First;
    ClientDataSet1.EnableControls;
    dm.IBQuery1.Close;
    dm.IBQuery2.Close;
    dm.IBselect.Close;

    if form19.RichEdit1.Lines.Count < 50 then
    begin
      for i := form19.RichEdit1.Lines.Count to linFim do
      begin
        if funcoes.buscaParamGeral(5, '') = 'S' then
        begin
          addRelatorioForm19(CompletaOuRepete('|', '|', ' ', 20) +
            CompletaOuRepete('', '|', ' ', 6) + CompletaOuRepete('', '|', ' ',
            10) + CompletaOuRepete('', '|', ' ', 42) + CRLF);
        end
        else
        begin
          form19.RichEdit1.Perform(EM_REPLACESEL, 1,
            Longint(PChar(('|' + funcoes.CompletaOuRepete('', '|', ' ',
            7) + funcoes.CompletaOuRepete('', '|', ' ',
            5) + funcoes.CompletaOuRepete('', '|', ' ',
            9) + funcoes.CompletaOuRepete('', '|', ' ', tamDescri + 1) +
            funcoes.CompletaOuRepete('', '|', ' ', 9) + funcoes.CompletaOuRepete
            ('', '|', ' ', 11) + #13 + #10))));
        end;
      end;
    end;

    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
      + #10))));

    if tipo = 'S' then
    begin
      addRelatorioForm19(funcoes.CompletaOuRepete('| Total: ',
        FormatCurr('#,###,###0.00', total1) + '|', ' ', tam) + #13 + #10);
    end
    else
    begin
      addRelatorioForm19(funcoes.CompletaOuRepete('| Contabil: ' +
        strnum(FormatCurr('0.00', total1)), '|', ' ', tam) + #13 + #10);
    end;
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
      + #10))));

    try
      if FileExists('C:\TEXTO.txt') then
        DeleteFile('C:\TEXTO.txt');
      form19.RichEdit1.Lines.SaveToFile('C:\TEXTO.txt');
    except
    end;

    tipo := funcoes.dialogo('generico', 0, 'SN' + #8, 0, true, 'S',
      'Control For Windows', 'Imprimir Esta Compra (S/N) ?:', 'N');
    if tipo = 'N' then
    begin
      exit;
    end;

    if form22.Pgerais.Values['nota'] = 'T' then
    begin
      SetPrinter(indxImpressoraNFE);
      imprime.imprime1(0, '00');
      exit;
    end;

    // imprime.textx('texto.txt');
    funcoes.ImprimirPedidoVias(1, Modo_Orcamento);

    exit;
  end;

  if tipo = 'G' then
  begin

    txt := '';
    if funcoes.LerConfig(form22.Pgerais.Values['configu'], 3) = 'S' then
    begin
      txt := funcoes.dialogo('not', 70, '', 200, false, '',
        'Mensagem no Pedido', 'Confirme:', txt);
      if txt = '*' then
        txt := '';
      // txt := 'OBS: ' + txt;
    end;
    total := 0;
    dm.IBQuery2.Close;
    dm.IBQuery2.SQL.Clear;
    dm.IBQuery2.SQL.Add('select * from registro');
    dm.IBQuery2.Open;
    { form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('| '+pedido+' Nr:'+novocod+'     PAGTO: '+codhis+'-'+(funcoes.BuscaNomeBD(dm.ibquery1,'nome','formpagto','where cod='+codhis)),'EMISSAO: '+JsEditData1.Text+' |',' ',80)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('| '+form22.Pgerais.Values['empresa'],'CNPJ: '+dm.IBQuery2.fieldbyname('cnpj').AsString+' |',' ',80)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('| '+dm.IBQuery2.fieldbyname('ende').AsString+'  - '+dm.IBQuery2.fieldbyname('bairro').AsString,'|',' ',80)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('| Fone: '+dm.IBQuery2.fieldbyname('telres').AsString+'       '+dm.IBQuery2.fieldbyname('telcom').AsString+ '  '+ dm.IBQuery2.fieldbyname('cid').AsString+' - '+dm.IBQuery2.fieldbyname('est').AsString,'IE: '+dm.IBQuery2.fieldbyname('ies').AsString+' |',' ',80)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('| Obs: '+dm.IBQuery2.FieldByName('obs').AsString,'|',' ',80)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('| Nome: ' + JsEdit3.Text + '-' +funcoes.CompletaOuRepete(funcoes.BuscaNomeBD(dm.ibquery1,'nome','cliente','where cod='+JsEdit3.Text),'|',' ',41),'CPF/CNPJ: '+funcoes.BuscaNomeBD(dm.ibquery1,'cnpj','cliente','where cod='+JsEdit3.Text)+' |',' ',80)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('+','+','-',80)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|Codigo| Unid |  Qtd. |    Descricao das Mercadorias     |Unitario|    Total   |'+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('+------+------+-------+----------------------------------+--------+------------+'+#13+#10))));
    }
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', 80) + #13
      + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| ' + pedido + ' Nr:' + novocod +
      '     PAGTO: ' + codhis + '-' + (funcoes.BuscaNomeBD(dm.IBQuery1, 'nome',
      'formpagto', 'where cod=' + codhis)), 'EMISSAO: ' + JsEditData1.Text +
      ' |', ' ', 80) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', 80) + #13
      + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| ' + form22.Pgerais.Values
      ['empresa'], 'CNPJ: ' + dm.IBQuery2.FieldByName('cnpj').AsString + ' |',
      ' ', 80) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| ' + dm.IBQuery2.FieldByName
      ('ende').AsString + '  - ' + dm.IBQuery2.FieldByName('bairro').AsString,
      '|', ' ', 80) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| Fone: ' +
      dm.IBQuery2.FieldByName('telres').AsString + '  Cel: ' +
      dm.IBQuery2.FieldByName('telcom').AsString + '  ' +
      dm.IBQuery2.FieldByName('cid').AsString + ' - ' + dm.IBQuery2.FieldByName
      ('est').AsString, 'IE: ' + dm.IBQuery2.FieldByName('ies').AsString + ' |',
      ' ', 80) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| Obs: ' +
      dm.IBQuery2.FieldByName('obs').AsString, '|', ' ', 80) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', 80) + #13
      + #10))));
    // form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(,'|',' ',35) ,'CPF/CNPJ: ' +  + #13 + #10))));
    addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.CompletaOuRepete
      (copy('| Cliente: ' + JsEdit3.Text + '-' + funcoes.BuscaNomeBD
      (dm.IBQuery1, 'nome', 'cliente', 'where cod=' + JsEdit3.Text), 1, 40), '',
      ' ', 41) + funcoes.CompletaOuRepete('|CPF/CNPJ: ' +
      funcoes.BuscaNomeBD(dm.IBQuery1, 'cnpj', 'cliente',
      'where cod=' + JsEdit3.Text), '', ' ', 37), '|', ' ', 80) + #13 + #10);

    if funcoes.buscaParamGeral(27, '') = 'S' then
    begin
      dm.IBQuery4.Close;
      dm.IBQuery4.SQL.Clear;
      dm.IBQuery4.SQL.Add
        ('select nome, ende, bairro, cid, obs, iif(tipo = 1, cpf, cnpj) as cpf, cnpj, tipo, ies, tel,telres,telcom from cliente where cod = :cod');
      dm.IBQuery4.ParamByName('cod').AsString := JsEdit3.Text;
      dm.IBQuery4.Open;

      addRelatorioForm19(funcoes.CompletaOuRepete
        (funcoes.CompletaOuRepete(copy('| Endereco: ' + dm.IBQuery4.FieldByName
        ('ende').AsString, 1, 40), '', ' ', 41) + funcoes.CompletaOuRepete
        ('|INSC. EST.: ' + dm.IBQuery4.FieldByName('cpf').AsString, '', ' ',
        37), '|', ' ', 80) + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete
        (funcoes.CompletaOuRepete(copy('| Bairro: ' + dm.IBQuery4.FieldByName
        ('bairro').AsString + ' - ' + dm.IBQuery4.FieldByName('cid').AsString,
        1, 40), '', ' ', 41) + funcoes.CompletaOuRepete('|Codigo: ' +
        dm.IBQuery4.FieldByName('ies').AsString, '', ' ', 37), '|', ' ', 80) +
        #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete
        (funcoes.CompletaOuRepete(copy('| Obs: ' + dm.IBQuery4.FieldByName
        ('obs').AsString, 1, 40), '', ' ', 41) + funcoes.CompletaOuRepete
        ('|Fone: ' + dm.IBQuery4.FieldByName('tel').AsString, '', ' ', 37), '|',
        ' ', 80) + #13 + #10);
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', 80) + #13
        + #10))));
      dm.IBQuery4.Close;
    end
    else
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', 80) + #13
        + #10))));

    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar
      (('|Codigo| Unid |  Qtd.   |    Descricao das Mercadorias     |Unitario|    Total |'
      + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar
      (('+------+------+---------+----------------------------------+--------+----------+'
      + #13 + #10))));

    ClientDataSet1.DisableControls;
    ClientDataSet1.First;;
    dm.IBQuery2.First;
    sub := 0;
    total := 0;
    while not ClientDataSet1.Eof do
    begin
      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Clear;
      dm.IBQuery1.SQL.Add('select unid, nome, codbar from produto where cod=' +
        ClientDataSet1.FieldByName('codigo').AsString);
      dm.IBQuery1.Open;
      // total := total + ClientDataSet1.fieldbyname('total').AsCurrency;
      total := total + ClientDataSet1TOT_ORIGI2.AsCurrency;
      sub := sub + ClientDataSet1.FieldByName('quant').AsCurrency;
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar(('|' + funcoes.CompletaOuRepete('',
        ClientDataSet1.FieldByName('codigo').AsString + '|', ' ',
        7) + funcoes.CompletaOuRepete('',
        LeftStr(dm.IBQuery1.FieldByName('unid').AsString, 6) + '|', ' ',
        7) + funcoes.CompletaOuRepete('', FormatCurr('0.000',
        ClientDataSet1.FieldByName('quant').AsCurrency) + '|', ' ',
        10) + funcoes.CompletaOuRepete(copy(dm.IBQuery1.FieldByName('nome')
        .AsString, 1, 34), '|', ' ', 35) + funcoes.CompletaOuRepete('',
        FormatCurr('#,###,###0.00', ClientDataSet1.FieldByName('preco')
        .AsCurrency) + '|', ' ', 9) + funcoes.CompletaOuRepete('',
        FormatCurr('#,###,###0.00', ClientDataSet1.FieldByName('total')
        .AsCurrency) + '|', ' ', 11) + #13 + #10))));
      ClientDataSet1.Next;
    end;
    ClientDataSet1.First;
    ClientDataSet1.EnableControls;
    dm.IBQuery1.Close;

    try
      if funcoes.ExisteParcelamento(novocod) and
        (funcoes.buscaParamGeral(20, '') = 'S') then
      // (form22.Pgerais.Strings[20] = 'S') then
      begin
        form19.RichEdit1.Perform(EM_REPLACESEL, 1,
          Longint(PChar
          (('|      |      |         |                                  |        |          |'))
          ));
        funcoes.ImprimeParcelamento('|      |      |         |    ',
          '    |        |          |', FormatCurr('#,###,###0.00',
          StrToCurr(Parcelamento.Values['entrada'])), novocod);
      end;
    except
      on e: exception do
      begin
        gravaErrosNoArquivo(e.Message, 'Form20', '808',
          'NotaMedia - ImprimeNota');
      end;
    end;

    if form19.RichEdit1.Lines.Count < 50 then
    begin
      for i := form19.RichEdit1.Lines.Count to 50 do
      begin
        form19.RichEdit1.Perform(EM_REPLACESEL, 1,
          Longint(PChar(('|' + funcoes.CompletaOuRepete('', '|', ' ',
          7) + funcoes.CompletaOuRepete('', '|', ' ',
          7) + funcoes.CompletaOuRepete('', '|', ' ',
          10) + funcoes.CompletaOuRepete('', '|', ' ',
          35) + funcoes.CompletaOuRepete('', '|', ' ',
          9) + funcoes.CompletaOuRepete('', '|', ' ', 11) + #13 + #10))));
      end;
    end;

    if (funcoes.LerConfig(form22.Pgerais.Values['configu'], 3) = 'S') and
      (txt <> '') then
    begin
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', 80) + #13
        + #10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar((funcoes.CompletaOuRepete('|OBS: ' + txt, '|', ' ',
        80) + #13 + #10))));
    end;
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', 80) + #13
      + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('|',
      funcoes.CompletaOuRepete('Sub-Total:', FormatCurr('#,###,###0.00', total),
      '.', 28) + ' |', ' ', 80) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('|',
      funcoes.CompletaOuRepete('Desconto(' + FormatCurr('#,###,###0.00',
      (Desconto * 100) / total) + '%):', FormatCurr('#,###,###0.00', Desconto),
      '.', 28) + ' |', ' ', 80) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| Volumes: ' +
      funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00', sub), ' ', 9),
      funcoes.CompletaOuRepete('Total:', FormatCurr('#,###,###0.00', total1),
      '.', 28) + ' |', ' ', 80) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', 80) + #13
      + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar(('| Vendedor: ' + funcoes.CompletaOuRepete(copy(JsEdit2.Text
      + '-' + funcoes.BuscaNomeBD(dm.IBQuery1, 'nome', 'vendedor',
      'where cod=' + JsEdit2.Text), 1, 16), '|', ' ',
      17) + funcoes.CompletaOuRepete('Recebido Por: ', '|', ' ', 51) + #13
      + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar(('| Vencimento: ' + funcoes.CompletaOuRepete
      (FormatDateTime('DD/MM/YY', form22.datamov), '|', ' ',
      15) + funcoes.CompletaOuRepete('', '|', ' ', 51) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', 80) + #13
      + #10))));

    // imprime.textx('texto.txt');
  end;

  if tipo = 'M' then
  begin
    tam := 78;
    // txt := '';

    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('', '', '-', tam) + CRLF))));
    addRelatorioForm19
      ('*  *    *    *    *   S E M    V A L O R    F I S C A L   *    *    *     *  *'
      + CRLF);

    if somaDescontoVendaCDS <> 0 then
      descItem := true
    else
      descItem := false;

    if contido(funcoes.LerConfig(form22.Pgerais.Values['configu'], 3), 'S') then
    begin
      txt := funcoes.dialogo('not', 70, '', 200, false, '',
        'Mensagem no Pedido', 'Confirme:', txt);
      if txt = '*' then
        txt := '';
      // txt := 'OBS: ' + txt;
    end;
    total := 0;
    dm.IBQuery2.Close;
    dm.IBQuery2.SQL.Clear;
    dm.IBQuery2.SQL.Add('select * from registro');
    dm.IBQuery2.Open;

    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
      + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| ' + pedido + ' Nr:' + novocod +
      '     PAGTO: ' + codhis + '-' + (funcoes.BuscaNomeBD(dm.IBQuery1, 'nome',
      'formpagto', 'where cod=' + codhis)),
      'EMISSAO: ' + FormatDateTime('dd/mm/yy', form22.datamov) + ' ' +
      FormatDateTime('hh:mm:ss', NOW) + ' |', ' ', tam) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
      + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| ' + form22.Pgerais.Values
      ['empresa'], 'CNPJ: ' + dm.IBQuery2.FieldByName('cnpj').AsString + ' |',
      ' ', tam) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| ' + dm.IBQuery2.FieldByName
      ('ende').AsString + '  - ' + dm.IBQuery2.FieldByName('bairro').AsString,
      '|', ' ', tam) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| Fone: ' +
      dm.IBQuery2.FieldByName('telres').AsString + '  Cel: ' +
      dm.IBQuery2.FieldByName('telcom').AsString + '  ' +
      dm.IBQuery2.FieldByName('cid').AsString + ' - ' + dm.IBQuery2.FieldByName
      ('est').AsString, 'IE: ' + dm.IBQuery2.FieldByName('ies').AsString + ' |',
      ' ', tam) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| Obs: ' +
      dm.IBQuery2.FieldByName('obs').AsString, '|', ' ', tam) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
      + #10))));
    // form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(,'|',' ',35) ,'CPF/CNPJ: ' +  + #13 + #10))));
    addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.CompletaOuRepete
      (copy('| Cliente: ' + iif(funcoes.buscaParamGeral(27, '') = 'N',
      JsEdit3.Text + '-', '') + funcoes.BuscaNomeBD(dm.IBQuery1, 'nome',
      'cliente', 'where cod=' + JsEdit3.Text), 1, 46), '', ' ', 46) +
      funcoes.CompletaOuRepete('|CPF/CNPJ: ' + funcoes.BuscaNomeBD(dm.IBQuery1,
      'cnpj', 'cliente', 'where cod=' + JsEdit3.Text), '', ' ', 29), '|', ' ',
      tam) + #13 + #10);
    if funcoes.buscaParamGeral(27, '') = 'S' then
    begin
      dm.IBQuery4.Close;
      dm.IBQuery4.SQL.Clear;
      dm.IBQuery4.SQL.Add
        ('select cod, nome, ende, bairro, cid, obs, cnpj, tipo, ies, tel,telres,telcom from cliente where cod = :cod');
      dm.IBQuery4.ParamByName('cod').AsString := JsEdit3.Text;
      dm.IBQuery4.Open;

      addRelatorioForm19(funcoes.CompletaOuRepete
        (funcoes.CompletaOuRepete(copy('| End: ' + dm.IBQuery4.FieldByName
        ('ende').AsString, 1, 46), '', ' ', 46) + funcoes.CompletaOuRepete
        ('|INSC. EST.: ' + LeftStr(dm.IBQuery4.FieldByName('ies').AsString, 29),
        '', ' ', 29), '|', ' ', tam) + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete
        (funcoes.CompletaOuRepete(copy('| Bairro: ' + dm.IBQuery4.FieldByName
        ('bairro').AsString + ' - ' + dm.IBQuery4.FieldByName('cid').AsString,
        1, 46), '', ' ', 46) + funcoes.CompletaOuRepete('|Codigo: ' +
        dm.IBQuery4.FieldByName('cod').AsString, '', ' ', 29), '|', ' ', tam) +
        #13 + #10);

      if length(trim(dm.IBQuery4.FieldByName('obs').AsString)) <= 39 then
      begin
        addRelatorioForm19
          (funcoes.CompletaOuRepete(funcoes.CompletaOuRepete(copy('| Obs: ' +
          dm.IBQuery4.FieldByName('obs').AsString, 1, 46), '', ' ', 46) +
          funcoes.CompletaOuRepete('|Fone: ' + dm.IBQuery4.FieldByName('telres')
          .AsString, '', ' ', 29), '|', ' ', tam) + #13 + #10);
      end
      else
      begin
        addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.CompletaOuRepete('|', '', ' ',
          46) + funcoes.CompletaOuRepete('|Fone: ' + dm.IBQuery4.FieldByName
          ('telres').AsString, '', ' ', 29), '|', ' ', tam) + #13 + #10);
        addRelatorioForm19(funcoes.CompletaOuRepete('| Obs: ' +
          LeftStr(dm.IBQuery4.FieldByName('obs').AsString, 70), '|', ' ', tam) + #13 + #10);
      end;
      dm.IBQuery4.Close;
    end;

    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
      + #10))));
    // form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|Codigo| Unid |  Qtd. |    Descricao das Mercadorias     |Unitario|    Total   |'+#13+#10))));
    // form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('+------+------+-------+----------------------------------+--------+------------+'+#13+#10))));
    if funcoes.buscaParamGeral(63, 'N') = 'S' then
    begin
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar
        (('|Cod. |Un |  Qtd.  |   Descricao das Mercadorias         |  Unit. |  Total   |'
        + #13 + #10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar
        (('+-----+---+--------+-------------------------------------+--------+----------+'
        + #13 + #10))));
    end
    else
    begin
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar
        (('|Codigo|Unid|   Qtd.    |  Descricao das Mercadorias     |Unitario|   Total  |'
        + #13 + #10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar
        (('+------+----+-----------+--------------------------------+--------+----------+'
        + #13 + #10))));
    end;
    dm.IBQuery2.Close;
    ClientDataSet1.DisableControls;
    ClientDataSet1.First;
    sub := 0;
    total := 0;

    while not ClientDataSet1.Eof do
    begin
      if ImpSepara then
      begin
        while true do
        begin
          if (ClientDataSet1estado.AsString = 'I') then
            break;
          if (ClientDataSet1.Eof) then
            exit;
          ClientDataSet1.Next;
        end;
      end;

      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Clear;
      dm.IBQuery1.SQL.Add
        ('select unid, codbar, nome, fracao from produto where cod=' +
        ClientDataSet1.FieldByName('codigo').AsString);
      dm.IBQuery1.Open;

      nomevol := 'Volumes:';
      if funcoes.buscaParamGeral(109, 'N') = 'S' then
      begin
        nomevol := 'Total M3:';
        p_venda0 := dm.IBQuery1.FieldByName('fracao').AsCurrency;
        if p_venda0 > 0 then
        begin
          sub := sub + (ClientDataSet1.FieldByName('quant').AsCurrency *
            p_venda0);
        end;
      end
      else
      begin
        if contido('|' + dm.IBQuery1.FieldByName('unid').AsString + '|', form22.UnidInteiro) then
          sub := sub + 1
        else
          sub := sub + ClientDataSet1.FieldByName('quant').AsCurrency;
      end;

      if ClientDataSet1m2.AsInteger > 0 then
        desc := ClientDataSet1DESCRICAO.AsString
      else
        desc := dm.IBQuery1.FieldByName('nome').AsString;

      desc := trim(desc);

      // p_venda0 := IfThen(ClientDataSet1PRECO.AsCurrency > ClientDataSet1PRECO_ORIGI.AsCurrency, ClientDataSet1PRECO.AsCurrency, ClientDataSet1PRECO_ORIGI.AsCurrency);
      // totVenda := IfThen(ClientDataSet1TOT_ORIGI2.AsCurrency > ClientDataSet1TOTAL.AsCurrency, ClientDataSet1TOT_ORIGI2.AsCurrency, ClientDataSet1TOTAL.AsCurrency);

      p_venda0 := ClientDataSet1PRECO.AsCurrency;
      totVenda := ClientDataSet1TOTAL.AsCurrency;

      if funcoes.buscaParamGeral(63, 'N') = 'S' then
      begin
        form19.RichEdit1.Perform(EM_REPLACESEL, 1,
          Longint(PChar(('|' + funcoes.CompletaOuRepete('',
          ClientDataSet1.FieldByName('codigo').AsString + '|', ' ',
          6) + funcoes.CompletaOuRepete('',
          LeftStr(dm.IBQuery1.FieldByName('unid').AsString, 3) + '|', ' ',
          4) + funcoes.CompletaOuRepete('', FormatCurr('0.00',
          ClientDataSet1.FieldByName('quant').AsCurrency) + '|', ' ',
          9) + funcoes.CompletaOuRepete(copy(desc, 1, 37), '|', ' ',
          38) + funcoes.CompletaOuRepete('', FormatCurr('0.00', p_venda0) + '|',
          ' ', 9) + funcoes.CompletaOuRepete('', FormatCurr('0.00',
          totVenda) + '|', ' ', 11) + #13 + #10))));
      end
      else
      begin
        form19.RichEdit1.Perform(EM_REPLACESEL, 1,
          Longint(PChar(('|' + funcoes.CompletaOuRepete('',
          ClientDataSet1.FieldByName('codigo').AsString + '|', ' ',
          7) + funcoes.CompletaOuRepete('',
          LeftStr(dm.IBQuery1.FieldByName('unid').AsString, 5) + '|', ' ',
          5) + funcoes.CompletaOuRepete('', FormatCurr('0.00',
          ClientDataSet1.FieldByName('quant').AsCurrency) + '|', ' ',
          12) + funcoes.CompletaOuRepete(copy(desc, 1, 32), '|', ' ',
          33) + funcoes.CompletaOuRepete('', FormatCurr('0.00', p_venda0) + '|',
          ' ', 9) + funcoes.CompletaOuRepete('', FormatCurr('0.00',
          totVenda) + '|', ' ', 11) + #13 + #10))));
      end;

      if funcoes.buscaParamGeral(133, 'N') = 'S' then begin
          if ClientDataSet1PRECO_ORIGI.AsCurrency <> ClientDataSet1TOTAL.AsCurrency then begin
            addRelatorioForm19(funcoes.CompletaOuRepete('|-->Desconto R$', formataCurrency(ClientDataSet1PRECO_ORIGI.AsCurrency - ClientDataSet1TOTAL.AsCurrency) + '|', ' ', tam) + CRLF);
            desconto := desconto  -(ClientDataSet1TOT_ORIGI2.AsCurrency - ClientDataSet1TOTAL.AsCurrency);
          end;
      end;

      // form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|'+funcoes.CompletaOuRepete('',ClientDataSet1.fieldbyname('codigo').AsString+'|',' ',7)+funcoes.CompletaOuRepete('',dm.ibquery1.fieldbyname('unid').AsString+'|',' ',7)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.000',ClientDataSet1.fieldbyname('quant').AsCurrency)+'|',' ',8)+funcoes.CompletaOuRepete(copy(dm.ibquery1.fieldbyname('nome').AsString,1,34),'|',' ',35)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',ClientDataSet1.fieldbyname('preco').AsCurrency)+'|',' ',9)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',ClientDataSet1.fieldbyname('total').AsCurrency)+'|',' ',13)+#13+#10))));
      // total := total + ClientDataSet1.fieldbyname('total').AsCurrency;
      total := total + totVenda;
      ClientDataSet1.Next;
    end;
    dm.IBQuery1.Close;
    ClientDataSet1.First;
    ClientDataSet1.EnableControls;

    if (Modo_Venda = true) then
    begin
      try
        if funcoes.ExisteParcelamento(novocod) and
          (funcoes.buscaParamGeral(20, '') = 'S') then
        // (form22.Pgerais.Strings[20] = 'S') then
        begin
          addRelatorioForm19
            ('|      |      |       |                                  |        |          |'
            + CRLF);
          funcoes.ImprimeParcelamento('|      |      |         |  ',
            '    |        |          |', FormatCurr('#,###,###0.00',
            StrToCurr(Parcelamento.Values['entrada'])), novocod);
        end;
      except
        on e: exception do
        begin
          gravaErrosNoArquivo(e.Message, 'Form20', '808',
            'NotaMedia - ImprimeNota');
        end;
      end;
    end
    else
    begin
      if (funcoes.buscaParamGeral(20, '') = 'S') then
      begin
        addRelatorioForm19
          ('|      |      |       |                                  |        |          |'
          + CRLF);
        funcoes.ImprimeParcelamentoOrca(Parcelamento,
          '|      |      |         |  ', '    |        |          |');
      end;
    end;

    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
      + #10))));
    // if descItem = false then
    // begin

    if Desconto <> 0 then
    begin
      if funcoes.buscaParamGeral(133, 'N') = 'S' then begin
        total := total1 -desconto;
      end;

      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar((funcoes.CompletaOuRepete('|',
        funcoes.CompletaOuRepete('Sub-Total:', FormatCurr('#,###,###0.00',
        total), '.', 28) + ' |', ' ', tam) + #13 + #10))));

      if Desconto > 0 then Desconto := 0
      else begin
        addRelatorioForm19(funcoes.CompletaOuRepete('|',
        funcoes.CompletaOuRepete('Desconto(' + FormatCurr('#,###,###0.00',
        (Desconto * 100) / total) + '%):', FormatCurr('#,###,###0.00',
        Desconto), '.', 28) + ' |', ' ', tam) + #13 + #10);
      end;
    end;
    // end;

    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| ' + nomevol + ' ' +
      funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00' +
      IfThen(contido('M3', nomevol), '00', ''), sub), ' ', 9),
      funcoes.CompletaOuRepete('Total:', FormatCurr('#,###,###0.00', total1),
      '.', 28) + ' |', ' ', tam) + #13 + #10))));

    if Modo_Orcamento then
    begin
      if (txt <> '') then
      begin
        form19.RichEdit1.Perform(EM_REPLACESEL, 1,
          Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
          + #10))));
        form19.RichEdit1.Perform(EM_REPLACESEL, 1,
          Longint(PChar((funcoes.CompletaOuRepete('|OBS: ' + txt, '|', ' ',
          tam) + #13 + #10))));
      end;
    end
    else if Modo_Venda then
    begin
      if contido(funcoes.LerConfig(form22.Pgerais.Values['configu'], 3), 'XS')
        and (txt <> '') then
      begin
        form19.RichEdit1.Perform(EM_REPLACESEL, 1,
          Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
          + #10))));
        form19.RichEdit1.Perform(EM_REPLACESEL, 1,
          Longint(PChar((funcoes.CompletaOuRepete('|OBS: ' + txt, '|', ' ',
          tam) + #13 + #10))));
        try
          funcoes.atualizaMensagemUsuario(txt, novocod);
        except
        end;
      end;
    end;
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
      + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar(('| Vendedor: ' + funcoes.CompletaOuRepete(copy(JsEdit2.Text
      + '-' + funcoes.BuscaNomeBD(dm.IBQuery1, 'nome', 'vendedor',
      'where cod=' + JsEdit2.Text), 1, 16), '|', ' ',
      17) + funcoes.CompletaOuRepete('Recebido Por: ', '|', ' ', 49) + #13
      + #10))));

    if StrToInt(strnum(codhis)) = 2 then
    begin
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar(('| Vencimento: ' + CompletaOuRepete(FormatDateTime
        ('DD/MM/YY', StrToDateDef(Parcelamento.Values['vencto'], NOW)), '|',
        ' ', 15) + CompletaOuRepete('', '|', ' ', 49) + #13 + #10))));
      dm.IBQuery1.Close;
    end;

    // form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('| Vencimento: '+funcoes.CompletaOuRepete(FormatDateTime('DD/MM/YY',StrToDate(JsEditData1.Text)),'|',' ',15)+funcoes.CompletaOuRepete('','|',' ', 49)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
      + #10))));

    if Modo_Venda then begin
      addRelatorioForm19(funcoes.imprimeEnderecoEntrega(tipo, CLIENTE_ENTREGA, JsEdit3.Text));
    end;

    if Modo_Venda then
    begin
      if funcoes.buscaParamGeral(88, 'N') = 'S' then
      begin
        addRelatorioForm19(' ' + CRLF);
        addRelatorioForm19(' ' + CRLF);
        ImprimeNota('DAV');
      end;
    end;

  end;

  if tipo = 'X' then
  begin
    tam := 78;
    // txt := '';

    addRelatorioForm19(funcoes.CompletaOuRepete(#218, #191, #196, tam) + CRLF);
    addRelatorioForm19
      (#179 + '  *    *    *    *   S E M    V A L O R    F I S C A L   *    *    *     *  '
      + #179 + CRLF);

    if somaDescontoVendaCDS <> 0 then
      descItem := true
    else
      descItem := false;

    if contido(funcoes.LerConfig(form22.Pgerais.Values['configu'], 3), 'S') then
    begin
      txt := funcoes.dialogo('not', 70, '', 200, false, '',
        'Mensagem no Pedido', 'Confirme:', txt);
      if txt = '*' then
        txt := '';
      // txt := 'OBS: ' + txt;
    end;
    total := 0;
    dm.IBQuery2.Close;
    dm.IBQuery2.SQL.Clear;
    dm.IBQuery2.SQL.Add('select * from registro');
    dm.IBQuery2.Open;

    addRelatorioForm19(funcoes.CompletaOuRepete(#195, #180, #196, tam) + CRLF);
    addRelatorioForm19(funcoes.CompletaOuRepete(#179 + ' ' + pedido + ' Nr:' +
      novocod + '     PAGTO: ' + codhis + '-' +
      (funcoes.BuscaNomeBD(dm.IBQuery1, 'nome', 'formpagto',
      'where cod=' + codhis)), 'EMISSAO: ' + FormatDateTime('dd/mm/yy',
      form22.datamov) + ' ' + FormatDateTime('hh:mm:ss', NOW) + ' ' + #179, ' ',
      tam) + #13 + #10);
    addRelatorioForm19(funcoes.CompletaOuRepete(#195, #180, #196, tam) + CRLF);
    addRelatorioForm19(funcoes.CompletaOuRepete(#179 + ' ' +
      form22.Pgerais.Values['empresa'],
      'CNPJ: ' + dm.IBQuery2.FieldByName('cnpj').AsString + ' ' + #179, ' ',
      tam) + #13 + #10);
    addRelatorioForm19(funcoes.CompletaOuRepete(#179 + ' ' +
      dm.IBQuery2.FieldByName('ende').AsString + '  - ' +
      dm.IBQuery2.FieldByName('bairro').AsString, #179, ' ', tam) + #13 + #10);
    addRelatorioForm19(funcoes.CompletaOuRepete(#179 + ' Fone: ' +
      dm.IBQuery2.FieldByName('telres').AsString + '  Cel: ' +
      dm.IBQuery2.FieldByName('telcom').AsString + '  ' +
      dm.IBQuery2.FieldByName('cid').AsString + ' - ' + dm.IBQuery2.FieldByName
      ('est').AsString, 'IE: ' + dm.IBQuery2.FieldByName('ies').AsString + ' ' +
      #179, ' ', tam) + #13 + #10);
    addRelatorioForm19(funcoes.CompletaOuRepete(#179 + ' Obs: ' +
      dm.IBQuery2.FieldByName('obs').AsString, #179, ' ', tam) + #13 + #10);
    addRelatorioForm19(funcoes.CompletaOuRepete(#195, #194, #196, 47) +
      funcoes.CompletaOuRepete('', #180, #196, 31) + CRLF);
    addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.CompletaOuRepete
      (copy(#179 + ' Cliente: ' + iif(funcoes.buscaParamGeral(27, '') = 'N',
      JsEdit3.Text + '-', '') + funcoes.BuscaNomeBD(dm.IBQuery1, 'nome',
      'cliente', 'where cod=' + JsEdit3.Text), 1, 46), '', ' ', 46) +
      funcoes.CompletaOuRepete(#179 + 'CPF/CNPJ: ' +
      funcoes.BuscaNomeBD(dm.IBQuery1, 'cnpj', 'cliente',
      'where cod=' + JsEdit3.Text), '', ' ', 29), #179, ' ', tam) + #13 + #10);
    if funcoes.buscaParamGeral(27, '') = 'S' then
    begin
      dm.IBQuery4.Close;
      dm.IBQuery4.SQL.Clear;
      dm.IBQuery4.SQL.Add
        ('select cod, nome, ende, bairro, cid, obs, cnpj, tipo, ies, tel,telres,telcom from cliente where cod = :cod');
      dm.IBQuery4.ParamByName('cod').AsString := JsEdit3.Text;
      dm.IBQuery4.Open;

      addRelatorioForm19(funcoes.CompletaOuRepete
        (funcoes.CompletaOuRepete(copy(#179 + ' End: ' + dm.IBQuery4.FieldByName
        ('ende').AsString, 1, 46), '', ' ', 46) + funcoes.CompletaOuRepete(#179
        + 'INSC. EST.: ' + LeftStr(dm.IBQuery4.FieldByName('ies').AsString, 29),
        '', ' ', 29), #179, ' ', tam) + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete
        (funcoes.CompletaOuRepete(copy(#179 + ' Bairro: ' +
        dm.IBQuery4.FieldByName('bairro').AsString + ' - ' +
        dm.IBQuery4.FieldByName('cid').AsString, 1, 46), '', ' ', 46) +
        funcoes.CompletaOuRepete(#179 + 'Codigo: ' + dm.IBQuery4.FieldByName
        ('cod').AsString, '', ' ', 29), #179, ' ', tam) + #13 + #10);
      // addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.CompletaOuRepete(copy(#179+' Obs: ' + dm.IBQuery4.fieldbyname('obs').AsString, 1, 46) , '', ' ', 46) + funcoes.CompletaOuRepete(#179+'Fone: ' + dm.IBQuery4.fieldbyname('telres').AsString , '', ' ', 29),#179,' ',tam) + #13 + #10);

      if length(trim(dm.IBQuery4.FieldByName('obs').AsString)) <= 39 then
      begin
        addRelatorioForm19
          (funcoes.CompletaOuRepete(funcoes.CompletaOuRepete(copy(#179 +
          ' Obs: ' + dm.IBQuery4.FieldByName('obs').AsString, 1, 46), '', ' ',
          46) + funcoes.CompletaOuRepete(#179 + 'Fone: ' +
          dm.IBQuery4.FieldByName('telres').AsString, '', ' ', 29), #179, ' ',
          tam) + #13 + #10);
        dm.IBQuery4.Close;
      end
      else
      begin
        tipoVenda := 'XX';

        addRelatorioForm19
          (funcoes.CompletaOuRepete(funcoes.CompletaOuRepete(#179, '', ' ',
          46) + funcoes.CompletaOuRepete(#179 + 'Fone: ' +
          dm.IBQuery4.FieldByName('telres').AsString, '', ' ', 29), #179, ' ',
          tam) + #13 + #10);
        addRelatorioForm19(funcoes.CompletaOuRepete(#179 + ' Obs: ' +
          dm.IBQuery4.FieldByName('obs').AsString, '', ' ', tam - 1) +
          #179 + CRLF);

        dm.IBQuery4.Close;

      end;
      dm.IBQuery4.Close;
    end;

    // addRelatorioForm19(funcoes.CompletaOuRepete(#195, #194, #196, 47) + funcoes.CompletaOuRepete('', #180, #196, 31) + CRLF);
    // form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|Codigo| Unid |  Qtd. |    Descricao das Mercadorias     |Unitario|    Total   |'+#13+#10))));
    // form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('+------+------+-------+----------------------------------+--------+------------+'+#13+#10))));
    if funcoes.buscaParamGeral(63, 'N') = 'S' then
    begin
      if tipoVenda <> 'XX' then
      begin
        addRelatorioForm19(CompletaOuRepete(#195, #194, #196, 7) +
          CompletaOuRepete('', #194, #196, 4) + CompletaOuRepete('', #194, #196,
          9) + CompletaOuRepete('', #193, #196, 27) + CompletaOuRepete('', #194,
          #196, 11) + CompletaOuRepete('', #194, #196, 9) + CompletaOuRepete('',
          #180, #196, 11) + CRLF);
      end
      else
      begin
        addRelatorioForm19(CompletaOuRepete(#195, #194, #196, 7) +
          CompletaOuRepete('', #194, #196, 4) + CompletaOuRepete('', #194, #196,
          9) + CompletaOuRepete('', '', #196, 27) + CompletaOuRepete('', #194,
          #196, 11) + CompletaOuRepete('', #194, #196, 9) + CompletaOuRepete('',
          #180, #196, 11) + CRLF);
      end;

      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar((#179 + 'Cod. ' + #179 + 'Un ' + #179 + '  Qtd.  ' + #179
        + '   Descricao das Mercadorias         ' + #179 + '  Unit. ' + #179 +
        '  Total   ' + #179 + #13 + #10))));

      addRelatorioForm19(CompletaOuRepete(#195, #197, #196, 7) +
        CompletaOuRepete('', #197, #196, 4) + CompletaOuRepete('', #197, #196,
        9) + CompletaOuRepete('', #197, #196, 38) + CompletaOuRepete('', #197,
        #196, 9) + CompletaOuRepete('', #180, #196, 11) + CRLF);
    end
    else
    begin
      if tipoVenda <> 'XX' then
      begin
        addRelatorioForm19(CompletaOuRepete(#195, #194, #196, 8) +
          CompletaOuRepete('', #194, #196, 5) + CompletaOuRepete('', #194, #196,
          10) + CompletaOuRepete('', #193, #196, 24) + CompletaOuRepete('',
          #194, #196, 11) + CompletaOuRepete('', #194, #196, 9) +
          CompletaOuRepete('', #180, #196, 11) + CRLF);
      end
      else
      begin
        addRelatorioForm19(CompletaOuRepete(#195, #194, #196, 8) +
          CompletaOuRepete('', #194, #196, 5) + CompletaOuRepete('', #194, #196,
          10) + CompletaOuRepete('', '', #196, 24) + CompletaOuRepete('', #194,
          #196, 11) + CompletaOuRepete('', #194, #196, 9) + CompletaOuRepete('',
          #180, #196, 11) + CRLF);
      end;

      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar((#179 + 'Codigo' + #179 + 'Unid' + #179 + '   Qtd.  ' +
        #179 + '  Descricao das Mercadorias       ' + #179 + 'Unitario' + #179 +
        '   Total  ' + #179 + #13 + #10))));
      // form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('+------+----+-----------+--------------------------------+--------+----------+'+#13+#10))));
      addRelatorioForm19(CompletaOuRepete(#195, #197, #196, 8) +
        CompletaOuRepete('', #197, #196, 5) + CompletaOuRepete('', #197, #196,
        10) + CompletaOuRepete('', #197, #196, 35) + CompletaOuRepete('', #197,
        #196, 9) + CompletaOuRepete('', #180, #196, 11) + CRLF);
    end;

    dm.IBQuery2.Close;
    ClientDataSet1.DisableControls;
    ClientDataSet1.First;
    sub := 0;
    total := 0;

    while not ClientDataSet1.Eof do
    begin
      if ImpSepara then
      begin
        while true do
        begin
          if (ClientDataSet1estado.AsString = 'I') then
            break;
          if (ClientDataSet1.Eof) then
            exit;
          ClientDataSet1.Next;
        end;
      end;

      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Clear;
      dm.IBQuery1.SQL.Add('select unid, codbar, nome from produto where cod=' +
        ClientDataSet1.FieldByName('codigo').AsString);
      dm.IBQuery1.Open;
      sub := sub + ClientDataSet1.FieldByName('quant').AsCurrency;

      if ClientDataSet1m2.AsInteger > 0 then
        desc := ClientDataSet1DESCRICAO.AsString
      else
        desc := dm.IBQuery1.FieldByName('nome').AsString;

      desc := trim(desc);

      // p_venda0 := IfThen(ClientDataSet1PRECO.AsCurrency > ClientDataSet1PRECO_ORIGI.AsCurrency, ClientDataSet1PRECO.AsCurrency, ClientDataSet1PRECO_ORIGI.AsCurrency);
      // totVenda := IfThen(ClientDataSet1TOT_ORIGI2.AsCurrency > ClientDataSet1TOTAL.AsCurrency, ClientDataSet1TOT_ORIGI2.AsCurrency, ClientDataSet1TOTAL.AsCurrency);

      p_venda0 := ClientDataSet1PRECO.AsCurrency;
      totVenda := ClientDataSet1TOTAL.AsCurrency;

      if funcoes.buscaParamGeral(63, 'N') = 'S' then
      begin
        form19.RichEdit1.Perform(EM_REPLACESEL, 1,
          Longint(PChar((#179 + funcoes.CompletaOuRepete('',
          ClientDataSet1.FieldByName('codigo').AsString + #179, ' ',
          6) + funcoes.CompletaOuRepete('',
          LeftStr(dm.IBQuery1.FieldByName('unid').AsString, 3) + #179, ' ',
          4) + funcoes.CompletaOuRepete('', FormatCurr('0.00',
          ClientDataSet1.FieldByName('quant').AsCurrency) + #179, ' ',
          9) + funcoes.CompletaOuRepete(copy(desc, 1, 37), #179, ' ',
          38) + funcoes.CompletaOuRepete('', FormatCurr('0.00',
          p_venda0) + #179, ' ', 9) + funcoes.CompletaOuRepete('',
          FormatCurr('0.00', totVenda) + #179, ' ', 11) + #13 + #10))));
      end
      else
      begin
        form19.RichEdit1.Perform(EM_REPLACESEL, 1,
          Longint(PChar((#179 + funcoes.CompletaOuRepete('',
          ClientDataSet1.FieldByName('codigo').AsString + #179, ' ',
          7) + funcoes.CompletaOuRepete('',
          LeftStr(dm.IBQuery1.FieldByName('unid').AsString, 5) + #179, ' ',
          5) + funcoes.CompletaOuRepete('', FormatCurr('0.00',
          ClientDataSet1.FieldByName('quant').AsCurrency) + #179, ' ',
          10) + funcoes.CompletaOuRepete(copy(desc, 1, 34), #179, ' ',
          35) + funcoes.CompletaOuRepete('', FormatCurr('0.00',
          p_venda0) + #179, ' ', 9) + funcoes.CompletaOuRepete('',
          FormatCurr('0.00', totVenda) + #179, ' ', 11) + #13 + #10))));
      end;
      // form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|'+funcoes.CompletaOuRepete('',ClientDataSet1.fieldbyname('codigo').AsString+'|',' ',7)+funcoes.CompletaOuRepete('',dm.ibquery1.fieldbyname('unid').AsString+'|',' ',7)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.000',ClientDataSet1.fieldbyname('quant').AsCurrency)+'|',' ',8)+funcoes.CompletaOuRepete(copy(dm.ibquery1.fieldbyname('nome').AsString,1,34),'|',' ',35)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',ClientDataSet1.fieldbyname('preco').AsCurrency)+'|',' ',9)+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00',ClientDataSet1.fieldbyname('total').AsCurrency)+'|',' ',13)+#13+#10))));
      // total := total + ClientDataSet1.fieldbyname('total').AsCurrency;
      total := total + totVenda;
      ClientDataSet1.Next;
    end;
    dm.IBQuery1.Close;
    ClientDataSet1.First;
    ClientDataSet1.EnableControls;

    // if (Modo_Venda = true) then
    if true then

    begin
      try
        if funcoes.ExisteParcelamento(novocod) and
          (funcoes.buscaParamGeral(20, '') = 'S') then
        // (form22.Pgerais.Strings[20] = 'S') then
        begin
          if funcoes.buscaParamGeral(63, 'N') = 'S' then
          begin
            // addRelatorioForm19(#179+'     '+#179+'   '+#179+'        '+#179+'                                     '+#179+'        '+#179+'          '+ #179 + CRLF);
            funcoes.ImprimeParcelamento(#179 + '     ' + #179 + '   ' + #179 +
              '        ' + #179 + '  ', '         ' + #179 + '        ' + #179 +
              '          ' + #179, FormatCurr('#,###,###0.00',
              StrToCurr(Parcelamento.Values['entrada'])), novocod);
          end
          else
          begin
            // addRelatorioForm19(#179+'      '+#179+'    '+#179+'         '+#179+'                                  '+#179+'        '+#179+'          '+ #179
            // + CRLF);
            funcoes.ImprimeParcelamento(#179 + '      ' + #179 + '    ' + #179 +
              '         ' + #179 + '  ', '      ' + #179 + '        ' + #179 +
              '          ' + #179, FormatCurr('#,###,###0.00',
              StrToCurr(Parcelamento.Values['entrada'])), novocod);
          end;
        end;
      except
        on e: exception do
        begin
          gravaErrosNoArquivo(e.Message, 'Form20', '808',
            'NotaMedia - ImprimeNota');
        end;
      end;
    end;

    if funcoes.buscaParamGeral(63, 'N') = 'S' then
    begin
      addRelatorioForm19(CompletaOuRepete(#195, #193, #196, 7) +
        CompletaOuRepete('', #193, #196, 4) + CompletaOuRepete('', #193, #196,
        9) + CompletaOuRepete('', '', #196, 27) + CompletaOuRepete('', #193,
        #196, 11) + CompletaOuRepete('', #193, #196, 9) + CompletaOuRepete('',
        #180, #196, 11) + CRLF);
    end
    else
    begin
      addRelatorioForm19(CompletaOuRepete(#195, #193, #196, 8) +
        CompletaOuRepete('', #193, #196, 5) + CompletaOuRepete('', #193, #196,
        10) + CompletaOuRepete('', '', #196, 24) + CompletaOuRepete('', #193,
        #196, 11) + CompletaOuRepete('', #193, #196, 9) + CompletaOuRepete('',
        #180, #196, 11) + CRLF);
    end;
    // if descItem = false then
    // begin

    if Desconto <> 0 then
    begin
      addRelatorioForm19(funcoes.CompletaOuRepete(#179, funcoes.CompletaOuRepete('Sub-Total:', FormatCurr('#,###,###0.00', total), '.', 23)  + #179, ' ', tam) + #13 + #10);

      if Desconto > 0 then
        Desconto := 0;
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar((funcoes.CompletaOuRepete(#179,
        funcoes.CompletaOuRepete('Desc(' + FormatCurr('#,###,###0.00',
        (Desconto * 100) / total) + '%):', FormatCurr('#,###,###0.00',
        Desconto), '.', 23)  + #179, ' ', tam) + #13 + #10))));
    end;
    // end;

    addRelatorioForm19(funcoes.CompletaOuRepete(#179 +IfThen(funcoes.buscaParamGeral(137, 'N') = 'N', ' Volumes: ' + FormatCurr('#,###,###0.00', sub), '') ,
      funcoes.CompletaOuRepete('Total:', FormatCurr('#,###,###0.00', total1),'.',23)  + #179, ' ', tam) + #13 + #10);

    if funcoes.buscaParamGeral(137, 'N') = 'S' then begin
      if Desconto = 0 then begin
        addRelatorioForm19(funcoes.CompletaOuRepete(#179, #179, ' ', tam) +CRLF);
        addRelatorioForm19(funcoes.CompletaOuRepete(#179, #179, ' ', tam) +CRLF);
        addRelatorioForm19(funcoes.CompletaOuRepete(#179, #179, ' ', tam) +CRLF);
        addRelatorioForm19(funcoes.CompletaOuRepete(#179, #179, ' ', tam) +CRLF);
      end
      else  addRelatorioForm19(funcoes.CompletaOuRepete(#179, #179, ' ', tam) +CRLF);
    end;

    if Modo_Orcamento then
    begin
      if (txt <> '') then
      begin
        addRelatorioForm19(funcoes.CompletaOuRepete(#195, #180, #196,
          tam) + CRLF);
        form19.RichEdit1.Perform(EM_REPLACESEL, 1,
          Longint(PChar((funcoes.CompletaOuRepete(#179 + 'OBS: ' + txt, #179,
          ' ', tam) + #13 + #10))));
      end;
    end
    else if Modo_Venda then
    begin
      if contido(funcoes.LerConfig(form22.Pgerais.Values['configu'], 3), 'XS')
        and (txt <> '') then
      begin
        addRelatorioForm19(funcoes.CompletaOuRepete(#195, #180, #196,
          tam) + CRLF);
        form19.RichEdit1.Perform(EM_REPLACESEL, 1,
          Longint(PChar((funcoes.CompletaOuRepete(#179 + 'OBS: ' + txt, #179,
          ' ', tam) + #13 + #10))));
        try
          funcoes.atualizaMensagemUsuario(txt, novocod);
        except
        end;
      end;
    end;
    addRelatorioForm19(funcoes.CompletaOuRepete(#195, #180, #196, tam) + CRLF);
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((#179 + ' Vendedor: ' + funcoes.CompletaOuRepete
      (copy(JsEdit2.Text + '-' + funcoes.BuscaNomeBD(dm.IBQuery1, 'nome',
      'vendedor', 'where cod=' + JsEdit2.Text), 1, 16), #179, ' ',
      17) + funcoes.CompletaOuRepete('Recebido Por: ', #179, ' ', 49) + #13
      + #10))));

    if StrToInt(strnum(codhis)) = 2 then
    begin
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar((#179 + ' Vencimento: ' +
        CompletaOuRepete(FormatDateTime('DD/MM/YY',
        StrToDateDef(Parcelamento.Values['vencto'], NOW)), #179, ' ',
        15) + CompletaOuRepete('', #179, ' ', 49) + #13 + #10))));
      dm.IBQuery1.Close;
    end;

    // form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('| Vencimento: '+funcoes.CompletaOuRepete(FormatDateTime('DD/MM/YY',StrToDate(JsEditData1.Text)),'|',' ',15)+funcoes.CompletaOuRepete('','|',' ', 49)+#13+#10))));
    addRelatorioForm19(funcoes.CompletaOuRepete(#192, #217, #196, tam) + CRLF);

    // imprime1.imprime.textxArq('@', true);
    funcoes.ImprimirPedidoVias(1, Modo_Orcamento);
    exit;
  end;

  if tipo = 'V' then
  begin
    tam := 78;
    // txt := '';

    if somaDescontoVendaCDS <> 0 then
      descItem := true
    else
      descItem := false;

    if funcoes.LerConfig(form22.Pgerais.Values['configu'], 3) = 'S' then
    begin
      txt := funcoes.dialogo('not', 70, '', 200, false, '',
        'Mensagem no Pedido', 'Confirme:', txt);
      if txt = '*' then
        txt := '';
      // txt := 'OBS: ' + txt;
    end;
    total := 0;
    dm.IBQuery2.Close;
    dm.IBQuery2.SQL.Clear;
    dm.IBQuery2.SQL.Add('select * from registro');
    dm.IBQuery2.Open;

    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
      + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| ' + pedido + ' Nr:' + novocod +
      '     PAGTO: ' + codhis + '-' + (funcoes.BuscaNomeBD(dm.IBQuery1, 'nome',
      'formpagto', 'where cod=' + codhis)),
      'EMISSAO: ' + FormatDateTime('dd/mm/yy', form22.datamov) + ' ' +
      FormatDateTime('hh:mm:ss', NOW) + ' |', ' ', tam) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
      + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| ' + form22.Pgerais.Values
      ['empresa'], 'CNPJ: ' + dm.IBQuery2.FieldByName('cnpj').AsString + ' |',
      ' ', tam) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| ' + dm.IBQuery2.FieldByName
      ('ende').AsString + '  - ' + dm.IBQuery2.FieldByName('bairro').AsString,
      '|', ' ', tam) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| Fone: ' +
      dm.IBQuery2.FieldByName('telres').AsString + '  Cel: ' +
      dm.IBQuery2.FieldByName('telcom').AsString + '  ' +
      dm.IBQuery2.FieldByName('cid').AsString + ' - ' + dm.IBQuery2.FieldByName
      ('est').AsString, 'IE: ' + dm.IBQuery2.FieldByName('ies').AsString + ' |',
      ' ', tam) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| Obs: ' +
      dm.IBQuery2.FieldByName('obs').AsString, '|', ' ', tam) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
      + #10))));
    // form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(,'|',' ',35) ,'CPF/CNPJ: ' +  + #13 + #10))));
    addRelatorioForm19(funcoes.CompletaOuRepete(funcoes.CompletaOuRepete
      (copy('| Cliente: ' + iif(funcoes.buscaParamGeral(27, '') = 'N',
      JsEdit3.Text + '-', '') + funcoes.BuscaNomeBD(dm.IBQuery1, 'nome',
      'cliente', 'where cod=' + JsEdit3.Text), 1, 46), '', ' ', 46) +
      funcoes.CompletaOuRepete('|CPF/CNPJ: ' + funcoes.BuscaNomeBD(dm.IBQuery1,
      'cnpj', 'cliente', 'where cod=' + JsEdit3.Text), '', ' ', 29), '|', ' ',
      tam) + #13 + #10);
    if funcoes.buscaParamGeral(27, '') = 'S' then
    begin
      dm.IBQuery4.Close;
      dm.IBQuery4.SQL.Clear;
      dm.IBQuery4.SQL.Add
        ('select cod, nome, ende, bairro, cid, obs, cnpj, tipo, ies, tel,telres,telcom from cliente where cod = :cod');
      dm.IBQuery4.ParamByName('cod').AsString := JsEdit3.Text;
      dm.IBQuery4.Open;

      addRelatorioForm19(funcoes.CompletaOuRepete
        (funcoes.CompletaOuRepete(copy('| End: ' + dm.IBQuery4.FieldByName
        ('ende').AsString, 1, 46), '', ' ', 46) + funcoes.CompletaOuRepete
        ('|INSC. EST.: ' + LeftStr(dm.IBQuery4.FieldByName('ies').AsString, 29),
        '', ' ', 29), '|', ' ', tam) + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete
        (funcoes.CompletaOuRepete(copy('| Bairro: ' + dm.IBQuery4.FieldByName
        ('bairro').AsString + ' - ' + dm.IBQuery4.FieldByName('cid').AsString,
        1, 46), '', ' ', 46) + funcoes.CompletaOuRepete('|Codigo: ' +
        dm.IBQuery4.FieldByName('cod').AsString, '', ' ', 29), '|', ' ', tam) +
        #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete
        (funcoes.CompletaOuRepete(copy('| Obs: ' + dm.IBQuery4.FieldByName
        ('obs').AsString, 1, 46), '', ' ', 46) + funcoes.CompletaOuRepete
        ('|Fone: ' + dm.IBQuery4.FieldByName('telres').AsString, '', ' ', 29),
        '|', ' ', tam) + #13 + #10);
      dm.IBQuery4.Close;
    end;

    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
      + #10))));
    // form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('|Codigo| Unid |  Qtd. |    Descricao das Mercadorias     |Unitario|    Total   |'+#13+#10))));
    // form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('+------+------+-------+----------------------------------+--------+------------+'+#13+#10))));
    if funcoes.buscaParamGeral(63, 'N') = 'S' then
    begin
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar
        (('|Cod. |Un |  Qtd.  |   Descricao das Mercadorias         |  Unit. |  Total   |'
        + #13 + #10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar
        (('+-----+---+--------+-------------------------------------+--------+----------+'
        + #13 + #10))));
    end
    else
    begin
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar
        (('|Cod. |Un |  Qtd.  |   Descricao das Mercadorias         |  Unit. |  Total   |'
        + #13 + #10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar
        (('+-----+---+--------+-------------------------------------+--------+----------+'
        + #13 + #10))));
    end;
    // |34476| UN|50000,00| AGUA MINERAL S/GAS PET 500 | 5,63| 281500,00|
    dm.IBQuery2.Close;
    ClientDataSet1.DisableControls;
    ClientDataSet1.First;
    sub := 0;
    total := 0;

    while not ClientDataSet1.Eof do
    begin
      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Clear;
      dm.IBQuery1.SQL.Add('select unid, codbar, nome from produto where cod=' +
        ClientDataSet1.FieldByName('codigo').AsString);
      dm.IBQuery1.Open;
      sub := sub + ClientDataSet1.FieldByName('quant').AsCurrency;

      if ClientDataSet1m2.AsInteger > 0 then
        desc := ClientDataSet1DESCRICAO.AsString
      else
        desc := dm.IBQuery1.FieldByName('nome').AsString;

      // p_venda0 := IfThen(ClientDataSet1PRECO.AsCurrency > ClientDataSet1PRECO_ORIGI.AsCurrency, ClientDataSet1PRECO.AsCurrency, ClientDataSet1PRECO_ORIGI.AsCurrency);
      // totVenda := IfThen(ClientDataSet1TOT_ORIGI2.AsCurrency > ClientDataSet1TOTAL.AsCurrency, ClientDataSet1TOT_ORIGI2.AsCurrency, ClientDataSet1TOTAL.AsCurrency);

      p_venda0 := ClientDataSet1PRECO.AsCurrency;
      totVenda := ClientDataSet1TOTAL.AsCurrency;

      if funcoes.buscaParamGeral(63, 'N') = 'S' then
      begin
        form19.RichEdit1.Perform(EM_REPLACESEL, 1,
          Longint(PChar(('|' + funcoes.CompletaOuRepete('',
          ClientDataSet1.FieldByName('codigo').AsString + '|', ' ',
          6) + funcoes.CompletaOuRepete('',
          LeftStr(dm.IBQuery1.FieldByName('unid').AsString, 4) + '|', ' ',
          4) + funcoes.CompletaOuRepete('', FormatCurr('0.00',
          ClientDataSet1.FieldByName('quant').AsCurrency) + '|', ' ',
          9) + funcoes.CompletaOuRepete(copy(desc, 1, 37), '|', ' ',
          38) + funcoes.CompletaOuRepete('', FormatCurr('0.00', p_venda0) + '|',
          ' ', 9) + funcoes.CompletaOuRepete('', FormatCurr('0.00',
          totVenda) + '|', ' ', 11) + #13 + #10))));
      end
      else
      begin
        form19.RichEdit1.Perform(EM_REPLACESEL, 1,
          Longint(PChar(('|' + funcoes.CompletaOuRepete('',
          ClientDataSet1.FieldByName('codigo').AsString + '|', ' ',
          6) + funcoes.CompletaOuRepete('',
          LeftStr(dm.IBQuery1.FieldByName('unid').AsString, 4) + '|', ' ',
          4) + funcoes.CompletaOuRepete('', FormatCurr('0.00',
          ClientDataSet1.FieldByName('quant').AsCurrency) + '|', ' ',
          9) + funcoes.CompletaOuRepete(copy(desc, 1, 37), '|', ' ',
          38) + funcoes.CompletaOuRepete('', FormatCurr('0.00', p_venda0) + '|',
          ' ', 9) + funcoes.CompletaOuRepete('', FormatCurr('0.00',
          totVenda) + '|', ' ', 11) + #13 + #10))));
      end;

      total := total + totVenda;
      ClientDataSet1.Next;
    end;
    dm.IBQuery1.Close;
    ClientDataSet1.First;
    ClientDataSet1.EnableControls;

    if (Modo_Venda = true) then
    begin
      try
        if funcoes.ExisteParcelamento(novocod) and
          (funcoes.buscaParamGeral(20, '') = 'S') then
        // (form22.Pgerais.Strings[20] = 'S') then
        begin
          form19.RichEdit1.Perform(EM_REPLACESEL, 1,
            Longint(PChar
            (('|      |      |       |                                  |        |          |'
            + CRLF))));
          funcoes.ImprimeParcelamento('|      |      |         |  ',
            '    |        |          |', FormatCurr('#,###,###0.00',
            StrToCurr(Parcelamento.Values['entrada'])), novocod);
        end;
      except
        on e: exception do
        begin
          gravaErrosNoArquivo(e.Message, 'Form20', '808',
            'NotaMedia - ImprimeNota');
        end;
      end;
    end;

    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
      + #10))));
    // if descItem = false then
    // begin
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('|',
      funcoes.CompletaOuRepete('Sub-Total:', FormatCurr('#,###,###0.00', total),
      '.', 28) + ' |', ' ', tam) + #13 + #10))));

    if Desconto > 0 then
      Desconto := 0;
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('|',
      funcoes.CompletaOuRepete('Desconto(' + FormatCurr('#,###,###0.00',
      (Desconto * 100) / total) + '%):', FormatCurr('#,###,###0.00', Desconto),
      '.', 28) + ' |', ' ', tam) + #13 + #10))));
    // end;

    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('| Volumes: ' +
      funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00', sub), ' ', 9),
      funcoes.CompletaOuRepete('Total:', FormatCurr('#,###,###0.00', total1),
      '.', 28) + ' |', ' ', tam) + #13 + #10))));

    if (funcoes.LerConfig(form22.Pgerais.Values['configu'], 3) = 'S') and
      (txt <> '') then
    begin
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
        + #10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar((funcoes.CompletaOuRepete('|OBS: ' + txt, '|', ' ',
        tam) + #13 + #10))));
      try
        funcoes.atualizaMensagemUsuario(txt, novocod);
      except
      end;
    end;
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
      + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar(('| Vendedor: ' + funcoes.CompletaOuRepete(copy(JsEdit2.Text
      + '-' + funcoes.BuscaNomeBD(dm.IBQuery1, 'nome', 'vendedor',
      'where cod=' + JsEdit2.Text), 1, 16), '|', ' ',
      17) + funcoes.CompletaOuRepete('Recebido Por: ', '|', ' ', 49) + #13
      + #10))));

    if StrToInt(strnum(codhis)) = 2 then
    begin
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar(('| Vencimento: ' + CompletaOuRepete(FormatDateTime
        ('DD/MM/YY', StrToDateDef(Parcelamento.Values['vencto'], NOW)), '|',
        ' ', 15) + CompletaOuRepete('', '|', ' ', 49) + #13 + #10))));
      dm.IBQuery1.Close;
    end;

    // form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('| Vencimento: '+funcoes.CompletaOuRepete(FormatDateTime('DD/MM/YY',StrToDate(JsEditData1.Text)),'|',' ',15)+funcoes.CompletaOuRepete('','|',' ', 49)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('+', '+', '-', tam) + #13
      + #10))));

  end;

  if tipo = 'E' then
  begin
    tam := 30;
    // testa se a configuração do terminal (3=Usar impressora termica SN ) = S

    imprime.negrito := true;
    imprime.fontDif := true;
    imprime.tamaFonte := 11;

    addRelatorioForm19(' ' + #13 + #10);

    addRelatorioForm19('* * * SEM VALOR FISCAL * * *' + CRLF);
    total := 0;
    dm.IBQuery2.Close;
    dm.IBQuery2.SQL.Clear;
    dm.IBQuery2.SQL.Add('select * from registro');
    dm.IBQuery2.Open;
    addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', tam) + CRLF);
    addRelatorioForm19(funcoes.centraliza(form22.Pgerais.Values['empresa'], ' ',
      30) + CRLF);
    addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', tam) + CRLF);
    // form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','',' ',40)+#13+#10))));
    addRelatorioForm19(LeftStr(dm.IBQuery2.FieldByName('ende').AsString,
      tam) + CRLF);
    addRelatorioForm19(LeftStr(dm.IBQuery2.FieldByName('bairro').AsString,
      tam) + CRLF);
    addRelatorioForm19
      (funcoes.centraliza(LeftStr('TEL: ' + dm.IBQuery2.FieldByName('telres')
      .AsString + ' ' + dm.IBQuery2.FieldByName('telcom').AsString, tam), ' ',
      tam) + CRLF);
    addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', tam) + #13 + #10);

    addRelatorioForm19(funcoes.CompletaOuRepete(JsEditData1.Text,
      FormatDateTime('hh:mm:ss', NOW), ' ', tam) + #13 + #10);
    addRelatorioForm19(funcoes.CompletaOuRepete(LeftStr('NOTA: ' + novocod + ' '
      + 'VEND: ' + JsEdit2.Text + '-' + funcoes.BuscaNomeBD(dm.IBQuery1, 'nome',
      'vendedor', 'where cod=' + JsEdit2.Text), tam), '', ' ', tam) +
      #13 + #10);
    addRelatorioForm19(funcoes.CompletaOuRepete('PAGTO: ' + codhis + '-' +
      copy(funcoes.BuscaNomeBD(dm.IBQuery1, 'nome', 'formpagto',
      'where cod=' + codhis), 1, 20), '', ' ', tam) + #13 + #10);
    if StrToInt(strnum(codhis)) = 2 then
    begin
      addRelatorioForm19('Vencimento: ' + CompletaOuRepete
        (FormatDateTime('DD/MM/YY', StrToDateDef(Parcelamento.Values['vencto'],
        NOW)), '', ' ', 15) + #13 + #10);
      dm.IBQuery1.Close;
    end;

    // if funcoes.LerConfig(form22.Pgerais.Values['configu'],4) = 'S' then addRelatorioForm19(' ' + #13 + #10);
    if funcoes.buscaParamGeral(27, '') = 'S' then
    begin
      addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', tam) + CRLF);
      addRelatorioForm19(funcoes.CompletaOuRepete(LeftStr('CLIENTE: ' +
        JsEdit3.Text + '-' + cliente, tam), '', ' ', tam) + CRLF);

      dm.IBQuery3.Close;
      dm.IBQuery3.SQL.Clear;
      dm.IBQuery3.SQL.Add
        ('select nome,ende, bairro, telres, telcom, obs from cliente where cod = :cod');
      dm.IBQuery3.ParamByName('cod').AsString := JsEdit3.Text;
      dm.IBQuery3.Open;
      // addRelatorioForm19(funcoes.CompletaOuRepete('CLIENTE: ' + copy(dm.IBQuery3.fieldbyname('nome').AsString, 1,31),'',' ', 40) + #13 + #10);

      if dm.IBQuery3.FieldByName('ende').AsString <> '' then
      begin
        if length(trim(dm.IBQuery3.FieldByName('ende').AsString)) + 5 > tam then
        begin
          addRelatorioForm19('ENDERECO: ' + CRLF);
          addRelatorioForm19(funcoes.QuebraLinhas('', '',
            dm.IBQuery3.FieldByName('ende').AsString, tam));
        end
        else
          addRelatorioForm19
            (funcoes.CompletaOuRepete(LeftStr('END: ' + dm.IBQuery3.FieldByName
            ('ende').AsString, tam), '', ' ', tam) + #13 + #10);

        addRelatorioForm19
          (funcoes.CompletaOuRepete(LeftStr('BAIRRO: ' + dm.IBQuery3.FieldByName
          ('bairro').AsString, tam), '', ' ', tam) + #13 + #10);
        addRelatorioForm19
          (funcoes.CompletaOuRepete(LeftStr('FONES: ' + dm.IBQuery3.FieldByName
          ('telres').AsString + ' ' + dm.IBQuery3.FieldByName('telcom')
          .AsString, tam), '', ' ', tam) + #13 + #10);

        if trim(dm.IBQuery3.FieldByName('obs').AsString) <> '' then
        begin
          addRelatorioForm19('OBS: ' + CRLF);
          addRelatorioForm19(funcoes.QuebraLinhas('', '',
            dm.IBQuery3.FieldByName('obs').AsString, tam));
        end;
      end;
      // addRelatorioForm19(funcoes.CompletaOuRepete('OBS: ' + copy(dm.IBQuery3.fieldbyname('obs').AsString, 1,34),'',' ', 40) + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', tam) +
        #13 + #10);
    end
    else
    begin
      addRelatorioForm19(funcoes.CompletaOuRepete(LeftStr('CLIENTE: ' +
        JsEdit3.Text + '-' + cliente, tam), '', ' ', tam) + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', tam) +
        #13 + #10);
    end;

    dm.IBQuery2.Close;
    ClientDataSet1.DisableControls;
    ClientDataSet1.First;
    subtotal := 0;
    while not ClientDataSet1.Eof do
    begin
      if ImpSepara then
      begin
        while true do
        begin
          if (ClientDataSet1estado.AsString = 'I') then
            break;
          if (ClientDataSet1.Eof) then
            exit;
          ClientDataSet1.Next;
        end;
      end;

      // total := total + ClientDataSet1.fieldbyname('total').AsCurrency;
      // total_item := IfThen(ClientDataSet1TOT_ORIGI2.AsCurrency > ClientDataSet1TOTAL.AsCurrency, ClientDataSet1TOT_ORIGI2.AsCurrency, ClientDataSet1TOTAL.AsCurrency);
      total_item := ClientDataSet1TOTAL.AsCurrency;
      total := total + total_item;
      subtotal := subtotal + ClientDataSet1TOT_ORIGI2.AsCurrency;

      addRelatorioForm19(funcoes.CompletaOuRepete
        (LeftStr(ClientDataSet1.FieldByName('codigo').AsString + '-' +
        ClientDataSet1.FieldByName('descricao').AsString, tam), '', ' ', tam) +
        #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete('QTD:', FormatCurr('0.00',
        ClientDataSet1.FieldByName('quant').AsCurrency), ' ', 11) +
        funcoes.CompletaOuRepete('', FormatCurr('0.00',
        ClientDataSet1PRECO.AsCurrency), ' ', 9) + funcoes.CompletaOuRepete('',
        FormatCurr('0.00', total_item), ' ', 10) + #13 + #10);

      ClientDataSet1.Next;
    end;

    ClientDataSet1.EnableControls;

    if funcoes.buscaParamGeral(81, 'N') = 'N' then
    begin
      if Desconto < 0 then
      begin
        // form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('DESCONTO('+FormatCurr('#,###,###0.00',(desconto * 100)/ total)+'%) ---------->'+funcoes.CompletaOuRepete('',formatCurr('#,###,###0.00',desconto),' ',11)+#13+#10))));
        addRelatorioForm19('VOCE ECONOMIZOU(' + FormatCurr('0.00',
          (Desconto * 100) / total) + '%)->' + funcoes.CompletaOuRepete('',
          FormatCurr('0.00', Desconto), ' ', 11) + CRLF);
      end;

      addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', tam) +
        #13 + #10);
    end
    else
    begin
      addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', tam) +
        #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete('SUBTOTAL:',
        FormatCurr('0.00', total1 - Desconto), '.', tam) + CRLF);

      if total > 0 then
        
      addRelatorioForm19(funcoes.CompletaOuRepete('DESCONTO(' +
        FormatCurr('0.00', (Desconto * 100) / total) + '%):',
        FormatCurr('0.00', Desconto), '.', tam) + CRLF);
    end;
    addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL:', FormatCurr('0.00',
      total1), '.', tam) + CRLF);
    addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', tam) + #13 + #10);

    if Modo_Orcamento then
    begin
      if (txt <> '') then
      begin
        addRelatorioForm19(funcoes.QuebraLinhas('', '', txt, tam));
        addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', tam) +
          #13 + #10);
      end;
    end
    else if Modo_Venda then
    begin
      if (funcoes.LerConfig(form22.Pgerais.Values['configu'], 3) = 'S') then
      begin
        txt := funcoes.dialogo('not', 70, '', 200, false, '',
          'Mensagem no Pedido', 'Confirme:', txt);
        if txt = '*' then
          txt := '';
        if contido('NAO TEM VALOR', txt) = false then
        begin
          addRelatorioForm19(funcoes.QuebraLinhas('', '', txt, tam));
          if length(txt) > 0 then
            addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', tam) +
              #13 + #10);

          try
            funcoes.atualizaMensagemUsuario(txt, novocod);
          except
          end;
        end;
      end;
    end;

    if funcoes.buscaParamGeral(32, '') = 'S' then
    // parametros gerais de operacao de troco na venda
    begin
      if recebido <> 0 then
      begin
        funcoes.atualizaRecebido(recebido, StrToInt(novocod));

        // form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',40)+#13+#10))));
        addRelatorioForm19(funcoes.CompletaOuRepete('Pagto:. . . . . . . . . .',
          FormatCurr('0.00', recebido), ' ', tam) + #13 + #10);
        addRelatorioForm19(funcoes.CompletaOuRepete('Troco:. . . . . . . . . .',
          FormatCurr('0.00', troco), ' ', tam) + #13 + #10);
        form19.RichEdit1.Perform(EM_REPLACESEL, 1,
          Longint(PChar((funcoes.CompletaOuRepete('', '', '-', tam) + #13
          + #10))));
      end;
    end;

    if Compra then
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar(('* * *     COMPRA     * * * *' + #13 + #10))))
    else if Modo_Orcamento then
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar(('* * *     ORCAMENTO    * * *' + #13 + #10))))
    else
      addRelatorioForm19('* * * SEM VALOR FISCAL * * *' + CRLF);

    if Assigned(Parcelamento) and (Modo_Venda) then
    begin
      if funcoes.buscaParamGeral(20, '') = 'S' then
        funcoes.ImprimeParcelamento('', '',
          FormatCurr('0.00', StrToCurrDef(Parcelamento.Values['entrada'], 0)
          ), novocod);
    end;

    if Modo_Venda then
    begin
      if funcoes.buscaParamGeral(88, 'N') = 'S' then
      begin
        addRelatorioForm19(' ' + CRLF);
        addRelatorioForm19(' ' + CRLF);
        ImprimeNota('DAV');
      end;
    end;
  end;

  // se tipo da nota for T(ticket)
  if tipo = 'T' then
  begin
    // testa se a configuração do terminal (3=Usar impressora termica SN ) = S
    if funcoes.LerConfig(form22.Pgerais.Values['conf_ter'], 3) <> '' then
    begin
      imprime.negrito :=
        iif(funcoes.LerConfig(form22.Pgerais.Values['conf_ter'], 4) = 'S',
        true, false);
      imprime.setFonte(StrToIntDef(funcoes.LerConfig(form22.Pgerais.Values
        ['conf_ter'], 3), 11));
      addRelatorioForm19(' ' + #13 + #10);
    end;

    if Modo_Venda then          addRelatorioForm19('*  S E M     V A L O R    F I S C A L  *' + CRLF)
    else if Modo_Orcamento then begin
      if funcoes.LerConfig(form22.Pgerais.Values['imp'], 1) = '8' then begin
        addRelatorioForm19('<ce><in>**  O  R  C  A  M  E  N  T  O  **</in></ce>' + CRLF);
      end
      else addRelatorioForm19('*****  O  R  C  A  M  E  N  T  O   *****' + CRLF);
    end;

    total := 0;
    dm.IBQuery2.Close;
    dm.IBQuery2.SQL.Clear;
    dm.IBQuery2.SQL.Add('select * from registro');
    dm.IBQuery2.Open;
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('', '', '-', 40) + #13 + #10))));

    //pode receber um param geral pra dar destaque no numero da venda
    if true then begin
      addRelatorioForm19('*' +funcoes.centraliza(form22.Pgerais.Values['empresa'], ' ',38) + '*' + #13 + #10);
      addRelatorioForm19('*' +funcoes.centraliza('CNPJ: '+form22.Pgerais.Values['cnpj'], ' ',38) + '*' + #13 + #10);

      addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 40) + #13 + #10);
      addRelatorioForm19('*' +funcoes.centraliza(IfThen(Modo_Venda, 'VENDA: ', 'ORCAMENTO: ')   + novocod , ' ',38)+ '*' + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 40) + #13 + #10);
    end
    else begin
      addRelatorioForm19(funcoes.centraliza(form22.Pgerais.Values['empresa'], ' ',40) + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 40) + #13 + #10);
    end;

    // form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','',' ',40)+#13+#10))));
    {addRelatorioForm19(funcoes.centraliza(dm.IBQuery2.FieldByName('ende').AsString
      + ' - ' + copy(dm.IBQuery2.FieldByName('bairro').AsString, 1,
      37 - length(dm.IBQuery2.FieldByName('ende').AsString)), ' ', 40) + #13
      + #10);}

    addRelatorioForm19
      (funcoes.centraliza(LeftStr(dm.IBQuery2.FieldByName('ende').AsString +
      ' - ' + (dm.IBQuery2.FieldByName('bairro').AsString), 38), ' ',
      40) + CRLF);

    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.centraliza('FONE: ' + dm.IBQuery2.FieldByName
      ('telres').AsString + '  ' + ' ' + dm.IBQuery2.FieldByName('telcom')
      .AsString, ' ', 40) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('', '', '-', 40) + #13 + #10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('DATA: ' + JsEditData1.Text,
      'HORA: ' + FormatDateTime('hh:mm:ss', NOW), ' ', 40) + #13 + #10))));

    {if Modo_Venda then begin
      addRelatorioForm19(funcoes.CompletaOuRepete('VENDA: ' + novocod, '', ' ',
      15) + ' ' + funcoes.CompletaOuRepete(copy('VENDEDOR: ' + JsEdit2.Text +
      '-' + funcoes.BuscaNomeBD(dm.IBQuery1, 'nome', 'vendedor',
      'where cod=' + JsEdit2.Text), 1, 24), '', ' ', 24) + #13 + #10);
    end
    else begin
      addRelatorioForm19(funcoes.CompletaOuRepete('ORCAMENTO: ' + novocod, '', ' ',
      17) + ' ' + funcoes.CompletaOuRepete(copy('VEND: ' + JsEdit2.Text +
      '-' + funcoes.BuscaNomeBD(dm.IBQuery1, 'nome', 'vendedor',
      'where cod=' + JsEdit2.Text), 1, 22), '', ' ', 22) + #13 + #10);
    end; }

    addRelatorioForm19(funcoes.CompletaOuRepete(copy('VENDEDOR: ' + JsEdit2.Text +
      '-' + funcoes.BuscaNomeBD(dm.IBQuery1, 'nome', 'vendedor',
      'where cod=' + JsEdit2.Text), 1, 39), '', ' ', 40) + #13 + #10);

    if trim(form22.Pgerais.Values['codUsuNovo']) <> '' then begin
      dm.IBselect.Close;
      dm.IBselect.Open('select nome nome from usuario where cod = '+ form22.Pgerais.Values['codUsuNovo']);
      addRelatorioForm19( 'DESCONTO AUTORIZADO POR ' + form22.Pgerais.Values['codUsuNovo'] + '-' + dm.IBselect.FieldByName('nome').AsString + CRLF);
      addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 40) + #13+ #10);
      dm.IBselect.Close;
    end;

    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('FORMA PAGTO: ' + codhis + '-' +
      copy(funcoes.BuscaNomeBD(dm.IBQuery1, 'nome', 'formpagto',
      'where cod=' + codhis), 1, 39 - length(codhis)), '', ' ', 40) + #13
      + #10))));
    if StrToInt(strnum(codhis)) = 2 then
    begin
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar(('Vencimento: ' + CompletaOuRepete(FormatDateTime
        ('DD/MM/YY', StrToDateDef(Parcelamento.Values['vencto'], NOW)), '', ' ',
        15) + #13 + #10))));
      dm.IBQuery1.Close;
    end;

    // if funcoes.LerConfig(form22.Pgerais.Values['configu'],4) = 'S' then addRelatorioForm19(' ' + #13 + #10);
    if funcoes.buscaParamGeral(27, '') = 'S' then
    begin
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar((funcoes.CompletaOuRepete('', '', '-', 40) + #13
        + #10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar((funcoes.CompletaOuRepete('CLIENTE: ' + copy(JsEdit3.Text
        + '-' + cliente, 1, 31), '', ' ', 40) + #13 + #10))));
      dm.IBQuery3.Close;
      dm.IBQuery3.SQL.Clear;
      dm.IBQuery3.SQL.Add
        ('select nome,ende, bairro, telres, telcom, obs from cliente where cod = :cod');
      dm.IBQuery3.ParamByName('cod').AsString := JsEdit3.Text;
      dm.IBQuery3.Open;
      // addRelatorioForm19(funcoes.CompletaOuRepete('CLIENTE: ' + copy(dm.IBQuery3.fieldbyname('nome').AsString, 1,31),'',' ', 40) + #13 + #10);

      if dm.IBQuery3.FieldByName('ende').AsString <> '' then
      begin
        addRelatorioForm19(funcoes.CompletaOuRepete('END: ' +
          copy(dm.IBQuery3.FieldByName('ende').AsString, 1, 34), '', ' ', 40) +
          #13 + #10);
        addRelatorioForm19(funcoes.CompletaOuRepete('BAIRRO: ' +
          copy(dm.IBQuery3.FieldByName('bairro').AsString, 1, 34), '', ' ', 40)
          + #13 + #10);
        addRelatorioForm19(funcoes.CompletaOuRepete('FONES: ' +
          copy(dm.IBQuery3.FieldByName('telres').AsString + '   ' +
          dm.IBQuery3.FieldByName('telcom').AsString, 1, 34), '', ' ', 40) +
          #13 + #10);


        if funcoes.buscaParamGeral(125, '') <> '' then begin
          addRelatorioForm19('OBS: ' + CRLF);
          addRelatorioForm19(funcoes.QuebraLinhas('', '',funcoes.buscaParamGeral(125, ''), 40));
        end
        else begin
          addRelatorioForm19('OBS: ' + CRLF);
          addRelatorioForm19(funcoes.QuebraLinhas('', '',dm.IBQuery3.FieldByName('obs').AsString, 40));
        end;
      end;
      // addRelatorioForm19(funcoes.CompletaOuRepete('OBS: ' + copy(dm.IBQuery3.fieldbyname('obs').AsString, 1,34),'',' ', 40) + #13 + #10);
      addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 40) + #13 + #10);
    end
    else
    begin
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar((funcoes.CompletaOuRepete(copy('CLIENTE: ' + JsEdit3.Text
        + '-' + cliente, 1, 40), '', ' ', 40) + #13 + #10))));
      addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 40) + #13 + #10);
    end;
    dm.IBQuery2.Close;
    ClientDataSet1.DisableControls;
    ClientDataSet1.First;
    subtotal := 0;

    totVolumes := 0;

    addRelatorioForm19('Codigo    Descricao'+ #13 + #10);
    addRelatorioForm19('*                  Quant   V.Unit  Total'+ #13 + #10);
    addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 40) + #13 + #10);
    while not ClientDataSet1.Eof do
    begin
      if ImpSepara then
      begin
        while true do
        begin
          if (ClientDataSet1estado.AsString = 'I') then
            break;
          if (ClientDataSet1.Eof) then
            exit;
          ClientDataSet1.Next;
        end;
      end;

      // total := total + ClientDataSet1.fieldbyname('total').AsCurrency;
      // total_item := IfThen(ClientDataSet1TOT_ORIGI2.AsCurrency > ClientDataSet1TOTAL.AsCurrency, ClientDataSet1TOT_ORIGI2.AsCurrency, ClientDataSet1TOTAL.AsCurrency);
      total_item := ClientDataSet1TOTAL.AsCurrency;
      total := total + total_item;
      subtotal := subtotal + ClientDataSet1TOT_ORIGI2.AsCurrency;

      if funcoes.buscaParamGeral(5, '') = 'S' then begin
        dm.IBselect.Close;
        dm.IBselect.SQL.Text :=
          'select codbar,cod,refori, localiza, unid from produto where cod = :cod';
        dm.IBselect.ParamByName('cod').AsInteger :=
          ClientDataSet1.FieldByName('codigo').AsInteger;
        dm.IBselect.Open;

        imprRef := funcoes.buscaParamGeral(74, '1');
        if imprRef = '2' then
          imprRefxx := 'refori'
        else if imprRef = '3' then
          imprRefxx := 'codbar'
        else
          imprRefxx := 'localiza';

        imprRefxx := dm.IBselect.FieldByName(imprRefxx).AsString;

        codigo1 := dm.IBselect.FieldByName('cod').AsString;
        if imprRef = '4' then
        begin
          codigo1 := dm.IBselect.FieldByName('refori').AsString;
          if trim(codigo1) = '' then
            codigo1 := dm.IBselect.FieldByName('codbar').AsString;
          if trim(codigo1) = '' then
            codigo1 := dm.IBselect.FieldByName('cod').AsString;

          imprRefxx := dm.IBselect.FieldByName('localiza').AsString;
        end;

        if imprRef = '5' then
        begin
          codigo1 := dm.IBselect.FieldByName('codbar').AsString;
          if trim(codigo1) = '' then
            codigo1 := dm.IBselect.FieldByName('refori').AsString;
          if trim(codigo1) = '' then
            codigo1 := dm.IBselect.FieldByName('cod').AsString;

          imprRefxx := dm.IBselect.FieldByName('localiza').AsString;
        end;

        if Modo_Orcamento then
        begin
          if funcoes.LerConfig(form22.Pgerais.Values['configu'], 10) = 'N' then
          begin
            imprRefxx := dm.IBselect.FieldByName('localiza').AsString;
            codigo1 := dm.IBselect.FieldByName('cod').AsString;
          end;
        end;

        if imprRefxx = '' then
          imprRefxx := '-->';


        if funcoes.buscaParamGeral(142, 'N') = 'N' then begin
          addRelatorioForm19(funcoes.CompletaOuRepete(copy(codigo1 + '-' + ClientDataSet1.FieldByName('descricao').AsString, 1, 40), '', ' ',40) + CRLF);
        end
        else begin
          addRelatorioForm19(funcoes.QuebraLinhas2('>','', codigo1 + '-' + ClientDataSet1.FieldByName('descricao').AsString, 40)) ;
        end;

        if Contido('CAMALEAO', form22.Pgerais.Values['empresa']) then begin
          addRelatorioForm19(funcoes.CompletaOuRepete(LeftStr(imprRefxx, 17), '',
          ' ', 17) + funcoes.CompletaOuRepete('', FormatCurr('0.00',
          ClientDataSet1.FieldByName('quant').AsCurrency), ' ', 6) +
          funcoes.CompletaOuRepete('', FormatCurr('0.00',
          ClientDataSet1PRECO.AsCurrency), ' ', 8) + funcoes.CompletaOuRepete
          ('', FormatCurr('0.00', total_item), ' ', 9) + CRLF);
        end
        else begin
          addRelatorioForm19(funcoes.CompletaOuRepete(LeftStr(imprRefxx, 16), '',
          ' ', 16) + funcoes.CompletaOuRepete('', FormatCurr('0.00',
          ClientDataSet1.FieldByName('quant').AsCurrency), ' ', 7) +
          funcoes.CompletaOuRepete('', FormatCurr('0.00',
          ClientDataSet1PRECO.AsCurrency), ' ', 8) + funcoes.CompletaOuRepete
          ('', FormatCurr('0.00', total_item), ' ', 9) + CRLF);
        end;
        dm.IBselect.Close;
      end
      else begin
        codigo1 := ClientDataSet1.FieldByName('codigo').AsString;
        if funcoes.buscaParamGeral(142, 'N') = 'N' then begin
          addRelatorioForm19(funcoes.CompletaOuRepete(codigo1 + '-' + copy(ClientDataSet1.FieldByName('descricao').AsString, 1,37 - length(codigo1)), '', ' ',40) + #13 + #10);
        end
        else begin
          addRelatorioForm19(funcoes.QuebraLinhas2('>','', codigo1 + '-' + ClientDataSet1.FieldByName('descricao').AsString, 40)) ;
        end;

       { form19.RichEdit1.Perform(EM_REPLACESEL, 1,
          Longint(PChar((funcoes.CompletaOuRepete(ClientDataSet1.FieldByName
          ('codigo').AsString + '-' + copy(ClientDataSet1.FieldByName
          ('descricao').AsString, 1,
          37 - length(ClientDataSet1.FieldByName('codigo').AsString)), '', ' ',
          40) + #13 + #10))));  }

        //addRelatorioForm19(funcoes.CompletaOuRepete('=>QTD:', FormatCurr('0.00',
        //addRelatorioForm19(funcoes.CompletaOuRepete('>'+LeftStr(ClientDataSet1unid.AsString, 4)+' ', FormatCurr('0.00',ClientDataSet1.FieldByName('quant').AsCurrency), ' ',
        addRelatorioForm19(funcoes.CompletaOuRepete('=>', FormatCurr('0.00', ClientDataSet1.FieldByName('quant').AsCurrency) + ' ' + LeftStr(ClientDataSet1.FieldByName('unid').AsString, 4), ' ',
          15) + funcoes.CompletaOuRepete('', FormatCurr('0.00',
          ClientDataSet1PRECO.AsCurrency), ' ', 12) + funcoes.CompletaOuRepete
          ('', FormatCurr('0.00', total_item), ' ', 13) + #13 + #10);
      end;

      if funcoes.buscaParamGeral(133, 'N') = 'S' then begin
        if (ClientDataSet1TOT_ORIGI2.AsCurrency - ClientDataSet1TOTAL.AsCurrency) > 0 then begin
          addRelatorioForm19(funcoes.CompletaOuRepete('-->Desconto R$', formataCurrency(ClientDataSet1TOT_ORIGI2.AsCurrency - ClientDataSet1TOTAL.AsCurrency), '.', 40) + CRLF);
          desconto := desconto  -(ClientDataSet1TOT_ORIGI2.AsCurrency - ClientDataSet1TOTAL.AsCurrency);
        end;
      end;

      if funcoes.buscaParamGeral(133, 'N') = 'X' then begin
        if (ClientDataSet1TOT_ORIGI2.AsCurrency - ClientDataSet1TOTAL.AsCurrency) > 0 then begin
          addRelatorioForm19(funcoes.CompletaOuRepete('-->Desconto R$', formataCurrency(ClientDataSet1TOT_ORIGI2.AsCurrency - ClientDataSet1TOTAL.AsCurrency), '.', 40) + CRLF);
          desconto := desconto  -(ClientDataSet1TOT_ORIGI2.AsCurrency - ClientDataSet1TOTAL.AsCurrency);
        end;

        if (ClientDataSet1TOT_ORIGI2.AsCurrency - ClientDataSet1TOTAL.AsCurrency) < 0 then begin
          addRelatorioForm19(funcoes.CompletaOuRepete('->Acrescimo R$', formataCurrency(ClientDataSet1TOTAL.AsCurrency - ClientDataSet1TOT_ORIGI2.AsCurrency), '.', 40) + CRLF);
          desconto := desconto  -(ClientDataSet1TOT_ORIGI2.AsCurrency - ClientDataSet1TOTAL.AsCurrency);
        end;
      end;



      dm.IBQuery2.Close;
      dm.IBQuery2.SQL.Text :=
        'select unid, fracao from produto where cod = :cod';
      dm.IBQuery2.ParamByName('cod').AsInteger :=
        ClientDataSet1CODIGO.AsInteger;
      dm.IBQuery2.Open;

      nomevol := 'VOLUMES:';
      if funcoes.buscaParamGeral(109, 'N') = 'S' then
      begin
        nomevol := 'Total M3:';
        p_venda0 := dm.IBQuery2.FieldByName('fracao').AsCurrency;
        if p_venda0 > 0 then
        begin
          totVolumes := totVolumes + (ClientDataSet1.FieldByName('quant')
            .AsCurrency * p_venda0);
        end;
      end
      else
      begin
        if contido('|' + dm.IBQuery2.FieldByName('unid').AsString + '|',
          form22.UnidInteiro) then
          totVolumes := totVolumes + 1
        else
          totVolumes := totVolumes + ClientDataSet1.FieldByName('quant')
            .AsCurrency;
      end;

      ClientDataSet1.Next;
    end;



    ClientDataSet1.EnableControls;

    if (funcoes.buscaParamGeral(81, 'N') = 'N')  then
    begin
      if Desconto < 0 then
      begin
        // form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(('DESCONTO('+FormatCurr('#,###,###0.00',(desconto * 100)/ total)+'%) ---------->'+funcoes.CompletaOuRepete('',formatCurr('#,###,###0.00',desconto),' ',11)+#13+#10))));
        addRelatorioForm19('VOCE ECONOMIZOU(' + FormatCurr('#,###,###0.00',(Desconto * 100) / total) + '%) --->' + funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00', Desconto), ' ', 11) + CRLF);
      end;

      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar((funcoes.CompletaOuRepete('', '', '-', 40) + #13+ #10))));

      if funcoes.buscaParamGeral(112, 'S') = 'S' then
      begin
        addRelatorioForm19(funcoes.CompletaOuRepete(nomevol,
          FormatCurr('#,###,###0.00' + IfThen(contido('M3', nomevol), '00', ''),
          totVolumes), '.', 40) + CRLF);
      end;
    end
    else begin
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar((funcoes.CompletaOuRepete('', '', '-', 40) + #13
        + #10))));

      if funcoes.buscaParamGeral(112, 'S') = 'S' then begin
        if Modo_Venda then begin
          addRelatorioForm19(funcoes.CompletaOuRepete(nomevol,
            FormatCurr('#,###,###0.00' + IfThen(contido('M3', nomevol), '00',
            ''), totVolumes), '.', 40) + CRLF);

          if Contido('MANO TIN', form22.Pgerais.Values['empresa']) then begin
            addRelatorioForm19('*'+CRLF);
          end;
        end;
      end;

      if desconto <> 0 then begin


      addRelatorioForm19(funcoes.CompletaOuRepete('SUBTOTAL:',
        FormatCurr('#,##,###0.00', total1 - Desconto), '.', 40) + CRLF);

      //ShowMessage(CurrToStr(desconto));
      if desconto < 0 then begin

      addRelatorioForm19(funcoes.CompletaOuRepete('DESCONTO(' +
        FormatCurr('#,###,###0.00', (Desconto * 100) / total) + '%):',
        FormatCurr('#,##,###0.00', Desconto), '.', 40) + CRLF);
      end
      else if desconto > 0 then begin
        if (funcoes.buscaParamGeral(81, 'N') = 'X')  then begin


        addRelatorioForm19(funcoes.CompletaOuRepete('ACRESCIMO(' +
        FormatCurr('#,###,###0.00', (Desconto * 100) / total) + '%):',
        FormatCurr('#,##,###0.00', Desconto), '.', 40) + CRLF);
        end;
      end;
    end;
    end;

    addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL:',
      FormatCurr('#,##,###0.00', total1), '.', 40) + CRLF);
    form19.RichEdit1.Perform(EM_REPLACESEL, 1,
      Longint(PChar((funcoes.CompletaOuRepete('', '', '-', 40) + #13 + #10))));

    if Modo_Orcamento then
    begin
      if (txt <> '') then
      begin
        addRelatorioForm19(funcoes.QuebraLinhas('', '', txt, 40));
        form19.RichEdit1.Perform(EM_REPLACESEL, 1,
          Longint(PChar((funcoes.CompletaOuRepete('', '', '-', 40) + #13
          + #10))));
      end;
    end
    else if Modo_Venda then
    begin
      if ((funcoes.LerConfig(form22.Pgerais.Values['configu'], 3) = 'S')) then
      begin
        if ((Modo_Venda) and (funcoes.LerConfig(form22.Pgerais.Values['configu'], 3) = 'S')) then begin
          txt := funcoes.dialogo('not', 70, '', 200, false, '',
            'Mensagem no Pedido1', 'Confirme:', txt);
          if txt = '*' then
            txt := '';
        end;

        if contido('NAO TEM VALOR', txt) = false then
        begin
          addRelatorioForm19(funcoes.QuebraLinhas('', '', txt, 40));
          if length(txt) > 0 then
            form19.RichEdit1.Perform(EM_REPLACESEL, 1,
              Longint(PChar((funcoes.CompletaOuRepete('', '', '-', 40) + #13
              + #10))));

          try
            funcoes.atualizaMensagemUsuario(txt, novocod);
          except
          end;
        end;
      end
      else begin
        if txt <> '' then begin
          addRelatorioForm19(funcoes.QuebraLinhas('', '', txt, 40));
          if length(txt) > 0 then
            form19.RichEdit1.Perform(EM_REPLACESEL, 1,
              Longint(PChar((funcoes.CompletaOuRepete('', '', '-', 40) + #13
              + #10))));
        end;

      end;
    end;


    if funcoes.buscaParamGeral(32, '') = 'S' then
    // parametros gerais de operacao de troco na venda
    begin
      if recebido <> 0 then
      begin
        funcoes.atualizaRecebido(recebido, StrToInt(novocod));

        // form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',40)+#13+#10))));
        addRelatorioForm19(funcoes.CompletaOuRepete('Pagto:. . . . . . . . . .',
          FormatCurr('#,###,###0.00', recebido), ' ', 40) + #13 + #10);
        addRelatorioForm19(funcoes.CompletaOuRepete('Troco:. . . . . . . . . .',
          FormatCurr('#,###,###0.00', troco), ' ', 40) + #13 + #10);
        form19.RichEdit1.Perform(EM_REPLACESEL, 1,
          Longint(PChar((funcoes.CompletaOuRepete('', '', '-', 40) + #13
          + #10))));
      end;
    end;

    if Compra then
      form19.RichEdit1.Perform(EM_REPLACESEL, 1,
        Longint(PChar(('* * *  *  *  *   COMPRA  *  *  *   * * *' +
        #13 + #10))))
    else if Modo_Orcamento then
    begin
      if funcoes.LerConfig(form22.Pgerais.Values['imp'], 1) = '8' then begin
         addRelatorioForm19('<ce><in>* * *   O R C A M E N T O  * * *</in></ce>' + #13+ #10);
      end
      else addRelatorioForm19('* * *       O R C A M E N T O      * * *' + #13+ #10);

      if Assigned(Parcelamento) then
      begin
        if (funcoes.buscaParamGeral(20, '') = 'S') and (Parcelamento.Values['total'] <> '*') then
          funcoes.ImprimeParcelamentoOrca(Parcelamento, '', '');
      end;

    end
    else
      //addRelatorioForm19('* * *   NAO  TEM  VALOR  FISCAL    * * *' + CRLF);

    if Modo_Venda then begin
      addRelatorioForm19(funcoes.imprimeEnderecoEntrega(tipo, CLIENTE_ENTREGA, JsEdit3.Text));

      if adicionarEntrega = 'S' then begin
        addRelatorioForm19('* * *   MERCADORIA PARA ENTREGA    * * *' + CRLF);
      end;
    end;

    if Assigned(Parcelamento) then
    begin
      if (funcoes.buscaParamGeral(20, '') = 'S') and (Modo_Venda) then begin
        if ((codhis = '2') or (vendaAPrazo)) then funcoes.ImprimeParcelamentoOrca(Parcelamento, '', '');
        //funcoes.ImprimeParcelamento('', '', FormatCurr('#,###,###0.00', StrToCurrDef(Parcelamento.Values['entrada'], 0)), novocod);
      end;
    end;

    if Modo_Venda then
    begin
      if funcoes.buscaParamGeral(88, 'N') = 'S' then
      begin
        addRelatorioForm19(' ' + CRLF);
        addRelatorioForm19(' ' + CRLF);
        ImprimeNota('DAV');
      end;
    end;
  end;

  dm.IBselect.Close;
  dm.IBQuery2.Close;
  dm.IBQuery1.Close;

  funcoes.salvaRicheditForm19comoPDF;

  funcoes.ImprimirPedidoVias(1, Modo_Orcamento);

  //imprime.notaVenda := novocod;

  if ((funcoes.buscaParamGeral(118, 'N') = 'S') and (Modo_Venda) and (tipo = 'T')) then begin
    funcoes.imprimeEnderecoEntregaCodEndereco(novocod, ENDE_ENTREGA);
  end;
  // Esta Funcao concatena os pedidos abaixo do outro
  // no Richedit do form19

  // imprime.textx('texto.txt');
end;

procedure TForm20.gravaOrcamento;
var
  cod, codmov, nome1, tipo: string;
begin
  if funcoes.buscaParamGeral(120, '') = 'S' then begin
    dm.IBQuery1.Close;
    dm.IBQuery1.SQL.Text := 'select nome from cliente where cod = :cod';
    dm.IBQuery1.ParamByName('cod').AsInteger := StrToInt(strnum(JsEdit3.Text));
    dm.IBQuery1.Open;

    NomeOrcamento := LeftStr(dm.IBQuery1.FieldByName('nome').AsString, 30);
    NomeOrcamento := funcoes.dialogo('normal',30,'',200,false,'','ControlW','Confirme o Nome:', NomeOrcamento);
    if NomeOrcamento = '*' then NomeOrcamento := '';
  end;


  ClientDataSet1.DisableControls;
  ClientDataSet1.First;

  //novocod := funcoes.novocod('orcamento');
  novocod := Incrementa_Generator('orcamento', 1);
  JsEdit1.Text := IntToStr(StrToIntDef(JsEdit1.Text, 0));

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Clear;
  dm.IBQuery1.SQL.Add
    ('insert into orcamento(nome,vendedor,cliente,nota,data,total,prazo,codhis, desconto)'
    + ' values(:nome,' + strnum(JsEdit2.Text) + ',' + strnum(JsEdit3.Text) + ',' +
    novocod + ',:data,:total,:prazo,' + strnum(codhis) + ', :desconto)');
  dm.IBQuery1.ParamByName('nome').AsString    := NomeOrcamento;
  dm.IBQuery1.ParamByName('data').AsDateTime  := form22.datamov;
  dm.IBQuery1.ParamByName('total').AsCurrency := total1;
  dm.IBQuery1.ParamByName('prazo').AsCurrency :=
    StrToCurr(funcoes.ConverteNumerico(JsEdit1.Text));
  dm.IBQuery1.ParamByName('desconto').AsCurrency := Desconto;
  // try
  dm.IBQuery1.ExecSQL;
  { Except
    dm.IBQuery1.Transaction.Rollback;
    exit;
    end; }

  // grava os itens da venda
  while not ClientDataSet1.Eof do
  begin
    nome1 := '';
    if ClientDataSet1m2.AsInteger > 0 then
      nome1 := ClientDataSet1DESCRICAO.AsString;

    cod := ClientDataSet1CODIGO.AsString;
    dm.IBQuery1.Close;
    dm.IBQuery1.SQL.Clear;
    dm.IBQuery1.SQL.Add
      ('insert into item_orcamento(nota, COD, QUANT, P_VENDA, total, DESCONTO, nome) '
      + 'values(' + novocod +
      ',:cod, :quant, :P_VENDA, :total, :DESCONTO, :nome)');
    dm.IBQuery1.ParamByName('cod').AsString := ClientDataSet1CODIGO.AsString;
    dm.IBQuery1.ParamByName('quant').AsCurrency :=
      StrToCurr(ClientDataSet1QUANT.AsString);
    dm.IBQuery1.ParamByName('P_VENDA').AsCurrency :=
      StrToCurr(ClientDataSet1PRECO.AsString);
    dm.IBQuery1.ParamByName('total').AsCurrency :=
      StrToCurr(ClientDataSet1TOTAL.AsString);
    dm.IBQuery1.ParamByName('DESCONTO').AsCurrency := ClientDataSet1TOT_ORIGI2.AsCurrency - ClientDataSet1TOTAL.AsCurrency;
    dm.IBQuery1.ParamByName('DESCONTO').AsCurrency := ClientDataSet1TOT_ORIGI2.AsCurrency - ClientDataSet1TOTAL.AsCurrency;
    dm.IBQuery1.ParamByName('nome').AsString := nome1;

   { if ClientDataSet1TOT_ORIGI2.AsCurrency = ClientDataSet1TOTAL.AsCurrency then dm.IBQuery1.ParamByName('TOT_ORIGI').AsCurrency := 0
    else dm.IBQuery1.ParamByName('tot_origi').AsCurrency := (ClientDataSet1TOT_ORIGI2.AsCurrency);
       }
    dm.IBQuery1.ExecSQL;
    ClientDataSet1.Next;
  end;

  dm.IBQuery1.Transaction.commit;

  dm.IBQuery1.Close;
  dm.produto.Close;
  dm.produto.Open;


  formataCamposPreco;
  funcoes.FormataCampos(dm.produto, 2, 'ESTOQUE', 3);
  funcoes.resizeCamposIdividualDBGRID(DBGrid1);
  ClientDataSet1.EnableControls;

  impNovo(2);

  limpatela;
  JsEditInteiro1.Text := IntToStr(StrToIntDef(novocod, 0) + 1);
  novocod := '';
end;

procedure TForm20.gravaCompra;
var
  cod, codmov: string;
begin
  ClientDataSet1.DisableControls;
  ClientDataSet1.First;

  novocod := funcoes.novocod('COMPRA');
  JsEdit1.Text := IntToStr(StrToIntDef(JsEdit1.Text, 0));

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Clear;
  dm.IBQuery1.SQL.Add
    ('insert into compra(vendedor,cliente,nota,data,total,prazo,codhis) values('
    + JsEdit2.Text + ',' + JsEdit3.Text + ',' + novocod +
    ',:data,:total,:prazo,' + codhis + ')');
  dm.IBQuery1.ParamByName('data').AsDateTime := form22.datamov;
  dm.IBQuery1.ParamByName('total').AsCurrency := total1;
  dm.IBQuery1.ParamByName('prazo').AsCurrency :=
    StrToCurr(funcoes.ConverteNumerico(JsEdit1.Text));
  dm.IBQuery1.ExecSQL;

  // grava os itens da venda
  while not ClientDataSet1.Eof do
  begin
    cod := ClientDataSet1CODIGO.AsString;
    dm.IBQuery1.Close;
    dm.IBQuery1.SQL.Clear;
    dm.IBQuery1.SQL.Add
      ('insert into item_compra(nota,COD, QUANT, p_compra) values(' + novocod +
      ',:cod, :quant, :com)');
    dm.IBQuery1.ParamByName('cod').AsString := ClientDataSet1CODIGO.AsString;
    dm.IBQuery1.ParamByName('quant').AsCurrency :=
      StrToCurr(ClientDataSet1QUANT.AsString);
    dm.IBQuery1.ParamByName('com').AsCurrency :=
      StrToCurr(ClientDataSet1PRECO.AsString);

    dm.IBQuery1.ExecSQL;

    ClientDataSet1.Next;
  end;

  dm.IBQuery1.Transaction.commit;

  dm.IBQuery1.Close;
  dm.produto.Close;
  dm.produto.Open;


  formataCamposPreco;

  if trim(ordemCompra) <> '' then
  begin
    funcoes.OrdenaCamposVenda(ordemCompra, true);
  end;

  funcoes.FormataCampos(dm.produto, 2, 'ESTOQUE', 3);
  funcoes.resizeCamposIdividualDBGRID(DBGrid1);

  ClientDataSet1.EnableControls;
  { fim := funcoes.dialogo('generico',0,'SN',0,false,'S','Control for Windows:','Imprime os Preços das Mercadorias? S/N','S');

    if fim = 'S' then test := 1
    else test := 0; }
  ImprimeNota;
  // funcoes.GeraNota(novocod,form22.Pgerais.Values['nota'],'S',false);
  limpatela;
  JsEditInteiro1.Text := IntToStr(StrToIntDef(novocod, 0) + 1);
  novocod := '';
end;

procedure TForm20.BuscaSelecao;
var
  busca, metodo, campos: string;
begin
  busca := funcoes.dialogo('normal', 3, '', 60, true, '', 'ControlW',
    'Selecionar Por:', '');
  if busca = '*' then
    exit;

  dm.IBQuery2.Close;
  dm.IBQuery2.SQL.Clear;

  metodo := funcoes.buscaParamGeral(47, '2');
  if funcoes.buscaParamGeral(61, 'N') = 'S' then
    campos := 'refori,nome as descricao, quant, p_venda as preco, codbar,cod'
  else if funcoes.buscaParamGeral(61, 'N') = 'C' then
    campos := 'codbar,nome as descricao, quant, p_venda as preco, codbar,cod'
  else
    campos := 'cod,nome as descricao, quant, p_venda as preco, codbar';

  if metodo = '2' then
    dm.IBQuery2.SQL.Add('select ' + campos + ' from produto where (nome like ' +
      QuotedStr('%' + busca + '%') + ') '+condicaoSQL+' ORDER BY NOME')
  else if metodo = '1' then
    dm.IBQuery2.SQL.Add('select ' + campos + ' from produto where (nome like ' +
      QuotedStr(busca + '%') + ') '+condicaoSQL+' ORDER BY NOME');
  dm.IBQuery2.Open;

  busca := funcoes.busca(dm.IBQuery2, busca, '', 'cod', 'descricao');
  if busca = '' then
    exit;

  funcoes.ordernaDataSetVenda('descricao', busca, sqlVenda, DBGrid1, '',
    ordenaCampos);

  if funcoes.buscaParamGeral(89, 'N') = 'S' then
  begin
    funcoes.OrdenaCamposVenda(funcoes.buscaParamGeral(1, ''));
  end;
  // DBGrid1.DataSource.DataSet.Locate('cod',busca,[loPartialKey]);
end;

procedure TForm20.SetaModo;
begin
  if not Modo_Venda then
  begin
    Form20.Modo_Venda := false;
    Form20.origem := 1;
    Form20.Modo_Orcamento := true;
    Form20.saidaDeEstoque := false;
    Modo_Venda := false;
    Form20.Caption := 'Modo Orçamento: ' + cliente;
    Label5.Caption := 'Itens do Orçamento';
    Label5.update;
    tipoV := 'XO';
    exit;
  end;

  Modo_Venda := true;
  Form20.Caption := 'Modo Venda: ' + cliente;
  Label5.Caption := 'Itens da Venda';
  tipoV := 'XV';
  Label5.update;
end;

function TForm20.RetornaString_Modo_Venda_ou_Orcamento: string;
begin
  if Modo_Venda then
    Result := 'Modo Venda: '
  else
    Result := 'Modo Orçamento: ';
end;

function TForm20.VerificaForma_de_Pagamento_e_Prazo: Smallint;
begin

  //se nao informou o desconto em F1 entao busca os dados da forma
  //de pagamento pra ver se esta preenchido com P para lançar nas vendas a prazo
  if funcoes.buscaParamGeral(105, 'N') = 'S' then begin
    if aprazoFormaDiferenteDe2 = '' then begin
      dm.IBselect.Close;
      dm.IBselect.SQL.Text := 'select dinheiro, desc_pag, imp_fiscal from FORMPAGTO where cod = :cod';
      dm.IBselect.ParamByName('cod').AsInteger := StrToIntDef(codhis, 0);
      dm.IBselect.Open;

      dinheiro := trim(dm.IBselect.FieldByName('dinheiro').AsString);
      aprazoFormaDiferenteDe2 := trim(dm.IBselect.FieldByName('imp_fiscal').AsString);
    end;
  end
  else begin
    aprazoFormaDiferenteDe2 := form2.formaPagtosAprazo.Values[codhis];
  end;

  if ((codhis = '2') or (aprazoFormaDiferenteDe2 = 'P')) then vendaAPrazo := true;
  
  //if aprazoFormaDiferenteDe2 = 'P' then codhis := '2';

  if (StrToIntDef(codhis, 0) = 1) then
  begin
    exit;
  end;

  if (StrToIntDef(codhis, 0) <> 2) then begin
    if aprazoFormaDiferenteDe2 = '' then exit;
  end;



  if (vendaAPrazo) and (StrToIntDef(JsEdit1.Text, 0) = 0) then
  begin
    total_A_Limitar := ver_limites(JsEdit3.Text, total1);
    if total_A_Limitar = 0 then
    begin
      cliente := funcoes.dialogo('generico', 3, '1234567890' + #8, 50, false,'', application.Title, 'Qual o Código do Cliente?', '');
      if (cliente = '') then
      begin
        cliente := funcoes.localizar('Localizar Cliente', 'cliente',
          'cod,nome,telres,telcom,cnpj,bairro', 'cod', '', 'nome', 'nome',
          false, false, false, '', 500, nil);
      end;
      if (cliente = '') or (cliente = '*') then
      begin
        Result := 0;
        exit;
      end;

      // if (funcoes.LerConfig(form22.Pgerais.Values['configu'], 6) <> 'N') then
      // begin

      total_A_Limitar := ver_limites(cliente, total1);

      if (funcoes.LerConfig(form22.Pgerais.Values['configu'], 6) = 'N') then
        total_A_Limitar := -1;
      if total_A_Limitar = 0 then
      begin
        Result := 0;
        exit;
      end
      else if (total_A_Limitar < 0) or (total_A_Limitar > 0) then
      begin
        JsEdit3.Text := cliente;
        cliente := funcoes.BuscaNomeBD(dm.IBselect, 'nome', 'cliente',
          'where cod=' + cliente);
        // SetaModo;

        if Parcelamento.Values['total'] = '*' then
        begin
          WWMessage(
            'Não foi encontrado PARCELAMENTO, Favor Preencha os dados de Parcelamento',
            mtWarning, [mbok], HexToTColor('FFD700'), true, false,
            HexToTColor('B22222'));
          Result := 0;
          exit;
        end;
        { fim := funcoes.dialogo('generico',5,'1234567890'+#8,30,false,'',Application.Title,'Quantos Dias De Prazo?','30');
          if fim = '*' then
          begin
          Result := 0;
          exit;
          end;
        }
        // novocod := funcoes.novocod('venda');
      end;


      //GeraParcelamento();
      podeGravarParcelamentoTabela := 1;
      exit;
      // end;
    end
    else if (total_A_Limitar < 0) or (total_A_Limitar > 0) then
    begin
      cliente := funcoes.BuscaNomeBD(dm.IBselect, 'nome', 'cliente',
        'where cod=' + JsEdit3.Text);
      // Parcelamento := funcoes.Parcelamento(total1,'*',JsEdit1.Text);

      if Parcelamento.Values['total'] = '*' then
      begin
        WWMessage(
          'Não foi encontrado PARCELAMENTO, Favor Preencha os dados de Parcelamento',
          mtWarning, [mbok], HexToTColor('FFD700'), true, false,
          HexToTColor('B22222'));
        // Parcelamento := funcoes.Parcelamento(total1, '*', JsEdit1.Text);
        Result := 0;
        exit;
      end;
      // fim := funcoes.dialogo('generico',5,'1234567890'+#8,30,false,'',Application.Title,'Quantos Dias De Prazo?','30');
      if fim = '*' then
      begin
        Result := 0;
        exit;
      end;

      //GeraParcelamento;
      podeGravarParcelamentoTabela := 1;
      exit;
    end;
  end;

  if (StrToIntDef(JsEdit1.Text, 0) > 0) then
  begin
    podeGravarParcelamentoTabela := 1;
    //GeraParcelamento;
  end;
end;

procedure TForm20.AddSegundaClienteDataSet(quanti, valor: currency;
  nome: String = ''; m2: integer = 0);
var
  cod, busca: string;
  v2, qtd, vtot, totProd, tmp: currency;
  fla, grupo, tam, cont: Smallint;
begin
  fla := 0;
  cont := 0;
  totProd := 0;

  // adiciona item na segunda tabela
  if quanti <> 0 then
    busca := CurrToStr(quanti)
  else
  begin
    busca := funcoes.dialogo('numero', 0, '1234567890,.' + #8, CasasDecimaisQuantidade, false, '',
      'Control For Windows', 'Quantidade:', '0,'+ CompletaOuRepete('','','0', CasasDecimaisQuantidade));
    if (busca = '*') or (busca[1] + busca[2] + busca[3] = '0,0') then
      exit;
    busca := funcoes.ConverteNumerico(busca);
  end;

  qtd := StrToCurrDef(busca, 0);
  if qtd = 0 then
    exit;

  if m2 = 0 then
  begin
    if funcoes.verificaSePodeVenderFracionado(dm.produto.FieldByName('cod')
      .AsInteger, dm.produto.FieldByName('unid').AsString, qtd) = false then
      exit;
  end;

  vtot := somaValor;

  if valor <> 0 then
    v2 := valor
  else
  begin
    v2 := dm.produto.FieldByName('PRECO').AsCurrency;
  end;

  // if funcoes.buscaParamGeral(55, 'N') <> 'S' then begin
  tmp := buscaPreco(dm.produto.FieldByName('cod').AsInteger, qtd);

  if tmp <> 0 then
  begin
    valor := tmp;
    v2 := tmp;
  end;
  // end;

  // if valor <> 0 then v2 := valor;

  // if valor = 0 then valor := dm.produto.FieldByName('PRECO').AsCurrency;

  if qtd > 200000 then
  begin
    ShowMessage('Quantidade não suportada. Máx. 50.000');
    exit;
  end;

  cod := dm.produto.FieldByName('cod').AsString;

  if valor = 0 then
    valor := v2;

  if (((total_A_Limitar >= vtot + (Arredonda(qtd * v2, 2))) or
    (total_A_Limitar < 0)) and (StrToIntDef(JsEdit1.Text, 0) > 0) or
    ((StrToIntDef(JsEdit1.Text, 0) = 0))) then
  begin
    // se o cod existir soma a qtd de entrada
    if limitar_QTD_Estoque(qtd, StrToInt(cod)) then
    begin
      // if ClientDataSet1.Locate('codigo',dm.produto.fieldbyname('cod').AsString,[]) then
      if buscaProdutoCDS(dm.produto.FieldByName('cod').AsString, valor, nome, m2)
      then
      begin
        grupo := ClientDataSet1grupo.AsInteger;
        if not saidaDeEstoque then
          totProd := Arredonda((ClientDataSet1.FieldByName('quant').AsCurrency +
            qtd) * v2, 2);

        ClientDataSet1.Open;
        ClientDataSet1.Edit;
        ClientDataSet1.FieldByName('quant').AsCurrency :=
          ClientDataSet1.FieldByName('quant').AsCurrency + qtd;
        ClientDataSet1PRECO.AsCurrency := v2;

        if funcoes.buscaParamGeral(71, 'N') = 'S' then
        begin
          if v2 > ClientDataSet1PRECO_ORIGI.AsCurrency then
          begin
            ClientDataSet1PRECO_ORIGI.AsCurrency := v2;
          end;
        end;

        ClientDataSet1.FieldByName('total').AsCurrency := totProd;
        ClientDataSet1TOT_ORIGI2.AsCurrency :=
          Arredonda(ClientDataSet1.FieldByName('quant').AsCurrency *
          ClientDataSet1PRECO_ORIGI.AsCurrency, 2);
        ClientDataSet1.Post;

        // precoPromocaoGrupo(grupo, ClientDataSet1);
      end
      // se nao existir add um novo
      else
      begin
        dm.IBQuery4.Close;
        dm.IBQuery4.SQL.Text :=
          'select nome,grupo from produto where cod = :cod';
        dm.IBQuery4.ParamByName('cod').AsInteger :=
          dm.produto.FieldByName('cod').AsInteger;
        dm.IBQuery4.Open;

        grupo := StrToIntDef(dm.IBQuery4.FieldByName('grupo').AsString, 0);
        if nome = '' then
          nome := dm.IBQuery4.FieldByName('nome').AsString;

        // ClientDataSet1.Open;
        tam := length(dm.produto.FieldByName('descricao').AsString);
        ClientDataSet1.Insert;
        ClientDataSet1m2.AsInteger := m2;
        ClientDataSet1minimo.AsCurrency :=
          buscaDesconto(dm.produto.FieldByName('cod').AsInteger);
        ClientDataSet1.FieldByName('codigo').AsString :=
          dm.produto.FieldByName('cod').AsString;
        ClientDataSet1DESCRICAO.Text := nome;
        ClientDataSet1.FieldByName('quant').AsCurrency := qtd;
        ClientDataSet1.FieldByName('preco').AsCurrency := v2;
        ClientDataSet1Refori.AsString :=
          dm.produto.FieldByName('codbar').AsString;

        ClientDataSet1unid.AsString := dm.produto.FieldByName('unid').AsString;
        ClientDataSet1.FieldByName('grupo').AsInteger :=
          StrToIntDef(dm.IBQuery4.FieldByName('grupo').AsString, 0);

        if not saidaDeEstoque then
          totProd := Arredonda(qtd * v2, 2);

        ClientDataSet1.FieldByName('total').AsCurrency := totProd;
        // ClientDataSet1PRECO_ORIGI.AsCurrency := StrToCurr(FormatCurr('0.00', dm.produto.fieldbyname('preco').AsCurrency));

        if funcoes.buscaParamGeral(71, 'N') = 'S' then
        begin
          if v2 > dm.produto.FieldByName('preco').AsCurrency then
          begin
            ClientDataSet1PRECO_ORIGI.AsCurrency := v2;
          end;
        end
        else
          ClientDataSet1PRECO_ORIGI.AsCurrency :=
            dm.produto.FieldByName('preco').AsCurrency;

        ClientDataSet1TOT_ORIGI2.AsCurrency :=
          Arredonda(qtd * dm.produto.FieldByName('preco').AsCurrency, 2);
        ClientDataSet1cod_seq.AsInteger := numReg;
        ClientDataSet1vendedor.AsInteger := StrToInt(strnum(JsEdit2.Text));
        ClientDataSet1estado.AsString := 'N';
        ClientDataSet1.Post;

        // precoPromocaoGrupo(grupo, ClientDataSet1);
        fla := 1;

      end;
    end;
    escrveValor;
    // total.Caption := CurrToStrf(Arredonda(StrToCurr(ClientDataSet1p_total.AsString),2),ffCurrency, 2);
    dm.IBQuery1.Close;

  end
  else if (not(total_A_Limitar > vtot + Arredonda((qtd * v2), 2)) or
    (total_A_Limitar = -1)) and (StrToIntDef(JsEdit1.Text, 0) > 0) then
  begin
    WWMessage('Este Cliente Excedeu Seu Limite de Crédito.', mtInformation,
      [mbok], HexToTColor('FFD700'), true, false, HexToTColor('B22222'));
    exit;
  end;

  { if (StrToInt(JsEdit1.Text) = 0) then
    begin
    if limitar_QTD_Estoque(StrToCurr(busca)) then
    begin
    if ClientDataSet1.Locate('codigo',dm.produto.fieldbyname('cod').AsString,[]) then
    begin
    ClientDataSet1.Open;
    ClientDataSet1.Edit;

    ClientDataSet1.FieldByName('quant').AsCurrency := ClientDataSet1.FieldByName('quant').AsCurrency+StrToCurr(busca);
    ClientDataSet1.Post;

    ClientDataSet1.Open;
    ClientDataSet1.Edit;
    ClientDataSet1.FieldByName('total').AsCurrency := Arredonda(ClientDataSet1.FieldByName('quant').AsCurrency * v2,2);
    ClientDataSet1.Post;
    end
    //se nao existir add um novo
    else
    begin
    ClientDataSet1.Open;
    ClientDataSet1.Insert;
    ClientDataSet1.FieldByName('codigo').AsString := dm.produto.fieldbyname('cod').AsString;
    ClientDataSet1.FieldByName('descricao').AsString := dm.produto.fieldbyname('descricao').AsString;
    ClientDataSet1.FieldByName('quant').AsCurrency := StrToCurr(busca);
    ClientDataSet1.FieldByName('preco').AsCurrency := v2;
    ClientDataSet1.FieldByName('total').AsCurrency := Arredonda(StrToCurr(busca) * v2,2);
    ClientDataSet1.Post;
    end;
    total.Caption := CurrToStrf(Arredonda(StrToCurr(ClientDataSet1p_total.AsString),2),ffCurrency, 2);
    end;
    end; }
  if fla = 1 then
    ClientDataSet1.Last;
  ClientDataSet1.EnableControls;

end;

procedure TForm20.lancaDescontoComDescItem;
var
  temp2, temp1, total31, totalOriginal, descDado: currency;
  fim, desc, tipoDesconto: string;
  teveDesconto: boolean;
begin
  if saidaDeEstoque = true then
  begin
    Desconto := 0;
    exit;
  end;

  if total1 = 0 then
  begin
    Desconto := 0;
    exit;
  end;

  tipoDesconto := funcoes.buscaParamGeral(2, '');

  total31 := total1;
  // minimo é o valor maximo que pode ser dado de desconto em reais
  minimo := CalculaMinimoVendaCDS1(descDado, totalOriginal, teveDesconto);

  minimo := total1 - minimo;

  total31 := totalOriginal;
  // totalOriginal := total1;

  if tipoDesconto = 'S' then
  begin
    total31 := total31 - minimo;
    fim := '-999999';
    while true do
    begin
      fim := funcoes.dialogo('numero', 0, '1234567890,.' + #8, 0, false, 'ok',
        'Control for Windows:', 'Confirme o Valor Total (Mínimo ' +
        FormatCurr('#,###,###0.00', minimo) + '):',
        FormatCurr('###,##0.00', total1));
      if fim = '*' then
      begin
        temp1 := total1;
        break;
      end;

      temp1 := StrToCurrDef(fim, 0);

      if ((funcoes.LerConfig(form22.Pgerais.Values['configu'], 8) = 'S') and
        (temp1 > totalOriginal)) then
        break;
      if (((temp1 >= minimo) and (temp1 <= minimo)) or
        ((temp1 > totalOriginal) and
        VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false)) then
      begin
        break;
      end;
      if ((temp1 < minimo) and
        (VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false)) then
        break;
    end;

    Desconto := (totalOriginal - temp1);

    mostraDesconto(totalOriginal, Desconto, true);

    Desconto := -Desconto;
    total1 := total1 + Desconto;

    exit;
  end
  else if tipoDesconto = 'N' then
  begin
    // descProdutos
    temp1 := funcoes.ArredondaTrunca((totalOriginal - minimo - descDado) /
      total1 * 100, 2);

    desc := '99999999';
    while true do
    begin
      desc := funcoes.dialogo('numero', 0, '1234567890,.' + #8, 0, false, 'ok',
        'Control for Windows:', 'Qual o Percentual de Desconto (Máximo=' +
        FormatCurr('#,###,###0.00', temp1) + '%) (%)?:', '0,00');
      if desc = '*' then
      begin
        desc := '0';
        break;
      end;

      if (StrToCurrDef(desc, 0) = temp1) then
        break;
      if ((StrToCurr(desc) > temp1) and
        (VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false)) then
        break;

      if (StrToCurr(desc) <= temp1) then
        break;
    end;

    temp1 := StrToCurrDef(desc, 0);
    // temp1 := temp1 + porcentUtilizada;
    // somei o que ja foi usado mais o que o usuario deu na venda

    // descProdutos
    Desconto := funcoes.ArredondaTrunca((total1 * temp1) / 100, 2) + descDado;

    mostraDesconto(totalOriginal, Desconto, true);
    Desconto := -Desconto;
    total1 := total1 + Desconto;
  end
  else if tipoDesconto = 'X' then
  begin
    temp1 := funcoes.ArredondaTrunca((totalOriginal - minimo - descDado) /
      total1 * 100, 2);
    total31 := totalOriginal - minimo;
    desc := '99999999';
    while true do
    begin
      desc := funcoes.ConverteNumerico(funcoes.dialogo('numero', 0,
        '1234567890,.' + #8, 0, false, 'ok', 'Control for Windows:',
        'Qual o Percentual de Desconto (Máximo=' + FormatCurr('#,###,###0.00',
        temp1) + '%) (%)?:', '0,00'));
      if desc = '*' then
      begin
        desc := '0';
        break;
      end;

      if (StrToCurrDef(desc, 0) = temp1) then
      begin
        break;
      end;
      if ((StrToCurr(desc) > temp1) and
        (VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false)) then
      begin
        break;
      end;

      if (StrToCurr(desc) <= temp1) then
      begin
        break;
      end;
    end;

    temp1 := StrToCurrDef(desc, 0);
    // descProdutos
    Desconto := funcoes.ArredondaTrunca((total1 * temp1) / 100, 2) + descDado;

    mostraDesconto(totalOriginal, Desconto, true);
    Desconto := -Desconto;

    total1 := totalOriginal + Desconto;
    total31 := minimo;

    fim := '-999999';
    while true do
    begin
      fim := funcoes.dialogo('numero', 0, '1234567890,.' + #8, 0, false, 'ok',
        'Control for Windows:', 'Confirme o Valor Total (Mínimo ' +
        FormatCurr('#,###,###0.00', minimo) + '):',
        FormatCurr('###,##0.00', total1));

      if fim = '*' then
      begin
        temp1 := total1;
        break;
      end;

      temp1 := StrToCurrDef(fim, 0);

      if ((funcoes.LerConfig(form22.Pgerais.Values['configu'], 8) = 'S') and
        (temp1 > total1)) then
      begin
        break;
      end;
      if (((temp1 >= total31) and (temp1 <= total1)) or
        ((temp1 > total1) and
        VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false)) then
      begin
        break;
      end;
      if ((temp1 < total31) and
        (VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false)) then
      begin
        break;
      end;
    end;

    Desconto := (totalOriginal - temp1);
    mostraDesconto(totalOriginal, Desconto, true);

    Desconto := -Desconto;
    total1 := totalOriginal + Desconto;

    exit;
  end;

end;

procedure TForm20.BuscaCodBar_F6_AutoPecas(busc4: String;
  tipoBusca1: String = '');
var
  busca, metodo: string;
  prodcodbar: TprodutoVendaCodBar;
begin
  if busc4 = '' then
    busca := funcoes.dialogo('normal', 3, '', 60, true, '', 'ControlW',
      'Informe um Código:', '')
  else
    busca := busc4;


  if ((busca = '*') or (busca = '')) then
    exit;

  if funcoes.buscaParamGeral(108, 'N') = 'S' then
  begin
    if ((LeftStr(busca, 1) = '2') and (length(busca) = 13) and
      (funcoes.buscaParamGeral(38, '3') <> '3')) then
    begin
      prodcodbar := le_codbar1(dm.IBQuery2, busca,
        funcoes.buscaParamGeral(38, '3'));

      if prodcodbar.codbar <> '*' then
      begin
        AddProdutoCDS_Generico(prodcodbar.cod, prodcodbar.quant,
          prodcodbar.Preco, false);
        exit;
      end
    end;
  end;

  dm.produtotemp.Close;
  dm.produtotemp.SQL.Clear;

  metodo := funcoes.buscaParamGeral(47, '2');

  if metodo = '2' then
    dm.produtotemp.SQL.Add
      ('select p.codbar,nome as Descricao,p_venda as Preco,quant as estoque,p.cod from produto p left join codbarras c on (c.cod = p.cod) where (p.codbar = '
      + QuotedStr(busca) + ') or (c.codbar = ' + QuotedStr(busca) + ')')
  else if metodo = '1' then
    dm.produtotemp.SQL.Add
      ('select p.codbar,nome as Descricao,p_venda as Preco,quant as estoque,p.cod from produto p left join codbarras c on (c.cod = p.cod) where (p.codbar = '
      + QuotedStr(busca) + ') or (c.codbar = ' + QuotedStr(busca) + ')');

  if tipoBusca1 <> '' then
    metodo := tipoBusca1;
  if metodo = '3' then
    dm.produtotemp.SQL.Text :=
      ('select p.codbar,nome as Descricao,p_venda as Preco,quant as estoque,p.cod from produto p left join codbarras c on (c.cod = p.cod) where (p.codbar like '
      + QuotedStr('%' + busca + '%') + ') or (c.codbar like ' +
      QuotedStr('%' + busca + '%') + ')');

  // dm.produtotemp.SQL.Add('select p.codbar,nome as Descricao,p_venda as Preco,quant as estoque,p.cod from produto p left join codbarras c on (c.cod = p.cod) where (p.codbar like '+QuotedStr('%'+ busca +'%')+') or (c.codbar like '+QuotedStr('%'+ busca +'%')+')');
  // dm.produtotemp.SQL.Add('select codbar,nome as Descricao,p_venda as Preco,quant as estoque,cod from produto p where (p.codbar like '+QuotedStr('%'+ busca +'%')+') or (p.cod = (select cod from codbarras where codbar like '+QuotedStr('%'+ busca +'%')+'))');

  form25 := TForm25.Create(self);
  funcoes.CtrlResize(TForm(form25));
  form25.Caption := 'Consulta de Produto por Código de Barras';
  dm.produtotemp.Open;
  funcoes.FormataCampos(dm.produtotemp, 2, '', 2);
  form25.DBGrid1.DataSource := dm.dsprodtemp;

  if not dm.produtotemp.IsEmpty then
  begin
    form25.ShowModal;
  end
  else
    ShowMessage('Nenhum resultado encontrado');
  dm.produtotemp.Close;
  dm.produtotemp.SQL.Clear;
  dm.produtotemp.SQL.Add
    ('select codbar,nome as Descricao,p_venda as Preco,quant as estoque,cod from produto order by nome');
end;

function TForm20.adicioinaItem_Venda(cod: string; qtd: currency;
  Preco: currency = 0; abrirTabelaProduto: boolean = false; nome1: String = '';
  vendedor: String = ''): boolean;
var
  fla, m2, vend: Smallint;
  qery: TFDQuery;
begin
  fla := 0;

  if ((abrirTabelaProduto) or (funcoes.buscaParamGeral(62, 'N') = 'S')) then
  begin
    dm.IBQuery2.Close;
    dm.IBQuery2.SQL.Text :=
      'SELECT cod, nome as descricao, p_venda as preco, codbar, unid from produto where cod = :cod';
    dm.IBQuery2.ParamByName('cod').AsString := cod;
    dm.IBQuery2.Open;
    qery := dm.IBQuery2;
  end
  else
  begin
    qery := dm.produto;
    qery.Locate('cod', cod, []);
  end;

  m2 := 1;
  if nome1 = '' then
  begin
    nome1 := qery.FieldByName('descricao').AsString;
    m2 := 0;
  end;

  { if funcoes.buscaParamGeral(62, 'N') = 'S' then begin
    dm.IBQuery4.Close;
    dm.IBQuery4.SQL.Text := 'cod, nome as descricao, p_venda as preco from produto where cod = :cod';
    dm.IBQuery4.ParamByName('cod').AsString := cod;
    dm.IBQuery4.Open;
    qery := dm.IBQuery4;

    end
    else begin }
  // end;

  // se param geral 106 estiver habilitado entao pega o preco atualizado do estoque
  if ((Preco = 0) or (funcoes.buscaParamGeral(106, 'N') = 'S')) then
    Preco := qery.FieldByName('PRECO').AsCurrency;

  if ((funcoes.buscaParamGeral(63, 'N') = 'N') and
    (ClientDataSet1.Locate('codigo', qery.FieldByName('cod').AsString, [])))
  then
  begin
    ClientDataSet1.Open;
    ClientDataSet1.Edit;
    ClientDataSet1.FieldByName('quant').AsCurrency :=
      ClientDataSet1.FieldByName('quant').AsCurrency + qtd;

    if saidaDeEstoque then
    begin
      ClientDataSet1.FieldByName('total').AsCurrency := 0;
      ClientDataSet1TOT_ORIGI2.AsCurrency := 0;
    end
    else
    begin
      ClientDataSet1.FieldByName('total').AsCurrency :=
        Arredonda((ClientDataSet1.FieldByName('quant').AsCurrency) * Preco, 2);
      ClientDataSet1TOT_ORIGI2.AsCurrency :=
        Arredonda(ClientDataSet1.FieldByName('quant').AsCurrency *
        ClientDataSet1PRECO_ORIGI.AsCurrency, 2);
    end;
    ClientDataSet1.Post;
  end
  // se nao existir add um novo
  else
  begin
    ClientDataSet1.Open;
    ClientDataSet1.Insert;
    ClientDataSet1minimo.AsCurrency :=
      buscaDesconto(qery.FieldByName('cod').AsInteger);
    ClientDataSet1.FieldByName('codigo').AsString :=
      qery.FieldByName('cod').AsString;
    ClientDataSet1.FieldByName('descricao').AsString := nome1;
    ClientDataSet1m2.AsInteger := m2;
    {try
      ClientDataSet1unid.AsString := qery.FieldByName('unid').AsString;
    except
      ClientDataSet1unid.AsString := 'UN';
    end; }
    ClientDataSet1.FieldByName('quant').AsCurrency := qtd;
    ClientDataSet1.FieldByName('preco').AsCurrency := Preco;
    ClientDataSet1Refori.AsString := qery.FieldByName('codbar').AsString;
    if saidaDeEstoque then
    begin
      ClientDataSet1.FieldByName('total').AsCurrency := 0;
      ClientDataSet1TOT_ORIGI2.AsCurrency := 0;
    end
    else
    begin
      ClientDataSet1.FieldByName('total').AsCurrency :=
        Arredonda(qtd * Preco, 2);
      /// Arredonda(qtd * dm.produto.fieldbyname('PRECO').AsCurrency,2);
      ClientDataSet1TOT_ORIGI2.AsCurrency :=
        Arredonda(qtd * qery.FieldByName('PRECO').AsCurrency, 2);
    end;

    ClientDataSet1.FieldByName('PRECO_ORIGI').AsCurrency :=
      qery.FieldByName('PRECO').AsCurrency;

    ClientDataSet1cod_seq.AsInteger := numReg;

    if StrToIntDef(vendedor, 0) = 0 then
      vendedor := strnum(JsEdit2.Text);
    ClientDataSet1vendedor.AsInteger := StrToInt(vendedor);
    ClientDataSet1estado.AsString := 'I';
    ClientDataSet1.Post;
    fla := 1;
  end;

  if fla = 1 then
    ClientDataSet1.Last;
  if qery.Name = 'IBQuery2' then
    qery.Close;
end;

function TForm20.limitar_QTD_Estoque(quant: currency; cod: integer;
  buscaCDS: boolean = true): boolean;
var
  campo: string;
begin


  if origem = 1 then
    campo := 'quant'
  else
    campo := 'deposito';
  Result := true;

  if Compra then exit;
  

  dm.IBQuery4.Close;
  dm.IBQuery4.SQL.Text := 'select ' + campo + ' from produto where cod = :cod';
  dm.IBQuery4.ParamByName('cod').AsInteger := cod;
  dm.IBQuery4.Open;

  if buscaCDS then
  begin
    if ClientDataSet1.Locate('codigo', cod, []) then
    begin
      quant := quant + ClientDataSet1QUANT.AsCurrency;
    end;
  end;

  if quant > dm.IBQuery4.FieldByName(campo).AsCurrency then
  begin
    if funcoes.LerConfig(form22.Pgerais.Values['configu'], 7) <> 'N' then
    // permitir venda sem estoque disponivel
    begin
      WWMessage('A Venda Esta Sendo Feita Sem Estoque Disponivel',
        mtInformation, [mbok], HexToTColor('FFD700'), true, false,
        HexToTColor('FE3C3C'));
    end
    else
    begin
      WWMessage('O Produto Nao Tem Estoque Disponivel', mtInformation, [mbok],
        HexToTColor('FFD700'), true, false, HexToTColor('B22222'));
      Result := false;
    end;
  end;

  dm.IBQuery4.Close;
end;

function TForm20.ver_limites(CodUsu: string;
  AserAdicionadoNaContaDoClitente: currency): currency;
var
  total_devendo, total_atraso, maiorLimite: currency;
begin
  try
    dm.IBselect.Close;
    dm.IBselect.SQL.Clear;
    dm.IBselect.SQL.Add
      ('select ativo, lim_atraso, lim_compra, nome from cliente where cod = :cod');
    dm.IBselect.ParamByName('cod').AsString := CodUsu;
    dm.IBselect.Open;
  except
    ShowMessage('Verifique se o Cliente foi digitado corretamente');
    exit;
  end;

  if dm.IBselect.IsEmpty then
  begin
    WWMessage('O Cliente Não Existe!', mtInformation, [mbok],
      HexToTColor('FFD700'), true, false, HexToTColor('B22222'));
    dm.IBselect.Close;
    Result := 0;
    exit;
  end;

  clienteNome := dm.IBselect.FieldByName('nome').AsString;
  ativo := dm.IBselect.FieldByName('ativo').AsString;
  lim_atraso := dm.IBselect.FieldByName('lim_atraso').AsCurrency;
  lim_compra := dm.IBselect.FieldByName('lim_compra').AsCurrency;
  dm.IBselect.Close;

  if ativo = 'N' then
  begin
    WWMessage('Atenção! A Venda à Prazo Para Este Cliente Não Está Autorizada',
      mtInformation, [mbok], HexToTColor('FFD700'), true, false,
      HexToTColor('B22222'));
    Result := 0;
    exit;
  end;

  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add
    ('select sum(valor) as valor from contasreceber where (documento = :cod) and (pago = 0)');
  dm.IBselect.ParamByName('cod').AsString := CodUsu;
  dm.IBselect.Open;
  total_devendo := dm.IBselect.FieldByName('valor').AsCurrency;

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add
    ('select sum(valor) as valor from contasreceber where (documento = :cod) and (:d > vencimento) and (pago = 0)');
  dm.IBselect.ParamByName('cod').AsString := CodUsu;
  dm.IBselect.ParamByName('d').AsDateTime := form22.datamov;

  dm.IBselect.Open;
  total_atraso := dm.IBselect.FieldByName('valor').AsCurrency;
  dm.IBselect.Close;

  if ((total_devendo = 0) and (lim_compra = 0) and (lim_atraso = 0)) then
  begin
    Result := -1;
    exit;
  end;

  if (lim_compra = 0) and (total_atraso = 0) then
  begin
    Result := -1;
    exit;
  end;

  if (total_devendo + AserAdicionadoNaContaDoClitente >= lim_compra) and
    (lim_compra <> 0) then
  begin
    WWMessage('Este cliente tem um limite para Compras de R$ ' +
      FormatCurr('#,###,###0.00', lim_compra) +
      ' e já fez compras no valor de R$ ' + FormatCurr('#,###,###0.00',
      total_devendo) +
      '. Somente um usuário autorizado poderá liberar esta venda. Informe esta situação para o cliente.'
      + #13 + #13 + 'Limite Compra:' + funcoes.CompletaOuRepete('',
      FormatCurr('#,###,###0.00', lim_compra), ' ', 10) + #13 + 'Limite Atraso:'
      + funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00', lim_atraso),
      ' ', 10) + #13 + 'Total Compras:' + funcoes.CompletaOuRepete('',
      FormatCurr('#,###,###0.00', total_devendo), ' ', 10) + #13 +
      'Total Atrasos:' + funcoes.CompletaOuRepete('',
      FormatCurr('#,###,###0.00', total_atraso), ' ', 10), mtInformation,
      [mbok], HexToTColor('FFD700'), true, false, HexToTColor('B22222'));
    Result := 0;
    exit;
  end;

  if total_atraso > 0 then
  begin
    if total_atraso >= lim_atraso then
    begin
      WWMessage('Este cliente tem um limite para ATRASO de R$ ' +
        FormatCurr('#,###,###0.00', lim_atraso) +
        ' e já tem compras em ATRASO no valor de R$ ' +
        FormatCurr('#,###,###0.00', total_atraso) +
        '. Somente um usuário autorizado poderá liberar esta venda. Informe esta situação para o cliente.'
        + #13 + #13 + 'Limite Compra:' + funcoes.CompletaOuRepete('',
        FormatCurr('#,###,###0.00', lim_compra), ' ', 10) + #13 +
        'Limite Atraso:' + funcoes.CompletaOuRepete('',
        FormatCurr('#,###,###0.00', lim_atraso), ' ', 10) + #13 +
        'Total Compras:' + funcoes.CompletaOuRepete('',
        FormatCurr('#,###,###0.00', total_devendo), ' ', 10) + #13 +
        'Total Atrasos:' + funcoes.CompletaOuRepete('',
        FormatCurr('#,###,###0.00', total_atraso), ' ', 10), mtInformation,
        [mbok], HexToTColor('FFD700'), true, false, HexToTColor('B22222'));
      Result := 0;
      exit;
    end;

    // ShowMessage('lim_atraso=' + CurrToStr(lim_atraso) + #13 + 'total_atraso=' + CurrToStr(total_atraso));
    if lim_atraso + lim_compra <> 0 then
    begin
      Result := lim_atraso - total_atraso;
      // se o restante do limite em atraso vai ser  maior que o limite de compra
      if lim_atraso > total_atraso then
      begin
        WWMessage(
          'Este cliente tem um restante de limite para COMPRA de apenas R$ ' +
          FormatCurr('#,###,###0.00', lim_atraso - total_atraso) + '.' + #13 +
          #13 + 'Limite Compra:' + funcoes.CompletaOuRepete('',
          FormatCurr('#,###,###0.00', lim_compra), ' ', 10) + #13 +
          'Limite Atraso:' + funcoes.CompletaOuRepete('',
          FormatCurr('#,###,###0.00', lim_atraso), ' ', 10) + #13 +
          'Total Compras:' + funcoes.CompletaOuRepete('',
          FormatCurr('#,###,###0.00', total_devendo), ' ', 10) + #13 +
          'Total Atrasos:' + funcoes.CompletaOuRepete('',
          FormatCurr('#,###,###0.00', total_atraso), ' ', 10), mtInformation,
          [mbok], HexToTColor('FFD700'), true, false, HexToTColor('B22222'));
        WWMessage('Esta Venda está Sendo Autorizada com Valor Até: R$ ' +
          FormatCurr('#,###,###0.00', lim_atraso - total_atraso), mtInformation,
          [mbok], HexToTColor('FFD700'), true, false, HexToTColor('B22222'));
        Result := lim_atraso - total_atraso;
        Form20.Caption := Form20.Caption + ' ' + '(Venda Limitada R$ ' +
          FormatCurr('#,###,###0.00', Result) + ')';
        exit;
      end
      else
      begin
        WWMessage('Este Cliente Excedeu Seu Limite de Crédito.', mtInformation,
          [mbok], HexToTColor('FFD700'), true, false, HexToTColor('B22222'));
        Result := 0;
        exit;
      end;
      // end;

      if Result < AserAdicionadoNaContaDoClitente then
      begin
        WWMessage('Este Cliente Excedeu Seu Limite de Crédito.', mtInformation,
          [mbok], HexToTColor('FFD700'), true, false, HexToTColor('B22222'));
        Result := 0;
        exit;
      end;

      WWMessage(
        'Este cliente tem um restante de limite para Compra de apenas R$ ' +
        FormatCurr('#,###,###0.00', lim_atraso - total_atraso) + '.' + #13 + #13
        + 'Limite Compra:' + funcoes.CompletaOuRepete('',
        FormatCurr('#,###,###0.00', lim_compra), ' ', 10) + #13 +
        'Limite Atraso:' + funcoes.CompletaOuRepete('',
        FormatCurr('#,###,###0.00', lim_atraso), ' ', 10) + #13 +
        'Total Compras:' + funcoes.CompletaOuRepete('',
        FormatCurr('#,###,###0.00', total_devendo), ' ', 10) + #13 +
        'Total Atrasos:' + funcoes.CompletaOuRepete('',
        FormatCurr('#,###,###0.00', total_atraso), ' ', 10), mtInformation,
        [mbok], HexToTColor('FFD700'), true, false, HexToTColor('B22222'));
      WWMessage('Esta Venda está Sendo Autorizada com Valor Até: R$ ' +
        FormatCurr('#,###,###0.00', lim_atraso - total_atraso), mtInformation,
        [mbok], HexToTColor('FFD700'), true, false, HexToTColor('B22222'));
      Form20.Caption := Form20.Caption + ' ' + '(Venda Limitada R$ ' +
        FormatCurr('#,###,###0.00', Result) + ')';
      exit;
    end;
  end
  else
  // se não existir atrasos
  begin
    if lim_compra = 0 then
    begin
      Result := -1;
      exit;
    end;

    if lim_compra - total_devendo <> 0 then
    begin
      Result := lim_compra - total_devendo;
      if Result < AserAdicionadoNaContaDoClitente then
      begin
        WWMessage('Este Cliente Excedeu Seu Limite de Crédito.', mtInformation,
          [mbok], HexToTColor('FFD700'), true, false, HexToTColor('B22222'));
        Result := 0;
        exit;
      end;

      WWMessage(
        'Este cliente tem um restante de limite para Compra de apenas R$ ' +
        FormatCurr('#,###,###0.00', lim_compra - total_devendo) + '.' + #13 +
        #13 + 'Limite Compra:' + funcoes.CompletaOuRepete('',
        FormatCurr('#,###,###0.00', lim_compra), ' ', 10) + #13 +
        'Limite Atraso:' + funcoes.CompletaOuRepete('',
        FormatCurr('#,###,###0.00', lim_atraso), ' ', 10) + #13 +
        'Total Compras:' + funcoes.CompletaOuRepete('',
        FormatCurr('#,###,###0.00', total_devendo), ' ', 10) + #13 +
        'Total Atrasos:' + funcoes.CompletaOuRepete('',
        FormatCurr('#,###,###0.00', total_atraso), ' ', 10), mtInformation,
        [mbok], HexToTColor('FFD700'), true, false, HexToTColor('B22222'));
      WWMessage('Esta Venda está Sendo Autorizada com Valor Até: R$ ' +
        FormatCurr('#,###,###0.00', lim_compra - total_devendo), mtInformation,
        [mbok], HexToTColor('FFD700'), true, false, HexToTColor('B22222'));
      Result := lim_compra - total_devendo;
      Form20.Caption := Form20.Caption + ' ' + '(Venda Limitada R$ ' +
        FormatCurr('#,###,###0.00', Result) + ')';
      exit;
    end;
  end;


  if lim_compra > 0 then begin
    if lim_compra > total_devendo then
    begin
      WWMessage(
        'Este cliente tem um restante de limite para Compra de apenas R$ ' +
        FormatCurr('#,###,###0.00', lim_compra - total_devendo) + '.' + #13 +
        #13 + 'Limite Compra:' + funcoes.CompletaOuRepete('',
        FormatCurr('#,###,###0.00', lim_compra), ' ', 10) + #13 +
        'Limite Atraso:' + funcoes.CompletaOuRepete('',
        FormatCurr('#,###,###0.00', lim_atraso), ' ', 10) + #13 +
        'Total Compras:' + funcoes.CompletaOuRepete('',
        FormatCurr('#,###,###0.00', total_devendo), ' ', 10) + #13 +
        'Total Atrasos:' + funcoes.CompletaOuRepete('',
        FormatCurr('#,###,###0.00', total_atraso), ' ', 10), mtInformation,
        [mbok], HexToTColor('FFD700'), true, false, HexToTColor('B22222'));
      WWMessage('Esta Venda está Sendo Autorizada com Valor Até: R$ ' +
        FormatCurr('#,###,###0.00', lim_compra - total_devendo), mtInformation,
        [mbok], HexToTColor('FFD700'), true, false, HexToTColor('B22222'));
      Result := lim_compra - total_devendo;
      Form20.Caption := Form20.Caption + ' ' + '(Venda Limitada R$ ' +
        FormatCurr('#,###,###0.00', Result) + ')';
      exit;
    end;
  end;

end;

function TForm20.AchaFieldDbgrid(DB: TDBGrid; nome: string): integer;
var
  i: integer;
begin
  for i := 0 to DB.Columns.Count - 1 do
  begin
    if DB.Columns.Items[i].FieldName = nome then
    begin
      Result := i;
      break;
    end;
  end;
end;

procedure TForm20.limpatela;
begin
  ClientDataSet1.EmptyDataSet;
  total.Caption := 'R$ 0,00';
  JsEdit3.Text := '';
  aprazoFormaDiferenteDe2 := '';

  JsEdit3.Enabled := true;
  JsEdit1.Enabled := true;
  DBGrid1.Enabled := true;

  if JsEdit2.Enabled then
    JsEdit2.SetFocus
  else begin
    JsEdit3.SetFocus;
  end;

  JsEdit1.Text := '0';
    //JsEdit1.Text := funcoes.buscaParamGeral(146, '0');
  desco.Caption := '';

  configUsuarioConfirmarPreco := trim(funcoes.LerConfig(form22.Pgerais.Values['configu'], 2));
end;

procedure TForm20.GeraParcelamento(cli123 : string);
var
  i: integer;
  vencimento: TDateTime;
begin
  //se tem mais de 1 parcela entao o sistema atribui pagamento mensal
  //if (StrToInt(Parcelamento.Values['qtd']) > 1) then Parcelamento.Values['periodo'] := '30';

  Parcelamento.Values['periodo'] := StrNum(Parcelamento.Values['periodo']);

  for i := 1 to StrToInt(Parcelamento.Values['qtd']) do
  begin
    if i = 1 then
      vencimento := StrToDate(Parcelamento.Values['vencto']);

    dm.IBQuery1.SQL.Text :=
      ('insert into contasreceber(nota,codgru,cod,formpagto,datamov,vendedor,data,vencimento,documento,codhis,historico,total,valor)'
      + ' values(' + StrNum(novocod) + ',1,' + funcoes.novocod('creceber') + ',' +
      StrNum(codhis) + ',:datamov,' + StrNum(JsEdit2.Text) + ',:data,:vencimento,' +
      StrNum(cli123) + ',2,:hist,:total,:valor)');
    dm.IBQuery1.ParamByName('datamov').AsDateTime := form22.datamov;
    if i <> 1 then
    begin

      // vencimento := vencimento + strtocurr(Parcelamento.Values['periodo']);
      if Parcelamento.Values['periodo'] = '30' then
        vencimento := IncMonth(vencimento, 1)
      else
        vencimento := vencimento + StrToCurr(Parcelamento.Values['periodo']);
    end;

    dm.IBQuery1.ParamByName('data').AsDateTime := vencimento;
    dm.IBQuery1.ParamByName('vencimento').AsDateTime := vencimento;
    dm.IBQuery1.ParamByName('hist').AsString :=
      funcoes.CompletaOuRepete(copy(novocod + '-' + cliente, 1, 28),
      funcoes.CompletaOuRepete('', IntToStr(i), ' ', 2) + '/' +
      funcoes.CompletaOuRepete('', Parcelamento.Values['qtd'], ' ', 2),
      ' ', 35);
    dm.IBQuery1.ParamByName('total').AsCurrency := StrToCurr(Parcelamento.Values['valorp']);
    dm.IBQuery1.ParamByName('valor').AsCurrency := StrToCurr(Parcelamento.Values['valorp']);

    dm.IBQuery1.ExecSQL;
  end;

  dm.IBQuery1.SQL.Text := 'insert into parcelamento(cod, nota, total, valor_parc, qtd_parc, juros, periodo, primeiro_venc, entrada) ' +
  'values(gen_id(parcelamento, 1),:nota, :total, :valor_parc, :qtd_parc, :juros, :periodo, :primeiro_venc, :entrada)';
  dm.IBQuery1.ParamByName('nota').AsString := StrNum(novocod);
  dm.IBQuery1.ParamByName('total').AsCurrency := StrToCurrDef(Parcelamento.Values['total'],0);
  dm.IBQuery1.ParamByName('valor_parc').AsCurrency := StrToCurrDef(Parcelamento.Values['valorp'],0);
  dm.IBQuery1.ParamByName('qtd_parc').AsCurrency := StrToCurrDef(Parcelamento.Values['qtd'],0);
  dm.IBQuery1.ParamByName('juros').AsCurrency := StrToCurrDef(Parcelamento.Values['taxa'],0);
  dm.IBQuery1.ParamByName('periodo').AsString := Parcelamento.Values['periodo'];
  dm.IBQuery1.ParamByName('primeiro_venc').AsDate := StrToDate(Parcelamento.Values['vencto']);
  dm.IBQuery1.ParamByName('entrada').AsCurrency := StrToCurrDef(Parcelamento.Values['entrada'],0);
  dm.IBQuery1.ExecSQL;
  dm.IBQuery1.Transaction.Commit;

  if ((codhis = '2') or (vendaAPrazo)) then
  begin
    buscaNomeCliente;
    insereEntrada(LeftStr(novocod + '-' + clienteNome, 30) + ' 1 /1', StrToCurrDef(Parcelamento.Values['entrada'],0));
  end;
end;

function TForm20.gravaVenda : boolean;
var
  cod, codmov, tabela, padrao, recnoItem_venda: string;
  totProd, vlcaixa: currency;
  InsereCaixa: boolean;
  ini: integer;
begin
  Result := false;
  { if  testa = 1 then
    begin
    WWMessage('Houve um Conflito de Transações e a Venda Não foi Gravada. Por Favor Tente Novamente!',mtError,[mbOK],clBlack,true,false,clWindow);
    dm.IBQuery1.Transaction.Rollback;
    Exit;
    end; }

  InsereCaixa := false;
  vlcaixa := 0;
  totProd := 0;
  // if saidaDeEstoque then total1 := 0;

  ClientDataSet1.DisableControls;
  ClientDataSet1.First;
 
  if origem = 1 then
    tabela := 'quant'
  else
    tabela := 'deposito';

  // grava os itens da venda
  ClientDataSet1.First;

  totVenda := 0;
  totVolumes := 0;
  total_A_Limitar := 0;

  //if dm.IBTransaction7.TransactionIntf then
  

  if dm.bd.InTransaction then dm.bd.commit;

  //for ini := 1 to ClientDataSet1.RecordCount do
  while not ClientDataSet1.Eof do begin
    //ClientDataSet1.RecNo := ini;

    recnoItem_venda  :=  QuotedStr(novocod +'-'+ IntToStr(ClientDataSet1.RecNo));
    //recnoItem_venda  :=  QuotedStr(novocod + IntToStr(1));

    totProd := StrToCurr(ClientDataSet1TOTAL.AsString);
    total_A_Limitar := StrToCurr(ClientDataSet1PRECO.AsString);

    cod := ClientDataSet1CODIGO.AsString;
    dm.IBQuery1.Close;

   // ShowMessage(recnoItem_venda + #13 + IntToStr(Length(recnoItem_venda)));

  if LeftStr(tipoV, 1) = 'V' then
    begin
      dm.IBQuery1.SQL.Text :=
        ('insert into item_venda(data,nota,COD, QUANT, p_venda,total,origem,p_compra,codbar,aliquota, unid, desconto, nome, vendedor, TIPO, cod_seq, recno, TOT_ORIGI)'
        + ' values(:data,' + novocod + ',:cod, :quant, :p_venda,:total,' +
        IntToStr(origem) +
        ',:p_compra, :codbar,:aliq, :unid, :desconto, :nome, :vend, :tipo, gen_id(item_venda, 1), '+recnoItem_venda+', :TOT_ORIGI)');
    end
    else
    begin
      dm.IBQuery1.SQL.Text :=
        ('insert into item_venda(data,nota,COD, QUANT, p_venda,total,origem,p_compra,codbar,aliquota, unid, desconto, nome, vendedor, TIPO, cod_seq, recno, TOT_ORIGI)'
        + ' values(:data,' + novocod + ',:cod, :quant, :p_venda,:total,' +
        IntToStr(origem) +
        ',:p_compra, :codbar,:aliq, :unid, :desconto, :nome, :vend, :tipo, gen_id(item_venda, 1), '+recnoItem_venda+', :TOT_ORIGI)');
    end;

    dm.IBQuery1.ParamByName('data').AsDateTime := form22.datamov;
    dm.IBQuery1.ParamByName('cod').AsString := StrNum(ClientDataSet1CODIGO.AsString);

    dm.IBQuery1.ParamByName('quant').AsFloat := ClientDataSet1QUANT.AsFloat;
    dm.IBQuery1.ParamByName('p_venda').AsFloat := ClientDataSet1PRECO.AsFloat;
    dm.IBQuery1.ParamByName('total').AsCurrency := totProd;

    totVolumes := totVolumes + dm.IBQuery1.ParamByName('quant').AsCurrency;
    totVenda := totVenda + Arredonda(ClientDataSet1QUANT.AsFloat
      * ClientDataSet1PRECO.AsFloat, 2);

    dm.IBselect.Close;
    dm.IBselect.SQL.Clear;
    dm.IBselect.SQL.Add
      ('select p_compra, aliquota, unid, codbar from produto where cod = ' +
      ClientDataSet1CODIGO.AsString);
    dm.IBselect.Open;

    dm.IBQuery1.ParamByName('p_compra').AsCurrency :=
      Arredonda(StrToCurr(ClientDataSet1QUANT.AsString) *
      dm.IBselect.FieldByName('p_compra').AsCurrency, 2);

    if totProd = 0 then dm.IBQuery1.ParamByName('p_compra').AsCurrency := 0;

    dm.IBQuery1.ParamByName('codbar').AsString :=
      dm.IBselect.FieldByName('codbar').AsString;
    dm.IBQuery1.ParamByName('aliq').AsInteger :=
      IfThen(StrToIntDef(strnum(trim(dm.IBselect.FieldByName('aliquota')
      .AsString)), 2) = 0, 2,
      StrToIntDef(strnum(dm.IBselect.FieldByName('aliquota').AsString), 2));
    dm.IBQuery1.ParamByName('unid').AsString :=
      copy(dm.IBselect.FieldByName('unid').AsString, 1, 6);

    if funcoes.buscaParamGeral(71, 'N') = 'S' then
    begin
      dm.IBQuery1.ParamByName('desconto').AsCurrency := (ClientDataSet1TOT_ORIGI2.AsCurrency - ClientDataSet1TOTAL.AsCurrency);
    end;

    codmov := '';
    if ClientDataSet1m2.AsInteger = 1 then
      codmov := LeftStr(ClientDataSet1DESCRICAO.AsString, 40);

    dm.IBQuery1.ParamByName('nome').AsString := codmov;
    dm.IBQuery1.ParamByName('tipo').AsString := RightStr(trim(tipoV), 3);
    dm.IBQuery1.ParamByName('vend').AsString :=
      strnum(funcoes.retiraZerosEsquerda(ClientDataSet1vendedor.AsString));
    if dm.IBQuery1.ParamByName('vend').AsString = '0' then
    dm.IBQuery1.ParamByName('vend').AsString :=
        strnum(funcoes.retiraZerosEsquerda(JsEdit2.Text));

    if ClientDataSet1TOT_ORIGI2.AsCurrency = ClientDataSet1TOTAL.AsCurrency then dm.IBQuery1.ParamByName('TOT_ORIGI').AsCurrency := 0
    else dm.IBQuery1.ParamByName('TOT_ORIGI').AsCurrency := (ClientDataSet1TOT_ORIGI2.AsCurrency);

    //dm.IBQuery1.ParamByName('recno').AsString := novocod + IntToStr(ClientDataSet1.RecNo);

    //dm.IBQuery1.SQL.SaveToFile('sql1.txt');
    dm.IBselect.Close;

    try
      dm.IBQuery1.ExecSQL;
    except
      on e: exception do begin
        MessageDlg('Erro6065: ' + e.Message, mtError, [mbOK], 1);
        dm.IBQuery1.Transaction.Rollback;

        gravaErrosNoArquivo(e.Message,'Venda','6068','gravavenda(itemVenda)');
        criaPasta(caminhoEXE_com_barra_no_final + 'VendasErro\');
        ClientDataSet1.SaveToFile(caminhoEXE_com_barra_no_final + 'vendasErro\'+ novocod+'.xml', dfXML);
        ClientDataSet1.EnableControls;
        exit;
      end;
    end;

     ClientDataSet1.Next;
  end;

  // grava a venda
  dm.IBQuery1.Close;

  { if RightStr(tipoV, 1) = 'V' then begin
    dm.IBQuery1.SQL.Text := ('update or insert into venda(hora,vendedor,cliente,nota,data,total,codhis,desconto,prazo,entrada, EXPORTADO, USUARIO, tipo)'+
    ' values(:hora,:vend,:cliente,:nota,:data,:total,:pagto,:desc,:prazo,:entrada, :exportado, :USUARIO, :tipo) matching(nota, cod, quant)');
    end
    else begin
    dm.IBQuery1.SQL.Text := ('insert into venda(hora,vendedor,cliente,nota,data,total,codhis,desconto,prazo,entrada, EXPORTADO, USUARIO, tipo)'+
    ' values(:hora,:vend,:cliente,:nota,:data,:total,:pagto,:desc,:prazo,:entrada, :exportado, :USUARIO, :tipo)');
    end; }

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text :=
    ('insert into venda(USULIB,ENDE_ENTREGA, CLIENTE_ENTREGA, datamov,hora,vendedor,cliente,nota,data,total,codhis,desconto,prazo,entrada, EXPORTADO, USUARIO, tipo, usu_venda)'
    + ' values(:USULIB,:ENDE_ENTREGA,:CLIENTE_ENTREGA, :datamov, :hora,:vend,:cliente,:nota,:data,:total,:pagto,:desc,:prazo,:entrada, :exportado, :USUARIO, :tipo, :usu_venda)');
  dm.IBQuery1.ParamByName('USULIB').AsString           := LeftStr(form22.Pgerais.Values['codUsuNovo'], 3);
  dm.IBQuery1.ParamByName('ENDE_ENTREGA').AsInteger    := StrToIntDef(strnum(ENDE_ENTREGA), 0);
  dm.IBQuery1.ParamByName('CLIENTE_ENTREGA').AsInteger := StrToIntDef(strnum(CLIENTE_ENTREGA), 0);
  dm.IBQuery1.ParamByName('datamov').AsDateTime := NOW;
  dm.IBQuery1.ParamByName('hora').AsTime        := NOW;
  dm.IBQuery1.ParamByName('vend').AsInteger     := StrToIntDef(strnum(JsEdit2.Text), 0);
  dm.IBQuery1.ParamByName('cliente').AsInteger  := StrToIntDef(JsEdit3.Text, 0);
  dm.IBQuery1.ParamByName('nota').AsInteger     := StrToIntDef(novocod, 0);
  dm.IBQuery1.ParamByName('data').AsDateTime    := form22.datamov;
  // '+JsEdit3.Text+'
  dm.IBQuery1.ParamByName('total').AsCurrency := total1; // '+novocod+'
  dm.IBQuery1.ParamByName('pagto').AsInteger := StrToIntDef(codhis, 0);
  dm.IBQuery1.ParamByName('desc').AsCurrency := Desconto;


  if dm.IBQuery1.ParamByName('pagto').AsInteger = 1 then begin
    JsEdit1.Text := '0';
  end;

  JsEdit1.Text := IntToStr(StrToIntDef(JsEdit1.Text, 0));
  if ((length(trim(JsEdit1.Text)) >= 3) or (JsEdit1.Text = '')) then
    JsEdit1.Text := '30';
  dm.IBQuery1.ParamByName('prazo').AsCurrency :=
    StrToCurrDef(trim(JsEdit1.Text), 0);
  dm.IBQuery1.ParamByName('entrada').AsCurrency := entrada;
  dm.IBQuery1.ParamByName('exportado').AsInteger := EXPORTADO;
  dm.IBQuery1.ParamByName('USUARIO').AsInteger := StrToIntDef(form22.codusario, 0);
  dm.IBQuery1.ParamByName('tipo').AsString := LeftStr(tipoV, 3);
  dm.IBQuery1.ParamByName('usu_venda').AsString := LeftStr(form22.codusario, 4);


  try
    dm.IBQuery1.ExecSQL;
    dm.IBQuery1.Transaction.commit;
  except
    on e:exception do begin
      MessageDlg('Erro6128: ' + e.Message, mtError, [mbOK], 1);
      dm.IBQuery1.Transaction.Rollback;

      gravaErrosNoArquivo(e.Message,'Venda','6131','gravavenda()');
      criaPasta(caminhoEXE_com_barra_no_final + 'VendasErro\');
      ClientDataSet1.SaveToFile(caminhoEXE_com_barra_no_final + 'vendasErro\'+ novocod+'.xml', dfXML);
      ClientDataSet1.EnableControls;
      exit;
    end;
  end;
  tipoV := LeftStr(tipoV, 1);

  if saidaDeEstoque then
  begin
    try
      insereJustificativa_ibquery1_sem_commit(novocod, justiSaida,
        form22.datamov, totVenda, totVolumes);
    except
      on e: exception do
      begin
        // dm.IBQuery1.Transaction.Rollback;
        gravaErrosNoArquivo(e.Message, 'Form20', '2385', 'gravavenda');
      end;
    end;
  end;

  if dm.bd.InTransaction then dm.bd.commit;

 if podeGravarParcelamentoTabela = 1 then GeraParcelamento(ultimoCliente);

 funcoes.fecharTransacoesClose;

  dm.IBQuery1.Close;
  dm.produto.Close;
  dm.produto.Open;



  funcoes.FormataCampos(dm.produto, 2, 'ESTOQUE', 3);
  funcoes.resizeCamposIdividualDBGRID(DBGrid1);
  formataCamposPreco;
  ClientDataSet1.EnableControls;

  try
    if funcoes.buscaParamGeral(19, 'S') = 'S' then
      impNovo
    else if contido(funcoes.buscaParamGeral(19, 'S'), 'PX') then
    begin
      padrao := 'S';
      if funcoes.buscaParamGeral(19, 'S') = 'X' then
        padrao := 'N';
      cod := funcoes.dialogo('generico', 0, 'SN' + #8, 0, true, 'S',
        'Control For Windows', 'Deseja Imprimir Esta Venda (S/N) ?:', padrao);
      if cod = 'S' then
        impNovo;
    end;
  except
    on e: exception do
    begin
      gravaErrosNoArquivo(e.Message, 'Form20', '1683', 'ImprimeNota');
    end;
  end;


  if (separaPecas and finaliza) then
    funcoes.atualizaVendaDaOrdemDeServico(COD_SERVICO, novocod);
  if not contido(funcoes.buscaParamGeral(70, 'N'), 'CS') then
    limpatela;

  JsEditInteiro1.Text := IntToStr(StrToIntDef(novocod, 0) + 1);
  // funcoes.GeraNota(novocod,form22.Pgerais.Values['nota'],'S',Modo_Venda);
  numvenda := novocod;
  Result := true;
end;

procedure TForm20.DBGrid1KeyPress(Sender: TObject; var Key: Char);
var
  busca, cod, fim, desc, ativo, tmp3, sim, nao: string;
  cont, i, conti: integer;
  vencimento: TDateTime;
  sub, subTot: currency;
  ordem1: TOrdem;
begin
  // toda letra será convertida para maiuscula
  Key := UpCase(Key);
  // se o clientDataSet estiver vazio pode sair do dbgrid
  if (Key = #27) and (ClientDataSet1.IsEmpty) then
  begin
    if (separaPecas) then
    begin
      Close;
    end;

    if DBGrid1.Focused then
      Saiu := true;
    if semCliente then
    begin
      JsEdit1.Enabled := true;
      JsEdit1.SetFocus;
      exit;
    end;

    JsEdit3.Enabled := true;
    JsEdit3.SetFocus;
    exit;
  end;

  if ((ord(Key)) >= 65) and (((ord(Key))) <= 95) and
    (DBGrid1.SelectedField.DisplayLabel = 'DESCRICAO') then
  begin
    if procura = '*' then
      exit;
    if procura = '' then
      procura := UpperCase(Key)
    else
      procura := procura + UpperCase(Key);
    Timer1.Enabled := false;
    if procura <> '' then
    begin
      Timer1.Enabled := true;
    end;
    dm.produto.Locate('descricao', UpperCase(procura),
      [loCaseInsensitive, loPartialKey]);
  end;

  if Key = #13 then
  begin

    if Compra then
    begin
      busca := funcoes.dialogo('numero', CasasDecimaisQuantidade, 'SN', CasasDecimaisQuantidade, false, 'S',
        'Control for Windows:', 'Quantidade:', '0,'+ CompletaOuRepete('','','0', CasasDecimaisQuantidade));
      if (busca = '*') or (StrToCurrDef(funcoes.ConverteNumerico(busca), 0) = 0)
      then
        exit;

      ativo := funcoes.dialogo('numero', 0, 'SN', 0, false, 'S',
        'Control for Windows:', 'Confirme o Preço:', FormatCurr('#,###,###0.00',
        dm.produto.FieldByName('preco').AsCurrency));
      if (ativo = '*') then
        exit;

      AddProdutoCDS_Compra(StrToCurrDef(busca, 0), StrToCurrDef(ativo, 0));

      exit;
    end
    else if (Modo_Venda) or (Modo_Orcamento) then
    begin

      if LeftStr(DBGrid1.DataSource.DataSet.FieldByName('descricao').AsString, 1) = '_' then begin
        ShowMessage('A Venda deste Produto NÃO é Permitido!');
        exit;
      end;


      sub := 0;
      // desconto := dm.produto.fieldbyname('preco').AsCurrency;
      if funcoes.buscaParamGeral(5, '') = 'S' then
      begin
        aprazo := dm.produto.FieldByName('preco').AsCurrency;
        avista := dm.produto.FieldByName('preco').AsCurrency;
        { if codhis = '2' then
          begin
          sub := aprazo;
          end
          else sub := avista; }
      end
      else
        sub := dm.produto.FieldByName('preco').AsCurrency;

      if vendeProdutoM2 = true then
      begin
        exit;
      end;

      // se está habilitado a confirmação de preços
      if (contido(configUsuarioConfirmarPreco, 'SPX') or
        (copy(dm.produto.FieldByName('descricao').AsString, 1, 7) = 'SERVICO'))
      then
      begin
        ativo := confirmaPrecoProduto(dm.produto.FieldByName('cod').AsString,
          busca, ativo, 0, (copy(dm.produto.FieldByName('descricao').AsString,
          1, 7) = 'SERVICO'));

        if (ativo = '*') then
          exit;

        AddSegundaClienteDataSet_antigo(StrToFloatDef(busca, 0),StrToFloatDef(ativo, 0));
        exit;
      end;
    end;

    AddSegundaClienteDataSet_antigo(0, sub);
    exit;
  end;

  // if (key=#27) and (sair) and not ClientDataSet1.IsEmpty then
  if ((Key = #27) and (not ClientDataSet1.IsEmpty)) then
  begin
    fim := funcoes.dialogo('generico', 0, 'SN', 0, false, 'S',
      'Control for Windows:', 'Finalizar Venda: S/N', 'S');
    if fim = 'S' then
    begin
      JsEdit1.Text := IntToStr(StrToIntDef(JsEdit1.Text, 0));

      if Compra then
      begin
        total1 := somaValor;

        if StrToIntDef(JsEdit1.Text, 0) > 0 then
          codhis := funcoes.LerFormPato(1, 'F8 - Volta à Compra', false)
        else
          codhis := funcoes.LerFormPato(0, 'F8 - Volta à Compra', false);
        if codhis = '*' then
          exit;
        gravaCompra;
        exit;
      end;

      total1 := somaValor;

      if ((funcoes.buscaParamGeral(118, '') = 'S') and ((Modo_Venda) or (separaPecas))) then begin
        form83 := tform83.Create(self);
        form83.codEntrega := ENDE_ENTREGA;
        //if total1 <= 100 then form83.taxa.Text := 'D';

        form83.ShowModal;
        ENDE_ENTREGA := form83.codEntrega;
        form83.Free;
      end;



      if ((funcoes.buscaParamGeral(122, 'N') = 'S') and (Modo_Venda)) then begin
        if MessageDlg('Deseja Adicionar Venda para Entrega ?',mtConfirmation, [mbYes, mbNo], 0, mbNo) = idyes then begin
          adicionarEntrega := 'S';
        end;
      end;


      if (verificaSePodeVenderNegativo_X_NaVendaConfig11DoUsuario = false)  then exit;
      lancaDescontoAtual_Antigo;
      { if funcoes.buscaParamGeral(71, 'S') = 'S' then begin
        lancaDescontoAtual_Antigo;
        end
        else begin
        total1 := somaValor;
        lancaDescontoAtual;
        end; }

      if funcoes.buscaParamGeral(32, '') = 'S' then
      begin
        operacaoDeTroco(total1);
        // esta funcao altera 2 variaveis globais que estao declaradas em PRIVATE (TROCO) (RECEBIDO)
        // TROCO é igual ao valor que foi recebido pelo usuário menos o total da venda
        // RECEBIDO é o valor que o usuário recebeu
      end;

      entrada := 0;
      if not Assigned(Parcelamento) then
        Parcelamento := TStringList.Create;
      Parcelamento.Clear;

      if funcoes.buscaParamGeral(83, 'S') = 'S' then
      begin
        Parcelamento := funcoes.Parcelamento(total1, '*', JsEdit1.Text);
      end;

      // if Parcelamento.Values['esc'] <> 'S' then entrada := StrToCurrDef(Parcelamento.Values['entrada'], 0);
      entrada := StrToCurrDef(Parcelamento.Values['entrada'], 0);

      if StrToInt(JsEdit1.Text) > 0 then
      begin
        codhis := funcoes.LerFormPato(1, 'F8 - Volta à Venda', false);
      end
      else
      begin
        codhis := funcoes.LerFormPato(0, 'F8 - Volta à Venda', false, IfThen(codhis = '2', '1', codhis));
      end;


      if ((formaAlterada <> '') and (Modo_Venda) and (formaAlterada <> codhis) and (codhis <> '*')) then begin
        ShowMessage('A Venda Não Pode Ser Finalizada por Divergência entre Formas de Pagamento!' + #13 +
                    'Forma Escolhida F1:      ' + formaAlterada + #13 +
                    'Forma Escolhida no Final:' + codhis + #13 + #13+
                    'Altere a forma de Pagamento usando F1!');
        codhis := formaAlterada;
        exit;
      end;


      if codhis = '*' then
      begin
        mostraDesconto(0, 0, false);
        exit;
      end;



      fimVenda := 1;

      if (((codhis = '2') or (vendaAPrazo)) and (Parcelamento.Count = 0)) then
      begin
        Parcelamento := funcoes.Parcelamento(total1, '*', JsEdit1.Text);
        entrada := StrToCurrDef(Parcelamento.Values['entrada'], 0);
      end;

      EXPORTADO := 0;
      // inicia exportado com zero( EXPORTADO = 0, NAO FOI EXPORTADO PARA O PAF. EXPORTADO = 1, FOI EXPORTADO PARA O PAF)

      if separaPecas then
      begin
        try
          if separaVendaOrcamento then begin
            funcoes.lerServicoNoBdEcriaUmObjetoOrdem(COD_SERVICO, ordem1);
            ordem1.cliente := StrToIntDef(JsEdit3.Text, 0);
            funcoes.imprimeOrdemDeServico(ordem1, true, true);


            sim := funcoes.dialogo('generico', 0, 'SN' + #8, 0, false, 'S','Control For Windows',
            'Deseja Gravar esta Nota Como Orçamento ?', 'N');

            if sim = 'S' then begin
              gravaOrcamento;
            end;

            close;
            exit;
          end
          else
          begin
            gravaServico();
            funcoes.lerServicoNoBdEcriaUmObjetoOrdem(COD_SERVICO, ordem1);
            ordem1.cliente := StrToIntDef(JsEdit3.Text, 0);
            funcoes.imprimeOrdemDeServico(ordem1, false, true);

            Close;
          end;
        except
          on e: exception do
          begin
            ShowMessage('Ocorreu um Erro: ' + e.Message + CRLF +
              'Consulte o Suporte para mais Informações');
          end;
        end;

        if ((funcoes.buscaParamGeral(118, 'N') = 'S') and (Modo_Venda) and (form22.Pgerais.Values['nota'] = 'T')) then begin
          funcoes.imprimeEnderecoEntregaCodEndereco(novocod, ENDE_ENTREGA);
        end;

        { se finaliza = true então atualiza a tabela OS_VENDA e grava venda na tabela venda }
        if not finaliza then
        begin
          Close;
          exit;
        end;
      end;

      podeGravarParcelamentoTabela := 0;

      if Modo_Venda then
      begin
        //if novocod = '' then novocod := funcoes.novocod('venda');
        if VerificaForma_de_Pagamento_e_Prazo = 0 then exit; // funcao que gera o parcelamento
        if novocod = '' then novocod := Incrementa_Generator('venda', 1);
        // if novocod = '' then novocod := funcoes.novocod('venda');
      end;

      if separaPecas and separaVendaOrcamento then
      begin
        sim := funcoes.dialogo('generico', 0, 'SN' + #8, 0, false, 'S',
          'Control For Windows',
          'Deseja Gravar esta Nota Como Orçamento ?', 'N');
        if ((sim = '*') or (sim = 'N')) then
          exit;
      end;

      ultimaNota    := novocod;
      formaAlterada := '';
      ultOrcamentoRecuperado := '';

      if Modo_Orcamento then
        gravaOrcamento;
      if Modo_Venda then
      begin
        CLIENTE_ENTREGA := '0';
        if funcoes.buscaParamGeral(113, 'N') = 'S' then begin
          CLIENTE_ENTREGA := funcoes.dialogo('generico', 0, '1234567890,.' + #8, 50, false, '', application.Title, 'Qual o Cód do Cliente para Entrega ?', JsEdit3.Text);
          if CLIENTE_ENTREGA = '*' then CLIENTE_ENTREGA := '0';
          if (CLIENTE_ENTREGA = '') then CLIENTE_ENTREGA := funcoes.localizar('Localizar Cliente', 'cliente', 'cod,nome,telres,telcom,cnpj,bairro', 'cod,nome', '', 'nome', 'nome', true, false, false, '', 0, nil);
        end;

        //quando comita a venda e os produtos o sistema tenta gravar as parcelas na conta do cliente
        ultimoCliente := JsEdit3.Text;
        if gravaVenda = false then begin
           novocod  := '';
           exit;
        end;


        novocod  := '';

        form22.Pgerais.Values['codUsuNovo'] := '';

        if adicionarEntrega = 'S' then begin
          //adiciona o registro na tabela ENTREGA_NOVO
          adicionaEntregaTabela;
          adicionarEntrega := 'N';
        end;

        COD_SERVICO  := '0';
        if ((codhis = '2')or (vendaAPrazo)) then
        begin
          tmp3 := funcoes.buscaParamGeral(69, 'N');
          if contido(tmp3, 'DP') then
          begin
            if tmp3 = 'D' then
            begin
              sim := funcoes.dialogo('generico', 0, 'SN' + #8, 0, false, 'S',
                'Control For Windows',
                'Deseja Imprimir Duplicatas da Venda ?', 'S');
              if sim = 'S' then
              begin
                funcoes.imprimeDuplicata(ultimaNota);
              end;
            end;

            if tmp3 = 'P' then
            begin
              sim := funcoes.dialogo('generico', 0, 'SN' + #8, 0, false, 'S',
                'Control For Windows',
                'Deseja Imprimir Promissórias da Venda ?', 'S');
              if sim = 'S' then
              begin
                funcoes.imprimePromissoria(ultimaNota);
              end;
            end;
          end;
        end;
      end;

      funcoes.OrdenaCamposVenda(funcoes.buscaParamGeral(1, ''));
      funcoes.BuscaResizeDBgrid(DBGrid1, 'FORM20');
      formataCamposPreco;

      tipoTrocaDescontoUsuario         := '';
      form22.Pgerais.Values['configu'] := configUsuario;


      if separaPecas <> true then begin
    if ((form22.Pgerais.Values['codvendedor'] = '0') or
      (VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false) or
      (funcoes.LerConfig(form22.Pgerais.Values['configu'], 12) = 'S') ) then
    begin
      JsEdit2.Text := form22.Pgerais.Values['codvendedor'];
      JsEdit2.Enabled := true;
      JsEdit2.SetFocus;
    end
    else
    begin
      JsEdit2.Text := form22.Pgerais.Values['codvendedor'];
      JsEdit2.Enabled := false;

      JsEdit1.Enabled := true;
      JsEdit1.SetFocus;
    end;
      end;



      if Modo_Venda then
      begin
        if funcoes.buscaParamGeral(70, 'N') = 'S' then
        begin
          sim := funcoes.dialogo('generico', 0, 'SN' + #8, 0, true, 'S',
            'Control For Windows', 'Deseja emitir NF-e ?', '');
          if sim = 'S' then
          begin
            if funcoes.verificaSePodeEmitirNFe then
            begin
              funcoes.emiteNfe(ultimaNota, true, true);
              dm.produto.Close;
              dm.produto.Open;


              funcoes.FormataCampos(dm.produto, 2, 'ESTOQUE', 3);
              funcoes.resizeCamposIdividualDBGRID(DBGrid1);
              formataCamposPreco;
              formataCamposPreco;
              ClientDataSet1.EnableControls;
            end;
          end;
        end;

        codhis := '1';

        if funcoes.buscaParamGeral(70, 'N') = 'C' then
        begin
          sim := funcoes.dialogo('generico', 0, 'SN' + #8, 0, true, 'S',
            'Control For Windows', 'Deseja emitir NFC-e ?', '');
          if sim = 'S' then
          begin
            if funcoes.verificaSePodeEmitirNFe then
            begin
              // form22.enviNFCe(ultimaNota, true, true);
              form22.enviNFCe(ultimaNota, '', total1);
              dm.produto.Close;
              dm.produto.Open;


              funcoes.FormataCampos(dm.produto, 2, 'ESTOQUE', 3);
              funcoes.resizeCamposIdividualDBGRID(DBGrid1);
              formataCamposPreco;
              ClientDataSet1.EnableControls;
            end;
          end;
        end;

        funcoes.fecharTransacoesClose;
        limpatela;
      end;

      mostraDesconto(0, 0, false);
      fimVenda := 0;

      if funcoes.buscaParamGeral(77, '') = 'S' then begin// busca por código de barras
        JsEdit1.Enabled := true;
        JsEdit1.SetFocus;
      end;

      if funcoes.buscaParamGeral(23, '') = 'S' then
      begin
        IF NOT separaPecas THEN
        begin
          //param 23 é pra voltar pro login
          if saidaDeEstoque <> true then
            //funcoes.voltarLogin(TForm(self));
            form2.nota := 'SAI';
            close;
        end;
        exit;
      end;

      if (separaPecas) then
      begin
        Close;
      end;
    end;
  end;

  if Key = #27 then
  begin
    // dm.IBClientDataSet1.Filter:='';
    sair := true;
  end;

  If (Key = #32) and (DBGrid1.SelectedField.DisplayLabel = 'CODBAR') then
  begin
    if funcoes.buscaParamGeral(5, '') = 'S' then
    begin
      BuscaCodBar_F6_AutoPecas1;
      exit;
    end;

    BuscaCodBar_F6_AutoPecas('');
    exit;

    sair := false;
  end;

  If (Key = #32) and (DBGrid1.SelectedField.DisplayLabel = 'APLICACAO') then
  begin
    if funcoes.buscaParamGeral(5, '') = 'S' then
    begin
      funcoes.BuscaAplicacao(sqlVenda, DBGrid1, ordenaCampos);
      exit;
    end;

    sair := false;
  end;

  If (Key = #32) and (DBGrid1.SelectedField.DisplayLabel = 'COD') then
  begin
    busca := funcoes.dialogo('generico', 90, '1230456789' + #8 + #13 + #27, 90,
      false, '', 'Control For Windows', 'Informe um Código', '');
    if busca = '*' then
      exit;
    if not dm.produto.Locate('cod', busca, [loCaseInsensitive]) then
    begin
      ShowMessage('Produto Não Encontrado!');
    end;
    // funcoes.ordernaDataSetVenda('cod', busca, sqlVenda, DBGrid1);
    DBGrid1.Enabled := true;
    DBGrid1.SetFocus;
    sair := false;
  end;

  If (Key = #32) and (DBGrid1.SelectedField.DisplayLabel = 'DESCRICAO') and
    (procura = '') then
  begin
    BuscaSelecao;
  end;

  If (Key = #32) and (DBGrid1.SelectedField.DisplayLabel = 'REFORI') and
    (procura = '') then
  begin
    buscaReferencia;
  end;

end;

procedure TForm20.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    form22.Pgerais.Values['configu'] := configUsuario;
  except
  end;

  try
   jsedit.LiberaMemoria(self);
  except

  end;
  // funcoes.fechaClientDataSet(ClientDataSet1);
  dm.produto.Close;
end;

procedure TForm20.FormCreate(Sender: TObject);
begin
  vendaAPrazo := false;
  aprazoFormaDiferenteDe2 := '';
  ultOrcamentoRecuperado  := '';
  fimVenda := 0;
  tipoTrocaDescontoUsuario := '';

  adicionarEntrega := 'N';
  decimaisPrecoUsuario :=  StrToIntDef(funcoes.LerConfig(form22.Pgerais.Values['configu'], 17), 3);
  if decimaisPrecoUsuario < 3 then decimaisPrecoUsuario := 3;

  formaAlterada := '';
  COD_SERVICO  := '0';
  ENDE_ENTREGA := '0';
  Saiu := false;
  separaPecas := false;
  finaliza := true;
  Compra := false;
  separaVendaOrcamento := false;
  finalizouServico := 0;

  NomeOrcamento := '';

  ClientDataSet1.IndexFieldNames := 'cod_seq';
  ClientDataSet1grupo.Visible := false;

  ClientDataSet1.createdataset;

  testa := 0;

  configUsuario := form22.Pgerais.Values['configu'];
end;

procedure TForm20.FormShow(Sender: TObject);
var
  cont, i: integer;
  sim: String;
begin
  CasasDecimaisQuantidade := StrToIntDef(funcoes.buscaParamGeral(123, '3') , 3);

  JsEdit1.SetTabelaDoBd(self, 'tf', query1);
  // if trim(funcoes.LerConfig(form22.Pgerais.Values['configu'], 2) = '' then begin
  // form22.Pgerais.Values['configu'] := GravarConfig(form22.Pgerais.Values['configu'], 'S', 2);
  // end;

  if origem <= 0 then
    origem := 1;

  ClientDataSet1Refori.Visible := false;
  ClientDataSet1Refori.DisplayLabel := 'REFERÊNCIA';
  ClientDataSet1minimo.DisplayLabel := 'DESC. MÁXIMO (%)';
  ClientDataSet1minimo.currency := false;
  ClientDataSet1minimo.DisplayFormat := '#,###,##0.00 %';
  ClientDataSet1TOT_ORIGI2.DisplayLabel := 'TOT. ORIGINAL';
  ClientDataSet1TOT_ORIGI2.DisplayFormat := '#,###,##0.00';
  ClientDataSet1QUANT.DisplayFormat := '#,###,###0.'+ CompletaOuRepete('','','0', CasasDecimaisQuantidade);

  // ClientDataSet1TOT_ORIGI2.Visible := true;
  if form22.superUsu = 1 then
    ClientDataSet1TOT_ORIGI2.Visible := true
  else
    ClientDataSet1TOT_ORIGI2.Visible := false;

  if funcoes.buscaParamGeral(55, 'N') = 'S' then
  begin
    ClientDataSet1minimo.Visible := true;
    ClientDataSet1TOT_ORIGI2.Visible := true;
  end
  else
  begin
    ClientDataSet1minimo.Visible := false;
    ClientDataSet1TOT_ORIGI2.Visible := false;
  end;

  if funcoes.buscaParamGeral(60, 'N') = 'S' then
  begin
    ClientDataSet1CODIGO.Visible := false;
    ClientDataSet1Refori.Visible := true;
  end;

  { if funcoes.buscaParamGeral(17, 'N') = 'S' then begin
    cdsatacado.CreateDataSet;
    end; }

  condicaoSQL := ' and (left(nome, 1) <> ''_'') and ((desativado <> ''1'')or (desativado is null) )';

  if form22.usuario = 'ADMIN' then
  begin
    ClientDataSet1TOT_ORIGI2.Visible := true;
  end;

  configUsuarioConfirmarPreco := trim(funcoes.LerConfig(form22.Pgerais.Values['configu'], 2));
  if trim(configUsuarioConfirmarPreco) = '' then
    configUsuarioConfirmarPreco := 'N';

  ShowScrollBar(DBGrid1.Handle, SB_VERT, false);
  ShowScrollBar(DBGrid1.Handle, SB_HORZ, false);
  ShowScrollBar(DBGrid1.Handle, SB_BOTH, false);
  DBGrid1.Repaint;
  DBGrid1.BorderStyle := bsNone;

  if funcoes.LerConfig(form22.Pgerais.Values['configu'], 5) = 'N' then
    semCliente := true
  else
    semCliente := false;
  totVenda := 0;
  totVolumes := 0;

  if funcoes.LerConfig(form22.Pgerais.Values['configu'], 2) <> 'N' then
    ClientDataSet1TOT_ORIGI2.Visible := true;

  StaticText2.Caption := geraCaptionTeclasDeAtalho();
  // se for autopecas
  if funcoes.buscaParamGeral(5, '') = 'S' then
  begin
    // StaticText1.Caption := 'F9 - Equivalência';
    Label8.Caption := '';
  end;
  // else Label8.Visible := fa
  // alinha tabela itens vendidos na venda

  tamanho_nota := 40;
  if trim(ordem) = '' then
    ordem := 'order by nome';

  if funcoes.buscaParamGeral(114, '1') = '2' then begin
    ordem := 'order by cod';
  end;
 
  ordenaCampos := true;

  DBGrid1.Enabled := false;
  // SetaModo;

  alinhaComponentes;
  funcoes.aumentaFonte(self, true, 0);
  if condicaoAumentarDBGRID2TrueZOOMnasDUAS then funcoes.aumentaFonte1(self, true, 0);

  arrumaComponentes800;

  if ((separaPecas = false) and (finaliza = false)) or (separaPecas and finaliza)
  then
  begin
    JsEditInteiro1.Text :=
      IntToStr(StrToIntDef(Incrementa_Generator(iif(Modo_Venda, 'venda',
      'orcamento'), 0), 0) + 1);
  end;

  if atacado then
  begin
    dm.produto.Close;
    dm.produto.SQL.Clear;
    dm.produto.SQL.Add
      ('select codbar,nome as Descricao,iif(p_venda1 <> 0,p_venda1,p_venda) as preco,'
      + campoEstoque + ',refori as ' + refori1 +
      ',unid,cod,aplic as Aplicacao,localiza as Localizacao from produto ' +  ordem);
    sqlVenda :=
      'select codbar,nome as Descricao,iif(p_venda1 <> 0,p_venda1,p_venda) as preco,'
      + campoEstoque + ',refori as ' + refori1 +
      ',unid,cod,aplic as Aplicacao,localiza as Localizacao from produto ';
    dm.produto.Open;


    formataCamposPreco;
    funcoes.fetchDataSet(dm.produto);
    funcoes.BuscaResizeDBgrid(DBGrid1, 'FORM20');
  end
  else
  begin
    dm.produto.Close;
    dm.produto.SQL.Clear;
    // dm.produto.SQL.Add('select cod,nome as Descricao,p_venda as Preco,quant as estoque,refori as '+ refori1 +',deposito,unid,codbar,aplic as Aplicacao,localiza as Localizacao from produto order by nome');

    try
      sim := funcoes.buscaParamGeral(43, '');
    except
      sim := 'N';
    end;

    if (sim = 'S') then
    begin
      dm.produto.SQL.Text :=
        ('select cod,nome as Descricao,p_venda as Preco,quant as estoque,refori as '
        + refori1 +
        ',deposito,unid,codbar,aplic as Aplicacao,localiza as Localizacao, p_compra as custo from produto where nome <> '''' '+ condicaoSQL +  ordem);

      sqlVenda :=
        'select cod,nome as Descricao,p_venda as Preco,quant as estoque,refori as '
        + refori1 +
        ',deposito,unid,codbar,aplic as Aplicacao,localiza as Localizacao, p_compra as custo from produto where nome <> '''' ' + condicaoSQL;
    end
    else
    begin
      dm.produto.SQL.Text :=
        ('select cod,nome as Descricao,p_venda as Preco,quant as estoque,refori as '
        + refori1 +
        ',deposito,unid,codbar,aplic as Aplicacao,localiza as Localizacao,igual as Equivalente from produto where nome <> '''' '+ condicaoSQL +  ordem);

      sqlVenda :=
        'select cod,nome as Descricao,p_venda as Preco,quant as estoque,refori as '
        + refori1 +
        ',deposito,unid,codbar,aplic as Aplicacao,localiza as Localizacao,igual as Equivalente from produto where nome <> '''' '+ condicaoSQL;

      if ((sim = 'C') and (RetornaAcessoUsuario = 0)) then
      begin
        dm.produto.SQL.Text :=
          ('select cod,nome as Descricao,p_venda as Preco,quant as estoque,refori as '
          + refori1 +
          ',deposito,unid,codbar,aplic as Aplicacao,localiza as Localizacao, p_compra as custo from produto where nome <> '''' '+ condicaoSQL +  ordem);

        sqlVenda :=
          'select cod,nome as Descricao,p_venda as Preco,quant as estoque,refori as '
          + refori1 +
          ',deposito,unid,codbar,aplic as Aplicacao,localiza as Localizacao, p_compra as custo from produto where nome <> '''' '+ condicaoSQL;
      end;
    end;

    dm.produto.Open;


    try
      funcoes.fetchDataSet(dm.produto);
    finally
    end;
  end;


  funcoes.resizeCamposIdividualDBGRID(DBGrid1);

  funcoes.FormataCampos(dm.produto, 2, 'ESTOQUE', 3);
  funcoes.resizeCamposIdividualDBGRID(DBGrid1);
  formataCamposPreco;
  JsEditData1.Text := FormatDateTime('dd/mm/yyyy', form22.datamov);


  if separaPecas <> true then begin
    if ((form22.Pgerais.Values['codvendedor'] = '0') or
      (VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false) or
      (funcoes.LerConfig(form22.Pgerais.Values['configu'], 12) = 'S') ) then
    begin
      JsEdit2.Text := form22.Pgerais.Values['codvendedor'];
      JsEdit2.Enabled := true;
      JsEdit2.SetFocus;
    end
    else
    begin
      JsEdit2.Text := form22.Pgerais.Values['codvendedor'];
      JsEdit2.Enabled := false;
      JsEdit1.Enabled := true;
      JsEdit1.SetFocus;
    end;

  end;

  Timer2.Enabled := TRUE;

  cont := 0;
  DBGrid1.DataSource := dm.dsprod;

  if screen.Width = 1024 then
  begin
    DBGrid2.Columns[1].Width := 150;
  end;

  DBGrid2.Repaint;

  { for i := 0 to DBGrid2.Columns.Count -1 do
    begin
    cont := cont + DBGrid2.Columns[i].Width + 15;
    end; }

  // DBGrid2.Width := cont;
  self.Repaint;
  DBGrid2.Repaint;

  if screen.Width = 1024 then
  begin
    DBGrid2.Width := panelTotal.Left - 20;
  end;

  funcoes.OrdenaCamposVenda(funcoes.buscaParamGeral(1, ''));
  funcoes.BuscaResizeDBgrid(DBGrid1, 'FORM20');

  if (separaPecas) then
  begin
    if separaVendaOrcamento = false then
      recuperaServico(COD_SERVICO);
    if (not finaliza) then
    begin
      DBGrid1.Enabled := true;
      DBGrid2.Enabled := true;
      DBGrid1.SetFocus;

      ClientDataSet1vendedor.Visible := true;
      ClientDataSet1vendedor.DisplayLabel := 'VENDEDOR';
      JsEdit2.Enabled := true;
      JsEdit2.SetFocus;
    end;
  end;

  if Compra then
  begin
    ordenaCampos := false;
    if funcoes.buscaParamGeral(89, 'N') = 'S' then
    begin
      ordenaCampos := true;
    end;

    ordem := ' nome';

    dm.produto.Close;
    dm.produto.SQL.Clear;
    dm.produto.SQL.Add
      ('select nome as Descricao, p_compra as preco, estoque as minimo, quant as estoque, deposito, sugestao, unid as unidade, refori as '
      + refori1 +
      ', codbar, cod, aplic as Aplicacao, fracao, p_venda as preco_venda from produto order by '
      + ordem);
    dm.produto.Open;



    funcoes.fetchDataSet(dm.produto);

    sqlVenda :=
      'select nome as Descricao, p_compra as preco, estoque as minimo, quant as estoque, deposito, sugestao, unid as unidade, refori as '
      + refori1 +
      ', codbar, cod, aplic as Aplicacao, fracao, p_venda as preco_venda from produto';

    // dm.produto.FieldByName('sugestao').Visible := false;
    dm.produto.FieldByName('fracao').Visible := false;

    funcoes.FormataCampos(dm.produto, 2, 'ESTOQUE', 3);
    funcoes.resizeCamposIdividualDBGRID(DBGrid1);
    formataCamposPreco;

    ordemCompra := funcoes.buscaParamGeral(101, '');
    if trim(ordemCompra) <> '' then
    begin
      funcoes.OrdenaCamposVenda(ordemCompra, true);
    end;

    // StaticText4.Caption := 'F12 - Por Fornecedor';
    // StaticText3.Caption := 'F8 - Código de Barras';
    // StaticText2.Caption := 'F2 - Pedidos'  ;
    // StaticText1.Visible := false;
    Label4.Caption := 'Fornec.:';

    l1 := TLabel.Create(self);
    l2 := TLabel.Create(self);
    l3 := TLabel.Create(self);
    l1.Caption := 'Fração: ';
    l2.Caption := 'Ref. Original: ';
    l3.Caption := 'Sugestão de Compra: 0,00';

    l1.Parent := self;
    l1.AutoSize := true;
    l1.Font.Style := [fsBold];
    // l1.Font.Size := 12;

    l2.Parent := self;
    l2.AutoSize := true;
    l2.Font.Style := [fsBold];
    // l2.Font.Size := 12;

    l3.Parent := self;
    l3.AutoSize := true;
    l3.Font.Style := [fsBold];
    // l3.Font.Size := 12;

    l1.Top := StaticText2.Top + l1.Height - 32;
    l1.Left := 30;

    l2.Top := l1.Top;
    l2.Left := l1.Left + l1.Width + 100;

    l3.Top := l1.Top;
    if screen.Width= 1024 then begin
      l3.Left := l2.Left + l2.Width + 150;
    end
    else l3.Left := l2.Left + l2.Width + 150;

    if screen.Width= 800 then begin
      l2.Left := l1.Left + l1.Width + 50;
      l3.Left := l2.Left + l2.Width + 80;
    end;

    DBGrid2.Height := DBGrid2.Height - 20;

    //StaticText2.Top := l3.Top + l3.Height +20;

    // funcoes.CtrlResize(tform(self));
    JsEditInteiro1.Text :=
      IntToStr(StrToIntDef(Incrementa_Generator('compra', 0), 0) + 1);

    DBGrid1.DataSource := dm.dsprod;
    cont := 0;

    exit;
  end;

  formataCamposPreco;

  For i := 0 to ClientDataSet1.FieldCount - 1 do
    ClientDataSet1.Fields[i].Tag := 30;
  funcoes.AutoSizeDBGrid(DBGrid1);
end;

procedure TForm20.JsEdit3KeyPress(Sender: TObject; var Key: Char);
var
  i: currency;
begin

  verificaCliente := false;
  if Key = #27 then begin

    verificaCliente := true;
    if JsEdit2.Enabled then begin
      JsEdit2.Text := '';
      JsEdit1.Text := '0';
      JsEdit3.Text := '';
      JsEdit2.SetFocus;
    end
    else begin
      JsEdit1.Text := '0';
      JsEdit3.Text := '';
      JsEdit1.Enabled := true;
      JsEdit1.SetFocus;
    end;

    Key := #0;
  end;

  if (Key = #13) and (JsEdit3.Text = '') then begin
    if Compra then begin
      form8 := tform8.Create(self);
      form8.setComponente_a_Retornar(jsedit(Sender));
      funcoes.CtrlResize(TForm(form8));
      form8.ShowModal;
      jsedit.LiberaMemoria(form8);
      form8.Free;
      Key := #0;
      exit;
    end;

    // 16=Permitir Acesso do Vendedor ao Cadastro de Clientes?
    if funcoes.buscaParamGeral(16, '') = 'S' then begin
      form16 := tform16.Create(self);
      form16.setComponente_a_Retornar(JsEdit3);
      funcoes.CtrlResize(TForm(form16));
      form16.ShowModal;
      jsedit.LiberaMemoria(form16);
      form16.Free;
      Key := #0;
    end
    else begin

      cliente := funcoes.localizar('Localizar Cliente', 'cliente', 'cod,nome,telres,telcom,cnpj,bairro', 'cod,nome', '', 'nome', 'nome', false, false, false, '', 0, nil);
      buscaNomeCliente;
      tedit(Sender).Text := copy(cliente, 0, pos('-', cliente) - 1);
      cliente := copy(cliente, pos('-', cliente) + 1, length(cliente));
      Caption := RetornaString_Modo_Venda_ou_Orcamento + 'Cliente - ' + cliente;
      // Label8.Caption := copy(cliente,pos('-',cliente)+1,length(cliente));
      if tedit(Sender).Text <> '' then
      begin
        DBGrid1.Enabled := true;
        DBGrid1.SetFocus;
      end;

    end;
  end;

  // if (key=#13) and (JsEdit3.Text='0') then label8.Caption := 'VENDA AO CONSUMIDOR';
  if (Key = #13) and (tedit(Sender).Text <> '') then begin

    if Compra then begin
      cliente := funcoes.BuscaNomeBD(dm.IBQuery1, 'nome', 'fornecedor',
        'where cod=' + tedit(Sender).Text);
      if cliente = 'Desconhecido' then
      begin
        self.Caption := 'Modo Compra: ' + 'Fornecedor Não Encontrado!';
        Key := #0;
        exit;
      end;

      self.Caption := 'Modo Compra: ' + tedit(Sender).Text + '-' + cliente;
      verificaCliente := true;
      DBGrid1.Enabled := true;
      DBGrid2.Enabled := true;
      DBGrid1.SetFocus;
      if funcoes.buscaParamGeral(5, '') = 'S' then
        codhis := '2';
      exit;
    end;

    cliente := funcoes.BuscaNomeBD(dm.IBselect, 'nome', 'cliente',
      'where cod=' + tedit(Sender).Text);
    if cliente = 'Desconhecido' then
    begin
      Caption := RetornaString_Modo_Venda_ou_Orcamento + 'Cliente - ' +
        'Cliente Não Encontrado!';
      Key := #0;
    end
    else
    begin
      Caption := RetornaString_Modo_Venda_ou_Orcamento + 'Cliente - ' + cliente;
      DBGrid1.SelectedIndex := AchaFieldDbgrid(DBGrid1, 'DESCRICAO');

      if StrToInt(strnum(JsEdit1.Text)) > 0 then
      begin
        // guarda o valor total dos itens adicionado no CDS em i porque p_total pode ser nulo
        if ClientDataSet1p_total.AsString = '' then
          i := 0
        else
          i := StrToCurr(ClientDataSet1p_total.AsString);

        if (funcoes.LerConfig(form22.Pgerais.Values['configu'], 6) <> 'N') then
          total_A_Limitar := ver_limites(JsEdit3.Text, i)
        else
          total_A_Limitar := 1000000;
        if (total_A_Limitar = 0) and
          (funcoes.LerConfig(form22.Pgerais.Values['configu'], 6) <> 'N') then
        begin
          funcoes.valordg := 'SX';
          Close;
        end
        else if (total_A_Limitar < 0) or (total_A_Limitar > 0) or
          (funcoes.LerConfig(form22.Pgerais.Values['configu'], 6) = 'N') then
        begin
          if funcoes.buscaParamGeral(5, '') = 'S' then
            codhis := '2';
          verificaCliente := true;
          DBGrid1.Enabled := true;
          DBGrid2.Enabled := true;
          DBGrid1.update;
          DBGrid2.update;
          DBGrid1.SetFocus;
          JsEdit1.Enabled := false;
        end;

      end
      else
      begin
        if funcoes.buscaParamGeral(5, '') = 'S' then
          codhis := '2';
        verificaCliente := true;
        DBGrid1.Enabled := true;
        DBGrid2.Enabled := true;
        DBGrid1.SetFocus;
        JsEdit1.Enabled := false;
      end;

    end;
  end;
end;

procedure TForm20.ExcluiItemVenda();
begin
  if not ClientDataSet1.IsEmpty then
  begin
    if MessageDlg('Deseja Excluir?', mtConfirmation, [mbyes, mbNo], 0) = mrYes
    then
    begin
      if ClientDataSet1estado.AsString = 'N' then
      begin
        if (separaPecas) and (separaVendaOrcamento = false) then
        begin
          ClientDataSet1vendedor.Visible := true;
          // if (RetornaAcessoUsuario > 0) and (form22.Pgerais.Values['codvendedor'] <> ClientDataSet1vendedor.AsString) then begin
          if ((RetornaAcessoUsuario > 0) and (funcoes.buscaParamGeral(103,
            'N') = 'N')) then
          begin
            ShowMessage('Esse Usuário Não Tem Permissão Para Excluir Este Produto!');
            exit;
          end;

          // funcoes.baixaEstoqueSP(ClientDataSet1CODIGO.AsString,
          // ClientDataSet1QUANT.AsCurrency, 1);

          dm.IBQuery1.Close;
          dm.IBQuery1.Close;
          dm.IBQuery1.SQL.Text := 'delete from os_itens where codseq = :cod';
          dm.IBQuery1.ParamByName('cod').AsInteger :=
            ClientDataSet1seqServ.AsInteger;
          dm.IBQuery1.ExecSQL;

          dm.IBQuery1.Close;
          dm.IBQuery1.SQL.Text :=
            'insert into EXCSERV(COD_SEQ, cod, quant, usuario, datahora, SERV)'
            + ' values(gen_id(EXCSERV, 1), :cod, :quant, :usuario, :datahora, :SERV)';
          dm.IBQuery1.ParamByName('cod').AsInteger :=
            ClientDataSet1CODIGO.AsInteger;
          dm.IBQuery1.ParamByName('quant').AsCurrency :=
            ClientDataSet1QUANT.AsCurrency;
          dm.IBQuery1.ParamByName('usuario').AsInteger :=
            StrToIntDef(form22.codusario, 0);
          dm.IBQuery1.ParamByName('datahora').AsDateTime :=
            DateOf(form22.datamov) + TimeOf(NOW);
          dm.IBQuery1.ParamByName('serv').AsInteger :=
            StrToIntDef(COD_SERVICO, 0);
          dm.IBQuery1.ExecSQL;
          dm.IBQuery1.Transaction.commit;
        end;
      end;

      ClientDataSet1.Delete;
    end;
  end;
end;

procedure TForm20.ClientDataSet12AfterDelete(DataSet: TDataSet);

begin
  escrveValor;
  /// if ClientDataSet1p_total.AsString <> '' then total.Caption := formataCurrency(StrToCurr(ClientDataSet1p_total.AsString))
  /// else total.Caption:='R$ 0,00';
end;

procedure TForm20.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  cod, busca, te: string;
begin
  if (Shift = [ssCtrl]) and (Key = 46) then Key := 0;

  if Compra then
  begin
    if Key = 113 then
    begin
      cod := funcoes.localizar('Localizar Compras', 'compra',
        'nota,data,prazo,cliente,total', 'nota', '', 'nota', 'data', false,
        false, false, '', 500, nil);
      if cod = '' then
        exit;
      DBGrid1.Enabled := true;
      RecuperaCompra(cod);
      Key := 0;
      exit;
    end;

    if Key = 120 then
    begin
      if funcoes.buscaParamGeral(5, '') = 'S' then
      begin
        funcoes.buscaEquivalencia1(dm.produto.FieldByName('cod').AsString);
        exit;
      end;

      exclui_item_venda_dbgrid2;
    end;

    if Key = 119 then
    begin
      DBGrid2.Enabled := true;
      DBGrid2.SetFocus; // F8
    end;

    if Key = 118 then
    begin
      if length(form22.Pgerais.Values['acessousu']) <= 2 then begin

      te := DBGrid1.DataSource.DataSet.FieldByName('cod').AsString;
      funcoes.fichaDoProduto(Sender, te, false);
      end;
    end;

    if Key = 117 then begin // f6
      if funcoes.buscaParamGeral(13, '') = 'S' then begin
        buscaCodigoBarras(1);
        exit;
      end;

      BuscaCodBar_F6_AutoPecas('', '3');
      exit;
    end;

    exit;
  end;

  if Key = 114 then // F3
  begin
    cod := funcoes.buscaParamGeral(51, 'S');

    if funcoes.buscaParamGeral(120, '') = 'S' then begin
      if cod = 'S' then
        cod := funcoes.localizar('Localizar Orçamentos', 'orcamento',
        'nota,data,nome,cliente,total', 'nota', '', 'nota', 'nota', false,
        false, true, ' where vendedor = ' + strnum(JsEdit2.Text), 500, nil)
      else
        cod := funcoes.localizar('Localizar Orçamentos', 'orcamento',
        'nota,data,nome,cliente,total', 'nota', '', 'nota', 'nota', false,
        false, true, '', 500, nil);
    end
    else begin
      if cod = 'S' then
        cod := funcoes.localizar('Localizar Orçamentos', 'orcamento',
        'nota,data,prazo,cliente,total', 'nota', '', 'nota', 'nota', false,
        false, true, ' where vendedor = ' + strnum(JsEdit2.Text), 500, nil)
      else
        cod := funcoes.localizar('Localizar Orçamentos', 'orcamento',
        'nota,data,prazo,cliente,total', 'nota', '', 'nota', 'nota', false,
        false, true, '', 500, nil);
    end;

    if not dm.bd.InTransaction then
    begin
      dm.produto.Open;


      funcoes.FormataCampos(dm.produto, 2, '', 2);
      formataCamposPreco;
    end;
    if cod = '' then
      exit;
    DBGrid1.Enabled := true;
    RecuperaOrcamento(cod);

    Key := 0;
    exit;
  end

  else if Key = 117 then // f6
  begin
    if funcoes.buscaParamGeral(13, '') = 'S' then
    begin
      buscaCodigoBarras(1);
      exit;
    end;

    BuscaCodBar_F6_AutoPecas('', '3');
    exit;
  end
  else if Key = 121 then
  begin // f10
    if funcoes.buscaParamGeral(17, 'N') = 'S' then
    begin
      dm.IBselect.Close;
      dm.IBselect.SQL.Text :=
        'select f.quant as quantidade, iif(tipo = ''0'', f.p_venda, p.p_venda- (p.p_venda * f.p_venda / 100)) as valor from promoc1 f left join produto p on (p.cod = f.cod) where f.cod = :cod';
      dm.IBselect.ParamByName('cod').AsInteger :=
        DBGrid1.DataSource.DataSet.FieldByName('cod').AsInteger;
      dm.IBselect.Open;

      funcoes.FormataCampos(dm.IBselect, 3, '', 3);


      funcoes.busca(dm.IBselect, '', '', '', '');
    end;
  end
  // key = F2
  else if Key = 113 then
  begin
    {ShowMessage(BoolToStr(separaPecas) + #13 +
                BoolToStr(Modo_Venda)  + #13 +
                BoolToStr(separaVendaOrcamento) + #13 +
                BoolToStr(finaliza) );}
    if separaPecas and Modo_Venda then begin
      separaVendaOrcamento := true;
      finaliza             := false;
    end;

    if ((finaliza) and (tipoVenda = 'SF')) and (separaPecas and Modo_Orcamento) then begin
      ShowMessage('Operação Não Disponível, Entre na Rotina de Orçamento no Menu Serviços!');
      exit;
    end;

    if Label5.Caption = 'Itens da Venda' then
    begin
      if form2.Oramento1.Visible = false then
      begin
        MessageDlg('Este Recurso Está Bloqueado!', mtWarning, [mbok], 1);
        exit;
      end;

      Modo_Orcamento := true;
      Modo_Venda := false;

      Form20.Caption := 'Modo Orçamento: ' + cliente;
      Label5.Caption := 'Itens do Orçamento';
      if not funcoes.contido('-', LabelVenda.Caption) then
        LabelVenda.Caption := 'Orçamento';
      Label5.update;
      exit;
    end;

    if form2.Vendas1.Visible = false then
    begin
      MessageDlg('Este Recurso Está Bloqueado!', mtWarning, [mbok], 1);
      exit;
    end;

    Modo_Venda := true;
    Modo_Orcamento := false;
    Form20.Caption := 'Modo Venda: ' + cliente;
    Label5.Caption := 'Itens da Venda';
    if not funcoes.contido('-', LabelVenda.Caption) then
      LabelVenda.Caption := 'Venda';
    Label5.update;
  end
  else if Key = 120 then // 120 = F9 abre tela de equivalência
  begin
    if funcoes.buscaParamGeral(13, '') = 'S' then
    begin
      buscaCodigoBarras;
      exit;
    end;

    if funcoes.buscaParamGeral(5, '') = 'S' then
    begin
      funcoes.buscaEquivalencia1(dm.produto.FieldByName('cod').AsString);
      exit;
    end;
    exclui_item_venda_dbgrid2;
  end
  else if Key = 123 then // F12
  begin
    Sleep(1);
    ordenaDatasetPorCampoBdgrid(DBGrid1.SelectedField.DisplayName, DBGrid1.DataSource.DataSet.FieldByName
      ('cod').AsString);
    exit;
  end
  else if Key = 116 then // F5
  begin
    cod := dm.produto.FieldByName('cod').AsString;
    dm.produto.Close;
    dm.produto.Open;

    funcoes.FormataCampos(dm.produto, 2, 'ESTOQUE', 3);
    funcoes.resizeCamposIdividualDBGRID(DBGrid1);
    formataCamposPreco;
    funcoes.OrdenaCamposVenda(funcoes.buscaParamGeral(1, ''));

    dm.produto.Locate('cod', cod, []);

    { }
  end
  else if Key = 118 then // F8
  begin
    if ((length(form22.Pgerais.Values['acessousu']) <= StrToIntDef(funcoes.buscaParamGeral(141, '2'), 2)) or (funcoes.LerConfig(form22.Pgerais.Values['configu'], 22) = 'S')) then begin
      te := DBGrid1.DataSource.DataSet.FieldByName('cod').AsString;
      funcoes.fichaDoProduto(Sender, te, false);
    end;
  end
  { else if key = 117 then // Tecla F6
    begin
    BuscaCodBar_F6_AutoPecas('');
    exit;
    end }
  else if Key = 119 then
  begin
    DBGrid2.Enabled := true;
    DBGrid2.SetFocus; // F8
  end;
  { else if key = 112 then //F1
    begin
    codhis := funcoes.LerFormPato(0,'F8 - Volta à Compra', false);
    end; }
end;

procedure TForm20.Timer1Timer(Sender: TObject);
begin
  procura := '';
  Timer1.Enabled := false;
end;

procedure TForm20.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := FALSE;
  FUNCOES.resizeCamposIdividualDBGRID(DBGrid1);

end;

procedure TForm20.JsEdit3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  cod: string;
begin
  if Key = 114 then
  begin
    cod := funcoes.localizar('Localizar Orçamentos', 'orcamento',
      'nota,data,prazo,cliente,total', 'nota', '', 'nota', 'data', false, false,
      false, '', 500, nil);
    if cod = '' then
      exit;
    RecuperaOrcamento(cod);
  end;
end;

procedure TForm20.JsEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    if (tedit(Sender).Text = '') then
      tedit(Sender).Text := funcoes.localizar('localizar Vendedor', 'vendedor',
        'cod,nome', 'cod', '', 'nome', 'nome', true, false, false, '',
        300, Sender);
    if (tedit(Sender).Text = '') then
      Key := #0;
    if (tedit(Sender).Text <> '') then
    begin
      dm.IBselect.Close;
      dm.IBselect.SQL.Clear;
      dm.IBselect.SQL.Add('select cod from vendedor where cod = :cod');
      dm.IBselect.ParamByName('cod').AsString := tedit(Sender).Text;
      dm.IBselect.Open;

      if dm.IBselect.IsEmpty then
      begin
        dm.IBselect.Close;
        ShowMessage('Vendedor não encontrado!');
        Key := #0;
        exit;
      end;

      dm.IBselect.Close;
    end;
  end;

  if Key = #27 then
  begin
    Key := #0;
    Saiu := true;
    Close;
    abort;
  end;

end;

procedure TForm20.JsEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    if JsEdit2.Enabled then
    begin
      JsEdit2.Text := '';
      JsEdit1.Text := '0';
      JsEdit3.Text := '';
      JsEdit2.SetFocus;
    end
    else
    begin
      Saiu := true;
      Close;
    end;
    Key := #0;
  end;
  if (Key = #13) then
  begin
    if (tedit(Sender).Text = '') then
      tedit(Sender).Text := '0';
    JsEdit3.Enabled := true;
  end;
end;

procedure TForm20.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then Key := 0;

  if Key = 119 then
  begin
    DBGrid1.Enabled := true;
    DBGrid1.SetFocus;
  end;

  if Key = 120 then
  begin
    exclui_item_venda_dbgrid2;
  end;
end;

procedure TForm20.DBGrid2KeyPress(Sender: TObject; var Key: Char);
var
  subTot, ner: String;
  posi, pos2, seq: integer;
  quant, sub: currency;
begin
  if Key = #27 then
  begin
    DBGrid1.SetFocus;
  end;

  if (Key = #13) then
  begin
    if ((DBGrid2.SelectedField.DisplayName = 'PRECO') and
      (contido(configUsuarioConfirmarPreco, 'SPX')) or
      (LeftStr(ClientDataSet1DESCRICAO.AsString, 7) = 'SERVICO')) then
    begin
      ner := '-1';
      subTot := confirmaPrecoProduto(ClientDataSet1CODIGO.AsString, ner, subTot,
        1, (LeftStr(ClientDataSet1DESCRICAO.AsString, 7) = 'SERVICO'));

      if ((subTot = '*') or (StrToCurrDef(subTot, 0) = 0)) then
        exit;


      total_A_Limitar := -1;

      if (jsedit1.getValor > 0) and (Compra <> true) then begin
        total_A_Limitar := ver_limites(JsEdit3.Text, ClientDataSet1QUANT.AsCurrency * StrToCurrDef(subTot, 0));

        if total_A_Limitar = 0 then begin
          WWMessage('Este Cliente Excedeu Seu Limite de Crédito.', mtInformation,[mbok], HexToTColor('FFD700'), true, false, HexToTColor('B22222'));
          exit;
        end;
      end;

      ClientDataSet1.Edit;
      ClientDataSet1.FieldByName('preco').AsCurrency := StrToCurrDef(subTot, 0);
      ClientDataSet1.FieldByName('total').AsCurrency :=
        Arredonda(ClientDataSet1.FieldByName('preco').AsCurrency *
        ClientDataSet1.FieldByName('quant').AsCurrency, 2);
      ClientDataSet1.Post;
    end;

    if (DBGrid2.SelectedField.DisplayName = 'QUANT') then
    begin


      if separaPecas then
        exit;

      subTot := funcoes.dialogo('numero', 0, '1234567890,.' + #8, 3, false, '',
        'Control For Windows', 'Quantidade:', FormatCurr('#,###,###0.'+ CompletaOuRepete('','','0', CasasDecimaisQuantidade),
        ClientDataSet1.FieldByName('quant').AsCurrency));
      if (subTot = '*') or (StrToCurrDef(funcoes.ConverteNumerico(subTot),
        0) = 0) then
        exit;

      seq := ClientDataSet1cod_seq.AsInteger;

      quant := StrToCurrDef(subTot, 0);
      sub := quant;


      if (jsedit1.getValor > 0) and (Compra <> true) then begin
        total_A_Limitar := ver_limites(JsEdit3.Text, quant * ClientDataSet1PRECO.AsCurrency);

        if total_A_Limitar = 0 then begin
          WWMessage('Este Cliente Excedeu Seu Limite de Crédito.', mtInformation,[mbok], HexToTColor('FFD700'), true, false, HexToTColor('B22222'));
          exit;
        end;
      end;


      if funcoes.LerConfig(form22.Pgerais.Values['configu'], 11) = 'N' then
      begin // permitir venda sem estoque disponivel
        if quant < 0 then
        begin
          WWMessage('Venda de quantidade Negativa Não Permitida!',
            mtInformation, [mbok], HexToTColor('FFD700'), true, false,
            HexToTColor('B22222'));
          exit;
        end;
      end;

      if ClientDataSet1estado.AsString = 'N' then
      begin
        if (separaPecas) and (separaVendaOrcamento = false) then
        begin
          ClientDataSet1vendedor.Visible := true;

          if (RetornaAcessoUsuario > 0) and
            (form22.Pgerais.Values['codvendedor'] <>
            ClientDataSet1vendedor.AsString) then
          begin
            ShowMessage
              ('Esse Usuário Não Tem Permissão Para ALTERAR Este Produto!');
            exit;
          end;

          dm.IBQuery1.Close;
          dm.IBQuery1.SQL.Text :=
            'update os_itens set quant = :quant where codseq = :cod';
          dm.IBQuery1.ParamByName('quant').AsCurrency := quant;
          dm.IBQuery1.ParamByName('cod').AsInteger :=
            ClientDataSet1seqServ.AsInteger;
          dm.IBQuery1.ExecSQL;
          dm.IBQuery1.Transaction.commit;
        end;
      end;

      if funcoes.verificaSePodeVenderFracionado(ClientDataSet1CODIGO.AsInteger,
        '', quant) = false then
        exit;

      if not limitar_QTD_Estoque(quant, ClientDataSet1CODIGO.AsInteger, false) then exit;



      quant := StrToCurr(subTot);

      ClientDataSet1.DisableControls;
      ClientDataSet1.Locate('cod_seq', seq, []);
      ClientDataSet1.EnableControls;
      ClientDataSet1.Open;
      ClientDataSet1.Edit;
      ClientDataSet1.FieldByName('quant').AsCurrency := StrToCurr(subTot);
      if not saidaDeEstoque then
      begin
        ClientDataSet1.FieldByName('total').AsCurrency :=
          Arredonda(ClientDataSet1.FieldByName('quant').AsCurrency *
          ClientDataSet1.FieldByName('preco').AsCurrency, 2);
        ClientDataSet1TOT_ORIGI2.AsCurrency :=
          Arredonda(ClientDataSet1.FieldByName('quant').AsCurrency *
          ClientDataSet1PRECO_ORIGI.AsCurrency, 2);
      end;

      ClientDataSet1.Post;
    end;
  end;
end;

procedure TForm20.ClientDataSet12AfterPost(DataSet: TDataSet);
begin
  total.Caption := 'R$ ' + formataCurrency(somaValor);
  exit;
  if ClientDataSet1p_total.AsString <> '' then
  begin
    escrveValor;
    total.Visible := true;
    Label9.Visible := false;
  end
  else
    total.Caption := 'R$ 0,00';
end;

procedure TForm20.ClientDataSet1AfterDelete(DataSet: TDataSet);
begin
  escrveValor;
end;

procedure TForm20.ClientDataSet1AfterOpen(DataSet: TDataSet);
begin
  funcoes.resizeCamposIdividualDBGRID(DBGrid2);
end;

procedure TForm20.ClientDataSet1AfterPost(DataSet: TDataSet);
begin
  escrveValor;
  if ((tipoTrocaDescontoUsuario <> 'F') and (funcoes.buscaParamGeral(128, 'S') = 'S')) then begin
    form22.Pgerais.Values['configu'] := configUsuario;
  end;
end;

procedure TForm20.DBGrid2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 46 then
    ExcluiItemVenda;
end;

procedure TForm20.JsEdit3Exit(Sender: TObject);
begin
  // sem cliente vai ser false quando a configuracao de usuario 5 estiver <> 'N'
  // quando estiver 'N' nao vai ser preciso verificar cliente
  if semCliente = false then begin
    if not verificaCliente then
    begin
      if JsEdit3.Enabled then JsEdit3.SetFocus;
    end;
  end;
end;

procedure TForm20.JsEdit3Enter(Sender: TObject);
begin
  validaVendedor;
  verificaCliente := true;
  JsEdit1.Enabled := true;

  //JsEdit2.Enabled := true;
  DBGrid1.Repaint;

  if separaPecas and (finaliza = false) then
  begin
    habilitaDBGRIDs(true);
    DBGrid1.SetFocus;
    exit;
  end;

  if (Modo_Orcamento and (funcoes.LerConfig(form22.Pgerais.Values['configu'], 12) = 'O')) then begin
    exit;
  end;

  if Compra = false then
    DBGrid2.Enabled := false;

  if tipoVenda <> 'SF' then
  begin
    if semCliente and (not Compra) then
    begin
      if JsEdit1.Text = '0' then
      begin
        JsEdit3.Text := '0';
        habilitaDBGRIDs(true);
        DBGrid1.SetFocus;
      end;
    end;
  end;
end;

procedure TForm20.JsEdit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  cod: string;
begin
  if Key = 114 then
  begin
    cod := funcoes.localizar('Localizar Orçamentos', 'orcamento',
      'nota,data,prazo,cliente,total', 'nota', '', 'nota', 'data', false, false,
      false, '', 450, nil);
    if cod = '' then
      exit;
    RecuperaOrcamento(cod);
  end;
end;

procedure TForm20.JsEdit1Enter(Sender: TObject);
begin
  validaVendedor;
  if JsEdit1.Text = '0' then JsEdit1.Text := funcoes.buscaParamGeral(146, '0');
end;

procedure TForm20.JsEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 38) and (not JsEdit2.Enabled) then
    Key := 0;
end;

procedure TForm20.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if DBGrid1.DataSource.DataSet.RecNo mod 2 = 0 then
  begin
    if not(Odd(DBGrid1.DataSource.DataSet.RecNo)) then // Se não for par
      if not (gdSelected in State) then Begin // Se o estado da célula não é selecionado
        with DBGrid1 do Begin
            with Canvas do Begin
                try
                  Brush.Color := StringToColor(funcoes.buscaCorBDGRID_Produto); // Cor da célula
                except
                  Brush.Color := HexToTColor('F5F5F5');
                end;
                //Brush.Color := HexToTColor('7093DB'); // Cor da célula
                //Brush.Color := HexToTColor('81DAF5');
                 FillRect (Rect); // Pinta a célula
            End; // with Canvas
             DefaultDrawDataCell (Rect, Column.Field, State) // Reescreve o valor que vem do banco
        End // With DBGrid1
    End // if not (gdSelected in State)
  end;
end;

procedure TForm20.DBGrid1Enter(Sender: TObject);
begin
  if JsEdit1.getValor > 0 then JsEdit3.Enabled := false;
  DBGrid1.Repaint;

  if funcoes.buscaParamGeral(77, '') = 'S' then // busca por código de barras
  begin // para loja de roupas
    if fimVenda = 0 then begin
       buscaCodigoBarras();
    end;
  end;

  if ((form22.Pgerais.Values['codvendedor'] = '0') and (VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false = false)) then begin
    JsEdit2.Enabled := false;
    JsEdit1.Enabled := false;
  end;

  if (JsEdit2.Text <> '0') then begin
    JsEdit2.Enabled := false;
  end;
end;

procedure TForm20.DBGrid1Exit(Sender: TObject);
begin
  DBGrid1.Enabled := false;
end;

procedure TForm20.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if TDBGrid(sender).DataSource.DataSet.RecNo mod 2 = 0 then
  begin
    if not(Odd(TDBGrid(sender).DataSource.DataSet.RecNo)) then // Se não for par
      if not (gdSelected in State) then Begin // Se o estado da célula não é selecionado
        with TDBGrid(sender) do Begin
            with Canvas do Begin
                try
                  Brush.Color := StringToColor(funcoes.buscaCorBDGRID_Produto); // Cor da célula
                except
                  Brush.Color := HexToTColor('F5F5F5');
                end;
                //Brush.Color := HexToTColor('7093DB'); // Cor da célula
                //Brush.Color := HexToTColor('81DAF5');
                 FillRect (Rect); // Pinta a célula
            End; // with Canvas
             DefaultDrawDataCell (Rect, Column.Field, State) // Reescreve o valor que vem do banco
        End // With DBGrid1
    End // if not (gdSelected in State)
  end;
end;

procedure TForm20.DBGrid2Enter(Sender: TObject);
begin
  DBGrid1.Enabled := true;
end;

procedure TForm20.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  busca: string;
begin
  if (ssCtrl in Shift) and (chr(Key) in ['P', 'p']) and (VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false) then begin
      form9 := tform9.Create(self);
      JsEdit.SetTabelaDoBd(form9,'produto',dm.IBQuery1);
      form9.cod.Text := DBGrid1.DataSource.DataSet.fieldbyname('cod').AsString;
      form9.cod.SelecionaDoBD(form9.Name);
      funcoes.CtrlResize(tform(form9));
      form9.ShowModal;
      JsEdit.LiberaMemoria(form9);
      form9.Free;
      exit;
    end;


  if (ssCtrl in Shift) and (chr(Key) in ['F', 'f']) then
    begin
      form95 := TForm95.Create(self);
      form95.venda := true;
      form95.Caption := 'Visualização de Imagem';
      form95.cod := DBGrid1.DataSource.DataSet.FieldByName('cod').AsString;

      if funcoes.buscaParamGeral(5, 'N') = 'S' then begin
        form95.Panel1.Caption := DBGrid1.DataSource.DataSet.FieldByName('codbar').AsString + '-' + DBGrid1.DataSource.DataSet.FieldByName('descricao').AsString;
      end
      else begin
        form95.Panel1.Caption := DBGrid1.DataSource.DataSet.FieldByName('cod').AsString + '-' + DBGrid1.DataSource.DataSet.FieldByName('descricao').AsString;
      end;
      form95.mostraFoto;
      form95.ShowModal;
      form95.Free;
    end;


  if Compra then
  begin
    { if key = 119 then//F8 busca por codbarras
      begin
      if ConfParamGerais.Strings[5] = 'S' then
      begin
      if ConfParamGerais[13] = 'S' then
      begin
      buscaCodigoBarras;
      exit;
      end;
      BuscaCodBar_F6_AutoPecas('');
      exit;
      end;

      busca := funcoes.dialogo('normal',0,'',0,false,'','Control For Windows','Informe um Código','');
      dm.produto.Locate('codbar',busca,[loPartialKey,loCaseInsensitive]);
      DBGrid1.Enabled := true;
      DBGrid1.SetFocus;

      AddProdutoCDS_Compra(1,dm.produto.fieldbyname('preco').AsCurrency);
      end; }

    if Key = 123 then
    begin
      if funcoes.buscaParamGeral(91, 'S') = 'S' then
      begin
        FiltraCompraPorFornec();
        if trim(ordemCompra) <> '' then
        begin
          funcoes.OrdenaCamposVenda(ordemCompra, true);
        end;
        exit;
      end;

      ordenaDatasetPorCampoBdgrid('cod', DBGrid1.DataSource.DataSet.FieldByName('cod').AsString);
      exit;
      { testa := testa + 1;
        dm.produto.Close;
        dm.produto.SQL.Clear;
        if testa = 1 then
        begin
        dm.produto.SQL.Add('select nome as Descricao, p_compra as preco, estoque as minimo, quant as estoque,unid as un, refori, codbar, deposito, cod, aplic as Aplicacao, sugestao, fracao from produto where fornec = ' + JsEdit3.Text + ' order by nome asc');
        testa := -1;
        end
        else dm.produto.SQL.Add('select nome as Descricao, p_compra as preco, estoque as minimo, quant as estoque,unid as un, refori, codbar, deposito, cod, aplic as Aplicacao, sugestao, fracao from produto order by nome asc');
        dm.produto.Open;
        funcoes.FormataCampos(dm.produto,2,'ESTOQUE',3); }
    end;

    if Key = 38 then
    begin
      l3.Caption := 'Sugestão de Compra: ' + FormatCurr('#,###,###0.00',
        dm.produto.FieldByName('sugestao').AsCurrency);
      l1.Caption := 'Fração: ' + FormatCurr('#,###,###0.00',
        dm.produto.FieldByName('fracao').AsCurrency);
      l2.Caption := 'Ref. Original: ' + dm.produto.FieldByName
        ('refori').AsString;
      self.Repaint;
    end;
    if Key = 40 then
    begin
      l3.Caption := 'Sugestão de Compra: ' + FormatCurr('#,###,###0.00',
        dm.produto.FieldByName('sugestao').AsCurrency);
      l1.Caption := 'Fração: ' + FormatCurr('#,###,###0.00',
        dm.produto.FieldByName('fracao').AsCurrency);
      l2.Caption := 'Ref. Original: ' + dm.produto.FieldByName
        ('refori').AsString;
      self.Repaint;
    end;
  end
  else if Modo_Venda then
  begin
    if funcoes.buscaParamGeral(5, '') = 'S' then
    begin
      if Key = 38 then
      begin
        if funcoes.buscaParamGeral(139, '') = 'S' then exit;

        PanelValores.Visible := true;
        avista := Arredonda(dm.produto.FieldByName('preco').AsCurrency -
          (dm.produto.FieldByName('preco').AsCurrency *
          (StrToCurrDef(funcoes.buscaParamGeral(28, ''), 20) / 100)), 2);
        aprazo := Arredonda(dm.produto.FieldByName('preco').AsCurrency -
          (dm.produto.FieldByName('preco').AsCurrency *
          (StrToCurrDef(funcoes.buscaParamGeral(29, ''), 15) / 100)), 2);
        labelValores.Caption := 'A VISTA R$ ' + FormatCurr('#,###,###0.00',
          avista) + CRLF + 'CARTÃO R$ ' + FormatCurr('#,###,###0.00', aprazo);
      end;
      if Key = 40 then
      begin
        if funcoes.buscaParamGeral(139, '') = 'S' then exit;


        PanelValores.Visible := true;
        avista := Arredonda(dm.produto.FieldByName('preco').AsCurrency -
          (dm.produto.FieldByName('preco').AsCurrency *
          (StrToCurrDef(funcoes.buscaParamGeral(28, ''), 20) / 100)), 2);
        aprazo := Arredonda(dm.produto.FieldByName('preco').AsCurrency -
          (dm.produto.FieldByName('preco').AsCurrency *
          (StrToCurrDef(funcoes.buscaParamGeral(29, ''), 15) / 100)), 2);
        labelValores.Caption := 'A VISTA R$ ' + FormatCurr('#,###,###0.00',
          avista) + CRLF + 'CARTÃO R$ ' + FormatCurr('#,###,###0.00', aprazo);
      end;
    end;
  end;
end;

procedure TForm20.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if funcoes.buscaParamGeral(5, '') = 'S' then
  begin
    if Key = 112 then begin
      codhis := funcoes.LerFormPato(0, 'F8 - Volta à Compra', false);
      if codhis <> '*' then formaAlterada := codhis;
      
      lancaDescontoPorFormaDePagamento(StrToIntDef(codhis, 0));
      exit;
    end;

    if (ssAlt in Shift) and (Key = 115) then begin

    end
    else begin
      if Key = 115 then begin
        funcoes.executaCalculadora;
        exit;
      end;
    end;
  end;

  if Key = 112 then
    funcoes.executaCalculadora;
  if (ssShift in Shift) and (Key = 122) then
  begin
    try
      funcoes.trocaDeUsuario(tipoTrocaDescontoUsuario);
      configUsuarioConfirmarPreco := trim(funcoes.LerConfig(form22.Pgerais.Values['configu'], 2));
      // troca somente o desconto do usuario
      // e pode colocar o desconto permitido para o usuario
    except
    end;
    Key := 0;
    exit;
  end;
end;

procedure TForm20.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '+' then
  begin
    if condicaoAumentarDBGRID2TrueZOOMnasDUAS then funcoes.aumentaFonte1(self, true, 1)
      else funcoes.aumentaFonte(self, true, 1);
  end;

  if Key = '-' then
  begin
    if condicaoAumentarDBGRID2TrueZOOMnasDUAS then funcoes.aumentaFonte1(self, true, 2)
    else funcoes.aumentaFonte(self, true, 2);
  end;
end;

procedure TForm20.DBGrid2Exit(Sender: TObject);
begin
  // if Compra = false then DBGrid2.Enabled := false;
end;

procedure TForm20.BuscaCodBar_F6_AutoPecas1;
var
  busca: string;
  res: String;
begin
  busca := funcoes.dialogo('normal', 3, '', 60, true, '', 'ControlW',
    'Informe um Código:', '');
  if ((busca = '*') or (busca = '')) then
    exit;

  dm.produtotemp.Close;
  dm.produtotemp.SQL.Clear;
  dm.produtotemp.SQL.Add
    ('select cod, refori from produto where upper(codbar) like (' +
    QuotedStr(busca + '%') + ') and (not left(nome, 1) = ''_'') order by codbar');
  dm.produtotemp.Open;

  if dm.produtotemp.IsEmpty then begin
    dm.produtotemp.Close;
    ShowMessage('Produto Não encontrado');
    exit;
  end;

  res := dm.produtotemp.FieldByName('cod').AsString;

  if trim(ordemCompra) <> '' then
  begin
    funcoes.ordernaDataSetVenda('codbar', res, sqlVenda, DBGrid1, '', ordenaCampos);

    funcoes.OrdenaCamposVenda(ordemCompra, true);
    //funcoes.BuscaResizeDBgrid(DBGrid1, 'FORM20');

    DBGrid1.SelectedIndex := funcoes.buscaFieldDBgrid1('codbar', DBGrid1);
  end
  else
    funcoes.ordernaDataSetVenda('codbar', res, sqlVenda, DBGrid1, '', ordenaCampos);


  funcoes.BuscaResizeDBgrid(DBGrid1, 'FORM20');
  formataCamposPreco;
  exit;


  dm.produtotemp.Close;
  dm.produtotemp.SQL.Text :=
    ('select p.codbar,nome as Descricao,p_venda as Preco,quant as estoque,p.cod from produto p where (p.codbar like '
    + QuotedStr(busca + '%') + ') order by p.codbar');
  dm.produtotemp.Open;

  form25 := TForm25.Create(self);
  funcoes.CtrlResize(TForm(form25));
  form25.Caption := 'Consulta de Produto por Código de Barras';
  funcoes.FormataCampos(dm.produtotemp, 2, '', 2);
  form25.DBGrid1.DataSource := dm.dsprodtemp;

  if not dm.produtotemp.IsEmpty then
  begin
    form25.ShowModal;
  end
  else
    ShowMessage('Nenhum resultado encontrado');
  dm.produtotemp.Close;
  dm.produtotemp.SQL.Clear;
  dm.produtotemp.SQL.Add
    ('select codbar,nome as Descricao,p_venda as Preco,quant as estoque,cod from produto order by nome');
end;

procedure TForm20.escrveValor();
begin
  total.Caption := formataCurrency(somaValor);
end;

procedure TForm20.FiltraCompraPorFornec();
var
  orde1: string;
begin
  orde1 := DBGrid1.SelectedField.DisplayName;
  dm.produto.Close;
  if (not contido('WHERE', UpperCase(dm.produto.SQL.Text))) then
    dm.produto.SQL.Text := sqlVenda + ' WHERE FORNEC = ' + strnum(JsEdit3.Text)
      + ' order by ' + ordem
  else
    dm.produto.SQL.Text := sqlVenda + ' order by ' + orde1;

  dm.produto.Open;



  funcoes.FormataCampos(dm.produto, 2, '', 2);
  formataCamposPreco;

  funcoes.OrdenaCamposVenda(funcoes.buscaParamGeral(1, ''));
end;

function TForm20.buscaProdutoCDS(cod: String; Preco: currency;
  descri: string = ''; m2: integer = 0): boolean;
begin
  Result := false;

  if separaPecas then
    exit;

  try
    ClientDataSet1.DisableControls;
    ClientDataSet1.First;

    while not ClientDataSet1.Eof do
    begin
      if m2 > 0 then
      begin
        Result := false;
        exit;
      end;

      if descri <> '' then
      begin
        if ((ClientDataSet1CODIGO.AsString = cod) and
          (ClientDataSet1DESCRICAO.AsString = descri)) then
        begin
          Result := true;
          break;
        end;
      end
      else
      begin
        if ((ClientDataSet1CODIGO.AsString = cod)) then
        begin
          Result := true;
          break;
        end;
      end;

      ClientDataSet1.Next;
    end;

  finally
    // ClientDataSet1.First;
    ClientDataSet1.EnableControls;
  end;
end;

procedure TForm20.arrumaComponentes800();
var
  i, cont: integer;
begin
  if screen.Width = 800 then
  begin
    DBGrid2.Columns[0].Width := 50;
    DBGrid2.Columns[1].Width := 210;
  end
  else
    exit;

  DBGrid2.Font.Size := 7;
  DBGrid2.Font.Style := [];

  { cont := 0;
    for i := 0 to DBGrid2.Columns.Count -1 do
    begin
    cont := cont + DBGrid2.Columns[i].Width;
    end;

    DBGrid2.Width := cont; }

  panelTotal.Width := 300;

  panelTotal.Left := self.Width - panelTotal.Width - 10;
  DBGrid2.Left := 5;
  DBGrid2.Width := panelTotal.Left - 10;

  // panelTotal.Left   := DBGrid2.Left + DBGrid2.Width + 10;
  PanelValores.Left := panelTotal.Left;
  Panel4.Left := panelTotal.Left;

  PanelValores.Width := panelTotal.Width;
  Panel4.Width := panelTotal.Width;
end;

procedure TForm20.insereEntrada(historico: String; vlrEnt: currency);
var
  nome, codigo: String;
begin
  if vlrEnt = 0 then
    exit;

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text := 'select nome from cliente where cod = :cod';
  dm.IBQuery1.ParamByName('cod').AsString := strnum(cliente);
  dm.IBQuery1.Open;

  nome := dm.IBQuery1.FieldByName('nome').AsString;

  codigo := funcoes.novocod('creceber');

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text :=
    ('insert into contasreceber(nota,codgru,cod,formpagto,datamov,vendedor,data,vencimento,documento,codhis,historico,total,valor, pago) '
    + 'values(' + novocod + ',1,' + strnum(codigo) + ',' + strnum(codhis) +
    ',:datamov,' + strnum(JsEdit2.Text) + ',:data,:vencimento,' +
    strnum(JsEdit3.Text) + ',2,:hist,:total,:valor, :pago)');
  dm.IBQuery1.ParamByName('datamov').AsDateTime := form22.datamov;
  dm.IBQuery1.ParamByName('data').AsDateTime := NOW;
  dm.IBQuery1.ParamByName('vencimento').AsDateTime := NOW;
  dm.IBQuery1.ParamByName('hist').AsString := historico;
  dm.IBQuery1.ParamByName('total').AsCurrency := vlrEnt;
  dm.IBQuery1.ParamByName('valor').AsCurrency := vlrEnt;
  dm.IBQuery1.ParamByName('pago').AsCurrency := vlrEnt;
  dm.IBQuery1.ExecSQL;

//  ShowMessage(Parcelamento.Text);
  //ate aqui parcelamento esta preenchido

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Clear;
  dm.IBQuery1.SQL.Add
    ('insert into caixa(FORNEC,CODENTRADASAIDA,formpagto,documento, codgru,codmov,codhis,data,datamov,historico,entrada, usuario, tipo)'
    + ' values(' + novocod + ',:CODENTRADASAIDA,:codhis,:documento,1,' +
    funcoes.novocod('movcaixa') +
    ',:codhis,:dati,:dati,:hist,:ent, :usuario, ''E'') ');
  dm.IBQuery1.ParamByName('CODENTRADASAIDA').AsString := strnum(codigo);
  //dm.IBQuery1.ParamByName('codhis').AsString := strnum(codhis);

  dm.IBQuery1.ParamByName('codhis').AsString := strnum(Parcelamento.Values['formpagto']);
  if strnum(dm.IBQuery1.ParamByName('codhis').AsString) = '0' then dm.IBQuery1.ParamByName('codhis').AsString := '1';

  dm.IBQuery1.ParamByName('documento').AsString := strnum(JsEdit2.Text);
  dm.IBQuery1.ParamByName('dati').AsDateTime := DateOf(form22.datamov) + TimeOf(NOW);
  dm.IBQuery1.ParamByName('hist').AsString := historico;
  dm.IBQuery1.ParamByName('ent').AsCurrency := vlrEnt;
  dm.IBQuery1.ParamByName('usuario').AsString := strnum(form22.codusario);
  dm.IBQuery1.ExecSQL;
end;

function TForm20.buscaNomeCliente(): String;
begin
  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text := 'select nome from cliente where cod = :cod';
  dm.IBQuery1.ParamByName('cod').AsString := strnum(JsEdit3.Text);
  dm.IBQuery1.Open;

  clienteNome := dm.IBQuery1.FieldByName('nome').AsString;
  dm.IBQuery1.Close;
  if clienteNome = '' then
    clienteNome := 'DESCONHECIDO';
end;

function TForm20.buscaDesconto(cod: integer): currency;
begin
  dm.IBQuery3.Close;
  dm.IBQuery3.SQL.Clear;
  dm.IBQuery3.SQL.Add('select desconto  from produto where cod = :cod');
  dm.IBQuery3.ParamByName('cod').AsInteger := cod;
  dm.IBQuery3.Open;

  Result := StrToCurrDef(funcoes.LerConfig(form22.Pgerais.Values['configu'], 0), 0);

  if funcoes.buscaParamGeral(55, 'N') = 'S' then
  begin
    if dm.IBQuery3.FieldByName('desconto').AsCurrency > 0 then
    begin
      Result := dm.IBQuery3.FieldByName('desconto').AsCurrency;
    end;
  end;


  if MinimoPromoc > 0 then Result := MinimoPromoc;
  
  dm.IBQuery3.Close;
end;

procedure TForm20.lancaDescontoAtual_Antigo;
var
  temp2, temp1, total31, totalOriginal, totalOriginal1, porcentAUtilizar, porcentUtilizada
    : currency;
  fim, desc, tipoDesconto: string;
  teveDesconto: boolean;
begin
  if saidaDeEstoque = true then
  begin
    Desconto := 0;
    exit;
  end;

  tipoDesconto := funcoes.buscaParamGeral(2, '');

  porcentAUtilizar := 0;

  total31 := total1;
  // minimo é o valor maximo que pode ser dado de desconto em reais
  minimo := CalculaMinimoVendaCDS1(porcentUtilizada, totalOriginal,
    teveDesconto);


  totalOriginal1 := totalOriginal;
  totalOriginal  := total1;

  if funcoes.buscaParamGeral(55, 'N') = 'S' then
  begin
    totalOriginal1 := totalOriginal;
    tipoDesconto := 'S';
  end;

  if total1 = 0 then
  begin
    Desconto := 0;
    totalOriginal := 0;
    mostraDesconto(totalOriginal, Desconto, true);
    exit;
  end;

  if tipoDesconto = 'S' then
  begin
    total31 := total31 - minimo;
  
    fim := '-999999';
    while true do
    // ((StrToCurr(fim) < minimo) or not(StrToCurr(fim) > total1)) do
    begin
      fim := funcoes.dialogo('numero', 0, '1234567890,.' + #8, 0, false, 'ok',
        'Control for Windows:', 'Confirme o Valor Total (Mínimo ' +
        FormatCurr('#,###,###0.00', total31) + '):',
        FormatCurr('###,##0.00', total1));
      if fim = '*' then
      begin
        temp1 := total1;
        break;
      end;

      temp1 := StrToCurrDef(fim, 0);

       if ((funcoes.LerConfig(form22.Pgerais.Values['configu'], 8) = 'S') and (temp1 > total1)) then
       break;

      if (((temp1 >= total31) and (temp1 <= total1))) then
      begin
        break;
      end;

       if (((temp1 >= total31) and (temp1 <= total1)) or ((temp1 > total1) and
        VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false)) then
        begin
        break;
        end;

      if ((temp1 < total31) and
        (VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false)) then
        break;
    end;

    Desconto := (total1 - temp1);

    mostraDesconto(totalOriginal, Desconto, true);

    Desconto := -Desconto;
    total1 := total1 + Desconto;

    exit;
  end
  else if tipoDesconto = 'N' then
  begin
    // temp1 := porcentAUtilizar;
    temp1 := funcoes.ArredondaTrunca(minimo / total1 * 100, 2);
    if teveDesconto = false then
      temp1 := StrToCurrDef
        (funcoes.LerConfig(form22.Pgerais.Values['configu'], 0), 0);
    if temp1 < 0 then
      temp1 := 0;

    desc := '99999999';
    while true do
    begin
      desc := funcoes.dialogo('numero', 0, '1234567890,.' + #8, 0, false, 'ok',
        'Control for Windows:', 'Qual o Percentual de Desconto (Máximo=' +
        FormatCurr('#,###,###0.00', temp1) + '%) (%)?:', '0,00');
      if desc = '*' then
      begin
        desc := '0';
        break;
      end;

      if (StrToCurrDef(desc, 0) = temp1) then
        break;
      if ((StrToCurr(desc) > temp1) and
        (VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false)) then
        break;

      if (StrToCurr(desc) <= temp1) then
        break;
    end;

    temp1 := StrToCurrDef(desc, 0);
    // temp1 := temp1 + porcentUtilizada;
    // somei o que ja foi usado mais o que o usuario deu na venda

    Desconto := funcoes.ArredondaTrunca((total1 * temp1) / 100, 2);

    mostraDesconto(totalOriginal, Desconto, true);
    Desconto := -Desconto;
    total1 := total1 + Desconto;
  end
  else if tipoDesconto = 'X' then
  begin
    temp1 := funcoes.ArredondaTrunca(minimo / total1 * 100, 2);
    if teveDesconto = false then
      temp1 := StrToCurrDef
        (funcoes.LerConfig(form22.Pgerais.Values['configu'], 0), 0);
    if temp1 < 0 then
      temp1 := 0;

    total31 := total31 - minimo;
    desc := '99999999';
    while true do
    begin
      desc := funcoes.ConverteNumerico(funcoes.dialogo('numero', 0,
        '1234567890,.' + #8, 0, false, 'ok', 'Control for Windows:',
        'Qual o Percentual de Desconto (Máximo=' + FormatCurr('#,###,###0.00',
        temp1) + '%) (%)?:', '0,00'));
      if desc = '*' then
      begin
        desc := '0';
        break;
      end;

      if (StrToCurrDef(desc, 0) = temp1) then
      begin
        break;
      end;

      if ((StrToCurr(desc) > temp1) and
        (VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false)) then
      begin
        break;
      end;

      if (StrToCurr(desc) <= temp1) then
      begin
        break;
      end;
    end;

    // desconto := Arredonda((total1 * StrToCurr(desc))/100,2);
    // total1 := total1 - desconto;

    temp1 := StrToCurrDef(desc, 0);
    Desconto := funcoes.ArredondaTrunca((total1 * temp1) / 100, 2);

    mostraDesconto(totalOriginal, Desconto, true);
    Desconto := -Desconto;
    total1 := total1 + Desconto;

    fim := '-999999';
    while true do
    // ((StrToCurr(fim) < minimo) or not(StrToCurr(fim) > total1)) do
    begin
      fim := funcoes.dialogo('numero', 0, '1234567890,.' + #8, 0, false, 'ok',
        'Control for Windows:', 'Confirme o Valor Total (Mínimo ' +
        FormatCurr('#,###,###0.00', total31) + '):',
        FormatCurr('###,##0.00', total1));

      if fim = '*' then
      begin
        temp1 := total1;
        break;
      end;

      temp1 := StrToCurrDef(fim, 0);

      if ((funcoes.LerConfig(form22.Pgerais.Values['configu'], 8) = 'S') and (temp1 > total1)) then
       break;

      // se for maior que o minimo e menor que o total original, nao permite mais acrescimos na venda
      if (((temp1 >= total31) and (temp1 <= total1)) or ((temp1 > total1) and VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false)) then
      begin
        break;
      end;

      if ((temp1 < total31) and (VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false)) then
      begin
        break;
      end;
    end;

    Desconto := (totalOriginal - temp1);

    mostraDesconto(totalOriginal, Desconto, true);

    Desconto := -Desconto;
    total1 := totalOriginal + Desconto;

    exit;
  end;

end;

procedure TForm20.lancaDescontoAtual;
var
  temp2, temp1, total31, totalOriginal, porcentAUtilizar, porcentUtilizada
    : currency;
  fim, desc, tipoDesconto: string;
  teveDesconto: boolean;
begin
  if saidaDeEstoque = true then
  begin
    Desconto := 0;
    exit;
  end;

  tipoDesconto := funcoes.buscaParamGeral(2, '');

  porcentAUtilizar := 0;

  total31 := total1;
  // minimo é o valor maximo que pode ser dado de desconto em reais
  minimo := CalculaMinimoVendaCDS1(porcentUtilizada, totalOriginal,
    teveDesconto);

  totalOriginal := total1;

  if total1 = 0 then
  begin
    Desconto := 0;
    totalOriginal := 0;
    mostraDesconto(totalOriginal, Desconto, true);
    exit;
  end;

  if funcoes.buscaParamGeral(55, 'N') = 'S' then
  begin
    tipoDesconto := 'S';
  end;

  if tipoDesconto = 'S' then
  begin
    total31 := total31 - minimo;
    fim := '-999999';
    while true do
    // ((StrToCurr(fim) < minimo) or not(StrToCurr(fim) > total1)) do
    begin
      fim := funcoes.dialogo('numero', 0, '1234567890,.' + #8, 0, false, 'ok',
        'Control for Windows:', 'Confirme o Valor Total (Mínimo ' +
        FormatCurr('#,###,###0.00', total31) + '):',
        FormatCurr('###,##0.00', total1));
      if fim = '*' then
      begin
        temp1 := total1;
        break;
      end;

      temp1 := StrToCurrDef(fim, 0);

      if ((funcoes.LerConfig(form22.Pgerais.Values['configu'], 8) = 'S') and
        (temp1 > total1)) then
        break;
      if (((temp1 >= total31) and (temp1 <= total1)) or
        ((temp1 > total1) and
        VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false)) then
      begin
        break;
      end;
      if ((temp1 < total31) and
        (VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false)) then
        break;
    end;

    temp2 := somaDescontosVendaCDS(total1); // aqui somou o desconto dado
    temp2 := temp2 + ((total1 - temp2) - temp1);

    Desconto := temp2;

    mostraDesconto(total1, Desconto, true);

    Desconto := -Desconto;
    total1 := total1 + Desconto;

    exit;
  end
  else if tipoDesconto = 'N' then
  begin
    // temp1 := porcentAUtilizar;
    temp1 := funcoes.ArredondaTrunca(minimo / total1 * 100, 2);
    if teveDesconto = false then
      temp1 := StrToCurrDef
        (funcoes.LerConfig(form22.Pgerais.Values['configu'], 0), 0);
    if temp1 < 0 then
      temp1 := 0;

    desc := '99999999';
    while true do
    begin
      desc := funcoes.dialogo('numero', 0, '1234567890,.' + #8, 0, false, 'ok',
        'Control for Windows:', 'Qual o Percentual de Desconto (Máximo=' +
        FormatCurr('#,###,###0.00', temp1) + '%) (%)?:', '0,00');
      if desc = '*' then
      begin
        desc := '0';
        break;
      end;

      if (StrToCurrDef(desc, 0) = temp1) then
        break;
      if ((StrToCurr(desc) > temp1) and
        (VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false)) then
        break;

      if (StrToCurr(desc) <= temp1) then
        break;
    end;

    temp1 := StrToCurrDef(desc, 0);
    // temp1 := temp1 + porcentUtilizada;
    // somei o que ja foi usado mais o que o usuario deu na venda

    Desconto := funcoes.ArredondaTrunca((total1 * temp1) / 100, 2);

    mostraDesconto(totalOriginal, Desconto, true);
    Desconto := -Desconto;
    total1 := total1 + Desconto;
  end
  else if tipoDesconto = 'X' then
  begin
    temp1 := funcoes.ArredondaTrunca(minimo / total1 * 100, 2);
    if teveDesconto = false then
      temp1 := StrToCurrDef
        (funcoes.LerConfig(form22.Pgerais.Values['configu'], 0), 0);
    if temp1 < 0 then
      temp1 := 0;

    total31 := total31 - minimo;
    desc := '99999999';
    while true do
    begin
      desc := funcoes.ConverteNumerico(funcoes.dialogo('numero', 0,
        '1234567890,.' + #8, 0, false, 'ok', 'Control for Windows:',
        'Qual o Percentual de Desconto (Máximo=' + FormatCurr('#,###,###0.00',
        temp1) + '%) (%)?:', '0,00'));
      if desc = '*' then
      begin
        desc := '0';
        break;
      end;

      if (StrToCurrDef(desc, 0) = temp1) then
      begin
        break;
      end;
      if ((StrToCurr(desc) > temp1) and
        (VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false)) then
      begin
        break;
      end;

      if (StrToCurr(desc) <= temp1) then
      begin
        break;
      end;
    end;

    // desconto := Arredonda((total1 * StrToCurr(desc))/100,2);
    // total1 := total1 - desconto;

    temp1 := StrToCurrDef(desc, 0);
    Desconto := funcoes.ArredondaTrunca((total1 * temp1) / 100, 2);

    mostraDesconto(totalOriginal, Desconto, true);
    Desconto := -Desconto;
    total1 := total1 + Desconto;

    fim := '-999999';
    while true do
    // ((StrToCurr(fim) < minimo) or not(StrToCurr(fim) > total1)) do
    begin
      fim := funcoes.dialogo('numero', 0, '1234567890,.' + #8, 0, false, 'ok',
        'Control for Windows:', 'Confirme o Valor Total (Mínimo ' +
        FormatCurr('#,###,###0.00', total31) + '):',
        FormatCurr('###,##0.00', total1));

      if fim = '*' then
      begin
        temp1 := total1;
        break;
      end;

      temp1 := StrToCurrDef(fim, 0);

      if ((funcoes.LerConfig(form22.Pgerais.Values['configu'], 8) = 'S') and
        (temp1 > total1)) then
      begin
        break;
      end;
      if (((temp1 >= total31) and (temp1 <= total1)) or
        ((temp1 > total1) and
        VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false)) then
      begin
        break;
      end;
      if ((temp1 < total31) and
        (VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false)) then
      begin
        break;
      end;
    end;

    Desconto := (totalOriginal - temp1);

    mostraDesconto(totalOriginal, Desconto, true);

    Desconto := -Desconto;
    total1 := totalOriginal + Desconto;

    exit;
  end;

end;

procedure TForm20.atualizaPrecoProduto(codigo: integer; preco1: currency);
begin
  ClientDataSet1.First;
  while not ClientDataSet1.Eof do
  begin
    if ((codigo = ClientDataSet1CODIGO.AsInteger) and
      (ClientDataSet1PRECO.AsCurrency <> preco1) and (preco1 <> 0)) then
    begin
      ClientDataSet1.Edit;
      ClientDataSet1PRECO.AsCurrency := preco1;
      ClientDataSet1TOTAL.AsCurrency :=
        Arredonda(preco1 * ClientDataSet1PRECO.AsCurrency, 2);
      ClientDataSet1.Post;
      ClientDataSet1.First;
    end;

    ClientDataSet1.Next;
  end;

  ClientDataSet1.First;
end;

function TForm20.buscaPreco(codigo: integer; quant1: currency): currency;
var
  prec, p_venda, qtd: currency;
  tipo: String;
begin
  Result := 0;
  prec := 0;
  qtd := 0;

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text := 'select p_venda from produto where cod = :cod';
  dm.IBQuery1.ParamByName('cod').AsInteger := codigo;
  dm.IBQuery1.Open;

  p_venda := dm.IBQuery1.FieldByName('p_venda').AsCurrency;

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text :=
    'select cod, quant, p_venda, tipo from promoc1 where cod = :cod order by quant';
  dm.IBQuery1.ParamByName('cod').AsInteger := codigo;
  dm.IBQuery1.Open;

  if dm.IBQuery1.IsEmpty then
  begin
    dm.IBQuery1.Close;
    exit;
  end;

  ClientDataSet1.First;
  while not ClientDataSet1.Eof do
  begin
    if ((codigo = ClientDataSet1CODIGO.AsInteger) and
      (contido('** CANCELADO **', ClientDataSet1DESCRICAO.AsString) = false))
    then
    begin
      qtd := qtd + ClientDataSet1QUANT.AsCurrency;
    end;

    ClientDataSet1.Next;
  end;

  qtd := qtd + quant1;

  while not dm.IBQuery1.Eof do
  begin
    if qtd >= dm.IBQuery1.FieldByName('quant').AsCurrency then
    begin
      prec := dm.IBQuery1.FieldByName('p_venda').AsCurrency;
      tipo := dm.IBQuery1.FieldByName('tipo').AsString;
    end;
    dm.IBQuery1.Next;
  end;

  MinimoPromoc := prec;

  if tipo = '1' then
  begin
    prec := p_venda - (p_venda * (prec / 100));
    //prec := Arredonda(prec, 2);
  end;



  ClientDataSet1.First;

  dm.IBQuery1.Close;
  Result := prec;
end;

function TForm20.precoPromocaoGrupo(codGrupo: integer;
  var cdsVenda: TClientDataSet): currency;
var
  qtd, porc, acc: currency;
begin
  Result := 0;
  acc := 0;
  query1.Close;
  query1.SQL.Text :=
    'select doc, quant, p_venda from promoc1 where codgru = :cod';
  query1.ParamByName('cod').AsInteger := codGrupo;
  query1.Open;

  if query1.IsEmpty then
  begin
    query1.Close;
    exit;
  end;

  qtd := query1.FieldByName('quant').AsCurrency;
  porc := query1.FieldByName('p_venda').AsCurrency;
  query1.Close;

  cdsVenda.DisableControls;
  try
    cdsVenda.First;
    while not cdsVenda.Eof do
    begin
      if codGrupo = cdsVenda.FieldByName('grupo').AsInteger then
      begin
        acc := acc + cdsVenda.FieldByName('quant').AsCurrency;
      end;
      cdsVenda.Next;
    end;
  finally
    cdsVenda.First;
    cdsVenda.EnableControls;
  end;

  if acc >= qtd then
  begin
    cdsVenda.DisableControls;
    try
      cdsVenda.First;
      while not cdsVenda.Eof do
      begin
        if codGrupo = cdsVenda.FieldByName('grupo').AsInteger then
        begin
          cdsVenda.Edit;
          cdsVenda.FieldByName('preco').AsCurrency :=
            cdsVenda.FieldByName('preco_origi').AsCurrency -
            Arredonda(cdsVenda.FieldByName('preco_origi').AsCurrency *
            (porc / 100), 2);
          cdsVenda.FieldByName('TOTAL').AsCurrency :=
            Arredonda(cdsVenda.FieldByName('QUANT').AsCurrency *
            cdsVenda.FieldByName('preco').AsCurrency, 2);
          cdsVenda.Post;
        end;
        cdsVenda.Next;
      end;
    finally
      cdsVenda.First;
      cdsVenda.EnableControls;
    end;
  end;
end;

function TForm20.somaValor(): currency;
var
  i: integer;
begin
  i := ClientDataSet1cod_seq.AsInteger;
  ClientDataSet1.DisableControls;
  ClientDataSet1.First;
  Result := 0;
  try
    while not ClientDataSet1.Eof do
    begin
      Result := Result + ClientDataSet1TOTAL.AsCurrency;
      ClientDataSet1.Next;
    end;
  finally
    ClientDataSet1.Locate('cod_seq', i, []);
    ClientDataSet1.EnableControls;
  end;
end;

function TForm20.vendeProdutoM2: boolean;
var
  LARG, ALT, qtd: string;
  quant: currency;
begin
  Result := false;
  if funcoes.buscaParamGeral(63, 'N') = 'S' then
  begin
    if contido(LeftStr(DBGrid1.DataSource.DataSet.FieldByName('descricao')
      .AsString, 5), funcoes.buscaParamGeral(64, '|VIDRO|BOX  |FORRO|')) then
    begin
      Result := true;
      LARG := funcoes.dialogo('numero', 0, '1234567890,.' + #8, 3, false, '',
        'Control For Windows', 'Qual a Largura da Peça ?', '0,000');
      if LARG = '*' then
        exit;
      if StrToCurrDef(LARG, 0) <= 0 then
        exit;

      ALT := funcoes.dialogo('numero', 0, '1234567890,.' + #8, 3, false, '',
        'Control For Windows', 'Qual a Altura/Comprimento da Peça ?', '0,000');
      if ALT = '*' then
        exit;
      if StrToCurrDef(ALT, 0) <= 0 then
        exit;

      qtd := funcoes.dialogo('numero', 0, '1234567890,.' + #8, 3, false, '',
        'Control For Windows', 'Qual a Quantidade de Peças ?', '0,000');
      if qtd = '*' then
        exit;
      if StrToCurrDef(qtd, 0) <= 0 then
        exit;

      qtd := funcoes.ConverteNumerico(qtd);
      quant := StrToCurrDef(qtd, 0);

      quant := (StrToCurrDef(LARG, 0) * StrToCurrDef(ALT, 0)) * quant;
      cont := 1;

      LARG := LeftStr(DBGrid1.DataSource.DataSet.FieldByName('descricao')
        .AsString, 20) + ' ' + CompletaOuRepete(FormatCurr('0', StrToCurr(qtd)),
        '', ' ', 2) + 'X' + CompletaOuRepete('',
        FormatCurr('0.000', StrToCurr(LARG)), ' ', 6) + 'X' +
        CompletaOuRepete('', FormatCurr('0.000', StrToCurr(ALT)), ' ', 6);

      AddSegundaClienteDataSet_antigo(quant, dm.produto.FieldByName('preco')
        .AsCurrency, LARG, 1);

      { if funcoes.buscaParamGeral(71, 'S') = 'S' then begin
        AddSegundaClienteDataSet_antigo(quant, dm.produto.FieldByName('preco').AsCurrency, larg, 1);
        end
        else begin
        AddSegundaClienteDataSet(quant, dm.produto.FieldByName('preco').AsCurrency, larg, 1);
        end; }
    end;
  end;

end;

procedure TForm20.AddSegundaClienteDataSet_antigo(quanti, valor: double;
  nome: String = ''; m2: integer = 0);
var
  cod, busca, cbar: string;
  v2, vtot, totProd, tmp: double;
  qtd : Double;
  fla, grupo, tam, cont: Smallint;
begin
  fla := 0;
  cont := 0;
  totProd := 0;

  // adiciona item na segunda tabela
  if quanti <> 0 then
    busca := floatToStr(quanti)
  else
  begin
    busca := funcoes.dialogo('numero', 0, '1234567890,.' + #8, CasasDecimaisQuantidade, false, '',
      'Control For Windows', 'Quantidade:', '0,'+ CompletaOuRepete('','','0', CasasDecimaisQuantidade));
    // if (busca = '*') or (busca[1] + busca[2] + busca[3] = '0,0') then exit;
    if (busca = '*') then
      exit;
    busca := funcoes.ConverteNumerico(busca);
  end;

  qtd := StrToFloatDef(busca, 0);


  if qtd = 0 then
    exit;

  if m2 = 0 then
  begin
    if funcoes.verificaSePodeVenderFracionado(dm.produto.FieldByName('cod')
      .AsInteger, dm.produto.FieldByName('unid').AsString, qtd) = false then
      exit;
  end;

  if funcoes.LerConfig(form22.Pgerais.Values['configu'], 11) = 'N' then
  begin // permitir venda sem estoque disponivel
    if qtd < 0 then
    begin
      WWMessage('Venda de quantidade Negativa Não Permitida!', mtInformation,
        [mbok], HexToTColor('FFD700'), true, false, HexToTColor('B22222'));
      exit;
    end;
  end;

  vtot := somaValor;

  if valor <> 0 then
    v2 := valor
  else
  begin
    if funcoes.buscaParamGeral(100, 'N') = 'N' then
    begin
      v2 := dm.produto.FieldByName('PRECO').AsCurrency;
    end;
  end;


  if funcoes.buscaParamGeral(107, 'N') = 'S' then
  begin
    // busca o preço promocional em PROMOC1 que é desconto por quantidade
    MinimoPromoc := 0;
    tmp := buscaPreco(dm.produto.FieldByName('cod').AsInteger, qtd);


    if tmp <> 0 then
    begin
      valor := tmp;
      v2 := tmp;
    end;
  end;


  // if valor <> 0 then v2 := valor;
  if valor = 0 then
  begin
    valor := dm.produto.FieldByName('PRECO').AsCurrency;
    v2 := valor;
  end;

  if qtd > 200000 then
  begin
    ShowMessage('Quantidade não suportada. Máx. 50.000');
    exit;
  end;

  cod := dm.produto.FieldByName('cod').AsString;

  if valor = 0 then
    valor := v2;

  if (((total_A_Limitar >= vtot + (Arredonda(qtd * v2, 2))) or
    (total_A_Limitar < 0)) and (StrToIntDef(JsEdit1.Text, 0) > 0) or
    ((StrToIntDef(JsEdit1.Text, 0) = 0))) then
  begin
    // se o cod existir soma a qtd de entrada
    if limitar_QTD_Estoque(qtd, StrToInt(cod)) then
    begin
      // if ClientDataSet1.Locate('codigo',dm.produto.fieldbyname('cod').AsString,[]) then
      if buscaProdutoCDS(dm.produto.FieldByName('cod').AsString, valor, nome, m2)
      then
      begin
        grupo := ClientDataSet1grupo.AsInteger;
        if not saidaDeEstoque then
          totProd := Arredonda((ClientDataSet1.FieldByName('quant').AsCurrency +
            qtd) * v2, 2);


        ClientDataSet1.Open;
        ClientDataSet1.Edit;
        ClientDataSet1.FieldByName('quant').AsCurrency :=
          ClientDataSet1.FieldByName('quant').AsCurrency + qtd;
        ClientDataSet1PRECO.AsCurrency := v2;
        ClientDataSet1.FieldByName('total').AsCurrency := totProd;
        ClientDataSet1TOT_ORIGI2.AsCurrency :=
          Arredonda(ClientDataSet1.FieldByName('quant').AsCurrency *
          ClientDataSet1PRECO_ORIGI.AsCurrency, 2);
        ClientDataSet1.Post;

        // precoPromocaoGrupo(grupo, ClientDataSet1);
      end
      // se nao existir add um novo
      else
      begin
        dm.IBQuery4.Close;
        dm.IBQuery4.SQL.Text :=
          'select nome,grupo, unid from produto where cod = :cod';
        dm.IBQuery4.ParamByName('cod').AsInteger :=
          dm.produto.FieldByName('cod').AsInteger;
        dm.IBQuery4.Open;

        grupo := StrToIntDef(dm.IBQuery4.FieldByName('grupo').AsString, 0);
        if nome = '' then
          nome := dm.IBQuery4.FieldByName('nome').AsString;

        // ClientDataSet1.Open;
        tam := length(dm.produto.FieldByName('descricao').AsString);

        ClientDataSet1.Insert;
        ClientDataSet1m2.AsInteger := m2;
        ClientDataSet1minimo.AsCurrency :=
          buscaDesconto(dm.produto.FieldByName('cod').AsInteger);
        ClientDataSet1.FieldByName('codigo').AsString :=
          dm.produto.FieldByName('cod').AsString;
        ClientDataSet1DESCRICAO.Text := nome;
        ClientDataSet1.FieldByName('quant').AsFloat := qtd;
        ClientDataSet1.FieldByName('preco').AsFloat := v2;
        ClientDataSet1Refori.AsString :=
          dm.produto.FieldByName('codbar').AsString;

        ClientDataSet1.FieldByName('grupo').AsInteger :=
          StrToIntDef(dm.IBQuery4.FieldByName('grupo').AsString, 0);

        ClientDataSet1.FieldByName('unid').AsString :=
          dm.IBQuery4.FieldByName('unid').AsString;

        if not saidaDeEstoque then
          totProd := Arredonda(qtd * v2, 2);


        ClientDataSet1.FieldByName('total').AsCurrency := totProd;
        // ClientDataSet1PRECO_ORIGI.AsCurrency := StrToCurr(FormatCurr('0.00', dm.produto.fieldbyname('preco').AsCurrency));
        ClientDataSet1PRECO_ORIGI.AsCurrency := dm.produto.FieldByName('preco')
          .AsCurrency;
        ClientDataSet1TOT_ORIGI2.AsCurrency :=
          Arredonda(qtd * dm.produto.FieldByName('preco').AsCurrency, 2);
        ClientDataSet1cod_seq.AsInteger := numReg;
        ClientDataSet1vendedor.AsInteger := StrToInt(strnum(JsEdit2.Text));
        ClientDataSet1estado.AsString := 'I';
        ClientDataSet1.Post;

        // precoPromocaoGrupo(grupo, ClientDataSet1);
        fla := 1;

      end;
    end;
    escrveValor;
    // total.Caption := CurrToStrf(Arredonda(StrToCurr(ClientDataSet1p_total.AsString),2),ffCurrency, 2);
    dm.IBQuery1.Close;

  end
  else if (not(total_A_Limitar > vtot + Arredonda((qtd * v2), 2)) or
    (total_A_Limitar = -1)) and (StrToIntDef(JsEdit1.Text, 0) > 0) then
  begin
    WWMessage('Este Cliente Excedeu Seu Limite de Crédito.', mtInformation,
      [mbok], HexToTColor('FFD700'), true, false, HexToTColor('B22222'));
    exit;
  end;


  { if (StrToInt(JsEdit1.Text) = 0) then
    begin
    if limitar_QTD_Estoque(StrToCurr(busca)) then
    begin
    if ClientDataSet1.Locate('codigo',dm.produto.fieldbyname('cod').AsString,[]) then
    begin
    ClientDataSet1.Open;
    ClientDataSet1.Edit;

    ClientDataSet1.FieldByName('quant').AsCurrency := ClientDataSet1.FieldByName('quant').AsCurrency+StrToCurr(busca);
    ClientDataSet1.Post;

    ClientDataSet1.Open;
    ClientDataSet1.Edit;
    ClientDataSet1.FieldByName('total').AsCurrency := Arredonda(ClientDataSet1.FieldByName('quant').AsCurrency * v2,2);
    ClientDataSet1.Post;
    end
    //se nao existir add um novo
    else
    begin
    ClientDataSet1.Open;
    ClientDataSet1.Insert;
    ClientDataSet1.FieldByName('codigo').AsString := dm.produto.fieldbyname('cod').AsString;
    ClientDataSet1.FieldByName('descricao').AsString := dm.produto.fieldbyname('descricao').AsString;
    ClientDataSet1.FieldByName('quant').AsCurrency := StrToCurr(busca);
    ClientDataSet1.FieldByName('preco').AsCurrency := v2;
    ClientDataSet1.FieldByName('total').AsCurrency := Arredonda(StrToCurr(busca) * v2,2);
    ClientDataSet1.Post;
    end;
    total.Caption := CurrToStrf(Arredonda(StrToCurr(ClientDataSet1p_total.AsString),2),ffCurrency, 2);
    end;
    end; }
  if fla = 1 then
    ClientDataSet1.Last;
  ClientDataSet1.EnableControls;

end;

procedure TForm20.lancaDescontoPorFormaDePagamento(formapagamento: integer);
var
  ini, fim : integer;

begin
  if funcoes.buscaParamGeral(105, 'N') <> 'S' then
    exit;

  avista := StrToCurrDef(funcoes.buscaParamGeral(28, ''), 0);
  aprazo := StrToCurrDef(funcoes.buscaParamGeral(29, ''), 0);

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select dinheiro, desc_pag, imp_fiscal from FORMPAGTO where cod = :cod';
  dm.IBselect.ParamByName('cod').AsInteger := formapagamento;
  dm.IBselect.Open;

  dinheiro := trim(dm.IBselect.FieldByName('dinheiro').AsString);
  aprazoFormaDiferenteDe2 := trim(dm.IBselect.FieldByName('imp_fiscal').AsString);

  ClientDataSet1.DisableControls;
  ClientDataSet1.First;

  if formapagamento = 2 then
    avista := 0
  else if formapagamento > 2 then
    avista := aprazo;

  if dinheiro = 'X' then avista := StrToCurrDef(funcoes.buscaParamGeral(28, ''), 0);
  if dinheiro = 'C' then avista := StrToCurrDef(funcoes.buscaParamGeral(29, ''), 0);

  if dinheiro = 'D' then begin
    avista := dm.IBselect.FieldByName('desc_pag').AsCurrency;
  end;

  tipoTrocaDescontoUsuario := 'F';

  fim := ClientDataSet1.RecordCount;
  for ini := 1 to fim do
  begin
    ClientDataSet1.RecNo := ini;
    dm.IBselect.Close;
    dm.IBselect.SQL.Text := 'select p_venda from produto where cod = :cod';
    dm.IBselect.ParamByName('cod').AsString := ClientDataSet1CODIGO.AsString;
    dm.IBselect.Open;

    try
      ClientDataSet1.Edit;
      ClientDataSet1PRECO.AsCurrency := ArredondaTrunca(dm.IBselect.FieldByName('p_venda').AsCurrency -
        (dm.IBselect.FieldByName('p_venda').AsCurrency * (avista / 100)), 3);
      ClientDataSet1TOTAL.AsCurrency :=
        Arredonda(ClientDataSet1PRECO.AsCurrency *
        ClientDataSet1QUANT.AsCurrency, 2);

      ClientDataSet1minimo.AsCurrency := avista;
      ClientDataSet1.Post;
    except
    end;
  end;

  form22.Pgerais.Values['configu'] := GravarConfig(form22.Pgerais.Values['configu'], CurrToStr(avista), 0);

  ClientDataSet1.First;
  ClientDataSet1.EnableControls;
end;

function TForm20.verificaSePodeVenderNegativo_X_NaVendaConfig11DoUsuario() : boolean;
var
  ini, fim : integer;
  rel : String;
  quant : currency;
begin
  Result := true;
  if funcoes.LerConfig(form22.Pgerais.Values['configu'], 13) <> 'X' then exit;
  if Modo_Orcamento then exit;
  //if (separaPecas) and (finaliza)  then exit;

  rel := '';
  ClientDataSet1.DisableControls;
  ClientDataSet1.First;

  fim := ClientDataSet1.RecordCount;
  for ini := 1 to fim do
  begin
    ClientDataSet1.RecNo := ini;

    if (ClientDataSet1estado.AsString = 'I') then begin
      dm.IBselect.Close;
      dm.IBselect.SQL.Text := 'select quant from produto where cod = :cod';
      dm.IBselect.ParamByName('cod').AsInteger := ClientDataSet1CODIGO.AsInteger;
      dm.IBselect.Open;

      quant := dm.IBselect.FieldByName('quant').AsCurrency;
      dm.IBselect.Close;

      if ((quant - ClientDataSet1QUANT.AsCurrency) < 0) then rel := rel + CompletaOuRepete(LeftStr(ClientDataSet1CODIGO.AsString + '-' + ClientDataSet1DESCRICAO.AsString, 35), '', ' ', 36) +' '+ CompletaOuRepete('', formataCurrency(quant), ' ', 10) + CompletaOuRepete('', formataCurrency(ClientDataSet1QUANT.AsCurrency), ' ', 10) + CRLF;
    end;
  end;

  ClientDataSet1.First;
  ClientDataSet1.EnableControls;

  if rel <> '' then begin
    Result := false;
    if VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false then begin
      Result := true;
      exit;
    end;
    funcoes.Mensagem(Application.Title, 'A Venda Não Pode ser Finalizada, O estoque dos Produtos estão Negativos:' + CRLF+ CRLF + 'CODIGO,NOME,QUANT_ESTOQUE,QUANT_VENDA' + CRLF + rel, 12, 'Courier New',true, 0, clBlack);
  end;

  if VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false then Result := true;
  

end;

procedure TForm20.adicionaEntregaTabela;
begin
  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text := 'insert into ENTREGA_NOVO(cod, numvenda, datavenda, usuario_incluiu, usuario_baixa, data_entrega) '+
  'values(gen_id(entrega_novo, 1), :numvenda, :datavenda, :usuario_incluiu, :usuario_baixa, ''01.01.1900'')';
  dm.IBQuery1.ParamByName('numvenda').AsInteger   := StrToIntDef(numvenda, 0);
  dm.IBQuery1.ParamByName('datavenda').AsDateTime := form22.datamov;
  dm.IBQuery1.ParamByName('usuario_incluiu').AsInteger := StrToIntDef(form22.codusario, 0);
  dm.IBQuery1.ParamByName('usuario_baixa').AsInteger   := 0;
  dm.IBQuery1.ExecSQL;
  dm.IBQuery1.Transaction.Commit;

  numvenda := '0';
end;

function TForm20.validaVendedor() : boolean;
begin
  Result := false;

  if StrNum(JsEdit2.Text) = '0' then begin
    ShowMessage('Código do Vendedor Inválido, Preencha com as informações Corretas!');
    JsEdit2.Enabled := true;
    JsEdit2.SetFocus;
    exit;
  end;


  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select cod from vendedor where cod = ' + StrNum(JsEdit2.Text);
  dm.IBselect.Open;

  if dm.IBselect.IsEmpty then begin
    ShowMessage('Código do Vendedor Inválido, Preencha com as informações Corretas!');
    JsEdit2.Enabled := true;
    JsEdit2.SetFocus;
    exit;
  end;

  Result := true;
end;

procedure TForm20.impNovo(TIPO1 : SMALLINT = 1);
var
  tipo : String;
begin
  funcoes.ultimaVenda := novocod;

  if  ((funcoes.LerConfig(form22.Pgerais.Values['conf_ter'], 17) = 'N') and (saidaDeEstoque)) then exit;


  if Modo_Orcamento then funcoes.tipo1       := 2
  else if Modo_Venda then funcoes.tipo1      := 1;

  tipo := form22.Pgerais.Values['nota'];

  if tipo = 'B' then funcoes.imprimeVendaFortesA4(novocod, TIPO1)
  else begin
    ImprimeNota;
  end;

  ENDE_ENTREGA := '';
end;

procedure TForm20.formataCamposPreco;
begin
  try
    TCurrencyField(dm.produto.FieldByName('preco')).DisplayFormat := '###,##0.' + CompletaOuRepete('', '', '0', StrToIntDef(funcoes.buscaParamGeral(111, '2'), 3));
  except
  end;
end;

function TForm20.condicaoAumentarDBGRID2TrueZOOMnasDUAS : boolean ;
begin
  Result := false;
  
  if form22.Pgerais.Values['empresa'] = 'LIFENUTRE' then begin
    Result := true;
    exit;
  end;

  if form22.fonteDAT.Values['ZOOM_DUAS_TABELAS_VENDAS'] = 'S' then begin
    Result := true;
    exit;
  end;

end;

procedure TForm20.habilitaCamposFimVenda;
begin

end;


end.

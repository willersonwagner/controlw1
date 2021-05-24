unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo, Data.DBXDataSnap, IPPeerClient, Data.DBXCommon,
  Data.DB, Data.SqlExpr,
  FMX.ListBox, FMX.TabControl, FMX.Effects, FMX.Objects, uCLasses, unit2,
  Data.DbxSqlite, Data.FMTBcd, FMX.Edit, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Stan.ExprFuncs, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.FMXUI.Wait,
  FireDAC.Comp.UI,  System.Rtti, FMX.Grid, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  FMX.Header, FMX.Gestures, Datasnap.DBClient, FMX.VirtualKeyboard,
  FMX.Grid.Style, FireDAC.Phys.SQLiteDef, FMX.ScrollBox,
  FMX.Controls.Presentation, FMX.ExtCtrls, FMX.Ani;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    SQLConnection1: TSQLConnection;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    Sincronização: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    TabItem3: TTabItem;
    ListBox2: TListBox;
    ListBoxItem5: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    SpeedButton1: TSpeedButton;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    ShadowEffect1: TShadowEffect;
    Button1: TButton;
    Button2: TButton;
    Label4: TLabel;
    ListBoxItem7: TListBoxItem;
    TabItem4: TTabItem;
    ListBox3: TListBox;
    header1: TListBoxGroupHeader;
    ListBoxItem8: TListBoxItem;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxItem9: TListBoxItem;
    ClearingEdit1: TClearingEdit;
    ClearingEdit2: TClearingEdit;
    Button3: TButton;
    Rectangle3: TRectangle;
    ShadowEffect2: TShadowEffect;
    AniIndicator2: TAniIndicator;
    Label7: TLabel;
    SQLQuery1: TFDQuery;
    BindingsList1: TBindingsList;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    androidBD: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    StringGrid1: TStringGrid;
    Panel2: TPanel;
    Label3: TLabel;
    ClearingEdit3: TClearingEdit;
    SpeedButton2: TSpeedButton;
    Label5: TLabel;
    queryProduto: TFDQuery;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    queryProdutocod: TIntegerField;
    queryProdutonome: TWideMemoField;
    queryProdutop_venda: TFloatField;
    queryProdutocodbar: TIntegerField;
    FDTransaction1: TFDTransaction;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    ShadowEffect3: TShadowEffect;
    Button6: TButton;
    Button7: TButton;
    Label6: TLabel;
    VertScrollBox1: TVertScrollBox;
    TabItem5: TTabItem;
    Rectangle6: TRectangle;
    ShadowEffect4: TShadowEffect;
    Button4: TButton;
    Button5: TButton;
    ListBox4: TListBox;
    ListBoxItem10: TListBoxItem;
    Label8: TLabel;
    ListBoxItem11: TListBoxItem;
    Label10: TLabel;
    Button8: TButton;
    ListBoxItem12: TListBoxItem;
    Edit1: TClearingEdit;
    ListBoxItem13: TListBoxItem;
    ListBoxItem14: TListBoxItem;
    Layout1: TLayout;
    edit2: TClearingEdit;
    edit3: TClearingEdit;
    StyleBook1: TStyleBook;
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    ImageViewer1: TImageViewer;
    GradientAnimation1: TGradientAnimation;
    procedure FormShow(Sender: TObject);
    procedure ListBoxItem1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TabItem1Paint(Sender: TObject; Canvas: TCanvas;
      const ARect: TRectF);
    procedure TabControl1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure androidBDBeforeConnect(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ClearingEdit3Typing(Sender: TObject);
    procedure StringGrid1HeaderClick(Column: TColumn);
    procedure ClearingEdit3KeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure StringGrid1Resize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure ListBoxItem1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure ListBoxItem2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure SincronizaçãoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure ListBoxItem7MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure ListBoxItem4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure StringGrid1Gesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure Rectangle5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure ListBoxItem12MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure ListBoxItem13Click(Sender: TObject);
    procedure ListBoxItem5MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure ListBoxItem13MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure ListBoxItem14MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Button1Click(Sender: TObject);
    procedure FormVirtualKeyboardHidden(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure FormVirtualKeyboardShown(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure FormFocusChanged(Sender: TObject);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure ListBoxItem6MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure ListBoxItem7Click(Sender: TObject);
    procedure ListBoxItem2Click(Sender: TObject);
    procedure SincronizaçãoClick(Sender: TObject);
    procedure ListBoxItem3Click(Sender: TObject);
  private
    FKBBounds: TRectF;
    FNeedOffset, configurar : Boolean;
    res : boolean;
    ret : smallint;
    campoBusca : String;
    tamCol : array[0..3] of currency;
    tamColVenda : array[0..4] of currency;
    tamColCliente : array[0..3] of currency;
    procedure CalcContentBoundsProc(Sender: TObject;
                             var ContentBounds: TRectF);
    function replicate(lin : string; quant : integer) : string ;
    procedure RestorePosition;
    procedure UpdateKBBounds;
    procedure Alinhamento_dos_Cabecalhos;
    function sincronizaEstoque() : boolean;
    procedure lerInformacoesServidor();
    function pergunta(const capt : string) : boolean;
    procedure visualizaAguarda(const capt : string);
    procedure converteProdutos();
    procedure pesquisa(const pes : string);
    procedure lerPorcentagemColunas();
    procedure sincFormas();
    procedure sincUsuarios();
    procedure sincEstoque();
    procedure sincVendas();
    procedure limparTela();
    procedure marcaVendaExportada(const notas : string);
    function getSenhaAdmin() : String;
    function strzero(num : integer; quant : integer) : string ;

    { Private declarations }
  public
    venda, logado : boolean;
    codUsuario, codVendedor : integer;
    NomeUsuario : String;
    function selecionaCliente(const codigo : integer) : Tcliente;
    function valor_sequencia(const seq_name : String) : integer;
    procedure redimensionaColunasStringGrid(var grid : TStringGrid);
    function login(const usu, senha : String) : boolean;
    function formataCNPJ(const CNPJ1 : String; tchar : char) : String;
    function formataCPF(const cpf1 : String; tchar : char) : String;
    function StrNum(const entra: string; const zero : boolean) :  string;
    function verificaEspacoSelectSel(const texto : string; const num : integer) : integer;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation


//uses funcoes, Unit4, Unit5;
{$R *.fmx}

uses Unit3,funcoes, system.IOUtils, Unit4, Unit5, system.math;

function TForm1.verificaEspacoSelectSel(const texto : string; const num : integer) : integer;
begin
  if pos(texto[num - 1], '0123456789') = 0 then Result := num + 1;
end;

function TForm1.StrNum(const entra: string; const zero : boolean) :  string;
var
  cont : integer;
begin
  Result := '';
  for cont := 1 to length(entra) do
    begin
      if pos(entra[cont], '1234567890') > 0 then Result := Result + entra[cont];
    end;

  if zero then if Result = '' then Result := '0';
end;

function TForm1.formataCPF(const cpf1 : String; tchar : char) : String;

begin
  Result := StrNum(cpf1, false);
  Result := Result + tchar;
  Result := CompletaOuRepete(Result, '', ' ', 12);

  Result := CompletaOuRepete(copy(Result, 1, 3), '', ' ', 3) + '.' +
  CompletaOuRepete(copy(Result, 4, 3), '', ' ', 3) + '.' +
  CompletaOuRepete(copy(Result, 7, 3), '', ' ', 3) + '-' +
  CompletaOuRepete(copy(Result, 10, 2), '', ' ', 2);
end;

function TForm1.formataCNPJ(const CNPJ1 : String; tchar : char) : String;
begin
  Result := StrNum(CNPJ1, false);
  Result := Result + tchar;
  Result := CompletaOuRepete(Result, '', ' ', 15);

  Result := CompletaOuRepete(copy(Result, 1, 2), '', ' ', 2) + '.'
  + CompletaOuRepete(copy(Result, 3, 3), '', ' ', 3) + '.'
  + CompletaOuRepete(copy(Result, 6, 3), '', ' ', 3) + '/'
  + CompletaOuRepete(copy(Result, 9, 4), '', ' ', 4) + '-'
  + CompletaOuRepete(copy(Result, 13,2), '', ' ', 2) ;
end;

function TForm1.selecionaCliente(const codigo : integer) : Tcliente;
begin
  Result := Tcliente.Create;
  FDQuery1.Close;
  FDQuery1.SQL.Text := 'select nome, cnpj, ende, bairro, cid, telres, titular, telcom,' +
  'ies, est, tipo from cliente where cod = :cod';
  FDQuery1.ParamByName('cod').AsInteger := codigo;
  FDQuery1.Open;

  Result.cod     := codigo;
  Result.nome    := FDQuery1.FieldByName('nome').AsString;
  Result.titular := FDQuery1.FieldByName('titular').AsString;
  Result.cnpj    := FDQuery1.FieldByName('cnpj').AsString;
  Result.tipo    := FDQuery1.FieldByName('tipo').AsInteger;
  Result.ende    := FDQuery1.FieldByName('ende').AsString;
  Result.bairro  := FDQuery1.FieldByName('bairro').AsString;
  Result.ies     := FDQuery1.FieldByName('ies').AsString;
  Result.est     := FDQuery1.FieldByName('est').AsString;
  Result.telres  := FDQuery1.FieldByName('nome').AsString;
  Result.telcom  := FDQuery1.FieldByName('telres').AsString;
  Result.cid     := FDQuery1.FieldByName('cid').AsString;
end;

procedure TForm1.marcaVendaExportada(const notas : string);
begin
  SQLQuery1.Close;
  SQLQuery1.Open('select nota from venda where exportado = 0');
  while not SQLQuery1.Eof do
    begin
      if pos(IntToStr(SQLQuery1.FieldByName('nota').AsInteger), notas) > 0 then
        begin
          FDQuery1.Close;
          FDQuery1.SQL.Text := 'update venda set exportado = 1 where nota = :nota';
          FDQuery1.ParamByName('nota').AsInteger := SQLQuery1.FieldByName('nota').AsInteger;
          FDQuery1.ExecSQL;
        end;
      SQLQuery1.Next;
    end;
end;

procedure TForm1.sincVendas();
var
  lista    : TlistaVendas;
  proxy  : TServerMethods1Client;
  a, i : integer;
  notas : string;
begin

  visualizaAguarda('Aguarde, Transmitindo Vendas');
  Application.ProcessMessages;
  try
    SQLConnection1.Connected := true;
    proxy := TServerMethods1Client.Create(SQLConnection1.DBXConnection);
    lista := TlistaVendas.Create;

    SQLQuery1.Close;
    SQLQuery1.SQL.Clear;
    SQLQuery1.SQL.Add('select nota, data, total, desconto, cliente, vendedor, usuario, codhis from venda where exportado = 0');
    SQLQuery1.Open;
    SQLQuery1.FetchAll;

    SetLength(lista.listaVenda, SQLQuery1.RecordCount);

    i := 0;
    while not SQLQuery1.Eof do
      begin
       Application.ProcessMessages;
       lista.listaVenda[i] := Tvenda.Create;
       lista.listaVenda[i].nota     := SQLQuery1.FieldByName('nota').AsInteger;
       lista.listaVenda[i].data     := SQLQuery1.FieldByName('data').AsDateTime;
       lista.listaVenda[i].total    := SQLQuery1.FieldByName('total').AsCurrency;
       lista.listaVenda[i].vendedor := SQLQuery1.FieldByName('vendedor').AsInteger;
       lista.listaVenda[i].usuario  := SQLQuery1.FieldByName('usuario').AsInteger;
       lista.listaVenda[i].desconto := SQLQuery1.FieldByName('desconto').AsCurrency;
       lista.listaVenda[i].codhis   := SQLQuery1.FieldByName('codhis').AsInteger;
       lista.listaVenda[i].cliente  := selecionaCliente(SQLQuery1.FieldByName('cliente').AsInteger);

       FDQuery2.Close;
       FDQuery2.SQL.Text := 'select nota, qtd, periodo, entrada, taxa, vencimento from parcelamento where nota = :nota ';
       FDQuery2.ParamByName('nota').AsInteger := lista.listaVenda[i].nota;
       FDQuery2.Open;

       if not FDQuery2.IsEmpty then
         begin
           lista.listaVenda[i].parcelamento            := tParcelamento.Create;
           lista.listaVenda[i].parcelamento.nota       := lista.listaVenda[i].nota;
           lista.listaVenda[i].parcelamento.periodo    := FDQuery2.FieldByName('periodo').AsInteger;
           lista.listaVenda[i].parcelamento.qtdprest   := FDQuery2.FieldByName('qtd').AsInteger;
           lista.listaVenda[i].parcelamento.vencimento := FDQuery2.FieldByName('vencimento').AsDateTime;
           lista.listaVenda[i].parcelamento.entrada    := FDQuery2.FieldByName('entrada').AsCurrency;
           lista.listaVenda[i].parcelamento.cliente    := lista.listaVenda[i].cliente.cod;
           lista.listaVenda[i].parcelamento.vlrtotal   := lista.listaVenda[i].total;
         end
       else lista.listaVenda[i].parcelamento := nil;
       FDQuery2.Close;

       FDQuery1.Close;
       FDQuery1.SQL.Text := ('select nota, cod, quant, total, p_venda from item_venda where' +
       ' nota = :nota');
       FDQuery1.ParamByName('nota').AsInteger := lista.listaVenda[i].nota;
       FDQuery1.Open;
       FDQuery1.FetchAll;

       SetLength(lista.listaVenda[i].itensV, FDQuery1.RecordCount);
       a := 0;

       while not FDQuery1.Eof do
         begin
           Application.ProcessMessages;
           lista.listaVenda[i].itensV[a] := TItem_venda.Create;
           lista.listaVenda[i].itensV[a].nota    := FDQuery1.FieldByName('nota').AsInteger;
           lista.listaVenda[i].itensV[a].cod     := FDQuery1.FieldByName('cod').AsInteger;
           lista.listaVenda[i].itensV[a].total   := FDQuery1.FieldByName('total').AsCurrency;
           lista.listaVenda[i].itensV[a].p_venda := FDQuery1.FieldByName('p_venda').AsCurrency;
           lista.listaVenda[i].itensV[a].quant   := FDQuery1.FieldByName('quant').AsCurrency;

           a := a + 1;
           FDQuery1.Next;
         end;

       i := i + 1;
       SQLQuery1.Next;
      end;

     notas := proxy.insereVendas(lista, IntToStr(codUsuario) + ' - ' + NomeUsuario);
     //marcaVendaExportada(notas);
  finally
    ShowMessage('Sincronização efetuada com sucesso');
    Rectangle1.Visible := false;
    Rectangle3.Visible := false;
    res := true;
    Rectangle1.Visible := false;
    Rectangle2.Visible := false;
    SQLConnection1.Connected := false;
 end;
end;

procedure TForm1.limparTela();
begin
  Edit2.Text := '';
  edit3.Text := '';
  edit2.SetFocus;
end;

function TForm1.valor_sequencia(const seq_name : String) : integer;
begin
  Result := 0;
  SQLQuery1.Open('select seq from sqlite_sequence where name = ' + QuotedStr(seq_name));

  Result := SQLQuery1.FieldByName('seq').AsInteger;
  SQLQuery1.Close;
end;

procedure TForm1.sincEstoque();
var
  lista    : TlistaProdutos;
  proxy  : TServerMethods1Client;
  fim, i : integer;
begin
  visualizaAguarda('Aguarde, Transmitindo Produtos');
  Application.ProcessMessages;
  try
    SQLConnection1.Connected := true;
    proxy := TServerMethods1Client.Create(SQLConnection1.DBXConnection);
    lista := proxy.getProdutos1;
    SQLQuery1.Transaction.StartTransaction;

    SQLQuery1.Close;
    SQLQuery1.SQL.Clear;
    SQLQuery1.SQL.Add('delete from produto');
    SQLQuery1.ExecSQL();

    SQLQuery1.Transaction.Commit;
    SQLQuery1.Transaction.StartTransaction;

    fim := Length(lista.listaProdutos) -1;

    SQLQuery1.Close;
    SQLQuery1.SQL.Clear;
    SQLQuery1.SQL.Add('insert into produto(cod, nome, codbar, p_compra, p_venda, p_venda1, obs) ' +
    'values(:cod, :nome, :codbar, :p_compra, :p_venda, :p_venda1, :obs)');

    visualizaAguarda('Aguarde, Inserindo Produtos');

    for i := 0 to fim do
      begin
        Application.ProcessMessages;
        SQLQuery1.ParamByName('cod').AsInteger       := lista.listaProdutos[i].cod;
        SQLQuery1.ParamByName('nome').AsString       := lista.listaProdutos[i].nome;
        SQLQuery1.ParamByName('codbar').AsString     := lista.listaProdutos[i].codbar;
        SQLQuery1.ParamByName('p_compra').AsCurrency := lista.listaProdutos[i].p_compra;
        SQLQuery1.ParamByName('p_venda').AsCurrency  := lista.listaProdutos[i].p_venda;
        SQLQuery1.ParamByName('p_venda1').AsCurrency := lista.listaProdutos[i].p_venda1;
        SQLQuery1.ParamByName('obs').AsString        := lista.listaProdutos[i].obs;
        SQLQuery1.ExecSQL;
      end;

  finally

  SQLQuery1.Transaction.Commit;
  ShowMessage('Sincronização efetuada com sucesso');
  Rectangle1.Visible := false;
  Rectangle3.Visible := false;
  res := true;
  Rectangle1.Visible := false;
  Rectangle2.Visible := false;
  SQLConnection1.Connected := false;
 end;
end;

procedure TForm1.sincUsuarios();
var
  lista : TlistaUsuario;
  proxy  : TServerMethods1Client;
  fim, i : integer;
begin
  try
    SQLConnection1.Connected := true;
    proxy := TServerMethods1Client.Create(SQLConnection1.DBXConnection);
    lista := proxy.getUsuarios;

    visualizaAguarda('Aguarde, Transmitindo Usuários');
    Application.ProcessMessages;

    //if SQLQuery1.Transaction.Active then SQLQuery1.Transaction.Commit;
    //SQLQuery1.Transaction.StartTransaction;

    //SQLQuery1.Close;
    //SQLQuery1.SQL.Clear;
    //SQLQuery1.SQL.Add('delete from usuario');
    SQLQuery1.ExecSQL('delete from usuario');

    //SQLQuery1.Transaction.Commit;


   // SQLQuery1.Transaction.StartTransaction;

    fim   := Length(lista.listaUsuario) -1;
    SQLQuery1.Close;
    SQLQuery1.SQL.Clear;
    SQLQuery1.SQL.Add('insert into usuario(cod, nome, user, senha, vendedor) ' +
    'values(:cod, :nome, :usu, :senha, :vendedor)');

    for i := 0 to fim do
      begin
        Application.ProcessMessages;
        SQLQuery1.ParamByName('cod').AsInteger       := lista.listaUsuario[i].cod;
        SQLQuery1.ParamByName('nome').AsString       := lista.listaUsuario[i].nome;
        SQLQuery1.ParamByName('usu').AsString        := lista.listaUsuario[i].usu;
        SQLQuery1.ParamByName('senha').AsString      := lista.listaUsuario[i].senha;
        SQLQuery1.ParamByName('vendedor').AsInteger  := lista.listaUsuario[i].codVendedor;
        SQLQuery1.ExecSQL;
      end;

  finally
  //SQLQuery1.Transaction.Commit;
  ShowMessage('Sincronização efetuada com sucesso');
  Rectangle1.Visible := false;
  Rectangle3.Visible := false;
  res := true;
  Rectangle1.Visible := false;
  Rectangle2.Visible := false;
  SQLConnection1.Connected := false;
 end;
end;

procedure TForm1.sincFormas();
var
  listaForma : TlistaFormas;
  proxy  : TServerMethods1Client;
  fim, i : integer;
begin
  try
    visualizaAguarda('Aguarde, Transmitindo Formas');
    SQLConnection1.Connected := true;
    proxy := TServerMethods1Client.Create(SQLConnection1.DBXConnection);
    listaForma := proxy.getFormas;
    SQLQuery1.Transaction.StartTransaction;

    SQLQuery1.Close;
    SQLQuery1.SQL.Clear;
    SQLQuery1.SQL.Add('delete from formpagto');
    SQLQuery1.ExecSQL();

    SQLQuery1.Transaction.Commit;
    SQLQuery1.Transaction.StartTransaction;

    fim   := Length(listaForma.listaFormas) -1;
    SQLQuery1.Close;
    SQLQuery1.SQL.Clear;
    SQLQuery1.SQL.Add('insert into formpagto(cod, nome) ' +
    'values(:cod, :nome)');

    visualizaAguarda('Aguarde, Inserindo Formas');
    Application.ProcessMessages;

    for i := 0 to fim do
      begin
        Application.ProcessMessages;
        SQLQuery1.ParamByName('cod').AsInteger       := listaForma.listaFormas[i].cod;
        SQLQuery1.ParamByName('nome').AsString       := listaForma.listaFormas[i].nome;
        SQLQuery1.ExecSQL;
      end;
  finally
    SQLQuery1.Transaction.Commit;
    SQLConnection1.Connected := false;
    ShowMessage('Sincronização efetuada com sucesso');
    Rectangle1.Visible := false;
    Rectangle3.Visible := false;
    Rectangle2.Visible := false;
    res := true;
  end;

end;

function TForm1.login(const usu, senha : String) : boolean;
begin
  if ((UpperCase(usu) = 'ADMIN') and (senha = getSenhaAdmin)) then begin
    Result := true;
    NomeUsuario := 'ADMIN';
    codUsuario  := 0;
    codVendedor := 0;
    exit;
  end;



  Result := true;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'select cod, vendedor, nome from usuario where (user = :user) and (senha = :senha)';
  SQLQuery1.ParamByName('user').AsString  := UpperCase(usu);
  SQLQuery1.ParamByName('senha').AsString := UpperCase(senha);
  SQLQuery1.Open;

  if SQLQuery1.IsEmpty then Result := false
    else
      begin
        NomeUsuario := SQLQuery1.FieldByName('nome').AsString;
        codUsuario  := SQLQuery1.FieldByName('cod').AsInteger;
        codVendedor := SQLQuery1.FieldByName('vendedor').AsInteger;
      end;
  SQLQuery1.Close;
end;

procedure TForm1.lerPorcentagemColunas();
var
  i, fim, wi : integer;
begin
  tamCol[0] := 15;
  tamCol[1] := 45;
  tamCol[2] := 20;
  tamCol[3] := 20;

  tamColVenda[0] := 15;
  tamColVenda[1] := 40;
  tamColVenda[2] := 15;
  tamColVenda[3] := 15;
  tamColVenda[4] := 15;

  tamColCliente[0] := 15;
  tamColCliente[1] := 45;
  tamColCliente[2] := 20;
  tamColCliente[3] := 20;
end;

procedure TForm1.redimensionaColunasStringGrid(var grid : TStringGrid);
var
  i, fim, wi : integer;
begin
  if grid.Name = 'gridCliente' then
    begin
      fim := grid.ColumnCount -1;
      for i := 0 to fim do
        begin
          grid.Columns[i].Width := (grid.Width * tamColCliente[i]) / 100;
        end;
      exit;
    end;

  if grid.Name = 'gridVenda' then
    begin
     fim := 4;
      for i := 0 to fim do
        begin
          //grid.ColumnByIndex(i).Width := (grid.Width * tamColVenda[i]) / 100;
        end;
      exit;
    end;

  fim := 3;
  for i := 0 to fim do
    begin
      if i = 1 then
        begin
          if (grid.Width < 400) then tamCol[i] := 65
            else tamCol[i] := 45;
        end;
      grid.ColumnByIndex(i).Width := (grid.Width * tamCol[i]) / 100;
    end;
end;

procedure TForm1.pesquisa(const pes : string);
begin
  if pes = '' then
    begin
      ShowMessage('Campo de Pesquisa Vazio');
      //queryProduto.Close;
      //queryProduto.Open('select cod, nome, p_venda from produto');
      exit;
    end;

  if campoBusca = '' then campoBusca := 'NOME';

  queryProduto.Close;
  if campoBusca = 'COD' then queryProduto.Open('select cod, nome, codbar, p_venda from produto where '+ campoBusca +' = ' + pes )
    else queryProduto.Open('select cod, nome, codbar, p_venda from produto where '+ campoBusca +' like ' + QuotedStr('%' + pes + '%'));

  redimensionaColunasStringGrid(StringGrid1);
  if queryProduto.IsEmpty then
    begin
      ShowMessage('Nenhum Resultado');
      exit;
    end;

  StringGrid1.SetFocus;
end;

procedure TForm1.Rectangle5Click(Sender: TObject);
begin
  Edit1.SetFocus;
end;

procedure TForm1.Alinhamento_dos_Cabecalhos;
var
  ini, fim : integer;
begin
  fim := queryProduto.FieldCount -1;
  for ini := 0 to fim do
    begin
      if (queryProduto.FieldDefs.Items[ini].DataType = ftInteger) or (queryProduto.FieldDefs.Items[ini].DataType = ftBCD) then
        begin
          StringGrid1.ColumnByIndex(ini).Width := 50;
        end
      else
        begin
          StringGrid1.ColumnByIndex(ini).Width := queryProduto.FieldDefs.Items[ini].Size * 2;
        end;
    end;

end;


procedure TForm1.converteProdutos();
var
  lista  : TlistaProdutos;
  proxy  : TServerMethods1Client;
  fim, i : integer;
  sql    : string;
  trans  : TDBXTransaction;
begin
  visualizaAguarda('Aguarde, Transmitindo Produtos');
  Application.ProcessMessages;
  try
    SQLConnection1.Connected := true;

 //   SQLQuery1.Transaction.StartTransaction;

    SQLQuery1.Close;
    SQLQuery1.SQL.Clear;
    SQLQuery1.SQL.Add('delete from produto');
    SQLQuery1.ExecSQL();

//    SQLQuery1.Transaction.Commit;
//    SQLQuery1.Transaction.StartTransaction;

    proxy := TServerMethods1Client.Create(SQLConnection1.DBXConnection);
    lista := JSONToProdutos(proxy.getProdutos);

    fim := Length(lista.listaProdutos);

    SQLQuery1.Close;
    SQLQuery1.SQL.Clear;

    SQLQuery1.SQL.Add('insert into produto(cod, nome, codbar, p_compra, p_venda, p_venda1, obs) ' +
    'values(:cod, :nome, :codbar, :p_compra, :p_venda, :p_venda1, :obs)');

    visualizaAguarda('Aguarde, Inserindo Produtos');

    for i := 0 to fim do
      begin
        //Application.ProcessMessages;

        {sql := 'insert into produto(cod, nome, codbar, p_compra, p_venda, p_venda1, obs) ' +
        'values('+ IntToStr(lista.listaProdutos[i].cod) +
        ', '+ QuotedStr(lista.listaProdutos[i].nome) +
        ', '+ QuotedStr(lista.listaProdutos[i].codbar) +
        ', '+ StringReplace(FormatFloat('0.00', lista.listaProdutos[i].p_compra), ',', '.', []) +
        ', '+ StringReplace(FormatFloat('0.00', lista.listaProdutos[i].p_venda), ',', '.', [])  +
        ', '+ StringReplace(FormatFloat('0.00', lista.listaProdutos[i].p_venda1), ',', '.', []) +
        ', '+ QuotedStr(lista.listaProdutos[i].obs) +')' ;
        }
        SQLQuery1.ParamByName('cod').AsInteger       := lista.listaProdutos[i].cod;
        SQLQuery1.ParamByName('nome').AsString       := lista.listaProdutos[i].nome;
        SQLQuery1.ParamByName('codbar').AsString     := lista.listaProdutos[i].codbar;
        SQLQuery1.ParamByName('p_compra').AsCurrency := lista.listaProdutos[i].p_compra;
        SQLQuery1.ParamByName('p_venda').AsCurrency  := lista.listaProdutos[i].p_venda;
        SQLQuery1.ParamByName('p_venda1').AsCurrency := lista.listaProdutos[i].p_venda1;
        SQLQuery1.ParamByName('obs').AsString        := lista.listaProdutos[i].obs;


        //SQLQuery1.SQL.Clear;
        //SQLQuery1.SQL.Add(sql);
        //SQLQuery1.SQL.Text := sql;
        SQLQuery1.ExecSQL;
        //androidBD.ExecSQL(sql, []);

       // SQLQuery1.SQL.Text := sql;
       // SQLQuery1.ExecSQL;
      end;
  finally

  //  SQLQuery1.Transaction.Commit;
    SQLConnection1.Connected := false;
    Rectangle1.Visible := false;
    Rectangle3.Visible := false;
  end;
end;

procedure TForm1.Edit3KeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  if key = 13 then
    begin
      Button4Click(sender);
    end;
end;

procedure TForm1.lerInformacoesServidor();
begin
  androidBD.Connected := true;

  SQLQuery1.Close;
  SQLQuery1.SQL.Clear;
  SQLQuery1.SQL.Add('select * from config order by cod');
  SQLQuery1.Open;

  if not SQLQuery1.IsEmpty then
    begin
      ClearingEdit1.Text := SQLQuery1.FieldByName('valor').AsString;
      SQLQuery1.Next;

      ClearingEdit2.Text := SQLQuery1.FieldByName('valor').AsString;

      SQLConnection1.Params.Values['HostName'] := ClearingEdit2.Text;
      SQLConnection1.Params.Values['Port']     := ClearingEdit1.Text;
    end;


 SQLQuery1.Close;
end;

procedure TForm1.visualizaAguarda(const capt : string);
begin
  Rectangle1.Visible := true;
  Rectangle2.Visible := false;
  Rectangle3.Visible := true;

  AniIndicator2.Enabled := true;
  AniIndicator2.Visible := true;

  Label7.Text    := capt;
end;

function TForm1.pergunta(const capt : string) : boolean;
begin
  Rectangle2.Visible := true;
  Rectangle3.Visible := false;
  Label4.Text     := capt;
  Rectangle1.Visible := true;

  Result      := res;
end;


procedure TForm1.ListBoxItem12MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TabControl1.ActiveTab := TabItem4;
end;

procedure TForm1.ListBoxItem13Click(Sender: TObject);
begin
  ret := 1;
end;

procedure TForm1.ListBoxItem13MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  pergunta('Deseja Sincronizar os Usuários?');
  ret := 1;
end;

procedure TForm1.ListBoxItem14MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  pergunta('Deseja Sincronizar as Formas de Pagamento?');
  ret := 2;
end;

procedure TForm1.ListBoxItem1Click(Sender: TObject);
begin
  redimensionaColunasStringGrid(StringGrid1);
  TabControl1.ActiveTab := TabItem2;
  Label1.Text := 'CONSULTAS';
end;

procedure TForm1.ListBoxItem1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  redimensionaColunasStringGrid(StringGrid1);
  TabControl1.ActiveTab := TabItem2;
  Label1.Text := 'CONSULTAS';

  ListBox1.ItemIndex := -1;
end;

procedure TForm1.ListBoxItem2Click(Sender: TObject);
begin
  if not Assigned(form4) then form4 := tform4.Create(self);
  venda := true;
  form4.lerFormas;
  if form4.ClientDataSet1.IsEmpty then form4.TabControl1.ActiveTab := form4.TabItem2
    else form4.TabControl1.ActiveTab := form4.TabItem1;

  form4.Show;
end;

procedure TForm1.ListBoxItem2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  if not Assigned(form4) then form4 := tform4.Create(self);
  venda := true;
  form4.lerFormas;
  if form4.ClientDataSet1.IsEmpty then form4.TabControl1.ActiveTab := form4.TabItem2
    else form4.TabControl1.ActiveTab := form4.TabItem1;
  form4.Show;
end;

procedure TForm1.ListBoxItem3Click(Sender: TObject);
begin
  if not Assigned(form5) then form5 := tform5.Create(self);
  Form5.TabControl1.ActiveTab := form5.TabItem1;
  form5.Show;
end;

procedure TForm1.ListBoxItem4MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  Application.Terminate;
end;

procedure TForm1.ListBoxItem5MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  pergunta('Deseja Sincronizar o Estoque?');
  ret := 0;
end;

procedure TForm1.ListBoxItem6MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin

  FDQuery1.Close;
  FDQuery1.Open('select nota from venda where exportado = 0');
  FDQuery1.FetchAll;

  if FDQuery1.IsEmpty then
    begin
      FDQuery1.Close;
      ShowMessage('Não existem Vendas a Serem Exportadas');
      exit;
    end;

  pergunta('Deseja Enviar ('+ IntToStr(FDQuery1.RecordCount) +' Vendas) para o Servidor ?');
  FDQuery1.Close;
  ret := 3;
end;

procedure TForm1.ListBoxItem7Click(Sender: TObject);
begin
  TabControl1.ActiveTab := TabItem4;
  Button3.Visible       := true;
  Label1.Text := 'CONFIGURAÇÕES';

  lerInformacoesServidor();
  //esta funcao ler as informaçoes do servidor dataSnap e preeche
  // o formulario de confgurações
end;

procedure TForm1.ListBoxItem7MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TabControl1.ActiveTab := TabItem4;
  Button3.Visible       := true;
  Label1.Text := 'CONFIGURAÇÕES';

  lerInformacoesServidor();
  //esta funcao ler as informaçoes do servidor dataSnap e preeche
  // o formulario de confgurações
end;

function TForm1.sincronizaEstoque() : boolean;
begin

end;

procedure TForm1.SincronizaçãoClick(Sender: TObject);
begin
  TabControl1.ActiveTab := TabItem3;
  Label1.Text := 'SINCRONIZAÇÃO';

  ListBox1.ItemIndex := -1;
end;

procedure TForm1.SincronizaçãoMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TabControl1.ActiveTab := TabItem3;
  Label1.Text := 'SINCRONIZAÇÃO';

  ListBox1.ItemIndex := -1;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  if not logado then
    begin
      TabControl1.ActiveTab := TabItem5;
      configurar := false;
    end
  else TabControl1.ActiveTab := TabItem1;

  Button3.Visible := false;
  queryProduto.Close;
  Label1.Text := 'CONTROLM';
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  ClearingEdit3.Text := UpperCase(ClearingEdit3.Text);
  pesquisa(ClearingEdit3.Text);
end;

procedure TForm1.StringGrid1DblClick(Sender: TObject);
begin
  {$IFDEF WIN32}
    if venda then
      begin
        Rectangle4.Visible := true;
        Rectangle5.Visible := true;
        edit1.Enabled      := true;
        edit1.SetFocus;
      end;
  {$ENDIF}

end;

procedure TForm1.StringGrid1Gesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  if EventInfo.GestureID = 264 then
    begin
      if venda then
        begin
          Rectangle4.Visible := true;
          Rectangle5.Visible := true;
          edit1.Enabled      := true;
          edit1.SetFocus;
        end;
    end;
end;

procedure TForm1.StringGrid1HeaderClick(Column: TColumn);
begin
  if Column.Header <> 'PREÇO' then
    begin
      campoBusca  := Column.Header;
      Label5.Text := campoBusca + ' >';
    end;
end;

procedure TForm1.StringGrid1Resize(Sender: TObject);
begin
  if TabControl1.ActiveTab = TabItem2 then redimensionaColunasStringGrid(StringGrid1);
end;

procedure TForm1.TabControl1Change(Sender: TObject);
begin
  if (TabControl1.ActiveTab = TabItem1) or (TabControl1.ActiveTab = TabItem5) then
    begin
      Label1.Text := 'CONTROLM';
      SpeedButton1.Visible := false;
      Button3.Visible      := false;
      venda := false;
    end
  else SpeedButton1.Visible := true;

  if TabControl1.ActiveTab = TabItem2 then
    begin
      Label1.Text := 'CONSULTAS';
      //SpeedButton1.Visible := false;
      Button3.Visible      := false;
    end;

  if TabControl1.ActiveTab = TabItem4 then
    begin
      Label1.Text := 'CONFIGURAÇÃO';
      Button3.Visible      := TRUE;
    end;

end;

procedure TForm1.TabItem1Paint(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
begin
  SpeedButton1.Visible := false;
end;

procedure TForm1.androidBDBeforeConnect(Sender: TObject);
begin
  {$IFDEF ANDROID}
    //abaixo funcionou nos componentes DBX
    //androidBD.Params.Values['Database'] := GetHomePath + PathDelim + 'bd.db3';
    androidBD.Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'bd.db3') ;
  {$ELSE}
    androidBD.Params.Values['Database'] := extractfiledir(paramstr(0))+ '\bd.db3';
  {$ENDIF}
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if ret = 0 then
    begin
      sincEstoque();
    end
  else if ret = 1 then
    begin
      sincUsuarios();
    end
  else if ret = 2 then
    begin
      sincFormas();
    end
  else if ret = 3 then
    begin
      sincVendas();
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  res := false;
  Rectangle1.Visible := false;
  Rectangle2.Visible := false;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  ini : integer;
begin
  if TabControl1.ActiveTab = TabItem4 then
    begin
      SQLQuery1.Close;
      SQLQuery1.SQL.Clear;
      SQLQuery1.SQL.Add('delete from config');
      SQLQuery1.ExecSQL();

      SQLQuery1.Close;
      SQLQuery1.SQL.Clear;
      SQLQuery1.SQL.Add('insert into config(cod, valor) values(:cod, :valor)');

      SQLQuery1.ParamByName('cod').AsInteger  := 0;
      SQLQuery1.ParamByName('valor').AsString := ClearingEdit1.Text;
      SQLQuery1.ExecSQL();

      SQLConnection1.Params.Values['HostName'] := ClearingEdit2.Text;

      SQLQuery1.ParamByName('cod').AsInteger  := 1;
      SQLQuery1.ParamByName('valor').AsString := ClearingEdit2.Text;
      SQLQuery1.ExecSQL();

      SQLConnection1.Params.Values['Port'] := ClearingEdit1.Text;

      try
        SQLConnection1.Connected := true;
        ShowMessage('Conectado com Sucesso');
      except
        on e : exception do
          begin
            ShowMessage('O sistema não conseguiu conectar neste Servidor. Favor informe os valores corretos');
          end;
      end;
    end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  logado := login(edit2.Text, edit3.Text);
  if logado then
    begin
      TabControl1.ActiveTab := TabItem1;
    end
  else
    begin
      limparTela();
      ShowMessage('Usuário ou Senha Incorretos');
    end;

end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  Rectangle4.Visible := false;
  Rectangle5.Visible := false;

  form4.vendeItem(StrToCurrDef(edit1.Text, 1));
  form4.Show;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  edit1.Text := '';
  Rectangle4.Visible := false;
  Rectangle5.Visible := false;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  TabControl1.ActiveTab := TabItem3;
  Label1.Text := 'SINCRONIZAÇÃO';

  configurar := true;

  ListBox1.ItemIndex := -1;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  configurar := true;
  TabControl1.ActiveTab := TabItem4;
end;

procedure TForm1.ClearingEdit3KeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if key = 13 then
    begin
      pesquisa(ClearingEdit3.Text);
    end;
end;

procedure TForm1.ClearingEdit3Typing(Sender: TObject);
begin
  ClearingEdit3.Text := UpperCase(ClearingEdit3.Text);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  lerPorcentagemColunas();

  StringGrid1.OnDblClick  := StringGrid1DblClick;
end;

procedure TForm1.FormFocusChanged(Sender: TObject);
begin
  UpdateKBBounds;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  if TabControl1.ActiveTab <> TabItem1 then
    begin
      if key = vkHardwareBack then
        begin
          SpeedButton1Click(sender);
          key := 0;
        end;
    end
  else
    begin
      if key = vkHardwareBack then
        begin

          Application.Terminate;
        end;
    end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Label2.Text := UpperCase(FormatDateTime('ddd', now) + ', ' + FormatDateTime('dd/mm/yyyy', now));

  try
    lerInformacoesServidor();
  finally

  end;
end;

procedure TForm1.FormVirtualKeyboardHidden(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
  FKBBounds.Create(0, 0, 0, 0);
  FNeedOffset := False;
  RestorePosition;
end;

procedure TForm1.FormVirtualKeyboardShown(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
  FKBBounds := TRectF.Create(Bounds);
  FKBBounds.TopLeft := ScreenToClient(FKBBounds.TopLeft);
  FKBBounds.BottomRight := ScreenToClient(FKBBounds.BottomRight);
  UpdateKBBounds;
end;

procedure TForm1.CalcContentBoundsProc(Sender: TObject;
                                       var ContentBounds: TRectF);
begin
  if FNeedOffset and (FKBBounds.Top > 0) then
  begin
    ContentBounds.Bottom := Max(ContentBounds.Bottom,
                                2 * ClientHeight - FKBBounds.Top);
  end;
end;

procedure TForm1.RestorePosition;
begin
  VertScrollBox1.ViewportPosition := PointF(VertScrollBox1.ViewportPosition.X, 0);
  Layout1.Align := TAlignLayout.Client;
  VertScrollBox1.RealignContent;
end;

procedure TForm1.UpdateKBBounds;
var
  LFocused : TControl;
  LFocusRect: TRectF;
begin
  FNeedOffset := False;
  if Assigned(Focused) then
  begin
    LFocused := TControl(Focused.GetObject);
    LFocusRect := LFocused.AbsoluteRect;
    LFocusRect.Offset(VertScrollBox1.ViewportPosition);
    if (LFocusRect.IntersectsWith(TRectF.Create(FKBBounds))) and
       (LFocusRect.Bottom > FKBBounds.Top) then
    begin
      FNeedOffset := True;
      Layout1.Align := TAlignLayout.Horizontal;
      VertScrollBox1.RealignContent;
      Application.ProcessMessages;
      VertScrollBox1.ViewportPosition :=
        PointF(VertScrollBox1.ViewportPosition.X,
               LFocusRect.Bottom - FKBBounds.Top);
    end;
  end;
  if not FNeedOffset then
    RestorePosition;
end;

function TForm1.getSenhaAdmin() : String;
begin
  Result := strzero(StrToInt(FormatDateTime('HH', now)) + 2, 2) +
  strzero(StrToInt(FormatDateTime('dd', now)) + StrToInt(FormatDateTime('MM',now)), 2) +
  FormatDateTime('YY',now);
end;

function TForm1.replicate(lin : string; quant : integer) : string ;
var ini : integer;
begin
    result := '';
    for ini := 1 to quant do result := result + lin;
end;

//----------------------------------------------------------
function TForm1.strzero(num : integer; quant : integer) : string ;
var ret : string;
begin
    ret := replicate('0', quant) + inttostr(num);
    result := copy(ret, length(ret) - quant + 1, quant) ;
end;


end.


unit Unit4;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.StdCtrls, FMX.Layouts, FMX.Grid, Data.DB, Datasnap.DBClient,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  FMX.TabControl, FMX.ListBox, FMX.DateTimeCtrls, FMX.Edit, FMX.Grid.Style,
  FMX.ScrollBox, FMX.Controls.Presentation, FMX.Objects;

type
  TForm4 = class(TForm)
    ToolBar1: TToolBar;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1cod: TIntegerField;
    ClientDataSet1Nome: TStringField;
    ClientDataSet1quant: TCurrencyField;
    ClientDataSet1preco: TCurrencyField;
    ClientDataSet1total: TCurrencyField;
    ClientDataSet1tot_geral: TAggregateField;
    DataSource1: TDataSource;
    BindingsList1: TBindingsList;
    ToolBar2: TToolBar;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    Panel3: TPanel;
    gridVenda: TStringGrid;
    TOTCAP: TLabel;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    TabItem2: TTabItem;
    Label2: TLabel;
    Panel1: TPanel;
    Label3: TLabel;
    SpeedButton2: TSpeedButton;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    TabItem3: TTabItem;
    ListBoxFormPagtos: TListBox;
    TabItem4: TTabItem;
    ListBox2: TListBox;
    ListBoxItem3: TListBoxItem;
    entrada: TClearingEdit;
    ListBoxItem4: TListBoxItem;
    vencto: TDateEdit;
    ListBoxItem5: TListBoxItem;
    periodo: TClearingEdit;
    ListBoxItem6: TListBoxItem;
    qtdprest: TClearingEdit;
    ListBoxItem7: TListBoxItem;
    taxa: TClearingEdit;
    ListBoxItem8: TListBoxItem;
    vlrPrest: TClearingEdit;
    ListBoxItem9: TListBoxItem;
    Label4: TLabel;
    VertScrollBox1: TVertScrollBox;
    Image1: TImage;
    procedure SpeedButton3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Button5Click(Sender: TObject);
    procedure gridVendaResize(Sender: TObject);
    procedure SpeedButton1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure FormCreate(Sender: TObject);
    procedure gridVendaGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure Button4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure qtdprestChange(Sender: TObject);
    procedure entradaExit(Sender: TObject);
    procedure qtdprestKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure qtdprestExit(Sender: TObject);
    procedure SpeedButton2DblClick(Sender: TObject);
    procedure ClientDataSet1AfterOpen(DataSet: TDataSet);
  private
    total, desconto : currency;
    codhis : String;
    temParcelamento : boolean;
    nota, qtd : integer;
    entrada1, taxa1 : currency;
    vencimento : TDateTime;
    function  SomaProdutosVenda() : currency;
    function  gravaVenda() : boolean;
    function gravaParcelamento : boolean;
    procedure limpaVenda();
    procedure calculaParcela();
    { Private declarations }
  public
    codCliente : integer;
    procedure lerFormas();
    procedure vendeItem(const quant : currency);
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

uses Unit1, Unit5;

function TForm4.gravaParcelamento : boolean;
begin
  Form1.SQLQuery1.Close;
  form1.SQLQuery1.SQL.Text := 'insert into parcelamento(nota, vencimento, qtd, periodo, entrada, taxa) values(' +
  ':nota, :vencimento, :qtd, :periodo, :entrada, :taxa)';
  form1.SQLQuery1.ParamByName('nota').AsInteger     := nota;
  form1.SQLQuery1.ParamByName('vencimento').AsDateTime := vencimento;
  form1.SQLQuery1.ParamByName('qtd').AsInteger      := qtd;
  form1.SQLQuery1.ParamByName('qtd').AsInteger      := qtd;
  form1.SQLQuery1.ParamByName('periodo').AsInteger  := StrToIntDef(periodo.Text, 0);
  form1.SQLQuery1.ParamByName('entrada').AsCurrency := entrada1;
  form1.SQLQuery1.ParamByName('taxa').AsCurrency    := taxa1;
  form1.SQLQuery1.ExecSQL;
end;

procedure TForm4.calculaParcela();
begin
  try
    entrada1 := StrToCurr(entrada.text);
  except
    ShowMessage('Valor inválido');
    entrada.SetFocus;
  end;

  try
    qtd := StrToInt(qtdprest.text);
  except
    ShowMessage('Valor inválido');
    qtdprest.SetFocus;
  end;

  try
    vencimento := vencto.Date;
  except
    ShowMessage('Valor inválido');
    vencto.SetFocus;
  end;

  try
    taxa1 := StrToCurr(taxa.text);
  except
    ShowMessage('Valor inválido');
    taxa.SetFocus;
  end;

  vlrPrest.Text := FormatCurr('#,###,###0.00', (total - entrada1) / qtd);
end;

procedure TForm4.ClientDataSet1AfterOpen(DataSet: TDataSet);
begin
  form1.redimensionaColunasStringGrid(gridVenda);
end;

procedure TForm4.entradaExit(Sender: TObject);
begin
  calculaParcela();
end;

procedure TForm4.limpaVenda();
begin
  ListBoxItem1.Text := '';
  ListBoxItem2.Text := '';

  if temParcelamento then
    begin
      periodo.Text  := '30';
      taxa.Text     := '0,00';
      vlrPrest.Text := '0,00';
      qtdprest.Text := '1';
      entrada.Text  := '0,00';
      temParcelamento := false;
    end;

  TOTCAP.Text := 'TOTAL R$ 0,00';

  codCliente := 0;
  codhis     := '';

  TabControl1.ActiveTab := TabItem2;
end;

procedure TForm4.qtdprestChange(Sender: TObject);
begin
  calculaParcela;
end;

procedure TForm4.qtdprestExit(Sender: TObject);
begin
  calculaParcela();
end;

procedure TForm4.qtdprestKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if key = 13 then calculaParcela();
end;

procedure TForm4.lerFormas();
begin
  if ListBoxFormPagtos.Items.Text = '' then
    begin
      form1.SQLQuery1.Close;
      form1.SQLQuery1.Open('select cod, nome from formpagto');

      while not form1.SQLQuery1.Eof do
        begin
          ListBoxFormPagtos.Items.Add(form1.SQLQuery1.FieldByName('cod').AsString + ' - ' + form1.SQLQuery1.FieldByName('nome').AsString);
          form1.SQLQuery1.Next;
        end;
    end;
end;

procedure TForm4.vendeItem(const quant : currency);
begin
  if ClientDataSet1.Locate('cod', form1.queryProduto.FieldByName('cod').AsInteger, []) then
    begin
      ClientDataSet1.Edit;
      ClientDataSet1.FieldByName('quant').AsCurrency := ClientDataSet1.FieldByName('quant').AsCurrency + quant;
      ClientDataSet1.FieldByName('total').AsCurrency := ClientDataSet1.FieldByName('total').AsCurrency + (form1.queryProduto.FieldByName('p_venda').AsCurrency * quant);
      ClientDataSet1.Post;
    end
  else
    begin
      ClientDataSet1.Insert;
      ClientDataSet1.FieldByName('cod').AsInteger    := form1.queryProduto.FieldByName('cod').AsInteger;
      ClientDataSet1.FieldByName('nome').AsString    := form1.queryProduto.FieldByName('nome').AsString;
      ClientDataSet1.FieldByName('preco').AsCurrency := form1.queryProduto.FieldByName('p_venda').AsCurrency;
      ClientDataSet1.FieldByName('quant').AsCurrency := quant;
      ClientDataSet1.FieldByName('total').AsCurrency := (form1.queryProduto.FieldByName('p_venda').AsCurrency * quant);
      ClientDataSet1.Post;
    end;

  SomaProdutosVenda();
end;

procedure TForm4.Button4MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  if TabControl1.ActiveTab = TabItem2 then //escolher cliente
    begin
      if ListBoxItem1.Text + ListBoxItem2.Text <> '' then
        begin
          TabControl1.ActiveTab := TabItem1;
        end
      else ShowMessage('Escolha um Cliente!');
      exit;
    end;

  if TabControl1.ActiveTab = TabItem1 then //venda
    begin
      TabControl1.ActiveTab := TabItem3;
      exit;
    end;

  if TabControl1.ActiveTab = TabItem3 then //formas de pagamento
    begin
      if copy(ListBoxFormPagtos.Selected.Text, 1, pos(' ', ListBoxFormPagtos.Selected.Text) -1) = '2' then
        begin
          Label4.Text := TOTCAP.Text;
          vencto.Text := FormatDateTime('dd/mm/yyyy', now + 30);
          Button5.Visible := false;
          TabControl1.ActiveTab := TabItem4;
          exit;
        end;
    end;

  if TabControl1.ActiveTab = TabItem4 then //tela de parcelamento
    begin
      temParcelamento := true;
      calculaParcela();
    end
  else temParcelamento := false;

  if gravaVenda() then
    begin
      ClientDataSet1.EmptyDataSet;
      ClientDataSet1.Close;
      ClientDataSet1.Open;

      limpaVenda();
      ShowMessage('Venda Efetuada com sucesso');
    end;
end;

procedure TForm4.Button5Click(Sender: TObject);
begin
  ClientDataSet1.EmptyDataSet;
  ClientDataSet1.Close;
  ClientDataSet1.Open;

  TOTCAP.Text := 'TOTAL R$ 0,00';
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  if not ClientDataSet1.Active then ClientDataSet1.CreateDataSet;
  codCliente := -1;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  //form1.redimensionaColunasStringGrid(gridVenda);
end;

function TForm4.gravaVenda() : boolean;
begin
  Result := true;
  if ClientDataSet1.IsEmpty then
    begin
      ShowMessage('Lista de Produtos Vazia');
      TabControl1.ActiveTab := TabItem1;
      exit(False);
    end;

  if ListBoxFormPagtos.ItemIndex = -1 then
    begin
      ShowMessage('Escolha uma Forma de Pagamento');
      TabControl1.ActiveTab := TabItem3;
      exit(False);
    end;

  ClientDataSet1.DisableControls;
  ClientDataSet1.First;
 try
  form1.SQLQuery1.Close;
  nota := form1.valor_sequencia('venda') + 1;

  form1.SQLQuery1.Transaction.StartTransaction;
  total    := StrToCurrDef(ClientDataSet1tot_geral.AsString, 0);
  desconto := 0;
  codhis   := copy(ListBoxFormPagtos.Selected.Text, 1, pos(' ', ListBoxFormPagtos.Selected.Text) -1);

  if temParcelamento then
    begin
      gravaParcelamento;
    end;

  form1.SQLQuery1.Close;
  form1.SQLQuery1.SQL.Text := 'insert into venda(nota, data, total, desconto, codhis, cancelado, ' +
  'exportado, usuario, vendedor, cliente) values(:nota, :data, :total, :desconto, :codhis, :cancelado, ' +
  ':exportado, :usuario, :vendedor, :cliente)';
  form1.SQLQuery1.ParamByName('nota').AsInteger      := nota;
  form1.SQLQuery1.ParamByName('data').AsDateTime     := now;
  form1.SQLQuery1.ParamByName('total').AsCurrency    := total;
  form1.SQLQuery1.ParamByName('desconto').AsCurrency := desconto;
  form1.SQLQuery1.ParamByName('codhis').AsString     := codhis;
  form1.SQLQuery1.ParamByName('cancelado').AsInteger := 0;
  form1.SQLQuery1.ParamByName('exportado').AsInteger := 0;
  form1.SQLQuery1.ParamByName('usuario').AsInteger   := form1.codUsuario;
  form1.SQLQuery1.ParamByName('vendedor').AsInteger  := form1.codVendedor;
  form1.SQLQuery1.ParamByName('cliente').AsInteger   := codCliente;
  form1.SQLQuery1.ExecSQL;

  while not ClientDataSet1.Eof do
    begin
      form1.SQLQuery1.Close;
      form1.SQLQuery1.SQL.Text := 'insert into item_venda(nota, cod, quant, p_venda, total, codbar)' +
      'values(:nota, :cod, :quant, :p_venda, :total, :codbar)';
      form1.SQLQuery1.ParamByName('nota').AsInteger   := nota;
      form1.SQLQuery1.ParamByName('cod').AsInteger    := ClientDataSet1cod.AsInteger;
      form1.SQLQuery1.ParamByName('quant').AsCurrency := ClientDataSet1quant.AsCurrency;
      form1.SQLQuery1.ParamByName('p_venda').AsCurrency := ClientDataSet1preco.AsCurrency;;
      form1.SQLQuery1.ParamByName('total').AsCurrency := ClientDataSet1total.AsCurrency;
      form1.SQLQuery1.ParamByName('codbar').AsString  := '';
      form1.SQLQuery1.ExecSQL;

      ClientDataSet1.Next;
    end;
 finally
   ClientDataSet1.EnableControls;
 end;

 form1.sincVendas(true);
end;

procedure TForm4.gridVendaGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  if EventInfo.GestureID = 264 then
    begin
      if MessageDlg('Deseja Excluir '+ ClientDataSet1Nome.AsString +'?',TMsgDlgType.mtConfirmation, fmx.Dialogs.mbYesNo, 0) = mrYes then
        begin
          ClientDataSet1.Delete;
          ClientDataSet1.Close;
          ClientDataSet1.Open;

          SomaProdutosVenda();
          form1.redimensionaColunasStringGrid(gridVenda);
        end;
    end;
end;

procedure TForm4.gridVendaResize(Sender: TObject);
begin
  //form1.redimensionaColunasStringGrid(gridVenda);
end;

function tform4.SomaProdutosVenda() : currency;
begin
  Result := 0;
  try
    ClientDataSet1.DisableControls;
    ClientDataSet1.First;
    while not ClientDataSet1.Eof do
      begin
        Result := Result + ClientDataSet1total.AsCurrency;
        ClientDataSet1.Next;
      end;
  finally
    ClientDataSet1.EnableControls;
    TOTCAP.Text := 'TOTAL R$ ' + FormatCurr('#,###,###0.00', Result);

    total := Result;
  end;
end;

procedure TForm4.SpeedButton1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  if TabControl1.ActiveTab = TabItem1 then
    begin
      TabControl1.ActiveTab := TabItem2;
      exit;
    end;

  if TabControl1.ActiveTab = TabItem3 then
    begin
      TabControl1.ActiveTab := TabItem1;
      exit;
    end;

  if not ClientDataSet1.IsEmpty then
    begin
      ShowMessage('Existem Produtos na Venda, para sair é necessario limpar os produtos');
      exit;
    end;

  form1.TabControl1.ActiveTab := form1.TabItem1;
  form1.venda := false;
  self.Close;
end;

procedure TForm4.SpeedButton2Click(Sender: TObject);
begin
  if not assigned(form5) then form5 := tform5.Create(self);
  try
    //form1.redimensionaColunasStringGrid(form5.gridCliente);
  finally

  end;
  form5.visibleFalseBotoes(false);
  form5.TabControl1.ActiveTab := form5.TabItem2;
  form5.Show;
end;

procedure TForm4.SpeedButton2DblClick(Sender: TObject);
begin
  ShowMessage('1');
end;

procedure TForm4.SpeedButton3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  form1.TabControl1.ActiveTab := form1.TabItem2;
  form1.venda := true;
  form1.Show;
end;

procedure TForm4.TabControl1Change(Sender: TObject);
begin
  if TabControl1.ActiveTab = TabItem2 then
    begin
      Label1.Text := 'DADOS DA VENDA';
      Button4.Text := 'Próximo';
      Button5.Visible := false;
      SpeedButton3.Visible := false;
    end
  else if TabControl1.ActiveTab = TabItem1 then
    begin
      Label1.Text := 'VENDA';
      Button4.Text := 'Finalizar';
      Button5.Visible := true;
      SpeedButton3.Visible := true;
    end
  else if TabControl1.ActiveTab = TabItem4 then
    begin
      Label1.Text := 'PARCELAMENTO';
      Button4.Text := 'Finalizar';
      Button5.Visible := true;
      SpeedButton3.Visible := true;
    end
  else if TabControl1.ActiveTab = TabItem3 then
    begin
      Label1.Text := 'FORMAS DE PAGAMENTO';
      Button4.Text := 'Finalizar';
      Button5.Visible := false;
      SpeedButton3.Visible := false;
    end;
end;

end.

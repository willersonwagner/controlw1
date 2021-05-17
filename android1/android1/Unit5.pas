unit Unit5;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.ListBox, FMX.Layouts, FMX.TabControl, FMX.StdCtrls, formScroll,
  Data.FMTBcd, Data.DB, Data.SqlExpr, Unit1, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Rtti,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, FMX.Bind.Grid,
  FMX.Grid, Data.Bind.Grid, FMX.Grid.Style, FMX.ScrollBox,
  FMX.Controls.Presentation, FMX.Gestures, fmx.consts;

type
  TForm5 = class(TForm6)
    ToolBar1: TToolBar;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    ToolBar2: TToolBar;
    Button4: TButton;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    SpeedButton2: TSpeedButton;
    TabItem2: TTabItem;
    FDTable1: TFDTable;
    BindingsList1: TBindingsList;
    FDTable1cod: TFDAutoIncField;
    FDTable1nome: TStringField;
    FDTable1cnpj: TStringField;
    FDTable1ende: TStringField;
    FDTable1bairro: TStringField;
    FDTable1cid: TStringField;
    FDTable1telres: TStringField;
    FDTable1titular: TStringField;
    FDTable1telcom: TStringField;
    FDTable1ies: TStringField;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    nome: TClearingEdit;
    tipo: TComboBox;
    ende: TClearingEdit;
    bairro: TClearingEdit;
    cid: TClearingEdit;
    uf: TClearingEdit;
    telres: TClearingEdit;
    telcom: TClearingEdit;
    listboxitem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    titular: TClearingEdit;
    cpf: TClearingEdit;
    rg: TClearingEdit;
    FDTable1est: TStringField;
    BindSourceDB1: TBindSourceDB;
    Panel1: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    ClearingEdit3: TClearingEdit;
    SpeedButton3: TSpeedButton;
    Label5: TLabel;
    cliente: TFDQuery;
    clientecod: TFDAutoIncField;
    clientenome: TStringField;
    clientecnpj: TStringField;
    clientetelres: TStringField;
    clienteende: TStringField;
    BindSourceDB2: TBindSourceDB;
    gridCliente: TStringGrid;
    LinkGridToDataSourceBindSourceDB22: TLinkGridToDataSource;
    Button1: TButton;
    LinkControlToField1: TLinkControlToField;
    GestureManager1: TGestureManager;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure tipoChange(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure gridClienteHeaderClick(Column: TColumn);
    procedure gridClienteResize(Sender: TObject);
    procedure gridClienteDblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure gridClienteGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure TabControl1Change(Sender: TObject);
    procedure ClearingEdit3KeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure cpfKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    busca: String;
    procedure insereUsuario();
    procedure limpaForm();
    procedure selecionaCliente(const cod1: integer);
    procedure procurarCliente(const nom: String);
    procedure digitaCPF(const textoComp : String; const Tchar : char);
    function MsgBox(const AMessage: string; const ADialogType: TMsgDlgType; const AButtons: TMsgDlgButtons;const ADefaultButton: TMsgDlgBtn ): Integer;
    { Private declarations }
  public
    cod : integer;
    const sql : String = 'select cod, nome, cnpj, telres, ende from cliente';
    procedure visibleFalseBotoes(const visi : boolean);
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.fmx}

uses Unit4, funcoes;

procedure TForm5.digitaCPF(const textoComp : String; const Tchar : char);
begin
  if Tchar = #8 then
    begin
      cpf.Text := copy(form1.StrNum(cpf.Text, false), 1, length(form1.StrNum(cpf.Text, false)) - 1);
    end;

  if (copy(tipo.Selected.Text, 1, 1) = '1') or (copy(tipo.Selected.Text, 1, 1) = '6') then
    begin
      cpf.Text := form1.formataCPF(cpf.Text, Tchar);
    end
  else cpf.Text := form1.formataCNPJ(cpf.Text, Tchar);

  cpf.SelStart := length(cpf.text);
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  inherited;
  gridCliente.OnDblClick :=  gridClienteDblClick;
end;

procedure TForm5.visibleFalseBotoes(const visi : boolean);
begin
  Button4.Visible := visi;
  Button1.Visible := visi;
end;

procedure TForm5.procurarCliente(const nom: String);
begin
  if busca = '' then
    busca := 'nome';
  cliente.Close;
  cliente.sql.Text := sql + ' where ' + busca + ' like ' +
    QuotedStr('%' + nom + '%');
  cliente.Open;
end;

procedure TForm5.selecionaCliente(const cod1: integer);
begin
  form1.SQLQuery1.Close;
  form1.SQLQuery1.Open('select cod, nome, ende, cnpj, tipo, bairro, cid, titular,' +
  ' ies, est, telres, telcom from cliente where cod = ' + IntToStr(cod1));

  if not form1.SQLQuery1.IsEmpty then
  begin
    cod          := form1.SQLQuery1.FieldByName('cod').AsInteger;
    nome.Text    := form1.SQLQuery1.FieldByName('nome').AsString;
    cpf.Text     := form1.SQLQuery1.FieldByName('cnpj').AsString;
    ende.Text    := form1.SQLQuery1.FieldByName('ende').AsString;
    bairro.Text  := form1.SQLQuery1.FieldByName('bairro').AsString;
    telres.Text  := form1.SQLQuery1.FieldByName('telres').AsString;
    titular.Text := form1.SQLQuery1.FieldByName('titular').AsString;
    rg.Text      := form1.SQLQuery1.FieldByName('ies').AsString;
    uf.Text      := form1.SQLQuery1.FieldByName('est').AsString;

    tipo.ItemIndex := StrToIntDef(form1.SQLQuery1.FieldByName('tipo').AsString, 1) -1;
  end;

  form1.SQLQuery1.Close;
end;

procedure TForm5.limpaForm();
begin
  nome.Text := '';
  rg.Text := '';
  ende.Text := '';
  cid.Text := '';
  titular.Text := '';
  uf.Text := '';
  telres.Text := '';
  telcom.Text := '';
  bairro.Text := '';
  cpf.Text := '';

  tipo.ItemIndex := 0;
  nome.SetFocus;

  cod := -1;
end;

procedure TForm5.tipoChange(Sender: TObject);
var
  tu: String;
begin
  inherited;
  tu := copy(tipo.Selected.Text, 1, 1);
  tu := Trim(tu);
  if tu = '1' then
  begin
    ListBoxItem4.Text := 'CPF:';
    ListBoxItem3.Text := 'RG:';
  end
  else if tu = '6' then
  begin
    ListBoxItem4.Text := 'CPF:';
    ListBoxItem3.Text := 'IES:';
  end
  else
  begin
    ListBoxItem4.Text := 'CNPJ:';
    ListBoxItem3.Text := 'IES:';
  end;
end;

procedure TForm5.Button1Click(Sender: TObject);
begin
  inherited;
  limpaForm();
end;

procedure TForm5.Button4Click(Sender: TObject);
begin
  inherited;
  if cpf.Text = '' then
    begin
      ShowMessage('Campo Obrigatório');
      cpf.SetFocus;
      exit;
    end;

  FDTable1.Close;
  cliente.Close;
  insereUsuario();
end;

procedure TForm5.ClearingEdit3KeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  if key = 13 then
    begin
      SpeedButton3Click(sender);
    end;
end;

procedure TForm5.cpfKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  inherited;
{    if Contido(KeyChar, '1234567890' + #8) then
      begin
        digitaCPF(cpf.Text, KeyChar);
        Abort;
      end
    else Abort;
}end;

procedure TForm5.gridClienteDblClick(Sender: TObject);
begin
  inherited;
  {$IFDEF WIN32}
    if cliente.IsEmpty then exit;
    selecionaCliente(cliente.FieldByName('cod').AsInteger);

    if form1.venda then
      begin
        form4.ListBoxItem1.Text := 'Código: ' +IntToStr(cod);
        form4.ListBoxItem2.Text := 'Nome: ' + nome.Text;
        form4.codCliente := cod;
        self.Close;
        exit;
      end;

    TabControl1.ActiveTab := TabItem1;
  {$ENDIF}
end;

procedure TForm5.gridClienteGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
var
  s : String;
begin
  inherited;

  if EventInfo.GestureID = 264 then
    begin
      //if MessageDlg('Deseja Abrir Cadastro: '+ cliente.FieldByName('cod').AsString + '-' + cliente.FieldByName('nome').AsString + '?',TMsgDlgType.mtConfirmation, fmx.Dialogs.mbYesNo, 0) = mrYes then
      if MsgBox('Deseja Abrir Cadastro: '+ cliente.FieldByName('cod').AsString + '-' + cliente.FieldByName('nome').AsString + '?',TMsgDlgType.mtConfirmation, fmx.Dialogs.mbYesNo, TMsgDlgBtn.mbNo) = mrYes then
        begin
          if cliente.IsEmpty then exit;
          selecionaCliente(cliente.FieldByName('cod').AsInteger);

          if form1.venda then
            begin
              form4.ListBoxItem1.Text := 'Código: ' +IntToStr(cod);
              form4.ListBoxItem2.Text := 'Nome: ' + nome.Text;
              form4.codCliente := cod;
              self.Close;
              exit;
            end;

          TabControl1.ActiveTab := TabItem1;
        end;
    end;
end;

procedure TForm5.gridClienteHeaderClick(Column: TColumn);
begin
  inherited;
  busca := Column.Header;
  Label5.Text := busca + ' >';
  if busca = 'TEL' then
    busca := 'telres';
end;

procedure TForm5.gridClienteResize(Sender: TObject);
begin
  // inherited;
  form1.redimensionaColunasStringGrid(gridCliente);
  inherited;
end;

procedure TForm5.insereUsuario();
var
  sql: String;
begin
  form1.SQLQuery1.Close;
  form1.SQLQuery1.Open('select cod from cliente where cod = ' + IntToStr(cod));

  if form1.SQLQuery1.IsEmpty then
  begin
    cod := form1.valor_sequencia('cliente') + 1;
    sql := 'insert into cliente(cod, nome, cnpj, ende, bairro, cid, telres, telcom,'
      + 'ies, est, tipo) values(:cod, :nome, :cnpj, :ende, :bairro, :cid, :telres, :telcom,'
      + ':ies, :est, :tipo)';

    form1.SQLQuery1.Close;
    form1.SQLQuery1.sql.Text := sql;
    form1.SQLQuery1.ParamByName('cod').AsInteger := cod;
    form1.SQLQuery1.ParamByName('nome').AsString := copy(nome.Text, 1, 40);
    form1.SQLQuery1.ParamByName('cnpj').AsString := copy(cpf.Text, 1, 22);
    form1.SQLQuery1.ParamByName('ende').AsString := copy(ende.Text, 1, 35);
    form1.SQLQuery1.ParamByName('bairro').AsString := copy(bairro.Text, 1, 20);
    form1.SQLQuery1.ParamByName('cid').AsString := copy(cid.Text, 1, 18);
    form1.SQLQuery1.ParamByName('telres').AsString := copy(telres.Text, 1, 13);
    form1.SQLQuery1.ParamByName('telcom').AsString := copy(telcom.Text, 1, 13);
    form1.SQLQuery1.ParamByName('ies').AsString := copy(rg.Text, 1, 14);
    form1.SQLQuery1.ParamByName('est').AsString := copy(uf.Text, 1, 3);
    form1.SQLQuery1.ParamByName('tipo').AsString := copy(tipo.Selected.Text, 1, pos(' ', tipo.Selected.Text) -1);

    form1.SQLQuery1.ExecSQL;
    // Form1.SQLQuery1.Transaction.Commit;
    // FDTable1.Insert;
    // FDTable1cod.AsInteger := cod;
    // FDTable1nome.AsString := copy(nome.Text, 1, 40);
    // FDTable1cnpj.AsString := copy(cpf.Text,  1, 22);
    // FDTable1ende.AsString := copy(ende.Text, 1, 35);
    // FDTable1bairro.AsString:= copy(bairro.Text, 1, 20);
    // FDTable1cid.AsString := copy(cpf.Text,  1, 18);
    // FDTable1telres.AsString := copy(telres.Text,  1, 13);
    // FDTable1telres.AsString := copy(telres.Text,  1, 13);
    // FDTable1telcom.AsString := copy(telcom.Text,  1, 13);
    // FDTable1ies.AsString := copy(rg.Text,  1, 14);
    // FDTable1est.AsString := copy(uf.Text,  1, 3);
    // FDTable1.Post;
  end
  else
  begin
    sql := 'update cliente set nome = :nome, cnpj = :cnpj, ende = :ende, bairro = :bairro' +
    ', cid = :cid, telres = :telres, telcom = :telcom, est = :est, tipo = :tipo, ies = :ies where cod = :cod';

    form1.SQLQuery1.Close;
    form1.SQLQuery1.sql.Text := sql;
    form1.SQLQuery1.ParamByName('nome').AsString := copy(nome.Text, 1, 40);
    form1.SQLQuery1.ParamByName('cnpj').AsString := copy(cpf.Text, 1, 22);
    form1.SQLQuery1.ParamByName('ende').AsString := copy(ende.Text, 1, 35);
    form1.SQLQuery1.ParamByName('bairro').AsString := copy(bairro.Text, 1, 20);
    form1.SQLQuery1.ParamByName('cid').AsString := copy(cid.Text, 1, 18);
    form1.SQLQuery1.ParamByName('telres').AsString := copy(telres.Text, 1, 13);
    form1.SQLQuery1.ParamByName('telcom').AsString := copy(telcom.Text, 1, 13);
    form1.SQLQuery1.ParamByName('est').AsString := copy(uf.Text, 1, 3);
    form1.SQLQuery1.ParamByName('tipo').AsString := copy(tipo.Selected.Text, 1, pos(' ', tipo.Selected.Text) -1);
    form1.SQLQuery1.ParamByName('ies').AsString := copy(rg.Text, 1, 14);
    form1.SQLQuery1.ParamByName('cod').AsInteger := cod;
    form1.SQLQuery1.ExecSQL;
  end;

  form1.SQLQuery1.Close;
  limpaForm;
  ShowMessage('Dados atualizados com sucesso');
end;

procedure TForm5.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if TabControl1.ActiveTab = TabItem2 then
    TabControl1.ActiveTab := TabItem1
  else
    self.Close;
end;

procedure TForm5.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  form1.redimensionaColunasStringGrid(gridCliente);
  TabControl1.ActiveTab := TabItem2;
end;

procedure TForm5.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  procurarCliente(ClearingEdit3.Text);
  form1.redimensionaColunasStringGrid(gridCliente);
end;

procedure TForm5.TabControl1Change(Sender: TObject);
begin
  inherited;
  if TabControl1.ActiveTab = TabItem1 then
    begin
      visibleFalseBotoes(true);
    end
  else visibleFalseBotoes(false);

end;

function TForm5.MsgBox(const AMessage: string; const ADialogType: TMsgDlgType; const AButtons: TMsgDlgButtons;const ADefaultButton: TMsgDlgBtn ): Integer;
var
    myAns: Integer;
    IsDisplayed: Boolean;
begin
    myAns := -1;
    IsDisplayed := False;

While myAns = -1 do
Begin
    if IsDisplayed = False then
    TDialogService.MessageDialog(AMessage, ADialogType, AButtons, ADefaultButton, 0,
            procedure (const AResult: TModalResult)
            begin
                myAns := AResult;
                IsDisplayed := True;
            end);

    IsDisplayed := True;
    Application.ProcessMessages;
End;

Result := myAns;

end;

end.

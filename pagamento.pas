unit pagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Buttons,
  JsBotao1, JsEdit1, JsEditNumero1, func;

type
  TForm82 = class(TForm)
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    ClientDataSet1cod: TIntegerField;
    ClientDataSet1nome: TStringField;
    ClientDataSet1valor: TCurrencyField;
    Label1: TLabel;
    Label2: TLabel;
    p_pago: TLabel;
    p_venda: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    JsEditNumero1: JsEditNumero;
    Label6: TLabel;
    JsBotao1: JsBotao;
    Label7: TLabel;
    Label8: TLabel;
    p_restante: TLabel;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure JsEditNumero1KeyPress(Sender: TObject; var Key: Char);
    procedure JsBotao1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    function somaTotal : currency;
    function buscaForma(cod : String) : boolean;
    procedure adicionaFormaDePagamento();
    procedure buscaPagamentos;
    { Private declarations }
  public
    totalVenda : Currency;
    finalizou : Char;
    nota : integer;
    { Public declarations }
  end;

var
  Form82: TForm82;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm82.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  funcoes.somenteNumeros(key);


  if key = #13 then begin
    if tedit(sender).Text = '' then begin
      tedit(sender).Text := funcoes.LerFormPato(0, 'Forma de Pagamento', true );
      if tedit(sender).Text = '*' then tedit(sender).Text := '';
    end;

    if tedit(sender).Text <> '' then begin
      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Text := 'select nome from FORMPAGTO where cod = :cod';
      dm.IBQuery1.ParamByName('cod').AsInteger := StrToIntDef(tedit(sender).Text, 0);
      dm.IBQuery1.Open;

      if dm.IBQuery1.IsEmpty then begin
        Label4.Caption := 'Forma Pagto Desconhecida';
        edit1.SelectAll;
        exit;
      end;

      Label4.Caption := dm.IBQuery1.FieldByName('nome').AsString;
      JsEditNumero1.SetFocus;
    end;
  end;
end;

procedure TForm82.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 119 then begin //f8
    if DBGrid1.Focused then edit1.SetFocus
    else DBGrid1.SetFocus;
  end;

  if key = 113 then begin //f2
    if (somaTotal + JsEditNumero1.getValor) <> totalVenda then begin
      if MessageDlg('O valor Pago é diferente do Valor Recebido, Deseja Finalizar Mesmo Assim ?', mtConfirmation, [mbyes, mbno], 1, mbno) = mrno then exit;
      finalizou := 'N';
    end
    else finalizou := 'S';
    close;
  end;
end;

procedure TForm82.FormShow(Sender: TObject);
begin
  ClientDataSet1.Close;
  ClientDataSet1.CreateDataSet;
  ClientDataSet1.LogChanges := false;

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select total from venda where nota = :nota';
  dm.IBselect.ParamByName('nota').AsInteger := nota;
  dm.IBselect.Open;

  if dm.IBselect.IsEmpty = false then totalVenda := dm.IBselect.FieldByName('total').AsCurrency;

  p_venda.Caption := formataCurrency(totalVenda);
  p_restante.Caption := formataCurrency(totalVenda);
  finalizou := 'N';

  //essa rotina busca os pagamentos que ja foram preenchidos anteriormente
  // e insere no cds
  buscaPagamentos;

  p_venda.Font.Color := HexToTColor('4169E1');
  p_pago.Font.Color  := HexToTColor('8B0000');
end;

procedure TForm82.JsBotao1Click(Sender: TObject);
begin
  adicionaFormaDePagamento;
end;

procedure TForm82.JsEditNumero1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    edit1.SetFocus;
  end;

  if ((key = #13) and (JsEditNumero1.getValor > 0)) then begin
    JsBotao1.SetFocus;
  end;
end;

function TForm82.somaTotal : currency;
begin
  ClientDataSet1.First;
  Result := 0;

  while not ClientDataSet1.Eof do begin
    Result := Result + ClientDataSet1valor.AsCurrency;
    ClientDataSet1.Next;
  end;

  ClientDataSet1.First;
  p_pago.Caption     := formataCurrency(Result);
  p_restante.Caption := formataCurrency(totalVenda - Result);

end;


procedure TForm82.adicionaFormaDePagamento();
begin
  if (somaTotal + JsEditNumero1.getValor) > totalVenda then begin
    MessageDlg('Valor Recebido Maior que o valor da Venda', mtError, [mbok], 1);
    JsEditNumero1.SetFocus;
    exit;
  end;

  if edit1.Text = '' then begin
    edit1.SetFocus;
    exit;
  end;


  if buscaForma(Edit1.Text) then begin
    ClientDataSet1.Edit;
    ClientDataSet1.FieldByName('valor').AsCurrency := ClientDataSet1.FieldByName('valor').AsCurrency + JsEditNumero1.getValor;
    ClientDataSet1.Post;
  end
  else begin
    ClientDataSet1.Append;
    ClientDataSet1.FieldByName('cod').AsString     := Edit1.Text;
    ClientDataSet1.FieldByName('nome').AsString    := Label4.Caption;
    ClientDataSet1.FieldByName('valor').AsCurrency := JsEditNumero1.getValor;
    ClientDataSet1.Post;
  end;

  Edit1.Text := '';
  JsEditNumero1.setValor(0);
  Label4.Caption := '';
  edit1.SetFocus;

  somaTotal;
end;

function TForm82.buscaForma(cod : String) : boolean;
begin
  Result := false;
  ClientDataSet1.First;
  while not ClientDataSet1.Eof do begin
    if (ClientDataSet1cod.AsString = cod) then begin
      Result := true;
      break;
    end;
    ClientDataSet1.Next;
  end;
end;

procedure TForm82.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 46 then begin
    if ClientDataSet1.IsEmpty = false then begin
      if MessageDlg('Deseja Excluir o Registro ?', mtConfirmation, [mbYes, mbno], 1, mbno) = mrYes then begin
        ClientDataSet1.Delete;
        somaTotal;
      end;
    end;
  end;
end;

procedure TForm82.buscaPagamentos;
begin
  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select p.formapagto as cod, p.valor, f.nome from PAGAMENTOVENDA p left join formpagto f on (f.cod = p.formapagto) where p.nota = :nota';
  dm.IBselect.ParamByName('nota').AsInteger := nota;
  dm.IBselect.Open;

  if dm.IBselect.IsEmpty then begin
    dm.IBselect.Close;
    exit;
  end;

  while not dm.IBselect.Eof do begin
    ClientDataSet1.Append;
    ClientDataSet1.FieldByName('cod').AsString     := dm.IBselect.FieldByName('cod').AsString;
    ClientDataSet1.FieldByName('nome').AsString    := dm.IBselect.FieldByName('nome').AsString;
    ClientDataSet1.FieldByName('valor').AsCurrency := dm.IBselect.FieldByName('valor').AsCurrency;
    ClientDataSet1.Post;

    dm.IBselect.Next;
  end;

  somaTotal;
end;

end.

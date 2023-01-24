unit pagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Buttons,
  JsBotao1, JsEdit1, JsEditNumero1, func, ShellApi;

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
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private

    function buscaForma(cod : String) : boolean;
    procedure adicionaFormaDePagamento();
    procedure buscaPagamentos;
    function checaPIX : Boolean;
    procedure somenteNumeros(var Key: Char);
    { Private declarations }
  public
    totalVenda : Currency;
    finalizou : Char;
    nota : integer;
    function somaTotal : currency;
    { Public declarations }
  end;

var
  Form82: TForm82;

implementation

{$R *.dfm}

uses untVendaPDV, dmecf, untDtmMain;



procedure TForm82.somenteNumeros(var Key: Char);
begin
  if Contido(Key, '1234567890' + #8 + #13 + #27) = False then
  begin
    Key := #0;
  end;
end;


procedure TForm82.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  somenteNumeros(key);


  if key = #13 then begin
    if tedit(sender).Text = '' then begin
      tedit(sender).Text := func.LerFormPato(0, 'Forma de Pagamento', true );
      if tedit(sender).Text = '*' then tedit(sender).Text := '';
    end;

    if tedit(sender).Text <> '' then begin
      dtmMain.IBQuery1.Close;
      dtmMain.IBQuery1.SQL.Text := 'select nome from FORMPAGTO where cod = :cod';
      dtmMain.IBQuery1.ParamByName('cod').AsInteger := StrToIntDef(tedit(sender).Text, 0);
      dtmMain.IBQuery1.Open;

      if dtmMain.IBQuery1.IsEmpty then begin
        Label4.Caption := 'Forma Pagto Desconhecida';
        edit1.SelectAll;
        exit;
      end;

      Label4.Caption := dtmMain.IBQuery1.FieldByName('nome').AsString;
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

  {if key = 113 then begin //f2
    if (somaTotal + JsEditNumero1.getValor) <> totalVenda then begin
      if MessageDlg('O valor Pago é diferente do Valor Recebido, Deseja Finalizar Mesmo Assim ?', mtConfirmation, [mbyes, mbno], 1, mbno) = mrno then exit;
      finalizou := 'N';
    end
    else finalizou := 'S';
    close;
  end; }
end;

procedure TForm82.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    if (somaTotal + JsEditNumero1.getValor) <> totalVenda then begin
      if MessageDlg('O valor Pago é diferente do Valor Recebido, Deseja Finalizar Mesmo Assim ?', mtConfirmation, [mbyes, mbno], 1, mbno) = mrno then exit;
      finalizou := 'N';
    end
    else begin
     { if checaPIX then begin

        if funcoes.ProcessExists('PIX.EXE') = false then begin
          //ShowMessage('ini');
          ShellExecute(handle, 'open', PChar(ExtractFileDir(ParamStr(0)) +'\PIX.exe'), '', '', SW_SHOWNORMAL);
        end;

        IF recebePIX(ClientDataSet1valor.AsCurrency, 'VENDA '+ IntToStr(nota)) = 'OK' then begin
          ShowMessage('PIX Recebido com Sucessso!');
        end
        else begin
          ShowMessage('PIX Nao Confirmado!');
          exit;
        end;
      end;       }


      finalizou := 'S';


    end;
    close;
  end;
end;

procedure TForm82.FormShow(Sender: TObject);
begin
  ClientDataSet1.Close;
  ClientDataSet1.CreateDataSet;
  ClientDataSet1.LogChanges := false;

  dtmMain.IBQuery1.Close;
  dtmMain.IBQuery1.SQL.Text := 'select total from venda where nota = :nota';
  dtmMain.IBQuery1.ParamByName('nota').AsInteger := nota;
  dtmMain.IBQuery1.Open;

  if dtmMain.IBQuery1.IsEmpty = false then totalVenda := dtmMain.IBQuery1.FieldByName('total').AsCurrency;

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
  dtmMain.IBQuery1.Close;
  dtmMain.IBQuery1.SQL.Text := 'select p.formapagto as cod, p.valor, f.nome from PAGAMENTOVENDA p left join formpagto f on (f.cod = p.formapagto) where p.nota = :nota';
  dtmMain.IBQuery1.ParamByName('nota').AsInteger := nota;
  dtmMain.IBQuery1.Open;

  if dtmMain.IBQuery1.IsEmpty then begin
    dtmMain.IBQuery1.Close;
    exit;
  end;

  while not dtmMain.IBQuery1.Eof do begin
    ClientDataSet1.Append;
    ClientDataSet1.FieldByName('cod').AsString     := dtmMain.IBQuery1.FieldByName('cod').AsString;
    ClientDataSet1.FieldByName('nome').AsString    := dtmMain.IBQuery1.FieldByName('nome').AsString;
    ClientDataSet1.FieldByName('valor').AsCurrency := dtmMain.IBQuery1.FieldByName('valor').AsCurrency;
    ClientDataSet1.Post;

    dtmMain.IBQuery1.Next;
  end;

  somaTotal;
end;


function TForm82.checaPIX : Boolean;
begin
  Result := false;

  if FileExists(ExtractFileDir(ParamStr(0)) + '\PIX.exe') = false then exit;

  ClientDataSet1.First;
  while not ClientDataSet1.Eof do begin
    if pos('PIX', UpperCase(ClientDataSet1nome.AsString)) > 0 then begin
      Result := true;
      break;
    end;
    ClientDataSet1.Next;
  end;

 end;

end.

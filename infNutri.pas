unit infNutri;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JsEdit1, JsEditInteiro1,
  JsEditNumero1, ACBrCargaBal, ACBrBase, Vcl.Buttons, JsBotao1, Vcl.ExtCtrls, typinfo;

type
  TForm87 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    codProd: JsEditInteiro;
    Quantidade: JsEditNumero;
    unid: JsEdit;
    ParteInteira: JsEditInteiro;
    ParteDecimal: TComboBox;
    MedicaoCaseira: TComboBox;
    valorEnergetico: JsEditNumero;
    carboidratos: JsEditNumero;
    proteinas: JsEditNumero;
    gordurastotais: JsEditNumero;
    gordurasSaturadas: JsEditNumero;
    GordurasTrans: JsEditNumero;
    FibraAlimentar: JsEditNumero;
    Sodio: JsEditNumero;
    tara: JsEditNumero;
    ToolBar1: TPanel;
    Label33: TLabel;
    ulticod: TLabel;
    JsBotao1: JsBotao;
    JsBotao2: JsBotao;
    procedure unidKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure JsBotao1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure codProdKeyPress(Sender: TObject; var Key: Char);
    procedure QuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure ParteInteiraKeyPress(Sender: TObject; var Key: Char);
    procedure ParteDecimalKeyPress(Sender: TObject; var Key: Char);
    procedure MedicaoCaseiraKeyPress(Sender: TObject; var Key: Char);
  private
    function gerarString : String;

    { Private declarations }
  public
    procedure seleciona;
    procedure limpar;
    { Public declarations }
  end;

var
  Form87: TForm87;

implementation

{$R *.dfm}

uses caixaLista, func, Unit1;

procedure TForm87.codProdKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin
    Quantidade.SetFocus;
  end;

  if key = #27 then close;
  
end;

procedure TForm87.FormCreate(Sender: TObject);
var
  A: TACBrCargaBalNutriPartdecimal;
  i: TACBrCargaBalNutriMedCaseira;
begin
  //ParteDecimal.Clear;
  //MedicaoCaseira.Clear;
 //for A := Low(TACBrCargaBalNutriPartdecimal) to High(TACBrCargaBalNutriPartdecimal) do
    //ParteDecimal.Items.Add( GetEnumName(TypeInfo(TACBrCargaBalNutriPartdecimal), integer(A) ) ) ;

  for i := Low(TACBrCargaBalNutriMedCaseira) to High(TACBrCargaBalNutriMedCaseira) do
    MedicaoCaseira.Items.Add( GetEnumName(TypeInfo(TACBrCargaBalNutriMedCaseira), integer(i) ) ) ;

  ParteDecimal.ItemIndex   := 0;
  MedicaoCaseira.ItemIndex := 0;
end;

procedure TForm87.JsBotao1Click(Sender: TObject);
begin
  dm.IBQuery2.Close;
  dm.IBQuery2.SQL.Text := 'update produto set infnutri = :infnutri where cod = :cod';
  dm.IBQuery2.ParamByName('infnutri').AsString := gerarString ;
  dm.IBQuery2.ParamByName('cod').AsInteger     := codProd.getValor;
  dm.IBQuery2.ExecSQL;
  dm.IBQuery2.Transaction.Commit;
  close;
end;

procedure TForm87.MedicaoCaseiraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin
    valorEnergetico.SetFocus;
  end;
end;

procedure TForm87.ParteDecimalKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin
    MedicaoCaseira.SetFocus;
  end;
end;

procedure TForm87.ParteInteiraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin
    ParteDecimal.SetFocus;
    abort;
  end;
end;

procedure TForm87.QuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then unid.SetFocus;

end;

procedure TForm87.unidKeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#13) and ((tedit(sender).Text='0') or (tedit(sender).Text='')) then
 begin
   form39 := tform39.Create(self);
   form39.ListBox1.Items.Add('g - Gramas');
   form39.ListBox1.Items.Add('ml - Mililitros');
   form39.ListBox1.Items.Add('un - Unidade');
   tedit(sender).Text := funcoes.lista(Sender, false);
   if tedit(sender).Text = '*' then
     begin
       tedit(sender).Text := '';
       key := #0;
     end;
  //tedit(sender).Text := funcoes.localizar('Tipo de Cliente','tipocli','cod,nome','cod','cod','nome','cod',false,false,false,'',300,sender);
 end;

end;

procedure TForm87.FormShow(Sender: TObject);
begin
  JsEdit.SetTabelaDoBd(self,'novo', dm.IBQuery2, '');
  Quantidade.SetFocus;
end;

function TForm87.gerarString : String;
begin
  Result := '|'+ CurrToStr(Quantidade.getValor) + '|' + unid.Text + '|' + ParteInteira.Text + '|' + ParteDecimal.Text + '|' + IntToStr(MedicaoCaseira.ItemIndex) + '|' +
  CurrToStr(valorEnergetico.getValor) + '|' + CurrToStr(carboidratos.getValor) + '|' + CurrToStr(proteinas.getValor) + '|' + CurrToStr(gordurastotais.getValor) + '|' +
  CurrToStr(gordurasSaturadas.getValor) + '|' + CurrToStr(GordurasTrans.getValor) + '|' + CurrToStr(FibraAlimentar.getValor) + '|' + CurrToStr(Sodio.getValor) + '|'
  + CurrToStr(tara.getValor) + '|';
end;

procedure TForm87.seleciona;
var
  tmp : String;
  arq : TStringList;
  i   : integer;
begin
  dm.IBQuery2.Close;
  dm.IBQuery2.SQL.Text := 'select infnutri from produto where cod = :cod';
  dm.IBQuery2.ParamByName('cod').AsInteger := codProd.getValor;
  dm.IBQuery2.Open;

  tmp := dm.IBQuery2.FieldByName('infnutri').AsString;
  dm.IBQuery2.Close;
  if Length(tmp) < 30 then exit;

  LE_CAMPOS(arq, tmp, '|', true);

  Quantidade.setValor(StrToCurr(arq.Values['0']));
  unid.Text := arq.Values['1'];
  ParteInteira.Text := arq.Values['2'];
  ParteDecimal.Text := arq.Values['3'];
  MedicaoCaseira.ItemIndex := StrToIntDef(arq.Values['4'], 0);


  valorEnergetico.setValor(StrToCurr(arq.Values['5']));
  carboidratos.setValor(StrToCurr(arq.Values['6']));
  proteinas.setValor(StrToCurr(arq.Values['7']));
  gordurastotais.setValor(StrToCurr(arq.Values['8']));
  gordurasSaturadas.setValor(StrToCurr(arq.Values['9']));
  GordurasTrans.setValor(StrToCurr(arq.Values['10']));
  FibraAlimentar.setValor(StrToCurrDef(arq.Values['11'], 0));
  Sodio.setValor(StrToCurrDef(arq.Values['12'], 0));
  tara.setValor(StrToCurrDef(arq.Values['13'], 0));
end;

procedure TForm87.limpar;
begin
  Quantidade.setValor(0);
  unid.Text := '';
  ParteInteira.Text := '';
  ParteDecimal.ItemIndex := 0;
  MedicaoCaseira.ItemIndex := 0;


  valorEnergetico.setValor(0);
  carboidratos.setValor(0);
  proteinas.setValor(0);
  gordurastotais.setValor(0);
  gordurasSaturadas.setValor(0);
  GordurasTrans.setValor(0);
  FibraAlimentar.setValor(0);
  Sodio.setValor(0);
  tara.setValor(0);
end;

end.

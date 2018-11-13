unit Unit38;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, JsBotao1, ToolWin, ComCtrls, JsEditNumero1,
  JsEdit1, JsEditInteiro1, ExtCtrls, Mask, JsEditData1;

type
  TForm38 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    entrada: JsEditNumero;
    vencto: TMaskEdit;
    dias: JsEditInteiro;
    Label7: TLabel;
    qtd: JsEditInteiro;
    taxa: JsEditNumero;
    Label8: TLabel;
    valorp: JsEditNumero;
    procedure taxaKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure valorpKeyPress(Sender: TObject; var Key: Char);
    procedure qtdKeyPress(Sender: TObject; var Key: Char);
    procedure diasKeyPress(Sender: TObject; var Key: Char);
    procedure TeclaEsc;
    procedure entradaKeyPress(Sender: TObject; var Key: Char);
    procedure venctoKeyPress(Sender: TObject; var Key: Char);
    procedure venctoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure valorpEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    total,resto : currency;
    tipo : integer;
    function calculaPrestacao : currency;
    { Public declarations }
  end;

var
  Form38: TForm38;

implementation

uses Unit1, func, principal;

{$R *.dfm}

function tform38.calculaPrestacao : currency;
 begin
   if qtd.Text = '' then qtd.Text := '1';
   resto := total - StrToCurr(funcoes.ConverteNumerico(entrada.Text));
   Result := Arredonda((((resto * taxa.getValor * qtd.getValor)/100) + resto) / StrToIntDef(qtd.text, 1),2);
 end;


procedure tform38.TeclaEsc;
begin
  funcoes.ReParcelamento := TStringList.Create;
  funcoes.ReParcelamento.Add('esc=S');
  funcoes.ReParcelamento.Add('entrada=' + funcoes.ConverteNumerico(entrada.Text));
  funcoes.ReParcelamento.Add('vencto='  + vencto.Text);
  funcoes.ReParcelamento.Add('periodo=' + dias.Text);
  funcoes.ReParcelamento.Add('qtd='     + qtd.Text);
  funcoes.ReParcelamento.Add('taxa='    + funcoes.ConverteNumerico(taxa.Text));
  //funcoes.ReParcelamento.Add('valorp='  + CurrToStr(Arredonda(total / StrToIntDef(qtd.Text, 1), 2)));
  funcoes.ReParcelamento.Add('valorp='  + CurrToStr(calculaPrestacao));
  if tipo = 2 then funcoes.ReParcelamento.Add('total=*')
  else funcoes.ReParcelamento.Add('total='+ CurrToStr(total));
  close;
end;

procedure TForm38.taxaKeyPress(Sender: TObject; var Key: Char);
var tot : currency;
begin
  if key = #27 then
    begin
      TeclaEsc;
      key := #0;
    end;
end;

procedure TForm38.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  JsEdit.LiberaMemoria(self);
end;

procedure TForm38.valorpKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then
    begin
      TeclaEsc;
      key := #0;
    end;
  if key=#13 then
    begin
      funcoes.ReParcelamento := TStringList.Create;
      funcoes.ReParcelamento.Add('entrada='+funcoes.ConverteNumerico(entrada.Text));
      funcoes.ReParcelamento.Add('vencto='+vencto.Text);
      funcoes.ReParcelamento.Add('periodo='+dias.Text);
      funcoes.ReParcelamento.Add('qtd='+qtd.Text);
      funcoes.ReParcelamento.Add('taxa='+funcoes.ConverteNumerico(taxa.Text));
      if StrToCurr(funcoes.ConverteNumerico(valorp.Text)) > calculaPrestacao then funcoes.ReParcelamento.Add('valorp='+funcoes.ConverteNumerico(CurrToStr(calculaPrestacao)))
        else funcoes.ReParcelamento.Add('valorp='+funcoes.ConverteNumerico(valorp.Text));
      funcoes.ReParcelamento.Add('total='+CurrToStr(total));
      key := #0;
      close;
    end;
end;

procedure TForm38.qtdKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then
    begin
      TeclaEsc;
      key := #0;
    end;
end;

procedure TForm38.diasKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then
    begin
      TeclaEsc;
      key := #0;
    end;
end;

procedure TForm38.entradaKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then
    begin
      TeclaEsc;
      key := #0;
    end;
  if key=#13 then
  begin
   Key:=#0;
   vencto.SetFocus;
  end;
end;

procedure TForm38.venctoKeyPress(Sender: TObject; var Key: Char);
var
  temp : string;
begin
  if key=#27 then begin
    TeclaEsc;
    key := #0;
  end;

  if key = #13 then begin
    if length(StrNum(vencto.Text)) <> 8 then begin
     vencto.Text := funcoes.CompletaString(vencto.Text);
    end;
    dias.SetFocus;
  end;

end;

procedure TForm38.venctoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=38 then entrada.SetFocus;
if key=40 then dias.SetFocus;
end;

procedure TForm38.valorpEnter(Sender: TObject);
begin
 tedit(sender).Text := FormatCurr('#,###,###0.00',calculaPrestacao);
end;

procedure TForm38.FormCreate(Sender: TObject);
begin
  funcoes.AjustaForm(self);
end;

end.


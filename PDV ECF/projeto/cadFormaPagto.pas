unit cadFormaPagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, JsBotao1, ExtCtrls, JsEdit1, JsEditInteiro1, func;

type
  TcadFormas = class(TForm)
    cod: JsEditInteiro;
    nome: JsEdit;
    Panel1: TPanel;
    JsBotao1: JsBotao;
    Label1: TLabel;
    Label2: TLabel;
    codhis: JsEdit;
    Label3: TLabel;
    Memo1: TMemo;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure JsBotao1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure codKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cadFormas: TcadFormas;

implementation

uses untDtmMain, ACBrECF;

{$R *.dfm}

procedure TcadFormas.FormShow(Sender: TObject);
var
  ini, fim : integer;
begin
  jsedit.SetTabelaDoBd(self, 'formpagto', dtmMain.IBQuery3);

  if not dtmmain.ACBrECF1.Device.Ativo then dtmmain.ACBrECF1.Ativar;

  fim := dtmmain.ACBrECF1.FormasPagamento.Count -1;
  Memo1.Clear;
  for ini := 0 to fim do
    begin
      Memo1.Lines.Add(dtmmain.ACBrECF1.FormasPagamento.Objects[ini].Indice + ' - ' + dtmmain.ACBrECF1.FormasPagamento.Objects[ini].Descricao);
    end;

  Label5.Caption := 'Preencha o Código da Forma de Pagamento' + #13 +
                    'em cada Forma que vc deseje Usar neste sistema!' + #13 +
                    'Cuidado ao preencher os indices incorretamente.'
end;

procedure TcadFormas.JsBotao1Click(Sender: TObject);
begin
  JsEdit.GravaNoBD(self);
end;

procedure TcadFormas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  jsedit.LiberaMemoria(self);
end;

procedure TcadFormas.codKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 116 then
    begin
      tedit(sender).Text := localizar1('Localizar Form Pagto','formpagto','cod, nome','cod','','nome','nome',false,false,false, '', '',600 ,sender);
    end;
end;


end.

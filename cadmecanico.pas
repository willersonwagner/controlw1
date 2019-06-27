unit cadmecanico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, JsBotao1,
  JsEdit1, JsEditInteiro1, Vcl.ExtCtrls, StrUtils;

type
  TForm80 = class(TForm)
    painel: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    cod: JsEditInteiro;
    nome: JsEdit;
    ToolBar1: TPanel;
    info: TLabel;
    JsBotao1: JsBotao;
    JsBotao2: JsBotao;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure codKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form80: TForm80;

implementation

{$R *.dfm}

uses principal, Unit1;

procedure TForm80.codKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
  
end;

procedure TForm80.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  jsedit.LiberaMemoria(self);
end;

procedure TForm80.FormShow(Sender: TObject);
begin
  self.Caption := 'Cadastro de '+ UpperCase(LeftStr(form22.nomesServico.Values['5'], 1)) + LowerCase(copy(form22.nomesServico.Values['5'], 2, 100));
  JsEdit.SetTabelaDoBd(self,'mecanico', dm.IBQuery1);
end;

end.

unit Unit88;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, JsBotao1,
  JsEdit1, JsEditInteiro1, Vcl.ExtCtrls;

type
  TForm88 = class(TForm)
    painel: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    cod: JsEditInteiro;
    nome: JsEdit;
    ToolBar1: TPanel;
    info: TLabel;
    Label3: TLabel;
    ulticod: TLabel;
    JsBotao1: JsBotao;
    JsBotao2: JsBotao;
    obs: JsEdit;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure nomeEnter(Sender: TObject);
    procedure codKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure JsBotao1Click(Sender: TObject);
    procedure JsBotao2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form88: TForm88;

implementation

{$R *.dfm}

uses Unit1, func;

procedure TForm88.codKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then close;
end;

procedure TForm88.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  JsEdit.LiberaMemoria(self);
end;

procedure TForm88.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = 116) then
   begin
    cod.Text := funcoes.localizar('Localizar Entregador','entregador','cod,nome','cod','','nome','nome',true,false,false,'',300,NIL);
    if cod.Text = '*' then cod.Text := '';

   end;
end;

procedure TForm88.FormShow(Sender: TObject);
begin
  JsEdit.SetTabelaDoBd(self,'entregador',dm.IBQuery1);
end;

procedure TForm88.JsBotao1Click(Sender: TObject);
begin
  if trim(nome.Text) = '' then begin
    ShowMessage('Campo NOME é obrigatório!');
    nome.SetFocus;
    exit;
  end;

  if trim(cod.Text) = '' then cod.Text := '0';
  

   JsEdit.GravaNoBD(self);
end;

procedure TForm88.JsBotao2Click(Sender: TObject);
begin
  JsEdit.ExcluiDoBD(self.Name);
end;

procedure TForm88.nomeEnter(Sender: TObject);
begin
  ulticod.Caption := IntToStr(JsEdit.UltimoCodigoDaTabela(self.Name));
  info.Caption := ' F5 - Consulta';
end;

end.

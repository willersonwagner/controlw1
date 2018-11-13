unit Unit46;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JsEditCNPJ1, Mask, JsEditCPF1, StdCtrls, JsEdit1, JsEditInteiro1,
  Buttons, JsBotao1, ExtCtrls;

type
  TForm46 = class(TForm)
    cod: JsEditInteiro;
    nome: JsEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cpf: JsEditCPF;
    cnpj: JsEditCNPJ;
    Label6: TLabel;
    crc: JsEdit;
    ende: JsEdit;
    Label7: TLabel;
    numero: JsEdit;
    Label8: TLabel;
    cep: JsEdit;
    bairro: JsEdit;
    Label9: TLabel;
    fone: JsEdit;
    Label10: TLabel;
    fax: JsEdit;
    est: JsEdit;
    Label11: TLabel;
    cid: JsEdit;
    Label12: TLabel;
    email: JsEdit;
    Label13: TLabel;
    ToolBar1: TPanel;
    JsBotao1: JsBotao;
    procedure JsBotao1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure nomeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form46: TForm46;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm46.JsBotao1Click(Sender: TObject);
begin
  JsEdit.GravaNoBD(self);
  cod.Text := '1';
  JsEdit.SelecionaDoBD(self.Name);
end;

procedure TForm46.FormShow(Sender: TObject);
begin
  JsEdit.SetTabelaDoBd(self, 'spedcontador', dm.ibquery1);
  cod.Text := '1';
  JsEdit.SelecionaDoBD(self.Name);
end;

procedure TForm46.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  JsEdit.LiberaMemoria(self);
end;

procedure TForm46.nomeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

end.

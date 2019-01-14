unit Unit76;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, JsBotao1,
  Vcl.ExtCtrls, Vcl.Mask, JsEditCPF1, func;

type
  TForm76 = class(TForm)
    Label3: TLabel;
    Label6: TLabel;
    cpf: TMaskEdit;
    cnpj1: TMaskEdit;
    ToolBar1: TPanel;
    button: JsBotao;
    procedure FormShow(Sender: TObject);
    procedure cpfKeyPress(Sender: TObject; var Key: Char);
    procedure cnpj1KeyPress(Sender: TObject; var Key: Char);
    procedure buttonKeyPress(Sender: TObject; var Key: Char);
    procedure buttonClick(Sender: TObject);
  private
    procedure limpa();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form76: TForm76;

implementation

{$R *.dfm}

procedure TForm76.buttonClick(Sender: TObject);
begin
  close;
end;

procedure TForm76.buttonKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    limpa;
    cpf.SetFocus;
  end;
end;

procedure TForm76.cnpj1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin
    button.SetFocus;
  end;

  if key = #27 then begin
    limpa;
    cpf.SetFocus;
  end;
end;

procedure TForm76.cpfKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin
    if length(funcoes.StrNum(cpf.Text)) = 11 then begin
      button.SetFocus;
      exit;
    end;

    cnpj1.SetFocus;
  end;

  if key = #27 then begin
    limpa;
    close;
  end;
end;

procedure TForm76.FormShow(Sender: TObject);
begin
  cpf.SetFocus;
end;

procedure TForm76.limpa();
begin
  cpf.Text   := '';
  cnpj1.Text := '';
end;

end.

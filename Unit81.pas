unit Unit81;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, JsBotao1;

type
  TForm81 = class(TForm)
    Memo1: TMemo;
    JsBotao1: JsBotao;
    procedure JsBotao1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    retorno : String;
    { Public declarations }
  end;

var
  Form81: TForm81;

implementation

{$R *.dfm}

procedure TForm81.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    retorno := '*';
    close;
  end;
end;

procedure TForm81.FormShow(Sender: TObject);
begin
  retorno := '';
end;

procedure TForm81.JsBotao1Click(Sender: TObject);
begin
  close;
end;

procedure TForm81.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
  key := UpCase(key);
end;

end.

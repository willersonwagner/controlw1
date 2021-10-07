unit troco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm86 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    troco: TLabel;
    Label3: TLabel;
    total: TLabel;
    Label5: TLabel;
    pago: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form86: TForm86;

implementation

{$R *.dfm}

procedure TForm86.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then close;
  if key = #27 then close;
end;

end.

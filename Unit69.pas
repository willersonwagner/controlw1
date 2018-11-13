unit Unit69;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm69 = class(TForm)
    Label1: TLabel;
    ListBox1: TComboBox;
    procedure ListBox1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form69: TForm69;

implementation

{$R *.dfm}

procedure TForm69.ListBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then close;
  if key = #27 then begin
    ListBox1.Clear;
    close;
  end;
end;

end.

unit Unit57;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm57 = class(TForm)
    LabelTroco: TPanel;
    Labeldin: TPanel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form57: TForm57;

implementation

{$R *.dfm}

procedure TForm57.FormKeyPress(Sender: TObject; var Key: Char);
begin
  close;
end;

end.
 
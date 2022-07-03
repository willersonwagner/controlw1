unit Unit90;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm90 = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    retorno : String;
    { Public declarations }
  end;

var
  Form90 : TForm90;

implementation

{$R *.dfm}

procedure TForm90.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then close;
  if key = #27 then begin
    retorno := 'N';
    close;
  end;
end;

procedure TForm90.FormShow(Sender: TObject);
begin
  if FileExists(ExtractFileDir(ParamStr(0)) + '\taxa.dat') then begin
   ComboBox1.Items.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\taxa.dat');
   ComboBox1.ItemIndex := 0;
  end;

end;

end.

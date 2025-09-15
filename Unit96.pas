unit Unit96;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.Imaging.jpeg, Vcl.StdCtrls;

type
  TForm96 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    Image2: TImage;
    Timer1: TTimer;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    cont : integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form96: TForm96;

implementation

{$R *.dfm}

procedure TForm96.FormCreate(Sender: TObject);
begin
  cont := 3;
end;

procedure TForm96.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Timer1.Enabled = false then close;

end;

procedure TForm96.FormShow(Sender: TObject);
begin
  Timer1.Enabled := true;
  Label3.Visible := true;
  Label3.Caption := IntToStr(cont);
end;

procedure TForm96.Timer1Timer(Sender: TObject);
begin
  cont := cont -1;

  if cont >= 0 then begin
    Label3.Visible := true;
    Label3.Caption := IntToStr(cont);
    beep;
  end;
  if cont < 0 then begin
     Timer1.Enabled := false;
     close;
  end;

end;

end.

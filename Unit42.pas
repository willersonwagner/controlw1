unit Unit42;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm42 = class(TForm)
    Timer1: TTimer;
    Label1: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    cont,c2 : Smallint;
    botao : TButton;
    { Private declarations }
  public
    function defineScreenSave(tipo: integer;nome: string) : integer;

    { Public declarations }
  end;

var
  Form42: TForm42;

implementation

uses principal, Math;

{$R *.dfm}
function tform42.defineScreenSave(tipo: integer;nome: string) : integer;
  begin
   cont := tipo;
   if tipo = 1 then
     begin

     end;
  end;

procedure TForm42.Timer1Timer(Sender: TObject);
begin
  if Label1.Top <= 0 then
    begin
      Randomize;
      c2 := Random(2);
      cont := 1;
    end;

  if Label1.Left <= 0 then
    begin
     Randomize;
     c2 := Random(2);
     cont := 2;
    end;

  if Label1.Top + Label1.Height >= Height then
    begin
      Randomize;
      c2 := Random(2);
      cont := 3;
    end;

  if Label1.Left + Label1.Width >= Width then
    begin
      Randomize;
      c2 := Random(2);
      cont := 4;
    end;

  if cont = 0 then
    begin

      if c2 = 1 then
        begin
          form42.Canvas.Pixels[10,10] := clWhite;
          Label1.Top := Label1.Top - 2;
          Label1.Left := Label1.Left -2;
        end
      else
        begin
          Label1.Top := Label1.Top + 2;
          Label1.Left := Label1.Left +2;
        end;
    end;

  if cont = 1 then
    begin
       if c2 = 1 then
        begin
          Label1.Top := Label1.Top + 2;
          Label1.Left := Label1.Left -2;
        end
      else
        begin
          Label1.Top := Label1.Top + 2;
          Label1.Left := Label1.Left +2;
        end;

    end;

  if cont = 2 then
    begin
      if c2 = 1 then
        begin
          Label1.Top := Label1.Top + 2;
          Label1.Left := Label1.Left + 2;
        end
      else
        begin
         Label1.Top := Label1.Top - 2;
         Label1.Left := Label1.Left - 2;
        end;

    end;

  if cont = 3 then
    begin
       if c2 = 1 then
        begin
          Label1.Top := Label1.Top - 2;
          Label1.Left := Label1.Left + 2;
        end
      else
        begin
          Label1.Top := Label1.Top + 2;
          Label1.Left := Label1.Left - 2;
        end;
    end;

  if cont = 4 then
    begin
       if c2 = 1 then
        begin
          Label1.Top := Label1.Top - 2;
          Label1.Left := Label1.Left - 2;
        end
      else
        begin
          Label1.Top := Label1.Top + 2;
          Label1.Left := Label1.Left + 2;
        end;

    end;

end;

procedure TForm42.FormShow(Sender: TObject);
begin
  if cont = 3 then
    begin
      Timer1.Enabled := false;
      exit;
    end;
  cont := 0;
  Randomize;
  c2 := Random(2);
  Label1.Caption := form22.Pgerais.Values['empresa'];
end;

procedure TForm42.FormClick(Sender: TObject);
var recty : TRect;
begin
{  recty := Label1.BoundsRect;
  form42.Canvas.Pen.Color := clBlack;
  form42.Canvas.Brush.Color := clBlack;
  form42.Canvas.Pen.Style := psSolid;
  form42.Canvas.Pen.Width := Label1.Width;
  form42.Canvas.Pen.Mode := pmBlack;
  form42.Canvas.Rectangle(Label1.BoundsRect);
 } //form42.Canvas.Rectangle(Label1.BoundsRect);

  //form42.Canvas.Pixels[20,100] := clWhite;

end;

procedure TForm42.Button1Click(Sender: TObject);
begin
 close;
end;

procedure TForm42.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) or (key = #27) then close;
end;

end.

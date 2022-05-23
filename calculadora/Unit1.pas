unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    visor: TEdit;
    um: TSpeedButton;
    dois: TSpeedButton;
    tres: TSpeedButton;
    quatro: TSpeedButton;
    cinco: TSpeedButton;
    seis: TSpeedButton;
    sete: TSpeedButton;
    oito: TSpeedButton;
    nove: TSpeedButton;
    menos: TSpeedButton;
    multiplicar: TSpeedButton;
    dividir: TSpeedButton;
    zero: TSpeedButton;
    SpeedButton14: TSpeedButton;
    virgula: TSpeedButton;
    mais: TSpeedButton;
    igual: TSpeedButton;
    porcentagem: TSpeedButton;
    limpar: TSpeedButton;
    procedure visorChange(Sender: TObject);
    procedure visorEnter(Sender: TObject);
    procedure umClick(Sender: TObject);
    procedure doisClick(Sender: TObject);
    procedure tresClick(Sender: TObject);
    procedure quatroClick(Sender: TObject);
    procedure cincoClick(Sender: TObject);
    procedure seisClick(Sender: TObject);
    procedure seteClick(Sender: TObject);
    procedure oitoClick(Sender: TObject);
    procedure noveClick(Sender: TObject);
    procedure zeroClick(Sender: TObject);
    procedure virgulaClick(Sender: TObject);
    procedure maisClick(Sender: TObject);
    procedure menosClick(Sender: TObject);
    procedure multiplicarClick(Sender: TObject);
    procedure dividirClick(Sender: TObject);
    procedure limparClick(Sender: TObject);
    procedure porcentagemClick(Sender: TObject);
    procedure igualClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    valor1 : real;
    valor2 : real;
    funcao : string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.cincoClick(Sender: TObject);
begin
  visor.Text := visor.Text + '5';
end;

procedure TForm1.dividirClick(Sender: TObject);
begin
 if pos(TSpeedButton(sender).Caption, visor.Text) > 0 then exit;

  visor.Text := visor.Text + '/';
  funcao := '/';
end;

procedure TForm1.doisClick(Sender: TObject);
begin
  visor.Text := visor.Text + '2';
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //8 del
  //ShowMessage(IntToStr(key) + #13 + Char(key));

  if key = 8 then porcentagem.Click
  else if key = 27 then begin
    if visor.Text <> '' then  limpar.Click
      else close;
  end
  else if ((Char(key) = '1') or (key = VK_NUMPAD1)) then um.Click
  else if ((Char(key) = '2') or (key = VK_NUMPAD2)) then dois.Click
  else if ((Char(key) = '3') or (key = VK_NUMPAD3)) then tres.Click
  else if ((Char(key) = '4') or (key = VK_NUMPAD4)) then quatro.Click
  else if ((Char(key) = '5') or (key = VK_NUMPAD5)) then cinco.Click
  else if ((Char(key) = '6') or (key = VK_NUMPAD6)) then seis.Click
  else if ((Char(key) = '7') or (key = VK_NUMPAD7)) then sete.Click
  else if ((Char(key) = '8') or (key = VK_NUMPAD8)) then oito.Click
  else if ((Char(key) = '9') or (key = VK_NUMPAD9)) then nove.Click
  else if ((Char(key) = '0') or (key = VK_NUMPAD0)) then zero.Click
  else if ((Char(key) = '/') or (key = VK_DIVIDE)) then dividir.Click
  else if ((Char(key) = '+') or (key = VK_ADD)) then mais.Click
  else if ((Char(key) = '-') or (key = VK_SUBTRACT)) then menos.Click
  else if ((Char(key) = '*') or (key = VK_MULTIPLY)) then multiplicar.Click
  else if ((Char(key) = '=') or (key = 13)) then igual.Click
  else if ((Char(key) = ',') or (key = VK_DECIMAL) or (key = 188) or (key = 190)) then virgula.Click;



end;

procedure TForm1.igualClick(Sender: TObject);
var
  a : String;
begin
  a := visor.Text;


  //ShowMessage('val1='+copy(a, 1, pos(funcao, a) -1) + #13 +
  //            'val2='+ copy(a, pos(funcao, a) + 1, length(a)  ));

  try
   valor1 := StrToFloat(copy(a, 1, pos(funcao, a) -1));
  except
   on e:exception do begin
     ShowMessage('Verifique os Valores ' + e.Message);
     exit;
   end;
  end;

  try
   valor2 := StrToFloat(copy(a, pos(funcao, a) + 1, length(a)  ));
  except
   on e:exception do begin
     ShowMessage('Verifique os Valores ' + e.Message);
     exit;
   end;
  end;

  if pos('+', visor.Text) > 0 then begin
    visor.Text := FloatToStr(valor1 + valor2);
  end
  else if pos('-', visor.Text) > 0 then begin
    visor.Text := FloatToStr(valor1 - valor2);
  end
  else if pos('*', visor.Text) > 0 then begin
    visor.Text := FloatToStr(valor1 * valor2);
  end
  else if pos('/', visor.Text) > 0 then begin
    visor.Text := FloatToStr(valor1 / valor2);
  end;



end;

procedure TForm1.limparClick(Sender: TObject);
begin
  visor.Text := '';
end;

procedure TForm1.maisClick(Sender: TObject);
begin
  if pos(TSpeedButton(sender).Caption, visor.Text) > 0 then exit;

  visor.Text := visor.Text + '+';
  funcao := '+';
end;

procedure TForm1.menosClick(Sender: TObject);
begin
  if pos(TSpeedButton(sender).Caption, visor.Text) > 0 then exit;

  visor.Text := visor.Text + '-';
  funcao := '-';
end;

procedure TForm1.multiplicarClick(Sender: TObject);
begin
  if pos(TSpeedButton(sender).Caption, visor.Text) > 0 then exit;

  visor.Text := visor.Text + '*';
  funcao := '*';
end;

procedure TForm1.noveClick(Sender: TObject);
begin
  if visor.Text = '0' then visor.Text := '';
  visor.Text := visor.Text + '9';
end;

procedure TForm1.oitoClick(Sender: TObject);
begin
  if visor.Text = '0' then visor.Text := '';
  visor.Text := visor.Text + '8';
end;

procedure TForm1.porcentagemClick(Sender: TObject);
var
  cont : integer;
begin
  cont := length(visor.Text);
  visor.Text := copy(visor.Text, 1, length(visor.Text) -1);
  if cont = 1 then visor.Text := '0';

end;

procedure TForm1.quatroClick(Sender: TObject);
begin
  if visor.Text = '0' then visor.Text := '';
  visor.Text := visor.Text + '4';
end;

procedure TForm1.seisClick(Sender: TObject);
begin
  if visor.Text = '0' then visor.Text := '';
  visor.Text := visor.Text + '6';
end;

procedure TForm1.seteClick(Sender: TObject);
begin
  if visor.Text = '0' then visor.Text := '';
  visor.Text := visor.Text + '7';
end;

procedure TForm1.tresClick(Sender: TObject);
begin
  if visor.Text = '0' then visor.Text := '';
  visor.Text := visor.Text + '3';
end;

procedure TForm1.umClick(Sender: TObject);
begin
 if visor.Text = '0' then visor.Text := '';

 visor.Text := visor.Text + '1';
end;

procedure TForm1.virgulaClick(Sender: TObject);
begin
  visor.Text := visor.Text + ',';
end;

procedure TForm1.visorChange(Sender: TObject);
begin
  HideCaret(visor.Handle);
end;

procedure TForm1.visorEnter(Sender: TObject);
begin
HideCaret(visor.Handle);
end;

procedure TForm1.zeroClick(Sender: TObject);
begin
  if visor.Text = '0' then visor.Text := '';
  visor.Text := visor.Text + '0';
end;

end.

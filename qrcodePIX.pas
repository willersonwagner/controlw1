unit qrcodePIX;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ACBrDelphiZXingQRCode, RLReport,
  Vcl.StdCtrls, Vcl.ExtCtrls, ACBrDFeReport;

type
  TForm84 = class(TForm)
    image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PrintDialog1: TPrintDialog;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form84: TForm84;

implementation

{$R *.dfm}

uses principal, func;

procedure TForm84.Button1Click(Sender: TObject);
begin
  if form22.qrcodePIX = '' then funcoes.ajustaHoraPelaInternet(form22.datamov);
  PintarQRCode(form22.qrcodePIX, Image1.Picture.Bitmap, qrAuto);
end;

procedure TForm84.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (UpCase(Chr(Key)) = 'P') then begin
    PrintDialog1.Execute(self.Handle);
    self.Print;
  end;
end;

procedure TForm84.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
  
end;

procedure TForm84.FormShow(Sender: TObject);
begin
  if form22.qrcodePIX = '' then funcoes.ajustaHoraPelaInternet(form22.datamov);
  PintarQRCode(form22.qrcodePIX, Image1.Picture.Bitmap, qrAuto);

  if form22.beneNome = '' then begin
    Label3.Caption := 'Nenhuma Conta Cadastrada para esse ' + #13 + 'CNPJ ' + form22.beneCNPJ;
    Label3.Font.Color := 250;
  end
  else begin
    Label3.Caption := 'Beneficiário' + #13 + #13 + 'Nome: ' + form22.beneNome + #13 +
    'CNPJ : ' + form22.beneCNPJ + #13 +
    'Fone : ' + form22.beneFone;
  end;
end;

end.

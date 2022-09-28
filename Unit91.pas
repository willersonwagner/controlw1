unit Unit91;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TForm91 = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    nota : string;
    recebido : currency;
    { Public declarations }
  end;

var
  Form91: TForm91;

implementation

{$R *.dfm}

uses principal, dadosnfe, func;

procedure TForm91.BitBtn1Click(Sender: TObject);
begin
  form22.enviNFCe(nota, '', recebido);
  close;
end;

procedure TForm91.BitBtn2Click(Sender: TObject);
begin
  form79 := tform79.Create(self);
  form79.nota.Text := strnum(nota);
  form79.showmodal;
  form79.Free;
  close;
end;

procedure TForm91.BitBtn3Click(Sender: TObject);
begin
  funcoes.emiteNfe(strnum(nota), true);
  close;
end;

procedure TForm91.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TForm91.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F1 then begin
    BitBtn1.Click;
  end
  else if key = VK_F2 then begin
    BitBtn2.Click;
  end
  else if key = VK_F3 then begin
    BitBtn3.Click;
  end;
end;

procedure TForm91.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then BitBtn4.Click;
  
end;

procedure TForm91.FormShow(Sender: TObject);
begin
  BitBtn1.SetFocus;
end;

end.

unit Unit73;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm73 = class(TForm)
    serie: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    nnf: TEdit;
    BitBtn1: TBitBtn;
    procedure nnfKeyPress(Sender: TObject; var Key: Char);
    procedure serieKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form73: TForm73;

implementation

{$R *.dfm}

uses func;

procedure TForm73.BitBtn1Click(Sender: TObject);
begin
  if nnf.Text = '' then begin
   nnf.SetFocus;
   ShowMessage('Preencha o NUMERO da Nota Fiscal!');
   exit;
  end;

  if serie.Text = '' then begin
   serie.SetFocus;
   ShowMessage('Preencha a SERIE da Nota Fiscal!');
   exit;
  end;

  close;
end;

procedure TForm73.serieKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then BitBtn1.SetFocus;
  Key := funcoes.Ret_Numero( Key, nnf.Text );
end;

procedure TForm73.BitBtn1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then nnf.SetFocus;
end;

procedure TForm73.FormShow(Sender: TObject);
begin
  nnf.SetFocus;
  nnf.Text := '';
  serie.Text := '';
end;

procedure TForm73.nnfKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then serie.SetFocus;

  Key := funcoes.Ret_Numero( Key, nnf.Text );
end;

end.

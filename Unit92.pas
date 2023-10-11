unit Unit92;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JsEdit1, JsEditNumero1;

type
  TForm92 = class(TForm)
    nDrawback: TEdit;
    regExpo: TEdit;
    chNfe: TEdit;
    qExport: JsEditNumero;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    procedure nDrawbackKeyPress(Sender: TObject; var Key: Char);
    procedure regExpoKeyPress(Sender: TObject; var Key: Char);
    procedure chNfeKeyPress(Sender: TObject; var Key: Char);
    procedure qExportKeyPress(Sender: TObject; var Key: Char);
    procedure Button1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    cod : integer;
    retorno : String;
  end;

var
  Form92: TForm92;

implementation

{$R *.dfm}

procedure TForm92.Button1Click(Sender: TObject);
begin
  retorno := '|'+IntToStr(cod)+ '|' + nDrawback.Text + '|' + regExpo.Text + '|' + chNfe.Text + '|' + CurrToStr(qExport.getValor) +'|';
  close;
end;

procedure TForm92.Button1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then nDrawback.SetFocus;
end;

procedure TForm92.chNfeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then qExport.SetFocus;
  if key = #27 then regExpo.SetFocus;
end;

procedure TForm92.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  JsEdit.LiberaMemoria(self);
end;

procedure TForm92.FormCreate(Sender: TObject);
begin
  retorno := '';
end;

procedure TForm92.nDrawbackKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then regExpo.SetFocus;
  if key = #27 then close;
end;

procedure TForm92.qExportKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then Button1.SetFocus;
  if key = #27 then chNfe.SetFocus;
end;

procedure TForm92.regExpoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then chNfe.SetFocus;
  if key = #27 then nDrawback.SetFocus;
end;

end.

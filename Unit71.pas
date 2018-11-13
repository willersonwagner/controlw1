unit Unit71;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, untnfce, Vcl.Buttons,
  JsBotao1, jsedit1;

type
  TForm71 = class(TForm)
    Label9: TLabel;
    EditChave: TEdit;
    tipo: TComboBox;
    Label1: TLabel;
    JsBotao1: JsBotao;
    Label2: TLabel;
    procedure JsBotao1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditChaveKeyPress(Sender: TObject; var Key: Char);
    procedure tipoKeyPress(Sender: TObject; var Key: Char);
    procedure JsBotao1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form71: TForm71;

implementation

{$R *.dfm}

uses nfe, Unit1, func;

procedure TForm71.EditChaveKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin
    tipo.SetFocus;
  end;

  if key = #27 then begin
    close;
  end;
end;

procedure TForm71.FormShow(Sender: TObject);
begin
  JsEdit.SetTabelaDoBd(self,'teste', dm.IBQuery4);
end;

procedure TForm71.JsBotao1Click(Sender: TObject);
var
  just : string;
begin
  try
    just := '';
    {if tipo.ItemIndex = 2 then begin
      while length(just) < 16 do begin
        just := funcoes.dialogo('normal',0,'',150,false,'',Application.Title,'Qual a Justificativa?',just);
        if just = '*' then Break;
      end;
      if just = '*' then exit;
    end;}

    Label2.Visible := true;
    Application.ProcessMessages;
    Application.ProcessMessages;
    NfeVenda := TNfeVenda.Create(self);
    nfevenda.ManifestarNFe(EditChave.Text, IntToStr(tipo.ItemIndex), just);
    NfeVenda.Free;
  finally
    Label2.Visible := false;
  end;
end;

procedure TForm71.JsBotao1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    tipo.SetFocus;
    abort;
  end;
end;

procedure TForm71.tipoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin
    JsBotao1.SetFocus;
  end;

  if key = #27 then begin
    EditChave.SetFocus;
  end;
end;

end.

unit cadAliq;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm94 = class(TForm)
    cod: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    aliq: TEdit;
    Label3: TLabel;
    reducao: TEdit;
    cst: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    csosn: TEdit;
    btgravar: TButton;
    procedure FormShow(Sender: TObject);
    procedure codKeyPress(Sender: TObject; var Key: Char);
    procedure aliqKeyPress(Sender: TObject; var Key: Char);
    procedure reducaoKeyPress(Sender: TObject; var Key: Char);
    procedure cstKeyPress(Sender: TObject; var Key: Char);
    procedure csosnKeyPress(Sender: TObject; var Key: Char);
    procedure btgravarClick(Sender: TObject);
  private
    procedure buscaAliq;
    procedure insereAliq;
    procedure limpa;
    procedure excluiAliq;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form94: TForm94;

implementation

{$R *.dfm}

uses Unit1, func;

procedure TForm94.aliqKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin
    reducao.SetFocus;
  end;
end;

procedure TForm94.codKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin
    if cod.Text = '' then cod.Text := '0'
    else begin
      buscaAliq;
    end;

    aliq.SetFocus;
  end;

  if key = #27 then begin
    limpa;
    close;
  end;
end;

procedure TForm94.csosnKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin
    btgravar.SetFocus;
  end;
end;

procedure TForm94.cstKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin
    csosn.SetFocus;
  end;
end;

procedure TForm94.FormShow(Sender: TObject);
begin
  cod.SetFocus;
end;

procedure TForm94.reducaoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin
    cst.SetFocus;
  end;
end;

procedure TForm94.btgravarClick(Sender: TObject);
begin
  insereAliq;
end;

procedure TForm94.buscaAliq;
begin
  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select * from aliq where cod = :cod';
  dm.IBselect.ParamByName('cod').AsString := cod.Text;
  dm.IBselect.Open;

  if dm.IBselect.IsEmpty then begin
    //ShowMessage('Aliquota cód ' + cod.Text + ' Não Existe!');
    dm.IBselect.Close;
    exit;
  end;

  aliq.Text    := dm.IBselect.FieldByName('aliq').AsString;
  reducao.Text := dm.IBselect.FieldByName('reducao').AsString;
  cst.Text     := dm.IBselect.FieldByName('cst').AsString;
  csosn.Text   := dm.IBselect.FieldByName('csosn').AsString;
  dm.IBselect.Close;
end;

procedure TForm94.insereAliq;
begin
  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text := 'update or insert into aliq(cod,aliq,reducao,cst,csosn) values(:cod,:aliq,:reducao,:cst,:csosn) matching(cod)';
  dm.IBQuery1.ParamByName('cod').AsString       := cod.text;
  dm.IBQuery1.ParamByName('aliq').AsCurrency    := StrToCurr(aliq.Text);
  dm.IBQuery1.ParamByName('reducao').AsCurrency := StrToCurr(reducao.Text);
  dm.IBQuery1.ParamByName('cst').AsString       := cst.text;
  dm.IBQuery1.ParamByName('csosn').AsString     := csosn.text;
  dm.IBQuery1.ExecSQL;
  dm.IBQuery1.Transaction.Commit;

  limpa;
  ShowMessage('Informações Alteradas!');
end;

procedure TForm94.limpa;
begin
  cod.Text   := '';
  aliq.Text  := '';
  reducao.Text    := '';
  cst.Text   := '';
  csosn.Text := '';
  cod.SetFocus;
end;

procedure TForm94.excluiAliq;
begin

end;


end.

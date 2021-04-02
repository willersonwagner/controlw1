unit Unit83;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TForm83 = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    cliente: TEdit;
    endereco: TEdit;
    Label8: TLabel;
    Label1: TLabel;
    obs: TEdit;
    telefone: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    taxa: TEdit;
    procedure clienteKeyPress(Sender: TObject; var Key: Char);
    procedure telefoneKeyPress(Sender: TObject; var Key: Char);
    procedure enderecoKeyPress(Sender: TObject; var Key: Char);
    procedure obsKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure taxaKeyPress(Sender: TObject; var Key: Char);
  private
    procedure teclaEsc(key : char);
    procedure proximo(key : char);
    procedure gravaEndereco;
    function validaInformacoes() : boolean;
    procedure buscaInformacoes();
    { Private declarations }
  public
    codEntrega : string;
    { Public declarations }
  end;

var
  Form83: TForm83;

implementation

{$R *.dfm}

uses Unit1, func;

procedure TForm83.BitBtn1Click(Sender: TObject);
begin
  if validaInformacoes = false then exit;

  gravaEndereco;
end;

procedure TForm83.BitBtn1KeyPress(Sender: TObject; var Key: Char);
begin
teclaEsc(key);
proximo(key);
end;

procedure TForm83.clienteKeyPress(Sender: TObject; var Key: Char);
begin
  teclaEsc(key);
  proximo(key);
end;

procedure TForm83.taxaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #32 then tedit(sender).Text := 'S';
  if key = #8  then tedit(sender).Text := 'N';

  teclaEsc(key);
  proximo(key);

  if not(funcoes.Contido(UpCase(key), 'SN'))  then key := #0
  else begin
    tedit(sender).Text := UpCase(key);
    key := #0;
  end;

end;

procedure TForm83.enderecoKeyPress(Sender: TObject; var Key: Char);
begin
teclaEsc(key);
proximo(key);
end;

procedure TForm83.FormCreate(Sender: TObject);
begin
  codEntrega := '0';
end;

procedure TForm83.FormShow(Sender: TObject);
begin
  cliente.SetFocus;

  buscaInformacoes;
end;

procedure TForm83.obsKeyPress(Sender: TObject; var Key: Char);
begin
teclaEsc(key);
proximo(key);
end;

procedure TForm83.teclaEsc(key : char);
begin
  if key <> #27 then exit;


  if cliente.Focused then begin
    close;
    exit;
  end;

  cliente.SetFocus;
end;


procedure TForm83.proximo(key : char);
begin
  if key <> #13 then exit;
  if BitBtn1.Focused then exit;



  if cliente.Focused then begin
    telefone.SetFocus;
    exit;
  end;

  if telefone.Focused then begin
    endereco.SetFocus;
    exit;
  end;

  if endereco.Focused then begin
    obs.SetFocus;
    exit;
  end;

  if obs.Focused then begin
    taxa.SetFocus;
    exit;
  end;

  if taxa.Focused then begin
    BitBtn1.SetFocus;
    exit;
  end;

end;

procedure TForm83.gravaEndereco;
begin
  if StrToIntDef(codEntrega, 0) > 0 then begin
    close;
    EXIT;
  end;
  codEntrega := Incrementa_Generator('ENTREGA', 1);

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text := 'insert into ENTREGA(TAXA,COD, CLIENTE, TELEFONE, ENDERECO, OBS ) VALUES '+
  '(:TAXA, :COD, :CLIENTE, :TELEFONE, :ENDERECO, :OBS )';
  //dm.IBQuery1.ParamByName('TAXA').AsCurrency   := StrToInt(codEntrega);
  dm.IBQuery1.ParamByName('TAXA').AsCurrency   := 0;
  if TAXA.Text = 'S' then dm.IBQuery1.ParamByName('TAXA').AsCurrency   := StrToCurr(funcoes.buscaParamGeral(124, '5'));

  dm.IBQuery1.ParamByName('cod').AsInteger     := StrToInt(codEntrega);
  dm.IBQuery1.ParamByName('CLIENTE').AsString  := cliente.Text;
  dm.IBQuery1.ParamByName('TELEFONE').AsString := TELEFONE.Text;
  dm.IBQuery1.ParamByName('ENDERECO').AsString := ENDERECO.Text;
  dm.IBQuery1.ParamByName('OBS').AsString      := OBS.Text;
  dm.IBQuery1.ExecSQL;
  dm.IBQuery1.Transaction.Commit;
  close;
end;


procedure TForm83.telefoneKeyPress(Sender: TObject; var Key: Char);
begin
  teclaEsc(key);
  proximo(key);
end;

function TForm83.validaInformacoes() : boolean;
begin
  Result := false;

  if Length(cliente.Text) < 2 then begin
    ShowMessage('Nome Do Cliente Inválido!');
    exit;
  end;

  if Length(endereco.Text) < 5 then begin
    ShowMessage('Endereço Inválido!');
    exit;
  end;

  Result := true;
end;

procedure TForm83.buscaInformacoes();
begin
  if StrToIntDef(codEntrega, 0) <= 0 then EXIT;

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select * from entrega where cod = :cod';
  dm.IBselect.ParamByName('cod').AsInteger := StrToIntDef(codEntrega, 0);
  dm.IBselect.Open;

  cliente.Text  := dm.IBselect.FieldByName('cliente').AsString;
  telefone.Text := dm.IBselect.FieldByName('telefone').AsString;
  endereco.Text := dm.IBselect.FieldByName('endereco').AsString;
  obs.Text      := dm.IBselect.FieldByName('obs').AsString;
  dm.IBselect.Close;
end;

end.

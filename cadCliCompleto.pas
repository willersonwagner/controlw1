unit cadClicompleto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, JsBotao1, ExtCtrls, Mask, JsEditCPF1, JsEdit1,
  JsEditInteiro1;

type
  TcadCliNFCe = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    cod: JsEditInteiro;
    nome: JsEdit;
    cnpj: JsEditCPF;
    ende: JsEdit;
    ToolBar1: TPanel;
    button: JsBotao;
    Label4: TLabel;
    bairro: JsEdit;
    tipo: JsEditInteiro;
    Label5: TLabel;
    procedure bairroKeyPress(Sender: TObject; var Key: Char);
    procedure buttonKeyPress(Sender: TObject; var Key: Char);
    procedure codKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure buttonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure numeroKeyPress(Sender: TObject; var Key: Char);
    procedure cnpjKeyPress(Sender: TObject; var Key: Char);
    procedure nomeEnter(Sender: TObject);
    procedure codKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure nomeKeyPress(Sender: TObject; var Key: Char);
    procedure tipoKeyPress(Sender: TObject; var Key: Char);
    procedure tipoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    function verificaCamposOK() : boolean;
    procedure limpa();
    function insereCliente : String;
    procedure buscaCliente(cpf1 : String);
    { Private declarations }
  public
    codCliente : String;
    procedure setMask();
    { Public declarations }
  end;

var
  cadCliNFCe: TcadCliNFCe;

implementation

uses func, untnfceForm;

{$R *.dfm}

procedure TcadCliNFCe.limpa();
begin
end;

procedure TcadCliNFCe.bairroKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    begin
      key := #0;
      limpa;
    end;

  if key = #13 then
    begin
      button.SetFocus;
      key := #0;
      abort;
      exit;
    end;
end;

procedure TcadCliNFCe.buttonKeyPress(Sender: TObject; var Key: Char);
begin
  key := #0;
end;

function TcadCliNFCe.insereCliente : String;
begin
  //dtmmain.IBQuery1.Close;
  //dtmMain.IBQuery1.SQL.Text := 'insert into';
end;

procedure TcadCliNFCe.codKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 116) then
    begin
      tedit(sender).Text := funcoes.localizar('Localizar Cliente','cliente','cod,nome,telres,telcom,cnpj as cpfcnpj,bairro','cod','','nome','nome',false,false,false,'',450,NIL);
      key := 0;
    end;
end;

procedure TcadCliNFCe.buttonClick(Sender: TObject);
begin
  //tipo.Text := '1';

  if not verificaCamposOK then exit;

  codCliente := jsedit.GravaNoBD(self);
  tipo.Text := '1';
  close;
end;

procedure TcadCliNFCe.FormShow(Sender: TObject);
begin
  jsedit.SetTabelaDoBd(self, 'cliente', query1);
end;

procedure TcadCliNFCe.numeroKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then button.SetFocus;
end;

procedure TcadCliNFCe.cnpjKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      if tipo.Text = '1' then begin
        if not testacpf(cnpj.Text) then begin
            MessageDlg('CPF Inválido!', mtError, [mbOK], 1);
            key := #0;
            abort;
            exit;
        end;
      end
      else begin
        if not ValidaCNPJ(cnpj.Text) then begin
            MessageDlg('CNPJ Inválido!', mtError, [mbOK], 1);
            key := #0;
            abort;
            exit;
        end;
      end;

      buscaCliente(cnpj.Text);
      ende.SetFocus;
    end;
end;

procedure TcadCliNFCe.nomeEnter(Sender: TObject);
begin
  codCliente := cod.Text;
  setMask();

  query1.Close;
  query1.SQL.Text := ('select cnpj from cliente where cod = :cod');
  query1.ParamByName('cod').AsString := cod.Text;
  query1.Open;
  cnpj.Text := query1.fieldbyname('cnpj').AsString;

  query1.Close;
end;

procedure TcadCliNFCe.nomeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin
    tipo.SetFocus;
    setMask;
    key := #0;
  end;
end;

procedure TcadCliNFCe.codKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure TcadCliNFCe.FormCreate(Sender: TObject);
begin
  codCliente := '0';
end;

procedure TcadCliNFCe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  jsedit.LiberaMemoria(self);
end;

procedure TcadCliNFCe.buscaCliente(cpf1 : String);
begin
  Query1.Close;
  Query1.SQL.Text := 'select cod, nome, ende, bairro from cliente where cnpj = :cnpj';
  Query1.ParamByName('cnpj').AsString := cpf1;
  Query1.Open;

  if Query1.IsEmpty then
    begin
      Query1.Close;
      exit;
    end;

  cod.Text    := Query1.fieldbyname('cod').AsString;
  NOME.Text   := Query1.fieldbyname('nome').AsString;
  ende.Text   := Query1.fieldbyname('ende').AsString;
  bairro.Text := Query1.fieldbyname('bairro').AsString;
  Query1.Close;
end;


function TcadCliNFCe.verificaCamposOK() : boolean;
begin
  Result := false;
  if nome.Text   = '' then nome.Text := 'CONSUMIDOR';
  if ende.Text   = '' then
    begin
      ShowMessage('Campo Endereço Deve ser Informado!');
      ende.SetFocus;
      exit;
    end;

  if bairro.Text = '' then
    begin
      ShowMessage('Campo Bairro Deve ser Informado!');
      bairro.SetFocus;
      exit;
    end;  
  Result := true;
end;

procedure TcadCliNFCe.setMask();
begin
 if tipo.Text = '1' then
  begin
    self.Caption := 'Cadastro de Pessoa Fisica';
    Label3.Caption := 'CPF:';
    cnpj.EditMask := '!999.999.999-99;1;_';
  end
 else if tipo.Text = '6' then
  begin
    self.Caption := 'Cadastro de Produtor Rural';
    Label3.Caption := 'CPF:';
    cnpj.EditMask := '!999.999.999-99;1;_';
  end
 else
  begin
    self.Caption := 'Cadastro de Pessoa Jurídica';
    Label3.Caption := 'CNPJ:';
    cnpj.EditMask := '!99.999.999/9999-99;1;_';
  end;

end;

procedure TcadCliNFCe.tipoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //if (Key = 38) then nome.SetFocus;
  if (Key = 40) then cnpj.SetFocus;
end;

procedure TcadCliNFCe.tipoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin
    cnpj.SetFocus;
    setMask;
    key := #0;
  end;

end;

end.

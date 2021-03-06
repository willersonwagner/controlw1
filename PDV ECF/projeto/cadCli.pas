unit cadCli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, JsBotao1, ExtCtrls, Mask, JsEditCPF1, JsEdit1,
  JsEditInteiro1, func, untnfce;

type
  TForm12 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    cod: JsEditInteiro;
    nome: JsEdit;
    cnpj: JsEdit;
    ende: JsEdit;
    ToolBar1: TPanel;
    button: JsBotao;
    Label4: TLabel;
    bairro: JsEdit;
    tipo: JsEditInteiro;
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
  private
    procedure limpa();
    function insereCliente : String;
    procedure buscaCliente(cpf1 : String);
    { Private declarations }
  public
    codCliente : String;
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

uses untDtmMain;

{$R *.dfm}

procedure TForm12.limpa();
begin
end;

procedure TForm12.bairroKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    begin
      key := #0;
      limpa;
    end;

  if key = #13 then
    begin
      button.SetFocus;
    end;  
end;

procedure TForm12.buttonKeyPress(Sender: TObject; var Key: Char);
begin
  key := #0;
end;

function TForm12.insereCliente : String;
begin
  dtmmain.IBQuery1.Close;
  dtmMain.IBQuery1.SQL.Text := 'insert into';
end;

procedure TForm12.codKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 116) then
    begin

      tedit(sender).Text := localizar1('Localizar Cliente','cliente','cod,nome,telres,telcom,cnpj as cpfcnpj,bairro','cod','','nome','nome',false,false,false,'','',450, nil);
      key := 0;
    end;
end;

procedure TForm12.buttonClick(Sender: TObject);
begin
  codCliente := jsedit.GravaNoBD(self);
  cod.Text   := codCliente;
  JsEdit.SelecionaDoBD(self.Name);
  close;
end;

procedure TForm12.FormShow(Sender: TObject);
begin
  jsedit.SetTabelaDoBd(self, 'cliente', dtmMain.IBQuery1);
end;

procedure TForm12.numeroKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then button.SetFocus;
end;

procedure TForm12.cnpjKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      {if not testacpf(cnpj.Text) then
        begin
          MessageDlg('CPF Inv�lido!', mtError, [mbOK], 1);
          key := #0;
          abort;
          exit;
        end;}

      buscaCliente(cnpj.Text);
    end;
end;

procedure TForm12.nomeEnter(Sender: TObject);
begin
  codCliente := cod.Text;
end;

procedure TForm12.codKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure TForm12.FormCreate(Sender: TObject);
begin
  codCliente := '0';
end;

procedure TForm12.buscaCliente(cpf1 : String);
begin
  dtmMain.IBQuery1.Close;
  dtmMain.IBQuery1.SQL.Text := 'select cod, nome, ende, bairro from cliente where cnpj = :cnpj';
  dtmMain.IBQuery1.ParamByName('cnpj').AsString := cpf1;
  dtmMain.IBQuery1.Open;

  if dtmMain.IBQuery1.IsEmpty then
    begin
      dtmMain.IBQuery1.Close;
      exit;
    end;

  cod.Text    := dtmMain.IBQuery1.fieldbyname('cod').AsString;
  NOME.Text   := dtmMain.IBQuery1.fieldbyname('nome').AsString;
  ende.Text   := dtmMain.IBQuery1.fieldbyname('ende').AsString;
  bairro.Text := dtmMain.IBQuery1.fieldbyname('bairro').AsString;
  dtmMain.IBQuery1.Close;
end;

end.

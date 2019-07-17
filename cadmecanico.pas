unit cadmecanico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, JsBotao1,
  JsEdit1, JsEditInteiro1, Vcl.ExtCtrls, StrUtils;

type
  TForm80 = class(TForm)
    painel: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    cod: JsEditInteiro;
    nome: JsEdit;
    ToolBar1: TPanel;
    info: TLabel;
    JsBotao1: JsBotao;
    JsBotao2: JsBotao;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure codKeyPress(Sender: TObject; var Key: Char);
    procedure JsBotao1Click(Sender: TObject);
    procedure JsBotao2Click(Sender: TObject);
    procedure codEnter(Sender: TObject);
    procedure codKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form80: TForm80;

implementation

{$R *.dfm}

uses principal, Unit1, func;

procedure TForm80.codEnter(Sender: TObject);
var
  ultCod : integer;
begin
  ultCod := JsEdit.UltimoCodigoDaTabela(self.Name);
  info.Caption := ' F5 - Consulta    Ultimo Código: ' + inttostr(ultCod);
end;

procedure TForm80.codKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
  
end;

procedure TForm80.codKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = 116) then begin
    tedit(sender).Text := funcoes.localizar('Localizar ' + UpperCase(LeftStr(form22.nomesServico.Values['5'], 1)) + LowerCase(copy(form22.nomesServico.Values['5'], 2, 100)),'mecanico','cod,nome','cod','','nome','nome',true,false,false,'',300,nil);
  end;

end;

procedure TForm80.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  jsedit.LiberaMemoria(self);
end;

procedure TForm80.FormShow(Sender: TObject);
begin
  self.Caption := 'Cadastro de '+ UpperCase(LeftStr(form22.nomesServico.Values['5'], 1)) + LowerCase(copy(form22.nomesServico.Values['5'], 2, 100));
  JsEdit.SetTabelaDoBd(self,'mecanico', dm.IBQuery1);
end;

procedure TForm80.JsBotao1Click(Sender: TObject);
var
  mecanico : String;
begin
  if trim(nome.Text) = '' then begin
     ShowMessage('Nome Obrigatório');
     nome.SetFocus;
     exit;
   end;

  try
    JsEdit.GravaNoBD(self, true, '', false);
  except
    on e:exception do begin
      if contido('UNQ1_MECANICO', e.Message) then begin
        mecanico := UpperCase(LeftStr(form22.nomesServico.Values['5'], 1)) + LowerCase(copy(form22.nomesServico.Values['5'], 2, 100));
        MessageDlg('Não pode Existir mais de um ' + mecanico +
        ' Com o Nome ' + nome.Text + '. Esse ' + Mecanico +  ' Já Existe!', mtError, [mbok], 1);
        nome.SetFocus;
        exit;
      end
      else begin
        MessageDlg(e.Message, mtError, [mbok], 1);
      end;

    end;
  end;
end;

procedure TForm80.JsBotao2Click(Sender: TObject);
begin
  JsEdit.ExcluiDoBD(self.Name);
end;

end.

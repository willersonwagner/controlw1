unit unid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JsEditInteiro1, StdCtrls, JsEdit1, Buttons, JsBotao1, ExtCtrls,
  funcoesDAV;

type
  TForm47 = class(TForm)
    Label2: TLabel;
    Label1: TLabel;
    unid_ent: JsEdit;
    unid_sai: JsEdit;
    ToolBar1: TPanel;
    Label3: TLabel;
    JsBotao1: JsBotao;
    JsBotao2: JsBotao;
    procedure FormShow(Sender: TObject);
    procedure JsBotao1Click(Sender: TObject);
    procedure unid_entKeyPress(Sender: TObject; var Key: Char);
    procedure unid_entKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JsBotao2Click(Sender: TObject);
    procedure unid_saiKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private

    { Private declarations }
    unidadeMaxima : integer;
    procedure insere;
    function testaPodeInserirMenor144() : boolean;
    procedure buscar(const cod1 : String);
    procedure exclui(const cod1 : String);
  public
    { Public declarations }
  end;

var
  Form47: TForm47;

implementation

uses Unit1, func;

{$R *.dfm}
procedure TForm47.exclui(const cod1 : String);
begin
  dm.IBQuery2.Close;
  dm.IBQuery2.SQL.Clear;
  dm.IBQuery2.SQL.Add('delete from unid where nome = :nome');
  dm.IBQuery2.ParamByName('nome').AsString := cod1;
  dm.IBQuery2.ExecSQL;

  dm.IBQuery2.Transaction.Commit;

  unid_ent.Text := '';
  unid_sai.Text := '';
  unid_ent.SetFocus;
end;


procedure TForm47.buscar(const cod1 : String);
begin
  dm.IBQuery2.Close;
  dm.IBQuery2.SQL.Clear;
  dm.IBQuery2.SQL.Add('select * from unid where unid_ent = :nome');
  dm.IBQuery2.ParamByName('nome').AsString := cod1;
  dm.IBQuery2.Open;

  if dm.IBQuery2.IsEmpty then
    begin
      dm.IBselect.Close;
      //ShowMessage('Nenhum registro encontrado');
      exit;
    end;

  unid_sai.Text := dm.IBQuery2.fieldbyname('multiplo').AsString;
  dm.IBselect.Close;
end;


procedure TForm47.insere();
begin
  dm.IBQuery2.Close;
  dm.IBQuery2.SQL.Clear;
  dm.IBQuery2.SQL.Add('update or insert into unid(nome, unid_ent,unid_sai) values(:nome, :unid_ent,:unid_sai) matching(unid_ent, unid_sai)');
  dm.IBQuery2.ParamByName('nome').AsString      := unid_ent.Text + unid_sai.Text;
  dm.IBQuery2.ParamByName('unid_ent').AsString  := unid_ent.Text;
  dm.IBQuery2.ParamByName('unid_sai').AsString  := unid_sai.Text;
  dm.IBQuery2.ExecSQL;

  dm.IBQuery2.Transaction.Commit;
end;

procedure TForm47.FormShow(Sender: TObject);
begin
  unidadeMaxima := StrToIntDef(funcoes.buscaParamGeral(84, '144'), 144);
  JsEdit.SetTabelaDoBd(self,'unid', dm.IBQuery1);
end;

procedure TForm47.JsBotao1Click(Sender: TObject);
begin
  if testaPodeInserirMenor144 = false then begin
    MessageDlg('Valor Multiplicativo Inválido!' + #13 + 'Unidade Máxima: ' + IntToStr(unidadeMaxima), mtError, [mbOK], 1);
    unid_ent.SetFocus;
    exit;
  end;

  if Contido('-' + unid_sai.Text + '-', '-M2-M3-') = false then begin
    unid_sai.Text := SomenteLetras(unid_sai.Text);
  end;


  if unid_ent.Text = '' then begin
    unid_ent.SetFocus;
    exit;
  end;

  if unid_sai.Text = '' then begin
    unid_sai.SetFocus;
    exit;
  end;

  insere;
  unid_ent.Text := '';
  unid_sai.Text := '';
  unid_ent.SetFocus;
end;

procedure TForm47.unid_entKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    begin
      key := #0;
      Close;
    end;
  if key = #13 then
     begin
       buscar(unid_ent.Text);
       key := #0;
       unid_sai.SetFocus;
     end;
end;

procedure TForm47.unid_entKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 116 then
    begin
      tedit(sender).Text := funcoes.localizar('Localizar Unidades', 'unid', 'unid_ent, unid_sai', 'unid_ent', '', 'unid_ent', 'unid_ent', false, false, false, '', 0, sender);
    end;
end;

procedure TForm47.JsBotao2Click(Sender: TObject);
begin
  exclui(unid_ent.Text);
end;

procedure TForm47.unid_saiKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    begin
      key := #0;
      unid_ent.SetFocus;
    end;
end;

procedure TForm47.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  JsEdit.LiberaMemoria(self);
end;

function TForm47.testaPodeInserirMenor144() : boolean;
begin
  //Result := true;
  //exit;
  Result := false;
  if StrToIntDef(strnum1(unid_ent.Text), 0) > unidadeMaxima then begin
    exit;
  end;

  Result := true;
end;

end.

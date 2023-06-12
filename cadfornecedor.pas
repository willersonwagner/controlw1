unit cadfornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ToolWin, ComCtrls, StdCtrls, JsEditTexto1, JsEdit1,
  JsEditInteiro1, ExtCtrls, JsBotao1, Mask, JsEditCNPJ1;

type
  TForm8 = class(TForm)
    painel: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    ToolBar1: TPanel;
    cod: JsEditInteiro;
    nome: JsEdit;
    tipo: JsEditInteiro;
    cnpj: JsEditCNPJ;
    ies: JsEdit;
    suframa: JsEdit;
    endereco: JsEdit;
    bairro: JsEdit;
    Label3: TLabel;
    cep: JsEdit;
    estado: JsEdit;
    cidade: JsEdit;
    fone: JsEdit;
    fax: JsEdit;
    contato: JsEdit;
    obs: JsEdit;
    JsBotao1: JsBotao;
    JsBotao2: JsBotao;
    info: TLabel;
    cod_mun: JsEdit;
    Label4: TLabel;
    procedure codKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JsBotao1Click(Sender: TObject);
    procedure JsBotao2Click(Sender: TObject);
    procedure codKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure codEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tipoKeyPress(Sender: TObject; var Key: Char);
    procedure estadoKeyPress(Sender: TObject; var Key: Char);
    procedure cidadeKeyPress(Sender: TObject; var Key: Char);
    procedure nomeEnter(Sender: TObject);
    procedure cnpjKeyPress(Sender: TObject; var Key: Char);
  private
    codestado,nome1 : string;
    novoCod, ultCod : integer;
    componente_a_retornar : JsEdit;
    procedure setmask();
    function validaDados() : boolean;
    function buscaFornecedor() : boolean;
    { Private declarations }
  public
    valor_a_retornar : string;
    procedure setComponente_a_Retornar(componente : jsedit);
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

uses Unit1, localizar, func, caixaLista, principal;

{$R *.dfm}

procedure TForm8.codKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #27 then Close;
 if (key = #13) then
    begin
      valor_a_retornar := tedit(sender).Text;
    end;
end;

procedure TForm8.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if componente_a_retornar <> nil then
    begin
      componente_a_retornar.Text := valor_a_retornar;
    end;
   JsEdit.LiberaMemoria(self);
end;

procedure TForm8.JsBotao1Click(Sender: TObject);
begin
  if not validaDados then exit;

  nome.Text := funcoes.LimpaNomes(nome.Text);

  valor_a_retornar := JsEdit.GravaNoBD(self);
end;

procedure TForm8.JsBotao2Click(Sender: TObject);
begin
  JsEdit.ExcluiDoBD(self.Name);
end;

procedure TForm8.codKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key = 116) then
   begin
    tedit(sender).Text := funcoes.localizar('Localizar Fornecedor','fornecedor','cod,nome, cnpj, estado','cod','','nome','nome',true,false,false,'',300, nil);
   end;
end;

procedure TForm8.codEnter(Sender: TObject);
begin
  ultCod := JsEdit.UltimoCodigoDaTabela(self.Name);
  info.Caption := ' F5 - Consulta    Ultimo C�digo: ' + inttostr(ultCod);
end;

procedure TForm8.FormShow(Sender: TObject);
begin
  JsEdit.SetTabelaDoBd(self,'fornecedor', dm.IBQuery1);
end;

procedure TForm8.tipoKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) then
  begin
    if((tedit(sender).Text='0') or (tedit(sender).Text='')) then
      begin
        form39 := tform39.Create(self);
        form39.ListBox1.Items.Add('1 - PESSOA F�SICA');
        form39.ListBox1.Items.Add('2 - PESSOA JUR�DICA');
        tedit(sender).Text := funcoes.lista(Sender, false);
      end;

  setmask();
 end;

end;

procedure TForm8.estadoKeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13) and  (tedit(sender).Text <> '') then
  begin
    dm.IBselect.Close;
    dm.IBselect.SQL.Clear;
    dm.IBselect.SQL.Add('select * from estados where nome = :nome');
    dm.IBselect.ParamByName('nome').AsString := tedit(sender).Text;
    dm.IBselect.Open;

    if dm.IBselect.IsEmpty then
      begin
        dm.IBselect.Close;
        ShowMessage('Estado N�o Encontrado.');
        exit;
      end;

    codEstado := dm.IBselect.fieldByName('cod').AsString;
  end;

if (key=#13) and (tedit(sender).Text='') then
  begin
   nome1 := funcoes.localizar('Localizar Estado','Estados','cod,nome','cod,nome','cod','nome','nome',false,false,false,'',300,nil);
   tedit(sender).Text := copy(nome1,pos('-',nome1)+1,length(nome1));
   codEstado := copy(nome1,1,pos('-',nome1)-1);
   key := #0;
  end;

end;

procedure TForm8.cidadeKeyPress(Sender: TObject; var Key: Char);
begin
{if (key=#13) and (tedit(sender).Text <> '') then
  begin
    dm.IBselect.Close;
    dm.IBselect.SQL.Clear;
    dm.IBselect.SQL.Add('select * from municipios_ibge where nome = :nome');
    dm.IBselect.ParamByName('nome').AsString := tedit(sender).Text;
    dm.IBselect.Open;

    if dm.IBselect.IsEmpty then
      begin
        dm.IBselect.Close;
        ShowMessage('Munic�pio N�o Encontrado.');
        exit;
      end;

    cod_mun.Text := dm.IBselect.fieldByName('cod').AsString;
  end;

 }

if (key=#13) and (tedit(sender).Text = '') then
  begin
    tedit(sender).Text := funcoes.localizar('Localizar Municipio','municipios_ibge','cod,nome','cod,nome','','nome','nome',false,false,false,' where cod like('+QuotedStr(codEstado+'%')+')',300,nil);

    if (tedit(sender).Text <> '') then
      begin
        cod_mun.Text := copy(tedit(sender).Text, 1, pos('-', tedit(sender).Text) -1);
        tedit(sender).Text := copy(tedit(sender).Text, pos('-', tedit(sender).Text) + 1, length(tedit(sender).Text));
      end;

    {dm.IBselect.Close;
    dm.IBselect.SQL.Clear;
    dm.IBselect.SQL.Add('select * from municipios_ibge where nome = :nome');
    dm.IBselect.ParamByName('nome').AsString := tedit(sender).Text;
    dm.IBselect.Open;

    cod_mun.Text := dm.IBselect.fieldByName('cod').AsString;
    dm.IBselect.Close;
    }key := #0;
  end;

end;

procedure TForm8.setComponente_a_Retornar(componente : jsedit);
begin
  componente_a_retornar := componente;
end;

procedure TForm8.setmask();
begin
  if tipo.Text = '1' then
    begin
      cnpj.EditMask := '!999.999.999-99;1;_';
      Label6.Caption := 'CPF:';
    end
  else
    begin
      cnpj.EditMask := '!99.999.999/9999-99;1;_';
      Label6.Caption := 'CNPJ:';
    end;
end;

procedure TForm8.nomeEnter(Sender: TObject);
begin
  if cod.Text = '' then cod.Text := '0';

  if ((cod.Text <> '') or (cod.Text <> '0')) then
    begin
      valor_a_retornar := cod.Text;
    end;

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select cnpj from fornecedor where cod = :cod');
  dm.IBselect.ParamByName('cod').AsString := strnum(cod.Text);
  dm.IBselect.Open;

  if Length(StrNum(dm.IBselect.fieldbyname('cnpj').AsString)) = 14 then tipo.Text := '2';
  setmask();
  cnpj.Text := dm.IBselect.fieldbyname('cnpj').AsString;
end;

procedure TForm8.cnpjKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      buscaFornecedor;


      ies.SetFocus;
    end;
end;

function TForm8.validaDados() : boolean;
begin
  Result := false;
  if nome.Text = '' then
     begin
       ShowMessage('Campo NOME Obrigat�rio');
       nome.SetFocus;
       exit;
     end;

   if (usaSped) then begin
     if (length(StrNum(cnpj.Text)) = 14) then begin
       if not ValidaCNPJ(StrNum(cnpj.Text)) then begin
         ShowMessage('CNPJ Inv�lido!');
         cnpj.SetFocus;
         exit;
       end;

       if not funcoes.Inscricao(ies.Text, estado.Text) then begin
         ShowMessage('Inscri��o Estadual Inv�lida!');
         ies.SetFocus;
         exit;
       end;
     end;

     if (length(StrNum(cnpj.Text)) = 11) then begin
       if not testacpf(StrNum(cnpj.Text)) then begin
         ShowMessage('CPF Inv�lido!');
         cnpj.SetFocus;
         exit;
       end;

       if tipo.Text = '6' then begin
         if not funcoes.Inscricao(ies.Text, estado.Text) then begin
           ShowMessage('Inscri��o Estadual Inv�lida!');
           ies.SetFocus;
           exit;
         end;
       end;
     end;

     if cod_mun.Text = '' then begin
       ShowMessage('C�digo Municipal Inv�lido, Procure o estado e cidade pelo ControlW ou Preencha o C�digo do municipio!');
       estado.Text := '';
       estado.SetFocus;
       exit;
     end;

     if endereco.Text = '' then begin
       ShowMessage('Endere�o Inv�lido!');
       endereco.SetFocus;
       exit;
     end;

     if bairro.Text = '' then begin
       ShowMessage('Bairro Inv�lido!');
       bairro.SetFocus;
       exit;
     end;

     if cep.Text = '' then begin
       ShowMessage('CEP Inv�lido!');
       cep.SetFocus;
       exit;
     end;
   end;

  Result := true;
end;

function TForm8.buscaFornecedor() : boolean;
begin
  Result := false;
  if cod.Text <> '0' then exit;
  if strnum(cnpj.Text) = '0' then exit;

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select * from FORNECEDOR where cnpj = :cnpj';
  dm.IBselect.ParamByName('cnpj').AsString := cnpj.Text;
  dm.IBselect.Open;

  if dm.IBselect.IsEmpty then begin
    dm.IBselect.Close;
    exit;
  end;

  ShowMessage('Foi Encontrado um Fornecedor com o CNPJ ' + cnpj.Text + ' e o Sistema ir� Recuperar o Cadastro!');
  cod.Text := dm.IBselect.FieldByName('cod').AsString;

  Result := true;
  JsEdit.SelecionaDoBD(self.Name);
  dm.IBselect.Close;
end;

end.





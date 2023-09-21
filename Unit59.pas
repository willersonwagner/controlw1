unit Unit59;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, JsBotao1, JsEditNumero1,
  Mask, JsEditData1, JsEdit1, JsEditInteiro1, ExtCtrls, DB;

type
  TlancContasPagar = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    nomegrupo: TLabel;
    GroupBox3: TGroupBox;
    nomehis: TLabel;
    Label5: TLabel;
    cod: JsEditInteiro;
    codgru: JsEdit;
    vencimento: JsEditData;
    documento: JsEditInteiro;
    GroupBox1: TGroupBox;
    codhis: JsEditInteiro;
    historico: JsEdit;
    valor: JsEditNumero;
    ToolBar1: TPanel;
    info: TLabel;
    JsBotao1: JsBotao;
    DBGrid1: TDBGrid;
    DATA: JsEditData;
    USUARIO: JsEditInteiro;
    pago: JsEditNumero;
    total: JsEditNumero;
    fornec: JsEditInteiro;
    JsBotao2: JsBotao;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JsBotao1Click(Sender: TObject);
    procedure codKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure codgruKeyPress(Sender: TObject; var Key: Char);
    procedure codKeyPress(Sender: TObject; var Key: Char);
    procedure documentoKeyPress(Sender: TObject; var Key: Char);
    procedure codhisKeyPress(Sender: TObject; var Key: Char);
    procedure historicoKeyPress(Sender: TObject; var Key: Char);
    procedure valorKeyPress(Sender: TObject; var Key: Char);
    procedure JsBotao2Click(Sender: TObject);
    procedure codEnter(Sender: TObject);
    procedure historicoEnter(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    localizaGrupo:string;
    localizaHis, fornece : string;
    procedure abreDataSet();
    procedure buscaContaPeloNumeroDeDocumento(codigo : String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  lancContasPagar: TlancContasPagar;

implementation

uses Unit1, func, principal;

{$R *.dfm}

procedure TlancContasPagar.FormShow(Sender: TObject);
begin
  DBGrid1.Width := self.Width - 10;
  DBGrid1.Left  := 5;
  jsedit.SetTabelaDoBd(self, 'contaspagar', dm.IBQuery2, 'cod');
  abreDataSet;
end;

procedure TlancContasPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  jsedit.LiberaMemoria(self);
end;

procedure TlancContasPagar.JsBotao1Click(Sender: TObject);
begin
  if trim(historico.Text) = '' then
    begin
      historico.SetFocus;
      exit;
    end;
  if valor.getValor = 0  then
    begin
      valor.SetFocus;
      exit;
    end;

  total.setValor(valor.getValor);
  DATA.Text := FormatDateTime('dd/mm/yyyy', form22.datamov);
  USUARIO.Text := StrNum(form22.codusario);
  JsEdit.GravaNoBD(self, true, 'small');
  abreDataSet;
end;

procedure TlancContasPagar.codKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 116 then
    begin
      cod.Text := funcoes.localizar('Localizar Contas a Pagar','contaspagar','codgru as grupo,vencimento,documento,codhis as nrdocumento,historico,total','cod','documento','historico','data',true,true,true,'where pago=0',500,sender);
      abreDataSet;
    end;
end;

procedure TlancContasPagar.codgruKeyPress(Sender: TObject; var Key: Char);
begin
if (tedit(sender).Text='') and  (key=#13) then
  begin
    localizaGrupo := funcoes.localizar('Localizar Grupo','grupodecaixa','cod,grupo','cod,grupo','','grupo','grupo',false,false,false,'',0,sender);
    tedit(sender).Text := copy(localizaGrupo,1,pos('-',localizaGrupo)-1);
    nomegrupo.Caption:= copy(localizaGrupo,pos('-',localizaGrupo)+1,length(localizaGrupo)) ;
  end;

if (tedit(sender).Text<>'') and  (key=#13) then
  begin
    dm.IBQuery1.SQL.Clear;
    dm.IBQuery1.SQL.Add('select grupo from grupodecaixa where cod=:cod');
    dm.IBQuery1.ParamByName('cod').AsString := StrNum(tedit(sender).Text);
    try
    dm.IBQuery1.Open ;
    if dm.IBQuery1.FieldByName('grupo').AsString<>'' then nomegrupo.Caption:= dm.IBQuery1.FieldByName('grupo').AsString
      else
        begin
          nomegrupo.Caption:='NÃO ENCONTRADO';
          key := #0 ;
        end;
    except
     ShowMessage('Código Inválido!');
     key:=#0;
     tedit(sender).SetFocus;
     tedit(sender).SelectAll;
    end;
     dm.IBQuery1.Close;
  end;
  
  if (tedit(sender).Text = '') and (key = #13) then key := #0;
end;

procedure TlancContasPagar.codKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure TlancContasPagar.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then Key := 0;

  if key = 46 then begin
    cod.Text := DBGrid1.DataSource.DataSet.FieldByName('cod').AsString;
    jsedit.ExcluiDoBD(self.Name);
    abreDataSet;
  end;
end;

procedure TlancContasPagar.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    cod.Enabled := true;
    cod.SetFocus;
  end;
end;

procedure TlancContasPagar.documentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key=#13) then
   begin
     if (tedit(sender).Text = '') then
       begin
         tedit(sender).Text := funcoes.novocod('cpagar');
       end
     else
       begin
         buscaContaPeloNumeroDeDocumento(tedit(sender).Text);
       end;
   end;
end;

procedure TlancContasPagar.codhisKeyPress(Sender: TObject; var Key: Char);
begin
  if (codhis.Text<>'') and  (key=#13) then
  begin
    dm.IBQuery1.SQL.Clear;
    dm.IBQuery1.SQL.Add('select grupo from hiscaixa where cod = '+strnum(codhis.Text));
    try
    dm.IBQuery1.Open
    except
    end;
    if dm.IBQuery1.FieldByName('grupo').AsString<>'' then nomehis.Caption:= dm.IBQuery1.FieldByName('grupo').AsString
      else
        begin
          nomehis.Caption:='NÃO ENCONTRADO';
          key := #0;
        end;
    dm.IBQuery1.Close;
   end;

if (tedit(sender).Text = '') and  (key=#13) then
  begin
    localizaHis:= funcoes.localizar('Localizar Histórico','hiscaixa','cod,grupo','cod,grupo','','grupo','grupo',false,false,false,'',0,sender);
    TEdit(Sender).Text := copy(localizaHis,1,pos('-',localizaHis)-1);
    nomehis.Caption:= copy(localizaHis,pos('-',localizaHis)+1,length(localizaHis)) ;
  end;
if (tedit(sender).Text = '') and  (key=#13) then key := #0;

if key = #13 then
    begin
      if tedit(sender).Text = '101' then
        begin
          fornece := funcoes.dialogo('generico',90,'1234567890'+#8, 90, false,'','Control For Windows','Qual o Cód. do Fornecedor ?','') ;
          if fornece = '*' then exit;
         // if StrNum(fornece) <> '0' then
           // begin
              fornec.Text := fornece;
              historico.Text := funcoes.localizar1('Localizar Fornecedores','fornecedor','cod, nome','nome','','nome','nome',true,false,false,'cod', StrNum(fornece),0,sender);
              self.Caption := 'Lançamento de Contas a Pagar - Fornecedor: ' + historico.Text;
            //end;
        end;
    end;
end;

procedure TlancContasPagar.historicoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) and (historico.Text = '') then  //and (codhis.Text = '101') alterado Josenir 19/01/16
    begin
      //historico.Text := copy(funcoes.localizar('Localizar Fornecedores','fornecedor','cod, nome','nome','','nome','nome',false,false,false,'',0,sender), 1, 35);
      historico.Text := funcoes.localizar1('Localizar Fornecedores','fornecedor','cod, nome','nome','','nome','nome',false,false,false,'cod', StrNum(fornece),0,sender);
      Key := #0;
    end;
end;

procedure TlancContasPagar.valorKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      if valor.getValor = 0 then
        begin
          key := #0;
          abort;
          exit;
        end;

      JsBotao1.SetFocus;  
    end;
end;

procedure TlancContasPagar.abreDataSet();
begin
  DBGrid1.DataSource := DataSource1;
  DBGrid1.DataSource.DataSet := dm.IBselect;

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := ('select first 100 cod,codgru as grupo,vencimento,documento,codhis as nrdocumento,historico,total from contaspagar where (pago=0) order by cod desc');
  //dm.IBselect.ParamByName('data').AsDateTime:= form22.datamov;
  dm.IBselect.Open;
  funcoes.FormataCampos(dm.IBselect, 2, '', 2);

  funcoes.alinhabdgrid(DBGrid1);
end;

procedure TlancContasPagar.JsBotao2Click(Sender: TObject);
begin
  jsedit.ExcluiDoBD(self.Name);
  abreDataSet;
end;

procedure TlancContasPagar.codEnter(Sender: TObject);
begin
  info.Caption := 'F5 - Consulta   Ult. Código: ' + IntToStr(jsedit.UltimoCodigoDaTabela(self.Name, 'small'));
end;

procedure TlancContasPagar.buscaContaPeloNumeroDeDocumento(codigo : String);
var
  ret : String;
begin
  if funcoes.buscaParamGeral(78, '') = 'N' then exit;
  

  dm.IBQuery2.Close;
  dm.IBQuery2.SQL.Text := 'select cod,documento, data, historico, valor from CONTASPAGAR where documento = :doc';
  dm.IBQuery2.ParamByName('doc').AsInteger := StrToIntDef(codigo, -1);
  dm.IBQuery2.Open;
  dm.IBQuery2.FetchAll;

  if dm.IBQuery2.RecordCount > 0 then
    begin
      ret := funcoes.busca(dm.IBQuery2, '','cod', 'cod', '');

      if ret <> '' then
        begin
          dm.IBQuery2.Close;
          dm.IBQuery2.SQL.Text := 'select cod,codgru, vencimento, documento, data, codhis, historico, valor from CONTASPAGAR where cod = :cod';
          dm.IBQuery2.ParamByName('cod').AsInteger := StrToIntDef(ret, -1);
          dm.IBQuery2.Open;

          cod.Text        := dm.IBQuery2.fieldbyname('cod').AsString;
          codgru.Text     := dm.IBQuery2.fieldbyname('codgru').AsString;
          vencimento.Text := FormatDateTime('dd/mm/yyyy', dm.IBQuery2.fieldbyname('vencimento').AsDateTime);
          codhis.Text     := dm.IBQuery2.fieldbyname('codhis').AsString;
          historico.Text  := dm.IBQuery2.fieldbyname('historico').AsString;
          valor.setValor(dm.IBQuery2.fieldbyname('valor').AsCurrency);
        end;
    end;

  dm.IBQuery2.Close;
end;

procedure TlancContasPagar.historicoEnter(Sender: TObject);
begin
  tedit(sender).SelStart := 0;
end;

end.

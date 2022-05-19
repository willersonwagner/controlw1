unit acerto1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JsEdit1, JsEditInteiro1, Buttons, JsBotao1, ExtCtrls,
  Grids, DBGrids, JsEditNumero1, Mask, JsEditData1, DB, untnfceForm;

type
  Tacerto = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DOCUMENTO: JsEditInteiro;
    CODIGO: JsEditInteiro;
    QUANT: JsEditNumero;
    DEPOSITO: JsEditNumero;
    NOME: JsEdit;
    ToolBar1: TPanel;
    JsBotao1: JsBotao;
    DBGrid1: TDBGrid;
    nomeProduto: TLabel;
    DataSource1: TDataSource;
    Label33: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure JsBotao1Click(Sender: TObject);
    procedure DOCUMENTOKeyPress(Sender: TObject; var Key: Char);
    procedure CODIGOKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DOCUMENTOKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    quant1, deposito1 : currency;
    cod, ultCod, usarAcerto : String;
    codigos : TStringList;
    procedure abreDataSet(const cod : string = '');
    procedure gravaAcerto();
    procedure deletaAcerto();
    procedure limpaTela(completo : boolean = false);
    function procuraExiste(const cod1 : String) : boolean;
    procedure adicionaCodigo();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  acerto: Tacerto;

implementation

uses Unit1, principal, func, StrUtils, consulta;

{$R *.dfm}
procedure Tacerto.limpaTela(completo : boolean = false);
begin
  CODIGO.Text   := '';
  QUANT.Text    := '0,00';
  DEPOSITO.Text := '0,00';
  nome.Text     := '';

  if completo then
    begin
      documento.Text := '';
      DOCUMENTO.SetFocus;
    end
  else
    begin
      CODIGO.SetFocus;
    end;
end;

procedure Tacerto.gravaAcerto();
var
  totA : currency;
begin

  if cod = '' then exit;
  if dm.IBQuery1.Transaction.Active then dm.IBQuery1.Transaction.Commit;
  dm.IBQuery1.Transaction.StartTransaction;

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select quant, deposito from produto where cod = :cod';
  dm.IBselect.ParamByName('cod').AsInteger := CODIGO.getValor;
  dm.IBselect.Open;

  quant1    := dm.IBselect.FieldByName('quant').AsCurrency;
  deposito1 := dm.IBselect.FieldByName('deposito').AsCurrency;
  dm.IBselect.Close;

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text := 'insert into acerto(QTD_ACERTO, DEPOSITO_ACERTO, ESTOQUE_ATUAL, DEPOSITO_ATUAL, ACERTO_SEQ, DOCUMENTO, DATA, CODIGO, NOME, QUANT,' +
  ' DEPOSITO, USUARIO) values(:QTD_ACERTO,:DEPOSITO_ACERTO, :ESTOQUE_ATUAL, :DEPOSITO_ATUAL, '+ Incrementa_Generator('ACERTO_SEQ', 1) +',:DOCUMENTO, :DATA, :CODIGO, :NOME, :QUANT,:DEPOSITO, :USUARIO)';
  dm.IBQuery1.ParamByName('QTD_ACERTO').AsCurrency       := quant.getValor;
  dm.IBQuery1.ParamByName('DEPOSITO_ACERTO').AsCurrency  := DEPOSITO.getValor;
  dm.IBQuery1.ParamByName('ESTOQUE_ATUAL').AsCurrency    := quant1;
  dm.IBQuery1.ParamByName('DEPOSITO_ATUAL').AsCurrency   := deposito1;
  dm.IBQuery1.ParamByName('DOCUMENTO').AsString  := DOCUMENTO.Text;
  dm.IBQuery1.ParamByName('DATA').AsDate         := form22.datamov;
  dm.IBQuery1.ParamByName('CODIGO').AsInteger     := StrToIntDef(COD, -1);
  dm.IBQuery1.ParamByName('NOME').AsString       := NOME.Text;
  dm.IBQuery1.ParamByName('QUANT').AsCurrency    := quant.getValor - quant1;
  dm.IBQuery1.ParamByName('DEPOSITO').AsCurrency := DEPOSITO.getValor - deposito1;
  dm.IBQuery1.ParamByName('USUARIO').AsString    := form22.codusario;
  dm.IBQuery1.ExecSQL;

  dm.IBQuery1.Transaction.Commit;
end;

procedure Tacerto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  jsedit.LiberaMemoria(self);
end;

procedure Tacerto.FormShow(Sender: TObject);
begin
  jsedit.SetTabelaDoBd(self, 'ACERTO', dm.IBQuery1, 'DOCUMENTO');
  label2.Caption := FormatDateTime('dd/mm/yyyy',form22.datamov);
  abreDataSet('-1');
end;

procedure Tacerto.JsBotao1Click(Sender: TObject);
var
  totA : currency;
begin
  totA := abs(quant.getValor - quant1) + abs(DEPOSITO.getValor - deposito1);

  if trim(DOCUMENTO.Text) = '' then begin
    DOCUMENTO.Text := IntToStr(StrToIntDef(Incrementa_Generator('acerto', 1), 0));
  end;

  if tota = 0 then
    begin
      ShowMessage('Verifique as Quantidades!');
      quant.SetFocus;
      exit;
    end;

  gravaAcerto();
  limpaTela();
  abreDataSet();
end;

procedure Tacerto.DOCUMENTOKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
  if key = #13 then
    begin
      if DOCUMENTO.Text = '' then
        begin
          DOCUMENTO.Text := IntToStr(StrToIntDef(Incrementa_Generator('acerto', 1), 0));
        end;

      abreDataSet();
    end;
end;

procedure Tacerto.CODIGOKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
     { if usarAcerto = 'S' then
        begin
          if codi
          CODIGO.Text := '';
          key := #0;
          exit;
        end;}
        
      if CODIGO.Text = '' then
        begin
          if funcoes.buscaParamGeral(46, '') = 'S' then begin
            form24.cosultaRetorna := true;
            form24.BuscaCOd := (codUlt);
            form24.ShowModal;

            if form24.retorno <> '*' then begin
               CODIGO.Text := form24.retorno;
            end;
          end
          else CODIGO.Text := funcoes.localizar('Localizar Produto','produto','cod, nome,quant, p_venda as preco, localiza as localizacao','cod','','nome','nome',false,false,false,'',600, nil);

          if CODIGO.Text = '' then
            begin
              key := #0;
              exit;
            end;
        end;

      if CODIGO.Text <> '' then
        begin
          COD := funcoes.buscaProdutoCodCodBar(CODIGO.Text);
          if COD = '' then
            begin
              nomeProduto.Caption := 'Produto N�o Encontrado';
              CODIGO.SelectAll;
              key := #0;
              exit;
            end;

{          if procuraExiste(cod) then
            begin
              MessageDlg('Produto j� Existe Nesta Lista!' + #13 + 'C�d: ' + CODIGO.Text, mtWarning, [mbOK], 1);
              dm.IBQuery4.Locate('codigo', COD, []);
              codigo.Text := '';
              DBGrid1.SetFocus;
              key := #0;
              exit;
            end;
 }
{          dm.IBselect.Close;
          if Length(codigo.Text) > 6 then
            begin
              dm.IBselect.SQL.Text := 'select nome,quant, deposito from produto where cod = :cod';
          dm.IBselect.SQL.Text := 'select nome,quant, deposito from produto where cod = :cod';
          dm.IBselect.ParamByName('cod').AsString := codigo.Text;
          dm.IBselect.Open;

          if dm.IBselect.IsEmpty then
            begin
              nomeProduto.Caption := 'Produto N�o Encontrado';
              CODIGO.SelectAll;
              key := #0;
              exit;
            end;           }



          quant1    := dm.IBselect.fieldbyname('quant').AsCurrency;
          deposito1 := dm.IBselect.fieldbyname('deposito').AsCurrency;
          quant.Text    := FormatCurr('#,###,###0.000', quant1);
          DEPOSITO.Text := FormatCurr('#,###,###0.000', deposito1);
          nomeProduto.Caption := dm.IBselect.fieldbyname('nome').AsString;
          dm.IBselect.Close;  
        end;
    end;
end;

procedure Tacerto.abreDataSet(const cod : string = '');
begin
  dm.IBQuery4.Close;
  dm.IBQuery4.SQL.Text := 'select a.CODIGO, p.nome, a.QUANT as estoque, a.DEPOSITO, u.nome as usuario, a.ACERTO_SEQ from acerto a left join produto p on (a.codigo = p.cod) left join  ' +
  ' usuario u on (u.cod = a.usuario) where a.documento = :cod';
  dm.IBQuery4.ParamByName('cod').AsString := IfThen(cod <> '', cod, DOCUMENTO.Text);
  dm.IBQuery4.Open;
  dm.IBQuery4.Last;

  dm.IBQuery4.FieldByName('ACERTO_SEQ').Visible := false;

  funcoes.FormataCampos(dm.IBQuery4, 3, '', 3);

  DBGrid1.DataSource.DataSet := dm.IBQuery4;
  ShowScrollBar(DBGrid1.handle, SB_HORZ, False);
  ShowScrollBar(DBGrid1.handle, SB_BOTH, False);
end;

function Tacerto.procuraExiste(const cod1 : String) : boolean;
begin
  dm.IBQuery2.Close;
  dm.IBQuery2.SQL.Text := 'select documento, codigo from acerto where (documento = :doc) and (codigo = :cod)';
  dm.IBQuery2.ParamByName('doc').AsString := DOCUMENTO.Text;
  dm.IBQuery2.ParamByName('cod').AsString := COD1;
  dm.IBQuery2.Open;

  if dm.IBQuery2.IsEmpty then Result := false
   else Result := true;
  dm.IBQuery2.Close;
end;

procedure Tacerto.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if ((key = #13) or (key = #27)) then CODIGO.SetFocus;
end;

procedure Tacerto.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 46 then
    begin
      deletaAcerto();
    end;
end;

procedure Tacerto.deletaAcerto();
var
  quant2, depo1 : currency;
  sim           : string;
  codig1, codseq        : integer;
begin
  sim := funcoes.dialogo('generico',0,'SN'+#8,0,false,'S','Control For Windows','Deseja Excluir Este Lan�amento ? S/N:' + #13 + dm.IBQuery4.fieldbyname('codigo').AsString + ' - ' + dm.IBQuery4.fieldbyname('nome').AsString,'N') ;
  if ((sim = '*') or (sim = 'N')) then exit;

  quant2   := dm.IBQuery4.fieldbyname('estoque').AsCurrency;
  depo1    := dm.IBQuery4.fieldbyname('deposito').AsCurrency;
  codig1   := dm.IBQuery4.fieldbyname('codigo').AsInteger ;
  codseq   := dm.IBQuery4.fieldbyname('ACERTO_SEQ').AsInteger ;

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text := 'delete from acerto where (ACERTO_SEQ = :cod)';
  dm.IBQuery1.ParamByName('cod').AsInteger    := codseq;
  dm.IBQuery1.ExecSQL;
  dm.IBQuery1.Transaction.Commit;
  abreDataSet();
  CODIGO.SetFocus;
end;

procedure Tacerto.adicionaCodigo();
begin
  codigos.Values[CODIGO.Text] := IntToStr(StrToIntDef(codigos.Values[CODIGO.Text],0) + 1);
  quant.Text := codigos.Values[CODIGO.Text];
  ultCod := CODIGO.Text;
end;

procedure Tacerto.DOCUMENTOKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 116 then
    begin
      DOCUMENTO.Text := funcoes.localizar('Localizar Acerto','acerto a left join produto p on (a.codigo = p.cod)','documento,data, cod, p.nome,a.quant as loja, a.deposito, a.usuario','documento','','acerto_seq','acerto_seq',false,false,false,'',600, nil);
    end;
end;

end.

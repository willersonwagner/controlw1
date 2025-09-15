unit garantias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Data.DB, untnfceForm, DateUtils, System.StrUtils;

type
  TForm93 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    tipo, filtro : String;
    procedure abreDataSet;
    procedure lancaGarantia;
    procedure baixaGagantia;
    procedure excluiGarantia;
    procedure impLancamento;
    procedure RelGarantiaPorUsuario;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form93: TForm93;

implementation

{$R *.dfm}

uses Unit1, func, consulta, principal, buscaSelecao, relatorio, imprime1;

procedure TForm93.abreDataSet;
begin
  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select i.cod_seq,i.cod_prod, p.nome, p.p_compra as p_venda, i.quant, p.codbar as refori, p.fornec ||''-''||f.nome as fornec, i.data_criacao, i.data_finalizado,  case I.estado WHEN ''1'' THEN ''PENDENTE'' WHEN ''2'' THEN ''FINALIZADO'' END,'+
  ' i.usuario, i.usu_finalizado, i.nota from GARANTIA I'+
  ' LEFT JOIN PRODUTO P ON (P.COD = I.COD_PROD) left join fornecedor f on (f.cod = p.fornec) ' + filtro;
  try
  dm.IBselect.Open;
  except
    on e:exception do begin
      ShowMessage('erro47: ' + e.Message);
      exit;
    end;

  end;

  dm.IBselect.FieldByName('cod_prod').DisplayLabel := 'Código Produto';
  dm.IBselect.FieldByName('nome').DisplayLabel     := 'Descrição';
  dm.IBselect.FieldByName('case').DisplayLabel     := 'Estado';
  dm.IBselect.FieldByName('usuario').DisplayLabel  := 'Usuário';
  dm.IBselect.FieldByName('data_criacao').DisplayLabel     := 'Data de Criação';
  dm.IBselect.FieldByName('data_finalizado').DisplayLabel  := 'Data Concluído';
  dm.IBselect.FieldByName('usu_finalizado').DisplayLabel   := 'Usuário Baixa';
  dm.IBselect.FieldByName('fornec').DisplayLabel           := 'Fornecedor';
  TCurrencyField(dm.IBselect.FieldByName('quant')).DisplayFormat :='#,###,###0.00';
  dm.IBselect.FieldByName('fornec').DisplayLabel           := 'Fornecedor';
  dm.IBselect.FieldByName('cod_seq').Visible               := false;
  dm.IBselect.FieldByName('p_venda').Visible               := false;
  //dm.IBselect.FieldByName('p_compra').Visible               := false;

  DataSource1.DataSet := dm.IBselect;

  funcoes.BuscaResizeDBgrid(DBGrid1, 'FORM93');
end;

procedure TForm93.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if DBGrid1.DataSource.DataSet.FieldByName('case').AsString = 'PENDENTE' then begin
      DBGrid1.Canvas.brush.Color := HexToTColor('F08080'); // Cor da célula
      DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end

end;

procedure TForm93.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
  if key = #13 then begin
    baixaGagantia;
  end;

end;

procedure TForm93.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then begin
    excluiGarantia;
  end;

  if key = VK_F2 then begin
    lancaGarantia;
  end;

  if key = VK_F3 then begin
    if filtro = '' then filtro := ' where i.estado = ''1'''
    else filtro := '';
    abreDataSet;
  end;

  if key = VK_F4 then begin
    if filtro = '' then filtro := ' where i.estado = ''2'''
    else filtro := '';
    abreDataSet;
  end;

  if key = VK_F6 then begin
    RelGarantiaPorUsuario;
  end;
end;

procedure TForm93.FormCreate(Sender: TObject);
begin
  filtro := '';
end;

procedure TForm93.FormShow(Sender: TObject);
begin
  abreDataSet;
end;

procedure TForm93.lancaGarantia;
var
  cod, quant, nota, codGarantia : String;
  p_venda : currency;
begin
  nota := funcoes.dialogo('generico', 0, '1234567890' + #8, 100, False, '',
      Application.Title, 'Informe o Número Da Nota:', nota);
  if (nota = '*') or (nota = '') then exit;

  dm.IBselect2.Close;
  dm.IBselect2.SQL.text :=('select p.cod_seq, p.cod, c.codbar as refori, c.nome, p.quant, c.p_compra as p_venda, p.total, p.nota from item_venda p left join produto c on (c.cod = p.cod) where (p.nota = :nota)');
  dm.IBselect2.ParamByName('nota').AsString := strnum(nota);
  dm.IBselect2.Open;

  dm.IBselect2.FieldByName('cod_seq').Visible := false;
  TCurrencyField(dm.IBselect2.FieldByName('quant')).DisplayFormat :='#,###,###0.00';

  form33 := tform33.Create(self);
  form33.campolocalizaca := 'cod_seq';
  funcoes.CtrlResize(TForm(form33));
  form33.DataSource1.DataSet := dm.IBselect2;
  form33.DBGrid1.DataSource := form33.DataSource1;
  form33.ShowModal;

  if ((funcoes.retornoLocalizar = '*')or (funcoes.retornoLocalizar = '')) then begin
    exit;
  end;

  cod   := dm.IBselect2.FieldByName('cod').AsString;
  quant := formataCurrency(dm.IBselect2.FieldByName('quant').AsCurrency);
  p_venda :=  dm.IBselect2.FieldByName('p_venda').AsCurrency;
  dm.IBselect2.Close;

  quant := funcoes.dialogo('numero', 2, 'SN', 2, false, 'S', 'Control for Windows:', 'Quantidade:', quant );
  if quant = '*' then exit;

  form33.Free;

 
  {if funcoes.buscaParamGeral(46, 'N') = 'S' then begin
    form24.cosultaRetorna := true;
    form24.BuscaCOd := (codUlt);
    form24.ShowModal;

    if form24.retorno = '*' then exit;
    cod := form24.retorno;
  end
    else begin
      cod := funcoes.localizar1('Localizar Produto','produto','cod, nome,quant, p_venda as preco ','cod','','nome','nome',false,false,false,'cod', cod,600,NIL);
      if ((cod = '*') or (cod = '')) then exit;
    end;

  quant :=  funcoes.dialogo('numero', 2, 'SN', 2, false, 'S',
        'Control for Windows:', 'Quantidade:', '1,00' );
 }
  codGarantia := Incrementa_Generator('garantia', 1);

  dm.IBQuery1.close;
  dm.IBQuery1.SQL.Text := 'insert into garantia(cod_seq,nota, quant, cod_prod, data_criacao, usuario, valor, estado) values(:cod_seq,:nota, :quant, :cod_prod, :data_criacao, :usuario, :valor, ''1'')';
  dm.IBQuery1.ParamByName('cod_seq').AsString        := codGarantia;
  dm.IBQuery1.ParamByName('nota').AsString           := nota;
  dm.IBQuery1.ParamByName('quant').AsCurrency        := StrToCurr(quant);
  dm.IBQuery1.ParamByName('cod_prod').AsString       := cod;
  dm.IBQuery1.ParamByName('data_criacao').AsDateTime := DateOf(form22.datamov) + TimeOf(now);
  dm.IBQuery1.ParamByName('usuario').AsString        := form22.codusario;
  dm.IBQuery1.ParamByName('valor').AsCurrency        := p_venda;
  dm.IBQuery1.ExecSQL;
  dm.IBQuery1.Transaction.Commit;

  abreDataSet;

  DBGrid1.DataSource.DataSet.Locate('cod_seq', codGarantia, []);
  impLancamento;
end;

procedure TForm93.baixaGagantia;
var
  cod : String;
begin
  if DBGrid1.DataSource.DataSet.FieldByName('case').AsString = 'FINALIZADO' then begin
    exit;
  end;

  cod := funcoes.dialogo('normal', 0, 'SN', 30, false, 'S', application.Title,
    'Deseja Finalizar o processo de garantia como Concluido (S/N)?', 'S');
  if cod = '*' then exit;

  cod := DBGrid1.DataSource.DataSet.FieldByName('cod_seq').AsString;
  dm.IBQuery1.close;
  dm.IBQuery1.SQL.Text := 'update garantia set DATA_FINALIZADO = :DATA_FINALIZADO, estado = :estado, USU_FINALIZADO = :USUARIO where cod_seq = :cod';
  dm.IBQuery1.ParamByName('DATA_FINALIZADO').AsDateTime := DateOf(form22.datamov) + TimeOf(now);
  dm.IBQuery1.ParamByName('estado').AsString            := '2';
  dm.IBQuery1.ParamByName('usuario').AsString           := form22.codusario;
  dm.IBQuery1.ParamByName('cod').AsString               := cod;
  dm.IBQuery1.ExecSQL;
  dm.IBQuery1.Transaction.Commit;

  abreDataSet;

  DBGrid1.DataSource.DataSet.Locate('cod_seq', cod, []);
end;


procedure TForm93.excluiGarantia;
var
  cod : String;
begin
  if DBGrid1.DataSource.DataSet.FieldByName('case').AsString = 'FINALIZADO' then begin
    ShowMessage('Esse produto já foi concluído e nao pode ser excluido!');
    exit;
  end;

  cod := funcoes.dialogo('normal', 0, 'SN', 30, false, 'S', application.Title,
    'Deseja Excluir o Registro do produto '+DBGrid1.DataSource.DataSet.FieldByName('nome').AsString+' (S/N)?', 'S');
  if ((cod = '*') or (cod = 'N')) then exit;



  cod := DBGrid1.DataSource.DataSet.FieldByName('cod_seq').AsString;
  dm.IBQuery1.close;
  dm.IBQuery1.SQL.Text := 'delete from garantia where cod_seq = :cod';
  dm.IBQuery1.ParamByName('cod').AsString               := cod;
  dm.IBQuery1.ExecSQL;
  dm.IBQuery1.Transaction.Commit;

  abreDataSet;

  DBGrid1.DataSource.DataSet.Locate('cod_seq', cod, []);
end;


procedure TForm93.impLancamento;
begin
  form19.RichEdit1.Clear;
  addRelatorioForm19(CompletaOuRepete('','','-', 39) + CRLF);
  addRelatorioForm19('|'+funcoes.centraliza(form22.Pgerais.Values['empresa'], ' ', 37) + '|' + CRLF);
  addRelatorioForm19('|'+funcoes.centraliza('COMPROVANTE DE GARANTIA', ' ', 37) + '|' + CRLF);
  addRelatorioForm19(CompletaOuRepete('','','-', 39) + CRLF);
  addRelatorioForm19('Codigo    Descricao'+ #13 + #10);
  addRelatorioForm19('*                  Quant   V.Unit Total'+ #13 + #10);

  addRelatorioForm19(funcoes.CompletaOuRepete(copy(DBGrid1.DataSource.DataSet.FieldByName('REFORI').AsString + '-' + DBGrid1.DataSource.DataSet.FieldByName
  ('nome').AsString, 1, 39), '', ' ', 39) + CRLF);
  addRelatorioForm19(funcoes.CompletaOuRepete(LeftStr(DBGrid1.DataSource.DataSet.FieldByName('COD_PROD').AsString, 14), '',
  ' ', 14) + funcoes.CompletaOuRepete('', FormatCurr('0.00',
  DBGrid1.DataSource.DataSet.FieldByName('quant').AsCurrency), ' ', 9) +
  funcoes.CompletaOuRepete('', FormatCurr('0.00',
  DBGrid1.DataSource.DataSet.FieldByName('p_venda').AsCurrency), ' ', 8) +
  funcoes.CompletaOuRepete('', FormatCurr('0.00', Arredonda(DBGrid1.DataSource.DataSet.FieldByName('quant').AsCurrency * DBGrid1.DataSource.DataSet.FieldByName('p_venda').AsCurrency, 2)), ' ',8) + CRLF);
  addRelatorioForm19(CompletaOuRepete('','','-', 39) + CRLF);
  addRelatorioForm19('|'+funcoes.centraliza('ASSINATURA', ' ', 37) + '|' + CRLF);
  addRelatorioForm19(CompletaOuRepete('|', '|', ' ', 39) + CRLF);
  addRelatorioForm19(CompletaOuRepete('','','-', 39) + CRLF);


  imprime.textx('');

end;


procedure TForm93.RelGarantiaPorUsuario;
var
  usuario, ini, fim, resumo : String;
  qtd, total, tot_prod : currency;
begin
  usuario := funcoes.dialogo('generico', 0, '1234567890' + #8, 100, False, '',
      Application.Title, 'Qual o Numero do Usuario:', usuario);
  if (usuario = '*') or (usuario = '') then exit;

  resumo := funcoes.dialogo('generico', 0, 'SN', 20, False, 'S', Application.Title,
    'Deseja imprimir somente o resumo ?', 'N');
  if resumo = '*' then
    exit;

  ini := funcoes.dialogo('data', 0, '', 2, true, '', Application.Title,
    'Qual a Data Inicial?', '');
  if ini = '*' then
    exit;
  fim := funcoes.dialogo('data', 0, '', 2, true, '', Application.Title,
    'Qual a Data Final?', '');
  if fim = '*' then
    exit;


  dm.IBselect2.Close;
  dm.IBselect2.SQL.Text := 'select g.cod_prod, g.nota, p.codbar as refori, p.nome, g.valor as p_venda, g.quant  from GARANTIA g join produto p on (p.cod = g.cod_prod) where ((g.usuario = :usu) and'+
  '(cast(g.DATA_FINALIZADO as date) >= :ini) and (cast(g.DATA_FINALIZADO as date) <= :fim) )';
  dm.IBselect2.ParamByName('usu').AsString := StrNum(usuario);
  dm.IBselect2.ParamByName('ini').AsDateTime := StrToDate(ini);
  dm.IBselect2.ParamByName('fim').AsDateTime := StrToDate(fim);
  dm.IBselect2.Open;

  if dm.IBselect2.IsEmpty then begin
    ShowMessage('Nenhum registro Encontrado!');
    dm.IBselect2.Close;
    exit;
  end;

  total := 0;
  qtd   := 0;

  form19.RichEdit1.Clear;
  addRelatorioForm19(CompletaOuRepete('','','-', 39) + CRLF);
  addRelatorioForm19('|'+funcoes.centraliza(form22.Pgerais.Values['empresa'], ' ', 37) + '|' + CRLF);
  addRelatorioForm19('|'+funcoes.centraliza('Relatorio de Garantias', ' ', 37) + '|' + CRLF);
  addRelatorioForm19('|'+funcoes.centraliza('Usuario: ' + usuario, ' ', 37) + '|' + CRLF);
  addRelatorioForm19(CompletaOuRepete('','','-', 39) + CRLF);
  addRelatorioForm19('Codigo    Descricao'+ #13 + #10);
  addRelatorioForm19('*                  Quant   V.Unit Total'+ #13 + #10);


  while not dm.IBselect2.Eof do begin
    tot_prod := Arredonda(dm.IBselect2.FieldByName('quant').AsCurrency * dm.IBselect2.FieldByName('p_venda').AsCurrency, 2);

    if resumo  = 'N' then begin
      addRelatorioForm19(funcoes.CompletaOuRepete(copy(dm.IBselect2.FieldByName('REFORI').AsString + '-' + dm.IBselect2.FieldByName
      ('nome').AsString, 1, 39), '', ' ', 39) + CRLF);
      addRelatorioForm19(funcoes.CompletaOuRepete(LeftStr(dm.IBselect2.FieldByName('COD_PROD').AsString, 14), '',
      ' ', 14) + funcoes.CompletaOuRepete('', FormatCurr('0.00',
      dm.IBselect2.FieldByName('quant').AsCurrency), ' ', 9) +
      funcoes.CompletaOuRepete('', FormatCurr('0.00',
      dm.IBselect2.FieldByName('p_venda').AsCurrency), ' ', 8) +
      funcoes.CompletaOuRepete('', FormatCurr('0.00', tot_prod), ' ',8) + CRLF);
      addRelatorioForm19(CompletaOuRepete('','','-', 39) + CRLF);
    end;

    qtd   := qtd + dm.IBselect2.FieldByName('quant').AsCurrency;
    total := total + tot_prod;

    dm.IBselect2.Next;
  {addRelatorioForm19('|'+funcoes.centraliza('ASSINATURA', ' ', 37) + '|' + CRLF);
  addRelatorioForm19(CompletaOuRepete('|', '|', ' ', 39) + CRLF);
  addRelatorioForm19(CompletaOuRepete('','','-', 39) + CRLF);
  }end;

  addRelatorioForm19(CompletaOuRepete('Tot Qtd:', formataCurrency(qtd), '.', 19) +' '+ CompletaOuRepete('Tot Reais:', formataCurrency(total), '.', 19));


  form19.ShowModal;

end;


end.












unit Unit89;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, System.DateUtils, System.StrUtils;

type
  TForm89 = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure abreDataSet();
    procedure abreDataSetConcluidos();
    procedure lancaEntrega;
    procedure somamov;
    procedure pagamento;
    { Private declarations }
  public
    dini, dfim : string;
    { Public declarations }
  end;

var
  Form89: TForm89;



implementation

uses Unit1, principal, func, Unit90, buscaSelecao;

procedure TForm89.abreDataSet();
begin
  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select v.nota, v.total, v.hora as hora_venda, v.data, v.ende_entrega, e.taxa, e.endereco, e.cliente, e.telefone, c.data_entrega from venda v left join ENTREGA e on (e.cod = v.ende_entrega)'+
  'left join entrega_novo c on (c.numvenda = v.nota) where ((v.data >= :ini) and (v.data <= :fim)) and ((v.total = 0.01) or (v.total >= 100)) and (v.ende_entrega > 0) and (c.data_entrega is null) and (v.cancelado = 0) order by nota desc';
  dm.IBselect.ParamByName('ini').AsDateTime := StrToDate(dini);
  dm.IBselect.ParamByName('fim').AsDateTime := StrToDate(dfim);
  dm.IBselect.Open;

  dm.IBselect.FieldByName('ende_entrega').Visible                := false;
  dm.IBselect.FieldByName('data').Visible                        := false;
  TcurrencyField(dm.IBselect.FieldByName('total')).DisplayFormat :='###,##0.00';
  TcurrencyField(dm.IBselect.FieldByName('taxa')).DisplayFormat :='###,##0.00';

  DataSource1.DataSet := dm.IBselect;
end;

procedure TForm89.abreDataSetConcluidos();
begin
  dm.IBselect1.Close;
  dm.IBselect1.SQL.Text := 'select v.nota, d.nome, c.usuario_baixa, v.total, v.data, v.hora as hora_venda, v.ende_entrega, e.endereco, e.cliente, e.telefone, c.data_entrega, c.valor from venda v left join ENTREGA e on (e.cod = v.ende_entrega)'+
  'left join entrega_novo c on (c.numvenda = v.nota) left join entregador d on (d.cod = c.usuario_baixa)  where ((cast(c.data_entrega as date) >= :ini) and (cast(c.data_entrega as date) <= :fim)) '+
  'and v.ende_entrega > 0 and not(c.data_entrega is null) and (c.finalizado is null) and (v.cancelado = 0) order by c.data_entrega desc';
  dm.IBselect1.ParamByName('ini').AsDateTime := StrToDate(dini);
  dm.IBselect1.ParamByName('fim').AsDateTime := StrToDate(dfim);
  dm.IBselect1.Open;

  dm.IBselect1.FieldByName('usuario_baixa').Visible := false;
  dm.IBselect1.FieldByName('ende_entrega').Visible  := false;
  dm.IBselect1.FieldByName('data').Visible          := false;
  TcurrencyField(dm.IBselect1.FieldByName('total')).DisplayFormat :='###,##0.00';

  DataSource2.DataSet := dm.IBselect1;
end;


procedure TForm89.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 119 then
    begin
      DBGrid2.SetFocus; // F8
    end;

  if (Shift = [ssCtrl]) and (Key = 46) then Key := 0;
end;

procedure TForm89.DBGrid1KeyPress(Sender: TObject; var Key: Char);
var
  nota : String;
begin
  if key = #13 then begin
    lancaEntrega;
  end;

  if key = #32 then begin
    if DBGrid1.SelectedField.DisplayLabel = 'NOTA' then BEGIN
      nota := funcoes.dialogo('generico', 3, '1234567890' + #8, 50, false,'', application.Title, 'Qual o Numero da Venda?', '');
      if ((nota = '') or (nota = '*')) then exit;

      if DBGrid1.DataSource.DataSet.Locate('nota', strnum(nota), []) = false then begin
        ShowMessage('Nota não Encontrada!');
      end;
    END;
  end;
end;

procedure TForm89.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then Key := 0;
end;

procedure TForm89.DBGrid2KeyPress(Sender: TObject; var Key: Char);
var
  id : integer;
  cod_entreg : String;
begin
  if UpCase(key) = 'T' then begin
    somamov;
  end;

  if key = #13 then begin
    id := MessageDlg('Deseja Concluir a Entrega da Venda '  + dm.IBselect1.FieldByName('nota').AsString +' ?', mtConfirmation, [mbYes, mbNo],1, mbNo);
    if id = IDNO then exit;

    cod_entreg := funcoes.localizar1('Localizar Entregador','entregador','cod,nome','cod','','nome','nome',false,false,false,'cod', dm.IBselect1.FieldByName('usuario_baixa').AsString ,300,NIL);
    if ((cod_entreg = '') or (cod_entreg = '*')) then exit;

    dm.IBQuery1.Close;
    dm.IBQuery1.SQL.Text := 'update entrega_novo set finalizado = ''1'', usuario_baixa = '+StrNum(cod_entreg)+'  where numvenda = '+ dm.IBselect1.FieldByName('nota').AsString;
    dm.IBQuery1.ExecSQL;
    dm.IBQuery1.Transaction.Commit;

    abreDataSetConcluidos;
  end;

end;

{$R *.dfm}

procedure TForm89.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 113 then begin
    try
       DBGrid1.DataSource := nil;
       funcoes.relEntregador('','','', false);
    finally
      DBGrid1.DataSource := dm.ds1;
    end;
    abreDataSet;
    abreDataSetConcluidos;
  end;

  if key = 114 then begin
     try
       DBGrid1.DataSource := nil;
       pagamento;

     finally
       DBGrid1.DataSource := dm.ds1;
       abreDataSet;
       abreDataSetConcluidos;
     end;
  end;

  if key = 116 then begin
    abreDataSet;
    abreDataSetConcluidos;
  end;
end;

procedure TForm89.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    if DBGrid1.Focused = false then begin
      DBGrid1.SetFocus;
      exit;
    end;

    close;
  end;
end;

procedure TForm89.FormShow(Sender: TObject);
begin
  abreDataSet;
  abreDataSetConcluidos;

  self.Width := trunc(screen.Width -  (screen.Width * (0.05))) ;
end;

procedure TForm89.lancaEntrega;
var
  cod_entreg, valor : String;
begin
  dm.IBselect3.Close;
  dm.IBselect3.SQL.Text := 'select numvenda from entrega_novo where numvenda = :nota';
  dm.IBselect3.ParamByName('nota').AsInteger := dm.IBselect.FieldByName('nota').AsInteger;
  dm.IBselect3.Open;

  if dm.IBselect3.IsEmpty = false then begin
    abreDataSet;
    abreDataSetConcluidos;
    exit;
  end;

  if dm.IBselect.IsEmpty then exit;

  cod_entreg := funcoes.localizar('Localizar Entregador','entregador','cod,nome','cod','','nome','nome',false,false,false,'',300,NIL);
  if cod_entreg = '*' then exit;
  if cod_entreg = '' then exit;


  form90 := tform90.create(self);
  form90.ShowModal;

  valor := form90.ComboBox1.Text;
  if form90.retorno = 'N' then begin
    form90.Free;
    exit;
  end;

  form90.Free;

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text := 'insert into ENTREGA_NOVO(cod,USUARIO_BAIXA, numvenda, datavenda, USUARIO_INCLUIU, DATA_ENTREGA, valor) values(' +
  'gen_id(entrega_novo, 1), :USUARIO_BAIXA, :numvenda, :datavenda, :USUARIO_INCLUIU, :DATA_ENTREGA, :valor)';
  dm.IBQuery1.ParamByName('USUARIO_BAIXA').AsString   := strnum(cod_entreg);
  dm.IBQuery1.ParamByName('numvenda').AsString        := dm.IBselect.FieldByName('nota').AsString;
  dm.IBQuery1.ParamByName('USUARIO_INCLUIU').AsString := StrNum(form22.codusario);
  dm.IBQuery1.ParamByName('DATA_ENTREGA').AsDateTime  := DateOf(form22.datamov) + timeof(now) ;
  dm.IBQuery1.ParamByName('valor').AsFloat            := StrToFloatDef(valor,0);
  dm.IBQuery1.ExecSQL;
  dm.IBQuery1.Transaction.Commit;

  abreDataSet;
  abreDataSetConcluidos;

  //funcoes.dialogo('generico', 100, '1234567890' + #8, 100, false, '',application.Title, 'Qual o valor da entrega ?()', '');

end;

procedure TForm89.somamov;
var
  lista, nomes : TStringList;
  i : integer;
  codentr, rel : String;
  total : currency;
begin
  total := 0;
  lista := TStringList.Create;
  nomes := TStringList.Create;
  i := dm.IBselect1.RecNo;

  dm.IBselect1.DisableControls;

  dm.IBselect1.First;
  while not dm.IBselect1.Eof do begin
    codentr := strnum(dm.IBselect1.FieldByName('USUARIO_BAIXA').AsString);
    lista.Values[codentr] := CurrToStr(StrToCurrDef(lista.Values[codentr], 0) + dm.IBselect1.FieldByName('valor').AsCurrency);
    if nomes.Values[codentr] = '' then nomes.Values[codentr] := dm.IBselect1.FieldByName('nome').AsString;

    total := total + dm.IBselect1.FieldByName('valor').AsCurrency;

    dm.IBselect1.Next;
  end;

  dm.IBselect1.RecNo := i;
  dm.IBselect1.EnableControls;

  rel := '';
  for i := 0 to lista.Count -1 do begin
    rel := rel + CompletaOuRepete(leftstr(lista.Names[i]+'-' + nomes.Values[lista.Names[i]], 30), '', '.', 30)  + CompletaOuRepete('', formataCurrency(StrToCurrDef(lista.ValueFromIndex[i], 0)), '.', 13) + #13;
  end;

  //ShowMessage(lista.Text + #13 + #13  + nomes.Text);
  funcoes.Mensagem('Soma Por Entregador - ControlW Sistemas', rel,9,'Courier New',true,0,clBlack, false);
end;

procedure TForm89.pagamento;
var
  ini, fim, cod, ultcod, hist, pagto, mincod, cods, codCaixa : String;
  valor : currency;
  id : integer;
begin
  ini := funcoes.dialogo('data', 0, '', 2, true, '', application.Title,'Qual a Data Inicial?', formataDataDDMMYY(form22.datamov));
  if ini = '*' then
    exit;

  fim := funcoes.dialogo('data', 0, '', 2, true, '', application.Title,'Qual a Data Final?', formataDataDDMMYY(form22.datamov));
  if fim = '*' then exit;

  if StrToDate(ini) < (form22.datamov - 5) then begin
    ShowMessage('Data Inválida, Preencha a Data corretamente!');
    exit;
  end;

  {dm.IBselect2.Close;
  dm.IBselect2.SQL.Text := 'select e.usuario_baixa as entregador, c.nome, min(e.cod) as cod1, max(e.cod) as cod, sum(e.valor) as valor  from entrega_novo e left join entregador c on (c.cod = e.usuario_baixa) where ((cast(e.data_entrega as date) >= :ini) and '+
  '(cast(e.data_entrega as date) <= :fim)) and (DATAHPAGTO is null) group by e.usuario_baixa, c.nome';
  dm.IBselect2.ParamByName('ini').AsDateTime := StrToDate(ini);
  dm.IBselect2.ParamByName('fim').AsDateTime := StrToDate(fim);
  dm.IBselect2.Open;

  dm.IBselect2.FieldByName('cod').Visible := false;
  dm.IBselect2.FieldByName('cod1').Visible := false;
  TCurrencyField(dm.IBselect2.FieldByName('valor')).DisplayFormat :='#,###,###0.00';

  //ini := funcoes.busca(dm.IBselect2, 'entregador1', 'entregador', 'entregador', '');
  form33 := tform33.Create(self);
  form33.campolocalizaca := 'entregador';
  funcoes.CtrlResize(TForm(form33));
  form33.DataSource1.DataSet := dm.IBselect2;
  form33.DBGrid1.DataSource := form33.DataSource1;
  form33.ShowModal;

  if funcoes.retornoLocalizar = '*' then begin
    form33.Free;
    exit;
  end;

  form33.Free;    }


  funcoes.relEntregador(ini, fim, '', true);

  if ((funcoes.retornoLocalizar = '*')or (funcoes.retornoLocalizar = '')) then begin
    exit;
  end;

  cod    := dm.ClientDataSet1.FieldByName('entregador').AsString;
  //ultcod := dm.ClientDataSet1.FieldByName('cod').AsString;
  //mincod := dm.ClientDataSet1.FieldByName('cod1').AsString;
  valor  := dm.ClientDataSet1.FieldByName('valor').AsCurrency;
  cods   := dm.ClientDataSet1.FieldByName('cods').AsString;

  if ini = '' then exit;

  id := MessageDlg('Deseja Efetuar o Pagamento de ' + formataCurrency(valor)+ ' para ' + dm.ClientDataSet1.FieldByName('entregador').AsString +'-' + dm.ClientDataSet1.FieldByName('nome').AsString +' ?', mtConfirmation, [mbYes, mbNo],1, mbNo);

  if id = IDNO then begin
    dm.IBselect2.Close;
    exit;
  end;

  hist  := 'PAGAMENTO ENTREGADOR '+ ini + '-' + dm.ClientDataSet1.FieldByName('nome').AsString;
  //pagto := funcoes.LerFormPato(1, 'Forma de Pagamento', false);
  pagto := funcoes.LerFormPato(0, 'Forma de Pagamento', false);

  codCaixa := Incrementa_Generator('movcaixa', 1);

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text := 'update or insert into caixa(formpagto,codgru,codmov,vencimento, datamov,data,documento,codhis,historico,saida,usuario, tipo, fornec)'+
      ' values (:pagto,1,'+codCaixa+',:ini, :fim,:data,'+StrNum(cod)+',1,'+QuotedStr(hist)+',:pago,'+StrNum(form22.codusario)+', ''X'', 0) matching (codmov)';
  dm.IBQuery1.ParamByName('pagto').AsInteger := StrToIntDef(pagto, 1);
  dm.IBQuery1.ParamByName('ini').AsDateTime := StrToDate(ini);
  dm.IBQuery1.ParamByName('fim').AsDateTime := StrToDate(fim);
  dm.IBQuery1.ParamByName('data').AsDateTime := DateOf(form22.datamov) + timeof(now) ;
  dm.IBQuery1.ParamByName('pago').AsCurrency := valor;
  try
    dm.IBQuery1.ExecSQL;
  except
    on e:exception do begin
      dm.IBQuery1.Transaction.Rollback;
       gravaErrosNoArquivo('erro350: ' + e.Message, self.Name, '350','update entrega_novo set DATAHPAGTO = :data, USUARIOPAGTO');
      ShowMessage('erro350: ' + e.Message);
      exit;
    end;
  end;

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text := 'update entrega_novo set DATAHPAGTO = :data, USUARIOPAGTO = ' + StrNum(form22.codusario) + ' where usuario_baixa = :usu and ('+QuotedStr(cods)+' like ''%-''||cod||''-%'')';
  dm.IBQuery1.ParamByName('data').AsDateTime  := DateOf(form22.datamov) + timeof(now) ;
  dm.IBQuery1.ParamByName('usu').AsInteger    := StrToIntDef(cod, 0);
  //dm.IBQuery1.ParamByName('ini').AsDate       := StrToDate(ini);
  //dm.IBQuery1.ParamByName('fim').AsDate       := StrToDate(fim);
  try
    dm.IBQuery1.ExecSQL;
  except
    on e:exception do begin
      dm.IBQuery1.Transaction.Rollback;
      gravaErrosNoArquivo('erro288: ' + e.Message, self.Name, '288','update entrega_novo set DATAHPAGTO = :data, USUARIOPAGTO');
      ShowMessage('erro288: ' + e.Message);
      exit;
    end;
  end;

  dm.IBQuery1.Transaction.Commit;


  //ShowMessage(ini + #13 + ultcod + #13 + CurrToStr(valor));
end;



end.

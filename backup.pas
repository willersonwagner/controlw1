unit backup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Data.DB, Datasnap.DBClient, func,
DateUtils, Vcl.ExtCtrls;

type
  TForm44 = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    Timer1: TTimer;
    TimerBuscaProdutos: TTimer;
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure TimerBuscaProdutosTimer(Sender: TObject);
  private
    function buscaVenda : String;
    function buscaEnrtada : String;
    procedure acertarTamanhoDBGRID1();
    procedure abreDataSet(refresh1 : boolean = false);
    procedure limpaVendas();
    procedure entregaProduto;
    procedure excluiEntrega;
    procedure criaDataSetVendaEntrega;
    { Private declarations }
  public
    retorno : TStringList;
    entrada : boolean;
    listaEntrega : TStringList;
    opcao   : SmallInt;
    nota, procura    : String;
    function buscaVendaMADE : String;
    function getRetorno : TStringList;
    procedure abreDataSetEntrega(refresh1 : boolean = false);
    procedure abreDataSetEntregaMademato(refresh1 : boolean = false);
    { Public declarations }
  end;

var
  Form44: TForm44;

implementation


uses Unit1, principal, Unit89, Unit2;

{$R *.dfm}
function TForm44.getRetorno : TStringList;
begin
  if funcoes.Contido('entrada', dm.IBselect.SQL.GetText) then
    begin
      retorno := TStringList.Create;
      retorno.Add(DBGrid1.DataSource.DataSet.fieldbyname('nota').AsString);
      exit;
    end;

  retorno := TStringList.Create;
  retorno.Add(DBGrid1.DataSource.DataSet.fieldbyname('formapagto').AsString);
  retorno.Add(DBGrid1.DataSource.DataSet.fieldbyname('total').AsString);
  retorno.Add(DBGrid1.DataSource.DataSet.fieldbyname('nota').AsString);
end;

function TForm44.buscaVenda : String;
begin
  if entrada then
    begin
      dm.IBselect.Close;
      dm.IBselect.SQL.Clear;
      dm.IBselect.SQL.Add('select p.cod, c.nome, p.quant, p.p_compra, p.total from item_entrada p, produto c where (c.cod = p.cod) and (p.nota = :nota)');
      dm.IBselect.ParamByName('nota').AsString := StrNum(DBGrid1.DataSource.DataSet.fieldbyname('nota').AsString);
      dm.IBselect.Open;
      funcoes.FormataCampos(dm.ibselect, 2,'quant',2);

       TCurrencyField(dm.IBselect.FieldByName('quant')).DisplayFormat := '###,##0.00' ;
      exit;
    end;

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select p.cod, c.nome, p.quant, p.p_venda, p.total from item_venda p left join produto c on (c.cod = p.cod) where (p.nota = :nota)');
  dm.IBselect.ParamByName('nota').AsString := strnum(DBGrid1.DataSource.DataSet.fieldbyname('nota').AsString);
  dm.IBselect.Open;
  funcoes.FormataCampos(dm.ibselect, 2,'quant',2);
  TCurrencyField(dm.IBselect.FieldByName('quant')).DisplayFormat := '###,##0.00' ;
end;

function TForm44.buscaVendaMADE : String;
begin
  dm.IBselect.Close;
  dm.IBselect.SQL.Text := ('select p.cod, p.codbar, c.nome, p.quant, p.p_venda, p.total from item_venda p, produto c where (c.cod = p.cod) and (p.nota = :nota)');
  
  dm.IBselect.ParamByName('nota').AsString := strnum(DBGrid1.DataSource.DataSet.fieldbyname('NUMVENDA').AsString);
  dm.IBselect.Open;
  funcoes.FormataCampos(dm.ibselect, 2,'',2);

  TCurrencyField(dm.IBselect.FieldByName('quant')).DisplayFormat := '###,##0.00' ;

  DBGrid2.DataSource := dm.ds1;
end;

procedure TForm44.DBGrid1KeyPress(Sender: TObject; var Key: Char);
var
  nota1, codbar : String;
  kay1 : char;
begin
  if entrada then begin
    if key = #13 then begin
      funcoes.retornoLocalizar := DBGrid1.DataSource.DataSet.FieldByName('nota').AsString;
      close;
    end;

    if key = #27  then begin
      funcoes.retornoLocalizar := '';
      close;
    end;
  end;

  key := UpCase(key);

  if opcao = 3 then begin //entrega de produtos MADEMATO
    if key = #27 then begin
      close;
      exit;
    end;

    if key = #13 then begin
      if MessageDlg('Deseja Baixar o Registro de Entrega Referente a Venda '+DBGrid1.DataSource.DataSet.FieldByName('numvenda').AsString+' ?',mtConfirmation, [mbYes, mbNo], 0, mbNo) = idyes then begin
        dm.IBQuery1.Close;
        dm.IBQuery1.SQL.Text := 'update entrega_novo set usuario_baixa = :usu, data_entrega = :data where cod = :cod';
        dm.IBQuery1.ParamByName('usu').AsInteger := StrToIntDef(form22.codusario, 0);
        dm.IBQuery1.ParamByName('data').AsDateTime := DateOf(form22.datamov) + TimeOf(NOW);
        dm.IBQuery1.ParamByName('cod').AsInteger   := DBGrid1.DataSource.DataSet.FieldByName('cod').AsInteger;
        dm.IBQuery1.ExecSQL;
        dm.IBQuery1.Transaction.Commit;

        abreDataSetEntregaMademato;
        buscaVendaMADE;
      end;
    end;
    exit;
  end;

  if opcao = 2 then begin //entrega de produtos
     if key = #32 then begin
       if funcoes.buscaParamGeral(131, 'N') = 'S' then begin
         codbar := funcoes.dialogo('generico', 100, '1234567890' + #8, 100, false, '',application.Title, 'Qual o Cód. de Barras ?', '');
         if ((codbar = '') or (codbar = '*')) then exit;

         if DBGrid1.DataSource.DataSet.Locate('codbar', codbar, []) = false then begin
           ShowMessage('Produto nâo localizado ou já foi entregue!' + #13 +'Código:' + codbar);
           exit;
         end;

         ShowMessage('Código Seq.: '+ DBGrid1.DataSource.DataSet.FieldByName('cod').AsString + #13 +
                     'Cód. Barras: '+ DBGrid1.DataSource.DataSet.FieldByName('nome').AsString + #13 +
                     'Cód. Barras: '+ DBGrid1.DataSource.DataSet.FieldByName('codbar').AsString + #13 +
                     'Quantidade.: '+ DBGrid1.DataSource.DataSet.FieldByName('quant').AsString + #13 );

         entregaProduto;
       end;
     end;


     if key = #13 then begin
       if funcoes.buscaParamGeral(131, 'N') = 'S' then begin
         codbar := procura;
         if trim(codbar) = '' then exit;
         
         if DBGrid1.DataSource.DataSet.Locate('codbar', codbar, []) = false then begin
           ShowMessage('Produto nâo localizado ou já foi entregue!' + #13 +'Código:' + codbar);
           exit;
         end;

         ShowMessage('Código Seq.: '+ DBGrid1.DataSource.DataSet.FieldByName('cod').AsString + #13 +
                     'Cód. Barras: '+ DBGrid1.DataSource.DataSet.FieldByName('codbar').AsString + #13 +
                     'Quantidade.: '+ DBGrid1.DataSource.DataSet.FieldByName('quant').AsString + #13 );

         entregaProduto;

         exit;
       end;
       entregaProduto;
       exit;
     end;

      if key = #27 then begin
        close;
        exit;
      end;
    exit;
  end;

  if opcao = 1 then begin //busca venda pra gerar cupom
    if key = 'C' then begin
      nota1 := DBGrid1.DataSource.DataSet.fieldbyname('nota').AsString;

      try
        form22.enviNFCe(nota1);

      except
      end;

      abreDataSet();
      funcoes.FormataCampos(dm.ibquery2,2,'',2);

      DBGrid1.DataSource.DataSet.Locate('nota', nota1, []);
      buscaVenda;
    end;

    if key = #27 then begin
      funcoes.retornoLocalizar := '*';
     // dm.IBQuery2.Close;
      dm.IBselect.Close;
      close;
    end;


    if key = #13 then begin
      funcoes.retornoLocalizar := DBGrid1.DataSource.DataSet.fieldbyname('nota').AsString;
      if funcoes.retornoLocalizar = '' then
        begin
          abreDataSet(true);
          exit;
        end;
      getRetorno;
      //dm.IBQuery2.Close;
      dm.IBselect.Close;
      close;
    end;
  end;
end;

procedure TForm44.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  cod : String;
begin

  if key = 113 then begin
    if entrada then begin
      if DBGrid1.SelectedField.DisplayLabel = 'NOTA' then BEGIN
        cod := funcoes.dialogo('generico',100,'1234567890'+#8,100,true,'','Control For Windows','Qual o Numero da Nota ?','');
        if cod = '*' then exit;
        if strnum(cod) = '0' then exit;

        dm.IBQuery1.Close;
        dm.IBQuery1.SQL.Text := 'update entrada set nota = :nota where nota = :nota1 and fornec = :fornec';
        dm.IBQuery1.ParamByName('nota').AsInteger   := StrToIntDef(strnum(cod),0);
        dm.IBQuery1.ParamByName('nota1').AsInteger  := DBGrid1.DataSource.DataSet.FieldByName('nota').AsInteger;
        dm.IBQuery1.ParamByName('fornec').AsInteger := DBGrid1.DataSource.DataSet.FieldByName('codfornec').AsInteger;
        dm.IBQuery1.ExecSQL;

        dm.IBQuery1.Close;
        dm.IBQuery1.SQL.Text := 'update item_entrada set nota = :nota where nota = :nota1 and fornec = :fornec';
        dm.IBQuery1.ParamByName('nota').AsInteger   := StrToIntDef(strnum(cod),0);
        dm.IBQuery1.ParamByName('nota1').AsInteger  := DBGrid1.DataSource.DataSet.FieldByName('nota').AsInteger;
        dm.IBQuery1.ParamByName('fornec').AsInteger := DBGrid1.DataSource.DataSet.FieldByName('codfornec').AsInteger;
        dm.IBQuery1.ExecSQL;

        try
          dm.IBQuery1.Transaction.Commit;
        except
          on e:exception do begin
            dm.IBQuery1.Transaction.Rollback;
            ShowMessage('Ocorreu um erro na Alteração: ' + e.Message);
            exit;
          end;
        end;

        ShowMessage('Numeração de Nota de Entrada Alterada Com Sucesso!');
        dm.IBQuery4.Close;
        dm.IBQuery4.Open;
        funcoes.FormataCampos(dm.ibquery4,2,'',2);
        funcoes.FormataCampos(dm.ibselect,2,'',2);
      END;

      if DBGrid1.SelectedField.DisplayLabel = 'CODFORNEC' then BEGIN
        cod := funcoes.dialogo('generico',100,'1234567890'+#8,100,true,'','Control For Windows','Qual o Cód. do Fornecedor ?','');
        if cod = '*' then exit;
        if strnum(cod) = '0' then exit;

        dm.IBQuery1.Close;
        dm.IBQuery1.SQL.Text := 'update entrada set fornec = :nota where nota = :nota1 and fornec = :fornec';
        dm.IBQuery1.ParamByName('nota').AsInteger   := StrToIntDef(strnum(cod),0);
        dm.IBQuery1.ParamByName('nota1').AsInteger  := DBGrid1.DataSource.DataSet.FieldByName('nota').AsInteger;
        dm.IBQuery1.ParamByName('fornec').AsInteger := DBGrid1.DataSource.DataSet.FieldByName('codfornec').AsInteger;
        dm.IBQuery1.ExecSQL;

        dm.IBQuery1.Close;
        dm.IBQuery1.SQL.Text := 'update item_entrada set fornec = :nota where nota = :nota1 and fornec = :fornec';
        dm.IBQuery1.ParamByName('nota').AsInteger   := StrToIntDef(strnum(cod),0);
        dm.IBQuery1.ParamByName('nota1').AsInteger  := DBGrid1.DataSource.DataSet.FieldByName('nota').AsInteger;
        dm.IBQuery1.ParamByName('fornec').AsInteger := DBGrid1.DataSource.DataSet.FieldByName('codfornec').AsInteger;
        dm.IBQuery1.ExecSQL;

        try
          dm.IBQuery1.Transaction.Commit;
        except
          on e:exception do begin
            dm.IBQuery1.Transaction.Rollback;
            ShowMessage('Ocorreu um erro na Alteração: ' + e.Message);
            exit;
          end;
        end;


        ShowMessage('Numeração de Nota de Entrada Alterada Com Sucesso!');

        dm.IBQuery4.Close;
        dm.IBQuery4.Open;
        funcoes.FormataCampos(dm.ibquery4,2,'',2);
        funcoes.FormataCampos(dm.ibselect,2,'',2);
      END;
    end;
  end;

  if opcao = 1 then begin
    if (key = 38) or (key = 40) then begin
     TimerBuscaProdutos.Enabled := false;
     TimerBuscaProdutos.Enabled := true;
    end;
    if key = 116 then begin
      abreDataSet(true);
    end;

    if key = 113 then begin
      form2.relatorioVendasPorNota(true);
      TimerBuscaProdutos.Enabled := true;
    end;
  end;

  if opcao = 3 then begin
    if (key = 38) or (key = 40) then buscaVendaMADE;
  end;

end;

procedure TForm44.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 119 then DBGrid2.SetFocus;

  if (Shift = [ssCtrl]) and (Key = 46) then Key := 0;
end;

procedure TForm44.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then Key := 0;

  if key = 119 then DBGrid1.SetFocus;
  if opcao = 2 then begin
    if key = 46 then begin
      excluiEntrega;
      exit;
    end;
  end;

end;

procedure TForm44.DBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then DBGrid1.SetFocus;
end;

procedure TForm44.FormCreate(Sender: TObject);
begin
  entrada := false;
  procura := '';
end;

procedure TForm44.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((ssCtrl in Shift) and (chr(Key) in [#46])) then begin
    limpaVendas;
  end;

  if ((key = 121) and (opcao = 1)) then begin
    if Contido('CAMALEAO', form22.Pgerais.Values['empresa']) then begin
      form89 := TForm89.Create(self);
      form89.dini := formataDataDDMMYY(form22.datamov);
      form89.dfim := formataDataDDMMYY(form22.datamov);
      form89.ShowModal;
      form89.Free;

       abreDataSet(true);
    end;
  end;
end;

procedure TForm44.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if not(key in [#13, #27]) then procura := procura + key;
  Timer1.Enabled := false;
  Timer1.Enabled := true;
end;

procedure TForm44.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  cod : String;
  data : TDate;
begin
  if opcao = 1 then begin
    if (ssCtrl in Shift) and (chr(Key) in ['R', 'r']) then begin
      try
       form2.separarUsuario := 'S';
       form2.PorNota1.Click;
      finally
        form2.separarUsuario := 'N';
        abreDataSet(true);
      end;

    end;
  end;

  if opcao = 3 then begin
    if key = 116 then begin
      cod := funcoes.dialogo('generico', 0, '1234567890,.' + #8, 50, false, '',application.Title, 'Qual o Número de Venda ?', '');
      if cod = '*' then exit;

      dm.IBQuery1.close;
      dm.IBQuery1.SQL.Text := 'select cod, data_entrega from entrega_novo where numvenda = :nota';
      dm.IBQuery1.ParamByName('nota').AsString := StrNum(cod);
      dm.IBQuery1.Open;
      dm.IBQuery1.FetchAll;

      if dm.IBQuery1.IsEmpty = false then begin
        if StrToInt(FormatDateTime('yyyy', dm.IBQuery1.FieldByName('data_entrega').AsDateTime)) >= 2019 then begin
          MessageDlg('Esta Venda Já foi Entregue na Data ' + FormatDateTime('dd/mm/yyyy', dm.IBQuery1.FieldByName('data_entrega').AsDateTime) + ' '+ FormatDateTime('t', dm.IBQuery1.FieldByName('data_entrega').AsDateTime), mtInformation, [mbOK], 1);
          exit;
        end;

        MessageDlg('Esta Venda não pode ser Adicionada, ela ja contem registro de Entrega!', mtInformation, [mbOK], 1);
        DBGrid1.DataSource.DataSet.Locate('numvenda', cod, []);
        exit;
      end;

      dm.IBQuery1.close;
      dm.IBQuery1.SQL.Text := 'select nota,data from venda where nota = :nota and cancelado = 0';
      dm.IBQuery1.ParamByName('nota').AsString := StrNum(cod);
      dm.IBQuery1.Open;
      dm.IBQuery1.FetchAll;
      data := dm.IBQuery1.FieldByName('data').AsDateTime;

      if dm.IBQuery1.IsEmpty then begin
        ShowMessage('A Venda não foi Encontrada!');
        exit;
      end;

      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Text := 'insert into ENTREGA_NOVO(cod, numvenda, datavenda, usuario_incluiu, usuario_baixa, data_entrega) '+
      'values(gen_id(entrega_novo, 1), :numvenda, :datavenda, :usuario_incluiu, :usuario_baixa, ''01.01.1900'')';
      dm.IBQuery1.ParamByName('numvenda').AsInteger   := StrToIntDef(cod, 0);
      dm.IBQuery1.ParamByName('datavenda').AsDateTime := data;
      dm.IBQuery1.ParamByName('usuario_incluiu').AsInteger := StrToIntDef(form22.codusario, 0);
      dm.IBQuery1.ParamByName('usuario_baixa').AsInteger   := 0;
      dm.IBQuery1.ExecSQL;
      dm.IBQuery1.Transaction.Commit;

      abreDataSetEntregaMademato;
    end;

    exit;
  end;

  if opcao = 2 then begin
    if funcoes.buscaParamGeral(131, 'N') = 'S' then begin
      if key = 113 then begin
        cod := funcoes.dialogo('generico', 150, '1234567890' + #8, 150, false, '',application.Title, 'Qual o Cód. de Barras ?', '');
        if ((cod = '') or (cod = '*')) then exit;

        dm.IBQuery1.close;
        dm.IBQuery1.SQL.Text := 'update produto set codbar = :codbar where cod = :cod';
        dm.IBQuery1.ParamByName('codbar').AsString := cod;
        dm.IBQuery1.ParamByName('cod').AsString    := DBGrid1.DataSource.DataSet.FieldByName('cod').AsString;
        dm.IBQuery1.ExecSQL;
        dm.IBQuery1.Transaction.Commit;
        abreDataSetEntrega;

      end;
      exit;
    end;

    if key = 115 then begin
      if funcoes.buscaParamGeral(131, 'N') = 'S' then exit;
      cod := form22.Pgerais.Values['nota'];
      if funcoes.Contido(cod, 'TDE') then cod := 'TE'
       else cod := 'ME';

      if form22.Pgerais.Values['nota'] = 'E' then cod := 'ET';
       

      funcoes.GeraNota(nota, cod, 'S', 4);
      abreDataSetEntrega();
    end;
  end;
end;

procedure TForm44.FormShow(Sender: TObject);
begin
  acertarTamanhoDBGRID1();
end;

procedure TForm44.acertarTamanhoDBGRID1();
var
  i, acc : integer;
begin
  acc := 0;
  for i:=0 to DBGrid1.Columns.Count-1 do
    begin
       //showme
       acc := acc + DBGrid1.Columns[i].Width;
    end;
    
  self.Width := acc + 80;
  DBGrid1.Width := acc;
  //if acc < 299 then self.Width:=acc+10;
end;

procedure TForm44.abreDataSetEntrega(refresh1 : boolean = false);
begin
  if refresh1 then
    begin
      criaDataSetVendaEntrega;
      DBGrid2.DataSource.DataSet.Open;

      TCurrencyField(dm.IBQuery2.FieldByName('quant')).DisplayFormat
        := '###,##0.00';
      TCurrencyField(ClientDataSet1.FieldByName('quant')).DisplayFormat
        := '###,##0.00';

      dm.IBQuery2.FieldByName('numdoc').Visible := false;
      exit;
    end;

  criaDataSetVendaEntrega;
 
  dm.IBQuery2.Close;
  dm.IBQuery2.SQL.Text := 'select i.nota, i.DATA_ENTREGA + HORA AS DATA_ENTREGA, i.cod, p.nome, i.quant, i.numdoc from CONT_ENTREGA ' +
  'i left join produto p on (i.cod = p.cod) where i.nota = :nota';

  if funcoes.buscaParamGeral(131, 'N') = 'S' then begin
    dm.IBQuery2.SQL.Text := 'select i.nota, i.DATA_ENTREGA + HORA AS DATA_ENTREGA, i.cod, p.codbar, p.nome, i.quant, i.numdoc from CONT_ENTREGA ' +
    'i left join produto p on (i.cod = p.cod) where i.nota = :nota';
  end;


  dm.IBQuery2.ParamByName('nota').AsString := nota;
  dm.IBQuery2.Open;

  dm.IBQuery2.FieldByName('numdoc').Visible := false;

  TCurrencyField(dm.IBQuery2.FieldByName('quant')).DisplayFormat
        := '###,##0.000';
  TCurrencyField(ClientDataSet1.FieldByName('quant')).DisplayFormat
        := '###,##0.000';
  DBGrid2.DataSource := dm.entrada;
end;

procedure TForm44.abreDataSetEntregaMademato(refresh1 : boolean = false);
begin
  if refresh1 then
    begin
      {criaDataSetVendaEntrega;
      DBGrid2.DataSource.DataSet.Open;

      TCurrencyField(dm.IBQuery2.FieldByName('quant')).DisplayFormat
        := '###,##0.00';
      TCurrencyField(ClientDataSet1.FieldByName('quant')).DisplayFormat
        := '###,##0.00';

      dm.IBQuery2.FieldByName('numdoc').Visible := false;
      exit;   }
    end;

  dm.IBQuery2.Close;
  dm.IBQuery2.SQL.Text := 'select e.cod, e.numvenda, v.cliente, c.nome, e.datavenda,e.usuario_incluiu,v.cliente||''-''||c.nome as clienteN, e.usuario_incluiu||''-''||u.nome as usuarion, v.total ' +
                          'from entrega_novo e left join venda v on (v.nota = e.numvenda) left join cliente c on (c.cod = v.cliente) left join usuario u on(e.usuario_incluiu = u.cod) where (e.usuario_baixa = 0) or (e.usuario_baixa is null)';

  dm.IBQuery2.Open;

  dm.IBQuery2.FieldByName('cod').Visible := false;
  dm.IBQuery2.FieldByName('cliente').Visible := false;
  dm.IBQuery2.FieldByName('nome').Visible := false;
  dm.IBQuery2.FieldByName('usuario_incluiu').Visible := false;
  //dm.IBQuery2.FieldByName('cliente').Visible := false;

  TCurrencyField(dm.IBQuery2.FieldByName('total')).DisplayFormat
        := '###,##0.00';
  DBGrid1.DataSource := dm.entrada;
end;

procedure TForm44.abreDataSet(refresh1 : boolean = false);
begin
  if refresh1 then
    begin
      DBGrid1.DataSource.DataSet.Close;
      DBGrid1.DataSource.DataSet.Open;
      funcoes.FormataCampos(dm.ibquery2,2,'',2);
      buscaVenda;
      exit;
    end;

  dm.IBQuery2.Close;
  dm.IBQuery2.SQL.Text := ('select v.nota, v.data, v.codhis as formapagto, a.nome as vendedor, v.desconto, v.total from venda v left join  vendedor a on (v.vendedor = a.cod) where (v.cancelado = 0) and ((v.ok = '+ QuotedStr('') +') or (v.ok = '+ QuotedStr('N') +' )) order by v.nota desc');
  dm.IBQuery2.Open;
end;

procedure TForm44.limpaVendas();
begin
  if MessageDlg('Deseja Remover todas as Vendas Desta Lista ?', mtConfirmation, [mbYes, mbNo], 1) = idno then exit;

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text := 'update venda set ok = ''S'' where ((ok = '''') or (ok = ''N''))';
  dm.IBQuery1.ExecSQL;
  dm.IBQuery1.Transaction.Commit;

  abreDataSet(true);
end;

procedure TForm44.Timer1Timer(Sender: TObject);
begin
  procura := '';
  Timer1.Enabled := false;
end;

procedure TForm44.TimerBuscaProdutosTimer(Sender: TObject);
begin
  TimerBuscaProdutos.Enabled := false;
  buscaVenda;
end;

procedure TForm44.entregaProduto;
var
  quant : string;
begin
  if DBGrid1.DataSource.DataSet.FieldByName('quant').AsCurrency = 0 then begin
    MessageDlg('Esse Produto Já foi Entregue!', mtInformation, [mbok], 1);
    exit;
  end;

  quant := funcoes.dialogo('numero',2,'SN',2,true,'S','Control for Windows:','Quantidade:', FormatCurr('#,###,###0.000',DBGrid1.DataSource.DataSet.FieldByName('quant').AsCurrency));
  if quant = '*' then exit;

  if (StrToCurr(quant) > DBGrid1.DataSource.DataSet.FieldByName('quant').AsCurrency) or (StrToCurr(quant) <= 0) then begin
    MessageDlg('Quantidade Inválida!', mtError, [mbOK], 1);
    exit;
  end;

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text := 'insert into CONT_ENTREGA(NUMDOC, NOTA, COD, DATA_ENTREGA, QUANT, USUARIO, HORA, ENT_AGORA) values' +
  '(gen_id(CONT_ENTREGA, 1), :NOTA, :COD, :DATA_ENTREGA, :QUANT, :USUARIO, :HORA, ''X'')';
  dm.IBQuery1.ParamByName('nota').AsString := DBGrid1.DataSource.DataSet.FieldByName('nota').AsString;
  dm.IBQuery1.ParamByName('cod').AsString  := DBGrid1.DataSource.DataSet.FieldByName('cod').AsString;
  dm.IBQuery1.ParamByName('DATA_ENTREGA').AsDate := form22.datamov;
  dm.IBQuery1.ParamByName('QUANT').AsCurrency    := StrToCurr(quant);
  dm.IBQuery1.ParamByName('USUARIO').AsString    := form22.codusario;
  dm.IBQuery1.ParamByName('HORA').AsTime         := Now;
  dm.IBQuery1.ExecSQL;
  dm.IBQuery1.Transaction.Commit;

  listaEntrega.Values[DBGrid1.DataSource.DataSet.FieldByName('cod').AsString] :=
  CurrToStr(StrToCurrDef(listaEntrega.Values[DBGrid1.DataSource.DataSet.FieldByName('cod').AsString], 0) + StrToCurr(quant));

  abreDataSetEntrega;


  if funcoes.buscaParamGeral(131, 'N') = 'S' then begin
    if (DBGrid1.DataSource.DataSet.RecordCount = 0) and (DBGrid2.DataSource.DataSet.RecordCount > 0) then begin
      //se entrou aqui é pq foi entregue tudo
      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Text := 'update venda set os = 1 where nota = :nota';
      dm.IBQuery1.ParamByName('nota').AsString := nota;
      dm.IBQuery1.ExecSQL;
      dm.IBQuery1.Transaction.Commit;
    end;
  end;
end;

procedure TForm44.criaDataSetVendaEntrega;
var
  lista : TStringList;
begin
  lista := TStringList.Create;

  ClientDataSet1.Close;
  ClientDataSet1.FieldDefs.Clear;

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select i.cod, i.quant from CONT_ENTREGA i where i.nota = :nota';
  dm.IBselect.ParamByName('nota').AsString := nota;
  dm.IBselect.Open;

  while not dm.IBselect.Eof do begin
    lista.Values[dm.IBselect.FieldByName('cod').AsString] :=
    CurrToStr(StrToCurrDef(lista.Values[dm.IBselect.FieldByName('cod').AsString], 0) +
    dm.IBselect.FieldByName('quant').Ascurrency);
    //lista.Add(dm.IBselect.FieldByName('cod').AsString  + '=' + dm.IBselect.FieldByName('quant').AsString);
    dm.IBselect.Next;
  end;

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select i.nota, i.data, i.cod, p.codbar, p.nome, i.quant from item_venda i'+
  ' left join produto p on (p.cod = i.cod) where i.nota = :nota';
  dm.IBselect.ParamByName('nota').AsString := nota;
  dm.IBselect.Open;

  funcoes.Ibquery_to_clienteDataSet(dm.IBselect, ClientDataSet1);

  while not dm.IBselect.Eof do begin
    if dm.IBselect.FieldByName('quant').AsCurrency - StrToCurrDef(lista.Values[dm.IBselect.FieldByName('cod').AsString], 0) > 0 then begin
      ClientDataSet1.Insert;
      ClientDataSet1.FieldByName('nota').AsString    := dm.IBselect.FieldByName('nota').AsString;
      ClientDataSet1.FieldByName('data').AsDateTime  := dm.IBselect.FieldByName('data').AsDateTime;
      ClientDataSet1.FieldByName('cod').AsString     := dm.IBselect.FieldByName('cod').AsString;
      ClientDataSet1.FieldByName('nome').AsString    := dm.IBselect.FieldByName('nome').AsString;
      ClientDataSet1.FieldByName('codbar').AsString    := dm.IBselect.FieldByName('codbar').AsString;
      ClientDataSet1.FieldByName('quant').AsCurrency := dm.IBselect.FieldByName('quant').AsCurrency - StrToCurrDef(lista.Values[dm.IBselect.FieldByName('cod').AsString], 0);
      ClientDataSet1.Post;
    end;

      dm.IBselect.Next;
  end;

  ClientDataSet1.Active := true;
  dm.IBselect.Close;
  DataSource1.DataSet := ClientDataSet1;
  DBGrid1.DataSource  := DataSource1;
  lista.free;
end;

procedure TForm44.excluiEntrega;
var
  sim : string;
begin
 // MessageDlg('Atenção, não será possível excluir item já entregue!', mtInformation, [mbOK], 1);
  //if VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false = false then

  if funcoes.senhaDodia = false then exit;

  sim := funcoes.dialogo('generico',0,'SN'+#8,0,false,'S','Control For Windows','Deseja Excluir','N') ;
  if ((sim = '*') or (sim <> 'S')) then exit;

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text := 'delete from CONT_ENTREGA where numdoc = :cod';
  dm.IBQuery1.ParamByName('cod').AsString := DBGrid2.DataSource.DataSet.FieldByName('numdoc').AsString;
  dm.IBQuery1.ExecSQL;
  dm.IBQuery1.Transaction.Commit;

  abreDataSetEntrega;
  DBGrid1.SetFocus;
end;

function TForm44.buscaEnrtada : String;
begin

end;

end.

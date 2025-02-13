unit creceberposicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, DBClient, Provider,
  DBCtrls,   classes1,FireDAC.Comp.Client, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TForm34 = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    cliente: TLabel;
    label4: TLabel;
    IBTable1: TFDTable;
    IBTable1CODGRU: TIntegerField;
    IBTable1DOCUMENTO: TIntegerField;
    IBTable1VENCIMENTO: TDateField;
    IBTable1TOTAL: TBCDField;
    IBTable1CODHIS: TIntegerField;
    IBTable1HISTORICO: TStringField;
    IBTable1PAGO: TBCDField;
    IBTable1FORNEC: TIntegerField;
    IBTable1USUARIO: TIntegerField;
    IBTable1VENDEDOR: TIntegerField;
    IBTable1DATAMOV: TDateField;
    IBTable1FORMPAGTO: TSmallintField;
    IBTable1PREVISAO: TDateField;
    IBTable1VALOR: TBCDField;
    IBTable1CONT: TSmallintField;
    IBTable1DATA: TDateField;
    IBTable1COD: TIntegerField;
    IBTable1ValorCalc: TCurrencyField;
    DataSource1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    total: TLabel;
    IBTable1SALDO: TBCDField;
    ClientDataSet1: TClientDataSet;
    procedure FormShow(Sender: TObject);
    procedure IBTable1CalcFields(DataSet: TDataSet);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure baixaConta();
    procedure imprimeNota(var lis : TItensAcumProd; valorb : currency);
    { Private declarations }
  public
   cont :  integer;
   juros,dias,saldo1 : currency;
   client1, formapagto:string;
   function geraSaldo : boolean;
   procedure geraRecibo();
   function verificaValorNegativo() : boolean;
   procedure copiaContasReceber(var query11 : TFDQuery);
   procedure baixaF10Antigo();
   procedure baixaF10Novo();
    { Public declarations }
  end;

var
  Form34: TForm34;


implementation

uses func, Unit1, principal, relatorio, imprime1, DateUtils, Math;

{$R *.dfm}

function TForm34.verificaValorNegativo() : boolean;
begin
  try
    Result := false;
    DBGrid1.DataSource.DataSet.DisableControls;
    DBGrid1.DataSource.DataSet.First;
    while not DBGrid1.DataSource.DataSet.Eof do
      begin
        If DBGrid1.DataSource.DataSet.FieldByName('valor').AsCurrency < 0 then
          begin
            Result := true;
            break;
          end;
        DBGrid1.DataSource.DataSet.Next;
      end;
  finally
    DBGrid1.DataSource.DataSet.First;
    DBGrid1.DataSource.DataSet.EnableControls;
  end;
end;

procedure TForm34.geraRecibo();
begin

end;


function tform34.geraSaldo : boolean;
begin
  IBTable1.DisableControls;
  IBTable1.First;
  saldo1 := 0;

  while not IBTable1.Eof do
    begin
      IBTable1.Edit;
      saldo1 := saldo1 + TFDQuery(IBTable1).fieldbyname('valorcalc').AsCurrency;
      IBTable1SALDO.AsCurrency := saldo1;
      IBTable1.Post;
      IBTable1.Next;
    end;
  try
   IBTable1.Transaction.Commit;
  except
   IBTable1.Transaction.Rollback;
  end;
  IBTable1.Active := true ;
  IBTable1.First;
  IBTable1.EnableControls;
  funcoes.FormataCampos(TFDQuery(IBTable1),2,'',2);
  Result := true;
end;

procedure TForm34.FormShow(Sender: TObject);
begin

if cont=1 then
begin
 IBTable1SALDO.Visible := false;

 Panel1.Visible := false;
 try
  total.Caption := CurrToStrF(funcoes.SomaCampoDBGRID(TFDQuery(ibtable1),'ValorCalc',0,0,0,''),ffnumber,2);
 except
 end;

// self.Height := Screen.Height - trunc(screen.Height * 0.15);

end;
if cont = 2 then
 begin
   //IBTable1.IndexName := 'CONTASRECEBER_IDX1';
   //geraSaldo();
   panel2.Visible := false;
   DBGrid1.DataSource.DataSet.First;
 end;
end;

procedure TForm34.IBTable1CalcFields(DataSet: TDataSet);
var
  d : real;
  i : integer;
  datamaior : TDateTime;
begin
if IBTable1DATA.AsDateTime>=IBTable1VENCIMENTO.AsDateTime then datamaior:=IBTable1DATA.AsDateTime
 else datamaior := IBTable1VENCIMENTO.AsDateTime;
 if cont = 1 then
   begin
    IBTable1ValorCalc.AsCurrency := IBTable1VALOR.AsCurrency
   end
else if cont = 2 then
 begin
    i:=0;
    if form22.datamov > datamaior then
      begin
        d := form22.datamov - datamaior;
        IBTable1ValorCalc.AsCurrency := IBTable1VALOR.AsCurrency + Arredonda((IBTable1VALOR.AsCurrency * (juros/100))*d,2);
      end
    else  IBTable1ValorCalc.AsCurrency := IBTable1VALOR.AsCurrency;
 end
else if cont=3 then IBTable1ValorCalc.AsCurrency :=IBTable1VALOR.AsCurrency;
end;

procedure TForm34.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if cont=1 then
begin
 if DBGrid1.DataSource.DataSet.RecNo mod 2 = 0 then
  begin
   Dbgrid1.Canvas.Font.Color := clDkGray;
   Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
  end;
end;
end;

procedure TForm34.DBGrid1KeyPress(Sender: TObject; var Key: Char);
var
   valorbaixado , sim, cod, fatura :string;
   i, a, c, lin            : integer;
   v1 , valorb             : currency;
   _LIQ                    : boolean;
begin
  if cont = 1 then begin
   if (key=#27) or (key=#13) then close;
  end;
  if cont = 2 then begin
    if key = #32 then begin
      dm.IBselect.Close;
      dm.IBselect.SQL.Text := 'select valor from contasreceber where cod = :cod';
      dm.IBselect.ParamByName('cod').AsString := DBGrid1.DataSource.DataSet.FieldByName('cod').AsString;
      dm.IBselect.Open;

      funcoes.Mensagem('ControlW - Contas a Receber', 'Vencimento: ' + formataDataDDMMYY(DBGrid1.DataSource.DataSet.FieldByName('vencimento').AsDateTime) + #13 +
               'Valor:' + CompletaOuRepete('', formataCurrency(dm.IBselect.FieldByName('valor').AsCurrency), ' ', 14) + #13 +
               'Juros:' + CompletaOuRepete('', formataCurrency(DBGrid1.DataSource.DataSet.FieldByName('valor').AsCurrency - dm.IBselect.FieldByName('valor').AsCurrency), ' ', 14),14,'Courier New',true,0,clBlack, false);
    end;

    if key = #27 then Close;
    if key = #13 then begin
      baixaConta;
    end;
  end;
end;

procedure TForm34.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DBGrid1.DataSource.DataSet.Close;
end;

procedure TForm34.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  cli,valorBaixado,sim, cod, codES, fatura:string;
  i,a :integer;
  v1,valorb:currency;
begin
  if cont = 2 then
   begin
    if key = 113 then
     begin

      dm.IBQuery2.Close;
      dm.IBQuery2.SQL.Clear;
      dm.IBQuery2.SQL.Add('select cod,nome,ende,bairro,cid,est,cnpj,ies from cliente where cod='+DBGrid1.DataSource.DataSet.FieldByName('documento').AsString);
      dm.IBQuery2.Open;
      cli := dm.IBQuery2.fieldbyname('nome').AsString;

      form19.RichEdit1.Clear;
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',78)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(funcoes.CompletaOuRepete(funcoes.LerValorPGerais('empresa',form22.Pgerais),'',' ',35)+'EXTRATO DE CONTA',FormatDateTime('dd/mm/yy',form22.datamov),' ',78)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',78)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('CLIENTE: '+DBGrid1.DataSource.DataSet.FieldByName('documento').AsString +'-'+cli,FormatDateTime('tt',now),' ',78)+#13+#10))));
      addRelatorioForm19('END.: ' + dm.IBQuery2.fieldbyname('ende').AsString + ' BAIRRO: ' + dm.IBQuery2.fieldbyname('BAIRRO').AsString + CRLF);
      addRelatorioForm19('CIDADE: ' + dm.IBQuery2.fieldbyname('cid').AsString + ' ESTADO: ' + dm.IBQuery2.fieldbyname('est').AsString + CRLF);
      addRelatorioForm19('CPF/CNPJ: ' + dm.IBQuery2.fieldbyname('cnpj').AsString  + CRLF);
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',78)+#13+#10))));
      addRelatorioForm19('VENCIMEN HISTORICO                                 VALOR        SALDO NFE'  + CRLF);
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',78)+#13+#10))));

      dm.IBQuery2.Close;
      DBGrid1.DataSource.DataSet.DisableControls;
      i:= DBGrid1.DataSource.DataSet.RecNo-1;
      DBGrid1.DataSource.DataSet.First;

      a := 55;
      while not DBGrid1.DataSource.DataSet.Eof do
       begin

        if form19.RichEdit1.Lines.Count >= a then
          begin
            form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',78)+#12+#13+#10))));
            form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',78)+#13+#10))));
            form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(funcoes.CompletaOuRepete(funcoes.LerValorPGerais('empresa',form22.Pgerais),'',' ',35)+'EXTRATO DE CONTA',FormatDateTime('dd/mm/yy',form22.datamov),' ',78)+#13+#10))));
            form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('CLIENTE: '+IBTable1DOCUMENTO.AsString +'-'+cli,FormatDateTime('tt',now),' ',78)+#13+#10))));
            form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',78)+#13+#10))));
            a := form19.RichEdit1.Lines.Count + 56;
          end;
          form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(FormatDateTime('dd/mm/yy',DBGrid1.DataSource.DataSet.FieldByName('vencimento').AsDateTime),'',' ',9)+funcoes.CompletaOuRepete(DBGrid1.DataSource.DataSet.FieldByName('historico').AsString,'',' ',35)+funcoes.CompletaOuRepete(' ',FormatCurr('0.00',DBGrid1.DataSource.DataSet.FieldByName('valor').AsCurrency),' ',12)+' '+funcoes.CompletaOuRepete(' ',FormatCurr('0.00',DBGrid1.DataSource.DataSet.FieldByName('saldo').AsCurrency),' ',12) + ' ' + DBGrid1.DataSource.DataSet.FieldByName('nfe').AsString)+#13+#10)));
          DBGrid1.DataSource.DataSet.Next;
       end;
       DBGrid1.DataSource.DataSet.First;
       DBGrid1.DataSource.DataSet.MoveBy(i);
       DBGrid1.DataSource.DataSet.EnableControls;
       form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete('','','-',78)+#13+#10))));
       form19.RichEdit1.Lines.SaveToFile('texto.txt');
       imprime.textx('texto.txt');
       form19.RichEdit1.Clear;
     end;

  if ((key = 121) or ((form22.usuario = 'ADMIN') and (key = 120))) then begin //f10
    baixaF10Antigo;
  end;
end;



 end;

procedure TForm34.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  data, cod : string;
begin
  if (Shift = [ssCtrl]) and (Key = 46) then Key := 0;

 if cont=2 then
  begin
    if key = 116 then
      begin
        {exit;
        if VerificaAcesso_Se_Nao_tiver_Nenhum_bloqueio_true_senao_false = false then begin
          ShowMessage('Rotina Bloqueada!');
        end;     }


        data := '';
        cod  := DBGrid1.DataSource.DataSet.FieldByName('cod').AsString;
        dm.IBselect.Close;
        dm.IBselect.SQL.Text := 'select previsao from contasreceber where cod = :cod';
        dm.IBselect.ParamByName('cod').AsString := cod;
        dm.IBselect.Open;

        if dm.IBselect.FieldByName('previsao').AsDateTime > StrToDate('01/01/2005') then begin
          data := dm.IBselect.FieldByName('previsao').AsString;
        end;
        dm.IBselect.Close;


        //if IBTable1PREVISAO.AsString <> '01/01/1900'  then data := IBTable1PREVISAO.AsString;
        data := funcoes.dialogo('data',0,'1234567890'+#8,50,true,'',Application.Title,'Qual a Previsão para Pagamento?',data);
        if data = '*' then exit;


        dm.IBQuery1.Close;
        dm.IBQuery1.SQL.Text := 'update contasreceber set previsao = :data, ult_usu_alterado = -1 where cod = :cod';
        dm.IBQuery1.ParamByName('data').AsDate   := StrToDate(data);
        dm.IBQuery1.ParamByName('cod').AsString  := cod;
        dm.IBQuery1.ExecSQL;
        dm.IBQuery1.Transaction.Commit;

{        DBGrid1.DataSource.DataSet.Open;
        DBGrid1.DataSource.DataSet.Edit;
        DBGrid1.DataSource.DataSet..AsDateTime := StrToDateTime(data);
        IBTable1.Post;}

      end;
  end;
end;

procedure TForm34.copiaContasReceber(var query11 : TFDQuery);
var
  saldo, valor : currency;
  datamaior : TDateTime;
  d : integer;
  nfes1 : String;
begin
  //ClientDataSet1.FieldByName('cod').Visible := false;
  ClientDataSet1.FieldByName('cod').Visible      := false;
  ClientDataSet1.FieldByName('previsao').Visible := false;
  ClientDataSet1.FieldByName('datamov').Visible := false;
  ClientDataSet1.FieldByName('codgru').Visible := false;
  ClientDataSet1.FieldByName('previsao').Visible := false;
  funcoes.FormataCampos(TFDQuery(ClientDataSet1), 2, '', 2);
  ClientDataSet1.EmptyDataSet;

  try
    ClientDataSet1.DisableControls;
  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select datamov,codgru, vencimento, documento, historico, previsao, valor, cod, valor as saldo, nota  from contasreceber where ' +
  '(documento='+strnum(client1)+') and (pago=0) order by vencimento';
  dm.IBselect.Open;

  {dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select c.datamov,c.codgru, c.vencimento, c.documento, c.historico, c.previsao, c.valor, c.cod, c.valor as saldo, cast(substring(n.chave from 26 for 9)'+
  ' as integer) as nfe, c.nota  from contasreceber c left join nfe n on (cast(substring(n.chave from 37 for 7) as integer) = c.nota) where' +
  '(c.documento='+strnum(client1)+') and (c.pago=0) order by c.vencimento';
  dm.IBselect.Open;}

  query11 := dm.IBselect;

  query11.First;
  saldo := 0;
  while not query11.Eof do begin
    datamaior := query11.FieldByName('vencimento').AsDateTime;
    valor     := query11.FieldByName('valor').AsCurrency;

    if valor <> 0 then begin
      if query11.FieldByName('datamov').AsDateTime > query11.FieldByName('vencimento').AsDateTime then
        datamaior := query11.FieldByName('datamov').AsDateTime;

      d := DaysBetween(datamaior, form22.datamov);

      {if ((query11.FieldByName('cod').AsInteger = 48940) or (query11.FieldByName('cod').AsInteger = 48939)) then begin
        ShowMessage('cod='+query11.FieldByName('cod').AsString+#13+'dias=' + IntToStr(d) + #13 + IntToStr(trunc(form22.datamov - datamaior)));
      end;}

      d := trunc(form22.datamov - datamaior);


      //if form22.datamov > datamaior then
      if d > 0 then begin
        valor := valor + Arredonda((valor *( juros /100)) * d,2);
      end;

      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Text := 'select substring(n.chave from 26 for 9) as nfe from nfe n where (substring(n.chave from 37 for 7) = lpad('+QuotedStr(dm.IBselect.FieldByName('nota').AsString)+',7, ''0'')) ';
      //dm.IBQuery1.ParamByName('nota').AsString := ;
      dm.IBQuery1.Open;
      dm.IBQuery1.FetchAll;

      nfes1 := iif(IntToStr(strtointdef(dm.IBQuery1.FieldByName('nfe').AsString, 0)) = '0', '', IntToStr(strtointdef(dm.IBQuery1.FieldByName('nfe').AsString, 0)));

     if dm.IBQuery1.RecordCount > 1 then begin
        nfes1 := '';
        while not dm.IBQuery1.Eof  do begin

          nfes1 := nfes1 + iif(IntToStr(strtointdef(dm.IBQuery1.FieldByName('nfe').AsString, 0)) = '0', '', IntToStr(strtointdef(dm.IBQuery1.FieldByName('nfe').AsString, 0)));
          if dm.IBQuery1.RecordCount <> dm.IBQuery1.RecNo then nfes1 := nfes1 + ',';
          dm.IBQuery1.Next;
        end;
      end;

   
      saldo := saldo + valor;
      ClientDataSet1.Append;
      ClientDataSet1.FieldByName('codgru').AsInteger      := query11.FieldByName('codgru').AsInteger;
      ClientDataSet1.FieldByName('vencimento').AsDateTime := query11.FieldByName('vencimento').AsDateTime;
      ClientDataSet1.FieldByName('documento').AsInteger   := query11.FieldByName('documento').AsInteger;
      ClientDataSet1.FieldByName('historico').AsString    := query11.FieldByName('historico').AsString;
      ClientDataSet1.FieldByName('valor').AsCurrency      := valor;
      ClientDataSet1.FieldByName('saldo').AsCurrency      := saldo;
      ClientDataSet1.FieldByName('cod').AsInteger         := query11.FieldByName('cod').AsInteger;
      ClientDataSet1.FieldByName('nfe').AsString         := nfes1;

      ClientDataSet1.FieldByName('nota').AsInteger         := query11.FieldByName('nota').AsInteger;
      ClientDataSet1.Post;
    end;
    query11.Next;
  end;
  finally
    ClientDataSet1.First;
    ClientDataSet1.EnableControls;
  end;


  ClientDataSet1.FieldByName('nota').DisplayLabel := 'Num. Venda';
  ClientDataSet1.FieldByName('nfe').DisplayLabel  := 'Num. NFe';

  ClientDataSet1.FieldByName('cod').Visible := false;
end;


procedure TForm34.baixaF10Antigo();
var
  valorBaixado, sim, fatura, codES : String;
  valorb, v1, totGeral : currency;
  i, a : integer;
  lista : TItensAcumProd;
begin
  //aqui verifica se existe algum valor negativo pq se existir na hora de baixar duplica
  //asentradas em caixa
  if verificaValorNegativo then
    begin
      WWMessage('Foi detectado uma conta negativa, primeiro dê baixa desta conta utilizando ENTER para poder baixar utilizar esta função', mtWarning,[mbok], HexToTColor('FFD700'),true,false, HexToTColor('B22222'));
      exit;
    end;

  try
    DBGrid1.DataSource.DataSet.DisableControls;
    DBGrid1.DataSource.DataSet.Last;
    totGeral := DBGrid1.DataSource.DataSet.FieldByName('saldo').AsCurrency;
  finally
    DBGrid1.DataSource.DataSet.First;
    DBGrid1.DataSource.DataSet.EnableControls;
  end;

  valorBaixado := funcoes.ConverteNumerico(funcoes.dialogo('numero',0,'1234567890,.'+#8,2,false,'',Application.Title,'Qual o Valor a Ser Baixado?','0,00'));
  if (valorBaixado = '*') then exit;
  try
    if (StrToCurr(valorBaixado) = 0)  then exit;
  except
    exit;
  end;

  if ((StrToCurr(valorBaixado) <= 0) or (StrToCurr(valorBaixado) > totGeral)) then begin
    MessageDlg('Valor Inválido: ' + valorBaixado, mtInformation, [mbOK], 1);
    exit;
  end;

  formapagto := funcoes.LerFormPato(0,'Contas Receber F8-Sair', true);
  if ((formapagto = '') or (formapagto = '*')) then exit;
  


  sim := funcoes.dialogo('generico',0,'SN',0,false,'S',Application.Title,'Confirma Baixa de R$ '+valorBaixado+' ?','S') ;
  if sim = '*' then exit;


  valorb := StrToCurr(funcoes.ConverteNumerico(valorBaixado));
  v1 := valorb;
  i := DBGrid1.DataSource.DataSet.RecNo-1;
  DBGrid1.DataSource.DataSet.DisableControls;
  DBGrid1.DataSource.DataSet.First;
  form19.RichEdit1.Clear;
  lista := TItensAcumProd.Create;
  DBGrid1.DataSource.DataSet.First;

  while ((not DBGrid1.DataSource.DataSet.Eof) or (valorb <= 0)) do begin
    if (valorb <= 0) then break;

    if valorb >= DBGrid1.DataSource.DataSet.FieldByName('valor').AsCurrency then begin
      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Clear;
      dm.IBQuery1.SQL.Add('update contasreceber set ULTVALOR = :ULTVALOR, CODHIS = :CODHIS, valor=:valor,pago=:valor, ult_usu_alterado = :ult_usu_alterado, datamov = :data where cod='+DBGrid1.DataSource.DataSet.FieldByName('cod').AsString);
      dm.IBQuery1.ParamByName('ULTVALOR').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('valor').AsCurrency;
      dm.IBQuery1.ParamByName('CODHIS').AsInteger   := StrToIntDef(formapagto, 1);
      dm.IBQuery1.ParamByName('valor').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('valor').AsCurrency;
      dm.IBQuery1.ParamByName('ult_usu_alterado').AsInteger   := StrToInt(StrNum(form22.codusario));
      dm.IBQuery1.ParamByName('data').AsDate                  := form22.datamov;
      dm.IBQuery1.ExecSQL;

      funcoes.gravaAlteracao('Baixa F10 de CR val: ' + CurrToStr(DBGrid1.DataSource.DataSet.FieldByName('valor').AsCurrency) + ' cod: ' + DBGrid1.DataSource.DataSet.FieldByName('cod').AsString + ' pago: 0' , 'CRB');

      valorb := valorb - DBGrid1.DataSource.DataSet.FieldByName('valor').AsCurrency;

      {dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Clear;
      dm.IBQuery1.SQL.Add('insert into caixa(formpagto,codgru,codmov,codentradasaida,data,documento,vencimento,codhis,historico,entrada,usuario, tipo, fornec)'+
      ' values (:pagto,'+StrNum(DBGrid1.DataSource.DataSet.FieldByName('codgru').AsString)+','+StrNum(funcoes.novocod('movcaixa'))+','+StrNum(DBGrid1.DataSource.DataSet.FieldByName('cod').AsString)+',:data,'+StrNum(DBGrid1.DataSource.DataSet.FieldByName('documento').AsString)+',:venc,2,'+QuotedStr(DBGrid1.DataSource.DataSet.FieldByName('historico').AsString)+',:pago,'+StrNum(form22.codusario)+', ''R'', 1)');
      dm.IBQuery1.ParamByName('pagto').AsString  := strnum(formapagto);
      dm.IBQuery1.ParamByName('data').AsDateTime := DateOf(form22.datamov) + timeof(now);
      dm.IBQuery1.ParamByName('venc').AsDateTime:= DBGrid1.DataSource.DataSet.FieldByName('vencimento').AsDateTime;
      dm.IBQuery1.ParamByName('pago').AsCurrency:= DBGrid1.DataSource.DataSet.FieldByName('valor').AsCurrency;
      dm.IBQuery1.ExecSQL; }

      i := lista.Add(TacumProd.Create);
      lista[i].cod   := DBGrid1.DataSource.DataSet.FieldByName('documento').AsInteger;
      lista[i].unid  := DBGrid1.DataSource.DataSet.FieldByName('historico').AsString;
      lista[i].data  := DBGrid1.DataSource.DataSet.FieldByName('vencimento').AsDateTime;
      lista[i].quant := DBGrid1.DataSource.DataSet.FieldByName('valor').AsCurrency;
    end
    else if (valorb < DBGrid1.DataSource.DataSet.FieldByName('valor').AsCurrency) then begin
      //se valorb(valor que o usuario informou a ser dado baixa) menor valor da conta

      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Clear;
      dm.IBQuery1.SQL.Add('update contasreceber set ULTVALOR = :ULTVALOR,CODHIS = :CODHIS, valor = :valor, datamov = :data, ult_usu_alterado = :ult_usu_alterado where cod='+DBGrid1.DataSource.DataSet.FieldByName('cod').AsString);
      dm.IBQuery1.ParamByName('ULTVALOR').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('valor').AsCurrency;
      dm.IBQuery1.ParamByName('CODHIS').AsInteger   := StrToIntDef(formapagto, 1);
      dm.IBQuery1.ParamByName('valor').AsCurrency := valorb;
      dm.IBQuery1.ParamByName('data').AsDate      := form22.datamov;
      dm.IBQuery1.ParamByName('ult_usu_alterado').AsInteger   := StrToInt(StrNum(form22.codusario));
      dm.IBQuery1.ExecSQL;

      {dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Text := ('insert into caixa(formpagto,codgru,codmov,codentradasaida,data,documento,vencimento,codhis,historico,entrada,usuario, tipo, fornec)'+
      ' values (:pagto,'+DBGrid1.DataSource.DataSet.FieldByName('CODGRU').AsString+','+funcoes.novocod('movcaixa')+','+DBGrid1.DataSource.DataSet.FieldByName('COD').AsString+',:data,'+DBGrid1.DataSource.DataSet.FieldByName('DOCUMENTO').AsString+',:venc,'+'2'+','+QuotedStr(DBGrid1.DataSource.DataSet.FieldByName('historico').AsString)+',:pago,'+StrNum(form22.codusario)+', ''R'', 1)');
      dm.IBQuery1.ParamByName('pagto').AsString  := strnum(formapagto);
      dm.IBQuery1.ParamByName('data').AsDateTime := DateOf(form22.datamov) + timeof(now);
      dm.IBQuery1.ParamByName('venc').AsDateTime:= DBGrid1.DataSource.DataSet.FieldByName('VENCIMENTO').AsDateTime;
      dm.IBQuery1.ParamByName('pago').AsCurrency:= valorb;
      dm.IBQuery1.ExecSQL;   }

      i := lista.Add(TacumProd.Create);
      lista[i].cod   := DBGrid1.DataSource.DataSet.FieldByName('documento').AsInteger;
      lista[i].unid  := DBGrid1.DataSource.DataSet.FieldByName('historico').AsString;
      lista[i].data  := DBGrid1.DataSource.DataSet.FieldByName('vencimento').AsDateTime;
      lista[i].quant := valorb;

      funcoes.gravaAlteracao('Baixa F10 de CR val: ' + CurrToStr(valorb) + ' cod: ' + DBGrid1.DataSource.DataSet.FieldByName('cod').AsString + ' pago: 0' , 'CRB');

      valorb := 0;
    end;



    DBGrid1.DataSource.DataSet.Next;
  end;

  if valorb <> 0 then begin
    {dm.IBQuery1.SQL.Text := ('insert into caixa(formpagto,codgru,codmov,codentradasaida,data,documento,vencimento,codhis,historico,entrada,usuario, tipo, fornec)'+
    ' values (:pagto,'+DBGrid1.DataSource.DataSet.FieldByName('CODGRU').AsString+','+funcoes.novocod('movcaixa')+','+DBGrid1.DataSource.DataSet.FieldByName('COD').AsString+',:data,'+DBGrid1.DataSource.DataSet.FieldByName('historico').AsString+',:venc,2,'+QuotedStr(copy(DBGrid1.DataSource.DataSet.FieldByName('historico').AsString,1,length(DBGrid1.DataSource.DataSet.FieldByName('historico').AsString) - 5))+',:pago,'+StrNum(form22.codusario)+', ''R'', 1)');
    dm.IBQuery1.ParamByName('pagto').AsString  := strnum(formapagto);
    dm.IBQuery1.ParamByName('data').AsDateTime := DateOf(form22.datamov) + TimeOf(now);
    dm.IBQuery1.ParamByName('venc').AsDateTime := form22.datamov;
    dm.IBQuery1.ParamByName('pago').AsCurrency:= valorb;
    dm.IBQuery1.ExecSQL;  }

    i := lista.Add(TacumProd.Create);
    lista[i].cod   := DBGrid1.DataSource.DataSet.FieldByName('documento').AsInteger;
    lista[i].unid  := DBGrid1.DataSource.DataSet.FieldByName('historico').AsString;
    lista[i].data  := DBGrid1.DataSource.DataSet.FieldByName('vencimento').AsDateTime;
    lista[i].quant := valorb;
  end;


  if dm.IBQuery1.Transaction.Active then dm.IBQuery1.Transaction.Commit;

  copiaContasReceber(dm.IBselect);
  imprimeNota(lista, v1);
  ClientDataSet1.EnableControls;
end;


procedure TForm34.baixaF10Novo();
begin
  DBGrid1.DataSource.DataSet.DisableControls;
  try
    DBGrid1.DataSource.DataSet.First;

  finally
    DBGrid1.DataSource.DataSet.EnableControls;
  end;
end;

procedure TForm34.baixaConta();
var
  lin, i : integer;
  valorbaixado, sim, cod, fatura : string;
  valorb, v1 : currency;
  lista : TItensAcumProd;
begin
  valorbaixado := '9999999';
  valorBaixado := funcoes.ConverteNumerico(funcoes.dialogo('numero',0,'1234567890,.'+#8,2,false,'',Application.Title,'O Valor é R$ '+FormatCurr('#,###,##0.00',DBGrid1.DataSource.DataSet.FieldByName('valor').AsCurrency)+' .Qual o Valor a Ser Baixado?',FormatCurr('#,###,###0.00',DBGrid1.DataSource.DataSet.FieldByName('valor').AsCurrency)));
  if valorbaixado = '*' then begin
    exit;
  end;

  //atualizacao 18/12/2018 Wagner
  //se for maior dá uma mensagem que excedeu o valor da conta
  if StrToCurr(funcoes.ConverteNumerico(valorbaixado)) > DBGrid1.DataSource.DataSet.FieldByName('valor').AsCurrency then begin
    ShowMessage('Valor Excedeu o Total da Conta!');
    exit;
  end;

  {if StrToCurr(valorBaixado) <= 0 then begin
    MessageDlg('Valor Inválido: ' + valorBaixado, mtInformation, [mbOK], 1);
    exit;
  end;}

  if StrToCurrDef(valorbaixado, 0) = 0 then exit;

  if messageDlg('Confirma Baixa de R$ '+valorBaixado+' ?', mtConfirmation, [mbyes, mbNo], 0) = mrYes then sim := 'S'
    else sim := '*';

  if sim <> 'S' then exit;
  formapagto := funcoes.LerFormPato(0,'Contas Receber F8-Sair', true);
  if ((formapagto = '') or (formapagto = '*')) then exit;

  lista := TItensAcumProd.Create;

  valorb := StrToCurr(funcoes.ConverteNumerico(valorbaixado));
  form19.RichEdit1.Clear;

  cod := DBGrid1.DataSource.DataSet.FieldByName('cod').AsString;
  v1  := DBGrid1.DataSource.DataSet.FieldByName('valor').AsCurrency;
  lin := 0;

  //if valorb = v1 then begin
    dm.IBQuery1.Close;
    dm.IBQuery1.SQL.Clear;
    dm.IBQuery1.SQL.Add('update contasreceber set ULTVALOR = :ULTVALOR,codhis = :FORMPAGTO, valor = :valor, pago = pago + :pago, datamov = :datamov, ult_usu_alterado = :ult_usu_alterado where cod='+cod);
    dm.IBQuery1.ParamByName('ULTVALOR').AsCurrency := DBGrid1.DataSource.DataSet.FieldByName('valor').AsCurrency;
    dm.IBQuery1.ParamByName('FORMPAGTO').AsString  := strnum(formapagto);
    dm.IBQuery1.ParamByName('valor').AsCurrency    := StrToCurr(funcoes.ConverteNumerico(valorBaixado));

    if valorb < v1 then dm.IBQuery1.ParamByName('pago').AsCurrency  := 0
    else dm.IBQuery1.ParamByName('pago').AsCurrency                 := valorb;
    dm.IBQuery1.ParamByName('datamov').AsDate                       := form22.datamov;
    dm.IBQuery1.ParamByName('ult_usu_alterado').AsInteger           := StrToInt(StrNum(form22.codusario));
    dm.IBQuery1.ExecSQL;
  {end
  else if valorb < v1 then begin
    dm.IBQuery2.Close;
    dm.IBQuery2.SQL.Clear;
    dm.IBQuery2.SQL.Add('update contasreceber set FORMPAGTO = :FORMPAGTO, valor = valor - :valor, datamov = :datamov, ult_usu_alterado = :ult_usu_alterado  where cod='+cod);
    dm.IBQuery2.ParamByName('FORMPAGTO').AsString           := strnum(formapagto);
    dm.IBQuery2.ParamByName('valor').AsCurrency             := valorb;
    dm.IBQuery2.ParamByName('datamov').AsDate               := form22.datamov;
    dm.IBQuery2.ParamByName('ult_usu_alterado').AsInteger   := StrToInt(StrNum(form22.codusario));
    dm.IBQuery2.ExecSQL;
  end;}

  dm.IBQuery1.Transaction.Commit;

  funcoes.gravaAlteracao('Baixa de CR val: ' + funcoes.ConverteNumerico(valorBaixado) + ' cod: ' + cod + ' pago: ' + CurrToStr(dm.IBQuery1.ParamByName('pago').AsCurrency), 'CRB');

  i := lista.Add(TacumProd.Create);
  lista[i].cod   := DBGrid1.DataSource.DataSet.FieldByName('documento').AsInteger;
  lista[i].unid  := DBGrid1.DataSource.DataSet.FieldByName('historico').AsString;
  lista[i].quant := valorb;
  lista[i].data  := DBGrid1.DataSource.DataSet.FieldByName('vencimento').AsDateTime;

 { dm.IBQuery2.Close;
  dm.IBQuery2.SQL.text :=('insert into caixa(formpagto,codgru,codmov,codentradasaida,data,documento,vencimento,codhis,historico'+
  ',entrada,usuario, tipo, fornec) values (:pagto,:codgru,:codmov,'+StrNum(cod)+',:data,'+StrNum(DBGrid1.DataSource.DataSet.FieldByName('documento').AsString)+',:venc,2,'+QuotedStr(DBGrid1.DataSource.DataSet.FieldByName('historico').AsString)+',:pago,'+StrNum(form22.codusario)+', ''R'', 1)');
  dm.IBQuery2.ParamByName('pagto').AsString  := strnum(formapagto);
  dm.IBQuery2.ParamByName('codgru').AsString  := strnum(DBGrid1.DataSource.DataSet.FieldByName('codgru').AsString);
  dm.IBQuery2.ParamByName('codmov').AsString  := funcoes.novocod('movcaixa');
  dm.IBQuery2.ParamByName('data').AsDateTime := DateOf(form22.datamov) + timeof(now);
  dm.IBQuery2.ParamByName('venc').AsDateTime := DBGrid1.DataSource.DataSet.FieldByName('vencimento').AsDateTime;
  dm.IBQuery2.ParamByName('pago').AsCurrency := valorb;
  dm.IBQuery2.ExecSQL;
  dm.IBQuery2.Transaction.Commit;    }

  copiaContasReceber(dm.IBselect);

  imprimeNota(lista, valorb);
end;

procedure TForm34.imprimeNota(var lis : TItensAcumProd; valorb : currency);
var
  fatura, sim, valorbaixado : String;
  i, a : integer;
begin
  sim := funcoes.dialogo('generico',0,'SN',0,true,'S',Application.Title,'Deseja Imprimir o Recibo de Pagamento?','N') ;
  if ((sim = '*') or (sim <> 'S'))then exit;

  i := 0;

  if ((Form22.Pgerais.Values['nota'] = 'T') or (Form22.Pgerais.Values['nota'] = 'D')) then begin
      form19.RichEdit1.Clear;
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(#13+#10+#15)));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(funcoes.CompletaOuRepete('+','+','-',40)+#13+#10)));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar('|'+funcoes.centraliza(UpperCase(funcoes.LerValorPGerais('empresa',form22.Pgerais)),' ',38)+'|'+#13+#10)));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(funcoes.CompletaOuRepete('|','|','-',40)+#13+#10)));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(funcoes.CompletaOuRepete('|DATA: '+FormatDateTime('dd/mm/yy',form22.datamov)+'          HORA: '+FormatDateTime('tt',now),'|',' ',40)+#13+#10)));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(funcoes.CompletaOuRepete('+','+','-',40)+#13+#10)));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(funcoes.CompletaOuRepete('|RECIBO    Valor: '+FormatCurr('#,###,###0.00',valorb),' |',' ',40)+#13+#10)));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(funcoes.CompletaOuRepete('+','+','-',40)+#13+#10)));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(funcoes.CompletaOuRepete('|','|',' ',40)+#13+#10)));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(funcoes.CompletaOuRepete('|RECEBIDO DE:','|',' ',40)+#13+#10)));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(funcoes.CompletaOuRepete('|'+copy(lis[i].unid,pos('-',lis[i].unid)+1,length(lis[i].unid) - 8),'|',' ',40)+#13+#10)));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(funcoes.CompletaOuRepete('|','|',' ',40)+#13+#10)));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(funcoes.CompletaOuRepete('|A IMPORTANCIA DE R$ '+FormatCurr('#,###,###0.00',valorb),'|',' ',40)+#13+#10)));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(funcoes.CompletaOuRepete('|','|',' ',40)+#13+#10)));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(funcoes.CompletaOuRepete('|REFERENTE:','|',' ',40)+#13+#10)));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(funcoes.CompletaOuRepete('|','|',' ',40)+#13+#10)));
  end
  else begin
    dm.IBQuery2.Close;
    fatura := funcoes.novocod('RECIBO_PAGA');

    dm.IBQuery2.Close;
    dm.IBQuery2.SQL.Text := ('select ende,bairro,cnpj,telres,telcom,cid,est from registro');
    dm.IBQuery2.Open;

    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#218,'',#196,57)+funcoes.CompletaOuRepete(#194,#191,#196,21)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+funcoes.centraliza(form22.Pgerais.Values['empresa'],' ',56),'',' ',57)+funcoes.CompletaOuRepete(#179+'   R E C I B O',#179,' ',21)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+funcoes.centraliza(dm.IBQuery2.fieldbyname('ende').AsString+' - '+dm.IBQuery2.fieldbyname('bairro').AsString,' ',56),'',' ',57)+funcoes.CompletaOuRepete(#179+funcoes.centraliza( fatura,' ',19),#179,' ',21)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+funcoes.centraliza('CNPJ: '+dm.IBQuery2.fieldbyname('cnpj').AsString,' ',56),'',' ',57)+funcoes.CompletaOuRepete(#179,#179,' ',21)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+funcoes.centraliza('FONE: '+dm.IBQuery2.fieldbyname('TELRES').AsString+'   FAX: '+dm.IBQuery2.fieldbyname('TELCOM').AsString,' ',56),'',' ',57)+funcoes.CompletaOuRepete(#179+'R$:'+funcoes.CompletaOuRepete('',FormatCurr('#,###,###0.00', valorb),' ',15),#179,' ',21)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#195,'',#196,12)+funcoes.CompletaOuRepete('','',#196,9)+funcoes.CompletaOuRepete('','',#196,6)+funcoes.CompletaOuRepete('','',#196,12)+funcoes.CompletaOuRepete('','',#196,12)+funcoes.CompletaOuRepete(''+#196+#196+#196+#196+#196+#196+#193,'',#196,9)+funcoes.CompletaOuRepete('','',#196,6)+funcoes.CompletaOuRepete('',#180,#196,12)+#13+#10))));

    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+' RECEBEMOS DE '+copy(lis[i].unid, pos('-', lis[i].unid) + 1,
    length(lis[i].unid) - 8),'COD.: ' +IntToStr(lis[i].cod)+#179,' ',78)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',78)+#13+#10))));
    funcoes.QuebraLinhas(#179,#179,' A IMPORTANCIA DE '+ UpperCase(funcoes.valorPorExtenso(valorb)), 78);
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',78)+#13+#10))));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+' REFERENTE A: ',#179,' ',78)+#13+#10))));
  end;

  for I := 0 to lis.Count -1 do begin
    if ((Form22.Pgerais.Values['nota'] = 'T') or (Form22.Pgerais.Values['nota'] = 'D')) then begin
      addRelatorioForm19(funcoes.CompletaOuRepete('|'+copy(lis[i].unid,1,18)+' '+copy(lis[i].unid,
      length(lis[i].unid)-5,length(lis[i].unid)),FormatCurr('#,###,###0.00',lis[i].quant)+'|',' ',40)+ CRLF);
    end
    else begin
      addRelatorioForm19(#179 +funcoes.CompletaOuRepete( FormatDateTime('dd/mm/yy', lis[i].data) + ' ' + funcoes.CompletaOuRepete(lis[i].unid, FormatCurr('#,###,###0.00',lis[i].quant), ' ', 50),'', ' ', 76)+ #179 + #13 + #10);
    end;
  end;

  if ((Form22.Pgerais.Values['nota'] = 'T') or (Form22.Pgerais.Values['nota'] = 'D')) then begin
    sim := funcoes.valorPorExtenso(abs(valorb));
    sim := UpperCase(sim);
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(funcoes.CompletaOuRepete('+','+','-',40)+#13+#10)));
    addRelatorioForm19(funcoes.QuebraLinhas('|', '|', sim, 40));
    form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar(funcoes.CompletaOuRepete('+','+','-',40)+#13+#10)));
  end
  else begin
    if lis.Count = 1 then begin
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',78)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',78)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',78)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',78)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',78)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',78)+#13+#10))));
    end;

      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',78)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#195,#194,#196,30)+funcoes.CompletaOuRepete('',#194,#196,15)+funcoes.CompletaOuRepete('',#180,#196,33)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+' CHEQUE Nr.:',#179,' ',30)+funcoes.CompletaOuRepete(' BANCO:',#179,' ',15)+funcoes.CompletaOuRepete(' CONTA:',#179,' ',33)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',30)+funcoes.CompletaOuRepete('',#179,' ',15)+funcoes.CompletaOuRepete('',#179,' ',33)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#195+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#196+#193,#197,#196,45)+funcoes.CompletaOuRepete('',#180,#196,33)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',45)+funcoes.CompletaOuRepete('',#179,' ',33)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179+'   '+dm.IBQuery2.fieldbyname('cid').AsString+' - '+dm.IBQuery2.fieldbyname('est').AsString+', '+FormatDateTime('dd',form22.datamov)+' DE '+UpperCase(FormatDateTime('MMMM',form22.datamov))+' DE '+FormatDateTime('YYYY',form22.datamov),#179,' ',45)+funcoes.CompletaOuRepete('',#179,' ',33)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#179,#179,' ',45)+funcoes.CompletaOuRepete('            Assinatura',#179,' ',33)+#13+#10))));
      form19.RichEdit1.Perform(EM_REPLACESEL, 1, Longint(PChar((funcoes.CompletaOuRepete(#192,#193,#196,45)+funcoes.CompletaOuRepete('',#217,#196,33)+#13+#10))));
  end;


  funcoes.duplicarRichedit(StrToIntDef(funcoes.buscaParamGeral(87, '1'), 1));

  imprime.setCofiguracoesImpressora('');
  imprime.textxArq('texto.txt');
end;

end.

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
  private
    procedure abreDataSet();
    procedure abreDataSetConcluidos();
    procedure lancaEntrega;
    procedure somamov;
    { Private declarations }
  public
    dini, dfim : string;
    { Public declarations }
  end;

var
  Form89: TForm89;



implementation

uses Unit1, principal, func, Unit90;

procedure TForm89.abreDataSet();
begin
  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select v.nota, v.total, v.hora as hora_venda, v.data, v.ende_entrega, e.endereco, e.cliente, e.telefone, c.data_entrega from venda v left join ENTREGA e on (e.cod = v.ende_entrega)'+
  'left join entrega_novo c on (c.numvenda = v.nota) where ((v.data >= :ini) and (v.data <= :fim)) and v.ende_entrega > 0 and c.data_entrega is null order by nota desc';
  dm.IBselect.ParamByName('ini').AsDateTime := StrToDate(dini);
  dm.IBselect.ParamByName('fim').AsDateTime := StrToDate(dfim);
  dm.IBselect.Open;

  dm.IBselect.FieldByName('ende_entrega').Visible := false;
  dm.IBselect.FieldByName('data').Visible        := false;
  TcurrencyField(dm.IBselect.FieldByName('total')).DisplayFormat :='###,##0.00';

  DataSource1.DataSet := dm.IBselect;
end;

procedure TForm89.abreDataSetConcluidos();
begin
  dm.IBselect1.Close;
  dm.IBselect1.SQL.Text := 'select v.nota, d.nome, c.usuario_baixa, v.total, v.data, v.hora as hora_venda, v.ende_entrega, e.endereco, e.cliente, e.telefone, c.data_entrega, c.valor from venda v left join ENTREGA e on (e.cod = v.ende_entrega)'+
  'left join entrega_novo c on (c.numvenda = v.nota) left join entregador d on (d.cod = c.usuario_baixa)  where ((cast(c.data_entrega as date) >= :ini) and (cast(c.data_entrega as date) <= :fim)) '+
  'and v.ende_entrega > 0 and not(c.data_entrega is null) order by c.data_entrega desc';
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

procedure TForm89.DBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
  if UpCase(key) = 'T' then begin
    somamov;
  end;

end;

{$R *.dfm}

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
begin
  lista := TStringList.Create;
  nomes := TStringList.Create;
  i := dm.IBselect1.RecNo;

  dm.IBselect1.DisableControls;

  dm.IBselect1.First;
  while not dm.IBselect1.Eof do begin
    codentr := strnum(dm.IBselect1.FieldByName('USUARIO_BAIXA').AsString);
    lista.Values[codentr] := CurrToStr(StrToCurrDef(lista.Values[codentr], 0) + dm.IBselect1.FieldByName('valor').AsCurrency);
    if nomes.Values[codentr] = '' then nomes.Values[codentr] := dm.IBselect1.FieldByName('nome').AsString;

    dm.IBselect1.Next;
  end;

  dm.IBselect1.RecNo := i;
  dm.IBselect1.EnableControls;

  rel := '';
  for i := 0 to lista.Count -1 do begin
    rel := rel + CompletaOuRepete(leftstr(lista.Names[i]+'-' + nomes.Values[lista.Names[i]], 30), '', '.', 30) + ' ' + CompletaOuRepete('', formataCurrency(StrToCurrDef(lista.ValueFromIndex[i], 0)), ' ', 13) + #13;
  end;

  //ShowMessage(lista.Text + #13 + #13  + nomes.Text);
  funcoes.Mensagem('Soma Por Entregador - ControlW Sistemas', rel,9,'Courier New',true,0,clBlack, false);
end;



end.

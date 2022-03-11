unit Unit68;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, func, Data.DB, jsedit1;

type
  TForm68 = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    data: TLabel;
    Label1: TLabel;
    DataSource1: TDataSource;
    JsBotao1: TBitBtn;
    procedure JsBotao1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure JsBotao1KeyPress(Sender: TObject; var Key: Char);
  private
    dini, dfim : String;

    { Private declarations }
  public
    procedure abredataset;
    procedure consultaManifesto(nnf : String);
    { Public declarations }
  end;

var
  Form68: TForm68;

implementation

{$R *.dfm}

uses Unit1, Unit63, email, Unit71, Unit78;

procedure TForm68.DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
var
  mani : String;
begin
  try
    mani := trim(DBGrid1.DataSource.DataSet.FieldByName('MANIFESTACAO').AsString);
  except
  end;

  if mani <> '' then
    begin
      DBGrid1.Canvas.Brush.Color := HexToTColor('5F9EA0');
      DBGrid1.Canvas.FillRect(Rect);
      DBGrid1.DefaultDrawDataCell(Rect, Field, State) // Reescreve o valor que vem do banco
    end
end;

procedure TForm68.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #32 then begin
    consultaManifesto('');
  end;
end;

procedure TForm68.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  cf : String;
begin
  if key = 113 then begin //F2
    if DBGrid1.DataSource.DataSet.FieldByName('chave').AsString = '' then begin
      MessageDlg('Chave da NFe Inv�lida!', mtInformation, [mbOK], 1);
      exit;
    end;

    form78 := TForm78.Create(self);
    form78.EditChave.Text := DBGrid1.DataSource.DataSet.FieldByName('chave').AsString;
    form78.nsu            := DBGrid1.DataSource.DataSet.FieldByName('nsu').AsString;
    form78.ShowModal;
    form78.Free;

    abredataset;
  end;

  if key = 114 then begin //F3
  {  if DBGrid1.DataSource.DataSet.FieldByName('chave').AsString = '' then begin
      MessageDlg('Chave da NFe Inv�lida!', mtInformation, [mbOK], 1);
      exit;
    end;}

    form78 := TForm78.Create(self);
    form78.EditChave.Text := DBGrid1.DataSource.DataSet.FieldByName('chave').AsString;
    form78.nsu            := DBGrid1.DataSource.DataSet.FieldByName('nsu').AsString;
    form78.imprimir := true;
    form78.ShowModal;
    form78.Free;
  end;

  if key = 115 then begin //F4
    if DBGrid1.DataSource.DataSet.FieldByName('chave').AsString = '' then begin
      MessageDlg('Chave da NFe Inv�lida!', mtInformation, [mbOK], 1);
      exit;
    end;

    cf := DBGrid1.DataSource.DataSet.FieldByName('chave').AsString;
    form71 := tform71.Create(self);
    form71.EditChave.Text := DBGrid1.DataSource.DataSet.FieldByName('chave').AsString;
    form71.ShowModal;
    form71.Free;

    abredataset;
    DBGrid1.DataSource.DataSet.Locate('chave', cf, []);
  end;
end;

procedure TForm68.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure TForm68.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 116 then begin
    JsBotao1.Click;
  end;
end;

procedure TForm68.JsBotao1Click(Sender: TObject);
begin
  funcoes.distribuicaoNFe;
  abredataset;
end;

procedure TForm68.JsBotao1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
  
end;

procedure TForm68.abredataset;
var
  i, acc : integer;
begin
  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select valor from pgerais where cod = 10001';
  dm.IBselect.Open;

  Label1.Caption := 'Ultima Atualiza��o: ' + dm.IBselect.FieldByName('valor').AsString;
               {
  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select NOME, CNPJ, DATA, CHAVE, VALOR, IE, IIF(TPNF = ''S'', ''SAIDA'', ''ENTRADA'' ) AS TIPO,' +
  ' CASE SIT when ''A'' then ''AUTORIZADA'' when ''D'' then ''DENEGADA'' when ''C'' then ''CANCELADA'' end as SITUACAO' +
  ' FROM nfedistribuicao where data >= :dini and data <= :dfim order by data desc';
  dm.IBselect.ParamByName('dini').AsDate := StrToDate(dini);
  dm.IBselect.ParamByName('dfim').AsDate := StrToDate(dfim);
  dm.IBselect.Open; }

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select NOME, CNPJ, DATA,substring(chave from 26 for 9) as nnf, CHAVE, VALOR, IE, IIF(TPNF = ''S'', ''SAIDA'', ''ENTRADA'' ) AS TIPO,' +
  ' CASE SIT when ''A'' then ''AUTORIZADA'' when ''D'' then ''DENEGADA'' when ''C'' then ''CANCELADA'' end as SITUACAO, ' +
  ' CASE MANIFESTADA when ''0'' then ''Confirma��o da opera��o'' when ''1'' then ''Ci�ncia da emiss�o'' when ' +
  ' ''2'' then ''Opera��o n�o realizada'' when ''3'' then ''Desconhecimento da opera��o'' end as MANIFESTACAO,  MANIFESTADA, nsu '+
  ' FROM nfedistribuicao where chave <> '''' order by cast(nsu as integer) desc';
  dm.IBselect.Open;

  DataSource1.DataSet := dm.IBselect;
  acc := 0;

  for I := 0 to DBGrid1.Columns.Count -1 do begin
    acc := acc + DBGrid1.Columns[i].Width;
  end;

  self.Width := acc + 100;
  if self.Width > screen.Width then self.Width := Screen.Width - 20;
  Self.Height := Screen.Height - trunc(screen.Height * 0.1);
  DBGrid1.Height := self.Height - Panel1.Height - 40;

  JsBotao1.Left := self.Width - JsBotao1.Width - 30;
  dm.IBselect.FieldByName('data').DisplayLabel := 'EMISS�O';
  TCurrencyField(DM.IBselect.FieldByName('valor')).currency := false;
  TCurrencyField(DM.IBselect.FieldByName('valor')).DisplayFormat := '#,###,###0.00';

  dm.IBselect.FieldByName('MANIFESTADA').Visible := false;

  dm.IBselect.FieldByName('nnf').DisplayLabel := 'Num. Nota Fiscal';


  {try
    data.Caption := 'Data da Consulta: '+formataDataDDMMYY(StrToDate(dini))+' a ' +formataDataDDMMYY(StrToDate(dfim));
  except}
    data.Caption := 'F2-Download XML F3-Imprimir NFe F4-Manifestar NFe'  ;
  //end;

end;


procedure TForm68.consultaManifesto(nnf : String);
var
  nota : String;
begin
  if nnf = '' then begin
    nnf := funcoes.dialogo('generico',0,'1234567890'+#8,100,false,'',Application.Title,'Informe o N�mero Da Nota:', nnf);
    if nnf = '*' then exit;
  end;

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text := 'select NOME, CNPJ, DATA, substring(chave from 26 for 9) as nnf, CHAVE, VALOR, IE, IIF(TPNF = ''S'', ''SAIDA'', ''ENTRADA'' ) AS TIPO,' +
  ' CASE SIT when ''A'' then ''AUTORIZADA'' when ''D'' then ''DENEGADA'' when ''C'' then ''CANCELADA'' end as SITUACAO, ' +
  ' CASE MANIFESTADA when ''0'' then ''Confirma��o da opera��o'' when ''1'' then ''Ci�ncia da emiss�o'' when ' +
  ' ''2'' then ''Opera��o n�o realizada'' when ''3'' then ''Desconhecimento da opera��o'' end as MANIFESTACAO,  MANIFESTADA '+
  ' FROM nfedistribuicao where substring(chave from 26 for 9) = :nota  order by data desc';
  dm.IBQuery1.ParamByName('nota').AsString := CompletaOuRepete('',nnf, '0', 9);
  dm.IBQuery1.Open;



  nota := funcoes.busca(dm.IBQuery1, '', 'nnf', 'nnf', '');
  if nota <> '' then dm.IBselect.Locate('nnf', nota, []);
  
end;

end.

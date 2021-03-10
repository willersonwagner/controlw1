unit declaracaoImportacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, sBitBtn,
  Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Data.DB, Datasnap.DBClient, StrUtils;

type
  TForm85 = class(TForm)
    numdi: TEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    datadi: TMaskEdit;
    localDesemb: TEdit;
    Label3: TLabel;
    UfDesemb: TComboBox;
    dataDesemb: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    sBitBtn1: TsBitBtn;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    ClientDataSet1cod: TIntegerField;
    ClientDataSet1nome: TStringField;
    viaTransporte: TComboBox;
    Label6: TLabel;
    Label7: TLabel;
    tpintermedio: TComboBox;
    ClientDataSet1quant: TCurrencyField;
    ClientDataSet1total: TCurrencyField;
    procedure FormShow(Sender: TObject);
    procedure numdiKeyPress(Sender: TObject; var Key: Char);
    procedure datadiKeyPress(Sender: TObject; var Key: Char);
    procedure localDesembKeyPress(Sender: TObject; var Key: Char);
    procedure UfDesembKeyPress(Sender: TObject; var Key: Char);
    procedure dataDesembKeyPress(Sender: TObject; var Key: Char);
    procedure sBitBtn1Click(Sender: TObject);
    procedure viaTransporteKeyPress(Sender: TObject; var Key: Char);
    procedure tpintermedioKeyPress(Sender: TObject; var Key: Char);
  private
    function verificaCampos() : boolean;
    procedure preencheUF;

    { Private declarations }
  public
    nota : String;
    function getRetornoCampos : String;
    procedure clearCampos;
    procedure abreVenda;
    { Public declarations }
  end;

var
  Form85: TForm85;

implementation

{$R *.dfm}

uses func, Unit1;

procedure TForm85.dataDesembKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then viaTransporte.SetFocus;
end;

procedure TForm85.datadiKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then localDesemb.SetFocus;
end;

procedure TForm85.FormShow(Sender: TObject);
begin
  numdi.SetFocus;
  if UfDesemb.Items.Count = 0 then preencheUF;
  abreVenda;
end;

procedure TForm85.localDesembKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then UfDesemb.SetFocus;
end;

procedure TForm85.numdiKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then datadi.SetFocus;
end;

procedure TForm85.sBitBtn1Click(Sender: TObject);
begin
  if verificaCampos = false then exit;
  CLOSE;
end;

procedure TForm85.tpintermedioKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then sBitBtn1.SetFocus;
end;

procedure TForm85.UfDesembKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then dataDesemb.SetFocus;
end;

function TForm85.verificaCampos() : boolean;
begin
  Result := false;

  if numdi.Text = '' then begin
    ShowMessage('Número da Declaração de Importação Não preenchido!');
    numdi.SetFocus;
    exit;
  end;

  if strnum(datadi.Text) = '0' then begin
    ShowMessage('Data da Declaração de Importação Não preenchido!');
    datadi.SetFocus;
    exit;
  end;

  if localDesemb.Text = '' then begin
    ShowMessage('Local do Desembaraço Não preenchido!');
    localDesemb.SetFocus;
    exit;
  end;

  if UfDesemb.Text = '' then begin
    ShowMessage('UF de Desembaraço Não preenchido!');
    UfDesemb.SetFocus;
    exit;
  end;

  if strnum(dataDesemb.Text) = '0' then begin
    ShowMessage('Data do Desembaraço Não preenchido!');
    dataDesemb.SetFocus;
    exit;
  end;

  Result := true;
end;

procedure TForm85.viaTransporteKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then tpintermedio.SetFocus;
end;

function TForm85.getRetornoCampos : String;
begin
  Result := '|'+numdi.Text + '|' + datadi.Text + '|' + localDesemb.Text + '|' +
  UfDesemb.Text + '|' + dataDesemb.Text + '|' + LeftStr(viaTransporte.Items[viaTransporte.ItemIndex], 1) +
  '|' + LeftStr(tpintermedio.Items[tpintermedio.ItemIndex], 1) + '|';
end;

procedure TForm85.preencheUF;
begin
  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select cod,nome from estados';
  dm.IBselect.Open;

  UfDesemb.Clear;
  while not dm.IBselect.Eof do begin
    UfDesemb.Items.Add(dm.IBselect.FieldByName('nome').AsString);
    dm.IBselect.Next;
  end;

  UfDesemb.AutoComplete := true;
  UfDesemb.ItemIndex    := 0;
end;

procedure TForm85.clearCampos;
begin
  numdi.Clear;
  datadi.Clear;
  localDesemb.Clear;
  dataDesemb.Clear;
end;

procedure TForm85.abreVenda;
begin
  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select i.cod, p.nome, i.quant, i.total from item_venda i ' +
  ' left join produto p on (p.cod = i.cod) where i.nota = :nota';
  dm.IBselect.ParamByName('nota').AsString := nota;
  dm.IBselect.Open;

  try
    ClientDataSet1.CreateDataSet;
  except
  end;

  while not dm.IBselect.Eof do begin
    ClientDataSet1.Append;
    ClientDataSet1cod.AsString := dm.IBselect.FieldByName('cod').AsString;
    ClientDataSet1nome.AsString := dm.IBselect.FieldByName('nome').AsString;
    ClientDataSet1quant.AsCurrency := dm.IBselect.FieldByName('quant').AsCurrency;
    ClientDataSet1total.AsCurrency := dm.IBselect.FieldByName('total').AsCurrency;
    ClientDataSet1.Post;

    dm.IBselect.Next;
  end;
end;

end.

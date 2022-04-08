unit Unit14;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Data.DB,
  Datasnap.DBClient,func;

type
  TForm14 = class(TForm)
    DBGrid1: TDBGrid;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    ClientDataSet1CODIGO: TStringField;
    ClientDataSet1PAG: TStringField;
    ClientDataSet1VALOR: TCurrencyField;
    ClientDataSet1CONFERIDO: TCurrencyField;
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
   { Public declarations }
  end;

var
  Form14: TForm14;

implementation

{$R *.dfm}

procedure TForm14.DBGrid1KeyPress(Sender: TObject; var Key: Char);
var
  cValor : String;
  i : integer;
begin
  if key = #13  then begin
    cValor := dialogo('numero', 0, '1234567890,.' + #8, 0, false, 'ok', 'Control for Windows:', 'Qual o Valor em Caixa (Registrado R$: '+formataCurrency(ClientDataSet1VALOR.AsCurrency)+' ) ?', '0,00');
    if cValor = '*' then exit;

    i := ClientDataSet1.RecNo;
    ClientDataSet1.Edit;
    ClientDataSet1CONFERIDO.AsCurrency := StrToCurrDef(cValor, 0);
    ClientDataSet1.Post;
  end;

  if key = #27 then close;
end;

end.

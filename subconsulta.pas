unit subconsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB,  Grids, DBGrids, DBClient;

type
  TForm25 = class(TForm)
    ClientDataSet1: TClientDataSet;
    DBGrid1: TDBGrid;
    ClientDataSet1CODBAR: TStringField;
    ClientDataSet1DESCRICAO: TStringField;
    ClientDataSet1PRECO: TBCDField;
    ClientDataSet1ESTOQUE: TBCDField;
    ClientDataSet1COD: TIntegerField;
    DataSource1: TDataSource;
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form25: TForm25;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm25.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then Close;
  if key=#13 then
    begin
      //dm.produto
      dm.produto.Locate('cod', DBGrid1.DataSource.DataSet.fieldbyname('cod').AsString, []);
      close;
    end;
end;

procedure TForm25.FormCreate(Sender: TObject);
begin
  ClientDataSet1.CreateDataSet;
end;

procedure TForm25.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then Close;
end;

end.

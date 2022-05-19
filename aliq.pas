unit aliq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB,   Vcl.ExtCtrls,FireDAC.Comp.Client,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  Taliq1 = class(TForm)
    DBGrid1: TDBGrid;
    IBTable1: TFDTable;
    DataSource1: TDataSource;
    Panel1: TPanel;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IBTable1BeforeInsert(DataSet: TDataSet);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  aliq1: Taliq1;

implementation

uses Unit1, func;

{$R *.dfm}

procedure Taliq1.FormShow(Sender: TObject);
begin
  IBTable1.Connection := dm.bd;
  IBTable1.TableName := 'ALIQ';
  IBTable1.Open;
  funcoes.FormataCampos(TFDQuery(ibtable1),2,'',2);
end;

procedure Taliq1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 113 then begin
    IBTable1.Append;
  end;

  if key = 114 then begin
    IBTable1.Post;
  end;

  if key = 46 then begin
    if MessageDlg('Deseja Excluir esse Registro ?', mtConfirmation, [mbYes, mbNo], 1, mbNo) = IDYES then begin
      IBTable1.Delete;
    end;
  end;
end;

procedure Taliq1.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  IF key = #27 then close;
end;

procedure Taliq1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IBTable1.Close;
  IBTable1.Free;
end;

procedure Taliq1.IBTable1BeforeInsert(DataSet: TDataSet);
begin
  if DBGrid1.Focused then Abort;
end;

end.

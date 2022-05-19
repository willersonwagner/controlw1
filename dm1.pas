unit dm1;

interface

uses
  SysUtils, Classes, DB,   IBDatabase, FireDAC.Comp.Client, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TdmSmall = class(TDataModule)
    BdSmall: TFDConnection;
    IBTransaction1: TFDTransaction;
    IBQuerySmall: TFDQuery;
    IBQueryPagto: TFDQuery;
    IBQuery2: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmSmall: TdmSmall;

implementation

{$R *.dfm}

end.

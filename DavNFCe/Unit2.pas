unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.
  IBX. ACBrNFeDANFeESCPOS, ACBrDANFCeFortesFr, IdBaseComponent,
  IdAntiFreezeBase, Vcl.IdAntiFreeze, ACBrBase, ACBrDFe, ACBrNFe,
  ACBrNFeDANFEClass, ACBrNFeDANFeRLClass;

type
  TForm2 = class(TForm)
    ACBrNFeDANFeRL1: TACBrNFeDANFeRL;
    ACBrNFe1: TACBrNFe;
    ACBrNFeDANFCeFortes1: TACBrNFeDANFCeFortes;
    ACBrNFeDANFeESCPOS1: TACBrNFeDANFeESCPOS;
    Query1: TFDQuery;
    Query3: TFDQuery;
    Query2: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

end.

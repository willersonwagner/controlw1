unit untMovto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, OleCtrls, SHDocVw, StdCtrls, Grids, DBGrids, ExtCtrls,
  Buttons, DB, ACBrNFeDANFEClass,
  pcnConversao,

  untNFCe;

type
  TfrmTransferenciaCupom = class(TForm)
    Panel1: TPanel;
    btnOK: TBitBtn;
    btnCancelar: TBitBtn;
    PageControl1: TPageControl;
    tbsPrincipal: TTabSheet;
    tbsResposta: TTabSheet;
    MemoResp: TMemo;
    tbsWebResposta: TTabSheet;
    WBResposta: TWebBrowser;
    stbmain: TStatusBar;
  private
    { Private declarations }
  public
    nunotafe:string;
    { Public declarations }
  end;

   function dlgTransferenciaCF(const nota : String):Boolean;

var
  frmTransferenciaCupom: TfrmTransferenciaCupom;

implementation

uses untDtmMain, ACBrNFe, ACBrNFeConfiguracoes;

{$R *.dfm}

function dlgTransferenciaCF(const nota : String):Boolean;
begin
 Result := false;
 try
  frmTransferenciaCupom := TfrmTransferenciaCupom.Create(nil);
  frmTransferenciaCupom.nunotafe := nota;
  with frmTransferenciaCupom do
   begin
    ShowModal;
    if ModalResult = mrOk then
    Result := true;
   end;
 finally
  FreeAndNil(frmTransferenciaCupom);
 end;
end;

end.

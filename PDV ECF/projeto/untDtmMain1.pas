unit untDtmMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Forms,Dialogs, IniFiles,
  ImgList, Controls, DB, StdCtrls, ComCtrls, IBQuery, IBDatabase, ACBrECF,
  ACBrBase, IBCustomDataSet, ACBrBAL, ACBrSocket, ACBrIBPTax;

type
  TdtmMain = class(TDataModule)
    imlMain: TImageList;
    OpenDlg: TOpenDialog;
    bd: TIBDatabase;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    IBQuery2: TIBQuery;
    IBQuery3: TIBQuery;
    IBTransaction2: TIBTransaction;
    ACBrBAL1: TACBrBAL;
    ACBrIBPTax1: TACBrIBPTax;
    ACBrECF1: TACBrECF;
  private    { Private declarations }
  public     { Public declarations }
  end;


var
  dtmMain: TdtmMain;

implementation


{$R *.DFM}



end.



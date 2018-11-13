unit Unit66;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JsEditNumero1, JsEdit1,
  BMDThread, ACBrNFe;

type
  TTT = class(TForm)
    BMDThread1: TBMDThread;
    Label1: TLabel;
    procedure BMDThread1Execute(Sender: TObject; Thread: TBMDExecuteThread;
      var Data: Pointer);
    procedure BMDThread1Start(Sender: TObject; Thread: TBMDExecuteThread;
      var Data: Pointer);
  private
    { Private declarations }
  public
    ACBRNF : TACBRNFE;
    cont : integer;
    { Public declarations }
  end;

var
  TT: TTT;

implementation

{$R *.dfm}

procedure TTT.BMDThread1Execute(Sender: TObject;
  Thread: TBMDExecuteThread; var Data: Pointer);
begin
  ACBRNF.Enviar(1, FALSE, TRUE);
end;

procedure TTT.BMDThread1Start(Sender: TObject; Thread: TBMDExecuteThread;
  var Data: Pointer);
begin
  cont := 0;
end;

end.

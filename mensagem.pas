unit mensagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls,FireDAC.Comp.Client;

type
  TForm23 = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    Panel1: TPanel;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
  private
     i:integer;
    { Private declarations }
  public
     informarcao:string;
     primeiro:string;
     aberto:boolean;
     vezes:integer;
     ibq: TFDQuery;
    { Public declarations }
  end;

var
  Form23: TForm23;

implementation

{$R *.dfm}

procedure TForm23.FormShow(Sender: TObject);
begin
  i:=0;
  ProgressBar1.Position:=0;
 end;

end.

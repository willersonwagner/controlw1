unit U_Carregando;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls;

type
  TF_Carregando = class(TForm)
    Panel1: TPanel;
    Shape1: TShape;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Carregando: TF_Carregando;

implementation

{$R *.dfm}

procedure TF_Carregando.FormActivate(Sender: TObject);
begin
  DoubleBuffered:= True;
  Application.ProcessMessages;
end;

end.

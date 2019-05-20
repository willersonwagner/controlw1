unit Unit77;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  JsBotao1, Vcl.ExtCtrls, principal;

type
  TForm77 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Memo1: TMemo;
    ToolBar1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    procedure PageControl1Enter(Sender: TObject);
    procedure JsBotao1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form77: TForm77;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm77.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    close;
  end;
end;

procedure TForm77.JsBotao1Click(Sender: TObject);
begin
  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text := 'update or insert into OBS_VENDA(obs, nota) values (:obs, -1)';
  dm.IBQuery1.ParamByName('obs').AsString := Memo1.Text;
  dm.IBQuery1.ExecSQL;
  dm.IBQuery1.Transaction.Commit;

  ShowMessage('Informação Alterada Com Sucesso!');
end;

procedure TForm77.PageControl1Enter(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 0 then begin
    dm.IBselect.Close;
    dm.IBselect.SQL.Text := 'select * from OBS_VENDA where nota = -1';
    dm.IBselect.Open;

    Memo1.Lines.Text := dm.IBselect.FieldByName('obs').AsString;

    if ((trim(Memo1.Lines.Text) = '') and (FileExists(caminhoEXE_com_barra_no_final + 'serv.dat'))) then begin
      Memo1.Lines.LoadFromFile(caminhoEXE_com_barra_no_final + 'serv.dat');
    end;
  end;
end;

end.

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses StrUtils;

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
var
  op, op1 : TOpenDialog;
  arq, arq1 : TStringList;
  i, a, ini : integer;
begin
  op := TOpenDialog.Create(self);
  op.Title := 'Arquivo com Novos Codigos';
  if op.Execute = false then exit;

  op1 := TOpenDialog.Create(self);
  op1.Title := 'Arquivo IBPT.csv';
  if op1.Execute = false then exit;


  arq  := TStringList.Create;
  arq1 := TStringList.Create;

  arq.LoadFromFile(op.FileName);
  arq1.LoadFromFile(op1.FileName);

  ini := arq1.Count;
  for i := 0 to arq.Count -1 do begin
    arq1.Add(LeftStr(arq[i], 8) + ';;2;"NCM adicionado 08/04/2022";13.45;15.45;0.00;5.00;01/11/2020;31/01/2021;5DC0AE;20.2.C;IBPT/empresometro.com.br');
  end;

  ShowMessage('Linhas Adicionadas: '+ IntToStr(arq1.Count - ini));
  arq1.SaveToFile(op1.FileName);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  op, op1 : TOpenDialog;
  arq, arq1 : TStringList;
  i, a, ini : integer;
begin
  op := TOpenDialog.Create(self);
  op.Title := 'Arquivo com NCM EXCLUIDOS';
  if op.Execute = false then exit;

  op1 := TOpenDialog.Create(self);
  op1.Title := 'Arquivo IBPT.csv';
  if op1.Execute = false then exit;


  arq  := TStringList.Create;
  arq1 := TStringList.Create;

  arq.LoadFromFile(op.FileName);
  arq1.LoadFromFile(op1.FileName);

  ini := arq1.Count;
  for i := 0 to arq.Count -1 do begin
    for a :=0 to arq1.Count-1 do begin
      if LeftStr(arq[i], 8) = LeftStr(arq1[a], 8) then begin
        arq1.Delete(a);
        break;
      end;
    end;
  end;

  ShowMessage('Linhas excluidas: '+ IntToStr(ini - arq1.Count));
  arq1.SaveToFile(op1.FileName);



end;

end.

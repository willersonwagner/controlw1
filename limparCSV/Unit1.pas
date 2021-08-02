unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  op : TOpenDialog;
  arq, arq2 : TStringList;
  i, ok : integer;
begin
  op := TOpenDialog.Create(self);
  if op.Execute = false then exit;

  arq := TStringList.Create;
  arq2 := TStringList.Create;
  arq.LoadFromFile(op.FileName);

  ok := 0;
  for i := 0 to arq.Count -1 do begin
    if pos('DATA LAN', arq[i]) > 0 then ok := 1;
    if (pos('PIX', arq[i]) > 0) and (pos('WILLERSON', arq[i]) = 0) and (pos('; -', arq[i]) = 0) then arq2.Add(arq[i]);

    if ok = 1 then begin
      if pos('DATA LAN', arq[i]) > 0 then arq2.Add(arq[i])
      else begin
        if pos('DEPOSITO', arq[i]) > 0 then begin
          if pos('; -', arq[i]) = 0 then arq2.Add(arq[i]);
        end;
      end;
    end;

    {if ok = 1 then begin
      arq2.Add(arq[i]);
    end;}
  end;

  arq2.SaveToFile(ExtractFileDir(op.FileName) + '\inter.csv');
  arq.Free;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  op : TOpenDialog;
  arq, arq2 : TStringList;
  i, ok : integer;
begin
  op := TOpenDialog.Create(self);
  if op.Execute = false then exit;

  arq := TStringList.Create;
  arq2 := TStringList.Create;
  arq.LoadFromFile(op.FileName);

  ok := 0;
  for i := 0 to arq.Count -1 do begin
    if pos('recebida', arq[i]) > 0 then begin
      if pos('; -', arq[i]) = 0 then arq2.Add(arq[i]);
    end;
  end;

  arq2.Add('');
  arq2.Add('');


  for i := 0 to arq.Count -1 do begin
    if pos('Taxa de boleto', arq[i]) > 0 then begin
      if pos('; -', arq[i]) = 0 then arq2.Add(arq[i]);
    end;
  end;

  arq2.SaveToFile(ExtractFileDir(op.FileName) + '\Asaas.csv');
  arq.Free;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  op : TOpenDialog;
  arq, arq2 : TStringList;
  i, ok : integer;
begin
  op := TOpenDialog.Create(self);
  if op.Execute = false then exit;

  arq := TStringList.Create;
  arq2 := TStringList.Create;
  arq.LoadFromFile(op.FileName);

  ok := 0;
  for i := 0 to arq.Count -1 do begin
    if pos('Últimos Lançamentos', arq[i]) > 0 then break;
    if pos('LIQUIDACAO', arq[i]) > 0 then begin
      arq2.Add(arq[i]);
    end;
  end;

  arq2.Add('');
  arq2.Add('');


  for i := 0 to arq.Count -1 do begin
    if pos('Últimos Lançamentos', arq[i]) > 0 then break;
    if ((pos('TARIFA', arq[i]) > 0) and (pos('COBRANCA', arq[i]) > 0)) then begin
      arq2.Add(arq[i]);
    end;
  end;

  arq2.SaveToFile(ExtractFileDir(op.FileName) + '\novo.csv');
  arq.Free;
end;

end.

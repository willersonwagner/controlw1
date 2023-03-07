unit frmStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, ComCtrls, Buttons, printers, untDtmMain, untnfceForm;

type
  Tmfd = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    RichEdit1: TRichEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RichEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    procedure imprime();
    procedure imprimeESCPOS();
    procedure imprimeESCPOS1();
    { Public declarations }
  end;

var
  mfd: Tmfd;

implementation

{$R *.dfm}

uses untVendaPDV;

procedure Tmfd.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if(Key = vk_escape) then
   begin
    close;
   end;


  if (ssCtrl in Shift) and (UpCase(Chr(Key)) = 'P') then begin
    BitBtn1.Click;
  end;

  if (ssCtrl in Shift) and (UpCase(Chr(Key)) = 'S') then begin
    BitBtn2.Click;
  end;
end;

procedure Tmfd.RichEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tmfd.BitBtn2Click(Sender: TObject);
var
  sa : TSaveDialog;
begin
  sa := TSaveDialog.Create(self);
  sa.Filter := 'Aquivo Texto|*.txt|';
  sa.DefaultExt := 'txt';
  sa.Execute;
  if sa.FileName = '' then exit;
  RichEdit1.Lines.SaveToFile(sa.FileName);

  ShowMessage('Arquivo Salvo em: ' + #13 + sa.FileName);
  sa.Free;
end;

procedure Tmfd.BitBtn1Click(Sender: TObject);
var
  ini, fim  : integer;
  PrintText : TextFile;
  lin : String;
  controle : boolean;
begin
  if ((tipoIMPRESSAO = 1) and (FileExists(ExtractFileDir(ParamStr(0))  + '\impnormal.dat') = false)) then
    begin
      imprimeESCPOS1;
      exit;
    end;

  fim := RichEdit1.Lines.Count -1;
  AssignPrn(PrintText);
  Printer.Canvas.Font.Style := [fsBold];
  Printer.Canvas.Font.Name := 'Courier New';
  printer.Canvas.Font.Size := 8;
  printer.title := 'Impressão Relatório: Rel de Vendas';
  Rewrite(PrintText);
  Writeln(PrintText, '  ');
  for ini := 0 to fim do
    begin
      Writeln(PrintText, RichEdit1.Lines[ini]);
    end;

  Writeln(PrintText, '  ');
  Writeln(PrintText, '  ');
  Writeln(PrintText, '  ');
  if tipoImp = 2 then Writeln(PrintText, #27 + #119);

  CloseFile(PrintText);
end;

procedure Tmfd.imprime();
var
  ini, fim  : integer;
  PrintText : TextFile;
begin
  if ((tipoIMPRESSAO = 1) and (FileExists(ExtractFileDir(ParamStr(0))  + '\impnormal.dat') = false)) then
    begin
      imprimeESCPOS;
      exit;
    end;

  fim := RichEdit1.Lines.Count -1;
  AssignPrn(PrintText);
  Printer.Canvas.Font.Style := [fsBold];
  Printer.Canvas.Font.Name := 'Courier New';
  printer.Canvas.Font.Size := 8;
  printer.title := 'Impressão Relatório: Rel de Vendas';
  Rewrite(PrintText);
  Writeln(PrintText, '  ');
  for ini := 0 to fim do
    begin
      Writeln(PrintText, RichEdit1.Lines[ini]);
    end;

  Writeln(PrintText, '  ');
  Writeln(PrintText, '  ');
  Writeln(PrintText, '  ');
  if tipoImp = 2 then Writeln(PrintText, #27 + #119);

  CloseFile(PrintText);
end;

procedure Tmfd.imprimeESCPOS();
var
  ini, fim  : integer;
  PrintText : TextFile;
  lin : String;
  controle : boolean;
begin
  controle := dtmMain.ACBrPosPrinter1.ControlePorta;
  dtmMain.ACBrPosPrinter1.TraduzirTags := true;

  //dtmMain.ACBrPosPrinter1.ControlePorta := false;

  fim := RichEdit1.Lines.Count -1;
  try
    form3.inicializarImpressora;
  except
  end;

  for ini := 0 to fim do
    begin

      lin := RichEdit1.Lines[ini];
      if CheckBox1.Checked then lin := '<n>' + lin + '</n>'
      else lin := '<fn>' + lin;

      dtmMain.ACBrPosPrinter1.ImprimirLinha(lin);
      Sleep(1);
    end;


  dtmMain.ACBrPosPrinter1.ImprimirLinha('-');
  dtmMain.ACBrPosPrinter1.ImprimirLinha('-');
  dtmMain.ACBrPosPrinter1.ImprimirLinha('-');
  dtmMain.ACBrPosPrinter1.ImprimirLinha('-');

  //dtmMain.ACBrPosPrinter1.PularLinhas(5);
  dtmMain.ACBrPosPrinter1.CortarPapel();
  dtmMain.ACBrPosPrinter1.ControlePorta := controle;
end;

procedure Tmfd.imprimeESCPOS1();
var
  ini, fim  : integer;
  PrintText : TextFile;
  lin : String;
  controle : boolean;
begin
  controle := dtmMain.ACBrPosPrinter1.ControlePorta;
  //dtmMain.ACBrPosPrinter1.ControlePorta := false;

  fim := RichEdit1.Lines.Count -1;
  try
    form3.inicializarImpressora;
  except
  end;

  dtmMain.ACBrPosPrinter1.Buffer.Clear;

  for ini := 0 to fim do begin
      lin := RichEdit1.Lines[ini];
      if CheckBox1.Checked then lin := '<n>' + lin + '</n>'
      else lin := '</fn>' + lin;

      dtmMain.ACBrPosPrinter1.Buffer.Add(lin);
      Sleep(1);
  end;

  dtmMain.ACBrPosPrinter1.Buffer.Add('-');
  dtmMain.ACBrPosPrinter1.Buffer.Add('-');
  dtmMain.ACBrPosPrinter1.Buffer.Add('-');
  dtmMain.ACBrPosPrinter1.Buffer.Add('</corte_total>');
  dtmMain.ACBrPosPrinter1.Imprimir;

  dtmMain.ACBrPosPrinter1.ControlePorta := controle;
  dtmMain.ACBrPosPrinter1.Desativar;
end;

procedure Tmfd.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

end.

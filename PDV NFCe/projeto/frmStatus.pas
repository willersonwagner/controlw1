unit frmStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, ComCtrls, Buttons, printers, untDtmMain, untnfceForm;

type
  Tmfd = class(TForm)
    RichEdit1: TRichEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
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
    { Public declarations }
  end;

var
  mfd: Tmfd;

implementation

{$R *.dfm}

procedure Tmfd.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if(Key = vk_escape) then
   begin
    close;
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
  im : TPrintDialog;
begin
  //ShowMessage();

  if ((tipoIMPRESSAO = 1) and (FileExists(ExtractFileDir(ParamStr(0))  + '\impnormal.dat') = false)) then
    begin
      imprimeESCPOS;
      exit;
    end;

  //imprimirNfceESCPOS();
  im := TPrintDialog.Create(self);
  if not im.Execute then exit;

  RichEdit1.Print('Impressao PDV');
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
  printer.title := 'Impress�o Relat�rio: Rel de Vendas';
  Rewrite(PrintText);
  Writeln(PrintText, '  ');
  for ini := 0 to fim do
    begin
      Writeln(PrintText, RichEdit1.Lines[ini]);
    end;

  Writeln(PrintText, '  ');
  Writeln(PrintText, '  ');
  Writeln(PrintText, '  ');
  CloseFile(PrintText);
end;

procedure Tmfd.imprimeESCPOS();
var
  ini, fim  : integer;
  PrintText : TextFile;
  lin : String;
begin
  fim := RichEdit1.Lines.Count -1;
  for ini := 0 to fim do
    begin
      try
        dtmMain.ACBrPosPrinter1.Ativar;
      except
      end;

      lin := RichEdit1.Lines[ini];
      if CheckBox1.Checked then lin := '<n>' + lin + '</n>'
      else lin := '<fn>' + lin;

      dtmMain.ACBrPosPrinter1.ImprimirLinha(lin);
    end;
    
  dtmMain.ACBrPosPrinter1.PularLinhas(5);
  dtmMain.ACBrPosPrinter1.CortarPapel();  
end;

procedure Tmfd.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

end.

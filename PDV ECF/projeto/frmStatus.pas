unit frmStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, ComCtrls, Buttons;

type
  Tmfd = class(TForm)
    RichEdit1: TRichEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RichEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
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
  im := TPrintDialog.Create(self);
  if not im.Execute then exit;

  RichEdit1.Print('Impressao PDV');
end;

end.

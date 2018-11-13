unit Unit60;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm60 = class(TForm)
    ListBox1: TListBox;
    procedure ListBox1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    valor_a_retornar : string;
    quantidade_caracteres_a_retornar : integer;

  end;

var
  Form60: TForm60;

implementation

{$R *.dfm}

procedure TForm60.ListBox1KeyPress(Sender: TObject; var Key: Char);
begin
 if key= #27 then
   begin
     valor_a_retornar := '';
     close;
   end;
 if key=#13 then
  begin
    valor_a_retornar := ListBox1.Items[ListBox1.ItemIndex];
    valor_a_retornar := copy(valor_a_retornar, 1, quantidade_caracteres_a_retornar);
    close;
  end;

end;

procedure TForm60.FormCreate(Sender: TObject);
begin
   quantidade_caracteres_a_retornar := 1;
end;

end.

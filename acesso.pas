unit acesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm37 = class(TForm)
    ListBox1: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    ListBox2: TListBox;
    procedure ListBox1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListBox1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListBox2KeyPress(Sender: TObject; var Key: Char);
    procedure ListBox2Enter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    acesso,alterado : string;
    function lelista() : String;
    { Private declarations }
  public
    usuario : integer;
    { Public declarations }
  end;

var
  Form37: TForm37;

implementation

uses Unit2, func, Unit1;

{$R *.dfm}
procedure TForm37.ListBox1Enter(Sender: TObject);
begin
Label2.Caption := 'Use as setas para se movimentar entre'+#13+'as se��es e pressione ENTER para entrar'+#13+'nas rotinas de cada se��o. No quadro ao'+#13+'lado, pressione ENTER para modificar o'+#13+'de cada rotina';
end;

procedure TForm37.FormCreate(Sender: TObject);
begin
  usuario := 0;
end;

procedure TForm37.FormShow(Sender: TObject);
var i:integer;
begin
 ListBox1.SetFocus;
 for i:=0 to form2.MainMenu1.Items.Count-1 do
  begin
    ListBox1.Items.Add(funcoes.DeletaChar('&',Form2.MainMenu1.Items.Items[i].Caption));
  end;

  acesso := '';

  if usuario > 0 then begin
    dm.IBQuery2.Close;
    dm.IBQuery2.SQL.Clear;
    dm.IBQuery2.SQL.Add('select acesso_usu as acesso from usuario where cod = ' + IntToStr(usuario));
    dm.IBQuery2.Open;
    acesso := trim(dm.IBQuery2.FieldByName('acesso').AsString);
  end;

  if acesso = '' then begin
    dm.IBQuery2.Close;
    dm.IBQuery2.SQL.Clear;
    dm.IBQuery2.SQL.Add('select acesso from acesso');
    dm.IBQuery2.Open;
    acesso := dm.IBQuery2.FieldByName('acesso').AsString;
  end;

  dm.IBQuery2.Close;


  alterado := acesso;
  ListBox1.Selected[0] := true;
end;

procedure TForm37.ListBox1KeyPress(Sender: TObject; var Key: Char);
var
  i,posi:integer;
  a, tmp : string;
begin
 if (key=#13) and (ListBox1.ItemIndex>-1) then
  begin
    a := funcoes.LerConfig(acesso, ListBox1.ItemIndex, false);
    //ShowMessage(a + #13 + IntToStr(Length(a)));

    //posi := pos('-'+IntToStr(ListBox1.ItemIndex)+'-',acesso) + 3;
    //ShowMessage(acesso[posi]);
    ListBox2.Clear;
    for i:= 0 to Form2.MainMenu1.Items.Items[ListBox1.ItemIndex].Count -1 do begin
       tmp := copy(a,i +1, 1);
       if trim(tmp) = '-' then tmp := '0';
       
       ListBox2.Items.Add(tmp+'-'+funcoes.DeletaChar('&',Form2.MainMenu1.Items.Items[ListBox1.itemindex].Items[i].Caption));
     end;

    if ListBox2.Items.Count>0 then
     begin
      ListBox2.SetFocus;
      ListBox2.Selected[0] := true;
     end;
  end;

if key=#27 then
 begin
  ListBox1.Clear;
  Close;
 end;
end;

procedure TForm37.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ListBox1.Clear;
ListBox2.Clear;
end;

procedure TForm37.ListBox2KeyPress(Sender: TObject; var Key: Char);
var
  char1, sim, teclas : string;
begin
 if key=#27 then
  begin
   if alterado<>acesso then
    begin
     sim := funcoes.dialogo('generico',0,'SN',30,false,'S',Application.Title,'Deseja Salvar as Altera��es?','S');
     if sim='S' then
      begin
       if usuario = 0 then begin
         dm.IBQuery2.Close;
         dm.IBQuery2.SQL.Text := ('update acesso set acesso='+QuotedStr(alterado) +' where substring(acesso from 1 for 1) = ''-''');
         dm.IBQuery2.ExecSQL;
         dm.IBQuery2.Transaction.Commit;
         dm.IBQuery2.Close;
       end
       else begin
         dm.IBQuery2.Close;
         dm.IBQuery2.SQL.Text := ('update usuario set ACESSO_USU='+QuotedStr(alterado) +' where cod = ' + IntToStr(usuario));
         dm.IBQuery2.ExecSQL;
         dm.IBQuery2.Transaction.Commit;
         dm.IBQuery2.Close;
       end;

       ListBox2.Clear;
       ListBox1.SetFocus;
       acesso := alterado;
      end
     else
      begin
       alterado := acesso;
       ListBox2.Clear;
       ListBox1.SetFocus;
      end;
    end
   else
    begin
     ListBox2.Clear;
     ListBox1.SetFocus;
    end;
  end;
 if (key=#13) and (ListBox2.ItemIndex>-1) then
  begin
   teclas := '1234567890'+#8+#32;
   //if usuario > 0 then teclas := 'SN'+#8+#32;
   
   char1 := funcoes.dialogo('generico',0,teclas,30,false,'S',Application.Title,'Confirme o N�vel de Acesso',ListBox2.Items.Strings[ListBox2.itemindex][1]);
   if char1<>'*' then
    begin
     if char1='' then char1 := ' ';


     ListBox2.Items.Strings[ListBox2.ItemIndex] := char1  + copy(ListBox2.Items[ListBox2.ItemIndex],2,length(ListBox2.Items[ListBox2.ItemIndex]));

     char1 := ListBox2.Items.Strings[ListBox2.itemindex][1];

     alterado := GravarConfig(alterado, lelista, ListBox1.ItemIndex);
    end;
  end;
end;

procedure TForm37.ListBox2Enter(Sender: TObject);
begin
Label2.Caption := 'O nivel de acesso de uma rotina � a'+#13+'quantidade de bloqueios que um usu�rio'+#13+'pode ter para us�-la. Um exemplo, a ro-'+#13+'tina cancelamento de nota tem tem nivel'+#13+'0, isto �, apenas usu�rios com 0 blo-'+#13+'queios podem us�-la. Se o nivel estiver'+#13+'em branco, a rotina fica sempre aberta.';
end;

function TForm37.lelista() : String;
var
  i: integer;
  val : String;
begin
  Result := '';
  for I := 0 to ListBox2.Count -1 do begin
    val := ListBox2.Items[i][1];
    if val = '-' then val := ' ';
    Result := Result + val;
  end;
end;

end.

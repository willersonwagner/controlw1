unit Unit56;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sSkinProvider, sSkinManager, StdCtrls, func;

type
  TForm56 = class(TForm)
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    Button1: TButton;
    Label1: TLabel;
    ListBox1: TListBox;
    Button2: TButton;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBox1KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
  private
    pasta1 : string;
    procedure escolheTema();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form56: TForm56;

implementation

{$R *.dfm}

procedure TForm56.Button1Click(Sender: TObject);
var
  pasta : String;
  lista : TStringList;
  ini   : integer;
  //op : TOpenDialog;
begin
  //op := TOpenDialog.Create(self);
  //if not op.Execute then exit;

  pasta := funcoes.BrowseForFolder('Procure a Pasta dos Temas', sSkinManager1.SkinDirectory + '\',true);
  if pasta = '' then exit;
  sSkinManager1.Active := false;
  sSkinManager1.SkinDirectory := pasta;
  sSkinManager1.Active := true;

  lista := funcoes.listaArquivos(pasta + '\*.asz');
  funcoes.GravaConfigNaPastaDoControlW('PastaTema', pasta);

  for ini:= 0 to lista.Count -1 do
    begin
      ListBox1.Items.Add(ExtractFileName(lista[ini]));
    end;

end;

procedure TForm56.ListBox1DblClick(Sender: TObject);
begin
  escolheTema();
end;

procedure TForm56.FormCreate(Sender: TObject);
var
  arq : TStringList;
  lista : TStringList;
  ini : integer;
begin
  arq := TStringList.Create;
  arq.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\'+funcoes.buscaNomeConfigDat);
  if arq.Values['PastaTema'] = '' then exit;
  pasta1 := arq.Values['PastaTema'];
  sSkinManager1.SkinDirectory := arq.Values['PastaTema'];
  sSkinManager1.SkinName      := arq.Values['NomeTema'];

  Label2.Caption := 'Tema: '+arq.Values['NomeTema'];

  lista := funcoes.listaArquivos(arq.Values['PastaTema'] + '\*.asz');
  for ini:= 0 to lista.Count -1 do
    begin
      ListBox1.Items.Add(ExtractFileName(lista[ini]));
    end;

  for ini:= 0 to ListBox1.Count -1 do
    begin
      if arq.Values['NomeTema'] = ListBox1.Items[ini] then
        begin
          ListBox1.Selected[ini] := true;
        end;
    end;

  lista.Free;
  arq.Free;
end;

procedure TForm56.ListBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      escolheTema();
    end;
end;

procedure TForm56.Button2Click(Sender: TObject);
begin
  funcoes.GravaConfigNaPastaDoControlW('NomeTema', '');
  //funcoes.GravaConfigNaPastaDoControlW('PastaTema', '');
  sSkinManager1.Active := false;
  sSkinManager1.UpdateSkin(true);

  ShowMessage('Padrões Restaurados');
end;

procedure TForm56.escolheTema();
begin
  sSkinManager1.Active := false;
  sSkinManager1.SkinName := ListBox1.Items[ListBox1.ItemIndex];
  sSkinManager1.Active := true;

  funcoes.GravaConfigNaPastaDoControlW('NomeTema', ListBox1.Items[ListBox1.ItemIndex]);
  Label2.Caption := 'Tema: ' + ListBox1.Items[ListBox1.ItemIndex];
  ShowMessage('Tema Escolhido: ' + ListBox1.Items[ListBox1.ItemIndex]);
end;

end.

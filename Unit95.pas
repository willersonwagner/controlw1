unit Unit95;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtDlgs, Vcl.ExtCtrls, Data.DB, Vcl.Imaging.jpeg,
  Vcl.StdCtrls;

type
  TForm95 = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
   cod, codUlt : String;
    venda : boolean;
    function PadronizaTamanho(Imagem: TGraphic; W, H: Integer;Tipo: TGraphicClass): TGraphic;
    procedure mostraFoto;
    procedure excluiFoto;
    procedure SetJPGCompression(ACompression: integer; const AInFile: string;const AOutFile: string);


    { Public declarations }
  end;

var
  Form95: TForm95;

implementation

{$R *.dfm}

uses consulta, Unit1;
procedure TForm95.FormCreate(Sender: TObject);
begin
  venda := false;
end;

procedure TForm95.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 46 then begin
    excluiFoto;
  end;

  if key = 116 then begin
    if venda  then exit;

    form24.cosultaRetorna := true;
    form24.BuscaCOd := (codUlt);
    form24.ShowModal;

    if form24.retorno = '*' then exit;
    cod := form24.retorno;

    Panel1.Caption := cod + '-'+dm.produto.FieldByName('descricao').AsString;

    mostraFoto;

  end;

  if key = 113 then begin
    if venda then exit;

    if not OpenPictureDialog1.Execute then exit;

    SetJPGCompression(20, OpenPictureDialog1.FileName, OpenPictureDialog1.FileName);
    Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);

    dm.IBQuery1.Close;
    dm.IBQuery1.SQL.Text := 'update or insert into produto_imagem(cod, img) values(:cod, :img) matching(cod)';
    dm.IBQuery1.ParamByName('cod').AsString := cod;
    dm.IBQuery1.ParamByName('img').LoadFromFile(OpenPictureDialog1.FileName, ftBlob);
    dm.IBQuery1.ExecSQL;
    dm.IBQuery1.Transaction.Commit;

    ShowMessage('Imagem inserida com sucesso!');
  end;
end;


procedure TForm95.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;

end;

procedure TForm95.FormShow(Sender: TObject);
begin
 ShowMessage('1');
end;

procedure TForm95.mostraFoto;
var
  BS : TMemoryStream;
  MinhaImagem : TJPEGImage;
begin
  dm.IBselect.Close;
    dm.IBselect.SQL.Text := 'select img from produto_imagem where cod = :cod';
    dm.IBselect.ParamByName('cod').AsString := cod;
    dm.IBselect.Open;

    if dm.IBselect.IsEmpty = false then begin
      MinhaImagem := TJPEGImage.Create;
      bs := TMemoryStream.Create;
      TBlobField(dm.IBselect.FieldByName('img')).SaveToStream(bs);

      BS.Position := 0;

      MinhaImagem.LoadFromStream(bs);
      Image1.Picture.Assign(MinhaImagem);

      BS.Free;
      MinhaImagem.Free;
    end
    else Image1.Picture.Assign(nil);
end;

procedure TForm95.excluiFoto();
begin
  if cod = '' then exit;

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text := 'delete from produto_imagem where cod = :cod';
  dm.IBQuery1.ParamByName('cod').AsString := cod;
  dm.IBQuery1.ExecSQL;
  dm.IBQuery1.Transaction.Commit;

  ShowMessage('Imagem Excluida com Sucesso!');
  Image1.Picture.Assign(nil);
end;

procedure TForm95.SetJPGCompression(ACompression: integer; const AInFile: string;const AOutFile: string);
var
  iCompression: integer;
  oJPG: TJPegImage;
  oBMP: TBitMap;
  i, w, h : integer;

begin
  { Forcar a Compressião para a faixa entre 1..100 }
  iCompression := abs(ACompression);
  if iCompression = 0 then
    iCompression := 1;
  if iCompression > 100 then
    iCompression := 100;

  { Cria as classes de trabalho Jpeg e Bmp }

  oJPG := TJPegImage.Create;
  oJPG.LoadFromFile(AInFile);
  oBMP := TBitMap.Create;
  oBMP.Assign(oJPG);

  i := 1;
  if oJPG.Width > 800 then begin
    w := oJPG.Width;
    h := oJPG.Height;
    while True do begin
       if ((w - trunc((w * i) /100)) < 800) then break;

       i := i + 1;
    end;
    w := w - trunc((w * i) /100);
    h := h - trunc((h * i) /100);
  end;

  oBMP.SetSize(w, h);
  oBMP.Canvas.StretchDraw(oBMP.Canvas.Cliprect, ojpg);
  oJPG.Assign(oBMP);

  { Fazer a Compressão e salva o novo arquivo }
  oJPG.CompressionQuality := iCompression;
  oJPG.Compress;


  oBMP.SetSize(w, h);
  oJPG.SaveToFile(AOutFile);
  { Limpar }

  oJPG.Free;
  oBMP.Free;
end;

function TForm95.PadronizaTamanho(Imagem: TGraphic; W, H: Integer;Tipo: TGraphicClass): TGraphic;
var
  B: TBitmap;
begin
  B := TBitmap.Create;
  try
    B.Width := W;
    B.Height := H;
    B.Canvas.StretchDraw(Rect(0, 0, W, H), Imagem);
    if Tipo = nil
    then
      Result := TGraphic(Imagem.ClassType.Create)
    else
      Result := Tipo.Create;
    Result.Assign ( B ) ;
  finally
    B.Free;
  end;
end;

end.

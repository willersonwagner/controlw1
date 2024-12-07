unit Unit95;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtDlgs, Vcl.ExtCtrls, Data.DB, Vcl.Imaging.jpeg,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Clipbrd, principal, Vcl.ImgList, classes1;

type
  TForm95 = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    ImageList1: TImageList;
    Image2: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Image1Click(Sender: TObject);
  private
    imagens : tprodutos;
    idxImg : integer;
    MinhaImagem : TJPEGImage;
    zoom : integer;

    procedure SetCanvasZoomFactor(Canvas: TCanvas; AZoomFactor: Integer);
    { Private declarations }
  public
   cod, codUlt : String;
    venda : boolean;
    function PadronizaTamanho(Imagem: TGraphic; W, H: Integer;Tipo: TGraphicClass): TGraphic;
    procedure mostraFoto;
    procedure excluiFoto;
    procedure SetJPGCompression(ACompression: integer; const AInFile: string;var AOutFile: string);


    { Public declarations }
  end;

var
  Form95: TForm95;

implementation

{$R *.dfm}

uses consulta, Unit1, func, relatorio;
procedure TForm95.FormCreate(Sender: TObject);
begin
  venda := false;
  imagens := Tprodutos.Create;
  MinhaImagem := TJPEGImage.Create;
  zoom := 0;
end;

procedure TForm95.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 vPng: TPngImage;
 arquivo, arqSai : String;
 i : integer;
begin
  //seta direita
  if key = 39 then begin
    if idxImg < imagens.Count -1 then begin
      idxImg := idxImg + 1;

      imagens[idxImg].BS.Position := 0;
      MinhaImagem.LoadFromStream(imagens[idxImg].BS);
      Image1.Picture.Assign(MinhaImagem);
    end;
  end;

  //seta esquerda
  if key = 37 then begin
    if idxImg > 0 then begin
      idxImg := idxImg - 1;

      imagens[idxImg].BS.Position := 0;
      MinhaImagem.LoadFromStream(imagens[idxImg].BS);
      Image1.Picture.Assign(MinhaImagem);
    end;
  end;

  if (ssCtrl in Shift) and (chr(Key) in ['V', 'v']) then begin
    try
      if cod = '' then exit;
      if venda then exit;
      
      Image1.Picture.Bitmap.Assign(Clipboard);
      criaPasta(caminhoEXE_com_barra_no_final + 'img');

      arquivo := caminhoEXE_com_barra_no_final + 'img\TEMP.BMP';
      image1.Picture.SaveToFile(arquivo);

      arqSai := arquivo;
      SetJPGCompression(20, arquivo, arqSai);

      idxImg := StrToInt(Incrementa_Generator('produto_imagem', 1));

      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Text := 'insert into produto_imagem(cod, img, cod_seq) values(:cod, :img, '+IntToStr(idxImg)+')';
      dm.IBQuery1.ParamByName('cod').AsString := cod;
      dm.IBQuery1.ParamByName('img').LoadFromFile(arqSai, ftBlob);
      dm.IBQuery1.ExecSQL;
      dm.IBQuery1.Transaction.Commit;

      i := imagens.Add(TProduto.Create);
      imagens[i].cod := idxImg;
      imagens[i].BS  := TMemoryStream.Create;
      imagens[i].BS.LoadFromFile(arqSai);
      idxImg := i;

//      ShowMessage('Imagem inserida com sucesso!' + #13 + arqSai);

      //cod := '';

    except
      on e:exception do begin
        ShowMessage('Formato nao suportado, Tente com JPG.' + e.Message);
        exit;
      end;
    end;
  end;

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
    codUlt := cod;

    if funcoes.buscaParamGeral(5, 'N') = 'S' then begin
        Panel1.Caption := dm.produto.FieldByName('codbar').AsString + '-'+dm.produto.FieldByName('descricao').AsString;
      end
      else begin
        Panel1.Caption := cod + '-'+dm.produto.FieldByName('descricao').AsString;
      end;

    //Panel1.Caption := cod + '-'+dm.produto.FieldByName('descricao').AsString;

    mostraFoto;

  end;

  if key = 113 then begin
{    form19.RichEdit1.Clear;
    addRelatorioForm19('***** Instrucoes de Uso ******' + CRLF);
    addRelatorioForm19('>>Nesta rotina é possivel adicionar imagens(mais de um) para produtos especificos' + CRLF);
    addRelatorioForm19('F2-Busca Imagem, nesta funcao é valido somente JPG e PNG' + CRLF);
    addRelatorioForm19('Delete exclui a imagem corrente' + CRLF);
    addRelatorioForm19('CTRL + V (atalho de colar é possivel pegar uma )' + CRLF);  }
  end;

  if key = 113 then begin
    if venda then exit;

    if not OpenPictureDialog1.Execute then exit;

    arquivo :=  OpenPictureDialog1.FileName;
    SetJPGCompression(20, OpenPictureDialog1.FileName, arquivo);

    Image1.Picture.LoadFromFile(arquivo);
    Image2.Picture.LoadFromFile(arquivo);
    Self.Height := Image1.Picture.Height;

    if cod = '' then exit;


    idxImg := StrToInt(Incrementa_Generator('produto_imagem', 1));

    dm.IBQuery1.Close;
    dm.IBQuery1.SQL.Text := 'insert into produto_imagem(cod, img, cod_seq) values(:cod, :img, '+IntToStr(idxImg)+')';
    dm.IBQuery1.ParamByName('cod').AsString := cod;
    dm.IBQuery1.ParamByName('img').LoadFromFile(arquivo, ftBlob);
    dm.IBQuery1.ExecSQL;
    dm.IBQuery1.Transaction.Commit;

    i := imagens.Add(TProduto.Create);
    imagens[i].cod := idxImg;
    imagens[i].BS  := TMemoryStream.Create;
    imagens[i].BS.LoadFromFile(arquivo);
    idxImg := i;




//    ShowMessage('Imagem inserida com sucesso!');
  end;
end;


procedure TForm95.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;

end;

procedure TForm95.Image1Click(Sender: TObject);
var
  Center : TPoint;
  X1, Y1, X2, Y2 : integer;
begin
{  zoom := zoom + 50;
  Center := Point(image1.Picture.Bitmap.Width div 2, image1.Picture.Bitmap.Height div 2);
  X1 := Trunc(Center.X - (Center.X / (Zoom/100)));
  Y1 := Trunc(Center.Y - (Center.Y / (Zoom/100)));
  X2 := Trunc(Center.X + (Center.X / (Zoom/100)));
  Y2 := Trunc(Center.Y + (Center.Y / (Zoom/100)));
  image1.canvas.copyrect(bounds(0,0,image2.width,image2.height), image1.picture.bitmap.canvas, rect(X1, Y1, X2, Y2));
 }

 //SetCanvasZoomFactor(Image1.Canvas, 100);

end;

procedure TForm95.mostraFoto;
var
  BS : TMemoryStream;

  i : integer;
begin
  dm.IBselect.Close;
    dm.IBselect.SQL.Text := 'select img, cod_seq from produto_imagem where cod = :cod';
    dm.IBselect.ParamByName('cod').AsString := cod;
    dm.IBselect.Open;

    if dm.IBselect.IsEmpty = false then begin
      imagens.Clear;
      i := 0;
      while not dm.IBselect.Eof do begin
        i := imagens.Add(TProduto.Create);
        imagens[i].cod := dm.IBselect.FieldByName('cod_seq').AsInteger;
        imagens[i].BS  := TMemoryStream.Create;
        TBlobField(dm.IBselect.FieldByName('img')).SaveToStream(imagens[i].BS);

        dm.IBselect.Next;
      end;

      idxImg := 0;

      imagens[idxImg].BS.Position := 0;
      MinhaImagem.LoadFromStream(imagens[idxImg].BS);
      Self.Height := MinhaImagem.Height;
      Image1.Picture.Assign(MinhaImagem);

    end
    else Image1.Picture.Assign(nil);
end;

procedure TForm95.excluiFoto();
begin
  if cod = '' then exit;
  if venda then exit;

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text := 'delete from produto_imagem where cod_seq = :cod';
  dm.IBQuery1.ParamByName('cod').AsInteger := imagens[idxImg].cod;
  dm.IBQuery1.ExecSQL;
  dm.IBQuery1.Transaction.Commit;

  mostraFoto;

  //ShowMessage('Imagem Excluida com Sucesso!');
  //Image1.Picture.Assign(nil);
end;

procedure TForm95.SetJPGCompression(ACompression: integer; const AInFile: string;var AOutFile: string);
var
  iCompression: integer;
  oJPG: TJPegImage;
  oBMP: TBitMap;
  oPNG : TPngImage;
  i, w, h, tipo : integer;

begin
  { Forcar a Compressião para a faixa entre 1..100 }
  iCompression := abs(ACompression);
  if iCompression = 0 then
    iCompression := 1;
  if iCompression > 100 then
    iCompression := 100;

  { Cria as classes de trabalho Jpeg e Bmp }

  tipo := 0;
  if ((Contido('.BMP', UpperCase(AInFile))) or (Contido('.BMP', UpperCase(AInFile)))) then  begin
    oBMP := TBitMap.Create;
    oBMP.LoadFromFile(AInFile);

    oJPG := TJPegImage.Create;
    oJPG.Assign(oBMP);

    w := oBMP.Width;
    h := oBMP.Height;
    tipo := 3;
  end
  else if ((Contido('.JPG', UpperCase(AInFile))) or (Contido('.JPEG', UpperCase(AInFile)))) then  begin
    oJPG := TJPegImage.Create;
    oJPG.LoadFromFile(AInFile);
    oBMP := TBitMap.Create;
    oBMP.Assign(oJPG);

    w := oJPG.Width;
    h := oJPG.Height;
    tipo := 1;
  end
  else if Contido('.PNG', UpperCase(AInFile)) then begin
    oPNG := TPngImage.Create;
    oPNG.LoadFromFile(AInFile);
    oBMP := TBitMap.Create;
    oBMP.Assign(oPNG);

    w := oPNG.Width;
    h := oPNG.Height;

    tipo := 2;

  end
  else begin
    ShowMessage('Formato de imagem não suportada!');
    tipo := 99;
    exit;
  end;





  i := 1;
  if W > 800 then begin
    while True do begin
       if ((w - trunc((w * i) /100)) < 800) then break;
    
       i := i + 1;
    end;

    w := w - trunc((w * i) /100);
    h := h - trunc((h * i) /100);
  end;


  { Fazer a Compressão e salva o novo arquivo }

  if (tipo = 1) then begin
    oBMP.SetSize(w, h);
    oBMP.Canvas.StretchDraw(oBMP.Canvas.Cliprect, ojpg);


    oJPG.Assign(oBMP);
    oJPG.CompressionQuality := iCompression;
    oJPG.Compress;
    oJPG.SaveToFile(AOutFile);
    oJPG.Free;
  end
  else if (tipo = 2) then begin
    oBMP.SetSize(w, h);
    oBMP.Canvas.StretchDraw(oBMP.Canvas.Cliprect, oPNG);

    oJPG := TJPEGImage.Create;
    oJPG.Assign(oBMP);
    oJPG.CompressionQuality := iCompression;
    oJPG.Compress;

    AOutFile :=  ChangeFileExt(AOutFile, '.JPG');
    oJPG.SaveToFile(AOutFile);
    oJPG.Free;
    oPNG.Free;
  end
  else if (TIPO = 3) then begin
    oJPG := TJPEGImage.Create;
    oJPG.Assign(oBMP);
    oBMP.SetSize(w, h);
    oBMP.Canvas.StretchDraw(oBMP.Canvas.Cliprect, oJPG);

    oJPG.Assign(oBMP);
    oJPG.CompressionQuality := iCompression;
    oJPG.Compress;

    AOutFile :=  ChangeFileExt(AOutFile, '.JPG');
    oJPG.SaveToFile(AOutFile);
    oJPG.Free;
  end;

  { Limpar }


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

procedure TForm95.SetCanvasZoomFactor(Canvas: TCanvas; AZoomFactor: Integer);
var
  i: Integer;
begin
  if AZoomFactor = 100 then
    SetMapMode(Canvas.Handle, MM_TEXT)
  else
  begin
    SetMapMode(Canvas.Handle, MM_ISOTROPIC);
    SetWindowExtEx(Canvas.Handle, AZoomFactor, AZoomFactor, nil);
    SetViewportExtEx(Canvas.Handle, 100, 100, nil);
  end;
end;

end.

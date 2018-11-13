unit Unit63;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, UTDownloadXMLNFeDLL, utils, U_Carregando,
  untnfce, funcoesDAV, untnfceForm;

type
  TForm63 = class(TForm)
    ImgCaptcha: TImage;
    ButCaptcha: TBitBtn;
    ButBaixar: TBitBtn;
    EditChave: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    EditCaptcha: TEdit;
    Label1: TLabel;
    procedure ButCaptchaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButBaixarClick(Sender: TObject);
    procedure EditChaveKeyPress(Sender: TObject; var Key: Char);
    procedure EditCaptchaEnter(Sender: TObject);
    procedure EditCaptchaKeyPress(Sender: TObject; var Key: Char);
    procedure ButBaixarKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    imprimir : boolean;
    Arquivo, pastaexec: String;
    { Public declarations }
  end;

var
  Form63: TForm63;
  BaixarXMLNFe: TDownloadXMLNFeDLL;

implementation

{$R *.dfm}

procedure TForm63.ButBaixarKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then EditChave.SetFocus;
  
end;

procedure TForm63.ButCaptchaClick(Sender: TObject);
var
  caminhoCaptcha : String;
  cont : integer;
begin
  try
    caminhoCaptcha := ExtractFileDir(ParamStr(0)) + '\Captcha1.jpg';
    Label1.Visible := true;

    cont := 1;
    while True do begin
      if cont = 5 then begin
        gravaERRO_LOG1('', 'Erro quando foi baixar o captcha.' + BaixarXMLNFe.Msg, '');
        MsgErr('Erro quando foi baixar o captcha.' + BaixarXMLNFe.Msg);
        break;
      end;

      Application.ProcessMessages;
      Label1.Caption := 'Aguarde ' + IntToStr(cont) + '...';
      Label1.Repaint;
      Application.ProcessMessages;

      if BaixarXMLNFe.Captcha(caminhoCaptcha) then begin
        ImgCaptcha.Picture.LoadFromFile(caminhoCaptcha);
        EditCaptcha.Clear;
        EditCaptcha.SetFocus;
        break;
      end;

      cont := cont + 1;
    end;

    {if BaixarXMLNFe.Captcha(caminhoCaptcha) then begin
      ImgCaptcha.Picture.LoadFromFile(caminhoCaptcha);
      EditCaptcha.Clear;
      EditCaptcha.SetFocus;
    end else
      MsgErr('Erro quando foi baixar o captcha.' + BaixarXMLNFe.Msg);}
  finally
    Label1.Visible := false;
  end;
end;

procedure TForm63.FormShow(Sender: TObject);
begin
  F_Carregando.Show;
  try
    Application.ProcessMessages;
    BaixarXMLNFe:= TDownloadXMLNFeDLL.Create;
    BaixarXMLNFe.CaptchaBossURL('http://fasttypers.org/imagepost.ashx');
    F_Carregando.Close;
    Application.ProcessMessages;
    EditChave.SetFocus;
  except
    on e:exception do begin
      F_Carregando.Close;
      if ((Pos('timed out', e.Message) > 0) or (Pos('O tempo limite', e.Message) > 0)) then begin
        MessageDlg('No momento o portal nacional da Fazenda www.nfe.fazenda.gov.br está com Problemas' + #13 + #13 + e.Message,
        mtWarning, [mbOK], 1);
      end
      else begin
        MessageDlg(e.Message, mtWarning, [mbOK], 1);
      end;
    end;
  end;
end;

procedure TForm63.ButBaixarClick(Sender: TObject);
var
  erro : string;
begin
  if (length(StrNumeros(EditChave.Text)) <> 44) then
    begin
       MsgInf('Chave Inválida!');
       EditChave.SetFocus;
       exit;
    end;

  if (EditCaptcha.Text = '') then
    begin
       MsgInf('Informe Um Captcha!');
       EditCaptcha.SetFocus;
       exit;
    end;

  if imprimir = true then begin
    pastaexec := ExtractFileDir(ParamStr(0)) + '\NFe\IMP\';
  end
  else pastaexec := ExtractFileDir(ParamStr(0)) + '\ENTRADAXML\';
  PastaCriar(pastaexec);
  F_Carregando.Show;
  try
    Arquivo:= pastaexec + StrNumeros(EditChave.Text) + '.xml';


    //********** BAIXANDO NO MODO SEM CERTIFICADO DIGITAL **********************
      if BaixarXMLNFe.BaixarXMLNFeSemCert(StrNumeros(EditChave.Text), EditCaptcha.Text, Arquivo) then begin
        F_Carregando.Close;

        if imprimir then begin
          ACBrNFe.NotasFiscais.Clear;
          ACBrNFe.NotasFiscais.LoadFromFile(Arquivo);
          imprimirNFe(false);
          close;
          exit;
        end;

        MsgInf('Download Efetuado com Sucesso');
        EditChave.SelectAll;
        EditChave.SetFocus;
      end else begin
        erro := trim(BaixarXMLNFe.Msg);
        if erro = '' then begin
          erro := 'O Sistema Não Obteve Resposta do Portal Nacional da Fazenda, Tente Novamente!'
        end;

        erro := removeCarateresEspeciais(erro);
        MsgInf((erro));
        if Pos('CODIGO DA IMAGEM INVALIDO', UpperCase(ERRO)) > 0 then begin
          EditCaptcha.SetFocus;
        end;
      end;
      //********** BAIXANDO NO MODO SEM CERTIFICADO DIGITAL **********************

    EditCaptcha.Clear;
  finally
    F_Carregando.Close;
  end;  
end;

procedure TForm63.EditChaveKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
  if key = #13 then begin
    EditCaptcha.SetFocus;
  end;
end;

procedure TForm63.EditCaptchaEnter(Sender: TObject);
begin
  try
    Label1.Visible := true;
    Application.ProcessMessages;
    Application.ProcessMessages;
    ButCaptcha.Click;
  finally
    Label1.Visible := false;
  end;
end;

procedure TForm63.EditCaptchaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then EditChave.SetFocus;
  if key = #13 then begin
    ButBaixar.SetFocus;
  end;

end;

end.

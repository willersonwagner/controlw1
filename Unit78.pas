unit Unit78;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, untnfceForm, pcnConversaoNFe,
  pcnConversao;

type
  TForm78 = class(TForm)
    Label9: TLabel;
    EditChave: TEdit;
    ButBaixar: TBitBtn;
    Label1: TLabel;
    procedure ButBaixarClick(Sender: TObject);
    procedure EditChaveKeyPress(Sender: TObject; var Key: Char);
    procedure ButBaixarKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    imprimir, spedDadosAdic : boolean;
    arquivo : String;
    { Public declarations }
  end;

var
  Form78: TForm78;

implementation

{$R *.dfm}

uses func, nfe, principal, U_Carregando, Unit1;

procedure TForm78.ButBaixarClick(Sender: TObject);
var
  ret,camArq, nsu : String;
  i, fim, CODestado : integer;
begin
  if Length(StrNum(EditChave.Text)) <> 44 then begin
    ShowMessage('Chave Inválida, Preencha Corretamente!');
    EditChave.SetFocus;
    exit;
  end;

  EditChave.Text := StrNum(EditChave.Text);
  F_Carregando.Show;

  ACBrNFe.NotasFiscais.Clear;
  ACBrNFe.Configuracoes.WebServices.Ambiente := taProducao;
  ACBrNFe.Configuracoes.WebServices.TimeOut  := 50000;

  try
    NfeVenda := TNfeVenda.Create(self);
    i := 0;
    while true do begin
      i := i + 1;
      ret := NfeVenda.ManifestarNFe(EditChave.Text, '1', '', false);
      if ((ret = 'OK') or (i = 6)) then begin
        break;
      end;
    end;

    if Contido('Erro: ', ret) then begin
      ShowMessage(ret);
      exit;
    end;

    ACBrNFe.Configuracoes.WebServices.TimeOut := 30000;
    ACBrNFe.Configuracoes.geral.ModeloDF      := moNFe;

    CODestado := StrToInt(form22.Pgerais.Values['codest']);

    i := 0;
    while true do begin
      i := i + 1;
      if (i = 6) then Begin
        break;
      End;

      try
        ACBrNFe.DistribuicaoDFePorChaveNFe(CODestado, StrNum(form22.Pgerais.Values['cnpj']), EditChave.Text);
        ret := '';
        break;
      except
        on e:exception do begin
          ret := e.Message;
        end;
      end;
    end;

    if ret <> '' then begin
       ShowMessage('Erro 92: '+ ret);
       exit;
    end;


    fim := ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.count - 1;
    camArq := caminhoEXE_com_barra_no_final + 'ENTRADAXML\';
    criaPasta(camArq);

    for i := 0 to fim do begin
      nsu := ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].NSU;
      if Contido('infNFe ', ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].XML) then begin
        GravarTexto(camArq + ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.chDFe + '-nfe.xml',  ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].XML);

        funcoes.insereNFEDISTRIBUICAO(i);
        arquivo := camArq + ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.chDFe + '-nfe.xml';

        if spedDadosAdic then begin
          close;
        end;

        if imprimir = false then begin
           ShowMessage('Download de XML ' +ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.chDFe + ' Foi Concluído!');
        end
        else begin
          ACBrNFe.NotasFiscais.LoadFromFile(camArq + ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.chDFe + '-nfe.xml');
          ACBrNFe.DANFE := DANFE_Rave;
          ACBrNFe.NotasFiscais.Imprimir;
          ACBrNFe.NotasFiscais.Clear;
        end;
      end;
    end;


  finally
    NfeVenda.Free;
    F_Carregando.Close;
  end;
end;

procedure TForm78.ButBaixarKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then EditChave.SetFocus;
  
end;

procedure TForm78.EditChaveKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin
    ButBaixar.SetFocus;
  end;

  if key = #27 then close;
end;

procedure TForm78.FormCreate(Sender: TObject);
begin
  imprimir := false;
  arquivo  := '';
  spedDadosAdic := false;
end;

end.

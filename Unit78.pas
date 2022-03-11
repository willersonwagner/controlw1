unit Unit78;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, untnfceForm, pcnConversaoNFe,
  pcnConversao, funcoesDAV;

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
    arquivo, nsu : String;
    { Public declarations }
  end;

var
  Form78: TForm78;

implementation

{$R *.dfm}

uses func, nfe, principal, U_Carregando, Unit1;

procedure TForm78.ButBaixarClick(Sender: TObject);
var
  ret,camArq : String;
  i, fim, CODestado : integer;
begin
  if Length(StrNum(EditChave.Text)) <> 44 then begin
    ShowMessage('Chave Inválida, Preencha Corretamente!');
    EditChave.SetFocus;
    exit;
  end;

  EditChave.Text := StrNum(EditChave.Text);
  F_Carregando.Show;
  F_Carregando.Panel1.Caption := 'Carregando 1...';
  Application.ProcessMessages;
  F_Carregando.Update;
  F_Carregando.Panel1.Update;

  ACBrNFe.NotasFiscais.Clear;
  ACBrNFe.Configuracoes.WebServices.Ambiente := taProducao;
  ACBrNFe.Configuracoes.WebServices.TimeOut  := 30000;

  try
    NfeVenda := TNfeVenda.Create(self);
    i := 0;
    while true do begin
      i := i + 1;
      ret := NfeVenda.ManifestarNFe(EditChave.Text, '1', '', false);

      //if ((ret = 'OK') or (i = 10) or (Contido('Rejeicao', ret))) then begin
      if ((ret = 'OK') or (i = 10) or ((Contido('Rejeicao', ret)))) then begin
        break;
      end;

      sleep(2000);
    end;

    if Contido('Erro 67: ', ret) then begin
      ShowMessage(ret);
      ACBrNFe.Configuracoes.WebServices.TimeOut  := 5000;
      exit;
    end;

    ACBrNFe.Configuracoes.WebServices.TimeOut := 30000;
    ACBrNFe.Configuracoes.geral.ModeloDF      := moNFe;

    CODestado := StrToInt(form22.Pgerais.Values['codest']);

    F_Carregando.Panel1.Caption := 'Carregando 2...';
    Application.ProcessMessages;
    F_Carregando.Update;
    F_Carregando.Panel1.Update;

    i := 0;
    while true do begin
      i := i + 1;
      if (i = 10) then Begin//22s de espera
        break;
      End;

      //if nsu <> '' then begin
      if false then begin
        F_Carregando.Panel1.Caption := 'Buscando por NSU...';
        Application.ProcessMessages;
        F_Carregando.Update;
        F_Carregando.Panel1.Update;


        try
          ACBrNFe.DistribuicaoDFePorUltNSU(CODestado, StrNum(form22.Pgerais.Values['cnpj']), nsu);
          ret := '';
          break;
        except
          on e:exception do begin
            ret := e.Message;
          end;
        end;
      end
      else begin
        F_Carregando.Panel1.Caption := 'Aguarde BC '+IntToStr(i)+'...';
        Application.ProcessMessages;
        F_Carregando.Update;
        F_Carregando.Panel1.Update;
        try
          //esse metodo parou de funcionar em 03/2022
          //ACBrNFe.DistribuicaoDFePorChaveNFe(CODestado, StrNum(form22.Pgerais.Values['cnpj']), EditChave.Text);

          ACBrNFe.DistribuicaoDFePorUltNSU(CODestado, StrNum(form22.Pgerais.Values['cnpj']), nsu);
          ret := '';
          if ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.cStat = 138 then break;
        except
          on e:exception do begin
            ret := e.Message;
          end;
        end;
      end;

      sleep(5000);
    end;

    if ret <> '' then begin
       ShowMessage('Erro 92: '+ ret);
       ACBrNFe.Configuracoes.WebServices.TimeOut  := 5000;
       exit;
    end;

    ShowMessage('cStat: ' + IntToStr(ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.cStat) + #13 +
                ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.xMotivo);



    fim := ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.count - 1;
    camArq := caminhoEXE_com_barra_no_final + 'ENTRADAXML\';
    criaPasta(camArq);

    if ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.cStat = 137 then begin
      ShowMessage('Arquivos Baixados: 0' + #13 + 'cStat: ' + IntToStr(ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.cStat) +
      #13 + 'xMotivo: ' +  ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.xMotivo + #13 + #13 +
      'Este Erro Ocorreu devido a Sefaz nao disponibilizar mais esse arquivo para' + #13 +
      'Download. O XML pode ser baixado até 90 dias após a sua Emissão. Caso a Emissao'+#13+
      'Tenha menos de 90 dias então favor tente mais tarde. Obrigado!');

      GravarTexto(caminhoEXE_com_barra_no_final + 'retorno.xml', ACBrNFe.WebServices.DistribuicaoDFe.RetornoWS);
      exit;
    end
    else begin
      if ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.cStat <> 138 then begin
        ShowMessage('Arquivos Baixados: ' + IntToStr(ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.count) + #13 + 'cStat: ' + IntToStr(ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.cStat) +
        #13 + 'xMotivo: ' +  ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.xMotivo);
        GravarTexto(caminhoEXE_com_barra_no_final + 'retorno.xml', ACBrNFe.WebServices.DistribuicaoDFe.RetornoWS);
      end;
    end;


    for i := 0 to fim do begin
      if ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.cStat = 138 then begin
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
          ret := DANFE_Rave.Logo;
          ACBrNFe.NotasFiscais.LoadFromFile(camArq + ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.chDFe + '-nfe.xml');
          ACBrNFe.DANFE := DANFE_Rave;
          ACBrNFe.NotasFiscais.Imprimir;
          ACBrNFe.NotasFiscais.Clear;
          DANFE_Rave.Logo := ret;
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
  nsu      := '';
  spedDadosAdic := false;
end;

end.


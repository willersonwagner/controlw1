unit Unit67;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, untnfceForm, funcoesdav,
  pcnConversao, pcnConversaoNFe, func;

type
  TForm67 = class(TForm)
    Label1: TLabel;
    cnpj: TMaskEdit;
    UF: TEdit;
    Label2: TLabel;
    ButBuscar: TBitBtn;
    cpf: TMaskEdit;
    Label3: TLabel;
    procedure cnpjKeyPress(Sender: TObject; var Key: Char);
    procedure UFKeyPress(Sender: TObject; var Key: Char);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure ButBuscarClick(Sender: TObject);
    procedure cpfKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure ButBuscarKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    dadosRetorno : TStringList;
    { Public declarations }
  end;

var
  Form67: TForm67;

implementation

{$R *.dfm}

uses U_Carregando;

procedure TForm67.ButBuscarClick(Sender: TObject);
var
  pasta : String;
begin
  pasta := ExtractFileDir(ParamStr(0)) + '\temporarios\';
  if DirectoryExists(pasta) = false then ForceDirectories(pasta);
  
  ACBrNFe.WebServices.ConsultaCadastro.UF   := uf.Text;
  if length(strnum(CNPJ.Text)) = 14 then
    ACBrNFe.WebServices.ConsultaCadastro.CNPJ   := strnum(cnpj.Text);
  if length(strnum(cpf.Text)) = 11 then ACBrNFe.WebServices.ConsultaCadastro.CPF := strnum(cpf.Text);

  if (ACBrNFe.WebServices.ConsultaCadastro.CNPJ = '') and (ACBrNFe.WebServices.ConsultaCadastro.CPF = '') then
    begin
      ShowMessage('CPF/CNPJ Não Preenchido!');
      exit;
    end;

  //if uf.Text = 'RR' then ACBrNFe.Configuracoes.Geral.VersaoDF := ve200;

  try
    ACBrNFe.Configuracoes.WebServices.Ambiente := taProducao;
    ACBrNFe.Configuracoes.Geral.ModeloDF := moNFe;
    F_Carregando.Show;
    try
      ACBrNFe.WebServices.ConsultaCadastro.Executar;
    except
      on e: exception do begin
        MessageDlg('Ocorreu um Erro: ' + e.Message, mtError, [mbOK], 1);
      end;
    end;
  finally
    ACBrNFe.Configuracoes.WebServices.Ambiente := taHomologacao;
    GravarTexto(pasta + 'retConsultaCadastro.xml', ACBrNFe.WebServices.ConsultaCadastro.RetornoWS);
    //ACBrNFe.Configuracoes.Geral.VersaoDF := ve310;
    dadosRetorno.Free;

    dadosRetorno := funcoes.verFornecedorStringList(ACBrNFe.WebServices.ConsultaCadastro.RetornoWS, true);
    F_Carregando.close;
  end;
  //Memo1.Text := ACBrNFe.WebServices.ConsultaCadastro.RetornoWS;
end;

procedure TForm67.UFKeyPress(Sender: TObject; var Key: Char);
begin
  key := UpCase(key);
  if key = #13 then ButBuscar.SetFocus;
  if key = #27 then cnpj.SetFocus;
end;

procedure TForm67.ButBuscarKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then cnpj.SetFocus;
end;

procedure TForm67.cnpjKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      if length(strnum(cnpj.Text)) = 14 then begin
        uf.SetFocus;
        cpf.Text := '' ;
      end
      else cpf.SetFocus;
    end;
  if key = #27 then close;
end;

procedure TForm67.cpfKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin
    if length(strnum(cpf.Text)) = 11 then begin
        cnpj.Text := '' ;
      end;
    UF.SetFocus;
  end;
  if key = #27 then cnpj.SetFocus;
end;

procedure TForm67.FormCreate(Sender: TObject);
begin
  dadosRetorno := TStringList.Create;
end;

procedure TForm67.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then uf.SetFocus;
end;

end.

unit uConsultaCNPJ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Vcl.StdCtrls,
  ACBrUtil;

type
  TconsultaCNPJ = class(TForm)
    Button1: TButton;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Memo1: TMemo;
    edtCNPJ: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  consultaCNPJ: TconsultaCNPJ;

implementation

uses
  REST.Types, uCliente, REST.Json, pcnConversao;

{$R *.dfm}

procedure TconsultaCNPJ.Button1Click(Sender: TObject);
var
  Cliente: TClienteClass;

  function SoNumero(fField: String): String;
  var
    I: Byte;
  begin
    Result := '';
    for I := 1 To Length(fField) do
      if fField[I] In ['0' .. '9'] Then
        Result := Result + fField[I];
  end;

begin
  RESTRequest1.Method := rmGet;
  RESTClient1.BaseURL := 'https://www.receitaws.com.br/v1/cnpj/';
  RESTRequest1.Resource := SoNumero(edtCNPJ.Text);
  RESTRequest1.Execute;

  Cliente := TClienteClass.Create;
  try
    Cliente := TJson.JsonToObject<TClienteClass>(RESTResponse1.Content);

    Memo1.Clear;
    Memo1.Lines.Add('CNPJ: ' + Cliente.cnpj);
    Memo1.Lines.Add('Razão Social: ' + Cliente.nome);
    Memo1.Lines.Add('Telefone: ' + Cliente.telefone);
    Memo1.Lines.Add('Logradouro: ' + Cliente.logradouro);
    Memo1.Lines.Add('Número: ' + Cliente.numero);
    Memo1.Lines.Add('Complemento: ' + Cliente.complemento);
    Memo1.Lines.Add('Bairro: ' + Cliente.bairro);
    Memo1.Lines.Add('Cidade: ' + Cliente.municipio);
    Memo1.Lines.Add('UF: ' + Cliente.uf);
    Memo1.Lines.Add('CEP: ' + Cliente.cep);
    Memo1.Lines.Add('Situação: ' + Cliente.situacao);
    Memo1.Lines.Add('Data da Situação: ' + Cliente.data_situacao);
  finally
    Cliente.Free;
  end;
end;

end.

unit treadproqy;

interface

uses classes,  func, untnfceForm, dialogs, FireDAC.Comp.Client;

type
  TTWThreadProdQY = class(TThread)
  protected
    procedure Execute; override;
  public
  end;

  TTWThreadOcioso = class(TThread)
  protected
    procedure Execute; override;
  public
  end;

  TTWtheadEnviaCupons = class(TThread)
  private
  protected
    procedure Execute; override;
  public
  end;


implementation
uses unit1, relatorio;

procedure TTWThreadProdQY.Execute;
begin
  dm.ProdutoQY.Active:=true;
  dm.ProdutoQY.FetchAll;
end;

procedure TTWThreadOcioso.Execute;
var
  query : TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm.bd;

  query.SQL.Text := 'SELECT CAST (''NOW'' AS TIMESTAMP) as DATA FROM RDB$DATABASE';
  query.Open;
  query.Close;
end;



procedure TTWtheadEnviaCupons.Execute;
var
  query : TFDQuery;
  fornec : String;
begin
  query := TFDQuery.Create(nil);
  query.Connection := dm.bd;

  query.SQL.Text := 'select nota, chave from NFCE where adic = ''OFF''';
  query.Open;


  while not query.Eof do
    begin
      funcoes.enviandoCupom := true;
      try
        //funcoes.Mensagem(Application.Title ,'Aguarde, Enviando NFCe...',15,'Courier New',false,0,clred);
        EnviarCupomEletronico2(query.fieldbyname('nota').AsString, query.fieldbyname('chave').AsString,
        form19.RichEdit1,fornec, false, true);
      except
        //pergunta1.close;
      end;
      query.Next;
    end;
  funcoes.enviandoCupom := false;
end;




end.



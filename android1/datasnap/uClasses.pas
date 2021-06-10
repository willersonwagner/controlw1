unit uClasses;

interface

uses DBXJSON, DBXJSONReflect, system.JSON;

type
  TItem_venda   = class
    nota     : integer;
    cod      : integer;
    quant    : currency;
    total    : currency;
    p_venda  : currency;
  end;

  tParcelamento = class
    nota       : integer;
    periodo    : integer;
    data       : tdate;
    qtdprest   : integer;
    vencimento : TDate;
    cliente    : integer;
    entrada    : currency;
    vlrtotal   : currency;
  end;

  Tcliente = class
    cod     : integer;
    nome    : String;
    titular : String;
    cnpj    : string;
    tipo    : string;
    ende    : string;
    bairro  : string;
    ies     : string;
    est     : string;
    cid     : string;
    telres  : string;
    telcom  : string;
    cep  : string;
  end;

  Tvenda   = class
    nota     : integer;
    data     : TDateTime;
    total    : currency;
    vendedor : integer;
    usuario  : integer;
    desconto : Currency;
    codhis   : integer;
    cliente  : Tcliente;
    parcelamento : tParcelamento;
    imprime : char;
    itensV   : array of TItem_venda;
  end;

  Tproduto = class
      cod      : integer;
      nome     : string;
      codbar   : string;
      p_compra : currency;
      p_venda  : currency;
      obs      : string;
      p_venda1 : currency;
  end;

  Tforma = class
    cod  : integer;
    nome : string;
  end;

  TUsuario = class
    cod           : integer;
    codVendedor   : integer;
    nome          : string;
    usu           : string;
    senha         : string;
  end;

  TlistaVendas = class
    private
    public
      listaVenda : array of Tvenda;
  end;


  TlistaFormas = class
    private
    public
      listaFormas : array of Tforma;
  end;

  TlistaUsuario = class
    private
    public
      listaUsuario : array of TUsuario;
  end;

  TlistaProdutos = class
    private
    public
      listaProdutos : array of Tproduto;
  end;

function JSONToProdutos(json : TJSONValue) : TlistaProdutos;
function ListaProdutosToJSON(lista : TlistaProdutos) : TJSONValue;


implementation


function ListaProdutosToJSON(lista : TlistaProdutos) : TJSONValue;
var
  m : TJSONMarshal;
begin
  m := TJSONMarshal.Create(TJSONConverter.Create);
  if Assigned(lista) then
    begin
      try
        exit(m.Marshal(lista));
      finally
        m.Free;
      end;
    end
  else
    begin
      exit(tjsonnull.Create);
    end;
end;

function JSONToProdutos(json : TJSONValue) : TlistaProdutos;
var
  m : TJSONUnMarshal;
begin
  if json is TJSONNull then exit(nil)
  else
    begin
      m := TJSONUnMarshal.Create;
      try
        Result := m.Unmarshal(json) as TlistaProdutos;
        exit(result);
      finally
        m.Free;
      end;
    end;
end;

end.

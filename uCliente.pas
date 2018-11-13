unit uCliente;
interface

uses Generics.Collections, Rest.Json;

type

TExtraClass = class
private
public
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TExtraClass;
end;

TQsaClass = class
private
  FNome: String;
  FQual: String;
public
  property nome: String read FNome write FNome;
  property qual: String read FQual write FQual;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TQsaClass;
end;

TAtividades_secundariasClass = class
private
  FCode: String;
  FText: String;
public
  property code: String read FCode write FCode;
  property text: String read FText write FText;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TAtividades_secundariasClass;
end;

TAtividade_principalClass = class
private
  FCode: String;
  FText: String;
public
  property code: String read FCode write FCode;
  property text: String read FText write FText;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TAtividade_principalClass;
end;

TClienteClass = class
private
  FAbertura: String;
  FAtividade_principal: TArray<TAtividade_principalClass>;
  FAtividades_secundarias: TArray<TAtividades_secundariasClass>;
  FBairro: String;
  FCapital_social: String;
  FCep: String;
  FCnpj: String;
  FComplemento: String;
  FData_situacao: String;
  FData_situacao_especial: String;
  FEfr: String;
  FEmail: String;
  FExtra: TExtraClass;
  FFantasia: String;
  FLogradouro: String;
  FMotivo_situacao: String;
  FMunicipio: String;
  FNatureza_juridica: String;
  FNome: String;
  FNumero: String;
  FQsa: TArray<TQsaClass>;
  FSituacao: String;
  FSituacao_especial: String;
  FStatus: String;
  FTelefone: String;
  FTipo: String;
  FUf: String;
  FUltima_atualizacao: String;
public
  property abertura: String read FAbertura write FAbertura;
  property atividade_principal: TArray<TAtividade_principalClass> read FAtividade_principal write FAtividade_principal;
  property atividades_secundarias: TArray<TAtividades_secundariasClass> read FAtividades_secundarias write FAtividades_secundarias;
  property bairro: String read FBairro write FBairro;
  property capital_social: String read FCapital_social write FCapital_social;
  property cep: String read FCep write FCep;
  property cnpj: String read FCnpj write FCnpj;
  property complemento: String read FComplemento write FComplemento;
  property data_situacao: String read FData_situacao write FData_situacao;
  property data_situacao_especial: String read FData_situacao_especial write FData_situacao_especial;
  property efr: String read FEfr write FEfr;
  property email: String read FEmail write FEmail;
  property extra: TExtraClass read FExtra write FExtra;
  property fantasia: String read FFantasia write FFantasia;
  property logradouro: String read FLogradouro write FLogradouro;
  property motivo_situacao: String read FMotivo_situacao write FMotivo_situacao;
  property municipio: String read FMunicipio write FMunicipio;
  property natureza_juridica: String read FNatureza_juridica write FNatureza_juridica;
  property nome: String read FNome write FNome;
  property numero: String read FNumero write FNumero;
  property qsa: TArray<TQsaClass> read FQsa write FQsa;
  property situacao: String read FSituacao write FSituacao;
  property situacao_especial: String read FSituacao_especial write FSituacao_especial;
  property status: String read FStatus write FStatus;
  property telefone: String read FTelefone write FTelefone;
  property tipo: String read FTipo write FTipo;
  property uf: String read FUf write FUf;
  property ultima_atualizacao: String read FUltima_atualizacao write FUltima_atualizacao;
  constructor Create;
  destructor Destroy; override;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TClienteClass;
end;

implementation

{TExtraClass}


function TExtraClass.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TExtraClass.FromJsonString(AJsonString: string): TExtraClass;
begin
  result := TJson.JsonToObject<TExtraClass>(AJsonString)
end;

{TQsaClass}


function TQsaClass.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TQsaClass.FromJsonString(AJsonString: string): TQsaClass;
begin
  result := TJson.JsonToObject<TQsaClass>(AJsonString)
end;

{TAtividades_secundariasClass}


function TAtividades_secundariasClass.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TAtividades_secundariasClass.FromJsonString(AJsonString: string): TAtividades_secundariasClass;
begin
  result := TJson.JsonToObject<TAtividades_secundariasClass>(AJsonString)
end;

{TAtividade_principalClass}


function TAtividade_principalClass.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TAtividade_principalClass.FromJsonString(AJsonString: string): TAtividade_principalClass;
begin
  result := TJson.JsonToObject<TAtividade_principalClass>(AJsonString)
end;

{TClienteClass}

constructor TClienteClass.Create;
begin
  inherited;
  FExtra := TExtraClass.Create();
end;

destructor TClienteClass.Destroy;
var
  Latividade_principalItem: TAtividade_principalClass;
  Latividades_secundariasItem: TAtividades_secundariasClass;
  LqsaItem: TQsaClass;
begin

 for Latividade_principalItem in FAtividade_principal do
   Latividade_principalItem.free;
 for Latividades_secundariasItem in FAtividades_secundarias do
   Latividades_secundariasItem.free;
 for LqsaItem in FQsa do
   LqsaItem.free;

  FExtra.free;
  inherited;
end;

function TClienteClass.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TClienteClass.FromJsonString(AJsonString: string): TClienteClass;
begin
  result := TJson.JsonToObject<TClienteClass>(AJsonString)
end;

end.


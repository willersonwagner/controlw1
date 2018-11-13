{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$I ACBr.inc}
{*****************************************************************************
** Nome...............: untConfiguracoesNFe.pas                             **
** Autor/Programador..: WILLERSON WAGNER DOS SANTOS SILVA                   **
** Descrição..........: Modulo NF-e                                         **
** Data...............: 15/09/2014                                          **
** Data atualizacao da NFC-e 2.0 02/02/2011                                 **
******************************************************************************}
////////////////////////
{CÓDIGO E RESULTADO DO PROCESSAMENTO DA SOLICITAÇÃO
100 - Autorizado o uso da NF-e
101 - Cancelamento de NF-e homologado
102 - Inutilização de número homologado
103 - Lote recebido com sucesso
104 - Lote processado
105 - Lote em processamento
106 - Lote não localizado
107 - Serviço em Operação
108 - Serviço Paralisado Momentaneamente (curto prazo)
109 - Serviço Paralisado sem Previsão
110 - Uso Denegado
111 - Consulta cadastro com uma ocorrência
112 - Consulta cadastro com mais de uma ocorrência 
///////////////////////
CÓDIGO MOTIVOS DE NÃO ATENDIMENTO DA SOLICITAÇÃO
201 Rejeição: O numero máximo de numeração de NF-e a inutilizar ultrapassou o limite
202 Rejeição: Falha no reconhecimento da autoria ou integridade do arquivo digital
203 Rejeição: Emissor não habilitado para emissão da NF-e
204 Rejeição: Duplicidade de NF-e
205 Rejeição: NF-e está denegada na base de dados da SEFAZ
206 Rejeição: NF-e já está inutilizada na Base de dados da SEFAZ
207 Rejeição: CNPJ do emitente inválido
208 Rejeição: CNPJ do destinatário inválido
209 Rejeição: IE do emitente inválida
210 Rejeição: IE do destinatário inválida
211 Rejeição: IE do substituto inválida
212 Rejeição: Data de emissão NF-e posterior a data de recebimento
213 Rejeição: CNPJ-Base do Emitente difere do CNPJ-Base do Certificado Digital
214 Rejeição: Tamanho da mensagem excedeu o limite estabelecido
215 Rejeição: Falha no schema XML
216 Rejeição: Chave de Acesso difere da cadastrada
217 Rejeição: NF-e não consta na base de dados da SEFAZ
218 Rejeição: NF-e já esta cancelada na base de dados da SEFAZ
219 Rejeição: Circulação da NF-e verificada
220 Rejeição: NF-e autorizada há mais de 7 dias (168 horas)
221 Rejeição: Confirmado o recebimento da NF-e pelo destinatário
222 Rejeição: Protocolo de Autorização de Uso difere do cadastrado
223 Rejeição: CNPJ do transmissor do lote difere do CNPJ do transmissor da consulta
224 Rejeição: A faixa inicial é maior que a faixa final
225 Rejeição: Falha no Schema XML da NFe
226 Rejeição: Código da UF do Emitente diverge da UF autorizadora
227 Rejeição: Erro na Chave de Acesso – Campo ID
228 Rejeição: Data de Emissão muito atrasada
229 Rejeição: IE do emitente não informada
230 Rejeição: IE do emitente não cadastrada
231 Rejeição: IE do emitente não vinculada ao CNPJ
232 Rejeição: IE do destinatário não informada
233 Rejeição: IE do destinatário não cadastrada
234 Rejeição: IE do destinatário não vinculada ao CNPJ
235 Rejeição: Inscrição SUFRAMA inválida
236 Rejeição: Chave de Acesso com dígito verificador inválido
237 Rejeição: CPF do destinatário inválido
238 Rejeição: Cabeçalho – Versão do arquivo XML superior a Versão vigente
239 Rejeição: Cabeçalho – Versão do arquivo XML não suportada
240 Rejeição: Cancelamento/Inutilização – Irregularidade Fiscal do Emitente
241 Rejeição: Um número da faixa já foi utilizado
242 Rejeição: Cabeçalho – Falha no Schema XML
243 Rejeição: XML Mal Formado
244 Rejeição: CNPJ do Certificado Digital difere do CNPJ da Matriz e do CNPJ do
Emitente
245 Rejeição: CNPJ Emitente não cadastrado
246 Rejeição: CNPJ Destinatário não cadastrado
247 Rejeição: Sigla da UF do Emitente diverge da UF autorizadora
248 Rejeição: UF do Recibo diverge da UF autorizadora
249 Rejeição: UF da Chave de Acesso diverge da UF autorizadora
250 Rejeição: UF diverge da UF autorizadora
251 Rejeição: UF/Município destinatário não pertence a SUFRAMA
252 Rejeição: Ambiente informado diverge do Ambiente de recebimento
253 Rejeição: Digito Verificador da chave de acesso composta inválida
254 Rejeição: NF-e complementar não possui NF referenciada
255 Rejeição: NF-e complementar possui mais de uma NF referenciada
256 Rejeição: Uma NF-e da faixa já está inutilizada na Base de dados da SEFAZ
257 Rejeição: Solicitante não habilitado para emissão da NF-e
258 Rejeição: CNPJ da consulta inválido
259 Rejeição: CNPJ da consulta não cadastrado como contribuinte na UF
260 Rejeição: IE da consulta inválida
261 Rejeição: IE da consulta não cadastrada como contribuinte na UF
262 Rejeição: UF não fornece consulta por CPF
263 Rejeição: CPF da consulta inválido
264 Rejeição: CPF da consulta não cadastrado como contribuinte na UF
265 Rejeição: Sigla da UF da consulta difere da UF do Web Service
266 Rejeição: Série utilizada não permitida no Web Service
267 Rejeição: NF Complementar referencia uma NF-e inexistente
268 Rejeição: NF Complementar referencia uma outra NF-e Complementar
269 Rejeição: CNPJ Emitente da NF Complementar difere do CNPJ da NF
Referenciada
270 Rejeição: Código Município do Fato Gerador: dígito inválido
271 Rejeição: Código Município do Fato Gerador: difere da UF do emitente
272 Rejeição: Código Município do Emitente: dígito inválido
273 Rejeição: Código Município do Emitente: difere da UF do emitente
274 Rejeição: Código Município do Destinatário: dígito inválido
275 Rejeição: Código Município do Destinatário: difere da UF do Destinatário
276 Rejeição: Código Município do Local de Retirada: dígito inválido
277 Rejeição: Código Município do Local de Retirada: difere da UF do Local de
Retirada
278 Rejeição: Código Município do Local de Entrega: dígito inválido
279 Rejeição: Código Município do Local de Entrega: difere da UF do Local de Entrega
280 Rejeição: Certificado Transmissor inválido
281 Rejeição: Certificado Transmissor Data Valida3de
282 Rejeição: Certificado Transmissor sem CNPJ
283 Rejeição: Certificado Transmissor – erro Cadeia de Certificação
284 Rejeição: Certificado Transmissor revogado
285 Rejeição: Certificado Transmissor difere ICP-Brasil
286 Rejeição: Certificado Transmissor erro no acesso a LCR
287 Rejeição: Código Município do FG – ISSQN: dígito inválido
288 Rejeição: Código Município do FG – Transporte: dígito inválido
289 Rejeição: Código da UF informada diverge da UF solicitada
290 Rejeição: Certificado Assinatura inválido
291 Rejeição: Certificado Assinatura Data Validade
292 Rejeição: Certificado Assinatura sem CNPJ
293 Rejeição: Certificado Assinatura – erro Cadeia de Certificação
294 Rejeição: Certificado Assinatura revogado
295 Rejeição: Certificado Assinatura difere ICP-Brasil
296 Rejeição: Certificado Assinatura erro no acesso a LCR
297 Rejeição: Assinatura difere do calculado
298 Rejeição: Assinatura difere do padrão do Projeto
299 Rejeição: XML da área de cabeçalho com codificação diferente de UTF-8
401 Rejeição: CPF do remetente inválido
402 Rejeição: XML da área de dados com codificação diferente de UTF-8
403 Rejeição: O grupo de informações da NF-e avulsa é de uso exclusivo do Fisco
404 Rejeição: Uso de prefixo de namespace não permitido
405 Rejeição: Código do país do emitente: dígito inválido
406 Rejeição: Código do país do destinatário: dígito inválido
407 Rejeição: O CPF só pode ser informado no campo emitente para a NF-e avulsa
453 Rejeição: Ano de inutilização não pode ser superior ao Ano atual
454 Rejeição: Ano de inutilização não pode ser inferior a 2006
478 Rejeição: Local da entrega não informado para faturamento direto de veículos
novos
999 Rejeição: Erro não catalogado (informar a mensagem de erro capturado no
tratamento da exceção)

CÓDIGO MOTIVOS DE DENEGAÇÃO DE USO
301 Uso Denegado : Irregularidade fiscal do emitente
302 Uso Denegado : Irregularidade fiscal do destinatário }


unit untNFCe;

interface

uses IniFiles, comctrls, sysutils, controls, classes,
     ComObj,variants,dialogs, StdCtrls, ShDocVw, Forms,
     pcnConversao, pcnNFeRTXT, ACBrUtil, DateUtils, ACBrNFe, ACBrNFeDANFeESCPOS,
     ACBrNFeDANFEClass,ACBrDANFCeFortesFr, printers,
     func, ibquery, classes1, StrUtils, acbrbal, WINDOWS, funcoesdav,
     ACBrIBPTax, pcnConversaoNFe, ACBrNFeDANFeRLClass;
 //
  procedure carregaConfigsNFCe;
  function valXML(const val : String) : currency;
  function reStartGenerator(nome : string; Valor : integer): String;
  procedure trataDuplicidade(erroDup : String; msg : boolean; nfe : boolean = false);
  function Incrementa_Generator1(Gen_name : string; valor_incremento : integer) : string;
  procedure Ler_dados_pela_chave(var chav1 : TChaveDetalhes);
  procedure insereNotaBD1(var dados : Tvenda);
  FUNCTION GerarNFCeTexto(const nota : String; cliente : String; nnf : String = '') : AnsiString;
  FUNCTION GerarNFCeTextoCliente(const nota : String; var cliente : TStringList; nnf : String = '') : AnsiString;
  FUNCTION NODO_DEST(TIPO, CPF, CNPJ, NOME, ENDE, BAIRRO, COD_MUN, NOM_MUN, UF, CEP, FONE, IE, CODMUN_EMI : String) : string;
  function NODO_TRANP() : String;
  FUNCTION NODO_PAG()   : STRING;
  FUNCTION NODO_RAIZ(NOTA : STRING) : string;
  FUNCTION NODO_NFE(NOTA : STRING) : string;
  FUNCTION NODO_INFNFE(CHAVENF, NOTA : string) : string;
  FUNCTION NODO_IDE(NOTA,UF, NUM_NF, FIN_NFE,  COD_CFOP, EXT_CFOP, DAT, FORMPAG, COD_MUNIC, DV_NF : string; OFFLine : boolean = false) : string;
  function GeraChaveNf(NOTA :STRING) : string;
  FUNCTION NODO_ITENS(var lista : tlist; CFOP, POS, CSTICM_CFP, CSTPIS_CFP, _ORIGE : string) : string;
  FUNCTION NODO_TOTAL(TOTNOTA, TOT_BASEICM, TOT_ICM, TOT_PIS, TOT_COFINS, TOTDESCICM, TOTDESC : currency) : string;
  FUNCTION NODO_INFADIC(INFO : string; PIS_NT, PIS_ST, COFINS_ST, _CFOP : currency) : String;
  FUNCTION NODO_ICMS1(var MAT : Item_venda; CSTICM_CFOP, _ORIGE : string) : string;
  FUNCTION NODO_PISCOFINS1(var item1 : Item_venda; CSTPIS_CFOP : string) : string;
  FUNCTION SUB_NODO_END(ENDE : String) : string;
  procedure GravarTexto(SalvarComo, Texto:String);
  function getDataHoraAtualXML() : String;
  FUNCTION CAMPO_VAZIO(ENT : STRING) : Smallint;
  Function testacpf(cpf:string):boolean;
  procedure criaXMLs(nota1,nnf, chav4 : String);
  procedure criaXMLsComDATA(nota1,nnf, chav4, data : String);
  procedure LimpaVariaveis();
  function verificaExisteNFCe(const nota2 : String; imprime : boolean = false) : string;
  function buscaChaveErroDeDuplicidade(erro : String) : String;


  function GRAVA_NODO_PROT_NFE1(ARQ_caminho : string) : string;
  procedure geraPgerais(var lis : TStringList);
  function Arredonda( valor:currency; decimais:integer; tipo : string = '') : currency;
  function buscaCRCdaChave(const chve : string) : String;
  function substitui_Nodo(nome:string; conteudo : string; const texto :string) : String;
  function buscaPastaConfigControlRede() : String;
  function validaDadosDestinatario() : String;
  function downloadXML(const chave, cnpj1, caminhoControlWBarra : String; const copiar : boolean = true) : boolean;
  procedure imprimirNfce();
  procedure imprimirNFe();
  function calculaVlrAproxImpostos(var lista1 : TList) : currency;
  function ArredondaTrunca(Value: Extended;decimais:integer): Extended;
  function ArredondaFinanceiro(Value: Currency; Decimals: integer): Currency;
  procedure lerVenda(const nota1 : String);
  function Retorna_FinalidadeNFe(svl:string):TpcnFinalidadeNFe;
  function FormataData(data : tdatetime) : string;
  function Retorna_UFComerciante(svl:string):String;
  function Retorna_TipoAmbiente(svl:string):TpcnTipoAmbiente;
  function Retorna_TipoEmissaoNFe(svl:string):TpcnTipoEmissao;
  function FormaPagamento_NFCe(formaPagto:String): TpcnFormaPagamento;
  procedure lerItensDaVenda(var lista : TList; const nota : string);
  FUNCTION NODO_ICMS(var MAT : Item_venda; CSTICM_CFOP, _ORIGE : string; indx : integer) : string;
  FUNCTION NODO_EMIT(CNPJ, RAZAO, FANTASIA, ENDE, BAIRRO, COD_MUN, NOM_MUN, UF, CEP, FONE, IE, CRT : string) : string;
  function GeraXml : String;
  procedure insereNotaBD(var dados : Tvenda);
  Function ProcuraItemNaLista(var lista : TList; cod1 : integer) : integer;
  function setPrinter(const indx : integer) : String;
  procedure lerConfigBalanca();
  //FUNCTION CAMPO_VAZIO(ENT : STRING) : Smallint;
  procedure gravaERRO_LOG(caminho1, erro2, local1 : String);
  procedure gravaERRO_LOG1(caminho1, erro2, local1 : String);

 procedure Verifica_Status_NFe;
 procedure LoadXML(MyMemo: TMemo; MyWebBrowser: TWebBrowser);
 function LerConfiguracaoCFOP():String;
 procedure LerConfiguracaoNFCe();
 procedure LerConfiguracaoNFe();
 procedure lerNodoIde(const codNF : integer; nota : String; serie : String = '1');
 procedure lerNodoEmitDest();
 Procedure LerDados_Emit_Dest(codDest : string; nnf : String = '');
 Procedure LerDados_Emit_Dest1(var codDest : TStringList; nnf : String = '');
 function RetornaEndeRua(const entra : string) : string;
 function RetornaNumero(const entra : string) : string;
 function verNCM(const cod : integer) : String;
 function Format_num(valor : currency) : string;
 procedure inicializaVariaveis();
 FUNCTION NODO_PISCOFINS(var item1 : Item_venda; CSTPIS_CFOP : string; indx : integer) : string;
 FUNCTION VE_IMPOSTO(_PC, _PV, _qtd : currency) : currency;

 procedure GravarConfiguracao(certificadoCaminho, certificadoSenha, certificadoNumeroSerie:String;  FinalidadeNFE,  DANFETipo, DANFEFormaEmissao:integer; DANFELogomarca:String;
                             ArqLog:Boolean; CaminhoLog, WebUF:String;  WebAmbiente:integer; WebVisualiza:Boolean; ProxHost, ProxPorta, ProxUser, ProxSenha, EmailHost, EmailPorta, EmailUsuario, EmailSenha,
                             EmailAssunto:String; EmailSSL:Boolean; ArquivosPDF:String; ArquivosNFE:String; CDCFOP:String; idToken, Token:String; idxImpre, idxImpreNFe, tipoImpre : integer; preview : boolean;
                             const portaBalanca, veloBal, tipoBal : string; serie : String = '1'; qtdViasStr : String = '1'; tipoImp : String = '0'; PortaImpNFCE : String = '');

 procedure CarregarConfiguracao();
 procedure setQueryNFCe(var Lista : TList);
 procedure lerPathSalvar(var path : String);

 procedure GerarNFCe(nota, NumNFCe, TipoEmissao, TipoAmbiente, UFComerciante, FinalidadeNFe : String; recebido : currency = 0);
 function reenviarCupom(nota22 : String; var stats : String) : boolean;
 function EnviarCupomEletronico2(nota : String; var estado : String; const imprime, dav : boolean;const lerconfig : boolean = true):Boolean;
 function  EnviarCupomEletronico(nota : String;var Status:String; vAux, vNumLote : String;var MemoResp:TMemo; WBResposta:TWebBrowser;TipoEmissao,TipoAmbiente,UFComerciante, FinalidadeNFe:String):Boolean;
 function EnviarCupomEletronico1(nota : String; var Status, xmotivo : string;const tipo : integer;const enviar : boolean; const cliente1 : String; obs1 : String = ''; serie1 : String = '1'; NNF : STRING = ''; imp : boolean = true; recebido : currency = 0; primeiroCupom : boolean = false):Boolean;
 function EnviarCupomEletronicoOFFLINE(nota : String; var Status, xmotivo : string;const tipo : integer;const enviar : boolean; const cliente1 : String; obs1 : String = ''; serie1 : String = '1'; NNF : STRING = ''; imp : boolean = true; recebido : currency = 0; primeiroCupom : boolean = false):Boolean;
 function EnviarCupomEletronicoTitular(nota : String; var Status, xmotivo : string;const tipo : integer;const enviar : boolean; const cliente1 : String; obs1 : String = ''; serie1 : String = '1'; NNF : STRING = ''; imp : boolean = true; recebido : currency = 0; primeiroCupom : boolean = false):Boolean;
 procedure Imprimir_DANFE_PDF(numeroNota:String);
 function  Cancelamento_NFe(numeroNota:String;MemoResp:TMemo; WBResposta:TWebBrowser):Boolean;  Overload;
 function Cancelamento_NFe1(numeroNota, Justificativa:String):Boolean;
 function Cancelamento_NFePorNNF(numeroNota, Justificativa:String):Boolean;
 procedure ConsultarNFe(numeroNota:String; visuali : boolean = true);
 function getSerieNFCe() : String;
 function getUltimoNumero() : String;
 function getNumeroValido() : String;
 function verCSTcFOP(cfop : String) : String;
 procedure reimpressaoNFCe(numeroNota:String);
 function inutilizacaoNFCE(ini, fim, modelo : integer; just : String) : boolean;
 procedure Carrega_NotaFiscal_ArquivoXML(OpenDialog:TOpenDialog; var NotaFiscal:String; var CFOP:String; var CondPagto:String; var ModeloNF:String; var SerieNF:String; var DtEmissao:TDate; var DtEntSai:TDate;
                                                                 var HrEntSai:TDateTime; var CNPJEmitente:String; var InscEstEmitente:String; var InscMunicEmitente:String; var EnderecoEmitente:String;
                                                                 var NumeroEndEmitente:String; var BairroEmitente:String; var codMunicipoEmitente:String; var NomeMunicipioEmiente:String;
                                                                 var UFEmitente:String; var FoneEmitente:String; var CEPEmitente:String; var CNPJDestinario:String; var codMunicipioDestinario:String;
                                                                 var VlBaseCalculo:String; var VlICMS:String; var VlBaseCalculoST:String; var VlST:String; var VlProduto:String; var VlFrete:String; var VlSeguro:String;
                                                                 var VlDesconto:String; var VlIPI:String; var VlPis:String; var VlCofins:String; var VlOutros:String; var VlNotaFiscal:String;
                                                                 var ListaProdutos:TStrings);

var
 gProxHost,
 gProxPorta,
 gProxUser,
 gProxSenha, DigiVerifi, chaveNF, natOp, ERRO_dados,infAdic, dHAtual, tpEmis, obs2 : string;
 venda      : Tvenda;
 lista      : TList;
 codNF    : integer;
 query1, query2, query3 : tibquery;
 dadosEmitente, dadosDest : TStringList;
 TOT_PIS, TOT_COFINS, totalNota, PIS_ST, COFINS_ST, TRIB_ALIQ_COFINS, BASE_ICM,
 VLR_ICM, tot_Geral, TOTICM, TOT_BASEICM, PIS_NT, TRIB_ALIQ_PIS, TotImp, totDesc, vlRecebido : currency;
 ACBrNFe: TACBrNFe;
 DANFE: TACBrNFeDANFCeFortes;
 DANFEEscPos: TACBrNFeDANFeESCPOS;
 DANFE_Rave: TACBrNFeDANFeRL;
 BALANCA   : TACBrBAL;
 ACBrIBPTax1 : TACBrIBPTax;
 pgerais : TStringList;
 tipoEmissao : integer;
 pathSalvarControlW, pastaControlW, cstIcmCfop, cstpisCfop,
 portaCOMNFCE : String;

 indxImpressora         : integer;
 indxImpressoraNFE, serie2, tipoImp      : integer;


 glbCFOP,
 glbNuCheque,
 glbNumeroDAV,
 glbNumeroIP, cliente, serie, cod_OP    : string;
 gTipoEmissao   : string;
 gTipoAmbiente  : string;
 gUFComerciante : String;
 gFinalidadeNFe : String;
 gSmtpHost      : String;
 gSmtpPorta     : String;
 gSmtpUsuario   : String;
 gSmtpSenha     : String;
 gemailAssunto  : String;
 gemailSSL      : Boolean;
 ad_cdserie     : string;
 gArqPDF        : String;
 gArqNFE        : String;
 gSenhaCert, CDCFOP     : String;

 //0-normal 1-resumido
 tipoIMPRESSAO, qtdVias : integer;
 contOFFLINE   : boolean;


implementation

uses pcnNFe, Math, DB, ACBrNFeNotasFiscais, pcnEventoNFe, pcnEnvEventoNFe,
  ACBrNFeWebServices;

procedure lerConfigBalanca();
var
  Ini        : TIniFile ;
  arq : TStringList;
  pasta, tipo, velo, porta : String;
begin
  if not assigned(BALANCA) then exit;

  pasta := copy(ParamStr(0), 1, length(ParamStr(0)) - 3) + 'ini';
  if FilesExists(pasta) then
    begin
      Ini        := TIniFile.Create( pasta );

      porta := ini.ReadString('BALANCA', 'PORTA', 'COM1');
      velo  := ini.ReadString('BALANCA', 'VELO', '9600');
      tipo  := ini.ReadString('BALANCA', 'BALANCA', '0');
      ini.Free;
      
      BALANCA.Device.Baud  := StrToIntDef(velo, 9600);
      BALANCA.Device.Porta := porta;
      if tipo = '0' then BALANCA.Modelo := balNenhum
      else if tipo = '1' then BALANCA.Modelo := balDigitron
      else if tipo = '2' then BALANCA.Modelo := balFilizola
      else if tipo = '3' then BALANCA.Modelo := balLucasTec
      else if tipo = '4' then BALANCA.Modelo := balMagellan
      else if tipo = '5' then BALANCA.Modelo := balMagna
      else if tipo = '6' then BALANCA.Modelo := balToledo
      else if tipo = '7' then BALANCA.Modelo := balToledo2180
      else if tipo = '8' then BALANCA.Modelo := balUrano
      else if tipo = '8' then BALANCA.Modelo := balUranoPOP;
    end;
end;

procedure lerVenda(const nota1 : String);
begin
  query1.Close;
  query1.SQL.Clear;
  //query1.SQL.Add('select v.nota, v.desconto, v.total, v.codhis, v.cliente, (select nome, codhis from formpagto f where f.cod = v.codhis) as nome from venda v where v.nota = :nota');
  query1.SQL.Add('select v.nota, v.desconto, v.total, v.codhis, v.cliente, f.nome, f.codgru as codform from venda v left join formpagto f on (f.cod = v.codhis) where v.nota = :nota');
  query1.ParamByName('nota').AsString := nota1;
  query1.Open;

  venda := Tvenda.Create;
  venda.total    := query1.fieldbyname('total').AsCurrency;
  venda.desconto := abs(query1.fieldbyname('desconto').AsCurrency);
  venda.cliente  := StrToIntDef(cliente, 1);
  venda.codForma := query1.fieldbyname('codhis').AsString;
  venda._FORMPG  := query1.fieldbyname('nome').AsString;
  venda.nota     := query1.fieldbyname('nota').AsInteger;
  venda.adic     := IfThen(contOFFLINE, 'OFF', '');
  venda.codFormaNFCE := query1.fieldbyname('codform').AsString;
  if StrNum(venda.codFormaNFCE) = '0' then venda.codFormaNFCE := '01';
  query1.Close;
end;

procedure imprimirNFe();
var
  ini : integer;
begin
  ACBrNFe.DANFE := DANFE_Rave;
  try
    DANFE.Impressora := SetPrinter(indxImpressoraNFE);

    for ini := 0 to qtdVias - 1 do
      begin
        if tipoIMPRESSAO = 0 then ACBrNFe.NotasFiscais.Imprimir
          else ACBrNFe.NotasFiscais.ImprimirResumido;
      end;

    //if tipoIMPRESSAO = 0 then ACBrNFe.NotasFiscais.ImprimirPDF
      //else ACBrNFe.NotasFiscais.ImprimirResumidoPDF;
  except
    on e: exception do
      begin
        ShowMessage('ERRO: ' + e.Message);
      end;
  end;

  ACBrNFe.DANFE.NFeCancelada := false;
end;


procedure imprimirNfce();
begin
  danfe.TipoDANFE := tiNFCe;
  ACBrNFe.DANFE := DANFE;
  try
    SetPrinter(indxImpressora);
    if tipoIMPRESSAO = 0 then ACBrNFe.NotasFiscais.Imprimir
      else ACBrNFe.NotasFiscais.ImprimirResumido;

    printer.Create;//hack pra printer voltar ao tamanho A4
    //if tipoIMPRESSAO = 0 then ACBrNFe.NotasFiscais.ImprimirPDF
      //else ACBrNFe.NotasFiscais.ImprimirResumidoPDF;

    danfe.vTroco := 0;  
  except
    danfe.vTroco := 0;
  end;
end;

procedure lerPathSalvar(var path : String);
begin
  pathSalvarControlW := path;
end;

function setPrinter(const indx : integer) : String;
begin
  if printer.Printers.Count = 0 then exit;
  printer.PrinterIndex := indx;

  Result := printer.Printers.Strings[indx];
  DANFE.Impressora := Result;
end;

Function ProcuraItemNaLista(var lista : TList; cod1 : integer) : integer;
var fim, i : integer;
 item1 : Item_venda;
begin
  fim := lista.Count - 1;
  Result := -1;

  for i := 0 to fim do
   begin
     item1 := lista.Items[i];
     if item1.cod = cod1 then
       begin
         Result := i;
         break;
       end;
   end;
end;

procedure setQueryNFCe(var Lista : TList);
var
  fim : integer;
begin
  fim := lista.Count -1;
  if 0 <= fim then query1     := TIBQuery(Lista.Items[0]);
  if 1 <= fim then query2     := TIBQuery(Lista.Items[1]);
  if 2 <= fim then ACBrNFe    := TACBrNFe(Lista.Items[2]);
  if 3 <= fim then pgerais    := TStringList(lista.Items[3]);
  if 4 <= fim then DANFE      := TACBrNFeDANFCeFortes(Lista.Items[4]);
  if 5 <= fim then DANFE_Rave := TACBrNFeDANFeRL(Lista.Items[5]);
  if 6 <= fim then BALANCA    := TACBrBAL(lista.Items[6]);
  if 7 <= fim then DANFEEscPos := TACBrNFeDANFeESCPOS(lista.Items[7]);
  if 8 <= fim then ACBrIBPTax1 := TACBrIBPTax(lista.Items[8]);

  if pgerais = nil then geraPgerais(pgerais);
end;

procedure insereNotaBD(var dados : Tvenda);
begin
  query1.Close;
  Query1.SQL.Text := 'update or insert into nfce(chave, nota, data, cliente, adic) values(:chave, :nota, :data, :cliente, :adic) matching (chave)';
  Query1.ParamByName('chave').AsString    := dados.chave;
  Query1.ParamByName('nota').AsInteger    := dados.nota;
  Query1.ParamByName('data').AsDate       := now;
  Query1.ParamByName('cliente').AsInteger := dados.cliente;
  Query1.ParamByName('adic').AsString     := dados.adic;
  Query1.ExecSQL;

  query1.Close;
  Query1.SQL.Text := 'update venda set crc = :crc, entrega = ''E'' where nota = :nota';
  Query1.ParamByName('crc').AsString      := buscaCRCdaChave(StrNum(dados.chave));
  Query1.ParamByName('nota').AsInteger    := dados.nota;
  Query1.ExecSQL;
  Query1.Transaction.Commit;
end;

procedure insereNotaBD1(var dados : Tvenda);
begin
  query1.Close;
  Query1.SQL.Text := 'delete from nfce where nota = :nota';
  Query1.ParamByName('nota').AsInteger    := dados.nota;
  query1.ExecSQL;
  query1.Transaction.Commit;

  query1.Close;
  Query1.SQL.Text := 'update or insert into nfce(chave, nota, data, cliente, adic) values(:chave, :nota, :data, :cliente, :adic) matching(nota)';
  Query1.ParamByName('chave').AsString    := dados.chave;
  Query1.ParamByName('nota').AsInteger    := dados.nota;
  Query1.ParamByName('data').AsDate       := now;
  Query1.ParamByName('cliente').AsInteger := dados.cliente;
  Query1.ParamByName('adic').AsString     := dados.adic;
  Query1.ExecSQL;
  query1.Transaction.Commit;
end;

procedure inicializaVariaveis();
begin
  TOT_PIS     := 0;
  TOT_COFINS  := 0;
  TOTICM      := 0;
  TOT_BASEICM := 0;
  PIS_ST      := 0;
  PIS_NT      := 0;
  tot_Geral   := 0;
end;

FUNCTION NODO_EMIT(CNPJ, RAZAO, FANTASIA, ENDE, BAIRRO, COD_MUN, NOM_MUN, UF, CEP, FONE, IE, CRT : string) : string;
var
  invalido : integer;
  ok : boolean;
begin
  INVALIDO := 0;
  ok := true;
  //OK := VALIDACNPJ(CNPJ);

  IF(NOT OK) then
    begin
      ERRO_dados := 'CNPJ do Emitente Inválido ' + #13;
    end;

  INVALIDO := invalido + CAMPO_VAZIO(ENDE);
  INVALIDO := invalido + CAMPO_VAZIO(BAIRRO);
  INVALIDO := invalido + CAMPO_VAZIO(COD_MUN);
  INVALIDO := invalido + CAMPO_VAZIO(NOM_MUN);
  INVALIDO := invalido + CAMPO_VAZIO(UF);
  INVALIDO := invalido + CAMPO_VAZIO(CEP);
  IF INVALIDO <> 0 then
    begin
      ERRO_DADOS := erro_dados + 'Dados do Emitente Incompletos ' + #13;
      exit;
    end;

  Result := '<emit><CNPJ>' + CNPJ + '</CNPJ><xNome>' + RAZAO + '</xNome>' +
  '<xFant>' + (FANTASIA) + '</xFant><enderEmit>' +
  SUB_NODO_END(ENDE) + '<xBairro>' + BAIRRO + '</xBairro><cMun>' +
  COD_MUN + '</cMun><xMun>' + NOM_MUN + '</xMun><UF>' + UF + '</UF>' +
  '<CEP>' + CEP + '</CEP><cPais>1058</cPais><xPais>BRASIL</xPais>' +
  '<fone>' + FONE + '</fone></enderEmit><IE>' + IE + '</IE><CRT>' + CRT + '</CRT></emit>';
end;

function FormataData(data : tdatetime) : string;
begin
  Result := FormatDateTime('YYYY-MM-DD',data);
end;


function GeraXml : String;
var
  Nome_Arquivo, Caminho,arq, test, ce : string;
  ini : integer;
begin
  PIS_ST := 0;
  PIS_NT := 0;
  COFINS_ST := 0;
  {valida := false;
  try
    LerDados_Emit_Dest(dest);
    //CriaLista_De_itens_Venda(lista_itens);
  except
  end;

  IF DEST_NFE = '2' then
    begin
      _EXPORTA := '<exporta><UFEmbarq>' +  dadosEmitente.Values['est'] + '</UFEmbarq>' +
      '<xLocEmbarq>' + dadosEmitente.Values['cid'] + '</xLocEmbarq></exporta>';
    end;


  //CriaDirCaminho('NFE\EMIT');
  //Caminho := pastaNFE_ControlW + 'NFE\EMIT\';

  try
    xml1 := NODO_RAIZ; //aqui cria o xml

    EmptyTList(Lista_Itens);
    if erro_dados <> '' then
      begin
        ShowMessage('Erro: '+erro_dados);
        exit;
      end;
  except
    on e: exception do
      begin
        ShowMessage('Erro Inesperado '+ e.Message);
        exit;
      end;
  end;

  arq := Caminho + chaveNF + '-nfe'+'.xml';
    if FileExists(Caminho + chaveNF + '-nfe'+'.xml') then
      begin
        dadosEmitente := TStringList.Create;
        dadosEmitente.LoadFromFile(Caminho + chaveNF + '-nfe'+'.xml');
        erro_dados := dadosEmitente.GetText;
        test := Le_Nodo('nProt', erro_dados);
        ce := Le_Nodo('cStat', erro_dados);
        if funcoes.Contido(ce,'100-101') AND (Length(ce) = 3) AND (Length(test) >= 13) AND (Length(test) <= 15) then
          begin
            ShowMessage('A nota '+ chaveNF +' já foi emitida.'+ #13 + #10 + #13 + #10 +
            'Numero de Protocolo: ' + test + ' ' + #13 + #10 +
            'Data e Hora de Autorização: ' + Le_Nodo('dhRecbto', ERRO_DADOS) + ' ' + #13 + #10 +
            'Status: ' + Le_Nodo('xMotivo', ERRO_DADOS) + ' ' + #13 + #10 +
            'Use a rotina Utilitários > Nfe > Reimpressão para ' +
            'imprimi-la, se necessário. Para emitir uma nova NF-e entre com um numero ' +
            'diferente deste.');
            exit;
          end;
      end;

    GravarTexto(arq, xml1);
    erro_dados := '';
    erro_dados := ValidarNfe(arq); // valida e envia o arquivo

    IF erro_dados <> '' THEN
      begin
        ShowMessage(erro_dados);
        EXIT;
      end;

    insereRegistroDaNotaNaTabelaNFE(nfeTemp, chaveNF);

    for ini := 0 to notas.Count -1 do
      begin
        funcoes.GRAVA_MOV(notas[ini], Form22.datamov, nfeTemp, '90', dest, false);
      end;

    Fechar_Datasets_limpar_Listas_e_variaveis;
}end;


FUNCTION NODO_PISCOFINS(var item1 : Item_venda; CSTPIS_CFOP : string; indx : integer) : string;
VAR
   COF_ALIQ, PIS_ALIQ : string;
  tot, VLR_COFINS, VLR_PIS : currency;
begin
  try
     TRIB_ALIQ_PIS    := StrToCurr(pgerais.Values['11']);
     TRIB_ALIQ_COFINS := StrToCurr(pgerais.Values['12']);
   except
     TRIB_ALIQ_COFINS := 0;
     TRIB_ALIQ_COFINS := 0;
   end;

  TOT := item1.total - item1.Desconto;
  //SE FOR OPTANTE DO SIMPLES NACIONAL, NAO USA TAG PIS/COFINS
  IF pgerais.Values['10'] = '1' then
    begin
      with ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[indx].Imposto do
        begin
          pis.CST := pis01;
          pis.vBC := tot;
          PIS.vPIS := 0;
          COFINS.CST := cof01;
          COFINS.vBC := tot;
          COFINS.pCOFINS := 0;
          COFINS.vCOFINS := 0;
        end;
     { Result := '<PIS><PISAliq><CST>01</CST><vBC>' + FORMAT_NUM(TOT) + '</vBC><pPIS>0.00</pPIS>' +
      '<vPIS>0.00</vPIS></PISAliq></PIS>' +
      '<COFINS><COFINSAliq><CST>01</CST><vBC>' + FORMAT_NUM(TOT) + '</vBC>' +
      '<pCOFINS>0.00</pCOFINS><vCOFINS>0.00</vCOFINS></COFINSAliq></COFINS>';
      }exit;
    end;

  PIS_ALIQ := '<PISAliq><CST>02</CST><vBC>' + FORMAT_NUM(TOT) + '</vBC><pPIS>0.00</pPIS>' +
  '<vPIS>0.00</vPIS></PISAliq>';
  COF_ALIQ := '<COFINSAliq><CST>02</CST><vBC>' + FORMAT_NUM(TOT) + '</vBC>' +
  '<pCOFINS>0.00</pCOFINS><vCOFINS>0.00</vCOFINS></COFINSAliq>';

  //SE O CFOP E ISENTO DE PIS/COFINS
  IF CSTPIS_CFOP = 'I' then
    begin
      with ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[indx].Imposto do
        begin
          pis.CST    := pis07;
          COFINS.CST := cof07;
          pis.vPIS   := 0;
          COFINS.vCOFINS := 0;
        end;

      PIS_NT := PIS_NT + TOT;
      {Result := '<PIS>' + PIS_ALIQ + '<PISNT><CST>07</CST></PISNT></PIS>' +
      '<COFINS>' + COF_ALIQ + '<COFINSNT><CST>07</CST></COFINSNT></COFINS>';
      }exit;
    end;

  //SE O CFOP NAO E TRIBUTADO POR PIS/COFINS
  IF CSTPIS_CFOP = 'N' then
    begin
      with ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[indx].Imposto do
        begin
          pis.CST    := pis06;
          COFINS.CST := cof06;
          pis.vPIS   := 0;
          COFINS.vCOFINS := 0;
        end;

      PIS_NT := PIS_NT + TOT;
      Result := '<PIS>' + PIS_ALIQ + '<PISNT><CST>06</CST></PISNT></PIS>' +
      '<COFINS>' + COF_ALIQ + '<COFINSNT><CST>06</CST></COFINSNT></COFINS>' ;
      exit;
    end;

   //SE O CFOP TEM  A ALIQ RED. A ZERO DE PIS/COFINS
   IF CSTPIS_CFOP = 'R' then
     begin
       with ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[indx].Imposto do
        begin
          pis.CST    := pis02;
          pis.vBC    := tot;
          COFINS.CST := cof02;
          COFINS.vBC := tot;
          pis.pPIS   := 0;
          pis.vPIS   := 0;
          COFINS.vCOFINS := 0;
          COFINS.pCOFINS := 0;
        end;

       PIS_NT := PIS_NT + TOT;
       Result := '<PIS><PISAliq><CST>02</CST><vBC>' + FORMAT_NUM(TOT) + '</vBC><pPIS>0.00</pPIS>' +
       '<vPIS>0.00</vPIS></PISAliq></PIS>'  +
       '<COFINS><COFINSAliq><CST>02</CST><vBC>' + FORMAT_NUM(TOT) + '</vBC>' +
       '<pCOFINS>0.00</pCOFINS><vCOFINS>0.00</vCOFINS></COFINSAliq></COFINS>';
       exit;
     end;

   //SE O CFOP NAO E TRIBUTADO POR PIS/COFINS
   IF CSTPIS_CFOP = 'M' then
     begin
       with ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[indx].Imposto do
        begin
          pis.CST    := pis04;
          COFINS.CST := cof04;
        end;

       PIS_NT := PIS_NT + TOT;
       Result := '<PIS>' + '<PISNT><CST>04</CST></PISNT></PIS>' +
       '<COFINS>' + '<COFINSNT><CST>04</CST></COFINSNT></COFINS>';
     end;

   //SE O CFOP E ISENTO DE PIS/COFINS
   IF CSTPIS_CFOP = 'X' then
     begin
       with ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[indx].Imposto do
        begin
          pis.CST    := pis08;
          COFINS.CST := cof08;
        end;

       PIS_NT := PIS_NT + TOT;
       Result := '<PIS><PISNT><CST>08</CST></PISNT></PIS>' +
       '<COFINS><COFINSNT><CST>08</CST></COFINSNT></COFINS>';
    end;

    //SE O CFOP TEM ALIQ DIFERENCIADA
    IF CSTPIS_CFOP = 'D' then
     begin
       with ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[indx].Imposto do
        begin
          pis.CST    := pis02;
          pis.vBC    := tot;
          COFINS.CST := cof02;
          COFINS.vBC := tot;
          pis.pPIS   := 0;
          pis.vPIS   := 0;
          cofins.pCOFINS := 0;
          cofins.vCOFINS := 0;
        end;

       PIS_NT := PIS_NT + TOT;
       {Result := '<PIS><PISAliq><CST>02</CST><vBC>' + FORMAT_NUM(TOT) + '</vBC><pPIS>0.00</pPIS>' +
       '<vPIS>' + Format_num(0.00) + '</vPIS></PISAliq></PIS>'  +
       '<COFINS><COFINSAliq><CST>02</CST><vBC>' + FORMAT_NUM(TOT) + '</vBC>' +
       '<pCOFINS>0.00</pCOFINS><vCOFINS>' + Format_num(0.00) + '</vCOFINS></COFINSAliq></COFINS>';}
     end;

   //CFOP - SE JA RECOLHEU PIS/COFINS POR SUBSTITUICAO TRIBUTARIA
   IF CSTPIS_CFOP = 'S' then
     begin
       VLR_PIS := ARREDONDA(item1.Total_Preco_Compra * TRIB_ALIQ_PIS /100, 2);
       VLR_COFINS := ARREDONDA(item1.Total_Preco_Compra * TRIB_ALIQ_COFINS /100, 2);
       PIS_ST := PIS_ST + VLR_PIS;
       COFINS_ST := COFINS_ST + VLR_COFINS;

       with ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[indx].Imposto do
        begin
          pis.CST    := pis02;
          pis.vBC    := tot;
          pis.pPIS   := TRIB_ALIQ_PIS;
          pis.vPIS   := VLR_PIS;
          COFINS.CST := cof02;
          COFINS.vBC := item1.Total_Preco_Compra;
          cofins.pCOFINS := TRIB_ALIQ_COFINS;
          cofins.vCOFINS := VLR_COFINS;
        end;

       {Result := '<PIS>' + PIS_ALIQ + '<PISST><vBC>' + FORMAT_NUM(item1.Total_Preco_Compra) + '</vBC>' +
       '<pPIS>' + FORMAT_NUM(TRIB_ALIQ_PIS) + '</pPIS>' +
       '<vPIS>' + FORMAT_NUM(VLR_PIS) + '</vPIS></PISST></PIS>' +
       '<COFINS>' + COF_ALIQ + '<COFINSST><vBC>' + FORMAT_NUM(item1.Total_Preco_Compra) + '</vBC>' +
       '<pCOFINS>' + FORMAT_NUM(TRIB_ALIQ_COFINS) + '</pCOFINS>' +
       '<vCOFINS>' + FORMAT_NUM(VLR_COFINS) + '</vCOFINS></COFINSST></COFINS>';}
       exit;
     end;

   //SE O PRODUTO E ISENTO DE PIS/COFINS
   IF ((item1.Pis = 'I') and (length(strnum(item1.codISPIS)) = 3)) then
     begin
       PIS_NT := PIS_NT + TOT;

       with ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[indx].Imposto do
        begin
          pis.CST    := pis07;
          pis.vBC    := 0;
          pis.pPIS   := TRIB_ALIQ_PIS;
          pis.vPIS   := 0;
          COFINS.CST := cof07;
          COFINS.vBC := 0;
          cofins.pCOFINS := TRIB_ALIQ_COFINS;
          cofins.vCOFINS := 0;
        end;

     //  Result := '<PIS>' + PIS_ALIQ + '<PISNT><CST>07</CST></PISNT></PIS>' +
     //  '<COFINS>' + COF_ALIQ + '<COFINSNT><CST>07</CST></COFINSNT></COFINS>' ;
       exit;
     end;

   //SE O PRODUTO NAO E TRIBUTADO POR PIS/COFINS
   IF ((item1.Pis = 'N') and (length(strnum(item1.codISPIS)) = 3)) then
     begin
       with ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[indx].Imposto do
        begin
          pis.CST    := pis06;
          pis.vPIS   := 0;
          COFINS.CST := cof06;
          cofins.vCOFINS := 0;
        end;

       PIS_NT := PIS_NT + TOT;
       Result := '<PIS>' + PIS_ALIQ + '<PISNT><CST>06</CST></PISNT></PIS>' +
       '<COFINS>' + COF_ALIQ + '<COFINSNT><CST>06</CST></COFINSNT></COFINS>';
       exit;
     end;

   //SE O PRODUTO TEM  A ALIQ RED. A ZERO DE PIS/COFINS
   IF ((item1.Pis = 'R') and (length(strnum(item1.codISPIS)) = 3)) then
     begin
       with ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[indx].Imposto do
        begin
          pis.CST    := pis06;
          pis.pPIS   := 0;
          pis.vPIS   := 0;
          pis.vBC    := tot;
          COFINS.CST := cof06;
          COFINS.vBC := tot;
          cofins.vCOFINS := 0;
          cofins.pCOFINS := 0;
        end;

       PIS_NT := PIS_NT + TOT;
       Result := '<PIS><PISAliq><CST>02</CST><vBC>' + FORMAT_NUM(TOT) + '</vBC><pPIS>0.00</pPIS>' +
       '<vPIS>0.00</vPIS></PISAliq></PIS>'  +
       '<COFINS><COFINSAliq><CST>02</CST><vBC>' + FORMAT_NUM(TOT) + '</vBC>' +
       '<pCOFINS>0.00</pCOFINS><vCOFINS>0.00</vCOFINS></COFINSAliq></COFINS>' ;
       exit;
     end;

   //SE O PRODUTO TEM  A ALIQ RED. A ZERO DE PIS/COFINS
   IF ((item1.Pis = 'X') and (length(strnum(item1.codISPIS)) = 3)) then
     begin
       with ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[indx].Imposto do
        begin
          pis.CST    := pis08;
          pis.pPIS   := 0;
          pis.vPIS   := 0;
          pis.vBC    := 0;
          COFINS.CST := cof08;
          COFINS.vBC := 0;
          cofins.vCOFINS := 0;
          cofins.pCOFINS := 0;
        end;

       PIS_NT := PIS_NT + TOT;
       Result := '<PIS><PISAliq><CST>02</CST><vBC>' + FORMAT_NUM(TOT) + '</vBC><pPIS>0.00</pPIS>' +
       '<vPIS>0.00</vPIS></PISAliq></PIS>'  +
       '<COFINS><COFINSAliq><CST>02</CST><vBC>' + FORMAT_NUM(TOT) + '</vBC>' +
       '<pCOFINS>0.00</pCOFINS><vCOFINS>0.00</vCOFINS></COFINSAliq></COFINS>' ;
       exit;
     end;

   //PRODUTO - SE JA RECOLHEU PIS/COFINS POR SUBSTITUICAO TRIBUTARIA
   IF item1.Pis = 'S' then
     begin
       VLR_PIS := ARREDONDA(tot * TRIB_ALIQ_PIS /100, 2);
       VLR_COFINS := ARREDONDA(tot * TRIB_ALIQ_COFINS /100, 2);
       PIS_ST := PIS_ST + VLR_PIS;
       COFINS_ST := COFINS_ST + VLR_COFINS;

       with ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[indx].Imposto do
        begin
          pis.CST    := pis02;
          pis.vPIS   := VLR_PIS;
          pis.pPIS   := TRIB_ALIQ_PIS;
          pis.vBC    := tot;
          COFINS.CST := cof02;
          COFINS.vBC := tot;
          COFINS.pCOFINS := TRIB_ALIQ_COFINS;
          cofins.vCOFINS := VLR_COFINS;
        end;

       Result :=  '<PIS>' + PIS_ALIQ + '<PISST><vBC>' + FORMAT_NUM(item1.Total_Preco_Compra) + '</vBC>' +
       '<pPIS>' + FORMAT_NUM(TRIB_ALIQ_PIS) + '</pPIS>' +
       '<vPIS>' + FORMAT_NUM(VLR_PIS) + '</vPIS></PISST></PIS>' +
       '<COFINS>' + COF_ALIQ + '<COFINSST><vBC>' + FORMAT_NUM(item1.Total_Preco_Compra) + '</vBC>' +
       '<pCOFINS>' + FORMAT_NUM(TRIB_ALIQ_COFINS) + '</pCOFINS>' +
       '<vCOFINS>' + FORMAT_NUM(VLR_COFINS) + '</vCOFINS></COFINSST></COFINS>' ;
       exit;
     end;

   //REGIME NORMAL - RECOLHIMENTO DE PIS E COFINS
   //CALCULA PIS/COFINS SOBRE O VALOR DO PRODUTO - DESCONTO
   VLR_PIS := ARREDONDA(TOT * TRIB_ALIQ_PIS /100, 2);
   TOT_PIS := TOT_PIS + VLR_PIS;
   VLR_COFINS := ARREDONDA(TOT * TRIB_ALIQ_COFINS /100, 2);
   TOT_COFINS := TOT_COFINS + VLR_COFINS;

   with ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[indx].Imposto do
     begin
       pis.CST    := pis01;
       pis.vBC    := tot;
       pis.pPIS   := TRIB_ALIQ_PIS;
       pis.vPIS   := VLR_PIS;
       COFINS.CST := cof01;
       COFINS.vBC := item1.Total_Preco_Compra;
       cofins.pCOFINS := TRIB_ALIQ_COFINS;
       cofins.vCOFINS := VLR_COFINS;
     end;

  { Result := '<PIS><PISAliq><CST>01</CST><vBC>' + FORMAT_NUM(TOT) + '</vBC>' +
   '<pPIS>' + FORMAT_NUM(TRIB_ALIQ_PIS) + '</pPIS>' +
   '<vPIS>' + FORMAT_NUM(VLR_PIS) +
   '</vPIS></PISAliq></PIS>' +
   '<COFINS><COFINSAliq><CST>01</CST><vBC>' + FORMAT_NUM(TOT) + '</vBC>' +
   '<pCOFINS>' + FORMAT_NUM(TRIB_ALIQ_COFINS) + '</pCOFINS>' +
   '<vCOFINS>' + FORMAT_NUM(VLR_COFINS) +
   '</vCOFINS></COFINSAliq></COFINS>';
}end;


function Format_num(valor : currency) : string;
begin
  Result := trim(FormatCurr('0.00', valor));
end;

FUNCTION NODO_ICMS(var MAT : Item_venda; CSTICM_CFOP, _ORIGE : string; indx : integer) : string;
var
  tot : currency;
  cod_OP : String;
begin
  tot    := mat.total - mat.Desconto;
  cod_OP := CDCFOP;
  Result := '';
  //se a empresa é optante do simples nacional
  if pgerais.values['10'] = '1' then
    begin
      //EXPORTAÇÃO - CSOSN = 300
      IF Contido(LeftStr(cod_OP, 1), '4-7') then
        begin
          with ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[indx].Imposto do
            begin
              ICMS.CSOSN := csosn300;
              ICMS.orig  := oeNacional;
            end;
          Result := '<ICMS><ICMSSN102><orig>' + _ORIGE + '</orig><CSOSN>300</CSOSN></ICMSSN102></ICMS>';
          exit;
        end;

      if mat.CodAliq = 10 then
        begin
          with ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[indx].Imposto do
            begin
              ICMS.CSOSN := csosn500;
              ICMS.orig  := oeNacional;
              ICMS.vBCSTRet := mat.p_compra;
              ICMS.vICMSSTRet := ARREDONDA(mat.p_compra * 0.16, 2);
            end;
        {  Result := '<ICMS><ICMSSN500><orig>' + _ORIGE + '</orig><CSOSN>500</CSOSN>' +
          '<vBCSTRet>' + FormatCurr('0.00',mat.p_compra) + '</vBCSTRet>' +
          '<vICMSSTRet>' + FormatCurr('0.00',ARREDONDA(mat.p_compra * 0.16, 2)) + '</vICMSSTRet>' +
          '</ICMSSN500></ICMS>';
        }  exit;
        end;

      if mat.CodAliq = 11 then
        begin
          with ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[indx].Imposto do
            begin
              ICMS.CSOSN := csosn102;
              ICMS.orig  := oeNacional;
            end;

          //Result := '<ICMS><ICMSSN102><orig>' + _ORIGE + '</orig><CSOSN>400</CSOSN></ICMSSN102></ICMS>';
          exit;
        end;

      if mat.CodAliq = 12 then
        begin
          with ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[indx].Imposto do
            begin
              ICMS.CSOSN := csosn102;
              ICMS.orig  := oeNacional;
            end;
          Result := '<ICMS><ICMSSN102><orig>' + _ORIGE + '</orig><CSOSN>300</CSOSN></ICMSSN102></ICMS>';
          exit;
        end;

      if mat.Reducao <> 0 then
        begin
          with ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[indx].Imposto do
            begin
              ICMS.CSOSN := csosn900;
              ICMS.orig  := oeNacional;
              ICMS.modBC := dbiValorOperacao;
              icms.vBC   := ARREDONDA(tot * mat.Reducao / 100, 2);
              icms.pICMS := mat.p_venda;
              ICMS.vICMS := 0;
              ICMS.vBCST := 0;
              icms.pICMSST := 0;
              icms.vICMSST := 0;
              icms.pCredSN := 0;
              icms.vCredICMSSN := 0;
            end;
         { Result := '<ICMSSN900><orig>' + _ORIGE + '</orig><CSOSN>900</CSOSN><modBC>3</modBC>' +
          '<vBC>' + FORMAT_NUM(ARREDONDA(tot * mat.Reducao / 100, 2)) + '</vBC>' +
          '<pRedBC>' + FORMAT_NUM(mat.Reducao) + '</pRedBC>' +
          '<pICMS>' + FORMAT_NUM(mat.p_venda) + '</pICMS>' +
          '<vICMS>' + FORMAT_NUM(0) + '</vICMS>' +
          '<modBCST>0.00</modBCST><vBCST>0.00</vBCST>' +
          '<pICMSST>0.00</pICMSST><vICMSST>0.00</vICMSST>' +
          '<pCredSN>0.00</pCredSN><vCredICMSSN>0.00</vCredICMSSN>' +
          '</ICMSSN900>' ;
          }

          exit;
        end;

      //TRIBUTACAO NORMAL PELO SIMPLES NACIONAL
      with ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[indx].Imposto do
        begin
          icms.CSOSN := csosn102;
          icms.orig  := oeNacional;
        end;

      Result := '<ICMS><ICMSSN102><orig>' + _ORIGE + '</orig><CSOSN>102</CSOSN></ICMSSN102></ICMS>';
      exit;
    end;

  //EXPORTAÇÃO - CST = 41
  IF Contido(LeftStr(cod_OP, 1), '4-7') then
    begin
      with ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[indx].Imposto do
        begin
          icms.CST   := cst41;
          icms.orig  := oeNacional;
        end;
      Result := '<ICMS><ICMS40><orig>' + _ORIGE + '</orig><CST>41</CST></ICMS40></ICMS>';
      exit;
    end;

{  //CFOP SUBSTITUICAO TRIBUTARIA
  IF CSTICM_CFOP = 'S' then
    begin
      Result := '<ICMS><ICMS60><orig>' + _ORIGE + '</orig><CST>60</CST>' +
      '<vBCSTRet>' + FORMAT_NUM(mat.Total_Preco_Compra) + '</vBCSTRet>' +
      '<vICMSSTRet>' + FORMAT_NUM(Arredonda(mat.Total_Preco_Compra * 0.16, 2)) + '</vICMSSTRet>' +
      '</ICMS60></ICMS>';
      exit;
    end;

  //CFOP ISENTO
  IF CSTICM_CFOP = 'I' then
    begin
     Result := '<ICMS><ICMS40><orig>' + _ORIGE + '</orig><CST>40</CST></ICMS40></ICMS>';
     exit;
    end;

  //CFOP NAO SE APLICA ICM
  IF CSTICM_CFOP = 'N' then
    begin
      Result := '<ICMS><ICMS40><orig>' + _ORIGE + '</orig><CST>41</CST></ICMS40></ICMS>';
      exit;
    end;

  //CFOP TRIBUTADO COM REDUCAO NA BASE DE CALCULO
  IF CSTICM_CFOP = 'R' then
    begin
      //SE EXISTE REDUCAO NA BASE DE CALCULO PELO CFOP, ENTAO REDUCAO E DE 100%
      mat.Reducao := 0;
      mat.PercICMS := 0;
      mat.VlrICMS := 0;
      BASE_ICM := TOT;
      VLR_ICM := 0;
      TOTICM := VLR_ICM;
      TOT_BASEICM := BASE_ICM;

      Result := '<ICMS><ICMS20><orig>' + _ORIGE + '</orig><CST>20</CST><modBC>3</modBC>' +
      '<pRedBC>' + FORMAT_NUM(mat.Reducao) + '</pRedBC>' +
      '<vBC>' + FORMAT_NUM(mat.DescICMS) + '</vBC>' +
      '<pICMS>' + FORMAT_NUM(mat.PercICMS) + '</pICMS>' +
      '<vICMS>' + FORMAT_NUM(mat.VlrICMS) + '</vICMS></ICMS20></ICMS>';
      exit;
    end;
 }

//TRIBUTACAO DO ICMS EM REGIME NORMAL
//PRODUTO SUBSTITUICAO TRIBUTARIA
IF mat.CodAliq = 10 then
  begin
    with ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[indx].Imposto do
      begin
        icms.CST   := cst60;
        icms.orig  := oeNacional;
        icms.vBCSTRet := mat.p_compra;
        icms.vICMSSTRet := ARREDONDA(mat.p_compra * 0.16, 2);
      end;

{    Result := '<ICMS><ICMS60><orig>' + _ORIGE + '</orig><CST>60</CST>' +
    '<vBCSTRet>' + FORMAT_NUM(mat.p_compra) + '</vBCSTRet>' +
    '<vICMSSTRet>' + FORMAT_NUM(ARREDONDA(mat.p_compra * 0.16, 2)) + '</vICMSSTRet>' +
    '</ICMS60></ICMS>';
 }   exit;
  end;

//PRODUTO ISENTO
IF mat.CodAliq = 11 then
  begin
    with ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[indx].Imposto do
      begin
        icms.CST   := cst40;
        icms.orig  := oeNacional;
      end;
   Result := '<ICMS><ICMS40><orig>' + _ORIGE + '</orig><CST>40</CST></ICMS40></ICMS>';
   exit;
  end;

//PRODUTO NAO SE APLICA ICM
IF mat.CodAliq = 12 then
  begin
    with ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[indx].Imposto do
      begin
        icms.CST   := cst41;
        icms.orig  := oeNacional;
      end;

   Result := '<ICMS><ICMS40><orig>' + _ORIGE + '</orig><CST>41</CST></ICMS40></ICMS>';
   exit;
  end;

//PRODUTO TRIBUTADO COM REDUCAO NA BASE DE CALCULO
IF mat.Reducao <> 0 then
  begin
    BASE_ICM := ARREDONDA(TOT - (TOT * mat.Reducao / 100), 2);
    VLR_ICM := ARREDONDA(BASE_ICM * mat.PercICMS / 100, 2);
    TOTICM := TOTICM + VLR_ICM;
    TOT_BASEICM := TOT_BASEICM + BASE_ICM;

    with ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[indx].Imposto do
      begin
        icms.CST    := cst20;
        icms.modBC  := dbiValorOperacao;
        icms.orig   := oeNacional;
        icms.pRedBC := mat.Reducao;
        icms.vBC    := BASE_ICM;
        icms.pICMS  := mat.PercICMS;
        icms.vICMS  := VLR_ICM;
      end;
    exit;
  end;

  //TRIBUTADO INTEGRAL
  BASE_ICM := tot;
  VLR_ICM := ARREDONDA(BASE_ICM * mat.PercICMS / 100, 2);
  TOTICM := TOTICM + VLR_ICM;
  TOT_BASEICM := TOT_BASEICM + BASE_ICM;

  with ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[indx].Imposto do
      begin
        icms.CST    := cst00;
        icms.modBC  := dbiValorOperacao;
        icms.orig   := oeNacional;
        icms.vBC    := BASE_ICM;
        icms.pICMS  := mat.PercICMS;
        icms.vICMS  := VLR_ICM;
      end;

  {Result := '<ICMS><ICMS00><orig>' + _ORIGE + '</orig><CST>00</CST><modBC>3</modBC>' +
   '<vBC>' + FORMAT_NUM(BASE_ICM) + '</vBC>' +
   '<pICMS>' + FORMAT_NUM(mat.PercICMS) + '</pICMS>' +
   '<vICMS>' + FORMAT_NUM(VLR_ICM) + '</vICMS></ICMS00></ICMS>';
}end;

function verNCM(const cod : integer) : String;
var
  ncm_prod : String;
  ex1 , descricao: String;
  tabela: Integer;
  aliqFedNac, aliqFedImp, aliqEst, aliqMun: double;
begin
  Result   := '96089989';
  ncm_prod := '';

  Query2.Close;
  Query2.SQL.Text := 'select classif from produto where cod = :cod';
  Query2.ParamByName('cod').AsInteger := cod;
  Query2.Open;

  try
  if Length(strnum(Query2.FieldByName('classif').AsString)) = 8 then
    begin
      ncm_prod := Query2.FieldByName('classif').AsString;
      if FileExists(ExtractFileDir(ParamStr(0)) + '\IBPT.csv') then
        begin
          ACBrIBPTax1.AbrirTabela(ExtractFileDir(ParamStr(0)) + '\IBPT.csv');
          if ACBrIBPTax1.Procurar(ncm_prod,ex1, descricao, tabela, aliqFedNac, aliqFedImp, aliqEst, aliqMun, true) then
            begin
              Result := ncm_prod;
            end;
        end;
    end;
  except
    Result   := '96089989';
  end;
  Query2.Close;
end;

procedure lerNodoEmitDest();
var
  erro : String;
begin
  with ACBrNFe.NotasFiscais.Items[0].NFe do
    begin
     Emit.CNPJCPF           := dadosEmitente.Values['cnpj'];
     Emit.IE := dadosEmitente.Values['ies'];
     if EMIT.IE = '' then
       begin
         Emit.IE   := 'ISENTO';
         emit.IEST := 'ISENTO';
       end;
     Emit.xNome             := dadosEmitente.Values['razao'];
     Emit.xFant             := LeftStr(dadosEmitente.Values['empresa'], 25);
     Emit.EnderEmit.fone    := dadosEmitente.Values['telres'];
     Emit.EnderEmit.CEP     := 0;
     Emit.EnderEmit.xLgr    := RetornaEndeRua(dadosEmitente.Values['ende']);
     Emit.EnderEmit.nro     := RetornaNumero(dadosEmitente.Values['ende']);
     Emit.EnderEmit.xCpl    := '';
     Emit.EnderEmit.xBairro := dadosEmitente.Values['bairro'];
     Emit.EnderEmit.cMun    := StrToIntDef((dadosEmitente.Values['cod_mun']), 1400100);
     Emit.EnderEmit.xMun    := dadosEmitente.Values['cid'];
     Emit.EnderEmit.UF      := dadosEmitente.Values['est'];
     Emit.enderEmit.cPais   := 1058;
     Emit.enderEmit.xPais   := 'BRASIL';

     if pgerais.Values['10'] = '1' then        Emit.CRT := crtSimplesNacional
       else if pgerais.Values['10'] = '2' then Emit.CRT := crtSimplesExcessoReceita
       else Emit.CRT := crtRegimeNormal;
     //(1-crtSimplesNacional, 2-crtSimplesExcessoReceita, 3-crtRegimeNormal)



     if dadosDest.Values['cod'] = '*' then exit;

     erro := validaDadosDestinatario();
     if erro <> '' then exit;
     
     if ((dadosDest.Values['tipo'] = '1') or (dadosDest.Values['tipo'] = '6')) then
       begin
         dest.indIEDest := inNaoContribuinte;
       end
     else
       begin
         dest.IE      := dadosDest.Values['ies'];
         if dest.IE = '' then dest.indIEDest := inNaoContribuinte
           else dest.indIEDest := inContribuinte;
       end;

     dest.IE        := '';
     dest.indIEDest := inNaoContribuinte;

     Dest.CNPJCPF := dadosDest.Values['cnpj'];
     Dest.xNome             := dadosDest.Values['nome'];
     Dest.EnderDest.fone    := dadosDest.Values['telres'];
     //if RetiraCaracteresEspeciais(qr.FieldByName('CEPCLIENTE').AsString) = '' then
     Dest.EnderDest.CEP     := 0; //else
   //  Dest.EnderDest.CEP     := StrToInt(RetiraCaracteresEspeciais(qr.FieldByName('CEPCLIENTE').AsString));
     Dest.EnderDest.xLgr    := RetornaEndeRua(dadosDest.Values['ende']);
     Dest.EnderDest.nro     := RetornaNumero(dadosDest.Values['ende']);
     Dest.EnderDest.xCpl    := ' ';
     Dest.EnderDest.xBairro := dadosDest.Values['bairro'];
     //
     if dadosDest.Values['cod_mun'] = '' then dadosDest.Values['cod_mun'] := dadosEmitente.Values['cod_mun'];
     Dest.EnderDest.cMun    := StrToInt(dadosDest.Values['cod_mun']);
     //
     Dest.EnderDest.xMun    := dadosDest.Values['cid'];
     Dest.EnderDest.UF      := dadosDest.Values['est'];
     Dest.EnderDest.cPais   := 1058;
     Dest.EnderDest.xPais   := 'BRASIL';
   end;
end;

Procedure LerDados_Emit_Dest(codDest : string; nnf : String = '');
 var i : integer;
begin
  Query1.Close;
  Query1.SQL.Clear;
  Query1.SQL.Add('select * from registro');
  Query1.Open;

  dadosEmitente := TStringList.Create;
  dadosDest := TStringList.Create;

  dadosEmitente.Values['cod_mun'] := Query1.fieldbyname('cod_mun').AsString;
  dadosEmitente.Values['ies']     := StrNum(Query1.fieldbyname('ies').AsString);
  dadosEmitente.Values['razao']   := Query1.fieldbyname('nome').AsString;
  dadosEmitente.Values['empresa'] := LeftStr(trim(Query1.fieldbyname('empresa').AsString), 27);
  dadosEmitente.Values['cnpj']    := StrNum(Query1.fieldbyname('cnpj').AsString);
  dadosEmitente.Values['est']     := Query1.fieldbyname('est').AsString;
  dadosEmitente.Values['ende']    := Query1.fieldbyname('ende').AsString;
  dadosEmitente.Values['bairro']  := Query1.fieldbyname('bairro').AsString;
  dadosEmitente.Values['cep']     := StrNum(Query1.fieldbyname('cep').AsString);
  dadosEmitente.Values['telres']  := StrNum(Query1.fieldbyname('telres').AsString);
  dadosEmitente.Values['cid']     := Query1.fieldbyname('cid').AsString;

  if nnf <> '' then
    begin
      codNF := StrToIntDef(nnf, 0);
      if codNF = 0 then codNF := 1;
      dadosEmitente.Values['nf']      := IntToStr(codNF) ;
    end
  else
    begin
      codNF := StrToIntDef(Incrementa_Generator1('nfce', 0), 0);
      if codNF = 0 then codNF := 1;
      dadosEmitente.Values['nf']      := IntToStr(codNF) ;
    end;

  Query1.Close;
  Query1.SQL.Clear;
  Query1.SQL.Add('select * from cliente where cod = :cod');
  Query1.ParamByName('cod').AsString := codDest;
  Query1.Open;


  dadosDest.Values['cod']    := '';
  if (not query1.IsEmpty) then
    begin
      dadosDest.Values['cod']     := codDest;
      dadosDest.Values['cod_mun'] := IfThen(trim(Query1.fieldbyname('cod_mun').AsString) = '', dadosEmitente.Values['cod_mun'], trim(Query1.fieldbyname('cod_mun').AsString));
      dadosDest.Values['tipo']    := trim(Query1.fieldbyname('tipo').AsString);
      dadosDest.Values['cnpj']    := StrNum(Query1.fieldbyname('cnpj').AsString);
      dadosDest.Values['nome']    := trim(Query1.fieldbyname('nome').AsString);
      dadosDest.Values['ende']    := trim(Query1.fieldbyname('ende').AsString);
      dadosDest.Values['est']     := trim(Query1.fieldbyname('est').AsString);
      dadosDest.Values['bairro']  := trim(Query1.fieldbyname('bairro').AsString);
      dadosDest.Values['cep']     := StrNum(Query1.fieldbyname('cep').AsString);
      dadosDest.Values['telres']  := StrNum(Query1.fieldbyname('telres').AsString);
      dadosDest.Values['cid']     := trim(Query1.fieldbyname('cid').AsString);
      dadosDest.Values['ies']     := trim(Query1.fieldbyname('ies').AsString);
    end;

  Query1.Close;
end;

Procedure LerDados_Emit_Dest1(var codDest : TStringList; nnf : String = '');
 var i : integer;
begin
  Query1.Close;
  Query1.SQL.Clear;
  Query1.SQL.Add('select * from registro');
  Query1.Open;

  dadosEmitente := TStringList.Create;
  dadosDest := TStringList.Create;

  dadosEmitente.Values['cod_mun'] := Query1.fieldbyname('cod_mun').AsString;
  dadosEmitente.Values['ies']     := StrNum(Query1.fieldbyname('ies').AsString);
  dadosEmitente.Values['razao']   := Query1.fieldbyname('nome').AsString;
  dadosEmitente.Values['empresa'] := LeftStr(trim(Query1.fieldbyname('empresa').AsString), 27);
  dadosEmitente.Values['cnpj']    := StrNum(Query1.fieldbyname('cnpj').AsString);
  dadosEmitente.Values['est']     := Query1.fieldbyname('est').AsString;
  dadosEmitente.Values['ende']    := Query1.fieldbyname('ende').AsString;
  dadosEmitente.Values['bairro']  := Query1.fieldbyname('bairro').AsString;
  dadosEmitente.Values['cep']     := StrNum(Query1.fieldbyname('cep').AsString);
  dadosEmitente.Values['telres']  := StrNum(Query1.fieldbyname('telres').AsString);
  dadosEmitente.Values['cid']     := Query1.fieldbyname('cid').AsString;

  if nnf <> '' then
    begin
      codNF := StrToIntDef(nnf, 0);
      if codNF = 0 then codNF := 1;
      dadosEmitente.Values['nf']      := IntToStr(codNF) ;
    end
  else
    begin
      codNF := StrToIntDef(Incrementa_Generator1('nfce', 0), 0);
      if codNF = 0 then codNF := 1;
      dadosEmitente.Values['nf']      := IntToStr(codNF) ;
    end;

  if (codDest.Values['cod'] = '0') then
    begin
      dadosDest.Values['cod']     := codDest.Values['cod'];
      dadosDest.Values['cod_mun'] := IfThen(trim(Query1.fieldbyname('cod_mun').AsString) = '', dadosEmitente.Values['cod_mun'], trim(Query1.fieldbyname('cod_mun').AsString));
      dadosDest.Values['tipo']    := '1';
      dadosDest.Values['cnpj']    := StrNum(codDest.Values['cnpj']);
      dadosDest.Values['nome']    := trim(codDest.Values['nome']);
      dadosDest.Values['ende']    := trim(codDest.Values['ende']);
      dadosDest.Values['est']     := trim(codDest.Values['est']);
      dadosDest.Values['bairro']  := trim(codDest.Values['bairro']);
      dadosDest.Values['cep']     := StrNum(codDest.Values['cep']);
      dadosDest.Values['telres']  := StrNum(codDest.Values['telres']);
      dadosDest.Values['cid']     := trim(codDest.Values['cid']);
      dadosDest.Values['ies']     := trim(codDest.Values['ies']);
    end
  else
    begin
      Query1.Close;
      Query1.SQL.Clear;
      Query1.SQL.Add('select * from cliente where cod = :cod');
      Query1.ParamByName('cod').AsString := strnum(codDest.Values['cod']);
      Query1.Open;

      dadosDest.Values['cod']     := strnum(codDest.Values['cod']);
      dadosDest.Values['cod_mun'] := IfThen(trim(Query1.fieldbyname('cod_mun').AsString) = '', dadosEmitente.Values['cod_mun'], trim(Query1.fieldbyname('cod_mun').AsString));
      dadosDest.Values['tipo']    := trim(Query1.fieldbyname('tipo').AsString);
      dadosDest.Values['cnpj']    := StrNum(Query1.fieldbyname('cnpj').AsString);
      dadosDest.Values['nome']    := trim(Query1.fieldbyname('nome').AsString);
      dadosDest.Values['ende']    := trim(Query1.fieldbyname('ende').AsString);
      dadosDest.Values['est']     := trim(Query1.fieldbyname('est').AsString);
      dadosDest.Values['bairro']  := trim(Query1.fieldbyname('bairro').AsString);
      dadosDest.Values['cep']     := StrNum(Query1.fieldbyname('cep').AsString);
      dadosDest.Values['telres']  := StrNum(Query1.fieldbyname('telres').AsString);
      dadosDest.Values['cid']     := trim(Query1.fieldbyname('cid').AsString);
      dadosDest.Values['ies']     := trim(Query1.fieldbyname('ies').AsString);
    end;

  Query1.Close;
end;

procedure lerNodoIde(const codNF : integer; nota : String; serie : String = '1');
begin
  with ACBrNFe.NotasFiscais.Items[0].NFe do
    begin
     Ide.cNF       := StrToIntDef(nota, 1);
     Ide.natOp     := 'VENDA COMSUMIDOR';
     Ide.indPag    := ipVista;
     Ide.modelo    := 65;
     Ide.serie     := StrToIntDef(serie, 1);
     Ide.nNF       := codNF;
     Ide.dEmi      := Now;
     Ide.dSaiEnt   := Now;
     Ide.hSaiEnt   := Now;
     Ide.tpNF      := tnSaida;
     if contOFFLINE then
       begin
         Ide.tpEmis := teOffLine;
         ide.dhCont := now;
         ide.xJust  := 'NOTA FISCAL EMITIDA EM CONTINGENCIA';
       end
     else Ide.tpEmis := teNormal;

     //if pgerais.Values['tpamb'] = '1' then
     if ACBrNFe.Configuracoes.WebServices.Ambiente = taProducao then
       begin
         Ide.tpAmb     := taProducao;
       end
     else
       begin
{        Ide.tpAmb    := taHomologacao;
         ACBrNFe.Configuracoes.Geral.IdToken := '000001';
         ACBrNFe.Configuracoes.Geral.Token   :=
         LeftStr(dadosEmitente.Values['cnpj'], 8) + IntToStr(YearOf(Now)) + '0001';}
       end;
     Ide.finNFe    := fnNormal;
     Ide.tpImp     := tiNFCe;
     Ide.indFinal  := cfConsumidorFinal;
     Ide.indPres   := pcPresencial;

     Ide.cUF       := 14;
     Ide.cMunFG    := StrToIntDef(dadosEmitente.Values['cod_mun'], 1400100);

     Transp.modFrete := mfSemFrete; // NFC-e não pode ter FRETE
   end;
end;

procedure lerItensDaVenda(var lista : TList; const nota : string);
var
   desc,temp, tot, temp1 : currency;
   i, fim, tem, txtxa : integer;
   aliq : string[3];
   CB : Boolean;
   item : Item_venda;
   totalNotaORIGI, quant, tot2, p_venda : currency;
begin
  //venda := Tvenda.Create;
  tpEmis := '1';
  totalNota := 0;
  totDesc := 0;
  totalNotaORIGI := 0;
  dHAtual    := '';
  lista := TList.Create;
  lista.Clear;

  lerVenda(nota);

  totDesc        := venda.desconto;
  totalNotaORIGI := venda.total;

  query1.Close;
  query1.SQL.Clear;
  query1.SQL.Add('select cod, quant, total, p_venda, aliquota, p_compra from item_venda where nota = :nota');
  query1.ParamByName('nota').AsString := nota;
  query1.Open;

      while not query1.Eof do
        begin
          query2.SQL.Clear;
          query2.SQL.Add('select cod, nome, codbar, unid, aliquota, is_pis, cod_ispis, p_compra from produto where cod = :cod');
          query2.ParamByName('cod').AsString := query1.fieldbyname('cod').AsString;
          query2.Open;
         if not query2.IsEmpty then
         begin

          //quant   := Arredonda(query1.fieldbyname('quant').AsCurrency, 2);
          quant   := abs(query1.fieldbyname('quant').AsCurrency);
          //p_venda := Arredonda(query1.fieldbyname('p_venda').AsCurrency, 2);
          p_venda := abs(query1.fieldbyname('p_venda').AsCurrency);
          tot2    := Arredonda(quant * p_venda, 2);

          tem := ProcuraItemNaLista(lista, query1.fieldbyname('cod').AsInteger );
          if tem <> -1 then
            begin
              tot2    := Arredonda(quant * item.p_venda, 2);
              item := lista.Items[tem];
              item.quant := item.quant + quant;
              item.total := item.total + tot2;//query1.fieldbyname('total').AsCurrency;
              totalNota  := totalNota  + tot2;
              //item.total := item.total + query1.fieldbyname('total').AsCurrency;
              //totalNota := totalNota   + query1.fieldbyname('total').AsCurrency;
            end
          else
            begin
              item := Item_venda.Create ;

              CB := false;

              try
                cb    := true;
                cb    := checaCodbar(StrNum(query2.fieldbyname('codbar').AsString));
              except
              end;

              if CB then
                begin
                  item.codbar := StrNum(query2.fieldbyname('codbar').AsString);
                end
              else
                begin
                  item.codbar := DIGEAN('789000' + CompletaOuRepete('', query2.fieldbyname('cod').AsString ,'0',6));
                end;

              item.p_compra := query2.fieldbyname('P_compra').AsCurrency;
              item.cod     := query2.fieldbyname('cod').AsInteger;
              item.nome    := trim(query2.fieldbyname('nome').AsString);
              item.unid    := IfThen(Trim(query2.fieldbyname('unid').AsString) = '', 'UN', query2.fieldbyname('unid').AsString);
              item.quant   := quant;
              item.p_venda := p_venda;
              item.total   := tot2;
              totalNota := totalNota + tot2;

              item.PercICMS           := 0;
              item.VlrICMS            := 0;
              item.DescICMS           := 0;
              item.Aliq               := query2.fieldbyname('aliquota').AsString;
              item.Reducao            := 0;
              item.CodAliq            := StrToIntdef(query1.fieldbyname('aliquota').AsString, 0);
              item.Total_Preco_Compra := Arredonda(query1.fieldbyname('p_compra').AsCurrency,2);
              item.Pis                := query2.fieldbyname('is_pis').AsString;
              item.codISPIS           := query2.fieldbyname('cod_ispis').AsString;
              item.Desconto           := 0;
              item.vlr_imposto        := 0;

              item.Ncm := verNCM(item.cod);//IfThen((ConfParamGerais.Strings[26] = 'S') AND (StrToIntDef(dm.IBselect.fieldbyname('classif').AsString, 0) <> 0), StrToIntDef(dm.IBselect.fieldbyname('classif').AsString, 0), 98);

              item.Vlr_Frete := 0;
              aliq := StrNum(query1.fieldbyname('aliquota').AsString);

              query2.Close;
              query2.SQL.Clear;
              query2.SQL.Add('select * from aliq where cod = :cod');
              query2.ParamByName('cod').Asinteger := strtointdef(aliq, 2);
              query2.Open;

              temp1 := 0;
              temp := 0;
              if query2.IsEmpty then
                begin
                  query2.Close;
                end
              else
                begin
                  temp1 := query2.fieldbyname('aliq').AsCurrency;
                  temp  := query2.fieldbyname('reducao').AsCurrency;
                end;

              item.PercICMS := temp1;
              item.DescICMS := temp;
              lista.Add(item);
          end;
          query1.Next;
       end;

       end;//fim isempity

   query2.Close;
   query1.Close;
   fim := lista.Count -1;
   totalNota  := 0;

   for i := 0 to fim do
     begin
       item := lista.Items[i];
       item.total := Arredonda(item.p_venda * item.quant, 2);
       totalNota  := totalNota  + item.total;
     end;

   //rateio desconto
   if totDesc > 0 then
     begin
       desc := totDesc;
       fim := lista.Count - 1;
       for i := 0 to fim do
         begin
           item := lista.Items[i];
           if i = fim then
             begin
               item.Desconto := Arredonda(desc, 2);
             end
           else
             begin
               temp := Arredonda((item.total /totalNota) * totDesc, 2);
               item.Desconto := temp;
               desc := desc - temp;
             end;
         end;
     end;

  //calcula o icms
  fim := lista.Count - 1;
  for i := 0 to lista.Count - 1 do
    begin
      item := lista.Items[i];
      tot := item.total - item.Desconto;
      if item.Reducao <> 0 then
        begin
          BASE_ICM := TOT - ARREDONDA(TOT * (item.Reducao / 100), 2);
          VLR_ICM := ARREDONDA(BASE_ICM * (item.PercICMS / 100), 2);
        end
      else
        begin
          BASE_ICM := TOT;
          VLR_ICM := ARREDONDA(TOT * item.PercICMS / 100, 2);
        end;

      if item.CodAliq > 9 then
        begin
          BASE_ICM := 0;
          VLR_ICM := 0;
        end;
     // item.PercICMS := BASE_ICM;
      item.VlrICMS := VLR_ICM;
    end;
    
  venda.total := totalNota - venda.desconto;
end;

procedure LoadXML(MyMemo: TMemo; MyWebBrowser: TWebBrowser);
begin
 MyMemo.Lines.SaveToFile(ExtractFileDir(application.ExeName)+'temp.xml');
 MyWebBrowser.Navigate(ExtractFileDir(application.ExeName)+'temp.xml');
end;

procedure Verifica_Status_NFe;
var
 MemoResp: TMemo;
 MemWeb  : TWebBrowser;
begin
 try
  MemoResp := TMemo.Create(nil);
  MemWeb   := TWebBrowser.Create(nil);
    ACBrNFe.Configuracoes.WebServices.Visualizar := true;
    ACBrNFe.WebServices.StatusServico.Executar;
    ACBrNFe.Configuracoes.WebServices.Visualizar := False;
 finally
  FreeAndNil(MemoResp);
 end;
end;


procedure GravarConfiguracao(certificadoCaminho, certificadoSenha, certificadoNumeroSerie:String;  FinalidadeNFE,  DANFETipo, DANFEFormaEmissao:integer; DANFELogomarca:String;
                             ArqLog:Boolean; CaminhoLog, WebUF:String;  WebAmbiente:integer; WebVisualiza:Boolean; ProxHost, ProxPorta, ProxUser, ProxSenha, EmailHost, EmailPorta, EmailUsuario, EmailSenha,
                             EmailAssunto:String; EmailSSL:Boolean; ArquivosPDF:String; ArquivosNFE:String; CDCFOP:String; idToken, Token:String; idxImpre, idxImpreNFe, tipoImpre : integer; preview : boolean;
                             const portaBalanca, veloBal, tipoBal : string; serie : String = '1'; qtdViasStr : String = '1'; tipoImp : String = '0'; PortaImpNFCE : String = '');
var
 qtd   : integer;
 IniFile    : String ;
 Ini        : TIniFile ;
 mmEmailMsg : TMemo;
 StreamMemo : TMemoryStream;
begin
 try
  //IniFile    := ChangeFileExt(Application.ExeName, '.ini') ;
  if FileExists(ExtractFileDir(ParamStr(0)) + '\ControlW.ini') then
   begin
     IniFile    := ExtractFileDir(ParamStr(0)) + '\ControlW.ini';
     //exit;
   end
 else
   begin
     IniFile    := ChangeFileExt( Application.ExeName, '.ini') ;
   end;

  Ini        := TIniFile.Create( IniFile );

  mmEmailMsg := TMemo.Create(nil);

  Ini.WriteString('BALANCA', 'PORTA'  ,portaBalanca) ;
  Ini.WriteString('BALANCA', 'VELO'   ,veloBal) ;
  Ini.WriteString('BALANCA', 'BALANCA',tipoBal) ;

  Ini.WriteString('Certificado','Caminho' ,certificadoCaminho) ;
  Ini.WriteString('Certificado','Senha'   ,certificadoSenha) ;
  Ini.WriteString('Certificado','NumSerie',certificadoNumeroSerie) ;
  //
  qtd := StrToIntDef(StrNum(qtdViasStr), 1);
  if qtd < 1 then qtd := 1;
  Ini.WriteInteger('Geral','ViasNFe'   , qtd) ;
  Ini.WriteInteger('Geral','Finalidade'   ,FinalidadeNFE) ;

  Ini.WriteInteger('Geral','DANFE'        ,DANFETipo) ;
  Ini.WriteInteger('Geral','FormaEmissao' ,DANFEFormaEmissao) ;
  Ini.WriteString('Geral','LogoMarca'     ,DANFELogomarca) ;
  Ini.WriteString('Geral','PortaImpNFCE'     ,PortaImpNFCE) ;
  Ini.WriteBool('Geral', 'Salvar'          ,ArqLog) ;
  Ini.WriteInteger('Geral','impIndex' ,StrToIntDef(tipoImp, 0)) ;

  Ini.WriteInteger('Geral','TipoImpressao'     ,tipoImpre) ;
  Ini.WriteInteger('Geral','idxImpressora'     , idxImpre) ;
  Ini.WriteInteger('Geral','idxImpressoraNFe'     , idxImpreNFe) ;
  Ini.WriteBool(   'Geral', 'preview'          ,preview) ;
  Ini.WriteInteger(   'Geral', 'serie'          , StrToIntDef(serie , 1)) ;

  Ini.WriteString('Geral','PathSalvar'    ,CaminhoLog) ;
  Ini.WriteString('Geral','CFOP'          ,CDCFOP) ;

  Ini.WriteString('Geral','ArquivosPDF'    ,ArquivosPDF) ;
  Ini.WriteString('Geral','ArquivosNFE'    ,ArquivosNFE) ;

  Ini.WriteString('Geral','IDToken'  ,idToken) ;
  Ini.WriteString('Geral','Token'    ,Token) ;


  Ini.WriteString('Certificado','ArquivosPDF',ArquivosPDF) ;
  Ini.WriteString('Certificado','ArquivosNFe',ArquivosNFE) ;
  //
  Ini.WriteString('WebService','UF'        ,WebUF) ;
  Ini.WriteInteger('WebService','Ambiente' ,WebAmbiente) ;
  Ini.WriteBool('WebService','Visualizar'  ,WebVisualiza) ;
  //
  Ini.WriteString( 'Proxy','Host'   ,ProxHost) ;
  Ini.WriteString( 'Proxy','Porta'  ,ProxPorta) ;
  Ini.WriteString( 'Proxy','User'   ,ProxUser) ;
  Ini.WriteString( 'Proxy','Pass'   ,ProxSenha) ;
  //
  Ini.WriteString( 'Email','Host'    ,EmailHost) ;
  Ini.WriteString( 'Email','Port'    ,EmailPorta) ;
  Ini.WriteString( 'Email','User'    ,EmailUsuario) ;
  Ini.WriteString( 'Email','Pass'    ,EmailSenha) ;
  Ini.WriteString( 'Email','Assunto' ,EmailAssunto) ;
  Ini.WriteBool(   'Email','SSL'     ,EmailSSL) ;

  StreamMemo := TMemoryStream.Create;
  mmEmailMsg.Lines.SaveToStream(StreamMemo);
  StreamMemo.Seek(0,soFromBeginning);
  Ini.WriteBinaryStream( 'Email','Mensagem',StreamMemo) ;
  StreamMemo.Free;
  finally
   Ini.Free;
   FreeAndNil(mmEmailMsg);
  end;
end;

function LerConfiguracaoCFOP():String;
var
 Ini     : TIniFile;
 IniFile : String;
begin
 Result := '';
 try
  IniFile    := ChangeFileExt( Application.ExeName, '.ini') ;
  Ini        := TIniFile.Create(IniFile);
  Result     := Ini.ReadString( 'Geral','CFOP' ,'') ;
 finally
  Ini.Free;
 end;
end;

procedure LerConfiguracaoNFCe();
var
 certificadoCaminho     : String;
 certificadoSenha       : String;
 certificadoNumeroSerie : String;
 Finalidade             : integer;
 DANFETipo              : integer;
 DANFEFormaEmissao      : integer;
 DANFELogomarca         : String;
 ArqLog                 : Boolean;
 CaminhoLog             : String;
 WebUF                  : String;
 WebAmbiente            : integer;
 WebVisualiza           : Boolean;
 ProxHost               : String;
 ProxPorta              : String;
 ProxUser               : String;
 ProxSenha              : String;
 EmailHost              : String;
 EmailPorta             : String;
 EmailUsuario           : String;
 EmailSenha             : String;
 EmailAssunto           : String;
 EmailSSL               : Boolean;
 IniFile                : String;
 Ini                    : TIniFile;
 Ok , preview           : Boolean;
 StreamMemo             : TMemoryStream;
 mmEmailMsg             : TMemo;
 TipoAmbiente,
 FinalidadeNFe,
 UFComerciante,
 ///CDCFOP,
 TipoEmissao,
 ArquivoPDF,
 ArquivoNFE,
 SenhaCertificado       : string;
begin
 if FileExists(ExtractFileDir(ParamStr(0)) + '\ControlW.ini') then
   begin
     IniFile    := ExtractFileDir(ParamStr(0)) + '\ControlW.ini';
     //exit;
   end
 else
   begin
     IniFile    := ChangeFileExt( Application.ExeName, '.ini') ;
   end;
 //IniFile    := ChangeFileExt( Application.ExeName, '.ini') ;
 Ini        := TIniFile.Create(IniFile);
 mmEmailMsg := TMemo.Create(nil);
 try
   if DANFE <> nil then ACBrNFe.DANFE := DANFE;

  {$IFDEF ACBrNFeOpenSSL}
   certificadoCaminho                                      := Ini.ReadString( 'Certificado','Caminho' ,'') ;
   certificadoSenha                                        := Ini.ReadString( 'Certificado','Senha'   ,'') ;
   ACBrNFe.Configuracoes.Certificados.Certificado  := certificadoCaminho;
   ACBrNFe.Configuracoes.Certificados.Senha        := certificadoSenha;
   //
   certificadoNumeroSerie                                  := Ini.ReadString( 'Certificado','NumSerie','') ;
   ACBrNFe.Configuracoes.Certificados.NumeroSerie  := certificadoNumeroSerie;
   certificadoNumeroSerie                                  := ACBrNFe.Configuracoes.Certificados.NumeroSerie;

  {$ELSE}
   SenhaCertificado                                        := Ini.ReadString( 'Certificado','Senha'  ,'') ;
   certificadoNumeroSerie                                  := Ini.ReadString( 'Certificado','NumSerie','') ;
   ACBrNFe.SSL.NumeroSerie  := certificadoNumeroSerie;
   ACBrNFe.SSL.Senha        := SenhaCertificado;
   //certificadoNumeroSerie                                  := ACBrNFe.Configuracoes.Certificados.NumeroSerie;
  {$ENDIF}

   ACBrNFe.Configuracoes.Geral.CSC            := Ini.ReadString('Geral','Token', '');
   ACBrNFe.Configuracoes.Geral.IdCSC          := Ini.ReadString('Geral','IDToken', '');

   DANFEFormaEmissao                                    := Ini.ReadInteger( 'Geral','FormaEmissao',0) ;
   TipoEmissao                                          := IntToStr(DANFEFormaEmissao);
   ArqLog                                               := Ini.ReadBool(   'Geral','Salvar'      ,True) ;

   tipoImp                                              := Ini.ReadInteger( 'Geral','impIndex',0) ;
   ArquivoPDF                                           := Ini.ReadString( 'Geral','ArquivosPDF'  ,'') ;
   ArquivoNFE                                           := Ini.ReadString( 'Geral','ArquivosNFE'  ,'') ;
   CDCFOP                                               := Ini.ReadString( 'Geral','CFOP' ,'') ;
   portaCOMNFCE                                         := Ini.ReadString( 'Geral','PortaImpNFCE' ,'') ;
   qtdVias := 1;
   qtdVias                                              := Ini.ReadInteger( 'Geral','ViasNFe' , 1) ;
   if qtdVias < 1 then qtdVias := 1;
   if CDCFOP = '' then CDCFOP := '5102';


   CaminhoLog                                           := Ini.ReadString( 'Geral','PathSalvar'  ,'') ;

   //pastaControlW := buscaPastaConfigControlRede();
   pastaControlW  := Ini.ReadString('Geral','ArquivosNFE', '');
   if trim(pastaControlW) = '' then pastaControlW := ExtractFileDir(ParamStr(0)) + '\';

   criaPasta(pastaControlW + 'NFCe\');
   criaPasta(pastaControlW + 'NFCe\EMIT\');
   criaPasta(pastaControlW + 'NFCe\CANC\');
   criaPasta(pastaControlW + 'NFCe\RESP\');
   criaPasta(pastaControlW + 'NFCe\PDF\');
   if DANFE <> nil then DANFE.PathPDF := pastaControlW + 'NFCe\PDF\';

   {Balanca}

   ACBrNFe.Configuracoes.Geral.FormaEmissao          := StrToTpEmis(OK,IntToStr(DANFEFormaEmissao+1));
   ACBrNFe.Configuracoes.Geral.Salvar                := false;
   //ACBrNFe.Configuracoes.Geral.AtualizarXMLCancelado := true;
   ACBrNFe.Configuracoes.WebServices.Salvar          := false;
   ACBrNFe.Configuracoes.Arquivos.Salvar             := true;
   ACBrNFe.Configuracoes.Arquivos.EmissaoPathNFe     := true;
   ACBrNFe.Configuracoes.Arquivos.SalvarApenasNFeProcessadas  := true;

   ACBrNFe.Configuracoes.Arquivos.PathSalvar       := pastaControlW + 'NFCe\EMIT\';
   ACBrNFe.Configuracoes.Arquivos.PathNFe       := pastaControlW + 'NFCe\EMIT\';

   ACBrNFe.Configuracoes.Arquivos.PathSchemas := ExtractFileDir(ParamStr(0)) + '\Schemas';

   WebUF                                                := Ini.ReadString( 'WebService','UF','RR') ;
   WebAmbiente                                          := Ini.ReadInteger( 'WebService','Ambiente'  ,1) ;

   UFComerciante                                        := WebUF;
   FinalidadeNFe                                        := '0';
   TipoAmbiente                                         := IntToStr(WebAmbiente);
   WebVisualiza                                         :=Ini.ReadBool(    'WebService','Visualizar',False) ;
   ACBrNFe.Configuracoes.WebServices.UF         := WebUF;
   ACBrNFe.Configuracoes.WebServices.Ambiente   := StrToTpAmb(Ok,IntToStr(WebAmbiente));

   if WebAmbiente = 1 then
     begin
       ACBrNFe.Configuracoes.WebServices.Ambiente := taProducao;
     end
    else
      begin
        ACBrNFe.Configuracoes.WebServices.Ambiente := taHomologacao;
      end;

   ACBrNFe.Configuracoes.WebServices.Visualizar := WebVisualiza;
   gTipoEmissao    := TipoEmissao;
   gTipoAmbiente   := TipoAmbiente;
   gUFComerciante  := UFComerciante;
   gFinalidadeNFe  := FinalidadeNFe;

   //
   ProxHost  := Ini.ReadString( 'Proxy','Host'   ,'') ;
   ProxPorta := Ini.ReadString( 'Proxy','Porta'  ,'') ;
   ProxUser  := Ini.ReadString( 'Proxy','User'   ,'') ;
   ProxSenha := Ini.ReadString( 'Proxy','Pass'   ,'') ;
   //
   gProxHost  := Ini.ReadString( 'Proxy','Host'   ,'') ;
   gProxPorta := Ini.ReadString( 'Proxy','Porta'  ,'') ;
   gProxUser  := Ini.ReadString( 'Proxy','User'   ,'') ;
   gProxSenha := Ini.ReadString( 'Proxy','Pass'   ,'') ;

   indxImpressora := Ini.ReadInteger( 'Geral','idxImpressora'   , 0) ;
   indxImpressoraNFE := Ini.ReadInteger( 'Geral','idxImpressoraNFe'   , 0) ;
   tipoIMPRESSAO  := Ini.ReadInteger( 'Geral','tipoImpre'   , 0) ;
   serie2         := StrToIntDef(trim(Ini.ReadString('Geral','serie', '')), 1); ;

   preview        := ini.ReadBool('Geral', 'preview', false);

   //setPrinter(indxImpressora);
   //seta a impressora padrao de nfe
   //
   ACBrNFe.Configuracoes.WebServices.ProxyHost := ProxHost;
   ACBrNFe.Configuracoes.WebServices.ProxyPort := ProxPorta;
   ACBrNFe.Configuracoes.WebServices.ProxyUser := ProxUser;
   ACBrNFe.Configuracoes.WebServices.ProxyPass := ProxSenha;
   //
{   ACBrNFe.Configuracoes.Arquivos.PathNFe  := ExtractFilePath(Application.ExeName);
   ACBrNFe.Configuracoes.Arquivos.PathCan  := ExtractFilePath(Application.ExeName);
   ACBrNFe.Configuracoes.Arquivos.PathInu  := ExtractFilePath(Application.ExeName);
   ACBrNFe.Configuracoes.Arquivos.PathDPEC := ExtractFilePath(Application.ExeName);
   ACBrNFe.Configuracoes.Geral.PathSalvar  := ExtractFilePath(Application.ExeName);
}
   //
   DANFETipo      := Ini.ReadInteger( 'Geral','DANFE'       ,0) ;
   DANFELogomarca := Ini.ReadString( 'Geral','LogoMarca'   ,'') ;
   //
   if ACBrNFe.DANFE <> nil then
    begin
     ACBrNFe.DANFE.TipoDANFE  := StrToTpImp(OK,IntToStr(DANFETipo+1));
     ACBrNFe.DANFE.Logo       := DANFELogomarca;
    end;
    //
    EmailHost    := Ini.ReadString( 'Email','Host'   ,'') ;
    EmailPorta   := Ini.ReadString('Email','Port'    ,'') ;
    EmailUsuario := Ini.ReadString('Email','User'    ,'') ;
    EmailSenha   := Ini.ReadString('Email','Pass'    ,'') ;
    EmailAssunto := Ini.ReadString('Email','Assunto' ,'') ;
    EmailSSL     := Ini.ReadBool  ('Email','SSL'     ,False) ;
    StreamMemo   := TMemoryStream.Create;
    Ini.ReadBinaryStream( 'Email','Mensagem',StreamMemo) ;
    mmEmailMsg.Lines.LoadFromStream(StreamMemo);
    StreamMemo.Free;

    //ACBrNFe.Configuracoes.Geral.AtualizarXMLCancelado := true;
    if DANFE <> nil then ACBrNFe.DANFE.MostrarPreview := not preview;
    ACBrNFe.Configuracoes.Geral.ModeloDF := moNFCe;
    ACBrNFe.Configuracoes.Geral.VersaoDF := ve310;
  finally
   Ini.Free;
   mmEmailMsg.Free;
  end;
end;

procedure LerConfiguracaoNFe();
var
 certificadoCaminho     : String;
 certificadoSenha       : String;
 certificadoNumeroSerie : String;
 Finalidade             : integer;
 DANFETipo              : integer;
 DANFEFormaEmissao      : integer;
 DANFELogomarca         : String;
 ArqLog                 : Boolean;
 CaminhoLog             : String;
 WebUF                  : String;
 WebAmbiente            : integer;
 WebVisualiza           : Boolean;
 ProxHost               : String;
 ProxPorta              : String;
 ProxUser               : String;
 ProxSenha              : String;
 EmailHost              : String;
 EmailPorta             : String;
 EmailUsuario           : String;
 EmailSenha             : String;
 EmailAssunto           : String;
 EmailSSL               : Boolean;
 IniFile                : String;
 Ini                    : TIniFile;
 Ok , preview           : Boolean;
 StreamMemo             : TMemoryStream;
 mmEmailMsg             : TMemo;
 TipoAmbiente,
 FinalidadeNFe,
 UFComerciante,
 CDCFOP,
 TipoEmissao,
 ArquivoPDF,
 ArquivoNFE,
 SenhaCertificado       : string;
begin
 ACBrNFe.DANFE := DANFE;
 DANFE.NFeCancelada := false;

 if FileExists(ExtractFileDir(ParamStr(0)) + '\ControlW.ini') then
   begin
     IniFile    := ExtractFileDir(ParamStr(0)) + '\ControlW.ini';
     //exit;
   end
 else
   begin
     IniFile    := ChangeFileExt( Application.ExeName, '.ini') ;
   end;
 //IniFile    := ChangeFileExt( Application.ExeName, '.ini') ;
 //IniFile    := ChangeFileExt( Application.ExeName, '.ini') ;
 Ini        := TIniFile.Create(IniFile);
 mmEmailMsg := TMemo.Create(nil);
 try
  {$IFDEF ACBrNFeOpenSSL}
   certificadoCaminho                                      := Ini.ReadString( 'Certificado','Caminho' ,'') ;
   certificadoSenha                                        := Ini.ReadString( 'Certificado','Senha'   ,'') ;
   ACBrNFe.Configuracoes.Certificados.Certificado  := certificadoCaminho;
   ACBrNFe.Configuracoes.Certificados.Senha        := certificadoSenha;
   //
   certificadoNumeroSerie                                  := Ini.ReadString( 'Certificado','NumSerie','') ;
   ACBrNFe.Configuracoes.Certificados.NumeroSerie  := certificadoNumeroSerie;
   certificadoNumeroSerie                                  := ACBrNFe.Configuracoes.Certificados.NumeroSerie;

  {$ELSE}
   SenhaCertificado                                        := Ini.ReadString( 'Certificado','Senha'  ,'') ;
   certificadoNumeroSerie                                  := Ini.ReadString( 'Certificado','NumSerie','') ;
   ACBrNFe.Configuracoes.Certificados.NumeroSerie  := certificadoNumeroSerie;
   ACBrNFe.Configuracoes.Certificados.Senha        := SenhaCertificado;
   certificadoNumeroSerie                                  := ACBrNFe.Configuracoes.Certificados.NumeroSerie;
  {$ENDIF}

   DANFEFormaEmissao                                    := Ini.ReadInteger( 'Geral','FormaEmissao',0) ;
   TipoEmissao                                          := IntToStr(DANFEFormaEmissao);
   ArqLog                                               := Ini.ReadBool(   'Geral','Salvar'      ,True) ;


   ArquivoPDF                                           := Ini.ReadString( 'Geral','ArquivosPDF'  ,'') ;
   ArquivoNFE                                           := Ini.ReadString( 'Geral','ArquivosNFE'  ,'') ;
   CDCFOP                                               := Ini.ReadString( 'Geral','CFOP' ,'') ;


   CaminhoLog                                           := Ini.ReadString( 'Geral','PathSalvar'  ,'') ;

   pastaControlW := buscaPastaConfigControlRede();
   if pastaControlW = '' then pastaControlW := ExtractFileDir(ParamStr(0)) + '\';

   criaPasta(pastaControlW + 'NFe\');
   criaPasta(pastaControlW + 'NFe\EMIT\');
   criaPasta(pastaControlW + 'NFe\CANC\');
   criaPasta(pastaControlW + 'NFe\RESP\');
   criaPasta(pastaControlW + 'NFe\PDF\');
   DANFE.PathPDF                                        := pastaControlW + 'NFe\PDF\';
   //DANFE_Rave.PathPDF                                   := pastaControlW + 'NFe\PDF\';

   ACBrNFe.Configuracoes.Geral.FormaEmissao     := StrToTpEmis(OK,IntToStr(DANFEFormaEmissao+1));
   ACBrNFe.Configuracoes.Arquivos.PathSalvar       := pastaControlW + 'NFe\RESP\';
   ACBrNFe.Configuracoes.Arquivos.PathNFe       := pastaControlW + 'NFe\EMIT\';
   //ACBrNFe.Configuracoes.Arquivos.PathCan       := pastaControlW + 'NFe\CANC\';

   ACBrNFe.Configuracoes.Geral.Salvar                := false;
   //ACBrNFe.Configuracoes.Geral.AtualizarXMLCancelado := true;
   ACBrNFe.Configuracoes.WebServices.Salvar          := false;
   ACBrNFe.Configuracoes.Arquivos.Salvar             := true;
   ACBrNFe.Configuracoes.Arquivos.EmissaoPathNFe     := true;
   ACBrNFe.Configuracoes.Arquivos.SalvarApenasNFeProcessadas  := true;
   ACBrNFe.Configuracoes.Arquivos.PathSchemas := pastaControlW + 'Schemas';
   //
   WebUF                                                := Ini.ReadString( 'WebService','UF','RR') ;
   WebAmbiente                                          := Ini.ReadInteger( 'WebService','Ambiente'  ,1) ;

   UFComerciante                                        := WebUF;
   FinalidadeNFe                                        := '0';
   TipoAmbiente                                         := IntToStr(WebAmbiente);
   WebVisualiza                                         :=Ini.ReadBool(    'WebService','Visualizar',False) ;
   ACBrNFe.Configuracoes.WebServices.UF         := WebUF;
   ACBrNFe.Configuracoes.WebServices.Ambiente   := StrToTpAmb(Ok,IntToStr(WebAmbiente));
   ACBrNFe.Configuracoes.WebServices.Visualizar := WebVisualiza;
   gTipoEmissao    := TipoEmissao;
   gTipoAmbiente   := TipoAmbiente;
   gUFComerciante  := UFComerciante;
   gFinalidadeNFe  := FinalidadeNFe;

   //
   ProxHost  := Ini.ReadString( 'Proxy','Host'   ,'') ;
   ProxPorta := Ini.ReadString( 'Proxy','Porta'  ,'') ;
   ProxUser  := Ini.ReadString( 'Proxy','User'   ,'') ;
   ProxSenha := Ini.ReadString( 'Proxy','Pass'   ,'') ;
   //
   gProxHost  := Ini.ReadString( 'Proxy','Host'   ,'') ;
   gProxPorta := Ini.ReadString( 'Proxy','Porta'  ,'') ;
   gProxUser  := Ini.ReadString( 'Proxy','User'   ,'') ;
   gProxSenha := Ini.ReadString( 'Proxy','Pass'   ,'') ;

   indxImpressora := Ini.ReadInteger( 'Geral','idxImpressora'   , 0) ;
   indxImpressoraNFE := Ini.ReadInteger( 'Geral','idxImpressoraNFe'   , 0) ;
   tipoIMPRESSAO  := Ini.ReadInteger( 'Geral','tipoImpre'   , 0) ;
   preview        := ini.ReadBool('Geral', 'preview', false);

   //setPrinter(indxImpressora);
   //seta a impressora padrao de nfe
   //
   ACBrNFe.Configuracoes.WebServices.ProxyHost := ProxHost;
   ACBrNFe.Configuracoes.WebServices.ProxyPort := ProxPorta;
   ACBrNFe.Configuracoes.WebServices.ProxyUser := ProxUser;
   ACBrNFe.Configuracoes.WebServices.ProxyPass := ProxSenha;
   //
{   ACBrNFe.Configuracoes.Arquivos.PathNFe  := ExtractFilePath(Application.ExeName);
   ACBrNFe.Configuracoes.Arquivos.PathCan  := ExtractFilePath(Application.ExeName);
   ACBrNFe.Configuracoes.Arquivos.PathInu  := ExtractFilePath(Application.ExeName);
   ACBrNFe.Configuracoes.Arquivos.PathDPEC := ExtractFilePath(Application.ExeName);
   ACBrNFe.Configuracoes.Geral.PathSalvar  := ExtractFilePath(Application.ExeName);
}
   //
   DANFETipo      := Ini.ReadInteger( 'Geral','DANFE'       ,0) ;
   DANFELogomarca := Ini.ReadString( 'Geral','LogoMarca'   ,'') ;
   //
   if ACBrNFe.DANFE <> nil then
    begin
     ACBrNFe.DANFE.TipoDANFE  := tiRetrato;
     ACBrNFe.DANFE.Logo       := DANFELogomarca;
    end;
    //
    EmailHost    := Ini.ReadString( 'Email','Host'   ,'') ;
    EmailPorta   := Ini.ReadString('Email','Port'    ,'') ;
    EmailUsuario := Ini.ReadString('Email','User'    ,'') ;
    EmailSenha   := Ini.ReadString('Email','Pass'    ,'') ;
    EmailAssunto := Ini.ReadString('Email','Assunto' ,'') ;
    EmailSSL     := Ini.ReadBool  ('Email','SSL'     ,False) ;
    StreamMemo   := TMemoryStream.Create;
    Ini.ReadBinaryStream( 'Email','Mensagem',StreamMemo) ;
    mmEmailMsg.Lines.LoadFromStream(StreamMemo);
    StreamMemo.Free;

   // ACBrNFe.Configuracoes.Geral.AtualizarXMLCancelado := true;
    ACBrNFe.Configuracoes.Geral.VersaoDF := ve310;
    ACBrNFe.DANFE := DANFE;
    ACBrNFe.DANFE.MostrarPreview := preview;
    ACBrNFe.Configuracoes.Geral.ModeloDF := moNFe;
  finally
   Ini.Free;
   FreeAndNil(mmEmailMsg);
  end;
end;

procedure CarregarConfiguracao();
var
 IniFile               : String;
 Ini                   : TIniFile;
 Ok                    : Boolean;
 StreamMemo            : TMemoryStream;
 mmEmailMsg            : TMemo;
 //
 certificadoCaminho,
 certificadoSenha,
 certificadoNumeroSerie : String;
 Finalidade: integer;
 DANFETipo: integer;
 DANFEFormaEmissao: integer;
 DANFELogomarca: String;
 ArqLog: Boolean;
 CaminhoLog: String;
 WebUF: String;
 WebAmbiente: integer;
 WebVisualiza: Boolean;
 ProxHost: String;
 ProxPorta: String;
 ProxUser: String;
 ProxSenha: String;
 EmailHost: String;
 EmailPorta: String;
 EmailUsuario: String;
 EmailSenha: String;
 EmailAssunto: String;
 EmailSSL:Boolean;
begin
 IniFile    := ChangeFileExt( Application.ExeName, '.ini') ;
 Ini        := TIniFile.Create(IniFile);
 mmEmailMsg := TMemo.Create(nil);
 try
  {$IFDEF ACBrNFeOpenSSL}
   certificadoCaminho                                      := Ini.ReadString( 'Certificado','Caminho' ,'') ;
   certificadoSenha                                        := Ini.ReadString( 'Certificado','Senha'   ,'') ;
   ACBrNFe.Configuracoes.Certificados.Certificado  := certificadoCaminho;
   ACBrNFe.Configuracoes.Certificados.Senha        := certificadoSenha;
  {$ELSE}
   certificadoNumeroSerie                                  := Ini.ReadString( 'Certificado','NumSerie','') ;
   ACBrNFe.Configuracoes.Certificados.NumeroSerie  := certificadoNumeroSerie;
   certificadoNumeroSerie                                  := ACBrNFe.Configuracoes.Certificados.NumeroSerie;
  {$ENDIF}
   ACBrNFe.Configuracoes.Geral.CSC            := Ini.ReadString('Geral','Token', '');
   ACBrNFe.Configuracoes.Geral.IdCSC          := Ini.ReadString('Geral','IDToken', '');

   //ShowMessage(ACBrNFe.Configuracoes.Geral.Token + #13 + ACBrNFe.Configuracoes.Geral.IdToken);


   DANFEFormaEmissao                                    := Ini.ReadInteger( 'Geral','FormaEmissao',0) ;
   ArqLog                                               := Ini.ReadBool(   'Geral','Salvar'      ,True) ;
   CaminhoLog                                           := Ini.ReadString( 'Geral','PathSalvar'  ,'') ;
   ACBrNFe.Configuracoes.Geral.FormaEmissao     := StrToTpEmis(OK,IntToStr(DANFEFormaEmissao+1));
   ACBrNFe.Configuracoes.Geral.Salvar           := ArqLog;
   ACBrNFe.Configuracoes.Arquivos.PathSalvar       := CaminhoLog;
   //
   WebUF                                                := Ini.ReadString( 'WebService','UF','MG') ;
   WebAmbiente                                          := Ini.ReadInteger( 'WebService','Ambiente'  ,0) ;

   pgerais.Values['tpamb'] := IntToStr(WebAmbiente);

   WebVisualiza                                         :=Ini.ReadBool(    'WebService','Visualizar',False) ;
   ACBrNFe.Configuracoes.WebServices.UF         := WebUF;
   ACBrNFe.Configuracoes.WebServices.Ambiente   := StrToTpAmb(Ok,IntToStr(WebAmbiente));
   ACBrNFe.Configuracoes.WebServices.Visualizar := WebVisualiza;

   //
   ProxHost  := Ini.ReadString( 'Proxy','Host'   ,'') ;
   ProxPorta := Ini.ReadString( 'Proxy','Porta'  ,'') ;
   ProxUser  := Ini.ReadString( 'Proxy','User'   ,'') ;
   ProxSenha := Ini.ReadString( 'Proxy','Pass'   ,'') ;
   //
   ACBrNFe.Configuracoes.WebServices.ProxyHost := ProxHost;
   ACBrNFe.Configuracoes.WebServices.ProxyPort := ProxPorta;
   ACBrNFe.Configuracoes.WebServices.ProxyUser := ProxUser;
   ACBrNFe.Configuracoes.WebServices.ProxyPass := ProxSenha;
   //
   DANFETipo      := Ini.ReadInteger( 'Geral','DANFE'       ,0) ;
   DANFELogomarca := Ini.ReadString( 'Geral','LogoMarca'   ,'') ;
   if ACBrNFe.DANFE <> nil then
    begin
     ACBrNFe.DANFE.TipoDANFE  := StrToTpImp(OK,IntToStr(DANFETipo+1));
     ACBrNFe.DANFE.Logo       := DANFELogomarca;
    end;
    //
    EmailHost    := Ini.ReadString( 'Email','Host'   ,'') ;
    EmailPorta   := Ini.ReadString( 'Email','Port'   ,'') ;
    EmailUsuario := Ini.ReadString( 'Email','User'   ,'') ;
    EmailSenha   := Ini.ReadString( 'Email','Pass'   ,'') ;
    EmailAssunto := Ini.ReadString( 'Email','Assunto','') ;
    EmailSSL     := Ini.ReadBool(   'Email','SSL'    ,False) ;
    StreamMemo   := TMemoryStream.Create;
    Ini.ReadBinaryStream( 'Email','Mensagem',StreamMemo) ;
    mmEmailMsg.Lines.LoadFromStream(StreamMemo);
    StreamMemo.Free;
  finally
   Ini.Free;
   FreeAndNil(mmEmailMsg);
  end;
end;

function EnviarCupomEletronico(nota : String;var Status:String; vAux, vNumLote : String;var MemoResp:TMemo; WBResposta:TWebBrowser;
                               TipoEmissao,TipoAmbiente,UFComerciante, FinalidadeNFe:String):Boolean;
var
 sql,
 qUsuario,
 para,
 ssChave,
 NumeroRecibo : string;
 Mensagememail: TStrings;
begin
 LerConfiguracaoNFCe();
 ACBrNFe.Configuracoes.WebServices.Salvar := false;
 ACBrNFe.Configuracoes.Arquivos.Salvar    := false;

 Status  := '';
 Result  := false;
 ssChave := '';
 inicializaVariaveis();
 try
  Mensagememail := TStringList.Create;
  vAux := nota;
    ACBrNFe.NotasFiscais.Clear;
    /////GERAR NFC-e:
    GerarNFCe(nota, vAux, gTipoEmissao,gTipoAmbiente,gUFComerciante, gFinalidadeNFe);

   {try
    ACBrNFe.NotasFiscais.Valida;
    ACBrNFe.NotasFiscais.Assinar;
   except
     on e:exception do
       begin
         MessageDlg('Falha na Validação da Nota: ' + #13 + e.Message + #13, mtError, [mbOK], 1);
         Result := false;
         exit;
       end;
   end;}

   try
    ACBrNFe.WebServices.Enviar.Lote := '0';
    ACBrNFe.WebServices.Enviar.Executar;
   except
     On e:Exception do
      begin
        Status := 'OFF';
        MessageDlg('Ocorreu um Erro1: ' + #13 + e.Message + #13, mtError, [mbOK], 1);
        Result := false;
        exit;
      end;
    end;
   NumeroRecibo := ACBrNFe.WebServices.Enviar.Recibo;

   MemoResp.Clear;
   MemoResp.Lines.Text := UTF8Encode(ACBrNFe.WebServices.Retorno.RetWS);

   //LoadXML(MemoResp, WBResposta);
   ACBrNFe.WebServices.Retorno.Recibo := NumeroRecibo;//qry.FieldByName('RECIBO_NUMERO').AsString;
   ACBrNFe.WebServices.Retorno.Executar;
   ssChave                                            := ACBrNFe.WebServices.Retorno.ChaveNFe;
  if ACBrNFe.WebServices.Retorno.cStat <= 200 then
     begin
       Result := true;
       Status := 'OK';
       Incrementa_Generator1('NFCE', 1);
       venda.chave := ssChave;
       if ssChave <> '' then insereNotaBD(venda);
     end;

    if ACBrNFe.WebServices.Retorno.cStat > 200 Then
     begin
      ShowMessage('NF-e '+ ' Houve uma falha na Validação!'+#13+#10+#13+#10+
                  'Favor Corrigir: ' + #13 + 'cStat: ' + IntToStr(ACBrNFe.WebServices.Retorno.cStat) + #13 + 'xMotivo: ' + ACBrNFe.WebServices.Retorno.xMotivo);//+qry.FieldByName('RECIBO_DESCSTATUS').AsString);
      Result := false;
      exit;
     end;
     //MemoResp.Lines.Text := UTF8Encode(ACBrNFe.WebServices.Retorno.RetWS);
     //LoadXML(MemoResp, WBResposta);

     try
      imprimirNfce();
     except
      On Exception do
       begin
        MessageDlg('Verifique se o Acrobat está instalado corretamente.', mtInformation, [mbok],0 );
       end;
     end;
     para := 'wagner.br.xx@gmail.com';

     if ssChave <> '' then  ACBrNFe.NotasFiscais.LoadFromFile(ACBrNFe.Configuracoes.Arquivos.PathNFe + ssChave+'-nfe.xml');
     // envia nf-e por e-mail
     //ShowMessage('NF-e '+qry.FieldByName('NUVENDACFE').AsString+ ' Transmitida com Sucesso!'+#13+#10+#13+#10+
     ShowMessage('NF-e '+ IntToStr(codNF) + ' Transmitida com Sucesso!'+#13+#10+#13+#10+
                 'CHAVE DE ACESSO: '+ssChave+#13+#10+
         //       'Data/Hora da Autorização: ' +qry.FieldByName('DATA_AUTORIZACAO_TEXTO').AsString+#13+#10+#13+#10+
                  'Data/Hora da Autorização: '+ FormatDateTime('', now) +#13+#10+#13+#10+
                 'DANFE impresso com Sucesso!');
     Result := true;
 finally
  FreeAndNil(Mensagememail);
 end;
end;

function EnviarCupomEletronicoTitular(nota : String; var Status, xmotivo : string;const tipo : integer;const enviar : boolean; const cliente1 : String; obs1 : String = ''; serie1 : String = '1'; NNF : STRING = ''; imp : boolean = true; recebido : currency = 0; primeiroCupom : boolean = false):Boolean;
var
 sql,
 qUsuario,
 para,
 ssChave, erro1,
 NumeroRecibo : string;
 Mensagememail: TStrings;
 csta, i      : integer;
 enviou : boolean;
 xml : AnsiString;
begin
 carregaConfigsNFCe;
 //LerConfiguracaoNFCe();
 danfe.vTroco := recebido;
 obs2 := obs1;
 Status  := '';
 Result  := false;
 ssChave := '';
 vlRecebido := recebido;
 inicializaVariaveis();
 tipoEmissao := tipo;
 enviou   := true;


 CDCFOP := '5102';
 if ((DateOf(now) >= StrToDate('03/11/2015')) or (ACBrNFe.Configuracoes.WebServices.Ambiente = taHomologacao)) then ACBrNFe.Configuracoes.Geral.IncluirQRCodeXMLNFCe := true
 else ACBrNFe.Configuracoes.Geral.IncluirQRCodeXMLNFCe := false;

 //danfe.vTroco := recebido;
 cliente := cliente1;
 try

  if enviar then
    begin
      contOFFLINE := false;
      ACBrNFe.Configuracoes.Geral.FormaEmissao := teNormal;
    end
    else
      begin
        contOFFLINE := true;
        ACBrNFe.Configuracoes.Geral.FormaEmissao := teOffLine;
        //contigência OFFLINE
      end;

   serie1 := IntToStr(serie2);
  /////GERAR NFC-e:

  query1.Close;
  query1.SQL.Text := 'select chave from nfce where nota = :nota';
  query1.ParamByName('nota').AsString := nota;
  query1.Open;

  if query1.IsEmpty then
    begin
      xml := GerarNFCeTexto(nota, cliente1);
      GravarTexto(pastaControlW + '\NFCe\EMIT\' + chaveNF + '-nfe.xml', xml);
    end
  else
    begin
      chaveNF := query1.fieldbyname('chave').AsString;
      if not FileExists(pastaControlW + '\NFCe\EMIT\' + chaveNF + '-nfe.xml') then
        begin
          xml := GerarNFCeTexto(nota, cliente1);
          GravarTexto(pastaControlW + '\NFCe\EMIT\' + chaveNF + '-nfe.xml', xml);
        end;
    end;

  query1.Close;
  ACBrNFe.NotasFiscais.Clear;
  ACBrNFe.NotasFiscais.LoadFromFile(pastaControlW + '\NFCe\EMIT\' + chaveNF + '-nfe.xml', false);

   if enviar then
     begin

       try
         ACBrNFe.NotasFiscais.Validar;
         ACBrNFe.NotasFiscais.Assinar;
       except
         on e:exception do
           begin
             erro1 := e.Message;
             gravaERRO_LOG('', e.Message, 'Validação dos Dados');
             MessageDlg('Falha na Validação da Nota: ' + #13 + e.Message + #13, mtError, [mbOK], 1);

             {try
               ACBrNFe.NotasFiscais[0].GravarXML(ExtractFileDir(ParamStr(0)) + '\NFCe\EMIT\','erro-' + IntToStr(ACBrNFe.NotasFiscais[0].NFe.Ide.cNF) + '.xml' );
             except
             end;}
             Status := 'vali';
             Result := false;
             exit;
           end;
       end;

       ssChave := chaveNF;
       //ssChave := ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.ID;
       //ssChave := copy(ssChave, 4, length(ssChave));
       venda.adic := 'EMI';

       //venda.chave := ssChave;
       //insereNotaBD(venda);
       ACBrNFe.NotasFiscais[0].GravarXML( chaveNF + '-nfe.xml', pastaControlW + '\NFCe\EMIT\');

       if (ACBrNFe.Configuracoes.WebServices.Ambiente = taHomologacao) then
        begin
          ACBrNFe.NotasFiscais[0].NFe.Det[0].Prod.xProd := 'NOTA FISCAL EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL';
          //item.nome := 'NOTA FISCAL EMITIDA EM AMBIENTE DE HOMOLOGAÇÃO – SEM VALOR FISCAL';
        end;

       i := 0;
       csta := 999;
       while true do
         begin
           if i = 2 then break;
           i := i + 1;
           try
             ACBrNFe.Enviar(0, false, true);

             //if MessageDlg('sim exit, nao passa', mtConfirmation, [mbYes, mbNo], 1) = idyes then exit;

             enviou := true;
             csta := ACBrNFe.WebServices.Retorno.cStat;
             break;
             Result := true;
           except
             On e:Exception do
               begin
                 gravaERRO_LOG('', e.Message, 'Enviar');
                 if Contido('Rejeicao: ', e.Message) then
                   begin
                     if Contido('Duplicidade', e.Message) = false then
                       begin
                         Status := e.Message;
                         MessageDlg(e.Message, mtError, [mbOK], 1);
                         Result := false;
                         exit;
                       end;
                   end;

                 csta := ACBrNFe.WebServices.Retorno.NFeRetorno.cStat;
                 Status := e.Message;
                 //Status := 'OFF';

                 if Contido('Duplicidade de NF-e [chNFe:', e.Message) THEN
                   begin
                     try
                       ACBrNFe.Consultar;
                       csta := ACBrNFe.NotasFiscais[0].NFe.procNFe.cStat;
                       if csta < 200 then break;
                     except
                     end;
                   end
                 else if Contido('Duplicidade de NF-e, com diferenca na Chave de Acesso [chNFe:', e.Message) THEN
                   begin
                     trataDuplicidade(e.Message, true);

                     inicializaVariaveis;
                     xml := GerarNFCeTexto(nota, cliente1);
                     GravarTexto(pastaControlW + '\NFCe\EMIT\' + chaveNF + '-nfe.xml', xml);
                     ACBrNFe.NotasFiscais.Clear;
                     ACBrNFe.NotasFiscais.LoadFromFile(pastaControlW + '\NFCe\EMIT\' +chaveNF + '-nfe.xml');
                   end
                 else if Contido('REJEICAO:', UpperCase(e.Message)) = false then
                   begin
                     //MessageDlg('XA ' + e.Message, mtError, [mbOK], 1);
                     if Contido('O tempo limite da operação foi atingido', e.Message) then
                       begin
                         try
                           ACBrNFe.Consultar;
                           csta := ACBrNFe.NotasFiscais[0].NFe.procNFe.cStat;
                           if csta < 200 then break;
                         except
                         end;
                       end
                     else
                       begin
                         enviou := false;
                         csta := 999;
                         {MessageDlg('Erro: ' + #13 + e.Message + #13, mtError, [mbOK], 1);
                         if (enviou = false) then
                           begin
                             EnviarCupomEletronicoTitular(nota, Status, xmotivo, tipo, false, cliente1, obs1, '', '',True, recebido);
                           end;
                         exit;}
                       end;
                   end
                 else
                   begin
                     if Contido('REJEICAO:', UpperCase(e.Message)) then
                       begin
                         Result := false;
                         Status := e.Message;
                       end;
                     //MessageDlg('XD ' + e.Message, mtError, [mbOK], 1);
                     Result := false;
                     exit;
                   end;  
               end;
           end;
         end;

       if csta = 999 then
         begin
           EnviarCupomEletronicoTitular(nota, Status, xmotivo, tipo, false, cliente1, obs1, '', '',True, recebido);
           exit;
         end;
         
       ssChave := ACBrNFe.WebServices.Retorno.ChaveNFe;
       ACBrNFe.NotasFiscais[0].GravarXML(chaveNF + '-nfe.xml', pastaControlW + '\NFCe\EMIT\');

       if cSta <= 200 then
         begin
           if Le_Nodo('protNFe versao="3.10"', ACBrNFe.NotasFiscais[0].XML) = '' then
             begin
               //if ACBrNFe.WebServices.Retorno.RetornoWS = '' then ACBrNFe.Consultar;
               ACBrNFe.Consultar;
               //ShowMessage('1');
             end;

           Result := true;
           Status := 'OK';
           venda.adic := '';
           ACBrNFe.NotasFiscais[0].GravarXML(chaveNF + '-nfe.xml',pastaControlW + '\NFCe\EMIT\');
           Incrementa_Generator1('NFCE', 1);
           venda.chave := chaveNF;
           erro1 := LeftStr(erro1, 200);
           if csta <> 100 then venda.adic := erro1;
           insereNotaBD(venda);
         end;

       if csta > 200 Then
         begin
           Status  := 'vali';
           xmotivo := ACBrNFe.WebServices.Retorno.xMotivo;
           ShowMessage('NF-e '+ ' Houve uma falha na Validação!'+#13+#10+#13+#10+
                  'Favor Corrigir: ' + ACBrNFe.WebServices.Retorno.xMotivo);//+qry.FieldByName('RECIBO_DESCSTATUS').AsString);
           Result := false;
           exit;
         end;
     end
   else  //aqui é em contigencia OFFLINE
     begin

       try
         ACBrNFe.NotasFiscais.Validar;
         ACBrNFe.NotasFiscais.Assinar;
       except
         on e:exception do
           begin
             gravaERRO_LOG('', e.Message, 'validar');
             Status := 'vali';
             MessageDlg('Falha na Validação da Nota: ' + #13 + e.Message + #13, mtError, [mbOK], 1);
             Result := false;
             exit;
           end;
       end;

       ssChave := ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.ID;
       ssChave := copy(ssChave, 4, length(ssChave));
       venda.adic := 'OFF';
       Incrementa_Generator1('NFCE', 1);
       venda.chave := ssChave;
       insereNotaBD(venda);

       ACBrNFe.NotasFiscais[0].GravarXML(chaveNF + '-nfe.xml',pastaControlW + '\NFCe\EMIT\');
       Result := true;
     end;

     try
      if imp then imprimirNfce();
     except
      On Exception do
       begin
        MessageDlg('Verifique se o Acrobat está instalado corretamente.', mtInformation, [mbok],0 );
       end;
     end;
     para := 'wagner.br.xx@gmail.com';
     ACBrNFe.NotasFiscais.Clear;

   Result := true;
 finally
  //FreeAndNil(Mensagememail);
 end;

end;


function EnviarCupomEletronicoOFFLINE(nota : String; var Status, xmotivo : string;const tipo : integer;const enviar : boolean; const cliente1 : String; obs1 : String = ''; serie1 : String = '1'; NNF : STRING = ''; imp : boolean = true; recebido : currency = 0; primeiroCupom : boolean = false):Boolean;
var
 sql,
 qUsuario,
 para,
 ssChave, erro1,
 NumeroRecibo : string;
 Mensagememail: TStrings;
 csta, i      : integer;
 enviou : boolean;
begin
 //LerConfiguracaoNFCe();
 Status  := '';
 Result  := false;
 ssChave := '';
 inicializaVariaveis();
 tipoEmissao := tipo;
 enviou   := true;

 cliente := cliente1;
 try
  ACBrNFe.NotasFiscais.Clear;

  if enviar then
    begin
      contOFFLINE := false;
      ACBrNFe.Configuracoes.Geral.FormaEmissao := teNormal;
    end
    else
      begin
        contOFFLINE := true;
        ACBrNFe.Configuracoes.Geral.FormaEmissao := teOffLine;
        //contigência OFFLINE
      end;

   serie1 := IntToStr(serie2);
  /////GERAR NFC-e:

  GerarNFCe(nota, cliente, obs1, serie1, NNF, '', recebido);

   if enviar then
     begin
       try
         ACBrNFe.NotasFiscais.Validar;
         ACBrNFe.NotasFiscais.Assinar;
       except
         on e:exception do
           begin
             erro1 := e.Message;
             gravaERRO_LOG('', e.Message, 'Validação dos Dados');
             ACBrNFe.NotasFiscais[0].GravarXML('erro-' + IntToStr(ACBrNFe.NotasFiscais[0].NFe.Ide.cNF) + '.xml', ExtractFileDir(ParamStr(0)) + '\NFCe\EMIT\' );
             Status := 'vali';
             MessageDlg('Falha na Validação da Nota: ' + #13 + e.Message + #13, mtError, [mbOK], 1);
             Result := false;
             exit;
           end;
       end;

       ssChave := ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.ID;
       ssChave := copy(ssChave, 4, length(ssChave));
       venda.adic := 'EMI';

       //venda.chave := ssChave;
       //insereNotaBD(venda);
       ACBrNFe.NotasFiscais[0].GravarXML(ssChave + '-nfe.xml', pastaControlW + '\NFCe\EMIT\' );

       try
         i := 0;
         {while true do
           begin
             i := i + 1;
             try}

               ACBrNFe.Enviar(0, false);
               //GRAVA_NODO_PROT_NFE1('');
               enviou := true;
           {    break;
             if i = 3 then break;
             Sleep(1000);
           end;}
         csta := ACBrNFe.WebServices.Retorno.cStat;
        except
         On e:Exception do
           begin
             gravaERRO_LOG('', e.Message, 'Enviar');
             csta := ACBrNFe.WebServices.Retorno.cStat;
             Status := 'OFF';
             //MessageDlg('Ocorreu um Erro: ' + #13 + e.Message + #13, mtError, [mbOK], 1);

             if Contido('DUPLICIDADE DE', uppercase(e.Message)) THEN
             begin
               if ACBrNFe.Consultar then
                 begin
                   csta := ACBrNFe.NotasFiscais[0].NFe.procNFe.cStat;
                 end;
             end;
             Result := false;

             if Contido('Requisição não enviada', e.Message) then
               begin
                 enviou := primeiroCupom;
                 MessageDlg('Ocorreu um Erro1: ' + #13 + e.Message + #13, mtError, [mbOK], 1);
                 if (enviou = false) then
                   begin
                     EnviarCupomEletronico1(nota, Status, xmotivo, tipo, false, cliente1, obs1, '', '',True, recebido);
                   end;
                 exit;
               end;

             //exit;
           end;
       end;

       {if (enviou = false) then
         begin

           inicializaVariaveis;
           contOFFLINE := true;
           GerarNFCe(nota, cliente, obs1, serie1, IntToStr(codNF), '', recebido);

           venda.chave := ssChave;
           venda.adic := 'OFF';
           Incrementa_Generator('NFCE', 1);

           ACBrNFe.NotasFiscais[0].SaveToFile(pastaControlW + '\NFCe\EMIT\' + ssChave + '-nfe.xml');
           insereNotaBD(venda);
           imprimirNfce();
           ACBrNFe.NotasFiscais.Clear;
           Result := true;
           exit;
         end; }

       ssChave := ACBrNFe.WebServices.Retorno.ChaveNFe;
       ACBrNFe.NotasFiscais[0].GravarXML(ssChave + '-nfe.xml', pastaControlW + '\NFCe\EMIT\' );

       if cSta <= 200 then
         begin
           if Le_Nodo('protNFe versao="3.10"', ACBrNFe.NotasFiscais[0].XML) = '' then
             begin
               if ACBrNFe.WebServices.Retorno.RetornoWS = '' then ACBrNFe.Consultar;
             end;

           Result := true;
           Status := 'OK';
           venda.adic := '';
           ACBrNFe.NotasFiscais[0].GravarXML(ssChave + '-nfe.xml', pastaControlW + '\NFCe\EMIT\');
           Incrementa_Generator1('NFCE', 1);
           venda.chave := ssChave;
           erro1 := LeftStr(erro1, 200);
           if csta <> 100 then venda.adic := erro1;
           insereNotaBD(venda);
         end;

       if csta > 200 Then
         begin
           Status  := 'vali';
           xmotivo := ACBrNFe.WebServices.Retorno.xMotivo;
           ShowMessage('NF-e '+ ' Houve uma falha na Validação!'+#13+#10+#13+#10+
                  'Favor Corrigir: ' + ACBrNFe.WebServices.Retorno.xMotivo);//+qry.FieldByName('RECIBO_DESCSTATUS').AsString);
           Result := false;
           exit;
         end;
     end
   else  //aqui é em contigencia OFFLINE
     begin

       try
         ACBrNFe.NotasFiscais.Validar;
         ACBrNFe.NotasFiscais.Assinar;
       except
         on e:exception do
           begin
             gravaERRO_LOG('', e.Message, 'validar');
             Status := 'vali';
             MessageDlg('Falha na Validação da Nota: ' + #13 + e.Message + #13, mtError, [mbOK], 1);
             Result := false;
             exit;
           end;
       end;

       ssChave := ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.ID;
       ssChave := copy(ssChave, 4, length(ssChave));
       venda.adic := 'OFF';
       Incrementa_Generator1('NFCE', 1);
       venda.chave := ssChave;
       insereNotaBD(venda);

       ACBrNFe.NotasFiscais[0].GravarXML(ssChave + '-nfe.xml', pastaControlW + '\NFCe\EMIT\');
       Result := true;
     end;

     try
      if imp then imprimirNfce();
     except
      On Exception do
       begin
        MessageDlg('Verifique se o Acrobat está instalado corretamente.', mtInformation, [mbok],0 );
       end;
     end;
     para := 'wagner.br.xx@gmail.com';
     ACBrNFe.NotasFiscais.Clear;

   Result := true;
 finally
  //FreeAndNil(Mensagememail);
 end;

end;


function EnviarCupomEletronico1(nota : String; var Status, xmotivo : string;const tipo : integer;const enviar : boolean; const cliente1 : String; obs1 : String = ''; serie1 : String = '1'; NNF : STRING = ''; imp : boolean = true; recebido : currency = 0; primeiroCupom : boolean = false):Boolean;
var
 sql,
 qUsuario,
 para,
 ssChave, erro1,
 NumeroRecibo : string;
 Mensagememail: TStrings;
 csta, i      : integer;
 enviou : boolean;
begin
 //LerConfiguracaoNFCe();
 Status  := '';
 Result  := false;
 ssChave := '';
 inicializaVariaveis();
 tipoEmissao := tipo;
 enviou   := true;

 cliente := cliente1;
 try
  ACBrNFe.NotasFiscais.Clear;

  if enviar then
    begin
      contOFFLINE := false;
      ACBrNFe.Configuracoes.Geral.FormaEmissao := teNormal;
    end
    else
      begin
        contOFFLINE := true;
        ACBrNFe.Configuracoes.Geral.FormaEmissao := teOffLine;
        //contigência OFFLINE
      end;

   serie1 := IntToStr(serie2);
  /////GERAR NFC-e:
  GerarNFCe(nota, cliente, obs1, serie1, NNF, '', recebido);

   if enviar then
     begin
       try
         ACBrNFe.NotasFiscais.Validar;
         ACBrNFe.NotasFiscais.Assinar;
       except
         on e:exception do
           begin
             erro1 := e.Message;
             gravaERRO_LOG('', e.Message, 'Validação dos Dados');
             //ACBrNFe.NotasFiscais[0].GravarXML('erro-' + IntToStr(ACBrNFe.NotasFiscais[0].NFe.Ide.cNF) + '.xml', ExtractFileDir(ParamStr(0)) + '\NFCe\EMIT\' );
             Status := 'vali';
             MessageDlg('Falha na Validação da Nota: ' + #13 + e.Message + #13, mtError, [mbOK], 1);
             Result := false;
             exit;
           end;
       end;

       ssChave := ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.ID;
       ssChave := copy(ssChave, 4, length(ssChave));
       venda.adic := 'EMI';

       venda.chave := ssChave;
       insereNotaBD(venda);
       ACBrNFe.NotasFiscais[0].GravarXML( ssChave + '-nfe.xml', pastaControlW + '\NFCe\EMIT\');

       try
         i := 0;
         {while true do
           begin
             i := i + 1;
             try}
               ACBrNFe.Enviar(0, false);
               //GRAVA_NODO_PROT_NFE1('');
               enviou := true;
           {    break;
             if i = 3 then break;
             Sleep(1000);
           end;}
         csta := ACBrNFe.WebServices.Retorno.cStat;
        except
         On e:Exception do
           begin
             gravaERRO_LOG('', e.Message, 'Enviar');
             csta := ACBrNFe.WebServices.Retorno.cStat;
             Status := 'OFF';
             //MessageDlg('Ocorreu um Erro: ' + #13 + e.Message + #13, mtError, [mbOK], 1);

             if Contido('DUPLICIDADE DE', uppercase(e.Message)) THEN
             begin
               if ACBrNFe.Consultar then
                 begin
                   csta := ACBrNFe.NotasFiscais[0].NFe.procNFe.cStat;
                 end;
             end;
             Result := false;

             if Contido('Requisição não enviada', e.Message) then
               begin
                 enviou := primeiroCupom;
                 MessageDlg('Ocorreu um Erro: ' + #13 + e.Message + #13, mtError, [mbOK], 1);
                 exit;
               end;

             //exit;
           end;
       end;

       if (enviou = false) then
         begin

           inicializaVariaveis;
           contOFFLINE := true;
           GerarNFCe(nota, cliente, obs1, serie1, IntToStr(codNF), '', recebido);

           venda.chave := ssChave;
           venda.adic := 'OFF';
           Incrementa_Generator1('NFCE', 1);

           ACBrNFe.NotasFiscais[0].GravarXML(ssChave + '-nfe.xml', pastaControlW + '\NFCe\EMIT\');
           insereNotaBD(venda);
           imprimirNfce();
           ACBrNFe.NotasFiscais.Clear;
           Result := true;
           exit;
         end;

       ssChave := ACBrNFe.WebServices.Retorno.ChaveNFe;
       ACBrNFe.NotasFiscais[0].GravarXML(ssChave + '-nfe.xml', pastaControlW + '\NFCe\EMIT\');

       if cSta <= 200 then
         begin
           if Le_Nodo('protNFe versao="3.10"', ACBrNFe.NotasFiscais[0].XML) = '' then
             begin
               if ACBrNFe.WebServices.Retorno.RetornoWS = '' then ACBrNFe.Consultar;
             end;

           Result := true;
           Status := 'OK';
           venda.adic := '';
           ACBrNFe.NotasFiscais[0].GravarXML(ssChave + '-nfe.xml', pastaControlW + '\NFCe\EMIT\');
           Incrementa_Generator1('NFCE', 1);
           venda.chave := ssChave;
           erro1 := LeftStr(erro1, 200);
           if csta <> 100 then venda.adic := erro1;
           insereNotaBD(venda);
         end;

       if csta > 200 Then
         begin
           Status  := 'vali';
           xmotivo := ACBrNFe.WebServices.Retorno.xMotivo;
           ShowMessage('NF-e '+ ' Houve uma falha na Validação!'+#13+#10+#13+#10+
                  'Favor Corrigir: ' + ACBrNFe.WebServices.Retorno.xMotivo);//+qry.FieldByName('RECIBO_DESCSTATUS').AsString);
           Result := false;
           exit;
         end;
     end
   else  //aqui é em contigencia OFFLINE
     begin

       try
         ACBrNFe.NotasFiscais.Validar;
         ACBrNFe.NotasFiscais.Assinar;
       except
         on e:exception do
           begin
             gravaERRO_LOG('', e.Message, 'validar');
             Status := 'vali';
             MessageDlg('Falha na Validação da Nota: ' + #13 + e.Message + #13, mtError, [mbOK], 1);
             Result := false;
             exit;
           end;
       end;

       ssChave := ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.ID;
       ssChave := copy(ssChave, 4, length(ssChave));
       venda.adic := 'OFF';
       Incrementa_Generator1('NFCE', 1);
       venda.chave := ssChave;
       insereNotaBD(venda);

       ACBrNFe.NotasFiscais[0].GravarXML(ssChave + '-nfe.xml', pastaControlW + '\NFCe\EMIT\');
       Result := true;
     end;

     try
      if imp then imprimirNfce();
     except
      On Exception do
       begin
        MessageDlg('Verifique se o Acrobat está instalado corretamente.', mtInformation, [mbok],0 );
       end;
     end;
     para := 'wagner.br.xx@gmail.com';
     ACBrNFe.NotasFiscais.Clear;

   Result := true;
 finally
  //FreeAndNil(Mensagememail);
 end;
end;

function EnviarCupomEletronico2(nota : String; var estado : String; const imprime, dav : boolean;const lerconfig : boolean = true):Boolean;
var
 para,
 ssChave, ssChaveVelha,
 NumeroRecibo : string;
 csta : integer;
 Mensagememail: TStrings;
 xml : AnsiString;
 chaveDetalhe : TChaveDetalhes;
 novo : boolean;
begin
 if lerconfig then LerConfiguracaoNFCe();
 Result  := false;
 ssChave := '';
 inicializaVariaveis();
 novo := false;

 if DateOf(now) >= StrToDate('03/11/2015') then ACBrNFe.Configuracoes.Geral.IncluirQRCodeXMLNFCe := true
 else ACBrNFe.Configuracoes.Geral.IncluirQRCodeXMLNFCe := false;

 query1.Close;
 query1.SQL.Text := 'select chave from nfce where nota = :nota';
 query1.ParamByName('nota').AsString := nota;
 query1.Open;

 if query1.IsEmpty then
    begin
      query1.Close;
      if not dav then ShowMessage('NFCe não encontrada');
      exit;
    end;

 ssChave := query1.fieldbyname('chave').AsString;
 estado  := 'XML nao encontrado: ' +ExtractFileDir(ParamStr(0)) + '\NFCE\EMIT\' + ssChave + '-nfe.xml';

 //if not FileExists(ExtractFileDir(ParamStr(0)) + '\NFCE\EMIT\' + ssChave + '-nfe.xml') then exit;

 contOFFLINE := false;
 lerVenda(nota);

 try
  //Mensagememail := TStringList.Create;
  ACBrNFe.NotasFiscais.Clear;
  /////GERAR NFC-e:

  chaveDetalhe       := TChaveDetalhes.Create;
  chaveDetalhe.chave := ssChave;
  Ler_dados_pela_chave(chaveDetalhe);
  //if ((FormatDateTime('yymm', now) <> chaveDetalhe.anoMesYYMM) or (FileExists(ParamStr(0) + '\NFCE\EMIT\' + ssChave + '-nfe.xml') = false)) then

  ///ShowMessage(FormatDateTime('yymm', now) + '  ' + chaveDetalhe.anoMesYYMM);
  if (FormatDateTime('yymm', now) <> chaveDetalhe.anoMesYYMM) then
    begin

      if chaveDetalhe.tpemis = 9 then
        begin
          contOFFLINE := true;
        end;

      ssChaveVelha := chaveDetalhe.chave;  

      //ShowMessage('pasta='+pastaControlW);

      inicializaVariaveis;  
      xml := GerarNFCeTexto(IntToStr(chaveDetalhe.codnf), '0', IntToStr(chaveDetalhe.nnf));
      GravarTexto(pastaControlW + '\NFCe\EMIT\' + chaveNF + '-nfe.xml', xml);
      LimpaVariaveis();


      gravaERRO_LOG1('', 'Troca de Chave Por Erro de Envio: ' + #13#10 +
      'Chave Antiga: ' + ssChave + #13#10 +
      'Chave   Nova: ' + chaveNF + #13#10 +
      'Data  Troca : ' + FormatDateTime('dd/mm/yyyy', now) + ' ' + FormatDateTime('hh:mm:ss', now), 'Nova Criação de XML');

      ssChave := chaveNF;

      //ShowMessage();

      ACBrNFe.NotasFiscais.LoadFromFile(pastaControlW + '\NFCe\EMIT\' + chaveNF + '-nfe.xml');
      novo := true;
    end
  else
    begin
      ACBrNFe.NotasFiscais.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\NFCE\EMIT\' + ssChave + '-nfe.xml');
    end;

  ACBrNFe.NotasFiscais[0].NFe.Ide.dEmi    := now;
  ACBrNFe.NotasFiscais[0].NFe.Ide.dSaiEnt := now;
  if ACBrNFe.NotasFiscais[0].NFe.Ide.tpEmis = teOffLine then
    begin
      ACBrNFe.NotasFiscais[0].NFe.Ide.dhCont  := now;
      ACBrNFe.NotasFiscais[0].NFe.Ide.xJust   := 'NOTA FISCAL EMITIDA EM CONTINGENCIA';
    end;  

  ACBrNFe.NotasFiscais[0].NFe.Ide.hSaiEnt  := now;

  ACBrNFe.NotasFiscais.Validar;
  ACBrNFe.NotasFiscais.Assinar;
  csta := 9999;
  try
    ACBrNFe.Enviar(0, false);
    csta := ACBrNFe.WebServices.Retorno.cStat;
    estado := 'OK';
  except
    On e:Exception do
      begin
        csta := ACBrNFe.WebServices.Retorno.cStat;
        if not dav then MessageDlg('Ocorreu um Erro: ' + #13 + e.Message + #13, mtError, [mbOK], 1);
        estado := e.Message + #13 + ACBrNFe.WebServices.Retorno.xMotivo;

        if Contido('Duplicidade de NF-e, com diferenca na Chave de Acesso [chNFe:', e.Message) THEN
        begin
          trataDuplicidade(e.Message, false);
          {venda.chave := ssChave;
          venda.adic  := '';
          insereNotaBD(venda);}
          exit;
        end;

        if Contido('DUPLICIDADE DE NF-E', UpperCase(estado)) then
          begin
            estado := estado + #13 + e.Message + #13;
            ACBrNFe.NotasFiscais.Clear;
            ACBrNFe.NotasFiscais.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\NFCE\EMIT\' + ssChave + '-nfe.xml');
            if ACBrNFe.Consultar then
              begin
                csta := ACBrNFe.NotasFiscais[0].NFe.procNFe.cStat;
                estado := 'NFCe Consultada1: Cstat: ' + IntToStr(csta) + #13 + ACBrNFe.WebServices.Retorno.xMotivo;
              end;
          end
        else
          begin
            Result := false;
            exit;
          end;
      end;
  end;

  //if ACBrNFe.WebServices.Retorno.cStat <= 200 then
  if csta <= 200 then
    begin
      ssChave := ACBrNFe.WebServices.Retorno.ChaveNFe;
      if csta < 200 then
        begin
          venda.adic := '';
          Result := true;
        end;
      venda.chave := ssChave;
      if novo then insereNotaBD1(venda)
        else insereNotaBD(venda);
      Result := true;
    end;

  if csta > 200 Then
    begin
      if dav = false then
        begin
          ShowMessage('NF-e '+ ' Houve uma falha na Validação!'+#13+#10+#13+#10+
          'Favor Corrigir: ' + ACBrNFe.WebServices.Retorno.xMotivo);//+qry.FieldByName('RECIBO_DESCSTATUS').AsString);
        end;  
      Result := false;
    exit;
    end;

  try
    if imprime then imprimirNfce();
  except
    On Exception do
      begin
        MessageDlg('Verifique se o Acrobat está instalado corretamente.', mtInformation, [mbok],0 );
      end;
  end;

  ACBrNFe.NotasFiscais.Clear;
 finally
   venda.Free;
  //FreeAndNil(Mensagememail);
 end;
end;

procedure ConsultarNFe(numeroNota:String; visuali : boolean = true);
begin
 //
 carregaConfigsNFCe;
 query1.Close;
 query1.SQL.Text := 'select chave from nfce where nota = :nota';
 query1.ParamByName('nota').AsString := numeroNota;
 query1.Open;

 if query1.IsEmpty then
    begin
      query1.Close;
      ShowMessage('NFCe não encontrada');
      exit;
    end;

  ACBrNFe.Configuracoes.WebServices.Visualizar := visuali;
  ACBrNFe.NotasFiscais.Clear;
  ACBrNFe.NotasFiscais.LoadFromFile(pastaControlW+ 'NFCE\EMIT\'+query1.FieldByName('chave').AsString+'-nfe.xml');
  ACBrNFe.Consultar;
  ACBrNFe.Configuracoes.WebServices.Visualizar := visuali;
end;

procedure Imprimir_DANFE_PDF(numeroNota:String);
var
 ArqPDF,
 nomeArquivo:string;
begin
  query1.Close;
 query1.SQL.Text := 'select chave from nfce where nota = :nota';
 query1.ParamByName('nota').AsString := numeroNota;
 query1.Open;

 if query1.IsEmpty then
    begin
      query1.Close;
      ShowMessage('NFCe não encontrada');
      exit;
    end;

 ACBrNFe.NotasFiscais.Clear;
 nomeArquivo := pastaControlW + 'NFCe\EMIT\'  + query1.FieldByName('chave').AsString+'-nfe.xml';
 ACBrNFe.NotasFiscais.LoadFromFile(nomeArquivo);

 imprimirNfce();
end;

function Cancelamento_NFe(numeroNota:String; MemoResp:TMemo; WBResposta:TWebBrowser):Boolean;
var
 Chave, idLote, CNPJ, Protocolo, Justificativa, tmp : string;
begin
 Result := false;
 query1.Close;
 query1.SQL.Text := 'select chave from nfce where nota = :nota';
 query1.ParamByName('nota').AsString := numeroNota;
 query1.Open;

 if query1.IsEmpty then
    begin
      query1.Close;
      ShowMessage('NFCe não encontrada');
      exit;
    end;

 Chave := query1.fieldbyname('chave').AsString;

 if MessageDlg('Tem Certeza que Deseja Cancelar a Nota Fiscal: '+numeroNota+' ?',mtConfirmation,[mbYes, mbNo],0)= mrno then exit;

    Application.ProcessMessages;
    Application.ProcessMessages;

    ACBrNFe.NotasFiscais.Clear;
    ACBrNFe.NotasFiscais.LoadFromFile(pastaControlW + 'NFCe\EMIT\' + chave + '-nfe.xml');

    idLote := '1';
    Justificativa := '';

    while length(trim(Justificativa)) < 15 do
    begin
      Justificativa := dialogo('normal',0,'',150,true,'',Application.Title,'Qual a Justificativa?',Justificativa);
      if Justificativa = '*' then Break;

      if Length(trim(Justificativa)) < 15 then ShowMessage('Justificativa Deve conter mais do que  14 caracteres');
    end;

  if Justificativa = '*' then exit;

    ACBrNFe.EventoNFe.Evento.Clear;
    ACBrNFe.EventoNFe.idLote := StrToInt(idLote) ;
    with ACBrNFe.EventoNFe.Evento.Add do
    begin
     InfEvento.chNFe           := Chave;
     infEvento.dhEvento        := now;
     infEvento.tpEvento        := teCancelamento;
     infEvento.detEvento.xJust := Justificativa;
     infEvento.tpAmb           := ACBrNFe.Configuracoes.WebServices.Ambiente;
    end;

  ACBrNFe.EnviarEvento(StrToInt(idLote));
   tmp := ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo;

   if ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat < 200 then
     begin
       CopyFile(pchar(pastaControlW + 'NFCe\EMIT\' + chave + '-nfe.xml'), pchar(pastaControlW + 'NFCe\CANC\' + chave + '-nfe.xml'), true);
       //DANFE.NFeCancelada := true;

       ACBrNFe.DANFE := DANFE;
       ACBrNFe.ImprimirEvento;
       //imprimirNfce;
       //RenameFile(pastaControlW + 'NFCe\EMIT\' + chave + '-nfe.xml', pastaControlW + 'NFCe\EMIT\' + chave + '-nfe.old')
       ShowMessage('NF-e Cancelada com Sucesso. Protocolo '+ ACBrNFe.WebServices.Retorno.Protocolo + #13 + 'cStat: ' +inttostr(ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat));
       Result := true;
     end
   else
     begin
       ShowMessage('Ocorreu um Erro no Cancelamento:' + #13 + tmp + IfThen(pos('Duplicidade', tmp) > 0, #13 + #13 + 'Esta Nota já pode ter Sido Cancelada', ''));
     end;
end;

function Cancelamento_NFe1(numeroNota, Justificativa :String):Boolean;
var
 Chave, idLote, CNPJ, Protocolo, tmp, tmp1 : string;
 cstat : integer;
 arq1 : TStringList;
begin
 carregaConfigsNFCe;
 Result := false;
 query1.Close;
 query1.SQL.Text := 'select chave from nfce where nota = :nota';
 query1.ParamByName('nota').AsString := numeroNota;
 query1.Open;

 if query1.IsEmpty then
    begin
      query1.Close;
      ShowMessage('NFCe não encontrada');
      exit;
    end;

 Chave := query1.fieldbyname('chave').AsString;

 if MessageDlg('Tem Certeza que Deseja Cancelar a Nota Fiscal: '+numeroNota+' ?',mtConfirmation,[mbYes, mbNo],0)= mrno then exit;

    Application.ProcessMessages;
    Application.ProcessMessages;

    ACBrNFe.NotasFiscais.Clear;
    ACBrNFe.NotasFiscais.LoadFromFile(pastaControlW + 'NFCe\EMIT\' + chave + '-nfe.xml');

    idLote := '1';

  Justificativa := UpperCase(Justificativa);

    ACBrNFe.EventoNFe.Evento.Clear;
    ACBrNFe.EventoNFe.idLote := StrToInt(idLote) ;
    with ACBrNFe.EventoNFe.Evento.Add do
    begin
     InfEvento.chNFe           := Chave;
     infEvento.dhEvento        := now;
     infEvento.tpEvento        := teCancelamento;
     infEvento.detEvento.xJust := Justificativa;
     infEvento.tpAmb           := ACBrNFe.Configuracoes.WebServices.Ambiente;
    end;

   ACBrNFe.EnviarEvento(StrToInt(idLote));
   tmp := ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo;

   cstat := ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat;
   if cstat < 200 then
     begin
       if pos(IntToStr(cstat), '101-135-151-573') > 0 then
         begin
           query1.Close;
           query1.SQL.Text := 'update nfce set adic = ''CANC'' where chave = :chave';
           query1.ParamByName('chave').AsString := Chave;
           query1.ExecSQL;
           query1.Transaction.Commit;

         end;

       CopyFile(pchar(pastaControlW + 'NFCe\EMIT\' + chave + '-nfe.xml'), pchar(pastaControlW + 'NFCe\CANC\' + chave + '-nfe.xml'), true);
       //DANFE.NFeCancelada := true;
       imprimirNfce;

       {ACBrNFe.DANFE := DANFE;
       ACBrNFe.ImprimirEvento;}

       //DANFE.NFeCancelada := false;
       ShowMessage('NF-e Cancelada com Sucesso. Protocolo: '+ #13 + 'cStat: ' +inttostr(ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat));
       Result := true;
     end
   else
     begin
       ShowMessage('Ocorreu um Erro no Cancelamento:' + #13 + tmp + IfThen(pos('Duplicidade', tmp) > 0, #13 + #13 + 'Esta Nota já pode ter Sido Cancelada', ''));
     end;

end;

function Cancelamento_NFePorNNF(numeroNota, Justificativa:String):Boolean;
var
 Chave, idLote, CNPJ, Protocolo, tmp, tmp1 : string;
 arq1 : TStringList;
begin
 Result := false;
 query1.Close;
 query1.SQL.Text := 'select nota, chave from nfce where substring(chave from 26 for 9) = :nota';
 query1.ParamByName('nota').AsString := strzero(numeroNota, 9);
 query1.Open;
 
 if query1.IsEmpty then
   begin
     query1.Close;
     ShowMessage('NFCe de Número ' + numeroNota + ' Não Encontrado.');
     exit;
   end;

 Cancelamento_NFe1(query1.fieldbyname('nota').AsString, Justificativa);
end;

//GerarNFCe(nota, cliente, obs1, serie1, NNF, '');
procedure GerarNFCe(nota, NumNFCe, TipoEmissao, TipoAmbiente, UFComerciante, FinalidadeNFe : String; recebido : currency = 0);
var
 qr,qrPg  : tibquery;
 sql      : string;
 sCST,
 idCST    : string;
 sCondPag : string;
 CodUF,
 CodMun   : string;
 bolISSQN : string;
 qry      : TIBQuery;
 ini, fim : integer;
 item     : Item_venda;
 op : TOpenDialog;
 ok : boolean;
begin
  lerItensDaVenda(lista, nota);
  IF UFComerciante = '' THEN
    begin
      codNF := StrToIntDef(Incrementa_Generator1('NFCE', 0), 0);
      //codNF := StrToIntDef(getNumeroValido(), 0);
      if codNF = 0 then codNF := 1;
    end
  else
    begin
      codNF := StrToIntDef(UFComerciante, 1);
    end;

 verCSTcFOP(CDCFOP);
 if TipoAmbiente = '' then TipoAmbiente := '1';
 ACBrNFe.NotasFiscais.Clear;

 try
 ACBrNFe.NotasFiscais.Clear;
 ACBrNFe.NotasFiscais.Add;

   with ACBrNFe.NotasFiscais.Items[0].NFe do
    begin
     LerDados_Emit_Dest(cliente);
     lerNodoIde(codNF, nota, TipoAmbiente);
     lerNodoEmitDest();

     with pag.Add do
      begin
       tPag := StrToFormaPagamento(ok, venda.codFormaNFCE);
       if ok = false then
         begin
           tPag := fpDinheiro;
         end;

       if recebido = 0 then DANFE.vTroco := 0
       else DANFE.vTroco := recebido - venda.total;

       //if recebido > venda.total then vPag := recebido
       //else vPag := venda.total;
       vPag := venda.total;
      end;

      //Adicionando Produtos
      fim := lista.Count -1;
     for ini := 0 to fim do
      begin
        item := Item_venda(lista.Items[ini]);

        Det.Add;
       with Det.Items[ini] do
        begin
         Prod.nItem    := ini + 1;
         Prod.cProd    := strzero(IntToStr(item.cod), 6);
         Prod.cEAN     := item.codbar;
         Prod.xProd    := item.nome;
         Prod.NCM      := item.Ncm;
         Prod.EXTIPI   := '';
         Prod.CFOP     := CDCFOP;
         Prod.uCom     := item.unid;
         Prod.qCom     := item.quant;
         Prod.vUnCom   := item.p_venda;
         Prod.vProd    := item.total;
         Prod.cEANTrib := item.codbar;
         Prod.uTrib    := item.unid;
         Prod.qTrib    := item.quant;
         Prod.vUnTrib  := item.p_venda;
         Prod.vFrete   := 0;
         Prod.vSeg     := 0;
         Prod.vDesc    := item.Desconto;

         tot_Geral     := tot_Geral + (item.total - item.Desconto);

         NODO_ICMS(item, cstIcmCfop, '', ini);
         NODO_PISCOFINS(item, cstpisCfop, ini);
         infAdProd     := ' ';
        end;
   end;

     TotImp := 0;

     TotImp := calculaVlrAproxImpostos(lista);
     TipoEmissao := 'Valor aprox. Impostos:' + formataCurrency(TotImp) + '('+ formataCurrency(ArredondaTrunca(TotImp / (totalNota - venda.desconto) * 100, 2)) +'%)Fonte IBPT' + ';' +
     TipoEmissao;

     Total.ICMSTot.vBC   := TOT_BASEICM;
     Total.ICMSTot.vICMS := TOTICM;
     Total.ICMSTot.vBCST := 0;
     Total.ICMSTot.vST   := 0;
     Total.ICMSTot.vNF   := totalNota - venda.desconto;
     Total.ICMSTot.vProd := totalNota;
     Total.ICMSTot.vFrete:= 0;
     Total.ICMSTot.vSeg  := 0;
     Total.ICMSTot.vDesc := venda.desconto;
     Total.ICMSTot.vIPI  := 0;
     total.ICMSTot.vPIS    := TOT_PIS;
     total.ICMSTot.vCOFINS := TOT_COFINS;
     Total.ICMSTot.vOutro:= 0;
     Transp.modFrete     := mfSemFrete; // NFC-e não pode ter FRETE
     InfAdic.infCpl      :=  TipoEmissao;
     InfAdic.infAdFisco  :=  '';
   //ACBrNFe.NotasFiscais.Items[0].SaveToFile(ExtractFileDir(ParamStr(0)) + '\arq.xml');
  //ShowMessage(dtmMain.ACBrNFe.NotasFiscais.Items[0].);
 {  // Informa as formas de pagamento e seus respectivos valores !!
   try
    qrPg := TIB_Query.Create(nil);
    sql := 'select f.cdfinalizavenda,  f.cdformapagto, fp.nmformapagto, f.vlformapagto '+
           ' from finalizavenda f, formapagto fp, vendacfe v '+
           ' where f.cdformapagto = fp.cdformapagto '+
           ' and   f.cdvendacfe = v.cdvendacfe '+
           ' and v.nuvendacfe   = '''+NumNFCe+'''';
    qrPg.SQL.Add(sql);
    qrPg.Open;
    qrPg.First;
    while not qrPg.Eof do
     begin
      with pag.Add do
       begin
        tPag := FormaPagamento_NFCe(qrPg.FieldByName('nmformapagto').AsString);
        vPag := qrPg.FieldByName('vlformapagto').AsFloat;
       end;
      qrPg.Next;
     end;

   finally
    FreeAndNil(qrPg);
   end;
 }

  end;
 finally
  //FreeAndNil(qr);
 end;
end;

function FormaPagamento_NFCe(formaPagto:String): TpcnFormaPagamento;
begin
 Result := fpDinheiro;

  if (Pos('Cart', formaPagto) > 0) or
    (Pos('cart', formaPagto) > 0) or
    (Pos('CART', formaPagto) > 0) or
    (Pos('cArT', formaPagto) > 0) or
    (Pos('CARt', formaPagto) > 0) then Result := fpCartaoCredito
    else Result := fpDinheiro;

  if (Pos('Val', formaPagto) > 0) or
    (Pos('VAL', formaPagto) > 0) or
    (Pos('val', formaPagto) > 0) or
    (Pos('VAl', formaPagto) > 0) or
    (Pos('VaL', formaPagto) > 0) then Result := fpValePresente
    else Result := fpDinheiro;

 if (Pos('Refeicao', formaPagto) > 0) or
    (Pos('REFEICAO', formaPagto) > 0) or
    (Pos('refeição', formaPagto) > 0) or
    (Pos('REFEIÇÃO', formaPagto) > 0) or
    (Pos('Refeição', formaPagto) > 0) then Result := fpValeRefeicao
    else Result := fpDinheiro;

 if (Pos('Din', formaPagto) > 0) or
    (Pos('DIN', formaPagto) > 0) or
    (Pos('din', formaPagto) > 0) or
    (Pos('DIn', formaPagto) > 0) then Result := fpDinheiro
    else Result := fpDinheiro;

 if (Pos('Cheq', formaPagto) > 0) or
    (Pos('CHEQ', formaPagto) > 0) or
    (Pos('cheq', formaPagto) > 0) or
    (Pos('CHeq', formaPagto) > 0) then Result := fpCheque
    else Result := fpDinheiro;

 if (Pos('Credito', formaPagto) > 0) or
    (Pos('Crédito', formaPagto) > 0) or
    (Pos('credito', formaPagto) > 0) or
    (Pos('crédito', formaPagto) > 0) or
    (Pos('CREDITO', formaPagto) > 0) or
    (Pos('CRÉDITO', formaPagto) > 0) then Result := fpCartaoCredito
    else Result := fpDinheiro;

 if (Pos('Debito', formaPagto) > 0) or
    (Pos('Débito', formaPagto) > 0) or
    (Pos('debito', formaPagto) > 0) or
    (Pos('débito', formaPagto) > 0) or
    (Pos('DEBITO', formaPagto) > 0) or
    (Pos('débito', formaPagto) > 0) then Result := fpCartaoDebito
    else Result := fpDinheiro;


end;


function Retorna_TipoEmissaoNFe(svl:string):TpcnTipoEmissao;
begin
 Result := teNormal;
      if svl = '1' then Result := teContingencia
 else if svl = '2' then Result := teSCAN
 else if svl = '3' then Result := teDPEC
 else if svl = '4' then Result := teFSDA
 else Result := teNormal;
end;

function Retorna_TipoAmbiente(svl:string):TpcnTipoAmbiente;
begin
 if svl = '1' then Result := taProducao
 else Result := taHomologacao;
end;

function Retorna_UFComerciante(svl:string):String;
begin
 Result := svl
end;

procedure reimpressaoNFCe(numeroNota:String);
begin

end;

function Retorna_FinalidadeNFe(svl:string):TpcnFinalidadeNFe;
begin
      if svl = 'COMPLEMENTAR' then Result := fnComplementar
 else if svl = 'AJUSTE'       then Result := fnAjuste
 else Result := fnNormal;
end;



procedure Carrega_NotaFiscal_ArquivoXML(OpenDialog:TOpenDialog; var NotaFiscal:String; var CFOP:String; var CondPagto:String; var ModeloNF:String; var SerieNF:String; var DtEmissao:TDate; var DtEntSai:TDate;
                                                                var HrEntSai:TDateTime; var CNPJEmitente:String; var InscEstEmitente:String; var InscMunicEmitente:String; var EnderecoEmitente:String;
                                                                var NumeroEndEmitente:String; var BairroEmitente:String; var codMunicipoEmitente:String; var NomeMunicipioEmiente:String;
                                                                var UFEmitente:String; var FoneEmitente:String; var CEPEmitente:String; var CNPJDestinario:String; var codMunicipioDestinario:String;
                                                                var VlBaseCalculo:String; var VlICMS:String; var VlBaseCalculoST:String; var VlST:String; var VlProduto:String; var VlFrete:String; var VlSeguro:String;
                                                                var VlDesconto:String; var VlIPI:String; var VlPis:String; var VlCofins:String; var VlOutros:String; var VlNotaFiscal:String;
                                                                var ListaProdutos:TStrings);
var
 i, j, k, n  : integer;
 Nota, Node, NodePai, NodeItem: TTreeNode;
 NFeRTXT: TNFeRTXT;
 nuItem, CodProd, NomeProd,
 qtdProd, vlUnitProd,
 vlTotProd, codEANProd,
 CodNCMProd,CFOPProd, unidadeProd,
 vlFreteProd, vlSeguroProd, vlOutrosProd,
 vlDescontoProd, CSTProd,
 vlBaseCalcICMSProd, vlICMSProd, alICMSProd,
 vlBaseCalcSTProd, vlSTICMSProd, alICMSSTProd,
 vlBaseCalcICMSRedProd, vlICMSRedProd, alICMSRedProd,
 vlBaseCalcIPIProd, vlIPIProd, alIPIProd,
 vlBaseCalcPisProd, vlPisProd, alPisProd,
 vlBaseCalcCofinsProd, vlCofinsProd, alCofinsProd : String;
begin
 with OpenDialog do
  begin
   FileName   :=  '';
   Title      := 'Selecione a NFE';
   DefaultExt := '*-nfe.XML';
   Filter     := 'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|Arquivos TXT (*.TXT)|*.TXT|Todos os Arquivos (*.*)|*.*';
   InitialDir := ACBrNFe.Configuracoes.arquivos.PathSalvar;
  end;
  if OpenDialog.Execute then
   begin
    ACBrNFe.NotasFiscais.Clear;
    ACBrNFe.NotasFiscais.Add;
    NFeRTXT := TNFeRTXT.Create(ACBrNFe.NotasFiscais.Items[0].NFe);
    NFeRTXT.CarregarArquivo(OpenDialog.FileName);
    if NFeRTXT.LerTxt then NFeRTXT.Free
     else
      begin
       NFeRTXT.Free;
       //tenta XML
       ACBrNFe.NotasFiscais.Clear;
       try
        ACBrNFe.NotasFiscais.LoadFromFile(OpenDialog.FileName);
       except
        ShowMessage('Arquivo NFC-e Inválido');
        exit;
       end;
      end;

      for n := 0 to ACBrNFe.NotasFiscais.Count -1 do
       begin
        with ACBrNFe.NotasFiscais.Items[n].NFe do
         begin
          NotaFiscal          := IntToStr(Ide.nNF);
          CFOP                := Ide.natOp;
          CondPagto           := IndpagToStr(Ide.indPag);
          ModeloNF            := IntToStr(Ide.modelo);
          SerieNF             := IntToStr(Ide.serie);
          DtEmissao           := (Ide.dEmi);
          DtEntSai            := (Ide.dSaiEnt);
          CNPJEmitente        := Emit.CNPJCPF;
          InscEstEmitente     := Emit.IE;
          InscEstEmitente     := Emit.IEST;
          InscMunicEmitente   := Emit.IM;
          FoneEmitente        := Emit.EnderEmit.fone;
          CEPEmitente         := IntToStr(Emit.EnderEmit.CEP);
          EnderecoEmitente    := Emit.EnderEmit.xLgr;
          NumeroEndEmitente   := Emit.EnderEmit.nro;
          BairroEmitente      := Emit.EnderEmit.xBairro;
          codMunicipoEmitente := IntToStr(Emit.EnderEmit.cMun);
          NomeMunicipioEmiente:= Emit.EnderEmit.xMun;
          UFEmitente          := Emit.EnderEmit.UF;

          // Dados Destinatário !!
          CNPJDestinario         := Dest.CNPJCPF;
          codMunicipioDestinario := IntToStr(Dest.EnderDest.cMun);
          //
           for I := 0 to Det.Count-1 do
            begin
             with Det.Items[I] do
              begin
               nuItem           := IntToStr(Prod.nItem);
               CodProd          := Prod.cProd;
               codEANProd       := Prod.cEAN;
               NomeProd         := Prod.xProd;
               CodNCMProd       := Prod.NCM;
               CFOPProd         := Prod.CFOP;
               unidadeProd      := Prod.uCom;
               qtdProd          := FloatToStr(Prod.qCom);
               vlUnitProd       := FloatToStr(Prod.vUnCom);
               vlTotProd        := FloatToStr(Prod.vProd);
//               vlFreteProd      := FloatToStr(Prod.vFrete);
//               vlSeguroProd     := FloatToStr(Prod.vSeg);
               vlDescontoProd   := FloatToStr(Prod.vDesc);
               //
                with Imposto do
                 begin
                  with ICMS do
                   begin
                    if CST = cst00 then
                     begin
                      vlBaseCalcICMSProd  := FloatToStr(ICMS.vBC);
                      vlICMSProd          := FloatToStr(ICMS.vICMS);
                      alICMSProd          := FloatToStr(ICMS.pICMS);
                     end
                      else if CST = cst10 then
                       begin
                        vlBaseCalcICMSProd := FloatToStr(ICMS.vBC);
                        vlICMSProd         := FloatToStr(ICMS.vICMS);
                        alICMSProd         := FloatToStr(ICMS.pICMS);
                        //
                        vlBaseCalcSTProd   := FloatToStr(ICMS.vBCST);
                        vlSTICMSProd       := FloatToStr(ICMS.vICMSST);
                        alICMSSTProd       := FloatToStr(ICMS.pICMSST);
                       end
                      else if CST = cst20 then
                       begin
                        vlBaseCalcICMSProd := FloatToStr(ICMS.vBC);
                        vlICMSProd         := FloatToStr(ICMS.vICMS);
                        alICMSProd         := FloatToStr(ICMS.pICMS);
                       end
                      else if CST = cst30 then
                       begin
                        vlBaseCalcSTProd   := FloatToStr(ICMS.vBCST);
                        vlSTICMSProd       := FloatToStr(ICMS.vICMSST);
                        alICMSSTProd       := FloatToStr(ICMS.pICMSST);
                       end

                      else if (CST = cst40) or (CST = cst41) or (CST = cst50) then
                       begin
                        // trvwNFe.Items.AddChild(Node,'orig='    +OrigToStr(ICMS.orig));
                        vlBaseCalcICMSProd := FloatToStr(ICMS.vBC);
                        vlICMSProd         := FloatToStr(ICMS.vICMS);
                        alICMSProd         := FloatToStr(ICMS.pICMS);
                       end
                      else if CST = cst51 then
                         begin
                          vlBaseCalcICMSProd := FloatToStr(ICMS.vBC);
                          vlICMSProd         := FloatToStr(ICMS.vICMS);
                          alICMSProd         := FloatToStr(ICMS.pICMS);
                       end
                      else if CST = cst60 then
                       begin
                        vlBaseCalcSTProd   := FloatToStr(ICMS.vBCST);
                        vlSTICMSProd       := FloatToStr(ICMS.vICMSST);
                        alICMSSTProd       := FloatToStr(ICMS.pICMSST);
                       end
                      else if CST = cst70 then
                       begin
                        vlBaseCalcICMSProd := FloatToStr(ICMS.vBC);
                        vlICMSProd         := FloatToStr(ICMS.vICMS);
                        alICMSProd         := FloatToStr(ICMS.pICMS);
                        //
                        vlBaseCalcSTProd   := FloatToStr(ICMS.vBCST);
                        vlSTICMSProd       := FloatToStr(ICMS.vICMSST);
                        alICMSSTProd       := FloatToStr(ICMS.pICMSST);
                       end
                      else if CST = cst90 then
                       begin
                        vlBaseCalcICMSProd := FloatToStr(ICMS.vBC);
                        vlICMSProd         := FloatToStr(ICMS.vICMS);
                        alICMSProd         := FloatToStr(ICMS.pICMS);
                        //
                        vlBaseCalcSTProd   := FloatToStr(ICMS.vBCST);
                        vlSTICMSProd       := FloatToStr(ICMS.vICMSST);
                        alICMSSTProd       := FloatToStr(ICMS.pICMSST);
                       end;
                   end;

                   if (IPI.vBC > 0) then
                    begin
                      with IPI do
                       begin
                        vlBaseCalcIPIProd  := FloatToStr(IPI.vBC);
                        vlIPIProd          := FloatToStr(IPI.vIPI);
                        alIPIProd          := FloatToStr(IPI.pIPI);
                       end;
                    end;

                   if (II.vBc > 0) then
                    begin
                      with II do
                       begin
                       //
                       end;
                    end;

                   with PIS do
                    begin
                      if (CST = pis01) or (CST = pis02) then
                       begin
                        vlBaseCalcPisProd  := FloatToStr(PIS.vBC);
                        vlPisProd          := FloatToStr(PIS.vPIS);
                        alPisProd          := FloatToStr(PIS.pPIS);
                       end
                      else if CST = pis03 then
                       begin
                       //
                       end
                      else if CST = pis99 then
                       begin
                        //
                       end;
                    end;

                   if (PISST.vBc>0) then
                    begin
                      with PISST do
                       begin
                       //
                       end;
                      end;

                   with COFINS do
                    begin
                      if (CST = cof01) or (CST = cof02)   then
                       begin
                        vlBaseCalcCofinsProd := FloatToStr(COFINS.vBC);
                        vlCofinsProd         := FloatToStr(COFINS.vCOFINS);
                        alCofinsProd         := FloatToStr(COFINS.pCOFINS);
                       end
                      else if CST = cof03 then
                       begin
                        //
                       end
                      else if CST = cof99 then
                       begin
                       //
                       end;
                    end;
                   if(COFINSST.vBC > 0) then
                    begin
                      with COFINSST do
                       begin
                       //
                       end;
                    end;
                 end;
             end;
//            if vlFreteProd           = '' then vlFreteProd            := '0';
            if vlSeguroProd          = '' then vlSeguroProd           := '0';
            if vlOutrosProd          = '' then vlOutrosProd           := '0';
            if vlDescontoProd        = '' then vlDescontoProd         := '0';
            if CSTProd               = '' then CSTProd                := '0000';
            if vlBaseCalcICMSProd    = '' then vlBaseCalcICMSProd     := '0';
            if vlICMSProd            = '' then vlICMSProd             := '0';
            if alICMSProd            = '' then alICMSProd             := '0';
            if vlBaseCalcSTProd      = '' then vlBaseCalcSTProd       := '0';
            if vlSTICMSProd          = '' then vlSTICMSProd           := '0';
            if alICMSSTProd          = '' then alICMSSTProd           := '0';
            if vlBaseCalcICMSRedProd = '' then vlBaseCalcICMSRedProd  := '0';
            if vlICMSRedProd         = '' then vlICMSRedProd          := '0';
            if alICMSRedProd         = '' then alICMSRedProd          := '0';
            if vlBaseCalcIPIProd     = '' then vlBaseCalcIPIProd      := '0';
            if vlIPIProd             = '' then vlIPIProd              := '0';
            if alIPIProd             = '' then alIPIProd              := '0';
            if vlBaseCalcPisProd     = '' then vlBaseCalcPisProd      := '0';
            if vlPisProd             = '' then vlPisProd              := '0';
            if alPisProd             = '' then alPisProd              := '0';
            if vlBaseCalcCofinsProd  = '' then vlBaseCalcCofinsProd   := '0';
            if vlCofinsProd          = '' then vlCofinsProd           := '0';
            if alCofinsProd          = '' then alCofinsProd           := '0';

         {    ListaProdutos.Add(Alinha_Esquerda(nuItem,08)+' '+Alinha_Esquerda(CodProd,08)+' '+AjustaString(codEANProd,40)+' '+AjustaString(NomeProd, 60)+' '+AjustaString(CodNCMProd,40)+' '+
                               AjustaString(CFOPProd,10)+' '+AjustaString(unidadeProd,05)+' '+Alinha_Esquerda(qtdProd,08)+' '+Alinha_Esquerda(vlUnitProd,16)+' '+Alinha_Esquerda(vlTotProd,16)+' '+
                               Alinha_Esquerda(vlFreteProd,16)+' '+Alinha_Esquerda(vlSeguroProd,16)+' '+Alinha_Esquerda(vlDescontoProd,16)+' '+Alinha_Esquerda(vlOutrosProd,16)+' '+Alinha_Esquerda(vlBaseCalcICMSProd,16)+' '+
                               Alinha_Esquerda(vlICMSProd,16)+' '+Alinha_Esquerda(alICMSProd,16)+' '+Alinha_Esquerda(vlBaseCalcSTProd,16)+' '+Alinha_Esquerda(vlSTICMSProd,16)+' '+Alinha_Esquerda(alICMSSTProd,16)+' '+
                               Alinha_Esquerda(vlBaseCalcIPIProd,16)+' '+Alinha_Esquerda(vlIPIProd,16)+' '+Alinha_Esquerda(alIPIProd,16)+' '+Alinha_Esquerda(vlBaseCalcPisProd,16)+' '+Alinha_Esquerda(vlIPIProd,16)+' '+
                               Alinha_Esquerda(alPisProd,16)+' '+Alinha_Esquerda(vlBaseCalcCofinsProd,16)+' '+Alinha_Esquerda(vlCofinsProd,16)+' '+Alinha_Esquerda(alCofinsProd,16));
          }end;
       VlBaseCalculo    := FloatToStr(Total.ICMSTot.vBC);
       VlICMS           := FloatToStr(Total.ICMSTot.vICMS);
       VlBaseCalculoST  := FloatToStr(Total.ICMSTot.vBCST);
       VlST             := FloatToStr(Total.ICMSTot.vST);
       VlProduto        := FloatToStr(Total.ICMSTot.vProd);
       VlFrete          := FloatToStr(Total.ICMSTot.vFrete);
       VlSeguro         := FloatToStr(Total.ICMSTot.vSeg);
       VlDesconto       := FloatToStr(Total.ICMSTot.vDesc);
       VlIPI            := FloatToStr(Total.ICMSTot.vIPI);
       VlPis            := FloatToStr(Total.ICMSTot.vPIS);
       VlCofins         := FloatToStr(Total.ICMSTot.vCOFINS);
       VlOutros         := FloatToStr(Total.ICMSTot.vOutro);
       VlNotaFiscal     := FloatToStr(Total.ICMSTot.vNF);
     end;
     end;
  end;
end;


function downloadXML(const chave, cnpj1, caminhoControlWBarra : String; const copiar : boolean = true) : boolean;
begin
  LerConfiguracaoNFe();
  acbrnfe.Configuracoes.Geral.Salvar := true;
  ACBrNFe.EventoNFe.Evento.Clear;
  with ACBrNFe.EventoNFe.Evento.Add do
    begin
      infEvento.chNFe    := chave;
      infEvento.CNPJ     := cnpj1;
      infEvento.dhEvento := now;
      infEvento.tpEvento := teManifDestCiencia;
      InfEvento.cOrgao := 91;
    end;

  ACBrNFe.EnviarEvento(0);
  if not ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.cStat > 200 then
    begin
      MessageDlg('Evento - Não foi possível fazer o Download do XML:' + #13 + 'Motivo: ' + ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.xMotivo, mtError, [mbOK], 0);
      exit;
    end
  else
    begin
      MessageDlg('Evento Processado' + #13 + 'Motivo: ' + ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.xMotivo + #13 + 'Cstat: ' + IntToStr(
      ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento[0].RetInfEvento.cStat), mtError, [mbOK], 0);
    end;

  ACBrNFe.DownloadNFe.Download.Chaves.Clear;
  ACBrNFe.DownloadNFe.Download.Chaves.Add.chNFe := chave;
  ACBrNFe.DownloadNFe.Download.CNPJ := cnpj1;

  if not ACBrNFe.WebServices.DownloadNFe.Executar then
    begin
      MessageDlg('NFe - Não foi possível fazer o Download do XML:' + #13 + #13 + 'Motivo: ' + ACBrNFe.WebServices.DownloadNFe.retDownloadNFe.xMotivo, mtError, [mbOK], 0);
      exit;
    end;

  if copiar then CopyFile(pchar(caminhoControlWBarra + 'NFE\RESP\' + ACBrNFe.WebServices.DownloadNFe.ArqResp), pchar(caminhoControlWBarra + 'ENTRADAXML\' + ACBrNFe.WebServices.DownloadNFe.ArqResp), TRUE);
  ShowMessage('Download Efetuado com Sucesso');
  acbrnfe.Configuracoes.Geral.Salvar := false;
end;

function validaDadosDestinatario() : String;
var
  tipo : String;
  OK   : boolean;
  INVALIDO : integer;
begin
  result := '';

  if Length(dadosDest.Values['cnpj']) = 11 then tipo := '1'
    else if Length(dadosDest.Values['cnpj']) = 14 then tipo := '2'
    else
      begin
        dadosDest.Values['cod']     := '';
        Result := Result + 'CPF/CNPJ Inválidos.';
      end;
  tipo := Trim(tipo);
  IF (TIPO = '1') OR (TIPO = '6') then
    begin
      //OK := VALIDACPF(dadosDest.Values['cnpj']);
      if TIPO = '1' then dadosDest.Values['ies'] := '';
    end
  ELSE
    begin
      //OK := VALIDACNPJ(dadosDest.Values['cnpj']);
    end;

  //SE O CODIGO DO MUNICIPIO ESTA EM BRANCO, USA O CODIGO DO MUNICIPIO DO EMITENTE
  IF (dadosDest.Values['cod_mun'] = '') then dadosDest.Values['cod_mun'] := dadosEmitente.Values['cod_mun'];

  INVALIDO := 0;

  IF NOT OK then
    begin
      Result := Result + ' CPF/CNPJ do Destinatário Inválido ' + #13;
      INVALIDO := INVALIDO + 1;
    end;
    
  if CAMPO_VAZIO(dadosDest.Values['ende']) = 1 then
    begin
      Result := Result + 'Endereço Inválido ' + #13;
      INVALIDO := INVALIDO + 1;
    end;

  if CAMPO_VAZIO(dadosDest.Values['bairro']) = 1 then
    begin
      Result := Result + 'Bairro Inválido ' + #13;
      INVALIDO := INVALIDO + 1;
    end;

  if CAMPO_VAZIO(dadosDest.Values['cod_mun']) = 1 then
    begin
      Result := Result + 'Código do Municipio Inválido ' + #13;
      INVALIDO := INVALIDO + 1;
    end;

  if CAMPO_VAZIO(dadosDest.Values['cid']) = 1 then
    begin
      Result := Result + 'Nome do Municipio Inválido ' + #13;
      INVALIDO := INVALIDO + 1;
    end;

  if CAMPO_VAZIO(dadosDest.Values['est']) = 1 then
    begin
      Result := Result + 'Estado Inválido ' + #13;
      INVALIDO := INVALIDO + 1;
    end;

  if CAMPO_VAZIO(dadosDest.Values['cep']) = 1 then
    begin
      Result := Result + 'Cep Inválido ' + #13;
      INVALIDO := INVALIDO + 1;
    end;

  IF INVALIDO <> 0 then Result := ' Dados do Cliente Incompletos ' + #13 + Result;
end;

FUNCTION CAMPO_VAZIO(ENT : STRING) : Smallint;
BEGIN
  IF LENGTH(trim(ENT)) = 0 THEN Result := 1
    ELSE RESULT := 0;
END;


function buscaPastaConfigControlRede() : String;
var
  arq1 : TStringList;
begin
  //PASTA_CONTROL_NFE
  Result := '';
  arq1 := TStringList.Create;
  if FileExists(ExtractFileDir(ParamStr(0)) + '\CONFIG.DAT') then
    begin
      arq1.Free;
      exit;
    end;

  arq1.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\CONFIG.DAT');
  Result := arq1.Values['PASTA_CONTROL_NFE'];
  arq1.Free;
end;

function substitui_Nodo(nome:string; conteudo : string; const texto :string) : String;
var
  ini, fim : integer;
  come, final : String;
begin
  ini := 0;
  fim := 0;
  ini := pos('<'+nome+'>',texto) + length('<'+nome+'>');
  fim := pos('</'+nome+'>',texto);
  //fim := fim + length('</'+nome+'>') + 1;
  Result := '' ;

  //Result := copy(texto, 1, ini) + conteudo  + Result := copy(texto, fim, length(texto));
//  Result := copy(texto,ini,fim );
end;


function getSerieNFCe() : String;
begin
  Result := IntToStr(serie2);
end;

function buscaCRCdaChave(const chve : string) : String;
begin
  Result := '';
  Result := copy(chve, 26, 9); //nNF
  Result := RightStr(Result, 7);
  Result := Result + RightStr(copy(chve, 23, 3), 2); //serie

end;

function ArredondaFinanceiro(Value: Currency; Decimals: integer): Currency;
var
  Factor, Fraction: Currency;
begin
  Factor := IntPower(10, Decimals);
  Value := StrToFloat(FloatToStr(Value * Factor));
  Result := Int(Value);
  Fraction := Frac(Value);
  if Fraction >= 0.5 then
    Result := Result + 1
  else if Fraction <= -0.5 then
    Result := Result - 1;
  Result := Result / Factor;
end;

function Arredonda( valor:currency; decimais:integer; tipo : string = '') : currency;
begin
   Result := ArredondaFinanceiro(valor,decimais);
end;

function reenviarCupom(nota22 : String; var stats : String) : boolean;
var
 n1, ssChave : string;
begin
  query1.Close;
  query1.SQL.Text := 'select chave, adic from nfce where (nota = :nota)';
  query1.ParamByName('nota').AsString := nota22;
  query1.Open;

  if query1.FieldByName('adic').AsString = '' then
    begin
      query1.Close;
      exit;
    end;

  ACBrNFe.NotasFiscais.Clear;
  if FileExists(pastaControlW + 'NFCe\EMIT\' +query1.fieldbyname('chave').AsString + '-nfe.xml') then
    begin
      ACBrNFe.NotasFiscais.LoadFromFile(pastaControlW + 'NFCe\EMIT\' +query1.fieldbyname('chave').AsString + '-nfe.xml');
      n1 := IntToStr(ACBrNFe.NotasFiscais[0].NFe.Ide.nNF);
      ACBrNFe.NotasFiscais.Clear;
    end
  else n1 := '';
  query1.Close;

  GerarNFCe(nota22, '0', '', serie, N1, '');
  try
    ACBrNFe.Enviar(0,false);
  except
    on e:exception do
      begin
        stats := e.Message;
        exit;
      end;
  end;

  ssChave := ACBrNFe.WebServices.Retorno.ChaveNFe;
  if ACBrNFe.WebServices.Retorno.cStat <= 200 then
    begin
      Result := true;
      stats := 'OK';
      venda.chave := ssChave;
      if ACBrNFe.WebServices.Retorno.cStat = 100 then venda.adic := '';
      insereNotaBD(venda);
    end;
end;

procedure geraPgerais(var lis : TStringList);
begin
  if query1.Database.Connected = false then exit;
  query1.Close;
  query1.SQL.Clear;
  query1.sql.Add('select * from pgerais order by cod');
  query1.Open;
  query1.First;
  lis := tstringlist.Create;
  while not query1.Eof do
    begin
      lis.Add(query1.fieldbyname('cod').AsString + '=' +query1.fieldbyname('valor').AsString);
      query1.Next;
    end;

  query1.Close;  
end;


function inutilizacaoNFCE(ini, fim, modelo : integer; just : String) : boolean;
var
  cnpj : String;
  _serie : integer;
begin
  carregaConfigsNFCe;
  query1.Close;
  query1.SQL.Text := 'select cnpj from registro';
  query1.Open;

  cnpj := strnum(query1.fieldbyname('cnpj').AsString);

  _serie := StrToIntDef(getSerieNFCe, 1);

  try
    ACBrNFe.Configuracoes.WebServices.Visualizar  := true;
    ACBrNFe.WebServices.Inutiliza(cnpj, just, StrToIntDef(FormatDateTime('yyyy', now), 2015), modelo, _serie, ini, fim);
    ACBrNFe.Configuracoes.WebServices.Visualizar  := false;
  except
    on e:exception do
       begin
         ShowMessage(e.Message);
       end;
  end;
end;

function verCSTcFOP(cfop : String) : String;
begin
  query1.Close;
  query1.SQL.Text := 'select * from cod_op where cod = :cod';
  query1.ParamByName('cod').AsString := strnum(cfop);
  query1.Open;
                                                                      
  if not query1.IsEmpty then
    begin
      cstIcmCfop := query1.fieldbyname('icms').AsString;
      cstpisCfop := query1.fieldbyname('pis').AsString;
    end
  else
    begin
      cstIcmCfop := '';
      cstpisCfop := '';
    end;
end;

procedure gravaERRO_LOG(caminho1, erro2, local1 : String);
var
F : TextFile;
S, temp, caminho : String;
I : Integer;
begin
Try
  if caminho1 = '' then caminho1 := ExtractFileDir(ParamStr(0)) + '\ERRONFE.txt';

  temp := erro2;
  //S := (DateTimeToStr(Now)+' '+NomeDoUsuario+': '+S);
  AssignFile(F,Caminho1);
  If FileExists(Caminho1) Then
    Append(F){}
  Else
  Rewrite(F);{if}
  temp :=       '----------------------------------------------------------------'+ #13+#10;
  temp := temp + 'Chave:    '+ ACBrNFe.NotasFiscais[0].NFe.infNFe.ID + #13 + #10;
  temp := temp + 'nNF:      '+ IntToStr(ACBrNFe.NotasFiscais[0].NFe.Ide.nNF) + #13 + #10;
  temp := temp + 'cNF:      '+ IntToStr(ACBrNFe.NotasFiscais[0].NFe.Ide.cNF) + #13 + #10;
  temp := temp + 'Processo: '+ local1 + #13 + #10;
  temp := temp + 'data:     '+ FormatDateTime('dd/mm/yy',now) + ' ' + FormatDateTime('tt',now) + #13 + #10;
  temp := temp + 'Erro: ' + erro2 + #13 + #10;
  temp := temp + '---------------------------------------------------------------'+ #13+#10;
  Writeln(F,temp);
  CloseFile(F);
  Except
    Abort;
  End;{try}
end;{procedure}


procedure gravaERRO_LOG1(caminho1, erro2, local1 : String);
var
  F : TextFile;
  S, temp, caminho : String;
  I : Integer;
  arq : TStringList;
begin
Try
  if caminho1 = '' then caminho1 := ExtractFileDir(ParamStr(0)) + '\ERRONFE.txt';
  arq := TStringList.Create;

  if FileExists(caminho1) then arq.LoadFromFile(caminho1);
  temp := erro2;

  {temp :=       '----------------------------------------------------------------'+ #13+#10;
  temp := temp + 'Chave:    '+ ACBrNFe.NotasFiscais[0].NFe.infNFe.ID + #13 + #10;
  temp := temp + 'nNF:      '+ IntToStr(ACBrNFe.NotasFiscais[0].NFe.Ide.nNF) + #13 + #10;
  temp := temp + 'cNF:      '+ IntToStr(ACBrNFe.NotasFiscais[0].NFe.Ide.cNF) + #13 + #10;
  temp := temp + 'Processo: '+ local1 + #13 + #10;
  temp := temp + 'data:     '+ FormatDateTime('dd/mm/yy',now) + ' ' + FormatDateTime('tt',now) + #13 + #10;
  temp := temp + 'Erro: ' + erro2 + #13 + #10;
  temp := temp + '---------------------------------------------------------------'+ #13+#10;}

  arq.Add(temp);
  arq.SaveToFile(caminho1);
  arq.Free;
  Except
  End;{try}
end;{procedure}


function getUltimoNumero() : String;
var
  ini, ret : integer;
begin
  Result := '1';

  query1.Close;
  query1.SQL.Text := 'select max(cast(substring(chave from 26 for 9) as integer)) as ord from nfce';
  query1.Open;

  if query1.isempty then
    begin
      query1.Close;
      exit;
    end;

  result := Query1.FieldByName('ord').AsString;
  query1.Close;
end;

function getNumeroValido() : String;
var
  ini, ret : integer;
begin
  Result := '1';

  query1.Close;
  query1.SQL.Text := 'select substring(chave from 26 for 9) as ord from nfce order by ord';
  query1.Open;

  if query1.isempty then
    begin
      query1.Close;
      exit;
    end;

  ini := 0;
  result := '';
  while not Query1.Eof do
    begin
      while true do
        begin
          if Query1.Eof then break;
          ini := ini + 1;
          if ini <> Query1.FieldByName('ord').AsInteger then
            begin
              Result := IntToStr(ini);
              exit;
            end
          else break;
        end;

      ret := Query1.FieldByName('ord').AsInteger;
      Query1.Next;
    end;

   ret := ret + 1;
   Result := IntToStr(ret);
   query1.Close;
end;

FUNCTION VE_IMPOSTO(_PC, _PV, _qtd : currency) : currency;
var
  PERC, LUC, APLICA_PERC : currency;
begin
  _PC := _PC * _qtd;
  _PV := _PV * _qtd;

  PERC   := StrToCurrDef(pgerais.Values['40'], 100);
  Result := 0;

  //LIMITA OS PERCENTUAIS
  PERC := IfThen(PERC <= 5, 40, PERC);
  PERC := IfThen(PERC >= 500, 70, PERC);

  //SE APLICA O PERCENTUAL SOBRE O LUCRO BRUTO OU SOBRE PRE? DE VENDA
  //APLICA_PERC := VAL(SUBSTR(CONFIG1, 162, 1))
  if _PV - _PC = 0 then
    begin
      Result := (_PV * PERC) / 100;
      exit;
    end;

  Result := (((_PV - _PC) * _qtd) * (PERC / 100));
end;

function GRAVA_NODO_PROT_NFE1(ARQ_caminho : string) : string;
var
  texto, NODO_PROT, cStat, nNF, Chave1, digVal: string;
  retorno : TStringList;
  txt1 : AnsiString;
begin
  cStat := '';
  Result := '';
  NODO_PROT := '';
  retorno := TStringList.Create;

  if not FileExists(ARQ_caminho) then
    begin
      exit;
    end;

  retorno.LoadFromFile(ARQ_caminho);
  Result := retorno.GetText;

  cStat := IntToStr(ACBrNFe.WebServices.Retorno.cStat);
  cStat := trim(cStat);
  //if funcoes.Contido(cStat, '101-135') then cStat := '101';

  //dadosEmitente.LoadFromFile(ARQ_caminho);
  RETORNO.Values['DhRecbto'] := FormatDateTime('yyyy-mm-dd', now);

  //retorno.Text := copy(ACBrNFe.WebServices.Retorno.RetWS, pos('<protNFe versao=', ACBrNFe.WebServices.Retorno.RetWS), pos('</protNFe>', ACBrNFe.WebServices.Retorno.RetWS) );
  NODO_PROT := copy(ACBrNFe.WebServices.Retorno.RetWS, pos('<protNFe versao=', ACBrNFe.WebServices.Retorno.RetWS), length(ACBrNFe.WebServices.Retorno.RetWS) );
  NODO_PROT := LeftStr(NODO_PROT, pos('</protNFe>', NODO_PROT) + 9);

  if Contido('<protNFe', Result) then
    begin
      Result := copy(Result, 1, pos('<protNFe',Result) - 1);
    end
  else
    begin
      Result := copy(Result, 1, pos('</NFe>',Result) - 1);
    end;

  if Result[Length(Result)] <> '>' then Result :=  Result + '>';
  Result := Result + NODO_PROT + '</nfeProc>';

  retorno.Text := Result;
  retorno.SaveToFile(ARQ_caminho);

  retorno.Free;
end;

function calculaVlrAproxImpostos(var lista1 : TList) : currency;
var
  ex, descricao: String;
  tabela: Integer;
  aliqFedNac, aliqFedImp, aliqEst, aliqMun: double;
  ini  : integer;
  item : Item_venda1;
  arqExiste : Smallint;
begin
  Result := 0;
  arqExiste := 0;


  if FileExists(ExtractFileDir(ParamStr(0)) + '\IBPT.csv') then
    begin
      ACBrIBPTax1.AbrirTabela(ExtractFileDir(ParamStr(0)) + '\IBPT.csv');
    end;

  for ini := 0 to lista1.count -1 do
   begin
     item := lista1.Items[ini];

     query2.Close;
     query2.SQL.Text := 'select p_venda, p_compra, classif from produto where cod = :cod';
     query2.ParamByName('cod').AsInteger := item.cod;
     query2.Open;

     item.p_venda  := query2.fieldbyname('p_venda').AsCurrency;
     item.p_compra := query2.fieldbyname('p_compra').AsCurrency;
     item.quant := abs(item.quant);
     query2.Close;

     if ACBrIBPTax1.Procurar(item.Ncm,ex, descricao, tabela, aliqFedNac, aliqFedImp, aliqEst, aliqMun, true) then
       begin
         item.vlr_imposto := ArredondaTrunca((abs(item.total) - abs(item.Desconto)) * (aliqFedNac + aliqEst) / 100, 2);
         Result := Result + item.vlr_imposto;
         //ShowMessage('imp=' + CurrToStr(item.vlr_imposto) + #13 + 'aliq=' + CurrToStr(aliqFedNac + aliqEst) + #13 + 'Result=' +  CurrToStr(Result));
       end
     else
       begin
         ACBrIBPTax1.Procurar('96089989',ex, descricao, tabela, aliqFedNac, aliqFedImp, aliqEst, aliqMun, true);
         item.vlr_imposto := ArredondaTrunca((abs(item.total) - abs(item.Desconto)) * (aliqFedNac + aliqEst) / 100, 2);
         Result := Result + item.vlr_imposto;
         
         {item.vlr_imposto := VE_IMPOSTO(item.p_compra, item.p_venda, item.quant);
         Result := Result + item.vlr_imposto;}
         {ShowMessage('imp=' + CurrToStr(item.vlr_imposto) +
         #13 + 'p_venda='+ CurrToStr(item.p_venda) + #13 + 'p_comra=' + CurrToStr(item.p_compra) +
          #13 + 'Result=' +  CurrToStr(Result));}
       end;
   end;

end;

function ArredondaTrunca(Value: Extended;decimais:integer): Extended;
begin
  if decimais = 2 then Result := trunc(value * 100)/100
     else Result := trunc(value * 1000)/1000;
end;

FUNCTION GerarNFCeTexto(const nota : String; cliente : String; nnf : String = '') : AnsiString;
begin
  PIS_ST := 0;
  PIS_NT := 0;
  COFINS_ST := 0;
  cod_OP := '5102';

  lerItensDaVenda(lista, nota);
  LerDados_Emit_Dest(cliente, nnf);

  Result := NODO_RAIZ(NOTA);
end;

FUNCTION GerarNFCeTextoCliente(const nota : String; var cliente : TStringList; nnf : String = '') : AnsiString;
begin
  PIS_ST := 0;
  PIS_NT := 0;
  COFINS_ST := 0;
  cod_OP := '5102';

  lerItensDaVenda(lista, nota);
  LerDados_Emit_Dest1(cliente, nnf);

  Result := NODO_RAIZ(NOTA);
end;


FUNCTION NODO_RAIZ(NOTA : STRING) : string;
begin
  Result := '<?xml version="1.0" encoding="UTF-8"?><nfeProc versao="3.10" xmlns="http://www.portalfiscal.inf.br/nfe">' + trim(NODO_NFE(NOTA))  +  '</nfeProc>';
end;

FUNCTION NODO_NFE(NOTA : STRING) : string;
begin
  Result := '<NFe xmlns="http://www.portalfiscal.inf.br/nfe">' + trim(NODO_INFNFE(GeraChaveNf(NOTA), NOTA)) + '</NFe>';
end;

FUNCTION NODO_INFNFE(CHAVENF, NOTA : string) : string;
var
  dest_ies : string;
  parcelamento : TList;
begin
  Result := '<infNFe versao="3.10" Id="NFe' + trim(CHAVENF) +'">' +
  NODO_IDE(NOTA,'14',dadosEmitente.Values['nf'], '1', CDCFOP,'0', FormataData(NOW),'1','1400100', DigiVerifi) +
  NODO_EMIT(dadosEmitente.Values['cnpj'],dadosEmitente.Values['razao'],dadosEmitente.Values['empresa'],dadosEmitente.Values['ende'],dadosEmitente.Values['bairro'],dadosEmitente.Values['cod_mun'],dadosEmitente.Values['cid'],dadosEmitente.Values['est'],StrNum(dadosEmitente.Values['cep']),dadosEmitente.Values['telres'],dadosEmitente.Values['ies'], pgerais.Values['10']) +
  NODO_DEST(dadosDest.Values['tipo'],dadosDest.Values['cnpj'],dadosDest.Values['cnpj'],dadosDest.Values['nome'],dadosDest.Values['ende'],dadosDest.Values['bairro'],dadosDest.Values['cod_mun'],dadosDest.Values['cid'],dadosDest.Values['est'],dadosDest.Values['cep'], dadosDest.Values['telres'], dadosDest.Values['ies'], dadosEmitente.Values['cod_mun']) +
  NODO_ITENS(lista, CDCFOP,'','','', '0') +
  NODO_TOTAL(totalNota,TOT_BASEICM,TOTICM,TOT_PIS,TOT_COFINS,0,totDesc)+
  NODO_TRANP() +
  nodo_pag() +
  NODO_INFADIC(infAdic,PIS_NT,PIS_ST,COFINS_ST,0) +
  '</infNFe>';
end;

FUNCTION NODO_IDE(NOTA,UF, NUM_NF, FIN_NFE,  COD_CFOP, EXT_CFOP, DAT, FORMPAG, COD_MUNIC, DV_NF : string; OFFLine : boolean = false) : string;
var
  TIPO_AMB, idDest, partContigencia : string;
begin
  if ACBrNFe.Configuracoes.WebServices.Ambiente = taproducao then  TIPO_AMB := '1'
   else TIPO_AMB := '2';
  if StrNum(CDCFOP) = '0' then COD_CFOP := '5102';
  idDest := '1' ;
  if tpEmis = '' then tpEmis := '1';
  partContigencia := '';
  dHAtual := getDataHoraAtualXML;

  if contOFFLINE then
    begin
      tpEmis := '9';
      partContigencia := '<dhCont>'+ dHAtual +'</dhCont>' + '<xJust>NOTA FISCAL EMITIDA EM CONTINGENCIA</xJust>';
    end;

  Result := '<ide><cUF>' + UF + '</cUF><cNF>' + CompletaOuRepete('',nota,'0',8) + '</cNF><natOp>VENDA AO CONSUMIDOR</natOp>' +
  '<indPag>' + IfThen(FORMPAG = '1', '0', '1')   + '</indPag><mod>65</mod><serie>'+getSerieNFCe+'</serie><nNF>' +
  NUM_NF + '</nNF><dhEmi>' + dHAtual +'</dhEmi>' +
  '<tpNF>'+ IfThen(Contido(COD_CFOP[1], '567'), '1', '0') +'</tpNF><idDest>'+ idDest +'</idDest><cMunFG>' + COD_MUNIC + '</cMunFG>' + '<tpImp>4</tpImp><tpEmis>'+ tpEmis +'</tpEmis><cDV>' + DV_NF +
  '</cDV><tpAmb>' + TIPO_AMB + '</tpAmb><finNFe>' +
  FIN_NFE + '</finNFe><indFinal>1</indFinal><indPres>1</indPres><procEmi>0</procEmi><verProc>ControlW Versao 1</verProc>'+ partContigencia +'</ide>';
  Result := trim(Result);
end;


function GeraChaveNf(NOTA :STRING) : string;
var seq : string;
i : integer;
total,dv : currency;
begin
  if contOFFLINE then
    begin
      tpEmis := '9';
    end;

    Result := '';
    result := IntToStr(14);                                                //cod uf tamanho 02
    Result := Result + FormatDateTime('yymm',NOW);                          //ano e mes de emissao tamanho 04
    Result := Result + dadosEmitente.Values['cnpj'];                        //cnpj do emitente tamanho 14
    Result := Result + '65';                                                // modelo da nf 02
    Result := Result + strzero(getSerieNFCe, 3);//'001';                    //serie 03
    Result := Result + CompletaOuRepete('', IntToStr(codNF),'0',9); //numero nota fiscal 09
    Result := Result + tpEmis;                                              // forma de emissao
    Result := Result + CompletaOuRepete('',nota,'0',8);            //nota de venda
    seq := '';
    seq := '432' + CompletaOuRepete('','','98765432',5);
    total := 0;

    for i := 1 to length(result) do
      begin
        try
          total := total + StrToCurr(seq[i]) * StrToCurr(Result[i]) ;
        except
          result := '*';
          exit;
        end;
      end;

    i := (trunc(total) mod 11);
    i := 11 - i;
    if i > 9 then i := 0;
    DigiVerifi := IntToStr(i);
    Result := Result + intToStr(i);
    //Result := 'NFe' + Result;
    chaveNF := Result;
end;

FUNCTION NODO_ITENS(var lista : tlist; CFOP, POS, CSTICM_CFP, CSTPIS_CFP, _ORIGE : string) : string;
var
  barras, CFOP1 : string;
  cont,i, qtd : integer;
  item : Item_venda;
begin
  CSTPIS_CFP := pgerais.Values['10'];
  Result := '';
  qtd := 0;
  cont := lista.Count -1;
  for i := 0 to cont do
    begin
      CFOP1 := '5102';
      qtd := qtd + 1;
      item := Lista.Items[i];

      if (ACBrNFe.Configuracoes.WebServices.Ambiente = taHomologacao) and (i = 0) then
        begin
          item.nome := 'NOTA FISCAL EMITIDA EM AMBIENTE DE HOMOLOGAÇÃO – SEM VALOR FISCAL';
        end;

      barras := item.codbar;
      if item.CodAliq = 10 then
        begin
          CFOP1 := '5405';
        end;

      if length(barras) <> 13 then barras := '';
      Result := Result + '<det nItem="' + IntToStr(qtd) + '"><prod>' +
      '<cProd>' + strzero(IntToStr(item.cod), 6) + '</cProd><cEAN>' + barras + '</cEAN>' +
      '<xProd>' + trim(item.nome) + '</xProd><NCM>' + item.Ncm + '</NCM><CFOP>' + CFOP1 + '</CFOP>' +
      '<uCom>' + item.unid + '</uCom><qCom>' + FormatCurr('0.0000',item.quant) + '</qCom><vUnCom>' +
      FormatCurr('0.000000',item.p_venda) + '</vUnCom><vProd>' + FORMAT_NUM(item.total) + '</vProd><cEANTrib></cEANTrib>' +
      '<uTrib>' + item.unid + '</uTrib><qTrib>' + FormatCurr('0.0000',item.quant) + '</qTrib><vUnTrib>' +
      FormatCurr('0.000000',item.p_venda) + '</vUnTrib>'+ '<vFrete>'+ Format_num(item.Vlr_Frete) +'</vFrete>' + IfThen(item.Desconto = 0,'<vDesc>0.00</vDesc>','<vDesc>' + FORMAT_NUM(item.Desconto) + '</vDesc>') +
      '<indTot>1</indTot></prod><imposto>' + NODO_ICMS1(item, cstIcmCfop, _ORIGE) + NODO_PISCOFINS1(item, cstpisCfop) + '</imposto></det>'; //NODO_PISCOFINS(MAT, CSTPIS_CFP)
    end;
end;

FUNCTION NODO_TOTAL(TOTNOTA, TOT_BASEICM, TOT_ICM, TOT_PIS, TOT_COFINS, TOTDESCICM, TOTDESC : currency) : string;
begin
  TOTDESCICM := 0;
  Result := '<total><ICMSTot><vBC>' + FORMAT_NUM(TOT_BASEICM) + '</vBC><vICMS>' + FORMAT_NUM(TOT_ICM) +
  '</vICMS><vBCST>0.00</vBCST><vST>0.00</vST><vProd>' + FORMAT_NUM(TOTNOTA) +
  '</vProd><vFrete>0.00</vFrete><vSeg>0.00</vSeg><vDesc>' + FORMAT_NUM(TOTDESCICM + TOTDESC) + '</vDesc>' +
  '<vII>0.00</vII><vIPI>0.00</vIPI><vPIS>' + FORMAT_NUM(TOT_PIS) + '</vPIS><vCOFINS>' +
  FORMAT_NUM(TOT_COFINS) + '</vCOFINS><vOutro>0.00</vOutro><vNF>' + FORMAT_NUM(TOTNOTA - TOTDESC) +
  '</vNF></ICMSTot></total>';

  try
    //danfe.vTroco := vlRecebido - (TOTNOTA - TOTDESc);
  except
  end;  
  //ShowMessage(CurrToStr(TOTNOTA) + #13 + CurrToStr(TOTDESCICM) + #13 + CurrToStr(totDesc));
end;

FUNCTION NODO_INFADIC(INFO : string; PIS_NT, PIS_ST, COFINS_ST, _CFOP : currency) : String;
var OBS : string;
begin
  OBS := '';
  {//PEGA MENSAGENS DO CFOP, SE TIVEREM
  IF(length(OBS) <> 0) then OBS := OBS + #10;
  IF(PIS_NT <> 0) then      OBS := OBS + 'Total de mercadorias nao tributadas por PIS/COFINS: ' + FormatCurr('#,###,###0.00',PIS_NT) + ';';
  IF(PIS_ST <> 0) then      OBS := OBS + ' Total de PIS retido anteriormente por ST: ' + FormatCurr('#,###,###0.00',PIS_ST) + ';';
  IF(COFINS_ST <> 0) then   OBS := OBS + ' Total de COFINS retida anteriormente por ST: ' + FormatCurr('#,###,###0.00',COFINS_ST) + ';';
  IF(TOT_PIS <> 0) then     OBS := OBS + ' PIS recolher: ' + FormatCurr('#,###,###0.00',TOT_PIS) + ';';
  IF(TOT_COFINS <> 0) then  OBS := OBS + ' COFINS a recolher: ' + FormatCurr('#,###,###0.00',TOT_COFINS) + ';';}

  totImp := calculaVlrAproxImpostos(lista);
  OBS := OBS + 'Valor aprox. Impostos: '+ formataCurrency(totImp) +'('+ formataCurrency(totImp / (totalNota - totDesc) * 100) +'%) Fonte: IBPT ' + ';';
  IF INFO <> '' THEN INFO := INFO + ';';
  OBS := OBS + ' ' + (INFO);
  obs := obs2 + obs;
  Result := '';
  Result := '<infAdic><infCpl>' + OBS + '</infCpl></infAdic>';
end;

FUNCTION NODO_ICMS1(var MAT : Item_venda; CSTICM_CFOP, _ORIGE : string) : string;
var tot : currency;
begin
  tot := mat.total - mat.Desconto;
  Result := '';
  //se a empresa é optante do simples nacional
  if pgerais.Values['10'] = '1' then
    begin
      //EXPORTAÇÃO - CSOSN = 300
      IF Contido(LeftStr(cod_OP, 1), '4-7') then
        begin
          Result := '<ICMS><ICMSSN102><orig>' + _ORIGE + '</orig><CSOSN>300</CSOSN></ICMSSN102></ICMS>';
          exit;
        end;


      if mat.CodAliq = 10 then
        begin
          Result := '<ICMS><ICMSSN500><orig>' + _ORIGE + '</orig><CSOSN>500</CSOSN>' +
          '<vBCSTRet>' + FormatCurr('0.00',mat.p_compra) + '</vBCSTRet>' +
          '<vICMSSTRet>' + FormatCurr('0.00',ARREDONDA(mat.p_compra * 0.16, 2)) + '</vICMSSTRet>' +
          '</ICMSSN500></ICMS>';
          exit;
        end;

      if mat.CodAliq = 11 then
        begin
          Result := '<ICMS><ICMSSN102><orig>' + _ORIGE + '</orig><CSOSN>400</CSOSN></ICMSSN102></ICMS>';
          exit;
        end;

      if mat.CodAliq = 12 then
        begin
          Result := '<ICMS><ICMSSN102><orig>' + _ORIGE + '</orig><CSOSN>300</CSOSN></ICMSSN102></ICMS>';
          exit;
        end;

      if mat.Reducao <> 0 then
        begin
          Result := '<ICMSSN900><orig>' + _ORIGE + '</orig><CSOSN>900</CSOSN><modBC>3</modBC>' +
          '<vBC>' + FORMAT_NUM(ARREDONDA(tot * mat.Reducao / 100, 2)) + '</vBC>' +
          '<pRedBC>' + FORMAT_NUM(mat.Reducao) + '</pRedBC>' +
          '<pICMS>' + FORMAT_NUM(mat.p_venda) + '</pICMS>' +
          '<vICMS>' + FORMAT_NUM(0) + '</vICMS>' +
          '<modBCST>0.00</modBCST><vBCST>0.00</vBCST>' +
          '<pICMSST>0.00</pICMSST><vICMSST>0.00</vICMSST>' +
          '<pCredSN>0.00</pCredSN><vCredICMSSN>0.00</vCredICMSSN>' +
          '</ICMSSN900>' ;
          exit;
        end;
      //TRIBUTACAO NORMAL PELO SIMPLES NACIONAL
      Result := '<ICMS><ICMSSN102><orig>' + _ORIGE + '</orig><CSOSN>102</CSOSN></ICMSSN102></ICMS>';
      exit;
    end;

  //EXPORTAÇÃO - CST = 41
  IF Contido(LeftStr(cod_OP, 1), '4-7') then
    begin
      Result := '<ICMS><ICMS40><orig>' + _ORIGE + '</orig><CST>41</CST></ICMS40></ICMS>';
      exit;
    end;

  //CFOP SUBSTITUICAO TRIBUTARIA
  IF CSTICM_CFOP = 'S' then
    begin
      Result := '<ICMS><ICMS60><orig>' + _ORIGE + '</orig><CST>60</CST>' +
      '<vBCSTRet>' + FORMAT_NUM(mat.Total_Preco_Compra) + '</vBCSTRet>' +
      '<vICMSSTRet>' + FORMAT_NUM(Arredonda(mat.Total_Preco_Compra * 0.16, 2)) + '</vICMSSTRet>' +
      '</ICMS60></ICMS>';
      exit;
    end;

  //CFOP ISENTO
  IF CSTICM_CFOP = 'I' then
    begin
     Result := '<ICMS><ICMS40><orig>' + _ORIGE + '</orig><CST>40</CST></ICMS40></ICMS>';
     exit;
    end;

  //CFOP NAO SE APLICA ICM
  IF CSTICM_CFOP = 'N' then
    begin
      Result := '<ICMS><ICMS40><orig>' + _ORIGE + '</orig><CST>41</CST></ICMS40></ICMS>';
      exit;
    end;

  //CFOP TRIBUTADO COM REDUCAO NA BASE DE CALCULO
  IF CSTICM_CFOP = 'R' then
    begin
      //SE EXISTE REDUCAO NA BASE DE CALCULO PELO CFOP, ENTAO REDUCAO E DE 100%
      mat.Reducao := 0;
      mat.PercICMS := 0;
      mat.VlrICMS := 0;
      BASE_ICM := TOT;
      VLR_ICM := 0;
      TOTICM := VLR_ICM;
      TOT_BASEICM := BASE_ICM;

      Result := '<ICMS><ICMS20><orig>' + _ORIGE + '</orig><CST>20</CST><modBC>3</modBC>' +
      '<pRedBC>' + FORMAT_NUM(mat.Reducao) + '</pRedBC>' +
      '<vBC>' + FORMAT_NUM(mat.DescICMS) + '</vBC>' +
      '<pICMS>' + FORMAT_NUM(mat.PercICMS) + '</pICMS>' +
      '<vICMS>' + FORMAT_NUM(mat.VlrICMS) + '</vICMS></ICMS20></ICMS>';
      exit;
    end;

//TRIBUTACAO DO ICMS EM REGIME NORMAL
//PRODUTO SUBSTITUICAO TRIBUTARIA
IF mat.CodAliq = 10 then
  begin
    Result := '<ICMS><ICMS60><orig>' + _ORIGE + '</orig><CST>60</CST>' +
    '<vBCSTRet>' + FORMAT_NUM(mat.p_compra) + '</vBCSTRet>' +
    '<vICMSSTRet>' + FORMAT_NUM(ARREDONDA(mat.p_compra * 0.16, 2)) + '</vICMSSTRet>' +
    '</ICMS60></ICMS>';
    exit;
  end;

//PRODUTO ISENTO
IF mat.CodAliq = 11 then
  begin
   Result := '<ICMS><ICMS40><orig>' + _ORIGE + '</orig><CST>40</CST></ICMS40></ICMS>';
   exit;
  end;

//PRODUTO NAO SE APLICA ICM
IF mat.CodAliq = 12 then
  begin
   Result := '<ICMS><ICMS40><orig>' + _ORIGE + '</orig><CST>41</CST></ICMS40></ICMS>';
   exit;
  end;

//PRODUTO TRIBUTADO COM REDUCAO NA BASE DE CALCULO
IF mat.Reducao <> 0 then
  begin
    BASE_ICM := ARREDONDA(TOT - (TOT * mat.Reducao / 100), 2);
    VLR_ICM := ARREDONDA(BASE_ICM * mat.PercICMS / 100, 2);
    TOTICM := TOTICM + VLR_ICM;
    TOT_BASEICM := TOT_BASEICM + BASE_ICM;
    Result := '<ICMS><ICMS20><orig>' + _ORIGE + '</orig><CST>20</CST><modBC>3</modBC>' +
    '<pRedBC>' + FORMAT_NUM(mat.Reducao) + '</pRedBC>' +
    '<vBC>' + FORMAT_NUM(BASE_ICM) + '</vBC>' +
    '<pICMS>' + FORMAT_NUM(mat.PercICMS) + '</pICMS>' +
    '<vICMS>' + FORMAT_NUM(VLR_ICM) + '</vICMS></ICMS20></ICMS>';
    exit;
  end;

  //TRIBUTADO INTEGRAL
  BASE_ICM := tot;
  VLR_ICM := ARREDONDA(BASE_ICM * mat.PercICMS / 100, 2);
  TOTICM := TOTICM + VLR_ICM;
  TOT_BASEICM := TOT_BASEICM + BASE_ICM;
  Result := '<ICMS><ICMS00><orig>' + _ORIGE + '</orig><CST>00</CST><modBC>3</modBC>' +
   '<vBC>' + FORMAT_NUM(BASE_ICM) + '</vBC>' +
   '<pICMS>' + FORMAT_NUM(mat.PercICMS) + '</pICMS>' +
   '<vICMS>' + FORMAT_NUM(VLR_ICM) + '</vICMS></ICMS00></ICMS>';
end;


FUNCTION NODO_PISCOFINS1(var item1 : Item_venda; CSTPIS_CFOP : string) : string;
VAR
   COF_ALIQ, PIS_ALIQ : string;
  tot, VLR_COFINS, VLR_PIS : currency;
begin
  TOT := item1.total - item1.Desconto;
  //SE FOR OPTANTE DO SIMPLES NACIONAL, NAO USA TAG PIS/COFINS
  IF Contido(pgerais.Values['10'], '1-2')  then
    begin
      Result := '<PIS><PISAliq><CST>01</CST><vBC>' + FORMAT_NUM(TOT) + '</vBC><pPIS>0.00</pPIS>' +
      '<vPIS>0.00</vPIS></PISAliq></PIS>' +
      '<COFINS><COFINSAliq><CST>01</CST><vBC>' + FORMAT_NUM(TOT) + '</vBC>' +
      '<pCOFINS>0.00</pCOFINS><vCOFINS>0.00</vCOFINS></COFINSAliq></COFINS>';
      exit;
    end;

  PIS_ALIQ := '<PISAliq><CST>02</CST><vBC>' + FORMAT_NUM(TOT) + '</vBC><pPIS>0.00</pPIS>' +
  '<vPIS>0.00</vPIS></PISAliq>';
  COF_ALIQ := '<COFINSAliq><CST>02</CST><vBC>' + FORMAT_NUM(TOT) + '</vBC>' +
  '<pCOFINS>0.00</pCOFINS><vCOFINS>0.00</vCOFINS></COFINSAliq>';

  //SE O CFOP E ISENTO DE PIS/COFINS
  IF CSTPIS_CFOP = 'I' then
    begin
      PIS_NT := PIS_NT + TOT;
      Result := '<PIS>' + PIS_ALIQ + '<PISNT><CST>07</CST></PISNT></PIS>' +
      '<COFINS>' + COF_ALIQ + '<COFINSNT><CST>07</CST></COFINSNT></COFINS>';
      exit;
    end;

  //SE O CFOP NAO E TRIBUTADO POR PIS/COFINS
  IF CSTPIS_CFOP = 'N' then
    begin
      PIS_NT := PIS_NT + TOT;
      Result := '<PIS>' + PIS_ALIQ + '<PISNT><CST>06</CST></PISNT></PIS>' +
      '<COFINS>' + COF_ALIQ + '<COFINSNT><CST>06</CST></COFINSNT></COFINS>' ;
      exit;
    end;

   //SE O CFOP TEM  A ALIQ RED. A ZERO DE PIS/COFINS
   IF CSTPIS_CFOP = 'R' then
     begin
       PIS_NT := PIS_NT + TOT;
       Result := '<PIS><PISAliq><CST>02</CST><vBC>' + FORMAT_NUM(TOT) + '</vBC><pPIS>0.00</pPIS>' +
       '<vPIS>0.00</vPIS></PISAliq></PIS>'  +
       '<COFINS><COFINSAliq><CST>02</CST><vBC>' + FORMAT_NUM(TOT) + '</vBC>' +
       '<pCOFINS>0.00</pCOFINS><vCOFINS>0.00</vCOFINS></COFINSAliq></COFINS>';
       exit;
     end;

   //SE O CFOP NAO E TRIBUTADO POR PIS/COFINS
   IF CSTPIS_CFOP = 'M' then
     begin
       PIS_NT := PIS_NT + TOT;
       Result := '<PIS>' + '<PISNT><CST>04</CST></PISNT></PIS>' +
       '<COFINS>' + '<COFINSNT><CST>04</CST></COFINSNT></COFINS>';
     end;

   //SE O CFOP E ISENTO DE PIS/COFINS
   IF CSTPIS_CFOP = 'X' then
     begin
       PIS_NT := PIS_NT + TOT;
       Result := '<PIS><PISNT><CST>08</CST></PISNT></PIS>' +
       '<COFINS><COFINSNT><CST>08</CST></COFINSNT></COFINS>';
    end;

    //SE O CFOP TEM ALIQ DIFERENCIADA
    IF CSTPIS_CFOP = 'D' then
     begin
       PIS_NT := PIS_NT + TOT;
       Result := '<PIS><PISAliq><CST>02</CST><vBC>' + FORMAT_NUM(TOT) + '</vBC><pPIS>0.00</pPIS>' +
       '<vPIS>' + Format_num(0.00) + '</vPIS></PISAliq></PIS>'  +
       '<COFINS><COFINSAliq><CST>02</CST><vBC>' + FORMAT_NUM(TOT) + '</vBC>' +
       '<pCOFINS>0.00</pCOFINS><vCOFINS>' + Format_num(0.00) + '</vCOFINS></COFINSAliq></COFINS>';
     end;

   //CFOP - SE JA RECOLHEU PIS/COFINS POR SUBSTITUICAO TRIBUTARIA
   IF CSTPIS_CFOP = 'S' then
     begin
       VLR_PIS := ARREDONDA(item1.Total_Preco_Compra * TRIB_ALIQ_PIS /100, 2);
       VLR_COFINS := ARREDONDA(item1.Total_Preco_Compra * TRIB_ALIQ_COFINS /100, 2);
       PIS_ST := PIS_ST + VLR_PIS;
       COFINS_ST := COFINS_ST + VLR_COFINS;
       Result := '<PIS>' + PIS_ALIQ + '<PISST><vBC>' + FORMAT_NUM(item1.Total_Preco_Compra) + '</vBC>' +
       '<pPIS>' + FORMAT_NUM(TRIB_ALIQ_PIS) + '</pPIS>' +
       '<vPIS>' + FORMAT_NUM(VLR_PIS) + '</vPIS></PISST></PIS>' +
       '<COFINS>' + COF_ALIQ + '<COFINSST><vBC>' + FORMAT_NUM(item1.Total_Preco_Compra) + '</vBC>' +
       '<pCOFINS>' + FORMAT_NUM(TRIB_ALIQ_COFINS) + '</pCOFINS>' +
       '<vCOFINS>' + FORMAT_NUM(VLR_COFINS) + '</vCOFINS></COFINSST></COFINS>';
       exit;
     end;

   //SE O PRODUTO E ISENTO DE PIS/COFINS
   IF ((item1.Pis = 'I') and (length(strnum(item1.codISPIS)) = 3)) then
     begin
       PIS_NT := PIS_NT + TOT;
       Result := '<PIS>'  + '<PISNT><CST>07</CST></PISNT></PIS>' +
       '<COFINS>'  + '<COFINSNT><CST>07</CST></COFINSNT></COFINS>' ;
       exit;
     end;

   //SE O PRODUTO NAO E TRIBUTADO POR PIS/COFINS
   IF ((item1.Pis = 'N') and (length(strnum(item1.codISPIS)) = 3)) then
     begin
       PIS_NT := PIS_NT + TOT;
       Result := '<PIS>'  + '<PISNT><CST>06</CST></PISNT></PIS>' +
       '<COFINS>'  + '<COFINSNT><CST>06</CST></COFINSNT></COFINS>';
       exit;
     end;

   //SE O PRODUTO TEM  A ALIQ RED. A ZERO DE PIS/COFINS
   IF ((item1.Pis = 'R') and (length(strnum(item1.codISPIS)) = 3)) then
     begin
       PIS_NT := PIS_NT + TOT;
       Result := '<PIS>' + '<PISNT><CST>06</CST></PISNT></PIS>' +
       '<COFINS>' + '<COFINSNT><CST>06</CST></COFINSNT></COFINS>' ;
       exit;
     end;

   IF ((item1.Pis = 'X') and (length(strnum(item1.codISPIS)) = 3)) then
     begin
       PIS_NT := PIS_NT + TOT;
       Result := '<PIS>' + '<PISNT><CST>08</CST></PISNT></PIS>' +
       '<COFINS>' + '<COFINSNT><CST>08</CST></COFINSNT></COFINS>' ;
       exit;
     end;

   //PRODUTO - SE JA RECOLHEU PIS/COFINS POR SUBSTITUICAO TRIBUTARIA
   IF item1.Pis = 'S' then
     begin
       VLR_PIS := ARREDONDA(item1.Total_Preco_Compra * TRIB_ALIQ_PIS /100, 2);
       VLR_COFINS := ARREDONDA(item1.Total_Preco_Compra * TRIB_ALIQ_COFINS /100, 2);
       PIS_ST := PIS_ST + VLR_PIS;
       COFINS_ST := COFINS_ST + VLR_COFINS;

       Result :=  '<PIS>' + PIS_ALIQ + '<PISST><vBC>' + FORMAT_NUM(item1.Total_Preco_Compra) + '</vBC>' +
       '<pPIS>' + FORMAT_NUM(TRIB_ALIQ_PIS) + '</pPIS>' +
       '<vPIS>' + FORMAT_NUM(VLR_PIS) + '</vPIS></PISST></PIS>' +
       '<COFINS>' + COF_ALIQ + '<COFINSST><vBC>' + FORMAT_NUM(item1.Total_Preco_Compra) + '</vBC>' +
       '<pCOFINS>' + FORMAT_NUM(TRIB_ALIQ_COFINS) + '</pCOFINS>' +
       '<vCOFINS>' + FORMAT_NUM(VLR_COFINS) + '</vCOFINS></COFINSST></COFINS>' ;
       exit;
     end;

   try
     TRIB_ALIQ_PIS := StrToCurr(pgerais.Values['11']);
     TRIB_ALIQ_COFINS := StrToCurr(pgerais.Values['12'])
   except
     TRIB_ALIQ_COFINS := 0;
     TRIB_ALIQ_COFINS := 0;
   end;
   //REGIME NORMAL - RECOLHIMENTO DE PIS E COFINS
   //CALCULA PIS/COFINS SOBRE O VALOR DO PRODUTO - DESCONTO
   VLR_PIS := ARREDONDA(TOT * TRIB_ALIQ_PIS /100, 2);
   TOT_PIS := TOT_PIS + VLR_PIS;
   VLR_COFINS := ARREDONDA(TOT * TRIB_ALIQ_COFINS /100, 2);
   TOT_COFINS := TOT_COFINS + VLR_COFINS;
   Result := '<PIS><PISAliq><CST>01</CST><vBC>' + FORMAT_NUM(TOT) + '</vBC>' +
   '<pPIS>' + FORMAT_NUM(TRIB_ALIQ_PIS) + '</pPIS>' +
   '<vPIS>' + FORMAT_NUM(VLR_PIS) +
   '</vPIS></PISAliq></PIS>' +
   '<COFINS><COFINSAliq><CST>01</CST><vBC>' + FORMAT_NUM(TOT) + '</vBC>' +
   '<pCOFINS>' + FORMAT_NUM(TRIB_ALIQ_COFINS) + '</pCOFINS>' +
   '<vCOFINS>' + FORMAT_NUM(VLR_COFINS) +
   '</vCOFINS></COFINSAliq></COFINS>';
end;

procedure GravarTexto(SalvarComo, Texto:String);
var
  txt: textfile;
begin
  try
    AssignFile(txt, SalvarComo);
    Rewrite(txt);
    Append(txt);
    WriteLn(txt, Texto);
  finally
    CloseFile(txt);
  end;
end;


FUNCTION SUB_NODO_END(ENDE : String) : string;
begin
  Result := '<xLgr>' + TRIM(RetornaEndeRua(ENDE)) + '</xLgr><nro>' + TRIM(RetornaNumero(ENDE)) + '</nro>';
end;

function RetornaEndeRua(const entra : string) : string;
begin
  Result := '';
  if Contido(',',entra) then
    begin
      result := copy(entra,1,PosFinal(',',entra)-1);
    end
  else
    begin
      result := copy(entra,1,PosFinal(' ',entra)-1);
    end;
end;

function RetornaNumero(const entra : string) : string;
begin
  Result := '';
  if Contido(',',entra) then
    begin
      result := copy(entra, PosFinal(',',entra) + 1,length(entra));
    end
  else
    begin
      result := copy(entra, PosFinal(' ',entra) + 1,length(entra));
    end;

  Result := trim(strnum(Result));
  if Result = '' then Result := '100';  
end;

function NODO_TRANP() : String;
begin
  Result := '<transp><modFrete>9</modFrete></transp>';
end;

FUNCTION NODO_PAG()   : STRING;
begin
  Result := '<pag>' +
  '<tpag>' + venda.codFormaNFCE + '</tpag>' +
  '<vpag>' + FormatCurr('0.00', totalNota - totDesc) +  '</vpag>' +
  '</pag>';

end;


function getDataHoraAtualXML() : String;
begin
  Result := FormatDateTime('yyy-mm-dd', now) + 'T' + FormatDateTime('hh:mm:ss', now) + '-4:00';
end;

FUNCTION NODO_DEST(TIPO, CPF, CNPJ, NOME, ENDE, BAIRRO, COD_MUN, NOM_MUN, UF, CEP, FONE, IE, CODMUN_EMI : String) : string;
var
  CPF_CNPJ, indIEDest, idEstrangeiro, tmp, codPaisDest : string;
  INVALIDO : integer;
  OK       : boolean;
begin
  ERRO_DADOS := '';
  tmp := IE;
  codPaisDest := '1058';
  INVALIDO := 0;
  tipo := Trim(tipo);
  cpf := StrNum(cpf);

  if Length(StrNum(cpf)) <> 11 then
    begin
      Result := '';
      exit;
    end;

  IF Length(StrNum(cpf)) = 11 then
    begin
      OK := testacpf(CPF);
      CPF_CNPJ := '<CPF>' + CPF + '</CPF>';
    end;

  //SE O CODIGO DO MUNICIPIO ESTA EM BRANCO, USA O CODIGO DO MUNICIPIO DO EMITENTE
  COD_MUN := dadosEmitente.Values['cod_mun'];
  UF   := dadosEmitente.Values['est'];
  CEP  := dadosEmitente.Values['cep'];
  NOM_MUN  := dadosEmitente.Values['cid'];

  IF NOT OK then
    begin
      ERRO_DADOS := ' CPF/CNPJ do Destinatário Inválido ' + #13;
      INVALIDO := INVALIDO + 1;
    end;

  INVALIDO := INVALIDO + CAMPO_VAZIO(ENDE);
  INVALIDO := INVALIDO + CAMPO_VAZIO(BAIRRO);
  INVALIDO := INVALIDO + CAMPO_VAZIO(COD_MUN);
  INVALIDO := INVALIDO + CAMPO_VAZIO(NOM_MUN);
  INVALIDO := INVALIDO + CAMPO_VAZIO(UF);
  INVALIDO := INVALIDO + CAMPO_VAZIO(CEP);
  IF INVALIDO <> 0 then ERRO_DADOS := ' Dados do Cliente Incompletos ' + #13;

  indIEDest := '2';
  if IE = '0' then IE := '';
  if IE = '' then indIEDest := '2';
  if Length(StrNum(CPF_CNPJ)) = 11 then
    begin
      indIEDest := '9';
      IE := '';
    end;

  if Length(StrNum(CPF_CNPJ)) = 14 then
    begin
      //indIEDest := '1';
      if IE <> '' then
        begin
          indIEDest := '1';
        end;
    end;

  if INVALIDO > 0 then
    begin
      Result := '';
      exit;
    end;

  Result := '<dest>' + CPF_CNPJ + '<xNome>' + trim(NOME) + '</xNome><enderDest>' +
  SUB_NODO_END(ENDE) + '<xBairro>' + BAIRRO +
  '</xBairro><cMun>' + COD_MUN + '</cMun><xMun>' + NOM_MUN + '</xMun>' +
  '<UF>'  + UF + '</UF><CEP>' + CEP + '</CEP><cPais>'+ codPaisDest +'</cPais>' +
  '<xPais>BRASIL</xPais><fone>' + IfThen(FONE = '0', '', FONE) + '</fone></enderDest>' +
  '<indIEDest>'+ indIEDest +'</indIEDest>'+ IfThen(indIEDest =  '1', '<IE>' + IE + '</IE>', '') + '</dest>';
end;


Function testacpf(cpf:string):boolean;
var i:integer;
    Want:char;
    Wvalid:boolean;
    Wdigit1,Wdigit2:integer;
begin
  cpf := strnum(cpf);
  Result := false;
  if length(cpf) <> 11 then exit;

    Wdigit1:=0;
    Wdigit2:=0;
    Want:=cpf[1];//variavel para testar se o cpf é repetido como 111.111.111-11
    Delete(cpf,ansipos('.',cpf),1);  //retira as mascaras se houver
    Delete(cpf,ansipos('.',cpf),1);
    Delete(cpf,ansipos('-',cpf),1);

   //testar se o cpf é repetido como 111.111.111-11
   for i:=1 to length(cpf) do
     begin
       if cpf[i] <> Want then
         begin
            Wvalid:=true;  // se o cpf possui um digito diferente ele passou no primeiro teste
            break
         end;
     end;
       // se o cpf é composto por numeros repetido retorna falso
     if not Wvalid then
       begin
          result:=false;
          exit;
       end;

     //executa o calculo para o primeiro verificador
     for i:=1 to 9 do
       begin
          wdigit1:=Wdigit1+(strtoint(cpf[10-i])*(I+1));
       end;
        Wdigit1:= ((11 - (Wdigit1 mod 11))mod 11) mod 10;
        {formula do primeiro verificador
            soma=1°*2+2°*3+3°*4.. até 9°*10
            digito1 = 11 - soma mod 11
            se digito > 10 digito1 =0
          }

         //verifica se o 1° digito confere
        if IntToStr(Wdigit1) <> cpf[10] then
          begin
             result:=false;
             exit;
          end;


         for i:=1 to 10 do
       begin
          wdigit2:=Wdigit2+(strtoint(cpf[11-i])*(I+1));
       end;
       Wdigit2:= ((11 - (Wdigit2 mod 11))mod 11) mod 10;
         {formula do segundo verificador
            soma=1°*2+2°*3+3°*4.. até 10°*11
            digito1 = 11 - soma mod 11
            se digito > 10 digito1 =0
          }

       // confere o 2° digito verificador
       if IntToStr(Wdigit2) <> cpf[11] then
          begin
             result:=false;
             exit;
          end;

   //se chegar até aqui o cpf é valido
   result:=true;
end;


procedure criaXMLs(nota1,nnf, chav4 : String);
var
  vend1 : Tvenda;
  xml   : String;
  chavb : TChaveDetalhes;
begin
  cliente := '0';
  inicializaVariaveis();
  chavb := TChaveDetalhes.Create;
  vend1 := Tvenda.Create;

  chavb.chave := chav4;
  vend1.chave := chav4;
  chavb.codnf := StrToIntDef(nota1, 0);
  vend1.nota  := StrToIntDef(nota1, 0);
  vend1.adic  := 'OFF';
  vend1.cliente := 0;

  Ler_dados_pela_chave(chavb);

  if nnf = '' then nnf := IntToStr(chavb.nnf);
  //if strnum(nnf) = '0' then nnf := Incrementa_Generator('nfce', 1);
  nota1 := IntToStr(vend1.nota);

  //ShowMessage(nnf);
  xml := GerarNFCeTexto(nota1, cliente, nnf);
  GravarTexto(pastaControlW + '\NFCe\EMIT\' + chaveNF + '-nfe.xml', xml);
  
  vend1.cliente := 0;
  vend1.chave := chaveNF;
  insereNotaBD1(vend1);

  LimpaVariaveis();
end;

procedure criaXMLsComDATA(nota1,nnf, chav4, data : String);
var
  vend1 : Tvenda;
  xml   : String;
  chavb : TChaveDetalhes;
begin
  cliente := '0';
  inicializaVariaveis();
  chavb := TChaveDetalhes.Create;
  vend1 := Tvenda.Create;

  chavb.chave := chav4;
  vend1.chave := chav4;
  chavb.codnf := StrToIntDef(nota1, 0);
  vend1.nota  := StrToIntDef(nota1, 0);
  vend1.adic  := 'OFF';
  vend1.cliente := 0;

  Ler_dados_pela_chave(chavb);

  if nnf = '' then nnf := IntToStr(chavb.nnf);
  //if strnum(nnf) = '0' then nnf := Incrementa_Generator('nfce', 1);
  nota1 := IntToStr(vend1.nota);

  //ShowMessage(nnf);
  xml := GerarNFCeTexto(nota1, cliente, nnf);
  GravarTexto(pastaControlW + '\NFCe\EMIT\' + chaveNF + '-nfe.xml', xml);
  
  vend1.cliente := 0;
  vend1.chave := chaveNF;
  //insereNotaBD1(vend1);

  LimpaVariaveis();
end;

procedure LimpaVariaveis();
begin
  dadosEmitente.Free;
  dadosDest.Free;
  ACBrNFe.NotasFiscais.Clear;
end;

function verificaExisteNFCe(const nota2 : String; imprime : boolean = false) : string;
var
  arq : TStringList;
  csta : String;
begin
  Result := '';

  query1.Close;
  query1.SQL.Text := 'select chave from nfce where substring(chave from 36 for 8) = :nota';
  query1.ParamByName('nota').AsString := completaOuRepete('',nota2,'0',8);
  query1.Open;

  if query1.IsEmpty then
    begin
      query1.Close;
      exit;
    end;

  arq := TStringList.Create;
  Result := '';
  while query1.Eof do
    begin
      if FileExists(pastaControlW + 'NFCE\EMIT\' + query1.fieldbyname('chave').AsString + '-nfe.xml') then
        begin
          Result := query1.fieldbyname('chave').AsString;
          arq.LoadFromFile(pastaControlW + 'NFCE\EMIT\' + query1.fieldbyname('chave').AsString + '-nfe.xml');
          csta := Le_Nodo('cStat', arq.GetText);
          if Contido(trim(csta), '100-150') then
            begin
              Result := query1.fieldbyname('chave').AsString;
            end;
        end;

      query1.Next;
    end;

  Result := query1.fieldbyname('chave').AsString;
end;

procedure Ler_dados_pela_chave(var chav1 : TChaveDetalhes);
begin
  if chav1.chave = '' then
    begin
      chav1.nnf := 0;
      exit;
    end;
  chav1.nnf        := StrToIntDef(copy(chav1.chave, 26, 9), 0);
  chav1.codUF      := StrToIntDef(copy(chav1.chave, 1, 2), 0);
  chav1.anoMesYYMM := copy(chav1.chave, 3, 4);
  chav1.CNPJ       := copy(chav1.chave, 7, 14);
  chav1.modelo     := StrToIntDef(copy(chav1.chave, 21, 2), 0);
  chav1.serie      := StrToIntDef(copy(chav1.chave, 23, 3), 0);
  chav1.nnf        := StrToIntDef(copy(chav1.chave, 26, 9), 0);
  chav1.tpemis     := StrToIntDef(copy(chav1.chave, 35, 1), 0);
  chav1.codnf      := StrToIntDef(copy(chav1.chave, 37, 7), 0);
end;

function Incrementa_Generator1(Gen_name : string; valor_incremento : integer) : string;
begin
  query1.Close;
  query1.SQL.Clear;
  query1.SQL.Add('select gen_id('+ Gen_name +','+ IntToStr(valor_incremento) +') as venda from rdb$database');
  query1.Open;

  Result := '';
  Result := query1.fieldbyname('venda').AsString;

  query1.Close;
end;

procedure trataDuplicidade(erroDup : String; msg : boolean; nfe : boolean = false);
var
  chavb : TChaveDetalhes;
  stat  : String;
  vend  : Tvenda;
begin
  if msg then
    begin
      MessageDlg('Ocorreu Um Erro de Duplicidade e o Sistem irá recuperar a NFe!', mtWarning, [mbOK], 1);
    end;

  chavb := TChaveDetalhes.Create;
  chavb.chave := buscaChaveErroDeDuplicidade(erroDup);
  Ler_dados_pela_chave(chavb);

  if not FileExists(pastaControlW+ 'nfce\emit\' + chavb.chave + '-nfe.xml')  then
    begin
      criaXMLs(IntToStr(chavb.codnf), '', chavb.chave);
    end;

  if chavb.nnf = strtoint(Incrementa_Generator1('nfce', 0)) then Incrementa_Generator1('nfce', 1);
  //reStartGenerator('nfce', chavb.nnf + 1);

  ACBrNFe.NotasFiscais.Clear;

  if not FileExists(pastaControlW+ 'nfce\emit\' + chavb.chave + '-nfe.xml') then
    begin
      exit;
      //Incrementa_Generator('NFCE', 1);
    end;

  ACBrNFe.NotasFiscais.LoadFromFile(pastaControlW+ 'nfce\emit\' + chavb.chave + '-nfe.xml');

  stat := Le_Nodo('cStat', ACBrNFe.NotasFiscais[0].XML);
  if stat = '' then
    begin
      ACBrNFe.Consultar;
      stat := IntToStr(acbrnfe.NotasFiscais[0].NFe.procNFe.cStat);
    end;

  vend := Tvenda.Create;
  vend.adic  := '';
  ///ShowMessage('venda=' + IntToStr(chavb.codnf) + #13 + 'chave=' + chavb.chave);
  vend.nota  := chavb.codnf;
  vend.chave := chavb.chave;
  if stat <> '100' then vend.adic  := 'OFF';

  insereNotaBD1(vend);
  if msg then imprimirNfce;
  chavb.Free;
  vend.Free;
end;


function buscaChaveErroDeDuplicidade(erro : String) : String;
var
  ini, fim : integer;
begin
  ini := pos('[chNFe:', erro) + 7;
  fim := pos(']', erro);
  Result := copy(erro, ini, fim - ini);
end;


function reStartGenerator(nome : string; Valor : integer): String;
begin
  query1.Close;
  query1.SQL.Clear;
  query1.SQL.Add('ALTER SEQUENCE ' + nome + ' RESTART WITH ' + IntToStr(Valor));
  query1.ExecSQL;

  query1.Transaction.Commit;
  Result := '';
end;


function valXML(const val : String) : currency;
begin
  Result := StrToCurrDef(StringReplace(val, '.', ',', [rfReplaceAll, rfIgnoreCase]), 0);
end;

procedure carregaConfigsNFCe;
begin
  ACBrNFe.Configuracoes.Geral.ModeloDF := moNFCe;
end;

end.



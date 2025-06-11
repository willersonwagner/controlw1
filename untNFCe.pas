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
** Descri��o..........: Modulo NF-e                                         **
** Data...............: 15/09/2014                                          **
** Data atualizacao da NFC-e 2.0 02/02/2011                                 **
******************************************************************************}
////////////////////////
{C�DIGO E RESULTADO DO PROCESSAMENTO DA SOLICITA��O
100 - Autorizado o uso da NF-e
101 - Cancelamento de NF-e homologado
102 - Inutiliza��o de n�mero homologado
103 - Lote recebido com sucesso
104 - Lote processado
105 - Lote em processamento
106 - Lote n�o localizado
107 - Servi�o em Opera��o
108 - Servi�o Paralisado Momentaneamente (curto prazo)
109 - Servi�o Paralisado sem Previs�o
110 - Uso Denegado
111 - Consulta cadastro com uma ocorr�ncia
112 - Consulta cadastro com mais de uma ocorr�ncia 
///////////////////////
C�DIGO MOTIVOS DE N�O ATENDIMENTO DA SOLICITA��O
201 Rejei��o: O numero m�ximo de numera��o de NF-e a inutilizar ultrapassou o limite
202 Rejei��o: Falha no reconhecimento da autoria ou integridade do arquivo digital
203 Rejei��o: Emissor n�o habilitado para emiss�o da NF-e
204 Rejei��o: Duplicidade de NF-e
205 Rejei��o: NF-e est� denegada na base de dados da SEFAZ
206 Rejei��o: NF-e j� est� inutilizada na Base de dados da SEFAZ
207 Rejei��o: CNPJ do emitente inv�lido
208 Rejei��o: CNPJ do destinat�rio inv�lido
209 Rejei��o: IE do emitente inv�lida
210 Rejei��o: IE do destinat�rio inv�lida
211 Rejei��o: IE do substituto inv�lida
212 Rejei��o: Data de emiss�o NF-e posterior a data de recebimento
213 Rejei��o: CNPJ-Base do Emitente difere do CNPJ-Base do Certificado Digital
214 Rejei��o: Tamanho da mensagem excedeu o limite estabelecido
215 Rejei��o: Falha no schema XML
216 Rejei��o: Chave de Acesso difere da cadastrada
217 Rejei��o: NF-e n�o consta na base de dados da SEFAZ
218 Rejei��o: NF-e j� esta cancelada na base de dados da SEFAZ
219 Rejei��o: Circula��o da NF-e verificada
220 Rejei��o: NF-e autorizada h� mais de 7 dias (168 horas)
221 Rejei��o: Confirmado o recebimento da NF-e pelo destinat�rio
222 Rejei��o: Protocolo de Autoriza��o de Uso difere do cadastrado
223 Rejei��o: CNPJ do transmissor do lote difere do CNPJ do transmissor da consulta
224 Rejei��o: A faixa inicial � maior que a faixa final
225 Rejei��o: Falha no Schema XML da NFe
226 Rejei��o: C�digo da UF do Emitente diverge da UF autorizadora
227 Rejei��o: Erro na Chave de Acesso � Campo ID
228 Rejei��o: Data de Emiss�o muito atrasada
229 Rejei��o: IE do emitente n�o informada
230 Rejei��o: IE do emitente n�o cadastrada
231 Rejei��o: IE do emitente n�o vinculada ao CNPJ
232 Rejei��o: IE do destinat�rio n�o informada
233 Rejei��o: IE do destinat�rio n�o cadastrada
234 Rejei��o: IE do destinat�rio n�o vinculada ao CNPJ
235 Rejei��o: Inscri��o SUFRAMA inv�lida
236 Rejei��o: Chave de Acesso com d�gito verificador inv�lido
237 Rejei��o: CPF do destinat�rio inv�lido
238 Rejei��o: Cabe�alho � Vers�o do arquivo XML superior a Vers�o vigente
239 Rejei��o: Cabe�alho � Vers�o do arquivo XML n�o suportada
240 Rejei��o: Cancelamento/Inutiliza��o � Irregularidade Fiscal do Emitente
241 Rejei��o: Um n�mero da faixa j� foi utilizado
242 Rejei��o: Cabe�alho � Falha no Schema XML
243 Rejei��o: XML Mal Formado
244 Rejei��o: CNPJ do Certificado Digital difere do CNPJ da Matriz e do CNPJ do
Emitente
245 Rejei��o: CNPJ Emitente n�o cadastrado
246 Rejei��o: CNPJ Destinat�rio n�o cadastrado
247 Rejei��o: Sigla da UF do Emitente diverge da UF autorizadora
248 Rejei��o: UF do Recibo diverge da UF autorizadora
249 Rejei��o: UF da Chave de Acesso diverge da UF autorizadora
250 Rejei��o: UF diverge da UF autorizadora
251 Rejei��o: UF/Munic�pio destinat�rio n�o pertence a SUFRAMA
252 Rejei��o: Ambiente informado diverge do Ambiente de recebimento
253 Rejei��o: Digito Verificador da chave de acesso composta inv�lida
254 Rejei��o: NF-e complementar n�o possui NF referenciada
255 Rejei��o: NF-e complementar possui mais de uma NF referenciada
256 Rejei��o: Uma NF-e da faixa j� est� inutilizada na Base de dados da SEFAZ
257 Rejei��o: Solicitante n�o habilitado para emiss�o da NF-e
258 Rejei��o: CNPJ da consulta inv�lido
259 Rejei��o: CNPJ da consulta n�o cadastrado como contribuinte na UF
260 Rejei��o: IE da consulta inv�lida
261 Rejei��o: IE da consulta n�o cadastrada como contribuinte na UF
262 Rejei��o: UF n�o fornece consulta por CPF
263 Rejei��o: CPF da consulta inv�lido
264 Rejei��o: CPF da consulta n�o cadastrado como contribuinte na UF
265 Rejei��o: Sigla da UF da consulta difere da UF do Web Service
266 Rejei��o: S�rie utilizada n�o permitida no Web Service
267 Rejei��o: NF Complementar referencia uma NF-e inexistente
268 Rejei��o: NF Complementar referencia uma outra NF-e Complementar
269 Rejei��o: CNPJ Emitente da NF Complementar difere do CNPJ da NF
Referenciada
270 Rejei��o: C�digo Munic�pio do Fato Gerador: d�gito inv�lido
271 Rejei��o: C�digo Munic�pio do Fato Gerador: difere da UF do emitente
272 Rejei��o: C�digo Munic�pio do Emitente: d�gito inv�lido
273 Rejei��o: C�digo Munic�pio do Emitente: difere da UF do emitente
274 Rejei��o: C�digo Munic�pio do Destinat�rio: d�gito inv�lido
275 Rejei��o: C�digo Munic�pio do Destinat�rio: difere da UF do Destinat�rio
276 Rejei��o: C�digo Munic�pio do Local de Retirada: d�gito inv�lido
277 Rejei��o: C�digo Munic�pio do Local de Retirada: difere da UF do Local de
Retirada
278 Rejei��o: C�digo Munic�pio do Local de Entrega: d�gito inv�lido
279 Rejei��o: C�digo Munic�pio do Local de Entrega: difere da UF do Local de Entrega
280 Rejei��o: Certificado Transmissor inv�lido
281 Rejei��o: Certificado Transmissor Data Valida3de
282 Rejei��o: Certificado Transmissor sem CNPJ
283 Rejei��o: Certificado Transmissor � erro Cadeia de Certifica��o
284 Rejei��o: Certificado Transmissor revogado
285 Rejei��o: Certificado Transmissor difere ICP-Brasil
286 Rejei��o: Certificado Transmissor erro no acesso a LCR
287 Rejei��o: C�digo Munic�pio do FG � ISSQN: d�gito inv�lido
288 Rejei��o: C�digo Munic�pio do FG � Transporte: d�gito inv�lido
289 Rejei��o: C�digo da UF informada diverge da UF solicitada
290 Rejei��o: Certificado Assinatura inv�lido
291 Rejei��o: Certificado Assinatura Data Validade
292 Rejei��o: Certificado Assinatura sem CNPJ
293 Rejei��o: Certificado Assinatura � erro Cadeia de Certifica��o
294 Rejei��o: Certificado Assinatura revogado
295 Rejei��o: Certificado Assinatura difere ICP-Brasil
296 Rejei��o: Certificado Assinatura erro no acesso a LCR
297 Rejei��o: Assinatura difere do calculado
298 Rejei��o: Assinatura difere do padr�o do Projeto
299 Rejei��o: XML da �rea de cabe�alho com codifica��o diferente de UTF-8
401 Rejei��o: CPF do remetente inv�lido
402 Rejei��o: XML da �rea de dados com codifica��o diferente de UTF-8
403 Rejei��o: O grupo de informa��es da NF-e avulsa � de uso exclusivo do Fisco
404 Rejei��o: Uso de prefixo de namespace n�o permitido
405 Rejei��o: C�digo do pa�s do emitente: d�gito inv�lido
406 Rejei��o: C�digo do pa�s do destinat�rio: d�gito inv�lido
407 Rejei��o: O CPF s� pode ser informado no campo emitente para a NF-e avulsa
453 Rejei��o: Ano de inutiliza��o n�o pode ser superior ao Ano atual
454 Rejei��o: Ano de inutiliza��o n�o pode ser inferior a 2006
478 Rejei��o: Local da entrega n�o informado para faturamento direto de ve�culos
novos
999 Rejei��o: Erro n�o catalogado (informar a mensagem de erro capturado no
tratamento da exce��o)

C�DIGO MOTIVOS DE DENEGA��O DE USO
301 Uso Denegado : Irregularidade fiscal do emitente
302 Uso Denegado : Irregularidade fiscal do destinat�rio }


unit untNFCe;

interface


uses IniFiles, comctrls, sysutils, controls, classes,
     ComObj,variants,dialogs, StdCtrls, ShDocVw, Forms,
     pcnConversao, pcnNFeRTXT, ACBrUtil, DateUtils, ACBrNFe,
     ACBrNFeDANFEClass, printers, ACBrNFeDANFeESCPOS,
     func,  classes1, StrUtils, acbrbal, WINDOWS, funcoesdav,
     ACBrIBPTax, pcnConversaoNFe,
     ACBrDFeSSL, ACBrPosPrinter, ACBrDANFCeFortesFr, ACBrNFeDANFeRL,
     ACBrNFeDANFeRLClass, SyncObjs,  ACBrMail, IdThreadComponent;

{type
  TTWtheadNFeEnvia = class(TThread)
  private
     acbrnf : TACBrNFe;
     FCritical : TCriticalSection;
     procedure AfterConstruction; override;
  protected
    procedure Execute; override;
    procedure FinalizaSessaoCritica;
  public
    constructor Create(const CreateSuspended : boolean; var acbrnf1 : TACBrNFe);
  end;

  TTWtheadNFeConsulta = class(TThread)
  private
     acbrnf : TACBrNFe;
     FCritical : TCriticalSection;
     procedure AfterConstruction; override;
  protected
    procedure Execute; override;
  public
    constructor Create(const CreateSuspended : boolean; var acbrnf1 : TACBrNFe);
  end;           }



implementation

uses  Math, DB, ACBrNFeNotasFiscais,
  ACBrNFeWebServices;


end.



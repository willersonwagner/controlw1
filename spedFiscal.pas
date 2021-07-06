unit spedFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, DateUtils, forms, funcoesDAV, dialogs,
  unit1, ibquery, Contnrs, dbclient, dialog, classes1, func, untnfceForm, relatorio;


type matriz = array of string;
type matrizCurrency = array of currency;

 // type
     //RegistroProduto = ^RegProd;
    //RegProd = record

  //type TmatrizProdutos = array of TregProd;



  type
    RegistroUnidade = ^RegUnidade;
    RegUnidade = record
    unid: String[6];
    quant: Integer;
  end;

  RegistroAliq = record
    cod : Integer;
    aliq : Currency;
    cst : string[2];
    reducao : Currency;
  end;

 type
  ItemALIQ = class(Tobject)
    codigo : Smallint;
    ALIQ : currency;
    reducao : currency;
    COD_TRIB : String[3];
  end;

 type
  itemPROD = class(Tobject)
    cod : integer;
    quant : currency;
    unid : String[6];
    total : currency;
    aliq : String[4];
    descCom : currency;
    despAces : currency;
    descNT : currency;
  end;

  var
     erro1 : smallint;
     reg1 : RegistroUnidade;
     listaUnidades : Tlist;
     datamov : TDateTime;
     //DADOS_ADIC : matrizCurrency;
     DADOS_ADIC : array[1..11] of currency;
     num1, num2, TOTCREDICM, TOTDEBICM : Currency;
     MATTRIB : TObjectList;
     aliquota : ItemALIQ;
     REC_BRUTA, BC_PISTRIB, TOT_APUR_CST : currency;
     ARQ_SPED, ARQ_PIS, ARQ_TMP : TextFile;
     listaCOD_PROD, MAT_ALIQPIS, BAS_ALIQPIS, VAL_ALIQPIS, BASC_ALIQPIS, CRED_ALIQPIS, DESC_ALIQPIS, MAT_CST_PIS : TStringList;
     CODCFOP, CODFOR, ERRO_CHAVE, arqTmp, valordg, _CNPJ, CST_PIS, chaveAnoMes, pisInvalido, codMunSistema : String;
     movimento, contReg, MAT_ALIQCFOP,
     VAL_ALIQCFOP, BAS_ALIQCFOP, ICM_ALIQCFOP, ADC_ALIQCFOP, MAT_REG, lisTMP, MAT_PED : TStringList;
     dsProduto, dsAliq, arqTemp : TClientDataSet;
     codProd : TItensAcumProd;
     dataIni, CODCLI, DataFim, mes, ano, arqSPED, sim, TRIB, COD, _CFOP, _FRETE, TIPO, _CHNFE, _SER, linha, DESC, UNID, ss : String;
     UF_EMPRESA, COD_ALIQ, ISPIS, COD_ISPIS, ALIQ_CFOP, ACUM_COD_FOR, Arquivo_CFOP_ISENTOS : String;
     NUM_ALIQ, NOTA, COD_FOR : integer;
     QTD, QTD1,POS1, POS2, ALIQ, TOT, LIDO, TOT_ITEM, PERC_ICMS, BASE_ICM, TOT_ICM,
     TOT_PISST_ENT, BASE_PIS_RD, BASE_PIS_ST, BASE_PIS_ISENTO : currency;
     _DAT1, _DAT2 : TDateTime;
     prod, prod1 : itemPROD;
     lista : TList;
     fim, i, ret, ini : integer;
     TRIB_REGIME, CSTPIS_CFOP, prodRuins, codCTA, chavesDuplicidade : String;
     mat_uni, mat_uniok : TItensUnid;
     listaProdutos, Lista0200Importados : TItensProduto;
     prodtemp      : TregProd;
     TOTDESC, TOTADIC, totDespAcess, TRIB_ALIQ_PIS, TRIB_ALIQ_COFINS, TOT_PIS,
      TOT_COFINS, _PISNT, _PIS, _COFINS  : currency;
     MAT_MOV : TItensAcumProd;
     MAT_NOTA, MAT_NOTA1, codigosClientesExterior, lista0500, listaChecaPIS : TStringList;
     listaPIS, listaTOT_PIS : TItensPISCOFINS;
     TOT_ECF         : TItensAliqSped;

procedure checaISPIS_CODISPIS(var ispis1, codPIS1 : String; codProduto : integer);
function ChecaIsencaoPis_Cst_49_Devoluções(CFOP : String) : boolean;
function insereClientePeloNodo(nodo_dest : String) : String;
procedure leNfesImportadasDeOutroSistema();
procedure restauraCadastroProduto(cod2 : String; msg : boolean);
procedure insereInutilizacoesFiscal();
procedure rateioCredICMS();
function buscaCST_PIS_Por_ISPIS(ispis1, codispis1 : String; var pis : currency) : string;
FUNCTION ACUM_PISCST2(prod_CFOP, prod_CST_PIS : String;vpis, vcofins, icms, total : currency; var listPis : TItensPISCOFINS; cod_ispis1, cstpis : String) : currency;
function leSerieDaChaveNfe(const chave : String) : String;
procedure leCFEsCONTRIBUICOES();
FUNCTION ACUM_PISCST(ALIQ_PIS : String; TOT_ITEM, VLR_PIS, CRED_PIS, DESC : currency) : currency;
FUNCTION ACUM_PISCST1(produto : TregProd; var listPis : TItensPISCOFINS; cod_ispis1, cstpis : String) : currency;
FUNCTION ACUM_IcmsCstCFOP(produto : TregProd; var listPis : TItensPISCOFINS; var base_calcICMS : currency) : currency;
FUNCTION VE_CSTPISCFOP(_CFOP1 : String) : STRING;
procedure iniciaContribuicoes();
FUNCTION MONTA_REG(var MAT : TStringList) : String;     
FUNCTION VALIDA_UNID(UNID : String) : String;     
function verificaConsistenciaReducaoZ : boolean;     
procedure VALIDALIQ(ALIQUOTA : String;var NUM_ALIQ : integer;var ALIQ : currency;var TRIB : String;var BASE_ICM : currency);
FUNCTION VE_VENDAECF(var query : tibquery; LIQ : boolean) : currency;
FUNCTION VAL_ALIQ(ALIQ : String) : integer;
FUNCTION VE_MOVCUPOM(DAT : TDate; ALIQ : Integer = 2; TOT : currency = 0; const indiceECF : String = '') : currency;
FUNCTION VE_ECF(const COD_ECF : integer) : String;
function ACHA_CODCLI(CPF_CNPJ, UF : String; nodo_destXML : String = '') : String;
FUNCTION CALC_PISCOF(var TOT_ITEM : currency; _ISPIS : String; var VLR_PIS, VLR_COFINS : currency; CST_PIS : String) : String;
FUNCTION CALC_PISCOF1(var TOT_ITEM : currency; _ISPIS : String; var VLR_PIS, VLR_COFINS : currency; CST_PIS : String; nfe : boolean = true) : String;
procedure SOMA_MOV(const COD: integer;const QTD2 : currency);
procedure zerarArrayProduto();
procedure leCFEs();
//procedure iniciaArrayProduto();
procedure addArrayProdutos(objeto : TregProd);
function achaObjetoNoArray(var lis : TItensProduto; const cod : integer) : integer;
procedure montaArquivo();
function ACHA_CODIGO(cod : String) : boolean;
function cabecalho_SF_Bloco_0(const contribuicoes : boolean = false) : String;
function bloco1() : String;
function blocoE() : String;
function blocoA() : String;
function blocoB() : String;
function blocoF(reg : integer = 1) : String;
function blocoG() : String;
function blocoH() : String;
function CriaBlocoH() : String;
function blocoI() : String;
function blocoM() : String;
function blocoP_vazio() : String;
function blocoM01012019() : String;
function blocoK() : String;
FUNCTION BLOCOP() : string;
FUNCTION BLOCO0500() : string;
function bloco0_Sped_Contribuicoes() : String;
FUNCTION CONTA_REG(REG : String) : String;
function leEntradas_SF() : Smallint;
function leSaidas_SF() : Smallint;
function leSaidas_Contribuicoes() : Smallint;
function leConhecimentos_de_frete_Bloco_D_SF(reg : integer = 1) : Smallint;
FUNCTION ACUM_ICM(ALIQ_CFOP : String; VALOR_ICM : currency; TIPO_DOC : String) : String;
FUNCTION ZERA_ALIQCFOP() : String;
FUNCTION ACUMULACOD(COD : String; var variavel : string) : String; overload;
FUNCTION ACUMULACOD(COD : Integer; var variavel : string) : String; overload;
FUNCTION TOTAL_MATRIZ(var mat1 : TStringList) : currency;
Function ACUMULA_COD(cod : String;const unid : String = '') : String;
PROCEDURE LE_VALORES_DADOADIC(var query : tibquery);
FUNCTION TOT_ADIC() : currency;
FUNCTION ALIQ_INTEREST(ESTADO : String) : currency;
FUNCTION ALIQ_CREDICM(const CODFOR : Integer) : currency;
function REM_SPED() : String;
function escreveArqSPED(var arqTXT : TextFile; const linha : String; var numercacao : integer) : String;
function escreveArqSPED_sem_somar(var arqTXT : TextFile; const linha : String) : String;
FUNCTION DADOS_ADNF(nota, fornec : Integer; var cod_sit, _CFOP, _FRETE, TIPO, _CHNFE, _SER : String) : String;
FUNCTION FORM_NUM1(VALOR : currency) : String;
FUNCTION DATA_BRA_FULL(DAT : TDateTime) : String;
procedure CriaArquivo(var arq : TextFile; Caminho, Texto : String);
FUNCTION DADOS_PROD(COD : String;var DESC, UNI, COD_ALIQ, TRIB, ISPIS, _CODISPIS : String; VAR ALIQ, BASE_ICM : Currency; const addUnidade : boolean = true) : String;
procedure carregaAliquotasEm_MATTRIB;
function buscaAlituota(cod : Integer) : Smallint;
function VE_UNIDADE(var uni : String) : String;
procedure MONTA_INVTXT(var arqTXT : TextFile; ano : String);
FUNCTION GRAVA_SPED(var arqTXT : TextFile; linha : String) : String;
procedure iniciaDataSets();
function addLinha(var cli : TClientDataSet; valor, campo : String) : integer;
FUNCTION ACUMULA_ALIQCFOP(ALIQ_CFOP : string; TOT_ITEM, BASE_ICM, TOT_ICM, TOT_ADC : currency) : String;
procedure LimpaMemoria();
FUNCTION TOTAL_REG(var HAND : TextFile; REG : String) : integer;
FUNCTION SEPARA_END(ENDE : String) : String;
function cortaString(texto : String; valor : integer) : String;
function cortaStringini(texto : String; valor : integer) : String;
function DECOMP_MOV1(const linh : String) : TStringList;
function adicionaVetor(var vetor : matriz; lin : String) : Boolean;
function achaVetor(var vetor : matriz; lin : String) : Integer;
function total_mat(var vetor : array of currency) : currency;
function zera_matriz(var vetor : array of currency) : currency;
procedure validaCFOP_DE_ENTRADA(var cfop : String);
procedure REM_CONTRIBUICOES();


implementation

uses Math, DB, StrUtils, principal;

procedure zerarArrayProduto();
begin
  listaProdutos.Clear;
end;

procedure addArrayProdutos(objeto : TregProd);
var
  tam, ini, idx : integer;
begin
  tam := listaProdutos.Count - 1;
  idx := -1;

  for ini := 0 to tam do
    begin
      if listaProdutos[ini].cod = 0 then
        begin
          idx := ini;
          break;
        end;
    end;

  if idx <> -1 then tam := idx
    else
      begin
        //SetLength(listaProdutos, tam + 2);
        //tam := tam + 1;
        //listaProdutos[tam]          := TregProd.Create;
        prodtemp := TregProd.Create;
        listaProdutos.Add(prodtemp);
      end;

  listaProdutos[tam].cod      := objeto.cod;
  listaProdutos[tam].quant    := objeto.quant;
  listaProdutos[tam].total    := objeto.total;
  listaProdutos[tam].unid     := objeto.unid;
  listaProdutos[tam].aliq     := objeto.aliq;
  listaProdutos[tam].descCom  := objeto.descCom;
  listaProdutos[tam].despAces := objeto.despAces;
  listaProdutos[tam].descNT   := objeto.descNT;
end;

function achaObjetoNoArray(var lis : TItensProduto; const cod : integer) : integer;
var
  ini, fim : integer;
begin
  result := -1;
  fim := lis.Count -1;
  for ini := 0 to fim do
    begin
      if lis[ini].cod = cod then
        begin
          result := ini;
        end;
    end;
end;

//ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
//TOTALIZA OS REGISTROS DO ARQUIVO
//ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
FUNCTION TOTAL_REG(var HAND : TextFile; REG : String) : integer;
//ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
var
  fim, ini, QTD, TOT: integer;
  LINHA : String;
begin
   Result := 0;
   QTD := length(REG);
   tot := 0;

   IF REG <> '' then
     begin
       fim := MAT_REG.count -1; //lCount -1;
       for ini := 0 to fim do
         begin
           IF LeftStr(REG, QTD) = LeftStr(MAT_REG.Names[ini], QTD) then TOT := TOT + StrToIntDef(MAT_REG.ValueFromIndex[ini], 0);
         end;

       IF TOT <> 0 then
         begin
           if MAT_REG.Values[LeftStr(REG, 1) + '990'] = '' then  TOT := TOT + 1;
         end;

       LINHA := '|' + LeftStr(REG, 1) + '990|' + IntToStr(TOT) + '|';
       GRAVA_SPED(HAND, LINHA);
       exit;
     end;

  GRAVA_SPED(HAND, '|9001|0|');
  CONTA_REG('9990');  //ACRESCENTA 9990
  CONTA_REG('9999');  //ACRESCENTA 9999
  //fim := MAT_REG.Count - 1;

  ini := 0;

  while true do
    begin
      if MAT_REG.Names[ini] = '9900' then QTD := StrToIntDef(MAT_REG.ValueFromIndex[ini], 0) + 1
        else QTD := StrToIntDef(MAT_REG.ValueFromIndex[ini], 0);

      if (MAT_REG.Names[ini]) <> '' then begin
        LINHA := '|9900|' + MAT_REG.Names[ini] + '|' + IntToStr(QTD) + '|';
        GRAVA_SPED(HAND, LINHA);
      end;

      fim := MAT_REG.Count -1;
      if ini = fim then break;
      ini := ini + 1;
    end;

  TOTAL_REG(HAND, '9');
  TOT := 0;

  fim := MAT_REG.Count -1;
  for ini := 0 to fim do
    begin
      TOT := TOT + StrToIntDef(MAT_REG.ValueFromIndex[ini], 0);
    end;

  LINHA := '|9999|' + IntToStr(TOT - 1) + '|';
  GRAVA_SPED(HAND, LINHA);

end;


procedure LimpaMemoria();
begin

  CODCFOP := '-';
  CODFOR  := '';
  try
    arqTemp.Free;
    MAT_REG.Free;
    codProd.Free;
    MAT_MOV.Free;
    dsaliq.Free;
  except
    ShowMessage('erro0');
  end;

  try
    lisTMP.Free;
    MAT_ALIQCFOP.Free;
    VAL_ALIQCFOP.Free;
    BAS_ALIQCFOP.Free;
    ICM_ALIQCFOP.Free;
    ADC_ALIQCFOP.Free;            
    MAT_NOTA.Free;
  except
     ShowMessage('erro1');
  end;

  try
    listaUnidades.Free;
    listaProdutos.Free;
    codigosClientesExterior.Free;
    lista0500.Free;
    listaChecaPIS.Free;
    TOT_ECF.Free;
    CloseFile(ARQ_SPED);
  except
    on e:exception do begin
      ShowMessage('erro343: ' + e.Message);
    end;
  end;


    dm.IBQuery4.Close;
    dm.IBQuery1.Close;
    dm.IBselect.Close;

  try
    finalize(dados_adic);
    listaPIS.Free;
    listaTOT_PIS.Free;
  except
    ShowMessage('erro3');
  end;


  end;

function addLinha(var cli : TClientDataSet; valor, campo : String) : integer;
begin
  cli.Insert;
  cli.FieldByName(campo).AsString := valor;
  cli.Post;

  Result := cli.RecordCount;
end;

procedure iniciaDataSets();
var
  i : integer;
begin
  //cria um registro de unidade - só teste
  reg1 := new(RegistroUnidade);
  listaUnidades := TList.Create;
  listaUnidades.Add(reg1);
  //teste unidades em Tlist

  listaPIS     := TItensPISCOFINS.Create;
  listaTOT_PIS := TItensPISCOFINS.Create;
  codigosClientesExterior := TStringList.Create;
  lista0500               := TStringList.Create;
  listaChecaPIS           := TStringList.Create;


  if FileExists(caminhoEXE_com_barra_no_final + 'CODPIS.txt') then begin
    listaChecaPIS.LoadFromFile(caminhoEXE_com_barra_no_final + 'CODPIS.txt');
  end
  else begin
    MessageDlg(caminhoEXE_com_barra_no_final + 'CODPIS.txt Não Encontrado. Favor Atualize seu sistema!',  mtError, [mbok], 1);
  end;


  CODCLI       := '-';
  ACUM_COD_FOR := '-';
  CODCFOP := '-';
  CODFOR := '-';
  ERRO_CHAVE := '';
  TOT_PIS    := 0;
  TOT_COFINS := 0;
  TOT_ITEM   := 0;
  TOT_PISST_ENT   := 0;
  TOTCREDICM      := 0;
  TOTDEBICM       := 0;
  totDespAcess    := 0;
  BASE_PIS_RD     := 0;
  BASE_PIS_ST     := 0;
  BASE_PIS_ISENTO := 0;

  mat_uni   := TItensUnid.Create;
  mat_uniok := TItensUnid.Create;
  arqTemp       := TClientDataSet.Create(Application);
  codProd       := TItensAcumProd.Create;
  MAT_MOV       := TItensAcumProd.Create;
  listaProdutos       := TItensProduto.Create;
  Lista0200Importados := TItensProduto.Create;
  TOT_ECF       := TItensAliqSped.Create;

  lisTMP       := TStringList.Create;
  MAT_REG      := TStringList.Create;

  MAT_ALIQCFOP := TStringList.Create;
  VAL_ALIQCFOP := TStringList.Create;
  BAS_ALIQCFOP := TStringList.Create;
  ICM_ALIQCFOP := TStringList.Create;
  ADC_ALIQCFOP := TStringList.Create;
  MAT_NOTA     := TStringList.Create;
  MAT_NOTA1    := TStringList.Create;

  dsaliq := TClientDataSet.Create(Application);
  dsaliq.FieldDefs.Add('cod', ftInteger);
  dsaliq.FieldDefs.Add('aliq', ftCurrency);
  dsaliq.FieldDefs.Add('cst', ftString, 5);
  dsaliq.FieldDefs.Add('reducao', ftCurrency);
  dsaliq.IndexFieldNames := 'cod';
  dsaliq.CreateDataSet;

  {codProd.FieldDefs.Add('cod', ftInteger);
  codProd.FieldDefs.Add('unid', ftString, 8);
  codProd.IndexFieldNames := 'cod';
  codProd.CreateDataSet;}

  arqTemp.FieldDefs.Add('cod', ftAutoInc);
  arqTemp.FieldDefs.Add('linha', ftstring, 200);
  arqTemp.CreateDataSet;


  //carrega tabela de unidades em mat_uni
  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select unid_ent, unid_sai from unid');
  dm.IBselect.Open;
  while not dm.IBselect.Eof do
    begin
      i := mat_uni.Add(TUnid.Create);
      mat_uni[i].unid_ent := dm.IBselect.FieldByName('unid_ent').AsString;
      mat_uni[i].unid_sai := dm.IBselect.FieldByName('unid_sai').AsString;
      //adicionaVetor(mat_uni, dm.IBselect.FieldByName('unid_ent').AsString);
      //adicionaVetor(mat_uni, dm.IBselect.FieldByName('unid_sai').AsString);
      dm.IBselect.Next;
    end; 
  dm.IBselect.Close;

  TRIB_ALIQ_PIS    := StrToCurrDef(funcoes.buscaParamGeral(11, '0,65'), 0.65);
  TRIB_ALIQ_COFINS := StrToCurrDef(funcoes.buscaParamGeral(12, '3'), 3);

  MAT_ALIQPIS  := TStringList.Create;
  BAS_ALIQPIS  := TStringList.Create;
  VAL_ALIQPIS  := TStringList.Create;
  BASC_ALIQPIS := TStringList.Create;
  CRED_ALIQPIS := TStringList.Create;
  DESC_ALIQPIS := TStringList.Create;
  MAT_CST_PIS  := TStringList.Create;

  TOT_PIS    := 0;
  TOT_COFINS := 0;
  _PIS       := 0;
  _COFINS    := 0;
  REC_BRUTA  := 0;
  BC_PISTRIB := 0;
  TOT_APUR_CST := 0;
end;

FUNCTION CONTA_REG(REG : String) : String;
begin
  Result := '';
  if MAT_REG.Values[REG] <> '' then
    begin
      MAT_REG.Values[REG] := IntToStr(StrToIntdef(MAT_REG.Values[REG], 0) + 1);
    end
  else
    begin
      MAT_REG.Values[REG] := '1';
    end;
end;

FUNCTION GRAVA_SPED(var arqTXT : TextFile; linha : String) : String;
begin
  CONTA_REG(copy(LINHA, 2, 4));
  linha := linha + #13 + #10;
  Write(arqTXT, linha);
end;

function VE_UNIDADE(var uni : String) : String;
var
 ret, ret1 : integer;
begin
  {uni := trim(uni);
  ret := mat_uni.Find(uni);

  if ret = -1 then uni := 'UN'
  else
    begin
      ret1 := mat_uniok.Find(uni);

      if ret1 = -1 then
        begin
          ret1 := mat_uniok.Add(TUnid.Create);
          mat_uniok[ret1].unid_ent := mat_uni[ret].unid_ent;
          mat_uniok[ret1].unid_ent := mat_uni[ret].unid_ent;
        end;

      Result := mat_uniok[ret1].unid_ent;
      exit;
    end;}

  if uni = '' then uni := 'UN';  
  ret1 := mat_uniok.Find(uni);

  if ret1 = -1 then
    begin
      ret1 := mat_uniok.Add(TUnid.Create);
      mat_uniok[ret1].unid_ent := uni;
    end;


  if uni = 'UN' then
    begin
      ret := mat_uni.Find(uni);
      if ret = -1 then
        begin
          ret := mat_uni.Add(TUnid.Create);
          mat_uni[ret].unid_ent := uni;
        end;
    end;   

  Result := uni;
end;

Function ACUMULA_COD(cod : String;const unid : String = '') : String;
var
  i : integer;
begin
  i := codProd.Find(StrToInt(strnum(cod)));
  if i = -1 then
    begin
      i := codProd.Add(TacumProd.Create);
      codProd[i].cod  := StrToInt(strnum(cod));
      codProd[i].unid := unid;
    end;

  {if not codProd.FindKey([cod]) then
    begin
      codProd.Insert;
      codProd.FieldByName('cod').AsString  := cod;
      codProd.FieldByName('unid').AsString := unid;
      codProd.Post;
    end;}
end;

function buscaAlituota(cod : Integer) : Smallint;
var
  i, fim : integer;
begin
  Result := -1;
  fim := MATTRIB.Count -1;

  for i := 0 to fim do
    begin
      aliquota := ItemALIQ(MATTRIB[i]);

      if aliquota.codigo = cod then
        begin
          Result := i;
          break;
        end;
    end;
end;

procedure carregaAliquotasEm_MATTRIB;
begin
  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select cod, aliq, cst, reducao from aliq order by cod');
  dm.IBselect.Open;

  while not dm.IBselect.Eof do
    begin
      dsaliq.Insert;
      dsaliq.FieldByName('cod').AsInteger := dm.IBselect.FieldByName('cod').AsInteger;
      dsaliq.FieldByName('aliq').AsCurrency := dm.IBselect.FieldByName('aliq').AsCurrency;
      dsaliq.FieldByName('cst').AsString := dm.IBselect.FieldByName('cst').AsString;
      dsaliq.FieldByName('reducao').AsCurrency := dm.IBselect.FieldByName('reducao').AsCurrency;
      dsaliq.Post;

      dm.IBselect.Next;
    end;
  dm.IBselect.Close;
end;

FUNCTION DADOS_PROD(COD : String;var DESC, UNI, COD_ALIQ, TRIB, ISPIS, _CODISPIS : String; VAR ALIQ, BASE_ICM : Currency; const addUnidade : boolean = true) : String;
var
 // CODPROD, CODPROD1 : String;
  NUM_ALIQ : integer;
begin
  //NESTA AREA DEVE ESTAR ABERTO A TABELA DE PRODUTOS INDEXADA POR CODIGO
  //SELECT 2
  //SEEK COD
  dm.IBQuery2.Close;
  dm.IBQuery2.SQL.Clear;
  dm.IBQuery2.SQL.Add('select nome, unid, aliquota, IS_PIS, COD_ISPIS from produto where cod = :cod');
  dm.IBQuery2.ParamByName('cod').AsString := COD;
  dm.IBQuery2.Open;

  ISPIS := ' ';
  _CODISPIS := '   ';
  NUM_ALIQ := 2;  //SE A ALIQUOTA FOR ZERO, ASSUME A ALIQUOTA 2 COMO PADRAO

  if not dm.IBQuery2.IsEmpty then
    begin
      //NUM_ALIQ := 0;
      DESC := dm.IBQuery2.fieldbyname('nome').AsString;
      UNI := trim(dm.IBQuery2.fieldbyname('unid').AsString);
      //IF(COD_ALIQ = NIL, COD_ALIQ := FIELD->ALIQUOTA, NIL)
      //if trim(COD_ALIQ) = '' then COD_ALIQ := dm.IBQuery2.fieldbyname('aliquota').AsString;
      COD_ALIQ := StrNum(trim(dm.IBQuery2.fieldbyname('aliquota').AsString));

      //NÃO CREDITAR ICMS DE MATERIAL DE CONSUMO
      IF (LeftStr(DESC, 1) = '_') and (StrToInt(strnum(COD_ALIQ)) <  11) then COD_ALIQ := '12';
      NUM_ALIQ := StrToIntDef(COD_ALIQ, 0);

      NUM_ALIQ := menor(NUM_ALIQ, 12);
      IF(NUM_ALIQ = 0) then NUM_ALIQ := 2;  //SE A ALIQUOTA FOR ZERO, ASSUME A ALIQUOTA 2 COMO PADRAO

      ISPIS := dm.IBQuery2.fieldbyname('IS_PIS').AsString;
      _CODISPIS := StrNum(dm.IBQuery2.fieldbyname('COD_ISPIS').AsString);

   //SE O CODIGO DA ISENÇÃO DO PIS É VALIDO, PEGA ELE, SENÃO, TORNA O PRODUTO TRIBUTADO
   IF ISPIS = '' then _CODISPIS := '';
   IF Length(trim(_CODISPIS)) <> 3 then
     begin
       _CODISPIS := '';
       ISPIS := '';
     end;
{   ELSE
     begin
       ShowMessage('O produto de codigo ' + COD + ' não foi encontrado. Será necessário recadastra-lo ' +
       'com este codigo, caso contrario a remessa ficara com inconsistencia. Sera aberto um cadastro ' +
       'com base nos dados da ultima venda deste item');
     end;}

       //SE FOI DADA INSTRUÇÃO PARA CADASTRAR ITEM EXCLUIDO
       // IF CADASTRA # NIL
       //ARQUIVO DE VENDAS
	{
   **********************************************
   |    LINHA 10342 DO ARQUIVO CONTROL1.PRG     |
   **********************************************

   SELECT 3
      DESC := ALLTRIM(FIELD->NOME)
      UNI := ALLTRIM(FIELD->UNIDADE)
      IF(COD_ALIQ = NIL, COD_ALIQ := FIELD->ALIQUOTA, NIL)
      NUM_ALIQ := MENOR(VAL(ALLTRIM(COD_ALIQ)), 12)
      IF(NUM_ALIQ = 0, NUM_ALIQ := 2, NIL)  //SE A ALIQUOTA FOR ZERO, ASSUME A ALIQUOTA 2 COMO PADRAO
      ISPIS := " "
      _PC := FIELD->P_COMPRA
      _PV := FIELD->PVENDA
      SELECT 2
      APPEND BLANK
      REPLACE CODIGO WITH COD, ;
         NOME WITH DESC, ;
         UNID WITH UNI, ;
         ALIQUOTA WITH COD_ALIQ, ;
	     P_COMPRA WITH _PC, ;
	     P_VENDA WITH _PV
       USE
       USE PRODUTO
       INDEX ON FIELD->CODIGO TO INDCOD
      ELSE
       DESC := "PRODUTO NAO CADASTRADO"
       UNI := "UN"
       NUM_ALIQ := 2
	   COD_ALIQ := "2"
    ENDIF}
     end;
 //aki pra frente falta terminar

  if dsAliq.FindKey([NUM_ALIQ]) then
    begin
      ALIQ := dsAliq.fieldbyname('aliq').AsCurrency; // PERC DE ICMS DA ALIQUOTA
      TRIB := dsAliq.fieldbyname('cst').AsString;  //CODIGO DA SITUACAO TRIBUTARIA
    end
   else
    begin
      ALIQ := 17.00;
      TRIB := '00';
    end;

  //SE A ALIQUOTA FOR DIFERENTE DE ZERO, PEGA O VALOR DA REDUCAO, CASO CONTRARIO A REDUCAO E ZERO
  BASE_ICM := IfThen(dsAliq.fieldbyname('reducao').AsCurrency = 0, 100, dsAliq.fieldbyname('reducao').AsCurrency);
  BASE_ICM := IfThen(ALIQ = 0, 0, BASE_ICM);

  //ACUMULA OS CODIGOS DE PRODUTOS QUE TIVERAM MOVIMENTO
  
  //VERIFICA A UNIDADE E ACUMULA PARA O CAMPO 0190
  if addUnidade then
    begin
      VE_UNIDADE(UNI);
      ACUMULA_COD(COD);
    end;  
end;



procedure CriaArquivo(var arq : TextFile; Caminho, Texto : String);
begin
  try
    AssignFile(arq, Caminho);
    Rewrite(arq);
  finally
  end;
end;


FUNCTION DATA_BRA_FULL(DAT : TDateTime) : String;
begin
  Result := FormatDateTime('ddmmyyyy', DAT);//STRZERO(DAY(DAT), 2) + STRZERO(MONTH(DAT), 2) + STRZERO(YEAR(DAT), 4)
end;


PROCEDURE LE_VALORES_DADOADIC(var query : tibquery);
BEGIN
  if not query.IsEmpty then
     begin
      DADOS_ADIC[1] := query.fieldbyname('TOTFRETE').AsCurrency;
      DADOS_ADIC[2] := query.fieldbyname('TOTSEG').AsCurrency;
      DADOS_ADIC[3] := query.fieldbyname('TOTDESC').AsCurrency;
      DADOS_ADIC[4] := query.fieldbyname('TOTDESCNT').AsCurrency;
      DADOS_ADIC[5] := query.fieldbyname('TOTDESPACES').AsCurrency;
      DADOS_ADIC[6] := query.fieldbyname('TOTPIS').AsCurrency;
      DADOS_ADIC[7] := query.fieldbyname('TOTCONFINS').AsCurrency;
      DADOS_ADIC[8] := query.fieldbyname('CREDICMS').AsCurrency;
      DADOS_ADIC[9] := query.fieldbyname('TOTICMSST').AsCurrency;
      DADOS_ADIC[10] := query.fieldbyname('TOTICMS_DESON').AsCurrency;
      DADOS_ADIC[11] := query.fieldbyname('CREDICMS_REAIS').AsCurrency;
     end
  else
    begin
      DADOS_ADIC[1] := 0;
      DADOS_ADIC[2] := 0;
      DADOS_ADIC[3] := 0;
      DADOS_ADIC[4] := 0;
      DADOS_ADIC[5] := 0;
      DADOS_ADIC[6] := 0;
      DADOS_ADIC[7] := 0;
      DADOS_ADIC[8] := 0;
      DADOS_ADIC[9] := 0;
      DADOS_ADIC[10] := 0;
      DADOS_ADIC[11] := 0;
    end;
END;

FUNCTION TOT_ADIC() : currency;
begin
  Result := DADOS_ADIC[1] + DADOS_ADIC[2] + DADOS_ADIC[5] + DADOS_ADIC[9];// + DADOS_ADIC[6] + DADOS_ADIC[7];
  // DADOS_ADIC[3] e DADOS_ADIC[4] não é adicionado pq é o valor do desconto da nota
end;


FUNCTION ALIQ_CREDICM(const CODFOR : Integer) : currency;
begin
  Result := 7;
  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select estado from fornecedor where cod = :cod');
  dm.IBselect.ParamByName('cod').AsInteger := CODFOR;
  dm.IBselect.Open;
  if dm.IBselect.IsEmpty then showmessage('Fornecedor não encontrado: ' + inttostr(CODFOR))
    else
     Result := ALIQ_INTEREST(dm.IBselect.fieldbyname('estado').AsString);
  dm.IBselect.Close;
end;

FUNCTION ALIQ_INTEREST(ESTADO : String) : currency;
begin
  Result := 12;
  if Contido(ESTADO, 'MG-PR-RS-RJ-SC-SP') then
    begin
      Result := 7;
    end;
  if ESTADO = 'RR' then Result := 17;
end;

function escreveArqSPED_sem_somar(var arqTXT : TextFile; const linha : String) : String;
begin
  Append(arqTXT);
  Writeln(arqTXT, linha);
end;

function escreveArqSPED(var arqTXT : TextFile; const linha : String; var numercacao : integer) : String;
begin
  numercacao := numercacao + 1;
  Append(arqTXT);
  Writeln(arqTXT, linha);
end;

FUNCTION DADOS_ADNF(nota, fornec : Integer; var cod_sit, _CFOP, _FRETE, TIPO, _CHNFE, _SER : String) : String;
begin
  Result := '';

  _CFOP  := '2102';
  _FRETE := '9';
  TIPO   := '55';
  _SER   := '1';
  _CHNFE := '';
  zera_matriz(DADOS_ADIC);
  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select * from SPEDDADOSADIC where (nota = :nota) and (fornec = :fornec)');
  dm.IBselect.ParamByName('nota').AsInteger   := nota;
  dm.IBselect.ParamByName('fornec').AsInteger := fornec;
  dm.IBselect.Open;

  if not dm.IBselect.IsEmpty then
    begin
      cod_sit := dm.IBselect.fieldbyname('cod_sit').AsString;
      if trim(cod_sit) = '' then cod_sit := '00';


      _CFOP   := dm.IBselect.fieldbyname('cfop').AsString;
      _FRETE  := dm.IBselect.fieldbyname('TIPOFRETE').AsString;
      tipo    := dm.IBselect.fieldbyname('tipo').AsString;
      _CHNFE  := dm.IBselect.fieldbyname('chavenfe').AsString;
      _SER    := dm.IBselect.fieldbyname('serie').AsString;

      //DADOS ADICIONAIS DA NF: 1-FRETE, 2-SEGURO 3-DESCONTO, 4-DESC. NAO TRIB, 5-DESP. ACESS., 6-PIS ST, 7-COFINS ST, 8-credImcs *****Control****
      LE_VALORES_DADOADIC(dm.IBselect); //carrega os valores da matriz DADOS_ADIC

      If ((TIPO <> '55') OR (NOT testaChaveNFE(_CHNFE))) then _CHNFE := '';
    end;

  dm.IBselect.Close;
end;

FUNCTION FORM_NUM1(VALOR : currency) : String;
begin
  Result := '0.00';
  //Result := CurrToStr(VALOR);
  Result := FormatCurr('0.00',VALOR);
end;


function REM_SPED() : String;
var
  ent : SmallInt;
begin
  datamov := now;

  mes := FormatDateTime('mm', datamov);
  ano := FormatDateTime('yy', datamov);

  mes := IntToStr(StrToInt(mes) - 1);

  if StrToInt(mes) = 0 then
   begin
     mes := '12';
     ano := IntToStr(StrToInt(ano) - 1);
   end;

  dataIni := '01/' + strzero(mes, 2) + '/' + ano;

  dataIni := dialogo('data', 0, '', 2, true, '', Application.Title,'Confirme a Data Inicial:', dataIni);
  if dataIni = '*' then exit;

  DataFim := FormatDateTime('dd/mm/yy', EndOfTheMonth(StrToDateTime(dataIni)));

  DataFim := dialogo('data', 0, '', 2, true, '', Application.Title,'Confirme a Data Final:', DataFim);
  if DataFim = '*' then exit;

  chaveAnoMes := FormatDateTime('yy', StrToDate(dataIni)) + FormatDateTime('mm', StrToDate(dataIni));

  CriaDiretorio(caminhoEXE_com_barra_no_final + 'SPED\TEMP');
  CriaDiretorio(caminhoEXE_com_barra_no_final + 'SPED');

  sim := dialogo('generico', 20, 'SN', 20, true, '', Application.Title,'Confirma remessa do Sped Fiscal de ' + dataIni + ' a ' + DataFim + ' ?', 'S');
  if sim = '*' then exit;

  arqSPED := caminhoEXE_com_barra_no_final + 'SPED\SPED' + FormatDateTime('mm', StrToDateTime(dataIni)) + FormatDateTime('yy', StrToDateTime(dataIni)) + '.txt';

  arqSPED :=  dialogo('normal', 400, '', 400, true, '', Application.Title,'Confirme o Nome do Arquivo de Remessa:', arqSPED);
  if arqSPED = '*' then exit;

  movimento := TStringList.Create;

  iniciaDataSets();  //iniciou o dataSet de unidades, linhas

  num1 := 0;
  num2 := 0;
  ERRO_CHAVE        := '';
  chavesDuplicidade := '';

{  if FileExists(arqSPED) then
    begin
       showmessage('A remessa do Sped Fiscal referente a este movimento ' +
       'já  existe, por isso não é possível gerar nova remessa.')  ;
       exit;
    end;}

  arqTmp := copy(arqSPED, 1, length(arqSPED) - 3) + 'TMP';
  CriaArquivo(ARQ_SPED, arqSPED, '');
  CriaArquivo(ARQ_TMP, arqTmp, '');

  DM.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select est from registro');
  dm.IBselect.Open;

  UF_EMPRESA := dm.IBselect.fieldbyname('est').AsString;
  dm.IBselect.Close;
  carregaAliquotasEm_MATTRIB; //carrega as aliquotas em um DataSet na memoria dsAliq

  if not verificaConsistenciaReducaoZ then
     begin
       LimpaMemoria();
       exit;
     end;

  try
   try
   informacao(0, fim, 'Verificando Entradas...', true, false, 5);
   erro1 := 0;

   blocoB();


   //gera os registros C100, C170 e C190 da tabela ENTRADA
   ent := leEntradas_SF();
   if ent = -1 then begin
     erro1 := 999;
     exit;
   end;

   if ent = -2 then begin
     erro1 := 998;
     exit;
   end;

   if erro1 = 1 then exit;

   leSaidas_SF();   //gera os registros C100, C170 e C190 das Vendas

   TOTAL_REG(ARQ_TMP, 'C');

   leConhecimentos_de_frete_Bloco_D_SF();
   TOTAL_REG(ARQ_TMP, 'D');

   blocoE();
   TOTAL_REG(ARQ_TMP, 'E');

   blocoG();


   try
   blocoH();
   TOTAL_REG(ARQ_TMP, 'H');
   except
     on e: exception do
       begin
         ShowMessage('ERRO BLOCOH: ' + e.Message + #13 + linha);
       end;
   end;

   blocoK();

   bloco1();
   TOTAL_REG(ARQ_TMP, '1');

   cabecalho_SF_Bloco_0();
   TOTAL_REG(ARQ_SPED, '0');

   TOTAL_REG(ARQ_TMP, '');
   except
     on e: exception do
       begin
         ShowMessage('ERRO: ' + e.Message);
       end;
   end;
  finally
    montaArquivo();
    informacao(0, fim, 'Aguarde...', false, true, 5);
    if erro1 = 0 then ShowMessage('Remessa criada com sucesso em: ' + #13 + arqSPED)
    else if erro1 = 999 then ShowMessage('Ocorreram Erros Na Entrada de Mercadoria e a Remessa Não foi Gerada!')
    else if erro1 = 998 then ShowMessage('Ocorreram Erros Na NFCes e a Remessa Não foi Gerada!');

    //if erro1 <> 999 then ShowMessage('Remessa criada com sucesso em: ' + #13 + arqSPED)
    //else ShowMessage('Ocorreram Erros Na Entrada de Mercadoria e a Remessa Não foi Gerada!');
    LimpaMemoria();
  end;

end;

FUNCTION ACUMULA_ALIQCFOP(ALIQ_CFOP : string; TOT_ITEM, BASE_ICM, TOT_ICM, TOT_ADC : currency) : String;
begin
  Result := MAT_ALIQCFOP.Values[ALIQ_CFOP];
 // if Result = '' then
 //   begin
      MAT_ALIQCFOP.Values[ALIQ_CFOP] := ALIQ_CFOP;
      VAL_ALIQCFOP.Values[ALIQ_CFOP] := CurrToStr(StrToCurrDef(VAL_ALIQCFOP.Values[ALIQ_CFOP], 0) + TOT_ITEM);
      BAS_ALIQCFOP.Values[ALIQ_CFOP] := CurrToStr(StrToCurrDef(BAS_ALIQCFOP.Values[ALIQ_CFOP], 0) + BASE_ICM);
      ICM_ALIQCFOP.Values[ALIQ_CFOP] := CurrToStr(StrToCurrDef(ICM_ALIQCFOP.Values[ALIQ_CFOP], 0) + TOT_ICM);
      ADC_ALIQCFOP.Values[ALIQ_CFOP] := CurrToStr(StrToCurrDef(ADC_ALIQCFOP.Values[ALIQ_CFOP], 0) + TOT_ADC);
   {   VAL_ALIQCFOP.Values[ALIQ_CFOP] := CurrToStr(TOT_ITEM);
      BAS_ALIQCFOP.Values[ALIQ_CFOP] := CurrToStr(BASE_ICM);
      ICM_ALIQCFOP.Values[ALIQ_CFOP] := CurrToStr(TOT_ICM);
      ADC_ALIQCFOP.Values[ALIQ_CFOP] := CurrToStr(TOT_ADC);
    end
  else
    begin
      VAL_ALIQCFOP.Values[ALIQ_CFOP] := CurrToStr(StrToCurr(VAL_ALIQCFOP.Values[ALIQ_CFOP]) + TOT_ITEM);
      BAS_ALIQCFOP.Values[ALIQ_CFOP] := CurrToStr(StrToCurr(BAS_ALIQCFOP.Values[ALIQ_CFOP]) + BASE_ICM);
      ICM_ALIQCFOP.Values[ALIQ_CFOP] := CurrToStr(StrToCurr(ICM_ALIQCFOP.Values[ALIQ_CFOP]) + TOT_ICM);
      ADC_ALIQCFOP.Values[ALIQ_CFOP] := CurrToStr(StrToCurr(ADC_ALIQCFOP.Values[ALIQ_CFOP]) + TOT_ADC);
    end;
}end;

FUNCTION TOTAL_MATRIZ(var mat1 : TStringList) : currency;
var inic : integer;
begin
  fim := mat1.Count - 1;
  Result := 0;
  for inic := 0 to fim do
    begin
      Result := Result + StrToCurrDef(mat1.ValueFromIndex[inic], 0);
    end;
end;

FUNCTION ACUMULACOD(COD : String; var variavel : string) : String;
begin
  COD := COD + '-';
  if  (Pos('-' + COD, variavel) = 0) then
    begin
      variavel := variavel + COD;
    end;
end;

FUNCTION ACUMULACOD(COD : Integer; var variavel : string) : String;
var codd : string;
begin
  codd := inttostr(COD);
  codd := codd + '-';
  if  (Pos('-' + codd, variavel) = 0) then
    begin
      variavel := variavel + codd;
    end;
end;

FUNCTION ZERA_ALIQCFOP() : String;
begin
  MAT_ALIQCFOP.Clear;
  VAL_ALIQCFOP.Clear;
  BAS_ALIQCFOP.Clear;
  ICM_ALIQCFOP.Clear;
  ADC_ALIQCFOP.Clear;  //DADOS ADICIONAIS DA NOTA
end;

FUNCTION ACUM_ICM(ALIQ_CFOP : String; VALOR_ICM : currency; TIPO_DOC : String) : String;
var
  _CFOP : string;
begin
  _CFOP := copy(ALIQ_CFOP, 4, 4);
  IF (Contido(LeftStr(_CFOP, 1), '123') or (_CFOP = '1605'))     then TOTCREDICM := TOTCREDICM + (VALOR_ICM)
  ELSE IF (Contido(LeftStr(_CFOP, 1), '567') or (_CFOP = '5605'))then TOTDEBICM := TOTDEBICM   + (VALOR_ICM)
  ELSE
    begin
      ShowMessage('Icms no valor de R$ ' + FORM_NUM1(VALOR_ICM) + ' foi registrado ' +
      'no codigo CFOP ' + _CFOP + ' pelo documento ' + TIPO_DOC + '. Este codigo e invalido' +
      ' e deve causar diferenca na apuração do ICMS. ' + #13 + 'ALIQ_CFOP='+ALIQ_CFOP);
    end;
end;

function leEntradas_SF() : Smallint;
var
 _COD_FORNEC, dinicrip, dfimcrip, cfopTemp, cod_sit : String;
 DATA_EMI : TDateTime;
 ini, i, fim, tmp1, C : integer;
 prod : TregProd;
 texto : TStringList;
 quant : double;
begin
  Result := -1;
  if MessageDlg('Deseja fazer a checagem de NFCes ?', mtConfirmation, [mbYes, mbNo], 1) = idyes then begin
    if funcoes.verificaNFCe(dataIni, DataFim, true) = false then begin
      Result := -2;
      exit;
    end;
  end;

  if funcoes.verificaNFe(dataIni, DataFim, true) = false then begin
    Result := -2;
    exit;
  end;

  if not funcoes.checaEntradasSped(dataIni, DataFim) then begin
    if MessageDlg('A Soma dos Dados Adicionais Não Conferem, Deseja Continuar Assim Mesmo ?', mtConfirmation, [mbYes, mbNo], 1) = idno then exit;
  end;
  Result := 0;
   {COMECO DA PARTE DE ENTRADAS}

  // este select busca as notas de entrada que a numeração nao foi gerada automaticamente
  // ex: dia + mes + ano = nota

  zera_Matriz(dados_adic);

  dm.IBQuery4.Close;
  dm.IBQuery4.SQL.Text := ('select cod from SPED_REDUCAOZ where (data >= :dataini) and (data <= :datafim)');
  dm.IBQuery4.ParamByName('dataini').AsDateTime := StrToDate(dataIni);
  dm.IBQuery4.ParamByName('datafim').AsDateTime := StrToDate(DataFim);
  dm.IBQuery4.Open;
  dm.IBQuery4.FetchAll;
  fim := dm.IBQuery4.RecordCount;

  dm.IBQuery4.Close;
  dm.IBQuery4.SQL.Text := 'select chave, nota, cliente, data from nfce where (data >= :ini) and (data <= :fim) and (ADIC = '''')';
  //dm.IBselect.ParamByName('tipo').AsString := TIPO;
  dm.IBQuery4.ParamByName('ini').AsDate  := StrToDate(dataIni);
  dm.IBQuery4.ParamByName('fim').AsDate  := StrToDate(DataFim);
  dm.IBQuery4.Open;
  dm.IBQuery4.FetchAll;
  fim := fim + dm.IBQuery4.RecordCount;

  dm.IBQuery4.Close;
  dm.IBQuery4.SQL.Text := 'select * from nfe where (data >= :dataini) and (data <= :datafim)  and ((tipo <> ''2'') or (tipo is null)) ';
  dm.IBQuery4.ParamByName('dataini').AsDateTime := StrToDate(dataIni);
  dm.IBQuery4.ParamByName('datafim').AsDateTime := StrToDate(DataFim);
  dm.IBQuery4.Open;
  dm.IBQuery4.FetchAll;

  fim := fim + dm.IBQuery4.RecordCount;

  dm.IBQuery4.Close;
  //dm.IBQuery4.SQL.Text := ('select * from entrada where (chegada >= :dataini) and (chegada <= :datafim)');
  dm.IBQuery4.SQL.Text := ('select * from entrada where (cast(chegada as date) >= :dataini) and (cast(chegada as date) <= :datafim) and' +
  ' (nota <> LPAD(EXTRACT(DAY FROM chegada), 2, ''0'') || LPAD(EXTRACT(MONTH FROM chegada), 2, ''0'') || right(EXTRACT(YEAR FROM chegada), 2)) ORDER BY nota'); {FORMATACAO DA DATA PARA ddmmyy}
  dm.IBQuery4.ParamByName('dataini').AsDateTime := StrToDate(dataIni);
  dm.IBQuery4.ParamByName('datafim').AsDateTime := StrToDate(DataFim);
  dm.IBQuery4.Open;
  dm.IBQuery4.FetchAll;

  fim := fim + dm.IBQuery4.RecordCount;

   if fim > 0 then
    begin
      LINHA := '|C001|0|';
    end
  else
    begin
      LINHA := '|C001|1|';
    end;
  GRAVA_SPED(ARQ_TMP, LINHA);

  TRIB := '00';
  texto := TStringList.Create;

  while not dm.IBQuery4.Eof do begin
      listaTOT_PIS.Clear;

      informacao(dm.IBQuery4.RecNo, c, 'Verificando Entradas...', false, false, 5);

      NOTA := dm.IBQuery4.fieldbyname('nota').AsInteger;
      COD  := '00';
      QTD  := 0;
      TOT  := 0;
      ALIQ := 0;

      ZERA_ALIQCFOP(); //ZERA OS TOTALIZADORES DE ALIQUOTA

      _DAT1   := dm.IBQuery4.fieldbyname('data').AsDateTime;
      _DAT2   := dm.IBQuery4.fieldbyname('chegada').AsDateTime;
      COD_FOR := dm.IBQuery4.fieldbyname('fornec').AsInteger;

      //LOCALIZA O ESTADO DO FORNECEDOR E DEVOLVE A ALIQUOTA INTERESTADUAL DE ICMS
      ALIQ := ALIQ_CREDICM(COD_FOR);

      //BUSCA DADOS ADICIONAIS DA NOTA FISCAL
      //DADOS_ADIC É UMA MATRIZ COM 8 POSIÇÕES, O OITAVO TERMO É O PERCENTUAL DE CRÉDITO DE ICMS

      DADOS_ADNF(NOTA, COD_FOR, cod_sit, _CFOP, _FRETE, TIPO, _CHNFE, _SER);

      if length(StrNum(_CHNFE)) = 44 then  _SER := leSerieDaChaveNfe(_CHNFE);

      if ((tipo = '55') and (length(_CHNFE) <> 44)) then begin
        //ShowMessage(_CHNFE);
        ERRO_CHAVE := ERRO_CHAVE + inttostr(NOTA) + ' ';
      end;

      if (length(_CHNFE) = 44) then begin
        if chavesDuplicidade = '' then chavesDuplicidade := '|';

        chavesDuplicidade := chavesDuplicidade + _CHNFE + '|';
      end;

      dm.IBselect.Close;
      dm.IBselect.SQL.Clear;
      dm.IBselect.SQL.Add('select estado from fornecedor where cod = :cod');
      dm.IBselect.ParamByName('cod').AsInteger := COD_FOR;
      dm.IBselect.Open;

      validaCFOP_DE_ENTRADA(_CFOP); // verifica se é valido este cfop

      if ((_CFOP = '2102') AND (dm.IBselect.FieldByName('estado').AsString = UF_EMPRESA)) then _CFOP := '1102';

      dm.IBselect.Close;
      dm.IBselect.SQL.Clear;
      dm.IBselect.Params.Clear;
      dm.IBselect.SQL.Add('select i.cod,p.aliquota, i.CRED_ICMS, i.quant, i.p_compra, trim(i.unid)as unid, p.tipo_item from item_entrada i left join produto p on (p.cod = i.cod)'+
      ' where (i.nota = :nott) and (i.fornec = :fornec)');
      dm.IBselect.ParamByName('nott').AsInteger   := nota;
      dm.IBselect.ParamByName('fornec').AsInteger := COD_FOR;
      dm.IBselect.Open;

      listaProdutos.Clear;
      TOT := 0;

      //PEGA OS ITENS DA NOTA E PASSA PARA O DATASET DSPRODUTO
      while not dm.IBselect.Eof do
        begin
          tmp1 := listaProdutos.Find(dm.IBselect.fieldbyname('cod').AsInteger);

          quant := dm.IBselect.fieldbyname('quant').AsExtended;
          if ((cod_sit = '06') and (quant = 0)) then quant := 1;

          TOT_ITEM := arredonda(quant * dm.IBselect.fieldbyname('p_compra').AsExtended, 2);

          if tmp1 = -1 then
            begin
              UNID := trim(dm.IBselect.fieldbyname('unid').AsString);
              tmp1 := listaProdutos.Add(TregProd.Create);
              ACUMULA_COD(dm.IBselect.fieldbyname('cod').AsString, UNID);
              VE_UNIDADE(unid);
              listaProdutos[tmp1].tipo_item := dm.IBselect.fieldbyname('tipo_item').AsString;
              listaProdutos[tmp1].cod       := dm.IBselect.fieldbyname('cod').AsInteger;
              listaProdutos[tmp1].quant    := quant;
              listaProdutos[tmp1].unid     := unid;
              listaProdutos[tmp1].aliq     := '00';
              listaProdutos[tmp1].cod_aliq := StrToInt(strnum(dm.IBselect.FieldByName('aliquota').AsString));
              //falta ler os valores de arredondamento
              //prod.total := arredonda(dm.IBselect.fieldbyname('quant').AsCurrency * dm.IBselect.fieldbyname('p_compra').AsCurrency, 2);
              listaProdutos[tmp1].total    := TOT_ITEM;
              listaProdutos[tmp1].descCom  := 0;
              listaProdutos[tmp1].despAces := 0;
              listaProdutos[tmp1].descNT   := 0;
              listaProdutos[tmp1].descNT   := 0;
              listaProdutos[tmp1].aliqCred := dm.IBselect.fieldbyname('CRED_ICMS').AsCurrency;
            end
          else
            begin
              listaProdutos[tmp1].quant := listaProdutos[tmp1].quant + quant;
              listaProdutos[tmp1].total := listaProdutos[tmp1].total + TOT_ITEM;
            end;

          TOT := TOT + TOT_ITEM;

          dm.IBselect.Next;
        end;

      //FreeAndNil(prod);

      // A MATRIZ DADOS_ADIC JÁ ESTA POPULADA COM OS 7 VALORES DE DADOS ADICIONAIS
      // 1-FRETE, 2-SEGURO 3-DESCONTO, 4-DESC. NAO TRIB, 5-DESP. ACESS., 6-PIS ST, 7-COFINS ST

      //if (total_mat(DADOS_ADIC)) > 0 then //total dos dados adicionais da NF-e
      if (DADOS_ADIC[3] + DADOS_ADIC[4] + TOT_ADIC() + DADOS_ADIC[10]) > 0 then
        begin
          QTD  := DADOS_ADIC[3] ; //DESCONTO COMERCIAL
	        QTD1 := DADOS_ADIC[4] + DADOS_ADIC[10]; //DESCONTO NT
          POS1 := TOT_ADIC(); //DADOS ADICIONAIS DA NOTA FISCAL - DESCONTO

          POS2 := POS1;
          //ini := low(listaProdutos);
          fim := listaProdutos.Count -1; //indiceFinalArrayProduto;
        
          for ini := 0 to fim do
            begin
              IF (QTD + QTD1 + POS1) = 0 then break;
              IF ini = fim then
                begin
                  //SE E O ULTIMO ITEM DA NOTA, PEGA O RESTANTE DO DESCONTO(SE FOR O UNICO TAMBEM)
                  listaProdutos[ini].descCom  := listaProdutos[ini].descCom  + QTD;
                  listaProdutos[ini].descNT   := listaProdutos[ini].descNT   + QTD1;
                  listaProdutos[ini].despAces := listaProdutos[ini].despAces + POS1;

                  break;
                end;

              //RATEIA DESCONTO COMERCIAL
              LIDO := (listaProdutos[ini].total / TOT) * DADOS_ADIC[3];
              IF LIDO > 0 then
                begin
                  IF LIDO <= QTD then
                    begin
                      listaProdutos[ini].descCom  := listaProdutos[ini].descCom + LIDO;
                      QTD := QTD - LIDO;
                    end
                  ELSE
                    begin
                      listaProdutos[ini].descCom  := listaProdutos[ini].descCom + QTD;
                      QTD := 0;
                    end;
                end;

                //RATEIA DESPESAS ACESSORIAS DA NOTA
                //LIDO := ARREDONDA((dsProduto.FieldByName('total').AsCurrency / TOT) * POS1, 2);
                LIDO := (listaProdutos[ini].total / TOT) * POS2;
                IF LIDO > 0 then
                  begin
                    IF LIDO <= POS1 then
                      begin
                        listaProdutos[ini].despAces  := listaProdutos[ini].despAces + LIDO;
                        POS1 := POS1 - LIDO;
                      end
                    ELSE
                      begin
                        listaProdutos[ini].despAces  := listaProdutos[ini].despAces + POS1;
                        POS1 := 0;
                      end;
                  end;

                  //RATEIA DESCONTO NT
                  //LIDO := ARREDONDA((dsProduto.FieldByName('total').AsCurrency / TOT) * DADOS_ADIC[4], 2);


                  LIDO := ArredondaTrunca((listaProdutos[ini].total / TOT) * (DADOS_ADIC[4] + DADOS_ADIC[10]), 2);

                  {ShowMessage(CurrToStr(DADOS_ADIC[4] + DADOS_ADIC[10]) + #13 +
                  CurrToStr(LIDO) + #13 +
                  CurrToStr(QTD1));}
                  Sleep(1);

			            IF LIDO > 0 then
                    begin
                      IF LIDO <= QTD1 then
                        begin
                          listaProdutos[ini].descNT  := listaProdutos[ini].descNT + LIDO;
                          QTD1 := QTD1 - LIDO;
                        end
                      ELSE
                        begin
                          listaProdutos[ini].descNT  := listaProdutos[ini].descNT + QTD1;
                          QTD1 := 0;
                        end;
                    end;
            end;
        end; // se tem dados adic > 0

  lisTMP.Clear;
  //ini := low(listaProdutos);
  fim := listaProdutos.Count -1;
  listaTOT_PIS.Clear;
  TOT_APUR_CST := 0;
  TOT := 0;

  {inicio do rateio do }

  if DADOS_ADIC[11] > 0 then begin
    rateioCredICMS();
    //essa rotina faz o rateio do credito de icms em Reais se Houver
  end;


  ret := 0;

  cfopTemp := _CFOP;

  for ini := 0 to fim do
    begin
       _CFOP := cfopTemp;
       ret := ret + 1;

       DADOS_PROD(IntToStr(listaProdutos[ini].cod) , DESC, UNID, COD_ALIQ, TRIB, ISPIS, COD_ISPIS, PERC_ICMS, BASE_ICM, false);

       UNID := listaProdutos[ini].unid;

       SOMA_MOV(listaProdutos[ini].cod, listaProdutos[ini].quant);
       //ALIQUOTA DE ICMS (PEGA A ALIQUOTA INTERESTADUAL)
       TOT_ITEM := listaProdutos[ini].total;
       BASE_ICM := 0;

       if DADOS_ADIC[11] > 0 then begin //credICMS Reais dados adicionais
         PERC_ICMS := listaProdutos[ini].PERC_ICM;
         BASE_ICM  := listaProdutos[ini].total - listaProdutos[ini].descCom;
         TRIB      := '00';
       end
       else begin
         PERC_ICMS := MENOR(ALIQ, PERC_ICMS);
         //CALCULA O VALOR DO CREDITO DE ICMS, SE TIVER
         //BASE_ICM := IfThen(TRIB = '00', TOT_ITEM - dsProduto.fieldbyname('descCom').AsCurrency, 0);//MAT_ITENS[INI, 4] - MAT_ITENS[INI, 6], 0) //TIRANDO APENAS DESCONTO COMERCIAL DA BASE DE CALCULO
         BASE_ICM := IfThen(TRIB = '00', TOT_ITEM - listaProdutos[ini].descCom, 0);//MAT_ITENS[INI, 4] - MAT_ITENS[INI, 6], 0) //TIRANDO APENAS DESCONTO COMERCIAL DA BASE DE CALCULO
         if COD_ALIQ = '0' then COD_ALIQ := '2';

	       //VERIFICA SE FOI INFORMADA ALIQUOTA DE CREDITO DE ICMS EM DADOS ADICIONAIS DA NF (TERMO 8) E O PRODUTO É TRIBUTADO
	       //CALCULA O CREDITO POR ESTA ALIQUOTA INFORMADA EM DADOS_ADICIONAIS
         // O OITAVO TERMO É O CRÉDITO DE ICMS DA NFe

         IF(DADOS_ADIC[8] <> 0) AND (StrToInt(COD_ALIQ) < 10) then PERC_ICMS := DADOS_ADIC[8];
       end;

       if listaProdutos[ini].aliqCred > 0 then begin
         PERC_ICMS := listaProdutos[ini].aliqCred;
         BASE_ICM  := listaProdutos[ini].total - listaProdutos[ini].descCom;
         TRIB      := '00';
       end;

       if funcoes.buscaParamGeral(10, '') = '1' then begin
         listaProdutos[ini].TOT_ICM := 0;
         BASE_ICM  := 0;
       end;

       if ((_CFOP = '1102') AND (RightStr(TRIB, 2) = '60')) then _CFOP := '1403';
       if ((_CFOP = '2102') AND (RightStr(TRIB, 2) = '60')) then _CFOP := '2403';

       //SE A ALIQUOTA S ECREDITO FOR IGUAL 0,01, ENTAO ZERA
       IF(PERC_ICMS = 0.01) then PERC_ICMS := 0;


       //se for material de uso ou consumo entao zera o icms
       if LeftStr(trim(DESC), 1) = '_' then begin
         listaProdutos[ini].tipo_item := '07';
         PERC_ICMS := 0;
       end;

       //TOT_ICM := IfThen(TRIB = '00', ARREDONDA(BASE_ICM * PERC_ICMS / 100, 2), 0);
       TOT_ICM := 0;
       //if BASE_ICM > 0 then TOT_ICM := IfThen(TRIB = '00', RoundTo1(BASE_ICM * PERC_ICMS / 100), 0);
       if BASE_ICM > 0 then TOT_ICM := IfThen(TRIB = '00', BASE_ICM * PERC_ICMS / 100);

       IF TOT_ICM = 0 THEN BASE_ICM := 0;

       TOT_ICM := ArredondaFinanceiro(TOT_ICM, 2);

       if  (Pos('-' +_CFOP + '-', CODCFOP) = 0) then CODCFOP := CODCFOP + _CFOP + '-';

       LINHA := '|C170|' + IntToStr(ini + 1) + '|' + strzero(listaProdutos[ini].cod, 6) + '|' + trim(DESC) + '|' +
       FORM_NUM1(listaProdutos[ini].quant) + '|' + UNID + '|' + FORM_NUM1(TOT_ITEM) + '|' + FORM_NUM1(listaProdutos[ini].descCom) + '|' +
        IfThen( leftt(DESC, 1) = '_', '1', '0') + '|' + '0' + TRIB + '|' + _CFOP + '|' + _CFOP + '|' +
       FORM_NUM1(BASE_ICM) + '|' + FORM_NUM1(IfThen(TRIB = '00', PERC_ICMS, 0)) + '|' + FORM_NUM1(TOT_ICM) + '|' +
       '0|0|0|0|03||0|0|0|99|0|0|0|0|0|99|0|0|0|0|0||' + IfThen(StrToDateTime(dataIni) >= StrToDateTime('01/01/2019'),FORM_NUM1(listaProdutos[ini].descNT)+ '|', '');
       //CAMPO 09 - IF(LEFT(DESC, 1) = "_", "1", "0") - MAT DE CONSUMO - NAO EXISTE MOV. FISICA DO ITEM
       //ITENS DE MATERIAL DE CONSUMO DEVEM COMECAR COM O CARACTERE "_"

       lisTMP.Add(linha); // adiciona em uma lista temporária

       ALIQ_CFOP := TRIB + '|' + _CFOP + '|' + FORM_NUM1(IfThen(TRIB = '00', PERC_ICMS, 0));

       //ACUMULA NOS TOTALIZADORES DE ALIQUOTA E CFOP
       //totDespAcess := dsProduto.fieldbyname('despAces').AsCurrency - dsProduto.fieldbyname('descCom').AsCurrency - dsProduto.fieldbyname('descNT').AsCurrency;

       totDespAcess := listaProdutos[ini].despAces - listaProdutos[ini].descCom - listaProdutos[ini].descNT;

       {if NOTA = 152  then begin

       ShowMessage('listaProdutos[ini].despAces=' + CurrToStr(listaProdutos[ini].despAces) + #13 +
       'listaProdutos[ini].descCom=' + CurrToStr(listaProdutos[ini].descCom) + #13 + 'listaProdutos[ini].descNT=' + CurrToStr(listaProdutos[ini].descNT));
       end;}


       //if totDespAcess < 0 then totDespAcess := 0;
       

       if TRIB = '41' then begin
         //ShowMessage(linha + #13 + #13 + CurrToStr(totDespAcess) + #13 + CurrToStr(TOT_ICM));
       end;

       ret := listaTOT_PIS.Find(ALIQ_CFOP);

       if ret = -1 then begin
         ret := listaTOT_PIS.Add(TacumPis.Create);
         listaTOT_PIS[ret].cod    := ALIQ_CFOP;
         listaTOT_PIS[ret].Base   := BASE_ICM;
         listaTOT_PIS[ret].icms   := TOT_ICM;
         listaTOT_PIS[ret].total  := TOT_ITEM;
         listaTOT_PIS[ret].cofins := totDespAcess;
       end
       else begin
         listaTOT_PIS[ret].Base   := listaTOT_PIS[ret].Base   + BASE_ICM;
         listaTOT_PIS[ret].icms   := listaTOT_PIS[ret].icms   + TOT_ICM;
         listaTOT_PIS[ret].total  := listaTOT_PIS[ret].total  + TOT_ITEM;
         listaTOT_PIS[ret].cofins := listaTOT_PIS[ret].cofins + totDespAcess;
       end;

     { if nota = 151400 then begin
        TOT_APUR_CST := TOT_APUR_CST + listaProdutos[ini].descCom;
        // listaProdutos[ini].despAces + listaProdutos[ini].descCom + listaProdutos[ini].descNT;
        ShowMessage(listaTOT_PIS.getText + #13 + #13+ trib + #13 + CurrToStr(totDespAcess)+ #13 +
        CurrToStr(TOT_ITEM)+ #13 + CurrToStr(TOT_ICM)+ #13 + CurrToStr(BASE_ICM) + #13 + 'item: ' + #13 +
        CurrToStr(listaProdutos[ini].despAces)+ #13 +CurrToStr(listaProdutos[ini].descCom)+ #13 +CurrToStr(listaProdutos[ini].descNT)+ #13 );
      end;}


       //ACUMULA_ALIQCFOP(ALIQ_CFOP, TOT_ITEM, BASE_ICM, TOT_ICM, totDespAcess);
      // dsProduto.Next;
   END;

   //DADOS ADICIONAIS DA NF: 1-FRETE, 2-SEGURO 3-DESCONTO, 4-DESC. NAO TRIB, 5-DESP. ACESS., 6-PIS ST, 7-COFINS ST
   //SUBTRAI DO TOTAL DAS MERCADORIAS O VALOR DO DESCONTO COMERCIAL

   fim := listaTOT_PIS.Count -1;
   //TOTALIZA A NOTA COM VÁRIOS SUB-TOTAIS SEPARADOS POR ALIQUOTAS DIFERENTES
   TOT := 0; BASE_ICM := 0; TOT_ICM  := 0;
   FOR ini := 0 TO fim do begin
     BASE_ICM := BASE_ICM + listaTOT_PIS[ini].Base;
     TOT      := TOT      + listaTOT_PIS[ini].total;
     TOT_ICM  := TOT_ICM  + listaTOT_PIS[ini].icms;
   end;

   //TOTAL DA NOTA = SOMA DOS VALORES DO ITENS (JA TIRADOS OS DESCONTOS) + SOMA DOS DADOS ADICIONAIS
   // VAL_ALIQCFOP tem o total dos itens

   POS1 :=  (TOT + TOT_ADIC() - DADOS_ADIC[3]) - DADOS_ADIC[4] - DADOS_ADIC[10];
   //POS1 :=  (TOT + TOT_ADIC() - DADOS_ADIC[3]) - DADOS_ADIC[4] ;
   //POS1 :=  (TOT + TOT_ADIC() - DADOS_ADIC[3]);
   //POS1 :=  (TOT + TOT_ADIC() - DADOS_ADIC[10]);
   //POS1 :=  (TOT + TOT_ADIC());

   {if NOTA =151 then begin
     ShowMessage('total Geral='+ CurrToStr(POS1) +#13+ 'TOT=' + CurrToStr(tot) + #13 +
     'TOT_ADIC()='+ CurrToStr(TOT_ADIC()) + #13 + 'DADOS_ADIC[3]='+ CurrToStr(DADOS_ADIC[3])+#13+

      'DADOS_ADIC[4]='+ CurrToStr(DADOS_ADIC[4]) + #13 +  'DADOS_ADIC[10]=' + CurrToStr(DADOS_ADIC[10]));
   end;}


   //if BASE_ICM > POS1 then BASE_ICM := POS1;

   if strnum(tipo) = '5' then tipo := '1B';
   
   LINHA := '|C100|'+IfThen(TIPO = '65', '1', '0')+'|1|1' + strzero(COD_FOR, 6) + '|' + strzero(TIPO, 2) + '|00|' + _SER + '|' + inttostr(NOTA) + '|' + _CHNFE + '|' + //9
   DATA_BRA_FULL(_DAT1) + '|' + DATA_BRA_FULL(_DAT2) + '|' +   FORM_NUM1(POS1) + '|0|' +
    FORM_NUM1(DADOS_ADIC[3]) + '|' + FORM_NUM1(DADOS_ADIC[4] + DADOS_ADIC[10]) + '|' + FORM_NUM1(TOT) +
    '|' + _FRETE + '|' + FORM_NUM1(DADOS_ADIC[1]) + '|' + FORM_NUM1(DADOS_ADIC[2]) +  '|' + FORM_NUM1(DADOS_ADIC[5]) + '|' +
// {21}  FORM_NUM1(BASE_ICM) + '|' + FORM_NUM1(TOT_ICM) + '|0|'+FORM_NUM1(DADOS_ADIC[9])+'|0|0|0|' + FORM_NUM1(DADOS_ADIC[6]) + '|' + FORM_NUM1(DADOS_ADIC[7]) + '|';
 {21}  FORM_NUM1(BASE_ICM) + '|' + FORM_NUM1(TOT_ICM) + '|0|0|0|0|0|' + FORM_NUM1(DADOS_ADIC[6]) + '|' + FORM_NUM1(DADOS_ADIC[7]) + '|';

   GRAVA_SPED(ARQ_TMP, LINHA);

   texto.Add('|' + inttostr(NOTA) + '|' + inttostr(COD_FOR) + '|' + CURRTOSTR(POS1) + '|' + _CHNFE + '|');

   TOT_PISST_ENT := TOT_PISST_ENT + (DADOS_ADIC[6] + DADOS_ADIC[7]);

   fim := lisTMP.Count -1;
   //GRAVA ITENS DA NOTA - REGISTROS C170
   FOR INI := 0 TO fim do
     begin
       linha := lisTMP[ini];
       GRAVA_SPED(ARQ_TMP, linha);
     end;

   fim := listaTOT_PIS.Count -1;
   //TOTALIZA A NOTA COM VÁRIOS SUB-TOTAIS SEPARADOS POR ALIQUOTAS DIFERENTES
   FOR ini := 0 TO fim do begin
     TOT := listaTOT_PIS[ini].total + listaTOT_PIS[ini].cofins;

     LINHA := '|C190|0' + listaTOT_PIS[ini].cod + '|' + FORM_NUM1(TOT) + '|' +
     FORM_NUM1(listaTOT_PIS[ini].Base) + '|'  + FORM_NUM1(listaTOT_PIS[ini].icms) + '|'  +
     '0|0|0|0||';
     GRAVA_SPED(ARQ_TMP, LINHA);
     ACUM_ICM(listaTOT_PIS[ini].cod, listaTOT_PIS[ini].icms, 'Nota de entrada: ' + inttostr(NOTA));
   end;

   //ACUMULA O CODIGO DO FORNECEDOR PARA INFORMAR NO REGISTRO 0150
   ACUMULACOD(COD_FOR, CODFOR);

   //ACUMULA CFOP PARA INFORMAR NO BLOCO 0400
   ACUMULACOD(_CFOP, CODCFOP);
   if  (Pos('-' +_CFOP + '-', CODCFOP) = 0) then CODCFOP := CODCFOP + _CFOP + '-';

   //ACUMULA TOTAL DE ICMS DE ENTRADA PARA INFORMAR NO REGISTRO E110 - CAMPO 6
   //TOTCREDICM := TOTCREDICM + TOTAL_MATRIZ(ICM_ALIQCFOP);

    dm.IBQuery4.Next;
 end;

  //ACUSA NOTAS FISCAIS DE ENTRADA DO TIPO NF-E SEM CHAVE L.8876
  IF Length(ERRO_CHAVE) > 0 then
    begin
      ss := dialogo('generico',0,'SN'+#8,0,false,'S','Control For Windows',
      'Foram encontradas as seguintes notas fiscais de entrada sem chave: ' + ERRO_CHAVE + '. Deseja continuar mesmo assim ?','S') ;

      if (ss = '*') or (ss = 'N') then
        begin
          LimpaMemoria();
          erro1 := 1;
          exit;
        end;
    end;

  if not DirectoryExists(ExtractFileDir(ParamStr(0)) +  '\SPED\ENTRADAS\') then ForceDirectories(ExtractFileDir(ParamStr(0)) +  '\SPED\ENTRADAS\');
  texto.SaveToFile(ExtractFileDir(ParamStr(0)) +  '\SPED\ENTRADAS\ENTRADAS_' + FormatDateTime('MMYYYY', NOW) + '.TXT');
  texto.Free;
  {FIM DA PARTE DE ENTRADAS}

end;

function leConhecimentos_de_frete_Bloco_D_SF(reg : integer = 1) : Smallint;
var
  cfoptmp, CHV_CTE, codMunTransp : String;
  aliqICMS  : currency;
begin
  Result := 0;
  
  if reg = 0 then
    begin
      LINHA := '|D001|1|';
      GRAVA_SPED(ARQ_TMP, LINHA);
      //TOTALIZA REGISTROS DO TIPO D - 1 DIGITO APENAS PORQUE   PARCIAL, SE FOR TOTAL, INFORMAM-SE 4 DIGITOS
      exit;
    end;

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select cod_mun from registro');
  dm.IBselect.Open;

  codMunSistema := dm.IBselect.FieldByName('cod_mun').AsString;
  dm.IBselect.Close;

  result := 0;
  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select * from mov_fre where (chegada >= :dataini) and (chegada <= :datafim)');
  dm.IBselect.ParamByName('dataini').AsDateTime := StrToDate(dataIni);
  dm.IBselect.ParamByName('datafim').AsDateTime := StrToDate(DataFim);
  dm.IBselect.Open;
  dm.IBselect.FetchAll;
  ini := dm.IBselect.RecordCount;

  LINHA := '|D001|' + IfThen(INI > 0, '0', '1') + '|';
  GRAVA_SPED(ARQ_TMP, LINHA);

  while not dm.IBselect.Eof do
    begin

      if funcoes.Contido(LeftStr(dm.IBselect.fieldbyname('COD_CFOP').AsString, 1), '123') then
        begin
          CHV_CTE := '';
          IF LeftStr(dm.IBselect.fieldbyname('MOD_FRETE').AsString, 2) = '57' THEN
            begin
              CHV_CTE := StrNum(dm.IBselect.fieldbyname('CHAVECTE').AsString);
              if CHV_CTE = '0' then CHV_CTE := '';
            end;

          dm.IBQuery1.Close;
          dm.IBQuery1.SQL.Text := 'select cod_mun from TRANSPORTADORA where cod = :cod';
          dm.IBQuery1.ParamByName('cod').AsString := dm.IBselect.fieldbyname('TRANSP').AsString;
          dm.IBQuery1.Open;

          codMunTransp := dm.IBQuery1.FieldByName('cod_mun').AsString;
          dm.IBQuery1.Close;

          LINHA := '|D100|0|1|3' + strzero(dm.IBselect.fieldbyname('TRANSP').AsString, 6) + '|' + strzero(StrNum(dm.IBselect.fieldbyname('MOD_FRETE').AsString), 2) + '|00|' +
          dm.IBselect.fieldbyname('SERIE').AsString + '||' + dm.IBselect.fieldbyname('NUMDOC').AsString + '|'+ CHV_CTE +'|' + DATA_BRA_FULL(dm.IBselect.fieldbyname('DATA').AsDateTime) + '|' +
          DATA_BRA_FULL(dm.IBselect.fieldbyname('CHEGADA').AsDateTime) + '|||' + FORM_NUM1(dm.IBselect.fieldbyname('VLR_TOTAL').AsCurrency) + '|' +
          FORM_NUM1(dm.IBselect.fieldbyname('VLR_DESC').AsCurrency) + '|' + dm.IBselect.fieldbyname('IND_FRETE').AsString + '|' +
          FORM_NUM1(dm.IBselect.fieldbyname('VLR_SERV').AsCurrency) + '|' + FORM_NUM1(dm.IBselect.fieldbyname('VLR_BC_ICM').AsCurrency) + '|' +
          FORM_NUM1(dm.IBselect.fieldbyname('VLR_ICMS').AsCurrency) + '|' + FORM_NUM1(dm.IBselect.fieldbyname('VLR_NT').AsCurrency) + '|||' +
          codMunTransp + '|' + codMunSistema + '|';

          GRAVA_SPED(ARQ_TMP, LINHA);

          //REGISTRO D190


          if dm.IBselect.fieldbyname('ALIQICMS').AsCurrency > 0 then aliqICMS := dm.IBselect.fieldbyname('ALIQICMS').AsCurrency
            else aliqICMS := dm.IBselect.fieldbyname('VLR_ICMS').AsCurrency / dm.IBselect.fieldbyname('VLR_BC_ICM').AsCurrency * 100;

          cfoptmp := IfThen(dm.IBselect.fieldbyname('VLR_ICMS').AsCurrency > 0, '000', '090');
          LINHA := '|D190|' + cfoptmp + '|' +
          dm.IBselect.fieldbyname('COD_CFOP').AsString + '|' + FORM_NUM1(IfThen(cfoptmp = '090', 0, aliqICMS)) + '|' +
          FORM_NUM1(dm.IBselect.fieldbyname('VLR_TOTAL').AsCurrency) + '|' + FORM_NUM1(dm.IBselect.fieldbyname('VLR_BC_ICM').AsCurrency) + '|' +
          FORM_NUM1(dm.IBselect.fieldbyname('VLR_ICMS').AsCurrency) + '|0||';
          GRAVA_SPED(ARQ_TMP, LINHA);

          //ACUMULA CREDITO DE ICMS PARA APURAÇÃO REG. E110
          ACUM_ICM(dm.IBselect.fieldbyname('COD_CFOP').AsString, dm.IBselect.fieldbyname('VLR_ICMS').AsCurrency, 'Conhecimento de Frete: ' + dm.IBselect.fieldbyname('NUMDOC').AsString);

          //ACUMULA CODIGO DO TRANSPORTADOR PARA REGISTROS 0150 - CAD. PARTICIPANTES
          ACUMULACOD(dm.IBselect.fieldbyname('TRANSP').AsString, ACUM_COD_FOR);
        end
      else
        begin
          ShowMessage('O Conhecimento de Frete: ' + #13 +
          'Num.: ' + dm.IBselect.fieldbyname('NUMDOC').AsString + #13 +
          'Transp.: ' + dm.IBselect.fieldbyname('TRANSP').AsString + #13 +
          'CFOP: ' + dm.IBselect.fieldbyname('COD_CFOP').AsString + #13 +
          'Não Pode Usar CFOP de Saída, Favor Alterar para CFOP que comece com 123.' + #13 +
          'Esta Informação Não foi Adicionada Na Remessa.' );
        end;
      dm.IBselect.Next;
    end;

end;

function blocoE() : String;
begin
  LINHA := '|E001|0|';
  GRAVA_SPED(ARQ_TMP, LINHA);
  LINHA := '|E100|' + DATA_BRA_FULL(StrToDateTime(dataIni)) + '|' + DATA_BRA_FULL(StrToDateTime(DataFim)) + '|';
  GRAVA_SPED(ARQ_TMP, LINHA);
  LINHA := '|E110|' + FORM_NUM1(TOTDEBICM) + '|0|0|0|' + FORM_NUM1(TOTCREDICM) + '|0|0|0|0|' +
  FORM_NUM1(IfThen(TOTDEBICM > TOTCREDICM, TOTDEBICM - TOTCREDICM, 0)) +
  '|0|' + FORM_NUM1(IfThen(TOTDEBICM > TOTCREDICM, TOTDEBICM - TOTCREDICM, 0)) + '|' +
  FORM_NUM1(IfThen(TOTCREDICM > TOTDEBICM, TOTCREDICM - TOTDEBICM, 0)) + '|0|';
  GRAVA_SPED(ARQ_TMP, LINHA);

  IF TOTDEBICM > TOTCREDICM then
    begin
      LINHA := '|E116|000|' + FORM_NUM1(TOTDEBICM - TOTCREDICM) + '|' +
      DATA_BRA_FULL(StrToDateTime(DataFim) + 20) + '|000|||||' + RightStr(DATA_BRA_FULL(StrToDateTime(dataIni)), 6) + '|';
      GRAVA_SPED(ARQ_TMP, LINHA);
    end;
end;

function blocoI() : String;
begin
  if StrToDateTime(dataIni) < StrToDateTime('01/01/2019') then exit;

  LINHA := '|I001|1|';
  GRAVA_SPED(ARQ_TMP, LINHA);

  TOTAL_REG(ARQ_TMP, 'I');
end;

function blocoP_vazio() : String;
begin
  if StrToDateTime(dataIni) < StrToDateTime('01/01/2019') then exit;

  LINHA := '|P001|1|';
  GRAVA_SPED(ARQ_TMP, LINHA);

  TOTAL_REG(ARQ_TMP, 'P');
end;


function blocoG() : String;
begin
  LINHA := '|G001|1|';
  GRAVA_SPED(ARQ_TMP, LINHA);

  TOTAL_REG(ARQ_TMP, 'G');
  //TOTALIZA REGISTROS DO TIPO G - 1 DIGITO APENAS PORQUE É PARCIAL, SE FOR TOTAL, INFORMAM-SE 4 DIGITOS
end;

function blocoH() : String;
var
  sim, ano : string;
begin
  ano := IntToStr(StrToInt(FormatDateTime('yyyy',StrToDateTime(dataIni))) - 1);
  IF ((StrToInt(FormatDateTime('mm',StrToDateTime(dataIni))) = 2) AND (FileExists(ExtractFileDir(ParamStr(0)) + '\SPED\INV_' + ano + '.TXT'))) then
    begin
      sim := dialogo('generico', 30, 'SN', 30, true, 'S', Application.Title,'Foi encontrado o inventario de ' + ano + ' em formato digital. Deseja inclui-lo nesta remessa?', 'S');
      if sim = 'S' then
        begin
          MONTA_INVTXT(ARQ_TMP, ano);
        end
      else
        begin
          LINHA := '|H001|0|';
          GRAVA_SPED(ARQ_TMP, LINHA);
          LINHA := '|H005|3112' + STRZERO(StrToInt(FormatDateTime('yyyy',StrToDateTime(dataIni))) - 1, 4) + '|0|03|';
          GRAVA_SPED(ARQ_TMP, LINHA);
        end;  
    end
  ELSE
    begin
      LINHA := '|H001|0|';
      GRAVA_SPED(ARQ_TMP, LINHA);
      LINHA := '|H005|3112' + STRZERO(StrToInt(FormatDateTime('yyyy',StrToDateTime(dataIni))) - 1, 4) + '|0|05|';
      GRAVA_SPED(ARQ_TMP, LINHA);
    end;
end;

function CriaBlocoH() : String;
var
  sim, ano : string;
  listaConteudo, listaCabecalho : TStringList;
  totInv : currency;
begin
  listaConteudo  := TStringList.Create;
  listaCabecalho := TStringList.Create;
  totInv  := 0;

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select cod, nome, unid, p_venda, quant from produto';
  dm.IBselect.Open;

  while not dm.IBselect.Eof do begin
   // listaConteudo.Add()
    dm.IBselect.Next;
  end;

  LINHA := '|H001|0|';

  GRAVA_SPED(ARQ_TMP, LINHA);
  LINHA := '|H005|3112' + STRZERO(StrToInt(FormatDateTime('yyyy',StrToDateTime(dataIni))) - 1, 4) + '|0|01|';
  GRAVA_SPED(ARQ_TMP, LINHA);
end;


function bloco1() : String;
begin
  LINHA := '|1001|0|';
  GRAVA_SPED(ARQ_TMP, LINHA);
  LINHA := '|1010|N|N|N|N|N|N|N|N|N|' + ifthen(StrToDateTime(dataIni) >= StrToDateTime('01/01/2019'),'N|N|N|', '') +
  ifthen(StrToDateTime(dataIni) >= StrToDateTime('01/01/2020'),'N|', '');
  GRAVA_SPED(ARQ_TMP, LINHA);
  //TOTALIZA REGISTROS DO TIPO D - 1 DIGITO APENAS PORQUE É PARCIAL, SE FOR TOTAL, INFORMAM-SE 4 DIGITO
end;

function cabecalho_SF_Bloco_0(const contribuicoes : boolean = false) : String;
var
  LIN, _CODMUN, _CPF, _CNPJ, _SUFRAMA, _codbar, ies, tmp, tip, MODELO, tipo_item : string;
  CB : boolean;
  fe, ini, idx : integer;
  mat0200 : TStringList;
begin
  if contribuicoes then
    begin
      MODELO := '003';
      IF StrToDateTime(dataIni) >= StrToDateTime('01/06/2018') THEN MODELO := '004';
      IF StrToDateTime(dataIni) >= StrToDateTime('01/01/2019') THEN MODELO := '005';
      IF StrToDateTime(dataIni) >= StrToDateTime('01/01/2020') THEN MODELO := '006';
      {IF StrToDateTime(dataIni) >= StrToDateTime('01/01/2021') THEN MODELO := '007';
      IF StrToDateTime(dataIni) >= StrToDateTime('01/01/2022') THEN MODELO := '008';
      IF StrToDateTime(dataIni) >= StrToDateTime('01/01/2023') THEN MODELO := '009';
      }LINHA := '|0000|'+ MODELO +'|0|||' + DATA_BRA_FULL(StrToDateTime(dataIni)) + '|' + DATA_BRA_FULL(StrToDateTime(DataFim)) + '|';

      dm.IBselect.Close;
      dm.IBselect.SQL.Clear;
      dm.IBselect.SQL.Add('select * from registro');
      dm.IBselect.Open;

      //DADOS PARA O REGISTRO 0140
      tmp := '|0140|1|' + Trim(dm.IBselect.FieldByName('nome').AsString) + '|' + StrNum(dm.IBselect.FieldByName('cnpj').AsString) + '|' + dm.IBselect.FieldByName('est').AsString + '|' +
      STRNUM(dm.IBselect.FieldByName('ies').AsString) + '|' + dm.IBselect.FieldByName('cod_mun').AsString + '||' + IfThen(STRNUM(dm.IBselect.FieldByName('SUFRAMA').AsString) = '0', '', STRNUM(dm.IBselect.FieldByName('SUFRAMA').AsString)) + '|';

      _CODMUN := dm.IBselect.fieldbyname('COD_MUN').AsString;
      _SUFRAMA := StrNum(dm.IBselect.fieldbyname('SUFRAMA').AsString);
      _SUFRAMA := IfThen(length(_SUFRAMA) < 8, '', _SUFRAMA);

      LINHA := LINHA + trim(dm.IBselect.fieldbyname('nome').AsString) + '|' + StrNum(dm.IBselect.fieldbyname('CNPJ').AsString) + '|' +
      dm.IBselect.fieldbyname('est').AsString + '|' + dm.IBselect.fieldbyname('COD_MUN').AsString + '|' + _SUFRAMA + '|00|2|';
      GRAVA_SPED(ARQ_SPED, LINHA);
    end
  else
    begin
      MODELO := '009';
      IF StrToDateTime(dataIni) >= StrToDateTime('01/01/2016') THEN MODELO := '010';
      IF StrToDateTime(dataIni) >= StrToDateTime('01/01/2017') THEN MODELO := '011';
      IF StrToDateTime(dataIni) >= StrToDateTime('01/01/2018') THEN MODELO := '012';
      IF StrToDateTime(dataIni) >= StrToDateTime('01/01/2019') THEN MODELO := '013';
      IF StrToDateTime(dataIni) >= StrToDateTime('01/01/2020') THEN MODELO := '014';
      IF StrToDateTime(dataIni) >= StrToDateTime('01/01/2021') THEN MODELO := '015';
      IF StrToDateTime(dataIni) >= StrToDateTime('01/01/2022') THEN MODELO := '016';
      IF StrToDateTime(dataIni) >= StrToDateTime('01/01/2023') THEN MODELO := '017';

      LINHA := '|0000|'+ MODELO +'|0|' + DATA_BRA_FULL(StrToDateTime(dataIni)) + '|' + DATA_BRA_FULL(StrToDateTime(DataFim)) + '|';
      dm.IBselect.Close;
      dm.IBselect.SQL.Clear;
      dm.IBselect.SQL.Add('select * from registro');
      dm.IBselect.Open;

      _CODMUN := dm.IBselect.fieldbyname('COD_MUN').AsString;
      _SUFRAMA := StrNum(dm.IBselect.fieldbyname('SUFRAMA').AsString);
      _SUFRAMA := IfThen(length(_SUFRAMA) < 8, '', _SUFRAMA);

      LINHA   := LINHA + (dm.IBselect.fieldbyname('nome').AsString) + '|' + StrNum(dm.IBselect.fieldbyname('CNPJ').AsString) + '||' + dm.IBselect.fieldbyname('est').AsString + '|' +
      StrNum(dm.IBselect.fieldbyname('ies').AsString) + '|' + dm.IBselect.fieldbyname('COD_MUN').AsString + '||' + _SUFRAMA + '|B|1|'; // + funcoes.StrNum(dm.IBselect.fieldbyname('CONJ').AsString) + '|B|1|';
      GRAVA_SPED(ARQ_SPED, LINHA);
    end;
  //REGISTRO 0001 - INDICADOR DE MOVIMENTO (0-COM MOVIMENTO 1-SEM MOVIMENTO)
  LINHA := '|0001|0|';
  GRAVA_SPED(ARQ_SPED, LINHA);

  if contribuicoes = false then
    begin
      //REGISTRO 0005 - COMPLEMENTO DADOS DA EMPRESA
      LINHA := '|0005|' + trim(dm.IBselect.fieldbyname('empresa').AsString) + '|' + StrNum(dm.IBselect.fieldbyname('cep').AsString) + '|' + SEPARA_END(dm.IBselect.fieldbyname('ende').AsString) +
      '||' + (dm.IBselect.fieldbyname('bairro').AsString) + '|' + cortaStringini(strnum(dm.IBselect.fieldbyname('telres').AsString), 11) +
      '|' + cortaStringini(strnum(dm.IBselect.fieldbyname('telcom').AsString), 11) + '||';
      GRAVA_SPED(ARQ_SPED, LINHA);
    end;  


  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select * from SPEDCONTADOR');
  dm.IBselect.Open;
  //REGISTRO 0100 - DADOS DO CONTABILISTA
  _CPF := StrNum(dm.IBselect.fieldbyname('CPF').AsString);
  _CPF := IfThen(length(_CPF) = 11, _CPF, '');
  _CNPJ := StrNum(dm.IBselect.fieldbyname('CNPJ').AsString);
  _CNPJ := IfThen(length(_CPF) = 11, '', _CNPJ);


  LINHA := '|0100|' + dm.IBselect.fieldbyname('NOME').AsString + '|' + _CPF + '|' + StrNum(dm.IBselect.fieldbyname('CRC').AsString) +
  '|' + _CNPJ + '|' + StrNum(dm.IBselect.fieldbyname('CEP').AsString) + '|' + dm.IBselect.fieldbyname('ENDE').AsString + '|' + dm.IBselect.fieldbyname('NUMERO').AsString + '|' +
   '|' + dm.IBselect.fieldbyname('BAIRRO').AsString + '|' + StrNum(dm.IBselect.fieldbyname('FONE').AsString) + '|' + dm.IBselect.fieldbyname('FAX').AsString + '|' +
   dm.IBselect.fieldbyname('EMAIL').AsString + '|' + '1400100' + '|';
  GRAVA_SPED(ARQ_SPED, LINHA);

  if contribuicoes then
    begin
      LINHA := '|0110|2||1|9|';
      GRAVA_SPED(ARQ_SPED, linha);
      GRAVA_SPED(ARQ_SPED, tmp);
    end;

  //REGISTROS 0150 - CADASTRO DE PARTICIPANTES - ENTRADA DE MERCADORIA - FORNECEDORES
  //CONVENCAO: CODIGO DE PARTICIPANTE - "1" + CODIGO (FORNECEDOR), "2" + CODIGO (CLIENTE), "3" + CODIGO (TRANSPORTADORA)
  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select cod, nome, tipo, cpf, cnpj, ies, cod_mun, suframa, endereco, bairro from fornecedor');
  dm.IBselect.Open;
  dm.IBselect.FetchAll;

  COD := '';
  NOTA := 0;
  fim := dm.IBselect.RecordCount;
  informacao(0, fim, 'Verificando Fornecedores...', true, false, 2);
  while not dm.IBselect.Eof do
    begin
      informacao(dm.IBselect.RecNo, fim, 'Verificando Fornecedores...', false, false, 2);
      INI := pos('-'+dm.IBselect.fieldbyname('cod').AsString + '-', CODFOR);
      IF INI > 0 then
        begin
           ies  := '';
          _CPF  := '';
          _CNPJ := '';

          if Length(StrNum(dm.IBselect.fieldbyname('cnpj').AsString)) = 14 then tip := '2'
           else tip := '1';

          IF (tip = '1') then
          //IF (Length(StrNum(dm.IBselect.fieldbyname('cnpj').AsString)) = 14) then
            begin
              _CPF  := StrNum(dm.IBselect.fieldbyname('cnpj').AsString);
              ies   := dm.IBselect.fieldbyname('ies').AsString;
              _CNPJ := '';
            end
          else
            begin
              ies   := '';
              _CPF  := '';
              _CNPJ := StrNum(dm.IBselect.fieldbyname('cnpj').AsString);
            end;

          if LENGTH(_CNPJ) < 3 then _CNPJ := '';
          if LENGTH(_CPF) < 3 then   _CPF := '';

          LINHA := '|0150|1' + strzero(dm.IBselect.fieldbyname('cod').AsString, 6) + '|' + trim(dm.IBselect.fieldbyname('nome').AsString) + '|1058|' + _CNPJ + '|' + _CPF + '|' +
          StrNum(dm.IBselect.fieldbyname('ies').AsString) + '|' + dm.IBselect.fieldbyname('cod_mun').AsString + '|' +
           IfThen(length(TRIM(dm.IBselect.fieldbyname('suframa').AsString)) = 9, StrNum(dm.IBselect.fieldbyname('suframa').AsString), '') + '|' + SEPARA_END(dm.IBselect.fieldbyname('endereco').AsString) +
          '||' + TRIM(dm.IBselect.fieldbyname('bairro').AsString) + '|';
          GRAVA_SPED(ARQ_SPED, LINHA);
        end;
      dm.IBselect.Next;
    end;
//   funcoes.informacao(dm.IBselect.RecNo, fim, 'Verificando Fornecedores...', false, true, 2);

  //REGISTROS 0150 - CADASTRO DE PARTICIPANTES - VENDA DE MERCADORIA - CLIENTES
  //CONVENCAO: CODIGO DE PARTICIPANTE - "1" + CODIGO (FORNECEDOR) "2" + CODIGO (CLIENTE)
  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select cod, nome, tipo, cnpj, ies, cod_mun, conj, ende, bairro from cliente');
  dm.IBselect.Open;
  dm.IBselect.FetchAll;

  COD := '';
  COD_ALIQ := '';
  NOTA := 0;
  fim := dm.IBselect.RecordCount;
  informacao(0, fim, 'Verificando Clientes...', true, false, 2);
  while not dm.IBselect.Eof do
    begin
      informacao(dm.IBselect.RecNo, fim, 'Verificando Clientes...', false, false, 2);
      INI := pos('-'+dm.IBselect.fieldbyname('cod').AsString + '-', CODCLI);
      IF INI > 0 then
        begin
          COD_ALIQ := '1058';
          _CPF  := '';
          _CNPJ := '';
          COD := dm.IBselect.fieldbyname('cod_mun').AsString;
          IF((dm.IBselect.fieldbyname('tipo').AsString = '1') OR (dm.IBselect.fieldbyname('tipo').AsString = '6')) then
            begin
              _CPF  := StrNum(dm.IBselect.fieldbyname('cnpj').AsString);
              _CNPJ := '';
              ies   := '';
            end
          else
            begin
              ies   := StrNum(dm.IBselect.fieldbyname('ies').AsString);
              if ies = '0' then ies := '';
              _CPF  := '';
              _CNPJ := StrNum(dm.IBselect.fieldbyname('cnpj').AsString);
            end;

          if codigosClientesExterior.Values[dm.IBselect.fieldbyname('cod').AsString] <> '' then
            begin
              _CPF  := '';
              _CNPJ := '';
              ies   := StrNum(dm.IBselect.fieldbyname('ies').AsString);
              ies   := '';
              cod   := '9999999';
              //cod   := StrNum(dm.IBselect.fieldbyname('cod_mun').AsString);
              COD_ALIQ := codigosClientesExterior.Values[dm.IBselect.fieldbyname('cod').AsString];

              if COD_ALIQ = '1058' then begin
                COD_ALIQ := StrNum(dm.IBselect.fieldbyname('cod_mun').AsString);
              end;
            end
          else
            begin
              if Length(StrNum(dm.IBselect.fieldbyname('cnpj').AsString)) <= 11 then ies := ''
               else ies := StrNum(dm.IBselect.fieldbyname('ies').AsString);
            end;   
          if (ies = '0') then ies := '';

           if LENGTH(_CNPJ) < 3 then _CNPJ := '';
           if LENGTH(_CPF) < 3 then   _CPF := '';
           if LENGTH(IES) < 3  then    IES := '';


          LINHA := '|0150|2' + strzero(dm.IBselect.fieldbyname('cod').AsString, 6) + '|' + trim(dm.IBselect.fieldbyname('nome').AsString) + '|'+COD_ALIQ+'|' + _CNPJ + '|' + _CPF + '|' +
          ies + '|' + IfThen(trim(cod) = '', _CODMUN, COD) + '|' + IfThen(length(TRIM(dm.IBselect.fieldbyname('conj').AsString)) = 9, StrNum(dm.IBselect.fieldbyname('conj').AsString), '') + '|' + SEPARA_END(dm.IBselect.fieldbyname('ende').AsString) +
          '||' + ALLTRIM(dm.IBselect.fieldbyname('bairro').AsString) + '|';
          GRAVA_SPED(ARQ_SPED, LINHA);
        end;

      dm.IBselect.Next;
    end;
//  funcoes.informacao(dm.IBselect.RecNo, fim, 'Verificando Clientes...', false, true, 2);

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select cod, nome, tipo, cpf, cnpj, ies, cod_mun, suframa, endereco as ende, bairro from TRANSPORTADORA');
  dm.IBselect.Open;
  dm.IBselect.FetchAll;
  COD  := '';
  NOTA := 0;
  fim := dm.IBselect.RecordCount;
  informacao(0, fim, 'Verificando Transportadoras...', true, false, 2);
  while not dm.IBselect.Eof do
     begin
       informacao(dm.IBselect.RecNo, fim, 'Verificando Transportadoras...', false, false, 2);
       INI := pos('-'+dm.IBselect.fieldbyname('cod').AsString+ '-', ACUM_COD_FOR);
       IF INI > 0 then
         begin
           _CPF  := '';
          _CNPJ := '';
          IF (dm.IBselect.fieldbyname('tipo').AsString = '2') then
            begin
              _CPF  := '';
              _CNPJ := StrNum(dm.IBselect.fieldbyname('cnpj').AsString);
            end
          else
            begin
              _CPF  := StrNum(dm.IBselect.fieldbyname('cnpj').AsString);
              _CNPJ := '';
            end;

           LINHA := '|0150|3' + strzero(dm.IBselect.fieldbyname('cod').AsString, 6) + '|' + trim(dm.IBselect.fieldbyname('nome').AsString) + '|1058|' + _CNPJ + '|' + _CPF + '|' +
           STRNUM(dm.IBselect.fieldbyname('ies').AsString) + '|' + dm.IBselect.fieldbyname('cod_mun').AsString + '|' +
           IfThen(length(TRIM(dm.IBselect.fieldbyname('suframa').AsString)) = 9, STRNUM(dm.IBselect.fieldbyname('suframa').AsString), '') + '|' + SEPARA_END(dm.IBselect.fieldbyname('ende').AsString) +
           '||' + TRIM(dm.IBselect.fieldbyname('bairro').AsString) + '|';
           GRAVA_SPED(ARQ_SPED, LINHA);
         end;

       dm.IBselect.Next;
     end;
//   funcoes.informacao(dm.IBselect.RecNo, fim, 'Verificando Transportadoras...', false, true, 2)


   mat0200 := TStringList.Create;

   //REGISTROS 0200 - PRODUTOS QUE TIVERAM ENTRADA OU SAIDAS
   DM.IBselect.Close;
   dm.IBselect.SQL.Clear;
   dm.IBselect.SQL.Add('select * from produto');
   dm.IBselect.Open;
   dm.IBselect.FetchAll;
   LIN := '';
   fe := dm.IBselect.RecordCount;
   informacao(0, fe, 'Verificando Produtos...', true, false, 2);

   while not dm.IBselect.Eof do
     begin
     
      //VERIFICA SE O PRODUTO TEVE MOVIMENTO
      idx := codProd.Find(dm.IBselect.fieldbyname('cod').AsInteger);
      IF idx > -1 then
        begin
          cb := false;
          INI := StrToIntDef(TRIM(dm.IBselect.fieldbyname('aliquota').AsString), 0);
          IF ((INI = 0) OR (INI > 12)) then INI := 2;
          if dsAliq.FindKey([ini]) then QTD := dsAliq.fieldbyname('aliq').AsCurrency
            else QTD := 0;
          //SE ACHADO, PEGA O PERCENTUAL DE ICMS, SE NAO, ZERO
          TRIB := FORM_NUM1(IfThen(QTD <> 0, qtd, 0));
         //CAMPO 07 - IF(LEFT(FIELD->NOME, 1) = "_", "07", "00") - MAT DE CONSUMO(07) - NAO EXISTE MOV. FISICA DO ITEM
         //ITENS DE MATERIAL DE CONSUMO DEVEM COMECAR COM O CARACTERE "_"

         unid := codProd[idx].unid;
         VE_UNIDADE(UNID);
         if unid = '' then UNID := TRIM(dm.IBselect.fieldbyname('unid').AsString);

         try
           cb  := checaCodbar(strnum(dm.IBselect.fieldbyname('codbar').AsString));
         except
         end;

         if CB then
           begin
             _codbar := dm.IBselect.fieldbyname('codbar').AsString;
           end
         else
           begin
             _codbar := DIGEAN('789000' + CompletaOuRepete('',dm.IBselect.fieldbyname('cod').AsString ,'0',6));
           end;

         _codbar := trim(_codbar);

         UNID := trim(dm.IBselect.fieldbyname('unid').AsString);
         if unid = '' then UNID := 'UN';

         VE_UNIDADE(unid);

         tipo_item := '00';
         if LeftStr(dm.IBselect.fieldbyname('nome').AsString, 1) = '_' then tipo_item := '07';
         if StrToInt(StrNum(trim(dm.IBselect.fieldbyname('tipo_item').AsString))) > 0 then tipo_item := StrNum(trim(dm.IBselect.fieldbyname('tipo_item').AsString)); 

         if contribuicoes then begin
           LINHA := '|0200|' + strzero(dm.IBselect.fieldbyname('cod').AsString, 6) + '|' + TRIM(dm.IBselect.fieldbyname('nome').AsString) + '|' + _codbar + '|' +
           //strzero(dm.IBselect.fieldbyname('cod').AsString, 6) + '|' + cortastring(UNID, 6) + '|' + IfThen(LeftStr(dm.IBselect.fieldbyname('nome').AsString, 1) = '_', '07', '00') + '|||||' + TRIB + '|';
           '' + '|' + cortastring(UNID, 6) + '|' + tipo_item + '|||||' + TRIB + '|';
         end
         else begin
           if StrToInt(FormatDateTime('yy', StrToDate(dataIni))) >= 17 then begin
             LINHA := '|0200|' + strzero(dm.IBselect.fieldbyname('cod').AsString, 6) + '|' + TRIM(dm.IBselect.fieldbyname('nome').AsString) + '|' + _codbar + '|' +
             '' + '|' + cortastring(UNID, 6) + '|' + tipo_item + '|||||' + TRIB + '||';
           end
           else begin
             LINHA := '|0200|' + strzero(dm.IBselect.fieldbyname('cod').AsString, 6) + '|' + TRIM(dm.IBselect.fieldbyname('nome').AsString) + '|' + _codbar + '|' +
             '' + '|' + cortastring(UNID, 6) + '|' + tipo_item + '|||||' + TRIB + '|';
           end;
         end;

         mat0200.Add(linha);
         //GRAVA_SPED(ARQ_SPED, LINHA);

         try
           StrToCurr(strnum1(codProd[idx].unid));
         except
           on e:exception do
             begin
               MessageDlg(e.Message + #13 + 'Cod: ' + IntToStr(codProd[idx].cod) + #13 + 'Unid: ' + codProd[idx].unid, mtError, [mbOK], 1);
             end;
         end;

         if StrToCurr(strnum1(codProd[idx].unid)) > 1 then
         //if StrToCurrDef(strnum1(unid), 1) > 1 then
           begin
             if Contido('-' + codProd[idx].unid + '-', '-M2-M3-') = false then begin
               LINHA := '|0220|' + TRIM(codProd[idx].unid) + '|' + strnum1(codProd[idx].unid) + '|';
               mat0200.Add(linha);
             end;
             //GRAVA_SPED(ARQ_SPED, LINHA);
           end;
       end;

       informacao(dm.IBselect.RecNo, fe, 'Verificando Produtos...', false, false, 2);
       dm.IBselect.Next;
     end;

   //REGISTROS 0190 - LISTA DAS UNIDADES DE MEDIDA - INFORMA APENAS AS UNIDADES QUE FORAM USADAS
   for ini := 0 to mat_uniok.Count -1 do
     begin
       LINHA := '|0190|' + mat_uniok[ini].unid_ent + '|[' +  mat_uniok[ini].unid_ent + ']|';
       GRAVA_SPED(ARQ_SPED, LINHA);
     end;

   for ini := 0 to mat0200.Count -1 do
     begin
       LINHA := mat0200[ini];
       GRAVA_SPED(ARQ_SPED, LINHA);
     end;

   mat0200.Free;
//   funcoes.informacao(0, fim, 'Verificando Produtos...', false, true, 2);

   //REGISTROS 0400 - CODIGO CFOP UTILIZADOS
   DM.IBselect.Close;
   dm.IBselect.SQL.Clear;
   dm.IBselect.SQL.Add('select * from cod_op');
   dm.IBselect.Open;

   while not dm.IBselect.Eof do
     begin
       if Contido('-' + dm.IBselect.fieldbyname('cod').AsString + '-', CODCFOP) then
         begin
           LINHA := '|0400|' + dm.IBselect.fieldbyname('cod').AsString + '|' + trim(dm.IBselect.fieldbyname('nome').AsString) + '|';
           GRAVA_SPED(ARQ_SPED, LINHA);
         end;
       dm.IBselect.Next;
     end;

  if contribuicoes then begin
    linha := BLOCO0500;
    if linha = '' then exit;
    if (lista0500.Count > 0) and (trim(lista0500.Text) <> '') then begin
      GRAVA_SPED(ARQ_SPED, linha);
    end;
  end;
end;

//ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
//SEPARAR NUMERO DO ENDERECO
//ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
FUNCTION SEPARA_END(ENDE : String) : String;
//ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
var
  POS1   : integer;
  NUMERO : string;
begin
  ende := trim(ende);
  POS1 := MAIOR(pos(' ', ENDE), pos(',', ENDE));
  NUMERO := trim(StrNum(copy(ENDE, POS1, length(ende))));

  IF(Length(NUMERO) = 0) then NUMERO := '1';
  IF(POS1 <> 0) then ENDE := ALLTRIM(LeftStr(ENDE, POS1 - 1));
  //NUMERO SEPARADO DO ENDERECO
  Result := '';
  Result := ENDE + '|' + NUMERO;
end;

function ACHA_CODIGO(cod : String) : boolean;
begin
  Result := false;
  if codProd.Find(StrToInt(strnum(cod))) > -1 then Result := true;
end;

procedure montaArquivo();
var
  //F : TextFile;
  arq : TStringList;
  ini, fim : integer;
begin
  CloseFile(ARQ_TMP);
///  sleep(2000);
  arq := TStringList.Create;
  arq.LoadFromFile(arqTmp);
  fim := arq.Count -1;

  for ini := 0 to fim do
    begin
      Writeln(ARQ_SPED, arq[ini]);
    end;

  arq.Free;
  DeleteFile(arqTmp);
  //AssignFile(F, arqTmp);
  //Reset(F);

  {while not Eof(F) do
    begin
      ReadLn(F, linha);
      Writeln(ARQ_SPED, linha);
    end;
  CloseFile(F);}
end;

function cortaString(texto : String; valor : integer) : String;
begin
  Result := '';
  Result := Copy(texto, 1, valor);
end;

function cortaStringini(texto : String; valor : integer) : String;
var
  tmp : integer;
begin
  Result := texto;
  Result := allTrim(Result);
  tmp    := Length(Result);
  if tmp > valor then
    begin
      Result := copy(Result, tmp - valor, length(Result));
    end;
end;

function DECOMP_MOV1(const linh : String) : TStringList;
begin
//DATA (D-6), PEDIDO (C-7), NF (C-7), TIPO (C-2)-> TOTAL 22 BYTES
//DATA (1-6), PEDIDO (7-13), NF (14-20), TIPO (21-22)-> TOTAL 22 BYTES
  Result := TStringList.Create;
  Result.Add(copy(linh, 5, 2) + '/' + copy(linh, 3, 2) + '/' +copy(linh, 1, 2)); //data
  Result.Add(copy(linh, 7, 7));   //pedido
  Result.Add(copy(linh, 14, 7));  //NF
  Result.Add(copy(linh, 21, 2));  //tipo

  //0-data, 1-pedido, 2-NumNF, 3-tipo
end;

function adicionaVetor(var vetor : matriz; lin : String) : Boolean;
var fim : integer;
begin
  result := false;
  fim := length(vetor);
  //procura o termo no vetor, se não encontrou, adiciona
  if achaVetor(vetor, lin) = -1 then
    begin
      SetLength(vetor, fim + 1);
      vetor[fim] := lin;
      result := true;
    end;
end;

function achaVetor(var vetor : matriz; lin : String) : Integer;
var pos, fim : integer;
begin
  result := -1;
  fim := length(vetor) -1;
  //procura o termo no vetor
  for pos := 0 to fim do
    begin
      if lin = vetor[pos] then
        begin
          result := pos;
          break;
        end;
    end;
end;

function total_mat(var vetor : array of currency) : currency;
var pos, fim : integer;
begin
  result := 0;
  fim := length(vetor) -1;
  for pos := 0 to fim do
    begin
       result := result + vetor[pos];
    end;
end;

function zera_matriz(var vetor : array of currency) : currency;
var pos, fim : integer;
begin
  result := 0;
  fim := length(vetor) -1;
  for pos := 0 to fim do
    begin
       vetor[pos] := 0.00;
    end;
end;

function leSaidas_SF() : Smallint;
var
  total1, totRED : currency;
  mat, arq      : TStringList;
  listaProdCST_pis_cod : TItensProduto;
  CODNOTA, LIN, desti, crc, UF, nodo_dest1  : String;
  DATA_EMI : TDate;
  DadosNfe : TDadosNFe;
  ini2, fim2, i3, f3, i1, acc, LA, lu, indXNaoTrib : integer;
  temMov : boolean;
begin

  {INICIA SAIDAS}

  {DADOS DE NFES EMITIDAS}
  {TIPO := '90';
  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select item from fvmt f where (substring(f.item from 21 for 2) = :tipo) and (data >= :ini) and (data <= :fim) and estado <> ''C'' ';
  dm.IBselect.ParamByName('tipo').AsString := TIPO;
  dm.IBselect.ParamByName('ini').AsDate  := StrToDate(dataIni);
  dm.IBselect.ParamByName('fim').AsDate  := StrToDate(DataFim);
  dm.IBselect.Open;
  dm.IBselect.FetchAll; }
  TIPO := '90';
  dm.IBselect.Close;
  {dm.IBselect.SQL.Text := 'select * from nfe f where (data >= :ini) and (data <= :fim) and estado = ''E'' ';
  dm.IBselect.ParamByName('ini').AsDate  := StrToDate(dataIni);
  dm.IBselect.ParamByName('fim').AsDate  := StrToDate(DataFim);}

  dm.IBselect.SQL.Text := 'select * from nfe f where substring(chave from 3 for 4) = :ini and estado = ''E''  and ((tipo <> ''2'') or (tipo is null)) ';
  dm.IBselect.ParamByName('ini').AsString  := chaveAnoMes;
  dm.IBselect.Open;
  dm.IBselect.FetchAll;
  CODNOTA := '';

  acc := 0;
  fim := dm.IBselect.RecordCount;
  informacao(0, fim, 'Verificando Vendas...', true, false, 2);
  while not dm.IBselect.Eof do
    begin
      BASE_ICM := 0;
      TOT_ICM  := 0;
      acc      := acc + 1;
      totRED   := 0;
      informacao(acc, fim, 'Verificando Vendas...', false, false, 2);
      //linha := dm.IBselect.fieldbyname('item').AsString;
      //DECOMP_MOV(linha, mat);
      TOTDESC := 0;
      TOT     := 0;
      listaPIS.Clear;

      zerarArrayProduto();
      CHAVENF := dm.IBselect.FieldByName('chave').AsString;

      if Contido('|' + CHAVENF + '|', chavesDuplicidade) = false then begin
    
      nota    := StrToIntDef(copy(chaveNF, 26, 9), 0);

      //if not Contido(IntToStr(nota), CODNOTA) then
        //begin
          CODNOTA := CODNOTA + IntToStr(NOTA) + '-';
          //DATA_EMI := converteDataYYMMDDParaTdate(mat[0]);
          DATA_EMI := dm.IBselect.FieldByName('data').AsDateTime;

          LE_XMLNFE('', listaProdutos, dm.IBQuery4, DadosNfe, dm.IBselect.FieldByName('chave').AsString);

          if listaProdutos.Count > 0 then
            begin
              DATA_EMI := DadosNfe.data;
              //mat.Text := DadosNfe.xml;
              //mat.SaveToFile(caminhoEXE_com_barra_no_final + 'arqNFE.xml');
              DESC := Le_Nodo('dest', DadosNfe.xml);
              UF   := Le_Nodo('UF', DESC);
              nodo_dest1 := DESC;

              //if Contido('<idEstrangeiro>', DadosNfe.xml) then
              IF Le_Nodo('idEstrangeiro', DadosNfe.xml) <> '' then
                begin
                  COD_ALIQ := Le_Nodo('cPais', DESC);
                  DESC := Le_Nodo('idEstrangeiro', DESC);
                  COD  := DESC;
                  DESC := ACHA_CODCLI(DESC, UF, nodo_dest1);
                  codigosClientesExterior.Values[DESC] := COD_ALIQ;
                  //ShowMessage(DESC+ '=' + COD_ALIQ+#13+
                  //'-----------------'+#13+codigosClientesExterior.GetText)
                  //adicionei em uma variavel somente os codigos dos clientes do exterior para
                  //descarregar no registro 0150
                end
              else begin
                DESC := IfThen(Contido('<CPF>', DESC), Le_Nodo('CPF', DESC), Le_Nodo('CNPJ', DESC));
                COD  := DESC;

                DESC := ACHA_CODCLI(DESC, UF, nodo_dest1);
              end;

              COD  := DESC;
              if not Contido('-'+ desc + '-', CODCLI) then CODCLI := CODCLI + IntToStr(StrToIntDef(desc, 0)) + '-';


              _SER := Le_Nodo('serie', DadosNfe.xml);
              fim  := listaProdutos.Count -1;
              ret := 0;
              ZERA_ALIQCFOP();
              TOT_ITEM := 0;

              for ini := 0 to fim do
                begin
                  ret := ret + 1;

                  DADOS_PROD(IntToStr(listaProdutos[ini].cod) , DESC, UNID, COD_ALIQ, TRIB, ISPIS, COD_ISPIS, PERC_ICMS, BASE_PIS_RD, false);

                  SOMA_MOV(listaProdutos[ini].cod, - listaProdutos[ini].quant);

                  //VALOR TOTAL DO ITEM - DESCONTO
                  TOT_ITEM := listaProdutos[ini].total;

                  if funcoes.buscaParamGeral(10, '') = '1' then begin
                    listaProdutos[ini].TOT_ICM := 0;
                  end;

                  if True then


                  TOT      := TOT + listaProdutos[ini].total;
                  TOTDESC  := TOTDESC + listaProdutos[ini].descCom;

                  TRIB := Trim(listaProdutos[ini].CST);
                  TRIB := IfThen(Length(TRIB) = 2, trib, '41');  //CST - VERIFICA SE O CST DA NF-E   VALIDO, SEN? PEGA 41-N? TRIBUTADO

                  if ((TRIB = '60') and (listaProdutos[ini].CFOP = '5102')) then listaProdutos[ini].CFOP := '5405';
                  if ((TRIB = '60') and (listaProdutos[ini].CFOP = '6102')) then listaProdutos[ini].CFOP := '6404';

                  if Contido('-'+listaProdutos[ini].CFOP+'-', '-5929-6929-') then begin
                    listaProdutos[ini].TOT_ICM  := 0;
                    listaProdutos[ini].BASE_ICM := 0;
                    listaProdutos[ini].PERC_ICM := 0;
                    BASE_ICM  := 0;
                  end;


                  TOT_ICM  := TOT_ICM  + listaProdutos[ini].TOT_ICM;
                  ACUM_IcmsCstCFOP(listaProdutos.Items[ini], listaPIS, BASE_ICM);
                  totRED := totRED + listaProdutos[ini].TOT_RED_ICM;

                  //ACUMULA VALORES DE PIS/COFINS DA NF-e
                  CALC_PISCOF(TOT_ITEM, ISPIS, listaProdutos[ini].vPIS, listaProdutos[ini].vCOFINS, '');

	                TOT_PIS    := listaProdutos[ini].vPIS;
                  TOT_COFINS := listaProdutos[ini].vCOFINS;

                  //SE NAO TEM PIS/COFINS, ACUMULA NO TOTALIZADOR DE PIS/COFINS NAO TRIBUTADO PARA O RELATORIO DE APURACAO
                  _PISNT := _PISNT + IfThen((TOT_PIS + TOT_COFINS) = 0, listaProdutos[ini].total, 0);
                end; //FOR LISTA DE PRODUTOS

              //REGISTRO C100 - CABECALHO DA NOTA FISCAL
              //VERIFICA SE A NF-e E DE ENTRADA OU SAIDA, PELO CFOP
              LIN := Le_Nodo('tpNF', DadosNfe.xml);
              IF not Contido(LIN, '0-1') then LIN := '1'; //PADRAO SAIDA, SE NAO ACHAR A INFORMACAO

              LINHA := '|C100|' + LIN + '|0|2' + strzero(COD, 6) + '|55|00|' + _SER + '|' + strnum(IntToStr(NOTA)) +
              '|' + DadosNfe.chave + '|' +
              DATA_BRA_FULL(DATA_EMI) + '|' + DATA_BRA_FULL(DATA_EMI) + '|' +
              FORM_NUM1(TOT) + '|0|' +  FORM_NUM1(TOTDESC) + '|0|' + FORM_NUM1(TOT) + '|9|0|0|0|' +
              FORM_NUM1(BASE_ICM) + '|' + FORM_NUM1(TOT_ICM) +
              '|0|0|0|' + FORM_NUM1(TOT_PIS) + '|' + FORM_NUM1(TOT_COFINS) + '|0|0|';

              GRAVA_SPED(ARQ_TMP, LINHA);


              fim := listaPIS.Count -1;
              for ini := 0 to fim do
                begin
                  if StrToIntDef(LeftStr(listaPIS[ini].CFOP, 1), 5) >= 5 then TOTDEBICM := TOTDEBICM + listaPIS[ini].icms
                   else TOTCREDICM := TOTCREDICM + (listaPIS[ini].icms);
                  LINHA := '|C190|0' + listaPIS[ini].CST + '|' + listaPIS[ini].CFOP + '|' + FORM_NUM1(listaPIS[ini].aliquota) + '|'  +
                  FORM_NUM1(listaPIS[ini].total) + '|'  + FORM_NUM1(listaPIS[ini].Base) + '|'  + FORM_NUM1(listaPIS[ini].icms) + '|0|0|'+FORM_NUM1(totRED)+'|0||';

                  GRAVA_SPED(ARQ_TMP, LINHA);
                end;
            end;

            end;//if listaProdutos.Count > 0 then
        //end;

      dm.IBselect.Next;
    end;

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select chave, nota, data, estado from nfe f where'+
  '  ((estado = ''C'') or  (estado = ''D'')) '+
  ' and (data >= :ini) and (data <= :fim)';
  dm.IBselect.ParamByName('ini').AsDate  := StrToDate(dataIni);
  dm.IBselect.ParamByName('fim').AsDate  := StrToDate(DataFim);
  dm.IBselect.Open;
  dm.IBselect.FetchAll;
  CODNOTA := '';

  arq := TStringList.Create;

  acc := 0;
  fim := dm.IBselect.RecordCount;
  informacao(0, fim, 'Verificando Vendas...', true, false, 2);
  while not dm.IBselect.Eof do
    begin
      acc := acc + 1;
      informacao(acc, fim, 'Verificando Vendas...', false, false, 2);

      NOTA := dm.IBselect.FieldByName('nota').AsInteger;
      DATA_EMI := dm.IBselect.FieldByName('data').AsDateTime;

      {if not Assigned(dadosNfe) then dadosNfe := TDadosNFe.Create;

      _SER := Le_Nodo('serie', DadosNfe.xml);}

      DESC := '9999';

      if dm.IBselect.FieldByName('estado').AsString = 'D' then DESC := '04'
       else if dm.IBselect.FieldByName('estado').AsString = 'C' then DESC := '02';

      //REGISTRO C100 - CABECALHO DA NOTA FISCAL
      //VERIFICA SE A NF-e E DE ENTRADA OU SAIDA, PELO CFOP

      if FileExists(ExtractFileDir(ParamStr(0)) + '\NFE\EMIT\' + dm.IBselect.FieldByName('chave').AsString + '-nfe.xml') then begin
        arq.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\NFE\EMIT\' + dm.IBselect.FieldByName('chave').AsString + '-nfe.xml');
      end;

      LIN := Le_Nodo('tpNF', arq.Text);
      IF not Contido(LIN, '0-1') then LIN := '1'; //PADRAO SAIDA, SE NAO ACHAR A INFORMACAO

     { LINHA := '|C100|' + LIN + '|0|2' + strzero(COD, 6) + '|55|'+DESC+'|' + _SER + '|' + strnum(IntToStr(NOTA)) +
      '|' + DadosNfe.chave + '|||||||||||||||||||||';}

      chaveNF := dm.IBselect.FieldByName('chave').AsString;
      nota := StrToIntDef(copy(chaveNF, 26, 9), 0);
      _SER := IntToStr(StrToIntDef(copy(chaveNF, 23, 3) , 1));
      LINHA := '|C100|' + LIN + '|0||55|'+DESC+'|' + _SER + '|' + strnum(IntToStr(NOTA)) +
      '|' + chaveNF + '|||||||||||||||||||||';

      GRAVA_SPED(ARQ_TMP, LINHA);

      dm.IBselect.Next;
    end;

    arq.free;

  //gravaERRO_LOG1('', 'CODCLI4='+ CODCLI, '');
  {DADOS DE NFES EMITIDAS}
  insereInutilizacoesFiscal;


  {QUANDO TEM NFES IMPORTADAS DE OUTRO SISTEMA}
  leNfesImportadasDeOutroSistema;

  {DADOS DE CFe EMITIDAS}
  leCFEs();

  {DADOS DE CFe EMITIDAS}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  {DADOS DE CUPOM FISCAIS}
  listaProdutos.Clear;
  MAT_NOTA.Clear;
  TOT_ECF.Clear;
  indXNaoTrib := 0;
  i := TOT_ECF.Add(TaliqSped.Create);
  TOT_ECF[i].leng      := 'Can-T';
  TOT_ECF[i].CST       := 'XX';
  TOT_ECF[i].codAliq   := 0;
  TOT_ECF[i].totECF    := 0;
  TOT_ECF[i].totVendas := 0;

  dsAliq.First;
  for ini := 1 to dsAliq.RecordCount-1 do
    begin
      dsAliq.RecNo := ini;
      if ini = 4 then break;
      

      if dsAliq.fieldbyname('cod').AsInteger < 10 then begin
        num1 := dsAliq.fieldbyname('aliq').AsCurrency;
        if dsAliq.fieldbyname('reducao').AsCurrency <> 0 then begin
          num1 := (num1 * dsAliq.fieldbyname('reducao').AsCurrency) / 100;
        end;
        num1 := arredonda(num1, 2);
        num1 := num1 * 100;

        i := TOT_ECF.Add(TaliqSped.Create);
        TOT_ECF[i].leng      := strzero(IntToStr(ini), 2) + 'T' + STRZERO(CurrToStr(num1), 4) ;
        TOT_ECF[i].CST       := '00';
        TOT_ECF[i].codAliq   := ini;
        TOT_ECF[i].totECF    := 0;
        TOT_ECF[i].totVendas := 0;
      end;
    end;

  i := TOT_ECF.Add(TaliqSped.Create);
  indXNaoTrib := i;
  TOT_ECF[i].leng      := 'DT';
  TOT_ECF[i].CST       := 'XX';
  TOT_ECF[i].codAliq   := 0;
  TOT_ECF[i].totECF    := 0;
  TOT_ECF[i].totVendas := 0;

  i := TOT_ECF.Add(TaliqSped.Create);
  TOT_ECF[i].leng      := 'F1';
  TOT_ECF[i].CST       := '60';
  TOT_ECF[i].codAliq   := 10;
  TOT_ECF[i].totECF    := 0;
  TOT_ECF[i].totVendas := 0;

  i := TOT_ECF.Add(TaliqSped.Create);
  TOT_ECF[i].leng      := 'I1';
  TOT_ECF[i].CST       := '40';
  TOT_ECF[i].codAliq   :=  11;
  TOT_ECF[i].totECF    :=   0;
  TOT_ECF[i].totVendas :=   0;

  i := TOT_ECF.Add(TaliqSped.Create);
  TOT_ECF[i].leng      := 'N1';
  TOT_ECF[i].CST       := '41';
  TOT_ECF[i].codAliq   := 12;
  TOT_ECF[i].totECF    := 0;
  TOT_ECF[i].totVendas := 0;

  ZERA_ALIQCFOP();

  //_CFOP := IF(VAL(DECOMP_DATA(SUBSTR(CONFIG1, 165, 2))) = 0, "5102", DECOMP_DATA(SUBSTR(CONFIG1, 165, 2)))
  _CFOP := '5102';
  COD   := '000';
  dm.IBselect.Close;
  //dm.IBselect.SQL.Text := 'select * from SPED_REDUCAOZ where (data >= :ini) and (data <= :fim) order by ecf';
  dm.IBselect.SQL.Text := 'select COD, DATA, ECF, CONT_REINICIO, CONT_REDUCAOZ, CONT_OP, '+
  'TOT_GERAL, TOT_CANC, TOT_ALIQ01,TOT_ALIQ02, TOT_ALIQ03, TOT_DESC, TOT_FF, TOT_II, TOT_NN, '+
  'VENDABRUTA from SPED_REDUCAOZ where (data >= :ini) and (data <= :fim) order by ecf';
  dm.IBselect.ParamByName('ini').AsDate  := StrToDate(dataIni);
  dm.IBselect.ParamByName('fim').AsDate  := StrToDate(DataFim);
  dm.IBselect.Open;
  dm.IBselect.FetchAll;

  if dm.IBselect.IsEmpty then exit;
  

  informacao(0, fim, 'Verificando Vendas...', true, false, 2);
  acc := 0;
  lu := dm.IBselect.RecordCount;
  ZERA_ALIQCFOP;
  LA := 0;

  while not dm.IBselect.Eof do
    begin
      la := la + 1;
      informacao(la, lu, 'Verificando Vendas...', false, false, 2);

      listaProdutos.Clear;
      MAT_NOTA.Clear;
      lisTMP.Clear;
      VAL_ALIQCFOP.Clear;

      if cod <> dm.IBselect.fieldbyname('ecf').AsString then
        begin
          cod := dm.IBselect.fieldbyname('ecf').AsString;
          //cod := strzero(cod, 3);
          LIN := VE_ECF(StrToInt(cod));
          GRAVA_SPED(ARQ_TMP, LIN);
        end;

     //ShowMessage('CRZ='+dm.IBselect.fieldbyname('CONT_REDUCAOZ').AsString + #13 + 'ECF=' + cod);

     if TOTAL_MATRIZ(VAL_ALIQCFOP) = 0 then
       begin
         LINHA := '|C405|'+ FormatDateTime('ddmmyyyy', dm.IBselect.fieldbyname('DATA').AsDateTime) + '|' + STRZERO(dm.IBselect.fieldbyname('CONT_REINICIO').AsInteger, 3) + '|' +
         STRZERO(dm.IBselect.fieldbyname('CONT_REDUCAOZ').AsInteger, 6) + '|' + STRZERO(dm.IBselect.fieldbyname('CONT_OP').AsInteger, 6)  + '|' +
         FORM_NUM1(dm.IBselect.fieldbyname('TOT_GERAL').AsCurrency) + '|' + FORM_NUM1(VE_VENDAECF(dm.ibselect, false)) + '|';
         GRAVA_SPED(ARQ_TMP, LINHA);
       end;

     FOR ini := 7 TO dm.IBselect.FieldDefs.Count - 2 do// IfThen(dm.IBselect.FieldDefs.Count = 22, 3, 2) do
     //FOR ini := 0 TO TOT_ECF.Count -1 do
       begin

          TOT_ECF[ini - 7].totVendas := dm.IBselect.FieldByName(dm.IBselect.FieldDefs[ini].Name).AsCurrency;
         //ShowMessage('cont=' + IntToStr(ini - 7) + #13 + 'tot=' + IntToStr(dm.IBselect.FieldDefs.Count -2) + #13 + #13 + TOT_ECF.GetText);
         //TOT_ECF[ini - (indXNaoTrib -1)].totECF    := 0;
         //TOT_ECF[ini - (indXNaoTrib -1)].totVendas := 0;
          //nao pode adicionar os descontos e nem cancelamentos aqui
          //IF ((dm.IBselect.FieldByName(dm.IBselect.FieldDefs[ini].Name).AsCurrency <> 0) and ((ini - (indXNaoTrib -1)) <> 9)) then
           //    TOT_ECF[ini - (indXNaoTrib -1)].totVendas := dm.IBselect.FieldByName(dm.IBselect.FieldDefs[ini].Name).AsCurrency;
       end;

     //ShowMessage(TOT_ECF.GetText);

     temMov := false;
     //GRAVA PRIMEIRO OS REGISTROS C420 DOS TOTALIZADORES QUE NAO TEM C425 (CANCELAMENTO E DESCONTOS)
     //LE OS TOTALIZADORES (A PARTIR DO 5. ELEMENTO) E VE OS QUE TEM MOVIMENTO

     total1 := 0;
     FOR i1 := 0 TO TOT_ECF.Count - 1 do
       begin
         if (TOT_ECF[i1].totVendas <> 0) then
           begin
             if Contido('-' + TOT_ECF[i1].leng + '-', '-DT-Can-T-') = false then begin
               listaProdutos.Clear;
               LIN := IfThen(copy(TOT_ECF[i1].leng, 3, 1) = 'T', trim(IntToStr(StrToInt(strnum(LeftStr(TOT_ECF[i1].leng, 2))))), '');
               if LIN = '0' then LIN := '';
               LINHA := '|C420|' + TOT_ECF[i1].leng + '|' + FORM_NUM1(TOT_ECF[i1].totVendas) + '|'+ LIN +'||';
               MAT_NOTA.Add(LINHA);

               TOT_ITEM := VE_MOVCUPOM(dm.IBselect.fieldbyname('data').AsDateTime, TOT_ECF[i1].codAliq, TOT_ECF[i1].totVendas, cod);

               for i3 := 0 to listaProdutos.Count -1 do begin
                 //SE CHEGOU AQUI, ENT? ESTE ITEM E DA ALIQUOTA ATUAL
                 ret := ret + 1;

                 DADOS_PROD(IntToStr(listaProdutos[i3].cod) , DESC, UNID, COD_ALIQ, TRIB, ISPIS, COD_ISPIS, PERC_ICMS, BASE_ICM, false);

                 SOMA_MOV(listaProdutos[i3].cod, - listaProdutos[i3].quant);

                 //USAR A ALIQUOTA QUE ESTA NA VENDA, E NAO A BUSCADA EM DADOS_PROD, POIS A ATUAL PODE TER SIDO ALTERADA
                 VALIDALIQ(listaProdutos[i3].aliq, num_aliq, ALIQ, TRIB, BASE_ICM);

                 //VALOR TOTAL DO ITEM
                 //listaProdutos[i3].total := ArredondaTrunca(listaProdutos[i3].preco * listaProdutos[i3].quant, 2);
                 TOT_ITEM := listaProdutos[i3].total;
                 TOT      := TOT + listaProdutos[i3].total;

                 //CALCULA O VALOR DO ICMS, SE TIVER
                 //BASE_ICM := RoundTo(TOT_ITEM * BASE_ICM / 100 , 2);
                 BASE_ICM := (TOT_ITEM * BASE_ICM / 100);
                 //TOT_ICM := IfThen(ALIQ > 0, RoundTo(BASE_ICM * ALIQ / 100, 2), 0);
                 TOT_ICM := IfThen(ALIQ > 0, RoundTo1(BASE_ICM * ALIQ / 100), 0);

                  if funcoes.buscaParamGeral(10, '') = '1' then begin
                    listaProdutos[i3].TOT_ICM := 0;
                    BASE_ICM := 0;
                    TOT_ICM  := 0;
                  end;

                 //CALCULA PIS/COFINS
                 CALC_PISCOF(TOT_ITEM, ISPIS, _PIS, _COFINS, '');
                 TOT_PIS    := TOT_PIS    + _PIS;
                 TOT_COFINS := TOT_COFINS + _COFINS;

			           //SE NAO TEM PIS/COFINS, ACUMULA NO TOTALIZADOR DE PIS/COFINS NAO TRIBUTADO PARA O RELATORIO DE APURACAO
                 _PISNT := _PISNT + IfThen(_PIS + _COFINS = 0, TOT_ITEM, 0);

                 UNID := listaProdutos[i3].unid;
                 VE_UNIDADE(UNID);

                 ACUMULA_COD(IntToStr(listaProdutos[i3].cod), UNID);

                 LINHA := '|C425|' + strzero(listaProdutos[i3].cod, 6) + '|' + FORM_NUM1(listaProdutos[i3].quant) + '|' + UNID + '|' +
                 FORM_NUM1(TOT_ITEM) + '|' + FORM_NUM1(_PIS) + '|' + FORM_NUM1(_COFINS) + '|';
                 //GRAVA_SPED(ARQ_TMP, LINHA)
                 MAT_NOTA.Add(LINHA);

                 total1 := total1 + TOT_ITEM;

                 ALIQ_CFOP := TRIB + '|' + _CFOP + '|'+ IfThen(ALIQ > 0, FORM_NUM1(ALIQ), '0');

                 temMov := true;

                 //ACUMULA NOS TOTALIZADORES DE ALIQUOTA E CFOP
                 ACUMULA_ALIQCFOP(ALIQ_CFOP, TOT_ITEM, BASE_ICM, TOT_ICM, 0);
               end;
             end;
             {MAT_NOTA.Add('');
             MAT_NOTA.Add('total=' + CurrToStr(total1));
             MAT_NOTA.Add('');}
           end;
       end;

       if (((TOT_PIS + TOT_COFINS) > 0) and (temMov)) then
         begin
           LINHA := '|C410|' + FORM_NUM1(TOT_PIS) + '|' + FORM_NUM1(TOT_COFINS) + '|';
           GRAVA_SPED(ARQ_TMP, LINHA);
         end;

       if dm.IBselect.FieldByName('TOT_DESC').AsCurrency > 0 then
         begin
           LINHA := '|C420|DT|' + FORM_NUM1(dm.IBselect.FieldByName('TOT_DESC').AsCurrency) + '|||';
           GRAVA_SPED(ARQ_TMP, LINHA);
         end;

       if dm.IBselect.FieldByName('TOT_CANC').AsCurrency > 0 then
         begin
           LINHA := '|C420|Can-T|' + FORM_NUM1(dm.IBselect.FieldByName('TOT_CANC').AsCurrency) + '|||';
           GRAVA_SPED(ARQ_TMP, LINHA);
         end;

      for ini2 := 0 to MAT_NOTA.Count -1 do
        begin
          GRAVA_SPED(ARQ_TMP, MAT_NOTA[INI2]);
        end;

      FOR ini2 := 0 TO MAT_ALIQCFOP.Count -1 do
        begin
          //SE A ALIQUOTA E TRIBUTADA
          IF LeftStr(MAT_ALIQCFOP.ValueFromIndex[INI2], 2) = '00' then
            begin
              LIN := (copy(MAT_ALIQCFOP.ValueFromIndex[INI2], PosFinal('|', MAT_ALIQCFOP.ValueFromIndex[INI2]) + 1, LENGTH(MAT_ALIQCFOP.ValueFromIndex[INI2])));
              ALIQ := StrToCurrDef(LIN, 0) / 100;

              BASE_ICM := IfThen(ALIQ = 0, 0, strtocurr(BAS_ALIQCFOP.ValueFromIndex[INI2]));
              TOT_ICM  := IfThen(ALIQ = 0, 0, RoundTo1(strtocurr(VAL_ALIQCFOP.ValueFromIndex[INI2]) * ALIQ));

              if funcoes.buscaParamGeral(10, '') = '1' then begin
                BASE_ICM := 0;
                TOT_ICM  := 0;
              end;
              TOTDEBICM := TOTDEBICM + TOT_ICM;
            end
          ELSE
            begin
              BASE_ICM := 0;
              TOT_ICM  := 0;
            end;

          LINHA := '|C490|0' + MAT_ALIQCFOP.ValueFromIndex[INI2] + '|' + FORM_NUM1(StrToCurr(VAL_ALIQCFOP.ValueFromIndex[INI2])) + '|' +
          FORM_NUM1(BASE_ICM) + '|'  + FORM_NUM1(TOT_ICM) + '||';
          GRAVA_SPED(ARQ_TMP, LINHA);
        end;

      for ini2 := 0 to TOT_ECF.Count -1 do
        begin
          TOT_ECF[ini2].totECF    := 0;
          TOT_ECF[ini2].totVendas := 0;
        end;

      //ZERA TOTALIZADORES DE PIS/COFINS
      TOT_PIS    := 0;
      TOT_COFINS := 0;
      _PISNT     := 0;
      MAT_NOTA.Clear;
      //ZERA OS TOTALIZADORES DE ALIQUOTA PARA O PROXIMO DIA DE MOVIMENTO
      ZERA_ALIQCFOP();

      dm.IBselect.Next;
    end;

  {DADOS DE CUPOM FISCAIS}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  {FIM SAIDAS}
end;

procedure SOMA_MOV(const COD: integer;const QTD2 : currency);
var
  idx : integer;
begin
  idx := MAT_MOV.Find(COD);
  if idx = -1 then
    begin
      MAT_MOV.Add(TacumProd.Create);
      TacumProd(MAT_MOV.Last).cod   := cod;
      TacumProd(MAT_MOV.Last).quant := QTD2;
      exit;
    end;

  MAT_MOV[idx].quant := MAT_MOV[idx].quant + QTD2;
end;


FUNCTION CALC_PISCOF(var TOT_ITEM : currency; _ISPIS : String; var VLR_PIS, VLR_COFINS : currency; CST_PIS : String) : String;
begin
  Result     := '';
  VLR_PIS    := 0;
  VLR_COFINS := 0;
  CST_PIS := TRIM(CST_PIS);
  IF CST_PIS = '' then CST_PIS := '01';
  //SE A EMPRESA E DE REGIME NORMAL, CALCULA PIS/COFINS

  IF TRIB_REGIME = '1' then //SIMPLES NACIONAL
   Result := '99|0|0|||0|99|0|0|||0'
  Else if ((Contido(_ISPIS, 'MS')) OR (Contido(CST_PIS, '04-05'))) then  //INCLUIR O PIS SUBSTITUI?O COMO MONOF?ICO
    begin
	    Result := '04|0|0|||0|04|0|0|||0';
	    BASE_PIS_RD := BASE_PIS_RD + TOT_ITEM;
    end
	 ELSE IF ((_ISPIS = 'S') OR (CST_PIS = '05')) then //N? TEM MAIS PIS SUBSTITUI?O
     begin
	     Result := '05|0|0|||0|05|0|0|||0';
       BASE_PIS_ST := BASE_PIS_ST + TOT_ITEM;
     end
	 ELSE IF ((_ISPIS = 'N') OR (Contido('06', CST_PIS))) then
     begin
	     Result := '06|0|0|||0|06|0|0|||0';
	     BASE_PIS_RD := BASE_PIS_RD + TOT_ITEM;
     end
	 ELSE IF ((_ISPIS = 'R') OR (CST_PIS = '06')) then
     begin
	     Result := '06|0|0|||0|06|0|0|||0';
       BASE_PIS_RD := BASE_PIS_RD + TOT_ITEM;
     end
	 ELSE IF ((_ISPIS = 'X') OR (CST_PIS = '08')) then
     begin
	     Result := '08|0|0|||0|08|0|0|||0';
       BASE_PIS_ISENTO := BASE_PIS_ISENTO + TOT_ITEM;
     end
   ELSE IF ((_ISPIS = 'I') OR (CST_PIS = '07')) then
     begin
       Result := '07|0|0|||0|07|0|0|||0';
	     BASE_PIS_ISENTO := BASE_PIS_ISENTO + TOT_ITEM;
     end
	 ELSE IF ((_ISPIS = 'B') OR (CST_PIS = '02')) then
     begin
       Result := '02|' + FORM_NUM1(TOT_ITEM) + '|0|||0|02|' + FORM_NUM1(TOT_ITEM) + '|0|||0';
       BASE_PIS_RD := BASE_PIS_RD + TOT_ITEM;
     end
	 ELSE
     begin
       VLR_PIS    := Arredonda(TOT_ITEM * TRIB_ALIQ_PIS / 100, 2);
	     VLR_COFINS := Arredonda(TOT_ITEM * TRIB_ALIQ_COFINS / 100, 2);

       Result := '01|' + FORM_NUM1(TOT_ITEM) + '|' +  FORM_NUM1(TRIB_ALIQ_PIS) + '|||' +
       FORM_NUM1(VLR_PIS) + '|' +
       '01|' + FORM_NUM1(TOT_ITEM) + '|' +  FORM_NUM1(TRIB_ALIQ_COFINS) + '|||' +
	     FORM_NUM1(VLR_COFINS);
	   end;
end;

FUNCTION CALC_PISCOF1(var TOT_ITEM : currency; _ISPIS : String; var VLR_PIS, VLR_COFINS : currency; CST_PIS : String; nfe : boolean = true) : String;
begin
  Result     := '';
  if not nfe then
    begin
      VLR_PIS    := 0;
      VLR_COFINS := 0;
    end;

  CST_PIS := TRIM(CST_PIS);
  IF CST_PIS = '' then CST_PIS := '01';
  //SE A EMPRESA E DE REGIME NORMAL, CALCULA PIS/COFINS

  IF TRIB_REGIME = '1' then //SIMPLES NACIONAL
   Result := '99|0|0|||0|99|0|0|||0'
  Else if ((Contido(_ISPIS, 'MS')) OR (Contido(CST_PIS, '04-05'))) then  //INCLUIR O PIS SUBSTITUI?O COMO MONOF?ICO
    begin
	    Result := '04|0|0|||0|04|0|0|||0';
	    BASE_PIS_RD := BASE_PIS_RD + TOT_ITEM;
    end
	 ELSE IF ((_ISPIS = 'S') OR (CST_PIS = '05')) then //N? TEM MAIS PIS SUBSTITUI?O
     begin
	     Result := '05|0|0|||0|05|0|0|||0';
       BASE_PIS_ST := BASE_PIS_ST + TOT_ITEM;
     end
	 ELSE IF ((_ISPIS = 'N') OR (Contido('06', CST_PIS))) then
     begin
	     Result := '06|0|0|||0|06|0|0|||0';
	     BASE_PIS_RD := BASE_PIS_RD + TOT_ITEM;
     end
	 ELSE IF ((_ISPIS = 'R') OR (CST_PIS = '06')) then
     begin
	     Result := '06|0|0|||0|06|0|0|||0';
       BASE_PIS_RD := BASE_PIS_RD + TOT_ITEM;
     end
	 ELSE IF ((_ISPIS = 'X') OR (CST_PIS = '08')) then
     begin
	     Result := '08|0|0|||0|08|0|0|||0';
       BASE_PIS_ISENTO := BASE_PIS_ISENTO + TOT_ITEM;
     end
   ELSE IF ((_ISPIS = 'I') OR (CST_PIS = '07')) then
     begin
       Result := '07|0|0|||0|07|0|0|||0';
	     BASE_PIS_ISENTO := BASE_PIS_ISENTO + TOT_ITEM;
     end
	 ELSE IF ((_ISPIS = 'B') OR (CST_PIS = '02')) then
     begin
       Result := '02|' + FORM_NUM1(TOT_ITEM) + '|0|||0|02|' + FORM_NUM1(TOT_ITEM) + '|0|||0';
       BASE_PIS_RD := BASE_PIS_RD + TOT_ITEM;
     end
   ELSE IF (CST_PIS = '49') then
     begin
       Result := '49|' + FORM_NUM1(TOT_ITEM) + '|0|||0|49|' + FORM_NUM1(TOT_ITEM) + '|0|||0';
       BASE_PIS_RD := BASE_PIS_RD + TOT_ITEM;
     end
	 ELSE
     begin
       if not nfe then
         begin
           VLR_PIS    := Arredonda(TOT_ITEM * TRIB_ALIQ_PIS / 100, 2);
	         VLR_COFINS := Arredonda(TOT_ITEM * TRIB_ALIQ_COFINS / 100, 2);
         end;

       Result := '01|' + FORM_NUM1(TOT_ITEM) + '|' +  FORM_NUM1(TRIB_ALIQ_PIS) + '|||' +
       FORM_NUM1(VLR_PIS) + '|' +
       '01|' + FORM_NUM1(TOT_ITEM) + '|' +  FORM_NUM1(TRIB_ALIQ_COFINS) + '|||' +
	     FORM_NUM1(VLR_COFINS);
	   end;
end;


function ACHA_CODCLI(CPF_CNPJ, UF : String; nodo_destXML : String = '') : String;
var
  idestra : string;
begin
  Result := '000001';

  idestra := Le_Nodo('idEstrangeiro', nodo_destXML);
  if idestra <> '' then begin
    dm.IBQuery2.Close;
    dm.IBQuery2.SQL.Text := 'select cnpj, cod, est from cliente where ies = :cnpj';
    dm.IBQuery2.ParamByName('cnpj').AsString := CPF_CNPJ;
    dm.IBQuery2.Open;

    Result := dm.IBQuery2.fieldbyname('cod').AsString;
    dm.IBQuery2.Close;
    exit;
  end;


  try
    IF UF <> 'EX' then begin
      if Length(CPF_CNPJ) = 14      then
        begin
          CPF_CNPJ := formataCNPJ(CPF_CNPJ);
        end
      else if Length(CPF_CNPJ) = 11 then
        begin
          CPF_CNPJ := formataCPF(CPF_CNPJ);
        end
      else
        begin
          exit;
        end;

      dm.IBQuery2.Close;
      dm.IBQuery2.SQL.Text := 'select cnpj, cod, est from cliente where cnpj = :cnpj';
      dm.IBQuery2.ParamByName('cnpj').AsString := CPF_CNPJ;
      dm.IBQuery2.Open;
    end
    else begin
      dm.IBQuery2.Close;
      dm.IBQuery2.SQL.Text := 'select cnpj, cod, est from cliente where ies = :cnpj';
      dm.IBQuery2.ParamByName('cnpj').AsString := CPF_CNPJ;
      dm.IBQuery2.Open;
    end;

    if dm.IBQuery2.IsEmpty then begin
      dm.IBQuery2.Close;
      exit;
    end;

    Result := dm.IBQuery2.fieldbyname('cod').AsString;
    dm.IBQuery2.Close;
  finally
    if Result = '000001' then begin
      Result := insereClientePeloNodo(nodo_destXML);
    end;
  end;
end;

FUNCTION VE_ECF(const COD_ECF : integer) : String;
begin
  dm.IBQuery4.Close;
  dm.IBQuery4.SQL.Text := 'select cod, modelo, serial from ecf where cod = :cod';
  dm.IBQuery4.ParamByName('cod').AsInteger := COD_ECF;
  dm.IBQuery4.Open;

  Result := '';

  if not dm.IBQuery4.IsEmpty then
    begin
      Result := '|C400|2D|' + Trim(dm.IBQuery4.fieldbyname('modelo').AsString) + '|' + Trim(dm.IBQuery4.fieldbyname('serial').AsString) + '|' + strzero(IntToStr(COD_ECF), 3) + '|';
    end
  else
    begin
      ShowMessage('O cadastro do ECF ' + IntToStr(COD_ECF) + ' não foi encontrado. Use a ' +
      'rotina Utilitário / Sped Fiscal / Cadastro de ECF para fazer o cadastro, caso ' +
      'contrário esta remessa ficará incompleta.');
      Result := '|C400|2D|ECF ' + IntToStr(COD_ECF) + '|0|' + strzero(IntToStr(COD_ECF), 3) + '|';
    end;

  dm.IBQuery4.Close;
end;

FUNCTION VE_MOVCUPOM(DAT : TDate; ALIQ : Integer = 2; TOT : currency = 0; const indiceECF : String = '') : currency;
var
  ti            : Smallint;
  cod1, ali     : integer;
  totitem1, rep : currency;
begin
  TOTADIC := 0;
  rep     := 0;
  ti      := 0;
  {dm.IBQuery4.Close;
  dm.IBQuery4.SQL.Text := 'select i.cod, i.quant, i.p_venda, i.total, i.aliquota from item_venda i ' +
  ',venda v where (i.nota = v.nota) and (i.data = :ini) and (v.cancelado = 0) and (v.entrega = ''C'') and (substring(v.crc from 7 for 3) = :crc) and (v.total > 0)';
  dm.IBQuery4.ParamByName('ini').AsDate     := DAT;
  dm.IBQuery4.ParamByName('crc').AsString   := strzero(indiceECF, 3);
  dm.IBQuery4.Open;}

  dm.IBQuery4.Close;
  dm.IBQuery4.SQL.Text := 'select i.cod, i.quant, i.p_venda, i.total, i.aliquota from item_venda i ' +
  ',venda v where (i.nota = v.nota) and (i.data = :ini) and (cast(iif(trim(aliquota) = '''', ''2'', trim(aliquota)) as integer) = :aliq) and (v.entrega = ''C'') and (substring(v.crc from 7 for 3) = :crc) and (v.total > 0)';
  dm.IBQuery4.ParamByName('ini').AsDate     := DAT;
  dm.IBQuery4.ParamByName('aliq').AsInteger := ALIQ;
  dm.IBQuery4.ParamByName('crc').AsString   := strzero(indiceECF, 3);
  dm.IBQuery4.Open;

  if dm.IBQuery4.IsEmpty then
    begin
      dm.IBQuery4.SQL.Text := 'select i.cod, i.quant, i.p_venda, i.total, i.aliquota from item_venda i ' +
      ',venda v where (i.nota = v.nota) and (i.data = :ini) and (substring(v.crc from 7 for 3) = :crc) and (v.total > 0)';
      dm.IBQuery4.ParamByName('ini').AsDate     := DAT;
      dm.IBQuery4.ParamByName('crc').AsString   := strzero(indiceECF, 3);
      {dm.IBQuery4.Close;
      dm.IBQuery4.SQL.Text := 'select i.cod, i.quant, i.p_venda, i.total, i.aliquota from item_venda i ' +
      ',venda v where (i.nota = v.nota) and (v.cancelado = 0) and (v.entrega = ''C'') and (substring(v.crc from 7 for 3) = :crc)';
      dm.IBQuery4.ParamByName('crc').AsString   := strzero(indiceECF, 3);}
      dm.IBQuery4.Open;
    end;

 while true do
   begin
     dm.IBQuery4.First;

     while not dm.IBQuery4.Eof do
       begin
         ti := 0;
         while true do
           begin
             if aliq <> 0 then
               begin
                 if StrToInt(strnum(dm.IBQuery4.fieldbyname('aliquota').AsString)) = aliq then
                   begin
                     break;
                   end;
               end
             else break;

             if dm.IBQuery4.Eof then
               begin
                 ti := 1;
                 break;
               end;

             dm.IBQuery4.Next;
           end;

         if ti = 1 then
           begin
             ti := 1;
             break;
           end;

         IF (ARREDONDA(TOTADIC, 2) >= ARREDONDA(TOT, 2)) then
           begin
             REP := 100;
             break;
           end;

         IF (TOTADIC + ABS(dm.IBQuery4.fieldbyname('total').AsCurrency)) <= TOT then
           begin
             totitem1 := ABS(dm.IBQuery4.fieldbyname('total').AsCurrency);
           end
         ELSE totitem1 := ABS(dm.IBQuery4.fieldbyname('p_venda').AsCurrency);

         QTD1 := abs(dm.IBQuery4.fieldbyname('quant').AsCurrency);

         IF ((totitem1 + TOTADIC) > TOT) then
           begin
             totitem1 := TOT - TOTADIC;
           end;

         TOTADIC := TOTADIC + totitem1;

         ali  := StrToIntDef(STRNUM(dm.IBQuery4.fieldbyname('aliquota').AsString), 2);
         if ali = 0 then ali := 2;

         i := listaProdutos.Find(dm.IBQuery4.fieldbyname('cod').AsInteger);
         if i = -1 then
           begin
             i := listaProdutos.Add(TregProd.Create);
             listaProdutos[i].cod   := dm.IBQuery4.fieldbyname('cod').AsInteger;
             listaProdutos[i].preco := dm.IBQuery4.fieldbyname('p_venda').AsCurrency;
             listaProdutos[i].total := totitem1;
             listaProdutos[i].quant := qtd1;
             listaProdutos[i].aliq  := IntToStr(ali);
           end
         else
           begin
             listaProdutos[i].total := listaProdutos[i].total + totitem1;
             listaProdutos[i].quant := listaProdutos[i].quant + qtd1;
           end;

         dm.IBQuery4.Next;
       end;

     IF ((TOTADIC >= TOT) OR (REP >= 100)) then
       begin
         break;
       end;

     rep := rep + 1;
     IF (REP / 5) = Int(REP / 5) then
       begin
         DAT := DAT -1
       end;  
   end;

  Result := TOTADIC;
end;

FUNCTION VAL_ALIQ(ALIQ : String) : integer;
var
  aliq1 : integer;
begin
  aliq := trim(aliq);
  aliq1 := menorInteger(StrToInt(aliq), 12);
  if aliq1 = 0 then aliq1 := 2;

  
  Result := aliq1;
end;

FUNCTION VE_VENDAECF(var query : tibquery; LIQ : boolean) : currency;
var
  ini1, fim1 : integer;
begin
  fim1   := query.FieldDefs.Count - IfThen(query.FieldDefs.Count = 22, 3, 2);
  Result := 0;
  for ini1 := 7 to fim1 do
    begin
      Result := Result + query.fieldbyname(query.FieldDefs[ini1].Name).AsCurrency;
    end;

  if liq then Result := Result - query.fieldbyname('TOT_CANC').AsCurrency;
end;

procedure VALIDALIQ(ALIQUOTA : String;var NUM_ALIQ : integer;var ALIQ : currency;var TRIB : String;var BASE_ICM : currency);
begin
  NUM_ALIQ := VAL_ALIQ(ALIQUOTA);
  dsAliq.FindKey([NUM_ALIQ]);
  TRIB := dsAliq.FieldByName('cst').AsString;
  ALIQ := dsAliq.FieldByName('aliq').AsCurrency;
  BASE_ICM := IfThen(dsAliq.FieldByName('reducao').AsCurrency = 0, 100, dsAliq.FieldByName('reducao').AsCurrency);
  BASE_ICM := IfThen(aliq = 0, 0, BASE_ICM);
end;

function verificaConsistenciaReducaoZ : boolean;
begin
  Result := true;
  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select distinct(CONT_REDUCAOZ), ecf, TOT_GERAL, data from SPED_REDUCAOZ where (data >= :ini) and (data <= :fim) order by ecf, CONT_REDUCAOZ';
  dm.IBselect.ParamByName('ini').AsDate  := StrToDate(dataIni);
  dm.IBselect.ParamByName('fim').AsDate  := StrToDate(DataFim);
  dm.IBselect.Open;

  COD := 'xxxx';
  QTD := 0;

  while not dm.IBselect.Eof do
    begin
      if cod <> dm.IBselect.FieldByName('ecf').AsString then
        begin
          cod := dm.IBselect.FieldByName('ecf').AsString;
          ini := dm.IBselect.FieldByName('CONT_REDUCAOZ').AsInteger;
          tot := dm.IBselect.FieldByName('TOT_GERAL').AsCurrency;
        end;

      //VERIFICA SE O TOTALIZADOR GERAL ESTA ZERADO E O CONTADOR DE REDUÇÃO É VÁIDO)
      if ((dm.IBselect.FieldByName('TOT_GERAL').AsCurrency = 0) and (dm.IBselect.FieldByName('CONT_REDUCAOZ').AsInteger <> 0)) then
        begin
          ShowMessage('ERRO1: Encontrada uma inconsistencia nas leituras Z do ECF ' + strzero(dm.IBselect.fieldbyname('ecf').AsInteger, 3) +
          '. O Totalizador Geral da reducao Z do dia ' + FormatDateTime('dd/mm/yyyy', dm.IBselect.fieldbyname('data').AsDateTime) + ' esta zerado.' + #13 + 'COD: ' + dm.IBselect.fieldbyname('cod').AsString + #13 + 'CRZ: ' +
          dm.IBselect.FieldByName('CONT_REDUCAOZ').AsString);
          Result := false;
          exit;
        end;

      //VERIFICA INTEGRIDADE DO CONTADOR DE REDUCAO Z  
      if ini <> dm.IBselect.FieldByName('CONT_REDUCAOZ').AsInteger then
        begin
          MessageDlg('ERRO2: Foi Encontrada uma inconsistencia nas leituras Z do ECF ' + strzero(dm.IBselect.fieldbyname('ecf').AsInteger, 3) +
          '. O contador de reducao Z do dia ' + FormatDateTime('dd/mm/yyyy', dm.IBselect.fieldbyname('data').AsDateTime) +
          '(' +  dm.IBselect.fieldbyname('CONT_REDUCAOZ').AsString + ') nao confere com a sequencia (' + IntToStr(INI) + ')', mtWarning, [mbOK], 0);
          Result := false;
          exit;
        end;

      ini := ini + 1;
      //VERIFICA INTEGRIDADE DO TOTALIZADOR GERAL E MOVIMENTO DO DIA
   {   if TOT <> dm.IBselect.FieldByName('TOT_GERAL').AsCurrency then
        begin
          TOT_ITEM := dm.IBselect.FieldByName('TOT_GERAL').AsCurrency - TOT;
          IF ARREDONDA(TOT_ITEM, 2) <> ARREDONDA(VE_VENDAECF(dm.ibselect, false), 2) then
            begin
              MessageDlg('ERRO3: Foi Encontrada uma inconsistencia nas leituras Z do ECF ' + strzero(dm.IBselect.fieldbyname('ecf').AsInteger, 3) +
              '. O totalizador geral não confere com a venda do dia ' + FormatDateTime('dd/mm/yyyy', dm.IBselect.fieldbyname('data').AsDateTime) +
              '. Valor acumulado no totalizador geral: ' + FormatCurr('#,###,###0.00', TOT_ITEM) +
              '. Venda do dia: ' + FormatCurr('#,###,###0.00', VE_VENDAECF(dm.ibselect, false)), mtWarning, [mbOK], 0);
              QTD := QTD + 1;
            end;
        end;}

      tot := dm.IBselect.FieldByName('TOT_GERAL').AsCurrency;
      dm.IBselect.Next;
    end;

  if QTD > 0 then
    begin
      if MessageDlg('Foram encontradas ' + IntToStr(trunc(qtd)) +
      ' inconsistencias nas reduções Z' +
      '. Deseja continuar mesmo assim ?', mtWarning, [mbYes, mbNo], 0) = idNo then
        begin
          Result := false;
          exit;
        end;
    end;
  dm.IBselect.Close;  
end;


procedure validaCFOP_DE_ENTRADA(var cfop : String);
begin
  if Contido(copy(cfop,1,1), '567') then cfop := '2102';
end;

procedure REM_CONTRIBUICOES();
begin
  codCTA := '';
  try
    codCTA := funcoes.buscaParamGeral(99, '');
  except
  end;

  if codCTA = '' then codCTA := '1';
  pisInvalido := '-';

    //cria um registro de unidade - só teste
  reg1 := new(RegistroUnidade);
  listaUnidades := TList.Create;
  listaUnidades.Add(reg1);
  //teste unidades em Tlist

  datamov := now;

  mes := FormatDateTime('mm', datamov);
  ano := FormatDateTime('yy', datamov);

  mes := IntToStr(StrToInt(mes) - 1);

  if StrToInt(mes) = 0 then
   begin
     mes := '12';
     ano := IntToStr(StrToInt(ano) - 1);
   end;

  dataIni := '01/' + FormatFloat('###,##00', StrToInt(mes)) + '/' + ano;

  dataIni := dialogo('data', 0, '', 2, true, '', Application.Title,'Confirme a Data Inicial:', dataIni);
  if dataIni = '*' then exit;

  DataFim := FormatDateTime('dd/mm/yy', EndOfTheMonth(StrToDateTime(dataIni)));

  DataFim := dialogo('data', 0, '', 2, true, '', Application.Title,'Confirme a Data Final:', DataFim);
  if DataFim = '*' then exit;

  chaveAnoMes := FormatDateTime('yy', StrToDate(dataIni)) + FormatDateTime('mm', StrToDate(dataIni));

  CriaDiretorio(caminhoEXE_com_barra_no_final + 'SPED\TEMP\');
  CriaDiretorio(caminhoEXE_com_barra_no_final + 'SPED\');

  sim := dialogo('generico', 20, 'SN', 20, true, '', Application.Title,'Confirma remessa do Sped Fiscal de ' + dataIni + ' a ' + DataFim + ' ?', 'S');
  if sim = '*' then exit;

  arqSPED := caminhoEXE_com_barra_no_final + 'SPED\SPIS' + FormatDateTime('mm', StrToDateTime(dataIni)) + FormatDateTime('yy', StrToDateTime(dataIni)) + '.txt';

  arqSPED :=  dialogo('normal', 400, '', 400, true, '', Application.Title,'Confirme o Nome do Arquivo de Remessa:', arqSPED);
  if arqSPED = '*' then exit;

  movimento := TStringList.Create;

  iniciaDataSets();  //iniciou o dataSet de unidades, linhas

  num1 := 0;
  num2 := 0;
  ERRO_CHAVE := '';

  {if FileExists(arqSPED) then
    begin
       showmessage('A remessa do Sped Fiscal referente a este movimento ' +
       'já  existe, por isso não é possível gerar nova remessa.')  ;
       exit;
    end;}

  arqTmp := copy(arqSPED, 1, length(arqSPED) - 3) + 'TMP';
  CriaArquivo(ARQ_SPED, arqSPED, '');
  CriaArquivo(ARQ_TMP, arqTmp, '');

  DM.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select est from registro');
  dm.IBselect.Open;

  UF_EMPRESA := dm.IBselect.fieldbyname('est').AsString;
  dm.IBselect.Close;
  carregaAliquotasEm_MATTRIB; //carrega as aliquotas em um DataSet na memoria dsAliq

  try

  if not verificaConsistenciaReducaoZ then
     begin
       exit;
     end;

  blocoA();

  leSaidas_Contribuicoes();
  TOTAL_REG(ARQ_TMP, 'C');

  leConhecimentos_de_frete_Bloco_D_SF(0);
  TOTAL_REG(ARQ_TMP, 'D');

  //daqui pra baixo ja o TOTAL_REG ja esta dentro da função
  blocoF(0);
  blocoI;
  blocoM();

  blocoP_vazio();
  bloco0_Sped_Contribuicoes();

  cabecalho_SF_Bloco_0(true);
  TOTAL_REG(ARQ_SPED, '0');

  TOTAL_REG(ARQ_TMP, '');

  finally
    montaArquivo();
    informacao(0, fim, 'Aguarde...', false, true, 5);
    ShowMessage('Remessa criada com sucesso em: ' + #13 + arqSPED);
    LimpaMemoria();

    if pisInvalido <> '-' then begin
      form19.RichEdit1.Clear;
      addRelatorioForm19('Produtos com Cód da Natureza de Pis Inválido:' + CRLF);
      addRelatorioForm19(pisInvalido + CRLF);
      form19.ShowModal;
    end;
  end;
end;

procedure MONTA_INVTXT(var arqTXT : TextFile; ano : String);
var
 arqv, cod_ctod : string;
 i, f, ki, ka : integer;
 mat12, arx : TStringList;
begin
  LINHA := '|H001|0|';
  GRAVA_SPED(ARQ_TMP, LINHA);

  arqv := ExtractFileDir(ParamStr(0)) + '\SPED\INV_' + ano + '.TXT';
  arx := TStringList.Create;
  arx.LoadFromFile(arqv);
  f := arx.Count -1;
  i := 0;
  funcoes.informacao(0, f, 'Incluindo Inventario: INV_' + ANO + '.TXT', true, false, 5);
  mat12 := TStringList.Create;
  for i := 0 to f do
    begin
      Application.ProcessMessages;
      funcoes.informacao(i, f, 'Incluindo Inventario: INV_' + ANO + '.TXT ' + 'Reg. ' + IntToStr(i
      ), false, false, 5);
      linha := arx.Strings[i];

      IF LeftStr(LINHA, 3) = '|H0' then
        begin
          le_campos(mat12,linha, '|', FALSE);
          mat12.Values['2'] := trim(mat12.Values['2']);
          //Retorna_Array_de_Numero_de_Notas(mat12, linha, '|');

          IF MAT12.Values['0'] = 'H010' then begin
              dm.IBselect.Close;
              dm.IBselect.SQL.Text := 'select unid from produto where cod = :cod';
              dm.IBselect.ParamByName('cod').AsString := StrNum(mat12.Values['1']);
              dm.IBselect.Open;

      		    //BUSCA O PRODUTO NO CADASTRO NO CAD. DE PRODUTOS E PEGA A UNIDADE ATUAL

              if dm.IBselect.IsEmpty then
                begin
                  IF (trim(mat12.Values['2']) = '') then MAT12.Values['2'] := 'UN';

                  try

                  dm.IBQuery1.Close;
                  dm.IBQuery1.SQL.Text := 'select cod, nome, quant, deposito, codbar from produto where cod = :cod';
                  dm.IBQuery1.ParamByName('cod').AsString := StrNum(mat12.Values['1']);
                  dm.IBQuery1.Open;

                  if not dm.IBQuery1.IsEmpty then
                    begin
                      ka := IDNO;
                      //ka := MessageDlg('Foi Encontrado um Produto no código ' + StrNum(mat12.Values['1']) + ' - ' + dm.IBQuery1.fieldbyname('nome').AsString  + #13 +
                      //'Deseja Substituir por: ' + mat12.Values['8'] + ' ?', mtConfirmation, [mbYes, mbNo], 1);
                    end
                  else ka := idyes;

                  dm.IBQuery1.Close;

                  if ka = idyes then
                    begin
                      dm.IBQuery1.Close;
                      dm.IBQuery1.SQL.Text := 'update or insert into produto(cod, nome, quant, p_compra, p_venda, igual, unid, grupo) ' +
                      'values(:cod, :nome, :quant, :p_compra, :p_venda, :igual, :unid, 0)';
                      dm.IBQuery1.ParamByName('cod').AsString        := StrNum(mat12.Values['1']);
                      dm.IBQuery1.ParamByName('nome').AsString       := mat12.Values['8'];
                      dm.IBQuery1.ParamByName('quant').AsCurrency    := StrToCurrDef(mat12.Values['3'], 0);
                      dm.IBQuery1.ParamByName('p_compra').AsCurrency := StrToCurrDef(mat12.Values['4'], 0);
                      dm.IBQuery1.ParamByName('p_venda').AsCurrency  := StrToCurrDef(mat12.Values['4'], 0) * 2;
                      dm.IBQuery1.ParamByName('igual').AsString      := 'PRODUTO CADASTRADO PELO INV. ' + ano;
                      dm.IBQuery1.ParamByName('unid').AsString       := trim(mat12.Values['2']);
                      dm.IBQuery1.ExecSQL;
                      dm.IBQuery1.Transaction.Commit;
                    end
                  except
                    on e:exception do
                      begin
                        ShowMessage('ERRO BLOCOH: linha 3002, ' + e.Message + #13 + #13 + linha + #13 + #13 + mat12.Text);
                      end;
                  end;
                end;

              UNID := VALIDA_UNID(dm.IBselect.fieldbyname('unid').AsString);
              //VALIDA A UNIDADE

              //if Contido('|003845|', linha) then ShowMessage('UNID=' + UNID + #13 + 'BD=' + dm.IBselect.fieldbyname('unid').AsString + #13 +  #13 + #13 + mat12.GetText);

              VE_UNIDADE(UNID);
              IF mat12.Values['2'] <> UNID then
                begin
                  mat12.Values['2'] := UNID;
                  if mat12.Count < 10 then
                    begin
                     completaStringList(mat12, 10);
                    end;

                  {IF mat12.Values['10'] = '' then
                    begin
                      mat12.Values['10'] := mat12.Values['9'];
                      mat12.Values['9']  := '';
                    end;}

                  LINHA := MONTA_REG(MAT12);
                End;

             //if Contido('|003845|', linha) then ShowMessage('UNID=' + UNID + #13 + 'BD=' + dm.IBselect.fieldbyname('unid').AsString + #13 +  #13 + #13 + mat12.GetText);

              ki := ContaChar1(linha, '|');
              IF((mat12.Values['0'] = 'H010') AND (ki < 12)) then
                begin
                  LINHA := LINHA + '|';
                end;

              try
                ACUMULA_COD((mat12.Values['1']), UNID);
              except
                on e:exception do
                  begin
                    MessageDlg('Erro: ' + e.Message + #13 + 'Linha: ' + IntToStr(i) + #13 + #13 + 'Registro: ' + #13 + mat12.Text,
                    mtError, [mbOK], 1);
                  end;
              end;
            end;
        end;
        
      GRAVA_SPED(ARQ_TMP, LINHA);
    end;

  arx.free;
  funcoes.informacao(0, f, 'Incluindo Inventario: INV_' + ANO + '.TXT', false, true, 5);  
end;

FUNCTION VALIDA_UNID(UNID : String) : String;
begin
  UNID := TRIM(UNID);
  UNID := IfThen(LENGTH(UNID) = 0, 'UN', UNID);
  Result := UNID;
end;

FUNCTION MONTA_REG(var MAT : TStringList) : String;
var
  ini : integer;
begin
  Result := '|';
  FOR INI := 0 TO MAT.Count -1 do
    begin
      Result := Result + MAT.Values[IntToStr(INI)] + '|';
    end;
end;


procedure iniciaContribuicoes();
begin
  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select cnpj from registro';
  dm.IBselect.Open;

  _CNPJ := dm.IBselect.fieldbyname('cnpj').AsString;
  dm.IBselect.Close;
end;

FUNCTION VE_CSTPISCFOP(_CFOP1 : String) : STRING;
begin
  Result := ' ';
  dm.IBQuery2.Close;
  dm.IBQuery2.SQL.Text := 'select pis from COD_OP where COD = :cod';
  dm.IBQuery2.ParamByName('cod').AsString := StrNum(_CFOP1);
  dm.IBQuery2.Open;
  if not dm.IBQuery2.IsEmpty then
    begin
      Result := dm.IBQuery2.fieldbyname('pis').AsString;
    end;
  dm.IBQuery2.Close;
end;

procedure leCFEs();
var
  mat      : TStringList;
  CODNOTA, LIN, desti  : String;
  DATA_EMI : TDate;
  DadosNfe : TDadosNFe;
  i1, acc : integer;
begin
  {DADOS DE NFCes EMITIDAS}
  {dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select chave, nota, cliente, data from nfce where (data >= :ini) and (data <= :fim) and (ADIC = ''CANC'')';
  //dm.IBselect.ParamByName('tipo').AsString := TIPO;
  dm.IBselect.ParamByName('ini').AsDate  := StrToDate(dataIni);
  dm.IBselect.ParamByName('fim').AsDate  := StrToDate(DataFim);
  dm.IBselect.Open;
  dm.IBselect.FetchAll;
  CODNOTA := '';

  while not dm.IBselect.Eof do
    begin

    end; }

  dm.IBselect.Close;

  dm.IBselect.SQL.Text := 'select chave, nota, cliente, data from nfce where substring(chave from 3 for 4) = :ini and ((ADIC = '''') or (ADIC = ''OFF''))';
  dm.IBselect.ParamByName('ini').AsString  := chaveAnoMes;
  {dm.IBselect.SQL.Text := 'select chave, nota, cliente, data from nfce where (data >= :ini) and (data <= :fim) and (ADIC = '''')';
  //dm.IBselect.ParamByName('tipo').AsString := TIPO;
  dm.IBselect.ParamByName('ini').AsDate  := StrToDate(dataIni);
  dm.IBselect.ParamByName('fim').AsDate  := StrToDate(DataFim);}
  dm.IBselect.Open;
  dm.IBselect.FetchAll;
  CODNOTA := '';

  acc := 0;
  acc := dm.IBselect.RecordCount;
  informacao(0, acc, 'Verificando NFCe...', true, false, 2);

  while not dm.IBselect.Eof do
    begin
      informacao(dm.IBselect.RecNo, acc, 'Verificando Vendas...', false, false, 2);
      DECOMP_MOV(linha, mat);
      TOTDESC := 0;
      TOT     := 0;

      listaPIS.Clear;
      BASE_ICM := 0;
      TOT_ICM  := 0;

      NOTA := dm.IBselect.fieldbyname('nota').AsInteger;

      //if not Contido(IntToStr(nota), CODNOTA) then
        //begin
          CODNOTA := CODNOTA + IntToStr(NOTA) + '-';
          DATA_EMI := dm.IBselect.fieldbyname('data').AsDateTime;

          listaProdutos.Clear;
          LE_XMLNFCE(dm.IBselect.fieldbyname('chave').AsString, listaProdutos, dm.IBQuery4, DadosNfe, TRIB_ALIQ_PIS, TRIB_ALIQ_COFINS);
          DATA_EMI := DadosNfe.data;

          if listaProdutos.Count > 0 then
            begin
              //mat.Text := DadosNfe.xml;

              _SER := Le_Nodo('serie', DadosNfe.xml);
              fim  := listaProdutos.Count -1;
              ret := 0;
              ZERA_ALIQCFOP();
              TOT_ITEM := 0;

              for ini := 0 to fim do
                begin
                  ret := ret + 1;

                  DADOS_PROD(IntToStr(listaProdutos[ini].cod) , DESC, UNID, COD_ALIQ, TRIB, ISPIS, COD_ISPIS, PERC_ICMS, BASE_PIS_RD, false);

                  if ((listaProdutos.Items[ini].CST = '60') and (listaProdutos[ini].CFOP = '5102')) then listaProdutos[ini].CFOP := '5405';

                  TOT_ITEM := listaProdutos[ini].total;
                  SOMA_MOV(listaProdutos[ini].cod, - listaProdutos[ini].quant);
                  //ALIQUOTA DE ICMS (PEGA A ALIQUOTA INTERESTADUAL)

                  //VALOR TOTAL DO ITEM - DESCONTO
                  //TOT_ITEM := listaProdutos[ini].total;
                  TOT      := TOT + listaProdutos[ini].total;
                  TOTDESC  := TOTDESC + listaProdutos[ini].descCom;

                  if funcoes.buscaParamGeral(10, '') = '1' then begin
                    listaProdutos[ini].TOT_ICM := 0;
                  end;

                  TOT_ICM  := TOT_ICM  + listaProdutos[ini].TOT_ICM;

                  ACUM_IcmsCstCFOP(listaProdutos.Items[ini], listaPIS, BASE_ICM);

                  {if DadosNfe.chave = '14151005518176000153650010000000231000352150' then
                    begin
                      ShowMessage(listaPIS.getText);
                    end;}

                  //ACUMULA_ALIQCFOP(ALIQ_CFOP, listaProdutos[ini].total, BASE_ICM, TOT_ICM, 0);

                  //ACUMULA VALORES DE PIS/COFINS DA NF-e
                  CALC_PISCOF(TOT_ITEM, ISPIS, listaProdutos[ini].vPIS, listaProdutos[ini].vCOFINS, '');

	                TOT_PIS    := listaProdutos[ini].vPIS;
                  TOT_COFINS := listaProdutos[ini].vCOFINS;

                  //SE NAO TEM PIS/COFINS, ACUMULA NO TOTALIZADOR DE PIS/COFINS NAO TRIBUTADO PARA O RELATORIO DE APURACAO
                  _PISNT := _PISNT + IfThen((TOT_PIS + TOT_COFINS) = 0, listaProdutos[ini].total, 0);
                end; //FOR LISTA DE PRODUTOS

              //REGISTRO C100 - CABECALHO DA NOTA FISCAL
              //VERIFICA SE A NF-e E DE ENTRADA OU SAIDA, PELO CFOP
              LIN := Le_Nodo('tpNF', DadosNfe.xml);
              IF not Contido(LIN, '0-1') then LIN := '1'; //PADRAO SAIDA, SE NAO ACHAR A INFORMACAO

              LINHA := '|C100|' + LIN + '|0||65|00|' + _SER + '|' + DadosNfe.nNF +
              '|' + DadosNfe.chave + '|' +
              DATA_BRA_FULL(DATA_EMI) + '|' + DATA_BRA_FULL(DATA_EMI) + '|' +
              FORM_NUM1(TOT) + '|0|' +  FORM_NUM1(TOTDESC) + '|0|' + FORM_NUM1(TOT) + '|9|0|0|0|' +
              FORM_NUM1(BASE_ICM) + '|' + FORM_NUM1(TOT_ICM) +
              '||||||||';

              GRAVA_SPED(ARQ_TMP, LINHA);

              //TOTALIZA A NOTA COM VARIOS SUB-TOTAIS SEPARADOS POR ALIQUOTAS DIFERENTES

              fim := listaPIS.Count -1;
              for ini := 0 to fim do
                begin
                  TOTDEBICM := TOTDEBICM + listaPIS[ini].icms;
                  LINHA := '|C190|0' + listaPIS[ini].CST + '|' + listaPIS[ini].CFOP + '|' + FORM_NUM1(listaPIS[ini].aliquota) + '|'  +
                  FORM_NUM1(listaPIS[ini].total) + '|'  + FORM_NUM1(listaPIS[ini].Base) + '|'  + FORM_NUM1(listaPIS[ini].icms) + '|0|0|0|0||';

                  GRAVA_SPED(ARQ_TMP, LINHA);
                end;

            end//if listaProdutos.Count > 0 then
            else begin
              ERRO_CHAVE := ERRO_CHAVE + 'NFCe Nao adicionada: ' + DadosNfe.chave + #13;
            end;


        //end;

      dm.IBselect.Next;
      //form22.TrimAppMemorySize;
    end;


  if ERRO_CHAVE <> '' then begin
    ShowMessage(ERRO_CHAVE);
  end;

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select chave, nota, cliente, data, ADIC from nfce'+
  ' where (data >= :ini) and (data <= :fim) and ((ADIC = ''DENEGADA'') ' +
  ' OR (ADIC = ''CANC''))';
  //dm.IBselect.ParamByName('tipo').AsString := TIPO;
  dm.IBselect.ParamByName('ini').AsDate  := StrToDate(dataIni);
  dm.IBselect.ParamByName('fim').AsDate  := StrToDate(DataFim);
  dm.IBselect.Open;
  dm.IBselect.FetchAll;
  CODNOTA := '';

  acc := 0;
  acc := dm.IBselect.RecordCount;
  informacao(0, acc, 'Verificando NFCe...', true, false, 2);

  while not dm.IBselect.Eof do
    begin
      informacao(dm.IBselect.RecNo, acc, 'Verificando Vendas...', false, false, 2);
      TOTDESC := 0;
      TOT     := 0;

      listaPIS.Clear;
      BASE_ICM := 0;
      TOT_ICM  := 0;

      //LE_XMLNFCE(dm.IBselect.fieldbyname('chave').AsString, listaProdutos, dm.IBQuery4, DadosNfe, TRIB_ALIQ_PIS, TRIB_ALIQ_COFINS);

      _SER :=  copy(dm.IBselect.fieldbyname('chave').AsString, 23, 3);//Le_Nodo('serie', DadosNfe.xml);
      i1   :=  StrToIntDef(copy(dm.IBselect.fieldbyname('chave').AsString, 26, 9), 0);

      DESC := '998';
      if trim(dm.IBselect.fieldbyname('adic').AsString) = 'CANC' then DESC := '02';
      if trim(dm.IBselect.fieldbyname('adic').AsString) = 'DENEGADA' then DESC := '04';


      LINHA := '|C100|1|0||65|'+DESC+'|' + _SER + '|' + IntToStr(i1) +
      '|' + dm.IBselect.fieldbyname('chave').AsString + '|||||||||||||||||||||';

      GRAVA_SPED(ARQ_TMP, LINHA);

      dm.IBselect.Next;
    end;

  {DADOS DE NFCeS EMITIDAS}
end;

procedure leCFEsCONTRIBUICOES();
var
  mat      : TStringList;
  CODNOTA, LIN, desti, crc, sim  : String;
  DATA_EMI : TDate;
  DadosNfe : TDadosNFe;
  ini2, fim2, i3, f3, i1, acc, xx, ui : integer;
begin
  sim := 'N';
  sim := dialogo('generico', 20, 'SN', 20, true, 'S', Application.Title,'Usar Códigos de inseção de PIS e COFINS do Estoque ? ' , sim);
  if sim = '*' then sim := 'N';
  {DADOS DE NFCes EMITIDAS}
  dm.IBselect.Close;
  {dm.IBselect.SQL.Text := 'select chave, nota, cliente, data from nfce where (data >= :ini) and (data <= :fim) and (ADIC = '''')';
  //dm.IBselect.ParamByName('tipo').AsString := TIPO;
  dm.IBselect.ParamByName('ini').AsDate  := StrToDate(dataIni);
  dm.IBselect.ParamByName('fim').AsDate  := StrToDate(DataFim);}
  dm.IBselect.SQL.Text := 'select chave, nota, cliente, data from nfce where substring(chave from 3 for 4) = :ini and (ADIC = '''')';
  dm.IBselect.ParamByName('ini').AsString  := chaveAnoMes;
  dm.IBselect.Open;
  dm.IBselect.FetchAll;
  CODNOTA := '';

  acc := 0;
  ui  := 0;
  xx  := 0;
  fim := dm.IBselect.RecordCount;
  informacao(0, fim, 'Verificando NFCe...', true, false, 2);
  while not dm.IBselect.Eof do
    begin
      Application.ProcessMessages;
      ui := ui + 1;
      xx := xx + 1;
      informacao(xx, dm.IBselect.RecordCount, 'Verificando Vendas...', false, false, 2);
      //linha := dm.IBselect.fieldbyname('item').AsString;
      DECOMP_MOV(linha, mat);
      TOTDESC := 0;
      TOT     := 0;

      zerarArrayProduto();
      NOTA := dm.IBselect.fieldbyname('nota').AsInteger;

      //if not Contido(IntToStr(nota), CODNOTA) then
        //begin
          CODNOTA := CODNOTA + IntToStr(NOTA) + '-';
          DATA_EMI := dm.IBselect.fieldbyname('data').AsDateTime;

          listaProdutos.Clear;
          LE_XMLNFCE(dm.IBselect.fieldbyname('chave').AsString, listaProdutos, dm.IBQuery4, DadosNfe, TRIB_ALIQ_PIS, TRIB_ALIQ_COFINS);

          DATA_EMI := DadosNfe.data;
          BASE_ICM := 0;
          MAT_NOTA.Clear;

          if listaProdutos.Count > 0 then
            begin
              //mat.Text := DadosNfe.xml;

              _SER := Le_Nodo('serie', DadosNfe.xml);
              fim  := listaProdutos.Count -1;
              ret := 0;
              ZERA_ALIQCFOP();
              listaPIS.Clear;

              TOT_ITEM := 0;
              TOT_PIS    := 0;
              TOT_COFINS := 0;
              TOT_ITEM   := 0;
              _PISNT     := 0;
              {_CFOP      := Le_Nodo('CFOP', DadosNfe.xml);
              if _CFOP = '' then _CFOP := '5102';
              CSTPIS_CFOP := VE_CSTPISCFOP(_CFOP);}

              for ini := 0 to fim do
                begin
                  ret := ret + 1;

                  DADOS_PROD(IntToStr(listaProdutos[ini].cod) , DESC, UNID, COD_ALIQ, TRIB, ISPIS, COD_ISPIS, PERC_ICMS, BASE_ICM, false);

                  _CFOP      := StrNum(listaProdutos[ini].CFOP);
                  if _CFOP = '0' then _CFOP := '5102';
                  CSTPIS_CFOP := VE_CSTPISCFOP(_CFOP);

                  if funcoes.Contido(CSTPIS_CFOP, 'IRXDN') then
                    begin
                      ISPIS     := CSTPIS_CFOP;
                      COD_ISPIS := '999';
                    end;

                  checaISPIS_CODISPIS(listaProdutos[ini].CST_PIS, COD_ISPIS, listaProdutos[ini].cod);

                  SOMA_MOV(listaProdutos[ini].cod, - listaProdutos[ini].quant);
                  //ALIQUOTA DE ICMS (PEGA A ALIQUOTA INTERESTADUAL)

                  PERC_ICMS := MENOR(ALIQ, PERC_ICMS);

                  //TOT_ITEM := dsProduto.fieldbyname('total').AsCurrency; //MAT_ITENS[INI, 4]  //- MAT_ITENS[INI, 6] - MAT_ITENS[INI, 8]
                  //VALOR TOTAL DO ITEM - DESCONTO
                  //TOT_ITEM := listaProdutos[ini].total;
                  TOT      := TOT + listaProdutos[ini].total;
                  TOTDESC  := TOTDESC + listaProdutos[ini].descCom;

                  TRIB := Trim(listaProdutos[ini].CST);
                  TRIB := IfThen(Length(TRIB) = 2, trib, '41');  //CST - VERIFICA SE O CST DA NF-E   VALIDO, SEN? PEGA 41-N? TRIBUTADO

                  //CALCULA O VALOR DO CREDITO DE ICMS, SE TIVER
                  //BASE_ICM := IfThen(TRIB = '00', TOT_ITEM - dsProduto.fieldbyname('descCom').AsCurrency, 0);//MAT_ITENS[INI, 4] - MAT_ITENS[INI, 6], 0) //TIRANDO APENAS DESCONTO COMERCIAL DA BASE DE CALCULO
                  BASE_ICM := listaProdutos[ini].BASE_ICM;
                  TOT_ICM  := listaProdutos[ini].TOT_ICM;
                  TOT_ICM  := IfThen(TRIB = '00', RoundTo1(BASE_ICM * PERC_ICMS / 100), 0);

                  ALIQ := listaProdutos[ini].PERC_ICM; //PERCENTUAL DE ICMS
	                BASE_ICM := listaProdutos[ini].BASE_ICM;
                  TOT_ICM  := listaProdutos[ini].TOT_ICM;
                  TOT_ICM  := IfThen(TRIB = '00', RoundTo1(BASE_ICM * PERC_ICMS / 100), 0);

                  //ACUMULA CFOP
                  ACUMULACOD(_CFOP, CODCFOP); //# SPED FISCAIS - OS CFOP's USADOS NAS NF-e EMITIDAS N? CONTAM

                  //ACUMULA VALORES DE PIS/COFINS DA NF-e
                  CST_PIS := listaProdutos[ini].CST_PIS;

                  if sim = 'S' then begin
                    ISPIS   := trim(ISPIS);
                    CST_PIS := buscaCST_PIS_Por_ISPIS(ISPIS, COD_ISPIS, listaProdutos[ini].vpis);
                    if listaProdutos[ini].vpis = 0 then listaProdutos[ini].vCOFINS := 0;
                    listaProdutos[ini].CST_PIS := CST_PIS;
                  end;

                  CST_PIS := CALC_PISCOF1(TOT_ITEM, ISPIS, listaProdutos[ini].vPIS, listaProdutos[ini].vCOFINS, CST_PIS);
                  _CFOP := listaProdutos[ini].CFOP;

                  ALIQ_CFOP := LeftStr(CST_PIS, 2) + _CFOP; //(AACFOP - 2 DIGITOS PRA ALIQUOTA E 4 PRO CFOP)

                  //ACUMULA NOS TOTALIZADORES DE ALIQUOTA E CFOP
                  ACUMULA_ALIQCFOP(ALIQ_CFOP, listaProdutos[ini].total, listaProdutos[ini].vPIS, listaProdutos[ini].vCOFINS, 0);

                  UNID := listaProdutos[ini].unid;

                  VE_UNIDADE(UNID);

                  //SE NAO TEM PIS/COFINS, ACUMULA NO TOTALIZADOR DE PIS/COFINS NAO TRIBUTADO PARA O RELATORIO DE APURACAO
                  _PISNT := _PISNT + IfThen((TOT_PIS + TOT_COFINS) = 0, listaProdutos[ini].total, 0);
                  //ACUMULA NOS TOTALIZADORES DE ALIQUOTA DE PIS/COFINS

                   ACUM_PISCST1(listaProdutos.Items[ini], listaPIS, COD_ISPIS, CST_PIS);

                end; //FOR LISTA DE PRODUTOS

              //REGISTRO C100 - CABECALHO DA NOTA FISCAL
              //VERIFICA SE A NF-e E DE ENTRADA OU SAIDA, PELO CFOP
              LIN := Le_Nodo('tpNF', DadosNfe.xml);
              IF not Contido(LIN, '0-1') then LIN := '1'; //PADRAO SAIDA, SE NAO ACHAR A INFORMACAO

              fim := listaPIS.Count -1;

              for ini := 0 to fim do
                begin
                  {if listaPIS[ini].CST = '01' then begin
                    listaPIS[ini].pis    := ArredondaFinanceiro(listaPIS[ini].total * (TRIB_ALIQ_PIS / 100), 2);
                    listaPIS[ini].cofins := ArredondaFinanceiro(listaPIS[ini].total * (TRIB_ALIQ_COFINS / 100), 2);
                  end;}

                  LINHA := '|C175|' + listaPIS[ini].CFOP + '|' + FORM_NUM1(listaPIS[ini].total) + '|' +
                  FORM_NUM1(0) + '|' + listaPIS[ini].CST + '|' + FORM_NUM1(IfThen(listaPIS[ini].CST = '01', listaPIS[ini].total, 0)) + '|'  +
                  FORM_NUM1(IfThen(listaPIS[ini].CST = '01', TRIB_ALIQ_PIS, 0 )) + '|||' +
                  FORM_NUM1(listaPIS[ini].pis) + '|' + listaPIS[ini].CST + '|' +
                  FORM_NUM1(IfThen(listaPIS[ini].CST = '01', listaPIS[ini].total, 0)) + '|' +
                  FORM_NUM1(IfThen(listaPIS[ini].CST = '01', TRIB_ALIQ_COFINS, 0)) + '|||' +
                  FORM_NUM1(listaPIS[ini].cofins) + '|'+codCTA+'||';
                  MAT_NOTA.Add(LINHA);

                  TOT_PIS    := TOT_PIS    + listaPIS[ini].pis;
                  TOT_COFINS := TOT_COFINS + listaPIS[ini].cofins;

                  if listaPIS[ini].CST = '01' then begin
                    BASE_ICM := BASE_ICM + listaPIS[ini].total;
                  end;
                    //end;
                end;


              COD := '';
              LINHA := '|C100|' + LIN + '|0|' + COD + '|' + Le_Nodo('mod', DadosNfe.xml) + '|00|' +
              Le_Nodo('serie', DadosNfe.xml) + '|' + Le_Nodo('nNF', DadosNfe.xml) +  '|' + DadosNfe.chave + '|' +
              DATA_BRA_FULL(DATA_EMI) + '|' + DATA_BRA_FULL(DATA_EMI) + '|' +
              FORM_NUM1(TOT) + '|0|' +  FORM_NUM1(TOTDESC) + '|0|' + FORM_NUM1(TOT) + '|9|0|0|0|0|0|0|0|0|' +
              FORM_NUM1(TOT_PIS) + '|' + FORM_NUM1(TOT_COFINS) + '|0|0|';

              GRAVA_SPED(ARQ_TMP, LINHA);

              fim := MAT_NOTA.Count -1;
              for ini := 0 to fim do
                begin
                  linha := MAT_NOTA[ini];
                  GRAVA_SPED(ARQ_TMP, LINHA);
                end;

              MAT_NOTA.Clear;  

              {fim := listaPIS.Count -1;

              for ini := 0 to fim do
                begin
                  //if listaPIS[ini].total > 0 then
                    //begin
                      LINHA := '|C175|' + listaPIS[ini].CFOP + '|' + FORM_NUM1(listaPIS[ini].total) + '|' +
                      FORM_NUM1(0) + '|' + listaPIS[ini].CST + '|' + FORM_NUM1(listaPIS[ini].total) + '|'  +
                      FORM_NUM1(IfThen(listaPIS[ini].CST = '01', TRIB_ALIQ_PIS, 0 )) + '|||' +
                      FORM_NUM1(listaPIS[ini].pis) + '|' + listaPIS[ini].CST + '|' +
                      FORM_NUM1(listaPIS[ini].total) + '|' +
                      FORM_NUM1(IfThen(listaPIS[ini].CST = '01', TRIB_ALIQ_COFINS, 0 )) + '|||' +
                      FORM_NUM1(listaPIS[ini].cofins) + '|||';
                      GRAVA_SPED(ARQ_TMP, LINHA);
                    //end;
                end; }

              //TOTALIZA A NOTA COM VARIOS SUB-TOTAIS SEPARADOS POR ALIQUOTAS DIFERENTES
              {fim := MAT_ALIQCFOP.Count -1;
              for ini := 0 to fim do
                begin
                   LINHA := '|C175|' + RightStr(MAT_ALIQCFOP.ValueFromIndex[INI], 4) + '|' + FORM_NUM1(StrToCurrDef(VAL_ALIQCFOP.Values[MAT_ALIQCFOP.Names[ini]], 0)) + '|' +
                   FORM_NUM1(0) + '|' + LeftStr(MAT_ALIQCFOP.ValueFromIndex[INI], 2) + '|' + FORM_NUM1(StrToCurrDef(VAL_ALIQCFOP.Values[MAT_ALIQCFOP.Names[ini]], 0)) + '|'  +
                   FORM_NUM1(IfThen(LeftStr(MAT_ALIQCFOP.ValueFromIndex[INI], 2) = '01', TRIB_ALIQ_PIS, 0 )) + '|||' +
                   FORM_NUM1(StrToCurrDef(BAS_ALIQCFOP.Values[MAT_ALIQCFOP.Names[ini]], 0)) + '|' + LeftStr(MAT_ALIQCFOP.ValueFromIndex[INI], 2) + '|' +
                   FORM_NUM1(StrToCurrDef(VAL_ALIQCFOP.Values[MAT_ALIQCFOP.Names[ini]], 0)) + '|' +
                   FORM_NUM1(IfThen(LeftStr(MAT_ALIQCFOP.ValueFromIndex[INI], 2) = '01', TRIB_ALIQ_COFINS, 0 )) + '|||' +
                   FORM_NUM1(StrToCurrDef(VAL_ALIQCFOP.Values[MAT_ALIQCFOP.Names[ini]], 0)) + '|||';

                  GRAVA_SPED(ARQ_TMP, LINHA);
                end;}

            end;//if listaProdutos.Count > 0 then
        //end;

      dm.IBselect.Next;
    end;
  {DADOS DE NFCeS EMITIDAS}
end;

function blocoF(reg : integer = 1) : String;
begin
  if reg = 0 then
    begin
      LINHA := '|F001|1|';
      GRAVA_SPED(ARQ_TMP, LINHA);
      TOTAL_REG(ARQ_TMP, 'F');
      exit;
    end;
end;

function blocoM() : String;
var
  COD, COD_ISEN : String;
  i3, cod_pis : integer;
  blo : boolean;
begin
  if StrToDateTime(dataIni) >= StrToDateTime('01/01/2019') then begin
    blocoM01012019;
    exit;
  end;

  LINHA := '|M001|0|';
  GRAVA_SPED(ARQ_TMP, LINHA);

  //PIS TRIBUTADO - M200
  REC_BRUTA := 0;  //TOTALIZADOR DE RECEITA BRUTA
  _PIS := 0;
  BC_PISTRIB := 0;
  blo := false;

  FOR ini := 0 TO listaTOT_PIS.Count -1 do
    begin
      COD := listaTOT_PIS[ini].CST;
      IF ((listaTOT_PIS[ini].pis > 0) AND (COD = '01')) then
        begin
          //ACUMULA RECEITA BRUTA PARA CONTRIBUIÇÃO PREVIDENCIARIA
	        REC_BRUTA  := REC_BRUTA + listaTOT_PIS[ini].total;
          _PIS       := _PIS + RoundTo1(listaTOT_PIS[ini].total * TRIB_ALIQ_PIS / 100);
	        BC_PISTRIB := BC_PISTRIB + listaTOT_PIS[ini].total;
        end;
    end;

  //DETALHAMENTO PIS TRIBUTADO
  IF (_PIS > 0)  then begin
    blo := true;
    LINHA := '|M200|0|0|0|0|0|0|0|' + FORM_NUM1(_PIS) + '|0|0|' +
    FORM_NUM1(_PIS) + '|' + FORM_NUM1(_PIS) + '|';
    GRAVA_SPED(ARQ_TMP, LINHA);
    LINHA := '|M205|' + '12' + '|810902|' + FORM_NUM1(_PIS) + '|';
    GRAVA_SPED(ARQ_TMP, LINHA);
    LINHA := '|M210|' + '51' + '|' + FORM_NUM1(BC_PISTRIB) + '|' + FORM_NUM1(BC_PISTRIB) + '|' +
    FORM_NUM1(TRIB_ALIQ_PIS) + '|||' + FORM_NUM1(_PIS) + '|0|0|0|0|' + FORM_NUM1(_PIS) + '|' + IfThen(StrToDateTime(dataIni) >= StrToDateTime('01/01/2019'),'0|0|0|', '') ;
    GRAVA_SPED(ARQ_TMP, LINHA);
  end;

   if blo = false then begin
     LINHA := '|M200|0|0|0|0|0|0|0|' + FORM_NUM1(_PIS) + '|0|0|' +
     FORM_NUM1(_PIS) + '|' + FORM_NUM1(_PIS) + '|';
     GRAVA_SPED(ARQ_TMP, LINHA);
   end;

  //PIS NÃO TRUBUTADO - M400
  MAT_CST_PIS.Clear;
  MAT_NOTA.Clear;

  MAT_CST_PIS.Add('04');
  MAT_CST_PIS.Add('05');
  MAT_CST_PIS.Add('06');
  MAT_CST_PIS.Add('07');
  MAT_CST_PIS.Add('08');
  MAT_CST_PIS.Add('09');
  MAT_CST_PIS.Add('99');

  FOR i3 := 0 TO MAT_CST_PIS.Count -1 do
    begin
      TOT_APUR_CST  := 0;
      FOR INI := 0 TO listaTOT_PIS.Count -1 do begin
        COD := listaTOT_PIS[ini].CST;

        IF ((listaTOT_PIS[ini].pis + listaTOT_PIS[ini].cofins > 0) AND (COD = MAT_CST_PIS[i3])) then begin
          TOT_APUR_CST := TOT_APUR_CST + listaTOT_PIS[ini].total;
          LINHA := '|M410|' + RightStr(listaTOT_PIS[ini].cod, 3) + '|' + FORM_NUM1(listaTOT_PIS[ini].total) + '|'+codCTA+'||'; //PROVISORIO - COD. 301 - PRECISA SRE INFORMADO NO CAD. DO PRODUTO
          MAT_NOTA.Add(LINHA);
        end;
      end;

      IF TOT_APUR_CST > 0 then begin
        LINHA := '|M400|' + MAT_CST_PIS[i3] + '|' + FORM_NUM1(TOT_APUR_CST) + '|'+codCTA+'||';
        GRAVA_SPED(ARQ_TMP, LINHA);
        //ASORT(MAT_NOTA) ordenar a matriz, ainda nao fiz

        FOR INI := 0 TO MAT_NOTA.Count -1 do begin
          GRAVA_SPED(ARQ_TMP, MAT_NOTA[INI]);
        end;

        MAT_NOTA.Clear;
      end;
    end;

  //COFINS TRIBUTADA - M600
  _PIS := 0;
  BC_PISTRIB := 0;
  FOR INI := 0 TO listaTOT_PIS.Count -1 do
    begin
      COD := listaTOT_PIS[ini].CST;
      IF ((listaTOT_PIS[ini].cofins > 0) AND (COD = '01')) then
        begin
          //ACUMULA RECEITA BRUTA PARA CONTRIBUIÇÃO PREVIDENCIARIA
          _PIS := _PIS + RoundTo1(listaTOT_PIS[ini].total * TRIB_ALIQ_COFINS / 100);
          //_PIS := _PIS + RoundTo1(StrToCurrDef(BAS_ALIQPIS.Values[MAT_ALIQPIS[INI]], 0) * TRIB_ALIQ_COFINS / 100);
          BC_PISTRIB := BC_PISTRIB + listaTOT_PIS[ini].total;
        end;
    end;

  //DETALHAMENTO COFINS TRIBUTADA
  IF _PIS > 0 then
    begin
      LINHA := '|M600|0|0|0|0|0|0|0|' + FORM_NUM1(_PIS) + '|0|0|' +
      FORM_NUM1(_PIS) + '|' + FORM_NUM1(_PIS) + '|';
      GRAVA_SPED(ARQ_TMP, LINHA);
      LINHA := '|M605|' + '12' + '|217201|' + FORM_NUM1(_PIS) + '|';
      GRAVA_SPED(ARQ_TMP, LINHA);
      LINHA := '|M610|' + '51' + '|' + FORM_NUM1(BC_PISTRIB) + '|' + FORM_NUM1(BC_PISTRIB) + '|' +
      FORM_NUM1(TRIB_ALIQ_COFINS) + '|||' + FORM_NUM1(_PIS) + '|0|0|0|0|' + FORM_NUM1(_PIS) + '|' + IfThen(StrToDateTime(dataIni) >= StrToDateTime('01/01/2019'),'0|0|0|', '') ;
      GRAVA_SPED(ARQ_TMP, LINHA);
    end
  else
    begin
      LINHA := '|M600|0|0|0|0|0|0|0|' + FORM_NUM1(_PIS) + '|0|0|' +
      FORM_NUM1(_PIS) + '|' + FORM_NUM1(_PIS) + '|';
      GRAVA_SPED(ARQ_TMP, LINHA);
    end;

  //COFINS NÃO TRIBUTADO - M800
  MAT_NOTA.Clear;
  FOR i3 := 0 TO MAT_CST_PIS.Count -1 do
    begin
      TOT_APUR_CST  := 0;
      FOR INI := 0 TO listaTOT_PIS.Count -1 do
        begin
          COD := listaTOT_PIS[ini].CST;
          IF ((listaTOT_PIS[ini].cofins > 0) AND (COD = MAT_CST_PIS[i3])) then
            begin
              TOT_APUR_CST := TOT_APUR_CST + listaTOT_PIS[ini].total;
              LINHA := '|M810|' + RightStr(listaTOT_PIS[ini].cod, 3) + '|' + FORM_NUM1(listaTOT_PIS[ini].total) + '|'+codCTA+'||'; //PROVISORIO - COD. 301 - PRECISA SRE INFORMADO NO CAD. DO PRODUTO
       		    MAT_NOTA.Add(LINHA);
            end;
        end;

      IF TOT_APUR_CST > 0 then
        begin
          LINHA := '|M800|' + MAT_CST_PIS[i3] + '|' + FORM_NUM1(TOT_APUR_CST) + '|'+codCTA+'||';
          GRAVA_SPED(ARQ_TMP, LINHA);
          //ASORT(MAT_NOTA)
          FOR INI := 0 TO MAT_NOTA.Count -1 do
            begin
              GRAVA_SPED(ARQ_TMP, MAT_NOTA[INI]);
            end;

          MAT_NOTA.Clear;
        end;
    end;

  TOTAL_REG(ARQ_TMP, 'M');
end;


function blocoM01012019() : String;
var
  COD, COD_ISEN : String;
  i3, cod_pis : integer;
  blo : boolean;
begin
  LINHA := '|M001|0|';
  GRAVA_SPED(ARQ_TMP, LINHA);

  //PIS TRIBUTADO - M200
  REC_BRUTA := 0;  //TOTALIZADOR DE RECEITA BRUTA
  _PIS := 0;
  BC_PISTRIB := 0;
  blo := false;

  FOR ini := 0 TO listaTOT_PIS.Count -1 do
    begin
      COD := listaTOT_PIS[ini].CST;
      IF ((listaTOT_PIS[ini].pis > 0) AND (COD = '01')) then
        begin
          //ACUMULA RECEITA BRUTA PARA CONTRIBUIÇÃO PREVIDENCIARIA
	        REC_BRUTA  := REC_BRUTA + listaTOT_PIS[ini].total;
          _PIS       := _PIS + RoundTo1(listaTOT_PIS[ini].total * TRIB_ALIQ_PIS / 100);
	        BC_PISTRIB := BC_PISTRIB + listaTOT_PIS[ini].total;
        end;
    end;

  //DETALHAMENTO PIS TRIBUTADO
  IF (_PIS > 0)  then
    begin
      blo := true;
      LINHA := '|M200|0|0|0|0|0|0|0|' + FORM_NUM1(_PIS) + '|0|0|' +
      FORM_NUM1(_PIS) + '|' + FORM_NUM1(_PIS) + '|';
      GRAVA_SPED(ARQ_TMP, LINHA);
      LINHA := '|M205|' + '12' + '|810902|' + FORM_NUM1(_PIS) + '|';
      GRAVA_SPED(ARQ_TMP, LINHA);
      LINHA := '|M210|' + '51' + '|' + FORM_NUM1(BC_PISTRIB) + '|' + FORM_NUM1(BC_PISTRIB) + '|' +
      '0|0|' + FORM_NUM1(BC_PISTRIB) + '|' + FORM_NUM1(TRIB_ALIQ_PIS) + '|0||'+ FORM_NUM1(_PIS) +'|0|0|' + IfThen(StrToDateTime(dataIni) >= StrToDateTime('01/01/2019'),'0|0|'+ FORM_NUM1(_PIS) +'|', '') ;
      GRAVA_SPED(ARQ_TMP, LINHA);
    end;

   if blo = false then
     begin
       LINHA := '|M200|0|0|0|0|0|0|0|' + FORM_NUM1(_PIS) + '|0|0|' +
       FORM_NUM1(_PIS) + '|' + FORM_NUM1(_PIS) + '|';
       GRAVA_SPED(ARQ_TMP, LINHA);
     end;

  //PIS NÃO TRUBUTADO - M400
  MAT_CST_PIS.Clear;
  MAT_NOTA.Clear;

  MAT_CST_PIS.Add('04');
  MAT_CST_PIS.Add('05');
  MAT_CST_PIS.Add('06');
  MAT_CST_PIS.Add('07');
  MAT_CST_PIS.Add('08');
  MAT_CST_PIS.Add('09');
  MAT_CST_PIS.Add('99');

  FOR i3 := 0 TO MAT_CST_PIS.Count -1 do
    begin
      TOT_APUR_CST  := 0;
      FOR INI := 0 TO listaTOT_PIS.Count -1 do begin
        COD := listaTOT_PIS[ini].CST;

        IF ((listaTOT_PIS[ini].pis + listaTOT_PIS[ini].cofins > 0) AND (COD = MAT_CST_PIS[i3])) then begin
          TOT_APUR_CST := TOT_APUR_CST + listaTOT_PIS[ini].total;
          LINHA := '|M410|' + RightStr(listaTOT_PIS[ini].cod, 3) + '|' + FORM_NUM1(listaTOT_PIS[ini].total) + '|'+codCTA+'||'; //PROVISORIO - COD. 301 - PRECISA SRE INFORMADO NO CAD. DO PRODUTO
          MAT_NOTA.Add(LINHA);
        end;
      end;

      IF TOT_APUR_CST > 0 then begin
        LINHA := '|M400|' + MAT_CST_PIS[i3] + '|' + FORM_NUM1(TOT_APUR_CST) + '|'+codCTA+'||';
        GRAVA_SPED(ARQ_TMP, LINHA);
        //ASORT(MAT_NOTA) ordenar a matriz, ainda nao fiz

        FOR INI := 0 TO MAT_NOTA.Count -1 do begin
          GRAVA_SPED(ARQ_TMP, MAT_NOTA[INI]);
        end;

        MAT_NOTA.Clear;
      end;
    end;

  //COFINS TRIBUTADA - M600
  _PIS := 0;
  BC_PISTRIB := 0;
  FOR INI := 0 TO listaTOT_PIS.Count -1 do
    begin
      COD := listaTOT_PIS[ini].CST;
      IF ((listaTOT_PIS[ini].cofins > 0) AND (COD = '01')) then
        begin
          //ACUMULA RECEITA BRUTA PARA CONTRIBUIÇÃO PREVIDENCIARIA
          _PIS := _PIS + RoundTo1(listaTOT_PIS[ini].total * TRIB_ALIQ_COFINS / 100);
          //_PIS := _PIS + RoundTo1(StrToCurrDef(BAS_ALIQPIS.Values[MAT_ALIQPIS[INI]], 0) * TRIB_ALIQ_COFINS / 100);
          BC_PISTRIB := BC_PISTRIB + listaTOT_PIS[ini].total;
        end;
    end;

  //DETALHAMENTO COFINS TRIBUTADA
  IF _PIS > 0 then
    begin
      LINHA := '|M600|0|0|0|0|0|0|0|' + FORM_NUM1(_PIS) + '|0|0|' +
      FORM_NUM1(_PIS) + '|' + FORM_NUM1(_PIS) + '|';
      GRAVA_SPED(ARQ_TMP, LINHA);
      LINHA := '|M605|' + '12' + '|217201|' + FORM_NUM1(_PIS) + '|';
      GRAVA_SPED(ARQ_TMP, LINHA);
      LINHA := '|M610|' + '51' + '|' + FORM_NUM1(BC_PISTRIB) + '|' + FORM_NUM1(BC_PISTRIB) + '|' +
      '0|0|' + FORM_NUM1(BC_PISTRIB) + '|' + FORM_NUM1(TRIB_ALIQ_COFINS) + '|0||'+ FORM_NUM1(_PIS) +'|0|0|0|0|'+ FORM_NUM1(_PIS) +'|';
      GRAVA_SPED(ARQ_TMP, LINHA);
    end
  else
    begin
      LINHA := '|M600|0|0|0|0|0|0|0|' + FORM_NUM1(_PIS) + '|0|0|' +
      FORM_NUM1(_PIS) + '|' + FORM_NUM1(_PIS) + '|';
      GRAVA_SPED(ARQ_TMP, LINHA);
    end;

  //COFINS NÃO TRIBUTADO - M800
  MAT_NOTA.Clear;
  FOR i3 := 0 TO MAT_CST_PIS.Count -1 do
    begin
      TOT_APUR_CST  := 0;
      FOR INI := 0 TO listaTOT_PIS.Count -1 do
        begin
          COD := listaTOT_PIS[ini].CST;
          IF ((listaTOT_PIS[ini].cofins > 0) AND (COD = MAT_CST_PIS[i3])) then
            begin
              TOT_APUR_CST := TOT_APUR_CST + listaTOT_PIS[ini].total;
              LINHA := '|M810|' + RightStr(listaTOT_PIS[ini].cod, 3) + '|' + FORM_NUM1(listaTOT_PIS[ini].total) + '|'+codCTA+'||'; //PROVISORIO - COD. 301 - PRECISA SRE INFORMADO NO CAD. DO PRODUTO
       		    MAT_NOTA.Add(LINHA);
            end;
        end;

      IF TOT_APUR_CST > 0 then
        begin
          LINHA := '|M800|' + MAT_CST_PIS[i3] + '|' + FORM_NUM1(TOT_APUR_CST) + '|'+codCTA+'||';
          GRAVA_SPED(ARQ_TMP, LINHA);
          //ASORT(MAT_NOTA)
          FOR INI := 0 TO MAT_NOTA.Count -1 do
            begin
              GRAVA_SPED(ARQ_TMP, MAT_NOTA[INI]);
            end;

          MAT_NOTA.Clear;
        end;
    end;

  TOTAL_REG(ARQ_TMP, 'M');
end;

function leSaidas_Contribuicoes() : Smallint;
var
  listaReg_Cod_CST : TItensProduto;
  mat      : TStringList;
  CODNOTA, LIN, desti, crc, UF  : String;
  TOTX : currency;
  DATA_EMI : TDate;
  DadosNfe : TDadosNFe;
  ini2, fim2, i3, f3, i1, fu, fa : integer;
  prods : String;
begin
  {INICIA SAIDAS}

  prods := '';
  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select cnpj from registro';
  dm.IBselect.Open;

  _CNPJ := dm.IBselect.fieldbyname('cnpj').AsString;
  dm.IBselect.Close;

  LINHA := '|C001|0|';
  GRAVA_SPED(ARQ_TMP, LINHA);

  _CNPJ := StrNum(_CNPJ);
  //IDENTIFICA?O DO ESTABELECIMENTO
  LINHA := '|C010|' + _CNPJ + '|2|';
  GRAVA_SPED(ARQ_TMP, LINHA);

  {DADOS DE NFES EMITIDAS}
  TIPO := '90';
  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select * from nfe f where substring(chave from 3 for 4) = :ini and estado = ''E'' and ((tipo <> ''2'') or (tipo is null)) ';
  dm.IBselect.ParamByName('ini').AsString  := chaveAnoMes;
  {dm.IBselect.SQL.Text := 'select item from fvmt f where (substring(f.item from 21 for 2) = :tipo) and (data >= :ini) and (data <= :fim) and (estado = ''E'')';
  dm.IBselect.ParamByName('tipo').AsString := TIPO;
  dm.IBselect.ParamByName('ini').AsDate  := StrToDate(dataIni);
  dm.IBselect.ParamByName('fim').AsDate  := StrToDate(DataFim);}
  dm.IBselect.Open;
  dm.IBselect.FetchAll;
  fa := dm.IBselect.RecordCount;
  CODNOTA := '';
  _CFOP := '5102';
  fu := 0;


  informacao(0, fa, 'Verificando Vendas...', true, false, 2);
  lista0500.Add('01');
  while not dm.IBselect.Eof do
    begin
      fu := fu + 1;
      informacao(fu, fa, 'Verificando Vendas...', false, false, 2);
      {linha := dm.IBselect.fieldbyname('item').AsString;
      DECOMP_MOV(linha, mat);}
      TOTDESC := 0;
      TOT     := 0;

      zerarArrayProduto();
      NOTA := dm.IBselect.FieldByName('nota').AsInteger;

      //if not Contido(IntToStr(nota), CODNOTA) then
        //begin
        CHAVENF := dm.IBselect.FieldByName('chave').AsString;
        nota    := StrToIntDef(copy(chaveNF, 26, 9), 0);

        CODNOTA := CODNOTA + IntToStr(NOTA) + '-';
          //DATA_EMI := converteDataYYMMDDParaTdate(mat[0]);


          MAT_NOTA.Clear;
          LE_XMLNFE(IntToStr(nota), listaProdutos, dm.IBQuery4, DadosNfe, dm.IBselect.FieldByName('chave').AsString);
          listaPIS.Clear;
          DATA_EMI := DadosNfe.data;

          if listaProdutos.Count > 0 then
            begin
              DESC := Le_Nodo('dest', DadosNfe.xml);
              UF   := Le_Nodo('UF', DESC);

              //mat.SaveToFile(caminhoEXE_com_barra_no_final + 'arqNFE.xml');
              IF Le_Nodo('idEstrangeiro', DadosNfe.xml) <> '' then
                begin
                  COD_ALIQ := Le_Nodo('cPais', DESC);
                  DESC := Le_Nodo('idEstrangeiro', DESC);
                  COD  := DESC;
                  DESC := ACHA_CODCLI(DESC, UF, Le_Nodo('dest', DadosNfe.xml));
                  codigosClientesExterior.Values[DESC] := COD_ALIQ;
                  //ShowMessage(DESC+ '=' + COD_ALIQ+#13+
                  //'-----------------'+#13+codigosClientesExterior.GetText)
                  //adicionei em uma variavel somente os codigos dos clientes do exterior para
                  //descarregar no registro 0150
                end
              else begin
                COD_ALIQ := '1058';
                DESC := IfThen(Contido('<CPF>', DESC), Le_Nodo('CPF', DESC), Le_Nodo('CNPJ', DESC));
                COD  := DESC;

                DESC := ACHA_CODCLI(DESC, UF, Le_Nodo('dest', DadosNfe.xml));
              end;

              if not Contido('-'+ desc + '-', CODCLI) then CODCLI := CODCLI + desc + '-';

              COD  := DESC;

              _SER := Le_Nodo('serie', DadosNfe.xml);
              fim  := listaProdutos.Count -1;
              ret := 0;
              ZERA_ALIQCFOP();

              TOT_ITEM   := 0;
              _PISNT     := 0;
              TOT_PIS    := 0;
              TOT_COFINS := 0;
              _CFOP      := Le_Nodo('CFOP', DadosNfe.xml);
              if _CFOP    = '' then _CFOP := '5102';
              CSTPIS_CFOP := VE_CSTPISCFOP(_CFOP);

              if StrToIntDef(LeftStr(_CFOP, 1), 0) >= 5 then begin

              for ini := 0 to fim do
                begin
                  ret := ret + 1;

                  DADOS_PROD(IntToStr(listaProdutos[ini].cod) , DESC, UNID, COD_ALIQ, TRIB, ISPIS, COD_ISPIS, PERC_ICMS, BASE_ICM);

                  if funcoes.Contido(CSTPIS_CFOP, 'IRXDN') then
                    begin
                      ISPIS     := CSTPIS_CFOP;
                      COD_ISPIS := '999';
                    end;

                  checaISPIS_CODISPIS(listaProdutos[ini].CST_PIS, COD_ISPIS, listaProdutos[ini].cod);

                  {if ChecaIsencaoPis_Cst_49_Devoluções(listaProdutos[ini].CFOP) then begin
                    listaProdutos[ini].CST_PIS := '49';
                    COD_ISPIS   := '';
                    CSTPIS_CFOP := '';
                    ISPIS       := '';
                  end;}

                  TOT_ITEM := listaProdutos[ini].total;  

                  SOMA_MOV(listaProdutos[ini].cod, - listaProdutos[ini].quant);
                  //ALIQUOTA DE ICMS (PEGA A ALIQUOTA INTERESTADUAL)

                  PERC_ICMS := MENOR(ALIQ, PERC_ICMS);

                  TOT      := TOT + listaProdutos[ini].total;
                  TOTDESC  := TOTDESC + listaProdutos[ini].descCom;

                  TRIB := Trim(listaProdutos[ini].CST);
                  TRIB := IfThen(Length(TRIB) = 2, trib, '41');  //CST - VERIFICA SE O CST DA NF-E   VALIDO, SEN? PEGA 41-N? TRIBUTADO

                  if ((TRIB = '60') and (listaProdutos[ini].CFOP = '5102')) then listaProdutos[ini].CFOP := '5405';
                  if ((TRIB = '60') and (listaProdutos[ini].CFOP = '6102')) then listaProdutos[ini].CFOP := '6404';

                  //CALCULA O VALOR DO CREDITO DE ICMS, SE TIVER
                  //BASE_ICM := IfThen(TRIB = '00', TOT_ITEM - dsProduto.fieldbyname('descCom').AsCurrency, 0);//MAT_ITENS[INI, 4] - MAT_ITENS[INI, 6], 0) //TIRANDO APENAS DESCONTO COMERCIAL DA BASE DE CALCULO
                  BASE_ICM := IfThen(TRIB = '00', listaProdutos[ini].total, 0);//MAT_ITENS[INI, 4] - MAT_ITENS[INI, 6], 0) //TIRANDO APENAS DESCONTO COMERCIAL DA BASE DE CALCULO

                  ALIQ := listaProdutos[ini].PERC_ICM; //PERCENTUAL DE ICMS

	                BASE_ICM := listaProdutos[ini].BASE_ICM;
                  TOT_ICM  := listaProdutos[ini].TOT_ICM;
                  //TOT_ICM  := IfThen(TRIB = '00', RoundTo1(BASE_ICM * PERC_ICMS / 100), 0);

                  _CFOP := listaProdutos[ini].CFOP;
                  ALIQ_CFOP := TRIB + '|' +  _CFOP + '|' + FORM_NUM1(ALIQ);

                  //ACUMULA_ALIQCFOP(ALIQ_CFOP, listaProdutos[ini].total, BASE_ICM, TOT_ICM, 0);

                  //ACUMULA CFOP
                  ACUMULACOD(_CFOP, CODCFOP); //# SPED FISCAIS - OS CFOP's USADOS NAS NF-e EMITIDAS N? CONTAM

                  //ACUMULA_COD(IntToStr(listaProdutos[ini].cod), listaProdutos[ini].unid);

                  //ACUMULA VALORES DE PIS/COFINS DA NF-e
                  CST_PIS := listaProdutos[ini].CST_PIS;

                  if CST_PIS = '02' then begin
                    CST_PIS := '01';
                    listaProdutos[ini].CST_PIS := CST_PIS;
                  end;

                 
                  if trim(listaProdutos[ini].CST_PIS) = '01' then begin
                    if listaProdutos[ini].vPIS    = 0 then listaProdutos[ini].vPIS    := ArredondaFinanceiro((listaProdutos[ini].total) * (TRIB_ALIQ_PIS / 100), 2);
                    if listaProdutos[ini].vCOFINS = 0 then listaProdutos[ini].vCOFINS := ArredondaFinanceiro((listaProdutos[ini].total) * (TRIB_ALIQ_COFINS / 100), 2);
                  end;

                  if Contido('|' + listaProdutos[ini].CST_PIS + '|' , '|06|07|') then
                    begin
                      if trim(COD_ISPIS) = '' then COD_ISPIS := '999';
                    end;

                  ISPIS := '';
                  CST_PIS := CALC_PISCOF1(TOT_ITEM, ISPIS, listaProdutos[ini].vPIS, listaProdutos[ini].vCOFINS, CST_PIS);

                  TOT_PIS    := TOT_PIS    + listaProdutos[ini].vPIS;
                  TOT_COFINS := TOT_COFINS + listaProdutos[ini].vCOFINS;

                  ALIQ_CFOP := LeftStr(CST_PIS, 2) + _CFOP;
                  //ACUMULA NOS TOTALIZADORES DE ALIQUOTA E CFOP
                  ACUMULA_ALIQCFOP(ALIQ_CFOP, listaProdutos[ini].total, listaProdutos[ini].vPIS, listaProdutos[ini].vCOFINS, 0);

                  UNID := listaProdutos[ini].unid;
                  VE_UNIDADE(UNID);

                  if Contido('|' + listaProdutos[ini].CST_PIS + '|' , '|06|07|') then
                    begin
                      if trim(COD_ISPIS) = '' then COD_ISPIS := '999';
                    end;

                  //SE NAO TEM PIS/COFINS, ACUMULA NO TOTALIZADOR DE PIS/COFINS NAO TRIBUTADO PARA O RELATORIO DE APURACAO
                  _PISNT := _PISNT + IfThen((TOT_PIS + TOT_COFINS) = 0, listaProdutos[ini].total, 0);

                  LINHA := '|C170|' + IntToStr(INI + 1) + '|' + strzero(listaProdutos[ini].cod, 6) + '|' + DESC + '|' +
                  FORM_NUM1(listaProdutos[ini].quant) + '|' + listaProdutos[ini].unid + '|' + FORM_NUM1(listaProdutos[ini].total) +
                  '|' + FORM_NUM1(listaProdutos[ini].descCom) + '|0|' + '0' + TRIB + '|' + _CFOP + '|' + _CFOP + '|' +
                  FORM_NUM1(BASE_ICM) + '|' + FORM_NUM1(ALIQ) + '|' + FORM_NUM1(TOT_ICM) + '|' + '0|0|0|0|' +
                  IfThen(StrToIntDef(LeftStr(_CFOP, 1 ), 5) <= 3, '03', '53') + '||0|0|0|'  + CST_PIS + '|'+codCTA+'|';  //99|0|0|0|0|0|99|0|0|0|0|0
                  MAT_NOTA.Add(LINHA);

                  if ((StrToIntDef(StrNum(trim(CST_PIS)), 0) > 0) and (StrNum(COD_ISPIS) = '0')) then
                    begin
                      IF not Contido('-' + IntToStr(listaProdutos[ini].cod) +'-', prods) then
                        begin
                          if prods = '' then prods := prods + '-' + IntToStr(listaProdutos[ini].cod) + '-'
                          else prods := prods +  IntToStr(listaProdutos[ini].cod) + '-';
                        end;
                    end;


                  //ACUMULA NOS TOTALIZADORES DE ALIQUOTA DE PIS/COFINS

                  ACUM_PISCST1(listaProdutos.Items[ini], listaPIS, COD_ISPIS, CST_PIS);
                end; //FOR LISTA DE PRODUTOS


              //REGISTRO C100 - CABECALHO DA NOTA FISCAL
              //VERIFICA SE A NF-e E DE ENTRADA OU SAIDA, PELO CFOP
              LIN := Le_Nodo('tpNF', DadosNfe.xml);
              IF not Contido(LIN, '0-1') then LIN := '1'; //PADRAO SAIDA, SE NAO ACHAR A INFORMACAO

              LINHA := '|C100|' + LIN + '|0|2' + strzero(COD, 6) + '|55|00|' + _SER + '|' + strnum(IntToStr(NOTA)) +
              '|' + DadosNfe.chave + '|' +
              DATA_BRA_FULL(DATA_EMI) + '|' + DATA_BRA_FULL(DATA_EMI) + '|' +
              FORM_NUM1(TOT) + '|0|' +  FORM_NUM1(TOTDESC) + '|0|' + FORM_NUM1(TOT) + '|9|0|0|0|' +
              FORM_NUM1(TOTAL_MATRIZ(BAS_ALIQCFOP)) + '|' + FORM_NUM1(TOTAL_MATRIZ(ICM_ALIQCFOP)) +
              '|0|0|0|' + FORM_NUM1(TOT_PIS) + '|' + FORM_NUM1(TOT_COFINS) + '|0|0|';
              GRAVA_SPED(ARQ_TMP, LINHA);

              //GRAVA OS C170 - # SPED FISCAL - AGORA PRECISA INFORMAR OS ITENS DA NF-E
              FOR INI := 0 TO MAT_NOTA.Count -1 do
                begin
                  GRAVA_SPED(ARQ_TMP, MAT_NOTA[INI]);
                end;
            end;//if listaProdutos.Count > 0 then
    //    end;

        end;//if StrToIntDef(LeftStr(_CFOP, 1), 0) > 5 then

      dm.IBselect.Next;
    end;

   sleep(1);
  //ShowMessage('tot_pis=' + CurrToStr(TOT_PIS) + #13 + 'tot_cofins=' + CurrToStr(TOT_COFINS));

  if prods <> '' then
    begin
      MessageDlg('Os produtos abaixo estão sem código de isenção de PIS válidos:'  + #13 + prods, mtInformation, [mbOK], 1);
    end;

  {DADOS DE NFES EMITIDAS}

  {nfces}


  leCFEsCONTRIBUICOES;

  {nfces}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  {DADOS DE CUPOM FISCAIS}
  listaProdutos.Clear;
  MAT_NOTA.Clear;
  TOT_ECF.Clear;
  i := TOT_ECF.Add(TaliqSped.Create);
  TOT_ECF[i].leng      := 'Can-T';
  TOT_ECF[i].CST       := 'XX';
  TOT_ECF[i].codAliq   := 0;
  TOT_ECF[i].totECF    := 0;
  TOT_ECF[i].totVendas := 0;

  dsAliq.First;
  ini := 0;
  while not dsAliq.Eof do begin
    ini := ini + 1;
    if ini = 4 then break;
      num1 := dsAliq.fieldbyname('aliq').AsCurrency;
      if dsAliq.fieldbyname('reducao').AsCurrency <> 0 then
        begin
          num1 := (num1 * dsAliq.fieldbyname('reducao').AsCurrency) / 100;
        end;
      num1 := arredonda(num1, 2);
      num1 := num1 * 100;

      i := TOT_ECF.Add(TaliqSped.Create);
      TOT_ECF[i].leng      := strzero(IntToStr(ini), 2) + 'T' + STRZERO(CurrToStr(num1), 4) ;
      TOT_ECF[i].CST       := '00';
      TOT_ECF[i].codAliq   := ini;
      TOT_ECF[i].totECF    := 0;
      TOT_ECF[i].totVendas := 0;
      dsAliq.Next;
    end;

  i := TOT_ECF.Add(TaliqSped.Create);
  TOT_ECF[i].leng      := 'DT';
  TOT_ECF[i].CST       := 'XX';
  TOT_ECF[i].codAliq   := 0;
  TOT_ECF[i].totECF    := 0;
  TOT_ECF[i].totVendas := 0;

  i := TOT_ECF.Add(TaliqSped.Create);
  TOT_ECF[i].leng      := 'F1';
  TOT_ECF[i].CST       := '60';
  TOT_ECF[i].codAliq   := 10;
  TOT_ECF[i].totECF    := 0;
  TOT_ECF[i].totVendas := 0;

  i := TOT_ECF.Add(TaliqSped.Create);
  TOT_ECF[i].leng      := 'I1';
  TOT_ECF[i].CST       := '40';
  TOT_ECF[i].codAliq   :=  11;
  TOT_ECF[i].totECF    :=   0;
  TOT_ECF[i].totVendas :=   0;

  i := TOT_ECF.Add(TaliqSped.Create);
  TOT_ECF[i].leng      := 'N1';
  TOT_ECF[i].CST       := '41';
  TOT_ECF[i].codAliq   := 12;
  TOT_ECF[i].totECF    := 0;
  TOT_ECF[i].totVendas := 0;

  ZERA_ALIQCFOP();

  //_CFOP := IF(VAL(DECOMP_DATA(SUBSTR(CONFIG1, 165, 2))) = 0, "5102", DECOMP_DATA(SUBSTR(CONFIG1, 165, 2)))
  _CFOP := '5102';
  COD   := '000';

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select COD, DATA, ECF, CONT_REINICIO, CONT_REDUCAOZ, CONT_OP, '+
  'TOT_GERAL, TOT_CANC, TOT_ALIQ01,TOT_ALIQ02, TOT_ALIQ03, TOT_DESC, TOT_FF, TOT_II, TOT_NN, '+
  'VENDABRUTA from SPED_REDUCAOZ where (data >= :ini) and (data <= :fim) order by ecf';
  dm.IBselect.ParamByName('ini').AsDate  := StrToDate(dataIni);
  dm.IBselect.ParamByName('fim').AsDate  := StrToDate(DataFim);
  dm.IBselect.Open;
  dm.IBselect.FetchAll;
  fa := dm.IBselect.RecordCount;
  fu := 0;

  listaReg_Cod_CST := TItensProduto.Create;

  informacao(0, fa, 'Lendo Movimento de ECFs...', true, false, 2);

  //contribuições
  while not dm.IBselect.Eof do
    begin
      fu := fu + 1;
      informacao(fu, fa, 'Lendo Movimento de ECFs...', false, false, 2);

      listaProdutos.Clear;
      MAT_NOTA.Clear;
      lisTMP.Clear;
      VAL_ALIQCFOP.Clear;

      if cod <> dm.IBselect.fieldbyname('ecf').AsString then
        begin
          cod := dm.IBselect.fieldbyname('ecf').AsString;
          //cod := strzero(cod, 3);
          LIN := VE_ECF(StrToInt(cod));
          GRAVA_SPED(ARQ_TMP, LIN);
        end;

     TOTX := VE_VENDAECF(dm.ibselect, false);

     LINHA := '|C405|'+ FormatDateTime('ddmmyyyy', dm.IBselect.fieldbyname('DATA').AsDateTime) + '|' + STRZERO(dm.IBselect.fieldbyname('CONT_REINICIO').AsInteger, 3) + '|' +
     STRZERO(dm.IBselect.fieldbyname('CONT_REDUCAOZ').AsInteger, 6) + '|' + STRZERO(dm.IBselect.fieldbyname('CONT_OP').AsInteger, 6)  + '|' +
     FORM_NUM1(dm.IBselect.fieldbyname('TOT_GERAL').AsCurrency) + '|' + FORM_NUM1(TOTX) + '|';
     GRAVA_SPED(ARQ_TMP, LINHA);


     FOR ini := 7 TO dm.IBselect.FieldDefs.Count - 2 do// IfThen(dm.IBselect.FieldDefs.Count = 22, 3, 2) do
     //FOR ini := 0 TO TOT_ECF.Count -1 do
       begin

          TOT_ECF[ini - 7].totVendas := dm.IBselect.FieldByName(dm.IBselect.FieldDefs[ini].Name).AsCurrency;
         //ShowMessage('cont=' + IntToStr(ini - 7) + #13 + 'tot=' + IntToStr(dm.IBselect.FieldDefs.Count -2) + #13 + #13 + TOT_ECF.GetText);
         //TOT_ECF[ini - (indXNaoTrib -1)].totECF    := 0;
         //TOT_ECF[ini - (indXNaoTrib -1)].totVendas := 0;
          //nao pode adicionar os descontos e nem cancelamentos aqui
          //IF ((dm.IBselect.FieldByName(dm.IBselect.FieldDefs[ini].Name).AsCurrency <> 0) and ((ini - (indXNaoTrib -1)) <> 9)) then
           //    TOT_ECF[ini - (indXNaoTrib -1)].totVendas := dm.IBselect.FieldByName(dm.IBselect.FieldDefs[ini].Name).AsCurrency;
       end;

     listaProdutos.Clear;  

     //GRAVA PRIMEIRO OS REGISTROS C420 DOS TOTALIZADORES QUE NAO TEM C425 (CANCELAMENTO E DESCONTOS)
     //LE OS TOTALIZADORES (A PARTIR DO 5. ELEMENTO) E VE OS QUE TEM MOVIMENTO
     FOR i1 := 0 TO TOT_ECF.Count - 1 do
       begin
         if (TOT_ECF[i1].totVendas <> 0) then
           begin
             LIN := IfThen(copy(TOT_ECF[i1].leng, 3, 1) = 'T', trim(IntToStr(StrToInt(strnum(LeftStr(TOT_ECF[i1].leng, 2))))), '');
             if LIN = '0' then LIN := '';

             TOT_ITEM := VE_MOVCUPOM(dm.IBselect.fieldbyname('data').AsDateTime, TOT_ECF[i1].codAliq, TOT_ECF[i1].totVendas, cod);
           end;//if (TOT_ECF[i1].totVendas <> 0) then
       end;//FOR i1 := 0 TO TOT_ECF.Count - 1 do

       for i3 := 0 to listaProdutos.Count -1 do
         begin
           //SE CHEGOU AQUI, ENT? ESTE ITEM E DA ALIQUOTA ATUAL

           DADOS_PROD(IntToStr(listaProdutos[i3].cod) , DESC, UNID, COD_ALIQ, TRIB, ISPIS, COD_ISPIS, PERC_ICMS, BASE_ICM, false);

           SOMA_MOV(listaProdutos[i3].cod, - listaProdutos[i3].quant);

           //USAR A ALIQUOTA QUE ESTA NA VENDA, E NAO A BUSCADA EM DADOS_PROD, POIS A ATUAL PODE TER SIDO ALTERADA
           VALIDALIQ(listaProdutos[i3].aliq, num_aliq, ALIQ, TRIB, BASE_ICM);

           //VALOR TOTAL DO ITEM
           TOT_ITEM := listaProdutos[i3].total;
           TOT      := TOT + listaProdutos[i3].total;

           UNID := listaProdutos[i3].unid;
           VE_UNIDADE(UNID);

           ACUMULA_COD(IntToStr(listaProdutos[i3].cod), UNID);

           //CALCULA PIS/COFINS
           CST_PIS := CALC_PISCOF(TOT_ITEM, ISPIS, _PIS, _COFINS, '');
           TOT_PIS    := TOT_PIS    + _PIS;
           TOT_COFINS := TOT_COFINS + _COFINS;

           //SE NAO TEM PIS/COFINS, ACUMULA NO TOTALIZADOR DE PIS/COFINS NAO TRIBUTADO PARA O RELATORIO DE APURACAO
           _PISNT := _PISNT + IfThen(_PIS + _COFINS = 0, TOT_ITEM, 0);

           //ACUMULA NOS TOTALIZADORES DE ALIQUOTA E CFOP
           ACUMULA_ALIQCFOP(ALIQ_CFOP, TOT_ITEM, BASE_ICM, TOT_ICM, 0);

           LINHA := '|C481|' + LeftStr(CST_PIS, 2) + '|' + FORM_NUM1(TOT_ITEM) + '|' +
           FORM_NUM1(TOT_ITEM) + '|' + FORM_NUM1(TRIB_ALIQ_PIS) + '|||' +
           FORM_NUM1(_PIS) + '|' + strzero(IntToStr((listaProdutos[i3].cod)), 6) + '||';
           MAT_NOTA.Add(LINHA);

           LINHA := '|C485|' + LeftStr(CST_PIS, 2) + '|' + FORM_NUM1(TOT_ITEM) + '|' +
           FORM_NUM1(TOT_ITEM) + '|' + FORM_NUM1(TRIB_ALIQ_COFINS) + '|||' +
           FORM_NUM1(_COFINS) + '|' + strzero(IntToStr(listaProdutos[i3].cod), 6) + '||';
           MAT_NOTA1.Add(LINHA);

           listaProdutos[i3].total   := TOT_ITEM;
           listaProdutos[i3].vPIS    := _PIS;
           listaProdutos[i3].vCOFINS := _COFINS;
           listaProdutos[i3].CST_PIS := CST_PIS;
           listaProdutos[i3].CFOP    := '5102';

           ACUM_PISCST1(listaProdutos[i3], listaPIS, COD_ISPIS, CST_PIS);

         end;//for i3 := 0 to listaProdutos.Count -1 do

      {for i3 := 0 to listaProdutos.Count -1 do
        begin
          LINHA := '|C481|' + LeftStr(CST_PIS, 2) + '|' + FORM_NUM1(TOT_ITEM) + '|' +
          FORM_NUM1(TOT_ITEM) + '|' + FORM_NUM1(TRIB_ALIQ_PIS) + '|||' +
          FORM_NUM1(_PIS) + '|' + strzero(IntToStr((listaProdutos[i3].cod)), 6) + '||';
          MAT_NOTA.Add(LINHA);

          LINHA := '|C485|' + LeftStr(CST_PIS, 2) + '|' + FORM_NUM1(TOT_ITEM) + '|' +
          FORM_NUM1(TOT_ITEM) + '|' + FORM_NUM1(TRIB_ALIQ_COFINS) + '|||' +
          FORM_NUM1(_COFINS) + '|' + strzero(IntToStr(listaProdutos[i3].cod), 6) + '||';
          MAT_NOTA1.Add(LINHA);
        end;  }

      FOR INI := 0 TO MAT_NOTA.Count -1 do GRAVA_SPED(ARQ_TMP, MAT_NOTA[INI]);
      FOR INI := 0 TO MAT_NOTA1.Count -1 do GRAVA_SPED(ARQ_TMP, MAT_NOTA1[INI]);

      //ZERA OS TOTALIZADORES DE ALIQUOTA PARA O PROXIMO DIA DE MOVIMENTO
      ZERA_ALIQCFOP();

      //ZERA TOTALIZADORES DE PIS/COFINS
      MAT_NOTA.Clear;
      MAT_NOTA1.Clear;

      for ini2 := 0 to TOT_ECF.Count -1 do
        begin
          TOT_ECF[ini2].totECF    := 0;
          TOT_ECF[ini2].totVendas := 0;
        end;

      //ZERA TOTALIZADORES DE PIS/COFINS
      TOT_PIS    := 0;
      TOT_COFINS := 0;
      _PISNT     := 0;

      dm.IBselect.Next;
    end;

  {DADOS DE CUPOM FISCAIS}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  {FIM SAIDAS}
end;

FUNCTION ACUM_PISCST(ALIQ_PIS : String; TOT_ITEM, VLR_PIS, CRED_PIS, DESC : currency) : currency;
var
 POSX : String;
begin
  Result := 0;
  POSX := MAT_ALIQPIS.Values[ALIQ_PIS];
  IF POSX = '' then
    begin
      MAT_ALIQPIS.Values[ALIQ_PIS] := '1';
      IF CRED_PIS = 0 then
        begin
          BAS_ALIQPIS.Values[ALIQ_PIS]  := CurrToStr(TOT_ITEM);
          VAL_ALIQPIS.Values[ALIQ_PIS]  := CurrToStr(VLR_PIS);
          BASC_ALIQPIS.Values[ALIQ_PIS] := '0';  //BASE DE CALCULO DO CREDITO DE PIS/COFINS
          CRED_ALIQPIS.Values[ALIQ_PIS] := '0';  //VALOR DE CREDITO DE PIS/COFINS
          DESC_ALIQPIS.Values[ALIQ_PIS] := CurrToStr(DESC);  //VALOR DO DESCONTO
        end
      else
        begin
          BAS_ALIQPIS.Values[ALIQ_PIS]  := '0';
          VAL_ALIQPIS.Values[ALIQ_PIS]  := '0';
          BASC_ALIQPIS.Values[ALIQ_PIS] := CurrToStr(TOT_ITEM);  //BASE DE CALCULO DO CREDITO DE PIS/COFINS
          CRED_ALIQPIS.Values[ALIQ_PIS] := CurrToStr(VLR_PIS);  //VALOR DE CREDITO DE PIS/COFINS
          DESC_ALIQPIS.Values[ALIQ_PIS] := CurrToStr(DESC);  //VALOR DO DESCONTO
        end;
    end
  else
    begin
      IF CRED_PIS = 0 then
        begin
          VAL_ALIQPIS.Values[ALIQ_PIS] := CurrToStr(StrToCurrDef(VAL_ALIQPIS.Values[ALIQ_PIS] , 0) + VLR_PIS);
          BAS_ALIQPIS.Values[ALIQ_PIS] := CurrToStr(StrToCurrDef(BAS_ALIQPIS.Values[ALIQ_PIS] , 0) + TOT_ITEM);
        end
      else
        begin
          CRED_ALIQPIS.Values[ALIQ_PIS] := CurrToStr(StrToCurrDef(CRED_ALIQPIS.Values[ALIQ_PIS] , 0) + VLR_PIS);
          BASC_ALIQPIS.Values[ALIQ_PIS] := CurrToStr(StrToCurrDef(BASC_ALIQPIS.Values[ALIQ_PIS] , 0) + TOT_ITEM);
        end;

      DESC_ALIQPIS.Values[ALIQ_PIS] := CurrToStr(StrToCurrDef(DESC_ALIQPIS.Values[ALIQ_PIS] , 0) + DESC); //VALOR DO DESCONTO
    end;

end;

function bloco0_Sped_Contribuicoes() : String;
begin
  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select nome, cnpj, est, ies, cod_mun, SUFRAMA from registro';
  dm.IBselect.Open;

  //DADOS PARA O REGISTRO 0140
  ss := '|0140|1|' + Trim(dm.IBselect.FieldByName('nome').AsString) + '|' + StrNum(dm.IBselect.FieldByName('cnpj').AsString) + '|' + dm.IBselect.FieldByName('est').AsString + '|' +
  STRNUM(dm.IBselect.FieldByName('ies').AsString) + '|' + dm.IBselect.FieldByName('cod_mun').AsString + '||' + IfThen(STRNUM(dm.IBselect.FieldByName('SUFRAMA').AsString) = '0', '', STRNUM(dm.IBselect.FieldByName('SUFRAMA').AsString)) + '|';
  dm.IBselect.Close;

  //L 3752
  //CALCULA CONTRIBUIÇÃO PREVIDENCIARIA SOBRE A RECEITA BRUTA - MPV 601/12
  //IF SUBSTR(CONFIG1, 169, 1) = "S"
  //BLOCO_P(ARQ_TMP, REC_BRUTA, STRNUM(FIELD->CGC), DATINI, DATFIN)
  //ENDIF

  LINHA := '|1001|1|';
  GRAVA_SPED(ARQ_TMP, LINHA);
  //TOTALIZA REGISTROS DO TIPO 1 - 1 DIGITO APENAS PORQUE   PARCIAL, SE FOR TOTAL, INFORMAM-SE 4 DIGITOS
  TOTAL_REG(ARQ_TMP, '1');

end;

//-----------------------------------------------------------------------------
//BLOCO P - CONTRIBUIÇÃO PREVIDENCIARIA
//-----------------------------------------------------------------------------
FUNCTION BLOCOP() : string;
//-----------------------------------------------------------------------------
var
  PERC_CONT : currency;
begin
  LINHA := '|P001|0|';
  GRAVA_SPED(ARQ_SPED, LINHA);

  LINHA := '|P010|' + _CNPJ + '|';
  GRAVA_SPED(ARQ_SPED, LINHA);

  PERC_CONT := 1;
  //PERC_CONT := VAL(DECOMP_DATA(SUBSTR(CONFIG1, 170, 2))) / 100
  LINHA := '|P100|' + DATA_BRA_FULL(StrToDate(dataIni)) + '|' + DATA_BRA_FULL(StrToDate(DataFim)) + '|' +
  //FORM_NUM1(REC_BRUTA) + '|' + DECOMP_DATA(SUBSTR(CONFIG1, 172, 4)) + '|' + ;
  FORM_NUM1(REC_BRUTA) + '|0|' + FORM_NUM1(REC_BRUTA) + '|' +
  FORM_NUM1(PERC_CONT) + '|' + FORM_NUM1(REC_BRUTA * PERC_CONT / 100) + '|||';
  GRAVA_SPED(ARQ_SPED, LINHA);

  LINHA := '|P200|' + RightStr(DATA_BRA_FULL(StrToDate(dataIni)), 6) + '|' + FORM_NUM1(REC_BRUTA * PERC_CONT / 100) + '|||' +
  FORM_NUM1(REC_BRUTA * PERC_CONT / 100) + '|299101|';
  GRAVA_SPED(ARQ_SPED, LINHA);

  //TOTALIZA REGISTROS DO TIPO P - 1 DIGITO APENAS PORQUE   PARCIAL, SE FOR TOTAL, INFORMAM-SE 4 DIGITOS
  TOTAL_REG(ARQ_SPED, 'P');
end;

function blocoA() : String;
var
  ini, fim, ini1  : integer;
  item      : Item_venda;
  nota, uf_dest : String;
  desconto : currency;
  NOTAS    : TItensAcumProd;
begin

  query1.Close;
  query1.SQL.Text := 'select * from SPED_MOVFISCAIS where data >= :ini and data <= :fim';
  query1.ParamByName('ini').AsDate := StrToDate(dataIni);
  query1.ParamByName('fim').AsDate := StrToDate(DataFim);
  query1.Open;

  if query1.IsEmpty then begin
    LINHA := '|A001|1|';
    GRAVA_SPED(ARQ_TMP, LINHA);
    TOTAL_REG(ARQ_TMP, 'A');
    query1.Close;
    exit;
  end;

  NOTAS := TItensAcumProd.Create;

  while not query1.Eof do begin
    fim := notas.Add(TacumProd.Create);
    notas[fim].cod        := query1.FieldByName('pedido').AsInteger;
    notas[fim].notaFiscal := query1.FieldByName('nota').AsInteger;
    notas[fim].data       := query1.FieldByName('data').AsDateTime;
    query1.Next;
  end;

  query1.Close;
  query1.SQL.Text := 'select cnpj from registro where cnpj <> ''''';
  query1.Open;

  _CNPJ := strnum(query1.FieldByName('cnpj').AsString);

  LINHA := '|A001|0|';
  GRAVA_SPED(ARQ_TMP, LINHA);
  LINHA := '|A010|' + _CNPJ + '|';
  GRAVA_SPED(ARQ_TMP, LINHA);
  if not assigned(lista) then lista := TList.Create;

  venda := Tvenda.Create;


  for ini := 0 to notas.Count -1 do begin
    lista.Clear;
    nota := IntToStr(notas[ini].cod);
    lerItensDaVenda(lista, nota);
    fim      := lista.Count -1;

    query1.Close;
    query1.SQL.Text := 'select est from cliente where cod = :cod';
    query1.ParamByName('cod').AsInteger := venda.cliente;
    query1.Open;

    uf_dest := trim(query1.FieldByName('est').AsString);
    if uf_dest = '' then uf_dest := 'RR';
    query1.Close;

    CODCLI := IntToStr(venda.cliente) + '-';
    ALIQ   := ALIQ_INTEREST(uf_dest);

    //ZERA TOTAIS DE PIS/COFINS DA NOTA ATUAL
    TOT_PIS    := 0;
    TOT_COFINS := 0;
    _PISNT     := 0;

    //SOMA O TOTAL DE DESCONTOS E TOTAL DA NOTA
    TOTDESC := 0;
    TOT     := 0;
    //PEGA CADA UM DOS ITENS VENDIDOS E MONTA O REGISTRO C170

    MAT_NOTA.Clear;
    fim      := lista.Count -1;
    for ini1 := 0 to fim do begin
      ret  := ret + 1;
      item := lista[ini1];
      COD  := IntToStr(item.cod);
      DADOS_PROD(COD , DESC, UNID, COD_ALIQ, TRIB, ISPIS, COD_ISPIS, PERC_ICMS, BASE_ICM, false);

      SOMA_MOV(item.cod, - item.quant);

      //USAR A ALIQUOTA QUE ESTA NA VENDA, E NAO A BUSCADA EM DADOS_PROD, POIS A ATUAL PODE TER SIDO ALTERADA
      VALIDALIQ(item.aliq, num_aliq, ALIQ, TRIB, BASE_ICM);

      //VALOR TOTAL DO ITEM
      TOT_ITEM := item.total;
      TOT      := TOT + TOT_ITEM;

      IF (TRIB = '00')  then begin
	      BASE_ICM := 100;
      END;

      UNID := item.unid;
      VE_UNIDADE(UNID);

      ACUMULA_COD(IntToStr(item.cod), UNID);

      //CALCULA PIS/COFINS
      CALC_PISCOF(TOT_ITEM, ISPIS, _PIS, _COFINS, '');
      TOT_PIS    := TOT_PIS    + _PIS;
      TOT_COFINS := TOT_COFINS + _COFINS;

      CST_PIS := buscaCST_PIS_Por_ISPIS(ISPIS, COD_ISPIS, item.vpis);
      if item.vpis = 0 then item.vCOFINS := 0;
      item.CST_PIS := CST_PIS;

      //SE NAO TEM PIS/COFINS, ACUMULA NO TOTALIZADOR DE PIS/COFINS NAO TRIBUTADO PARA O RELATORIO DE APURACAO
      _PISNT := _PISNT + IfThen(_PIS + _COFINS = 0, TOT_ITEM, 0);

      //ACUMULA NOS TOTALIZADORES DE ALIQUOTA E CFOP
      ACUMULA_ALIQCFOP(ALIQ_CFOP, TOT_ITEM, BASE_ICM, TOT_ICM, 0);

      LINHA := '|A170|' + IntToStr(INI1 + 1) + '|' + strzero(IntToStr(item.cod), 6) + '|' + DESC + '|' +
      FORM_NUM1(TOT_ITEM) + '|' + FORM_NUM1(item.Desconto) + '|||' + LeftStr(CST_PIS, 2) + '|' +
      FORM_NUM1(TOT_ITEM) + '|' + FORM_NUM1(TRIB_ALIQ_PIS) + '|' + FORM_NUM1(_PIS) + '|' +
      LeftStr(CST_PIS, 2) + '|' + FORM_NUM1(TOT_ITEM) + '|' + FORM_NUM1(TRIB_ALIQ_COFINS) + '|' +
      FORM_NUM1(_COFINS) + '|||';
      MAT_NOTA.Add(LINHA);

      item.total   := TOT_ITEM;
      item.vPIS    := _PIS;
      item.vCOFINS := _COFINS;
      item.CST_PIS := CST_PIS;
      item.CFOP    := '5102';

      ACUM_PISCST2(item.cfop, item.CST_PIS,item.vpis, item.vcofins, 0, item.total, listaPIS, COD_ISPIS, CST_PIS);
    end;//for i3 := 0 to listaProdutos.Count -1 do

    //ACUMULA TOTAL DE ICMS DE ENTRADA PARA INFORMAR NO REGISTRO E110 - CAMPO 6
    //TOTDEBICM += TOTAL_MATRIZ(ICM_ALIQCFOP)

    //REGISTRO A100 - CABECALHO DA NOTA FISCAL
    LINHA := '|A100|1|0|2' + strzero(venda.cliente, 6) + '|00|1|0|' + STRNUM(nota) + '||' +
    DATA_BRA_FULL(notas[ini].data) + '|' + DATA_BRA_FULL(notas[ini].data) + '|' +
    FORM_NUM1(TOT) + '|0|' +  FORM_NUM1(TOTDESC) + '|' +
	  FORM_NUM1(TOT) + '|' + FORM_NUM1(TOT_PIS) + '|' +
	  FORM_NUM1(TOT) + '|' + FORM_NUM1(TOT_COFINS) + '||||';
    GRAVA_SPED(ARQ_TMP, LINHA);

    if not Contido('-' + IntToStr(venda.cliente) + '-', CODCLI) then begin
      CODCLI := CODCLI + IntToStr(venda.cliente) + '-';
    end;


    FOR INI1 := 0 TO MAT_NOTA.Count -1 do begin
      GRAVA_SPED(ARQ_TMP, MAT_NOTA[INI1]);
    end;

  end;

  //GRAVA_SPED(ARQ_TMP, LINHA);

  TOTAL_REG(ARQ_TMP, 'A');

end;


function leSerieDaChaveNfe(const chave : String) : String;
begin
  Result := '1';
  Result := copy(chave, 23, 3);
  Result := IntToStr(StrToIntDef(StrNum(Result), 1));
  if Result = '' then Result := '0';
end;


FUNCTION ACUM_PISCST1(produto : TregProd; var listPis : TItensPISCOFINS; cod_ispis1, cstpis : String) : currency;
var
  fi : integer;
begin
  Result := 0;

  if (trim(cod_ispis1) = '') and (trim(produto.CST_PIS) <> '04') then cod_ispis1      := '999';
  if (trim(cod_ispis1) = '') and (trim(produto.CST_PIS) =  '04') then produto.CST_PIS := '01';
  if (trim(produto.CST_PIS) = '01') and ((produto.vCOFINS) = 0) then begin
    produto.vCOFINS := ArredondaFinanceiro(produto.total * TRIB_ALIQ_COFINS / 100, 2);
    produto.vPIS    := ArredondaFinanceiro(produto.total * TRIB_ALIQ_PIS / 100, 2);
  end;


  fi := listPis.Find(produto.CFOP + produto.CST_PIS);
  if fi > -1 then
    begin
      listPis[fi].pis    := listPis[fi].pis    + produto.vPIS;
      listPis[fi].cofins := listPis[fi].cofins + produto.vCOFINS;
      listPis[fi].icms   := listPis[fi].icms   + produto.TOT_ICM;
      listPis[fi].total  := listPis[fi].total  + produto.total;
    end
  else
    begin
      fi := listPis.Add(TacumPis.Create);
      listPis[fi].cod    := produto.CFOP + produto.CST_PIS;
      listPis[fi].pis    := produto.vPIS;
      listPis[fi].total  := produto.total;
      listPis[fi].cofins := produto.vCOFINS;
      listPis[fi].CST    := produto.CST_PIS;
      listPis[fi].CFOP   := produto.CFOP;
    end;

  fi := listaTOT_PIS.Find(produto.CST_PIS + cod_ispis1);
  if fi > -1 then
    begin
      listaTOT_PIS[fi].pis    := listaTOT_PIS[fi].pis    + ArredondaFinanceiro(produto.total * (TRIB_ALIQ_PIS / 100)   , 2);
      listaTOT_PIS[fi].cofins := listaTOT_PIS[fi].cofins + ArredondaFinanceiro(produto.total * (TRIB_ALIQ_COFINS / 100), 2);
      listaTOT_PIS[fi].total  := listaTOT_PIS[fi].total  + produto.total;
    end
  else
    begin
      fi := listaTOT_PIS.Add(TacumPis.Create);
      listaTOT_PIS[fi].cod    := produto.CST_PIS + cod_ispis1;
      listaTOT_PIS[fi].pis    := ArredondaFinanceiro(produto.total * (TRIB_ALIQ_PIS / 100)   , 2);
      listaTOT_PIS[fi].cofins := ArredondaFinanceiro(produto.total * (TRIB_ALIQ_COFINS / 100), 2);
      listaTOT_PIS[fi].total  := produto.total;
      listaTOT_PIS[fi].CST    := produto.CST_PIS;
      listaTOT_PIS[fi].CFOP   := produto.CFOP;
    end;
end;

FUNCTION ACUM_PISCST2(prod_CFOP, prod_CST_PIS : String;vpis, vcofins, icms, total : currency; var listPis : TItensPISCOFINS; cod_ispis1, cstpis : String) : currency;
var
  fi : integer;
begin
  Result := 0;

  fi := listPis.Find(prod_CFOP + prod_CST_PIS);
  if fi > -1 then
    begin
      listPis[fi].pis    := listPis[fi].pis    + vPIS;
      listPis[fi].cofins := listPis[fi].cofins + vCOFINS;
      listPis[fi].icms   := listPis[fi].icms   + TOT_ICM;
      listPis[fi].total  := listPis[fi].total  + total;
    end
  else
    begin
      fi := listPis.Add(TacumPis.Create);
      listPis[fi].cod    := prod_CFOP + prod_CST_PIS;
      listPis[fi].pis    := vPIS;
      listPis[fi].total  := total;
      listPis[fi].cofins := vCOFINS;
      listPis[fi].CST    := prod_CST_PIS;
      listPis[fi].CFOP   := prod_CFOP;
    end;

  fi := listaTOT_PIS.Find(prod_CST_PIS + cod_ispis1);
  if fi > -1 then
    begin
      listaTOT_PIS[fi].pis    := listaTOT_PIS[fi].pis    + ArredondaFinanceiro(total * (TRIB_ALIQ_PIS / 100)   , 2);
      listaTOT_PIS[fi].cofins := listaTOT_PIS[fi].cofins + ArredondaFinanceiro(total * (TRIB_ALIQ_COFINS / 100), 2);
      listaTOT_PIS[fi].total  := listaTOT_PIS[fi].total  + total;
    end
  else
    begin
      fi := listaTOT_PIS.Add(TacumPis.Create);
      listaTOT_PIS[fi].cod    := prod_CST_PIS + cod_ispis1;
      listaTOT_PIS[fi].pis    := ArredondaFinanceiro(total * (TRIB_ALIQ_PIS / 100)   , 2);
      listaTOT_PIS[fi].cofins := ArredondaFinanceiro(total * (TRIB_ALIQ_COFINS / 100), 2);
      listaTOT_PIS[fi].total  := total;
      listaTOT_PIS[fi].CST    := prod_CST_PIS;
      listaTOT_PIS[fi].CFOP   := prod_CFOP;
    end;
end;

function blocoK() : String;
begin
  IF StrToInt(FormatDateTime('yyyy', StrToDate(dataIni))) < 2016 then exit;
  LINHA := '|K001|1|';
  GRAVA_SPED(ARQ_TMP, LINHA);

  TOTAL_REG(ARQ_TMP, 'K');
end;

FUNCTION ACUM_IcmsCstCFOP(produto : TregProd; var listPis : TItensPISCOFINS; var base_calcICMS : currency) : currency;
var
  fi : integer;
begin
  Result := 0;

  fi := listPis.Find(produto.CFOP + produto.CST + CurrToStr(produto.PERC_ICM));
  if fi > -1 then
    begin
      listPis[fi].icms    := listPis[fi].icms  + produto.TOT_ICM;
      listPis[fi].total   := listPis[fi].total + produto.total;
      if produto.TOT_ICM > 0 then begin
        listPis[fi].base  := listPis[fi].base  + produto.BASE_ICM;
        base_calcICMS     := base_calcICMS     + produto.BASE_ICM;
      end;  
    end
  else
    begin
      fi := listPis.Add(TacumPis.Create);
      listPis[fi].cod      := produto.CFOP + produto.CST + CurrToStr(produto.PERC_ICM);
      listPis[fi].total    := produto.total;
      listPis[fi].CST      := produto.CST;
      listPis[fi].aliquota := produto.PERC_ICM;
      listPis[fi].CFOP     := produto.CFOP;
      listPis[fi].icms     := produto.TOT_ICM;
      if produto.TOT_ICM > 0 then begin
        listPis[fi].base     := produto.BASE_ICM;
        base_calcICMS        := base_calcICMS + produto.BASE_ICM;
      end;
    end;
end;

function buscaCST_PIS_Por_ISPIS(ispis1, codispis1 : String; var pis : currency) : string;
begin
  Result := '01';
  if Contido('|' + (ispis1) + '|', '|I|M|R|X|D|') then begin
    codispis1 := StrNum(codispis1);
    if length(codispis1) = 3 then begin
      Result := '06';
      if      ISPIS = 'R' then Result := '06'
      else if ISPIS = 'M' then Result := '04'
      else if ISPIS = 'I' then Result := '07'
      else if ISPIS = 'X' then Result := '08';
      pis := 0;
    end;
  end;
end;

procedure rateioCredICMS();
begin
  fim := listaProdutos.Count -1;
  TOT  := 0;
  QTD1 := DADOS_ADIC[11];
  for ini := 0 to fim do begin
    if listaProdutos[ini].cod_aliq < 10 then begin
      TOT := TOT + listaProdutos[ini].total;
    end;
  end;

  POS1 := DADOS_ADIC[11];
  for ini := 0 to fim do begin
    if listaProdutos[ini].cod_aliq < 10 then begin
      ret := ini;
      LIDO := (listaProdutos[ini].total / TOT) * DADOS_ADIC[11];

      //ShowMessage(IntToStr(listaProdutos[ini].cod) + #13 +
      //CurrToStr(lido));

      IF LIDO <= POS1 then begin
        listaProdutos[ini].TOT_ICM := listaProdutos[ini].TOT_ICM + LIDO;
        POS1 := POS1 - LIDO;
      end
      ELSE begin
        listaProdutos[ini].TOT_ICM  := listaProdutos[ini].TOT_ICM + POS1;
        POS1 := 0;
      end;
    end;
  end;

  if POS1 > 0 then begin
    listaProdutos[ret].TOT_ICM  := listaProdutos[ret].TOT_ICM + POS1;
  end;

  for ini := 0 to fim do begin
    if listaProdutos[ini].cod_aliq < 10 then begin
      listaProdutos[ini].PERC_ICM := Arredonda(listaProdutos[ini].TOT_ICM / listaProdutos[ini].total * 100, 2);
    end;
  end;
end;

procedure insereInutilizacoesFiscal();
var
  valor : integer;
begin
  if funcoes.verSeExisteTabela('INUTILIZACAO') = false then exit;


  query1.Close;
  query1.SQL.Text := 'select inicio, fim, serie, tipo, data from INUTILIZACAO where data >= :ini and data <= :fim';
  query1.ParamByName('ini').AsDate := StrToDateTime(dataIni);
  query1.ParamByName('fim').AsDate := StrToDateTime(DataFim);
  query1.Open;

  if query1.IsEmpty then begin
    query1.Close;
    exit;
  end;

  while not query1.Eof do begin
    valor := query1.FieldByName('inicio').AsInteger;
    while true do begin
      if valor > query1.FieldByName('fim').AsInteger then break;

      LINHA := '|C100|1|0||'+query1.FieldByName('tipo').AsString+'|05|' + query1.FieldByName('serie').AsString + '|' + strnum(IntToStr(valor)) +
      '||||||||||||||||||||||';

      GRAVA_SPED(ARQ_TMP, LINHA);
      valor := valor + 1;
    end;

    query1.Next;
  end;
end;

procedure restauraCadastroProduto(cod2 : String; msg : boolean);
begin
  query1.Close;
  query1.SQL.Text := 'select * from PRODUTO_DELETED where cod = ' + StrNum(cod2);
  query1.Open;

  if query1.IsEmpty then begin
    if msg then ShowMessage('Produto '+ cod2 +' Não Encontrado!');
    query1.Close;
    exit;
  end;

  query2.Close;
  query2.SQL.Text := 'insert into produto(cod, nome, codbar, p_venda, p_compra, unid, fornec, fabric, aliquota,classif, grupo, quant, estoque)' +
  'values(:cod, :nome, :codbar, :p_venda, :p_compra, :unid, :fornec, :fabric, :aliquota,:classif, :grupo, :quant, :estoque)' ;
  query2.ParamByName('cod').AsString        := cod2;
  query2.ParamByName('nome').AsString       := query1.FieldByName('nome').AsString;
  query2.ParamByName('codbar').AsString     := query1.FieldByName('codbar').AsString;
  query2.ParamByName('p_venda').AsCurrency  := query1.FieldByName('p_venda').AsCurrency;
  query2.ParamByName('p_compra').AsCurrency := query1.FieldByName('p_compra').AsCurrency;
  query2.ParamByName('fornec').AsString     := query1.FieldByName('fornec').AsString;
  query2.ParamByName('fabric').AsString      := query1.FieldByName('fabric').AsString;
  query2.ParamByName('aliquota').AsString   := query1.FieldByName('aliquota').AsString;
  query2.ParamByName('classif').AsString    := query1.FieldByName('classif').AsString;
  query2.ParamByName('classif').AsString    := query1.FieldByName('grupo').AsString;
  query2.ParamByName('quant').AsCurrency    := query1.FieldByName('quant').AsCurrency;
  query2.ParamByName('estoque').AsCurrency  := query1.FieldByName('estoque').AsCurrency;

  try
    query2.ExecSQL;
    query2.Transaction.Commit;
  except
    on e:exception do begin
      if msg then begin
        ShowMessage('Ocorreu um Erro-5096: ' + e.Message);
        exit;
      end;
    end;
  end;

  if msg then begin
    ShowMessage('PRODUTO: ' + #13 + 'COD: ' + COD2 + #13 +
    'NOME:   ' + query1.FieldByName('nome').AsString + #13 +
    'CODBAR: ' + query1.FieldByName('codbar').AsString + #13 +
    'PREÇO:  ' + formataCurrency(query1.FieldByName('p_venda').AsCurrency) + #13 + #13 +
    'Cadastrado Com Sucesso!');
  end;

  query1.Close;
end;


procedure leNfesImportadasDeOutroSistema();
var
  acc, cont : integer;
  DATA_EMI : TDateTime;
  DadosNfe : TDadosNFe;
  LIN, UF  : string;
begin
  dm.IBselect.SQL.Text := 'select * from nfe f where substring(chave from 3 for 4) = :ini and estado = ''S''  and ((tipo <> ''2'') or (tipo is null)) ';
  dm.IBselect.ParamByName('ini').AsString  := chaveAnoMes;
  dm.IBselect.Open;
  dm.IBselect.FetchAll;

  if dm.IBselect.IsEmpty then exit;

  acc := 0;
  fim := dm.IBselect.RecordCount;
  informacao(0, fim, 'Verificando Vendas...', true, false, 2);
  while not dm.IBselect.Eof do
    begin
      BASE_ICM := 0;
      TOT_ICM  := 0;
      acc := acc + 1;
      informacao(acc, fim, 'Verificando Vendas...', false, false, 2);
      //linha := dm.IBselect.fieldbyname('item').AsString;
      //DECOMP_MOV(linha, mat);
      TOTDESC := 0;
      TOT     := 0;
      listaPIS.Clear;

      zerarArrayProduto();
      //NOTA := StrToIntDef(mat[2], 0);
      NOTA := dm.IBselect.FieldByName('nota').AsInteger ;

      //if not Contido(IntToStr(nota), CODNOTA) then
        //begin
          //CODNOTA := CODNOTA + IntToStr(NOTA) + '-';
          //DATA_EMI := converteDataYYMMDDParaTdate(mat[0]);
          DATA_EMI := dm.IBselect.FieldByName('data').AsDateTime;

          LE_XMLNFE('', listaProdutos, dm.IBQuery4, DadosNfe, dm.IBselect.FieldByName('chave').AsString);

          if listaProdutos.Count > 0 then
            begin
              DATA_EMI := DadosNfe.data;
              //mat.Text := DadosNfe.xml;
              //mat.SaveToFile(caminhoEXE_com_barra_no_final + 'arqNFE.xml');
              DESC := Le_Nodo('dest', DadosNfe.xml);
              UF   := Le_Nodo('UF', DESC);

              //if Contido('<idEstrangeiro>', DadosNfe.xml) then
              IF Le_Nodo('idEstrangeiro', DadosNfe.xml) <> '' then
                begin
                  COD_ALIQ := Le_Nodo('cPais', DESC);
                  DESC := Le_Nodo('idEstrangeiro', DESC);
                  COD  := DESC;
                  DESC := ACHA_CODCLI(DESC, UF, Le_Nodo('dest', DadosNfe.xml));
                  codigosClientesExterior.Values[DESC] := COD_ALIQ;
                  //ShowMessage(DESC+ '=' + COD_ALIQ+#13+
                  //'-----------------'+#13+codigosClientesExterior.GetText)
                  //adicionei em uma variavel somente os codigos dos clientes do exterior para
                  //descarregar no registro 0150
                end
              else begin
                DESC := IfThen(Contido('<CPF>', DESC), Le_Nodo('CPF', DESC), Le_Nodo('CNPJ', DESC));
                COD  := DESC;

                DESC := ACHA_CODCLI(DESC, UF, Le_Nodo('dest', DadosNfe.xml));
              end;

              COD  := DESC;
              if not Contido('-'+ desc + '-', CODCLI) then CODCLI := CODCLI + IntToStr(StrToIntDef(desc, 0)) + '-';


              _SER := Le_Nodo('serie', DadosNfe.xml);
              fim  := listaProdutos.Count -1;
              ret := 0;
              ZERA_ALIQCFOP();
              TOT_ITEM := 0;

              for ini := 0 to fim do
                begin
                  ret  := ret + 1;
                  UNID := listaProdutos[ini].unid;
                  DESC := listaProdutos[ini].nome;
                  PERC_ICMS := listaProdutos[ini].PERC_ICM;
                  listaProdutos[ini].codStr := listaProdutos[ini].codStr + 'S';

                  cont := Lista0200Importados.FindCodSTR(listaProdutos[ini].codStr);
                  if cont = -1  then begin
                    cont := Lista0200Importados.Add(listaProdutos.Items[ini]);
                  end
                  else begin
                    Lista0200Importados[cont].quant := Lista0200Importados[cont].quant + listaProdutos[ini].quant;
                  end;


                  //DADOS_PROD(IntToStr(listaProdutos[ini].cod) , DESC, UNID, COD_ALIQ, TRIB, ISPIS, COD_ISPIS, PERC_ICMS, BASE_PIS_RD, false);
                  //SOMA_MOV(listaProdutos[ini].cod, - listaProdutos[ini].quant);

                  //VALOR TOTAL DO ITEM - DESCONTO
                  TOT_ITEM := listaProdutos[ini].total;

                  if funcoes.buscaParamGeral(10, '') = '1' then begin
                    listaProdutos[ini].TOT_ICM := 0;
                  end;

                  TOT      := TOT + listaProdutos[ini].total;
                  TOTDESC  := TOTDESC + listaProdutos[ini].descCom;

                  TRIB := Trim(listaProdutos[ini].CST);
                  TRIB := IfThen(Length(TRIB) = 2, trib, '41');  //CST - VERIFICA SE O CST DA NF-E   VALIDO, SEN? PEGA 41-N? TRIBUTADO

                  TOT_ICM  := TOT_ICM  + listaProdutos[ini].TOT_ICM;
                  ACUM_IcmsCstCFOP(listaProdutos.Items[ini], listaPIS, BASE_ICM);

                  //ACUMULA VALORES DE PIS/COFINS DA NF-e
                  CALC_PISCOF(TOT_ITEM, ISPIS, listaProdutos[ini].vPIS, listaProdutos[ini].vCOFINS, '');

	                TOT_PIS    := listaProdutos[ini].vPIS;
                  TOT_COFINS := listaProdutos[ini].vCOFINS;

                  //SE NAO TEM PIS/COFINS, ACUMULA NO TOTALIZADOR DE PIS/COFINS NAO TRIBUTADO PARA O RELATORIO DE APURACAO
                  _PISNT := _PISNT + IfThen((TOT_PIS + TOT_COFINS) = 0, listaProdutos[ini].total, 0);
                end; //FOR LISTA DE PRODUTOS

              //REGISTRO C100 - CABECALHO DA NOTA FISCAL
              //VERIFICA SE A NF-e E DE ENTRADA OU SAIDA, PELO CFOP
              LIN := Le_Nodo('tpNF', DadosNfe.xml);
              IF not Contido(LIN, '0-1') then LIN := '1'; //PADRAO SAIDA, SE NAO ACHAR A INFORMACAO

              LINHA := '|C100|' + LIN + '|0|2' + strzero(COD, 6) + '|55|00|' + _SER + '|' + strnum(IntToStr(NOTA)) +
              '|' + DadosNfe.chave + '|' +
              DATA_BRA_FULL(DATA_EMI) + '|' + DATA_BRA_FULL(DATA_EMI) + '|' +
              FORM_NUM1(TOT) + '|0|' +  FORM_NUM1(TOTDESC) + '|0|' + FORM_NUM1(TOT) + '|9|0|0|0|' +
              FORM_NUM1(BASE_ICM) + '|' + FORM_NUM1(TOT_ICM) +
              '|0|0|0|' + FORM_NUM1(TOT_PIS) + '|' + FORM_NUM1(TOT_COFINS) + '|0|0|';

              GRAVA_SPED(ARQ_TMP, LINHA);

              fim := listaPIS.Count -1;
              for ini := 0 to fim do
                begin
                  if StrToIntDef(LeftStr(listaPIS[ini].CFOP, 1), 5) >= 5 then TOTDEBICM := TOTDEBICM + listaPIS[ini].icms
                   else TOTCREDICM := TOTCREDICM + (listaPIS[ini].icms);
                  LINHA := '|C190|0' + listaPIS[ini].CST + '|' + listaPIS[ini].CFOP + '|' + FORM_NUM1(listaPIS[ini].aliquota) + '|'  +
                  FORM_NUM1(listaPIS[ini].total) + '|'  + FORM_NUM1(listaPIS[ini].Base) + '|'  + FORM_NUM1(listaPIS[ini].icms) + '|0|0|0|0||';

                  GRAVA_SPED(ARQ_TMP, LINHA);
                end;

            end;//if listaProdutos.Count > 0 then
        //end;

      dm.IBselect.Next;
    end;
end;


function insereClientePeloNodo(nodo_dest : String) : String;
var
  codTemp : String;
  arq : TStringList;
begin
  arq := TStringList.Create;
  if contido('idEstrangeiro', nodo_dest) then begin
    arq.Values['TIPO'] := '7';
    arq.Values['IES']  := Le_Nodo('idEstrangeiro', nodo_dest);
  end
  else begin
    if contido('CPF', nodo_dest) then begin
      arq.Values['CNPJ']  := formataCPF(Le_Nodo('CPF', nodo_dest));
      arq.Values['TIPO'] := '1';
    end
    else begin
      arq.Values['CNPJ']  := formataCNPJ(Le_Nodo('CNPJ', nodo_dest));
      arq.Values['TIPO'] := '2';
    end;

    arq.Values['IES']  := Le_Nodo('IE', nodo_dest);
  end;

  Result := Incrementa_Generator('cliente', 1);
  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text := 'insert into cliente(cod, nome, cnpj, ende, bairro, cod_mun, cep,' +
  'cid, est, telres, ies, tipo) values(:cod, :nome, :cnpj, :ende, :bairro, :cod_mun, :cep,' +
  ':cid, :est, :telres, :ies, :tipo)';
  dm.IBQuery1.ParamByName('cod').AsString  := Result;
  dm.IBQuery1.ParamByName('nome').AsString := LeftStr(Le_Nodo('xNome', nodo_dest), 40);
  dm.IBQuery1.ParamByName('cnpj').AsString := arq.Values['CNPJ'];
  dm.IBQuery1.ParamByName('ende').AsString := LeftStr(Le_Nodo('xLgr', nodo_dest) + ', ' + Le_Nodo('nro', nodo_dest), 40);
  dm.IBQuery1.ParamByName('bairro').AsString  := LeftStr(Le_Nodo('xBairro', nodo_dest), 18);
  dm.IBQuery1.ParamByName('cod_mun').AsString := Le_Nodo('cMun', nodo_dest);
  dm.IBQuery1.ParamByName('cep').AsString     := Le_Nodo('CEP', nodo_dest);
  dm.IBQuery1.ParamByName('cid').AsString     := Le_Nodo('xMun', nodo_dest);
  dm.IBQuery1.ParamByName('est').AsString     := Le_Nodo('UF', nodo_dest);
  dm.IBQuery1.ParamByName('telres').AsString  := Le_Nodo('fone', nodo_dest);
  dm.IBQuery1.ParamByName('ies').AsString     := arq.Values['IES'];
  dm.IBQuery1.ParamByName('tipo').AsString    := arq.Values['TIPO'];

  try
    dm.IBQuery1.ExecSQL;
    dm.IBQuery1.Transaction.Commit;
  except
    on e: exception do begin
      ShowMessage('Ocorreu um erro 5318: ' + E.Message);
    end;

  end;
  arq.free;
end;

FUNCTION BLOCO0500() : string;
var
  ini : integer;
begin
  Result := '';
  IF StrToDate(dataIni) < StrToDate('01/10/2017') then begin
    exit;
  end;

  //Result := '|0500|01112017|01|S|1++|1|ESTOQUE DE MERCADORIAS|||';
  Result := '|0500|01112017|04|A|1|'+codCTA+'|VENDA DE MERCADORIA|||';
  //if lista0500.Count > 0 then LINHA := '|0500|0|'
    //else LINHA := '|0500|1|';

  {for ini := 0 to lista0500.Count -1 do begin
    linha := '|0500|01112017|01|';
    GRAVA_SPED(ARQ_TMP, LINHA);
  end;}

  //TOTAL_REG(ARQ_TMP, '0500');
end;

procedure checaISPIS_CODISPIS(var ispis1, codPIS1 : String; codProduto : integer);
begin
  if ispis1 = '49' then exit;
  

  if trim(ispis1) = '' then begin
    ispis1  := '01';
    codPIS1 := '';
    exit;
  end;

  if trim(codPIS1) = '' then begin
    ispis1  := '01';
    codPIS1 := '';
    exit;
  end;

  if      ispis1 = 'M' then ispis1 := '04'
  else if ispis1 = 'R' then ispis1 := '06'
  else if ispis1 = 'I' then ispis1 := '07'
  else if ispis1 = 'D' then ispis1 := '02'
  else if ispis1 = 'X' then ispis1 := '08';

  if not Contido(codPIS1, listaChecaPIS.Values[ispis1]) then begin
    pisInvalido := pisInvalido + IntToStr(codProduto) + '-';
    ispis1  := '01';
    codPIS1 := '';
    exit;
  end;
end;

function ChecaIsencaoPis_Cst_49_Devoluções(CFOP : String) : boolean;
var
  arq : TStringList;
begin
  Result := false;
  if length(trim(cfop)) <> 4 then exit;

  if trim(Arquivo_CFOP_ISENTOS) = '' then begin
    arq := TStringList.Create;
    arq.LoadFromFile(caminhoEXE_com_barra_no_final + 'CFOP_ISENTOS.DAT');
    Arquivo_CFOP_ISENTOS := arq.Text;
    arq.Free;
  end;

  if Contido(cfop, Arquivo_CFOP_ISENTOS) then begin
    Result := true;
  end;
end;

function blocoB() : String;
begin
  IF StrToDateTime(dataIni) < StrToDateTime('01/01/2019') THEN exit;

  LINHA := '|B001|1|';
  GRAVA_SPED(ARQ_TMP, LINHA);

  TOTAL_REG(ARQ_TMP, 'B');
end;


end.


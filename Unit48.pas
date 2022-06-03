unit Unit48;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBClient, StdCtrls, jsedit1, Provider,  ExtCtrls, classes1,
  funcoesdav, untnfceForm, DateUtils,FireDAC.Comp.Client;

type

  TForm48 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ClientDataSet2: TClientDataSet;
    ClientDataSet2cod: TIntegerField;
    ClientDataSet2quant: TCurrencyField;
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    ClientDataSet1: TClientDataSet;
    Button1: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ClientDataSet1AfterPost(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure ClientDataSet1AfterEdit(DataSet: TDataSet);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1Enter(Sender: TObject);
  private
    inseriuFornecedor, campoDataExiste : boolean;
    procedure escondeCampos();
    procedure alteraUnidade();
    procedure alteraProduto();
    procedure limparProduto();
    procedure insereEntrada();
    procedure insereDadosAdic(const fornec : string);
    function  verificaSeExiste(const cod : String) : boolean;
    procedure cadastraProdutos(const verifica : boolean = true; atualizaProdutosCadastrados : boolean = false);
    function  verificaCodigosDeBarrasDosProdutos() : string;
    procedure lerProdutosParaDarEntrada(var lista : TItensProduto);
    procedure mostraNomesCampos();
    procedure escreveNomeDoProduto;
    { Private declarations }
  public
    fornecedor, unidadeTemp        : String;
    fornec, xml : TStringList;
    erro : string;
    TOTvICMSDeson_Produtos : currency;
    caminhoXML, chave, nota : String;
    procedure alteraPIS();
    procedure alteraCOD_ISPIS();
    procedure buscaProdutosCadastro();
    function verificaOK(msg : boolean = true; LINHA : boolean = false) : boolean;
    function insereFornec : String;
    procedure salvarArq();
    procedure limpaOK();
    procedure replicarUnidade();

    { Public declarations }
  end;

var
  Form48: TForm48;
const
  corColunaCorrigir : String = '5F9EA0';

implementation

uses func, Unit1, principal, buscaSelecao, cadproduto, StrUtils, unid,
  Math, consulta, caixaLista, Unit59;

{$R *.dfm}
procedure TForm48.insereDadosAdic(const fornec : string);
var
  tipo, serie, cfop, tipofrete, cod_sit : string;
  fe : TStringList;
  vProd, totnota, tmp, tot_icms : currency;
begin
  fe := funcoes.dadosAdicSped(xml.GetText);
  vProd    := converteCurrencyNFe(Le_Nodo('vProd', Le_Nodo('ICMSTot', xml.GetText)));
  totnota  := converteCurrencyNFe(Le_Nodo('vNF', Le_Nodo('ICMSTot', xml.GetText)));
  tot_icms := converteCurrencyNFe(Le_Nodo('vICMS', Le_Nodo('ICMSTot', xml.GetText)));
  fe[10] := copy(StrNum(fe[10]),1, 44);
  TOTvICMSDeson_Produtos := 0;

  cod_sit := '00';
  if Le_Nodo('finNFe', xml.GetText) = '2' then cod_sit := '06';

  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Clear;
  dm.IBQuery1.SQL.Add('update or insert into SPEDDADOSADIC(nota, cod_sit, fornec, tipo, serie, cfop, tipofrete, totseg, totdesc, TOTDESCNT' +
  ', TOTDESPACES, TOTPIS, TOTCONFINS, CREDICMS, CHAVENFE, TOTFRETE, TOTICMSST, TOTICMS_DESON, CREDICMS_REAIS) values(:nota, :cod_sit, :fornec, :tipo, :serie, :cfop, :tipofrete, :totseg,' +
  ' :totdesc, :TOTDESCNT, :TOTDESPACES, :TOTPIS, :TOTCONFINS, :CREDICMS, :CHAVENFE, :TOTFRETE, :TOTICMSST, :TOTICMS_DESON, :CREDICMS_REAIS) matching(CHAVENFE)');
  dm.IBQuery1.ParamByName('nota').AsString          := nota;
  dm.IBQuery1.ParamByName('cod_sit').AsString       := cod_sit;
  dm.IBQuery1.ParamByName('fornec').AsString        := fornec;
  dm.IBQuery1.ParamByName('tipo').AsString          := fe[0];
  dm.IBQuery1.ParamByName('serie').AsString         := fe[1];
  dm.IBQuery1.ParamByName('cfop').AsString          := fe[2];
  dm.IBQuery1.ParamByName('tipofrete').AsString     := fe[3];
  dm.IBQuery1.ParamByName('totseg').AsCurrency      := StrToCurr(fe[4]);
  dm.IBQuery1.ParamByName('totdesc').AsCurrency     := StrToCurr(fe[5]);
  dm.IBQuery1.ParamByName('TOTDESCNT').AsCurrency   := 0;
  dm.IBQuery1.ParamByName('TOTDESPACES').AsCurrency := StrToCurr(fe[6]) + StrToCurr(fe[15]);
  dm.IBQuery1.ParamByName('TOTPIS').AsCurrency      := StrToCurr(fe[7]);
  dm.IBQuery1.ParamByName('TOTCONFINS').AsCurrency  := StrToCurr(fe[8]);
  dm.IBQuery1.ParamByName('CREDICMS').AsCurrency    := 0;
  dm.IBQuery1.ParamByName('CHAVENFE').AsString      := fe[10];
  dm.IBQuery1.ParamByName('TOTFRETE').AsCurrency    := StrToCurr(fe[11]);
  dm.IBQuery1.ParamByName('TOTICMSST').AsCurrency   := StrToCurr(fe[13]);
  //dm.IBQuery1.ParamByName('CREDICMS_REAIS').AsCurrency   := tot_icms;
  dm.IBQuery1.ParamByName('CREDICMS_REAIS').AsCurrency   := 0;

  if StrToCurrDef(fe[14], 0) > 0 then begin
    TOTvICMSDeson_Produtos := StrToCurrDef(fe[14], 0);
    if ClientDataSet1.fieldbyname('totnota').AsCurrency <>
    (vProd + StrToCurr(fe[4]) + StrToCurr(fe[6]) + StrToCurr(fe[11]) + StrToCurr(fe[13]) - (StrToCurrDef(fe[14], 0) + StrToCurr(fe[5]))) then begin
      TOTvICMSDeson_Produtos := 0;
    end;
  end;

  if (TOTvICMSDeson_Produtos > 0) and (StrToCurr(fe[5]) > 0) then begin
    tmp := vProd - (TOTvICMSDeson_Produtos + StrToCurr(fe[5]));

    {ShowMessage('TOTvICMSDeson_Produtos=' + CurrToStr(TOTvICMSDeson_Produtos) + #13 +
    'fe[5]=' + fe[5] + #13 + 'vProd=' + CurrToStr(vProd) + #13 +
    'tmp=' + CurrToStr(tmp) + #13 + 'totnota=' + CurrToStr(totnota) + #13 +
    'abs=' + CurrToStr(abs((tmp) - totnota)));}

    if abs((tmp) - totnota) > 5 then begin
      dm.IBQuery1.ParamByName('totdesc').AsCurrency     := 0;
      dm.IBQuery1.ParamByName('TOTDESCNT').AsCurrency   := dm.IBQuery1.ParamByName('TOTDESCNT').AsCurrency + StrToCurr(fe[5]);
    end;
  end;

  dm.IBQuery1.ParamByName('TOTICMS_DESON').AsCurrency   := TOTvICMSDeson_Produtos;
  dm.IBQuery1.ExecSQL;

  dm.IBQuery1.Transaction.Commit;
end;

function TForm48.verificaSeExiste(const cod : String) : boolean;
begin
  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select nota from entrada where nota = :nota');
  dm.IBselect.ParamByName('nota').AsString := cod;
  dm.IBselect.Open;

  Result := not dm.IBselect.IsEmpty;
  dm.IBselect.Close;
end;

function TForm48.insereFornec() : string;
var
  cod : string;
begin
  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select cod from FORNECEDOR where cnpj = :cnpj' );
  dm.IBselect.ParamByName('cnpj').AsString := fornec[0];
  dm.IBselect.Open;

  Result := '0';

  if not dm.IBselect.IsEmpty then
    begin
      Result := dm.IBselect.fieldbyname('cod').AsString;
      fornecedor := result;
      cod        := Result;
      dm.IBselect.Close;
      //exit;
    end;
  dm.IBselect.Close;

  if Result = '0' then
    begin
      cod := Incrementa_Generator('FORNECEDOR', 1);
      //cod := Incrementa_Generator('FORNECEDOR', 0);
      //cod := IntToStr(StrToInt(cod) + 1);
      Result := cod;
    end;

  fornecedor := result;

  dm.IBQuery4.Close;
  dm.IBQuery4.SQL.Clear;
  dm.IBQuery4.SQL.Add('update or insert into FORNECEDOR(cod, nome, endereco, cep, fone, cidade, estado, bairro, cnpj,'  +
  'ies, cod_mun, tipo) values(:cod, :nome, :endereco, :cep, :fone, :cidade, :estado, :bairro, :cnpj,'  +
  ':ies, :cod_mun, :tipo)' );
  dm.IBQuery4.ParamByName('cod').AsString      := strnum(cod);
  dm.IBQuery4.ParamByName('nome').AsString     := LeftStr(fornec[1], 40);
  dm.IBQuery4.ParamByName('endereco').AsString := LeftStr(fornec[3], 40);
  dm.IBQuery4.ParamByName('cep').AsString      := LeftStr(fornec[8], 10);
  dm.IBQuery4.ParamByName('fone').AsString     := LeftStr(fornec[11], 14);
  dm.IBQuery4.ParamByName('cidade').AsString   := LeftStr(fornec[6], 14);
  dm.IBQuery4.ParamByName('estado').AsString   := fornec[7];
  dm.IBQuery4.ParamByName('bairro').AsString   := LeftStr(fornec[4], 25);
  dm.IBQuery4.ParamByName('cnpj').AsString     := fornec[0];
  dm.IBQuery4.ParamByName('ies').AsString      := fornec[12];
  dm.IBQuery4.ParamByName('cod_mun').AsString  := fornec[5];
  dm.IBQuery4.ParamByName('tipo').AsString     := '2';
  dm.IBQuery4.ExecSQL;
  dm.IBQuery4.Transaction.Commit;
end;

procedure TForm48.insereEntrada();
var
  cnpj_filial : boolean;
  nota : string;
  total, quant1, p_compra, qtd, p_venda, QTD_UNIDADE : currency;
  lista : TItensProduto;
  i : integer;
begin
  erro := '';
  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select nota from entrada where nota = :nota and fornec = :fornec');
  dm.IBselect.ParamByName('nota').AsString   := ClientDataSet1.fieldbyname('nota').AsString;
  dm.IBselect.ParamByName('fornec').AsString := fornecedor;
  dm.IBselect.Open;

  if not dm.IBselect.IsEmpty then
    begin
      dm.IBselect.Close;
      ShowMessage('A nota '+ ClientDataSet1.fieldbyname('nota').AsString +' já foi lançada no estoque');
      erro := 'erro';
      exit;
    end;
  dm.IBselect.Close;

  if dm.IBQuery4.Transaction.Active then dm.IBQuery4.Transaction.Commit;
  dm.IBQuery4.Transaction.StartTransaction;

  nota   := ClientDataSet1.fieldbyname('nota').AsString;
  total  := ClientDataSet1.fieldbyname('totnota').AsCurrency;
  if fornecedor = '' then insereFornec();

  dm.IBQuery4.Close;
  dm.IBQuery4.SQL.Clear;
  dm.IBQuery4.SQL.Add('update or insert into entrada(nota, data,chegada,total_nota,fornec, xml) VALUES'+
  ' (:nota, :data,:chegada,:total_nota,:fornec, ''S'') matching(nota, fornec) ');
  dm.IBQuery4.ParamByName('nota').AsString         := nota;
  dm.IBQuery4.ParamByName('chegada').AsDateTime    := DateOf(form22.datamov) + TimeOf(now);
  dm.IBQuery4.ParamByName('total_nota').AsCurrency := total;
  //dm.IBQuery4.ParamByName('data').AsDateTime       := DateOf(form22.datamov) + TimeOf(now);
  dm.IBQuery4.ParamByName('data').AsDateTime       := ClientDataSet1.fieldbyname('data').AsDateTime;
  dm.IBQuery4.ParamByName('fornec').AsString       := fornecedor;
  try
    dm.IBQuery4.ExecSQL;
  except
    erro := 'erro';
  end;

  ClientDataSet1.DisableControls;
  ClientDataSet1.First;
  while not ClientDataSet1.Eof do
    begin
      dm.IBQuery4.Close;
      dm.IBQuery4.SQL.Clear;
      dm.IBQuery4.SQL.Add('update or insert into item_entrada(COD,codentrada, QUANT, P_COMPRA, DESTINO, USUARIO, NOTA, FORNEC,DATA, total, unid, unid2, CRED_ICMS, QTD_ENT)' +
      ' values(:COD,'+funcoes.novocod('entrada')+',:QUANT, :P_COMPRA, :DESTINO, :USUARIO,  :NOTA,:FORNEC, :DATA,:total, :unid, :unid2, :CRED_ICMS, :QTD_ENT) matching(codentrada)');
      dm.IBQuery4.ParamByName('data').AsDateTime     := form22.datamov;
      dm.IBQuery4.ParamByName('cod').AsString        := StrNum(ClientDataSet1.fieldbyname('codigo').AsString);
      dm.IBQuery4.ParamByName('nota').AsString       := ClientDataSet1.fieldbyname('nota').AsString;
      dm.IBQuery4.ParamByName('FORNEC').AsString     := fornecedor;
      dm.IBQuery4.ParamByName('quant').AsFloat       := quant1 + ClientDataSet1.fieldbyname('QUANTIDADE_NFE').AsFloat;
      dm.IBQuery4.ParamByName('P_COMPRA').AsFloat    := ClientDataSet1.fieldbyname('PRECO_NFE').AsFloat;

      dm.IBQuery4.ParamByName('destino').AsInteger   := 1;
      dm.IBQuery4.ParamByName('usuario').AsString    := form22.codusario;
      dm.IBQuery4.ParamByName('total').AsCurrency    := ClientDataSet1.fieldbyname('total').AsCurrency;
      dm.IBQuery4.ParamByName('unid').AsString       := ClientDataSet1.fieldbyname('UNID_ENTRADA').AsString;
      dm.IBQuery4.ParamByName('unid2').AsString      := ClientDataSet1.fieldbyname('UNID_VENDA').AsString;
      dm.IBQuery4.ParamByName('CRED_ICMS').AsCurrency  := ClientDataSet1.fieldbyname('CRED_ICMS').AsCurrency;

      QTD_UNIDADE := funcoes.verValorUnidade(ClientDataSet1.fieldbyname('UNID_ENTRADA').AsString);
      qtd := ClientDataSet1.fieldbyname('QUANTIDADE_NFE').AsCurrency * QTD_UNIDADE;
      qtd := Arredonda(qtd, 4);

      dm.IBQuery4.ParamByName('QTD_ENT').AsCurrency    := qtd;

      try
        dm.IBQuery4.ExecSQL;
      except
        erro := 'erro';
      end;

      dm.IBQuery4.Close;
      dm.IBQuery4.SQL.Text := 'update produto set data_entrada1 = current_date where cod = ' + StrNum(ClientDataSet1.fieldbyname('codigo').AsString);
      dm.IBQuery4.ExecSQL;

     ClientDataSet1.Next; 
   end;


  lerProdutosParaDarEntrada(lista);

  cnpj_filial := false;
  //se for filial entao nao atualiza o campo de fornecedor pq é transferencia
  if LeftStr(StrNum(fornec[0]), 8) = LeftStr(StrNum(form22.Pgerais.Values['cnpj']), 8) then begin
    cnpj_filial := true;
  end;


  for i := 0 to lista.Count -1 do
    begin
      dm.IBQuery4.Close;
      dm.IBQuery4.SQL.Clear;
      dm.IBQuery4.SQL.Add('update produto set p_venda = :p_venda, codbar = :codbar, p_compra = :p_compra, unid2 = :unid2, REFNFE = :REFNFE, '+

      'classif = :ncm, '+IfThen(cnpj_filial, '', 'fornec = :fornec,')+' nome = :nome, IS_PIS = :IS_PIS, COD_ISPIS  = :COD_ISPIS  where cod = :cod');

      //dm.IBQuery4.ParamByName('quant').AsCurrency    := lista[i].quant;
      dm.IBQuery4.ParamByName('p_venda').AsCurrency  := lista[i].preco;
      dm.IBQuery4.ParamByName('codbar').AsString     := lista[i].codbarAtual;
      dm.IBQuery4.ParamByName('p_compra').AsCurrency := lista[i].BASE_ICM;
      dm.IBQuery4.ParamByName('unid2').AsString      := lista[i].unid;
      dm.IBQuery4.ParamByName('REFNFE').AsString     := lista[i].nome;
      dm.IBQuery4.ParamByName('ncm').AsString        := lista[i].ncm;

      if cnpj_filial = false then dm.IBQuery4.ParamByName('fornec').AsString     := StrNum(fornecedor);
      dm.IBQuery4.ParamByName('nome').AsString       := lista[i].temp;
      dm.IBQuery4.ParamByName('IS_PIS').AsString     := lista[i].CST_PIS;
      dm.IBQuery4.ParamByName('COD_ISPIS').AsString  := lista[i].COD_ISPIS;
      dm.IBQuery4.ParamByName('cod').AsInteger       := lista[i].cod;
      dm.IBQuery4.ExecSQL;

      //ShowMessage('cod=' + IntToStr(lista[i].cod) + #13 + 'compra=' + CurrToStr(lista[i].BASE_ICM));
    end;

    if dm.IBQuery4.Transaction.Active then dm.IBQuery4.Transaction.Commit;
    if dm.IBQuery1.Transaction.Active then dm.IBQuery1.Transaction.Commit;


    //baixa estoque separado para nao acontecer o deadlock
   { for i := 0 to lista.Count -1 do begin
      funcoes.baixaEstoqueSP(IntToStr(lista[i].cod), lista[i].quant, 1);
    end;

    if dm.IBQuery1.Transaction.Active then dm.IBQuery1.Transaction.Commit;}

    lista.Free;
    insereDadosAdic(fornecedor);

    funcoes.copiaXMLEntrada(caminhoXML, chave);
   
    ClientDataSet1.Free;
    i := 0;
    while true do begin
      i := i + 1;
      if i > 15 then begin
        break;
      end;
      if DeleteFile(caminhoEXE_com_barra_no_final + fornecedor + '-' + nota + '.xml') then break;
      if not FileExists(caminhoEXE_com_barra_no_final + fornecedor + '-' + nota + '.xml') then break;

      sleep(300);
    end;
end;

function TForm48.verificaOK(msg : boolean = true; LINHA : boolean = false) : boolean;
var
  i, a, lin : integer;

begin
  Result := false;
  a := 0;
  erro := '';
  lin := 0;

  if LINHA then
    begin
      dm.IBselect.Close;
      dm.IBselect.SQL.Clear;
      dm.IBselect.SQL.Add('select cod from produto where cod = :cod');
      dm.IBselect.ParamByName('cod').AsString := strnum(ClientDataSet1.fieldbyname('codigo').AsString);
      dm.IBselect.Open;

      if dm.IBselect.IsEmpty then
        begin
          a := a + 1;
          lin := lin + 1;
          erro := erro + 'Produto: ' + ClientDataSet1.fieldbyname('DESCRICAO_FORNECEDOR').AsString + ' não encontrado no Estoque;' + #13;
        end;

      if ((trim(ClientDataSet1.fieldbyname('pis').AsString) <> '') and (trim(ClientDataSet1.fieldbyname('COD_ISPIS').AsString) = '')) then begin
        a := a + 1;
          lin := lin + 1;
          erro := erro + 'COD. Natureza Do PIS do produto: ' + ClientDataSet1.fieldbyname('DESCRICAO_FORNECEDOR').AsString + ' não foi Preenchida' + #13;
      end;

      if ClientDataSet1.fieldbyname('UNID_ENTRADA').AsString = '' then
        begin
          a := a + 1;
          lin := lin + 1;
          erro := erro + 'UNIDADE do produto: ' + ClientDataSet1.fieldbyname('DESCRICAO_FORNECEDOR').AsString + ' não foi Preenchida' + #13;
        end;

      if ClientDataSet1.fieldbyname('ALIQ').AsString = '' then
        begin
          a := a + 1;
          lin := lin + 1;
          erro := erro + 'ALIQUOTA do produto: ' + ClientDataSet1.fieldbyname('DESCRICAO_FORNECEDOR').AsString + ' não foi Preenchida' + #13;
        end;

      if lin > 0 then
        begin
          ClientDataSet1.Open;
          ClientDataSet1.Edit;
          ClientDataSet1.FieldByName('ok').AsString := '';
          ClientDataSet1.Post;
        end
      else
        begin
          ClientDataSet1.Open;
          ClientDataSet1.Edit;
          ClientDataSet1.FieldByName('ok').AsString := 'X';
          ClientDataSet1.Post;
        end;
      exit;
    end;

  i := ClientDataSet1.fieldbyname('codigo').AsInteger;
  ClientDataSet1.DisableControls;
  ClientDataSet1.First;
  while not ClientDataSet1.Eof do
    begin
      lin := 0;
      dm.IBselect.Close;
      dm.IBselect.SQL.Clear;
      dm.IBselect.SQL.Add('select cod from produto where cod = :cod');
      dm.IBselect.ParamByName('cod').AsString := strnum(ClientDataSet1.fieldbyname('codigo').AsString);
      dm.IBselect.Open;

      if dm.IBselect.IsEmpty then
        begin
          a := a + 1;
          lin := lin + 1;
          erro := erro + 'Produto: ' + ClientDataSet1.fieldbyname('DESCRICAO_FORNECEDOR').AsString + ' não encontrado no Estoque;' + #13;
        end;

      if ((trim(ClientDataSet1.fieldbyname('pis').AsString) <> '') and (trim(ClientDataSet1.fieldbyname('COD_ISPIS').AsString) = '')) then begin
        if Contido(funcoes.buscaParamGeral(10, ''), '3') then begin
          a := a + 1;
          lin := lin + 1;
          erro := erro + 'COD. Natureza Do PIS do produto: ' + ClientDataSet1.fieldbyname('DESCRICAO_FORNECEDOR').AsString + ' não foi Preenchida' + #13;
        end;
      end;

      if ClientDataSet1.fieldbyname('UNID_ENTRADA').AsString = '' then
        begin
          a := a + 1;
          lin := lin + 1;
          erro := erro + 'UNIDADE do produto: ' + ClientDataSet1.fieldbyname('DESCRICAO_FORNECEDOR').AsString + ' não foi Preenchida' + #13;
        end;

      if ClientDataSet1.fieldbyname('ALIQ').AsString = '' then
        begin
          a := a + 1;
          lin := lin + 1;
          erro := erro + 'ALIQUOTA do produto: ' + ClientDataSet1.fieldbyname('DESCRICAO_FORNECEDOR').AsString + ' não foi Preenchida' + #13;
        end;

      if lin > 0 then
        begin
          ClientDataSet1.Open;
          ClientDataSet1.Edit;
          ClientDataSet1.FieldByName('ok').AsString := '';
          ClientDataSet1.Post;
        end
      else
        begin
          ClientDataSet1.Open;
          ClientDataSet1.Edit;
          ClientDataSet1.FieldByName('ok').AsString := 'X';
          ClientDataSet1.Post;
        end;

      ClientDataSet1.Next;
    end;

  if a > 0 then
    begin
      if msg then ShowMessage('Ocorreram '+ IntToStr(a) +' Erros, Verifique: ' + #13 + erro);
    end
  else Result := true;
  ClientDataSet1.First;
  ClientDataSet1.EnableControls;  
end;


procedure TForm48.alteraUnidade();
var
  qtd, valor : currency;
  mu, codTMP : integer;
  cod, cod1 : String;
begin
  cod := //funcoes.localizar('Localizar Unidades', 'unid', 'UNID_ENT, UNID_SAI', 'UNID_ENT, UNID_SAI', '', 'UNID_ENT', 'UNID_ENT', false, false, false, '', 0, nil);
  funcoes.localizar1('Localizar Unidades','unid','UNID_ENT, UNID_SAI' ,'UNID_ENT, UNID_SAI' ,'' ,'UNID_ENT','UNID_ENT',false,false,false,'UNID_ENT', unidadeTemp,0, nil);

  if ((cod = '*') or (cod = '')) then exit;


  cod1 := copy(cod, pos('-', cod) + 1, length(cod));
  cod  := copy(cod, 1, pos('-', cod) - 1);

  if Contido('-' + cod1 + '-', '-M2-M3-') = false then begin
    cod1 := SomenteLetras(cod1);
  end;


  {dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select * from unid where UNID_ENT = :cod');
  dm.IBselect.ParamByName('cod').AsString := cod;
  dm.IBselect.Open;
  }

  qtd := funcoes.verValorUnidade(cod);
  //dm.IBselect.Close;

  unidadeTemp := cod;
  codTMP := ClientDataSet1.RecNo -1;
  try

    ClientDataSet1.DisableControls;
    ClientDataSet1.Edit;
    ClientDataSet1.FieldByName('UNID_ENTRADA').AsString := cod;
    ClientDataSet1.FieldByName('UNID_VENDA').AsString   := (cod1);
    ClientDataSet1.FieldByName('mu').AsFloat          := (qtd);
    ClientDataSet1.FieldByName('QUANTIDADE_ENT').AsCurrency :=  Arredonda(qtd * ClientDataSet1.FieldByName('QUANTIDADE_NFE').AsFloat, 3);

    valor := Arredonda((ClientDataSet1.FieldByName('PRECO_NFE').AsFloat + (ClientDataSet1.FieldByName('PRECO_NFE').AsFloat * ClientDataSet1.FieldByName('LUCRO').AsFloat / 100)) /qtd, 2);
    ClientDataSet1.FieldByName('PRECO_NOVO').AsFloat   := valor;
    ClientDataSet1.FieldByName('PRECO_COMPRA').AsFloat := Arredonda(ClientDataSet1.FieldByName('PRECO_NFE').AsFloat / StrToCurrDef(ClientDataSet1.FieldByName('mu').AsString, 1), 2);

//    ShowMessage(ClientDataSet1.FieldByName('PRECO_NFE').AsString + #13 + ClientDataSet1.FieldByName('mu').AsString + #13 + CurrToStr(qtd));
    ClientDataSet1.Post;
    //verificaOK();
  finally
    ClientDataSet1.First;
    ClientDataSet1.MoveBy(codTMP);
    ClientDataSet1.EnableControls;
  end;
end;


procedure TForm48.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  cod, val : string;
  codTMP   : integer;
  mat : TStringList;
begin
  if (key = 38)or(key = 40) then begin
    escreveNomeDoProduto;
    exit;
  end;

  if key = 113 then //F2
    begin
      salvarArq();
      ShowMessage('A Entrada foi salva com sucesso');
    end;

  if key = 46 then
    begin
      if DBGrid1.SelectedField.FieldName = 'PIS' then begin
        ClientDataSet1.Edit;
        ClientDataSet1.FieldByName('PIS').AsString := '';
        ClientDataSet1.Post;
        exit;
      end;

      if DBGrid1.SelectedField.FieldName = 'COD_ISPIS' then begin
        ClientDataSet1.Edit;
        ClientDataSet1.FieldByName('COD_ISPIS').AsString := '';
        ClientDataSet1.Post;
        exit;
      end;

      if DBGrid1.SelectedField.FieldName = 'CODIGO' then
        begin
          limparProduto();
          verificaOK(false, true);
          exit;
        end;

      if DBGrid1.SelectedField.FieldName = 'PRECO_ATUAL' then
        begin
          ClientDataSet1.Edit;
          ClientDataSet1.FieldByName('PRECO_ATUAL').AsCurrency := ClientDataSet1.FieldByName('PRECO_NOVO').AsCurrency;
          ClientDataSet1.Post;
          exit;
        end;

      if DBGrid1.SelectedField.FieldName = 'CODBAR_ATUAL' then
        begin
          ClientDataSet1.Edit;
          ClientDataSet1.FieldByName('CODBAR_ATUAL').AsString := ClientDataSet1.FieldByName('CODBAR').AsString;
          ClientDataSet1.Post;
          exit;
        end;
    end;

  if key = 114 then //F3
    begin
      //alteraUnidade();
      {if ClientDataSet1.FieldByName('codigo').IsNull then
        begin
          ShowMessage('Codigo de Produto Inválido');
          exit;
        end;  _}

      form9 := tform9.Create(self);

      jsedit.SetTabelaDoBd(form9, 'produto', dm.IBQuery1);
      if ClientDataSet1.FieldByName('codigo').AsString <> '' then begin
        form9.cod.Text := ClientDataSet1.FieldByName('codigo').AsString;
        jsedit.SelecionaDoBD(form9.Name);
      end
      else begin

      end;
      form9.ShowModal;

      val := form9.produto_preco;

      JsEdit.LiberaMemoria(form9);
      form9.Free;

      LE_CAMPOS(mat, val, '|', true);

      if (ClientDataSet1.FieldByName('CODIGO').AsString = mat.Values['0']) and (ClientDataSet1.FieldByName('PRECO_ATUAL').AsString <> mat.Values['1']) and (StrToCurrDef(mat.Values['1'], 0) > 0) then begin
        ClientDataSet1.Edit;
        ClientDataSet1.FieldByName('PRECO_ATUAL').AsCurrency := StrToCurrDef(mat.Values['1'], 0);
        ClientDataSet1.Post;
      end;

      if (ClientDataSet1.FieldByName('CODIGO').AsString = mat.Values['0']) and (ClientDataSet1.FieldByName('ALIQ').AsString <> mat.Values['2']) and (StrToCurrDef(mat.Values['2'], 0) > 0) then begin
        ClientDataSet1.Edit;
        ClientDataSet1.FieldByName('ALIQ').AsCurrency := StrToCurrDef(mat.Values['2'], 2);
        ClientDataSet1.Post;
      end;

      mat.Free;
    end;

  if key = 115 then //F4
    begin
      cod := verificaCodigosDeBarrasDosProdutos();
      if cod <> '' then
        begin
          if cod <> '1' then MessageDlg(cod, mtError, [mbok], 1);
          exit;
        end;

      //if MessageDlg('Deseja Cadastrar os Produtos que não foram Preenchidos ?', mtConfirmation, [mbYes, mbNo], 1) = idno then exit;
      if MessageBox(0, Pchar('Deseja Cadastrar os Produtos que não foram Preenchidos ?'), 'Confirme', MB_YESNO+MB_DEFBUTTON2+
                   MB_ICONQUESTION) = idno then exit;
      cadastraProdutos();
    end;

  if key = 116 then //F5
    begin
      form47 := tform47.Create(self);
      form47.ShowModal;
      form47.Free;
    end;

  if key = 117 then //F6
    begin
      replicarUnidade;
    end;

  if key = 118 then //F7
    begin
      buscaProdutosCadastro();
    end;

  if key = 123 then //F12
    begin
      lancContasPagar := tlancContasPagar.Create(self);
      funcoes.CtrlResize(TForm(lancContasPagar));
      lancContasPagar.showmodal;
      lancContasPagar.Free;
    end;
end;

procedure TForm48.DBGrid1CellClick(Column: TColumn);
var
  cod : string;
  mu : currency;
begin
  if Column.FieldName = 'UNIDADE' then
    begin
      alteraUnidade();
    end;
end;

procedure TForm48.DBGrid1KeyPress(Sender: TObject; var Key: Char);
var
  sim, nou : string;
  preco, mu : currency;
begin
  if key = #27 then begin
      sim := funcoes.dialogo('generico',0,'SN'+#8,0,false,'S','Control For Windows','Deseja Gravar Esta Entrada de Produtos?S/N:','N') ;
      if sim = '*' then exit;
      if sim = 'N' then
        begin
          salvarArq();
          close;
        end;

      if sim = 'S' then begin
        nou := verificaCodigosDeBarrasDosProdutos();
        if nou <> '' then begin
           MessageDlg(nou, mtError, [mbOK], 1);
           exit;
        end;


        cadastraProdutos(false, true);
        if verificaOK then begin
          insereEntrada();
          if erro = '' then close;
        end;
      end;
    end;

  if key = #13 then
    begin
      if DBGrid1.SelectedField.FieldName = 'PRECO_ATUAL' then begin
        preco := StrToCurrDef(ClientDataSet1.fieldbyname('PRECO_ATUAL').AsString, 0);
        if preco = 0 then preco := StrToCurrDef(ClientDataSet1.fieldbyname('PRECO_NOVO').AsString, 0);
        sim := funcoes.dialogo('numero',0,'',2,true,'S',Application.Title,'Qual o Preço de Venda ?', formataCurrency(preco));
        if sim = '*' then exit;

        if ((StrToCurr(sim) < preco) and (length(form22.Pgerais.Values['acessousu']) > 0) and (StrToIntDef(ClientDataSet1.fieldbyname('codigo').AsString, 0) > 0)) then begin
          ShowMessage('Usuário Bloqueado para Redução do Preço de Venda:' + #13 +
                'Preço Antigo: ' + FormatCurr('#,###,###0.000', preco) + #13 +
                'Preço   Novo: ' + FormatCurr('#,###,###0.000', StrToCurr(sim)) + #13 +
                'Procure um Usuário Autorizado!');
          exit;
        end;


        ClientDataSet1.Edit;
        ClientDataSet1.FieldByName('PRECO_ATUAL').AsCurrency  := StrToCurrDef(sim, 0);
        ClientDataSet1.Post;
      end;

      if DBGrid1.SelectedField.FieldName = 'PRECO_COMPRA' then
        begin
          sim := funcoes.dialogo('numero',0,'',3,true,'S',Application.Title,'1=Qual o Preço de Compra ?', formataCurrency(ClientDataSet1.FieldByName('PRECO_COMPRA').AsCurrency));
          if sim = '*' then exit;

          ClientDataSet1.Edit;
          ClientDataSet1.FieldByName('PRECO_COMPRA').AsCurrency  := StrToCurrDef(sim, 0);
          ClientDataSet1.Post;
        end;

      if DBGrid1.SelectedField.FieldName = 'CRED_ICMS' then begin
        sim := funcoes.dialogo('numero',0,'',2,true,'S',Application.Title,'Qual a Porcentagem de Crédito ?', formataCurrency(ClientDataSet1.FieldByName('CRED_ICMS').AsCurrency));
        if sim = '*' then exit;

        ClientDataSet1.Edit;
        ClientDataSet1.FieldByName('CRED_ICMS').AsCurrency  := StrToCurrDef(sim, 0);
        ClientDataSet1.Post;
      end;

      if DBGrid1.SelectedField.FieldName = 'ALIQ' then
        begin
          //sim := funcoes.localizar('Localizar Aliquota','aliq','cod,aliq,reducao,cst','cod','','cod','cod',false,false,false,'',430,sender);
          sim := funcoes.localizar1('Localizar Aliquota','aliq','cod,aliq,reducao,cst, CSOSN','cod','','cod','cod',false,false,false,'cod', IntToStr(StrToIntDef(funcoes.buscaParamGeral(22, ''), 2)),300,sender);
          if sim = '' then exit;

          ClientDataSet1.Edit;
          ClientDataSet1.FieldByName('ALIQ').AsString  := sim;
          ClientDataSet1.Post;

          verificaOK(false, true);
        end;

      if DBGrid1.SelectedField.FieldName = 'LUCRO' then
        begin
          sim := funcoes.dialogo('numero',0,'',2,false,'X',Application.Title,'Qual o Lucro?',formataCurrency(ClientDataSet1.FieldByName('LUCRO').AsCurrency));
          if sim = '*' then exit;

          mu := StrToCurrDef(ClientDataSet1.FieldByName('mu').AsString, 1);
          ClientDataSet1.Edit;
          ClientDataSet1.FieldByName('LUCRO').AsCurrency      := StrToCurrDef(sim, 0);
          ClientDataSet1.FieldByName('PRECO_NOVO').AsCurrency := Arredonda((ClientDataSet1.FieldByName('PRECO_NFE').AsFloat + (ClientDataSet1.FieldByName('PRECO_NFE').AsFloat * StrToCurrDef(sim, 0) / 100)) / mu, 2);
          ClientDataSet1.Post;
        end;

      if DBGrid1.SelectedField.FieldName = 'DESCRICAO_ATUAL' then
        begin
          sim := funcoes.dialogo('normal',0,'',150,false,'X',Application.Title,'Qual a Descrição?', IfThen(ClientDataSet1.FieldByName('DESCRICAO_ATUAL').AsString = '', ClientDataSet1.FieldByName('DESCRICAO_FORNECEDOR').AsString ,ClientDataSet1.FieldByName('DESCRICAO_ATUAL').AsString) );
          if sim = '*' then exit;

          ClientDataSet1.Edit;
          ClientDataSet1.FieldByName('DESCRICAO_ATUAL').AsString := sim;
          ClientDataSet1.Post;
        end;

      if DBGrid1.SelectedField.FieldName = 'REFORI' then
        begin
          sim := funcoes.dialogo('normal',0,'',150,false,'X',Application.Title,'Qual a Referência?',ClientDataSet1.FieldByName('REFORI').AsString);
          if sim = '*' then exit;

          ClientDataSet1.Edit;
          ClientDataSet1.FieldByName('REFORI').AsString := sim;
          ClientDataSet1.Post;
        end;

      if DBGrid1.SelectedField.FieldName = 'CODBAR_ATUAL' then
        begin
          sim := funcoes.dialogo('normal',0,'',150,false,'X',Application.Title,'Qual o Cód. Barras?',ClientDataSet1.FieldByName('CODBAR').AsString);
          if sim = '*' then exit;

          ClientDataSet1.Edit;
          ClientDataSet1.FieldByName('CODBAR_ATUAL').AsString := sim;
          ClientDataSet1.Post;
        end;

      if DBGrid1.SelectedField.FieldName = 'UNID_ENTRADA' then
        begin
          try
            alteraUnidade();
          except
          end;

          try
            verificaOK(false, true);
          except
          end;
        end;

      if DBGrid1.SelectedField.FieldName = 'PIS' then
        begin
          alteraPIS();
          exit;
        end;

      if DBGrid1.SelectedField.FieldName = 'COD_ISPIS' then
        begin
          alteraCOD_ISPIS();
          exit;
        end;


      if DBGrid1.SelectedField.FieldName = 'CODIGO' then
        begin
          alteraProduto();
          verificaOK(false, true);
        end;
    end;
end;

procedure TForm48.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  jsedit.LiberaMemoria(self);
end;

procedure TForm48.FormShow(Sender: TObject);
begin
  JsEdit.SetTabelaDoBd(self, 'unid', dm.IBQuery1);
  insereFornec();
  escondeCampos();
  ClientDataSet1.First;
  funcoes.FormataCampos(TFDQuery(ClientDataSet1), 2, '', 2);
  verificaOK(false, false);
  mostraNomesCampos();
end;

procedure TForm48.ClientDataSet1AfterPost(DataSet: TDataSet);
begin
 { if self.Showing then
    begin
      DeleteFile(caminhoEXE_com_barra_no_final + fornecedor + '-' + nota + '.xml');
      ClientDataSet1.SaveToFile(caminhoEXE_com_barra_no_final + fornecedor + '-' + nota + '.xml');
    end;
}end;

procedure TForm48.Button1Click(Sender: TObject);
VAR
  TOTR : CURRENCY;
begin
  //DBGrid1.Columns[1].DefaultFont.Style := [fsBold];
  {while not ClientDataSet1.Eof do begin

    ClientDataSet1.as
  end;}

  //ClientDataSet1.LoadFromFile(caminhoEXE_com_barra_no_final + 'ent_arq.xml');
{  TOTR := 0;
  ClientDataSet1.First;
  while not ClientDataSet1.Eof do begin
    TOTR := TOTR + ClientDataSet1.FieldByName('desonerado').AsCurrency;
    ClientDataSet1.Next;
  end;}

  //ShowMessage(CurrToStr(TOTR));
end;

procedure TForm48.ClientDataSet1AfterEdit(DataSet: TDataSet);
begin
  ClientDataSet1.SaveToFile(caminhoEXE_com_barra_no_final + 'ent_arq.xml');
end;

procedure TForm48.alteraProduto();
var
  codTMP : integer;
  cod, aliq    : String;
  qtd : currency;
begin
  if funcoes.buscaParamGeral(46, 'N') = 'S' then begin
    form24.cosultaRetorna := true;
    form24.BuscaCOd := (codUlt);
    form24.ShowModal;

    if form24.retorno = '*' then exit;
    cod := form24.retorno;
  end
  else begin
    cod := funcoes.localizar('Localizar Produto','produto','cod, nome,quant, p_venda as preco ','cod','','nome','nome',false,false,false,'',600, nil);
    if ((cod = '*') or (cod = '')) then exit;
  end;

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select nome, cod, codbar, p_venda, unid, unid2, aliquota, p_compra from produto where cod = :cod');
  dm.IBselect.ParamByName('cod').AsString := strnum(cod);
  dm.IBselect.Open;

  codTMP := ClientDataSet1.RecNo -1;
  try
    ClientDataSet1.DisableControls;
    ClientDataSet1.Edit;
    ClientDataSet1.FieldByName('codigo').AsString          := dm.IBselect.fieldbyname('cod').AsString;
    ClientDataSet1.FieldByName('DESCRICAO_ATUAL').AsString := dm.IBselect.fieldbyname('nome').AsString;
    ClientDataSet1.FieldByName('CODBAR_ATUAL').AsString    := dm.IBselect.fieldbyname('codbar').AsString;
    ClientDataSet1.FieldByName('PRECO_ATUAL').AsCurrency   := dm.IBselect.fieldbyname('p_venda').AsCurrency;
    ClientDataSet1.FieldByName('UNID_ENTRADA').AsString    := dm.IBselect.fieldbyname('unid2').AsString;
    ClientDataSet1.FieldByName('UNID_VENDA').AsString      := dm.IBselect.fieldbyname('unid').AsString;
    ClientDataSet1.FieldByName('ALIQ').AsString            := IntToStr(StrToIntDef(dm.IBselect.fieldbyname('aliquota').AsString, 2));
    ClientDataSet1.FieldByName('mu').AsCurrency            := funcoes.verValorUnidade(ClientDataSet1.FieldByName('UNID_ENTRADA').AsString);
    qtd := ClientDataSet1.FieldByName('mu').AsCurrency;
    ClientDataSet1.FieldByName('QUANTIDADE_ENT').AsCurrency := Arredonda( qtd * ClientDataSet1.FieldByName('QUANTIDADE_NFE').AsCurrency,2);
    if qtd > 1 then ClientDataSet1.FieldByName('PRECO_COMPRA').AsCurrency  := Arredonda( ClientDataSet1.FieldByName('PRECO_NFE').AsFloat / qtd, 2);

    ClientDataSet1.Post;
    //verificaOK();
  finally
    ClientDataSet1.First;
    ClientDataSet1.MoveBy(codTMP);
    ClientDataSet1.EnableControls;
  end;
end;

procedure TForm48.salvarArq();
begin
  //funcoes.excluiAqruivo(caminhoEXE_com_barra_no_final + fornecedor + '-' + nota + '.xml')
  DeleteFile(caminhoEXE_com_barra_no_final + fornecedor + '-' + nota + '.xml');
  ClientDataSet1.SaveToFile(caminhoEXE_com_barra_no_final + fornecedor + '-' + nota + '.xml');
end;

procedure TForm48.escondeCampos();
begin
  campoDataExiste := false;
  try
    form48.ClientDataSet1.FieldByName('data').AsString;
    campoDataExiste := true;
  except
  end;
  form48.ClientDataSet1.IndexFieldNames := 'CONT';
  form48.ClientDataSet1.LogChanges := false;
  form48.ClientDataSet1.FieldByName('totnota').Visible        := false;
  if campoDataExiste then form48.ClientDataSet1.FieldByName('data').Visible           := false;
  //form48.ClientDataSet1.FieldByName('nota').Visible           := false;
  form48.ClientDataSet1.FieldByName('mu').Visible             := true;
  //form48.ClientDataSet1.FieldByName('cont').Visible           := false;
  form48.ClientDataSet1.FieldByName('TOTAL').Visible          := false;
  //form48.ClientDataSet1.FieldByName('QUANTIDADE_ENT').Visible := false;
  form48.ClientDataSet1.FieldByName('QUANTIDADE_ENT').DisplayLabel := 'QUANTIDADE ENTRADA';
  TCurrencyField(form48.ClientDataSet1.FieldByName('QUANTIDADE_NFE')).Visible := true;

  TCurrencyField(form48.ClientDataSet1.FieldByName('PRECO_NFE')).currency      := false;
  TCurrencyField(form48.ClientDataSet1.FieldByName('PRECO_COMPRA')).currency      := false;
  TCurrencyField(form48.ClientDataSet1.FieldByName('LUCRO')).currency          := false;
  TCurrencyField(form48.ClientDataSet1.FieldByName('PRECO_NOVO')).currency     := false;
  TCurrencyField(form48.ClientDataSet1.FieldByName('PRECO_ATUAL')).currency    := false;
  TCurrencyField(form48.ClientDataSet1.FieldByName('QUANTIDADE_NFE')).currency := false;
  TCurrencyField(form48.ClientDataSet1.FieldByName('QUANTIDADE_ENT')).currency := false;
  TCurrencyField(form48.ClientDataSet1.FieldByName('PRECO_ATUAL')).currency    := false;
  TCurrencyField(form48.ClientDataSet1.FieldByName('TOTAL')).currency          := false;
  TCurrencyField(form48.ClientDataSet1.FieldByName('TOTAL')).DisplayFormat     := '#,###,###0.000';
  TCurrencyField(form48.ClientDataSet1.FieldByName('PRECO_COMPRA')).DisplayFormat   := '#,###,###0.000';
  TCurrencyField(form48.ClientDataSet1.FieldByName('PRECO_NOVO')).DisplayFormat     := '#,###,###0.000';
  TCurrencyField(form48.ClientDataSet1.FieldByName('PRECO_ATUAL')).DisplayFormat    := '#,###,###0.000';
  TCurrencyField(form48.ClientDataSet1.FieldByName('QUANTIDADE_NFE')).DisplayFormat := '#,###,###0.000';
  TCurrencyField(form48.ClientDataSet1.FieldByName('QUANTIDADE_ENT')).DisplayFormat := '#,###,###0.000';
  TCurrencyField(form48.ClientDataSet1.FieldByName('PRECO_NFE')).DisplayFormat    := '#,###,###0.000';
  //TCurrencyField(form48.ClientDataSet1.FieldByName('PRECO_ATUAL')).DisplayFormat    := '#,###,###0.000';
end;

procedure TForm48.cadastraProdutos(const verifica : boolean = true; atualizaProdutosCadastrados : boolean = false);
var
  cod1, aliq : String;
  ini  : smallint;
  p_compra, p_venda : currency;
  codbar : TStringList;
  I: Integer;
begin
  try
  ClientDataSet1.DisableControls;
  ClientDataSet1.First;
  ini := 0;

  while not ClientDataSet1.Eof do
    begin
      if ClientDataSet1.FieldByName('codigo').AsString = '' then
        begin
          if Contido(funcoes.buscaParamGeral(10, ''), '3') = false then begin
             if ((ClientDataSet1.FieldByName('PIS').AsString <> '') and (ClientDataSet1.FieldByName('COD_ISPIS').AsString = '')) then begin
               ClientDataSet1.Edit;
               ClientDataSet1.FieldByName('COD_ISPIS').AsString := '999';
               ClientDataSet1.Post;
             end;
          end;

          if ClientDataSet1.FieldByName('DESCRICAO_ATUAL').AsString = '' then
            begin
              ClientDataSet1.Edit;
              ClientDataSet1.FieldByName('DESCRICAO_ATUAL').AsString := ClientDataSet1.FieldByName('DESCRICAO_FORNECEDOR').AsString;
              ClientDataSet1.Post;
            end;

          if ClientDataSet1.FieldByName('CODBAR_ATUAL').AsString = '' then begin
              if ClientDataSet1.FieldByName('CODBAR').AsString <> 'SEM GTIN' then begin
                ClientDataSet1.Edit;
                ClientDataSet1.FieldByName('CODBAR_ATUAL').AsString := ClientDataSet1.FieldByName('CODBAR').AsString;
                ClientDataSet1.Post;
              end;
          end;

          if StrToCurrDef(ClientDataSet1.FieldByName('PRECO_ATUAL').AsString, 0) = 0 then
            begin
              ClientDataSet1.Edit;
              ClientDataSet1.FieldByName('PRECO_ATUAL').AsCurrency := ClientDataSet1.FieldByName('PRECO_NOVO').AsCurrency;
              ClientDataSet1.Post;
            end;
        end;

      ClientDataSet1.Next;
    end;

  ClientDataSet1.First;
  codbar := TStringList.Create;

  while not ClientDataSet1.Eof do
    begin
      if ClientDataSet1.FieldByName('codigo').AsString = '' then
        begin
          ini      := ini + 1;
          cod1     := Incrementa_Generator('produto', 1);
          p_compra := StrToCurrDef(ClientDataSet1.FieldByName('PRECO_COMPRA').AsString, 0);
          p_venda  := StrToCurrDef(ClientDataSet1.FieldByName('PRECO_ATUAL').AsString, 0);
          if p_venda = 0 then p_venda  := StrToCurrDef(ClientDataSet1.FieldByName('PRECO_NOVO').AsString, 0);

          dm.IBQuery1.Close;
          dm.IBQuery1.SQL.Text := 'insert into produto(cod, nome, p_venda, p_compra, unid, grupo,' +
          'unid2, aliquota, codbar, refori, classif, REFNFE, fornec, IS_PIS, COD_ISPIS) values(:cod, :nome, :p_venda, :p_compra, :unid, 0,' +
          ':unid2, :aliquota, :codbar, :refori, :classif, :REFNFE, :fornec, :IS_PIS, :COD_ISPIS)';
          dm.IBQuery1.ParamByName('cod').AsInteger       := StrToInt(cod1);
          dm.IBQuery1.ParamByName('nome').AsString       := UpperCase(ClientDataSet1.FieldByName('DESCRICAO_ATUAL').AsString);
          dm.IBQuery1.ParamByName('p_venda').AsCurrency  := p_venda;//ClientDataSet1.FieldByName('PRECO_NOVO').AsCurrency;
          //dm.IBQuery1.ParamByName('p_compra').AsCurrency := Arredonda(ClientDataSet1.FieldByName('PRECO_NFE').AsCurrency / funcoes.verValorUnidade(ClientDataSet1.FieldByName('UNID_ENTRADA').AsString), 2);
          if p_compra = 0 then p_compra := Arredonda(ClientDataSet1.FieldByName('PRECO_NFE').AsFloat / funcoes.verValorUnidade(ClientDataSet1.FieldByName('UNID_ENTRADA').AsString), 2);
          dm.IBQuery1.ParamByName('p_compra').AsCurrency := p_compra;
          dm.IBQuery1.ParamByName('unid').AsString       := SomenteLetras(ClientDataSet1.FieldByName('UNID_VENDA').AsString);
          dm.IBQuery1.ParamByName('unid2').AsString      := ClientDataSet1.FieldByName('UNID_ENTRADA').AsString;
          aliq := StrNum(ClientDataSet1.FieldByName('ALIQ').AsString);
          if StrToIntDef(aliq, 0) = 0 then aliq := '2';
          dm.IBQuery1.ParamByName('aliquota').AsString   := aliq;

          if (trim(ClientDataSet1.FieldByName('CODBAR_ATUAL').AsString) = '') then begin
            dm.IBQuery1.ParamByName('codbar').AsString    := DIGEAN('789000' + funcoes.CompletaOuRepete('', cod1,'0',6));
            codbar.Add(cod1 + '=' + dm.IBQuery1.ParamByName('codbar').AsString);
          end
          else dm.IBQuery1.ParamByName('codbar').AsString := trim(ClientDataSet1.FieldByName('CODBAR_ATUAL').AsString);

          dm.IBQuery1.ParamByName('refori').AsString     := ClientDataSet1.FieldByName('refori').AsString;
          dm.IBQuery1.ParamByName('classif').AsString    := ClientDataSet1.FieldByName('NCM').AsString;
          dm.IBQuery1.ParamByName('REFNFE').AsString     := ClientDataSet1.FieldByName('REF_NFE').AsString;
          dm.IBQuery1.ParamByName('fornec').AsString     := StrNum(fornecedor);
          dm.IBQuery1.ParamByName('IS_PIS').AsString     := ClientDataSet1.FieldByName('PIS').AsString;
          dm.IBQuery1.ParamByName('COD_ISPIS').AsString     := ClientDataSet1.FieldByName('COD_ISPIS').AsString;

          try
            dm.IBQuery1.ExecSQL;
          except
            on e:exception do begin
              ShowMessage('erro986>' + e.Message);
              exit;
            end;

          end;

          ClientDataSet1.Edit;
          ClientDataSet1.FieldByName('codigo').AsInteger := StrToInt(cod1);
          ClientDataSet1.Post;
        end
       else begin //if ClientDataSet1.FieldByName('codigo').AsString = '' then
         dm.IBQuery1.Close;
         dm.IBQuery1.SQL.Text := 'update produto set aliquota = :aliq, unid = :unid, nome = :nome, IS_PIS = :IS_PIS, COD_ISPIS = :COD_ISPIS  where cod = :cod';
         dm.IBQuery1.ParamByName('aliq').AsString := ClientDataSet1.FieldByName('ALIQ').AsString;
         dm.IBQuery1.ParamByName('unid').AsString := ClientDataSet1.FieldByName('UNID_VENDA').AsString;
         dm.IBQuery1.ParamByName('nome').AsString := LeftStr(ClientDataSet1.FieldByName('DESCRICAO_ATUAL').AsString, 60);
         dm.IBQuery1.ParamByName('IS_PIS').AsString := ClientDataSet1.FieldByName('pis').AsString;
         dm.IBQuery1.ParamByName('COD_ISPIS').AsString := LeftStr(ClientDataSet1.FieldByName('COD_ISPIS').AsString, 60);
         dm.IBQuery1.ParamByName('cod').AsInteger := ClientDataSet1.FieldByName('codigo').AsInteger;
         dm.IBQuery1.ExecSQL;
       end;

      Incrementa_Generator('ATUALIZACADPROD', 1);
      ClientDataSet1.Next;
    end;

  ClientDataSet1.First;
  while not ClientDataSet1.Eof do begin
    for I := 0 to codbar.Count -1 do begin
      if ClientDataSet1.FieldByName('codigo').AsString = codbar.Names[i] then begin
        ClientDataSet1.Edit;
        ClientDataSet1.FieldByName('CODBAR_ATUAL').AsString := codbar.ValueFromIndex[i];
        ClientDataSet1.Post;
      end;
    end;

    ClientDataSet1.Next;
  end;

  codbar.Free;



  if dm.IBQuery1.Transaction.Active then dm.IBQuery1.Transaction.Commit;

  if ini > 0 then ShowMessage(IntToStr(ini) + ' Produtos Cadastrados');
  finally
    ClientDataSet1.EnableControls;
    if verifica then verificaOK();
  end;
end;

procedure TForm48.limparProduto();
begin
  ClientDataSet1.Edit;
  ClientDataSet1.FieldByName('codigo').AsString          := '';
  ClientDataSet1.FieldByName('DESCRICAO_ATUAL').AsString := '';
  ClientDataSet1.FieldByName('CODBAR_ATUAL').AsString    := '';
  ClientDataSet1.FieldByName('PRECO_ATUAL').AsCurrency   := 0.00;
  ClientDataSet1.FieldByName('UNID_ENTRADA').AsString    := '';
  ClientDataSet1.FieldByName('UNID_VENDA').AsString      := '';
  ClientDataSet1.Post;
end;

procedure TForm48.DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
  if trim(ClientDataSet1.FieldByName('ok').AsString) = '' then
    begin
      DBGrid1.Canvas.Brush.Color := HexToTColor('FF6A6A');
      DBGrid1.Canvas.FillRect(Rect);
      DBGrid1.DefaultDrawDataCell(Rect, Field, State) // Reescreve o valor que vem do banco
    end
  else if ClientDataSet1.FieldByName('ok').AsString = 'C' then begin
    DBGrid1.Canvas.Brush.Color := HexToTColor('228B22');
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawDataCell(Rect, Field, State) // Reescreve o valor que vem do banco
  end;
end;

procedure TForm48.DBGrid1Enter(Sender: TObject);
begin
  escreveNomeDoProduto;
end;

procedure TForm48.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (Column.Field.FieldName = 'QUANTIDADE_ENT') then begin
    if ClientDataSet1.FieldByName('mu').AsInteger <> 1 then begin
      DBGrid1.Canvas.Font.Color  := clWhite;
      DBGrid1.Canvas.Brush.Color := clBlack;
      DBGrid1.Canvas.Font.Style  := [fsBold];
      DBGrid1.Canvas.FillRect(Rect);
      DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end else begin
      DBGrid1.Canvas.Font.Color  := DBGrid1.Canvas.Brush.Color;
      DBGrid1.Canvas.FillRect(Rect);
      DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
  end;

  if (Column.Field.FieldName = 'COD_ISPIS') then begin
    if ((ClientDataSet1.FieldByName('PIS').AsString <> '') and (ClientDataSet1.FieldByName('COD_ISPIS').AsString = '')) then begin
      DBGrid1.Canvas.Font.Color  := clBlack;
      DBGrid1.Canvas.Brush.Color := HexToTColor(corColunaCorrigir);
      DBGrid1.Canvas.Font.Style  := [fsBold];
      DBGrid1.Canvas.FillRect(Rect);
      DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
  end;



  if (Column.Field.FieldName = 'UNID_ENTRADA') then
    begin
      if ClientDataSet1.FieldByName('UNID_ENTRADA').AsString = '' then
        begin
          DBGrid1.Canvas.Brush.Color := HexToTColor(corColunaCorrigir);
          DBGrid1.Canvas.Font.Color  := clWhite;
          DBGrid1.Canvas.FillRect(Rect);
          DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
        end;
    end;

  if (Column.Field.FieldName = 'ALIQ') then
    begin
      if ClientDataSet1.FieldByName('ALIQ').AsString = '' then
        begin
          DBGrid1.Canvas.Brush.Color := HexToTColor(corColunaCorrigir);
          DBGrid1.Canvas.Font.Color  := clWhite;
          DBGrid1.Canvas.FillRect(Rect);
          DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
        end;  
    end;


  With DBGrid1 do
    begin
      if (State = [gdSelected]) or (State = [gdFocused]) or
       (State = [gdSelected,gdFocused]) then
         begin
           Canvas.Brush.Color := clSkyBlue;
           Canvas.Font.Color  := clBlack;
           Canvas.FillRect(Rect);
           DefaultDrawDataCell(Rect, Column.Field, State);
         end;
    end;
end;

procedure TForm48.mostraNomesCampos();
begin
  TField(form48.ClientDataSet1.FieldByName('CODIGO')).DisplayLabel               := 'Código';
  TField(form48.ClientDataSet1.FieldByName('DESCRICAO_FORNECEDOR')).DisplayLabel := 'Descrição do Fornecedor(XML)';
  TField(form48.ClientDataSet1.FieldByName('DESCRICAO_ATUAL')).DisplayLabel      := 'Descrição do Produto Atual';
  TField(form48.ClientDataSet1.FieldByName('PRECO_NFE')).DisplayLabel            := 'Preço(XML)';
  TField(form48.ClientDataSet1.FieldByName('LUCRO')).DisplayLabel                := 'Lucro';
  TField(form48.ClientDataSet1.FieldByName('PRECO_NOVO')).DisplayLabel           := 'Preço Novo';
  TField(form48.ClientDataSet1.FieldByName('PRECO_ATUAL')).DisplayLabel          := 'Preço Venda';
  TField(form48.ClientDataSet1.FieldByName('QUANTIDADE_NFE')).DisplayLabel       := 'Quant. (XML)';
  TField(form48.ClientDataSet1.FieldByName('QUANTIDADE_ENT')).DisplayLabel       := 'Quant. Entrada';
  TField(form48.ClientDataSet1.FieldByName('UNID_NFE')).DisplayLabel             := 'Unid(XML)';
  TField(form48.ClientDataSet1.FieldByName('UNID_ENTRADA')).DisplayLabel         := 'Unid. Entrada';
  TField(form48.ClientDataSet1.FieldByName('UNID_VENDA')).DisplayLabel           := 'Unid. Venda';
  TField(form48.ClientDataSet1.FieldByName('ALIQ')).DisplayLabel                 := 'Aliq.';
  TField(form48.ClientDataSet1.FieldByName('CODBAR')).DisplayLabel               := 'Cod. barras(XML)';
  TField(form48.ClientDataSet1.FieldByName('CODBAR_ATUAL')).DisplayLabel         := 'Cód. Barras Atual';
  TField(form48.ClientDataSet1.FieldByName('REFORI')).DisplayLabel               := 'Ref. Original';
  TField(form48.ClientDataSet1.FieldByName('REF_NFE')).DisplayLabel              := 'Ref. Fornecedor(XML)';
  TField(form48.ClientDataSet1.FieldByName('NCM')).DisplayLabel                  := 'NCM';
  TField(form48.ClientDataSet1.FieldByName('PRECO_NOVO')).DisplayLabel           := 'Preço Novo';
  TField(form48.ClientDataSet1.FieldByName('PRECO_COMPRA')).DisplayLabel         := 'Preço Compra';
  TField(form48.ClientDataSet1.FieldByName('CRED_ICMS')).DisplayLabel            := 'Crédito ICMS(%):';
  TCurrencyField(form48.ClientDataSet1.FieldByName('CRED_ICMS')).DisplayFormat
    := '###,##0.000';
end;

function TForm48.verificaCodigosDeBarrasDosProdutos() : string;
var
  tmp, acctmp, querytmp, accCodigos, codtmp : string;
  conttmp : integer;
begin
  try
    limpaOK();
    ClientDataSet1.DisableControls;
    ClientDataSet1.First;
    tmp    := '';
    acctmp := '';
    Result := '';
    while not ClientDataSet1.Eof do
      begin
        if ClientDataSet1.FieldByName('CODIGO').AsString = '' then
         begin
           if ClientDataSet1.FieldByName('CODBAR_ATUAL').AsString <> '' then tmp := ClientDataSet1.FieldByName('CODBAR_ATUAL').AsString
             else tmp := ClientDataSet1.FieldByName('CODBAR').AsString;

           if tmp = 'SEM GTIN' then tmp := '';

           if tmp <> '' then
             begin
             if funcoes.Contido('-' + tmp + '-', acctmp) then begin
                Result     := Result + 'Erro: Cód. Barras ' + tmp + ' Já foi lançado em um produto desta nota' + #13;
                conttmp    := ClientDataSet1.FieldByName('cont').AsInteger;
                accCodigos := '';

                codtmp := tmp;

                ClientDataSet1.First;
                while not ClientDataSet1.Eof do begin
                  if ClientDataSet1.FieldByName('CODBAR_ATUAL').AsString <> '' then tmp := ClientDataSet1.FieldByName('CODBAR_ATUAL').AsString
                    else tmp := ClientDataSet1.FieldByName('CODBAR').AsString;

                 if tmp = codtmp then begin
                   ClientDataSet1.Edit;
                   ClientDataSet1.FieldByName('ok').AsString := 'C';
                   ClientDataSet1.Post;
                 end;
                   
                 ClientDataSet1.Next;
               end;

               MessageDlg('Verifique os Códigos de barras dos Produtos em VERDE', mtInformation, [mbOK], 1);
               Result := '1';
               exit;

            end
              else
                begin
                  if ClientDataSet1.FieldByName('CODIGO').AsString <> '' then querytmp := 'and cod <> ' + ClientDataSet1.FieldByName('CODIGO').AsString
                    else querytmp := '';

                  dm.IBselect.Close;
                  dm.IBselect.SQL.Text := 'select cod, nome from produto where codbar = :codbar ' + querytmp;
                  dm.IBselect.ParamByName('codbar').AsString := tmp;
                  dm.IBselect.Open;

                  if not dm.IBselect.IsEmpty then
                    begin
                      Result := Result + 'Erro: Cód. Barras '+tmp+' Já Foi cadastrado em: ' + dm.IBselect.fieldbyname('cod').AsString + '-' + dm.IBselect.fieldbyname('nome').AsString + #13;
                    end;

                  dm.IBselect.Close;
                end;

            if acctmp = '' then acctmp := acctmp + '-' + tmp + '-'
              else acctmp := acctmp + tmp + '-';
         end;
            //ShowMessage(acctmp);
          end;
        ClientDataSet1.Next;
      end;
  finally
    ClientDataSet1.First;
    ClientDataSet1.EnableControls;
  end;
end;


procedure TForm48.lerProdutosParaDarEntrada(var lista : TItensProduto);
var
  i : integer;
  qtd, QTD_UNIDADE : currency;
  nome : String;
begin
  lista := TItensProduto.Create;
  ClientDataSet1.DisableControls;
  ClientDataSet1.First;

  while not ClientDataSet1.Eof do
    begin
      i   := lista.Find(ClientDataSet1.fieldbyname('codigo').AsInteger);

      QTD_UNIDADE := funcoes.verValorUnidade(ClientDataSet1.fieldbyname('UNID_ENTRADA').AsString);
      qtd         := ClientDataSet1.fieldbyname('mu').AsCurrency;
      if qtd = 0 then qtd := 1;
      qtd := ClientDataSet1.fieldbyname('QUANTIDADE_NFE').AsCurrency * QTD_UNIDADE;
      qtd := Arredonda(qtd, 4);

      if i = -1 then
        begin
          i := lista.Add(TregProd.Create);

          nome := ClientDataSet1.fieldbyname('DESCRICAO_ATUAL').AsString;
          if trim(nome) = '' then nome := ClientDataSet1.fieldbyname('DESCRICAO_FORNECEDOR').AsString;
          nome := LeftStr(nome, 60);


          lista[i].codbarAtual := ClientDataSet1.fieldbyname('CODBAR_ATUAL').AsString;
          if trim(lista[i].codbarAtual) = '' then ClientDataSet1.fieldbyname('CODBAR').AsString;


          lista[i].PERC_ICM  := StrToCurrDef(ClientDataSet1.FieldByName('PRECO_ATUAL').AsString, 0);
          if lista[i].PERC_ICM = 0 then lista[i].PERC_ICM  := StrToCurrDef(ClientDataSet1.FieldByName('PRECO_NOVO').AsString, 0);
          lista[i].cod      := ClientDataSet1.fieldbyname('codigo').AsInteger;
          lista[i].preco    := ClientDataSet1.fieldbyname('PRECO_NFE').AsFloat;
          lista[i].total    := ClientDataSet1.fieldbyname('total').AsCurrency;
          lista[i].unid     := ClientDataSet1.fieldbyname('UNID_ENTRADA').AsString;
          lista[i].unid2    := ClientDataSet1.fieldbyname('UNID_VENDA').AsString;
          lista[i].codbar   := ClientDataSet1.fieldbyname('nota').AsString;
          lista[i].nome     := ClientDataSet1.fieldbyname('REF_NFE').AsString;
          lista[i].temp     := nome;
          lista[i].quant    := qtd;
          lista[i].BASE_ICM := ClientDataSet1.FieldByName('PRECO_COMPRA').AsFloat;
          lista[i].CST_PIS  := ClientDataSet1.FieldByName('PIS').AsString;
          lista[i].COD_ISPIS  := ClientDataSet1.FieldByName('COD_ISPIS').AsString;

          //lista[i].BASE_ICM := ArredondaFinanceiro(ClientDataSet1.fieldbyname('PRECO_NFE').AsCurrency / QTD_UNIDADE, 3);
          lista[i].ncm      := ClientDataSet1.fieldbyname('ncm').AsString;

          //lista[i].preco := StrToCurrDef(ClientDataSet1.FieldByName('PRECO_COMPRA').AsString, 0);

          lista[i].preco := ClientDataSet1.FieldByName('PRECO_ATUAL').AsFloat;
          if lista[i].preco = 0 then lista[i].preco := Arredonda(ClientDataSet1.FieldByName('PRECO_NFE').AsFloat / funcoes.verValorUnidade(ClientDataSet1.FieldByName('UNID_ENTRADA').AsString), 2);
        end
      else
        begin
          lista[i].quant := lista[i].quant + qtd;
          lista[i].total := lista[i].total + ClientDataSet1.fieldbyname('total').AsCurrency;
        end;

      ClientDataSet1.Next;
    end;

  ClientDataSet1.EnableControls;  
end;

procedure TForm48.limpaOK();
begin
  ClientDataSet1.DisableControls;
  ClientDataSet1.First;

  while not ClientDataSet1.Eof do begin
    ClientDataSet1.Edit;
    ClientDataSet1.FieldByName('ok').AsString := '';
    ClientDataSet1.Post;
    ClientDataSet1.Next;
  end;
  
  ClientDataSet1.First;
  ClientDataSet1.EnableControls;
end;

procedure TForm48.buscaProdutosCadastro();
var
  axx : String;
  item1: Ptr_nota;
  fim : integer;
begin
  ClientDataSet1.DisableControls;
  ClientDataSet1.First;
  fim := ClientDataSet1.RecordCount;
  funcoes.informacao(0, fim, 'Aguarde, Lendo XML...', true, false, 5);
  try
    while not ClientDataSet1.Eof do begin
      if trim(ClientDataSet1.FieldByName('codigo').AsString) = '' then begin
        funcoes.informacao(ClientDataSet1.RecNo, fim, 'Aguarde, Lendo XML...', false, false, 5);
        dm.IBselect.Close;
        dm.IBselect.SQL.Clear;
        dm.IBselect.SQL.Add
        ('select cod, nome, unid2, aliquota, unid, p_venda, codbar, refori from produto where REFNFE = :cod');
        dm.IBselect.ParamByName('cod').AsString :=
        strnum(copy(ClientDataSet1.FieldByName('REF_NFE').AsString, 1, 25));
        dm.IBselect.Open;

        axx := '0';

        if dm.IBselect.IsEmpty then begin
          if ClientDataSet1.FieldByName('CODBAR').AsString <> '' then begin
            dm.IBselect.Close;
            dm.IBselect.SQL.Clear;
            dm.IBselect.SQL.Add
            ('select p.cod, p.nome, p.unid2, p.p_venda, p.codbar, p.aliquota, p.refori, '
            + ' p.unid from produto p left join codbarras c on (c.cod = p.cod) where (p.codbar = '
            + QuotedStr(copy(ClientDataSet1.FieldByName('CODBAR').AsString, 1, 15)) + ') or (c.codbar = ' +
            QuotedStr(copy(ClientDataSet1.FieldByName('CODBAR').AsString, 1, 15)) + ')');
            dm.IBselect.Open;

            if not dm.IBselect.IsEmpty then begin
              axx := '1';
            end;
          end
          else axx := '0';
        end
        else
          axx := '1';

          if axx = '1' then begin // se achou o produto
            form48.ClientDataSet1.Edit;
            form48.ClientDataSet1.FieldByName('codigo').AsString :=
            dm.IBselect.FieldByName('cod').AsString;
            form48.ClientDataSet1.FieldByName('CODBAR_ATUAL').AsString :=
            dm.IBselect.FieldByName('codbar').AsString;
            form48.ClientDataSet1.FieldByName('PRECO_ATUAL').AsCurrency :=
            dm.IBselect.FieldByName('p_venda').AsCurrency;
            form48.ClientDataSet1.FieldByName('ALIQ').AsString :=
            dm.IBselect.FieldByName('aliquota').AsString;
            form48.ClientDataSet1.FieldByName('DESCRICAO_ATUAL').AsString :=
            dm.IBselect.FieldByName('nome').AsString;
            form48.ClientDataSet1.FieldByName('REFORI').AsString :=
            dm.IBselect.FieldByName('REFORI').AsString;

            if dm.IBselect.FieldByName('unid2').AsString <> '' then begin
              form48.ClientDataSet1.FieldByName('UNID_ENTRADA').AsString :=
              dm.IBselect.FieldByName('unid2').AsString;
              form48.ClientDataSet1.FieldByName('QUANTIDADE_ENT').AsCurrency :=
              StrToCurr(strnum1(dm.IBselect.FieldByName('unid2').AsString));
            end;

            form48.ClientDataSet1.FieldByName('UNID_VENDA').AsString :=
            dm.IBselect.FieldByName('unid').AsString;
            dm.IBselect.Close;
            ClientDataSet1.Post;
          end;
      end;

      ClientDataSet1.Next;
    end;
  finally
    funcoes.informacao(ClientDataSet1.RecNo, fim, 'Aguarde, Lendo XML...', false, true, 5);
    ClientDataSet1.EnableControls;
    ClientDataSet1.First;
  end;
end;


procedure TForm48.alteraPIS();
var
  cod, codNovo : String;
  ob  : TObject;
begin
  try
    cod := ClientDataSet1.FieldByName('pis').AsString;
  except
    on e:exception do begin
      ShowMessage('erro:' + e.Message );
      exit;
    end;
  end;

  ob := TObject.Create;
  form39 := tform39.Create(self);
  form39.conf := 3;
  form39.padraoSeNaoExistir := cod;
  form39.ListBox1.Items.Add('  - TRIBUTADO');
  form39.ListBox1.Items.Add('I - ISENTO             (07)');
  form39.ListBox1.Items.Add('R - Aliq. Red. Zero    (06)');
  form39.ListBox1.Items.Add('M - Monofásico         (04)');
  form39.ListBox1.Items.Add('X - Sem Incidencia     (08)');
  form39.ListBox1.Items.Add('D - Aliq. Diferenciada (02)');
  codNovo := funcoes.lista(ob, true, 3);
  if codnovo = '*' then exit;


  if cod = codNovo then exit;

  ClientDataSet1.Edit;
  ClientDataSet1.FieldByName('PIS').AsString       := codNovo;
  ClientDataSet1.FieldByName('COD_ISPIS').AsString := '';
  ClientDataSet1.Post;
end;


procedure TForm48.alteraCOD_ISPIS();
var
  cod, codNovo : String;
  ob  : TObject;
begin
  try
    cod := ClientDataSet1.FieldByName('COD_ISPIS').AsString;
  except
    on e:exception do begin
      ShowMessage('erro:' + e.Message );
      exit;
    end;
  end;

  codNovo := funcoes.VE_CODISPIS('', ClientDataSet1.FieldByName('PIS').AsString);
  if Contido('|'+codNovo + '|', '|100|200|300|400|500|600|700|800|900|') then begin
    MessageDlg('Código ' + codNovo + ' Inválido!', mtInformation, [mbOK], 1);
    exit;
  end;

  if cod = codNovo then exit;

  ClientDataSet1.Edit;
  ClientDataSet1.FieldByName('COD_ISPIS').AsString := codNovo;
  ClientDataSet1.Post;
end;

procedure TForm48.replicarUnidade();
var
  cod, cod1 : String;
  qtd, valor : currency;
  codTMP : integer;
begin
  if ClientDataSet1.FieldByName('mu').AsInteger > 1 then begin
    ShowMessage('Essa Unidade Não pode ser Replicada!' + #13 + #13 + 'O fator Multiplicativo é ' + ClientDataSet1.FieldByName('mu').AsString);
    exit;
  end;

  if ClientDataSet1.FieldByName('UNID_ENTRADA').AsString = '' then begin
    ShowMessage('Essa Unidade Não pode ser Replicada!' + #13 + #13 + 'A unidade Não Foi Preenchida!');
    exit;
  end;

  unidadeTemp := cod;
  codTMP := ClientDataSet1.RecNo -1;
  qtd := funcoes.verValorUnidade(cod);
  cod1 := ClientDataSet1.FieldByName('UNID_VENDA').AsString;
  cod  := ClientDataSet1.FieldByName('UNID_ENTRADA').AsString;


  ClientDataSet1.DisableControls;
  ClientDataSet1.First;
    while not ClientDataSet1.Eof do begin
      try
        ClientDataSet1.Edit;
        ClientDataSet1.FieldByName('UNID_ENTRADA').AsString := cod;
        ClientDataSet1.FieldByName('UNID_VENDA').AsString   := (cod1);
        ClientDataSet1.FieldByName('mu').AsFloat          := (qtd);
        ClientDataSet1.FieldByName('QUANTIDADE_ENT').AsCurrency :=  Arredonda(qtd * ClientDataSet1.FieldByName('QUANTIDADE_NFE').AsFloat, 3);

        valor := Arredonda((ClientDataSet1.FieldByName('PRECO_NFE').AsFloat + (ClientDataSet1.FieldByName('PRECO_NFE').AsFloat * ClientDataSet1.FieldByName('LUCRO').AsFloat / 100)) /qtd, 2);
        ClientDataSet1.FieldByName('PRECO_NOVO').AsFloat   := valor;
        ClientDataSet1.FieldByName('PRECO_COMPRA').AsFloat := Arredonda(ClientDataSet1.FieldByName('PRECO_NFE').AsFloat / StrToCurrDef(ClientDataSet1.FieldByName('mu').AsString, 1), 2);

        ClientDataSet1.Post;
      finally
      end;

      ClientDataSet1.Next;
    end;

  ClientDataSet1.First;
  ClientDataSet1.MoveBy(codTMP);
  ClientDataSet1.EnableControls;
end;

procedure TForm48.escreveNomeDoProduto;
begin
  Label4.Caption := 'Prod. Atual:' + copy(ClientDataSet1.FieldByName('REF_NFE').AsString, 1, pos('|', ClientDataSet1.FieldByName('REF_NFE').AsString) -1) + '-' +  ClientDataSet1.FieldByName('DESCRICAO_FORNECEDOR').AsString;
end;

end.










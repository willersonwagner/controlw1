unit dadosnfe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  JsEditInteiro1, JsEdit1, JsEditNumero1, DBClient, db, classes1, untnfceForm, StrUtils, funcoesdav, pcnConversao;

type
  TForm79 = class(TForm)
    Label9: TLabel;
    nota: TEdit;
    Label1: TLabel;
    numnf: TEdit;
    Panel1: TPanel;
    ButBaixar: TBitBtn;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    finnfe: TEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    tiponfe: TEdit;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    origemmercadoria: TEdit;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    destMercadoria: TEdit;
    GroupBox5: TGroupBox;
    dadosAdic: TMemo;
    cliente: TEdit;
    Label6: TLabel;
    GroupBox6: TGroupBox;
    Label7: TLabel;
    FretePorConta: TEdit;
    despAcessorias: JsEditNumero;
    Label10: TLabel;
    cfop: JsEditInteiro;
    Label11: TLabel;
    Label12: TLabel;
    GroupBox7: TGroupBox;
    Label13: TLabel;
    tipoEmissao: TEdit;
    Label8: TLabel;
    procedure notaKeyPress(Sender: TObject; var Key: Char);
    procedure numnfKeyPress(Sender: TObject; var Key: Char);
    procedure clienteKeyPress(Sender: TObject; var Key: Char);
    procedure finnfeKeyPress(Sender: TObject; var Key: Char);
    procedure tiponfeKeyPress(Sender: TObject; var Key: Char);
    procedure origemmercadoriaKeyPress(Sender: TObject; var Key: Char);
    procedure destMercadoriaKeyPress(Sender: TObject; var Key: Char);
    procedure dadosAdicKeyPress(Sender: TObject; var Key: Char);
    procedure FretePorContaKeyPress(Sender: TObject; var Key: Char);
    procedure tipoEmissaoKeyPress(Sender: TObject; var Key: Char);
    procedure cfopKeyPress(Sender: TObject; var Key: Char);
    procedure despAcessoriasKeyPress(Sender: TObject; var Key: Char);
    procedure ButBaixarKeyPress(Sender: TObject; var Key: Char);
    procedure ButBaixarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure notaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure numnfKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure clienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure finnfeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tiponfeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure origemmercadoriaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure destMercadoriaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FretePorContaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tipoEmissaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cfopKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure despAcessoriasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButBaixarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure clienteKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    generator : String;
    nfeRefLista : tstringList;
    procedure teclaEsc();
    procedure geraListaProdutos;
    function buscaFinalidadeMaiorQue1 : String;
    function buscaComercioExterior : String;
    procedure executa_proximo_ouVolta(key : word;primeiro, ultimo :boolean);
    function buscaNFCE() : String;
    procedure acertaCFOP_Automatico;
    function buscafrete() : string;
    function verificaSeExisteVendaValidaComNumeracao() : boolean;
    function salvaDadosAdic(opcao : integer = 0) : string;
    function buscaDadosAdic() : string;
    procedure atualizaNumeracaoGeneratorTela;
    function buscaCliente() : string;
    { Private declarations }
  public
    FIN_NFE, nomeFIN_NFE, DOC_REF, NFE_REF, estorno, TAG_DOCREF, NUM_ECF, natOP1,
    infoAdi, NUM_COO, COD_PAIS, iescliente, UF_DEST, UF_EMI, vFrete : String;
    cupom : integer;
    frete, notas : TStringList;
    { Public declarations }
  end;

var
  Form79: TForm79;

implementation

{$R *.dfm}

uses func, cadcliente, nfe, buscaSelecao, Unit1, Unit73, dadosTransp, principal;

procedure TForm79.ButBaixarClick(Sender: TObject);
var
  situacao : String;
begin
  try
    if verificaSeExisteVendaValidaComNumeracao = false then exit;
  except
    on e:exception do begin
      ShowMessage('erro126: ' + e.Message);
      exit;
    end;
  end;

  try
     atualizaNumeracaoGeneratorTela;
    except
    on e:exception do begin
      ShowMessage('erro134: ' + e.Message);
    end;
  end;

  dm.IBQuery2.Close;
  dm.IBQuery2.SQL.Clear;
  dm.IBQuery2.SQL.Add('select * from cod_op where cod = :cod');
  dm.IBQuery2.ParamByName('cod').AsString := funcoes.StrNum(cfop.Text);
  dm.IBQuery2.Open;

  natOP1 := dm.IBQuery2.FieldByName('nome').AsString;

  if estorno = 'S' then begin
    natOP1 := '999 - Estorno de NF-e não cancelada no prazo legal';
  end;

  try
    NfeVenda := tnfevenda.Create(self);
    NfeVenda.cstIcmCfop  := dm.IBQuery2.FieldByName('icms').AsString;
    NfeVenda.cstpisCfop  := dm.IBQuery2.FieldByName('pis').AsString;
    NfeVenda.natOp       := natOP1;

    NfeVenda.cupom := cupom;
    NfeVenda.DEST  := Cliente.Text;
    NfeVenda.frete := frete;

    NfeVenda.frete.Values['0'] := funcoes.StrNum(FretePorConta.Text);
    NfeVenda.tipo_frete := StrToInt(funcoes.StrNum(FretePorConta.Text));
    NfeVenda.TotalFrete := 0;
    if FretePorConta.Text <> '9' then NfeVenda.TotalFrete := StrToCurr(funcoes.ConverteNumerico(vFrete));
   except
    on e:exception do begin
      ShowMessage('erro166: ' + e.Message);
    end;
  end;

  try
    NfeVenda.UF_EMI      := UF_EMI;
    NfeVenda.UF_DEST     := UF_DEST;
    NfeVenda.VLR_DESP    := despAcessorias.getValor;
    NfeVenda.codNFe      := numnf.Text;
    NfeVenda.cod_OP      := cfop.Text;
    NfeVenda.codPaisDest := COD_PAIS;

    NfeVenda.tipo        := tiponfe.Text;
    NfeVenda.DEST_NFE    := destMercadoria.Text;
    NfeVenda.infAdic     := dadosAdic.Text;
    NfeVenda.notas       := notas;
    NfeVenda._ORIGEM     := origemmercadoria.Text;
    NfeVenda.FIN_NFE1    := finnfe.Text;
    NfeVenda.TAG_DOCREF  := TAG_DOCREF;
    NfeVenda.NFE_REF     := StrNum(NFE_REF);
   except
    on e:exception do begin
      ShowMessage('erro188: ' + e.Message);
    end;
  end;

  try
    nfevenda.ambienteProducao1homologacao2 := tipoEmissao.Text;
    NfeVenda.GeraXml1;
  except
    on e: exception do
    begin
      MessageDlg('Erro: ' + e.Message, mtError, [mbok], 1);
      if funcoes.Contido('LENGTH', UpperCase(e.Message)) then
      begin

      END;
    end;
  end;
  situacao := NfeVenda.situacao;
  NfeVenda.Free;

  if situacao = 'E' then close;
end;

procedure TForm79.ButBaixarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  executa_proximo_ouVolta(key, false, true);
end;

procedure TForm79.ButBaixarKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then teclaEsc;
end;

procedure TForm79.cfopKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  executa_proximo_ouVolta(key, false, false);
end;

procedure TForm79.cfopKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then despAcessorias.SetFocus;
  if key = #27 then teclaEsc;
end;

procedure TForm79.clienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  executa_proximo_ouVolta(key, false, false);
end;

procedure TForm79.clienteKeyPress(Sender: TObject; var Key: Char);
var
  exterior : boolean;
begin
  if key = #13 then begin
    if tedit(Sender).Text = '' then begin
      if funcoes.buscaParamGeral(16, 'N') = 'S' then begin
        form16 := tform16.Create(self);
        funcoes.CtrlResize(TForm(form16));
        form16.ShowModal;
        cliente.Text := form16.valor_a_retornar;
        jsedit.LiberaMemoria(form16);
        form16.Free;
      end
      else begin
        cliente.Text := funcoes.localizar('Localizar Cliente', 'cliente',
        'cod,nome,telres,telcom,cnpj,bairro', 'cod', '', 'nome', 'nome',
        false, false, false, '', 0, nil);
      end;
    end;

    if tedit(Sender).Text <> '' then begin
      dm.IBselect.Close;
      dm.IBselect.SQL.Text := 'select cod,nome,tipo, ies, est from cliente where cod = :cod';
      dm.IBselect.ParamByName('cod').AsString := strnum(tedit(Sender).Text);
      dm.IBselect.Open;

       UF_DEST := dm.IBselect.FieldByName('est').AsString;

      exterior   := false;
      iescliente := strnum(dm.IBselect.FieldByName('ies').AsString);
      if dm.IBselect.FieldByName('tipo').AsString = '7' then exterior := true;
      if finnfe.Text = '2' then exterior := true; // se for comercio exterior
      if verificaDadosClienteNFe(strnum(tedit(Sender).Text), exterior) then finnfe.SetFocus;
      dm.IBselect.Close;

      acertaCFOP_Automatico;
    end;
  end;

  if key = #27 then teclaEsc;
end;

procedure TForm79.clienteKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 116) then
    begin
      tedit(sender).Text := funcoes.localizar('Localizar Cliente','cliente','cod,nome,telres,telcom,cnpj as cpfcnpj,bairro','cod','','nome','nome',false,false,false,'',450,NIL);
      key := 0;
    end;
end;

procedure TForm79.dadosAdicKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin
    key := #0;
    FretePorConta.SetFocus;
  end;
  if key = #27 then teclaEsc;
end;

procedure TForm79.despAcessoriasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  executa_proximo_ouVolta(key, false, false);
end;

procedure TForm79.despAcessoriasKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin
     ButBaixar.SetFocus;
     abort;
  end;
  if key = #27 then teclaEsc;
end;

procedure TForm79.destMercadoriaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  executa_proximo_ouVolta(key, false, false);
end;

procedure TForm79.destMercadoriaKeyPress(Sender: TObject; var Key: Char);
var
  exterior : boolean;
begin
  if key = #13 then begin
    if tedit(sender).Text = '2' then begin
      if buscaComercioExterior = '' then exit;

      exterior := true;
      if verificaDadosClienteNFe(strnum(cliente.Text), exterior) = false then begin
        ShowMessage('Dados de Cliente Inválidos!');
        cliente.SetFocus;
        exit;
      end;
    end;

    acertaCFOP_Automatico;
    dadosAdic.SetFocus;
  end;
  if key = #27 then teclaEsc;

  if Contido(key, '12') = false then begin
    key := #0;
  end
  else tedit(sender).Text := '';
end;

procedure TForm79.finnfeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  executa_proximo_ouVolta(key, false, false);
end;

procedure TForm79.finnfeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin
    if contido(tedit(sender).Text, '234') then begin
      if buscaFinalidadeMaiorQue1 = '*' then exit;

      acertaCFOP_Automatico;
    end;

    tiponfe.SetFocus;
  end;
  if key = #27 then teclaEsc;

  if Contido(key, '1234') = false then begin
    key := #0;
    tedit(sender).SelectAll;
  end
  else begin
    tedit(sender).Text := '';
    tedit(sender).SelectAll;
  end;
end;

procedure TForm79.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  jsedit.LiberaMemoria(self);
end;

procedure TForm79.FormCreate(Sender: TObject);
begin
  notas := TStringList.Create;
  frete := TStringList.Create;
end;

procedure TForm79.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 113 then geraListaProdutos;
  if key = 114 then salvaDadosAdic(0); //salva dados adicionais
  if key = 115 then salvaDadosAdic(1); //limpa dados adicionais

end;

procedure TForm79.FormShow(Sender: TObject);
begin
  generator := 'NFE';
  numnf.Text := Incrementa_Generator(generator, 0);
  if form22.usuario <> 'ADMIN' then numnf.Enabled := false;
  dadosAdic.Text := buscaDadosAdic;
  atualizaNumeracaoGeneratorTela;

  if ACBrNFe.Configuracoes.WebServices.Ambiente = taProducao then tipoEmissao.Text := '1'
    else tipoEmissao.Text := '2';

end;

procedure TForm79.FretePorContaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  executa_proximo_ouVolta(key, false, false);
end;

procedure TForm79.FretePorContaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin
    buscafrete;
    tipoEmissao.SetFocus;
  end;
  if key = #27 then teclaEsc;

  if Contido(key, '019') = false then begin
    key := #0;
  end
  else tedit(sender).Text := '';
end;

procedure TForm79.notaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 40)then begin
    Perform (wm_nextdlgctl, 0, 0);
  end;
end;

procedure TForm79.notaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin
    if tedit(sender).Text <> '' then begin
      if verificaSeExisteVendaValidaComNumeracao = false then exit;
      if numnf.Enabled then numnf.SetFocus
        else cliente.SetFocus;
    end
    else begin
      if buscaNFCE = '*' then exit;
      if numnf.Enabled then numnf.SetFocus
        else cliente.SetFocus;
    end;
  end;
  if key = #27 then begin
    close;
  end;
end;

procedure TForm79.numnfKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  executa_proximo_ouVolta(key, false, false);
end;

procedure TForm79.numnfKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then cliente.SetFocus;
  if key = #27 then teclaEsc;
end;

procedure TForm79.origemmercadoriaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  executa_proximo_ouVolta(key, false, false);
end;

procedure TForm79.origemmercadoriaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then destMercadoria.SetFocus;
  if key = #27 then teclaEsc;

  if Contido(key, '0123') = false then begin
    key := #0;
  end
  else tedit(sender).Text := '';
end;

procedure TForm79.tipoEmissaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  executa_proximo_ouVolta(key, false, false);
end;

procedure TForm79.tipoEmissaoKeyPress(Sender: TObject; var Key: Char);
begin


  if key = #13 then begin
    atualizaNumeracaoGeneratorTela;
    cfop.SetFocus;
  end;

  if key = #27 then teclaEsc;

  if Contido(key, '12') = false then begin
    key := #0;
  end
  else tedit(sender).Text := '';

end;

procedure TForm79.tiponfeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  executa_proximo_ouVolta(key, false, false);
end;

procedure TForm79.tiponfeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then origemmercadoria.SetFocus;
  if key = #27 then teclaEsc;

  key := UpCase(key);
  if Contido((key), 'EST') = false then begin
    key := #0;
    tedit(sender).SelectAll;
  end
  else begin
    tedit(sender).Text := '';
    tedit(sender).SelectAll;
  end;
end;

procedure TForm79.teclaEsc();
begin
  nota.SetFocus;
end;

procedure TForm79.geraListaProdutos;
var
  lista : tlist;
  dsproduto : TClientDataSet;
  nomeCampoCST : String;
  ini, fim, i : integer;
  item : Item_venda;
begin
  try
    if verificaSeExisteVendaValidaComNumeracao = false then exit;
  except
    on e:exception do begin
      ShowMessage('erro 552: ' + e.Message);
      exit;
    end;
  end;

  try
    NfeVenda := TNfeVenda.Create(self);
    NfeVenda.notas := notas;
  except
    on e:exception do begin
      ShowMessage('erro 552: ' + e.Message);
      exit;
    end;
  end;


  try
    NfeVenda.CriaLista_De_itens_Venda(lista);
  except
    on e:exception do begin
      ShowMessage('erro 562: ' + e.Message);
      exit;
    end;
  end;

  dsproduto := TClientDataSet.Create(self);
  dsproduto.FieldDefs.Add('cod', ftInteger);
  dsproduto.FieldDefs.Add('nome', ftString, 60);
  dsproduto.FieldDefs.Add('ncm', ftString, 15);
  if funcoes.buscaParamGeral(10, '3') = '3' then nomeCampoCST := 'CST'
  else nomeCampoCST := 'CSOSN';

  dsproduto.FieldDefs.Add(nomeCampoCST, ftString, 10);
  dsproduto.FieldDefs.Add('UNID', ftString, 8);
  dsproduto.FieldDefs.Add('QUANT', ftCurrency);
  dsproduto.FieldDefs.Add('PRECO', ftCurrency);
  dsproduto.FieldDefs.Add('DESCONTO', ftCurrency);
  dsproduto.FieldDefs.Add('TOTAL', ftCurrency);
  dsproduto.FieldDefs.Add('BASEICMS', ftCurrency);
  dsproduto.FieldDefs.Add('ALIQICMS', ftString, 6);
  dsproduto.CreateDataSet;

  TCurrencyField(dsproduto.FieldByName('QUANT')).currency := false;
  TCurrencyField(dsproduto.FieldByName('PRECO')).currency := false;
  TCurrencyField(dsproduto.FieldByName('DESCONTO')).currency := false;
  TCurrencyField(dsproduto.FieldByName('TOTAL')).currency := false;
  TCurrencyField(dsproduto.FieldByName('BASEICMS')).currency := false;

  TCurrencyField(dsproduto.FieldByName('QUANT')).DisplayFormat := '#,###,###0.00';
  TCurrencyField(dsproduto.FieldByName('PRECO')).DisplayFormat := '#,###,###0.00';
  TCurrencyField(dsproduto.FieldByName('DESCONTO')).DisplayFormat := '#,###,###0.00';
  TCurrencyField(dsproduto.FieldByName('TOTAL')).DisplayFormat := '#,###,###0.00';
  TCurrencyField(dsproduto.FieldByName('BASEICMS')).DisplayFormat := '#,###,###0.00';

  dsproduto.FieldByName('cod').DisplayLabel  := 'Código';
  dsproduto.FieldByName('nome').DisplayLabel := 'Descrição';
  dsproduto.FieldByName('QUANT').DisplayLabel := 'Quantidade';
  dsproduto.FieldByName('PRECO').DisplayLabel := 'Preço';
  dsproduto.FieldByName('DESCONTO').DisplayLabel := 'Desconto';
  dsproduto.FieldByName('TOTAL').DisplayLabel := 'Total';
  dsproduto.FieldByName('BASEICMS').DisplayLabel := 'Base ICMS';
  dsproduto.FieldByName('ALIQICMS').DisplayLabel := 'Aliq. ICMS';

  for ini := 0 to lista.Count -1 do begin
    item := lista[ini];
    dsproduto.Append;
    dsproduto.fieldbyname('cod').AsInteger := item.cod;
    dsproduto.fieldbyname('nome').AsString := item.nome;
    dsproduto.fieldbyname('ncm').AsString  := item.Ncm;
    dsproduto.fieldbyname(nomeCampoCST).AsString := funcoes.aliquotaToCST(StrToInt(item.Aliq), funcoes.buscaParamGeral(10, '3'));
    dsproduto.fieldbyname('UNID').AsString  := item.unid;
    dsproduto.fieldbyname('QUANT').AsCurrency  := item.quant;
    dsproduto.fieldbyname('PRECO').AsCurrency  := item.p_venda;
    dsproduto.fieldbyname('DESCONTO').AsCurrency  := item.Desconto;
    dsproduto.fieldbyname('TOTAL').AsCurrency  := item.total;
    dsproduto.fieldbyname('BASEICMS').AsCurrency  := item.base_icm;
    dsproduto.fieldbyname('ALIQICMS').AsString  := item.Aliq;
  end;

  form33 := TForm33.Create(self);
  form33.DataSource1.DataSet := dsproduto;
  Form33.DBGrid1.DataSource  := form33.DataSource1;
  form33.ShowModal;
  form33.Free;
end;

function TForm79.buscaFinalidadeMaiorQue1 : String;
var
  i : integer;
  ies : String;
begin
  if FIN_NFE = '2' then
      nomeFIN_NFE := 'em complemento'
    else if FIN_NFE = '3' then
      nomeFIN_NFE := 'de Ajuste'
    else if FIN_NFE = '4' then
      nomeFIN_NFE := 'de Devolucao'
    else
      nomeFIN_NFE := 'Referenciada';

    DOC_REF := funcoes.dialogo('generico', 0, '12345', 50, true, 'S',
      Application.Title,
      'Será necessario referenciar um documento fiscal para completar esta operacao. '
      + #13 + 'Qual o tipo do documento (1-NF-e Emitida, 2-NFC-e Emitida, 3-NF-e de Compra, 4-Cupom Fiscal de ECF, 5-Produtor Rural)?',
      '1');
    if DOC_REF = '*' then begin
      Result := '*';
      exit;
    end;

    if funcoes.Contido(StrNum(DOC_REF), '1') then
    begin
      NFE_REF := funcoes.dialogo('generico', 0, '1234567890' + #8, 50, true, '',
        Application.Title,
        'Qual o numero da NF-e original a ser Complementada/Ajustada/Devolvida ?',
        '');
      if NFE_REF = '*' then begin
        Result := '*';
        exit;
      end;


      if finnfe.Text = '3' then begin
        estorno := funcoes.dialogo('generico', 0, 'SN', 50, true, 'S',
        Application.Title, 'Nota Fiscal de Estorno ?', 'S');
        if estorno = '*' then begin
          Result := '*';
          exit;
        end;
      end;

      NFE_REF := funcoes.recuperaChaveNFe(NFE_REF);
      if length(StrNum(NFE_REF)) = 44 then begin
        TAG_DOCREF := '<NFref><refNFe>' + StrNum(NFE_REF) + '</refNFe></NFref>';
        infoAdi := 'NF-e ' + nomeFIN_NFE + ' a NF-e Chave: ' +
          StrNum(NFE_REF) + ';';
        dadosAdic.Text := dadosAdic.Text + infoAdi;
      end;
    end
    else if funcoes.Contido(StrNum(DOC_REF), '23') then
    begin

      NFE_REF := funcoes.MensagemTextoInput
        ('Nota de Devolução. É Obrigatório informar as chaves das NFes que Deseja Devolver.', 'XX');
      nfeRefLista := tstringList.Create;
      nfeRefLista.text := NFE_REF;

      if trim(nfeRefLista.text) = '' then
      begin
        ShowMessage('Preencha a Chave da Nota que deseja Devolver!');
        Result := '*';
        exit;
      end;

      if FIN_NFE = '3' then
      begin
        natOP1 := funcoes.dialogo('normal', 3, '', 60, true, '', 'ControlW',
          'Descrição da Natureza da Operação:', '');
        if trim(natOP1) = '' then begin
          Result := '*';
          exit;
        end;

        if natOP1 = '*' then begin
          Result := '*';
          exit;
        end;
      end;

      TAG_DOCREF := '';

      if nfeRefLista.count > 0 then
      begin
        for i := 0 to nfeRefLista.count - 1 do
        begin
          NFE_REF := nfeRefLista[i];
          if length(StrNum(NFE_REF)) = 44 then
          begin
            TAG_DOCREF := TAG_DOCREF + '<NFref><refNFe>' + StrNum(NFE_REF) +
              '</refNFe>' + '</NFref>';
            infoAdi := infoAdi + StrNum(NFE_REF) + ';';
            dadosAdic.Text := dadosAdic.Text + infoAdi;
            // infoAdi := 'NF-e ' + nomeFIN_NFE + ' a NF-e Chave: ' +
            // StrNum(NFE_REF) + ';';
          end;
        end;

        if TAG_DOCREF <> '' then
        begin
          infoAdi := 'NF-e ' + nomeFIN_NFE + ' a NF-e Chave: ' + infoAdi;
          dadosAdic.Text := infoAdi;
        end;

      end;
    end
    else if funcoes.Contido(StrNum(DOC_REF), '4') then begin
      NUM_ECF := funcoes.dialogo('not', 0, '1234567890' + #8, 50, False, '',
        Application.Title, 'Informe o numero do ECF:', '');
      if NUM_ECF = '*' then begin
        Result := '*';
        exit;
      end;

      NUM_COO := funcoes.dialogo('not', 0, '1234567890' + #8, 50, False, '',
        Application.Title, 'Informe o numero do COO:', '');
      if NUM_COO = '*' then begin
        Result := '*';
        exit;
      end;

      TAG_DOCREF := '<NFref><refECF><mod>2D</mod><nECF>' + StrNum(NUM_ECF) +
        '</nECF>' + '<nCOO>' + StrNum(NUM_COO) + '</nCOO>' +
        '</refECF></NFref>';
      infoAdi := 'NF-e ' + nomeFIN_NFE + ' do ECF: ' + StrNum(NUM_ECF) +
        ' COO: ' + StrNum(NUM_COO) + ';';
      dadosAdic.Text := dadosAdic.Text + infoAdi;
    end
    else if funcoes.Contido(StrNum(DOC_REF), '5') then begin
      form73.ShowModal;
      if form73.nnf.text = '' then
      begin
        ShowMessage('Numero da Nota Fiscal Inválido!');
        Result := '*';
        exit;
      end;

      if form73.serie.text = '' then
      begin
        ShowMessage('Serie da Nota Fiscal Inválida!');
        Result := '*';
        exit;
      end;

      ies := StrNum(dm.IBselect.FieldByName('ies').AsString);
      if length(ies) < 5 then ies := 'ISENTO';

      TAG_DOCREF := '<NFref><refNFP><cUF>' +
      LeftStr(dm.IBselect.FieldByName('cod_mun').AsString, 2) + '</cUF>' +
      '<AAMM>' + FormatDateTime('yymm', now) + '</AAMM><CPF>' +
      StrNum(dm.IBselect.FieldByName('cnpj').AsString) + '</CPF>' + '<IE>' + ies
      + '</IE><mod>04</mod>' + '<serie>' + form73.serie.text + '</serie><nNF>' +
      form73.nnf.text + '</nNF></refNFP></NFref>';
    end;
end;

function TForm79.buscaComercioExterior : String;
begin
  cfop.Text := '7102';
  COD_PAIS := funcoes.VE_PAIS();
  Result := COD_PAIS;
end;

procedure TForm79.executa_proximo_ouVolta(key : word;primeiro, ultimo :boolean);
begin
  if ultimo <> true then begin
    if (Key = 40)then begin //baixo
      Perform (wm_nextdlgctl, 0, 0);
    end;
  end;

  if primeiro <> true then begin
    if (Key = 38) then begin //cima
      Perform (wm_nextdlgctl, 1, 0);
    end;
  end;
end;

function TForm79.buscaNFCE() : String;
var
  nCF, nCaixa, nota1 : String;
begin
  nCF := funcoes.dialogo('not', 300, '1234567890' + #8 + #32, 300, true, '',Application.Title, 'Qual o Número do Cupom Fiscal ?', '');
  if nCF = '*' then begin
    Result := '*';
    exit;
  end;

  nCaixa := funcoes.dialogo('not', 0, '1234567890' + #8 + #32, 50, true, '',Application.Title, 'Qual o Número do Caixa ?', '');
  if nCaixa = '*' then begin
    Result := '*';
    exit;
  end;

  STRZERO(nCF, 6);
  if length(nCaixa) <> 3 then nCaixa := STRZERO(nCaixa, 3);

  nota.Text := funcoes.buscaVendaNFCe(nCF, nCaixa, NFE_REF);
  if length(NFE_REF) = 44 then begin
    TAG_DOCREF := '<NFref><refNFe>' + StrNum(NFE_REF) + '</refNFe></NFref>';
    cupom := 1;
    dadosAdic.Text := 'NF-e emitida de mercadorias que ja sairam do documento fiscal: ' + StrNum(NFE_REF) + ';';
  end;
end;

procedure TForm79.acertaCFOP_Automatico;
begin
  dm.IBselect.Close;
  dm.IBselect.SQL.text := 'select est from registro';
  dm.IBselect.Open;

  UF_EMI := dm.IBselect.FieldByName('est').AsString;


  if UF_EMI = UF_DEST then begin
    if Contido(tiponfe.Text, 'ST') then begin
      cfop.Text := '5102';
      if cupom = 1 then cfop.Text := '5929';
      if finnfe.Text = '4' then cfop.Text := '5202';
    end
    else if tiponfe.Text = 'E' then begin
      cfop.Text := '1102';
      if finnfe.Text = '4' then cfop.Text := '1202';
    end;
  end
  else begin

    if Contido(tiponfe.Text, 'ST') then begin
      cfop.Text := '6102';
      if cupom = 1 then cfop.Text := '6929';
      if finnfe.Text = '4' then cfop.Text := '6202';
    end
    else begin
      cfop.Text := '2102';
      if finnfe.Text = '4' then cfop.Text := '2202';
    end;
  end;

  if destMercadoria.Text = '2' then cfop.Text := '7102';

end;

function TForm79.buscafrete() : string;
begin
  if funcoes.buscaParamGeral(15, '') = 'S' then begin
      if StrNum(FretePorConta.Text) <> '9' then
      begin
        form43 := tform43.Create(self);
        funcoes.AjustaForm(form43);

        form43.tipofrete.text := StrNum(FretePorConta.Text);
        form43.ShowModal;

        frete := form43.frete;

        if Contido(form43.tipofrete.text, '091') then
          FretePorConta.Text := form43.tipofrete.text;

        if form43.tipofrete.text <> '9' then
          vFrete := funcoes.dialogo('numero', 0, '190,.' + #8, 2, False, '',
            Application.Title, 'Qual o valor do Frete?', '0,00');
        if vFrete = '*' then
          exit;
      end;
    end;
end;

function TForm79.verificaSeExisteVendaValidaComNumeracao() : boolean;
var
  fim, i, ini : integer;
begin
  Result := false;
  Retorna_Array_de_Numero_de_Notas(notas, nota.Text, ' ', false);

  fim := notas.count - 1;
  i := 0;
  for ini := 0 to fim do begin
    if strnum(notas.Strings[ini]) <> '0' then begin
      dm.IBselect.Close;
      dm.IBselect.SQL.Clear;
      dm.IBselect.SQL.Add('select cliente from venda where (nota = ' +
      notas.Strings[ini] + ') and (cancelado = 0)');
      dm.IBselect.Open;

      if not dm.IBselect.IsEmpty then begin
        i := i + 1;

        if dm.IBselect.FieldByName('cliente').AsInteger > 0 then cliente.Text := dm.IBselect.FieldByName('cliente').AsString;
      end;
    end;
  end;

  if i = 0 then begin
    ShowMessage('Não Existe Vendas Com essa Numeração!');
    notas.Clear;
    exit;
  end
  else begin
    Result := true;
  end;
end;

function TForm79.salvaDadosAdic(opcao : integer = 0) : string;
begin
  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text := 'update or insert into nfe(nota, chave, data, estado, exportado, xml) values(' +
  '-10, '''', ''01.01.1950'', ''X'', -1, :xml) matching(nota)';
  dm.IBQuery1.ParamByName('xml').AsString := '';
  if opcao = 0 then dm.IBQuery1.ParamByName('xml').AsString := dadosAdic.Text;

  dm.IBQuery1.ExecSQL;
  dm.IBQuery1.Transaction.Commit;

  if opcao = 0 then ShowMessage('Dados Adicionais Salvo Com Sucesso!')
    else if opcao = 1 then begin
      dadosAdic.Text := '';
    end;
end;

function TForm79.buscaDadosAdic() : string;
begin
  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text := 'select * from nfe where nota = -10';
  dm.IBQuery1.Open;

  Result := dm.IBQuery1.FieldByName('xml').AsString;
  dm.IBQuery1.Close;

end;

procedure TForm79.atualizaNumeracaoGeneratorTela;
begin
  if TipoEmissao.Text = '1' then generator := 'NFE';
  if tipoEmissao.Text = '2' then generator := 'NFEHOMOLOGA';
    numnf.Text := Incrementa_Generator(generator, 0);
    if numnf.Text = '0' then begin
      numnf.Text := Incrementa_Generator(generator, 1);
    end;
end;

function TForm79.buscaCliente() : string;
begin

end;

end.

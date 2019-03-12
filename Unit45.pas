unit Unit45;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, JsEditCPF1, JsEditNumero1, StdCtrls, JsEdit1,
  JsEditInteiro1, ExtCtrls, Buttons, JsBotao1, untnfceForm;

type
  TdadosAdicSped = class(TForm)
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Panel3: TPanel;
    Label16: TLabel;
    JsBotao1: JsBotao;
    JsBotao2: JsBotao;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    nota: JsEditInteiro;
    fornec: JsEditInteiro;
    tipo: JsEditInteiro;
    cod_sit: JsEditInteiro;
    serie: JsEditInteiro;
    cfop: JsEditInteiro;
    tipofrete: JsEditInteiro;
    totfrete: JsEditNumero;
    totseg: JsEditNumero;
    totdesc: JsEditNumero;
    totdescnt: JsEditNumero;
    totdespaces: JsEditNumero;
    totpis: JsEditNumero;
    totcofins: JsEditNumero;
    TOTICMS_DESON: JsEditNumero;
    credicm: JsEditNumero;
    CREDICMS_REAIS: JsEditNumero;
    TOTICMSST: JsEditNumero;
    chavenfe: TMaskEdit;
    procedure notaKeyPress(Sender: TObject; var Key: Char);
    procedure JsBotao1Click(Sender: TObject);
    procedure chavenfeKeyPress(Sender: TObject; var Key: Char);
    procedure fornecKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tipoKeyPress(Sender: TObject; var Key: Char);
    procedure tipofreteKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JsBotao2Click(Sender: TObject);
    procedure notaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fornecKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure TOTICMSSTKeyPress(Sender: TObject; var Key: Char);
    procedure cod_sitKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    cnpjFornec : string;
    function validaPreenchimentos() : boolean;
    procedure insereOuAlteraDadosAdic();
    procedure limpaCampos();
    procedure excluiDadosAdic(chave : String);
    function preencheDados() : boolean;
    procedure buscaFornecedores(cod1 : String);
    procedure buscaCFOP;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dadosAdicSped: TdadosAdicSped;

implementation

uses Unit1, func, caixaLista, DB, principal, Unit63;

{$R *.dfm}
function TdadosAdicSped.preencheDados() : boolean;
begin
  Result := false;

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select NOME, cnpj from FORNECEDOR where COD = :cod');
  dm.IBselect.ParamByName('cod').AsString   := funcoes.StrNum(fornec.text);
  dm.IBselect.Open;

  self.Caption := 'Fornecedor: ' + dm.IBselect.fieldbyname('nome').AsString + '  CNPJ: ' + dm.IBselect.fieldbyname('cnpj').AsString;
  cnpjFornec   := StrNum(dm.IBselect.fieldbyname('cnpj').AsString);

  dm.IBselect.Close;
  dm.IBselect.SQL.Clear;
  dm.IBselect.SQL.Add('select * from SPEDDADOSADIC where nota = :nota and fornec = :fornec');
  dm.IBselect.ParamByName('nota').AsString   := funcoes.StrNum(nota.text);
  dm.IBselect.ParamByName('fornec').AsString := fornec.text;
  dm.IBselect.Open;

  if dm.IBselect.IsEmpty then
    begin
      dm.IBselect.Close;
      cod_sit.Text := '00';
      exit;
    end;

  cod_sit.Text     := dm.IBselect.fieldbyname('cod_sit').AsString;
  fornec.Text      := dm.IBselect.fieldbyname('fornec').AsString;
  nota.Text        := dm.IBselect.fieldbyname('nota').AsString;
  tipo.Text        := dm.IBselect.fieldbyname('tipo').AsString;
  serie.Text       := dm.IBselect.fieldbyname('serie').AsString;
  cfop.Text        := dm.IBselect.fieldbyname('cfop').AsString;
  serie.Text       := dm.IBselect.fieldbyname('serie').AsString;
  TIPOFRETE.Text   := dm.IBselect.fieldbyname('TIPOFRETE').AsString; //CREDICMS
  TOTICMSST.setValor(dm.IBselect.fieldbyname('TOTICMSST').AsCurrency); //CREDICMS

  TOTSEG.Text      := formataCurrency(dm.IBselect.fieldbyname('TOTSEG').AsCurrency);
  TOTDESC.Text     := formataCurrency(dm.IBselect.fieldbyname('TOTDESC').AsCurrency);
  TOTDESCNT.Text   := formataCurrency(dm.IBselect.fieldbyname('TOTDESCNT').AsCurrency);
  TOTDESPACES.Text := formataCurrency(dm.IBselect.fieldbyname('TOTDESPACES').AsCurrency);
  TOTPIS.Text      := formataCurrency(dm.IBselect.fieldbyname('TOTPIS').AsCurrency);
  TOTCOFINS.Text   := formataCurrency(dm.IBselect.fieldbyname('TOTCONFINS').AsCurrency);
  credicm.Text     := formataCurrency(dm.IBselect.fieldbyname('CREDICMS').AsCurrency);
  CHAVENFE.Text    := funcoes.formataChaveNFE(dm.IBselect.fieldbyname('CHAVENFE').AsString);
  TOTFRETE.Text    := formataCurrency(dm.IBselect.fieldbyname('TOTFRETE').AsCurrency);
  CREDICMS_REAIS.Text := formataCurrency(dm.IBselect.fieldbyname('CREDICMS_REAIS').AsCurrency);
  TOTICMS_DESON.Text  := formataCurrency(dm.IBselect.fieldbyname('TOTICMS_DESON').AsCurrency);

  Result := true;
end;

procedure TdadosAdicSped.limpaCampos();
begin
  JsEdit.LimpaCampos(self.Name);
  chavenfe.Text := '    .    .    .    .    .    .    .    .    .    .    ';
  nota.SetFocus;
end;

procedure TdadosAdicSped.insereOuAlteraDadosAdic();
begin
  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Clear;
  dm.IBQuery1.SQL.Add('update or insert into SPEDDADOSADIC(nota, cod_sit, fornec, tipo, serie, cfop, tipofrete, totseg, ' +
  ' totdesc, totdescnt, totdespaces, totpis, CREDICMS_REAIS, TOTICMS_DESON, totconfins, credicms, chavenfe, totfrete, TOTICMSST) values(:nota, :cod_sit, :fornec, :tipo, :serie, :cfop, :tipofrete, :totseg, ' +
  ':totdesc, :totdescnt, :totdespaces, :totpis, :CREDICMS_REAIS, :TOTICMS_DESON, :totcofins, :credicms, :chavenfe, :totfrete, :TOTICMSST) matching(nota, fornec)'  );
  dm.IBQuery1.ParamByName('nota').AsString          := nota.Text;
  dm.IBQuery1.ParamByName('cod_sit').AsString       := cod_sit.Text;
  dm.IBQuery1.ParamByName('fornec').AsString        := fornec.Text;
  dm.IBQuery1.ParamByName('tipo').AsString          := tipo.Text;
  dm.IBQuery1.ParamByName('serie').AsString         := serie.Text;
  dm.IBQuery1.ParamByName('cfop').AsString          := cfop.Text;
  dm.IBQuery1.ParamByName('tipofrete').AsString     := tipofrete.Text;
  dm.IBQuery1.ParamByName('totseg').AsCurrency      := totseg.getValor;
  dm.IBQuery1.ParamByName('totdesc').AsCurrency     := totdesc.getValor;
  dm.IBQuery1.ParamByName('totdescnt').AsCurrency   := totdescnt.getValor;
  dm.IBQuery1.ParamByName('totdespaces').AsCurrency := totdespaces.getValor;
  dm.IBQuery1.ParamByName('totpis').AsCurrency      := totpis.getValor;
  dm.IBQuery1.ParamByName('CREDICMS_REAIS').AsCurrency := CREDICMS_REAIS.getValor;
  dm.IBQuery1.ParamByName('TOTICMS_DESON').AsCurrency  := TOTICMS_DESON.getValor;
  dm.IBQuery1.ParamByName('totcofins').AsCurrency      := totcofins.getValor;
  dm.IBQuery1.ParamByName('credicms').AsCurrency       := credicm.getValor;
  dm.IBQuery1.ParamByName('chavenfe').AsString         := funcoes.StrNum(chavenfe.Text);
  dm.IBQuery1.ParamByName('totfrete').AsCurrency       := totfrete.getValor;
  dm.IBQuery1.ParamByName('TOTICMSST').AsCurrency      := TOTICMSST.getValor;
  dm.IBQuery1.ExecSQL;

  dm.IBQuery1.Transaction.Commit;

  limpaCampos();
end;

procedure TdadosAdicSped.notaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #27 then close; 
  if key = #13 then
    begin
      if nota.Text = '' then begin
        ShowMessage('Preenchimento Obrigatório!');
        abort;
      end;

      fornec.SetFocus;
      buscaFornecedores(nota.Text);
    end;
end;

procedure TdadosAdicSped.JsBotao1Click(Sender: TObject);
begin
  buscaCFOP;
  if not validaPreenchimentos then exit;
  insereOuAlteraDadosAdic();
end;

procedure TdadosAdicSped.chavenfeKeyPress(Sender: TObject; var Key: Char);
var
  cod, codbar : String;
  ret : smallint;
  arq : TStringList;
begin
  if key = #13 then
    begin
      if funcoes.testaChaveNFE(funcoes.StrNum(tedit(sender).Text)) then
        begin
          JsBotao1
          .SetFocus;
        end
       else
         begin
           ShowMessage('Chave Inválida!');
           key := #0;
           exit;
         end;
    end;
end;

procedure TdadosAdicSped.fornecKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key = 116) then
   begin
    tedit(sender).Text := funcoes.localizar1('Localizar Fornecedor','fornecedor','cod,nome','cod','','nome','nome',false,false,false,'','',300,sender);
   end;
end;

procedure TdadosAdicSped.tipoKeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13) then
 begin
   form39 := tform39.Create(self);
   form39.ListBox1.Items.Add('55 - NF-e 1');
   form39.ListBox1.Items.Add('01 - NF Modelo 1');
   form39.ListBox1.Items.Add('04 - NF Produtor');
   form39.ListBox1.Items.Add('05 - Nota Fiscal Avulsa');

   form39.buscaListaBox(tedit(sender).Text);
   tedit(sender).Text := funcoes.lista(Sender, false, 5);
   if tedit(sender).Text = '*' then
     begin
       tedit(sender).Text := '';
       key := #0;
     end;
  //tedit(sender).Text := funcoes.localizar('Tipo de Cliente','tipocli','cod,nome','cod','cod','nome','cod',false,false,false,'',300,sender);
end;

end;

procedure TdadosAdicSped.TOTICMSSTKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      key := #0;
      chavenfe.SetFocus;
    end;
end;

procedure TdadosAdicSped.tipofreteKeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13) then
 begin
   form39 := tform39.Create(self);
   form39.ListBox1.Items.Add('1 - Emitente');
   form39.ListBox1.Items.Add('2 - Destinatário');
   form39.ListBox1.Items.Add('9 - Sem Frete');

   form39.buscaListaBox(tedit(sender).Text);
   tedit(sender).Text := funcoes.lista(Sender, false, 5);
   if tedit(sender).Text = '*' then
     begin
       tedit(sender).Text := '';
       key := #0;
     end;
  //tedit(sender).Text := funcoes.localizar('Tipo de Cliente','tipocli','cod,nome','cod','cod','nome','cod',false,false,false,'',300,sender);
end;

end;

procedure TdadosAdicSped.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  jsedit.LiberaMemoria(self);
end;

procedure TdadosAdicSped.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  op  : TOpenDialog;
  arq :TStringList;
  ret : smallint;
begin
  if key = 119 then begin//F8 DOWNLOAD XML
    form63.imprimir := false;
    form63.ShowModal;
    if FileExists(form63.Arquivo) = false then
      begin
        ShowMessage('O Arquivo ' + form63.Arquivo + ' Não Existe!');
        exit;
      end;

    arq := TStringList.Create;
    arq.LoadFromFile(form63.Arquivo);
    ret := funcoes.insereDadosAdic(arq.GetText);
    chavenfe.Text := '    .    .    .    .    .    .    .    .    .    .    ';
    chavenfe.SelectAll;
    arq.Free;
  end;

  if key = 113 then
    begin
      op := TOpenDialog.Create(self);
      op.Filter := 'Arquivo NFE|*.xml';
      op.Execute;
      if op.FileName = '' then exit;

      arq := TStringList.Create;
      arq.LoadFromFile(op.FileName);
      ret := funcoes.insereDadosAdic(arq.GetText);
      chavenfe.Text := '    .    .    .    .    .    .    .    .    .    .    ';
      chavenfe.SelectAll;
      arq.Free;
    end;
end;

procedure TdadosAdicSped.FormShow(Sender: TObject);
begin
  nota.SetFocus;
end;

procedure TdadosAdicSped.JsBotao2Click(Sender: TObject);
begin
  if StrNum(chavenfe.Text) = '0' then
    begin
      ShowMessage('Preencha Corretamente a Chave!');
      chavenfe.SetFocus;
      exit;
    end;

  excluiDadosAdic(chavenfe.Text);
  limpaCampos;
  ShowMessage('Exclusão Efetuada com Sucesso!');
end;

procedure TdadosAdicSped.cod_sitKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then begin
   form39 := tform39.Create(self);
   form39.ListBox1.Items.Add('00 - Documento regular');
   form39.ListBox1.Items.Add('01 - Documento regular extemporâneo');
   form39.ListBox1.Items.Add('02 - Documento cancelado');
   form39.ListBox1.Items.Add('03 - Documento cancelado extemporâneo');
   form39.ListBox1.Items.Add('04 - NF-e ou CT-e - Denegado');
   form39.ListBox1.Items.Add('05 - NF-e ou CT-e - Numeração inutilizada');
   form39.ListBox1.Items.Add('06 - Documento Fiscal Complementar');
   form39.ListBox1.Items.Add('07 - Documento Fiscal Complementar extemporâneo');
   form39.ListBox1.Items.Add('03 - Documento cancelado extemporâneo');

   form39.buscaListaBox(tedit(sender).Text);
   tedit(sender).Text := funcoes.lista(Sender, false, 5);
   if tedit(sender).Text = '*' then
     begin
       tedit(sender).Text := '';
       key := #0;
     end;
  end;
end;

procedure TdadosAdicSped.excluiDadosAdic(chave : String);
begin
  dm.IBQuery1.Close;
  dm.IBQuery1.SQL.Text := 'delete from SPEDDADOSADIC where chavenfe = :chave';
  dm.IBQuery1.ParamByName('chave').AsString := StrNum(chave);
  dm.IBQuery1.ExecSQL;
  dm.IBQuery1.Transaction.Commit;
end;

procedure TdadosAdicSped.notaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key = 116) then
   begin
    tedit(sender).Text := funcoes.localizar1('Localizar Dados Adicionais','SPEDDADOSADIC',' * ','nota','','','',false,false,false,'','', 300,sender);
   end;
end;

procedure TdadosAdicSped.fornecKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      if tedit(sender).Text = '' then
        begin
          tedit(sender).Text := funcoes.localizar('Localizar Fornecedor','fornecedor','cod,nome, cnpj, estado','cod','','nome','nome',true,false,false,'',300, nil);
        end;
          
      preencheDados;
      buscaCFOP;
    end;
end;

procedure TdadosAdicSped.buscaFornecedores(cod1 : String);
var
  forn : String;
begin
  if cod1 = '' then exit;

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select e.nota, e.fornec, f.nome, e.serie, e.CFOP, e.CHAVENFE from SPEDDADOSADIC e' +
  ' left join fornecedor f on (e.fornec = f.cod) where e.nota = :nota';
  dm.IBselect.ParamByName('nota').AsInteger := StrToInt(StrNum(cod1));
  dm.IBselect.Open;
  dm.IBselect.FetchAll;

  if dm.IBselect.IsEmpty then
    begin
      dm.IBselect.Close;
      exit;
    end;

  if dm.IBselect.RecordCount > 1 then
    begin
      forn := funcoes.busca(dm.ibselect,'fornec','fornec', 'fornec', 'fornec');
    end
  else
    begin
      forn := dm.IBselect.FieldByName('fornec').AsString;
    end;

  if forn <> '' then fornec.Text := forn;
  dm.IBselect.Close;
end;

procedure TdadosAdicSped.FormCreate(Sender: TObject);
begin
  funcoes.AjustaForm(self);
end;

function TdadosAdicSped.validaPreenchimentos() : boolean;
var
  cnpjnovo, codNovo, NomeNovo : String;
begin
  Result := false;

  if length(trim(serie.Text)) = 0 then begin
    ShowMessage('Série Inválida');
    serie.SetFocus;
    exit;
  end;

  if length(trim(tipo.Text)) = 0 then begin
    ShowMessage('Tipo Inválido');
    tipo.SetFocus;
    exit;
  end;

  if length(strnum(cfop.Text)) <> 4 then begin
    ShowMessage('CFOP Inválido');
    cfop.SetFocus;
    exit;
  end
  else begin
    if not validacfop(cfop.Text) then begin
      ShowMessage('CFOP Inválido!' + #13 + 'O CFOP ' + cfop.Text + ' Não Existe!');
      cfop.SetFocus;
      exit;
    end;
  end;


  if trim(tipofrete.Text) = '' then begin
    ShowMessage('Preencha Tipo do Frete!');
    tipofrete.SetFocus;
    exit;
  end;

  if ((nota.Text = '') or (fornec.Text = '')) then
    begin
      nota.Enabled := true;
      nota.SetFocus;
      exit;
    end;

  {if ((cnpjFornec <> copy(strnum(chavenfe.Text), 7, 14)) and (strnum(chavenfe.Text) <> '0')) then
    begin
      cnpjnovo := funcoes.formataCNPJ(copy(strnum(chavenfe.Text), 7, 14));
      dm.IBselect.Close;
      dm.IBselect.SQL.Text := 'select cod, nome, cnpj from fornecedor where cnpj = :cnpj';
      dm.IBselect.ParamByName('cnpj').AsString := cnpjnovo;
      dm.IBselect.Open;

      if dm.IBselect.IsEmpty then
        begin
          if MessageDlg('O CNPJ do Fornecedor Não Confere com A chave da Nota!' + #13 +
          'Cnpj do Fornec.: ' + funcoes.formataCNPJ(cnpjFornec) + #13 +
          'Cnpj da Chave  : ' + cnpjnovo + #13 + #13 + 'Deseja Continuar ?', mtWarning, [mbyes, mbno], 1) = idno then
          exit;
        end;

      codNovo  := dm.IBselect.FieldByName('cod').AsString;
      NomeNovo := dm.IBselect.FieldByName('nome').AsString;
      if MessageDlg('O Fornecedor Desta Nota Não Foi Preenchido Corretamente!' + #13 +
      'Cnpj do Fornec.: ' + cnpjFornec + #13 +
      'Cnpj da Chave  : ' + cnpjnovo + #13 +
      'Fornecedor Encontrado: ' + dm.IBselect.fieldbyname('cod').AsString + ' - ' + dm.IBselect.fieldbyname('nome').AsString + #13 + #13 +
      'Deseja Troca o Fornecedor Deste Lançamento por Este ?', mtWarning, [mbYes, mbNo], 1) = mryes then
        begin
          dm.IBQuery2.Close;
          dm.IBQuery2.SQL.Text := ('select e.nota, e.fornec, e.TOTAL_NOTA,  '+
          '(select count(*) from item_entrada i where e.nota = i.nota and e.fornec = i.fornec) as qtd'+
          ' from entrada e where e.nota = :nota and e.fornec = :fornec');
          dm.IBQuery2.ParamByName('nota').AsString   := StrNum(nota.text);
          dm.IBQuery2.ParamByName('fornec').AsString := StrNum(fornec.text);
          dm.IBQuery2.Open;

          if not dm.IBQuery2.IsEmpty then begin
            if MessageDlg('Deseja Trocar o FORNECEDOR da entrada ' + StrNum(nota.text) + ' ?' + #13 +
            'Fornec. Atual: Cód. ' + fornec.Text + #13 +
            'Fornec. Novo : Cód. ' + codNovo + ' - ' + NomeNovo, mtWarning, [mbYes, mbNo], 1) = mryes then begin
              dm.IBQuery1.Close;
              dm.IBQuery1.SQL.Text := 'update entrada set fornec = :fornec where nota = :nota and fornec = :fornec1';
              dm.IBQuery1.ParamByName('fornec').AsString  := strnum(codNovo);
              dm.IBQuery1.ParamByName('nota').AsString    := strnum(nota.Text);
              dm.IBQuery1.ParamByName('fornec1').AsString := strnum(fornec.Text);
              dm.IBQuery1.ExecSQL;

              dm.IBQuery1.Close;

              dm.IBQuery1.SQL.Text := 'update item_entrada set fornec = :fornec where nota = :nota and fornec = :fornec1';
              dm.IBQuery1.ParamByName('fornec').AsString  := strnum(codNovo);
              dm.IBQuery1.ParamByName('nota').AsString    := strnum(nota.Text);
              dm.IBQuery1.ParamByName('fornec1').AsString := strnum(fornec.Text);
              dm.IBQuery1.ExecSQL;
              dm.IBQuery1.Transaction.Commit;

              ShowMessage('Fornecedor da Entrada ' + strnum(nota.Text) + ' Foi alterado para ' + strnum(codNovo));
            end;
          end;

          fornec.Text := codNovo;
          cnpjFornec  := cnpjnovo;
          Result := true;
        end;
      dm.IBselect.Close;
      exit;
    end
  else Result := true;   }
  Result := true;
end;


procedure TdadosAdicSped.buscaCFOP;
var
  uf_emit, uf_fornec : String;
begin
  if cfop.Text <> '' then exit;

  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select est from registro';
  dm.IBselect.Open;

  uf_emit := dm.IBselect.FieldByName('est').AsString;
  dm.IBselect.Close;
  dm.IBselect.SQL.Text := 'select estado from fornecedor where cod = :cod';
  dm.IBselect.ParamByName('cod').AsString := StrNum(fornec.Text);
  dm.IBselect.Open;

  uf_fornec := dm.IBselect.FieldByName('estado').AsString;
  dm.IBselect.Close;

  cfop.Text := '1102';
  if uf_emit <> uf_fornec then cfop.Text := '2102';
end;

end.


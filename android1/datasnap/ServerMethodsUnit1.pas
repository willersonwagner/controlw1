unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth, unit1, DBXJSON,
 Data.DB, system.JSON, uclasses, dialogs, shellapi, forms;

type
{$METHODINFO ON}
  TServerMethods1 = class(TComponent)
  private
    { Private declarations }
  public
    { Public declarations }
    erro : integer;
    function insereVendas(const lista : TlistaVendas; const  usuario : String) : String;
    function getProdutos()  : TJSONValue;
    function getProdutos1() : TlistaProdutos;
    function getFormas() : TlistaFormas;
    function getcliente(cnpj: string) : Tcliente;
    function getUsuarios() : TlistaUsuario;
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    procedure execSql(const sql : string);
    function soma(v1, v2 : currency) : TJSONValue;
    function RecordCountProdutosInteger() : Integer;
  end;
{$METHODINFO OFF}

implementation


uses System.StrUtils;

function TServerMethods1.insereVendas(const lista : TlistaVendas; const  usuario : String) : String;
var
  ini, i, fimI, fimV, nota, cliente : integer;
  totPrest, totItemV, totItemC, entrada, total : currency;
  clienteNome : String;
  notasImp : TStringList;
  const sqlVenda : String = 'insert into venda(nota, entrada, desconto, data, cliente, total, vendedor' +
  ', codhis, usuario, hora, datamov, tipo) values(:nota, :entrada, :desconto, :data, :cliente, :total, :vendedor, :codhis, :usuario, :hora, :datamov, ''V'')';
begin
  Result := '';
  form1.adicionaMemo('Serviço: Sincronização de Vendas');
  form1.adicionaMemo('Usuário: ' + usuario);
  form1.adicionaMemo('Data:' + FormatDateTime('dd/mm/yyyy hh:mm:ss', now));
  form1.adicionaMemo('--------------------------------------');
  Result := '';
  fimV   := Length(lista.listaVenda) -1;

  Form1.IBQuery1.Close;
  Form1.IBQuery1.SQL.Text := sqlVenda;

  //+funcoes.novocod('creceber')+
  form1.IBQuery2.Close;
  form1.IBQuery2.SQL.Text := 'insert into contasreceber(nota,codgru, cod,formpagto,datamov,vendedor,data,vencimento,documento,codhis,historico,total,valor)' +
  'values(:nota, 1, :cod, :codhis, :datamov, :vendedor,:data, :vencimento,:documento,2,:hist,:total,:valor)';

  form1.IBQuery3.Close;
  form1.IBQuery3.SQL.Text := 'insert into item_venda(data,nota,COD, QUANT, p_venda,total,origem,p_compra,codbar,aliquota, unid)' +
  ' values(:data,:nota,:cod, :quant, :p_venda,:total,:origem,:p_compra, :codbar,:aliq, :unid)';

  form1.IBTransaction1.StartTransaction;

  //ShowMessage('recCount = ' + IntToStr(fimV));

  notasImp := TStringList.Create;

  for ini := 0 to fimV do
    begin
      erro    := 0;
      entrada := 0;
      total   := lista.listaVenda[ini].total;
      try
      nota    := StrToIntDef(form1.Incrementa_Generator('venda', 1), 1);
      cliente := form1.insereClienteRetornaCodigo(lista.listaVenda[ini].cliente, clienteNome, erro);

      if lista.listaVenda[ini].parcelamento <> nil then
        begin
          entrada := lista.listaVenda[ini].parcelamento.entrada;
          //total   := lista.listaVenda[ini].total - entrada;
          total   := lista.listaVenda[ini].total;
          totPrest := ((total) / lista.listaVenda[ini].parcelamento.qtdprest);
          for I := 1 to lista.listaVenda[ini].parcelamento.qtdprest do
            begin
              form1.IBQuery2.Close;
              form1.IBQuery2.ParamByName('nota').AsInteger       := nota;
              form1.IBQuery2.ParamByName('cod').AsString         := form1.Incrementa_Generator('creceber', 1);
              form1.IBQuery2.ParamByName('codhis').AsInteger     := lista.listaVenda[ini].codhis;
              form1.IBQuery2.ParamByName('datamov').AsDate       := now;
              form1.IBQuery2.ParamByName('vendedor').AsInteger    := lista.listaVenda[ini].vendedor;
              form1.IBQuery2.ParamByName('data').AsDate          := lista.listaVenda[ini].parcelamento.data;
              if i = 1 then form1.IBQuery2.ParamByName('vencimento').AsDate := lista.listaVenda[ini].parcelamento.vencimento
                else form1.IBQuery2.ParamByName('vencimento').AsDate := lista.listaVenda[ini].parcelamento.vencimento + lista.listaVenda[ini].parcelamento.periodo;
              form1.IBQuery2.ParamByName('documento').AsInteger    := lista.listaVenda[ini].vendedor;
              form1.IBQuery2.ParamByName('hist').AsString        := Form1.CompletaOuRepete(copy(IntToStr(nota) +'-'+clienteNome,1,28 ),Form1.CompletaOuRepete('',IntToStr(i),' ',2)+'/'+
              form1.CompletaOuRepete('', IntToStr(lista.listaVenda[ini].parcelamento.qtdprest),' ',2),' ',35);
              form1.IBQuery2.ParamByName('total').AsCurrency       := totPrest;
              form1.IBQuery2.ParamByName('valor').AsCurrency       := totPrest;

              try
                form1.IBQuery2.ExecSQL;
              except
              on e:exception do
                begin
                  erro := 1;
                  form1.adicionaMemo('ERRO: ' + e.Message + #13 + ' PARCELAMENTO' + #13 + '-----------------------' + #13);
                end;
              end;
            end;
        end;


      if lista.listaVenda[ini].imprime = 'S' then notasImp.Add(IntToStr(nota));
      //notasImp.Add(IntToStr(nota) + '=' + CurrToStr(lista.listaVenda[ini].total));


      form1.IBQuery1.SQL.Text := sqlVenda;
      form1.IBQuery1.Close;
      form1.IBQuery1.ParamByName('nota').AsInteger      := nota;
      form1.IBQuery1.ParamByName('entrada').AsCurrency  := entrada;
      form1.IBQuery1.ParamByName('desconto').AsCurrency := lista.listaVenda[ini].desconto;
      form1.IBQuery1.ParamByName('data').AsDate         := lista.listaVenda[ini].data;
      form1.IBQuery1.ParamByName('cliente').AsInteger   := cliente;
      form1.IBQuery1.ParamByName('total').AsCurrency    := total;
      form1.IBQuery1.ParamByName('vendedor').AsInteger  := lista.listaVenda[ini].vendedor;
      form1.IBQuery1.ParamByName('codhis').AsInteger    := lista.listaVenda[ini].codhis;
      form1.IBQuery1.ParamByName('usuario').AsInteger   := lista.listaVenda[ini].usuario;
      form1.IBQuery1.ParamByName('hora').AsTime         := lista.listaVenda[ini].data;
      form1.IBQuery1.ParamByName('datamov').AsTime      := lista.listaVenda[ini].data;
      try
        form1.IBQuery1.ExecSQL;
      except
        on e:exception do
          begin
            erro := 1;
            form1.adicionaMemo('ERRO: ' + e.Message + #13 + ' na Venda' + #13 + '-----------------------' + #13);
          end;
      end;

      fimI := Length(lista.listaVenda[ini].itensV) - 1;
      for I := 0 to fimI do
        begin
          form1.IBQuery1.Close;
          form1.IBQuery1.SQL.Text := 'select codbar, aliquota, unid, p_compra from produto where cod = :cod';
          form1.IBQuery1.ParamByName('cod').AsInteger    := lista.listaVenda[ini].itensV[i].cod;
          form1.IBQuery1.Open;

          totItemV := (lista.listaVenda[ini].itensV[i].p_venda * lista.listaVenda[ini].itensV[i].quant);
          totItemC := (form1.IBQuery1.FieldByName('p_compra').AsCurrency * lista.listaVenda[ini].itensV[i].quant);

          form1.IBQuery3.Close;
          form1.IBQuery3.ParamByName('data').AsDateTime     := lista.listaVenda[ini].data;
          form1.IBQuery3.ParamByName('nota').AsInteger      := nota;
          form1.IBQuery3.ParamByName('cod').AsInteger       := lista.listaVenda[ini].itensV[i].cod;
          form1.IBQuery3.ParamByName('quant').AsCurrency    := lista.listaVenda[ini].itensV[i].quant;
          form1.IBQuery3.ParamByName('p_venda').AsCurrency  := lista.listaVenda[ini].itensV[i].p_venda;

          form1.IBQuery3.ParamByName('total').AsCurrency    := totItemV;
          form1.IBQuery3.ParamByName('origem').AsString    := '1';
          form1.IBQuery3.ParamByName('p_compra').AsCurrency := totItemC;
          form1.IBQuery3.ParamByName('codbar').AsString     := form1.IBQuery1.FieldByName('codbar').AsString;
          form1.IBQuery3.ParamByName('aliq').AsString       := copy(form1.IBQuery1.FieldByName('aliquota').AsString, 1, 2);
          form1.IBQuery3.ParamByName('unid').AsString       := form1.IBQuery1.FieldByName('unid').AsString;
          try
            form1.IBQuery3.ExecSQL;
          except
            on e:exception do
              begin
                erro := 1;
                form1.adicionaMemo('ERRO: ' + e.Message + #13 + ' ITEM_VENDA' + #13 + '-----------------------' + #13);
              end;
          end;
          form1.IBQuery1.Close;
        end;
      finally
        if erro = 0 then
          begin
            Result := Result + IntToStr(lista.listaVenda[ini].nota) + '-';
            //ShowMessage(Result);
          end;
      end;
    end;
    form1.IBTransaction1.Commit;

    if notasImp.Count > 0 then begin
      notasimp.SaveToFile(ExtractFileDir(ParamStr(0)) + '\notas.imp');
      notasimp.Free;

      ShellExecute(Application.Handle,'open',pchar(ExtractFileDir(ParamStr(0)) + '\controlw.exe'),nil,nil,1);
    end
    else begin
      notasimp.Free;
    end;

end;

function TServerMethods1.getcliente(cnpj: string) : Tcliente;
var
  recNo : integer;
  cliente : Tcliente;
begin
  form1.adicionaMemo('Requisição de sincronização de Cliente ' + cnpj);
  if Length(trim(cnpj)) = 11 then cnpj := form1.formataCPF(cnpj)
    else cnpj := form1.formataCNPJ(cnpj);

  cliente := Tcliente.create();
  form1.IBQuery1.close;
  form1.IBQuery1.SQL.Clear;
  form1.IBQuery1.SQL.Add('select cod, nome, tipo, ende, bairro, cep, est, ies, cid, telres, telcom, titular from cliente where cnpj = :cnpj');
  form1.IBQuery1.ParamByName('cnpj').AsString := (cnpj);
  form1.IBQuery1.Open;
  form1.IBQuery1.FetchAll;

  form1.IBQuery1.First;
  recNo := -1;

  cliente.cod := -1;

  if (form1.IBQuery1.IsEmpty = false) then begin
    recNo := recNo + 1;
    cliente.cod  := form1.IBQuery1.FieldByName('cod').AsInteger;
    cliente.nome := form1.IBQuery1.FieldByName('nome').AsString;
    cliente.titular := form1.IBQuery1.FieldByName('titular').AsString;
    cliente.cnpj    := cnpj;
    cliente.tipo    := form1.IBQuery1.FieldByName('tipo').AsString;
    cliente.ende    := form1.IBQuery1.FieldByName('ende').AsString;
    cliente.bairro    := form1.IBQuery1.FieldByName('bairro').AsString;
    cliente.ies       := form1.IBQuery1.FieldByName('ies').AsString;
    cliente.est       := form1.IBQuery1.FieldByName('est').AsString;
    cliente.cid       := form1.IBQuery1.FieldByName('cid').AsString;
    cliente.telres    := form1.IBQuery1.FieldByName('telres').AsString;
    cliente.telcom    := form1.IBQuery1.FieldByName('telcom').AsString;
    cliente.cep       := form1.IBQuery1.FieldByName('cep').AsString;

    form1.adicionaMemo('Cliente Encontrado Cód:: ' + IntToStr(cliente.cod));
  end
  else begin
    form1.adicionaMemo('Nenhum Cliente Encontrado : ' + cnpj);
  end;

  form1.IBQuery1.Close;
  Result := cliente;
end;



function TServerMethods1.getUsuarios() : TlistaUsuario;
var
  recNo : integer;
  lista : TlistaUsuario;
begin
  form1.adicionaMemo('Requisição de sincronização de Usuários');
  lista := TlistaUsuario.create();
  form1.IBQuery1.close;
  form1.IBQuery1.SQL.Clear;
  form1.IBQuery1.SQL.Add('select cod, nome, usu, senha, vendedor, configu, acesso from USUARIO where excluido = 0');
  form1.IBQuery1.Open;
  form1.IBQuery1.FetchAll;

  SetLength(lista.listaUsuario, form1.IBQuery1.RecordCount);
  form1.IBQuery1.First;
  recNo := -1;

  while not form1.IBQuery1.Eof do
    begin
      recNo := recNo + 1;
      lista.listaUsuario[recNo]             := TUsuario.Create;
      lista.listaUsuario[recNo].cod         := form1.IBQuery1.FieldByName('cod').AsInteger;
      lista.listaUsuario[recNo].codVendedor := form1.IBQuery1.FieldByName('vendedor').AsInteger;
      lista.listaUsuario[recNo].nome        := form1.IBQuery1.FieldByName('nome').AsString;
      lista.listaUsuario[recNo].senha       := form1.DesCriptografar(form1.IBQuery1.FieldByName('senha').AsString);
      lista.listaUsuario[recNo].usu         := form1.DesCriptografar(form1.IBQuery1.FieldByName('usu').AsString);
      lista.listaUsuario[recNo].acesso      := form1.IBQuery1.FieldByName('acesso').AsString;
      lista.listaUsuario[recNo].configu     := form1.IBQuery1.FieldByName('configu').AsString;
      form1.IBQuery1.Next;
    end;

  form1.IBQuery1.Close;
  Result := lista;
end;


function TServerMethods1.getFormas() : TlistaFormas;
var
  recNo : integer;
  lista : TlistaFormas;
begin
  form1.adicionaMemo('Requisição de sincronização de Formas de Pagamento');
  lista := TlistaFormas.create();
  form1.IBQuery1.close;
  form1.IBQuery1.SQL.Clear;
  form1.IBQuery1.SQL.Add('select cod, nome from FORMPAGTO');
  form1.IBQuery1.Open;
  form1.IBQuery1.FetchAll;

  SetLength(lista.listaFormas, form1.IBQuery1.RecordCount);
  form1.IBQuery1.First;
  recNo := -1;

  while not form1.IBQuery1.Eof do
    begin
      recNo := recNo + 1;
      lista.listaFormas[recNo]          := Tforma.Create;
      lista.listaFormas[recNo].cod      := form1.IBQuery1.FieldByName('cod').AsInteger;
      lista.listaFormas[recNo].nome     := form1.IBQuery1.FieldByName('nome').AsString;
      form1.IBQuery1.Next;
    end;

  form1.IBQuery1.Close;
  Result := lista;
end;

function TServerMethods1.getProdutos1() : TlistaProdutos;
var
  recNo : integer;
  lista : TlistaProdutos;
begin
  form1.adicionaMemo('Requisição de sincronização de Produtos');
  lista := TlistaProdutos.create();
  form1.IBQuery1.close;
  form1.IBQuery1.SQL.Clear;
  form1.IBQuery1.SQL.Add('select cod, nome, codbar, p_compra, p_venda, obs, p_venda1 from produto');
  form1.IBQuery1.Open;
  form1.IBQuery1.FetchAll;

  SetLength(lista.listaProdutos, form1.IBQuery1.RecordCount);
  form1.IBQuery1.First;
  recNo := -1;

  while not form1.IBQuery1.Eof do
    begin
      recNo := recNo + 1;
      lista.listaProdutos[recNo]          := Tproduto.Create;
      lista.listaProdutos[recNo].cod      := form1.IBQuery1.FieldByName('cod').AsInteger;
      lista.listaProdutos[recNo].nome     := copy(form1.IBQuery1.FieldByName('nome').AsString, 1, 40);
      lista.listaProdutos[recNo].codbar   := form1.IBQuery1.FieldByName('codbar').AsString;
      lista.listaProdutos[recNo].p_compra := form1.IBQuery1.FieldByName('p_compra').AsCurrency;
      lista.listaProdutos[recNo].p_venda  := form1.IBQuery1.FieldByName('p_venda').AsCurrency;
      lista.listaProdutos[recNo].p_venda1 := form1.IBQuery1.FieldByName('p_venda1').AsCurrency;
      lista.listaProdutos[recNo].obs      := form1.IBQuery1.FieldByName('obs').AsString;

      form1.IBQuery1.Next;
    end;

  form1.IBQuery1.Close;
  Result :=lista;
end;

function TServerMethods1.RecordCountProdutosInteger() : Integer;
begin
  Result := 0;
  form1.IBQuery1.close;
  form1.IBQuery1.SQL.Clear;
  form1.IBQuery1.SQL.Add('select cod from produto');
  form1.IBQuery1.Open;
  form1.IBQuery1.FetchAll;

  Result := form1.IBQuery1.RecordCount;
  form1.IBQuery1.Close;
end;

function TServerMethods1.soma(v1, v2 : currency) : TJSONValue;
begin
  exit(TJSONNumber.Create(v1 + v2));
end;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.getProdutos() : TJSONValue;
var
  recNo : integer;
  lista : TlistaProdutos;
begin
  form1.adicionaMemo('Requisição de sincronização de Produtos');
  lista := TlistaProdutos.create();
  form1.IBQuery1.close;
  form1.IBQuery1.SQL.Clear;
  form1.IBQuery1.SQL.Add('select cod, nome, codbar, p_compra, p_venda, obs, p_venda1 from produto');
  form1.IBQuery1.Open;
  form1.IBQuery1.FetchAll;

  SetLength(lista.listaProdutos, form1.IBQuery1.RecordCount);
  form1.IBQuery1.First;
  recNo := -1;

  while not form1.IBQuery1.Eof do
    begin
      recNo := recNo + 1;
      lista.listaProdutos[recNo]          := Tproduto.Create;
      lista.listaProdutos[recNo].cod      := form1.IBQuery1.FieldByName('cod').AsInteger;
      lista.listaProdutos[recNo].nome     := copy(form1.IBQuery1.FieldByName('nome').AsString, 1, 40);
      lista.listaProdutos[recNo].codbar   := form1.IBQuery1.FieldByName('codbar').AsString;
      lista.listaProdutos[recNo].p_compra := form1.IBQuery1.FieldByName('p_compra').AsCurrency;
      lista.listaProdutos[recNo].p_venda  := form1.IBQuery1.FieldByName('p_venda').AsCurrency;
      lista.listaProdutos[recNo].p_venda1 := form1.IBQuery1.FieldByName('p_venda1').AsCurrency;
      lista.listaProdutos[recNo].obs      := form1.IBQuery1.FieldByName('obs').AsString;

      form1.IBQuery1.Next;
    end;

  form1.IBQuery1.Close;
  Result := ListaProdutosToJSON(lista);
end;

procedure TServerMethods1.execSql(const sql : string);
begin
 { if not form1.iBDatabase1.Connected then
    begin
      ShowMessage('BD não está conectado!');
      exit;
    end;
  }
  try
    form1.IBQuery1.close;
    form1.IBQuery1.SQL.Clear;
    form1.IBQuery1.SQL.Add(sql);
    form1.IBQuery1.ExecSQL;

    form1.IBTransaction1.Commit;
  except
  end;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;



end.


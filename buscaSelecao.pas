unit buscaSelecao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBClient, untNfce, jsedit1,FireDAC.Comp.Client;

type
  TForm33 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
     procedure marcaOK;
    { Private declarations }
  public
    campobusca:string;
    campolocalizaca:string;
    campos, LinhasMarcadas, captionficha: string;
    ficha : boolean;
    saldo : currency;
    cod1   : integer;

    txt : AnsiString;

    { Public declarations }
  end;

var
  Form33: TForm33;

implementation

uses Unit1, func, Unit2, imprime1, relatorio, principal, Unit63, StrUtils,
  Unit45, cadproduto, nfe, Unit78, Unit92, dadosnfe;

{$R *.dfm}

procedure TForm33.DBGrid1KeyPress(Sender: TObject; var Key: Char);
var
  form999 : TForm9;
var
  doc, ch : String;
  a, c, b : integer;
  key1    : char;
  val, total, ent : currency;
  query : TFDQuery;
begin
  if campobusca = 'ncmclassif' then begin
    if key = #13 then begin
      doc := funcoes.dialogo('normal',0,'',2,true,'',Application.Title,'Qual o Novo NCM ?', '');
      if length(trim(doc)) <> 8 then begin
        ShowMessage('NCM Inv�lido!');
        exit;
      end;

      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Text := 'update produto set classif = :cla where cod = :cod';
      dm.IBQuery1.ParamByName('cla').AsString  := doc;
      dm.IBQuery1.ParamByName('cod').AsInteger := DBGrid1.DataSource.DataSet.FieldByName('cod').AsInteger;
      dm.IBQuery1.ExecSQL;
      dm.IBQuery1.Transaction.Commit;

      DBGrid1.DataSource.DataSet.Delete;

      form2.dataset.SaveToFile('ncm.xml');

      exit;
    end;
  end;




  if ((campolocalizaca = 'entregador') or (campolocalizaca = 'cod_seq')) then begin
   if key = #13 then begin
     funcoes.retornoLocalizar := DBGrid1.DataSource.DataSet.FieldByName(campolocalizaca).AsString;
     close;
   end;

   if key = #27 then begin
     funcoes.retornoLocalizar := '*';
     close;
   end;
   exit;
 end;



  if campobusca = 'dataVenda' then begin
    if key = #13 then begin
      ch := funcoes.dialogo('data',0,'',2,true,'',Application.Title,'Qual a Data ?', FormatDateTime('dd/mm/yy', DBGrid1.DataSource.DataSet.FieldByName('data').AsDateTime));
      if ch = '*' then exit;

      dm.IBQuery1.close;
      dm.IBQuery1.SQL.Text := 'update venda set data = :data where nota = :nota';
      dm.IBQuery1.ParamByName('data').AsDate   := StrToDate(ch);
      doc := DBGrid1.DataSource.DataSet.FieldByName('nota').AsString;
      dm.IBQuery1.ParamByName('nota').AsString := doc;
      dm.IBQuery1.ExecSQL;
      dm.IBQuery1.Transaction.Commit;

      DBGrid1.DataSource.DataSet.Close;
      DBGrid1.DataSource.DataSet.Open;
      DBGrid1.DataSource.DataSet.Locate('nota', doc, []);

      exit;
    end;
  end;



 if campolocalizaca = 'nfeB' then begin
   if key = #13 then begin
     funcoes.retornoLocalizar := copy(DBGrid1.DataSource.DataSet.FieldByName('chave').AsString, 26, 9);
     close;
   end;

   if key = #27 then begin

     funcoes.retornoLocalizar := '';
     close;
   end;
   exit;
 end;


 if campolocalizaca = 'nfceX' then begin
   if UpCase(key) = 'I' then begin
     doc := IntToStr(StrToInt(copy(DBGrid1.DataSource.DataSet.FieldByName('chave').AsString, 26, 9)));
     funcoes.InutilizarNFCE(doc);
   end;

   if UpCase(key) = 'A' then begin
     doc := funcoes.dialogo('normal',0,'',2,true,'',Application.Title,'Qual o Novo ADIC ?', '');
     ch  := DBGrid1.DataSource.DataSet.FieldByName('chave').AsString;

     dm.IBQuery1.Close;
     dm.IBQuery1.SQL.Text := 'update nfce set adic = :adic where chave = :chave';
     dm.IBQuery1.ParamByName('adic').AsString  := doc;
     dm.IBQuery1.ParamByName('chave').AsString := ch;
     dm.IBQuery1.ExecSQL;
     dm.IBQuery1.Transaction.Commit;

     DBGrid1.DataSource.DataSet.Close;
     DBGrid1.DataSource.DataSet.Open;
     dm.IBselect.Locate('chave', ch, []);
   end;
 end;


 if campobusca = 'item_entradaV' then begin
    if key = #13 then //F2 Marca pra download
      begin
        form999 := tform9.Create(self);
        //form999.Name := 'produto9999';
        jsedit.SetTabelaDoBd(form999, 'produto', dm.IBQuery1);
        form999.cod.Text := DBGrid1.DataSource.DataSet.FieldByName('cod').AsString;
        jsedit.SelecionaDoBD(form999.Name);
        funcoes.CtrlResize(tform(form999));
        form999.ShowModal;
        JsEdit.LiberaMemoria(form999);
        form9.Free;
        exit;
      end;
  end;


 ShowScrollBar(DbGrid1.Handle, SB_VERT, FALSE);
  ShowScrollBar(DbGrid1.Handle, SB_HORZ, false);
  ShowScrollBar(DbGrid1.Handle, SB_BOTH, false);

 key := UpCase(key);

 if campos <> '' then
   begin
     if ((ord(key)) >= 65) and (((ord(key))) <= 95) then
       begin
         query := TFDQuery(DBGrid1.DataSource.DataSet);
         funcoes.procuraTimmer(query, key, campos);
       end;
   end;

 if funcoes.Contido('Ficha' , Caption) then
    begin
      if UpCase(key) = 'T' then
        begin
          funcoes.Mensagem('Total Somat�rio do Produto',txt,9,'Courier New',true,0,clBlack, false);
        end;

      if UpCase(key) = 'I' then
        begin
          if MessageBox(Handle, 'Deseja Enviar para a Impressora', pchar(Application.Title), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idno then exit;
          b := 55;
          c := 0;
          form19.RichEdit1.Clear;
          addRelatorioForm19(funcoes.RelatorioCabecalho(form22.Pgerais.Values['empresa'], self.Caption, 80));
         try
          a := ClientDataSet1.RecNo - 1;
          ClientDataSet1.DisableControls;
          if ClientDataSet1.RecNo > 0 then ClientDataSet1.First;
          while not ClientDataSet1.Eof do
            begin
              c := c + 1;
              addRelatorioForm19(FormatDateTime('dd/mm/yy', ClientDataSet1.fieldbyname('Data').AsDateTime) + ' ' + funcoes.CompletaOuRepete(ClientDataSet1.fieldbyname('historico').AsString, '', ' ', 40) + funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00', ClientDataSet1.fieldbyname('preco').AsCurrency), ' ', 10) + funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00', ClientDataSet1.fieldbyname('quant').AsCurrency), ' ', 10) + funcoes.CompletaOuRepete('', FormatCurr('#,###,###0.00', ClientDataSet1.fieldbyname('saldo').AsCurrency), ' ', 11) + #13 + #10);
              if c >= b then
                begin
                  addRelatorioForm19('  ' + #12 + #13 + #10 );
                  addRelatorioForm19(funcoes.RelatorioCabecalho(form22.Pgerais.Values['empresa'], self.Caption, 80));
                  c := c + 5;
                  b := b + 55;
                end;
              ClientDataSet1.Next;
            end;
          addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 80) + #13 + #10);
          if c + 7 > b then
            begin
              addRelatorioForm19('  ' + #12 + #13 + #10 );
            end;
          addRelatorioForm19(txt);
          ClientDataSet1.First;
          ClientDataSet1.MoveBy(a);
          ClientDataSet1.EnableControls;
          imprime.textx('');
        except
          ClientDataSet1.EnableControls;
        end;
        end;
    end;

   if funcoes.Contido('CODMOV' , UpperCase(campobusca)) then
   begin
     key1 := UpCase(key);
     if key1 = 'T' then
       begin
         a := DBGrid1.DataSource.DataSet.RecNo;
         try
         TFDQuery(DBGrid1.DataSource.DataSet).DisableControls;
         TFDQuery(DBGrid1.DataSource.DataSet).First;
         val := 0;
         ent := 0;
         while not TFDQuery(DBGrid1.DataSource.DataSet).Eof do
           begin
             ent := ent + TFDQuery(DBGrid1.DataSource.DataSet).fieldbyname('entrada').AsCurrency;
             val := val + TFDQuery(DBGrid1.DataSource.DataSet).fieldbyname('saida').AsCurrency;
             TFDQuery(DBGrid1.DataSource.DataSet).Next;
           end;
         finally
           TFDQuery(DBGrid1.DataSource.DataSet).First;
           TFDQuery(DBGrid1.DataSource.DataSet).MoveBy(a - 1);
           TFDQuery(DBGrid1.DataSource.DataSet).EnableControls;
         end;

         DOC := funcoes.CompletaOuRepete('', '', '-', 22) + CRLF + 'Total de Movimento:' + CRLF + CRLF + 'Entrada=>'+ funcoes.CompletaOuRepete('', formataCurrency(ent), ' ', 13) + '+' + CRLF + 'Sa�da  =>'+funcoes.CompletaOuRepete('', formataCurrency(val), ' ', 13) + '-' + CRLF + funcoes.CompletaOuRepete('', '', '-', 22) + CRLF + 'TOTAL  =>' + funcoes.CompletaOuRepete('', formataCurrency(ent - val), ' ', 13) + CRLF + funcoes.CompletaOuRepete('', '', '-', 22) + CRLF + CRLF;
        funcoes.Mensagem('Total de Movimento - ControlW', doc,9,'Courier New',true,0,clBlack, false);
       end;

     if key1 = 'I' then
       begin
         if MessageBox(Handle, 'Deseja Enviar para a Impressora', pchar(Application.Title), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idyes then
           begin
             form19.RichEdit1.Clear;
             addRelatorioForm19(funcoes.RelatorioCabecalho(form22.Pgerais.Values['empresa'], 'MOVIMENTO DE CAIXA DE ' + formataDataDDMMYY(TFDQuery(DBGrid1.DataSource.DataSet).Parambyname('ini').AsDateTime) + ' A ' + formataDataDDMMYY(TFDQuery(DBGrid1.DataSource.DataSet).Parambyname('fim').AsDateTime), 80));
             addRelatorioForm19('| DATA      DOC. HISTORICO                                                 VALOR' + CRLF);
             addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 80) + CRLF);
             try
               TFDQuery(DBGrid1.DataSource.DataSet).DisableControls;
               TFDQuery(DBGrid1.DataSource.DataSet).First;
               total := 0;
               while not TFDQuery(DBGrid1.DataSource.DataSet).Eof do
                 begin
                   val := TFDQuery(DBGrid1.DataSource.DataSet).fieldbyname('entrada').Ascurrency - TFDQuery(DBGrid1.DataSource.DataSet).fieldbyname('saida').Ascurrency;
                   total := total + val;
                   addRelatorioForm19(formataDataDDMMYY(TFDQuery(DBGrid1.DataSource.DataSet).fieldbyname('data').AsDateTime) + ' ' + funcoes.CompletaOuRepete('', TFDQuery(DBGrid1.DataSource.DataSet).fieldbyname('documento').AsString, ' ', 7) + ' ' + funcoes.CompletaOuRepete(LeftStr(TFDQuery(DBGrid1.DataSource.DataSet).fieldbyname('historico').AsString, 48), '', ' ', 48) + ' ' + funcoes.CompletaOuRepete('', formataCurrency(abs(val)), ' ', 13) + iif(val < 0, '-', '+') + CRLF);
                   TFDQuery(DBGrid1.DataSource.DataSet).Next;
                 end;
             finally
               addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 80) + CRLF);
               addRelatorioForm19(funcoes.CompletaOuRepete('TOTAL => ' + formataCurrency(total), '', ' ', 80) + CRLF);
               addRelatorioForm19(funcoes.CompletaOuRepete('', '', '-', 80) + CRLF);
               TFDQuery(DBGrid1.DataSource.DataSet).First;
               TFDQuery(DBGrid1.DataSource.DataSet).EnableControls;
             end;

             imprime.textx('');
           end;

       end;
   end;


  if key=#13 then
  begin
    if campobusca = 'nfce' then exit;
    if campobusca = 'nfe' then exit;
    if campobusca = '' then exit;
    if campobusca <> 'codbar1' then funcoes.SetRetornoBusca(DataSource1.DataSet.fieldbyname(campobusca).AsString);
    close;
  end;

  if key = #27 then
    begin
      funcoes.SetRetornoBusca('');
      if campobusca = 'arq' then funcoes.SetRetornoBusca('*');
      close;
    end;
end;

procedure TForm33.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  list : TStringList;
  i : integer;
begin
  if campobusca = 'arq' then begin
    if (Shift = [ssCtrl]) and (Key = 46) then begin
        list := funcoes.listaArquivos(caminhoEXE_com_barra_no_final + '*.xml');
        for i := 0 to list.Count -1 do begin
          DeleteFile(caminhoEXE_com_barra_no_final + list[i]);
        end;

        ShowMessage(IntToStr(list.Count)+' Arquivos Tempor�rios Apagados');
        list.Free;
      end;


  end;
end;

procedure TForm33.FormShow(Sender: TObject);
  var fim, i, tot : integer;
begin
  fim := DBGrid1.Columns.Count - 1;
  tot := 0;
  for i := 0 to fim do
    begin
      tot := tot + DBGrid1.Columns.Items[i].Width + 20;
    end;
  if tot <> 0 then self.Width := tot + 530;
  funcoes.aumentaFonte(self, true, 0, true);

  Width := Width + 30;

  ShowScrollBar(DbGrid1.Handle, SB_VERT, FALSE);
  ShowScrollBar(DbGrid1.Handle, SB_HORZ, false);
  ShowScrollBar(DbGrid1.Handle, SB_BOTH, false);
end;

procedure TForm33.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if funcoes.Contido('Ficha' , Caption) then
    begin
      ClientDataSet1.Free;
    end;

  if campobusca = 'item_entradaV' then begin
    funcoes.notaNFe   := '';
    funcoes.fornecNFe := '';
  end;
end;

procedure TForm33.FormCreate(Sender: TObject);
begin
  LinhasMarcadas := '-';
  ficha          := false;
end;

procedure TForm33.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  cod, codbar : string;
  list : TStringList;
  i: Integer;
begin
  //Entra aqui na tela de gerar nfe F2 pra ver os produtos
  if captionficha = 'NfeProd' then begin
    if key = 113 then begin
      form92 := tform92.Create(self);
      form92.cod := DBGrid1.DataSource.DataSet.RecNo-1;

      if form92.cod < 0 then form92.cod := 0;

      LE_CAMPOS(list, form79.detExport.Values[IntToStr(form92.cod)], '|', true);

      if list.Values['1'] <> '' then begin
        form92.nDrawback.Text := list.Values['1'];
        form92.regExpo.Text   := list.Values['2'];
        form92.chNfe.Text     := list.Values['3'];
        form92.qExport.Text   := list.Values['4'];
      end;


      list.Free;
      form92.ShowModal;
      if trim(form92.retorno) <> '' then form79.detExport.Values[IntToStr(form92.cod)] := form92.retorno;
      form92.Free;
    end;
  end;

  if ficha then begin
    if key = 112 then begin
      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Text := 'update produto set quant = :quant where cod = :cod';
      dm.IBQuery1.ParamByName('quant').AsCurrency := saldo;
      dm.IBQuery1.ParamByName('cod').AsInteger    := cod1;
      dm.IBQuery1.ExecSQL;
      dm.IBQuery1.Transaction.Commit;

      ShowMessage('Quantidade Alterada!' + #13 + 'C�d: ' + IntToStr(cod1) + #13 +
      'Quant: ' + CurrToStr(saldo));
      exit;
    end;
  end;

  if campobusca = 'item_entradaV' then begin
    if key = 113 then //F2 Marca pra download
      begin
        LinhasMarcadas := LinhasMarcadas + IntToStr(DBGrid1.DataSource.DataSet.RecNo) + '-';
        DBGrid1.Refresh;
        exit;
      end;

    if key = 117 then //F2 Marca pra download
      begin
        LinhasMarcadas := '-';
        DBGrid1.Refresh;
        exit;
      end;
  end;

  if campobusca = 'nfce' then
    begin
      if key = 113 then //F2 Marca pra download
        begin
          if funcoes.marcaXMLNFCeParaEnvio(ClientDataSet1.fieldbyname('chave').AsString, LeftStr(ClientDataSet1.fieldbyname('erro').AsString, 1), ClientDataSet1.fieldbyname('serie').AsString) then
            begin
              marcaOK;
            end;
        end;
      exit;
    end;

 if campobusca = 'nfe' then begin
   if key = 113 then begin //F2 Marca pra download
     if Contido('20: ', ClientDataSet1.fieldbyname('erro').AsString)  then begin
       NfeVenda := TNfeVenda.Create(self);
       try
         NfeVenda.ConsultarNFe1(ClientDataSet1.fieldbyname('chave').AsString);
       except
         on e:exception do begin
         end;
       end;
       NfeVenda.Free;
     end;
   end;

   exit;
 end;

  if campobusca = 'nfce1' then
    begin
      if key = 113 then //F2 Marca pra download
        begin
          if LeftStr(ClientDataSet1.FieldByName('erro').AsString, 1) = '5' then begin
            MessageDlg('Verifique os Dados Adicionais e o Valor dos Produtos Na Entrada Simples!', mtInformation, [mbOK], 1);
            dadosAdicSped := TdadosAdicSped.Create(self);
            dadosAdicSped.nota.Text   := ClientDataSet1.FieldByName('nota').AsString;
            dadosAdicSped.fornec.Text := ClientDataSet1.FieldByName('fornec').AsString;
            dadosAdicSped.ShowModal;
            dadosAdicSped.Free;
          end;
        end;

      exit;
    end;

  if campobusca = 'arq' then
    begin
      if key = 46 then begin
        if DeleteFile(caminhoEXE_com_barra_no_final + 'ENTRADAXML\' + ClientDataSet1.fieldbyname('arq').AsString) then begin
          ClientDataSet1.Edit;
          ClientDataSet1.Delete;
         // ClientDataSet1.Post;
        end;
      end;

      if key = 119 then //F8 DOWNLOAD XML
        begin
          form78 := TForm78.Create(self);
          form78.ShowModal;
          form78.Free;

          funcoes.buscaXMl(caminhoEXE_com_barra_no_final + 'ENTRADAXML\', false);
          //form63.Free;
          {codbar := funcoes.dialogo('mask',300, '!0000.0000.0000.0000.0000.0000.0000.0000.0000.0000.0000;1;_', 300, false, '', 'ControlW', 'Informe a Chave:', '');
          if codbar = '*' then exit;

          dm.IBselect.Close;
          dm.IBselect.SQL.Text := 'select cnpj from registro';
          dm.IBselect.Open;

          cod := StrNum(dm.IBselect.fieldbyname('cnpj').AsString);
          dm.IBselect.Close;
          codbar := StrNum(codbar);
          downloadXML(codbar, cod, caminhoEXE_com_barra_no_final);
          close;}
        end;



        //downloadXML(codbar, cod, caminhoEXE_com_barra_no_final);
      exit;
    end;

  if ((campobusca = 'codbar') or (campobusca = 'codbar1')) then
    begin
      if key = 46 then
        begin
      if messageDlg('Deseja Excluir?', mtConfirmation, [mbyes, mbNo], 0) = mrYes then
        begin
          cod := DBGrid1.DataSource.DataSet.fieldbyname('cod').AsString;
          codbar := DBGrid1.DataSource.DataSet.fieldbyname('codbar').AsString;

          dm.IBQuery1.Close;
          dm.IBQuery1.SQL.Clear;
          dm.IBQuery1.SQL.Add('delete from codbarras where ((cod = :cod) and (codbar = :codbar))');
          dm.IBQuery1.ParamByName('cod').AsString := cod;
          dm.IBQuery1.ParamByName('codbar').AsString := codbar;
          dm.IBQuery1.ExecSQL;

          dm.IBQuery1.Transaction.Commit;

          dm.IBQuery1.Close;
          dm.IBQuery1.SQL.Clear;
          dm.IBQuery1.SQL.Add('update produto set codbar = '+QuotedStr('')+' where ((cod = :cod) and (codbar = :codbar))');
          dm.IBQuery1.ParamByName('cod').AsString := cod;
          dm.IBQuery1.ParamByName('codbar').AsString := codbar;
          dm.IBQuery1.ExecSQL;

          dm.IBQuery1.Transaction.Commit;

          DBGrid1.DataSource.DataSet.Close;
          DBGrid1.DataSource.DataSet.Open;
          if campobusca = 'codbar1' then close;
        end;
      end;  
    end;
end;

procedure TForm33.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then Key := 0;
end;

procedure TForm33.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = '+' then
    begin
      funcoes.aumentaFonte(self, true, 1, true);
    end;

  if key = '-' then
    begin
      funcoes.aumentaFonte(self, true, 2, true);
    end;
end;

procedure TForm33.marcaOK;
begin
  ClientDataSet1.Edit;
  ClientDataSet1.FieldByName('ok').AsInteger := 1;
  ClientDataSet1.Post;
end;

procedure TForm33.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if campobusca = 'item_entradaV' then begin
    if funcoes.Contido('-'+IntToStr(DBGrid1.DataSource.DataSet.RecNo) + '-', LinhasMarcadas) then begin
      with DBGrid1 do Begin
        with Canvas do Begin
          Brush.Color := HexToTColor('228B22'); // Cor da c�lula
          FillRect (Rect); // Pinta a c�lula
        End; // with Canvas
          DefaultDrawDataCell (Rect, Column.Field, State) // Reescreve o valor que vem do banco
      end;
    end;

    exit;
  end;
  if campobusca = 'nfce' then begin
    if ClientDataSet1.FieldByName('ok').AsInteger = 1 then begin
      with DBGrid1 do Begin
        with Canvas do Begin
          Brush.Color := HexToTColor('228B22'); // Cor da c�lula
          FillRect (Rect); // Pinta a c�lula
        End; // with Canvas
          DefaultDrawDataCell (Rect, Column.Field, State) // Reescreve o valor que vem do banco
      end;
    end;
  end
  else begin
    if (gdSelected in State) then Begin // Se o estado da c�lula n�o � selecionado
      DBGrid1.Canvas.Brush.Color := StringToColor(funcoes.buscaCorBDGRID_Produto(1)); // Cor da c�lula
      DBGrid1.Canvas.Font.Color  := StringToColor(funcoes.buscaCorBDGRID_Produto(2)); // Cor da c�lula
      DBGrid1.Canvas.FillRect (Rect); // Pinta a c�lula
      DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    End;

    if DBGrid1.DataSource.DataSet.RecNo mod 2 = 0 then begin
      if not (gdSelected in State) then Begin // Se o estado da c�lula n�o � selecionado
        try
          DBGrid1.Canvas.Brush.Color := StringToColor(funcoes.buscaCorBDGRID_Produto); // Cor da c�lula
        except
          DBGrid1.Canvas.Brush.Color := HexToTColor('F5F5F5');
        end;
        DBGrid1.Canvas.fillRect (Rect); // Pinta a c�lula
      End; // with Canvas

      dBGrid1.DefaultDrawDataCell (Rect, Column.Field, State) // Reescreve o valor que vem do banco
    End;
  end;

end;

end.





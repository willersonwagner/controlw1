ário...';
  form26.Update;

  Application.CreateForm(Tform22, form22);
  Application.CreateForm(Tfuncoes, funcoes);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm70, Form70);
  Application.CreateForm(TForm72, Form72);
  Application.CreateForm(TForm73, Form73);
  Application.CreateForm(TForm74, Form74);
  Application.CreateForm(TForm75, Form75);
  //Application.CreateForm(TconsultaCNPJ, consultaCNPJ);
  //Application.CreateForm(TForm71, Form71);
  //Application.CreateForm(TForm69, Form69);
  //Application.CreateForm(TForm68, Form68);
  if ParamCount = 2 then
     begin
      dm.bd.DatabaseName := ParamStr(1) + ':' + ParamStr(2);
      CaminhoBD := ParamStr(1) + ':' + ParamStr(2);
     end
   else if ParamCount = 1 then
     begin
         dm.bd.DatabaseName := ParamStr(1) ;
         CaminhoBD := ParamStr(1);
     end
   else
     begin
       dm.bd.DatabaseName := copy(ParamStr(0),1,funcoes.PosFinal('\',ParamStr(0))-1)+'\bd.fdb' ;
       CaminhoBD := copy(ParamStr(0),1,funcoes.PosFinal('\',ParamStr(0))-1)+'\bd.fdb' ;
     end;

   try
     dm.bd.Connected := true;
   except
     ShowMessage('Não foi Possivel a Conexão com o Banco de Dados.' + #10 + #13 + 'Verifique:' + #10 + #13 + #10 + #13 + '1. Se o Banco de Dados existe na pasta do EXECUTÁVEL; ' + #10 + #13 + #10 + #13 + '2. Verifique se o Servidor Firebird está instalado adquadamente neste computador.' + #10 + #13 + #10 + #13 + '3.Se este Computador estiver sendo configurado em rede, verifique se o caminho do banco de dados foi posto corretamente, altere a Propriedade do Atalho no campo DESTINO para "c:\controlw\controlw.exe' + '<NOME_DO_SERVIDOR> <PASTA_NO_SERVIDOR_QUE_CONTEM_O_BD>" Exemplo: "c:\controlw\controlw.exe \\Servidor c:\controlw\bd.fdb'  + #10 + #13 + #10 + #13 + '4. Se o problema persistir entre em contato com o SUPORTE.' );
     funcoes.adicionarExcecao;
     Application.Terminate;
     exit;
   end;

  try
    funcoes.geraPgerais(); //gera Configurações de Parametros Gerais
    funcoes.LeNomesServicos(); //ler os nomes para ordem de servico
  except
  end;

  Application.Title := 'Control Estoque for Windows';
  form26.ProgressBar1.Position:=14;

  Application.CreateForm(TF_Carregando, F_Carregando);
  Application.CreateForm(TForm62, Form62);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm63, Form63);

  Application.CreateForm(TForm24, Form24);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm19, Form19);

  Application.CreateForm(TForm56, Form56);

  form26.ProgressBar1.Position:=28;

  application.CreateForm(TForm19, Form19);
  funcoes.CtrlResize(tform(form19));

  Application.CreateForm(TForm23, Form23);
  funcoes.CtrlResize(tform(form23));

  form26.ProgressBar1.Position := 42;

  form26.ProgressBar1.Position:=56;
  Application.CreateForm(Tpergunta1, pergunta1);
  funcoes.CtrlResize(tform(pergunta1));

  form26.ProgressBar1.Position := 70;
  Application.CreateForm(Timprime, imprime);

  form26.ProgressBar1.Position := 84;
  Application.CreateForm(TForm2, Form2);
  funcoes.CtrlResize(tform(form2));

  form26.ProgressBar1.Position := 98;
  form26.Label1.Caption:='Carregando BD...';
  Form26.Update;
  CRLF := #13 + #10;

  Form26.Update;
  form26.Close;

   Try
     funcoes.VerificaVersao_do_bd; //atualizaBD
   except
     on e : exception do
       begin
         gravaErrosNoArquivo(e.Message, 'Project1', '152', 'funcoes.VerificaVersao_do_bd;');
       end;
   end;

{   if ConfParamGerais[5] = 'S' then //usar recursos de Auto Peças
    begin                          // Gera CDS temporários de equivalências
      funcoes.Timer1.Enabled := true;
    end;}

   try
    if ParamCount > 0 then
      begin
        if funcoes.le_configTerminalWindows(6, 'S') = 'S' then
          begin
            funcoes.fazBackupDoBD(true);
          end;
      end;
     //copia bd do servidor
   except
   end;

   
   Application.CreateForm(TForm26, Form26);

   {treadVerificaPag := TTWThreadVerificaPagamento.Create(true);
   treadVerificaPag.FreeOnTerminate := true;
   treadVerificaPag.Resume;}

   Application.Run;
end.

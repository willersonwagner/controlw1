çalho do e-mail.');
    pmsLoginSMTP:
      Form70.Memo1.Lines.Add('Logando no servidor de e-mail.');
    pmsStartSends:
      Form70.Memo1.Lines.Add('Iniciando os envios.');
    pmsSendTo:
      Form70.Memo1.Lines.Add('Processando lista de destinatários.');
    pmsSendCC:
      Form70.Memo1.Lines.Add('Processando lista CC.');
    pmsSendBCC:
      Form70.Memo1.Lines.Add('Processando lista BCC.');
    pmsSendReplyTo:
      Form70.Memo1.Lines.Add('Processando lista ReplyTo.');
    pmsSendData:
      Form70.Memo1.Lines.Add('Enviando dados.');
    pmsLogoutSMTP:
      Form70.Memo1.Lines.Add('Fazendo Logout no servidor de e-mail.');
    pmsDone:
      begin
        Form70.Memo1.Lines.Add('Terminando e limpando.');

        Form70.Memo1.SelAttributes.Style := [fsBold];
        Form70.Memo1.SelAttributes.Size := 12;
        Form70.Memo1.Lines.Add('Email Enviado com Sucesso!');

        form70.ProgressBar1.Position := form70.ProgressBar1.Max;
      end;
  end;

  Form70.Memo1.Lines.Add('   ' + AMail.Subject);

  Application.ProcessMessages;
end;

procedure Tdm.ACBrNFeGerarLog(const Mensagem: String);
begin
  funcoes.WriteToTXT(caminhoEXE_com_barra_no_final + 'LOGNFE.txt', Mensagem + CRLF +
  '-------------------------------------------------------------------------------------' + #13);
end;

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  abortarScroll := false;
  execucaoEmail := 0;

  //ShowMessage(bd.GDSLibrary.LibraryName);
end;

procedure Tdm.ACBrNFeStatusChange(Sender: TObject);
begin
  Application.ProcessMessages;
end;

end.

unit registro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, JsEditCNPJ1, StdCtrls, JsEdit1, Buttons, ExtCtrls, ImgList,
  JsEditInteiro1, funcoesDAV, JsEditCPF1;

type
  TForm35 = class(TForm)
    ImageList1: TImageList;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    check: TLabel;
    Image1: TImage;
    empresa: JsEdit;
    JsEdit4: JsEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    checagem: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label11: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    cod: JsEditInteiro;
    nome: JsEdit;
    titular: JsEdit;
    suframa: JsEdit;
    cnpj: JsEditCNPJ;
    ies: JsEdit;
    cpf: JsEditCPF;
    tipo: JsEditInteiro;
    telres: JsEdit;
    telcom: JsEdit;
    ende: JsEdit;
    bairro: JsEdit;
    cep: JsEdit;
    est: JsEdit;
    cid: JsEdit;
    obs: JsEdit;
    JsEdit1: JsEdit;
    email: JsEdit;
    tex: TBitBtn;
    Label19: TLabel;
    procedure texClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure nomeKeyPress(Sender: TObject; var Key: Char);
    procedure texKeyPress(Sender: TObject; var Key: Char);
    procedure JsEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure estKeyPress(Sender: TObject; var Key: Char);
    procedure cidKeyPress(Sender: TObject; var Key: Char);
    procedure empresaKeyPress(Sender: TObject; var Key: Char);
    procedure titularKeyPress(Sender: TObject; var Key: Char);
    procedure cnpjKeyPress(Sender: TObject; var Key: Char);
    procedure iesKeyPress(Sender: TObject; var Key: Char);
    procedure cepKeyPress(Sender: TObject; var Key: Char);
    procedure obsKeyPress(Sender: TObject; var Key: Char);
    procedure JsEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure codKeyPress(Sender: TObject; var Key: Char);
    procedure cnpjKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cnpjKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure telresKeyPress(Sender: TObject; var Key: Char);
    procedure telcomKeyPress(Sender: TObject; var Key: Char);
    procedure endeKeyPress(Sender: TObject; var Key: Char);
    procedure bairroKeyPress(Sender: TObject; var Key: Char);
    procedure emailKeyPress(Sender: TObject; var Key: Char);
    procedure tipoKeyPress(Sender: TObject; var Key: Char);
  private
    cod_mun : string;
    ativadoOk,demo1 : boolean;
    valorDeChecagem,codEstado:string;
    tipoRegistro : char;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form35: TForm35;

implementation

uses Unit1, DB, Unit2, func, cadcliente, principal, nfe, caixaLista;

{$R *.dfm}

procedure TForm35.texClick(Sender: TObject);
var
  regime, dadosObriga : String;
  CONT : INTEGER;
begin
  CONT := 1;
  dadosObriga := '';

  if StrNum(cnpj.Text) = '0'  then begin
    if StrNum(CPF.Text)  <> '0' then begin
      CONT := 1;
    end
    else begin
       cont := 0;
       dadosObriga :=  dadosObriga + 'CNPJ/CPF Inv�lido'+ #13;
    end;
  end;

  if StrNum(cpf.Text) = '0'  then begin
    if StrNum(cnpj.Text)  <> '0' then begin
      CONT := 1;
    end
    else begin
      cont := 0;
      dadosObriga :=  dadosObriga + 'CNPJ/CPF Inv�lido'+ #13;
    end;
  end;

  if trim(email.Text)  = ''   then begin
    CONT := 0;
    dadosObriga :=  dadosObriga + 'Email Obrigat�rio Inv�lido'+ #13;
  end;

  if trim(telres.Text)  = ''   then begin
    CONT := 0;
    dadosObriga :=  dadosObriga + 'Telefone para Contato Obrigat�rio Inv�lido'+ #13;
  end;

  if CONT = 0 then BEGIN
    ShowMessage('O SISTEMA NAO PODE SER REGISTRADO SEM INFORMA��ES Obrig�torias: ' + #13 + dadosObriga);
    EXIT;
  END;

  if (not Ativado) or ((ativado) and (demo)) then
    begin
      dm.IBselect.Close;
      dm.IBselect.SQL.Clear;
      dm.IBselect.SQL.Add('select versao from registro');
      dm.IBselect.Open;
      dm.IBselect.FetchAll;

      if dm.IBselect.IsEmpty then
        begin
          dm.IBQuery1.Close;
          dm.IBQuery1.SQL.Clear;
          dm.IBQuery1.SQL.Add('insert into registro(registro) values(-1)');
          dm.IBQuery1.ExecSQL;
          dm.IBQuery1.Transaction.Commit;
          dm.IBselect.Close;
        end;

      empresa.Text := trim(empresa.Text);
      dm.IBQuery1.Close;
      dm.IBQuery1.SQL.Clear;
      dm.IBQuery1.SQL.Add('update registro set tipo = :tipo,cpf = :cpf, empresa = :emp,registro=:reg,nome=:nome,cnpj=:cnpj,ies=:ies,ende=:ende,cep=:cep,telres=:telres,telcom=:telcom, cid = :cid,est=:est,'+
      'obs=:obs,titular=:titular,crip=:crip,cod_mun=:mun, suframa = :suframa, email = :email');
      //dm.IBQuery1.ParamByName('cod').AsString := funcoes.Criptografar(cod.Text);
      dm.IBQuery1.ParamByName('tipo').AsString    :=  tipo.Text;
      dm.IBQuery1.ParamByName('cpf').AsString    :=  cpf.Text;
      dm.IBQuery1.ParamByName('emp').AsString := REMOVE_ACENTO(empresa.Text);

      if tipoRegistro = '1' then begin
        dm.IBQuery1.ParamByName('reg').AsInteger := StringToInteger(empresa.Text);
      end
      else if tipoRegistro = '2' then begin
        dm.IBQuery1.ParamByName('reg').AsInteger := trunc(StringToInteger(empresa.Text) / 3)
      end
      else if tipoRegistro = '3' then begin
        dm.IBQuery1.ParamByName('reg').AsInteger := trunc(StringToInteger(empresa.Text) / 2)
      end
      else begin
        dm.IBQuery1.ParamByName('reg').AsInteger := 0;
      end;

      dm.IBQuery1.ParamByName('nome').AsString := nome.Text;
      dm.IBQuery1.ParamByName('cnpj').AsString := cnpj.Text;
      dm.IBQuery1.ParamByName('ies').AsString := ies.Text;
      dm.IBQuery1.ParamByName('ende').AsString := ende.Text;
      dm.IBQuery1.ParamByName('cep').AsString := cep.Text;
      dm.IBQuery1.ParamByName('telres').AsString := telres.Text;
      dm.IBQuery1.ParamByName('telcom').AsString := telcom.Text;
      dm.IBQuery1.ParamByName('cid').AsString := cid.Text;
      dm.IBQuery1.ParamByName('est').AsString := est.Text;
      dm.IBQuery1.ParamByName('obs').AsString := obs.Text;
      dm.IBQuery1.ParamByName('titular').AsString := titular.Text;
      dm.IBQuery1.ParamByName('crip').AsString := (empresa.Text);
      dm.IBQuery1.ParamByName('mun').AsString := (JsEdit1.Text);
      dm.IBQuery1.ParamByName('suframa').AsString := suframa.Text;
      dm.IBQuery1.ParamByName('email').AsString := email.Text;
      try

        dm.IBQuery1.ExecSQL;
        dm.IBQuery1.Transaction.Commit;
        if demo1 then
            ShowMessage('C�pia Registrada como Demonstra��o por 15 Dias')
        else begin
          regime := funcoes.dialogo('generico',90,'1234', 90, true,'S','Regime de Tributa��o','Qual o Regime de Tributa��o(1-Simples Nacional 2-Simples C/ Excesso de Sublimite 3-Regime Normal/Lucro Presumido 4-Regime Normal/Lucro Real)? ', '3') ;
          if StrNum(regime) = '0' then regime := '3';

          dm.IBQuery1.Close;
          dm.IBQuery1.SQL.Text := 'update pgerais set valor = :valor where cod = 10';
          dm.IBQuery1.ParamByName('valor').AsString := StrNum(regime);
          dm.IBQuery1.ExecSQL;
          dm.IBQuery1.Transaction.Commit;

          ShowMessage('C�pia Registrada com Sucesso');
        end;  
        Application.Terminate;
        form2.close;
      except
        ShowMessage('Ocorreu um Erro Inesperado!');
      end;
    end
  else
   begin
    dm.IBQuery1.Close;
    dm.IBQuery1.SQL.Clear;
    dm.IBQuery1.SQL.Add('update registro set tipo = :tipo,cpf = :cpf, nome = :nome,cnpj = :cnpj,ies=:ies,ende=:ende,bairro = :bairro,cep=:cep,telres=:telres,telcom=:telcom,cid=:cid,est=:est,obs=:obs,titular=:titular,cod_mun=:mun, suframa = :suframa, email = :email');
    //dm.IBQuery1.ParamByName('cod').AsString := funcoes.Criptografar(cod.Text);
    dm.IBQuery1.ParamByName('tipo').AsString    :=  tipo.Text;
    dm.IBQuery1.ParamByName('cpf').AsString    :=  cpf.Text;
    dm.IBQuery1.ParamByName('nome').AsString    := nome.Text;
    dm.IBQuery1.ParamByName('cnpj').AsString    := cnpj.Text;
    dm.IBQuery1.ParamByName('ies').AsString     := ies.Text;
    dm.IBQuery1.ParamByName('ende').AsString    := ende.Text;
    dm.IBQuery1.ParamByName('bairro').AsString  := bairro.Text;
    dm.IBQuery1.ParamByName('cep').AsString     := cep.Text;
    dm.IBQuery1.ParamByName('telres').AsString  := telres.Text;
    dm.IBQuery1.ParamByName('telcom').AsString  := telcom.Text;
    dm.IBQuery1.ParamByName('cid').AsString     := cid.Text;
    dm.IBQuery1.ParamByName('est').AsString     := est.Text;
    dm.IBQuery1.ParamByName('obs').AsString     := obs.Text;
    dm.IBQuery1.ParamByName('titular').AsString := titular.Text;
    dm.IBQuery1.ParamByName('mun').AsString     := (JsEdit1.Text);
    dm.IBQuery1.ParamByName('suframa').AsString := suframa.Text;
    dm.IBQuery1.ParamByName('email').AsString := email.Text;
    try
     dm.IBQuery1.ExecSQL;
     dm.IBQuery1.Transaction.Commit;
     dm.IBQuery1.Close;
     ShowMessage('Dados Alterados com Sucesso');
     close;
     form2.close;
    except
    ShowMessage('Ocorreu um Erro Inesperado!');
    end;
   end;
 end;


procedure TForm35.FormShow(Sender: TObject);
begin
  dm.IBQuery2.Close;
  dm.IBQuery2.SQL.Clear;
  dm.IBQuery2.SQL.Add('select * from registro');
  dm.IBQuery2.Open;

  if ((not Ativado) or (demo)) then
    begin
      dm.IBselect.Close;
      dm.IBselect.SQL.Clear;
      dm.IBselect.SQL.Add('select dtr from acesso');
      dm.IBselect.Open;

      dm.IBselect.FetchAll;
      self.Caption := self.Caption + '  (' + IntToStr(16 - dm.IBselect.RecordCount) + ' Dias Restantes)';
      dm.IBselect.Close;

      empresa.SetFocus;
      ativadoOk := false;
      GroupBox1.Enabled := false;
      valorDeChecagem := funcoes.GeraAleatorio(8);
      check.Caption := check.Caption +' '+valorDeChecagem;
      JsEdit4.Text := valorDeChecagem;
      empresa.Text := dm.IBQuery2.fieldbyname('empresa').AsString;
      cod.Text := funcoes.DesCriptografar(dm.IBQuery2.fieldbyname('versao').AsString);
      nome.Text := dm.IBQuery2.fieldbyname('nome').AsString;
      cnpj.Text := dm.IBQuery2.fieldbyname('cnpj').AsString;
      ies.Text := dm.IBQuery2.fieldbyname('ies').AsString;
      ende.Text := dm.IBQuery2.fieldbyname('ende').AsString;
      titular.Text := dm.IBQuery2.fieldbyname('titular').AsString;
      telres.Text := dm.IBQuery2.fieldbyname('telres').AsString;
      telcom.Text := dm.IBQuery2.fieldbyname('telcom').AsString;
      bairro.Text := dm.IBQuery2.fieldbyname('bairro').AsString;
      cep.Text := dm.IBQuery2.fieldbyname('cep').AsString;
      cid.Text := dm.IBQuery2.fieldbyname('cid').AsString;
      est.Text := dm.IBQuery2.fieldbyname('est').AsString;
      obs.Text := dm.IBQuery2.fieldbyname('obs').AsString;
      JsEdit1.Text := dm.IBQuery2.fieldbyname('cod_mun').AsString;
      suframa.Text := dm.IBQuery2.fieldbyname('suframa').AsString;
      CPF.Text := dm.IBQuery2.fieldbyname('CPF').AsString;
      tipo.Text := dm.IBQuery2.fieldbyname('tipo').AsString;
      email.Text := dm.IBQuery2.FieldByName('email').AsString ;
    end
  else //if (Ativado) and (not demo) then
    begin
      email.Text := dm.IBQuery2.FieldByName('email').AsString ;
      tipo.Text := dm.IBQuery2.fieldbyname('tipo').AsString;
      cod.Text := funcoes.DesCriptografar(dm.IBQuery2.fieldbyname('versao').AsString);
      nome.Text := dm.IBQuery2.fieldbyname('nome').AsString;
      cnpj.Text := dm.IBQuery2.fieldbyname('cnpj').AsString;
      ies.Text := dm.IBQuery2.fieldbyname('ies').AsString;
      ende.Text := dm.IBQuery2.fieldbyname('ende').AsString;
      titular.Text := dm.IBQuery2.fieldbyname('titular').AsString;
      telres.Text := dm.IBQuery2.fieldbyname('telres').AsString;
      telcom.Text := dm.IBQuery2.fieldbyname('telcom').AsString;
      bairro.Text := dm.IBQuery2.fieldbyname('bairro').AsString;
      cep.Text := dm.IBQuery2.fieldbyname('cep').AsString;
      cid.Text := dm.IBQuery2.fieldbyname('cid').AsString;
      est.Text := dm.IBQuery2.fieldbyname('est').AsString;
      obs.Text := dm.IBQuery2.fieldbyname('obs').AsString;
      JsEdit1.Text := dm.IBQuery2.fieldbyname('cod_mun').AsString;
      suframa.Text := dm.IBQuery2.fieldbyname('suframa').AsString;
      CPF.Text := dm.IBQuery2.fieldbyname('CPF').AsString;
      empresa.Enabled := false;
      JsEdit4.Enabled := false;
      ativadoOk := true;
      tex.Caption := 'Alterar';
    end;
   dm.IBQuery2.Close;
   if trim(cod.Text) <> '' then
     begin
       cod.Enabled := false;
       nome.SetFocus;
     end;
end;

procedure TForm35.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  JsEdit.LiberaMemoria(self);
end;

procedure TForm35.nomeKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #27) then
    begin
      if not cod.Enabled then close;
      key := #0;
    end;
end;

procedure TForm35.texKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then key := #0;
end;

procedure TForm35.JsEdit4KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
    if StrToint(funcoes.StrNum(JsEdit4.Text)) = trunc(StrToCurr(valorDeChecagem) / 87) then
      begin
        tipoRegistro := '1';
        check.Caption := 'Vers�o Completa';
        Image1.Picture.Assign(nil);
        ImageList1.Draw(Image1.Canvas,0,0,0);
        ativadoOk := true;
        demo1 := false;
        GroupBox1.Enabled := true;
        key := #0;
        nome.SetFocus;
        try
          funcoes.addRegSite(copy('**' + empresa.Text, 1, 37), dm.IBQuery2);
        except
        end;
      end
    //versao simplificada do sistema
    else if StrToint(funcoes.StrNum(JsEdit4.Text)) = trunc(StrToCurr(valorDeChecagem) / 77) then begin
      tipoRegistro := '2';
      check.Caption := 'Vers�o Econ�mica';
      Image1.Picture.Assign(nil);
        ImageList1.Draw(Image1.Canvas,0,0,0);
        ativadoOk := true;
        demo1 := false;
        GroupBox1.Enabled := true;
        key := #0;
        nome.SetFocus;
        try
          funcoes.addRegSite(copy('**' + empresa.Text, 1, 37), dm.IBQuery2);
        except
        end;
    end
    else if JsEdit4.Text = valorDeChecagem then
      begin
        tipoRegistro := '3';
        check.Caption := 'Vers�o DEMO';
        if demo then
          begin
            Image1.Picture.Assign(nil);
            ImageList1.Draw(Image1.Canvas,0,0,1);
            ativadoOk := false;
            key := #0;
            jsedit4.SetFocus;
            exit;
          end;
        Image1.Picture.Assign(nil);
        ImageList1.Draw(Image1.Canvas,0,0,0);
        ativadoOk := true;
        demo1 := true;
        GroupBox1.Enabled := true;
        key := #0;
        try
          funcoes.addRegSite(copy('*' + empresa.Text, 1, 37), dm.IBQuery2);
        except
        end;
        nome.SetFocus;
      end
    else
      begin
        Image1.Picture.Assign(nil);
        ImageList1.Draw(Image1.Canvas,0,0,1);
        ativadoOk := false;
        key := #0;
        jsedit4.SetFocus;
      end;
  end;
end;

procedure TForm35.estKeyPress(Sender: TObject; var Key: Char);
var nome : string;
begin
  if (key = #27) then key := #0;
  iF (key=#13) and (tedit(sender).Text='') then begin
    nome := funcoes.localizar('Localizar Estado','Estados','cod,nome','cod,nome','cod','nome','nome',false,false,false,'',300,nil);
    tedit(sender).Text := copy(nome,pos('-',nome)+1,length(nome));
    codEstado := copy(nome,1,pos('-',nome)-1);
    key := #0;
  end;

end;

procedure TForm35.cidKeyPress(Sender: TObject; var Key: Char);
var
  tmp : String;
begin
  if (key = #27) then key := #0;
if (key=#13) and (tedit(sender).Text <> '') then
  begin
    {dm.IBselect.Close;
    dm.IBselect.SQL.Clear;
    dm.IBselect.SQL.Add('select * from municipios_ibge where nome = :nome');
    dm.IBselect.ParamByName('nome').AsString := tedit(sender).Text;
    dm.IBselect.Open;

    if dm.IBselect.IsEmpty then
      begin
        dm.IBselect.Close;
        ShowMessage('Munic�pio N�o Encontrado.');
        exit;
      end;

    cod_mun := dm.IBselect.fieldByName('cod').AsString;
    JsEdit1.Text := cod_mun;
    dm.IBselect.Close;   }
  end;



if (key=#13) and (tedit(sender).Text = '') then
  begin
    tmp := funcoes.localizar('Localizar Municipio','municipios_ibge','cod,nome','cod,nome','','nome','nome',false,false,false,' where cod like('+QuotedStr(codEstado+'%')+')',300,NIL);
    tedit(sender).Text := copy(tmp,pos('-',tmp)+1,length(tmp));
    JsEdit1.Text := copy(tmp,1,pos('-',tmp)-1);
    {tedit(sender).Text := funcoes.localizar('Localizar Municipio','municipios_ibge','cod,nome','nome','cod','nome','nome',false,false,false,' where cod like('+QuotedStr(codEstado+'%')+')',300,sender);
    dm.IBselect.Close;
    dm.IBselect.SQL.Clear;
    dm.IBselect.SQL.Add('select * from municipios_ibge where nome = :nome');
    dm.IBselect.ParamByName('nome').AsString := tedit(sender).Text;
    dm.IBselect.Open;

    cod_mun := dm.IBselect.fieldByName('cod').AsString;}
    key := #0;
  end;

{if (key=#13) and (tedit(sender).Text='') then
  begin
    tedit(sender).Text := funcoes.localizar('Localizar Municipio','municipios','cod,nome','nome','cod','nome','nome',false,false,false,' where cod='+codEstado,300,sender);
    key := #0;
  end;
 }
end;

procedure TForm35.emailKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then email.SetFocus;
end;

procedure TForm35.empresaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    begin
      close;
      key := #0;
      exit;
    end;
end;

procedure TForm35.tipoKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) and ((tedit(sender).Text='0') or (tedit(sender).Text='')) then
 begin
   form39 := tform39.Create(self);
   form39.ListBox1.Items.Add('1 - PESSOA F�SICA');
   form39.ListBox1.Items.Add('2 - PESSOA JUR�DICA');
   form39.ListBox1.Items.Add('3 - GOVERNO MUNICIPAL');
   form39.ListBox1.Items.Add('4 - GOVERNO ESTADUAL');
   form39.ListBox1.Items.Add('5 - GOVERNO FEDERAL');
   form39.ListBox1.Items.Add('6 - PRODUTOR RURAL');
   form39.ListBox1.Items.Add('7 - ESTRANGEIRO');
   tedit(sender).Text := funcoes.lista(Sender, false);
   if tedit(sender).Text = '*' then
     begin
       tedit(sender).Text := '0';
       key := #0;
     end;
  //tedit(sender).Text := funcoes.localizar('Tipo de Cliente','tipocli','cod,nome','cod','cod','nome','cod',false,false,false,'',300,sender);
 end;

end;

procedure TForm35.titularKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #27) then key := #0;
end;

procedure TForm35.cnpjKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #27) then key := #0;
end;

procedure TForm35.iesKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #27) then key := #0;
  if key = #13 then cpf.SetFocus;

end;

procedure TForm35.cepKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #27) then key := #0;
end;

procedure TForm35.obsKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #27) then key := #0;
end;

procedure TForm35.JsEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #27) then key := #0;
  if key = #13 then email.SetFocus;
end;

procedure TForm35.codKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then
    begin
      close;
      key := #0;
      exit;
    end;
end;

procedure TForm35.cnpjKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then key := 0;
end;

procedure TForm35.cnpjKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then key := 0;
end;

procedure TForm35.telresKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #27) then
    begin
      ShowMessage('ok');
      key := #0;
    end;

end;

procedure TForm35.telcomKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #27) then key := #0;
end;

procedure TForm35.endeKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #27) then key := #0;
end;

procedure TForm35.bairroKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #27) then key := #0;
end;

end.


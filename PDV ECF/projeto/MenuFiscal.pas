unit MenuFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, func;

type
  TForm9 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    function geraReducao() : smallint;
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses untmain, untDtmMain, login;

{$R *.dfm}

function TForm9.geraReducao() : smallint;
var
  ini, fim : integer;
  erro : boolean;
  sim  : Smallint;
  sim1 : string;
begin
   sim1 := dialogo('generico',0,'SN',0,true,'S','Control for Windows:','Deseja Emitir a Redução Z, O ECF pode fechar o movimento diário!','N');
   if ((sim1 = '*') or (sim1 = 'N')) then exit;
 // sim := MessageBox(Handle,'Deseja Emitir a Redução Z do dia? Esta Rotina Pode Bloquear o ECF.', 'AUTOCOM ECF', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2);
 // if sim = idno then exit;

  mostraMensagem('Aguarde, Emitindo Redução Z...', true);
  
  if not dtmMain.ACBrECF1.Device.Ativo then dtmMain.ACBrECF1.Ativar;
  erro := false;

  try
    try
      Application.ProcessMessages;
      dtmMain.ACBrECF1.DadosReducaoZ;
      dtmMain.ACBrECF1.ReducaoZ(now);
      erro := true;
    except
      on e:exception do
        begin
          MessageDlg('Erro: ' + e.Message, mtError, [mbOK], 1);
        end;
    end;
  finally
  end;

  if erro = false then exit;

  dtmMain.IBQuery1.Close;
  dtmMain.IBQuery1.SQL.Text := 'update or insert into SPED_REDUCAOZ(cod, data, ecf, CONT_REINICIO, CONT_REDUCAOZ, CONT_OP, TOT_GERAL, TOT_CANC, TOT_ALIQ01, TOT_ALIQ02, TOT_ALIQ03, TOT_ALIQ04, ' +
  'TOT_ALIQ05, TOT_ALIQ06, TOT_ALIQ07, TOT_ALIQ08, TOT_DESC, TOT_FF, TOT_II, TOT_NN, VENDABRUTA) values('+Incrementa_Generator('SPED_REDUCAOZ', 1)+', :data, :ecf, :CONT_REINICIO, :CONT_REDUCAOZ, :CONT_OP, :TOT_GERAL, :TOT_CANC, :TOT_ALIQ01, :TOT_ALIQ02, :TOT_ALIQ03, :TOT_ALIQ04, ' +
  ':TOT_ALIQ05, :TOT_ALIQ06, :TOT_ALIQ07, :TOT_ALIQ08, :TOT_DESC, :TOT_FF, :TOT_II, :TOT_NN, :VENDABRUTA)  matching(CONT_REDUCAOZ, ecf)';

  dtmMain.IBQuery1.ParamByName('data').AsDate   := now;
  with dtmMain.ACBrECF1.DadosReducaoZClass do
    begin
      dtmMain.IBQuery1.ParamByName('ecf').AsString             := dtmMain.ACBrECF1.NumECF;
      dtmMain.IBQuery1.ParamByName('CONT_REINICIO').AsInteger  := CRO;
      dtmMain.IBQuery1.ParamByName('CONT_REDUCAOZ').AsInteger  := CRZ + 1;
      dtmMain.IBQuery1.ParamByName('CONT_OP').AsInteger        := COO + 1;
      dtmMain.IBQuery1.ParamByName('TOT_GERAL').AsCurrency     := ValorGrandeTotal;
      dtmMain.IBQuery1.ParamByName('TOT_CANC').AsCurrency      := CancelamentoICMS;

      ini := 0;
      fim := ICMS.Count -1;
      while true do
        begin
          if ini <= fim then  dtmMain.IBQuery1.ParamByName('TOT_ALIQ0' + IntToStr(ini + 1)).AsCurrency      := ICMS[ini].Total
            else dtmMain.IBQuery1.ParamByName('TOT_ALIQ0' + IntToStr(ini + 1)).AsCurrency  := 0;

          if ini = fim then break;  
          if ini = 7 then break;
          ini := ini + 1;
        end;

      dtmMain.IBQuery1.ParamByName('TOT_DESC').AsCurrency      := DescontoICMS;
      dtmMain.IBQuery1.ParamByName('TOT_FF').AsCurrency        := SubstituicaoTributariaICMS;
      dtmMain.IBQuery1.ParamByName('TOT_II').AsCurrency        := IsentoICMS;
      dtmMain.IBQuery1.ParamByName('TOT_NN').AsCurrency        := NaoTributadoICMS;
      dtmMain.IBQuery1.ParamByName('VENDABRUTA').AsCurrency    := ValorVendaBruta;
   end;

  dtmMain.IBQuery1.ExecSQL;
  dtmMain.IBQuery1.Transaction.Commit;
  
  mostraMensagem('Aguarde, Emitindo Redução Z...', false);
  ShowMessage('Redução Z Executada com Sucesso');
end;

procedure TForm9.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    begin
      close;
    end;

  if key = '1' then
    begin
      frmMain.LeituraX1Click(sender);
      exit;
    end;

  if key = '2' then
    begin
      frmMain.geraReducao();
    end;
end;

procedure TForm9.FormShow(Sender: TObject);
begin
  Button1.OnClick := frmMain.LeituraX1.OnClick;
 // Button2.OnClick := frmMain.ReduoZ1.OnClick;
end;

procedure TForm9.Button2Click(Sender: TObject);
begin
  frmMain.geraReducao();
end;

end.

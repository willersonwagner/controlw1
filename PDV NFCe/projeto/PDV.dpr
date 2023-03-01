program PDV;

uses
  Forms,
  classes,
  controls,
  dialogs,
  untDtmMain in 'untDtmMain.pas' {dtmMain: TDataModule},
  untmain in 'untmain.pas' {frmMain},
  frmStatus in 'frmStatus.pas' {mfd},
  untCancelaNFCe in 'untCancelaNFCe.pas' {frmCancelaNFCe},
  func in 'func.pas',
  login in 'login.pas' {form1},
  importapedido in 'importapedido.pas' {Form2},
  classes1 in '..\..\classes1.pas',
  untVendaPDV in 'untVendaPDV.pas' {Form3},
  protetor in 'protetor.pas' {Form4},
  localizar in 'localizar.pas' {Form7},
  dialog in 'dialog.pas' {pergunta1},
  buscaSelecao in 'buscaSelecao.pas' {Form33},
  mens in 'mens.pas' {mensagem},
  formas in 'formas.pas' {Form5},
  dmecf in 'dmecf.pas' {dm: TDataModule},
  PAF_ECF in 'PAF_ECF.pas',
  configImp in 'configImp.pas' {Form6},
  cadFormaPagto in 'cadFormaPagto.pas' {cadFormas},
  identifica in 'identifica.pas' {Form8},
  untConfiguracoesNFCe in 'untConfiguracoesNFCe.pas' {frmConfiguracoesNFe},
  login1 in 'login1.pas' {Form53},
  MenuFiscal in 'MenuFiscal.pas' {Form9},
  consultaProduto in 'consultaProduto.pas' {Form10},
  funcoesDAV in '..\..\funcoesDAV.pas',
  cores in 'cores.pas' {Form11},
  cadecf1 in 'cadecf1.pas' {cadECF},
  untNFCe in '..\..\untNFCe.pas',
  cadCli in 'cadCli.pas' {Form12},
  cadCliCompleto in 'cadCliCompleto.pas' {cadCliNFCe},
  UTraducao in '..\..\UTraducao.pas',
  sangria in 'sangria.pas' {Form13},
  gifAguarde in '..\..\gifAguarde.pas' {Form65},
  untnfceForm in '..\..\untnfceForm.pas' {Form72},
  Unit14 in 'Unit14.pas' {Form14},
  qrcodePIX in 'qrcodePIX.pas' {Form84},
  pagamento in 'pagamento.pas' {Form82};

{$R *.res}
var
 AD_cdserie : string;
begin

  dtmMain                     := TDtmMain.Create(application);
  try
    if conectaBD = false then begin
       Application.Terminate;
    end;
    
  AD_cdserie := '1';
  Application.Initialize;
  Application.Title := 'AUTOCOM NFCe V 1.0.0';
  Application.CreateForm(Tform1, form1);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TcadECF, cadECF);
  Application.CreateForm(TForm33, Form33);
  Application.CreateForm(TForm72, Form72);
  Application.CreateForm(TForm14, Form14);
  Application.CreateForm(TForm84, Form84);
  Application.CreateForm(TForm84, Form84);
  Application.CreateForm(TForm82, Form82);
  //Application.CreateForm(TForm65, Form65);
  //Application.CreateForm(TcadCliNFCe, cadCliNFCe);
  CtrlResize(tform(form33));
  //Application.CreateForm(TForm12, Form12);
  //Application.CreateForm(TForm6, Form6);
  //Application.CreateForm(TForm11, Form11);
  //Application.CreateForm(TForm10, Form10);
  //Application.CreateForm(TfrmConfiguracoesNFe, frmConfiguracoesNFe);
  Application.CreateForm(TForm53, Form53);
  //Application.CreateForm(TForm9, Form9);
  //Application.CreateForm(TForm8, Form8);
  //Application.CreateForm(TcadFormas, cadFormas);
  //Application.CreateForm(Tpergunta1, pergunta1);
  //Application.CreateForm(TForm33, Form33);
  //Application.CreateForm(Tmensagem, mensagem);
  //Application.CreateForm(TForm5, Form5);
  //Application.CreateForm(TForm4, Form4);
  //Application.CreateForm(TForm2, Form2);
  Application.Run;
  finally
   { P4InfoVarejo_Formulario.free;
    P4InfoVarejo_Componente.free;
    P4InfoVarejo_Ativar.free;
    P4InfoVarejo_visivel.free;
    P4InfoVarejo_leitura.free;}
  end;

end.

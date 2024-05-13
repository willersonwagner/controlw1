unit Unit15;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Samples.Spin, Vcl.ComCtrls, ACBrPIXCD, ACBrPIXPSPItau,  ACBrPIXSchemasPix,
  ACBrPIXSchemasDevolucao, ACBrPIXSchemasCob,
  ACBrPIXPSPBancoDoBrasil, ACBrPIXPSPSantander, ACBrPIXBase, ACBrPIXPSPShipay, ShellAPI,
  ACBrOpenSSLUtils, ACBrPIXPSPSicredi, ACBrPIXBRCode, ACBrSocket, ACBrBase,pcnConversao,
  ImgList, ACBrPIXPSPSicoob, ACBrPIXPSPPagSeguro, ACBrPIXPSPGerenciaNet,ACBrDelphiZXingQRCode,
  ACBrPIXPSPBradesco, ACBrPIXPSPPixPDV, ACBrPIXPSPInter, ACBrPIXPSPAilos, ACBrImage,
  ACBrPIXPSPMatera, ACBrPIXPSPCielo, system.IniFiles, ACBrUtil.Base, synacode, ACBrUtil.FilesIO,
  System.TypInfo, ACBrUtil.Strings, ACBrPIXUtil
  {$IfDef FPC}
  , DateTimePicker
  {$EndIf};

type
 TFluxoPagtoDados = record
    TxID: String;
    E2E: String;
    QRCode: String;
    Total: Double;
    StatusCobranca: TACBrPIXStatusCobranca;
    StatusDevolucao: TACBrPIXStatusDevolucao;
    EmErro: Boolean;
    QtdConsultas: Integer;
  end;

  TForm15 = class(TForm)
    Button1: TButton;
    pgConfPixPSP: TPageControl;
    tsPIX: TTabSheet;
    pConfPIX: TPanel;
    gbRecebedor: TGroupBox;
    pnRecebedor: TPanel;
    imgErrCEP: TImage;
    Label14: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    sbConsultaCEP: TSpeedButton;
    imgErrNome: TImage;
    Label42: TLabel;
    edtRecebedorNome: TEdit;
    edtRecebedorCidade: TEdit;
    edtRecebedorCEP: TEdit;
    cbxRecebedorUF: TComboBox;
    gbProxy: TGroupBox;
    pnProxy: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label36: TLabel;
    sbVerSenhaProxy: TSpeedButton;
    edtProxyHost: TEdit;
    edtProxyUser: TEdit;
    edtProxySenha: TEdit;
    seProxyPorta: TSpinEdit;
    gbLog: TGroupBox;
    pnLog: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    sbArqLog: TSpeedButton;
    edtArqLog: TEdit;
    cbxNivelLog: TComboBox;
    gbPSP: TGroupBox;
    pnPSP: TPanel;
    Label13: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    imgErrPSP: TImage;
    cbxPSPAtual: TComboBox;
    cbxAmbiente: TComboBox;
    seTimeout: TSpinEdit;
    gbCobranca: TGroupBox;
    pnCobranca: TPanel;
    Label47: TLabel;
    seCobrancaExpiracao: TSpinEdit;
    gbAutenticacaoManual: TGroupBox;
    pnAutenticacaoManual: TPanel;
    cbAutenticacaoManual: TCheckBox;
    tsPSP: TTabSheet;
    pgPSPs: TPageControl;
    tsShipay: TTabSheet;
    pConfPSPBB3: TPanel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    edtShipayClientID: TEdit;
    edtShipaySecretKey: TEdit;
    edtShipayAccessKey: TEdit;
    tsBB: TTabSheet;
    pConfPSPBB: TPanel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    imgBBErroChavePIX: TImage;
    lbBBVersaoAPI: TLabel;
    edtBBChavePIX: TEdit;
    cbxBBTipoChave: TComboBox;
    edtBBClientID: TEdit;
    edtBBClientSecret: TEdit;
    edtBBDevAppKey: TEdit;
    cbBBVersaoAPI: TComboBox;
    rgBBTipoCertificado: TRadioGroup;
    pnBBCertificados: TPanel;
    pcBBCertificados: TPageControl;
    tsBBPFX: TTabSheet;
    pnBBPFX: TPanel;
    imBBErroPFX: TImage;
    lbBBArqPFX: TLabel;
    lbBBErroPFX: TLabel;
    sbBBAcharPFX: TSpeedButton;
    lbBBSenhaPFX: TLabel;
    btBBVerSenhaPFX: TSpeedButton;
    edBBArqPFX: TEdit;
    edBBSenhaPFX: TEdit;
    tsBBChaveECertificado: TTabSheet;
    pnBBChaveECert: TPanel;
    imBBErroChavePrivada: TImage;
    lbBBArqChavePrivada: TLabel;
    lbBBErroChavePrivada: TLabel;
    sbBBAcharChavePrivada: TSpeedButton;
    sbBBAcharArqCertificado: TSpeedButton;
    lbBBArqCertificado: TLabel;
    imBBErroCertificado: TImage;
    lbBBErroCertificado: TLabel;
    edBBArqChavePrivada: TEdit;
    edBBArqCertificado: TEdit;
    tsItau: TTabSheet;
    pgPSPItau: TPageControl;
    tsItauChave: TTabSheet;
    pConfPSPBB1: TPanel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    imgItauErroChavePIX: TImage;
    imgItauErroClientID: TImage;
    imgItauErroClientSecret: TImage;
    edtItauChavePIX: TEdit;
    cbxItauTipoChave: TComboBox;
    edtItauClientID: TEdit;
    edtItauClientSecret: TEdit;
    tsItauCertificado: TTabSheet;
    pgPSPItauChaveCertificado: TPageControl;
    tsItauChaveCertificadoArquivos: TTabSheet;
    lItauAvisoChaveCertificadoDesabilitado: TLabel;
    Panel7: TPanel;
    Label41: TLabel;
    imgItauErroChavePrivada: TImage;
    lItauErroChavePrivada: TLabel;
    sbItauAcharArqChavePrivada: TSpeedButton;
    Label40: TLabel;
    imgItauErroCertificado: TImage;
    lItauErroCertificado: TLabel;
    sbItauAcharArqCertificado: TSpeedButton;
    edtItauArqChavePrivada: TEdit;
    edtItauArqCertificado: TEdit;
    btItauValidarChaveCertificado: TBitBtn;
    tsItauGerarChaveCertificado: TTabSheet;
    pgPSPItauGerarChaveCertificado: TPageControl;
    tsItauCertPasso1: TTabSheet;
    Label39: TLabel;
    edtItauArqChavePrivada2: TEdit;
    btItauGerarChavePrivada: TBitBtn;
    mItauChavePrivadaPEM: TMemo;
    tsItauCertPasso3: TTabSheet;
    pItauEditCertificado: TPanel;
    Label43: TLabel;
    btItauSolicitarCertificado: TBitBtn;
    edtItauArqCertificado2: TEdit;
    pItauTokentemporario: TPanel;
    lTokenTemporario: TLabel;
    mItauTokenTemporario: TMemo;
    pItauCertificadoRecebido: TPanel;
    Label6: TLabel;
    mItauCertificadoPEM: TMemo;
    tsItauRenovarChaveCertificado: TTabSheet;
    pnItauRenovarCertificadoPEM: TPanel;
    lbItauRenovarCertificadoPEM: TLabel;
    mmItauRenovarCertificadoPEM: TMemo;
    pItauEditCertificado1: TPanel;
    lbItauRenovarCertificadoArq: TLabel;
    edItauRenovarCertificadoArq: TEdit;
    btItauRenovarCertificado: TBitBtn;
    tsSantander: TTabSheet;
    pgSantander: TPageControl;
    tsSantanderCredenciais: TTabSheet;
    pConfPSPSantander: TPanel;
    lbSantanderChavePIX: TLabel;
    lbSantanderTipoChave: TLabel;
    lbSantanderConsumerKey: TLabel;
    lbSantanderConsumerSecret: TLabel;
    imSantanderErroChavePIX: TImage;
    sbSantanderAcharCertificadoPFX: TSpeedButton;
    lbSantanderArqCertificadoPFX: TLabel;
    lbSantanderErroCertificadoPFX: TLabel;
    imSantanderErroCertificadoPFX: TImage;
    lbSantanderSenhaCertificado: TLabel;
    sbSantanderVerSenhaPFX: TSpeedButton;
    edSantanderChavePIX: TEdit;
    cbSantanderTipoChave: TComboBox;
    edSantanderConsumerKey: TEdit;
    edSantanderConsumerSecret: TEdit;
    edSantanderArqCertificadoPFX: TEdit;
    edSantanderSenhaCertificadoPFX: TEdit;
    tsSantanderExtrairCertificado: TTabSheet;
    pnSantanderExtrairCertificado: TPanel;
    sbSantanderExtrairCertificadoPFX: TSpeedButton;
    lbSantanderExtrairCertificadoPFX: TLabel;
    lbSantanderExtrairCertificadoPEM: TLabel;
    lbSantanderExtrairCertificadoSenhaPFX: TLabel;
    sbSantanderExtrairCertificadoVerSenhaPFX: TSpeedButton;
    sbSantanderExtrairCertificadoInfo: TSpeedButton;
    edSantanderExtrairCertificadoPFX: TEdit;
    btSantanderExtrairPEM: TBitBtn;
    edSantanderExtrairCertificadoPEM: TEdit;
    edSantanderExtrairCertificadoSenhaPFX: TEdit;
    tsSicredi: TTabSheet;
    pgSicredi: TPageControl;
    tsSicrediCredenciais: TTabSheet;
    pnSicrediCredenciais: TPanel;
    sbSicrediAcharChavePrivada: TSpeedButton;
    sbSicrediAcharArqCertificado: TSpeedButton;
    lbSicrediTipoChave: TLabel;
    lbSicrediErroChavePrivada: TLabel;
    lbSicrediErroCertificado: TLabel;
    lbSicrediClientSecret: TLabel;
    lbSicrediClientID: TLabel;
    lbSicrediChavePIX: TLabel;
    lbSicrediArqChavePrivada: TLabel;
    lbSicrediArqCertificado: TLabel;
    imSicrediErroChavePrivada: TImage;
    imSicrediErroChavePix: TImage;
    imSicrediErroCertificado: TImage;
    edSicrediClientSecret: TEdit;
    edSicrediClientID: TEdit;
    edSicrediChavePIX: TEdit;
    edSicrediArqChavePrivada: TEdit;
    edSicrediArqCertificado: TEdit;
    cbSicrediTipoChave: TComboBox;
    tsSicrediGerarChaveCSR: TTabSheet;
    pnSicrediGerarChaveCSR: TPanel;
    lbSicrediGerarChavePrivada: TLabel;
    lbSicrediGerarCSR: TLabel;
    btSicrediGerarChaveInfo: TSpeedButton;
    btSicrediGerarCSRInfo: TSpeedButton;
    lbSicrediGerarCSREmail: TLabel;
    edSicrediGerarChavePrivada: TEdit;
    mmSicrediGerarChavePrivada: TMemo;
    btSicrediGerarChavePrivada: TBitBtn;
    edSicrediGerarCSR: TEdit;
    mmSicrediGerarCSR: TMemo;
    btSicrediGerarCSR: TBitBtn;
    edSicrediGerarCSREmail: TEdit;
    tsSicoob: TTabSheet;
    pgSicoob: TPageControl;
    tsSicoobCredenciais: TTabSheet;
    pnSicoobCredenciais: TPanel;
    pnConfPSPSicoob: TPanel;
    lbSicoobChavePix: TLabel;
    lbSicoobTipoChave: TLabel;
    lbSicoobClientID: TLabel;
    lbSicoobArquivoChavePrivada: TLabel;
    imSicoobErroChavePrivada: TImage;
    lbSicoobErroChavePrivada: TLabel;
    lbSicoobArquivoCertificado: TLabel;
    imSicoobErroCertificado: TImage;
    lbSicoobErroCertificado: TLabel;
    imSicoobErroChavePIX: TImage;
    sbSicoobAcharChavePrivada: TSpeedButton;
    sbSicoobAcharArqCertificado: TSpeedButton;
    lbSicoobTokenSandbox: TLabel;
    edSicoobChavePIX: TEdit;
    cbSicoobTipoChave: TComboBox;
    edSicoobClientID: TEdit;
    edSicoobArqChavePrivada: TEdit;
    edSicoobArqCertificado: TEdit;
    edSicoobTokenSandbox: TEdit;
    tsSicoobExtrairChaveCertificado: TTabSheet;
    pnSicoobExtrairChaveCertificado: TPanel;
    lbSicoobExtrairChaveCertificadoArqPFX: TLabel;
    btSicoobExtrairChaveCertificadoArqPFX: TSpeedButton;
    lbSicoobExtrairChaveCertificadoSenhaPFX: TLabel;
    btSicoobExtrairChaveCertificadoVerSenhaPFX: TSpeedButton;
    lbSicoobExtrairChavePrivada: TLabel;
    btSicoobExtrairChaveCertificadoInfo: TSpeedButton;
    lbSicoobExtrairCertificado: TLabel;
    edSicoobExtrairChaveCertificadoArqPFX: TEdit;
    edSicoobExtrairChaveCertificadoSenhaPFX: TEdit;
    btSicoobExtrairChaveCertificado: TBitBtn;
    edSicoobExtrairChavePrivada: TEdit;
    edSicoobExtrairCertificado: TEdit;
    tsPagSeguro: TTabSheet;
    pnPagSeguroCredenciais: TPanel;
    sbPagSeguroAcharChavePrivada: TSpeedButton;
    sbPagSeguroAcharArqCertificado: TSpeedButton;
    lbPagSeguroTipoChave: TLabel;
    lbPagSeguroErroChavePrivada: TLabel;
    lbPagSeguroErroCertificado: TLabel;
    lbPagSeguroClientSecret: TLabel;
    lbPagSeguroClientID: TLabel;
    lbPagSeguroChavePIX: TLabel;
    lbPagSeguroArqChavePrivada: TLabel;
    lbPagSeguroArqCertificado: TLabel;
    imPagSeguroErroChavePrivada: TImage;
    imPagSeguroErroChavePix: TImage;
    imPagSeguroErroCertificado: TImage;
    edPagSeguroClientSecret: TEdit;
    edPagSeguroClientID: TEdit;
    edPagSeguroChavePIX: TEdit;
    edPagSeguroArqChavePrivada: TEdit;
    edPagSeguroArqCertificado: TEdit;
    cbPagSeguroTipoChave: TComboBox;
    tsGerenciaNet: TTabSheet;
    pnGerenciaNet: TPanel;
    sbGerenciaNetAcharPFX: TSpeedButton;
    lbGerenciaNetTipoChave: TLabel;
    lbGerenciaNetErroPFX: TLabel;
    lbGerenciaNetClientSecret: TLabel;
    lbGerenciaNetClientID: TLabel;
    lbGerenciaNetChave: TLabel;
    lbGerenciaNetPFX: TLabel;
    imGerenciaNetErroPFX: TImage;
    imGerenciaNetErroChavePix: TImage;
    edGerenciaNetClientSecret: TEdit;
    edGerenciaNetClientID: TEdit;
    edGerenciaNetChavePIX: TEdit;
    edGerenciaNetArqPFX: TEdit;
    cbGerenciaNetTipoChave: TComboBox;
    tsBradesco: TTabSheet;
    pnBradesco: TPanel;
    sbBradescoAcharPFX: TSpeedButton;
    lbBradescoTipoChave: TLabel;
    lbBradescoErroPFX: TLabel;
    lbBradescoClientSecret: TLabel;
    lbBradescoClientKey: TLabel;
    lbBradescoChave: TLabel;
    lbBradescoPFX: TLabel;
    imBradescoErroPFX: TImage;
    imBradescoErroChavePix: TImage;
    sbBradescoVerSenhaPFX: TSpeedButton;
    lbBradescoSenhaPFX: TLabel;
    edBradescoClientSecret: TEdit;
    edBradescoClientID: TEdit;
    edBradescoChavePIX: TEdit;
    edBradescoArqPFX: TEdit;
    cbBradescoTipoChave: TComboBox;
    edBradescoSenhaPFX: TEdit;
    tsPIXPDV: TTabSheet;
    pnPixPDV: TPanel;
    lbPixPDVCNPJ: TLabel;
    lbPixPDVToken: TLabel;
    lbPixPDVSecretKey: TLabel;
    edPixPDVCNPJ: TEdit;
    edPixPDVToken: TEdit;
    edPixPDVSecretKey: TEdit;
    tsInter: TTabSheet;
    pnInter: TPanel;
    lbInterTipoChave: TLabel;
    lbInterClientSecret: TLabel;
    lbInterClientID: TLabel;
    lbInterChave: TLabel;
    imInterErroChavePix: TImage;
    lbInterChavePrivada: TLabel;
    lbInterErroChavePrivada: TLabel;
    imInterErroChavePrivada: TImage;
    btInterAcharChavePrivada: TSpeedButton;
    btInterAcharCertificado: TSpeedButton;
    imInterErroCertificado: TImage;
    lbInterErroCertificado: TLabel;
    lbInterCertificado: TLabel;
    edInterClientSecret: TEdit;
    edInterClientID: TEdit;
    edInterChavePIX: TEdit;
    cbInterTipoChave: TComboBox;
    edInterChavePrivada: TEdit;
    edInterCertificado: TEdit;
    tsAilos: TTabSheet;
    pnAilos: TPanel;
    lbAilosTipoChave: TLabel;
    lbAilosErroChavePrivada: TLabel;
    lbAilosErroCertificadoRoot: TLabel;
    lbAilosClientSecret: TLabel;
    lbAilosClienteID: TLabel;
    lbAilosChave: TLabel;
    lbAilosChavePrivada: TLabel;
    lbAilosCertificadoRoot: TLabel;
    imAilosErroChavePIX: TImage;
    imAilosErroCertificadoRoot: TImage;
    imAilosErroChavePrivada: TImage;
    imAilosErroCertificado: TImage;
    lbAilosCertificado: TLabel;
    lbAilosErroCertificado: TLabel;
    btAilosAcharCertificado: TSpeedButton;
    btAilosAcharchavePrivada: TSpeedButton;
    btAilosAcharCertificadoRoot: TSpeedButton;
    edAilosClientSecret: TEdit;
    edAilosClientID: TEdit;
    edAilosChavePIX: TEdit;
    edAilosChavePrivada: TEdit;
    edAilosCertificadoRoot: TEdit;
    cbAilosTipoChave: TComboBox;
    edAilosCertificado: TEdit;
    tsMatera: TTabSheet;
    pnMatera: TPanel;
    lbMateraClientID: TLabel;
    lbMateraErroCertificado: TLabel;
    lbMateraArqCertificado: TLabel;
    imMateraErroCertificado: TImage;
    btMateraAcharArqCertificado: TSpeedButton;
    btMateraAcharChavePrivada: TSpeedButton;
    lbMateraArqChavePrivada: TLabel;
    lbMateraErroChavePrivada: TLabel;
    imMateraErroChavePrivada: TImage;
    lbMateraSecretKey: TLabel;
    lbMateraAccountId: TLabel;
    lbMateraChavePIX: TLabel;
    lbMateraClientSecret: TLabel;
    lbMateraMediatorFee: TLabel;
    edMateraClientID: TEdit;
    edMateraArqCertificado: TEdit;
    edMateraArqChavePrivada: TEdit;
    edMateraSecretKey: TEdit;
    edMateraAccountId: TEdit;
    edMateraChavePIX: TEdit;
    edMateraClientSecret: TEdit;
    edMateraMediatorFee: TEdit;
    tsCielo: TTabSheet;
    pnCielo: TPanel;
    lbCieloTipoChave: TLabel;
    lbCieloClientSecret: TLabel;
    lbCieloClientID: TLabel;
    lbCieloChave: TLabel;
    imCieloErroChavePix: TImage;
    edCieloClientSecret: TEdit;
    edCieloClientID: TEdit;
    edCieloChavePIX: TEdit;
    cbCieloTipoChave: TComboBox;
    TabSheet1: TTabSheet;
    mLog: TMemo;
    Valor: TLabel;
    fleQREValor: TEdit;
    Label34: TLabel;
    edtQREInfoAdicional: TEdit;
    btQREGerar: TBitBtn;
    imgQRE: TImage;
    BitBtn1: TBitBtn;
    pBotoesConfiguracao: TPanel;
    btSalvarParametros: TBitBtn;
    btLerParametros: TBitBtn;
    OpenDialog1: TOpenDialog;
    txidEstatico: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    loca: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btSalvarParametrosClick(Sender: TObject);
    procedure btQREGerarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure sbGerenciaNetAcharPFXClick(Sender: TObject);
    procedure edGerenciaNetChavePIXChange(Sender: TObject);
  private
    { Private declarations }
   NomeArquivoConfiguracao : String;
   fFluxoDados: TFluxoPagtoDados;
   procedure AnalisarBRCode(aBRCode: TACBrBRCode);
   function AdicionarPathAplicacao(const AFileName: String): String;
   procedure ConfigurarACBrPSPs;
   procedure GravarConfiguracao;
   procedure AdicionarLinhaLog(AMensagem: String);
   procedure PintarQRCodeEstatico;
   procedure AplicarConfiguracao;
   procedure ConfigurarACBrPIXCD;
   procedure DoAntesAutenticar(var aToken: String;var aValidadeToken: TDateTime);
   procedure DoDepoisAutenticar(const aToken: String; const aValidadeToken: TDateTime);
   procedure InicializarComponentesDefault;
   procedure LerConfiguracao;
   function RemoverPathAplicacao(const AFileName: String): String;
   function FormatarJSON(const AJSON: String): String;


  { procedure ValidarChaveCertificadoPSPItau;
    procedure ValidarChavePSPItau;
    procedure ValidarChavePSPSicredi;
    procedure ValidarChavePSPSicoob;
    procedure ValidarChavePSPPagSeguro;
    procedure ValidarChavePSPInter;
    procedure ValidarChavePSPAilos;
    procedure ValidarChavePSPBB;
    procedure ValidarChavePSPMatera;

    procedure ValidarCertificadoPSPItau;
    procedure ValidarCertificadoPSPSicoob;
    procedure ValidarCertificadoPSPSicredi;
    procedure ValidarCertificadoPSPSantander;
    procedure ValidarCertificadoPSPPagSeguro; }
    procedure ValidarCertificadoPSPGerenciaNet;
    {procedure ValidarCertificadoPSPBradesco;
    procedure ValidarCertificadoPSPInter;
    procedure ValidarCertificadoPSPAilos;
    procedure ValidarCertificadoRootPSPAilos;
    procedure ValidarCertificadoPSPMatera;
    procedure ValidarCertificadoPSPBB;
    procedure ValidarPFXPSPBB;  }
  public
    qrcodees, ultimoErro, estado : String;
    procedure VerificarConfiguracao;
    function VerificarConfiguracaoPIXCD : Boolean;

    { Public declarations }
  end;

var
  Form15: TForm15;

implementation

{$R *.dfm}

uses untDtmMain,ACBrPIXSchemasCobV;

procedure TForm15.btQREGerarClick(Sender: TObject);
var
  s, qrcode: String;
  Ok: Boolean;
begin
  //VerificarConfiguracao;

  ultimoErro := '';

  with dtmMain.ACBrPixCD1.PSP.epCob.CobSolicitada do
  begin
    Clear;
    s := dtmMain.ACBrPixCD1.PSP.ChavePIX;
    chave := dtmMain.ACBrPixCD1.PSP.ChavePIX;
    calendario.expiracao := seCobrancaExpiracao.Value;

    valor.original := StrToFloatDef(fleQREValor.Text, 0);
    valor.modalidadeAlteracao := false;

   end;

    Ok := dtmMain.ACBrPixCD1.PSP.epCob.CriarCobrancaImediata;

  if Ok then
  begin
    //mLog.Lines.Add('');
    //mLog.Lines.Add( FormatarJSON(dtmMain.ACBrPixCD1.PSP.epCob.CobGerada.AsJSON));
    qrcode := Trim(dtmMain.ACBrPixCD1.PSP.epCob.CobGerada.pixCopiaECola);
    qrcodees := qrcode;

    //dtmMain.ACBrPixCD1.PSP.epCob.CobGerada.

    txidEstatico.Text := dtmMain.ACBrPixCD1.PSP.epCob.CobGerada.txId;
    //AdicionarLinhaLog( dtmMain.ACBrPixCD1.PSP.epCob.CobGerada.AsJSON);


    PintarQRCode(qrcode, imgQRE.Picture.Bitmap, qrUTF8BOM);
  end
  else begin
    ultimoErro := 'Erro Desconhecido.' + #13 + FormatarJSON(dtmMain.ACBrPixCD1.PSP.epCob.Problema.AsJSON) ;//mLog.Lines.Add('Não deu certo!');

  end;
   { if (qrcode = '') then
      qrcode := ACBrPixCD1.GerarQRCodeDinamico( ACBrPixCD1.PSP.epCob.CobGerada.location );
    PintarQRCode(qrcode, imgQRCriarCobrancaImediata.Picture.Bitmap, qrUTF8BOM);
    mCriarCobrancaImediata.Lines.Add('');
    mCriarCobrancaImediata.Lines.Add('- pixCopiaECola -');
    mCriarCobrancaImediata.Lines.Add(qrcode);
  end
  else
    mCriarCobrancaImediata.Lines.Text := FormatarJSON(ACBrPixCD1.PSP.epCob.Problema.AsJSON);
}exit;
  //PintarQRCodeEstatico;

  AdicionarLinhaLog('ClientID: '+dtmMain.ACBrPSPGerenciaNet1.ClientID);
  AdicionarLinhaLog('ClientID: '+dtmMain.ACBrPSPGerenciaNet1.ClientSecret);
  AdicionarLinhaLog('ChavePIX: '+dtmMain.ACBrPSPGerenciaNet1.ChavePIX);
  AdicionarLinhaLog('ArquivoCertificado: '+dtmMain.ACBrPSPGerenciaNet1.ArquivoCertificado);

  dtmMain.ACBrOpenSSLUtils1.LoadPFXFromFile(edGerenciaNetArqPFX.Text);

  dtmMain.ACBrPixCD1.PSP := dtmMain.ACBrPSPGerenciaNet1;

  qrcodees := dtmMain.ACBrPixCD1.GerarQRCodeEstatico(StrToCurr(fleQREValor.Text), '', txidEstatico.Text);
  PintarQRCode(qrcodees, imgQRE.Picture.Bitmap, qrUTF8BOM);

  {dtmMain.ACBrPixCD1.PSP.Clear;
  dtmMain.ACBrPixCD1.PSP.epCob.
  dtmMain.ACBrPixCD1.PSP.epCob.CobSolicitada.Clear;
  dtmMain.ACBrPixCD1.PSP.epCob.CobSolicitada.chave := dtmMain.ACBrPixCD1.PSP.ChavePIX;
  dtmMain.ACBrPixCD1.PSP.epCob.CobSolicitada.calendario.expiracao := seCobrancaExpiracao.Value;
  //dtmMain.ACBrPixCD1.PSP.epCob.CobSolicitada.devedor.nome := 'CONSUMIDOR FINAL';
  //dtmMain.ACBrPixCD1.PSP.epCob.CobSolicitada.devedor.cpf  := '00548352240';
  dtmMain.ACBrPixCD1.PSP.epCob.CobSolicitada.valor.original := StrToCurr(fleQREValor.Text);

  IF dtmMain.ACBrPixCD1.PSP.epCob.CriarCobrancaImediata then begin
    qrcodees := dtmMain.ACBrPixCD1.PSP.epCob.CobGerada.pixCopiaECola;
    AdicionarLinhaLog('*****'+qrcodees);
    //AdicionarLinhaLog(dtmMain.ACBrPixCD1.PSP.Http.ToString epCob.CobCompleta.AsJSON);
    PintarQRCode(qrcodees, imgQRE.Picture.Bitmap, qrUTF8BOM);
  end
  else begin
    fFluxoDados.EmErro := True;
    AdicionarLinhaLog('>>>>>>>>Erro ao criar cobrança: ' + sLineBreak +
        (dtmMain.ACBrPixCD1.PSP.epCob.Problema.AsJSON));
    ShowMessage('Erro ao criar cobrança: ' + sLineBreak +
        FormatarJSON(dtmMain.ACBrPixCD1.PSP.epCob.Problema.AsJSON));
  end;
  }


end;

procedure TForm15.btSalvarParametrosClick(Sender: TObject);
begin
  GravarConfiguracao;
  AplicarConfiguracao;
end;

procedure TForm15.ConfigurarACBrPSPs;
begin
  //AdicionarLinhaLog('  - ConfigurarACBrPSPs');

  dtmmain.ACBrPSPShipay1.ClientID  := edtShipayClientID.Text;
  dtmmain.ACBrPSPShipay1.SecretKey := edtShipaySecretKey.Text;
  dtmmain.ACBrPSPShipay1.AccessKey := edtShipayAccessKey.Text;

  dtmmain.ACBrPSPBancoDoBrasil1.ChavePIX := edtBBChavePIX.Text;
  dtmmain.ACBrPSPBancoDoBrasil1.ClientID := edtBBClientID.Text;
  dtmmain.ACBrPSPBancoDoBrasil1.ClientSecret := edtBBClientSecret.Text;
  dtmmain.ACBrPSPBancoDoBrasil1.DeveloperApplicationKey := edtBBDevAppKey.Text;
  dtmmain.ACBrPSPBancoDoBrasil1.BBAPIVersao := TACBrBBAPIVersao(cbBBVersaoAPI.ItemIndex);

  if (dtmmain.ACBrPSPBancoDoBrasil1.BBAPIVersao = apiVersao2) then
  begin
    if (rgBBTipoCertificado.ItemIndex = 0) then  // Se usa PFX
    begin
      dtmmain.ACBrPSPBancoDoBrasil1.ArquivoPFX := edBBArqPFX.Text;
      dtmmain.ACBrPSPBancoDoBrasil1.SenhaPFX := edBBSenhaPFX.Text;
    end
    else  // Se usa Certificado PEM + Chave Privada
    begin
      dtmmain.ACBrPSPBancoDoBrasil1.ArquivoChavePrivada := edBBArqChavePrivada.Text;
      dtmmain.ACBrPSPBancoDoBrasil1.ArquivoCertificado := edBBArqCertificado.Text;
    end;
  end;

  dtmmain.ACBrPSPItau1.ChavePIX := edtItauChavePIX.Text;
  dtmmain.ACBrPSPItau1.ClientID := edtItauClientID.Text;
  dtmmain.ACBrPSPItau1.ClientSecret := edtItauClientSecret.Text;
  dtmmain.ACBrPSPItau1.ArquivoChavePrivada := edtItauArqChavePrivada.Text;
  dtmmain.ACBrPSPItau1.ArquivoCertificado := edtItauArqCertificado.Text;

  dtmmain.ACBrPSPSantander1.ChavePIX := edSantanderChavePIX.Text;
  dtmmain.ACBrPSPSantander1.ConsumerKey := edSantanderConsumerKey.Text;
  dtmmain.ACBrPSPSantander1.ConsumerSecret := edSantanderConsumerSecret.Text;
  dtmmain.ACBrPSPSantander1.SenhaPFX := edSantanderSenhaCertificadoPFX.Text;
  dtmmain.ACBrPSPSantander1.ArquivoPFX := edSantanderArqCertificadoPFX.Text;

 { dtmmain.ACBrPSPSicredi1.ChavePIX := edSicrediChavePIX.Text;
  dtmmain.ACBrPSPSicredi1.ClientID := edSicrediClientID.Text;
  ACBrPSPSicredi1.ClientSecret := edSicrediClientSecret.Text;
  ACBrPSPSicredi1.ArquivoChavePrivada := edSicrediArqChavePrivada.Text;
  ACBrPSPSicredi1.ArquivoCertificado := edSicrediArqCertificado.Text;

  ACBrPSPSicoob1.ChavePIX := edSicoobChavePIX.Text;
  ACBrPSPSicoob1.ClientID := edSicoobClientID.Text;
  ACBrPSPSicoob1.TokenSandbox := edSicoobTokenSandbox.Text;
  ACBrPSPSicoob1.ArquivoChavePrivada := edSicoobArqChavePrivada.Text;
  ACBrPSPSicoob1.ArquivoCertificado := edSicoobArqCertificado.Text;  }

  dtmmain.ACBrPSPPagSeguro1.ChavePIX := edPagSeguroChavePIX.Text;
  dtmmain.ACBrPSPPagSeguro1.ClientID := edPagSeguroClientID.Text;
  dtmmain.ACBrPSPPagSeguro1.ClientSecret := edPagSeguroClientSecret.Text;
  dtmmain.ACBrPSPPagSeguro1.ArquivoChavePrivada := edPagSeguroArqChavePrivada.Text;
  dtmmain.ACBrPSPPagSeguro1.ArquivoCertificado := edPagSeguroArqCertificado.Text;

  dtmmain.ACBrPSPGerenciaNet1.ChavePIX := edGerenciaNetChavePIX.Text;
  dtmmain.ACBrPSPGerenciaNet1.ClientID := edGerenciaNetClientID.Text;
  dtmmain.ACBrPSPGerenciaNet1.ClientSecret := edGerenciaNetClientSecret.Text;
  dtmmain.ACBrPSPGerenciaNet1.ArquivoPFX := edGerenciaNetArqPFX.Text;

  dtmmain.ACBrPSPBradesco1.ChavePIX := edBradescoChavePIX.Text;
  dtmmain.ACBrPSPBradesco1.ClientID := edBradescoClientID.Text;
  dtmmain.ACBrPSPBradesco1.ClientSecret := edBradescoClientSecret.Text;
  dtmmain.ACBrPSPBradesco1.ArquivoPFX := edBradescoArqPFX.Text;
  dtmmain.ACBrPSPBradesco1.SenhaPFX := edBradescoSenhaPFX.Text;

  dtmmain.ACBrPSPPixPDV1.CNPJ := edPixPDVCNPJ.Text;
  dtmmain.ACBrPSPPixPDV1.Token := edPixPDVToken.Text;
  dtmmain.ACBrPSPPixPDV1.ClientSecret := edPixPDVSecretKey.Text;

  dtmmain.ACBrPSPInter1.ChavePIX := edInterChavePIX.Text;
  dtmmain.ACBrPSPInter1.ClientID := edInterClientID.Text;
  dtmmain.ACBrPSPInter1.ClientSecret := edInterClientSecret.Text;
  dtmmain.ACBrPSPInter1.ArquivoChavePrivada := edInterChavePrivada.Text;
  dtmmain.ACBrPSPInter1.ArquivoCertificado := edInterCertificado.Text;

  {dtmmain.ACBrPSPAilos1.ChavePIX := edAilosChavePIX.Text;
  dtmmain.ACBrPSPAilos1.ClientID := edAilosClientID.Text;
  ACBrPSPAilos1.ClientSecret := edAilosClientSecret.Text;
  ACBrPSPAilos1.ArquivoChavePrivada := edAilosChavePrivada.Text;
  ACBrPSPAilos1.ArquivoCertificado := edAilosCertificado.Text;
  ACBrPSPAilos1.RootCrt := edAilosCertificadoRoot.Text;

  dtmmain.ACBrPSPMatera1.ChavePIX := edMateraChavePIX.Text;
  ACBrPSPMatera1.ClientID := edMateraClientID.Text;
  ACBrPSPMatera1.AccountId := edMateraAccountId.Text;
  ACBrPSPMatera1.SecretKey := edMateraSecretKey.Text;
  ACBrPSPMatera1.MediatorFee := StringToFloatDef(edMateraMediatorFee.Text, 0);
  ACBrPSPMatera1.ClientSecret := edMateraClientSecret.Text;
  ACBrPSPMatera1.ArquivoCertificado := edMateraArqCertificado.Text;
  ACBrPSPMatera1.ArquivoChavePrivada := edMateraArqChavePrivada.Text;

  ACBrPSPCielo1.ChavePIX := edCieloChavePIX.Text;
  ACBrPSPCielo1.ClientID := edCieloClientID.Text;
  ACBrPSPCielo1.ClientSecret := edCieloClientSecret.Text;      }
end;

procedure TForm15.FormCreate(Sender: TObject);
begin
  NomeArquivoConfiguracao := ExtractFileDir(ParamStr(0))+ '\ControlW_Rest.dat';
  InicializarComponentesDefault;
  LerConfiguracao;
end;

procedure TForm15.GravarConfiguracao;
Var
  Ini : TIniFile ;
begin
  AdicionarLinhaLog('- LerConfiguracao: '+NomeArquivoConfiguracao);
  Ini := TIniFile.Create(NomeArquivoConfiguracao);
  try
    Ini.WriteString('Recebedor', 'Nome', edtRecebedorNome.Text);
    Ini.WriteString('Recebedor', 'CEP', edtRecebedorCEP.Text);
    Ini.WriteString('Recebedor', 'Cidade-', edtRecebedorCidade.Text);
    Ini.WriteString('Recebedor', 'UF', cbxRecebedorUF.Text);

    Ini.WriteBool('Autenticar', 'Manual', cbAutenticacaoManual.Checked);
    if (not cbAutenticacaoManual.Checked) then
    begin
      Ini.DeleteKey('Autenticar', 'Token');
      Ini.DeleteKey('Autenticar', 'Validade');
    end;

    Ini.WriteInteger('PIX','PSP', cbxPSPAtual.ItemIndex);
    Ini.WriteInteger('PIX','Ambiente', cbxAmbiente.ItemIndex);
    Ini.WriteInteger('PIX', 'TimeOut', seTimeout.Value);

    Ini.WriteInteger('Cobranca', 'Expiracao', seCobrancaExpiracao.Value);

    Ini.WriteString('Proxy', 'Host', edtProxyHost.Text);
    Ini.WriteString('Proxy', 'Porta', seProxyPorta.Text);
    Ini.WriteString('Proxy', 'User', edtProxyUser.Text);
    Ini.WriteString('Proxy', 'Pass', EncodeBase64(StrCrypt(edtProxySenha.Text, '')) );

    Ini.WriteString('Log', 'Arquivo', edtArqLog.Text);
    Ini.WriteInteger('Log', 'Nivel', cbxNivelLog.ItemIndex);

    Ini.WriteString('Shipay', 'ClientID', edtShipayClientID.Text);
    Ini.WriteString('Shipay', 'SecretKey', edtShipaySecretKey.Text);
    Ini.WriteString('Shipay', 'AccessKey', edtShipayAccessKey.Text);

    Ini.WriteString('BancoBrasil', 'ChavePIX', edtBBChavePIX.Text);
    Ini.WriteString('BancoBrasil', 'ClientID', edtBBClientID.Text);
    Ini.WriteString('BancoBrasil', 'ClientSecret', edtBBClientSecret.Text);
    Ini.WriteString('BancoBrasil', 'DeveloperApplicationKey', edtBBDevAppKey.Text);
    Ini.WriteString('BancoBrasil', 'ArqChavePrivada', edBBArqChavePrivada.Text);
    Ini.WriteString('BancoBrasil', 'ArqCertificado', edBBArqCertificado.Text);
    Ini.WriteString('BancoBrasil', 'ArqPFX', edBBArqPFX.Text);
    Ini.WriteString('BancoBrasil', 'SenhaPFX', edBBSenhaPFX.Text);
    Ini.WriteInteger('BancoBrasil', 'VersaoAPI', cbBBVersaoAPI.ItemIndex);
    Ini.WriteInteger('BancoBrasil', 'TipoCertificado', rgBBTipoCertificado.ItemIndex);

    Ini.WriteString('Itau', 'ChavePIX', edtItauChavePIX.Text);
    Ini.WriteString('Itau', 'ClientID', edtItauClientID.Text);
    Ini.WriteString('Itau', 'ClientSecret', edtItauClientSecret.Text);
    Ini.WriteString('Itau', 'ArqChavePrivada', edtItauArqChavePrivada.Text);
    Ini.WriteString('Itau', 'ArqCertificado', edtItauArqCertificado.Text);

    Ini.WriteString('Santander', 'ChavePIX', edSantanderChavePIX.Text);
    Ini.WriteString('Santander', 'ConsumerKey', edSantanderConsumerKey.Text);
    Ini.WriteString('Santander', 'ConsumerSecret', edSantanderConsumerSecret.Text);
    Ini.WriteString('Santander', 'ArqCertificadoPFX', edSantanderArqCertificadoPFX.Text);
    Ini.WriteString('Santander', 'SenhaCertificadoPFX', edSantanderSenhaCertificadoPFX.Text);

    Ini.WriteString('Sicredi', 'ChavePIX', edSicrediChavePIX.Text);
    Ini.WriteString('Sicredi', 'ClientID', edSicrediClientID.Text);
    Ini.WriteString('Sicredi', 'ClientSecret', edSicrediClientSecret.Text);
    Ini.WriteString('Sicredi', 'ArqChavePrivada', edSicrediArqChavePrivada.Text);
    Ini.WriteString('Sicredi', 'ArqCertificado', edSicrediArqCertificado.Text);
    if FileExists(edSicrediGerarCSR.Text) then
      Ini.WriteString('Sicredi', 'CertificadoCSR', edSicrediGerarCSR.Text);

    Ini.WriteString('Sicoob', 'ChavePIX', edSicoobChavePIX.Text);
    Ini.WriteString('Sicoob', 'ClientID', edSicoobClientID.Text);
    Ini.WriteString('Sicoob', 'TokenSandbox', edSicoobTokenSandbox.Text);
    Ini.WriteString('Sicoob', 'ArqChavePrivada', edSicoobArqChavePrivada.Text);
    Ini.WriteString('Sicoob', 'ArqCertificado', edSicoobArqCertificado.Text);

    Ini.WriteString('PagSeguro', 'ChavePIX', edPagSeguroChavePIX.Text);
    Ini.WriteString('PagSeguro', 'ClientID', edPagSeguroClientID.Text);
    Ini.WriteString('PagSeguro', 'ClientSecret', edPagSeguroClientSecret.Text);
    Ini.WriteString('PagSeguro', 'ArqChavePrivada', edPagSeguroArqChavePrivada.Text);
    Ini.WriteString('PagSeguro', 'ArqCertificado', edPagSeguroArqCertificado.Text);

    Ini.WriteString('GerenciaNet', 'ChavePIX', edGerenciaNetChavePIX.Text);
    Ini.WriteString('GerenciaNet', 'ClientID', edGerenciaNetClientID.Text);
    Ini.WriteString('GerenciaNet', 'ClientSecret', edGerenciaNetClientSecret.Text);
    Ini.WriteString('GerenciaNet', 'ArqPFX', edGerenciaNetArqPFX.Text);

    Ini.WriteString('Bradesco', 'ChavePIX', edBradescoChavePIX.Text);
    Ini.WriteString('Bradesco', 'ClientID', edBradescoClientID.Text);
    Ini.WriteString('Bradesco', 'ClientSecret', edBradescoClientSecret.Text);
    Ini.WriteString('Bradesco', 'ArqPFX', edBradescoArqPFX.Text);
    Ini.WriteString('Bradesco', 'SenhaPFX', edBradescoSenhaPFX.Text);

    Ini.WriteString('Inter', 'ChavePIX', edInterChavePIX.Text);
    Ini.WriteString('Inter', 'ClientID', edInterClientID.Text);
    Ini.WriteString('Inter', 'ClientSecret', edInterClientSecret.Text);
    Ini.WriteString('Inter', 'ArqChavePrivada', edInterChavePrivada.Text);
    Ini.WriteString('Inter', 'ArqCertificado', edInterCertificado.Text);

    Ini.WriteString('PixPDV', 'CNPJ', edPixPDVCNPJ.Text);
    Ini.WriteString('PixPDV', 'Token', edPixPDVToken.Text);
    Ini.WriteString('PixPDV', 'SecretKey', edPixPDVSecretKey.Text);

    Ini.WriteString('Ailos', 'ChavePIX', edAilosChavePIX.Text);
    Ini.WriteString('Ailos', 'ClientID', edAilosClientID.Text);
    Ini.WriteString('Ailos', 'ClientSecret', edAilosClientSecret.Text);
    Ini.WriteString('Ailos', 'ArqChavePrivada', edAilosChavePrivada.Text);
    Ini.WriteString('Ailos', 'ArqCertificado', edAilosCertificado.Text);
    Ini.WriteString('Ailos', 'ArqCertificadoRoot', edAilosCertificadoRoot.Text);

    Ini.WriteString('Matera', 'ClientID', edMateraClientID.Text);
    Ini.WriteString('Matera', 'SecretKey', edMateraSecretKey.Text);
    Ini.WriteString('Matera', 'ClientSecret', edMateraClientSecret.Text);
    Ini.WriteString('Matera', 'ArqCertificado', edMateraArqCertificado.Text);
    Ini.WriteString('Matera', 'ArqChavePrivada', edMateraArqChavePrivada.Text);
    Ini.WriteString('Matera', 'AccountID', edMateraAccountId.Text);
    Ini.WriteString('Matera', 'ChavePIX', edMateraChavePIX.Text);
    Ini.WriteFloat('Matera', 'MediatorFee', StringToFloatDef(edMateraMediatorFee.Text, 0));

    Ini.WriteString('Cielo', 'ChavePIX', edCieloChavePIX.Text);
    Ini.WriteString('Cielo', 'ClientID', edCieloClientID.Text);
    Ini.WriteString('Cielo', 'ClientSecret', edCieloClientSecret.Text);
  finally
     Ini.Free;
  end;

  //LigarAlertasdeErrosDeConfiguracao;
end;


procedure TForm15.AdicionarLinhaLog(AMensagem: String);
begin
  if Assigned(mLog) then
    mLog.Lines.Add(AMensagem);
end;

procedure TForm15.PintarQRCodeEstatico;
var
  qrcodees : string;
begin
  qrcodees := dtmMain.ACBrPixCD1.GerarQRCodeEstatico(
                       StrToFloatDef(fleQREValor.Text, 0),
                       edtQREInfoAdicional.Text,
                       '');

  AdicionarLinhaLog(qrcodees);

  //AdicionarLinhaLog(dtmMain.ACBrPixCD1.PSP.Http.ToString epCob.CobCompleta.AsJSON);
  PintarQRCode(qrcodees, imgQRE.Picture.Bitmap, qrUTF8BOM);
end;

procedure TForm15.sbGerenciaNetAcharPFXClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edGerenciaNetArqPFX.Text := RemoverPathAplicacao(OpenDialog1.FileName);
  ValidarCertificadoPSPGerenciaNet;
end;

procedure TForm15.AplicarConfiguracao;
begin
  AdicionarLinhaLog('- AplicarConfiguracao');
  ConfigurarACBrPIXCD;
  ConfigurarACBrPSPs;
end;

procedure TForm15.BitBtn1Click(Sender: TObject);
var
  qrd: TACBrPIXQRCodeEstatico;
begin
  if dtmMain.ACBrPixCD1.PSP.epCob.ConsultarCobrancaImediata(txidEstatico.Text, 0) then begin
    AdicionarLinhaLog(#13+#13+'Cobrança'+#13+#13+FormatarJSON(dtmMain.ACBrPixCD1.PSP.epCob.CobCompleta.AsJSON));
  end
  else AdicionarLinhaLog('Nenhum Resultado!');

  if dtmMain.ACBrPixCD1.PSP.epCob.CobCompleta.status = stcATIVA then estado := 'ATIVA'
  else if dtmMain.ACBrPixCD1.PSP.epCob.CobCompleta.status = stcCONCLUIDA then estado := 'CONCLUIDA';


exit;
  qrd := TACBrPIXQRCodeEstatico.Create;
  try
    qrd.IgnoreErrors := True;
    qrd.AsString := Trim(qrcodees);
    AnalisarBRCode(qrd);
  finally
    qrd.Free;
  end;
end;

procedure TForm15.ConfigurarACBrPIXCD;
begin
  AdicionarLinhaLog('  - ConfigurarACBrPIXCD');
  dtmMain.ACBrPixCD1.Recebedor.Nome := edtRecebedorNome.Text;
  dtmMain.ACBrPixCD1.Recebedor.CEP := edtRecebedorCEP.Text;
  dtmMain.ACBrPixCD1.Recebedor.Cidade := edtRecebedorCidade.Text;
  dtmMain.ACBrPixCD1.Recebedor.UF := cbxRecebedorUF.Text;

  dtmMain.ACBrPixCD1.Ambiente := TACBrPixCDAmbiente(cbxAmbiente.ItemIndex);
  dtmMain.ACBrPixCD1.TimeOut := seTimeout.Value;

  dtmMain.ACBrPixCD1.Proxy.Host := edtProxyHost.Text;
  dtmMain.ACBrPixCD1.Proxy.Port := seProxyPorta.Text;
  dtmMain.ACBrPixCD1.Proxy.User := edtProxyUser.Text;
  dtmMain.ACBrPixCD1.Proxy.Pass := edtProxySenha.Text;

  dtmMain.ACBrPixCD1.ArqLOG := edtArqLog.Text;
  dtmMain.ACBrPixCD1.NivelLog := cbxNivelLog.ItemIndex;

  case cbxPSPAtual.ItemIndex of
    0: dtmMain.ACBrPixCD1.PSP := dtmMain.ACBrPSPShipay1;
    1: dtmMain.ACBrPixCD1.PSP := dtmMain.ACBrPSPBancoDoBrasil1;
    2: dtmMain.ACBrPixCD1.PSP := dtmMain.ACBrPSPItau1;
    3: dtmMain.ACBrPixCD1.PSP := dtmMain.ACBrPSPSantander1;
    //4: dtmMain.ACBrPixCD1.PSP := dtmMain.ACBrPSPSicredi1;
    //5: dtmMain.ACBrPixCD1.PSP := ACBrPSPSicoob1;
    6: dtmMain.ACBrPixCD1.PSP := dtmMain.ACBrPSPPagSeguro1;
    7: dtmMain.ACBrPixCD1.PSP := dtmMain.ACBrPSPGerenciaNet1;
    8: dtmMain.ACBrPixCD1.PSP := dtmMain.ACBrPSPBradesco1;
    //9: dtmMain.ACBrPixCD1.PSP := ACBrPSPPixPDV1;
    10: dtmMain.ACBrPixCD1.PSP := dtmMain.ACBrPSPInter1;
    //11: dtmMain.ACBrPixCD1.PSP := ACBrPSPAilos1;
    //12: dtmMain.ACBrPixCD1.PSP := ACBrPSPMatera1;
    13: dtmMain.ACBrPixCD1.PSP := dtmMain.ACBrPSPCielo1;
  else
    raise Exception.Create('PSP configurado é inválido');
  end;

  if cbAutenticacaoManual.Checked then
  begin
    dtmMain.ACBrPixCD1.PSP.OnAntesAutenticar := DoAntesAutenticar;
    dtmMain.ACBrPixCD1.PSP.OnDepoisAutenticar := DoDepoisAutenticar;
  end;
end;

procedure TForm15.DoAntesAutenticar(var aToken: String;var aValidadeToken: TDateTime);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(NomeArquivoConfiguracao);
  try
    aToken := Ini.ReadString('Autenticar', 'Token', EmptyStr);
    aValidadeToken := Ini.ReadDateTime('Autenticar', 'Validade', 0);
  finally
    Ini.Free;
  end;
end;

procedure TForm15.DoDepoisAutenticar(const aToken: String;
  const aValidadeToken: TDateTime);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(NomeArquivoConfiguracao);
  try
    Ini.WriteString('Autenticar', 'Token', aToken);
    Ini.WriteDateTime('Autenticar', 'Validade', aValidadeToken);
  finally
    Ini.Free;
  end;
end;

procedure TForm15.edGerenciaNetChavePIXChange(Sender: TObject);
begin
  cbGerenciaNetTipoChave.ItemIndex := Integer(DetectarTipoChave(edGerenciaNetChavePIX.Text));
  imGerenciaNetErroChavePix.Visible := NaoEstaVazio(edGerenciaNetChavePIX.Text) and (cbGerenciaNetTipoChave.ItemIndex = 0);
end;

procedure TForm15.InicializarComponentesDefault;
var
  i, l: Integer;
  j: TACBrPixCDAmbiente;
  k: TACBrPIXTipoChave;
  m: TACBrPIXStatusCobranca;
  n: TACBrPIXDescontoModalidade;
  o: TACBrPIXValoresModalidade;
  p: TACBrPIXJurosModalidade;
  q: TACBrBBAPIVersao;
begin
  cbxPSPAtual.Items.Clear;
  for i := 0 to pgPSPs.PageCount-1 do
     cbxPSPAtual.Items.Add( pgPSPs.Pages[i].Caption );

  cbxRecebedorUF.Items.Clear;
  for i := Low(DFeUF) to High(DFeUF) do
     cbxRecebedorUF.Items.Add( DFeUF[i] );

  cbxAmbiente.Items.Clear;
  for j := Low(TACBrPixCDAmbiente) to High(TACBrPixCDAmbiente) do
     cbxAmbiente.Items.Add( GetEnumName(TypeInfo(TACBrPixCDAmbiente), integer(j) ));

  cbxBBTipoChave.Items.Clear;
  for k := Low(TACBrPIXTipoChave) to High(TACBrPIXTipoChave) do
     cbxBBTipoChave.Items.Add( GetEnumName(TypeInfo(TACBrPIXTipoChave), integer(k) ));
  cbxItauTipoChave.Items.Assign(cbxBBTipoChave.Items);
  cbSantanderTipoChave.Items.Assign(cbxBBTipoChave.Items);
  cbSicrediTipoChave.Items.Assign(cbxBBTipoChave.Items);
  cbSicoobTipoChave.Items.Assign(cbxBBTipoChave.Items);
  cbPagSeguroTipoChave.Items.Assign(cbxBBTipoChave.Items);
  cbGerenciaNetTipoChave.Items.Assign(cbxBBTipoChave.Items);
  cbBradescoTipoChave.Items.Assign(cbxBBTipoChave.Items);
  cbInterTipoChave.Items.Assign(cbxBBTipoChave.Items);
  cbAilosTipoChave.Items.Assign(cbxBBTipoChave.Items);
  cbCieloTipoChave.Items.Assign(cbxBBTipoChave.Items);

  {cbxSolicitarDevolucaoPix_Natureza.Items.Clear;
  for l := 0 to Integer(High(TACBrPIXNaturezaDevolucao)) do
     cbxSolicitarDevolucaoPix_Natureza.Items.Add( GetEnumName(TypeInfo(TACBrPIXNaturezaDevolucao), l ));
  cbxSolicitarDevolucaoPix_Natureza.ItemIndex := 1;

  cbxConsultarCobrancas_Status.Items.Clear;
  for m := Low(TACBrPIXStatusCobranca) to High(TACBrPIXStatusCobranca) do
     cbxConsultarCobrancas_Status.Items.Add( GetEnumName(TypeInfo(TACBrPIXStatusCobranca), Integer(m) ));
  cbxConsultarCobrancas_Status.ItemIndex := 0;

  cbCobVConsultarStatus.Items.Clear;
  for m := Low(TACBrPIXStatusCobranca) to High(TACBrPIXStatusCobranca) do
     cbCobVConsultarStatus.Items.Add( GetEnumName(TypeInfo(TACBrPIXStatusCobranca), Integer(m) ));
  cbCobVConsultarStatus.ItemIndex := 0;

  cbCobVDescModalidade.Items.Clear;
  for n := Low(TACBrPIXDescontoModalidade) to High(TACBrPIXDescontoModalidade) do
    cbCobVDescModalidade.Items.Add(IntToStr(Ord(n)) + ' - ' + DescontoModalidadeToString(n));
  cbCobVDescModalidade.ItemIndex := 0;

  cbCobVMultaModalidade.Items.Clear;
  for o := Low(TACBrPIXValoresModalidade) to High(TACBrPIXValoresModalidade) do
    cbCobVMultaModalidade.Items.Add(IntToStr(Ord(o)) + ' - ' + ValoresModalidadeToString(o));
  cbCobVMultaModalidade.ItemIndex := 0;

  cbCobVJurosModalidade.Items.Clear;
  for p := Low(TACBrPIXJurosModalidade) to High(TACBrPIXJurosModalidade) do
    cbCobVJurosModalidade.Items.Add(IntToStr(Ord(p)) + ' - ' + JurosModalidadeToString(p));
  cbCobVJurosModalidade.ItemIndex := 0;   }

  cbBBVersaoAPI.Items.Clear;
  for q := Low(TACBrBBAPIVersao) to High(TACBrBBAPIVersao) do
    cbBBVersaoAPI.Items.Add(GetEnumName(TypeInfo(TACBrBBAPIVersao), Integer(q)));
  cbBBVersaoAPI.ItemIndex := 0;
  {cbBBVersaoAPIChange(Nil);

  dtConsultarPixRecebidosInicio.DateTime := StartOfTheDay(Today);
  dtConsultarPixRecebidosFim.DateTime := EndOfTheDay(Today);

  dtConsultarCobrancas_Inicio.DateTime := StartOfTheDay(Today);
  dtConsultarCobrancas_Fim.DateTime := EndOfTheDay(Today);

  edCobVVencimento.DateTime := IncDay(Now, 7);}
  pnBBPFX.Parent := pnBBCertificados;
  pnBBChaveECert.Parent := pnBBCertificados;
end;

procedure TForm15.LerConfiguracao;
var
  Ini: TIniFile;
begin
  AdicionarLinhaLog('- LerConfiguracao: '+NomeArquivoConfiguracao);
  Ini := TIniFile.Create(NomeArquivoConfiguracao);
  try
    edtRecebedorNome.Text := Ini.ReadString('Recebedor', 'Nome', '');
    edtRecebedorCEP.Text := Ini.ReadString('Recebedor', 'CEP', '');
    edtRecebedorCidade.Text := Ini.ReadString('Recebedor', 'Cidade', '');
    cbxRecebedorUF.ItemIndex := cbxRecebedorUF.Items.IndexOf(Ini.ReadString('Recebedor', 'UF', ''));

    cbAutenticacaoManual.Checked := Ini.ReadBool('Autenticar', 'Manual', False);

    cbxPSPAtual.ItemIndex := Ini.ReadInteger('PIX','PSP', 0);
    cbxAmbiente.ItemIndex := Ini.ReadInteger('PIX','Ambiente', 0);
    seTimeout.Value := Ini.ReadInteger('PIX', 'TimeOut', ChttpTimeOutDef);

    seCobrancaExpiracao.Value := Ini.ReadInteger('Cobranca', 'Expiracao', seCobrancaExpiracao.Value);

    edtProxyHost.Text := Ini.ReadString('Proxy', 'Host', '');
    seProxyPorta.Text := Ini.ReadString('Proxy', 'Porta', '');
    edtProxyUser.Text := Ini.ReadString('Proxy', 'User', '');
    edtProxySenha.Text := StrCrypt(DecodeBase64(Ini.ReadString('Proxy', 'Pass', '')), 'ControlW Sistemas');

    edtArqLog.Text := Ini.ReadString('Log', 'Arquivo', '');
    cbxNivelLog.ItemIndex := Ini.ReadInteger('Log', 'Nivel', 1);

    edtShipayClientID.Text := Ini.ReadString('Shipay', 'ClientID', '');
    edtShipaySecretKey.Text := Ini.ReadString('Shipay', 'SecretKey', '');
    edtShipayAccessKey.Text := Ini.ReadString('Shipay', 'AccessKey', '');

    edtBBChavePIX.Text := Ini.ReadString('BancoBrasil', 'ChavePIX', '');
    edtBBClientID.Text := Ini.ReadString('BancoBrasil', 'ClientID', '');
    edtBBClientSecret.Text := Ini.ReadString('BancoBrasil', 'ClientSecret', '');
    edtBBDevAppKey.Text := Ini.ReadString('BancoBrasil', 'DeveloperApplicationKey', '');
    edBBArqChavePrivada.Text := Ini.ReadString('BancoBrasil', 'ArqChavePrivada', edBBArqChavePrivada.Text);
    edBBArqCertificado.Text := Ini.ReadString('BancoBrasil', 'ArqCertificado', edBBArqCertificado.Text);
    edBBArqPFX.Text := Ini.ReadString('BancoBrasil', 'ArqPFX', edBBArqPFX.Text);
    edBBSenhaPFX.Text := Ini.ReadString('BancoBrasil', 'SenhaPFX', edBBSenhaPFX.Text);
    cbBBVersaoAPI.ItemIndex := Ini.ReadInteger('BancoBrasil', 'VersaoAPI', cbBBVersaoAPI.ItemIndex);
    rgBBTipoCertificado.ItemIndex := Ini.ReadInteger('BancoBrasil', 'TipoCertificado', rgBBTipoCertificado.ItemIndex);
    //cbBBVersaoAPIChange(Nil);
    //gBBTipoCertificadoClick(Nil);

    edtItauChavePIX.Text := Ini.ReadString('Itau', 'ChavePIX', '');
    edtItauClientID.Text := Ini.ReadString('Itau', 'ClientID', '');
    edtItauClientSecret.Text := Ini.ReadString('Itau', 'ClientSecret', '');
    edtItauArqChavePrivada.Text := Ini.ReadString('Itau', 'ArqChavePrivada', edtItauArqChavePrivada.Text);
    edtItauArqCertificado.Text := Ini.ReadString('Itau', 'ArqCertificado', edtItauArqCertificado.Text);

    edSantanderChavePIX.Text := Ini.ReadString('Santander', 'ChavePIX', '');
    edSantanderConsumerKey.Text := Ini.ReadString('Santander', 'ConsumerKey', '');
    edSantanderConsumerSecret.Text := Ini.ReadString('Santander', 'ConsumerSecret', '');
    edSantanderArqCertificadoPFX.Text := Ini.ReadString('Santander', 'ArqCertificadoPFX', '');
    edSantanderSenhaCertificadoPFX.Text := Ini.ReadString('Santander', 'SenhaCertificadoPFX', '');

    edSicrediChavePIX.Text := Ini.ReadString('Sicredi', 'ChavePIX', '');
    edSicrediClientID.Text := Ini.ReadString('Sicredi', 'ClientID', '');
    edSicrediClientSecret.Text := Ini.ReadString('Sicredi', 'ClientSecret', '');
    edSicrediArqChavePrivada.Text := Ini.ReadString('Sicredi', 'ArqChavePrivada', edSicrediArqChavePrivada.Text);
    edSicrediArqCertificado.Text := Ini.ReadString('Sicredi', 'ArqCertificado', edSicrediArqCertificado.Text);
    edSicrediGerarCSR.Text := Ini.ReadString('Sicredi', 'CertificadoCSR', edSicrediGerarCSR.Text);
    edSicrediGerarChavePrivada.Text := edSicrediArqChavePrivada.Text;

    edSicoobChavePIX.Text := Ini.ReadString('Sicoob', 'ChavePIX', '');
    edSicoobClientID.Text := Ini.ReadString('Sicoob', 'ClientID', '');
    edSicoobTokenSandbox.Text := Ini.ReadString('Sicoob', 'TokenSandbox', '');
    edSicoobArqChavePrivada.Text := Ini.ReadString('Sicoob', 'ArqChavePrivada', edSicoobArqChavePrivada.Text);
    edSicoobArqCertificado.Text := Ini.ReadString('Sicoob', 'ArqCertificado', edSicoobArqCertificado.Text);

    edPagSeguroChavePIX.Text := Ini.ReadString('PagSeguro', 'ChavePIX', '');
    edPagSeguroClientID.Text := Ini.ReadString('PagSeguro', 'ClientID', '');
    edPagSeguroClientSecret.Text := Ini.ReadString('PagSeguro', 'ClientSecret', '');
    edPagSeguroArqChavePrivada.Text := Ini.ReadString('PagSeguro', 'ArqChavePrivada', edPagSeguroArqChavePrivada.Text);
    edPagSeguroArqCertificado.Text := Ini.ReadString('PagSeguro', 'ArqCertificado', edPagSeguroArqCertificado.Text);

    edGerenciaNetChavePIX.Text := Ini.ReadString('GerenciaNet', 'ChavePIX', '');
    edGerenciaNetClientID.Text := Ini.ReadString('GerenciaNet', 'ClientID', '');
    edGerenciaNetClientSecret.Text := Ini.ReadString('GerenciaNet', 'ClientSecret', '');
    edGerenciaNetArqPFX.Text := Ini.ReadString('GerenciaNet', 'ArqPFX', edGerenciaNetArqPFX.Text);

    edBradescoChavePIX.Text := Ini.ReadString('Bradesco', 'ChavePIX', '');
    edBradescoClientID.Text := Ini.ReadString('Bradesco', 'ClientID', '');
    edBradescoClientSecret.Text := Ini.ReadString('Bradesco', 'ClientSecret', '');
    edBradescoArqPFX.Text := Ini.ReadString('Bradesco', 'ArqPFX', edBradescoArqPFX.Text);
    edBradescoSenhaPFX.Text := Ini.ReadString('Bradesco', 'SenhaPFX', '');

    edInterChavePIX.Text := Ini.ReadString('Inter', 'ChavePIX', '');
    edInterClientID.Text := Ini.ReadString('Inter', 'ClientID', '');
    edInterClientSecret.Text := Ini.ReadString('Inter', 'ClientSecret', '');
    edInterChavePrivada.Text := Ini.ReadString('Inter', 'ArqChavePrivada', edInterChavePrivada.Text);
    edInterCertificado.Text := Ini.ReadString('Inter', 'ArqCertificado', edInterCertificado.Text);

    edPixPDVCNPJ.Text := Ini.ReadString('PixPDV', 'CNPJ', '');
    edPixPDVToken.Text := Ini.ReadString('PixPDV', 'Token', '');
    edPixPDVSecretKey.Text := Ini.ReadString('PixPDV', 'SecretKey', '');

    edAilosChavePIX.Text := Ini.ReadString('Ailos', 'ChavePIX', '');
    edAilosClientID.Text := Ini.ReadString('Ailos', 'ClientID', '');
    edAilosClientSecret.Text := Ini.ReadString('Ailos', 'ClientSecret', '');
    edAilosChavePrivada.Text := Ini.ReadString('Ailos', 'ArqChavePrivada', edAilosChavePrivada.Text);
    edAilosCertificado.Text := Ini.ReadString('Ailos', 'ArqCertificado', edAilosCertificadoRoot.Text);
    edAilosCertificadoRoot.Text := Ini.ReadString('Ailos', 'ArqCertificadoRoot', edAilosCertificadoRoot.Text);

    edMateraClientID.Text := Ini.ReadString('Matera', 'ClientID', '');
    edMateraSecretKey.Text := Ini.ReadString('Matera', 'SecretKey', '');
    edMateraClientSecret.Text := Ini.ReadString('Matera', 'ClientSecret', '');
    edMateraArqCertificado.Text := Ini.ReadString('Matera', 'ArqCertificado', '');
    edMateraArqChavePrivada.Text := Ini.ReadString('Matera', 'ArqChavePrivada', '');
    edMateraAccountId.Text := Ini.ReadString('Matera', 'AccountID', '');
    edMateraChavePIX.Text := Ini.ReadString('Matera', 'ChavePIX', '');
    edMateraMediatorFee.Text := FloatToString(Ini.ReadFloat('Matera', 'MediatorFee', 0));

    edCieloChavePIX.Text := Ini.ReadString('Cielo', 'ChavePIX', '');
    edCieloClientID.Text := Ini.ReadString('Cielo', 'ClientID', '');
    edCieloClientSecret.Text := Ini.ReadString('Cielo', 'ClientSecret', '');
  finally
    Ini.Free;
  end;

  AplicarConfiguracao;
  //LigarAlertasdeErrosDeConfiguracao;
end;

function TForm15.RemoverPathAplicacao(const AFileName: String): String;
var
  s: String;
begin
  s := Trim(AFileName);
  if (pos(ApplicationPath, s) = 1) then
    Result := ExtractFileName(s)
  else
    Result := s;
end;

procedure TForm15.ValidarCertificadoPSPGerenciaNet;
var
  a, e: String;
begin
  a := AdicionarPathAplicacao(edGerenciaNetArqPFX.Text);
  e := 'OK';
  if (a = '') then
    e := ACBrStr('Arquivo não especificado')
  else if (not FileExists(a)) then
    e := ACBrStr('Arquivo não encontrado')
  else
  begin
    try
      dtmMain.ACBrOpenSSLUtils1.LoadPFXFromFile(a);
    except
      On Ex: Exception do
        e := Ex.Message;
    end;
  end;

  lbGerenciaNetErroPFX.Caption := e;
  imGerenciaNetErroPFX.Visible := (e <> 'OK');
end;


function TForm15.AdicionarPathAplicacao(const AFileName: String): String;
var
  s: String;
begin
  s := Trim(AFileName);
  if (s = '') then
    Result := s
  else if (ExtractFilePath(AFileName) <> '') then
    Result := s
  else
    Result := ApplicationPath + s;
end;

function TForm15.FormatarJSON(const AJSON: String): String;
{$IfDef FPC}
var
  jpar: TJSONParser;
  j: TJsonObject;
{$EndIf}
begin
  Result := AJSON;
  {$IfDef FPC}
  try
    j := TJSONObject.Create();
    try
      Result := j.Decode(Result);
    finally
      j.Free;
    end;
    jpar := TJSONParser.Create(Result, [joUTF8]);
    try
      Result := jpar.Parse.FormatJSON([], 2);
    finally
      jpar.Free;
    end;
  except
    Result := AJSON;
  end;
  {$EndIf}
end;

procedure TForm15.VerificarConfiguracao;
begin
  VerificarConfiguracaoPIXCD;
end;

function TForm15.VerificarConfiguracaoPIXCD : boolean;
var
  erro : String;
begin
  erro := '';
  Result := false;
  if cbxPSPAtual.ItemIndex = 1 then begin
    if edGerenciaNetChavePIX.Text = '' then erro := erro + 'GerenciaNet: Chave PIX Nao Informada.' + #13;
    if edGerenciaNetClientSecret.Text = '' then erro := erro + 'GerenciaNet: ClientSecret Nao Informada.' + #13;
    if edGerenciaNetClientID.Text = '' then erro := erro + 'GerenciaNet: ClientID Nao Informada.' + #13;
    if edGerenciaNetArqPFX.Text = '' then erro := erro + 'GerenciaNet: ArqPFX Nao Informada.' + #13;
    exit;
  end;

  if erro <> '' then begin
    ShowMessage('ERRO: ' + erro);
    exit;
  end;

  Result := true;

end;


procedure TForm15.AnalisarBRCode(aBRCode: TACBrBRCode);
begin
  AdicionarLinhaLog('');
  if (aBRCode is TACBrPIXQRCodeEstatico) then
  with TACBrPIXQRCodeEstatico(aBRCode) do
  begin
    AdicionarLinhaLog('----- Analise do QRCode Estático -----');
    AdicionarLinhaLog('ChavePix: ' + PixKey);
    AdicionarLinhaLog('TipoChavePix: ' + GetEnumName(TypeInfo(TACBrPIXTipoChave), Integer(PixKeyType)));
    AdicionarLinhaLog('infoAdicional: ' + AdditionalInfo);
    AdicionarLinhaLog('pss: ' + IntToStr(pss));
  end
  else if (aBRCode is TACBrPIXQRCodeDinamico) then
  begin
    AdicionarLinhaLog('----- Analise do QRCode Dinâmico -----');
    AdicionarLinhaLog('URL: ' + TACBrPIXQRCodeDinamico(aBRCode).URL);
  end;

  AdicionarLinhaLog('NomeRecebedor: ' + aBRCode.MerchantName);
  AdicionarLinhaLog('CidadeRecebedor: ' + aBRCode.MerchantCity);
  AdicionarLinhaLog('CEPRecebedor: ' + aBRCode.PostalCode);
  AdicionarLinhaLog('Valor: ' + FormatFloat('0.00', aBRCode.TransactionAmount));
  AdicionarLinhaLog('TxId: ' + aBRCode.TxId);
  AdicionarLinhaLog(aBRCode.Text);

end;



end.

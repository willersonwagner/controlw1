object Form1: TForm1
  Left = 380
  Top = 192
  Caption = 'Cupom Eletr'#244'nico - Envio'
  ClientHeight = 389
  ClientWidth = 583
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClick = FormClick
  OnCreate = FormCreate
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 0
    Width = 126
    Height = 64
    Caption = 'Enviando Cupom: '#13#10'Nota: '#13#10'Chave: '#13#10'Total Emitidas: 0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Gauge1: TGauge
    Left = 0
    Top = 353
    Width = 583
    Height = 36
    Align = alBottom
    Progress = 0
    ExplicitWidth = 549
  end
  object Label2: TLabel
    Left = 80
    Top = 75
    Width = 11
    Height = 37
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 467
    Top = 8
    Width = 3
    Height = 13
  end
  object RichEdit1: TRichEdit
    Left = 0
    Top = 116
    Width = 583
    Height = 237
    Align = alBottom
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Zoom = 100
  end
  object Button1: TButton
    Left = 216
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    Visible = False
    OnClick = Button1Click
  end
  object Panel1: TPanel
    Left = 8
    Top = 72
    Width = 65
    Height = 41
    ParentBackground = False
    TabOrder = 2
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 20000
    OnTimer = Timer1Timer
    Left = 528
    Top = 8
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 4000
    OnTimer = Timer2Timer
    Left = 528
    Top = 112
  end
  object IBTransaction2: TFDTransaction
    Options.AutoStop = False
    Options.StopOptions = [xoIfCmdsInactive]
    Connection = BDControl
    Left = 376
    Top = 256
  end
  object QueryControlProd: TFDQuery
    Connection = BDControl
    Transaction = IBTransaction1
    Left = 456
    Top = 8
  end
  object QueryControlVenda: TFDQuery
    Connection = BDControl
    Transaction = IBTransaction2
    Left = 464
    Top = 216
  end
  object QueryControlDivs: TFDQuery
    Connection = BDControl
    Transaction = IBTransaction2
    Left = 456
    Top = 160
  end
  object IBTransaction1: TFDTransaction
    Options.Params.Strings = (
      'lock_timeout=10')
    Options.AutoStop = False
    Options.StopOptions = [xoIfCmdsInactive]
    Connection = BDControl
    Left = 376
    Top = 200
  end
  object ACBrIBPTax1: TACBrIBPTax
    ProxyPort = '8080'
    ContentsEncodingCompress = []
    NivelLog = 0
    Left = 264
  end
  object IBQueryServer1: TFDQuery
    Connection = BD_Servidor
    Transaction = IBTransaction3
    Left = 144
    Top = 176
  end
  object IBTransaction3: TFDTransaction
    Options.AutoStop = False
    Options.StopOptions = [xoIfCmdsInactive]
    Connection = BD_Servidor
    Left = 16
    Top = 124
  end
  object IBQueryServer2: TFDQuery
    Connection = BD_Servidor
    Transaction = IBTransaction3
    Left = 144
    Top = 224
  end
  object IBQuery1: TFDQuery
    Connection = BDControl
    Transaction = IBTransaction1
    Left = 456
    Top = 64
  end
  object IBQuery2: TFDQuery
    Connection = BDControl
    Transaction = IBTransaction2
    Left = 456
    Top = 112
  end
  object ACBrNFeDANFeRL1: TACBrNFeDANFeRL
    Sistema = 'Projeto ACBr - www.projetoacbr.com.br'
    MargemInferior = 0.700000000000000000
    MargemSuperior = 0.700000000000000000
    MargemEsquerda = 0.700000000000000000
    MargemDireita = 0.700000000000000000
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    CasasDecimais.Aliquota = 2
    CasasDecimais.MaskAliquota = ',0.00'
    ACBrNFe = ACBrNFe1
    ExibeCampoFatura = False
    Left = 256
    Top = 272
  end
  object ACBrNFeDANFCeFortes1: TACBrNFeDANFCeFortes
    Sistema = 'Projeto ACBr - www.projetoacbr.com.br'
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    CasasDecimais.Aliquota = 2
    CasasDecimais.MaskAliquota = ',0.00'
    TipoDANFE = tiSemGeracao
    FormularioContinuo = True
    TamanhoLogoHeight = 0
    TamanhoLogoWidth = 0
    FonteLinhaItem.Charset = DEFAULT_CHARSET
    FonteLinhaItem.Color = clWindowText
    FonteLinhaItem.Height = -9
    FonteLinhaItem.Name = 'Lucida Console'
    FonteLinhaItem.Style = []
    Left = 160
  end
  object ACBrNFeDANFeESCPOS1: TACBrNFeDANFeESCPOS
    Sistema = 'Projeto ACBr - www.projetoacbr.com.br'
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    CasasDecimais.Aliquota = 2
    CasasDecimais.MaskAliquota = ',0.00'
    TipoDANFE = tiSemGeracao
    FormularioContinuo = True
    Left = 160
    Top = 64
  end
  object TrayIcon1: TTrayIcon
    Animate = True
    PopupMenu = PopupMenu1
    OnClick = TrayIcon1Click
    Left = 256
    Top = 144
  end
  object PopupMenu1: TPopupMenu
    Left = 256
    Top = 96
    object Abrir1: TMenuItem
      Caption = 'Abrir'
      OnClick = Abrir1Click
    end
    object Fechar1: TMenuItem
      Caption = 'Fechar'
      OnClick = Fechar1Click
    end
  end
  object IBQuery3: TFDQuery
    Connection = BDControl
    Transaction = IBTransaction4
    Left = 464
    Top = 264
  end
  object IBTransaction4: TFDTransaction
    Options.AutoStop = False
    Options.StopOptions = [xoIfCmdsInactive]
    Connection = BDControl
    Left = 376
    Top = 144
  end
  object Timer3: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer3Timer
    Left = 528
    Top = 168
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 360
    Top = 8
  end
  object FinalizaTimer: TTimer
    Enabled = False
    OnTimer = FinalizaTimerTimer
    Left = 528
    Top = 56
  end
  object IdSNTP1: TIdSNTP
    BroadcastEnabled = True
    Host = 'time.windows.com'
    Port = 123
    ReceiveTimeout = 5000
    Left = 16
    Top = 272
  end
  object ACBrNFe1: TACBrNFe
    Configuracoes.Geral.SSLLib = libWinCrypt
    Configuracoes.Geral.SSLCryptLib = cryWinCrypt
    Configuracoes.Geral.SSLHttpLib = httpWinHttp
    Configuracoes.Geral.SSLXmlSignLib = xsLibXml2
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.ValidarDigest = False
    Configuracoes.Geral.ModeloDF = moNFCe
    Configuracoes.Geral.AtualizarXMLCancelado = True
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'RR'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.Tentativas = 10
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    DANFE = ACBrNFeDANFeRL1
    Left = 256
    Top = 216
  end
  object BDControl: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=SYSTEMA1'
      'Database=F:\ControlW\bd.fdb'
      'DriverID=FB')
    LoginPrompt = False
    Left = 376
    Top = 90
  end
  object BD_Servidor: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=SYSTEMA1'
      'Database=F:\ControlW\bd.fdb'
      'DriverID=FB')
    LoginPrompt = False
    Left = 144
    Top = 122
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 472
    Top = 320
  end
  object ACBrMail1: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    Left = 312
    Top = 64
  end
end

object Form72: TForm72
  Left = 0
  Top = 0
  Caption = 'Form72'
  ClientHeight = 202
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object IdThreadComponent1: TIdThreadComponent
    Active = False
    Loop = False
    Priority = tpNormal
    StopMode = smSuspend
    ThreadName = 'EnviarNFCe'
    OnException = IdThreadComponent1Exception
    OnRun = IdThreadComponent2Run
    Left = 136
    Top = 72
  end
  object BMDThread1: TBMDThread
    UpdateEnabled = False
    OnExecute = BMDThread1Execute
    Left = 248
    Top = 24
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = False
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentRangeInstanceLength = -1
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 328
    Top = 56
  end
  object BMDThread2: TBMDThread
    UpdateEnabled = False
    OnExecute = BMDThread2Execute
    Left = 256
    Top = 104
  end
  object ACBrNFeDANFEFR1: TACBrNFeDANFEFR
    Sistema = 'Projeto ACBr - www.projetoacbr.com.br'
    MargemInferior = 8.000000000000000000
    MargemSuperior = 8.000000000000000000
    MargemEsquerda = 6.000000000000000000
    MargemDireita = 5.100000000000000000
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
    EspessuraBorda = 1
    BorderIcon = [biSystemMenu, biMinimize, biMaximize]
    ThreadSafe = False
    Left = 328
    Top = 112
  end
end

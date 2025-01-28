object Form15: TForm15
  Left = 0
  Top = 0
  Caption = 'Form15'
  ClientHeight = 561
  ClientWidth = 751
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 344
    Width = 89
    Height = 29
    Caption = 'Button1'
    TabOrder = 0
  end
  object pgConfPixPSP: TPageControl
    Left = 0
    Top = 0
    Width = 751
    Height = 561
    ActivePage = TabSheet1
    Align = alClient
    TabHeight = 25
    TabOrder = 1
    TabWidth = 200
    object tsPIX: TTabSheet
      Caption = 'PIX'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        743
        526)
      object pConfPIX: TPanel
        Left = 81
        Top = 37
        Width = 592
        Height = 440
        Anchors = []
        BevelOuter = bvSpace
        TabOrder = 0
        object gbRecebedor: TGroupBox
          Left = 16
          Top = 16
          Width = 560
          Height = 120
          Caption = 'Recebedor'
          TabOrder = 0
          object pnRecebedor: TPanel
            Left = 2
            Top = 15
            Width = 556
            Height = 103
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              556
              103)
            object imgErrCEP: TImage
              Left = 532
              Top = 19
              Width = 16
              Height = 16
              Anchors = [akTop, akRight]
              Visible = False
            end
            object Label14: TLabel
              Left = 8
              Top = 0
              Width = 27
              Height = 13
              Caption = 'Nome'
            end
            object Label16: TLabel
              Left = 8
              Top = 48
              Width = 33
              Height = 13
              Caption = 'Cidade'
            end
            object Label18: TLabel
              Left = 416
              Top = 0
              Width = 19
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'CEP'
            end
            object sbConsultaCEP: TSpeedButton
              Left = 529
              Top = 16
              Width = 24
              Height = 23
              Anchors = [akTop, akRight]
              Flat = True
              Visible = False
            end
            object imgErrNome: TImage
              Left = 394
              Top = 19
              Width = 16
              Height = 16
              Anchors = [akTop, akRight]
              Visible = False
            end
            object Label42: TLabel
              Left = 416
              Top = 48
              Width = 13
              Height = 13
              Caption = 'UF'
            end
            object edtRecebedorNome: TEdit
              Left = 8
              Top = 16
              Width = 384
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
            end
            object edtRecebedorCidade: TEdit
              Left = 8
              Top = 64
              Width = 384
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
            object edtRecebedorCEP: TEdit
              Left = 416
              Top = 16
              Width = 113
              Height = 21
              Anchors = [akTop, akRight]
              TabOrder = 1
            end
            object cbxRecebedorUF: TComboBox
              Left = 416
              Top = 64
              Width = 113
              Height = 21
              Style = csDropDownList
              TabOrder = 3
            end
          end
        end
        object gbProxy: TGroupBox
          Left = 16
          Top = 304
          Width = 280
          Height = 108
          Caption = 'Proxy'
          TabOrder = 2
          object pnProxy: TPanel
            Left = 2
            Top = 15
            Width = 276
            Height = 91
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              276
              91)
            object Label8: TLabel
              Left = 8
              Top = 0
              Width = 22
              Height = 13
              Caption = 'Host'
            end
            object Label9: TLabel
              Left = 168
              Top = 0
              Width = 26
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Porta'
            end
            object Label10: TLabel
              Left = 8
              Top = 42
              Width = 36
              Height = 13
              Caption = 'Usu'#225'rio'
            end
            object Label36: TLabel
              Left = 168
              Top = 40
              Width = 30
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Senha'
            end
            object sbVerSenhaProxy: TSpeedButton
              Left = 244
              Top = 58
              Width = 23
              Height = 23
              AllowAllUp = True
              Anchors = [akTop, akRight]
              GroupIndex = 1
              Flat = True
            end
            object edtProxyHost: TEdit
              Left = 8
              Top = 16
              Width = 146
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
            end
            object edtProxyUser: TEdit
              Left = 8
              Top = 58
              Width = 146
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
            end
            object edtProxySenha: TEdit
              Left = 168
              Top = 58
              Width = 74
              Height = 21
              Anchors = [akTop, akRight]
              PasswordChar = '*'
              TabOrder = 2
            end
            object seProxyPorta: TSpinEdit
              Left = 168
              Top = 16
              Width = 74
              Height = 22
              Anchors = [akTop, akRight]
              MaxValue = 999999
              MinValue = 0
              TabOrder = 3
              Value = 0
            end
          end
        end
        object gbLog: TGroupBox
          Left = 320
          Top = 304
          Width = 256
          Height = 108
          Caption = 'Log'
          TabOrder = 3
          object pnLog: TPanel
            Left = 2
            Top = 15
            Width = 252
            Height = 91
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              252
              91)
            object Label11: TLabel
              Left = 8
              Top = 0
              Width = 37
              Height = 13
              Caption = 'Arquivo'
            end
            object Label12: TLabel
              Left = 8
              Top = 42
              Width = 23
              Height = 13
              Caption = 'N'#237'vel'
            end
            object sbArqLog: TSpeedButton
              Left = 225
              Top = 16
              Width = 24
              Height = 23
              Hint = 'Abrir Arquivo de Log'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object edtArqLog: TEdit
              Left = 8
              Top = 16
              Width = 217
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
            end
            object cbxNivelLog: TComboBox
              Left = 8
              Top = 61
              Width = 217
              Height = 21
              Style = csDropDownList
              ItemIndex = 2
              TabOrder = 1
              Text = 'Normal'
              Items.Strings = (
                'Nenhum'
                'Baixo'
                'Normal'
                'Alto'
                'Muito Alto')
            end
          end
        end
        object gbPSP: TGroupBox
          Left = 16
          Top = 144
          Width = 560
          Height = 72
          Caption = 'PSP'
          TabOrder = 1
          object pnPSP: TPanel
            Left = 2
            Top = 15
            Width = 556
            Height = 55
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              556
              55)
            object Label13: TLabel
              Left = 8
              Top = 3
              Width = 46
              Height = 13
              Caption = 'PSP Atual'
            end
            object Label15: TLabel
              Left = 224
              Top = 3
              Width = 45
              Height = 13
              Caption = 'Ambiente'
            end
            object Label17: TLabel
              Left = 416
              Top = 3
              Width = 38
              Height = 13
              Caption = 'Timeout'
            end
            object imgErrPSP: TImage
              Left = 192
              Top = 23
              Width = 16
              Height = 16
              Anchors = [akTop, akRight]
              Visible = False
            end
            object cbxPSPAtual: TComboBox
              Left = 8
              Top = 19
              Width = 182
              Height = 21
              Style = csDropDownList
              TabOrder = 0
            end
            object cbxAmbiente: TComboBox
              Left = 224
              Top = 19
              Width = 170
              Height = 21
              Style = csDropDownList
              TabOrder = 1
            end
            object seTimeout: TSpinEdit
              Left = 416
              Top = 19
              Width = 113
              Height = 22
              Increment = 10
              MaxValue = 999999
              MinValue = 0
              TabOrder = 2
              Value = 0
            end
          end
        end
        object gbCobranca: TGroupBox
          Left = 16
          Top = 224
          Width = 280
          Height = 72
          Caption = 'Cobran'#231'a'
          TabOrder = 4
          object pnCobranca: TPanel
            Left = 2
            Top = 15
            Width = 276
            Height = 55
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label47: TLabel
              Left = 8
              Top = 3
              Width = 47
              Height = 13
              Caption = 'Expira'#231#227'o'
            end
            object seCobrancaExpiracao: TSpinEdit
              Left = 8
              Top = 19
              Width = 234
              Height = 22
              Increment = 10
              MaxValue = 999999
              MinValue = 0
              TabOrder = 0
              Value = 3600
            end
          end
        end
        object gbAutenticacaoManual: TGroupBox
          Left = 320
          Top = 224
          Width = 256
          Height = 72
          TabOrder = 5
          object pnAutenticacaoManual: TPanel
            Left = 2
            Top = 15
            Width = 252
            Height = 55
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object cbAutenticacaoManual: TCheckBox
              Left = 16
              Top = 16
              Width = 186
              Height = 19
              Caption = 'Controlar Autentica'#231#227'o Manual'
              TabOrder = 0
            end
          end
        end
      end
    end
    object tsPSP: TTabSheet
      Caption = 'PSPs'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pgPSPs: TPageControl
        Left = 0
        Top = 0
        Width = 743
        Height = 489
        ActivePage = tsGerenciaNet
        Align = alClient
        TabOrder = 0
        TabWidth = 100
        object tsShipay: TTabSheet
          Caption = 'Shipay'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          DesignSize = (
            735
            461)
          object pConfPSPBB3: TPanel
            Left = 26
            Top = 102
            Width = 679
            Height = 240
            Anchors = [akLeft, akRight]
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              679
              240)
            object Label48: TLabel
              Left = 24
              Top = 40
              Width = 41
              Height = 13
              Caption = 'Client ID'
            end
            object Label49: TLabel
              Left = 24
              Top = 96
              Width = 52
              Height = 13
              Caption = 'Secret Key'
            end
            object Label50: TLabel
              Left = 24
              Top = 152
              Width = 54
              Height = 13
              Caption = 'Access Key'
            end
            object edtShipayClientID: TEdit
              Left = 24
              Top = 59
              Width = 631
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
            end
            object edtShipaySecretKey: TEdit
              Left = 24
              Top = 115
              Width = 631
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
            end
            object edtShipayAccessKey: TEdit
              Left = 24
              Top = 171
              Width = 631
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
        end
        object tsBB: TTabSheet
          Caption = 'Banco do Brasil'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          DesignSize = (
            735
            461)
          object pConfPSPBB: TPanel
            Left = 26
            Top = 48
            Width = 683
            Height = 400
            Anchors = [akLeft, akRight]
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              683
              400)
            object Label20: TLabel
              Left = 24
              Top = 21
              Width = 50
              Height = 13
              Caption = 'Chave PIX'
            end
            object Label21: TLabel
              Left = 746
              Top = 21
              Width = 54
              Height = 13
              Caption = 'Tipo Chave'
            end
            object Label22: TLabel
              Left = 24
              Top = 72
              Width = 41
              Height = 13
              Caption = 'Client ID'
            end
            object Label23: TLabel
              Left = 24
              Top = 128
              Width = 61
              Height = 13
              Caption = 'Client Secret'
            end
            object Label24: TLabel
              Left = 24
              Top = 184
              Width = 125
              Height = 13
              Caption = 'Developer Application Key'
            end
            object imgBBErroChavePIX: TImage
              Left = 906
              Top = 44
              Width = 16
              Height = 16
              Visible = False
            end
            object lbBBVersaoAPI: TLabel
              Left = 746
              Top = 72
              Width = 53
              Height = 13
              Caption = 'Vers'#227'o API'
            end
            object edtBBChavePIX: TEdit
              Left = 24
              Top = 40
              Width = 459
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
            object cbxBBTipoChave: TComboBox
              Left = 746
              Top = 40
              Width = 158
              Height = 21
              Style = csDropDownList
              TabOrder = 1
              TabStop = False
            end
            object edtBBClientID: TEdit
              Left = 24
              Top = 91
              Width = 459
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 3
            end
            object edtBBClientSecret: TEdit
              Left = 24
              Top = 147
              Width = 459
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 4
            end
            object edtBBDevAppKey: TEdit
              Left = 24
              Top = 203
              Width = 708
              Height = 21
              TabOrder = 5
            end
            object cbBBVersaoAPI: TComboBox
              Left = 746
              Top = 91
              Width = 158
              Height = 21
              Style = csDropDownList
              TabOrder = 0
              TabStop = False
            end
            object rgBBTipoCertificado: TRadioGroup
              Left = 746
              Top = 128
              Width = 184
              Height = 58
              Caption = 'Tipo Certificado'
              Columns = 2
              ItemIndex = 0
              Items.Strings = (
                'PFX'
                'Chave/Certificado')
              TabOrder = 6
            end
            object pnBBCertificados: TPanel
              Left = 0
              Top = 226
              Width = 683
              Height = 174
              Align = alBottom
              TabOrder = 7
              object pcBBCertificados: TPageControl
                Left = 1
                Top = 1
                Width = 681
                Height = 172
                ActivePage = tsBBPFX
                Align = alClient
                TabOrder = 0
                Visible = False
                object tsBBPFX: TTabSheet
                  Caption = 'PFX'
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 0
                  ExplicitHeight = 0
                  object pnBBPFX: TPanel
                    Left = 0
                    Top = 0
                    Width = 673
                    Height = 144
                    Align = alClient
                    BevelOuter = bvNone
                    TabOrder = 0
                    DesignSize = (
                      673
                      144)
                    object imBBErroPFX: TImage
                      Left = 8
                      Top = 35
                      Width = 16
                      Height = 16
                      Visible = False
                    end
                    object lbBBArqPFX: TLabel
                      Left = 24
                      Top = 15
                      Width = 58
                      Height = 13
                      Caption = 'Arquivo PFX'
                      Color = clBtnFace
                      ParentColor = False
                    end
                    object lbBBErroPFX: TLabel
                      Left = 24
                      Top = 56
                      Width = 107
                      Height = 13
                      Caption = 'lbBBErroChavePrivada'
                      Color = clBtnFace
                      ParentColor = False
                    end
                    object sbBBAcharPFX: TSpeedButton
                      Left = 442
                      Top = 32
                      Width = 24
                      Height = 23
                      Anchors = [akTop, akRight]
                      Flat = True
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      ParentShowHint = False
                      ShowHint = True
                      ExplicitLeft = 691
                    end
                    object lbBBSenhaPFX: TLabel
                      Left = 733
                      Top = 16
                      Width = 85
                      Height = 13
                      Caption = 'Senha Certificado'
                      Color = clBtnFace
                      ParentColor = False
                    end
                    object btBBVerSenhaPFX: TSpeedButton
                      Left = 648
                      Top = 32
                      Width = 23
                      Height = 23
                      AllowAllUp = True
                      Anchors = [akTop, akRight]
                      GroupIndex = 1
                      Flat = True
                      ExplicitLeft = 897
                    end
                    object edBBArqPFX: TEdit
                      Left = 24
                      Top = 32
                      Width = 416
                      Height = 23
                      Anchors = [akLeft, akTop, akRight]
                      AutoSize = False
                      TabOrder = 0
                    end
                    object edBBSenhaPFX: TEdit
                      Left = 733
                      Top = 32
                      Width = 0
                      Height = 21
                      Anchors = [akLeft, akTop, akRight]
                      PasswordChar = '*'
                      TabOrder = 1
                    end
                  end
                end
                object tsBBChaveECertificado: TTabSheet
                  Caption = 'Chave Privada/Certificado'
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 0
                  ExplicitHeight = 0
                  object pnBBChaveECert: TPanel
                    Left = 0
                    Top = 0
                    Width = 673
                    Height = 144
                    Align = alClient
                    BevelOuter = bvNone
                    TabOrder = 0
                    Visible = False
                    DesignSize = (
                      673
                      144)
                    object imBBErroChavePrivada: TImage
                      Left = 8
                      Top = 35
                      Width = 16
                      Height = 16
                      Visible = False
                    end
                    object lbBBArqChavePrivada: TLabel
                      Left = 24
                      Top = 15
                      Width = 110
                      Height = 13
                      Caption = 'Arquivo Chave Privada'
                      Color = clBtnFace
                      ParentColor = False
                    end
                    object lbBBErroChavePrivada: TLabel
                      Left = 24
                      Top = 56
                      Width = 107
                      Height = 13
                      Caption = 'lbBBErroChavePrivada'
                      Color = clBtnFace
                      ParentColor = False
                    end
                    object sbBBAcharChavePrivada: TSpeedButton
                      Left = 648
                      Top = 32
                      Width = 24
                      Height = 23
                      Anchors = [akTop, akRight]
                      Flat = True
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      ParentShowHint = False
                      ShowHint = True
                      ExplicitLeft = 897
                    end
                    object sbBBAcharArqCertificado: TSpeedButton
                      Left = 648
                      Top = 96
                      Width = 24
                      Height = 23
                      Anchors = [akTop, akRight]
                      Flat = True
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      ParentShowHint = False
                      ShowHint = True
                      ExplicitLeft = 897
                    end
                    object lbBBArqCertificado: TLabel
                      Left = 24
                      Top = 80
                      Width = 92
                      Height = 13
                      Caption = 'Arquivo Certificado'
                      Color = clBtnFace
                      ParentColor = False
                    end
                    object imBBErroCertificado: TImage
                      Left = 8
                      Top = 98
                      Width = 16
                      Height = 16
                      Visible = False
                    end
                    object lbBBErroCertificado: TLabel
                      Left = 24
                      Top = 118
                      Width = 92
                      Height = 13
                      Caption = 'lbBBErroCertificado'
                      Color = clBtnFace
                      ParentColor = False
                    end
                    object edBBArqChavePrivada: TEdit
                      Left = 24
                      Top = 32
                      Width = 623
                      Height = 23
                      Anchors = [akLeft, akTop, akRight]
                      AutoSize = False
                      TabOrder = 0
                    end
                    object edBBArqCertificado: TEdit
                      Left = 24
                      Top = 96
                      Width = 623
                      Height = 23
                      Anchors = [akLeft, akTop, akRight]
                      AutoSize = False
                      TabOrder = 1
                    end
                  end
                end
              end
            end
          end
        end
        object tsItau: TTabSheet
          Caption = 'Ita'#250
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          DesignSize = (
            735
            461)
          object pgPSPItau: TPageControl
            Left = 16
            Top = 24
            Width = 697
            Height = 413
            ActivePage = tsItauChave
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            object tsItauChave: TTabSheet
              Caption = 'Chave e Client ID'
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              DesignSize = (
                689
                385)
              object pConfPSPBB1: TPanel
                Left = 0
                Top = 69
                Width = 679
                Height = 206
                Anchors = [akLeft, akRight]
                BevelOuter = bvNone
                TabOrder = 0
                DesignSize = (
                  679
                  206)
                object Label25: TLabel
                  Left = 48
                  Top = 21
                  Width = 50
                  Height = 13
                  Caption = 'Chave PIX'
                end
                object Label26: TLabel
                  Left = 497
                  Top = 21
                  Width = 54
                  Height = 13
                  Anchors = [akTop, akRight]
                  Caption = 'Tipo Chave'
                  ExplicitLeft = 746
                end
                object Label27: TLabel
                  Left = 48
                  Top = 72
                  Width = 41
                  Height = 13
                  Caption = 'Client ID'
                end
                object Label28: TLabel
                  Left = 48
                  Top = 128
                  Width = 61
                  Height = 13
                  Caption = 'Client Secret'
                end
                object imgItauErroChavePIX: TImage
                  Left = 29
                  Top = 44
                  Width = 16
                  Height = 16
                  Visible = False
                end
                object imgItauErroClientID: TImage
                  Left = 29
                  Top = 95
                  Width = 16
                  Height = 16
                  Visible = False
                end
                object imgItauErroClientSecret: TImage
                  Left = 29
                  Top = 151
                  Width = 16
                  Height = 16
                  Visible = False
                end
                object edtItauChavePIX: TEdit
                  Left = 48
                  Top = 40
                  Width = 442
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 1
                end
                object cbxItauTipoChave: TComboBox
                  Left = 497
                  Top = 40
                  Width = 158
                  Height = 21
                  Style = csDropDownList
                  Anchors = [akTop, akRight]
                  TabOrder = 0
                  TabStop = False
                end
                object edtItauClientID: TEdit
                  Left = 48
                  Top = 91
                  Width = 607
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 2
                end
                object edtItauClientSecret: TEdit
                  Left = 48
                  Top = 147
                  Width = 607
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 3
                end
              end
            end
            object tsItauCertificado: TTabSheet
              Caption = 'Chave  e Certificado'
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              DesignSize = (
                689
                385)
              object pgPSPItauChaveCertificado: TPageControl
                Left = 19
                Top = 24
                Width = 651
                Height = 348
                ActivePage = tsItauChaveCertificadoArquivos
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 0
                object tsItauChaveCertificadoArquivos: TTabSheet
                  Caption = 'Arquivos'
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 0
                  ExplicitHeight = 0
                  DesignSize = (
                    643
                    320)
                  object lItauAvisoChaveCertificadoDesabilitado: TLabel
                    Left = 35
                    Top = 16
                    Width = 172
                    Height = 13
                    Caption = 'Desabilitado em Homologa'#231#227'o'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    Visible = False
                  end
                  object Panel7: TPanel
                    Left = 35
                    Top = 61
                    Width = 552
                    Height = 186
                    Anchors = [akLeft, akRight]
                    BevelOuter = bvNone
                    TabOrder = 0
                    DesignSize = (
                      552
                      186)
                    object Label41: TLabel
                      Left = 90
                      Top = 56
                      Width = 110
                      Height = 13
                      Caption = 'Arquivo Chave Privada'
                    end
                    object imgItauErroChavePrivada: TImage
                      Left = 72
                      Top = 76
                      Width = 16
                      Height = 16
                      Visible = False
                    end
                    object lItauErroChavePrivada: TLabel
                      Left = 90
                      Top = 96
                      Width = 109
                      Height = 13
                      Caption = 'lItauErroChavePrivada'
                    end
                    object sbItauAcharArqChavePrivada: TSpeedButton
                      Left = 477
                      Top = 72
                      Width = 24
                      Height = 23
                      Hint = 'Abrir Arquivo de Log'
                      Anchors = [akTop, akRight]
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      ParentShowHint = False
                      ShowHint = True
                      ExplicitLeft = 726
                    end
                    object Label40: TLabel
                      Left = 90
                      Top = 130
                      Width = 92
                      Height = 13
                      Caption = 'Arquivo Certificado'
                    end
                    object imgItauErroCertificado: TImage
                      Left = 72
                      Top = 154
                      Width = 16
                      Height = 16
                      Visible = False
                    end
                    object lItauErroCertificado: TLabel
                      Left = 90
                      Top = 172
                      Width = 94
                      Height = 13
                      Caption = 'lErroItauCertificado'
                    end
                    object sbItauAcharArqCertificado: TSpeedButton
                      Left = 477
                      Top = 147
                      Width = 24
                      Height = 23
                      Hint = 'Abrir Arquivo de Log'
                      Anchors = [akTop, akRight]
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      ParentShowHint = False
                      ShowHint = True
                      ExplicitLeft = 726
                    end
                    object edtItauArqChavePrivada: TEdit
                      Left = 90
                      Top = 72
                      Width = 387
                      Height = 23
                      Anchors = [akLeft, akTop, akRight]
                      AutoSize = False
                      TabOrder = 0
                      Text = 'ItauChavePrivada.pem'
                    end
                    object edtItauArqCertificado: TEdit
                      Left = 90
                      Top = 147
                      Width = 387
                      Height = 23
                      Anchors = [akLeft, akTop, akRight]
                      AutoSize = False
                      TabOrder = 1
                      Text = 'ItauCertificado.pem'
                    end
                    object btItauValidarChaveCertificado: TBitBtn
                      Left = 289
                      Top = 16
                      Width = 188
                      Height = 26
                      Anchors = [akTop, akRight]
                      Caption = 'Validar Chave e Certificado'
                      TabOrder = 2
                      Visible = False
                    end
                  end
                end
                object tsItauGerarChaveCertificado: TTabSheet
                  Caption = 'Gerar Chave e Certificado'
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 0
                  ExplicitHeight = 0
                  DesignSize = (
                    643
                    320)
                  object pgPSPItauGerarChaveCertificado: TPageControl
                    Left = 16
                    Top = 16
                    Width = 593
                    Height = 300
                    ActivePage = tsItauCertPasso1
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    TabOrder = 0
                    object tsItauCertPasso1: TTabSheet
                      Caption = 'Passo 1 - Definir Chave Privada'
                      ExplicitLeft = 0
                      ExplicitTop = 0
                      ExplicitWidth = 0
                      ExplicitHeight = 0
                      DesignSize = (
                        585
                        272)
                      object Label39: TLabel
                        Left = 16
                        Top = 24
                        Width = 110
                        Height = 13
                        Caption = 'Arquivo Chave Privada'
                      end
                      object edtItauArqChavePrivada2: TEdit
                        Left = 16
                        Top = 40
                        Width = 377
                        Height = 21
                        TabStop = False
                        Anchors = [akLeft, akTop, akRight]
                        ReadOnly = True
                        TabOrder = 0
                        Text = 'ItauChavePrivada.pem'
                      end
                      object btItauGerarChavePrivada: TBitBtn
                        Left = 409
                        Top = 37
                        Width = 152
                        Height = 26
                        Anchors = [akTop, akRight]
                        Caption = 'Gerar Chave Privada'
                        TabOrder = 1
                      end
                      object mItauChavePrivadaPEM: TMemo
                        Left = 16
                        Top = 72
                        Width = 545
                        Height = 183
                        Anchors = [akLeft, akTop, akRight, akBottom]
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Lucida Console'
                        Font.Style = []
                        ParentFont = False
                        ReadOnly = True
                        ScrollBars = ssBoth
                        TabOrder = 2
                        WantReturns = False
                        WordWrap = False
                      end
                    end
                    object tsItauCertPasso3: TTabSheet
                      Caption = 'Passo 2 - Solicitar Certificado'
                      ExplicitLeft = 0
                      ExplicitTop = 0
                      ExplicitWidth = 0
                      ExplicitHeight = 0
                      object pItauEditCertificado: TPanel
                        Left = 0
                        Top = 0
                        Width = 585
                        Height = 56
                        Align = alTop
                        BevelOuter = bvNone
                        TabOrder = 0
                        DesignSize = (
                          585
                          56)
                        object Label43: TLabel
                          Left = 16
                          Top = 4
                          Width = 92
                          Height = 13
                          Caption = 'Arquivo Certificado'
                        end
                        object btItauSolicitarCertificado: TBitBtn
                          Left = 412
                          Top = 18
                          Width = 149
                          Height = 26
                          Anchors = [akTop, akRight]
                          Caption = 'Solicitar Certificado'
                          TabOrder = 0
                        end
                        object edtItauArqCertificado2: TEdit
                          Left = 16
                          Top = 21
                          Width = 383
                          Height = 23
                          TabStop = False
                          Anchors = [akLeft, akTop, akRight]
                          AutoSize = False
                          ReadOnly = True
                          TabOrder = 1
                          Text = 'ItauCertificado.pem'
                        end
                      end
                      object pItauTokentemporario: TPanel
                        Left = 0
                        Top = 56
                        Width = 585
                        Height = 80
                        Align = alTop
                        BevelOuter = bvNone
                        TabOrder = 1
                        object lTokenTemporario: TLabel
                          Left = 0
                          Top = 0
                          Width = 86
                          Height = 13
                          Align = alTop
                          Caption = 'Token Tempor'#225'rio'
                        end
                        object mItauTokenTemporario: TMemo
                          Left = 0
                          Top = 13
                          Width = 585
                          Height = 67
                          Align = alClient
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Lucida Console'
                          Font.Style = []
                          ParentFont = False
                          ScrollBars = ssBoth
                          TabOrder = 0
                        end
                      end
                      object pItauCertificadoRecebido: TPanel
                        Left = 0
                        Top = 136
                        Width = 585
                        Height = 136
                        Align = alClient
                        BevelOuter = bvNone
                        TabOrder = 2
                        object Label6: TLabel
                          Left = 0
                          Top = 0
                          Width = 99
                          Height = 13
                          Align = alTop
                          Caption = 'Certificado Recebido'
                        end
                        object mItauCertificadoPEM: TMemo
                          Left = 0
                          Top = 13
                          Width = 585
                          Height = 123
                          Align = alClient
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Lucida Console'
                          Font.Style = []
                          ParentFont = False
                          ReadOnly = True
                          ScrollBars = ssBoth
                          TabOrder = 0
                          WantReturns = False
                        end
                      end
                    end
                  end
                end
                object tsItauRenovarChaveCertificado: TTabSheet
                  Caption = 'Renovar Certificado'
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 0
                  ExplicitHeight = 0
                  object pnItauRenovarCertificadoPEM: TPanel
                    Left = 16
                    Top = 56
                    Width = 862
                    Height = 284
                    BevelOuter = bvNone
                    TabOrder = 0
                    object lbItauRenovarCertificadoPEM: TLabel
                      Left = 0
                      Top = 0
                      Width = 127
                      Height = 13
                      Align = alTop
                      Caption = 'Novo Certificado Recebido'
                    end
                    object mmItauRenovarCertificadoPEM: TMemo
                      Left = 0
                      Top = 13
                      Width = 862
                      Height = 271
                      Align = alClient
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Lucida Console'
                      Font.Style = []
                      ParentFont = False
                      ReadOnly = True
                      ScrollBars = ssBoth
                      TabOrder = 0
                      WantReturns = False
                    end
                  end
                  object pItauEditCertificado1: TPanel
                    Left = 0
                    Top = 0
                    Width = 643
                    Height = 56
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 1
                    DesignSize = (
                      643
                      56)
                    object lbItauRenovarCertificadoArq: TLabel
                      Left = 16
                      Top = 4
                      Width = 92
                      Height = 13
                      Caption = 'Arquivo Certificado'
                    end
                    object edItauRenovarCertificadoArq: TEdit
                      Left = 16
                      Top = 21
                      Width = 449
                      Height = 23
                      TabStop = False
                      Anchors = [akLeft, akTop, akRight]
                      AutoSize = False
                      ReadOnly = True
                      TabOrder = 0
                      Text = 'ItauCertificadoNovo.pem'
                    end
                    object btItauRenovarCertificado: TBitBtn
                      Left = 481
                      Top = 18
                      Width = 150
                      Height = 26
                      Anchors = [akTop, akRight]
                      Caption = 'Renovar Certificado'
                      TabOrder = 1
                    end
                  end
                end
              end
            end
          end
        end
        object tsSantander: TTabSheet
          Caption = 'Santander'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pgSantander: TPageControl
            Left = 48
            Top = 56
            Width = 888
            Height = 368
            ActivePage = tsSantanderCredenciais
            TabOrder = 0
            object tsSantanderCredenciais: TTabSheet
              Caption = 'Credenciais'
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object pConfPSPSantander: TPanel
                Left = 0
                Top = 0
                Width = 880
                Height = 340
                Align = alClient
                Anchors = [akLeft, akRight]
                BevelOuter = bvNone
                TabOrder = 0
                DesignSize = (
                  880
                  340)
                object lbSantanderChavePIX: TLabel
                  Left = 24
                  Top = 24
                  Width = 50
                  Height = 13
                  Caption = 'Chave PIX'
                end
                object lbSantanderTipoChave: TLabel
                  Left = 688
                  Top = 24
                  Width = 54
                  Height = 13
                  Anchors = [akTop, akRight]
                  Caption = 'Tipo Chave'
                end
                object lbSantanderConsumerKey: TLabel
                  Left = 24
                  Top = 75
                  Width = 69
                  Height = 13
                  Caption = 'Consumer Key'
                end
                object lbSantanderConsumerSecret: TLabel
                  Left = 24
                  Top = 131
                  Width = 82
                  Height = 13
                  Caption = 'Consumer Secret'
                end
                object imSantanderErroChavePIX: TImage
                  Left = 856
                  Top = 44
                  Width = 16
                  Height = 16
                  Anchors = [akTop, akRight]
                  Visible = False
                end
                object sbSantanderAcharCertificadoPFX: TSpeedButton
                  Left = 640
                  Top = 197
                  Width = 24
                  Height = 23
                  Anchors = [akTop, akRight]
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = True
                end
                object lbSantanderArqCertificadoPFX: TLabel
                  Left = 24
                  Top = 181
                  Width = 113
                  Height = 13
                  Caption = 'Arquivo Certificado PFX'
                  Color = clBtnFace
                  ParentColor = False
                end
                object lbSantanderErroCertificadoPFX: TLabel
                  Left = 24
                  Top = 222
                  Width = 148
                  Height = 13
                  Caption = 'lbSantanderErroCertificadoPFX'
                  Color = clBtnFace
                  ParentColor = False
                end
                object imSantanderErroCertificadoPFX: TImage
                  Left = 3
                  Top = 200
                  Width = 16
                  Height = 16
                  Visible = False
                end
                object lbSantanderSenhaCertificado: TLabel
                  Left = 688
                  Top = 181
                  Width = 85
                  Height = 13
                  Caption = 'Senha Certificado'
                end
                object sbSantanderVerSenhaPFX: TSpeedButton
                  Left = 856
                  Top = 197
                  Width = 23
                  Height = 23
                  AllowAllUp = True
                  Anchors = [akTop, akRight]
                  GroupIndex = 1
                  Flat = True
                end
                object edSantanderChavePIX: TEdit
                  Left = 24
                  Top = 40
                  Width = 640
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 1
                end
                object cbSantanderTipoChave: TComboBox
                  Left = 688
                  Top = 40
                  Width = 164
                  Height = 21
                  Style = csDropDownList
                  Anchors = [akTop, akRight]
                  TabOrder = 0
                  TabStop = False
                end
                object edSantanderConsumerKey: TEdit
                  Left = 24
                  Top = 91
                  Width = 828
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 2
                end
                object edSantanderConsumerSecret: TEdit
                  Left = 24
                  Top = 147
                  Width = 828
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 3
                end
                object edSantanderArqCertificadoPFX: TEdit
                  Left = 24
                  Top = 197
                  Width = 616
                  Height = 23
                  Anchors = [akLeft, akTop, akRight]
                  AutoSize = False
                  TabOrder = 4
                end
                object edSantanderSenhaCertificadoPFX: TEdit
                  Left = 688
                  Top = 197
                  Width = 164
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  PasswordChar = '*'
                  TabOrder = 5
                end
              end
            end
            object tsSantanderExtrairCertificado: TTabSheet
              Caption = 'Extrair Certificado'
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object pnSantanderExtrairCertificado: TPanel
                Left = 0
                Top = 0
                Width = 880
                Height = 340
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                DesignSize = (
                  880
                  340)
                object sbSantanderExtrairCertificadoPFX: TSpeedButton
                  Left = 600
                  Top = 56
                  Width = 24
                  Height = 23
                  Anchors = [akTop, akRight]
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = True
                end
                object lbSantanderExtrairCertificadoPFX: TLabel
                  Left = 40
                  Top = 40
                  Width = 113
                  Height = 13
                  Caption = 'Arquivo Certificado PFX'
                  Color = clBtnFace
                  ParentColor = False
                end
                object lbSantanderExtrairCertificadoPEM: TLabel
                  Left = 40
                  Top = 160
                  Width = 115
                  Height = 13
                  Caption = 'Arquivo Certificado PEM'
                  Color = clBtnFace
                  ParentColor = False
                end
                object lbSantanderExtrairCertificadoSenhaPFX: TLabel
                  Left = 640
                  Top = 40
                  Width = 85
                  Height = 13
                  Caption = 'Senha Certificado'
                end
                object sbSantanderExtrairCertificadoVerSenhaPFX: TSpeedButton
                  Left = 808
                  Top = 56
                  Width = 23
                  Height = 23
                  AllowAllUp = True
                  Anchors = [akTop, akRight]
                  GroupIndex = 1
                  Flat = True
                end
                object sbSantanderExtrairCertificadoInfo: TSpeedButton
                  Left = 224
                  Top = 104
                  Width = 30
                  Height = 30
                  AllowAllUp = True
                  Anchors = [akTop, akRight]
                  GroupIndex = 1
                  Flat = True
                end
                object edSantanderExtrairCertificadoPFX: TEdit
                  Left = 40
                  Top = 56
                  Width = 560
                  Height = 23
                  Anchors = [akLeft, akTop, akRight]
                  AutoSize = False
                  TabOrder = 0
                end
                object btSantanderExtrairPEM: TBitBtn
                  Left = 40
                  Top = 104
                  Width = 179
                  Height = 30
                  Caption = 'Extrair Certificado PEM'
                  TabOrder = 1
                end
                object edSantanderExtrairCertificadoPEM: TEdit
                  Left = 40
                  Top = 176
                  Width = 791
                  Height = 23
                  Anchors = [akLeft, akTop, akRight]
                  AutoSize = False
                  TabOrder = 2
                  Text = 'SantanderCertificado.pem'
                end
                object edSantanderExtrairCertificadoSenhaPFX: TEdit
                  Left = 640
                  Top = 56
                  Width = 164
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  PasswordChar = '*'
                  TabOrder = 3
                end
              end
            end
          end
        end
        object tsSicredi: TTabSheet
          Caption = 'Sicredi'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pgSicredi: TPageControl
            Left = 48
            Top = 56
            Width = 888
            Height = 368
            ActivePage = tsSicrediCredenciais
            TabOrder = 0
            object tsSicrediCredenciais: TTabSheet
              Caption = 'Credenciais'
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object pnSicrediCredenciais: TPanel
                Left = 0
                Top = 0
                Width = 880
                Height = 340
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                DesignSize = (
                  880
                  340)
                object sbSicrediAcharChavePrivada: TSpeedButton
                  Left = 836
                  Top = 197
                  Width = 24
                  Height = 23
                  Anchors = [akTop, akRight]
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = True
                end
                object sbSicrediAcharArqCertificado: TSpeedButton
                  Left = 836
                  Top = 267
                  Width = 24
                  Height = 23
                  Anchors = [akTop, akRight]
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = True
                end
                object lbSicrediTipoChave: TLabel
                  Left = 675
                  Top = 24
                  Width = 54
                  Height = 13
                  Anchors = [akTop, akRight]
                  Caption = 'Tipo Chave'
                end
                object lbSicrediErroChavePrivada: TLabel
                  Left = 24
                  Top = 222
                  Width = 126
                  Height = 13
                  Caption = 'lbSicrediErroChavePrivada'
                end
                object lbSicrediErroCertificado: TLabel
                  Left = 24
                  Top = 294
                  Width = 111
                  Height = 13
                  Caption = 'lbSicrediErroCertificado'
                end
                object lbSicrediClientSecret: TLabel
                  Left = 24
                  Top = 132
                  Width = 61
                  Height = 13
                  Caption = 'Client Secret'
                end
                object lbSicrediClientID: TLabel
                  Left = 24
                  Top = 75
                  Width = 41
                  Height = 13
                  Caption = 'Client ID'
                end
                object lbSicrediChavePIX: TLabel
                  Left = 24
                  Top = 24
                  Width = 50
                  Height = 13
                  Caption = 'Chave PIX'
                end
                object lbSicrediArqChavePrivada: TLabel
                  Left = 24
                  Top = 181
                  Width = 110
                  Height = 13
                  Caption = 'Arquivo Chave Privada'
                end
                object lbSicrediArqCertificado: TLabel
                  Left = 24
                  Top = 251
                  Width = 217
                  Height = 13
                  Caption = 'Arquivo Certificado (GERADO PELO SICREDI)'
                end
                object imSicrediErroChavePrivada: TImage
                  Left = 3
                  Top = 200
                  Width = 16
                  Height = 16
                  Visible = False
                end
                object imSicrediErroChavePix: TImage
                  Left = 836
                  Top = 44
                  Width = 16
                  Height = 16
                  Anchors = [akTop, akRight]
                  Visible = False
                end
                object imSicrediErroCertificado: TImage
                  Left = 3
                  Top = 271
                  Width = 16
                  Height = 16
                  Visible = False
                end
                object edSicrediClientSecret: TEdit
                  Left = 24
                  Top = 147
                  Width = 808
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 3
                end
                object edSicrediClientID: TEdit
                  Left = 24
                  Top = 91
                  Width = 808
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 2
                end
                object edSicrediChavePIX: TEdit
                  Left = 24
                  Top = 40
                  Width = 630
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 0
                end
                object edSicrediArqChavePrivada: TEdit
                  Left = 24
                  Top = 197
                  Width = 808
                  Height = 23
                  Anchors = [akLeft, akTop, akRight]
                  AutoSize = False
                  TabOrder = 4
                  Text = 'SicrediChavePrivada.key'
                end
                object edSicrediArqCertificado: TEdit
                  Left = 24
                  Top = 267
                  Width = 808
                  Height = 23
                  Anchors = [akLeft, akTop, akRight]
                  AutoSize = False
                  TabOrder = 5
                  Text = 'SicrediCertificado.cer'
                end
                object cbSicrediTipoChave: TComboBox
                  Left = 675
                  Top = 40
                  Width = 157
                  Height = 21
                  Style = csDropDownList
                  Anchors = [akTop, akRight]
                  TabOrder = 1
                  TabStop = False
                end
              end
            end
            object tsSicrediGerarChaveCSR: TTabSheet
              Caption = 'Gerar Chave/CSR'
              ImageIndex = 1
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object pnSicrediGerarChaveCSR: TPanel
                Left = 0
                Top = 0
                Width = 880
                Height = 340
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                DesignSize = (
                  880
                  340)
                object lbSicrediGerarChavePrivada: TLabel
                  Left = 24
                  Top = 21
                  Width = 70
                  Height = 13
                  Caption = 'Chave Privada'
                end
                object lbSicrediGerarCSR: TLabel
                  Left = 24
                  Top = 181
                  Width = 20
                  Height = 13
                  Caption = 'CSR'
                end
                object btSicrediGerarChaveInfo: TSpeedButton
                  Left = 112
                  Top = 8
                  Width = 30
                  Height = 30
                  Anchors = [akTop, akRight]
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = True
                end
                object btSicrediGerarCSRInfo: TSpeedButton
                  Left = 56
                  Top = 168
                  Width = 30
                  Height = 30
                  Anchors = [akTop, akRight]
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = True
                end
                object lbSicrediGerarCSREmail: TLabel
                  Left = 448
                  Top = 181
                  Width = 28
                  Height = 13
                  Caption = 'E-mail'
                  Color = clBtnFace
                  ParentColor = False
                end
                object edSicrediGerarChavePrivada: TEdit
                  Left = 24
                  Top = 37
                  Width = 673
                  Height = 23
                  Anchors = [akLeft, akTop, akRight]
                  AutoSize = False
                  TabOrder = 0
                  Text = 'SicrediChavePrivada.key'
                end
                object mmSicrediGerarChavePrivada: TMemo
                  Left = 24
                  Top = 72
                  Width = 825
                  Height = 89
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Lucida Console'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 1
                  WantReturns = False
                  WordWrap = False
                end
                object btSicrediGerarChavePrivada: TBitBtn
                  Left = 712
                  Top = 32
                  Width = 137
                  Height = 33
                  Caption = 'Gerar Chave Privada'
                  TabOrder = 2
                end
                object edSicrediGerarCSR: TEdit
                  Left = 24
                  Top = 197
                  Width = 408
                  Height = 23
                  Anchors = [akLeft, akTop, akRight]
                  AutoSize = False
                  TabOrder = 3
                  Text = 'SicrediCertificado.csr'
                end
                object mmSicrediGerarCSR: TMemo
                  Left = 24
                  Top = 232
                  Width = 825
                  Height = 89
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Lucida Console'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 4
                  WantReturns = False
                  WordWrap = False
                end
                object btSicrediGerarCSR: TBitBtn
                  Left = 712
                  Top = 192
                  Width = 137
                  Height = 33
                  Caption = 'Gerar CSR'
                  TabOrder = 5
                end
                object edSicrediGerarCSREmail: TEdit
                  Left = 448
                  Top = 197
                  Width = 249
                  Height = 23
                  Anchors = [akLeft, akTop, akRight]
                  AutoSize = False
                  TabOrder = 6
                end
              end
            end
          end
        end
        object tsSicoob: TTabSheet
          Caption = 'Sicoob'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pgSicoob: TPageControl
            Left = 48
            Top = 56
            Width = 888
            Height = 368
            ActivePage = tsSicoobCredenciais
            TabOrder = 0
            object tsSicoobCredenciais: TTabSheet
              Caption = 'Credenciais'
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object pnSicoobCredenciais: TPanel
                Left = 0
                Top = 0
                Width = 880
                Height = 340
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object pnConfPSPSicoob: TPanel
                  Left = 0
                  Top = 0
                  Width = 880
                  Height = 340
                  Align = alClient
                  BevelOuter = bvNone
                  TabOrder = 0
                  DesignSize = (
                    880
                    340)
                  object lbSicoobChavePix: TLabel
                    Left = 24
                    Top = 24
                    Width = 50
                    Height = 13
                    Caption = 'Chave PIX'
                  end
                  object lbSicoobTipoChave: TLabel
                    Left = 671
                    Top = 24
                    Width = 54
                    Height = 13
                    Anchors = [akTop, akRight]
                    Caption = 'Tipo Chave'
                  end
                  object lbSicoobClientID: TLabel
                    Left = 24
                    Top = 83
                    Width = 41
                    Height = 13
                    Caption = 'Client ID'
                  end
                  object lbSicoobArquivoChavePrivada: TLabel
                    Left = 24
                    Top = 137
                    Width = 110
                    Height = 13
                    Caption = 'Arquivo Chave Privada'
                  end
                  object imSicoobErroChavePrivada: TImage
                    Left = 3
                    Top = 156
                    Width = 16
                    Height = 16
                    Visible = False
                  end
                  object lbSicoobErroChavePrivada: TLabel
                    Left = 24
                    Top = 178
                    Width = 126
                    Height = 13
                    Caption = 'lbSicoobErroChavePrivada'
                    Visible = False
                  end
                  object lbSicoobArquivoCertificado: TLabel
                    Left = 24
                    Top = 207
                    Width = 92
                    Height = 13
                    Caption = 'Arquivo Certificado'
                  end
                  object imSicoobErroCertificado: TImage
                    Left = 3
                    Top = 227
                    Width = 16
                    Height = 16
                    Visible = False
                  end
                  object lbSicoobErroCertificado: TLabel
                    Left = 24
                    Top = 250
                    Width = 111
                    Height = 13
                    Caption = 'lbSicoobErroCertificado'
                    Visible = False
                  end
                  object imSicoobErroChavePIX: TImage
                    Left = 836
                    Top = 42
                    Width = 16
                    Height = 16
                    Anchors = [akTop, akRight]
                    Visible = False
                  end
                  object sbSicoobAcharChavePrivada: TSpeedButton
                    Left = 836
                    Top = 153
                    Width = 24
                    Height = 23
                    Anchors = [akTop, akRight]
                    Flat = True
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object sbSicoobAcharArqCertificado: TSpeedButton
                    Left = 836
                    Top = 223
                    Width = 24
                    Height = 23
                    Anchors = [akTop, akRight]
                    Flat = True
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object lbSicoobTokenSandbox: TLabel
                    Left = 24
                    Top = 280
                    Width = 165
                    Height = 13
                    Caption = 'Access Token (APENAS SANDBOX)'
                    Color = clBtnFace
                    ParentColor = False
                  end
                  object edSicoobChavePIX: TEdit
                    Left = 24
                    Top = 40
                    Width = 630
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 0
                  end
                  object cbSicoobTipoChave: TComboBox
                    Left = 675
                    Top = 40
                    Width = 157
                    Height = 21
                    Style = csDropDownList
                    Anchors = [akTop, akRight]
                    TabOrder = 1
                    TabStop = False
                  end
                  object edSicoobClientID: TEdit
                    Left = 24
                    Top = 99
                    Width = 808
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                  object edSicoobArqChavePrivada: TEdit
                    Left = 24
                    Top = 153
                    Width = 808
                    Height = 23
                    Anchors = [akLeft, akTop, akRight]
                    AutoSize = False
                    TabOrder = 3
                    Text = 'SicoobChavePrivada.key'
                  end
                  object edSicoobArqCertificado: TEdit
                    Left = 24
                    Top = 223
                    Width = 808
                    Height = 23
                    Anchors = [akLeft, akTop, akRight]
                    AutoSize = False
                    TabOrder = 4
                    Text = 'SicoobCertificado.pem'
                  end
                  object edSicoobTokenSandbox: TEdit
                    Left = 24
                    Top = 296
                    Width = 808
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 5
                  end
                end
              end
            end
            object tsSicoobExtrairChaveCertificado: TTabSheet
              Caption = 'Extrair Chave/Certificado'
              ImageIndex = 1
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object pnSicoobExtrairChaveCertificado: TPanel
                Left = 0
                Top = 0
                Width = 880
                Height = 340
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                DesignSize = (
                  880
                  340)
                object lbSicoobExtrairChaveCertificadoArqPFX: TLabel
                  Left = 40
                  Top = 40
                  Width = 113
                  Height = 13
                  Caption = 'Arquivo Certificado PFX'
                end
                object btSicoobExtrairChaveCertificadoArqPFX: TSpeedButton
                  Left = 600
                  Top = 56
                  Width = 24
                  Height = 23
                  Anchors = [akTop, akRight]
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = True
                end
                object lbSicoobExtrairChaveCertificadoSenhaPFX: TLabel
                  Left = 640
                  Top = 40
                  Width = 85
                  Height = 13
                  Caption = 'Senha Certificado'
                end
                object btSicoobExtrairChaveCertificadoVerSenhaPFX: TSpeedButton
                  Left = 808
                  Top = 56
                  Width = 23
                  Height = 23
                  AllowAllUp = True
                  Anchors = [akTop, akRight]
                  GroupIndex = 1
                  Flat = True
                end
                object lbSicoobExtrairChavePrivada: TLabel
                  Left = 40
                  Top = 160
                  Width = 110
                  Height = 13
                  Caption = 'Arquivo Chave Privada'
                end
                object btSicoobExtrairChaveCertificadoInfo: TSpeedButton
                  Left = 224
                  Top = 104
                  Width = 30
                  Height = 30
                  Anchors = [akTop, akRight]
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = True
                end
                object lbSicoobExtrairCertificado: TLabel
                  Left = 40
                  Top = 216
                  Width = 115
                  Height = 13
                  Caption = 'Arquivo Certificado PEM'
                end
                object edSicoobExtrairChaveCertificadoArqPFX: TEdit
                  Left = 40
                  Top = 56
                  Width = 560
                  Height = 23
                  Anchors = [akLeft, akTop, akRight]
                  AutoSize = False
                  TabOrder = 0
                end
                object edSicoobExtrairChaveCertificadoSenhaPFX: TEdit
                  Left = 640
                  Top = 56
                  Width = 164
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  PasswordChar = '*'
                  TabOrder = 1
                end
                object btSicoobExtrairChaveCertificado: TBitBtn
                  Left = 40
                  Top = 104
                  Width = 179
                  Height = 30
                  Caption = 'Extrair Chave/Certificado'
                  TabOrder = 2
                end
                object edSicoobExtrairChavePrivada: TEdit
                  Left = 40
                  Top = 176
                  Width = 791
                  Height = 23
                  Anchors = [akLeft, akTop, akRight]
                  AutoSize = False
                  TabOrder = 3
                  Text = 'SicoobChavePrivada.key'
                end
                object edSicoobExtrairCertificado: TEdit
                  Left = 40
                  Top = 232
                  Width = 791
                  Height = 23
                  Anchors = [akLeft, akTop, akRight]
                  AutoSize = False
                  TabOrder = 4
                  Text = 'SicoobCertificado.pem'
                end
              end
            end
          end
        end
        object tsPagSeguro: TTabSheet
          Caption = 'PagSeguro'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnPagSeguroCredenciais: TPanel
            Left = 48
            Top = 72
            Width = 888
            Height = 340
            Align = alCustom
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              888
              340)
            object sbPagSeguroAcharChavePrivada: TSpeedButton
              Left = 844
              Top = 197
              Width = 24
              Height = 23
              Anchors = [akTop, akRight]
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object sbPagSeguroAcharArqCertificado: TSpeedButton
              Left = 844
              Top = 267
              Width = 24
              Height = 23
              Anchors = [akTop, akRight]
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object lbPagSeguroTipoChave: TLabel
              Left = 683
              Top = 24
              Width = 54
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Tipo Chave'
            end
            object lbPagSeguroErroChavePrivada: TLabel
              Left = 24
              Top = 222
              Width = 147
              Height = 13
              Caption = 'lbPagSeguroErroChavePrivada'
            end
            object lbPagSeguroErroCertificado: TLabel
              Left = 24
              Top = 294
              Width = 132
              Height = 13
              Caption = 'lbPagSeguroErroCertificado'
            end
            object lbPagSeguroClientSecret: TLabel
              Left = 24
              Top = 132
              Width = 61
              Height = 13
              Caption = 'Client Secret'
            end
            object lbPagSeguroClientID: TLabel
              Left = 24
              Top = 75
              Width = 41
              Height = 13
              Caption = 'Client ID'
            end
            object lbPagSeguroChavePIX: TLabel
              Left = 24
              Top = 24
              Width = 50
              Height = 13
              Caption = 'Chave PIX'
            end
            object lbPagSeguroArqChavePrivada: TLabel
              Left = 24
              Top = 181
              Width = 110
              Height = 13
              Caption = 'Arquivo Chave Privada'
            end
            object lbPagSeguroArqCertificado: TLabel
              Left = 24
              Top = 251
              Width = 115
              Height = 13
              Caption = 'Arquivo Certificado PEM'
            end
            object imPagSeguroErroChavePrivada: TImage
              Left = 3
              Top = 200
              Width = 16
              Height = 16
              Visible = False
            end
            object imPagSeguroErroChavePix: TImage
              Left = 844
              Top = 44
              Width = 16
              Height = 16
              Anchors = [akTop, akRight]
              Visible = False
            end
            object imPagSeguroErroCertificado: TImage
              Left = 3
              Top = 271
              Width = 16
              Height = 16
              Visible = False
            end
            object edPagSeguroClientSecret: TEdit
              Left = 24
              Top = 147
              Width = 816
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 3
            end
            object edPagSeguroClientID: TEdit
              Left = 24
              Top = 91
              Width = 816
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
            object edPagSeguroChavePIX: TEdit
              Left = 24
              Top = 40
              Width = 638
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
            end
            object edPagSeguroArqChavePrivada: TEdit
              Left = 24
              Top = 197
              Width = 816
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              TabOrder = 4
              Text = 'PagSeguroChavePrivada.key'
            end
            object edPagSeguroArqCertificado: TEdit
              Left = 24
              Top = 267
              Width = 816
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              TabOrder = 5
              Text = 'PagSeguroCertificado.pem'
            end
            object cbPagSeguroTipoChave: TComboBox
              Left = 683
              Top = 40
              Width = 157
              Height = 21
              Style = csDropDownList
              Anchors = [akTop, akRight]
              TabOrder = 1
              TabStop = False
            end
          end
        end
        object tsGerenciaNet: TTabSheet
          Caption = 'GerenciaNet'
          ImageIndex = 7
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          DesignSize = (
            735
            461)
          object pnGerenciaNet: TPanel
            Left = 40
            Top = 65
            Width = 631
            Height = 256
            Anchors = [akLeft, akRight]
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              631
              256)
            object sbGerenciaNetAcharPFX: TSpeedButton
              Left = 603
              Top = 192
              Width = 24
              Height = 25
              Anchors = [akTop, akRight]
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                F6060000424DF606000000000000360000002800000018000000180000000100
                180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F3B00865B1C8357168357
                16835716835716835716835716835716835716835716835716835716885D1D63
                3300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB79C75
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFF8F6626FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFB09365FFFFFFF6F4EFF4F1E7F4F1E8F4F1E8F4F1E8F4F1E8EDE7DF
                F1E7E0F1EBE0F1EBE2EDE6D9FFFFFF8B601FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFB69D76FFFFFFF7F5EFF5F2EDF5F2EDF5F2EDF5
                F2EDF5F2EEF6F3EAF2F1E8F2F0EBF5F3EEF5EFE9FFFFFF8B601FFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB69D71FFFFFFF7F5EFF5F2
                EDF5F2EDF5F2EDF5F2EDF5F2EDF5F2EDF5F2E9F5F2E9F5F2EDF4F1E8FFFFFF8B
                601FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB89F75
                FFFFFFF7F5EFF5F2EDF5F2EDF5F2EDF5F2EDF5F2EDF5F2EDF7F2F1F7F5F1F7F5
                F0F6F5EBFFFFFF8B601F875D1EA27D4A9F7A459F7A459F7A459F7A459F7A459F
                7A459E7843B69E73FFFFFFF7F5EFF5F2EDF5F2EDF5F2EDF5F2EDF8F6F1F4F1EC
                FBF5F3FAF5F2FBF5F2F6F1EFFFFFFF8B601FB59B72FFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFB29769FFFFFFF7F5EFF5F2EDF5F2EDF5F2EDF5
                F2EDF7F5F0FBF5F2FAF8F2FAF5F2FBF6F3F4EFE5FFFFFF8B6020B89D72FFFFFF
                F8F4EFF6F3EBF6F3EBF6F3EBF6F5EDF2EEE8F7F1ECAC9164FFFFFFF7F5EFF5F2
                EDF5F2ECF4F1ECF7F1F0FAF4F6FAFBF1FAFBF6FBF8F7F5F0EAEFE7DEFFFDFF8B
                6121BCA580FFFFFFF7F3EEF5F2EDF5F2EDF5F2EDF5F2EDF5F2ECF8F9F2B4986C
                FFFFFFFAF7F1F7F5F0F7F5EFFBF7F6FAF7F5FAFBF4FAFBF8FBF7F6F5F2E9F0EA
                E4E7DFD4F6F1EC8D6223BCA47CFFFFFFF7F3EEF5F2EDF5F2EDF5F2EDF5F2EDF5
                F2EDFAF8F5B6A179FFFFFFFCFDFBFAFBF5FAFBF4FAFAFBFAFAFBFAFAFBFBF7F9
                F1F6EDF1E9E3E8E4DCE2D7CAEBE2D88D6424BCA47CFFFFFFF7F3EEF5F2EDF5F2
                EDF5F2EDF5F2EDF5F2EDFBF8F9BAA07BFFFFFFFCFCFCFAFAF6FAFAFBFAFAFAFA
                FAFBFBFBF8F5F2E9F0EEE6EAE3DCE3DCCFDBCDBBDCD1BD8F6526BCA47CFFFFFF
                F7F3EEF5F2EDF5F2EDF5F2EDF6F3EEF7F4EFFDFAF9BCA47EFFFFFFFCFCFCFAFA
                FAFAFAFAFAFAFBFAFBF8F7F6F1F3EEE3EBE6DDE6DDD0E0CFC2D4C2ABD0C1A88F
                6729BBA37BFFFFFFF7F3EEF5F2EDF5F2EDF5F2ECF7F3F0FAF6F2FFFEFBBFAA85
                FFFFFFF9FCFCFAFAFAFAFAFAFAFBF8F7F6EDF2EDE5EBE6DDDDCCBDCBBBA1C4AA
                8BBEA77CB89C71926A2DBBA17BFFFFFFF8F3EEF6F2EDF6F2EDF7F4F1F9F4F4FA
                FBF5FFFFFEBFA988FFFFFFF9FCFCFAFAFAFAFBFBF7F6F0F2EDE5EEE6DCE7DED1
                C8B497FDFEFDF0EBE7CCB89DAC8D5CFFFFFFC0AA89FFFFFFFBF8F4F9F8F1F9F8
                F2FCFAFAFAF9F8FBFCFAFDFFFFC1AC8BFFFFFFFCFCFCFAFBFBFBF8F3EFEDE9EA
                E3DCE6D8CBDCCCBCC1A783F0EBE8EAE1D7CAB595FFFFFFFFFFFFC2AF90FFFFFF
                FCFEFCFAFAF5FAFAFAFAFAFCFAFCFCFBF8F7F7F9F2C2B08FFFFFFFFCFCFDF7F8
                F2F6ECE4EDE5DBE3DBCFDBCEB9D4C3A7B99C70CEC1AAB69E76FFFFFFFFFFFFFF
                FFFFC4AF91FFFFFFFCFCFCFAFAF8FAFAFAFAFAFCFBFCF9F8F6EEF5F3EBC8B796
                FFFFFFFDFFFFF8F5F3EFEBE5EBE1D5DCD3C2D4C2A8CBB497AC935EA17D49FFFF
                FFFFFFFFFFFFFFFFFFFFC8B695FFFFFFFBFCFCFAFAFAFAFAFAFAFBF8F8F5EEF2
                F0E9C7B093BBA27BCBBAA1DBCFBAD6C6B4CCBB9FC8B99DC4AF8CBEA47DB29A6B
                A58956FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9B69AFFFFFFF9FCFCFAFAFAF9FB
                FAF8F6EFF3EDE4EFEAE2C7B194F8F7F6E9E0D7CEBCA2AA8A57FFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBB89BFFFFFF
                FCFCFCFAFBFBFAF8F3EEEBE7EAE2D9E5DACDCAB598DCCCBCE1D5C4AC8D5CFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFCBBB9FFFFFFFFBFBFCF8F7F1F5EDE3EAE3DAE1D8CADCCEB7C2A983CDBDA3
                AD8E5DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFCFC1A4FFFFFFFDFFFFF6F4EFEFE9E1E8DDD1D9CFBAD3
                BFA6BBA479A78853FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A883E4DCD1DCCFBBD6C7B3CFC1
                A9C8B898C4AD88B9A077AC9261FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              Layout = blGlyphTop
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              Transparent = False
              OnClick = sbGerenciaNetAcharPFXClick
            end
            object lbGerenciaNetTipoChave: TLabel
              Left = 438
              Top = 19
              Width = 54
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Tipo Chave'
              Color = clBtnFace
              ParentColor = False
              ExplicitLeft = 687
            end
            object lbGerenciaNetErroPFX: TLabel
              Left = 32
              Top = 214
              Width = 105
              Height = 13
              Caption = 'lbGerenciaNetErroPFX'
              Color = clBtnFace
              ParentColor = False
            end
            object lbGerenciaNetClientSecret: TLabel
              Left = 32
              Top = 127
              Width = 61
              Height = 13
              Caption = 'Client Secret'
              Color = clBtnFace
              ParentColor = False
            end
            object lbGerenciaNetClientID: TLabel
              Left = 32
              Top = 68
              Width = 41
              Height = 13
              Caption = 'Client ID'
              Color = clBtnFace
              ParentColor = False
            end
            object lbGerenciaNetChave: TLabel
              Left = 32
              Top = 19
              Width = 50
              Height = 13
              Caption = 'Chave PIX'
              Color = clBtnFace
              ParentColor = False
            end
            object lbGerenciaNetPFX: TLabel
              Left = 32
              Top = 176
              Width = 149
              Height = 13
              Caption = 'Arquivo Certificado (P12 / PFX)'
              Color = clBtnFace
              ParentColor = False
            end
            object imGerenciaNetErroPFX: TImage
              Left = 10
              Top = 192
              Width = 16
              Height = 16
              Visible = False
            end
            object imGerenciaNetErroChavePix: TImage
              Left = 603
              Top = 38
              Width = 16
              Height = 17
              Anchors = [akTop, akRight]
              Visible = False
              ExplicitLeft = 852
            end
            object edGerenciaNetClientSecret: TEdit
              Left = 32
              Top = 143
              Width = 567
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
            end
            object edGerenciaNetClientID: TEdit
              Left = 32
              Top = 83
              Width = 567
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
            end
            object edGerenciaNetChavePIX: TEdit
              Left = 32
              Top = 35
              Width = 389
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              OnChange = edGerenciaNetChavePIXChange
            end
            object edGerenciaNetArqPFX: TEdit
              Left = 32
              Top = 192
              Width = 567
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              TabOrder = 3
              Text = 'GerenciaNet.p12'
            end
            object cbGerenciaNetTipoChave: TComboBox
              Left = 440
              Top = 35
              Width = 157
              Height = 21
              Style = csDropDownList
              Anchors = [akTop, akRight]
              TabOrder = 4
              TabStop = False
            end
          end
        end
        object tsBradesco: TTabSheet
          Caption = 'Bradesco'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          DesignSize = (
            735
            461)
          object pnBradesco: TPanel
            Left = 40
            Top = 65
            Width = 631
            Height = 256
            Anchors = [akLeft, akRight]
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              631
              256)
            object sbBradescoAcharPFX: TSpeedButton
              Left = 397
              Top = 192
              Width = 24
              Height = 23
              Anchors = [akTop, akRight]
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              ExplicitLeft = 646
            end
            object lbBradescoTipoChave: TLabel
              Left = 438
              Top = 19
              Width = 54
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Tipo Chave'
              Color = clBtnFace
              ParentColor = False
              ExplicitLeft = 687
            end
            object lbBradescoErroPFX: TLabel
              Left = 32
              Top = 214
              Width = 90
              Height = 13
              Caption = 'lbBradescoErroPFX'
              Color = clBtnFace
              ParentColor = False
            end
            object lbBradescoClientSecret: TLabel
              Left = 32
              Top = 127
              Width = 61
              Height = 13
              Caption = 'Client Secret'
              Color = clBtnFace
              ParentColor = False
            end
            object lbBradescoClientKey: TLabel
              Left = 32
              Top = 68
              Width = 48
              Height = 13
              Caption = 'Client Key'
              Color = clBtnFace
              ParentColor = False
            end
            object lbBradescoChave: TLabel
              Left = 32
              Top = 19
              Width = 50
              Height = 13
              Caption = 'Chave PIX'
              Color = clBtnFace
              ParentColor = False
            end
            object lbBradescoPFX: TLabel
              Left = 32
              Top = 176
              Width = 58
              Height = 13
              Caption = 'Arquivo PFX'
              Color = clBtnFace
              ParentColor = False
            end
            object imBradescoErroPFX: TImage
              Left = 10
              Top = 192
              Width = 16
              Height = 16
              Visible = False
            end
            object imBradescoErroChavePix: TImage
              Left = 603
              Top = 38
              Width = 16
              Height = 17
              Anchors = [akTop, akRight]
              Visible = False
              ExplicitLeft = 852
            end
            object sbBradescoVerSenhaPFX: TSpeedButton
              Left = 603
              Top = 192
              Width = 23
              Height = 23
              AllowAllUp = True
              Anchors = [akTop, akRight]
              GroupIndex = 1
              Flat = True
              ExplicitLeft = 852
            end
            object lbBradescoSenhaPFX: TLabel
              Left = 687
              Top = 176
              Width = 85
              Height = 13
              Caption = 'Senha Certificado'
              Color = clBtnFace
              ParentColor = False
            end
            object edBradescoClientSecret: TEdit
              Left = 32
              Top = 143
              Width = 567
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
            end
            object edBradescoClientID: TEdit
              Left = 32
              Top = 83
              Width = 567
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
            end
            object edBradescoChavePIX: TEdit
              Left = 32
              Top = 35
              Width = 389
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
            object edBradescoArqPFX: TEdit
              Left = 32
              Top = 192
              Width = 363
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              TabOrder = 3
              Text = 'Bradesco.pfx'
            end
            object cbBradescoTipoChave: TComboBox
              Left = 438
              Top = 35
              Width = 161
              Height = 21
              Style = csDropDownList
              Anchors = [akTop, akRight]
              TabOrder = 4
              TabStop = False
            end
            object edBradescoSenhaPFX: TEdit
              Left = 687
              Top = 192
              Width = 0
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              PasswordChar = '*'
              TabOrder = 5
            end
          end
        end
        object tsPIXPDV: TTabSheet
          Caption = 'PIXPDV'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          DesignSize = (
            735
            461)
          object pnPixPDV: TPanel
            Left = 34
            Top = 110
            Width = 683
            Height = 240
            Anchors = [akLeft, akRight]
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              683
              240)
            object lbPixPDVCNPJ: TLabel
              Left = 24
              Top = 50
              Width = 25
              Height = 13
              Caption = 'CNPJ'
            end
            object lbPixPDVToken: TLabel
              Left = 24
              Top = 101
              Width = 29
              Height = 13
              Caption = 'Token'
            end
            object lbPixPDVSecretKey: TLabel
              Left = 24
              Top = 157
              Width = 52
              Height = 13
              Caption = 'Secret Key'
            end
            object edPixPDVCNPJ: TEdit
              Left = 24
              Top = 65
              Width = 635
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
            end
            object edPixPDVToken: TEdit
              Left = 24
              Top = 115
              Width = 635
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
            end
            object edPixPDVSecretKey: TEdit
              Left = 24
              Top = 171
              Width = 635
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
        end
        object tsInter: TTabSheet
          Caption = 'Inter'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          DesignSize = (
            735
            461)
          object pnInter: TPanel
            Left = 48
            Top = 57
            Width = 631
            Height = 322
            Anchors = [akLeft, akRight]
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              631
              322)
            object lbInterTipoChave: TLabel
              Left = 432
              Top = 24
              Width = 54
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Tipo Chave'
              ExplicitLeft = 681
            end
            object lbInterClientSecret: TLabel
              Left = 24
              Top = 132
              Width = 61
              Height = 13
              Caption = 'Client Secret'
            end
            object lbInterClientID: TLabel
              Left = 24
              Top = 75
              Width = 41
              Height = 13
              Caption = 'Client ID'
            end
            object lbInterChave: TLabel
              Left = 24
              Top = 24
              Width = 50
              Height = 13
              Caption = 'Chave PIX'
            end
            object imInterErroChavePix: TImage
              Left = 595
              Top = 43
              Width = 16
              Height = 17
              Anchors = [akTop, akRight]
              Visible = False
              ExplicitLeft = 844
            end
            object lbInterChavePrivada: TLabel
              Left = 24
              Top = 181
              Width = 110
              Height = 13
              Caption = 'Arquivo Chave Privada'
            end
            object lbInterErroChavePrivada: TLabel
              Left = 24
              Top = 222
              Width = 119
              Height = 13
              Caption = 'lbInterErroChavePrivada'
            end
            object imInterErroChavePrivada: TImage
              Left = 3
              Top = 200
              Width = 16
              Height = 16
              Visible = False
            end
            object btInterAcharChavePrivada: TSpeedButton
              Left = 595
              Top = 197
              Width = 24
              Height = 23
              Anchors = [akTop, akRight]
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              ExplicitLeft = 844
            end
            object btInterAcharCertificado: TSpeedButton
              Left = 595
              Top = 267
              Width = 24
              Height = 23
              Anchors = [akTop, akRight]
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              ExplicitLeft = 844
            end
            object imInterErroCertificado: TImage
              Left = 3
              Top = 271
              Width = 16
              Height = 16
              Visible = False
            end
            object lbInterErroCertificado: TLabel
              Left = 24
              Top = 294
              Width = 104
              Height = 13
              Caption = 'lbInterErroCertificado'
            end
            object lbInterCertificado: TLabel
              Left = 24
              Top = 251
              Width = 115
              Height = 13
              Caption = 'Arquivo Certificado PEM'
            end
            object edInterClientSecret: TEdit
              Left = 24
              Top = 148
              Width = 567
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 3
            end
            object edInterClientID: TEdit
              Left = 24
              Top = 90
              Width = 567
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
            object edInterChavePIX: TEdit
              Left = 24
              Top = 40
              Width = 389
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
            end
            object cbInterTipoChave: TComboBox
              Left = 432
              Top = 40
              Width = 157
              Height = 21
              Style = csDropDownList
              Anchors = [akTop, akRight]
              TabOrder = 1
              TabStop = False
            end
            object edInterChavePrivada: TEdit
              Left = 24
              Top = 197
              Width = 567
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              TabOrder = 4
              Text = 'InterChavePrivada.key'
            end
            object edInterCertificado: TEdit
              Left = 24
              Top = 267
              Width = 567
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              TabOrder = 5
              Text = 'InterCertificado.pem'
            end
          end
        end
        object tsAilos: TTabSheet
          Caption = 'Ailos'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnAilos: TPanel
            Left = 48
            Top = 56
            Width = 888
            Height = 625
            Align = alCustom
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              888
              625)
            object lbAilosTipoChave: TLabel
              Left = 683
              Top = 24
              Width = 54
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Tipo Chave'
            end
            object lbAilosErroChavePrivada: TLabel
              Left = 24
              Top = 222
              Width = 117
              Height = 13
              Caption = 'lbAilosErroChavePrivada'
            end
            object lbAilosErroCertificadoRoot: TLabel
              Left = 24
              Top = 371
              Width = 125
              Height = 13
              Caption = 'lbAilosErroCertificadoRoot'
            end
            object lbAilosClientSecret: TLabel
              Left = 24
              Top = 132
              Width = 61
              Height = 13
              Caption = 'Client Secret'
            end
            object lbAilosClienteID: TLabel
              Left = 24
              Top = 75
              Width = 41
              Height = 13
              Caption = 'Client ID'
            end
            object lbAilosChave: TLabel
              Left = 24
              Top = 24
              Width = 50
              Height = 13
              Caption = 'Chave PIX'
            end
            object lbAilosChavePrivada: TLabel
              Left = 24
              Top = 181
              Width = 110
              Height = 13
              Caption = 'Arquivo Chave Privada'
            end
            object lbAilosCertificadoRoot: TLabel
              Left = 24
              Top = 328
              Width = 118
              Height = 13
              Caption = 'Arquivo Certificado Root'
            end
            object imAilosErroChavePIX: TImage
              Left = 844
              Top = 44
              Width = 16
              Height = 16
              Anchors = [akTop, akRight]
              Visible = False
            end
            object imAilosErroCertificadoRoot: TImage
              Left = 3
              Top = 348
              Width = 16
              Height = 16
              Visible = False
            end
            object imAilosErroChavePrivada: TImage
              Left = 3
              Top = 200
              Width = 16
              Height = 16
              Visible = False
            end
            object imAilosErroCertificado: TImage
              Left = 3
              Top = 274
              Width = 16
              Height = 16
              Visible = False
            end
            object lbAilosCertificado: TLabel
              Left = 24
              Top = 254
              Width = 108
              Height = 13
              Caption = 'Arquivo Certificado crt'
            end
            object lbAilosErroCertificado: TLabel
              Left = 24
              Top = 297
              Width = 102
              Height = 13
              Caption = 'lbAilosErroCertificado'
            end
            object btAilosAcharCertificado: TSpeedButton
              Left = 845
              Top = 270
              Width = 24
              Height = 23
              Anchors = [akTop, akRight]
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object btAilosAcharchavePrivada: TSpeedButton
              Left = 845
              Top = 197
              Width = 24
              Height = 23
              Anchors = [akTop, akRight]
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object btAilosAcharCertificadoRoot: TSpeedButton
              Left = 845
              Top = 344
              Width = 24
              Height = 23
              Anchors = [akTop, akRight]
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object edAilosClientSecret: TEdit
              Left = 24
              Top = 147
              Width = 816
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 3
            end
            object edAilosClientID: TEdit
              Left = 24
              Top = 91
              Width = 816
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
            object edAilosChavePIX: TEdit
              Left = 24
              Top = 40
              Width = 638
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
            end
            object edAilosChavePrivada: TEdit
              Left = 24
              Top = 197
              Width = 816
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              TabOrder = 4
              Text = 'AilosChavePrivada.key'
            end
            object edAilosCertificadoRoot: TEdit
              Left = 24
              Top = 344
              Width = 816
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              TabOrder = 6
              Text = 'AilosCertificadoRoot.crt'
            end
            object cbAilosTipoChave: TComboBox
              Left = 683
              Top = 40
              Width = 157
              Height = 21
              Style = csDropDownList
              Anchors = [akTop, akRight]
              TabOrder = 1
              TabStop = False
            end
            object edAilosCertificado: TEdit
              Left = 24
              Top = 270
              Width = 816
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              TabOrder = 5
              Text = 'AilosCertificado.crt'
            end
          end
        end
        object tsMatera: TTabSheet
          Caption = 'Matera'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnMatera: TPanel
            Left = 0
            Top = 0
            Width = 735
            Height = 461
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object lbMateraClientID: TLabel
              Left = 496
              Top = 88
              Width = 41
              Height = 13
              Caption = 'Client ID'
              Color = clBtnFace
              ParentColor = False
            end
            object lbMateraErroCertificado: TLabel
              Left = 87
              Top = 365
              Width = 114
              Height = 13
              Caption = 'lbMateraErroCertificado'
              Color = clBtnFace
              ParentColor = False
            end
            object lbMateraArqCertificado: TLabel
              Left = 87
              Top = 325
              Width = 92
              Height = 13
              Caption = 'Arquivo Certificado'
              Color = clBtnFace
              ParentColor = False
            end
            object imMateraErroCertificado: TImage
              Left = 64
              Top = 343
              Width = 16
              Height = 16
              Visible = False
            end
            object btMateraAcharArqCertificado: TSpeedButton
              Left = 848
              Top = 341
              Width = 24
              Height = 23
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object btMateraAcharChavePrivada: TSpeedButton
              Left = 848
              Top = 269
              Width = 24
              Height = 23
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object lbMateraArqChavePrivada: TLabel
              Left = 87
              Top = 253
              Width = 110
              Height = 13
              Caption = 'Arquivo Chave Privada'
              Color = clBtnFace
              ParentColor = False
            end
            object lbMateraErroChavePrivada: TLabel
              Left = 87
              Top = 293
              Width = 129
              Height = 13
              Caption = 'lbMateraErroChavePrivada'
              Color = clBtnFace
              ParentColor = False
            end
            object imMateraErroChavePrivada: TImage
              Left = 64
              Top = 272
              Width = 16
              Height = 16
              Visible = False
            end
            object lbMateraSecretKey: TLabel
              Left = 496
              Top = 144
              Width = 52
              Height = 13
              Caption = 'Secret Key'
              Color = clBtnFace
              ParentColor = False
            end
            object lbMateraAccountId: TLabel
              Left = 87
              Top = 197
              Width = 52
              Height = 13
              Caption = 'Account Id'
              Color = clBtnFace
              ParentColor = False
            end
            object lbMateraChavePIX: TLabel
              Left = 87
              Top = 88
              Width = 50
              Height = 13
              Caption = 'Chave PIX'
              Color = clBtnFace
              ParentColor = False
            end
            object lbMateraClientSecret: TLabel
              Left = 87
              Top = 144
              Width = 61
              Height = 13
              Caption = 'Client Secret'
              Color = clBtnFace
              ParentColor = False
            end
            object lbMateraMediatorFee: TLabel
              Left = 727
              Top = 197
              Width = 63
              Height = 13
              Caption = 'Mediator Fee'
              Color = clBtnFace
              ParentColor = False
            end
            object edMateraClientID: TEdit
              Left = 496
              Top = 103
              Width = 376
              Height = 21
              PasswordChar = '*'
              TabOrder = 0
            end
            object edMateraArqCertificado: TEdit
              Left = 87
              Top = 341
              Width = 761
              Height = 23
              AutoSize = False
              TabOrder = 1
            end
            object edMateraArqChavePrivada: TEdit
              Left = 87
              Top = 269
              Width = 761
              Height = 23
              AutoSize = False
              TabOrder = 2
            end
            object edMateraSecretKey: TEdit
              Left = 496
              Top = 159
              Width = 376
              Height = 21
              PasswordChar = '*'
              TabOrder = 3
            end
            object edMateraAccountId: TEdit
              Left = 87
              Top = 212
              Width = 617
              Height = 21
              TabOrder = 4
            end
            object edMateraChavePIX: TEdit
              Left = 87
              Top = 103
              Width = 385
              Height = 21
              TabOrder = 5
            end
            object edMateraClientSecret: TEdit
              Left = 87
              Top = 159
              Width = 385
              Height = 21
              PasswordChar = '*'
              TabOrder = 6
            end
            object edMateraMediatorFee: TEdit
              Left = 727
              Top = 212
              Width = 145
              Height = 21
              TabOrder = 7
              Text = '0,10'
            end
          end
        end
        object tsCielo: TTabSheet
          Caption = 'Cielo'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          DesignSize = (
            735
            461)
          object pnCielo: TPanel
            Left = 48
            Top = 57
            Width = 631
            Height = 322
            Anchors = [akLeft, akRight]
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              631
              322)
            object lbCieloTipoChave: TLabel
              Left = 432
              Top = 24
              Width = 54
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Tipo Chave'
              Color = clBtnFace
              ParentColor = False
              ExplicitLeft = 681
            end
            object lbCieloClientSecret: TLabel
              Left = 24
              Top = 132
              Width = 61
              Height = 13
              Caption = 'Client Secret'
              Color = clBtnFace
              ParentColor = False
            end
            object lbCieloClientID: TLabel
              Left = 24
              Top = 75
              Width = 41
              Height = 13
              Caption = 'Client ID'
              Color = clBtnFace
              ParentColor = False
            end
            object lbCieloChave: TLabel
              Left = 24
              Top = 24
              Width = 50
              Height = 13
              Caption = 'Chave PIX'
              Color = clBtnFace
              ParentColor = False
            end
            object imCieloErroChavePix: TImage
              Left = 595
              Top = 43
              Width = 16
              Height = 17
              Anchors = [akTop, akRight]
              Visible = False
              ExplicitLeft = 844
            end
            object edCieloClientSecret: TEdit
              Left = 24
              Top = 148
              Width = 567
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 3
            end
            object edCieloClientID: TEdit
              Left = 24
              Top = 90
              Width = 567
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
            object edCieloChavePIX: TEdit
              Left = 24
              Top = 40
              Width = 389
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
            end
            object cbCieloTipoChave: TComboBox
              Left = 432
              Top = 40
              Width = 157
              Height = 21
              Style = csDropDownList
              Anchors = [akTop, akRight]
              TabOrder = 1
              TabStop = False
            end
          end
        end
      end
      object pBotoesConfiguracao: TPanel
        Left = 0
        Top = 489
        Width = 743
        Height = 37
        Align = alBottom
        TabOrder = 1
        object btSalvarParametros: TBitBtn
          Left = 16
          Top = 4
          Width = 136
          Height = 28
          Caption = 'Salvar Par'#226'metros'
          TabOrder = 0
          OnClick = btSalvarParametrosClick
        end
        object btLerParametros: TBitBtn
          Left = 176
          Top = 4
          Width = 136
          Height = 28
          Caption = 'Ler Par'#226'metros'
          TabOrder = 1
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Teste'
      ImageIndex = 2
      DesignSize = (
        743
        526)
      object Valor: TLabel
        Left = 8
        Top = 319
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object Label34: TLabel
        Left = 177
        Top = 319
        Width = 100
        Height = 13
        Caption = 'Informa'#231#227'o Adicional'
      end
      object imgQRE: TImage
        Left = 8
        Top = 363
        Width = 209
        Height = 157
        Center = True
        Proportional = True
        Stretch = True
      end
      object Label1: TLabel
        Left = 273
        Top = 366
        Width = 26
        Height = 13
        Caption = 'TxId:'
      end
      object Label2: TLabel
        Left = 273
        Top = 390
        Width = 17
        Height = 13
        Caption = 'loc:'
      end
      object mLog: TMemo
        Left = -4
        Top = 4
        Width = 744
        Height = 303
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
      end
      object fleQREValor: TEdit
        Left = 8
        Top = 336
        Width = 145
        Height = 21
        TabOrder = 1
        Text = '0,00'
      end
      object edtQREInfoAdicional: TEdit
        Left = 177
        Top = 336
        Width = 415
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object btQREGerar: TBitBtn
        Left = 536
        Top = 451
        Width = 161
        Height = 49
        Anchors = [akBottom]
        Caption = 'Gerar QRCode'
        TabOrder = 3
        OnClick = btQREGerarClick
      end
      object BitBtn1: TBitBtn
        Left = 344
        Top = 451
        Width = 161
        Height = 49
        Anchors = [akBottom]
        Caption = 'Analisar'
        TabOrder = 4
        OnClick = BitBtn1Click
      end
      object txidEstatico: TEdit
        Left = 305
        Top = 363
        Width = 272
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
      end
      object loca: TEdit
        Left = 305
        Top = 390
        Width = 272
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 152
    Top = 413
  end
end

object Form9: TForm9
  Left = 68
  Top = 166
  Caption = 'Cadastro de Produtos'
  ClientHeight = 399
  ClientWidth = 780
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object painel: TPanel
    Left = 0
    Top = 0
    Width = 780
    Height = 399
    Align = alClient
    TabOrder = 0
    object Label2: TLabel
      Left = 96
      Top = 16
      Width = 37
      Height = 13
      Caption = 'Nome:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 44
      Height = 13
      Caption = 'C'#243'digo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 440
      Top = 16
      Width = 48
      Height = 13
      Caption = 'Fornec.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 512
      Top = 16
      Width = 44
      Height = 13
      Caption = 'Fabric.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 584
      Top = 16
      Width = 39
      Height = 13
      Caption = 'Grupo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 72
      Width = 37
      Height = 13
      Caption = 'Custo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 472
      Top = 72
      Width = 59
      Height = 13
      Caption = 'Agreg.(%):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 664
      Top = 72
      Width = 51
      Height = 13
      Caption = 'Frete(%):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 95
      Top = 136
      Width = 58
      Height = 13
      Caption = 'Encarg.%:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 159
      Top = 136
      Width = 54
      Height = 13
      Caption = 'Lucro(%):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 228
      Top = 136
      Width = 78
      Height = 13
      Caption = 'Pre'#231'o Venda:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label17: TLabel
      Left = 315
      Top = 136
      Width = 79
      Height = 13
      Caption = 'Estoque Loja:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 399
      Top = 136
      Width = 55
      Height = 13
      Caption = 'Dep'#243'sito:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label19: TLabel
      Left = 469
      Top = 136
      Width = 68
      Height = 13
      Caption = 'Pre'#231'o Atac:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label20: TLabel
      Left = 542
      Top = 136
      Width = 75
      Height = 13
      Caption = 'Comiss'#227'o(%):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label21: TLabel
      Left = 623
      Top = 136
      Width = 31
      Height = 13
      Caption = 'Unid:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label22: TLabel
      Left = 692
      Top = 136
      Width = 29
      Height = 13
      Caption = 'Emb:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label24: TLabel
      Left = 8
      Top = 200
      Width = 46
      Height = 13
      Caption = 'M'#237'nimo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label25: TLabel
      Left = 80
      Top = 200
      Width = 64
      Height = 13
      Caption = 'Aliq. ICMS:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label27: TLabel
      Left = 448
      Top = 200
      Width = 61
      Height = 13
      Caption = 'Aplica'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label28: TLabel
      Left = 592
      Top = 200
      Width = 76
      Height = 13
      Caption = 'Ref. Original:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label29: TLabel
      Left = 8
      Top = 256
      Width = 32
      Height = 13
      Caption = 'NCM:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label30: TLabel
      Left = 128
      Top = 256
      Width = 73
      Height = 13
      Caption = 'Localiza'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label31: TLabel
      Left = 304
      Top = 256
      Width = 71
      Height = 13
      Caption = 'Cod. Barras:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 152
      Top = 200
      Width = 71
      Height = 13
      Caption = 'Dev.ICMS%:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label37: TLabel
      Left = 344
      Top = 300
      Width = 5
      Height = 13
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label36: TLabel
      Left = 480
      Top = 256
      Width = 80
      Height = 13
      Caption = 'Classifica'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label38: TLabel
      Left = 8
      Top = 304
      Width = 30
      Height = 13
      Caption = 'OBS:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label32: TLabel
      Left = 624
      Top = 256
      Width = 57
      Height = 13
      Caption = 'Lucro R$:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label39: TLabel
      Left = 352
      Top = 304
      Width = 65
      Height = 13
      Caption = 'Altera'#231#245'es:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label26: TLabel
      Left = 376
      Top = 200
      Width = 44
      Height = 13
      Caption = 'Fra'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label34: TLabel
      Left = 664
      Top = 16
      Width = 30
      Height = 13
      Caption = 'Tipo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DescLabel: TLabel
      Left = 608
      Top = 304
      Width = 101
      Height = 13
      Caption = 'Desc. M'#225'ximo(%):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label40: TLabel
      Left = 556
      Top = 72
      Width = 90
      Height = 13
      Caption = 'Desc. Comp(%):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label23: TLabel
      Left = 7
      Top = 136
      Width = 70
      Height = 13
      Caption = 'ICMS Sub%:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label41: TLabel
      Left = 7
      Top = 344
      Width = 174
      Height = 16
      Caption = 'F3-Destiva/Ativa Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cod: JsEditInteiro
      Left = 8
      Top = 32
      Width = 73
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnEnter = codEnter
      OnKeyPress = JsEditInteiro1KeyPress
      OnKeyUp = codKeyUp
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
    end
    object nome: JsEdit
      Left = 96
      Top = 32
      Width = 337
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 80
      ParentFont = False
      TabOrder = 1
      OnEnter = nomeEnter
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      ValidaCampo = True
      Indice = 0
      TipoDeDado = teNumero
    end
    object fornec: JsEditInteiro
      Left = 440
      Top = 32
      Width = 65
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnKeyPress = fornecKeyPress
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
    end
    object fabric: JsEditInteiro
      Left = 512
      Top = 32
      Width = 65
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnKeyPress = fabricKeyPress
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
    end
    object grupo: JsEditInteiro
      Left = 584
      Top = 32
      Width = 65
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnKeyPress = grupoKeyPress
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
    end
    object TIPO_ITEM: JsEdit
      Left = 664
      Top = 33
      Width = 92
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 2
      ParentFont = False
      TabOrder = 5
      OnKeyPress = TIPO_ITEMKeyPress
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
    end
    object p_compra: JsEditNumero
      Left = 8
      Top = 88
      Width = 57
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      Text = '0,000'
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
      CasasDecimais = 3
    end
    object GroupBox1: TGroupBox
      Left = 88
      Top = 64
      Width = 185
      Height = 49
      Caption = 'Cr'#233'dito ICMS:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      object Label7: TLabel
        Left = 68
        Top = 24
        Width = 10
        Height = 13
        Caption = '%'
        Layout = tlCenter
      end
      object Label8: TLabel
        Left = 88
        Top = 24
        Width = 17
        Height = 13
        Caption = 'R$'
      end
      object basecred: JsEditNumero
        Left = 8
        Top = 23
        Width = 57
        Height = 24
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = '0,00'
        OnExit = basecredExit
        UsarCadastros = False
        FormularioComp = 'Form9'
        ColorOnEnter = clSkyBlue
        Indice = 0
        TipoDeDado = teNumero
        CasasDecimais = 2
      end
      object credicm: JsEditNumero
        Left = 112
        Top = 23
        Width = 57
        Height = 24
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Text = '0,00'
        UsarCadastros = False
        FormularioComp = 'Form9'
        ColorOnEnter = clSkyBlue
        Indice = 0
        TipoDeDado = teNumero
        CasasDecimais = 2
      end
    end
    object GroupBox2: TGroupBox
      Left = 288
      Top = 64
      Width = 169
      Height = 49
      Caption = 'D'#233'bito ICMS:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      object Label9: TLabel
        Left = 68
        Top = 24
        Width = 10
        Height = 13
        Caption = '%'
      end
      object Label10: TLabel
        Left = 80
        Top = 24
        Width = 17
        Height = 13
        Caption = 'R$'
      end
      object basedeb: JsEditNumero
        Left = 8
        Top = 23
        Width = 57
        Height = 24
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = '0,00'
        UsarCadastros = False
        FormularioComp = 'Form9'
        ColorOnEnter = clSkyBlue
        Indice = 0
        TipoDeDado = teNumero
        CasasDecimais = 2
      end
      object debicm: JsEditNumero
        Left = 104
        Top = 23
        Width = 57
        Height = 24
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Text = '0,00'
        UsarCadastros = False
        FormularioComp = 'Form9'
        ColorOnEnter = clSkyBlue
        Indice = 0
        TipoDeDado = teNumero
        CasasDecimais = 2
      end
    end
    object agregado: JsEditNumero
      Left = 472
      Top = 88
      Width = 55
      Height = 24
      Hint = 'Valores Agregados sobre o Pre'#231'o de Custo em %'
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      Text = '0,00'
      OnKeyPress = agregadoKeyPress
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
      CasasDecimais = 2
    end
    object DESC_COMP: JsEditNumero
      Left = 556
      Top = 88
      Width = 67
      Height = 24
      Hint = 'Desconto na Compra'
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      Text = '0,00'
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
      CasasDecimais = 2
    end
    object frete: JsEditNumero
      Left = 664
      Top = 88
      Width = 92
      Height = 24
      Hint = 'Frete'
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      Text = '0,00'
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
      CasasDecimais = 2
    end
    object ICMS_SUBS: JsEditNumero
      Left = 7
      Top = 152
      Width = 72
      Height = 24
      Hint = 'Valor em Porcentagem % de ICMS  de Substitui'#231#227'o Tribut'#225'ria'
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
      Text = '0,00'
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
      CasasDecimais = 2
    end
    object encargos: JsEditNumero
      Left = 95
      Top = 152
      Width = 45
      Height = 24
      Hint = 'Encargos do Produto em % '
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 13
      Text = '0,00'
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
      CasasDecimais = 2
    end
    object lucro: JsEditNumero
      Left = 159
      Top = 152
      Width = 57
      Height = 24
      Hint = 'Lucro desejado no Produto em %'
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 14
      Text = '0,00'
      OnKeyPress = lucroKeyPress
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
      CasasDecimais = 2
    end
    object p_venda: JsEditNumero
      Left = 228
      Top = 152
      Width = 65
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 15
      Text = '0,000'
      OnKeyPress = p_vendaKeyPress
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
      CasasDecimais = 3
    end
    object quant: JsEditNumero
      Left = 315
      Top = 152
      Width = 57
      Height = 24
      CharCase = ecUpperCase
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 16
      Text = '0,00'
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
      CasasDecimais = 2
    end
    object deposito: JsEditNumero
      Left = 399
      Top = 152
      Width = 57
      Height = 24
      CharCase = ecUpperCase
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 17
      Text = '0,00'
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
      CasasDecimais = 2
    end
    object p_venda1: JsEditNumero
      Left = 469
      Top = 152
      Width = 57
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 18
      Text = '0,00'
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
      CasasDecimais = 2
    end
    object comissao: JsEditNumero
      Left = 542
      Top = 152
      Width = 57
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 19
      Text = '0,00'
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
      CasasDecimais = 2
    end
    object unid: JsEdit
      Left = 623
      Top = 152
      Width = 63
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 6
      ParentFont = False
      TabOrder = 20
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
    end
    object emb: JsEdit
      Left = 692
      Top = 152
      Width = 64
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 5
      ParentFont = False
      TabOrder = 21
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
    end
    object estoque: JsEditNumero
      Left = 8
      Top = 216
      Width = 57
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 22
      Text = '0,00'
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
      CasasDecimais = 2
    end
    object aliquota: JsEditInteiro
      Left = 80
      Top = 216
      Width = 49
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 2
      ParentFont = False
      TabOrder = 23
      OnKeyPress = aliquotaKeyPress
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
    end
    object dev_icm: JsEditNumero
      Left = 152
      Top = 216
      Width = 49
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 24
      Text = '0,00'
      OnKeyPress = dev_icmKeyPress
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
      CasasDecimais = 2
    end
    object GroupBox3: TGroupBox
      Left = 224
      Top = 200
      Width = 137
      Height = 49
      Caption = 'PIS/COFINS:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 25
      object is_pis: JsEdit
        Left = 8
        Top = 17
        Width = 57
        Height = 24
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 1
        ParentFont = False
        TabOrder = 0
        OnKeyPress = is_pisKeyPress
        UsarCadastros = False
        FormularioComp = 'Form9'
        ColorOnEnter = clSkyBlue
        Indice = 0
        TipoDeDado = teNumero
      end
      object COD_ISPIS: JsEdit
        Left = 72
        Top = 17
        Width = 57
        Height = 24
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnKeyPress = COD_ISPISKeyPress
        UsarCadastros = False
        FormularioComp = 'Form9'
        ColorOnEnter = clSkyBlue
        Indice = 0
        TipoDeDado = teNumero
      end
    end
    object fracao: JsEditNumero
      Left = 376
      Top = 217
      Width = 66
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 26
      Text = '0,0000'
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
      CasasDecimais = 4
    end
    object aplic: JsEdit
      Left = 448
      Top = 216
      Width = 137
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 60
      ParentFont = False
      TabOrder = 27
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
    end
    object refori: JsEdit
      Left = 592
      Top = 216
      Width = 164
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 40
      ParentFont = False
      TabOrder = 28
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
    end
    object classif: JsEdit
      Left = 8
      Top = 272
      Width = 105
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentFont = False
      TabOrder = 29
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
    end
    object localiza: JsEdit
      Left = 128
      Top = 272
      Width = 161
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentFont = False
      TabOrder = 30
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
    end
    object codbar: JsEdit
      Left = 304
      Top = 272
      Width = 161
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 18
      ParentFont = False
      TabOrder = 31
      OnEnter = codbarEnter
      OnExit = codbarExit
      OnKeyPress = codbarKeyPress
      OnKeyUp = codbarKeyUp
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
    end
    object equiva: JsEdit
      Left = 480
      Top = 272
      Width = 129
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 32
      UsarCadastros = False
      FormularioComp = 'Form9'
      Indice = 0
      TipoDeDado = teNumero
    end
    object Edit1: TEdit
      Left = 624
      Top = 272
      Width = 132
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 33
      OnKeyDown = Edit1KeyDown
    end
    object OBS: JsEdit
      Left = 8
      Top = 320
      Width = 329
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 80
      TabOrder = 34
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
    end
    object igual: JsEdit
      Left = 352
      Top = 320
      Width = 241
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 40
      TabOrder = 35
      OnKeyPress = igualKeyPress
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
    end
    object ToolBar1: TPanel
      Left = 1
      Top = 361
      Width = 778
      Height = 37
      Align = alBottom
      TabOrder = 37
      object Label33: TLabel
        Left = 177
        Top = 8
        Width = 103
        Height = 16
        Caption = 'Ultimo Codigo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ulticod: TLabel
        Left = 281
        Top = 8
        Width = 5
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label35: TLabel
        Left = 337
        Top = 8
        Width = 512
        Height = 16
        Caption = 
          'F8 - Ficha do Produto   F5 - Consulta/F6 Consulta Codbarras/F9 F' +
          'iltra Nota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object JsBotao1: JsBotao
        Left = 0
        Top = 2
        Width = 89
        Height = 31
        Caption = 'Gravar'
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000EB0A0000EB0A00000000000000000000CCCCCCCACACA
          C8C8C8C4C4C4BEBEBEBABABAB4B4B4AEAEAEA7A7A7A2A2A29E9E9E9E9E9EA2A2
          A2AAAAAAB0B0B0B6B6B6BDBDBDC2C2C2C7C7C7CACACACCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCC8C8C8BCBCBCB3B3B3ACACACA5A5A59E9E9E969696919191979797
          8C8C8C8D8D8D9393939A9A9AA0A0A0A8A8A8B0B0B0B7B7B7BFBFBFC7C7C7CCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCBCBCBC9C9C9C7C7C7C6C6C6C4C4C4C6
          C6C6BFC1C06B9880ADB8B2C7C7C7C3C3C3C3C3C3C5C5C5C6C6C6C8C8C8CACACA
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCC669D80298355549472C4C9C6CCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC6A9B822984552C905E2A8959549271C2C7
          C4CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC739F882886552B955F2B945F
          2C9660298C59599475C7C9C8CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC79A28C2888562B
          9B622B9B612B9A612B9A612B9C62298F5961977ACBCBCBCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC81A6
          922988562BA0642BA1642BA0642BA0642BA0642BA0642BA26529915B63987CCB
          CBCBCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCC88A897278A5527A5652AA6672AA5672AA5672AA5672AA5672AA5672AA5
          672AA76828925B699B80CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCC8CAA9A3791624AB67F30AF6F24A96626AA6729AB6929AB69
          29AB6929AB6929AB6929AB6A29AC6B27935C6E9D84CCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCC99B0A438916267C69679CFA466C79648BC8130
          B47124B06926B06A28B16C28B16C28B16C28B16C29B26D29B36D27955C75A089
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC8FAC9D3C946768CA987BD5A871CF
          A071CFA06FCE9E60C9944FC3893ABD7B2AB77027B66E26B66E25B66D26B66D27
          B76F27B86F27945C7AA28DCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC3F89625DB98A
          83DFB174D3A371D3A16DD19F69D19C69D09B67D09B61D09858CE9247C6853CC2
          7E32BF772CBD7428BC7125BD7025BA6E25935B80A491CCCCCCCCCCCCCCCCCCCC
          CCCCB7C0BB609D7E6FCA9C78DDAA70D6A26CD6A068D49E68D69F59CB91379966
          50BF875CD69856CF9252CF8F49CB8940C98438C77E32C77B2DC3772A955D89A9
          97CCCCCCCCCCCCCCCCCCCCCCCCB7BEB955987468CB9973E0A96CD9A26DDDA55B
          D39639986782A0914A956E4EC38756D9974FD38F4CD18D49D18C47D08B41CE87
          3BD08637CA803197638EAB9BCCCCCCCCCCCCCCCCCCCCCCCCAEBAB44B956E64D0
          9975E7AE5DDA9A349A6596ACA0CCCCCCA9B9B03E93674BCA8A50DB954AD58F47
          D58D43D38B3FD3893DD28739D48734CC8033956297AEA2CCCCCCCCCCCCCCCCCC
          CCCCCCACB9B248966E52CD8F35A06990AA9CCCCCCCCCCCCCCCCCCCA7B8AF3C95
          6749D08D4CDF9546D99042D88D3ED88B3BD78937D68733D98630CF7E36986593
          AD9FCCCCCCCCCCCCCCCCCCCCCCCCA5B7AD36895D83A794CCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCA0B3A936966546D58D48E49642DE903EDD8D3BDD8B37DC8933DB
          8730E68B29B66F3D8860CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCBDC3BFCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC9AB0A5339B6443DC8F42E7943DE28E
          3AE28C36E18A34E88D2DC97A43956BB2BCB6CCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC95ADA032
          9D6540E3913FEB943AE68F37EA9030D07F409368B8BEBBCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCC90A99B2EA1663DE5903CF29734D5833B9365B2BAB5CCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC8DA8992FA76835D484399665ADB6
          B1CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC82A894
          3D8F64ACB8B1CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCBAC0BCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC}
        TabOrder = 0
        OnClick = JsBotao1Click
      end
      object JsBotao2: JsBotao
        Left = 89
        Top = 2
        Width = 80
        Height = 31
        Caption = 'Excluir'
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000EB0A0000EB0A00000000000000000000CCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC3C3C3CCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC3C3C3CCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC86868610102262
          6262CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC626262101022
          868686CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC7979
          790000410202E50000675C5C5CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC5C
          5C5C0000670202E5000041797979CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCC6A6A6A0000500505FB0A0AFF0606FF00006C555555CCCCCCCCCCCCCCCC
          CCCCCCCC54545400006C0606FF0A0AFF0505FB0000506A6A6ACCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCC6666660000610909FF0F0FFF0E0EFE0F0FFF0A0AFF000074
          4D4D4DCCCCCCCCCCCC4D4D4D0000740A0AFF0F0FFF0E0EFE0F0FFF0909FF0000
          62666666CCCCCCCCCCCCCCCCCCCCCCCC3D3D3E0000CA0E0EFF1616FA1313FA13
          13FA1515FC0E0EFF00007C4E4E4E4E4E4E00007C0E0EFF1515FC1313FA1313FA
          1616FA0E0EFF0000CA3D3D3ECCCCCCCCCCCCCCCCCCCCCCCC9999990000350000
          E91212FF1D1DF61A1AF71A1AF71B1BF91414FF00007B00007B1414FF1B1BF91A
          1AF71A1AF71D1DF61212FF0000E9000035999999CCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCC86868600002F0000DE1616FF2424F32020F32020F32222F41919FF1919
          FF2222F42020F32020F32424F31616FF0000DF00002F868686CCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCC8686860000280000D21B1BFC2C2CF12727F0
          2727F02929F12929F12727F02727F02C2CF11B1BFC0000D2000028868686CCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC89898903032600
          00C51D1DF13131EE2F2FED2F2FED2F2FED2F2FED3131EE1D1DF10000C6030326
          898989CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCC7E7E7E00001D0707E03838EF3838EB3838EB3838EB3838EB3838EF07
          07E100001D7E7E7ECCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCB9B9B92D2D3109099E3B3BF14343E94141E94141E94141
          E94141E94343E93B3BF109099E2D2D31BABABACCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCB4B4B41D1D240C0CA44646FA4E4EE64A4AE6
          4A4AE64F4FE74F4FE74A4AE64A4AE64E4EE64646FA0C0CA41D1D24B4B4B4CCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCAFAFAF1818231010A95151F758
          58E55454E55454E55D5DE73232E63232E65D5DE75454E55454E55858E55151F7
          1010A9181823AFAFAFCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCAAAAAA1212211515
          AF5D5DF56262E45E5EE45E5EE46767E63A3AEA0000A20000A23A3AEA6767E65E
          5EE45E5EE46262E45D5DF51515AF121221AAAAAACCCCCCCCCCCCCCCCCCB3B3B3
          0C0C282020B76C6CF46C6CE36868E46969E47373E64040E90000A80303140303
          140000AB4040E87373E56969E46868E46C6CE36C6CF42020B70C0C28B3B3B3CC
          CCCCCCCCCCB1B1B100002A2424DC7B7BE97777E37474E38080E54646E60000A6
          0303179A9A9A9A9A9A03031B0000B14646E68080E47474E37777E37B7BEA2424
          DC00002AB1B1B1CCCCCCCCCCCCCCCCCC7878780000372828D98787E99090E64D
          4DE40000AC020219929292CCCCCCCCCCCC9292920202200000BA4D4DE39090E5
          8787EA2828D9000036787878CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC6E6E6E0000
          423737DE5454E50000B803031E929292CCCCCCCCCCCCCCCCCCCCCCCC92929203
          03250000C75454E63737DC0000406E6E6ECCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCC6767670000540000C9040426959595CCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCC95959504042E0000D200004F676767CCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC5E5E5E10101F959595CCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC95959510101F5E5E5ECCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC3C3C3CC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC3C3C3
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC}
        TabOrder = 1
        OnClick = JsBotao2Click
      end
    end
    object desconto: JsEditNumero
      Left = 608
      Top = 320
      Width = 148
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 36
      Text = '0,00'
      Visible = False
      UsarCadastros = False
      FormularioComp = 'Form9'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
      CasasDecimais = 2
    end
  end
end

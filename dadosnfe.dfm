object Form79: TForm79
  Left = 0
  Top = 0
  Caption = 'Informa'#231#245'es da NFe'
  ClientHeight = 573
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label9: TLabel
    Left = 7
    Top = 3
    Width = 100
    Height = 16
    Caption = 'Nota de Venda:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 488
    Top = 3
    Width = 92
    Height = 16
    Caption = 'N'#250'mero da NF:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 648
    Top = 3
    Width = 49
    Height = 16
    Caption = 'Cliente:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 8
    Top = 419
    Width = 142
    Height = 16
    Caption = 'Despesas Acessorias:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 8
    Top = 362
    Width = 36
    Height = 16
    Caption = 'CFOP:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 150
    Top = 359
    Width = 116
    Height = 16
    Caption = 'F3-Salva F4-Limpa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object nota: TEdit
    Left = 5
    Top = 20
    Width = 459
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyDown = notaKeyDown
    OnKeyPress = notaKeyPress
  end
  object numnf: TEdit
    Left = 488
    Top = 20
    Width = 131
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnKeyDown = numnfKeyDown
    OnKeyPress = numnfKeyPress
  end
  object Panel1: TPanel
    Left = 0
    Top = 532
    Width = 792
    Height = 41
    ParentCustomHint = False
    Align = alBottom
    BevelOuter = bvNone
    BorderWidth = 4
    BorderStyle = bsSingle
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 12
    object Label12: TLabel
      Left = 198
      Top = 10
      Width = 114
      Height = 16
      Caption = 'F2 - Ver Produtos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ButBaixar: TBitBtn
      Left = 0
      Top = 0
      Width = 192
      Height = 39
      Caption = 'Gerar NFe'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Glyph.Data = {
        EE070000424DEE070000000000003600000028000000190000001A0000000100
        180000000000B8070000120B0000120B00000000000000000000DBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDB00DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB00DBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB1CAC66DBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB00DBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB1C
        AC662FBD7D1CAC66DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDB00DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDB1CAC662CBC7B48D69D30BE7E1CAC66DBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB00DBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB1CAC6629BB7740D29544D49949D69E
        30BE7F1CAC66DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DB00DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB1CAC6625BA75
        38CF8D3CD19241D39646D59B4BD69F31BE7F1CAC66DBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDB00DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDB1CAC6623B97230CC8734CD8B39CF8E29CC8142D39747D59C4CD6A031BE
        801CAC66DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB00DBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDB1CAC6622B8712BCB822ECC8431CC8822C97A25C7
        7D2BCC8343D49949D69E4DD7A132BF801CAC66DBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDB00DBDBDBDBDBDBDBDBDBDBDBDBDBDBDB1CAC6622B8712ACA812ACA
        812CCB831BC6741EC57622C57926C77E2DCC8445D49A4AD69E4ED7A332BF811C
        AC66DBDBDBDBDBDBDBDBDBDBDBDBDBDBDB00DBDBDBDBDBDBDBDBDBDBDBDB1CAC
        661CAC661CAC661CAC6622B87116C46F18C2701BC4731FC57624C67B28C87F2E
        CD852DBD7C1CAC661CAC661CAC661CAC66DBDBDBDBDBDBDBDBDBDBDBDB00DBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB1CAC6615C16D16C16E19
        C3711CC47420C57724C77C3ED2941CAC66DBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBCCDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDB1CAC662ACA812ACA8117C26F1AC37232CC8837CE8C3BD0901CAC66DBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB00DBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDB1CAC662ACA812ACA8115C16D18C26F30CC86
        33CD8A38CF8D1CAC66DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DB00DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB1CAC662ACA81
        2ACA8115C16D16C16E2DCB8330CC8734CD8B1CAC66DBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDB00DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDB1CAC662ACA812ACA8116C46F16C46F17C5702ECC8431CC881CAC
        66DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB00DBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB1CAC662ACA812ACA812ACA812ACA
        812ACA812CCB832FCC851CAC66DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDB00DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB1CAC
        662AC97F2ACA812ACA812ACA812ACA812ACA812DCB831CAC66DBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB00DBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDB1CAC6628C67C2ACA802ACA812ACA812ACA812ACA812B
        CA821CAC66DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB00DBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB1CAC6627C37829C77D2A
        CA812ACA812ACA812ACA812ACA811CAC66DBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDB00DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDB1CAC6627BF7328C47A29C87F2ACA812ACA812ACA812ACA811CAC66DBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB00DBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDB1CAC6625BC7027C17528C57B2AC9802ACA81
        2ACA812ACA811CAC66DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DB00DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB1CAC6624BA6C
        26BD7127C27729C67D2ACA812ACA812ACA811CAC66DBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDB00DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDB1CAC661CAC661CAC661CAC661CAC661CAC661CAC661CAC661CAC
        66DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB00DBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDB00DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBFF}
      ParentFont = False
      TabOrder = 0
      OnClick = ButBaixarClick
      OnKeyDown = ButBaixarKeyDown
      OnKeyPress = ButBaixarKeyPress
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 55
    Width = 193
    Height = 137
    Caption = 'Finalidade da NFe'
    TabOrder = 3
    object Label3: TLabel
      Left = 11
      Top = 15
      Width = 107
      Height = 64
      Caption = '1-Normal'#13#10'2-Complementar'#13#10'3-De ajuste'#13#10'4-Devolu'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object finnfe: TEdit
      Left = 11
      Top = 101
      Width = 57
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '1'
      OnKeyDown = finnfeKeyDown
      OnKeyPress = finnfeKeyPress
    end
  end
  object GroupBox2: TGroupBox
    Left = 207
    Top = 55
    Width = 185
    Height = 137
    Caption = 'Tipo da NFe'
    TabOrder = 4
    object Label2: TLabel
      Left = 11
      Top = 15
      Width = 102
      Height = 48
      Caption = 'E-Entrada'#13#10'S-Saida'#13#10'T-Transfer'#234'ncia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object tiponfe: TEdit
      Left = 11
      Top = 101
      Width = 57
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'S'
      OnKeyDown = tiponfeKeyDown
      OnKeyPress = tiponfeKeyPress
    end
  end
  object GroupBox3: TGroupBox
    Left = 398
    Top = 55
    Width = 243
    Height = 137
    Caption = 'Origem da Mercadoria'
    TabOrder = 5
    object Label4: TLabel
      Left = 11
      Top = 15
      Width = 200
      Height = 80
      Caption = 
        '0-Nacional'#13#10'1-Estrangeira'#13#10'2-Estrageira Ad. Merc. Interno'#13#10'3-Nac' +
        'ional, mercadoria ou bem'#13#10'Importa'#231#227'o superior a 40% '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object origemmercadoria: TEdit
      Left = 11
      Top = 101
      Width = 57
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '0'
      OnKeyDown = origemmercadoriaKeyDown
      OnKeyPress = origemmercadoriaKeyPress
    end
  end
  object GroupBox4: TGroupBox
    Left = 647
    Top = 55
    Width = 143
    Height = 137
    Caption = 'Destino da Mercadoria'
    TabOrder = 6
    object Label5: TLabel
      Left = 11
      Top = 15
      Width = 128
      Height = 32
      Caption = '1-Mercado Interno '#13#10'2-Comercio Exterior'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object destMercadoria: TEdit
      Left = 11
      Top = 101
      Width = 57
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '1'
      OnKeyDown = destMercadoriaKeyDown
      OnKeyPress = destMercadoriaKeyPress
    end
  end
  object GroupBox5: TGroupBox
    Left = 8
    Top = 198
    Width = 489
    Height = 155
    Caption = 'Dados Adicionais'
    TabOrder = 7
    object dadosAdic: TMemo
      Left = 8
      Top = 24
      Width = 470
      Height = 121
      CharCase = ecUpperCase
      TabOrder = 0
      OnKeyPress = dadosAdicKeyPress
    end
  end
  object cliente: TEdit
    Left = 646
    Top = 20
    Width = 131
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnKeyDown = clienteKeyDown
    OnKeyPress = clienteKeyPress
    OnKeyUp = clienteKeyUp
  end
  object GroupBox6: TGroupBox
    Left = 503
    Top = 198
    Width = 138
    Height = 155
    Caption = 'Frete por Conta'
    TabOrder = 8
    object Label7: TLabel
      Left = 11
      Top = 15
      Width = 98
      Height = 48
      Caption = '0-Emitente '#13#10'1-Destinat'#225'rio '#13#10'9-Sem Frete'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object FretePorConta: TEdit
      Left = 11
      Top = 117
      Width = 57
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '9'
      OnKeyDown = FretePorContaKeyDown
      OnKeyPress = FretePorContaKeyPress
    end
  end
  object despAcessorias: JsEditNumero
    Left = 8
    Top = 441
    Width = 142
    Height = 29
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    Text = '0,00'
    OnKeyDown = despAcessoriasKeyDown
    OnKeyPress = despAcessoriasKeyPress
    AddLista = False
    FormularioComp = 'Form79'
    Indice = 0
    TipoDeDado = teNumero
    CasasDecimais = 2
  end
  object cfop: JsEditInteiro
    Left = 8
    Top = 384
    Width = 142
    Height = 29
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnKeyDown = cfopKeyDown
    OnKeyPress = cfopKeyPress
    AddLista = False
    FormularioComp = 'Form79'
    Indice = 0
    TipoDeDado = teNumero
  end
  object GroupBox7: TGroupBox
    Left = 646
    Top = 198
    Width = 146
    Height = 155
    Caption = 'Tipo de Emiss'#227'o'
    TabOrder = 9
    object Label13: TLabel
      Left = 11
      Top = 15
      Width = 100
      Height = 32
      Caption = '1-Produ'#231#227'o'#13#10'2-Homologa'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object tipoEmissao: TEdit
      Left = 11
      Top = 117
      Width = 57
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '2'
      OnKeyDown = tipoEmissaoKeyDown
      OnKeyPress = tipoEmissaoKeyPress
    end
  end
end

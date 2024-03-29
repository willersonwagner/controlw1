object Form87: TForm87
  Left = 0
  Top = 0
  Caption = 'Cadastro Informa'#231#245'es Nutricionais'
  ClientHeight = 308
  ClientWidth = 551
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 56
    Width = 159
    Height = 13
    Caption = 'Valor Energ'#233'tico (Kcal = KJ):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 18
    Top = 83
    Width = 96
    Height = 13
    Caption = 'Carboidratos (g):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 20
    Top = 110
    Width = 77
    Height = 13
    Caption = 'Proteinas (g):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 20
    Top = 137
    Width = 113
    Height = 13
    Caption = 'Gorduras Totais (g):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 18
    Top = 164
    Width = 136
    Height = 13
    Caption = 'Gorduras Saturadas (g):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 20
    Top = 191
    Width = 110
    Height = 13
    Caption = 'Gorduras Trans (g):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 22
    Top = 218
    Width = 110
    Height = 13
    Caption = 'Fibra Alimentar (g):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 22
    Top = 245
    Width = 54
    Height = 13
    Caption = 'S'#243'dio (g):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 18
    Top = 2
    Width = 52
    Height = 13
    Caption = 'C'#243'd. Prod.'
  end
  object Label10: TLabel
    Left = 95
    Top = 2
    Width = 56
    Height = 13
    Caption = 'Quantidade'
  end
  object Label11: TLabel
    Left = 200
    Top = 2
    Width = 61
    Height = 13
    Caption = 'Parte Inteira'
  end
  object Label12: TLabel
    Left = 281
    Top = 2
    Width = 65
    Height = 13
    Caption = 'Parte Decimal'
  end
  object Label13: TLabel
    Left = 377
    Top = 2
    Width = 78
    Height = 13
    Caption = 'Medi'#231#227'o Caseira'
  end
  object Label15: TLabel
    Left = 247
    Top = 56
    Width = 61
    Height = 13
    Caption = 'Tara Valor:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label14: TLabel
    Left = 164
    Top = 2
    Width = 21
    Height = 13
    Caption = 'Unid'
  end
  object codProd: JsEditInteiro
    Left = 16
    Top = 16
    Width = 73
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
    OnKeyPress = codProdKeyPress
    AddLista = False
    FormularioComp = 'Form87'
    Indice = 0
    TipoDeDado = teNumero
  end
  object Quantidade: JsEditNumero
    Left = 104
    Top = 16
    Width = 49
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
    Text = '0,00'
    OnKeyPress = QuantidadeKeyPress
    FormularioComp = 'Form87'
    Indice = 0
    TipoDeDado = teNumero
    CasasDecimais = 2
  end
  object unid: JsEdit
    Left = 160
    Top = 16
    Width = 34
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
    OnKeyPress = unidKeyPress
    FormularioComp = 'Form87'
    Indice = 0
    TipoDeDado = teNumero
  end
  object ParteInteira: JsEditInteiro
    Left = 202
    Top = 16
    Width = 73
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
    OnKeyPress = ParteInteiraKeyPress
    FormularioComp = 'Form87'
    Indice = 0
    TipoDeDado = teNumero
  end
  object ParteDecimal: TComboBox
    Left = 281
    Top = 16
    Width = 82
    Height = 21
    TabOrder = 4
    Text = '0'
    OnKeyPress = ParteDecimalKeyPress
    Items.Strings = (
      '1/4'
      '1/3'
      '1/2'
      '2/3'
      '3/4')
  end
  object MedicaoCaseira: TComboBox
    Left = 377
    Top = 16
    Width = 154
    Height = 21
    TabOrder = 5
    OnKeyPress = MedicaoCaseiraKeyPress
  end
  object valorEnergetico: JsEditNumero
    Left = 181
    Top = 53
    Width = 60
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 6
    Text = '0,00'
    FormularioComp = 'Form87'
    Indice = 0
    TipoDeDado = teNumero
    CasasDecimais = 2
  end
  object carboidratos: JsEditNumero
    Left = 120
    Top = 80
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 7
    Text = '0,00'
    FormularioComp = 'Form87'
    Indice = 0
    TipoDeDado = teNumero
    CasasDecimais = 2
  end
  object proteinas: JsEditNumero
    Left = 103
    Top = 107
    Width = 138
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 8
    Text = '0,00'
    FormularioComp = 'Form87'
    Indice = 0
    TipoDeDado = teNumero
    CasasDecimais = 2
  end
  object gordurastotais: JsEditNumero
    Left = 139
    Top = 134
    Width = 102
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 9
    Text = '0,00'
    FormularioComp = 'Form87'
    Indice = 0
    TipoDeDado = teNumero
    CasasDecimais = 2
  end
  object gordurasSaturadas: JsEditNumero
    Left = 160
    Top = 161
    Width = 81
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 10
    Text = '0,00'
    FormularioComp = 'Form87'
    Indice = 0
    TipoDeDado = teNumero
    CasasDecimais = 2
  end
  object GordurasTrans: JsEditNumero
    Left = 136
    Top = 188
    Width = 105
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 11
    Text = '0,00'
    FormularioComp = 'Form87'
    Indice = 0
    TipoDeDado = teNumero
    CasasDecimais = 2
  end
  object FibraAlimentar: JsEditNumero
    Left = 138
    Top = 215
    Width = 103
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 12
    Text = '0,00'
    FormularioComp = 'Form87'
    Indice = 0
    TipoDeDado = teNumero
    CasasDecimais = 2
  end
  object Sodio: JsEditNumero
    Left = 82
    Top = 242
    Width = 159
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 13
    Text = '0,00'
    FormularioComp = 'Form87'
    Indice = 0
    TipoDeDado = teNumero
    CasasDecimais = 2
  end
  object tara: JsEditNumero
    Left = 314
    Top = 53
    Width = 147
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 14
    Text = '0,000'
    FormularioComp = 'Form87'
    Indice = 0
    TipoDeDado = teNumero
    CasasDecimais = 3
  end
  object ToolBar1: TPanel
    Left = 0
    Top = 271
    Width = 551
    Height = 37
    Align = alBottom
    TabOrder = 15
    ExplicitLeft = -254
    ExplicitWidth = 778
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
    end
  end
end

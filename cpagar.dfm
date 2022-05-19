object Form27: TForm27
  Left = 468
  Top = 298
  Caption = 'Contas a Pagar'
  ClientHeight = 336
  ClientWidth = 547
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 547
    Height = 296
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 297
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 29
      Height = 13
      Caption = 'Grupo'
    end
    object Label2: TLabel
      Left = 88
      Top = 16
      Width = 34
      Height = 13
      Caption = 'Vencto'
    end
    object Label3: TLabel
      Left = 168
      Top = 16
      Width = 37
      Height = 13
      Caption = 'Nr. Doc'
    end
    object Label4: TLabel
      Left = 472
      Top = 16
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object JsEdit3: JsEdit
      Left = 8
      Top = 32
      Width = 65
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnEnter = JsEdit3Enter
      OnKeyPress = JsEditInteiro1KeyPress
      OnKeyUp = JsEdit3KeyUp
      FormularioComp = 'Form27'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
    end
    object JsEditData1: JsEditData
      Left = 88
      Top = 32
      Width = 65
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
      ValidaCampo = False
      CompletaData = False
      ColorOnEnter = clSkyBlue
    end
    object JsEdit1: JsEdit
      Left = 168
      Top = 32
      Width = 65
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
      OnKeyPress = JsEdit1KeyPress
      FormularioComp = 'Form27'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
    end
    object GroupBox1: TGroupBox
      Left = 248
      Top = 16
      Width = 217
      Height = 49
      Caption = 'Hist'#243'rico'
      TabOrder = 3
      object JsEditInteiro2: JsEditInteiro
        Left = 8
        Top = 16
        Width = 41
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        OnKeyPress = JsEditInteiro2KeyPress
        FormularioComp = 'Form27'
        ColorOnEnter = clSkyBlue
        Indice = 0
        TipoDeDado = teNumero
      end
      object JsEdit2: JsEdit
        Left = 56
        Top = 16
        Width = 153
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 60
        TabOrder = 1
        OnKeyPress = JsEdit2KeyPress
        FormularioComp = 'Form27'
        ColorOnEnter = clSkyBlue
        Indice = 0
        TipoDeDado = teNumero
      end
    end
    object JsEditNumero1: JsEditNumero
      Left = 470
      Top = 32
      Width = 65
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
      Text = '0,00'
      OnKeyPress = JsEditNumero1KeyPress
      FormularioComp = 'Form27'
      ColorOnEnter = clSkyBlue
      ValidaCampo = True
      Indice = 0
      TipoDeDado = teNumero
      CasasDecimais = 2
    end
    object DBGrid1: TDBGrid
      Left = 6
      Top = 72
      Width = 529
      Height = 169
      DataSource = dm.ds1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyPress = DBGrid1KeyPress
    end
    object GroupBox2: TGroupBox
      Left = 0
      Top = 256
      Width = 265
      Height = 40
      Caption = 'Grupo de Caixa'
      TabOrder = 6
      object nomegrupo: TLabel
        Left = 8
        Top = 17
        Width = 11
        Height = 16
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Courier'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object GroupBox3: TGroupBox
      Left = 273
      Top = 256
      Width = 270
      Height = 40
      Caption = 'Hist'#243'rico'
      TabOrder = 7
      object nomehis: TLabel
        Left = 6
        Top = 17
        Width = 11
        Height = 16
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Courier'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object ToolBar1: TPanel
    Left = 0
    Top = 296
    Width = 547
    Height = 40
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 297
    object info: TLabel
      Left = 80
      Top = 8
      Width = 76
      Height = 13
      Caption = 'F8 - Consulta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object JsBotao1: JsBotao
      Left = 0
      Top = 2
      Width = 75
      Height = 35
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
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 56
    Top = 56
  end
  object IBQuery1: TFDQuery
    Transaction = dm.IBTransaction2
    Left = 104
    Top = 72
  end
end

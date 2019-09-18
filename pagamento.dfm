object Form82: TForm82
  Left = 0
  Top = 0
  Caption = 'Forma de Pagamento'
  ClientHeight = 272
  ClientWidth = 510
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 376
    Top = 8
    Width = 105
    Height = 19
    Caption = 'Total Venda:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 376
    Top = 65
    Width = 95
    Height = 19
    Caption = 'Total Pago:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object p_pago: TLabel
    Left = 376
    Top = 81
    Width = 63
    Height = 35
    Caption = '0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object p_venda: TLabel
    Left = 376
    Top = 24
    Width = 63
    Height = 35
    Caption = '0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 376
    Top = 122
    Width = 80
    Height = 19
    Caption = 'Restante:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object p_restante: TLabel
    Left = 376
    Top = 138
    Width = 63
    Height = 35
    Caption = '0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel3: TPanel
    Left = 0
    Top = 192
    Width = 510
    Height = 80
    ParentCustomHint = False
    Align = alBottom
    BiDiMode = bdLeftToRight
    BorderWidth = 1
    BorderStyle = bsSingle
    Ctl3D = True
    DoubleBuffered = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBiDiMode = False
    ParentBackground = False
    ParentCtl3D = False
    ParentDoubleBuffered = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    object Label3: TLabel
      Left = 8
      Top = 4
      Width = 78
      Height = 16
      Caption = 'Pagamento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 92
      Top = -1
      Width = 6
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 10
      Top = 50
      Width = 48
      Height = 16
      Caption = 'C'#243'digo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 146
      Top = 50
      Width = 39
      Height = 16
      Caption = 'Valor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 328
      Top = 4
      Width = 176
      Height = 16
      Caption = 'F8-Pagamentos F2-Finalizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 64
      Top = 44
      Width = 57
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnKeyPress = Edit1KeyPress
    end
    object JsEditNumero1: JsEditNumero
      Left = 191
      Top = 44
      Width = 121
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Text = '0,00'
      OnKeyPress = JsEditNumero1KeyPress
      AddLista = False
      FormularioComp = 'Form82'
      Indice = 0
      TipoDeDado = teNumero
      CasasDecimais = 2
    end
    object JsBotao1: JsBotao
      Left = 356
      Top = 37
      Width = 97
      Height = 31
      Caption = 'Adicionar'
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
      TabOrder = 2
      OnClick = JsBotao1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 361
    Height = 192
    Align = alLeft
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 128
    object ClientDataSet1cod: TIntegerField
      DisplayLabel = 'COD'
      FieldName = 'cod'
    end
    object ClientDataSet1nome: TStringField
      DisplayLabel = 'NOME'
      FieldName = 'nome'
      Size = 30
    end
    object ClientDataSet1valor: TCurrencyField
      DisplayLabel = 'VALOR'
      FieldName = 'valor'
      DisplayFormat = '#,###,###0.00'
      currency = False
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 192
    Top = 128
  end
end

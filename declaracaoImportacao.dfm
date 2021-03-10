object Form85: TForm85
  Left = 0
  Top = 0
  Caption = 'Dados da Importa'#231#227'o - Sistema de Automa'#231#227'o ControlW'
  ClientHeight = 401
  ClientWidth = 799
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 74
    Height = 13
    Caption = 'N'#250'mero da D.I.'
  end
  object Label2: TLabel
    Left = 136
    Top = 8
    Width = 60
    Height = 13
    Caption = 'Data da D.I.'
  end
  object Label3: TLabel
    Left = 280
    Top = 8
    Width = 107
    Height = 13
    Caption = 'Local do Desembara'#231'o'
  end
  object Label4: TLabel
    Left = 640
    Top = 8
    Width = 100
    Height = 13
    Caption = 'Data d Desembara'#231'o'
  end
  object Label5: TLabel
    Left = 472
    Top = 8
    Width = 96
    Height = 13
    Caption = 'UF do Desembara'#231'o'
  end
  object Label6: TLabel
    Left = 8
    Top = 56
    Width = 85
    Height = 13
    Caption = 'Via de Transporte'
  end
  object Label7: TLabel
    Left = 176
    Top = 56
    Width = 75
    Height = 13
    Caption = 'Tipo Intermedio'
  end
  object numdi: TEdit
    Left = 8
    Top = 24
    Width = 105
    Height = 21
    TabOrder = 0
    OnKeyPress = numdiKeyPress
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 168
    Width = 799
    Height = 233
    Align = alBottom
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object datadi: TMaskEdit
    Left = 136
    Top = 24
    Width = 120
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 2
    Text = '  /  /    '
    OnKeyPress = datadiKeyPress
  end
  object localDesemb: TEdit
    Left = 280
    Top = 24
    Width = 169
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
    OnKeyPress = localDesembKeyPress
  end
  object UfDesemb: TComboBox
    Left = 472
    Top = 24
    Width = 145
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 4
    OnKeyPress = UfDesembKeyPress
  end
  object dataDesemb: TMaskEdit
    Left = 640
    Top = 24
    Width = 120
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 5
    Text = '  /  /    '
    OnKeyPress = dataDesembKeyPress
  end
  object sBitBtn1: TsBitBtn
    Left = 665
    Top = 120
    Width = 112
    Height = 42
    Caption = 'Finalizar'
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    TabOrder = 6
    OnClick = sBitBtn1Click
  end
  object viaTransporte: TComboBox
    Left = 8
    Top = 72
    Width = 145
    Height = 21
    ItemIndex = 0
    TabOrder = 7
    Text = '1=Mar'#237'tima'
    OnKeyPress = viaTransporteKeyPress
    Items.Strings = (
      '1=Mar'#237'tima'
      '2=Fluvial'
      '3=Lacustre'
      '4=A'#233'rea'
      '5=Postal'
      '6=Ferrovi'#225'ria'
      '7=Rodovi'#225'ria'
      '8=Conduto / Rede Transmiss'#227'o'
      '9=Meios Pr'#243'prios'
      '10=Entrada / Sa'#237'da ficta'
      '11=Courier'
      '12=Handcarry')
  end
  object tpintermedio: TComboBox
    Left = 176
    Top = 72
    Width = 193
    Height = 21
    ItemIndex = 0
    TabOrder = 8
    Text = '1=Importa'#231#227'o por conta pr'#243'pria'
    OnKeyPress = tpintermedioKeyPress
    Items.Strings = (
      '1=Importa'#231#227'o por conta pr'#243'pria'
      '2=Importa'#231#227'o por conta e ordem'
      '3=Importa'#231#227'o por encomenda')
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 112
    object ClientDataSet1cod: TIntegerField
      FieldName = 'cod'
    end
    object ClientDataSet1nome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object ClientDataSet1quant: TCurrencyField
      FieldName = 'quant'
    end
    object ClientDataSet1total: TCurrencyField
      FieldName = 'total'
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 368
    Top = 112
  end
end

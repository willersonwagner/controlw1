object Form14: TForm14
  Left = 0
  Top = 0
  Caption = 'Confer'#234'ncia de Caixa - ControlW Sistemas'
  ClientHeight = 234
  ClientWidth = 578
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 578
    Height = 234
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyPress = DBGrid1KeyPress
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 72
    object ClientDataSet1CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 10
    end
    object ClientDataSet1PAG: TStringField
      FieldName = 'PAG'
      Size = 30
    end
    object ClientDataSet1VALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object ClientDataSet1CONFERIDO: TCurrencyField
      FieldName = 'CONFERIDO'
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 224
    Top = 72
  end
end

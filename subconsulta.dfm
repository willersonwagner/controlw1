object Form25: TForm25
  Left = 212
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'ControlW'
  ClientHeight = 244
  ClientWidth = 539
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 539
    Height = 244
    Align = alClient
    BorderStyle = bsNone
    Ctl3D = False
    DataSource = DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyPress = DBGrid1KeyPress
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 208
    object ClientDataSet1CODBAR: TStringField
      FieldName = 'CODBAR'
      Size = 15
    end
    object ClientDataSet1DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object ClientDataSet1PRECO: TBCDField
      FieldName = 'PRECO'
      Precision = 18
      Size = 3
    end
    object ClientDataSet1ESTOQUE: TBCDField
      FieldName = 'ESTOQUE'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object ClientDataSet1COD: TIntegerField
      FieldName = 'COD'
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 304
    Top = 208
  end
end

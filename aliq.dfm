object aliq1: Taliq1
  Left = 300
  Top = 217
  Caption = 'Sit. Tributaria Nota Fiscal - ControlW'
  ClientHeight = 233
  ClientWidth = 265
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 265
    Height = 192
    Align = alClient
    BorderStyle = bsNone
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Courier New'
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnKeyPress = DBGrid1KeyPress
  end
  object Panel1: TPanel
    Left = 0
    Top = 192
    Width = 265
    Height = 41
    Align = alBottom
    Caption = 'F2-Adicionar F3-Aplicar Altera'#231#245'es'
    TabOrder = 1
    ExplicitLeft = 88
    ExplicitTop = 136
    ExplicitWidth = 185
  end
  object IBTable1: TIBTable
    BeforeInsert = IBTable1BeforeInsert
    BufferChunks = 1000
    CachedUpdates = False
    UniDirectional = True
    Left = 104
    Top = 80
  end
  object DataSource1: TDataSource
    DataSet = IBTable1
    Left = 56
    Top = 96
  end
end

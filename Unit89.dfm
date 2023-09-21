object Form89: TForm89
  Left = 0
  Top = 0
  Caption = 'Controle de Entregadores'
  ClientHeight = 455
  ClientWidth = 787
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 257
    Width = 787
    Height = 31
    Align = alClient
    Alignment = taCenter
    Caption = 'Vendas Conclu'#237'das F2-Relatorio Grande F3-Pagamento F5-Atualizar'
    ExplicitWidth = 323
    ExplicitHeight = 13
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 787
    Height = 257
    Align = alTop
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnKeyPress = DBGrid1KeyPress
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 288
    Width = 787
    Height = 167
    Align = alBottom
    DataSource = DataSource2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyDown = DBGrid2KeyDown
    OnKeyPress = DBGrid2KeyPress
  end
  object DataSource1: TDataSource
    Left = 152
    Top = 136
  end
  object DataSource2: TDataSource
    Left = 160
    Top = 328
  end
end

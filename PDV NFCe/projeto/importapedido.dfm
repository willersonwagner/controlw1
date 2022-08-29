object Form2: TForm2
  Left = 192
  Top = 107
  Caption = 'Importar Pedidos - PDV'
  ClientHeight = 441
  ClientWidth = 789
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 220
    Width = 789
    Height = 24
    Align = alBottom
    Alignment = taCenter
    Caption = 'ITENS DA VENDA - F6 Atualizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    ExplicitWidth = 271
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 789
    Height = 217
    Align = alTop
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnKeyPress = DBGrid1KeyPress
    OnKeyUp = DBGrid1KeyUp
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 244
    Width = 789
    Height = 197
    Align = alBottom
    DataSource = DataSource2
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid2CellClick
  end
  object Venda: TFDQuery
    Connection = dtmMain.bd
    Transaction = dtmMain.IBTransaction1
    SQL.Strings = (
      
        'select nota, data, cliente, (select nome from cliente c where  c' +
        '.cod = v.cliente) as nome, total from venda v where ok = '#39#39' orde' +
        'r by nota desc ')
    Left = 272
    Top = 96
  end
  object itens: TFDQuery
    Connection = dtmMain.bd
    Transaction = dtmMain.IBTransaction1
    Left = 272
    Top = 136
  end
  object DataSource1: TDataSource
    DataSet = Venda
    Left = 320
    Top = 96
  end
  object DataSource2: TDataSource
    DataSet = itens
    Left = 320
    Top = 136
  end
end

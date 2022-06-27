object Form90: TForm90
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'ControlW - Sistemas'
  ClientHeight = 114
  ClientWidth = 230
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 183
    Height = 19
    Caption = 'Qual o Valor da Entrega ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ComboBox1: TComboBox
    Left = 24
    Top = 64
    Width = 145
    Height = 27
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ItemIndex = 0
    ParentFont = False
    TabOrder = 0
    Text = '7,00'
    OnKeyPress = ComboBox1KeyPress
    Items.Strings = (
      '7,00'
      '10,00'
      '')
  end
end

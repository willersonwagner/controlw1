object Form42: TForm42
  Left = 255
  Top = 142
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Form42'
  ClientHeight = 63
  ClientWidth = 164
  Color = clSkyBlue
  TransparentColorValue = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClick = FormClick
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 55
    Height = 13
    Caption = 'Label1'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBackground
    Font.Height = -13
    Font.Name = 'Courier'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Timer1: TTimer
    Interval = 50
    OnTimer = Timer1Timer
    Left = 272
    Top = 184
  end
end

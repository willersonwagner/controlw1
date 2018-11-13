object Form57: TForm57
  Left = 192
  Top = 124
  BorderStyle = bsNone
  Caption = 'Form57'
  ClientHeight = 196
  ClientWidth = 456
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object LabelTroco: TPanel
    Left = 0
    Top = 0
    Width = 456
    Height = 68
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 3
    BorderStyle = bsSingle
    Caption = 'Troco:'
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -48
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
  end
  object Labeldin: TPanel
    Left = 0
    Top = 68
    Width = 456
    Height = 128
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    BorderStyle = bsSingle
    Caption = '0,00'
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = 2500301
    Font.Height = -64
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
  end
end

object TT: TTT
  Left = 0
  Top = 0
  Caption = 'Lan'#231'amento de Movimentos'
  ClientHeight = 151
  ClientWidth = 316
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 240
    Top = 8
    Width = 50
    Height = 39
    Caption = '0.0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BMDThread1: TBMDThread
    RefreshInterval = 500
    Priority = tpHigher
    UpdateEnabled = False
    OnExecute = BMDThread1Execute
    OnStart = BMDThread1Start
    Left = 24
    Top = 16
  end
end

object Form65: TForm65
  Left = 0
  Top = 0
  ParentCustomHint = False
  BiDiMode = bdLeftToRight
  BorderIcons = []
  BorderStyle = bsNone
  BorderWidth = 3
  Caption = 'Form65'
  ClientHeight = 113
  ClientWidth = 336
  Color = clWhite
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 336
    Height = 113
    ParentCustomHint = False
    Align = alClient
    BevelOuter = bvNone
    BiDiMode = bdLeftToRight
    BorderWidth = 1
    BorderStyle = bsSingle
    Color = clWhite
    Ctl3D = False
    DoubleBuffered = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBiDiMode = False
    ParentBackground = False
    ParentCtl3D = False
    ParentDoubleBuffered = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 277
      Height = 25
      Caption = 'Aguarde, Enviando NFCe...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RxGIFAnimator1: TACBrGIF
      Left = 1
      Top = 64
      Width = 332
      Height = 46
      Align = alBottom
      AutoSize = False
      Transparent = True
    end
  end
end

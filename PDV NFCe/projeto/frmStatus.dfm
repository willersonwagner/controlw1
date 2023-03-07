object mfd: Tmfd
  Left = 361
  Top = 170
  BorderIcons = []
  BorderStyle = bsDialog
  BorderWidth = 3
  Caption = 'Relat'#243'rio de Vendas'
  ClientHeight = 370
  ClientWidth = 682
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 296
    Top = 339
    Width = 370
    Height = 23
    Caption = 'CTRL + P - Imprimir CTRL + S - Salvar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 336
    Width = 89
    Height = 33
    Caption = 'Imprimir'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 120
    Top = 337
    Width = 89
    Height = 33
    Caption = 'Salvar'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object CheckBox1: TCheckBox
    Left = 224
    Top = 353
    Width = 66
    Height = 17
    Caption = 'Negrito'
    TabOrder = 2
  end
  object RichEdit1: TRichEdit
    Left = 0
    Top = 0
    Width = 682
    Height = 330
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Zoom = 100
  end
end

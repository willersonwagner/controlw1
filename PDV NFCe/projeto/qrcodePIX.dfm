object Form84: TForm84
  Left = 0
  Top = 0
  Caption = 'Informa'#231#245'es de Pagamento - Sistema ControlW'
  ClientHeight = 422
  ClientWidth = 676
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object image1: TImage
    Left = 24
    Top = 53
    Width = 353
    Height = 336
    Proportional = True
    Stretch = True
  end
  object Label1: TLabel
    Left = 56
    Top = 8
    Width = 286
    Height = 35
    Caption = 'Pagamento Por PIX'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 383
    Top = 53
    Width = 184
    Height = 28
    Caption = 'Estado..: Ativo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Arial Rounded MT Bold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 383
    Top = 366
    Width = 200
    Height = 23
    Caption = 'Gerando Qrcode...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Arial Rounded MT Bold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 383
    Top = 87
    Width = 193
    Height = 28
    Caption = 'Valor R$: 40,00'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Arial Rounded MT Bold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 392
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    Visible = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 424
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 1
    Visible = False
    OnClick = Button2Click
  end
  object PrintDialog1: TPrintDialog
    Left = 632
    Top = 248
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 496
    Top = 8
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 800
    OnTimer = Timer2Timer
    Left = 544
    Top = 8
  end
  object Timer3: TTimer
    Enabled = False
    Interval = 300
    OnTimer = Timer3Timer
    Left = 552
    Top = 112
  end
end

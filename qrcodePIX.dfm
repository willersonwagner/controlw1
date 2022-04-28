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
    Width = 281
    Height = 162
    Caption = 
      #201' poss'#237'vel efetuar os pagamentos'#13#10'de mensalidades por   leitura ' +
      '    de'#13#10'QRCODE, para isso entre no   seu'#13#10'aplicativo do banco e ' +
      '      fa'#231'a     o '#13#10'pagamento das pend'#234'ncias confor-'#13#10'me foi comb' +
      'inado. Obrigado!'#13#10#13#10'Qualquer d'#250'vida,      entrar      em '#13#10'conta' +
      'to com o suporte.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial Rounded MT Bold'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 383
    Top = 267
    Width = 96
    Height = 72
    Caption = 'Benefici'#225'rio'#13#10#13#10'Nome:'#13#10'CNPJ :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial Rounded MT Bold'
    Font.Style = []
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
  object PrintDialog1: TPrintDialog
    Left = 536
    Top = 352
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
end

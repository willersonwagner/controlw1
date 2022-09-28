object Form58: TForm58
  Left = 196
  Top = 125
  BorderStyle = bsNone
  Caption = 'Form58'
  ClientHeight = 431
  ClientWidth = 510
  Color = 788168
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 64
    Top = 24
    Width = 417
    Height = 52
    Caption = 'Bloqueio de Sistema'
    Font.Charset = ANSI_CHARSET
    Font.Color = 256250
    Font.Height = -37
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 128
    Top = 80
    Width = 248
    Height = 38
    Caption = '0 dias Restantes'
    Font.Charset = ANSI_CHARSET
    Font.Color = 256250
    Font.Height = -27
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 136
    Width = 464
    Height = 120
    Caption = 
      'At'#233' o Momento n'#227'o registramos o Pagamento'#13#10'da Mensalidade.'#13#10'Caso' +
      ' j'#225' tenha efetuado o Pagamento, favor'#13#10'informar ao suporte pelos' +
      ' telefones que '#13#10'aparecem na tela de entrada do sistema.'
    Font.Charset = ANSI_CHARSET
    Font.Color = 256250
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object segundosres: TLabel
    Left = 80
    Top = 272
    Width = 394
    Height = 38
    Caption = '01/10 Segundos Restantes'
    Font.Charset = ANSI_CHARSET
    Font.Color = 256250
    Font.Height = -27
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 163
    Top = 324
    Width = 213
    Height = 22
    Caption = 'F2 - Pagamento por PIX'
    Color = clNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clLime
    Font.Height = -19
    Font.Name = 'Arial Rounded MT Bold'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object SIM: TBitBtn
    Left = 128
    Top = 368
    Width = 105
    Height = 41
    Caption = 'SIM'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = SIMClick
  end
  object NAO: TBitBtn
    Left = 296
    Top = 368
    Width = 105
    Height = 41
    Caption = 'N'#195'O'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 440
    Top = 360
    Width = 105
    Height = 41
    Caption = 'Inserir C'#243'digo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Visible = False
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 16
    Top = 40
  end
  object segn: TTimer
    Enabled = False
    OnTimer = segnTimer
    Left = 16
    Top = 80
  end
  object timerThread: TTimer
    Enabled = False
    OnTimer = timerThreadTimer
    Left = 16
    Top = 8
  end
end

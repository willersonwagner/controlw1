object calculadora1: Tcalculadora1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Calculadora ControlW'
  ClientHeight = 244
  ClientWidth = 285
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
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object um: TSpeedButton
    Left = 8
    Top = 152
    Width = 49
    Height = 41
    Caption = '1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = umClick
  end
  object dois: TSpeedButton
    Left = 63
    Top = 152
    Width = 49
    Height = 41
    Caption = '2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = doisClick
  end
  object tres: TSpeedButton
    Left = 118
    Top = 152
    Width = 49
    Height = 41
    Caption = '3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = tresClick
  end
  object quatro: TSpeedButton
    Left = 8
    Top = 105
    Width = 49
    Height = 41
    Caption = '4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = quatroClick
  end
  object cinco: TSpeedButton
    Left = 63
    Top = 105
    Width = 49
    Height = 41
    Caption = '5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = cincoClick
  end
  object seis: TSpeedButton
    Left = 118
    Top = 105
    Width = 49
    Height = 41
    Caption = '6'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = seisClick
  end
  object sete: TSpeedButton
    Left = 8
    Top = 58
    Width = 49
    Height = 41
    Caption = '7'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = seteClick
  end
  object oito: TSpeedButton
    Left = 63
    Top = 58
    Width = 49
    Height = 41
    Caption = '8'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = oitoClick
  end
  object nove: TSpeedButton
    Left = 118
    Top = 58
    Width = 49
    Height = 41
    Caption = '9'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = noveClick
  end
  object menos: TSpeedButton
    Left = 173
    Top = 152
    Width = 49
    Height = 41
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = menosClick
  end
  object multiplicar: TSpeedButton
    Left = 173
    Top = 105
    Width = 49
    Height = 41
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = multiplicarClick
  end
  object dividir: TSpeedButton
    Left = 173
    Top = 58
    Width = 49
    Height = 41
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = dividirClick
  end
  object zero: TSpeedButton
    Left = 8
    Top = 199
    Width = 49
    Height = 41
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = zeroClick
  end
  object SpeedButton14: TSpeedButton
    Left = 63
    Top = 199
    Width = 49
    Height = 41
    Caption = '%'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton14Click
  end
  object virgula: TSpeedButton
    Left = 118
    Top = 199
    Width = 49
    Height = 41
    Caption = ','
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = virgulaClick
  end
  object mais: TSpeedButton
    Left = 173
    Top = 199
    Width = 49
    Height = 41
    Caption = '+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = maisClick
  end
  object igual: TSpeedButton
    Left = 228
    Top = 152
    Width = 49
    Height = 88
    Caption = '='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = igualClick
  end
  object porcentagem: TSpeedButton
    Left = 228
    Top = 105
    Width = 49
    Height = 41
    Caption = '<'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = porcentagemClick
  end
  object limpar: TSpeedButton
    Left = 228
    Top = 58
    Width = 49
    Height = 41
    Caption = 'C'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = limparClick
  end
  object visor: TEdit
    Left = 8
    Top = 8
    Width = 269
    Height = 29
    Alignment = taRightJustify
    Ctl3D = False
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    OnChange = visorChange
    OnEnter = visorEnter
  end
end

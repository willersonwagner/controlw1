object Form38: TForm38
  Left = 902
  Top = 328
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Parcelamento F2-Forma de Pagamento Entrada'
  ClientHeight = 188
  ClientWidth = 286
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 120
    Height = 20
    Caption = 'Entrada          :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 48
    Width = 119
    Height = 20
    Caption = '1'#176' Vencto       :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 72
    Width = 117
    Height = 20
    Caption = 'Per'#237'odo          :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 96
    Width = 117
    Height = 20
    Caption = 'Qtd. Prest.     :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 16
    Top = 120
    Width = 117
    Height = 20
    Caption = 'Taxa ao M'#234's  :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 16
    Top = 144
    Width = 115
    Height = 20
    Caption = 'Vlr. Prest.      :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 188
    Top = 76
    Width = 33
    Height = 16
    Caption = 'Dias'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 204
    Top = 124
    Width = 14
    Height = 16
    Caption = '%'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object entrada: JsEditNumero
    Left = 144
    Top = 24
    Width = 65
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
    Text = '0,00'
    OnKeyPress = entradaKeyPress
    FormularioComp = 'Form38'
    Indice = 0
    TipoDeDado = teNumero
    CasasDecimais = 2
  end
  object vencto: TMaskEdit
    Left = 144
    Top = 48
    Width = 65
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 1
    Text = '  /  /    '
    OnKeyDown = venctoKeyDown
    OnKeyPress = venctoKeyPress
  end
  object dias: JsEditInteiro
    Left = 144
    Top = 72
    Width = 41
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
    OnKeyPress = diasKeyPress
    FormularioComp = 'Form38'
    Indice = 0
    TipoDeDado = teNumero
  end
  object qtd: JsEditInteiro
    Left = 144
    Top = 96
    Width = 41
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
    OnKeyPress = qtdKeyPress
    FormularioComp = 'Form38'
    Indice = 0
    TipoDeDado = teNumero
  end
  object taxa: JsEditNumero
    Left = 144
    Top = 120
    Width = 57
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 4
    Text = '0,00'
    OnKeyPress = taxaKeyPress
    FormularioComp = 'Form38'
    Indice = 0
    TipoDeDado = teNumero
    CasasDecimais = 2
  end
  object valorp: JsEditNumero
    Left = 144
    Top = 144
    Width = 65
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 5
    Text = '0,00'
    OnEnter = valorpEnter
    OnKeyPress = valorpKeyPress
    FormularioComp = 'Form38'
    Indice = 0
    TipoDeDado = teNumero
    CasasDecimais = 2
  end
end

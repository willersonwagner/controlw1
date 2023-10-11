object Form92: TForm92
  Left = 0
  Top = 0
  Caption = 'Grupo de Exporta'#231#227'o do Produto'
  ClientHeight = 246
  ClientWidth = 351
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 75
    Height = 13
    Caption = 'Num Drawback:'
  end
  object Label2: TLabel
    Left = 8
    Top = 55
    Width = 105
    Height = 13
    Caption = 'Num Reg Exporta'#231#227'o:'
  end
  object Label3: TLabel
    Left = 8
    Top = 102
    Width = 104
    Height = 13
    Caption = 'Chave NFe Recebida:'
  end
  object Label4: TLabel
    Left = 8
    Top = 149
    Width = 112
    Height = 13
    Caption = 'Quant Item Exportado:'
  end
  object nDrawback: TEdit
    Left = 8
    Top = 24
    Width = 153
    Height = 25
    TabOrder = 0
    OnKeyPress = nDrawbackKeyPress
  end
  object regExpo: TEdit
    Left = 8
    Top = 71
    Width = 153
    Height = 25
    TabOrder = 1
    OnKeyPress = regExpoKeyPress
  end
  object chNfe: TEdit
    Left = 8
    Top = 118
    Width = 329
    Height = 25
    TabOrder = 2
    OnKeyPress = chNfeKeyPress
  end
  object qExport: JsEditNumero
    Left = 8
    Top = 168
    Width = 169
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
    Text = '0,00'
    OnKeyPress = qExportKeyPress
    AddLista = False
    FormularioComp = 'Form92'
    Indice = 0
    TipoDeDado = teNumero
    CasasDecimais = 2
  end
  object Button1: TButton
    Left = 8
    Top = 208
    Width = 113
    Height = 30
    Caption = 'Finalizar'
    TabOrder = 4
    OnClick = Button1Click
    OnKeyPress = Button1KeyPress
  end
end

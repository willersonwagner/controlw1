object Form94: TForm94
  Left = 0
  Top = 0
  Caption = 'Cadastro de Aliquotas'
  ClientHeight = 99
  ClientWidth = 484
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 23
    Height = 13
    Caption = 'Cod:'
  end
  object Label2: TLabel
    Left = 87
    Top = 8
    Width = 43
    Height = 13
    Caption = 'Aliquota:'
  end
  object Label3: TLabel
    Left = 167
    Top = 8
    Width = 46
    Height = 13
    Caption = 'Redu'#231#227'o:'
  end
  object Label4: TLabel
    Left = 247
    Top = 8
    Width = 23
    Height = 13
    Caption = 'CST:'
  end
  object Label5: TLabel
    Left = 327
    Top = 8
    Width = 23
    Height = 13
    Caption = 'Obs:'
  end
  object cod: TEdit
    Left = 8
    Top = 27
    Width = 73
    Height = 21
    TabOrder = 0
    OnKeyPress = codKeyPress
  end
  object aliq: TEdit
    Left = 87
    Top = 27
    Width = 74
    Height = 21
    TabOrder = 1
    OnKeyPress = aliqKeyPress
  end
  object reducao: TEdit
    Left = 167
    Top = 27
    Width = 74
    Height = 21
    TabOrder = 2
    OnKeyPress = reducaoKeyPress
  end
  object cst: TEdit
    Left = 247
    Top = 27
    Width = 74
    Height = 21
    MaxLength = 2
    TabOrder = 3
    OnKeyPress = cstKeyPress
  end
  object csosn: TEdit
    Left = 327
    Top = 27
    Width = 146
    Height = 21
    MaxLength = 12
    TabOrder = 4
    OnKeyPress = csosnKeyPress
  end
  object btgravar: TButton
    Left = 8
    Top = 66
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 5
    OnClick = btgravarClick
  end
end

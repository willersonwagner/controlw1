object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Servidor BD'
  ClientHeight = 295
  ClientWidth = 470
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 104
    Top = 16
    Width = 249
    Height = 25
    Caption = 'Servidor: Aguardando...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 56
    Top = 58
    Width = 61
    Height = 13
    Caption = 'Caminho BD:'
  end
  object BitBtn1: TBitBtn
    Left = 32
    Top = 87
    Width = 145
    Height = 35
    Caption = 'Conectar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 240
    Top = 87
    Width = 145
    Height = 35
    Caption = 'Desconectar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object Edit1: TEdit
    Left = 123
    Top = 55
    Width = 262
    Height = 21
    TabOrder = 2
  end
  object Memo1: TMemo
    Left = 0
    Top = 152
    Width = 470
    Height = 143
    Align = alBottom
    TabOrder = 3
  end
  object TrayIcon1: TTrayIcon
    OnDblClick = TrayIcon1DblClick
    Left = 192
    Top = 88
  end
  object ApplicationEvents1: TApplicationEvents
    OnMinimize = ApplicationEvents1Minimize
    Left = 336
    Top = 24
  end
  object IBDatabase1: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=SYSTEMA1'
      'Database=F:\ControlW\bd.FDB'
      'DriverID=FB')
    LoginPrompt = False
    Left = 80
    Top = 200
  end
  object IBQuery1: TFDQuery
    Connection = IBDatabase1
    Transaction = IBTransaction1
    Left = 152
    Top = 200
  end
  object IBQuery2: TFDQuery
    Connection = IBDatabase1
    Transaction = IBTransaction1
    Left = 208
    Top = 200
  end
  object IBQuery3: TFDQuery
    Connection = IBDatabase1
    Transaction = IBTransaction1
    Left = 264
    Top = 200
  end
  object IBTransaction1: TFDTransaction
    Connection = IBDatabase1
    Left = 152
    Top = 248
  end
end

object consultaCNPJ: TconsultaCNPJ
  Left = 0
  Top = 0
  Caption = 'Consulta CNPJ/CPF'
  ClientHeight = 544
  ClientWidth = 431
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 64
    Width = 417
    Height = 26
    Caption = 'Busca Receita'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 96
    Width = 417
    Height = 440
    TabOrder = 1
  end
  object edtCNPJ: TEdit
    Left = 8
    Top = 8
    Width = 417
    Height = 50
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TextHint = 'Digite o CNPJ'
  end
  object RESTClient1: TRESTClient
    Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Params = <>
    HandleRedirects = True
    Left = 88
    Top = 456
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 200
    Top = 456
  end
  object RESTResponse1: TRESTResponse
    Left = 136
    Top = 456
  end
end

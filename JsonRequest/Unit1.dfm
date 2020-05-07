object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 354
  ClientWidth = 555
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 136
    Width = 555
    Height = 218
    Align = alBottom
    TabOrder = 0
  end
  object RESTClient1: TRESTClient
    Authenticator = OAuth2Authenticator1
    Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Params = <>
    HandleRedirects = True
    Left = 24
    Top = 16
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 104
    Top = 16
  end
  object RESTResponse1: TRESTResponse
    Left = 192
    Top = 16
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    FieldDefs = <>
    Left = 344
    Top = 16
  end
  object OAuth2Authenticator1: TOAuth2Authenticator
    AccessToken = 'TSs-UhYfgWUAAAAAAAAE7pH3UXh9-sCgEwmqm1IapoQ1JlXT7QDr5qgV5ssc6mQy'
    ClientID = 'fv25ulzw1rbkgi2'
    ClientSecret = '48e7tp21ztiu4e6'
    Left = 232
    Top = 72
  end
end

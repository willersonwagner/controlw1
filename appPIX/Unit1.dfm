object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 461
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 84
    Top = 404
    Width = 230
    Height = 49
    Caption = 'Conectando...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -37
    Font.Name = 'Tempus Sans ITC'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 59
    Height = 13
    Caption = 'Banco PIX:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 560
    Top = 22
    Width = 81
    Height = 25
    Caption = 'Conectar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 16
    Top = 53
    Width = 313
    Height = 121
    TabOrder = 1
  end
  object Button2: TButton
    Left = 560
    Top = 53
    Width = 81
    Height = 25
    Caption = 'Salvar'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 560
    Top = 84
    Width = 81
    Height = 25
    Caption = 'Carregar'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 421
    Top = 51
    Width = 121
    Height = 25
    Caption = '1)Autorizar'
    TabOrder = 4
    OnClick = Button4Click
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 180
    Width = 313
    Height = 165
    DataSource = DataSource1
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button5: TButton
    Left = 421
    Top = 82
    Width = 121
    Height = 25
    Caption = '2) Buscar AcessToken'
    TabOrder = 6
    OnClick = Button5Click
  end
  object ListBox1: TListBox
    Left = 421
    Top = 136
    Width = 220
    Height = 233
    ItemHeight = 13
    TabOrder = 7
  end
  object Button6: TButton
    Left = 16
    Top = 351
    Width = 81
    Height = 25
    Caption = 'Download'
    TabOrder = 8
    OnClick = Button6Click
  end
  object Banco: TComboBox
    Left = 16
    Top = 26
    Width = 145
    Height = 21
    ItemIndex = 0
    TabOrder = 9
    Text = 'Santander'
    Items.Strings = (
      'Santander'
      'Banco do Brasil'#11
      'Itau'#11
      'Bradesco')
  end
  object BindSourceRESTResponse: TBindSourceDB
    ScopeMappings = <>
    Left = 475
    Top = 161
  end
  object OAuth2Authenticator: TOAuth2Authenticator
    ResponseType = rtTOKEN
    TokenType = ttBEARER
    Left = 683
    Top = 185
  end
  object RESTResponseDataSetAdapter: TRESTResponseDataSetAdapter
    Dataset = FDMemTable1
    FieldDefs = <>
    Response = RESTResponse
    Left = 483
    Top = 161
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 484
    Top = 209
  end
  object RESTResponse: TRESTResponse
    Left = 347
    Top = 161
  end
  object RESTClient: TRESTClient
    Accept = 'application/json;q=0.9,text/plain;q=0.9,text/html'
    AcceptCharset = 'UTF-8'
    ContentType = 'x-www-form-urlencoded'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 347
    Top = 265
  end
  object RESTRequest: TRESTRequest
    Accept = 'application/json;q=0.9,text/plain;q=0.9,text/html'
    AcceptCharset = 'UTF-8'
    Client = RESTClient
    Method = rmPUT
    Params = <>
    Response = RESTResponse
    Timeout = 0
    SynchronizedEvents = False
    Left = 347
    Top = 209
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 688
    Top = 240
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 688
    Top = 297
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 352
    Top = 328
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 704
    Top = 128
  end
end

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
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 42
    Height = 13
    Caption = 'Client-ID'
  end
  object Label2: TLabel
    Left = 151
    Top = 8
    Width = 62
    Height = 13
    Caption = 'Client-Secret'
  end
  object Label3: TLabel
    Left = 286
    Top = 8
    Width = 66
    Height = 13
    Caption = 'Access-Token'
  end
  object Label4: TLabel
    Left = 421
    Top = 8
    Width = 56
    Height = 13
    Caption = 'Auth-Token'
  end
  object Edit1: TEdit
    Left = 16
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 421
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 286
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 151
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object Button1: TButton
    Left = 560
    Top = 22
    Width = 81
    Height = 25
    Caption = 'Conectar'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 16
    Top = 53
    Width = 313
    Height = 121
    TabOrder = 5
  end
  object Button2: TButton
    Left = 560
    Top = 53
    Width = 81
    Height = 25
    Caption = 'Salvar'
    TabOrder = 6
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 560
    Top = 84
    Width = 81
    Height = 25
    Caption = 'Carregar'
    TabOrder = 7
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 421
    Top = 51
    Width = 121
    Height = 25
    Caption = '1)Autorizar'
    TabOrder = 8
    OnClick = Button4Click
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 180
    Width = 313
    Height = 165
    DataSource = DataSource1
    TabOrder = 9
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
    TabOrder = 10
    OnClick = Button5Click
  end
  object ListBox1: TListBox
    Left = 421
    Top = 136
    Width = 220
    Height = 233
    ItemHeight = 13
    TabOrder = 11
  end
  object BindSourceRESTResponse: TBindSourceDB
    ScopeMappings = <>
    Left = 475
    Top = 161
  end
  object OAuth2Authenticator: TOAuth2Authenticator
    Left = 659
    Top = 153
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
    Authenticator = OAuth2Authenticator
    Accept = 'application/json;q=0.9,text/plain;q=0.9,text/html'
    AcceptCharset = 'UTF-8'
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
    Params = <>
    Response = RESTResponse
    Timeout = 0
    SynchronizedEvents = False
    Left = 347
    Top = 209
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 672
    Top = 232
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 648
    Top = 289
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 328
    Top = 232
  end
end

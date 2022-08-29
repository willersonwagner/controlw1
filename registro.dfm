object Form35: TForm35
  Left = 195
  Top = 110
  Caption = 'Formul'#225'rio de Registro'
  ClientHeight = 445
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = -1
    Top = -1
    Width = 393
    Height = 65
    Caption = 'Registro'
    TabOrder = 0
    object Label4: TLabel
      Left = 8
      Top = 24
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object check: TLabel
      Left = 160
      Top = 14
      Width = 131
      Height = 18
      Caption = 'Num de Ativa'#231#227'o: '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Image1: TImage
      Left = 344
      Top = 39
      Width = 16
      Height = 16
      AutoSize = True
    end
    object empresa: JsEdit
      Left = 8
      Top = 38
      Width = 209
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 40
      TabOrder = 0
      OnKeyPress = empresaKeyPress
      FormularioComp = 'Form35'
      ColorOnEnter = clSkyBlue
      ValidaCampo = True
      Indice = 0
      TipoDeDado = teNumero
    end
    object JsEdit4: JsEdit
      Left = 224
      Top = 36
      Width = 113
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 40
      TabOrder = 1
      OnKeyPress = JsEdit4KeyPress
      FormularioComp = 'Form35'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
    end
  end
  object GroupBox1: TGroupBox
    Left = -1
    Top = 64
    Width = 393
    Height = 377
    Caption = 'Dados da Empresa'
    TabOrder = 1
    object Label2: TLabel
      Left = 80
      Top = 18
      Width = 66
      Height = 13
      Caption = 'Raz'#227'o Social:'
    end
    object checagem: TLabel
      Left = 320
      Top = 304
      Width = 3
      Height = 13
    end
    object Label5: TLabel
      Left = 17
      Top = 109
      Width = 30
      Height = 13
      Caption = 'CNPJ:'
    end
    object Label7: TLabel
      Left = 169
      Top = 109
      Width = 70
      Height = 13
      Caption = 'Insc. Estadual:'
    end
    object Label8: TLabel
      Left = 17
      Top = 194
      Width = 27
      Height = 13
      Caption = 'Fone:'
    end
    object Label9: TLabel
      Left = 169
      Top = 194
      Width = 20
      Height = 13
      Caption = 'Fax:'
    end
    object Label10: TLabel
      Left = 17
      Top = 232
      Width = 25
      Height = 13
      Caption = 'End.:'
    end
    object Label12: TLabel
      Left = 201
      Top = 232
      Width = 30
      Height = 13
      Caption = 'Bairro:'
    end
    object Label13: TLabel
      Left = 16
      Top = 272
      Width = 22
      Height = 13
      Caption = 'Cep:'
    end
    object Label14: TLabel
      Left = 160
      Top = 272
      Width = 36
      Height = 13
      Caption = 'Estado:'
    end
    object Label11: TLabel
      Left = 272
      Top = 312
      Width = 49
      Height = 13
      Caption = 'Cod. Mun:'
    end
    object Label1: TLabel
      Left = 16
      Top = 66
      Width = 32
      Height = 13
      Caption = 'Titular:'
    end
    object Label3: TLabel
      Left = 16
      Top = 314
      Width = 22
      Height = 13
      Caption = 'Obs:'
    end
    object Label6: TLabel
      Left = 216
      Top = 272
      Width = 36
      Height = 13
      Caption = 'Cidade:'
    end
    object Label15: TLabel
      Left = 16
      Top = 18
      Width = 36
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object Label16: TLabel
      Left = 208
      Top = 64
      Width = 55
      Height = 13
      Caption = 'SUFRAMA:'
    end
    object Label17: TLabel
      Left = 16
      Top = 152
      Width = 26
      Height = 13
      Caption = ' CPF:'
    end
    object tex: TBitBtn
      Left = 328
      Top = 320
      Width = 57
      Height = 49
      Caption = 'Registrar'
      TabOrder = 0
      OnClick = texClick
      OnKeyPress = texKeyPress
    end
    object cod: JsEditInteiro
      Left = 16
      Top = 32
      Width = 57
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnKeyPress = codKeyPress
      FormularioComp = 'Form35'
      Indice = 0
      TipoDeDado = teNumero
    end
    object nome: JsEdit
      Left = 80
      Top = 32
      Width = 241
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 2
      OnKeyPress = nomeKeyPress
      FormularioComp = 'Form16'
      ColorOnEnter = clSkyBlue
      Indice = 2
      TipoDeDado = teNumero
    end
    object titular: JsEdit
      Left = 16
      Top = 80
      Width = 185
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 40
      TabOrder = 3
      OnKeyPress = titularKeyPress
      FormularioComp = 'Form16'
      ColorOnEnter = clSkyBlue
      Indice = 2
      TipoDeDado = teNumero
    end
    object suframa: JsEdit
      Left = 208
      Top = 80
      Width = 113
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 40
      TabOrder = 4
      OnKeyPress = titularKeyPress
      FormularioComp = 'Form16'
      ColorOnEnter = clSkyBlue
      Indice = 2
      TipoDeDado = teNumero
    end
    object cnpj: JsEditCNPJ
      Left = 16
      Top = 125
      Width = 121
      Height = 21
      EditMask = '!99.999.999/9999-99;1;_'
      MaxLength = 18
      TabOrder = 5
      Text = '  .   .   /    -  '
      OnKeyDown = cnpjKeyDown
      OnKeyPress = cnpjKeyPress
      OnKeyUp = cnpjKeyUp
    end
    object ies: JsEdit
      Left = 169
      Top = 125
      Width = 153
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 12
      TabOrder = 6
      OnKeyPress = iesKeyPress
      FormularioComp = 'Form16'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
    end
    object cpf: JsEditCPF
      Left = 18
      Top = 167
      Width = 121
      Height = 21
      EditMask = '!999.999.999-99;1;_'
      MaxLength = 14
      TabOrder = 7
      Text = '   .   .   -  '
    end
    object telres: JsEdit
      Left = 18
      Top = 210
      Width = 129
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 13
      TabOrder = 8
      OnKeyPress = telresKeyPress
      FormularioComp = 'Form16'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
    end
    object telcom: JsEdit
      Left = 170
      Top = 210
      Width = 153
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 13
      TabOrder = 9
      OnKeyPress = telcomKeyPress
      FormularioComp = 'Form16'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
    end
    object ende: JsEdit
      Left = 17
      Top = 248
      Width = 169
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 34
      TabOrder = 10
      OnKeyPress = endeKeyPress
      FormularioComp = 'Form16'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
    end
    object bairro: JsEdit
      Left = 201
      Top = 248
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 18
      TabOrder = 11
      OnKeyPress = bairroKeyPress
      FormularioComp = 'Form16'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
    end
    object cep: JsEdit
      Left = 16
      Top = 288
      Width = 129
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 12
      OnKeyPress = cepKeyPress
      FormularioComp = 'Form16'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
    end
    object est: JsEdit
      Left = 160
      Top = 288
      Width = 33
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 2
      TabOrder = 13
      OnKeyPress = estKeyPress
      FormularioComp = 'Form16'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
    end
    object cid: JsEdit
      Left = 208
      Top = 288
      Width = 113
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 18
      TabOrder = 14
      OnKeyPress = cidKeyPress
      FormularioComp = 'Form16'
      ColorOnEnter = clSkyBlue
      Indice = 0
      TipoDeDado = teNumero
    end
    object obs: JsEdit
      Left = 16
      Top = 328
      Width = 249
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 40
      TabOrder = 15
      OnKeyPress = obsKeyPress
      FormularioComp = 'Form16'
      ColorOnEnter = clSkyBlue
      Indice = 2
      TipoDeDado = teNumero
    end
    object JsEdit1: JsEdit
      Left = 272
      Top = 328
      Width = 49
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 40
      TabOrder = 16
      OnKeyPress = JsEdit1KeyPress
      FormularioComp = 'Form16'
      ColorOnEnter = clSkyBlue
      Indice = 2
      TipoDeDado = teNumero
    end
  end
  object ImageList1: TImageList
    Left = 352
    Top = 255
    Bitmap = {
      494C010102003000400010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000CCCCCC00C8C8C800C4C4C400BABA
      BA00B4B4B400A7A7A700A2A2A2009E9E9E00A2A2A200B0B0B000B6B6B600C2C2
      C200C7C7C700CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCCCCC00CBCBCB00C9C9C900C6C6
      C600C4C4C400BFC1C0006B988000C7C7C700C3C3C300C5C5C500C6C6C600CACA
      CA00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC008686
      860010102200CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC001010
      220086868600CCCCCC00CCCCCC00CCCCCC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00669D800029835500C4C9C600CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC000000
      41000202E5005C5C5C00CCCCCC00CCCCCC00CCCCCC00CCCCCC005C5C5C000202
      E50000004100CCCCCC00CCCCCC00CCCCCC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00739F88002B955F002B945F00298C590059947500CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC0066666600000061000F0F
      FF000E0EFE000A0AFF0000007400CCCCCC00CCCCCC00000074000A0AFF000E0E
      FE000F0FFF000000620066666600CCCCCC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCCCCC00CCCCCC00CCCCCC0079A2
      8C00288856002B9B61002B9A61002B9C6200298F5900CBCBCB00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC003D3D3E000000CA001616
      FA001313FA001515FC000E0EFF004E4E4E004E4E4E000E0EFF001515FC001313
      FA001616FA000000CA003D3D3E00CCCCCC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCCCCC00CCCCCC0088A8970027A5
      65002AA667002AA567002AA567002AA567002AA5670028925B00699B8000CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00868686000000
      DE001616FF002020F3002020F3001919FF001919FF002020F3002020F3001616
      FF000000DF0086868600CCCCCC00CCCCCC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCCCCC008CAA9A003791620030AF
      6F0024A9660029AB690029AB690029AB690029AB690029AC6B0027935C00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC000000
      28000000D2002C2CF1002727F0002929F1002929F1002727F0002C2CF1000000
      D20000002800CCCCCC00CCCCCC00CCCCCC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008FAC9D0068CA98007BD5A80071CF
      A0006FCE9E004FC389003ABD7B0027B66E0026B66E0026B66D0027B76F002794
      5C007AA28D00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC007E7E7E000707E0003838EF003838EB003838EB003838EF000707E1007E7E
      7E00CCCCCC00CCCCCC00CCCCCC00CCCCCC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003F89620083DFB10074D3A3006DD1
      9F0069D19C0067D09B0061D0980047C685003CC27E002CBD740028BC710025BA
      6E0025935B00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00B9B9
      B9002D2D31003B3BF1004343E9004141E9004141E9004343E9003B3BF1002D2D
      3100BABABA00CCCCCC00CCCCCC00CCCCCC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCCCCC005598740068CB99006CD9
      A2006DDDA5003998670082A091004EC3870056D997004CD18D0049D18C0041CE
      87003BD08600319763008EAB9B00CCCCCC00CCCCCC00CCCCCC00AFAFAF001010
      A9005151F7005454E5005454E5003232E6003232E6005454E5005454E5005151
      F7001010A900AFAFAF00CCCCCC00CCCCCC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCCCCC00AEBAB4004B956E0075E7
      AE005DDA9A0096ACA000CCCCCC003E9367004BCA8A004AD58F0047D58D003FD3
      89003DD2870034CC800033956200CCCCCC00CCCCCC00AAAAAA00121221005D5D
      F5006262E4005E5EE4006767E6000000A2000000A2006767E6005E5EE4006262
      E4005D5DF50012122100AAAAAA00CCCCCC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCCCCC00CCCCCC00CCCCCC003689
      5D0083A79400CCCCCC00CCCCCC00CCCCCC00A0B3A90046D58D0048E496003EDD
      8D003BDD8B0033DB870030E68B003D886000CCCCCC0000002A002424DC007777
      E3007474E3004646E6000000A6009A9A9A009A9A9A000000B1004646E6007474
      E3007777E3002424DC0000002A00CCCCCC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCCCCC00CCCCCC00CCCCCC00BDC3
      BF00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00339B640043DC8F003DE2
      8E003AE28C0034E88D002DC97A00B2BCB600CCCCCC0078787800000037008787
      E9009090E6000000AC0002021900CCCCCC00CCCCCC00020220000000BA009090
      E5008787EA000000360078787800CCCCCC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC0090A99B003DE5
      90003CF297003B936500B2BAB500CCCCCC00CCCCCC00CCCCCC00CCCCCC000000
      54000000C90095959500CCCCCC00CCCCCC00CCCCCC00CCCCCC00959595000000
      D20000004F00CCCCCC00CCCCCC00CCCCCC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC002FA7
      680035D48400ADB6B100CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC005E5E
      5E0010101F00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC001010
      1F005E5E5E00CCCCCC00CCCCCC00CCCCCC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00BAC0BC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end

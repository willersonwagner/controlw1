object Form68: TForm68
  Left = 0
  Top = 0
  Caption = 'Manifesto do Destinat'#225'rio'
  ClientHeight = 410
  ClientWidth = 774
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 64
    Width = 774
    Height = 346
    Align = alBottom
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawDataCell = DBGrid1DrawDataCell
    OnKeyPress = DBGrid1KeyPress
    OnKeyUp = DBGrid1KeyUp
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 774
    Height = 58
    Align = alTop
    TabOrder = 1
    object data: TLabel
      Left = 8
      Top = 5
      Width = 315
      Height = 20
      Caption = 'Data da Consulta: 01/01/2017 a 01/02/2017'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 27
      Width = 305
      Height = 22
      Caption = 'Ultima Atualiza'#231#227'o: 14/03/2017 16:26'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object JsBotao1: TBitBtn
      Left = 648
      Top = 10
      Width = 115
      Height = 39
      Caption = 'Atualizar F5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Glyph.Data = {
        860A0000424D860A00000000000036000000280000001D0000001E0000000100
        180000000000500A0000120B0000120B00000000000000000000DADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADAD9D9D9D8D8
        D8D7D7D7D7D7D7D8D8D8D9D9D9DADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADAD9D9D9D7D7D7D5D5D5D4D4D4D2D2D2D1D1D1D1D1D1D0D0D0D0D0D0D1
        D1D1D2D2D2D3D3D3D5D5D5D5D5D5D7D7D7D8D8D8D9D9D9DADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADAD7D7D7D2D2D2CFCFCFCBCBCBC8
        C8C8C5C5C5C1C1C1BFBFBFBFBFBFC3C3C3C8C8C8CCCCCCD0D0D0D3D3D3D5D5D5
        D5D5D5D4D4D4CFCFCFCCCCCCCECECED2D2D2D7D7D7D9D9D9DADADADADADADADA
        DADAD8D8D8D8D8D8DADADAD0D0D0C5C5C5C1C1C1BDBDBDB6B6B6B4B4B4B7B7B7
        BCBCBCBBBBBBB4B4B4ADA9A9B0A9A4B2A7A0B5A89FB6AAA2B8AEA7B9B4B0C3C3
        C3CDCDCDCECECEC7C7C7C9C9C9D1D1D1D6D6D6DADADADADADADAD6D5D5CBC7C4
        C6C0BDCECECECACACAB5B5B5B4B4B4B7B7B7BABABAB8B8B8B1AEAEADA6A09F91
        88A58C77A88970AB8567AD8362AD8464AC8869AC8E77AF9F92BEB7B2C6C5C5D1
        D1D1CBCBCBC8C8C8CDCDCDD6D6D6DADADADAD9D8D8BFB0A4AB8365BEB1A8DADA
        DABCBCBCBDBDBDC4C4C4BCB8B6A0978FA48771AE8460BC8A5FC39161C59262C7
        915EC78F5CC68D5AC38B58C08854B87F50AF815BAE9581CAC6C2DADADACACACA
        CACACAD1D1D1D8D8D8DADADADAC1B0A5B37D53AE8462C8BEB7DADADAC9C9C9AA
        9D97AA8669BB8E67C7966ACE9B6CD39E6BD09B67CF9965CF9660CD955FCC945D
        CC925CCD935BCA8F58C48851B9804EAF886AC4BBB6DADADAD1D1D1D0D0D0D8D8
        D8DADADADAC8BFB8C99F7DC69D7ABEA28CBEADADB39B88B79070C8956AD4A375
        D6A374D29F6ECC9864CA9460CC9662CE9864CE9865CC9763CC9765CB945ECC93
        5BCF975DCF945CB77B48B38F73D0CCCBD7D7D7D7D7D7DADADADADADADACDC5BE
        CDAC8EE2C4A7CCAA8DAE8667C39875D5A881D8A87CCD9866C99260CB9662CE9C
        6ACE9B69CD9968CA9565C48F5FC38B59C38956C28B59BF8752BD8047C5894FC7
        8B53BC8454BBA492D5D3D1DADADADADADADADADADACFC6BFC8A282E1C3A6E3C6
        AAD6B292E1C1A3DFBA97D3A476CD9664CC996AD09E6ECE9D70C7976BC4936ABA
        8E69BB916FBB8D68B77F54BB8051C08D63BE8A60B87F4EC3874EC38750B7855A
        D2C7BEDADADADADADADADADADAD0C7C0C7A182DAB899E7C9ADE3C1A4DFBD9DDC
        BA98DBB692D9B08AD4A982C9996FBC8B64BC997CD0C6BED1C9C2D4CECAD4CDC8
        D2C7C0CDA789D7AC88E1C8B3D0B39CBD8B60B87A44BB7E49CAB3A1DADADADADA
        DADADADADAD0C7C0C8A383DAB898E3C3A4DCB997DBB796DCBA97E1C3A5DAB89A
        C39570C09D82CBBDB3D7D3D1DADADADADADADADADADADADADADADAD9D2CCD9BE
        A9E2C8B0E9E2DBD7C6B9BB8860B67944C3A48AD7D4D2DADADADADADADAD0C7C0
        C8A383DBB99BE3C3A3DBB694DCB896E3C4A8D2AF8FC09B7DCCB9AACFC6C1DADA
        DADADADADADADADADADADADADADADADADADADADADADAD8CCC3DCC1AAE9E3DCE0
        E0E0C8AD97AF7545BC9575D3CAC3DADADADADADADAD1C9C2C9A687DCBB9DE4C4
        A5DCB795DCB895E6C8AECEA887B99173D2CBCADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADBD8D4DCCEC3DED6CFDADADAD1C7C0B48866
        B98F70CFC1B6DADADADADADADAD0C7BFC8A485DCBC9DE4C4A6DCB796DCB997E0
        BF9FDEBF9FD2AE91C2A187CEC1BAD9D8D8DADADADADADADADADADADADADADADA
        DADADADADADADBDAD9DCD9D5DBDAD8DADADAD4CDC9C2A691BE9D84CEC1B6DADA
        DADADADADACFC4BCC29673D8B698E1C3A9DAB89ADAB99CDAB89ADFC2A6DCBDA0
        C59A75C09E85CFC8C7DADADADADADADAD9D9D9D8D7D9D9D8D9D8D8D9D8D8D9D8
        D8D9D8D8D9D8D8D9D8D8D7D5D4CCBCB0C8B3A2D2C9C2DADADADADADADAD4CDC8
        C4A68FC6A78FC9AB95C8A990C8A991C7A68BC9AA90CAA990C39E80BB9476C9B8
        ADDADADADADADAD0C5BDC8B1A0C9B3A2C8B3A3C8B4A4C8B5A7C8B5A8C8B5A7C8
        B5A6C6B09FC4AD9ACEC0B6D9D6D4DADADADADADADAD4CCC6C7B2A2C9BBB8CBC5
        C5CDC5C5CDC5C5CDC2BFCBBDBBCBBEBACFC4BCCEBFB4D3CAC2DADADADADADAD2
        CAC3BB9679B98860CBA483CBA686C79E7DC9A281C9A27FCAA483C9A180C59F7F
        CAB5A5D7D7D7DADADADADADADACCBBAEBE9C81D5CAC1DADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADAC9B4A6BF916E
        D4AF8EDCB794D7AC85D4AB83D5AA82D7AD86D6AE89D0A785C6AA94D1CFCFDADA
        DADADADADAC5AE9BAD764DCBAB94E1D8D2D7C9BFCEBBACD5CEC8DADADADADADA
        DADADADADADADADADADADADADADADADADADAD9D8D8CFC1B7C29D7FCFA57FD7AB
        82CF9D70CE9C6ECF9D6DD0A277CEA682C9B09CD3D1D1DADADADADADADAC5AC99
        A96D3EBC8660D5B49BD1B198C09576CFC1B7DADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADAB89B8AC29878D7B18DD2A477CF9E70CF
        9C6DD0A176CEA582C9B09BD2D1D1DADADADADADADACCBAADBC8E69B37B4FBD85
        5AC6936CB88155CBB7A8DADADADADADADADADADADADADADADADADADADADADADA
        DADACDC9C9C3A893C09C7DCDA786D8B28CD3A57ACFA074D09F72D1A47ACEA381
        C8AE99D2D0D0DADADADADADADAD3C8C0CBA688C79D7BB67E53A96634AD6E3EB6
        8B6AD0C6BFDADADADADADADADADADADADADADADACCC2C2C9B7A8C2A18BC39975
        D0A781D6AD87D3A57BCF9E73D3A477D2A273D0A175CDA380C8AE99D2D0D0DADA
        DADADADADAD5CCC6C49F80E2C8B0D2AF92A86B3CA96A39A26230AF825FC7B4A6
        CDBFB5D0C4BBCFC2B9C4AE9FC2A187C49D7BD3AF8FDDBD9DDAB591D3A57BD1A0
        75D6A981D7AD87D7AC82D4A67CCBA17CC7AD98D2CFCFDADADADADADADAD4CECC
        C0A48ED7BAA1EDDAC8E2CBB3CBA483BB8A63B27D52B6845EBD916FC49C7ECBA6
        88D2B192DBBBA1E4CAB0E8CEB4E3C8ABE1C3A6DBB795D9B18AD7B08ACBA481D0
        A682D7AE88CEA581C8AE98D1CECEDADADADADADADAD9D9D9D4CFCFBF987BDABB
        A0FBF1E3EDDCC9E7D1BAE2C7AFDEC2A9DEC1A8E0C5ACE4C9B0E6CCB2E5CBB2E6
        CAB0E3C5ABE1C5A9E7CCB3E9D1B9D9B89AC49670BB987DBD9575CDA37ED5B08E
        CAB09BD1CECEDADADADADADADADADADADADADAC9BAAEC19979DBBEA2EFDECCF8
        EBDBF5E5D5EFDCC9ECD8C3EBD5BFEBD2BDEAD2BBE9D1B9EAD1B9EAD1B9E4C8AF
        DDBCA0CDA684C5A084C6B0A1CDC2BECDBFB4C19A7AC1926AC4A58BD3CFCDDADA
        DADADADADADADADADADADADADADAC8B6A7C29F83D1B195DEC1A7E7CFB9EAD3BE
        EBD4BEEAD3BEE9D1BBE7CDB6E4CAB1E0C2A6D8B698D0AD90C9A68AC1A38BC8B6
        B1D8D7D7DADADADADADAC8B4A4B48561BF9E84D4CCC5DADADADADADADADADADA
        DADADADADADAD9D9D9D0CCCAC4AB98C5A68ECBA88DD1AC8FD3AD90D4AF91D1AE
        8ECFAA8BCAA788C7A58AC6A790C4AD9BCAC1BFD8D6D5DADADADADADADADADADA
        DADAD7D5D5CBBCB1CBBAADD4CDC8DADADADADADADADADADADADADADADADADADA
        DADADADAD9D8D8CCC4C2BA9886B2825CB17B52AF774BAE784DB2825DB58D6DC1
        AEA4D7D6D5D9D8D8DADADADADADADADADADADADADADADADADADADADADADADADA
        D9D7D6D9D8D7DADADADA}
      ParentFont = False
      TabOrder = 0
      OnClick = JsBotao1Click
      OnKeyPress = JsBotao1KeyPress
    end
  end
  object DataSource1: TDataSource
    Left = 472
    Top = 240
  end
end

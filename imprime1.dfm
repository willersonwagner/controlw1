object imprime: Timprime
  Left = 0
  Top = -55
  Caption = 'imprime'
  ClientHeight = 701
  ClientWidth = 858
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Image1a: TImage
    Left = 161
    Top = 80
    Width = 201
    Height = 113
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 185
    Height = 89
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    TabOrder = 0
  end
  object rlVenda: TRLReport
    Left = 368
    Top = 0
    Width = 280
    Height = 1512
    Margins.LeftMargin = 0.610000000000000000
    Margins.TopMargin = 2.000000000000000000
    Margins.RightMargin = 0.610000000000000000
    Margins.BottomMargin = 0.000000000000000000
    AllowedBands = [btHeader, btDetail, btSummary, btFooter]
    AdjustableMargins = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.PaperSize = fpCustom
    PageSetup.PaperWidth = 74.000000000000000000
    PageSetup.PaperHeight = 400.000000000000000000
    PrintDialog = False
    ShowProgress = False
    object rlbRodape: TRLBand
      Left = 2
      Top = 282
      Width = 276
      Height = 71
      BandType = btFooter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      object RLDraw2: TRLDraw
        Left = 0
        Top = 0
        Width = 276
        Height = 8
        Align = faTop
        DrawKind = dkLine
        Pen.Width = 2
      end
      object pGap05: TRLPanel
        Left = 0
        Top = 54
        Width = 276
        Height = 17
        Align = faBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        object lSistema: TRLLabel
          Left = 0
          Top = 7
          Width = 276
          Height = 10
          Align = faBottom
          Alignment = taRightJustify
          Caption = 'ControlW Sistemas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Layout = tlBottom
          ParentFont = False
        end
      end
      object RLPanel1: TRLPanel
        Left = 0
        Top = 8
        Width = 276
        Height = 53
        Align = faClientTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        object RLBarcode1: TRLBarcode
          Left = 0
          Top = 0
          Width = 281
          Height = 34
          Margins.LeftMargin = 1.000000000000000000
          Margins.RightMargin = 1.000000000000000000
          Alignment = taCenter
          AutoSize = False
          Caption = '155821'
        end
        object nota: TRLLabel
          Left = 0
          Top = 30
          Width = 276
          Height = 23
          Align = faBottom
          Alignment = taCenter
          Caption = 'Venda: 155821 '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial Black'
          Font.Style = [fsBold]
          Layout = tlBottom
          ParentFont = False
        end
      end
    end
    object rlsbDetItem: TRLSubDetail
      Left = 2
      Top = 168
      Width = 276
      Height = 29
      AllowedBands = [btDetail, btSummary]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      object rlbDetItem: TRLBand
        Left = 0
        Top = 0
        Width = 276
        Height = 24
        AutoSize = True
        object mLinhaItem: TRLMemo
          Left = 0
          Top = 0
          Width = 276
          Height = 24
          Align = faTop
          Behavior = [beSiteExpander]
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Lines.Strings = (
            '9999999999999 DESCRICAO DO PRODUTO 99,999 UN x 999,999 (99,99)')
          ParentFont = False
        end
      end
      object rlbGap: TRLBand
        Left = 0
        Top = 24
        Width = 276
        Height = 2
        BandType = btSummary
      end
    end
    object rlsbPagamentos: TRLSubDetail
      Left = 2
      Top = 197
      Width = 276
      Height = 65
      object rlbPagamento: TRLBand
        Left = 0
        Top = 56
        Width = 276
        Height = 12
        AutoSize = True
        object lPagamento: TRLLabel
          Left = 218
          Top = 0
          Width = 44
          Height = 12
          Alignment = taRightJustify
          Caption = '99.999,99'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object lMeioPagamento: TRLLabel
          Left = 0
          Top = 0
          Width = 77
          Height = 12
          Caption = 'Cart'#227'o de Cr'#233'dito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
      object rlbTroco: TRLBand
        Left = 0
        Top = 80
        Width = 276
        Height = 12
        AutoSize = True
        BandType = btSummary
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        object lTitTroco: TRLLabel
          Left = -2
          Top = 0
          Width = 41
          Height = 12
          Caption = 'Troco R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object lTroco: TRLLabel
          Left = 218
          Top = 0
          Width = 44
          Height = 12
          Alignment = taRightJustify
          Caption = '99.999,99'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
      object rlbTotal: TRLBand
        Left = 0
        Top = 0
        Width = 276
        Height = 56
        BandType = btHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        object lTitTotal: TRLLabel
          Left = -2
          Top = 18
          Width = 80
          Height = 11
          Caption = 'VALOR TOTAL R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lTotal: TRLLabel
          Left = 217
          Top = 18
          Width = 44
          Height = 11
          Alignment = taRightJustify
          Caption = '99.999,99'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lQtdItens: TRLLabel
          Left = 0
          Top = 6
          Width = 102
          Height = 12
          Caption = 'QTD. TOTAL DE ITENS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lQtdTotalItensVal: TRLLabel
          Left = 230
          Top = 6
          Width = 31
          Height = 12
          Alignment = taRightJustify
          Caption = '99.999'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lTitFormaPagto: TRLLabel
          Left = 0
          Top = 42
          Width = 112
          Height = 12
          Caption = 'FORMA DE PAGAMENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lTitValorPago: TRLLabel
          Left = 213
          Top = 42
          Width = 48
          Height = 12
          Alignment = taRightJustify
          Caption = 'Valor Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw7: TRLDraw
          Left = 0
          Top = 0
          Width = 276
          Height = 8
          Align = faTop
          DrawKind = dkLine
          Pen.Width = 2
        end
        object RLLabel4: TRLLabel
          Left = 0
          Top = 30
          Width = 55
          Height = 11
          Caption = 'DESCONTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ldesconto: TRLLabel
          Left = 230
          Top = 30
          Width = 31
          Height = 11
          Alignment = taRightJustify
          Caption = '99.999'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object Desconto: TRLBand
        Left = 0
        Top = 68
        Width = 276
        Height = 12
        BandType = btSummary
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        object RLLabel2: TRLLabel
          Left = -2
          Top = 0
          Width = 41
          Height = 12
          Caption = 'Troco R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel3: TRLLabel
          Left = 218
          Top = 0
          Width = 44
          Height = 12
          Alignment = taRightJustify
          Caption = '99.999,99'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
    end
    object rlbsCabecalho: TRLSubDetail
      Left = 2
      Top = 8
      Width = 276
      Height = 160
      object rlbDadosCliche: TRLBand
        Left = 0
        Top = 0
        Width = 276
        Height = 59
        AutoSize = True
        BandType = btTitle
        Transparent = False
        object pLogoeCliche: TRLPanel
          Left = 0
          Top = 0
          Width = 276
          Height = 59
          Align = faTop
          AutoExpand = True
          AutoSize = True
          object lEndereco: TRLMemo
            Left = 0
            Top = 29
            Width = 276
            Height = 30
            Align = faTop
            Alignment = taCenter
            Behavior = [beSiteExpander]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            Lines.Strings = (
              'Endere'#231'o')
            ParentFont = False
          end
          object imgLogo: TRLImage
            Left = 0
            Top = 0
            Width = 276
            Height = 1
            Align = faTop
            AutoSize = True
            Center = True
            Scaled = True
            Transparent = False
          end
          object lNomeFantasia: TRLMemo
            Left = 0
            Top = 1
            Width = 276
            Height = 16
            Align = faTop
            Alignment = taCenter
            Behavior = [beSiteExpander]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Layout = tlCenter
            Lines.Strings = (
              'Nome Fantasia')
            ParentFont = False
          end
          object lRazaoSocial: TRLMemo
            Left = 0
            Top = 17
            Width = 276
            Height = 12
            Align = faTop
            Alignment = taCenter
            Behavior = [beSiteExpander]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            Lines.Strings = (
              'Raz'#227'o Social')
            ParentFont = False
          end
        end
      end
      object RLBand1: TRLBand
        Left = 0
        Top = 129
        Width = 276
        Height = 25
        BandType = btColumnFooter
        object RLDraw4: TRLDraw
          Left = 0
          Top = 17
          Width = 276
          Height = 8
          Align = faTop
          DrawKind = dkLine
          Pen.Width = 2
        end
        object lCPF_CNPJ1: TRLLabel
          Left = 0
          Top = 0
          Width = 276
          Height = 17
          Align = faTop
          Caption = '#|COD|DESC|QTD|UN| VL UN R$|(VLTR R$)*| VL ITEM R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Layout = tlBottom
          ParentFont = False
        end
      end
      object dadosCliente: TRLBand
        Left = 0
        Top = 99
        Width = 276
        Height = 30
        BandType = btColumnFooter
        object lcliente: TRLLabel
          Left = 0
          Top = 0
          Width = 276
          Height = 25
          Align = faTop
          Caption = 'Cliente'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Black'
          Font.Style = [fsBold]
          Layout = tlBottom
          ParentFont = False
        end
        object RLDraw8: TRLDraw
          Left = 0
          Top = 22
          Width = 276
          Height = 8
          Align = faBottom
          DrawKind = dkLine
          Pen.Width = 2
        end
      end
      object dadosNota: TRLBand
        Left = 0
        Top = 59
        Width = 276
        Height = 40
        AlignToBottom = True
        object ldadosNota: TRLLabel
          Left = 0
          Top = 8
          Width = 276
          Height = 13
          Align = faTop
          Caption = 'Vendedor: 0-Vendedor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Black'
          Font.Style = [fsBold]
          Layout = tlBottom
          ParentFont = False
        end
        object RLDraw1: TRLDraw
          Left = 0
          Top = 0
          Width = 276
          Height = 8
          Align = faTop
          DrawKind = dkLine
          Pen.Width = 2
        end
        object RLDraw5: TRLDraw
          Left = 0
          Top = 32
          Width = 276
          Height = 8
          Align = faBottom
          DrawKind = dkLine
          Pen.Width = 2
        end
      end
    end
    object rlbMensagemContribuinte: TRLBand
      Left = 2
      Top = 262
      Width = 276
      Height = 20
      AutoSize = True
      BandType = btSummary
      object RLDraw3: TRLDraw
        Left = 0
        Top = 0
        Width = 276
        Height = 8
        Align = faTop
        DrawKind = dkLine
        Pen.Width = 2
      end
      object lObservacoes: TRLMemo
        Left = 0
        Top = 8
        Width = 276
        Height = 12
        Align = faTop
        Alignment = taCenter
        Behavior = [beSiteExpander]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object RLReport1: TRLReport
    Left = 56
    Top = 95
    Width = 280
    Height = 756
    Margins.LeftMargin = 0.610000000000000000
    Margins.TopMargin = 2.000000000000000000
    Margins.RightMargin = 0.610000000000000000
    AdjustableMargins = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.PaperSize = fpCustom
    PageSetup.PaperWidth = 74.000000000000000000
    PageSetup.PaperHeight = 200.000000000000000000
    object RLBand2: TRLBand
      Left = 2
      Top = 132
      Width = 276
      Height = 341
      GreenBarColor = clBlack
      AutoSize = True
      Color = clWhite
      ParentColor = False
      Transparent = False
      object RLPanel5: TRLPanel
        Left = 0
        Top = 0
        Width = 276
        Height = 341
        Align = faClient
        Transparent = False
        object RLMemo4: TRLMemo
          Left = 0
          Top = 0
          Width = 276
          Height = 288
          Align = faTop
          Behavior = [beSiteExpander]
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Lines.Strings = (
            '9999999999999 DESCRICAO DO PRODUTO 99,999 UN x 999,999 (99,99)'
            '9999999999999 DESCRICAO DO PRODUTO 99,999 UN x 999,999 (99,99)'
            '9999999999999 DESCRICAO DO PRODUTO 99,999 UN x 999,999 (99,99)'
            '9999999999999 DESCRICAO DO PRODUTO 99,999 UN x 999,999 (99,99)'
            '9999999999999 DESCRICAO DO PRODUTO 99,999 UN x 999,999 (99,99)'
            '9999999999999 DESCRICAO DO PRODUTO 99,999 UN x 999,999 (99,99)'
            '9999999999999 DESCRICAO DO PRODUTO 99,999 UN x 999,999 (99,99)'
            '9999999999999 DESCRICAO DO PRODUTO 99,999 UN x 999,999 (99,99)'
            '9999999999999 DESCRICAO DO PRODUTO 99,999 UN x 999,999 (99,99)'
            '9999999999999 DESCRICAO DO PRODUTO 99,999 UN x 999,999 (99,99)'
            '9999999999999 DESCRICAO DO PRODUTO 99,999 UN x 999,999 (99,99)'
            '9999999999999 DESCRICAO DO PRODUTO 99,999 UN x 999,999 (99,99)')
          ParentColor = False
          ParentFont = False
          Transparent = False
        end
      end
    end
    object RLBand3: TRLBand
      Left = 2
      Top = 8
      Width = 276
      Height = 124
      BandType = btHeader
      object RLPanel2: TRLPanel
        Left = 0
        Top = 0
        Width = 276
        Height = 57
        Align = faTop
        object RLMemo1: TRLMemo
          Left = 0
          Top = 0
          Width = 276
          Height = 18
          Align = faTop
          Alignment = taCenter
          Behavior = [beSiteExpander]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = tlCenter
          Lines.Strings = (
            'Nome Fantasia')
          ParentFont = False
        end
        object RLMemo2: TRLMemo
          Left = 0
          Top = 18
          Width = 276
          Height = 12
          Align = faTop
          Alignment = taCenter
          Behavior = [beSiteExpander]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Lines.Strings = (
            'Raz'#227'o Social')
          ParentFont = False
        end
        object RLMemo3: TRLMemo
          Left = 0
          Top = 30
          Width = 276
          Height = 12
          Align = faTop
          Alignment = taCenter
          Behavior = [beSiteExpander]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Lines.Strings = (
            'Endere'#231'o')
          ParentFont = False
        end
      end
      object RLDraw6: TRLDraw
        Left = 0
        Top = 91
        Width = 276
        Height = 8
        Align = faTop
        DrawKind = dkLine
        Pen.Width = 2
      end
      object RLLabel1: TRLLabel
        Left = 0
        Top = 78
        Width = 276
        Height = 13
        Align = faTop
        Caption = 'Vendedor: 0-Vendedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial Black'
        Font.Style = [fsBold]
        Layout = tlBottom
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 0
        Top = 65
        Width = 276
        Height = 13
        Align = faTop
        Caption = 'Cliente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial Black'
        Font.Style = [fsBold]
        Layout = tlBottom
        ParentFont = False
      end
      object RLDraw9: TRLDraw
        Left = 0
        Top = 57
        Width = 276
        Height = 8
        Align = faTop
        DrawKind = dkLine
        Pen.Width = 2
      end
      object RLDraw10: TRLDraw
        Left = 0
        Top = 111
        Width = 276
        Height = 8
        Align = faTop
        DrawKind = dkLine
        Pen.Width = 2
      end
      object RLLabel6: TRLLabel
        Left = 0
        Top = 99
        Width = 276
        Height = 12
        Align = faTop
        Caption = '#|COD|DESC|QTD|UN| VL UN R$|(VLTR R$)*| VL ITEM R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        Layout = tlBottom
        ParentFont = False
      end
    end
    object RLBand4: TRLBand
      Left = 2
      Top = 473
      Width = 276
      Height = 71
      BandType = btFooter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      object RLDraw11: TRLDraw
        Left = 0
        Top = 0
        Width = 276
        Height = 8
        Align = faTop
        DrawKind = dkLine
        Pen.Width = 2
      end
      object RLPanel3: TRLPanel
        Left = 0
        Top = 54
        Width = 276
        Height = 17
        Align = faBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        object RLLabel7: TRLLabel
          Left = 0
          Top = 7
          Width = 276
          Height = 10
          Align = faBottom
          Alignment = taRightJustify
          Caption = 'ControlW Sistemas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Layout = tlBottom
          ParentFont = False
        end
      end
      object RLPanel4: TRLPanel
        Left = 0
        Top = 8
        Width = 276
        Height = 53
        Align = faClientTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        object RLBarcode2: TRLBarcode
          Left = 0
          Top = 0
          Width = 281
          Height = 34
          Margins.LeftMargin = 1.000000000000000000
          Margins.RightMargin = 1.000000000000000000
          Alignment = taCenter
          AutoSize = False
          Caption = '155821'
        end
        object RLLabel8: TRLLabel
          Left = 0
          Top = 30
          Width = 276
          Height = 23
          Align = faBottom
          Alignment = taCenter
          Caption = 'Venda: 155821 '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial Black'
          Font.Style = [fsBold]
          Layout = tlBottom
          ParentFont = False
        end
      end
    end
  end
  object RLReport3: TRLReport
    Left = 304
    Top = 24
    Width = 794
    Height = 1123
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ShowProgress = False
    object RLMemo5: TRLMemo
      Left = 38
      Top = 38
      Width = 718
      Height = 1047
      Align = faClient
      Behavior = [beSiteExpander]
    end
  end
  object RelLivroCaixa: TRLReport
    Left = 40
    Top = 43
    Width = 794
    Height = 1123
    Margins.LeftMargin = 2.000000000000000000
    Margins.TopMargin = 2.000000000000000000
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand9: TRLBand
      Left = 8
      Top = 69
      Width = 748
      Height = 24
      BandType = btHeader
      Borders.Sides = sdAll
      Borders.Width = 2
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      object RLLabel17: TRLLabel
        Left = 24
        Top = 3
        Width = 31
        Height = 16
        Caption = 'Data'
        Transparent = False
      end
      object RLLabel18: TRLLabel
        Left = 75
        Top = 3
        Width = 52
        Height = 16
        Caption = 'Nr. Doc.'
        Transparent = False
      end
      object RLLabel19: TRLLabel
        Left = 141
        Top = 3
        Width = 55
        Height = 16
        Caption = 'Hist'#243'rico'
        Transparent = False
      end
      object RLLabel20: TRLLabel
        Left = 685
        Top = 3
        Width = 39
        Height = 16
        Caption = 'Grupo'
        Transparent = False
      end
      object RLLabel27: TRLLabel
        Left = 405
        Top = 3
        Width = 49
        Height = 16
        Caption = 'Entrada'
        Transparent = False
      end
      object RLLabel28: TRLLabel
        Left = 501
        Top = 3
        Width = 37
        Height = 16
        Caption = 'Sa'#237'da'
        Transparent = False
      end
      object RLLabel29: TRLLabel
        Left = 573
        Top = 3
        Width = 71
        Height = 16
        Caption = 'Saldo Atual'
        Transparent = False
      end
    end
    object RLBand10: TRLBand
      Left = 8
      Top = 8
      Width = 748
      Height = 61
      BandType = btHeader
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      object RLLabel21: TRLLabel
        Left = 3
        Top = 3
        Width = 353
        Height = 16
        Caption = 'Raz'#227'o Social:DEEP TRATOR PECAS COM. E REP. LTDA'
        Transparent = False
      end
      object RLLabel22: TRLLabel
        Left = 3
        Top = 23
        Width = 339
        Height = 16
        Caption = 'CNPJ:84.020.817/0001-11            INSC. EST.:240020831'
        Transparent = False
      end
      object RLLabel23: TRLLabel
        Left = 677
        Top = 3
        Width = 68
        Height = 16
        Caption = '31/08/2018'
        Transparent = False
      end
      object RLLabel24: TRLLabel
        Left = 691
        Top = 43
        Width = 54
        Height = 16
        Caption = '15:23:01'
        Transparent = False
      end
      object RLLabel25: TRLLabel
        Left = 3
        Top = 43
        Width = 417
        Height = 16
        Caption = 'Livro de Registros do Movimento de Caixa de: 01/01/20 a 02/03/20'
        Transparent = False
      end
    end
    object RLBand11: TRLBand
      AlignWithMargins = True
      Left = 8
      Top = 93
      Width = 748
      Height = 19
      AlignToBottom = True
      AutoSize = True
      Completion = ctFullPage
      BeforePrint = RLBand7BeforePrint
      object RLDBText5: TRLDBText
        Left = 23
        Top = 3
        Width = 30
        Height = 16
        Alignment = taCenter
        DataField = 'data'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText6: TRLDBText
        Left = 59
        Top = 3
        Width = 68
        Height = 16
        Alignment = taRightJustify
        DataField = 'documento'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText7: TRLDBText
        Left = 407
        Top = 3
        Width = 47
        Height = 16
        Alignment = taRightJustify
        DataField = 'entrada'
        DataSource = DataSource1
        DisplayMask = '#,###,###0.00'
        Text = ''
      end
      object RLDBText8: TRLDBText
        Left = 688
        Top = 3
        Width = 36
        Height = 16
        Alignment = taRightJustify
        DataField = 'grupo'
        DataSource = DataSource1
        DisplayMask = '000###'
        Text = ''
      end
      object RLDBText9: TRLDBText
        Left = 143
        Top = 3
        Width = 53
        Height = 16
        DataField = 'historico'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText10: TRLDBText
        Left = 503
        Top = 3
        Width = 35
        Height = 16
        Alignment = taRightJustify
        DataField = 'saida'
        DataSource = DataSource1
        DisplayMask = '#,###,###0.00'
        Text = ''
      end
      object RLDBText11: TRLDBText
        Left = 609
        Top = 3
        Width = 35
        Height = 16
        Alignment = taRightJustify
        DataField = 'saldo'
        DataSource = DataSource1
        DisplayMask = '#,###,###0.00'
        Text = ''
      end
    end
    object RLBand12: TRLBand
      Left = 8
      Top = 112
      Width = 748
      Height = 29
      BandType = btFooter
      object RLSystemInfo2: TRLSystemInfo
        Left = 57
        Top = 11
        Width = 87
        Height = 16
        Info = itPageNumber
        Text = ''
      end
      object RLDraw13: TRLDraw
        Left = 0
        Top = 0
        Width = 748
        Height = 8
        Align = faTop
        DrawKind = dkLine
        Pen.Width = 2
      end
      object RLLabel26: TRLLabel
        Left = 3
        Top = 10
        Width = 48
        Height = 16
        Caption = 'P'#225'gina:'
        Transparent = False
      end
    end
  end
  object RLReport2: TRLReport
    Left = 48
    Top = 388
    Width = 794
    Height = 1123
    Margins.LeftMargin = 2.000000000000000000
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand5: TRLBand
      Left = 8
      Top = 83
      Width = 748
      Height = 30
      BandType = btHeader
      Borders.Sides = sdAll
      Borders.Width = 2
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      object RLLabel13: TRLLabel
        Left = 3
        Top = 10
        Width = 44
        Height = 16
        Caption = 'Codigo'
        Transparent = False
      end
      object RLLabel14: TRLLabel
        Left = 93
        Top = 8
        Width = 62
        Height = 16
        Caption = 'Descri'#231#227'o'
        Transparent = False
      end
      object RLLabel15: TRLLabel
        Left = 469
        Top = 10
        Width = 70
        Height = 16
        Caption = 'Quantidade'
        Transparent = False
      end
      object RLLabel16: TRLLabel
        Left = 669
        Top = 9
        Width = 38
        Height = 16
        Caption = 'Pre'#231'o'
        Transparent = False
      end
    end
    object RLBand6: TRLBand
      Left = 8
      Top = 38
      Width = 748
      Height = 45
      BandType = btHeader
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      object RLLabel9: TRLLabel
        Left = 3
        Top = 3
        Width = 259
        Height = 16
        Caption = 'Relat'#243'rio de Tabela de Pre'#231'o Alfab'#233'tica'
        Transparent = False
      end
      object RLLabel10: TRLLabel
        Left = 3
        Top = 23
        Width = 124
        Height = 16
        Caption = 'ControlW Sistemas'
        Transparent = False
      end
      object RLLabel11: TRLLabel
        Left = 677
        Top = 3
        Width = 68
        Height = 16
        Caption = '31/08/2018'
        Transparent = False
      end
      object RLLabel12: TRLLabel
        Left = 691
        Top = 25
        Width = 54
        Height = 16
        Caption = '15:23:01'
        Transparent = False
      end
    end
    object RLBand7: TRLBand
      AlignWithMargins = True
      Left = 8
      Top = 113
      Width = 748
      Height = 19
      AlignToBottom = True
      AutoSize = True
      Completion = ctFullPage
      BeforePrint = RLBand7BeforePrint
      object RLDBText1: TRLDBText
        Left = 3
        Top = 3
        Width = 70
        Height = 16
        Alignment = taRightJustify
        DataField = 'cod'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 93
        Top = 3
        Width = 36
        Height = 16
        DataField = 'nome'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 503
        Top = 3
        Width = 36
        Height = 16
        Alignment = taRightJustify
        DataField = 'quant'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 639
        Top = 3
        Width = 74
        Height = 16
        Alignment = taRightJustify
        DataField = 'p_venda'
        DataSource = DataSource1
        DisplayMask = '#,###,###0.00'
        Text = ''
      end
    end
    object RLBand8: TRLBand
      Left = 8
      Top = 132
      Width = 748
      Height = 29
      BandType = btFooter
      object RLSystemInfo1: TRLSystemInfo
        Left = 3
        Top = 10
        Width = 87
        Height = 16
        Info = itPageNumber
        Text = ''
      end
      object RLDraw12: TRLDraw
        Left = 0
        Top = 0
        Width = 748
        Height = 8
        Align = faTop
        DrawKind = dkLine
        Pen.Width = 2
      end
    end
  end
  object pedidoVendaA4: TRLReport
    Left = 48
    Top = 232
    Width = 794
    Height = 1123
    Margins.LeftMargin = 2.000000000000000000
    AdjustableMargins = True
    Borders.Sides = sdCustom
    Borders.DrawLeft = False
    Borders.DrawTop = True
    Borders.DrawRight = False
    Borders.DrawBottom = True
    Borders.FixedTop = True
    Borders.FixedBottom = True
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    FooterMeasuring = fmBeforeDetail
    PageSetup.PaperSize = fpCustom
    PageSetup.PaperWidth = 210.000000000000000000
    PageSetup.PaperHeight = 297.000000000000000000
    PreviewOptions.ShowModal = True
    PreviewOptions.Caption = 'Pr'#233'-visualiza'#231#227'o - ControlW Sistemas'
    ShowProgress = False
    object RLBand14: TRLBand
      Left = 8
      Top = 39
      Width = 748
      Height = 40
      AutoSize = True
      BandType = btHeader
      Borders.Width = 2
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      object RLLabel34: TRLLabel
        Left = 0
        Top = 24
        Width = 103
        Height = 16
        Caption = 'Pedido Nr: 1500'
        Transparent = False
      end
      object RLLabel36: TRLLabel
        Left = 605
        Top = 24
        Width = 68
        Height = 16
        Caption = '31/08/2018'
        Transparent = False
      end
      object RLLabel37: TRLLabel
        Left = 675
        Top = 24
        Width = 54
        Height = 16
        Caption = '15:23:01'
        Transparent = False
      end
      object RLLabel42: TRLLabel
        Left = 296
        Top = 24
        Width = 97
        Height = 16
        Caption = 'Pagto: 2-Prazo'
        Transparent = False
      end
      object RLLabel35: TRLLabel
        Left = 0
        Top = 0
        Width = 748
        Height = 22
        Align = faTop
        Alignment = taCenter
        Borders.Sides = sdAll
        Borders.Width = 2
        Caption = 'PEDIDO DE VENDA'
        Transparent = False
      end
    end
    object RLBand17: TRLBand
      Left = 8
      Top = 79
      Width = 748
      Height = 64
      AutoExpand = False
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      Borders.Width = 2
      Borders.FixedTop = True
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      object RLLabel38: TRLLabel
        Left = 89
        Top = 2
        Width = 136
        Height = 15
        Align = faClientLeft
        Caption = 'MOTO PECAS UNIAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel39: TRLLabel
        Left = 89
        Top = 17
        Width = 304
        Height = 15
        Align = faClientLeft
        Caption = 'RUA MANOEL FELIPE, 1754 - ASA BRANCA '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel40: TRLLabel
        Left = 510
        Top = 3
        Width = 200
        Height = 16
        Caption = 'CNPJ: 03.910.026/0001-65'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel41: TRLLabel
        Left = 550
        Top = 33
        Width = 120
        Height = 16
        Caption = 'IE: 240282070 '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLImage1: TRLImage
        Left = 0
        Top = 2
        Width = 89
        Height = 62
        Align = faLeft
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000C80000
          00770802000000C9A69869000000017352474200AECE1CE90000000467414D41
          0000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000021
          D14944415478DAED9D797C4DD7FEFE4F34A8B1A67B71CBA5976A4B0C350F1749
          45C43CA486901263C554314BCDF31869631E137390C63557424CADE1AA504429
          253596E21AA32DEDF77DCFEE6FFFD677ED73764E9233F1DDCF1F5E39CB1ED77A
          D6F3793E6BAFBDB6C71F7FFC613260C0DEF0308865C011308865C021308865C0
          21308865C021308865C021308865C0213088E58EF8EDB7DF1E3F7EFCF4E9535A
          2767CE9C79F3E6F5F4F474F545A50F06B1DC08FFF9CF7F9292920E1D3A74E2C4
          89949494870F1FD23A79F2E4295BB66CFBF6EDFDFDFDB367CFEEEA6BB41506B1
          DC0257AF5E8D8D8DDDB871E3A953A79E3C79A2DD2057AE5C3D7BF61C3B766CBE
          7CF95C7DB136C120968BF1E0C183B56BD7CE9F3F3F3939F9F7DF7FD7D9324B96
          2C2121213366CC2038BAFAAAD386412C5782C08708EDDAB50B53E5E1E151A850
          A182050BA6A6A6DEBC79F3D75F7FD56E9F2D5BB6F0F0F0BE7DFBBAFAC2D38641
          2CD70071DABC79F3B061C32E5DBAC4CF22458AF4EAD52B2020803FF0EC870F1F
          8E8C8C3C72E488B6754A952AB56DDBB677DF7DD7D57790060C62B9002F5EBC58
          B162C5881123EEDEBDCBCFB7DF7E7BDEBC79BEBEBE8896BACD8F3FFED8BD7BF7
          848404EDEE61616193274F76F54DA4018358CE06151E1D1D1D1A1A4A0EC8CFC2
          850B47454591F169B73C78F060EBD6AD15F289F0F2F28A8F8F47DB5C7D2B7A30
          88E56CE0A88283837FFAE927FE7EEDB5D7A64C994240B4B8E52FBFFCD2AE5DBB
          2D5BB648E5AFBFFE7A5C5C9C452EBA0F0C623915172F5E6CDBB6EDC99327959F
          3E3E3E9B366D2A50A080B5EDA74D9B3672E4486DF9D4A95389A4AEBE1B3D18C4
          721E48F448E8962E5DAAFCCC9933E79A356B5AB56AA5B3CBFAF5EB3B75EAA41D
          86C0E92F5AB4C8D537A4078358CE03D95CC78E1D1F3D7AA4FC6CDCB8F1860D1B
          72E7CEADBF4B9B366D7EFBED37A99C10B96EDDBA2C59B2B8FA9EACC2209693F0
          E0C103D8B07BF76EE5A7A7A7279E1D35D2DF0B2FC55ECF9F3F97CADBB76FBF76
          ED5A8358064CAB56ADEAD1A3873AEC59AE5C3948F6B7BFFD4D7FAF254B9610F5
          B4E5212121F3E7CF77F53DE9C1209633F0F3CF3FB76CD9F2EBAFBF564BFAF5EB
          17191999E68E616161F8746DF9CC9933870C19E2EADBD283412C6760F9F2E51F
          7FFCB11AD1B265CB161313A36FDBC1B367CF30583B77EE94CA71FDFFFAD7BF7C
          7D7D5D7D5B7A3088E570E0AE90ABFDFBF7AB25254B96DCBB77EF5B6FBDA5BFE3
          B973E760CF8D1B37A4F28A152B1246FFFAD7BFBAFACEF46010CBE1F8F2CB2F11
          9EA74F9FAA25FEFEFEB8F2D75F7F5D7FC7888888D0D0506DB9F148C7C07F3160
          C000C94E0D1D3A74C68C19FA7B61CB9A376F7EE4C811A91CBFBF63C70E44CBD5
          B795060C62391677EFDEF5F3F33B71E2845AE2E1E181E50A0E0ED6DF71E9D2A5
          A47EDA8186418306E1DCDD79A0E1CFDB742DB138FBE3C78FE99D3FFDF413FF3E
          7AF48884DCD3D3334F9E3C850A152A5AB468E1C2855F8A796DD670ECD8B1468D
          1A29CF9B15E4CA950BC9A957AF9ECE5ED7AE5D6BD1A24552529254FEDE7BEF61
          DBDF7EFB6D57DF56DA7001B17EFFFDF77BF7EE5DBC78F1E4C993DF7CF34D7272
          F2D5AB57A97A92203A28D7439F7EEDB5D7B020050A142855AA54CD9A351B366C
          58B56A55D8E6EAEA4A37A2A3A3BB76ED2A5632B12C3131B14C99323AF5337AF4
          E82953A648E53972E4983F7F7E9A52E768702F29292967CF9E4D4D4D2D58B060
          A54A95F2E7CFAFDDCC79C48237972F5FA6071F3870003EF137FA64E3D973E7CE
          0DBDBA77EFDEAC5933FD6720EE861123464C9F3E5D2C295FBE3C29217A6C6D97
          3D7BF674E8D001FD96CA7BF7EE3D67CE9C342DBFA3F1D5575FC12AB413E9BD73
          E70EEDD8B469D3E2C58B4B9B399C586443A4CDF451EA0B89BA7DFBB6FECC6E1D
          50A7DCC39831632A54A8E09C4ACC245EBC78111818B871E346B1D0D7D777EBD6
          ADD6F871FDFAF5F6EDDBD37852397B217E698ED43B1AC46892DC3A75EAECDEBD
          9B6002B14A942871E5CA95A0A0A0AC59B38A5B3A8A5858A50B172EC4C7C7E327
          B0AEF7EFDFB7D7890822E1E1E130CC09F59849601FFDFDFD25967CF4D1475044
          9C2CAA0251C79B2F58B0402AAF5CB9F2CA952BCB952BE7EA1B32252424604888
          80DBB76F0F0808D8B66D1B9D9CC808D5FEFEF7BF8B5BDA99581CEDE6CD9BE853
          5C5CDCA14387D0274710978EBB70E142B27147D763264146E2EDEDFDDD77DF89
          8583070F9E356B9676632A6AEEDCB9C3860D835E62B99797D7B265CBAA57AFEE
          EABBF92FE0131285DB23B14574C9AEF07CE413D04B4A29EC46AC5F7EF9E5D4A9
          53B1B1B1B0F8FBEFBFD7CEF4B008D2E637DE78A358B162254B96244EE33C88DC
          943F79F20499FDF1C71F7FF8E1073A8438BAA8A074E9D231313174655757B51E
          4850EAD7AF2F0D9D4F9A34E9D34F3FD56E4C7CC44472D76221D678D1A2456EC2
          2A70FCF8F15BB76EBDF3CE3B478F1E25B1251CB56BD78E46FFF0C30F250B6F07
          6211E670A36BD7AEDDB76F1FE99E2DBB90F441A65AB56AF9F8F854A952854E00
          BDA4206D32C7530E78E6CC1938B469D326316907AD5AB52240B873AA8807C01B
          513F62E1E79F7FDEBF7F7F694BDA89104987140B6939340CB3EFEAFBF8FF404D
          69685480C047DF26093B7DFA3401C4CFCF4FDA32E3C462479C2632B866CD1A6A
          10C5B2652F723AF804C11B3468009F6C5C92E0F9F3E7740E82081AA01666CF9E
          3D2A2A8A04CA35756C03F6EFDFDFA44913496E09225DBB76154B486EBA74E9F2
          EF7FFF5B2DA15ADAB66D3B6DDA34C9B8B803E8EA38771846FD736B3422AAAC15
          858C108B5D8850EBD7AF87BCE7CF9F27F7B1652FC25CE3C68D3B77EE0CB19478
          975E703FECAEBC86A08003A2646E3B82AA9DFF49E8A7D2C8FBD412023D119094
          592D41BC070E1C181A1ACA1FAEBE03CB504622535353F3E5CB672D62A48F586C
          8C66AC5AB58ADA815BB6EC4BFA43B76BD1A20519E9FBEFBFAFA576BA3076ECD8
          091326A83F494FC87E09A64EAAD174423B631D29A227B46CD952F9895FF9F8E3
          8FC5F770CA962D3B71E244AAEBA55B5E4682ADC452540A4F03ABAE5CB962CB5E
          18A9F7DE7B2F303090C0473C561F6FB12F6E49B1EDE9BD5C0492708EA9574B48
          0F691B5757A36510F55023B184F0817968D4A891C91C53305B7451F5BF90B731
          63C6B8FF5BCEB6C02662E1A5E013D5845CD9B23DBD8D748644B475EBD6E2989E
          C24E0E4506848ACE9F3F9FFC225D978BD982A9747AB564C080019F7DF699ABAB
          D132B0DE924F2751C72C7A7B7B93970C1F3E1C23AFE81976989FF8F78C9904C7
          E18519D9B2654BEF8E69108B8C66E3C68D3000F36FCB88399422DEF5E8D18394
          4D9A8976F3E6CDA54B97464747AB313463623365CA14315DC7E4AE5BB70E7574
          64F56610B366CD1A3A74A85842EE42ECAE5DBB36E18F28F9F8F1630A31F8DC94
          1BCE84B971E3C6F4E9D35113720BC24EBAA654582516595E4242427878F8C183
          076D1994A2692B54A8D0B3674FAEE02F7FF98BF4BF972F5F866D898989E2E966
          CF9E3D68D0A0F4DE2D49283D5B3D4ED3A64DE3E2E23269DD1C84C993278F1A35
          4A2CC99B372FB55AAD5A3558A504412A8DE08862B9F03AD1245443AA431A9DD6
          4174F99B068D8989F1F1F1B1FD9816884549727232AD4EC4515F82D33B848747
          993265E00D9555B468518BDB40D0C183074B85164774D2047D3D2020409DA884
          11E63ADDD3EA8E1E3D7AD2A4496249FEFCF9F7EEDD4B757DF0C107478F1EA584
          C8BE7AF56A17CEAFC2B6A2AC682771C0CBCB4B2D276477ECD8F1C18307CA4F8C
          0D01C7F6C820138B0311AD222222D0185BF6C742A193B0EA1FFFF887CE669F7C
          F20934920A172C58D0BB77EFF45604FE0C62A922CAD9A3A2A2EC5AD57603B649
          9A294A1ABB6FDF3E9C25421B1F1F4F09569DAEE2AA2956292929C83F4189BFD1
          85152B5628BA75FBF66D3CC6810307D42DB9E63D7BF6BCF9E69B361EF97F11EB
          C48913E4F398005B621FAA4E168377C61CA4D9E12090F695707A809434D9021C
          555050906AF848A3C68F1FEF803AB703424343E9A26209BE1362912CE35DD4C5
          17F0A3B8586B629F19288D6BF181B7C91CECE8F0EA336FE40A35556C0C9E0FB9
          155D75CE9C39E9D208AD8DA7FE9358FC4BBF215A29EB80E983B853B76EDD2143
          86F8FAFADA982FE0BDD4350BFE3CB187074AD3B973E7F45696F88A01CA8C5369
          D7AE5D261BC041E8D7AFDFBC79F3C49222458A288A75EDDA3574F7D8B1634A79
          B366CDC86DF5553FBD3873E6CCB265CB9E3E7DCA65587C2E84DB4396D4076524
          F26852810205929292301857AF5E95B627626AFD8C35FC492CFC23A272EBD6AD
          3477E0E65129F453678D142DBA75EB86CC8A25881CDE028791DEFAC296298E12
          D0CBA90B0420A395EF5890F32E5EBC582CC139ECDFBFBF74E9D226F3843EFA95
          FA889A54116E55AD5A353367A435D121FA1B593C75AE4C6E4611E97E3972E410
          B72439E3EC1B366C504BEAD7AFBF73E74E3A7CAF5EBD56AD5AA53D38968B721B
          EDE07F89F5EDB7DF92CA494F40B5400CD106842A03138370422B57AE144BB8F9
          F5EBD773DE741D87FED7BC7973145BF98953C1B9BB7C52A53510E8972F5F2E96
          142F5E1C62A96F145227F452D520E3B4F064DC6006464F7EFEF9671408B25EBF
          7E1D9F74EEDC39B541E97ED49834EE8A583669D2445CD5AD4A952AD80C526CEC
          9034754701B192E3DBF83EA307CC85A11876FDEDC88AC3C2C250C80CB422DC45
          E1D6AC5923164A0F376CC4850B1708F3D49DC91C4CB12619B0FF4E83B63B9528
          510247AC3E5A26CF47A5468D1A959A9AAA941007B0FC7DFBF6B57DA4F4D75F7F
          C5FD10A7BEF9E61B8BE61845408AA4D737468E1C396DDA34B1043A162B568CA8
          C5C5D03A981CE9F1399744646BD0A0812D57E541D22B315702874333870E1D9A
          E69BBBD6800724E3409FA4DBD8BC7933A74ED7A190E2AE5DBB2A8FBD49DAC933
          5C3B02A4038BDD09238162D17E6A09B4986A863A3D8416C5214C9830C196A90D
          3824F8819353C65A2D82AAFEE28B2FB0716A090EAF51A346C9C9C9D6B687DCD8
          681A9D6826FE579F3E7D2223236D89861E93274FB638EF4C01F685B48BEC2F03
          83FA2A2056870E1DA4A9DFD9B367275DD0CEE3D101DD91A68A8989517E92B688
          0FA4DD0D108BEE4470110B7157104B9ABA8E427023B367CF16F5A6468D1A648E
          C88CB59CCE647EDA88334114C50926B4FA1F66A8251C818844D5A9256482387A
          6B8F52A0147D1EED242EC330F1BF0A162CC8BEF08133262626962A554AF18B5A
          78B01174D6FE07B4E5BFC68D1B97F967A25C04E64C3A0B5E72FBF6EDE91ACC3D
          71E2040AA74C9B41AEB66DDBE6CE6FD859D4692E9BAC503BB2F0E4C9139C0D61
          517C439514923EDFA3470F8BF6833885A22C5CB850E5074D86E924D9442677ED
          DA256E3C65CA1475C949825D8B162DC4E95F225090254B9628D9FAC1830739A0
          34480EE16835C88ADFC28A589B0FE7411A72FCF871A9B450A1425C744848885D
          E66752599874C2B358488425F0D3396C3C08EC1C3870A0920FE26D67CE9C6971
          5D03F701ED4D1AA5EAAB027A29C42A5CB8B0767BDA8F0A97422794A221A097F4
          151D0469CE9C3970455D708B2D070F1E8CC0D064C818FA276E1F141484682962
          46D895C6A844409AD8D858659EF1EDDBB71B366C28454315952B57A64DC5B02E
          C2834E2FE583987F3490186CAFE70C283CE287C08885B973E78E8F8FAF59B3A6
          8D074178DBB66DAB7841EE162548D77887F361F1DDAFB265CB422CEDB35405A7
          4E9D422194D44405D21E1111212DBFF6F5D75FD3576FDEBCA9FCA4A56015F114
          7A51C841A4B7A86965340C87071538148CB17801F4765C6CEBD6ADD512D2088B
          2BBCE5CB976FC58A153A2B31FD77169E3ABD097D6BDCB831F9857D4786E8555C
          EB8E1D3BC4C237DE7883F4D8C6619B3B77EE20B9CA2803710419B05DEA5C058B
          06804E4B0FB1F6B6AA7652900268816D50E33E711305C206A91BD06AAB57AF56
          7A1AA28092498244CBC2367252D44867B492C31207C5C84BBC43141E3E7C286E
          06D7213111436758C40329234730992374B76EDDD8C1EE0B2F91EFB46CD9920C
          4E2C446CB9E8F7DF7F3FCDDDA96E1272EA0B19E7225172DBC77F5D082E9B26D9
          BA75AB5858BE7C79888505B6B697368A291047BD497AE09F3A168078C0456514
          E0E4C993A8484A4A8AFEB5797B7BF32FDA291662C3E906D2183D6DF7C9279F88
          8FE390DBB0B030A2B6FE37EE3CC8506EDCB8810612CBB92B474C347BF6EC59F3
          E6CDA5AF7750B954B12DAFA020CE08B26221D1ADC58B17BBFCCD1C48836CA00A
          04746B3376D069BA9364A22B56AC88EEEA04716BA18743115539178725BF1347
          CCA1EFDAB56B95571B7AF6ECC9DF3973E6FCCD0C8BA7C0E7A17FC9C9C9E27C7C
          6E64DEBC79169FB0912D919FE25BD0A72A55AA74EDDAB556AD5A690EE17ABCF9
          E69B18974993260D1830C041B39A48A79B356BA60E972B501FC7EAEF4B724E3D
          2ACFAD903782A06B33411C0C22442D5FBE7C1962952C5992788748681337BA13
          D147BAEB4A952A516271150D9339C691AF49BB28A856AD1A27C53F60A5FDFCFC
          D4374A6860BC8E329480AEA02E5C497878388496EC9D029A98DC13BDC158FBFA
          FA2A2E885D10A111234658230061FDFEFDFBCA6C721B9F0A7890CDD2545C90E3
          BEDE494F6AD2A489B856A2C96C9528D167C9E9D3A7A9322CADC99C7BAF5CB912
          DBEEA08B4C13D0888E3E7EFC78C28D386EA4180EE29434E0044B4880A4F7EBC9
          A43000D63E6679E0C00194497A7D5241F5EAD52156DEBC79D1957EFDFAA9E588
          F7EEDDBBC9818886FDFBF7C7959342723D9874C2A53AA0AF2220200022B217B7
          3079F2E4C8C848E4931DAD0D6A64181E9C1B9E3A746A2F55ECEFEF7FE8D021B1
          106F07B1749EE75FBA7409CFA74C092240D30B2D2E4C6D5F10E3D0516AA37EFD
          FA52528C3BC6AE6A17813199E72A11E8A5C4FBC18307740369B88850C2961689
          45431065A4E10915108244984BEAD2A50B57A29673A9881C810CD2DFBB778F1A
          2385843738878E1D3B4A99388198404966AAFC4453A964C84AD4B2FB4C43672C
          63F4F8F163FAAEB818B5C9FCD40C62F1AFC55D906868A4F87D4F4FCFE1C3878F
          19332633A3FF36222E2E8EB6295CB8B034A90D7ED0B4DA99240AC8F2F08BE2F4
          4B93792D3F1F1F1F44572C240B8658165F4F428F7BF7EEADD51805C42FBC0AD9
          19645527DB4820F22E5BB64C1D2463B34E9D3AA9AFF8229673E7CEC51E39BA0E
          15388358F41EAA439989AB42FBD44C05ACC20428C313C417549A44C90986FDFA
          F5EBB8A5E3C78F4329AEAD54A9524A394190EB9126C088C0294244693C9DAC1E
          D9BB70E18258A85A25E90867CF9E85B8E7CF9FB7787CF2B59D3B77F22F0E8F63
          5A9C874234849A92B520102F59B204B2A2947841673E577506B12C06056B0F37
          10673223756C8234101FA0B34C991D3165CA9451A3465121C58B172704ABCD70
          E7CE9D0F3EF8E0CC9933D676249B9E316386E4B1C8F9218194F9432C148BE823
          16E28BBB77EF8E585A3C38C18EA44C196B80ACDEDEDE5AFEA146681599817677
          6540CBF973EA9D412CDC6883060DC4055E4DE65E0EB1A431330207AC52A66083
          D6AD5BE355ED35679736C69D6028893852D39ACC1372C8309409B4500AC55227
          17DCB871038A88CB4688A851A3C6BA75EBB4533F687E48208D46AA1E5C2D21E1
          1F376E1CD4B1B652015D6BE1C2858AC8A13DB87B65B2BC8A7AF5EAD1F7DC6D31
          3A67108B1E498F573FD2A7403B5408CF484E952753F47E58457DD96B0D3B8248
          505010993CC9EF860D1B30BCD2066895BA78BA14A6B543477FD69D8747EDDAB5
          B9488BC3BC494949742769A9192C0E499CB8DA25391AE6C9DAA4176C132158AC
          84E5CB97D3F7948978D8031C3A69A076A54697C319C4C2C6422CE959268D812F
          5146746839B295D1A3472BCF00D06DEA6BD6AC59161FD6660C340F4265ED4559
          E4AA71E3C63FFCF083F213A702B144A5444A4909496C955953A411A85AFBF6ED
          398EB51757D8985C988C582C84D09B366D52878BD09EE0E060EDB72714E0FDA1
          91648CA05474743496AB489122F43D44D171E34499813388458ACEFDE34FC542
          75EA3E649A39732616416903DA8CD61A3F7EBCB5514409788873E7CE61897072
          BEBEBE161F3E12653A77EEACAE923067CE9C8103078A1B703AE291FAD3E21C04
          9279F20F022242456393BAEB67E9E4FF34BC34FC3D71E244F51556241C1195AA
          4505411302599BB3F4FCF973BC97CE542D97C319C4BA7DFB36C4A2F9C5C27CF9
          F2117AA81DB484A8A15C068523478EECD7AF9F8D2B13B117A164CC9831CA8C00
          9A61F3E6CDDAF520AE5EBD0AE7D4044D9A2188AFC25D89E99BFE1C041B418E86
          1A89D54B9AB965CB1665180975E47F553729C1CBCB0B56B9F97A85FA7006B1AC
          E5329E9E9EBF9BA1FC24004D9D3A95845F67B49604EDF0E1C370946842A8A279
          3EFFFC73711288C5F52062636303030355F140BDA2A2A2D4EEAE7D5F39CD47C5
          B680637264F527912B22224259198B0AE9D5AB97F47C5A050E8FDEA2FF8501F7
          873388A533FAA20086617168099DD48670B66DDB369887BC29B3DB6086F6E247
          8C18217DE08F1D7BF4E821BE2D4DB8C4412BA1569AD8A440FF899E2D80C47048
          1941205C92391204319A5C33769E1CC5E2FB552633FF962C5922CE4F7F49E10C
          6211A72096B55761A94AD2A29090106B4FD04C66722C5AB408772225595A606B
          48DFC4A51CBEFBEEBB468D1A894B6AE5CA950BBF858F46F0BA75EB263DC43499
          1FBCE0FF32B3A05E6A6A2AD29B909050A64C19324ACEC26D9ACC0F21860F1F2E
          CE2716C11911E00CBCC4EB867006B1B038104BBB1804E1CCCFCF2F2C2CAC66CD
          9AFA23786BD6AC21C756DFBF33FDBFF592F2E6CD8B4D51A7E79ACCF1144E88E9
          B7B4EC91028C0EAA40BCB338F51B8141D2B4635DE902DE9CBC048F5FAC583125
          ECC2B6B163C7923A683FBD64324F31C0742266EEB924537AE10C62210C104B19
          4A5041B351CB04A934DB8FB66FD7AEDD952B57D492DCB9730F1A34089DA3A988
          2F629025A98485EA7BB0CA0739A4BC214DD4AE5DFBCB2FBFB4EFB7559E3D7B06
          C5A74F9F2E7603159049995BEC9E63071980C3894585621A860E1D2A2DAB8CA9
          FAE28B2FD29CAA814A114A449F4BC2881BEBDFBF3FA2959C9C4CBA2739A48080
          001C4C8E1C39303AC41D1422BDD75CB76EDD5DBB76D971CD5CC83463C60C04C9
          E21BC626F3E72A222323DD7635DB0CC081C442F08F1E3DFAD9679F6DDFBE5DFB
          05800E1D3A202D693EC3C25AC121713428343474DAB469CA4C0748A35DBA0D42
          84878763B6A0D7B871E374DEE4847C6CF6EDB7DF4ACF017D7C7CB86669B183CC
          60DEBC79742D6B3317E81BE416B6AF10F452C021C4E298E7CF9F5FB060011ED9
          E2042693798589D5AB57EB0FF1695F38215F43BD94872DE404F824E9499102C2
          6BD1A2455352525088B7DE7A0B3D80A0E23ADE0A3A75EAB47CF9F2888808E9B5
          4CFDEF28A517584CACA4F4E11315E5CB97A783B9D55702EC02FB130B36AC5CB9
          72F1E2C5EA13128B080A0A62337D6245474777EFDE5D7C3A3B73E6CC21438628
          7F1310C78C19A37FFD7897D9B367F7E9D3474DFE55BCF3CE3BB1B1B1E5CA9543
          53A58178B2C82D5BB6D86BFA17C944F3E6CD2DCA15A922F798AED7C15F16D893
          588F1E3DA2F14898D1983457C225A9D65F8984488AAA8913B76986F8F878653E
          DDB163C7DAB4690389C9EF60B036D42AA0CDD6AD5B57A040018ED3A54B17B575
          0B162C8886E1C64CE6A55055B22AB0EFBAA63B77EE6CD5AA95D6B3136A09D9EE
          BCA84966601F62410252771CCFDEBD7B6DFCF6497070B0B46296042208199F38
          5985088590D01E77EFDE8525D8A0860D1B12703161349EF608B8969898983A75
          EA98CCF3EE7163A411309E28498206B31587272EAEA7C0BEEB9AD2CDB872E92B
          434835978DA37F65D24009F621D6D2A54B31A716DF02B006629CB4C69F84AFBE
          FACADFDF5FB4DEBD7AF542661E3E7CF8E9A79FCE9D3B9758863BA952A50A21B5
          478F1ED2E3DEDCB9734374CAD592FBF7EFC3339C198254BD7A75356FD0AE6D8C
          92B1A5BDC693486C49810F1F3E2C16D267B87865D4F495841D88C5116089BEFC
          68817186103A5921C1A85DBB76E258E23FFFF9CF90909038330A172E8CEF563E
          F100A1030303C537F8F2E4C93376EC581B5F689B3061021B8B259C97006AC759
          9753A74E0D0B0B537F22A51B366CA85DBBB6BD8EEF86B08F6291B14F9C381103
          240E8EEBA3448912187C127B6B6D8FB3C6718BCEDDC30C6299F6D1C789132720
          371922F10B3F4E96F7E1871FDA6892B40FA16DC958D385EFBFFFBE4993264A58
          4708A74D9B26B9BA570F7633EF24F6478F1E4545B03E3ACBB889C053376BD60C
          42D4A851436B3508854410ED42F3F9F2E58307785E2954D16CFBF6EDCB9F3F7F
          AD5AB5D235EF54BBB65D9A894506A02EA9405F2293C8E4D409F7879D871B303A
          88475454D4E6CD9B6D592AD764260A04C20C111AC4A123DC2E59BAF4D258E9D2
          A561156A64C7076AB843E95BBADDBA755BB66C991DABC5649E46CB89AE5CB942
          DE60FB1A3B2F2F1C32404AFC3A73E60C168ADC8AE4CE9653E4CD9BD7CFCFAF67
          CF9E75EBD65587BC113F4C1547202A152A54089E8586864AAFEF651EDAD5D895
          2CC1EED582A86319EDFB08D26DE1C0473AC83EDE02B3B260C1021B8323954E66
          8E7A797B7BE7CA958B6B3B75EA1431315BB66C55AB56C53C39E29D55ED6AEC7D
          FAF4914A0CA4170E7F08CDF1C9E7C5B99469024A412CD4AB4183064EE8DFDAAF
          66B8F3A7EA5E163863DACCDEBD7B31E9D61EC15A0301B15EBD7AA81721329353
          A3F4C12924473568D0208B8B5419B01DCE20D6C18307FDFDFDAD3D75D10776BE
          4E9D3A648E187C9D29A699417070B094030E1B366CFAF4E98EAE96571BCE2056
          626262D3A64DB58A4566870FB3E502B267CF5EA3460DA485E3D877E9518BABB1
          878585A92FAF1AC8189C41AC848404123A698E5BA54A95860C1972F6ECD99898
          98CB972FDB72198A8547BD5AB46861AFD51C2CAE6DECCE5F147B59E00C62EDDA
          B5AB65CB96D2E3FD091326E0E839FBA54B97D6AE5D8B665CBC78D196AF0367CD
          9AB572E5CA5DBB766DD5AA55E65F957EF1E245FBF6ED636363B5D7E6E86A79B5
          E10C62597C27585CAD956B484949413656AD5A75EEDC391B3F3E5DA14205E815
          1010909955432CAE412F2EB76F20637006B168361A4F7A35C5E2C7EFAE5DBBB6
          69D326ACF4E9D3A7ADADBE220297E6E5E585FBEED0A143C6660A4077480FF5C5
          C2193366481F0937905E388358DAC7C926DDAF2ADEBA752B2E2E6EC58A154949
          4916DF949290254B965AB56ACD9F3F3F034BF910A0716CD252E1DAC51D0CA417
          CE2016310E832C05B8343F617FE7CE9D2D5BB62C5FBEFCF8F1E3165F99920015
          32F0420E2945B366CDF6ECD923164646468A0BC81AC8009C412CBC79505090F4
          3D2A04A94B972E69EE7BEFDEBD1D3B762C5BB6ECF0E1C3FA7353333646909A9A
          DAA449136929FD8C7D05DD800867106BE5CA951287F2E7CF4FAA58BD7A751B8F
          F0E0C183DDBB772F5DBAF4E0C1831647F00B152AB475EBD60CCC1AB0B8A2F392
          254BC4A9A706320067108B70267DADBE4D9B362480E97D23F4F1E3C7C42CE895
          9898282D6846E4220E666096FAA3478FFCFCFC8E1C392216A2A624048EAE9657
          1BCE20D6E2C58BC5A5852A55AA14151555B162C58C1DEDE9D3A7FBF7EF2738C6
          C7C72B1F0FC2B9AF59B326631F80E508BEBEBEE20A0E84692496D8EDE86A79B5
          E10C6291AFF5EDDBD7645E4DA579F3E698A1CC7F5D0CD38DCC101F49093FFAE8
          23ED626B3642BBF02E075CBD7A756060A0A3ABE5D5863388151D1DBD68D1A2BA
          75EB927F55AB56CDAD3E3A4F72E0E3E323AE8F0AB1D6AF5FDFB66D5B575FDACB
          0D277D4080B3E4C993C70DD7CCD4122B6BD6ACB1B1B128ABAB2FEDE5863388E5
          CE5056A4D9BC79B3427A6AE3DD77DF455FDD7081EB970BFFD78965320F65A15B
          6A3DA0ACAFD27242AE82412C030E81412C030E81412C030E81412C030E81412C
          030E81412C030E81412C030E81412C030E81412C030E81412C030E81412C030E
          81412C030E81412C030E81412C030EC1FF0056F4E421B3A73FE7000000004945
          4E44AE426082}
        Scaled = True
        Transparent = False
      end
      object RLLabel43: TRLLabel
        Left = 89
        Top = 32
        Width = 368
        Height = 15
        Align = faClientLeft
        Caption = 'FONE: 3626-2588 CEL: 991323010 BOA VISTA - RR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel44: TRLLabel
        Left = 89
        Top = 47
        Width = 128
        Height = 17
        Align = faClientLeft
        Caption = 'Obs: 991114141 '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
    object RLBand18: TRLBand
      Left = 8
      Top = 143
      Width = 748
      Height = 53
      AutoSize = True
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      Borders.Width = 2
      Borders.FixedTop = True
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      object rlcliente: TRLLabel
        Left = 0
        Top = 5
        Width = 336
        Height = 16
        Caption = 'Cliente:  FRIOS RIO BRANCO IMP E EXP LTDA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object rlcpf: TRLLabel
        Left = 485
        Top = 5
        Width = 240
        Height = 16
        Caption = 'CPF/CNPJ: 06.218.522/0001-40 '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object rlende: TRLLabel
        Left = 0
        Top = 21
        Width = 360
        Height = 16
        Caption = 'Ende...:  RUA APOCALIPSE, 35, CINTURAO VERDE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object rlinsc: TRLLabel
        Left = 500
        Top = 21
        Width = 192
        Height = 16
        Caption = 'Insc. Est...: 240132232'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object rlOBS_Cliente: TRLLabel
        Left = 2
        Top = 37
        Width = 203
        Height = 14
        Caption = 'Obs....: TESTE DE OBSERVA'#199#195'O'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object rlFoneCel: TRLLabel
        Left = 460
        Top = 37
        Width = 252
        Height = 16
        Caption = 'Fone: 95 991715639 Cel: 95991715639'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
    object RLBand13: TRLBand
      Left = 8
      Top = 196
      Width = 748
      Height = 22
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.Width = 2
      Borders.Style = bsCross
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      object RLLabel30: TRLLabel
        Left = 3
        Top = 3
        Width = 40
        Height = 16
        Caption = 'C'#243'd.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel31: TRLLabel
        Left = 445
        Top = 3
        Width = 48
        Height = 16
        Caption = 'Unid.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel32: TRLLabel
        Left = 564
        Top = 3
        Width = 96
        Height = 16
        Caption = 'Pre'#231'o Unit.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel33: TRLLabel
        Left = 697
        Top = 3
        Width = 48
        Height = 16
        Caption = 'Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel51: TRLLabel
        Left = 510
        Top = 3
        Width = 56
        Height = 16
        Caption = 'Quant.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel52: TRLLabel
        AlignWithMargins = True
        Left = 49
        Top = 4
        Width = 80
        Height = 16
        Caption = 'Descri'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
    object RLBand15: TRLBand
      AlignWithMargins = True
      Left = 8
      Top = 218
      Width = 748
      Height = 19
      AlignToBottom = True
      AutoExpand = False
      AutoSize = True
      Borders.Style = bsClear
      Computable = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      BeforePrint = RLBand7BeforePrint
      object RLDBText12: TRLDBText
        Left = 3
        Top = 3
        Width = 32
        Height = 16
        Margins.Left = 2
        Alignment = taRightJustify
        DataField = 'cod'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText13: TRLDBText
        Left = 51
        Top = 3
        Width = 388
        Height = 14
        AutoSize = False
        DataField = 'nome'
        DataSource = DataSource1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLDBText14: TRLDBText
        Left = 518
        Top = 3
        Width = 48
        Height = 16
        Alignment = taRightJustify
        DataField = 'quant'
        DataSource = DataSource1
        Text = ''
        Transparent = False
      end
      object RLDBText15: TRLDBText
        Left = 596
        Top = 3
        Width = 64
        Height = 16
        Alignment = taRightJustify
        DataField = 'p_venda'
        DataSource = DataSource1
        DisplayMask = '#,###,###0.00'
        Text = ''
      end
      object RLDBText16: TRLDBText
        Left = 453
        Top = 3
        Width = 28
        Height = 16
        Alignment = taCenter
        DataField = 'unid'
        DataSource = DataSource1
        Text = ''
        Transparent = False
      end
      object RLDBText17: TRLDBText
        Left = 697
        Top = 3
        Width = 48
        Height = 16
        Alignment = taRightJustify
        DataField = 'total'
        DataSource = DataSource1
        DisplayMask = '#,###,###0.00'
        Text = ''
      end
    end
    object RLBand16: TRLBand
      Left = 8
      Top = 287
      Width = 748
      Height = 85
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedBottom = True
      object RLLabel53: TRLLabel
        Left = 473
        Top = 9
        Width = 177
        Height = 15
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Sub-Total...........................:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial Rounded MT Bold'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel54: TRLLabel
        Left = 473
        Top = 23
        Width = 180
        Height = 15
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Desconto...........................: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial Rounded MT Bold'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel55: TRLLabel
        Left = 473
        Top = 37
        Width = 176
        Height = 15
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Total..................................:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial Rounded MT Bold'
        Font.Style = []
        ParentFont = False
      end
      object rlsubtotal: TRLLabel
        Left = 714
        Top = 9
        Width = 31
        Height = 15
        Alignment = taRightJustify
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = '0,00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial Rounded MT Bold'
        Font.Style = []
        ParentFont = False
      end
      object rldesconto: TRLLabel
        Left = 714
        Top = 23
        Width = 31
        Height = 15
        Alignment = taRightJustify
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = '0,00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial Rounded MT Bold'
        Font.Style = []
        ParentFont = False
      end
      object rltotal: TRLLabel
        Left = 714
        Top = 37
        Width = 31
        Height = 15
        Alignment = taRightJustify
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = '0,00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial Rounded MT Bold'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel45: TRLLabel
        Left = 5
        Top = 37
        Width = 93
        Height = 15
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Total M3: 0,00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial Rounded MT Bold'
        Font.Style = []
        ParentFont = False
      end
      object RLDraw14: TRLDraw
        Left = 0
        Top = 50
        Width = 748
        Height = 15
        DrawKind = dkLine
      end
      object RLLabel46: TRLLabel
        Left = 3
        Top = 63
        Width = 135
        Height = 15
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Vendedor: 3-Wagner'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial Rounded MT Bold'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel47: TRLLabel
        Left = 300
        Top = 63
        Width = 94
        Height = 15
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Recebido Por:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial Rounded MT Bold'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLBand19: TRLBand
      Left = 8
      Top = 237
      Width = 748
      Height = 50
      AutoExpand = False
      Background.Align = faNone
      Background.Arrange = baCenter
      Background.AutoSize = False
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedBottom = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      IntegralHeight = False
      ParentFont = False
      BeforePrint = RLBand19BeforePrint
      object RLMemo6: TRLMemo
        AlignWithMargins = True
        Left = 0
        Top = 1
        Width = 748
        Height = 48
        Align = faClient
        Behavior = [beSiteExpander]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier'
        Font.Style = []
        Lines.Strings = (
          'teste'
          'teste1'
          'teste2'
          'teste3'
          'teste4'
          'teste5'
          'teste6'
          'teste7'
          'teste8')
        ParentFont = False
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 224
    Top = 32
  end
  object DataSource1: TDataSource
    Left = 696
    Top = 160
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2016 F' +
      'ortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 648
    Top = 184
  end
  object RLPreviewSetup1: TRLPreviewSetup
    Left = 448
    Top = 332
  end
end

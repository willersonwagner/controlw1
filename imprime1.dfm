object imprime: Timprime
  Left = 482
  Top = 147
  Caption = 'imprime'
  ClientHeight = 741
  ClientWidth = 858
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
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
    AfterPrint = RLReport2AfterPrint
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
    AfterPrint = RLReport2AfterPrint
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
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 224
    Top = 32
  end
  object DataSource1: TDataSource
    Left = 696
    Top = 264
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2016 F' +
      'ortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 688
    Top = 192
  end
  object RLPreviewSetup1: TRLPreviewSetup
    Left = 512
    Top = 404
  end
end

object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 443
  Width = 797
  object ds1: TDataSource
    DataSet = IBselect
    Left = 248
    Top = 322
  end
  object entrada: TDataSource
    DataSet = IBQuery2
    Left = 312
    Top = 322
  end
  object IBSQL: TIBSQL
    Left = 216
    Top = 7
  end
  object ds: TDataSource
    DataSet = IBQuery1
    Left = 192
    Top = 322
  end
  object Dsformpagto: TDataSource
    DataSet = formpagttable
    Left = 352
    Top = 220
  end
  object dsprod: TDataSource
    DataSet = produto
    Left = 416
    Top = 217
  end
  object dsprodtemp: TDataSource
    DataSet = produtotemp
    Left = 472
    Top = 217
  end
  object IBTable1: TIBTable
    BufferChunks = 1000
    CachedUpdates = False
    UniDirectional = False
    Left = 112
    Top = 8
  end
  object ACBrNFe: TACBrNFe
    OnStatusChange = ACBrNFeStatusChange
    Configuracoes.Geral.SSLLib = libCapicom
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.ValidarDigest = False
    Configuracoes.Geral.ModeloDF = moNFCe
    Configuracoes.Geral.AtualizarXMLCancelado = True
    Configuracoes.WebServices.UF = 'RR'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.Tentativas = 1
    Configuracoes.WebServices.QuebradeLinha = '|'
    Left = 736
    Top = 224
  end
  object ACBrNFeDANFeESCPOS1: TACBrNFeDANFeESCPOS
    MostrarPreview = True
    MostrarStatus = True
    TipoDANFE = tiSemGeracao
    NumCopias = 1
    ImprimeNomeFantasia = False
    ImprimirDescPorc = False
    ImprimirTotalLiquido = True
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    CasasDecimais.Formato = tdetInteger
    CasasDecimais._qCom = 2
    CasasDecimais._vUnCom = 2
    CasasDecimais._Mask_qCom = '###,###,###,##0.00'
    CasasDecimais._Mask_vUnCom = '###,###,###,##0.00'
    ExibirResumoCanhoto = False
    FormularioContinuo = False
    TamanhoFonte_DemaisCampos = 10
    ProdutosPorPagina = 0
    ImprimirDetalhamentoEspecifico = True
    NFeCancelada = False
    ImprimirItens = True
    ViaConsumidor = True
    TamanhoLogoHeight = 0
    TamanhoLogoWidth = 0
    RecuoEndereco = 0
    RecuoEmpresa = 0
    LogoemCima = False
    TamanhoFonteEndereco = 0
    RecuoLogo = 0
    TributosSeparadamente = False
    ImprimeEmUmaLinha = False
    ImprimeDescAcrescItem = False
    PosPrinter = ACBrPosPrinter1
    Left = 736
    Top = 368
  end
  object ACBrIBPTax1: TACBrIBPTax
    ProxyPort = '8080'
    Left = 736
    Top = 320
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 616
    Top = 216
  end
  object ACBrETQ1: TACBrETQ
    Porta = 'LPT1'
    Left = 666
    Top = 124
  end
  object DANFE: TACBrNFeDANFCeFortes
    PathPDF = 'C:\Program Files (x86)\Borland\Delphi7\Bin\'
    MostrarPreview = True
    MostrarStatus = True
    TipoDANFE = tiNFCe
    NumCopias = 1
    ImprimeNomeFantasia = False
    ImprimirDescPorc = False
    ImprimirTotalLiquido = True
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    CasasDecimais.Formato = tdetInteger
    CasasDecimais._qCom = 2
    CasasDecimais._vUnCom = 2
    CasasDecimais._Mask_qCom = '###,###,###,##0.00'
    CasasDecimais._Mask_vUnCom = '###,###,###,##0.00'
    ExibirResumoCanhoto = False
    FormularioContinuo = False
    TamanhoFonte_DemaisCampos = 10
    ProdutosPorPagina = 0
    ImprimirDetalhamentoEspecifico = True
    NFeCancelada = False
    ImprimirItens = True
    ViaConsumidor = True
    TamanhoLogoHeight = 0
    TamanhoLogoWidth = 0
    RecuoEndereco = 0
    RecuoEmpresa = 0
    LogoemCima = False
    TamanhoFonteEndereco = 0
    RecuoLogo = 0
    TributosSeparadamente = False
    Left = 736
    Top = 272
  end
  object ACBrPosPrinter1: TACBrPosPrinter
    ConfigBarras.MostrarCodigo = False
    ConfigBarras.LarguraLinha = 0
    ConfigBarras.Altura = 0
    ConfigBarras.Margem = 0
    ConfigQRCode.Tipo = 2
    ConfigQRCode.LarguraModulo = 4
    ConfigQRCode.ErrorLevel = 0
    LinhasEntreCupons = 0
    Left = 736
    Top = 8
  end
  object ACBrNFeDANFeRL1: TACBrNFeDANFeRL
    MostrarPreview = True
    MostrarStatus = True
    TipoDANFE = tiRetrato
    NumCopias = 1
    ImprimeNomeFantasia = False
    ImprimirDescPorc = False
    ImprimirTotalLiquido = True
    MargemInferior = 0.700000000000000000
    MargemSuperior = 0.700000000000000000
    MargemEsquerda = 0.700000000000000000
    MargemDireita = 0.700000000000000000
    CasasDecimais.Formato = tdetInteger
    CasasDecimais._qCom = 4
    CasasDecimais._vUnCom = 4
    CasasDecimais._Mask_qCom = '###,###,###,##0.00'
    CasasDecimais._Mask_vUnCom = '###,###,###,##0.00'
    ExibirResumoCanhoto = False
    FormularioContinuo = False
    TamanhoFonte_DemaisCampos = 10
    ProdutosPorPagina = 0
    ImprimirDetalhamentoEspecifico = True
    NFeCancelada = False
    ImprimirItens = True
    ViaConsumidor = True
    TamanhoLogoHeight = 1
    TamanhoLogoWidth = 1
    RecuoEndereco = 0
    RecuoEmpresa = 0
    LogoemCima = False
    TamanhoFonteEndereco = 0
    RecuoLogo = 0
    TributosSeparadamente = False
    LarguraCodProd = 54
    ExibirEAN = False
    QuebraLinhaEmDetalhamentoEspecifico = True
    ExibeCampoFatura = False
    ImprimirUnQtVlComercial = iuComercial
    Left = 664
    Top = 64
  end
  object ACBrConsultaCNPJ1: TACBrConsultaCNPJ
    ProxyPort = '8080'
    PesquisarIBGE = False
    Left = 664
    Top = 8
  end
  object ACBrCargaBal1: TACBrCargaBal
    Modelo = modFilizola
    Left = 736
    Top = 168
  end
  object ACBrCEP1: TACBrCEP
    ProxyPort = '8080'
    WebService = wsCorreios
    PesquisarIBGE = True
    Left = 736
    Top = 56
  end
  object ACBrNFeDANFEFR1: TACBrNFeDANFEFR
    Sistema = 'ControlW Sistemas'
    MostrarPreview = True
    MostrarStatus = True
    TipoDANFE = tiSemGeracao
    NumCopias = 1
    ImprimeNomeFantasia = False
    ImprimirDescPorc = False
    ImprimirTotalLiquido = True
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    CasasDecimais.Formato = tdetInteger
    CasasDecimais._qCom = 2
    CasasDecimais._vUnCom = 2
    CasasDecimais._Mask_qCom = ',0.00'
    CasasDecimais._Mask_vUnCom = ',0.00'
    ExibirResumoCanhoto = False
    FormularioContinuo = False
    TamanhoFonte_DemaisCampos = 10
    ProdutosPorPagina = 0
    ImprimirDetalhamentoEspecifico = True
    NFeCancelada = False
    ImprimirItens = True
    ViaConsumidor = True
    TamanhoLogoHeight = 0
    TamanhoLogoWidth = 0
    RecuoEndereco = 0
    RecuoEmpresa = 0
    LogoemCima = False
    TamanhoFonteEndereco = 0
    RecuoLogo = 0
    TributosSeparadamente = False
    EspessuraBorda = 1
    ExibirTotalTributosItem = False
    ExibeCampoFatura = True
    TributosPercentual = ptValorProdutos
    ImprimirUnQtVlComercial = iuComercial
    Detalhado = False
    DescricaoViaEstabelec = 'Via do Consumidor'
    ExpandirDadosAdicionaisAuto = False
    ImprimirDadosArma = True
    QuebraLinhaEmDetalhamentoEspecifico = True
    IncorporarBackgroundPdf = True
    IncorporarFontesPdf = True
    Left = 736
    Top = 112
  end
  object FDPhysOracleDriverLink1: TFDPhysOracleDriverLink
    Left = 312
    Top = 376
  end
  object bd1: TFDConnection
    ConnectionName = 'bd'
    Params.Strings = (
      'Database=c:\controlw\bd.fdb'
      'User_Name=sysdba'
      'Password=masterkey'
      'Port=3050'
      'DriverID=FB')
    TxOptions.AutoStop = False
    LoginPrompt = False
    Left = 40
    Top = 272
  end
  object IBTransaction1: TFDTransaction
    Options.AutoStop = False
    Connection = bd1
    Left = 104
    Top = 272
  end
  object IBQuery1: TFDQuery
    AfterOpen = IBQuery1AfterOpen
    AfterPost = IBQuery1AfterOpen
    Connection = bd1
    Transaction = IBTransaction1
    SQL.Strings = (
      
        'select f.codpro, p.descpro01, sum(f.qtde) as quant from sgs.food' +
        'histpro f left join sgs.cadpro p on (p.codpro01 = f.codpro) grou' +
        'p by codpro, p.descpro01')
    Left = 192
    Top = 272
  end
  object IBselect: TFDQuery
    AfterOpen = IBselectAfterOpen
    Connection = bd1
    Transaction = IBTransaction2
    Left = 248
    Top = 272
  end
  object IBQuery2: TFDQuery
    AfterOpen = IBQuery2AfterOpen
    Connection = bd1
    Transaction = IBTransaction3
    Left = 312
    Top = 272
  end
  object IBTransaction2: TFDTransaction
    Options.AutoStop = False
    Connection = bd1
    Left = 104
    Top = 368
  end
  object IBTransaction3: TFDTransaction
    Options.AutoStop = False
    Connection = bd1
    Left = 104
    Top = 320
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 192
    Top = 376
  end
  object formpagttable: TFDQuery
    AfterOpen = formpagttableAfterOpen
    Connection = bd1
    Transaction = IBTransaction1
    SQL.Strings = (
      
        'select f.codpro, p.descpro01, sum(f.qtde) as quant from sgs.food' +
        'histpro f left join sgs.cadpro p on (p.codpro01 = f.codpro) grou' +
        'p by codpro, p.descpro01')
    Left = 352
    Top = 168
  end
  object produto: TFDQuery
    AfterOpen = produtoAfterOpen
    AfterPost = produtoAfterOpen
    Connection = bd1
    Transaction = IBTransaction2
    Left = 416
    Top = 168
  end
  object produtotemp: TFDQuery
    AfterOpen = produtotempAfterOpen
    Connection = bd1
    Transaction = IBTransaction3
    Left = 472
    Top = 168
  end
  object IBQuery4: TFDQuery
    AfterOpen = IBQuery4AfterOpen
    Connection = bd1
    Transaction = IBTransaction1
    SQL.Strings = (
      
        'select f.codpro, p.descpro01, sum(f.qtde) as quant from sgs.food' +
        'histpro f left join sgs.cadpro p on (p.codpro01 = f.codpro) grou' +
        'p by codpro, p.descpro01')
    Left = 344
    Top = 16
  end
  object IBQuery3: TFDQuery
    AfterOpen = IBQuery3AfterOpen
    Connection = bd1
    Transaction = IBTransaction2
    Left = 408
    Top = 16
  end
  object ProdutoQY: TFDQuery
    AfterOpen = ProdutoQYAfterOpen
    Connection = bd1
    Transaction = IBTransaction3
    Left = 464
    Top = 16
  end
  object queryCupons: TFDQuery
    Connection = bd1
    Transaction = IBTransaction3
    Left = 352
    Top = 88
  end
  object FDTable1: TFDTable
    AutoCalcFields = False
    Connection = bd1
    Transaction = IBTransaction1
    UpdateOptions.UpdateTableName = 'CONTASRECEBER'
    TableName = 'CONTASRECEBER'
    Left = 424
    Top = 288
    object IBTable1CODGRU: TIntegerField
      DisplayLabel = 'CAIXA'
      FieldName = 'CODGRU'
    end
    object IBTable1VENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object IBTable1DOCUMENTO: TIntegerField
      FieldName = 'DOCUMENTO'
    end
    object FDTable1HISTORICO: TStringField
      FieldName = 'HISTORICO'
      Origin = 'HISTORICO'
      Size = 35
    end
    object IBTable1TOTAL: TIBBCDField
      FieldName = 'TOTAL'
      Visible = False
      Precision = 18
      Size = 2
    end
    object IBTable1CODHIS: TIntegerField
      FieldName = 'CODHIS'
      Visible = False
    end
    object IBTable1PAGO: TIBBCDField
      FieldName = 'PAGO'
      Visible = False
      Precision = 18
      Size = 2
    end
    object IBTable1FORNEC: TIntegerField
      FieldName = 'FORNEC'
      Visible = False
    end
    object IBTable1USUARIO: TIntegerField
      FieldName = 'USUARIO'
      Visible = False
    end
    object IBTable1VENDEDOR: TIntegerField
      FieldName = 'VENDEDOR'
      Visible = False
    end
    object IBTable1DATAMOV: TDateField
      FieldName = 'DATAMOV'
      Visible = False
    end
    object IBTable1FORMPAGTO: TSmallintField
      FieldName = 'FORMPAGTO'
      Visible = False
    end
    object IBTable1PREVISAO: TDateField
      FieldName = 'PREVISAO'
      Visible = False
    end
    object IBTable1VALOR: TIBBCDField
      FieldName = 'VALOR'
      Visible = False
      Precision = 18
      Size = 2
    end
    object IBTable1CONT: TSmallintField
      FieldName = 'CONT'
      Visible = False
    end
    object IBTable1DATA: TDateField
      FieldName = 'DATA'
      Visible = False
    end
    object IBTable1COD: TIntegerField
      FieldName = 'COD'
      Visible = False
    end
    object IBTable1ValorCalc: TCurrencyField
      DisplayLabel = 'VALOR'
      FieldKind = fkCalculated
      FieldName = 'ValorCalc'
      Required = True
      DisplayFormat = '#,###,###0.00'
      EditFormat = '#,###,###0.00'
      currency = False
      Calculated = True
    end
    object IBTable1SALDO: TIBBCDField
      FieldName = 'SALDO'
      Precision = 18
      Size = 2
    end
    object FDTable1NOTA: TIntegerField
      FieldName = 'NOTA'
      Origin = 'NOTA'
    end
  end
  object contasReceber: TFDTable
    AfterOpen = contasReceberAfterOpen
    Connection = bd1
    Transaction = IBTransaction1
    UpdateOptions.UpdateTableName = 'CONTASRECEBER'
    TableName = 'CONTASRECEBER'
    Left = 224
    Top = 168
    object contasReceberCODHIS: TIntegerField
      FieldName = 'CODHIS'
      Origin = 'CODHIS'
      Visible = False
    end
    object contasReceberPAGO: TBCDField
      FieldName = 'PAGO'
      Origin = 'PAGO'
      Visible = False
      Precision = 18
      Size = 2
    end
    object contasReceberFORNEC: TIntegerField
      FieldName = 'FORNEC'
      Origin = 'FORNEC'
      Visible = False
    end
    object contasReceberUSUARIO: TIntegerField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Visible = False
    end
    object contasReceberVENDEDOR: TIntegerField
      FieldName = 'VENDEDOR'
      Origin = 'VENDEDOR'
    end
    object contasReceberCODGRU: TIntegerField
      FieldName = 'CODGRU'
      Origin = 'CODGRU'
    end
    object contasReceberDOCUMENTO: TIntegerField
      FieldName = 'DOCUMENTO'
      Origin = 'DOCUMENTO'
    end
    object contasReceberVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
      Origin = 'VENCIMENTO'
    end
    object contasReceberTOTAL: TBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Precision = 18
      Size = 2
    end
    object contasReceberHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Origin = 'HISTORICO'
      Size = 35
    end
    object contasReceberDATAMOV: TDateField
      FieldName = 'DATAMOV'
      Origin = 'DATAMOV'
    end
    object contasReceberFORMPAGTO: TSmallintField
      FieldName = 'FORMPAGTO'
      Origin = 'FORMPAGTO'
    end
    object contasReceberPREVISAO: TDateField
      FieldName = 'PREVISAO'
      Origin = 'PREVISAO'
    end
    object contasReceberVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
    object contasReceberCONT: TSmallintField
      FieldName = 'CONT'
      Origin = 'CONT'
    end
    object contasReceberDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object contasReceberCOD: TIntegerField
      FieldName = 'COD'
      Origin = 'COD'
    end
    object contasReceberSALDO: TBCDField
      FieldName = 'SALDO'
      Origin = 'SALDO'
      Precision = 18
      Size = 2
    end
    object contasReceberNOTA: TIntegerField
      FieldName = 'NOTA'
      Origin = 'NOTA'
    end
  end
  object TabelaOrdem: TFDTable
    OnCalcFields = TabelaOrdemCalcFields
    IndexFieldNames = 'COD'
    Connection = bd1
    UpdateOptions.UpdateTableName = 'SERVICO'
    TableName = 'SERVICO'
    Left = 88
    Top = 80
    object TabelaOrdemCOD: TIntegerField
      FieldName = 'COD'
      Origin = 'COD'
      Required = True
    end
    object TabelaOrdemDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object TabelaOrdemnomCli: TStringField
      DisplayLabel = 'CLIENTE'
      FieldKind = fkCalculated
      FieldName = 'nomCli'
      Size = 40
      Calculated = True
    end
    object TabelaOrdemNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 35
    end
    object TabelaOrdemEQUIP: TStringField
      FieldName = 'EQUIP'
      Origin = 'EQUIP'
      Size = 40
    end
    object TabelaOrdemMARCA: TStringField
      FieldName = 'MARCA'
      Origin = 'MARCA'
      Size = 15
    end
    object TabelaOrdemMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Size = 15
    end
    object TabelaOrdemSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
    end
    object TabelaOrdemTECNICO: TStringField
      FieldName = 'TECNICO'
      Origin = 'TECNICO'
      Size = 15
    end
    object TabelaOrdemDEFEITO: TStringField
      FieldName = 'DEFEITO'
      Origin = 'DEFEITO'
      Size = 40
    end
    object TabelaOrdemSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      FixedChar = True
      Size = 1
    end
    object TabelaOrdemDIAG: TStringField
      FieldName = 'DIAG'
      Origin = 'DIAG'
      Size = 30
    end
    object TabelaOrdemOBS: TStringField
      FieldName = 'OBS'
      Origin = 'OBS'
      Size = 50
    end
    object TabelaOrdemH_ENT: TTimeField
      FieldName = 'H_ENT'
      Origin = 'H_ENT'
    end
    object TabelaOrdemSAIDA: TDateField
      FieldName = 'SAIDA'
      Origin = 'SAIDA'
    end
    object TabelaOrdemPAGO: TBCDField
      FieldName = 'PAGO'
      Origin = 'PAGO'
      Precision = 18
      Size = 2
    end
    object TabelaOrdemVENDEDOR: TSmallintField
      FieldName = 'VENDEDOR'
      Origin = 'VENDEDOR'
    end
    object TabelaOrdemUSUARIO: TSmallintField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
    end
    object TabelaOrdemPARECER: TStringField
      FieldName = 'PARECER'
      Origin = 'PARECER'
      Size = 80
    end
    object TabelaOrdemH_SAI: TTimeField
      FieldName = 'H_SAI'
      Origin = 'H_SAI'
    end
    object TabelaOrdemORDEM: TStringField
      FieldName = 'ORDEM'
      Origin = 'ORDEM'
      Size = 7
    end
    object TabelaOrdemusu: TIBStringField
      DisplayLabel = 'USUARIO'
      FieldKind = fkCalculated
      FieldName = 'usu'
      Size = 30
      Calculated = True
    end
    object TabelaOrdemCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      Visible = False
    end
    object TabelaOrdemVENDA: TIntegerField
      FieldName = 'VENDA'
      Origin = 'VENDA'
      Visible = False
    end
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'D:\ControlW\libpq.dll'
    Left = 408
    Top = 376
  end
end

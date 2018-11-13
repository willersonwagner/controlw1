object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 447
  Width = 892
  object IBselect: TIBQuery
    Database = bd
    Transaction = IBTransaction2
    ForcedRefresh = True
    AutoCalcFields = False
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Filtered = True
    Left = 256
    Top = 2
  end
  object ds1: TDataSource
    DataSet = IBselect
    Left = 256
    Top = 58
  end
  object IBQuery2: TIBQuery
    Database = bd
    Transaction = IBTransaction3
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select ITEM_ENTRADA.cod,ITEM_ENTRADA.nota,ITEM_ENTRADA.data,ENTR' +
        'ADA.chegada,ITEM_ENTRADA.quant,ITEM_ENTRADA.p_compra,ITEM_ENTRAD' +
        'A.destino,ITEM_ENTRADA.usuario,item_entrada.total,item_entrada.c' +
        'odentrada from ITEM_ENTRADA,entrada where ITEM_ENTRADA.nota=entr' +
        'ada.nota and item_ENTRADA.nota =:nota ')
    Left = 320
    Top = 2
    ParamData = <
      item
        DataType = ftString
        Name = 'nota'
        ParamType = ptUnknown
        Value = '2020'
      end>
  end
  object entrada: TDataSource
    DataSet = IBQuery2
    Left = 320
    Top = 58
  end
  object IBSQL: TIBSQL
    Database = bd
    Transaction = IBTransaction1
    Left = 376
    Top = 7
  end
  object ds: TDataSource
    DataSet = IBQuery1
    Left = 192
    Top = 50
  end
  object bd: TIBDatabase
    Connected = True
    DatabaseName = 'C:\ControlW\bd.fdb'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey'
      '')
    LoginPrompt = False
    DefaultTransaction = IBTransaction2
    ServerType = 'IBServer'
    AllowStreamedConnected = False
    Left = 8
    Top = 2
  end
  object IBTransaction2: TIBTransaction
    DefaultDatabase = bd
    Params.Strings = (
      'read_committed'
      'rec_version'
      'wait')
    Left = 8
    Top = 47
  end
  object formpagttable: TIBQuery
    Database = bd
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from formpagto ')
    Left = 192
    Top = 132
    object formpagttableCOD: TIntegerField
      FieldName = 'COD'
      Origin = 'FORMPAGTO.COD'
      Required = True
    end
    object formpagttableNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'FORMPAGTO.NOME'
      Size = 15
    end
    object formpagttableDINHEIRO: TIBStringField
      FieldName = 'DINHEIRO'
      Origin = 'FORMPAGTO.DINHEIRO'
      Size = 1
    end
    object formpagttableDESC_PAG: TIBBCDField
      FieldName = 'DESC_PAG'
      Origin = 'FORMPAGTO.DESC_PAG'
      Precision = 18
      Size = 2
    end
    object formpagttableDESC_ANT: TIBBCDField
      FieldName = 'DESC_ANT'
      Origin = 'FORMPAGTO.DESC_ANT'
      Precision = 18
      Size = 2
    end
    object formpagttableCODGRU: TIBStringField
      FieldName = 'CODGRU'
      Origin = 'FORMPAGTO.CODGRU'
      Size = 4
    end
    object formpagttableCODHIS: TIBStringField
      FieldName = 'CODHIS'
      Origin = 'FORMPAGTO.CODHIS'
      Size = 4
    end
    object formpagttableREG_CAIXA: TIBStringField
      FieldName = 'REG_CAIXA'
      Origin = 'FORMPAGTO.REG_CAIXA'
      Size = 7
    end
    object formpagttablePRAZO: TIBBCDField
      FieldName = 'PRAZO'
      Origin = 'FORMPAGTO.PRAZO'
      Precision = 4
      Size = 2
    end
    object formpagttableIMP_FISCAL: TIBStringField
      FieldName = 'IMP_FISCAL'
      Origin = 'FORMPAGTO.IMP_FISCAL'
      Size = 2
    end
  end
  object Dsformpagto: TDataSource
    DataSet = formpagttable
    Left = 192
    Top = 180
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = bd
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 8
    Top = 96
  end
  object IBQuery1: TIBQuery
    Database = bd
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 192
  end
  object produto: TIBQuery
    Database = bd
    Transaction = IBTransaction2
    BufferChunks = 500
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select codbar,nome as Descricao,p_venda as Preco,quant as estoqu' +
        'e,refori,deposito,unid,cod,aplic as Aplicacao,localiza as Locali' +
        'zacao,igual as Equivalente from produto order by nome asc;')
    Left = 288
    Top = 128
  end
  object dsprod: TDataSource
    DataSet = produto
    Left = 288
    Top = 193
  end
  object produtotemp: TIBQuery
    Database = bd
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select codbar,nome as Descricao,p_venda as Preco,quant as estoqu' +
        'e,cod from produto order by nome ')
    Left = 352
    Top = 128
  end
  object dsprodtemp: TDataSource
    DataSet = produtotemp
    Left = 352
    Top = 193
  end
  object IBTransaction3: TIBTransaction
    Active = True
    DefaultDatabase = bd
    Params.Strings = (
      'read_committed'
      'rec_version'
      'wait')
    Left = 8
    Top = 152
  end
  object ProdutoQY: TIBQuery
    Database = bd
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 248
    Top = 240
  end
  object IBQuery3: TIBQuery
    Database = bd
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 376
    Top = 56
  end
  object IBQuery4: TIBQuery
    Database = bd
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 424
    Top = 40
  end
  object IBTable1: TIBTable
    Database = bd
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    UniDirectional = False
    Left = 112
    Top = 8
  end
  object TabelaOrdem: TIBTable
    Database = bd
    Transaction = IBTransaction2
    OnCalcFields = TabelaOrdemCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    IndexFieldNames = 'COD'
    TableName = 'SERVICO'
    UniDirectional = False
    Left = 112
    Top = 56
    object TabelaOrdemCOD: TIntegerField
      FieldName = 'COD'
      ReadOnly = True
    end
    object TabelaOrdemDATA: TDateField
      FieldName = 'DATA'
      EditMask = '!99/99/0000;1;_'
    end
    object TabelaOrdemnomCli: TStringField
      DisplayLabel = 'CLIENTE'
      FieldKind = fkCalculated
      FieldName = 'nomCli'
      Size = 40
      Calculated = True
    end
    object TabelaOrdemNOME: TIBStringField
      DisplayLabel = 'CLIENTE'
      FieldName = 'NOME'
      ReadOnly = True
      Visible = False
      Size = 35
    end
    object TabelaOrdemCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Visible = False
    end
    object TabelaOrdemEQUIP: TIBStringField
      FieldName = 'EQUIP'
      Size = 40
    end
    object TabelaOrdemMARCA: TIBStringField
      FieldName = 'MARCA'
      Size = 15
    end
    object TabelaOrdemMODELO: TIBStringField
      FieldName = 'MODELO'
      Size = 15
    end
    object TabelaOrdemSERIE: TIBStringField
      FieldName = 'SERIE'
    end
    object TabelaOrdemTECNICO: TIBStringField
      FieldName = 'TECNICO'
      Size = 15
    end
    object TabelaOrdemDEFEITO: TIBStringField
      FieldName = 'DEFEITO'
      Size = 40
    end
    object TabelaOrdemSITUACAO: TIBStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object TabelaOrdemDIAG: TIBStringField
      DisplayLabel = 'DIAGNOSTICO'
      FieldName = 'DIAG'
      Size = 30
    end
    object TabelaOrdemOBS: TIBStringField
      FieldName = 'OBS'
      Size = 50
    end
    object TabelaOrdemH_ENT: TTimeField
      FieldName = 'H_ENT'
      EditMask = '!90:00:00;1;_'
    end
    object TabelaOrdemSAIDA: TDateField
      FieldName = 'SAIDA'
      Visible = False
    end
    object TabelaOrdemPAGO: TIBBCDField
      FieldName = 'PAGO'
      Precision = 18
      Size = 2
    end
    object TabelaOrdemVENDEDOR: TSmallintField
      FieldName = 'VENDEDOR'
      Visible = False
    end
    object TabelaOrdemUSUARIO: TSmallintField
      FieldName = 'USUARIO'
      ReadOnly = True
      Visible = False
    end
    object TabelaOrdemPARECER: TIBStringField
      FieldName = 'PARECER'
      Visible = False
      Size = 80
    end
    object TabelaOrdemH_SAI: TTimeField
      FieldName = 'H_SAI'
      EditMask = '!90:00:00;1;_'
    end
    object TabelaOrdemORDEM: TIBStringField
      FieldName = 'ORDEM'
      Visible = False
      Size = 7
    end
    object TabelaOrdemusu: TIBStringField
      DisplayLabel = 'USUARIO'
      FieldKind = fkCalculated
      FieldName = 'usu'
      Size = 30
      Calculated = True
    end
  end
  object queryCupons: TIBQuery
    Database = bd
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 424
    Top = 136
  end
  object ACBrIBPTax1: TACBrIBPTax
    ProxyPort = '8080'
    Left = 120
    Top = 384
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 320
    Top = 248
  end
  object ACBrETQ1: TACBrETQ
    Porta = 'LPT1'
    Left = 34
    Top = 380
  end
  object DANFE: TACBrNFeDANFCeFortes
    ACBrNFe = ACBrNFe
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
    Left = 120
    Top = 336
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
    Left = 352
    Top = 328
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
    ImprimirDadosDocReferenciados = True
    Left = 32
    Top = 336
  end
  object ACBrConsultaCNPJ1: TACBrConsultaCNPJ
    ProxyPort = '8080'
    PesquisarIBGE = False
    Left = 352
    Top = 384
  end
  object ACBrCargaBal1: TACBrCargaBal
    Modelo = modFilizola
    Left = 184
    Top = 336
  end
  object ACBrCEP1: TACBrCEP
    ProxyPort = '8080'
    WebService = wsCorreios
    PesquisarIBGE = True
    Left = 264
    Top = 384
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
    ImprimirDadosDocReferenciados = True
    Left = 264
    Top = 336
  end
  object ACBrMail1: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    OnBeforeMailProcess = ACBrMail1BeforeMailProcess
    OnAfterMailProcess = ACBrMail1AfterMailProcess
    OnMailException = ACBrMail1MailException
    Left = 184
    Top = 384
  end
  object ACBrNFeDANFeESCPOS1: TACBrNFeDANFeESCPOS
    MostrarPreview = True
    MostrarStatus = False
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
    Left = 432
    Top = 384
  end
  object ACBrNFe: TACBrNFe
    Configuracoes.Geral.SSLLib = libCapicom
    Configuracoes.Geral.SSLCryptLib = cryCapicom
    Configuracoes.Geral.SSLHttpLib = httpWinINet
    Configuracoes.Geral.SSLXmlSignLib = xsMsXmlCapicom
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.ValidarDigest = False
    Configuracoes.Geral.ModeloDF = moNFCe
    Configuracoes.Geral.AtualizarXMLCancelado = True
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'RR'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.Tentativas = 10
    Configuracoes.WebServices.QuebradeLinha = '|'
    DANFE = DANFE
    Left = 432
    Top = 336
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
    Left = 528
    Top = 16
  end
  object FDGUIxWaitCursor2: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 528
    Top = 80
  end
  object FDPhysOracleDriverLink1: TFDPhysOracleDriverLink
    Left = 528
    Top = 136
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'D:\ControlW\libpq.dll'
    Left = 528
    Top = 200
  end
end

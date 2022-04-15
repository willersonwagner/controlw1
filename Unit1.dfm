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
    GoToFirstRecordOnExecute = False
    ParamCheck = False
    Transaction = IBTransaction1
    Left = 392
    Top = 7
  end
  object ds: TDataSource
    DataSet = IBQuery1
    Left = 176
    Top = 50
  end
  object bd: TIBDatabase
    Connected = True
    DatabaseName = 'f:\ControlW\bd.fdb'
    Params.Strings = (
      'user_name=sysdba'
      'password=SYSTEMA1'
      '')
    LoginPrompt = False
    DefaultTransaction = IBTransaction2
    ServerType = 'IBServer'
    AllowStreamedConnected = False
    Left = 8
    Top = 2
  end
  object IBTransaction2: TIBTransaction
    Active = True
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
    Left = 176
    Top = 100
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
    Left = 176
    Top = 156
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
    Transaction = IBTransaction7
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 176
  end
  object produto: TIBQuery
    Database = bd
    Transaction = IBTransaction5
    BufferChunks = 500
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select codbar,nome as Descricao,p_venda as Preco,quant as estoqu' +
        'e,refori,deposito,unid,cod,aplic as Aplicacao,localiza as Locali' +
        'zacao,igual as Equivalente from produto order by nome asc;')
    Left = 256
    Top = 112
  end
  object dsprod: TDataSource
    DataSet = produto
    Left = 256
    Top = 161
  end
  object produtotemp: TIBQuery
    Database = bd
    Transaction = IBTransaction5
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select codbar,nome as Descricao,p_venda as Preco,quant as estoqu' +
        'e,cod from produto order by nome ')
    Left = 320
    Top = 112
  end
  object dsprodtemp: TDataSource
    DataSet = produtotemp
    Left = 320
    Top = 161
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
    Left = 224
    Top = 240
  end
  object IBQuery3: TIBQuery
    Database = bd
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 392
    Top = 56
  end
  object IBQuery4: TIBQuery
    Database = bd
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 392
    Top = 160
  end
  object IBTable1: TIBTable
    Database = bd
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    UniDirectional = False
    Left = 96
  end
  object TabelaOrdem: TIBTable
    Database = bd
    Transaction = IBTransaction2
    OnCalcFields = TabelaOrdemCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'COD'
        DataType = ftInteger
      end
      item
        Name = 'DATA'
        DataType = ftDate
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'USUARIO'
        DataType = ftSmallint
      end
      item
        Name = 'CLIENTE'
        DataType = ftInteger
      end
      item
        Name = 'EQUIP'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'MARCA'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'MODELO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'SERIE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DEFEITO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'TECNICO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'VENDEDOR'
        DataType = ftSmallint
      end
      item
        Name = 'OBS'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'SAIDA'
        DataType = ftDate
      end
      item
        Name = 'SITUACAO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DIAG'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'PARECER'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'H_ENT'
        DataType = ftTime
      end
      item
        Name = 'H_SAI'
        DataType = ftTime
      end
      item
        Name = 'PAGO'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'ORDEM'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'VENDA'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'PK_SERVICO'
        Fields = 'COD'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'SERVICO'
    UniDirectional = False
    Left = 96
    Top = 48
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
    Left = 392
    Top = 112
  end
  object ACBrIBPTax1: TACBrIBPTax
    ProxyPort = '8080'
    Left = 120
    Top = 384
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 296
    Top = 240
  end
  object ACBrETQ1: TACBrETQ
    Porta = 'LPT1'
    Ativo = False
    Left = 34
    Top = 380
  end
  object DANFE: TACBrNFeDANFCeFortes
    PathPDF = 'C:\Program Files (x86)\Borland\Delphi7\Bin\'
    Sistema = 'Projeto ACBr - www.projetoacbr.com.br'
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    ACBrNFe = ACBrNFe
    TipoDANFE = tiNFCe
    FormularioContinuo = True
    TamanhoLogoHeight = 0
    TamanhoLogoWidth = 0
    FonteLinhaItem.Charset = DEFAULT_CHARSET
    FonteLinhaItem.Color = clWindowText
    FonteLinhaItem.Height = -9
    FonteLinhaItem.Name = 'Lucida Console'
    FonteLinhaItem.Style = []
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
    Sistema = 'Projeto ACBr - www.projetoacbr.com.br'
    MargemInferior = 0.700000000000000000
    MargemSuperior = 0.700000000000000000
    MargemEsquerda = 0.700000000000000000
    MargemDireita = 0.700000000000000000
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 4
    CasasDecimais.vUnCom = 4
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    ExibeCampoFatura = False
    TamanhoLogoHeight = 1
    TamanhoLogoWidth = 1
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
    ParseText = True
    WebService = wsViaCep
    PesquisarIBGE = True
    Left = 264
    Top = 384
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
    OnMailProcess = ACBrMail1MailProcess
    OnAfterMailProcess = ACBrMail1AfterMailProcess
    OnMailException = ACBrMail1MailException
    Left = 184
    Top = 384
  end
  object ACBrNFeDANFeESCPOS1: TACBrNFeDANFeESCPOS
    Sistema = 'Projeto ACBr - www.projetoacbr.com.br'
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    TipoDANFE = tiSemGeracao
    ImprimeDescAcrescItem = False
    FormularioContinuo = True
    PosPrinter = ACBrPosPrinter1
    Left = 432
    Top = 384
  end
  object ACBrNFe: TACBrNFe
    Configuracoes.Geral.SSLLib = libWinCrypt
    Configuracoes.Geral.SSLCryptLib = cryWinCrypt
    Configuracoes.Geral.SSLHttpLib = httpWinHttp
    Configuracoes.Geral.SSLXmlSignLib = xsLibXml2
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.ValidarDigest = False
    Configuracoes.Geral.ModeloDF = moNFCe
    Configuracoes.Geral.AtualizarXMLCancelado = True
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'RR'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.Tentativas = 10
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.WebServices.SSLType = LT_TLSv1_2
    Configuracoes.RespTec.IdCSRT = 0
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
    Left = 496
    Top = 8
  end
  object FDGUIxWaitCursor2: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 496
    Top = 56
  end
  object FDPhysOracleDriverLink1: TFDPhysOracleDriverLink
    Left = 496
    Top = 104
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'D:\ControlW\libpq.dll'
    Left = 496
    Top = 160
  end
  object IBQueryServico: TIBQuery
    Database = bd
    Transaction = IBTransaction4
    ForcedRefresh = True
    AutoCalcFields = False
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Filtered = True
    Left = 96
    Top = 98
  end
  object IBTransaction4: TIBTransaction
    DefaultDatabase = bd
    Params.Strings = (
      'read_committed'
      'rec_version'
      'wait')
    Left = 96
    Top = 152
  end
  object IBStoredProc1: TIBStoredProc
    Database = bd
    Transaction = IBTransaction2
    Left = 376
    Top = 240
  end
  object IBScript1: TIBScript
    Database = bd
    Transaction = IBTransaction2
    Terminator = ';'
    Left = 584
    Top = 8
  end
  object IBTransaction5: TIBTransaction
    Active = True
    DefaultDatabase = bd
    Params.Strings = (
      'read_committed'
      'rec_version'
      'wait')
    Left = 8
    Top = 215
  end
  object IBcid: TIBQuery
    Database = bd
    Transaction = IBTransaction6
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select ITEM_ENTRADA.cod,ITEM_ENTRADA.nota,ITEM_ENTRADA.data,ENTR' +
        'ADA.chegada,ITEM_ENTRADA.quant,ITEM_ENTRADA.p_compra,ITEM_ENTRAD' +
        'A.destino,ITEM_ENTRADA.usuario,item_entrada.total,item_entrada.c' +
        'odentrada from ITEM_ENTRADA,entrada where ITEM_ENTRADA.nota=entr' +
        'ada.nota and item_ENTRADA.nota =:nota ')
    Left = 144
    Top = 218
    ParamData = <
      item
        DataType = ftString
        Name = 'nota'
        ParamType = ptUnknown
        Value = '2020'
      end>
  end
  object IBTransaction6: TIBTransaction
    Active = True
    DefaultDatabase = bd
    Params.Strings = (
      'read_committed'
      'rec_version'
      'wait')
    Left = 8
    Top = 279
  end
  object IBTransaction7: TIBTransaction
    DefaultDatabase = bd
    Params.Strings = (
      'read_committed'
      'rec_version'
      'wait')
    Left = 104
    Top = 271
  end
  object ACBrNFeDANFEFR1: TACBrNFeDANFEFR
    Sistema = 'Projeto ACBr - www.projetoacbr.com.br'
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    EspessuraBorda = 1
    BorderIcon = [biSystemMenu, biMinimize, biMaximize]
    ThreadSafe = False
    Left = 264
    Top = 328
  end
  object ACBrNCMs1: TACBrNCMs
    ProxyPort = '8080'
    UrlConsulta = 'http://www4.receita.fazenda.gov.br/simulador/PesquisarNCM.jsp?'
    Left = 496
    Top = 232
  end
  object ACBrTEFD1: TACBrTEFD
    EsperaSTS = 7
    TEFPayGo.ArqTemp = 'C:\PAYGO\REQ\intpos.tmp'
    TEFPayGo.ArqReq = 'C:\PAYGO\REQ\intpos.001'
    TEFPayGo.ArqSTS = 'C:\PAYGO\RESP\intpos.sts'
    TEFPayGo.ArqResp = 'C:\PAYGO\RESP\intpos.001'
    TEFPayGoWeb.SuportaViasDiferenciadas = True
    TEFPayGoWeb.UtilizaSaldoTotalVoucher = False
    TEFPayGoWeb.ConfirmarTransacoesPendentes = True
    TEFPayGoWeb.PerguntarCartaoDigitadoAposCancelarLeitura = False
    TEFDial.ArqTemp = 'C:\TEF_DIAL\req\intpos.tmp'
    TEFDial.ArqReq = 'C:\TEF_DIAL\req\intpos.001'
    TEFDial.ArqSTS = 'C:\TEF_DIAL\resp\intpos.sts'
    TEFDial.ArqResp = 'C:\TEF_DIAL\resp\intpos.001'
    TEFDial.GPExeName = 'C:\TEF_DIAL\tef_dial.exe'
    TEFDisc.ArqTemp = 'C:\TEF_Disc\req\intpos.tmp'
    TEFDisc.ArqReq = 'C:\TEF_Disc\req\intpos.001'
    TEFDisc.ArqSTS = 'C:\TEF_Disc\resp\intpos.sts'
    TEFDisc.ArqResp = 'C:\TEF_Disc\resp\intpos.001'
    TEFDisc.GPExeName = 'C:\TEF_Disc\tef_Disc.exe'
    TEFHiper.ArqTemp = 'c:\HiperTEF\req\IntPos.tmp'
    TEFHiper.ArqReq = 'C:\HiperTEF\req\IntPos.001'
    TEFHiper.ArqSTS = 'C:\HiperTEF\resp\IntPos.sts'
    TEFHiper.ArqResp = 'C:\HiperTEF\resp\IntPos.001'
    TEFHiper.GPExeName = 'C:\HiperTEF\HiperTEF.exe'
    TEFVeSPague.EnderecoIP = 'localhost'
    TEFVeSPague.Porta = '60906'
    TEFVeSPague.TemPendencias = False
    TEFVeSPague.TransacaoCRT = 'Cartao Vender'
    TEFVeSPague.TransacaoCHQ = 'Cheque Consultar'
    TEFVeSPague.TransacaoCNC = 'Administracao Cancelar'
    TEFVeSPague.TransacaoReImpressao = 'Administracao Reimprimir'
    TEFVeSPague.TransacaoPendente = 'Administracao Pendente'
    TEFGPU.ArqTemp = 'C:\TEF_GPU\req\intpos.tmp'
    TEFGPU.ArqReq = 'C:\TEF_GPU\req\intpos.001'
    TEFGPU.ArqSTS = 'C:\TEF_GPU\resp\intpos.sts'
    TEFGPU.ArqResp = 'C:\TEF_GPU\resp\intpos.001'
    TEFGPU.GPExeName = 'C:\TEF_GPU\GPU.exe'
    TEFBanese.ArqTemp = 'C:\bcard\req\pergunta.tmp'
    TEFBanese.ArqReq = 'C:\bcard\req\pergunta.txt'
    TEFBanese.ArqSTS = 'C:\bcard\resp\status.txt'
    TEFBanese.ArqResp = 'C:\bcard\resp\resposta.txt'
    TEFBanese.ArqRespBkp = 'C:\bcard\resposta.txt'
    TEFBanese.ArqRespMovBkp = 'C:\bcard\copiamovimento.txt'
    TEFAuttar.ArqTemp = 'C:\Auttar_TefIP\req\intpos.tmp'
    TEFAuttar.ArqReq = 'C:\Auttar_TefIP\req\intpos.001'
    TEFAuttar.ArqSTS = 'C:\Auttar_TefIP\resp\intpos.sts'
    TEFAuttar.ArqResp = 'C:\Auttar_TefIP\resp\intpos.001'
    TEFAuttar.GPExeName = 'C:\Program Files (x86)\Auttar\IntegradorTEF-IP.exe'
    TEFGood.ArqTemp = 'C:\good\gettemp.dat'
    TEFGood.ArqReq = 'C:\good\getreq.dat'
    TEFGood.ArqSTS = 'C:\good\getstat.dat'
    TEFGood.ArqResp = 'C:\good\getresp.dat'
    TEFGood.GPExeName = 'C:\good\GETGoodMed.exe'
    TEFFoxWin.ArqTemp = 'C:\FwTEF\req\intpos.tmp'
    TEFFoxWin.ArqReq = 'C:\FwTEF\req\intpos.001'
    TEFFoxWin.ArqSTS = 'C:\FwTEF\rsp\intpos.sts'
    TEFFoxWin.ArqResp = 'C:\FwTEF\rsp\intpos.001'
    TEFFoxWin.GPExeName = 'C:\FwTEF\bin\FwTEF.exe'
    TEFCliDTEF.ArqResp = ''
    TEFPetrocard.ArqTemp = 'C:\CardTech\req\intpos.tmp'
    TEFPetrocard.ArqReq = 'C:\CardTech\req\intpos.001'
    TEFPetrocard.ArqSTS = 'C:\CardTech\resp\intpos.sts'
    TEFPetrocard.ArqResp = 'C:\CardTech\resp\intpos.001'
    TEFPetrocard.GPExeName = 'C:\CardTech\sac.exe'
    TEFCrediShop.ArqTemp = 'C:\tef_cshp\req\intpos.tmp'
    TEFCrediShop.ArqReq = 'C:\tef_cshp\req\intpos.001'
    TEFCrediShop.ArqSTS = 'C:\tef_cshp\resp\intpos.sts'
    TEFCrediShop.ArqResp = 'C:\tef_cshp\resp\intpos.001'
    TEFCrediShop.GPExeName = 'C:\tef_cshp\vpos_tef.exe'
    TEFTicketCar.ArqTemp = 'C:\TCS\TX\INTTCS.tmp'
    TEFTicketCar.ArqReq = 'C:\TCS\TX\INTTCS.001'
    TEFTicketCar.ArqSTS = 'C:\TCS\RX\INTTCS.RET'
    TEFTicketCar.ArqResp = 'C:\TCS\RX\INTTCS.001'
    TEFTicketCar.GPExeName = 'C:\TCS\tcs.exe'
    TEFTicketCar.NumLoja = 0
    TEFTicketCar.NumCaixa = 0
    TEFTicketCar.AtualizaPrecos = False
    TEFConvCard.ArqTemp = 'C:\ger_convenio\tx\crtsol.tmp'
    TEFConvCard.ArqReq = 'C:\ger_convenio\tx\crtsol.001'
    TEFConvCard.ArqSTS = 'C:\ger_convenio\rx\crtsol.ok'
    TEFConvCard.ArqResp = 'C:\ger_convenio\rx\crtsol.001'
    TEFConvCard.GPExeName = 'C:\ger_convcard\convcard.exe'
    Left = 520
    Top = 312
  end
  object ACBrTEFAPI1: TACBrTEFAPI
    DadosAutomacao.AutoAtendimento = False
    Left = 520
    Top = 368
  end
end

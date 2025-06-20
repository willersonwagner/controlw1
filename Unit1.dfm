object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 443
  Width = 892
  object IBselect: TFDQuery
    AutoCalcFields = False
    Filtered = True
    Connection = bd
    Transaction = IBTransaction2
    Left = 256
    Top = 2
  end
  object ds1: TDataSource
    DataSet = IBselect
    Left = 256
    Top = 58
  end
  object IBQuery2: TFDQuery
    Connection = bd
    Transaction = IBTransaction7
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
        Name = 'nota'
        DataType = ftString
        Value = '2020'
      end>
  end
  object entrada: TDataSource
    DataSet = IBQuery2
    Left = 320
    Top = 58
  end
  object IBSQL: TFDQuery
    Connection = bd
    Transaction = IBTransaction1
    Left = 392
    Top = 7
  end
  object ds: TDataSource
    DataSet = IBQuery1
    Left = 176
    Top = 50
  end
  object bd: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=SYSTEMA1'
      'Database=F:\ControlW\bd.fdb'
      'CharacterSet=NONE'
      'DriverID=FB')
    ResourceOptions.AssignedValues = [rvParamCreate, rvMacroExpand, rvParamExpand]
    ResourceOptions.MacroExpand = False
    LoginPrompt = False
    Left = 8
    Top = 2
  end
  object IBTransaction2: TFDTransaction
    Connection = bd
    Left = 8
    Top = 47
  end
  object formpagttable: TFDQuery
    Connection = bd
    Transaction = IBTransaction7
    SQL.Strings = (
      'select * from formpagto ')
    Left = 176
    Top = 100
    object formpagttableCOD: TIntegerField
      FieldName = 'COD'
      Origin = 'FORMPAGTO.COD'
      Required = True
    end
    object formpagttableNOME: TStringField
      FieldName = 'NOME'
      Origin = 'FORMPAGTO.NOME'
      Size = 15
    end
    object formpagttableDINHEIRO: TStringField
      FieldName = 'DINHEIRO'
      Origin = 'FORMPAGTO.DINHEIRO'
      Size = 1
    end
    object formpagttableDESC_PAG: TBCDField
      FieldName = 'DESC_PAG'
      Origin = 'FORMPAGTO.DESC_PAG'
      Precision = 18
      Size = 2
    end
    object formpagttableDESC_ANT: TBCDField
      FieldName = 'DESC_ANT'
      Origin = 'FORMPAGTO.DESC_ANT'
      Precision = 18
      Size = 2
    end
    object formpagttableCODGRU: TStringField
      FieldName = 'CODGRU'
      Origin = 'FORMPAGTO.CODGRU'
      Size = 4
    end
    object formpagttableCODHIS: TStringField
      FieldName = 'CODHIS'
      Origin = 'FORMPAGTO.CODHIS'
      Size = 4
    end
    object formpagttableREG_CAIXA: TStringField
      FieldName = 'REG_CAIXA'
      Origin = 'FORMPAGTO.REG_CAIXA'
      Size = 7
    end
    object formpagttablePRAZO: TBCDField
      FieldName = 'PRAZO'
      Origin = 'FORMPAGTO.PRAZO'
      Precision = 4
      Size = 2
    end
    object formpagttableIMP_FISCAL: TStringField
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
  object IBTransaction1: TFDTransaction
    Options.AutoStop = False
    Options.StopOptions = [xoIfCmdsInactive]
    Connection = bd
    Left = 8
    Top = 96
  end
  object IBQuery1: TFDQuery
    Connection = bd
    Transaction = IBTransaction7
    Left = 176
  end
  object produto: TFDQuery
    Connection = bd
    Transaction = IBTransaction2
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
  object produtotemp: TFDQuery
    Connection = bd
    Transaction = IBTransaction2
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
  object IBTransaction3: TFDTransaction
    Options.AutoStop = False
    Options.StopOptions = [xoIfCmdsInactive]
    Connection = bd
    Left = 8
    Top = 152
  end
  object ProdutoQY: TFDQuery
    Connection = bd
    Transaction = IBTransaction2
    Left = 224
    Top = 240
  end
  object IBQuery3: TFDQuery
    Connection = bd
    Transaction = IBTransaction1
    Left = 392
    Top = 56
  end
  object IBQuery4: TFDQuery
    Connection = bd
    Transaction = IBTransaction1
    Left = 392
    Top = 160
  end
  object IBTable1: TFDTable
    Connection = bd
    Transaction = IBTransaction7
    Left = 96
  end
  object TabelaOrdem: TFDTable
    OnCalcFields = TabelaOrdemCalcFields
    Connection = bd
    Transaction = IBTransaction7
    UpdateOptions.UpdateTableName = 'SERVICO'
    TableName = 'SERVICO'
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
    object TabelaOrdemNOME: TStringField
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
    object TabelaOrdemEQUIP: TStringField
      FieldName = 'EQUIP'
      Size = 40
    end
    object TabelaOrdemMARCA: TStringField
      FieldName = 'MARCA'
      Size = 15
    end
    object TabelaOrdemMODELO: TStringField
      FieldName = 'MODELO'
      Size = 15
    end
    object TabelaOrdemSERIE: TStringField
      FieldName = 'SERIE'
    end
    object TabelaOrdemTECNICO: TStringField
      FieldName = 'TECNICO'
      Size = 15
    end
    object TabelaOrdemDEFEITO: TStringField
      FieldName = 'DEFEITO'
      Size = 40
    end
    object TabelaOrdemSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object TabelaOrdemDIAG: TStringField
      DisplayLabel = 'DIAGNOSTICO'
      FieldName = 'DIAG'
      Size = 30
    end
    object TabelaOrdemOBS: TStringField
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
    object TabelaOrdemPAGO: TBCDField
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
    object TabelaOrdemPARECER: TStringField
      FieldName = 'PARECER'
      Visible = False
      Size = 80
    end
    object TabelaOrdemH_SAI: TTimeField
      FieldName = 'H_SAI'
      EditMask = '!90:00:00;1;_'
    end
    object TabelaOrdemORDEM: TStringField
      FieldName = 'ORDEM'
      Visible = False
      Size = 7
    end
    object TabelaOrdemusu: TStringField
      DisplayLabel = 'USUARIO'
      FieldKind = fkCalculated
      FieldName = 'usu'
      Size = 30
      Calculated = True
    end
  end
  object queryCupons: TFDQuery
    Connection = bd
    Transaction = IBTransaction2
    Left = 392
    Top = 112
  end
  object ACBrIBPTax1: TACBrIBPTax
    ProxyPort = '8080'
    ContentsEncodingCompress = []
    NivelLog = 0
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
    CasasDecimais.Aliquota = 2
    CasasDecimais.MaskAliquota = ',0.00'
    ACBrNFe = ACBrNFe
    TipoDANFE = tiNFCe
    ImprimeTotalLiquido = True
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
    MostraStatus = False
    Sistema = 'ControlW Sistemas'
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
    CasasDecimais.Aliquota = 2
    CasasDecimais.MaskAliquota = ',0.00'
    ImprimeDescPorPercentual = True
    ExibeCampoFatura = False
    TamanhoLogoHeight = 1
    TamanhoLogoWidth = 1
    Left = 32
    Top = 336
  end
  object ACBrConsultaCNPJ1: TACBrConsultaCNPJ
    ProxyHost = ''
    ProxyPort = '8080'
    ProxyUser = ''
    ProxyPass = ''
    ContentsEncodingCompress = []
    NivelLog = 0
    PesquisarIBGE = False
    IniServicos = 
      'C:\Program Files (x86)\Embarcadero\Studio\14.0\bin\ACBrConsultaC' +
      'NPJServicos.ini'
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
    ContentsEncodingCompress = []
    NivelLog = 0
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
    CasasDecimais.Aliquota = 2
    CasasDecimais.MaskAliquota = ',0.00'
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
  object IBQueryServico: TFDQuery
    AutoCalcFields = False
    Filtered = True
    Connection = bd
    Transaction = IBTransaction7
    Left = 96
    Top = 98
  end
  object IBTransaction4: TFDTransaction
    Options.AutoStop = False
    Options.StopOptions = [xoIfCmdsInactive]
    Connection = bd
    Left = 96
    Top = 152
  end
  object IBStoredProc1: TFDStoredProc
    Connection = bd
    Transaction = IBTransaction7
    Left = 224
    Top = 288
  end
  object IBScript1: TFDScript
    SQLScripts = <>
    Connection = bd
    Transaction = IBTransaction7
    Params = <>
    Macros = <>
    Left = 584
    Top = 8
  end
  object IBTransaction5: TFDTransaction
    Options.AutoStop = False
    Options.StopOptions = [xoIfCmdsInactive]
    Connection = bd
    Left = 8
    Top = 215
  end
  object IBcid: TFDQuery
    Connection = bd
    Transaction = IBTransaction7
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
        Name = 'nota'
        DataType = ftString
        Value = '2020'
      end>
  end
  object IBTransaction6: TFDTransaction
    Options.AutoStop = False
    Options.StopOptions = [xoIfCmdsInactive]
    Connection = bd
    Left = 8
    Top = 279
  end
  object IBTransaction7: TFDTransaction
    Options.AutoStop = False
    Options.StopOptions = [xoIfCmdsInactive]
    Connection = bd
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
    CasasDecimais.Aliquota = 2
    CasasDecimais.MaskAliquota = ',0.00'
    ImprimeTotalLiquido = True
    EspessuraBorda = 1
    BorderIcon = [biSystemMenu, biMinimize, biMaximize]
    ThreadSafe = False
    Left = 248
    Top = 344
  end
  object ACBrNCMs1: TACBrNCMs
    ProxyPort = '8080'
    ContentsEncodingCompress = []
    NivelLog = 0
    UrlConsulta = 'http://www4.receita.fazenda.gov.br/simulador/PesquisarNCM.jsp?'
    CacheArquivo = 'ACBrNCM.json'
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
    TEFCliSiTefModular.ArqTemp = 'C:\Client\req\intpos.tmp'
    TEFCliSiTefModular.ArqReq = 'C:\Client\req\intpos.001'
    TEFCliSiTefModular.ArqSTS = 'C:\Client\resp\intpos.sts'
    TEFCliSiTefModular.ArqResp = 'C:\Client\resp\intpos.001'
    TEFCliSiTefModular.GPExeName = 'C:\Client\ClientSiTef.exe'
    TEFDirecao.ArqTemp = 'C:\TEF_DIAL\req\intpos.tmp'
    TEFDirecao.ArqReq = 'C:\TEF_DIAL\req\intpos.001'
    TEFDirecao.ArqSTS = 'C:\TEF_DIAL\resp\intpos.sts'
    TEFDirecao.ArqResp = 'C:\TEF_DIAL\resp\intpos.001'
    TEFDirecao.GPExeName = 'C:\DPOS8\Bin\GPDirecao.exe'
    TEFElgin.ArqTemp = 'C:\Cliente\req\intpos.tmp'
    TEFElgin.ArqReq = 'C:\Cliente\req\intpos.001'
    TEFElgin.ArqSTS = 'C:\Cliente\resp\intpos.sts'
    TEFElgin.ArqResp = 'C:\Cliente\resp\intpos.001'
    TEFElgin.GPExeName = 'C:\ELGIN\TEFPassivo\E1_TEFPay_Passivo.exe'
    Left = 520
    Top = 312
  end
  object ACBrTEFAPI1: TACBrTEFAPI
    DadosAutomacao.AutoAtendimento = False
    Left = 520
    Top = 368
  end
  object ACBrPixCD1: TACBrPixCD
    Recebedor.CodCategoriaComerciante = 0
    Left = 616
    Top = 224
  end
  object IBselect1: TFDQuery
    Connection = bd
    Transaction = IBTransaction2
    Left = 392
    Top = 216
  end
  object IBselect2: TFDQuery
    Connection = bd
    Transaction = IBTransaction2
    Left = 392
    Top = 272
  end
  object IBselect3: TFDQuery
    Connection = bd
    Transaction = IBTransaction2
    Left = 448
    Top = 216
  end
  object FDTransaction1: TFDTransaction
    Options.AutoStop = False
    Options.StopOptions = [xoIfCmdsInactive]
    Connection = bd
    Left = 704
    Top = 87
  end
  object queryThread: TFDQuery
    Connection = bd
    Transaction = FDTransaction1
    Left = 704
    Top = 32
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 600
    Top = 88
  end
  object dsCDS: TDataSource
    DataSet = ClientDataSet1
    Left = 600
    Top = 144
  end
  object ACBrPSPPixPDV1: TACBrPSPPixPDV
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 808
    Top = 8
  end
  object ACBrPSPMercadoPago1: TACBrPSPMercadoPago
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 808
    Top = 56
  end
end

object dmSmall: TdmSmall
  OldCreateOrder = False
  Height = 150
  Width = 215
  object BdSmall: TFDConnection
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey'
      'lc_ctype=ISO8859_1')
    LoginPrompt = False
    Left = 16
    Top = 16
  end
  object IBTransaction1: TFDTransaction
    Left = 48
    Top = 16
  end
  object IBQuerySmall: TFDQuery
    Transaction = IBTransaction1
    SQL.Strings = (
      'select * from usuario order by cod asc')
    Left = 80
    Top = 16
  end
  object IBQueryPagto: TFDQuery
    Transaction = IBTransaction1
    SQL.Strings = (
      
        'select valor from pagament where pedido = :numPedido and forma =' +
        ' :pagto')
    Left = 112
    Top = 16
    ParamData = <
      item
        Name = 'numPedido'
      end
      item
        Name = 'pagto'
      end>
  end
  object IBQuery2: TFDQuery
    Transaction = IBTransaction1
    Left = 144
    Top = 16
  end
end

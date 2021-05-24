object ServerContainer1: TServerContainer1
  OldCreateOrder = False
  Height = 271
  Width = 415
  object DSServer1: TDSServer
    OnConnect = DSServer1Connect
    OnError = DSServer1Error
    AutoStart = False
    Left = 96
    Top = 11
  end
  object DSTCPServerTransport1: TDSTCPServerTransport
    Port = 8565
    Server = DSServer1
    BufferKBSize = 128
    Filters = <>
    Left = 96
    Top = 81
  end
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    Server = DSServer1
    Left = 200
    Top = 11
  end
end

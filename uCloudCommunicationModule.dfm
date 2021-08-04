object CloudCommunicationModule: TCloudCommunicationModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 258
  Width = 267
  object CloudTCPChannel: TROIndyTCPChannel
    DispatchOptions = []
    ServerLocators = <>
    TargetUrl = 'tcp://127.0.0.1:8091/'
    Port = 8091
    Host = '127.0.0.1'
    IndyClient.ConnectTimeout = 0
    IndyClient.Host = '127.0.0.1'
    IndyClient.IPVersion = Id_IPv4
    IndyClient.Port = 8091
    IndyClient.ReadTimeout = -1
    Left = 48
    Top = 32
  end
  object DataTCPServer: TROIndyTCPServer
    Dispatchers = <
      item
        Name = 'ServerBinMessage'
        Message = ServerBinMessage
        Enabled = True
      end>
    IndyServer.Bindings = <>
    IndyServer.DefaultPort = 8090
    Port = 8090
    Left = 160
    Top = 32
  end
  object ServerBinMessage: TROBinMessage
    Envelopes = <
      item
        Envelope = EncryptionEnvelope
      end>
    Left = 160
    Top = 88
  end
  object EncryptionEnvelope: TROAESEncryptionEnvelope
    EnvelopeMarker = 'AES'
    Left = 160
    Top = 144
  end
  object ClientBinMessage: TROBinMessage
    Envelopes = <
      item
        Envelope = EncryptionEnvelope
      end>
    Left = 48
    Top = 88
  end
  object CloudService: TRORemoteService
    Channel = CloudTCPChannel
    Message = ClientBinMessage
    Left = 48
    Top = 144
  end
end

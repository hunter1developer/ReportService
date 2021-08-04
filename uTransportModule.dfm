object TransportModule: TTransportModule
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 360
  Width = 214
  object ReportHTTPServer: TROIndyHTTPServer
    Dispatchers = <
      item
        Name = 'ROBinMessage'
        Message = ROBinMessage
        Enabled = True
        PathInfo = 'Bin'
      end>
    OnReadFromStream = ReportHTTPServerReadFromStream
    SendClientAccessPolicyXml = captAllowAll
    IndyServer.Bindings = <>
    IndyServer.DefaultPort = 0
    Port = 0
    Left = 80
    Top = 64
  end
  object ROBinMessage: TROBinMessage
    Envelopes = <
      item
        Envelope = EncryptionEnvelope
      end>
    Left = 80
    Top = 120
  end
  object EncryptionEnvelope: TROAESEncryptionEnvelope
    EnvelopeMarker = 'AES'
    Password = '123'
    Left = 80
    Top = 174
  end
end

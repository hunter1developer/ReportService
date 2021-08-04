object DataChannelModule: TDataChannelModule
  OldCreateOrder = False
  Height = 329
  Width = 211
  object DataHTTPChannel: TROIndyHTTPChannel
    UserAgent = 'Remoting SDK'
    DispatchOptions = []
    ServerLocators = <>
    TargetUrl = 'http://10.1.1.108:8099/bin'
    IndyClient.AllowCookies = True
    IndyClient.ProxyParams.BasicAuthentication = False
    IndyClient.ProxyParams.ProxyPort = 0
    IndyClient.Request.ContentLength = -1
    IndyClient.Request.ContentRangeEnd = -1
    IndyClient.Request.ContentRangeStart = -1
    IndyClient.Request.ContentRangeInstanceLength = -1
    IndyClient.Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    IndyClient.Request.AcceptEncoding = 'identity'
    IndyClient.Request.BasicAuthentication = False
    IndyClient.Request.Host = '10.1.1.108:8099'
    IndyClient.Request.UserAgent = 'Remoting SDK'
    IndyClient.Request.Ranges.Units = 'bytes'
    IndyClient.Request.Ranges = <>
    IndyClient.HTTPOptions = [hoKeepOrigProtocol, hoForceEncodeParams]
    Left = 56
    Top = 16
  end
  object DataServer: TRORemoteService
    Channel = DataHTTPChannel
    Message = DataBinMessage
    Left = 56
    Top = 168
  end
  object DataBinMessage: TROBinMessage
    Envelopes = <
      item
        Envelope = EncryptionEnvelope
      end>
    Left = 56
    Top = 64
  end
  object EncryptionEnvelope: TROAESEncryptionEnvelope
    EnvelopeMarker = 'AES'
    Left = 56
    Top = 112
  end
end

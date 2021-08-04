object ReportService: TReportService
  OldCreateOrder = True
  Height = 351
  Width = 175
  object CloudHTTPChannel: TROIndyHTTPChannel
    UserAgent = 'Remoting SDK'
    DispatchOptions = []
    ServerLocators = <>
    TargetUrl = 'http://127.0.0.1:25469/bin'
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
    IndyClient.Request.Host = '127.0.0.1:25469'
    IndyClient.Request.UserAgent = 'Remoting SDK'
    IndyClient.Request.Ranges.Units = 'bytes'
    IndyClient.Request.Ranges = <>
    IndyClient.HTTPOptions = [hoKeepOrigProtocol, hoForceEncodeParams]
    Left = 64
    Top = 32
  end
  object CloudBinMessage: TROBinMessage
    Envelopes = <
      item
        Envelope = CloudEncryptionEnvelope
      end>
    Left = 64
    Top = 80
  end
  object CloudEncryptionEnvelope: TROAESEncryptionEnvelope
    EnvelopeMarker = 'AES'
    Password = '{91CA987D-AF3F-476D-9057-54BD61BBF976}'
    Left = 64
    Top = 136
  end
  object CloudService: TRORemoteService
    Channel = CloudHTTPChannel
    Message = CloudBinMessage
    Left = 64
    Top = 184
  end
end

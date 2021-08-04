object ZasioReportService: TZasioReportService
  OldCreateOrder = False
  DisplayName = 'ZasioReportService'
  ShareProcess = True
  UseSynchronizer = False
  OnContinue = NtServiceContinue
  OnPause = NtServicePause
  OnShutdown = NtServiceShutdown
  OnStart = NtServiceStart
  OnStop = NtServiceStop
  ServiceName = 'ZasioReportService'
  FailureActions = <>
  Height = 394
  Width = 284
  StartedByScm = 'B81CEED5-40E4F56B'
  object ActivateTimer: TTimer
    Enabled = False
    OnTimer = ActivateTimerTimer
    Left = 72
    Top = 72
  end
end

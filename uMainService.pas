unit uMainService;

interface

uses
    Windows,
    Messages,
    SysUtils,
    Classes,
    Graphics,
    Dialogs,
    Controls,
    SvCom_NTService, Vcl.ExtCtrls,
    uTransportModule,
    ActiveX,
    uLogger,
    uCommonUtils,
    uServiceSettings;

type
  TZasioReportService = class(TNtService)
    ActivateTimer: TTimer;
    procedure ActivateTimerTimer(Sender: TObject);
    procedure NtServicePause(Sender: TNtService; var DoAction: Boolean);
    procedure NtServiceShutdown(Sender: TObject);
    procedure NtServiceStart(Sender: TNtService; var DoAction: Boolean);
    procedure NtServiceStop(Sender: TNtService; var DoAction: Boolean);
    procedure NtServiceContinue(Sender: TNtService; var DoAction: Boolean);
  private
    fSettings: TReportServiceSettings;
    fTransportModule: TTransportModule;
  public
    procedure ActivateService;
    procedure DeactivateService;
    property  TransportModule: TTransportModule read fTransportModule;
  end;

var
  ZasioReportService: TZasioReportService;

implementation


{$R *.DFM}


procedure TZasioReportService.ActivateService;
begin
  CoInitializeEx(nil, COINIT_MULTITHREADED);

  ActivateTimer.Interval := 200;
  ActivateTimer.Enabled  := True;
end;

procedure TZasioReportService.DeactivateService;
begin
  ActivateTimer.Enabled  := False;

  fTransportModule.Stop;
  FreeAndNil(fTransportModule);

  CoUninitialize;
  Logger.Info('Report Server is deactivated.');
end;

procedure TZasioReportService.NtServiceContinue(Sender: TNtService;
  var DoAction: Boolean);
begin
  ActivateService;
end;

procedure TZasioReportService.NtServicePause(Sender: TNtService;
  var DoAction: Boolean);
begin
  DeactivateService;
end;

procedure TZasioReportService.NtServiceShutdown(Sender: TObject);
begin
  DeactivateService;
end;

procedure TZasioReportService.NtServiceStart(Sender: TNtService;
  var DoAction: Boolean);
begin
  ActivateService;
end;

procedure TZasioReportService.NtServiceStop(Sender: TNtService;
  var DoAction: Boolean);
begin
  DeactivateService;
end;

procedure TZasioReportService.ActivateTimerTimer(Sender: TObject);
begin
  ActivateTimer.Enabled  := False;
  try
// Prepare Logger parameters
    Logger.FilePrefix   := 'ReportServer';
    Logger.FilePath     := Settings.LogFilePath;
    Logger.DebugEnabled := Settings.LogDebugMessages;
    Logger.ExpireDays   := Settings.LogExpireDays;

    Logger.Info('Report Service version: %s, %s',
      [TCommonUtils.GetFileVersionStr(GetModuleName(HInstance)),
       TCommonUtils.GetFileArchitectureStr(GetModuleName(HInstance))]);

// Start HTTPServer
    fTransportModule := TTransportModule.Create(nil);
    fTransportModule.Start(Settings.ReportHTTPServerPort);
// etc.
  finally

  end;
end;


initialization
   ReportMemoryLeaksOnShutdown :=  DebugHook <> 0;

end.

 
 

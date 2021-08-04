program ZasioVReportService;

uses
  {$IFDEF DEBUG}
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  {$ENDIF }
  SvCom_NTService,
  MidasLib,
  uMainService in 'uMainService.pas' {ZasioReportService: TNtService},
  uTransportModule in 'uTransportModule.pas' {TransportModule: TDataModule},
  uServiceSettings in 'uServiceSettings.pas',
  VReportServiceLibrary_Intf in 'VReportServiceLibrary_Intf.pas',
  VReportServiceLibrary_Invk in 'VReportServiceLibrary_Invk.pas',
  ReportService_Impl in 'ReportService_Impl.pas' {ReportService: TRORemoteDataModule},
  uReportSessionManager in 'uReportSessionManager.pas',
  uDataChannelModule in 'uDataChannelModule.pas' {DataChannelModule: TDataModule},
  uVReportServiceHelpers in 'uVReportServiceHelpers.pas';

{#ROGEN:ZasioVReportService.rodl} // RemObjects: Careful, do not remove!
{$R RODLFile.res}
{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TZasioReportService, ZasioReportService);
  Application.CreateForm(TDataChannelModule, DataChannelModule);
  Application.Run;
end.

unit uTransportModule;

interface

uses
  System.SysUtils, System.Classes, uROJSONMessage, uROSOAPMessage, uROMessage,
  uROBinMessage, uROComponent, uROBaseConnection, uROServer,
  uROCustomHTTPServer, uROBaseHTTPServer, uROIndyHTTPServer,
  uROTransportChannel, uROIndyTCPChannel, ActiveX, uROBaseHTTPClient,
  uROIndyHTTPChannel, uROAESEncryptionEnvelope, uROChannelAwareComponent,
  uRORemoteService, uROIndyTCPServer, uROClientIntf, uROServerIntf,
  uROCustomRODLReader, System.TypInfo;

type
  TTransportModule = class(TDataModule)
    ReportHTTPServer: TROIndyHTTPServer;
    ROBinMessage: TROBinMessage;
    EncryptionEnvelope: TROAESEncryptionEnvelope;
    procedure ReportHTTPServerReadFromStream(aStream: TStream);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
//    procedure Start;
    procedure Start(APort: Integer;  AUseEncryption: Boolean = true);
    procedure Stop;
  end;

var
  TransportModule: TTransportModule;

implementation

uses
  uServiceSettings, uConstants, uReportSessionManager;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TTransportModule }

procedure TTransportModule.DataModuleDestroy(Sender: TObject);
begin
  ReportHTTPServer.Active := False;
end;

procedure TTransportModule.Start(APort: Integer;
  AUseEncryption: Boolean);
begin

  if AUseEncryption then
    EncryptionEnvelope.Password := cReportServiceEncryptKey
  else
    EncryptionEnvelope.Password := '';

  if ROBinMessage.Envelopes.ItemByMarker('AES') <> nil then
    ROBinMessage.Envelopes.ItemByMarker('AES').Enabled := AUseEncryption;
  if ROBinMessage.Envelopes.ItemByMarker('AES') <> nil then
    ROBinMessage.Envelopes.ItemByMarker('AES').Enabled := AUseEncryption;

  if ReportHTTPServer.Port = 0 then
    ReportHTTPServer.Port := APort;
  ReportHTTPServer.Active := True;
end;

procedure TTransportModule.Stop;
begin
  VReportSessionManager.CloseSessions;
  ReportHTTPServer.Active := False;
end;

procedure TTransportModule.ReportHTTPServerReadFromStream(aStream: TStream);
begin
  CoInitializeEx(nil, COINIT_MULTITHREADED);
end;

end.

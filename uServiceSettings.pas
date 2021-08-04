unit uServiceSettings;

interface

uses
  Windows, SysUtils, Classes, IniFiles, uCustomIniSettings, SvCom_NTService;

type
  TReportServiceSettings = class(TCommonSettings)
  private
    function  GetLogFilePath: String;
    procedure SetLogFilePath(const Value: String);
    function  GetLogExpireDays: Integer;
    procedure SetLogExpireDays(const Value: Integer);
    function  GetLogDebugMessages: Boolean;
    procedure SetLogDebugMessages(const Value: Boolean);

    function  GetCloudServiceHost: String;
    procedure SetCloudServiceHost(const Value: String);
    function  GetCloudServicePort: Integer;
    procedure SetCloudServicePort(const Value: Integer);


    function  GetSessionTimeOut: Integer;
    procedure SetSessionTimeOut(const Value: Integer);
    function GetReportHTTPServerPort: Integer;
    procedure SetReportHTTPServerPort(const Value: Integer);
    function GetVCloudReportManager: string;
    procedure SetVCloudReportManager(const Value: string);


  public
    constructor Create(Filename: String = ''); override;
  published
    property LogFilePath: String read GetLogFilePath write SetLogFilePath;
    property LogExpireDays: Integer read GetLogExpireDays write SetLogExpireDays;
    property LogDebugMessages: Boolean read GetLogDebugMessages
                                      write SetLogDebugMessages;

    property ReportHTTPServerPort: Integer read GetReportHTTPServerPort write SetReportHTTPServerPort;
    property CloudServiceHost: String read GetCloudServiceHost write SetCloudServiceHost;
    property CloudServicePort: Integer read GetCloudServicePort write SetCloudServicePort;
    property SessionTimeOut: Integer read GetSessionTimeOut write SetSessionTimeOut;
    property VCloudReportManagerInstallation: string read GetVCloudReportManager write SetVCloudReportManager;
  end;

  TDataServerSettingsClass = class of TReportServiceSettings;

function Settings: TReportServiceSettings;

{$WRITEABLECONST ON}
const
  __Settings: TReportServiceSettings = nil;
{$WRITEABLECONST OFF}

implementation

uses uCommonUtils;

function Settings: TReportServiceSettings;
begin
  if __Settings = nil then
    __Settings := TReportServiceSettings.Create();
  Result := __Settings;
end;

{ TDataServerSettings }

constructor TReportServiceSettings.Create(Filename: String);
begin
  inherited Create(ChangeFileExt(ParamStr(0), '.ini'));
  __Settings := self;
end;

function TReportServiceSettings.GetCloudServiceHost: String;
begin
  Result := IniFile.ReadString('Communications', 'CloudServiceHost', '127.0.0.1');
end;

function TReportServiceSettings.GetCloudServicePort: Integer;
begin
  Result := IniFile.ReadInteger('Communications', 'CloudServicePort', 25469);
end;

function TReportServiceSettings.GetReportHTTPServerPort: Integer;
begin
  Result := IniFile.ReadInteger('Communications', 'ReportHTTPServerPort', 24471);
end;

function TReportServiceSettings.GetLogDebugMessages: Boolean;
begin
  Result := IniFile.ReadBool('Logger', 'LogDebugMessages', False);
end;

function TReportServiceSettings.GetLogExpireDays: Integer;
begin
  Result := IniFile.ReadInteger('Logger', 'LogExpireDays', 90);
end;

function TReportServiceSettings.GetLogFilePath: String;
begin
  Result := IniFile.ReadString('Logger', 'LogFilePath', '');
end;

function TReportServiceSettings.GetSessionTimeOut: Integer;
begin
  Result := IniFile.ReadInteger('General', 'SessionTimeOut', 1440);
end;

function TReportServiceSettings.GetVCloudReportManager: string;
begin
//  Result := IniFile.ReadString('Communications', 'VCloudReportManager',  'https://retention.zasiocloud.com/Downloads/ZasioVCloudReportManager.exe');
//  Result := IniFile.ReadString('Communications', 'VCloudReportManager',  Application.GetNamePath);
  Result := IniFile.ReadString('Communications', 'VCloudReportManager',  '');
end;

procedure TReportServiceSettings.SetCloudServiceHost(const Value: String);
begin
  IniFile.WriteString('Communications', 'CloudServiceHost', Value);
end;

procedure TReportServiceSettings.SetCloudServicePort(const Value: Integer);
begin
  IniFile.WriteInteger('Communications', 'CloudServicePort', Value);
end;

procedure TReportServiceSettings.SetReportHTTPServerPort(const Value: Integer);
begin
  IniFile.WriteInteger('Communications', 'ReportHTTPServerPort', Value);
end;

procedure TReportServiceSettings.SetLogDebugMessages(const Value: Boolean);
begin
  IniFile.WriteBool('Logger', 'LogDebugMessages', Value);
end;

procedure TReportServiceSettings.SetLogExpireDays(const Value: Integer);
begin
  IniFile.WriteInteger('Logger', 'LogExpireDays', Value);
end;

procedure TReportServiceSettings.SetLogFilePath(const Value: String);
begin
  IniFile.WriteString('Logger', 'LogFilePath', Value);
end;

procedure TReportServiceSettings.SetSessionTimeOut(const Value: Integer);
begin
  IniFile.WriteInteger('General', 'SessionTimeOut', Value);
end;

procedure TReportServiceSettings.SetVCloudReportManager(const Value: string);
begin
  IniFile.WriteString('Communications', 'VCloudReportManager', Value);
end;

initialization
  Classes.RegisterClass(TReportServiceSettings);
finalization
  if __Settings <> nil then
    FreeAndNil(__Settings);

end.

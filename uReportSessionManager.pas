unit uReportSessionManager;

interface

uses
  System.SysUtils, System.Classes, System.SyncObjs, System.DateUtils,
  System.Generics.Collections, System.Generics.Defaults, Vcl.ExtCtrls, Winapi.Windows,
  uDAServerInterfaces, uResults, uConstants, uCommonClasses,
  uRORemoteService,
  uROClasses,
  uROThreadTimer,
  uDataChannelModule,
  VDataServerLibrary_Intf,
  VCloudServiceLibrary_Intf,
  uVCloudServiceHelpers;

type
  TReportSession = class
  private
    fSessionID: String;
    fLastTimeAccess: TDateTime;
    fDataChannel: TDataChannelModule;
    fSessionInfo: roSessionInfo;
    function GetDataServer: TRORemoteService;
  protected
    property DataChannel: TDataChannelModule read fDataChannel;
  public
    constructor Create;
    destructor  Destroy; override;

    property SessionID: String read fSessionID write fSessionID;
    property SessionInfo: roSessionInfo read fSessionInfo write fSessionInfo;
    property LastTimeAccess: TDateTime read FLastTimeAccess write FLastTimeAccess;
    property DataServer: TRORemoteService read GetDataServer;
  end;

  TReportSessionManager = class
  private
    fSafe: TLocker;
    fTimeOut: integer;
    fTimer: TROThreadTimer;
    fSessions: TObjectDictionary<String, TReportSession>;

    procedure OnTimerTick(CurrentTickCount : cardinal);
    function GetSessionCount: Integer;
  protected

    property Sessions: TObjectDictionary<String, TReportSession> read fSessions;
    property Safe: TLocker read fSafe;
  public
    constructor Create;
    destructor Destroy; override;

    function  AddServer(const AServerInfo: roCloudServerRecord; out ASessionID: string): TRORemoteService;
    procedure AddSession(const ASessionInfo: roSessionInfo; const ASessionID: string); overload; virtual;
    function  CloseSession(ASessionID: String): TResultRecord; overload;
    function  CloseSession(ASession: TReportSession): TResultRecord;  overload;
    procedure CloseSessions;
    procedure CloseExpiredSessions;

    function  FindSession(ASessionID: String): TReportSession;
    function  SessionExists(ASessionID: String): Boolean;
    function  SessionValid(ASessionID: String; SetTimeAccess: Boolean = True): TResultRecord;

    function  GetDataServer(ASessionID: String): TRORemoteService;

    property TimeOut : integer read fTimeOut write fTimeOut;
    property SessionCount: Integer read GetSessionCount;
  end;

function VReportSessionManager: TReportSessionManager;

{$WRITEABLECONST ON}
const
  __ReportSessionManager: TReportSessionManager = nil;
{$WRITEABLECONST OFF}

implementation

uses
  uServiceSettings, uCommonUtils;

function VReportSessionManager: TReportSessionManager;
begin
  if __ReportSessionManager = nil then
    __ReportSessionManager := TReportSessionManager.Create;
  Result := __ReportSessionManager;
end;

{ TServerSessionManager }

function TReportSessionManager.AddServer(const AServerInfo: roCloudServerRecord; out ASessionID: string): TRORemoteService;
var
  tempSession: TReportSession;
begin
  tempSession := TReportSession.Create;
  tempSession.SessionID := TCommonUtils.GenerateStrGuid;
  tempSession.DataChannel.DataHTTPChannel.Host := AServerInfo.IP;
  tempSession.DataChannel.DataHTTPChannel.Port := AServerInfo.Port;
  tempSession.DataChannel.EncryptionEnvelope.Password := AServerInfo.EncryptionKey;
  Safe.Lock;
  try
    ASessionID := tempSession.SessionID;
    Sessions.AddOrSetValue(tempSession.SessionID, tempSession);
    Result := tempSession.DataChannel.DataServer;
  finally
    Safe.UnLock;
  end;
end;

procedure TReportSessionManager.AddSession(const ASessionInfo: roSessionInfo; const ASessionID: string);
begin
  Safe.Lock;
  try
    if SessionExists(ASessionID) then
      Sessions[ASessionID].SessionInfo.Assign(ASessionInfo);
  finally
    Safe.UnLock;
  end;
end;

procedure TReportSessionManager.CloseExpiredSessions;
var
  KeyValue: TPair<String, TReportSession>;
  Arr: TArray<TPair<String, TReportSession>>;
begin
  Safe.Lock;
  try
    Arr := Sessions.ToArray;
    for KeyValue in Arr do
      if MinuteSpan(Now, KeyValue.Value.LastTimeAccess) >= TimeOut then
        CloseSession(KeyValue.Value)
  finally
    Safe.UnLock;
  end;
end;

function TReportSessionManager.CloseSession(ASessionID: String): TResultRecord;
var
  tempSession: TReportSession;
begin
  Safe.Lock;
  try
    tempSession := FindSession(ASessionID);
    if Assigned(tempSession) then
    begin
      Result := R_OK;
      Sessions.Remove(tempSession.SessionID);
    end
    else
      Result := RE_SESSION_IS_ABSENT;
  finally
    Safe.UnLock;
  end;
end;

function TReportSessionManager.CloseSession(ASession: TReportSession): TResultRecord;
begin
  Result := CloseSession(ASession.SessionID);
end;

procedure TReportSessionManager.CloseSessions;
var
  tempValue: TReportSession;
begin
  Safe.Lock;
  try
    for tempValue in Sessions.Values do
      CloseSession(tempValue.SessionID);
    Sessions.Clear;
  finally
    Safe.UnLock;
  end;
end;

constructor TReportSessionManager.Create;
begin
  fSafe.Init;
  fSessions := TObjectDictionary<String, TReportSession>.Create([doOwnsValues], TIStringComparer.Ordinal);
  fTimeOut  := Settings.SessionTimeOut;
  fTimer := TROThreadTimer.Create(OnTimerTick, 10 * MSecsPerSec, True);
end;

destructor TReportSessionManager.Destroy;
begin
  fTimer.Free;
  CloseSessions;
  fSessions.Free;
  fSafe.Done;
  inherited;
end;

function TReportSessionManager.FindSession(ASessionID: String): TReportSession;
begin
  Result := nil;
  if SessionExists(ASessionID) then
    Result := Sessions[ASessionID];
end;

function TReportSessionManager.GetDataServer(ASessionID: String): TRORemoteService;
begin
  Result := nil;
  if SessionExists(ASessionID) then
    Result := Sessions[ASessionID].DataChannel.DataServer;
end;

function TReportSessionManager.GetSessionCount: Integer;
begin
  Safe.Lock;
  try
    Result := fSessions.Count;
  finally
    Safe.UnLock;
  end;
end;

function TReportSessionManager.SessionExists(ASessionID: String): Boolean;
begin
  Result := Sessions.ContainsKey(ASessionID);
end;

function TReportSessionManager.SessionValid(ASessionID: String;
  SetTimeAccess: Boolean): TResultRecord;
begin
  Safe.Lock;
  try
    if SessionExists(ASessionID) and (MinuteSpan(Now, Sessions[ASessionID].LastTimeAccess) < TimeOut) then begin
      if SetTimeAccess then
        Sessions[ASessionID].LastTimeAccess := Now;
      Result := R_OK;
    end
    else
      Result := RE_SID_EXPIRED;
  finally
    Safe.UnLock;
  end;
end;

procedure TReportSessionManager.OnTimerTick(CurrentTickCount : cardinal);
begin
  CloseExpiredSessions;
end;

constructor TReportSession.Create;
begin
  fDataChannel := TDataChannelModule.Create(nil);
  fSessionInfo := roSessionInfo.Create;

  fSessionID := '';
  fLastTimeAccess := Now;
end;

destructor TReportSession.Destroy;
begin
  FreeAndNil(fSessionInfo);
  FreeAndNil(fDataChannel);
  inherited;
end;

function TReportSession.GetDataServer: TRORemoteService;
begin
  Result := DataChannel.DataServer;
end;

initialization
finalization
  if __ReportSessionManager <> nil then begin
    FreeAndNil(__ReportSessionManager);
  end;

end.

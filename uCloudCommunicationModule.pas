unit uCloudCommunicationModule;

interface

uses
  System.SysUtils, System.Classes, System.SyncObjs,
  uROServer, uROIndyTCPServer, uROComponent,
  uROBaseConnection, uROTransportChannel, uROIndyTCPChannel,
  uROChannelAwareComponent, uRORemoteService, uROMessage,
  uROAESEncryptionEnvelope, uROBinMessage, uROClasses,
  uResults, uConstants, uCommonClasses, zeiAccessControlFile,
  VCloudServiceLibrary_Intf;

type
  TCloudUserObject = class(TPersistent)
  private
    fDBConnectionString: String;
    fAppDBType: TAppDBType;

    fUserCloudID: String;
    fUserAutoIndex: Integer;
    fUserID: String;
    fUserGlobalID: String;
    fCompID: String;
    fCompGlobalID: String;
    fUserLName: String;
    fUserFName: String;
    fUserEmail: String;

    function GetDBConnectionName: String;
    function GetDBServerType: TDBServertype;
  public
    procedure Assign(Source: TPersistent); override;
  published
    property UserCloudID: String read fUserCloudID write fUserCloudID;
    property DBConnectionString: String read fDBConnectionString write fDBConnectionString;
    property DBConnectionName: String read GetDBConnectionName;
    property DBServerType: TDBServertype read GetDBServerType;
    property AppDBType: TAppDBType read fAppDBType write fAppDBType;
    property UserAutoIndex: Integer read fUserAutoIndex write fUserAutoIndex;
    property UserID: String read fUserID write fUserID;
    property UserGlobalID: String read fUserGlobalID write fUserGlobalID;
    property CompID: String read fCompID write fCompID;
    property CompGlobalID: String read fCompGlobalID write fCompGlobalID;
    property UserLName: String read fUserLName write fUserLName;
    property UserFName: String read fUserFName write fUserFName;
    property UserEmail: String read fUserEmail write fUserEmail;
  end;

  TCheckCloudThread = class;

  TCloudCommunicationModule = class(TDataModule)
    CloudTCPChannel: TROIndyTCPChannel;
    DataTCPServer: TROIndyTCPServer;
    EncryptionEnvelope: TROAESEncryptionEnvelope;
    ClientBinMessage: TROBinMessage;
    CloudService: TRORemoteService;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    fSafe: TLocker;
    fRegistered: Boolean;
    FServerInfo: roCloudServerRecord;
    FCheckCloudThread: TCheckCloudThread;
    function GetServerInfo: roCloudServerRecord;
    function GetCheckCloudThread: TCheckCloudThread;
  protected
    property ServerInfo: roCloudServerRecord read GetServerInfo;
    property Safe: TLocker read fSafe;
  public
    procedure Start(APort: Integer = 0; UseEncryption: Boolean = True);
    procedure Stop;

    procedure RegisterDataServerOnCloud;
    procedure UnRegisterDataServerOnCloud;

    function  CheckAndLoadUserFromCloud(var ACloudUser: TCloudUserObject): TResultRecord;

    function  RegisterSessionOnCloud(const SessionID: String; const ACloudUser: TCloudUserObject): TResultRecord;
    procedure UnRegisterSessionOnCloud(const SessionID: String; const ACloudUser: TCloudUserObject);

    property Registred: Boolean read fRegistered write fRegistered;
    property CheckCloudThread: TCheckCloudThread read GetCheckCloudThread;
  end;

  TCheckCloudThread = class(TThread)
  private
    FOwner: TCloudCommunicationModule;
    function GetCloudSevice: ICloudService;
  protected
    FChannel: TROIndyTCPChannel;
    FMessage: TROBinMessage;
    FService: TRORemoteService;
    FEncryption: TROAESEncryptionEnvelope;
  protected
    procedure Initialize;
    procedure Finalize;
    procedure Execute; override;
    procedure DoCheckCloud;
    property Owner: TCloudCommunicationModule read FOwner;
    property CloudService: ICloudService read GetCloudSevice;
  public
    constructor Create(AOwner: TCloudCommunicationModule);
    destructor Destroy; override;
  end;


function CloudCommunicationModule: TCloudCommunicationModule;

{$WRITEABLECONST ON}
const
  __CloudCommunicationModule: TCloudCommunicationModule = nil;
{$WRITEABLECONST OFF}

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  uCommonUtils, uVDataServerSettings, uClientServerTransportModule, uLogger,
  uVCloudServiceHelpers, uVDataServerSessionManager;

function CloudCommunicationModule: TCloudCommunicationModule;
begin
  if __CloudCommunicationModule = nil then
    __CloudCommunicationModule := TCloudCommunicationModule.Create(nil);
  Result := __CloudCommunicationModule;
end;

{ TCloudCommunicationModule }

function TCloudCommunicationModule.CheckAndLoadUserFromCloud(
  var ACloudUser: TCloudUserObject): TResultRecord;
var
  res: roCloudResult;
  UserInfo: roCloudUserRecord;
begin
  Safe.ProtectMethod;
  Result := RE_UNDEFINED_ERROR;
  res := (CloudService as ICloudService).CheckAndLoadUser(ACloudUser.UserCloudID, UserInfo);
  if Assigned(res) then
  try
    Result := res.Result;
    if Result = R_OK then
      ACloudUser.Assign(UserInfo);
  finally
    res.Free;
    if Assigned(UserInfo) then
      UserInfo.Free;
  end;
end;

procedure TCloudCommunicationModule.DataModuleCreate(Sender: TObject);
begin
  fSafe.Init;
  fRegistered := False;
end;

procedure TCloudCommunicationModule.DataModuleDestroy(Sender: TObject);
begin
  if Assigned(FCheckCloudThread) then
    FreeAndNil(FCheckCloudThread);
  if Assigned(FServerInfo) then
    FreeAndNil(FServerInfo);
  fSafe.Done;
end;

function TCloudCommunicationModule.GetCheckCloudThread: TCheckCloudThread;
begin
  if not Assigned(FCheckCloudThread) then
    FCheckCloudThread := TCheckCloudThread.Create(Self);
  Result := FCheckCloudThread;
end;

function TCloudCommunicationModule.GetServerInfo: roCloudServerRecord;
begin
  if not Assigned(FServerInfo) then
  begin
    FServerInfo := roCloudServerRecord.Create;
    //Prepare server information
    if Settings.MainHTTPHost = '' then
      FServerInfo.IP := TCommonUtils.HostIP
    else
      FServerInfo.IP := Settings.MainHTTPHost;
    FServerInfo.Port := Settings.MainHTTPPort;
    //Advanced parameters
    FServerInfo.ServerName := TCommonUtils.HostName;
    FServerInfo.ParameterList['Version'].AsString := TCommonUtils.GetFileVersionStr(ParamStr(0));
    FServerInfo.ParameterList['TCPPort'].AsInteger := Settings.DataServerTCPPort;
  end;
  FServerInfo.EncryptionKey := ClientServerTransportModule.Key;
  FServerInfo.SessionCount := VSessionManager.SessionCount;
  Result := FServerInfo;
end;

procedure TCloudCommunicationModule.RegisterDataServerOnCloud;
var
  res: roCloudResult;
begin
  Safe.ProtectMethod;
  fRegistered := False;
  try
    res := (CloudService as ICloudService).RegisterDataServer(ServerInfo);
    if Assigned(res) then
    try
      fRegistered := res.Result = R_OK;
      Logger.Info('Data Server is registered on the Cloud');
    finally
      res.Free;
    end;
  except
    on E: Exception do
    begin
      fRegistered := False;
      Logger.Error('RegisterDataServerOnCloud: %s', [E.Message]);
    end;
  end;
end;

function TCloudCommunicationModule.RegisterSessionOnCloud(
  const SessionID: String; const ACloudUser: TCloudUserObject): TResultRecord;
var
  res: roCloudResult;
begin
  Safe.ProtectMethod;
  res := (CloudService as ICloudService).RegisterUserSession(ACloudUser.UserCloudID, SessionID, ServerInfo.ServerId, nil);
  if Assigned(res) then
  try
    Result := res.Result;
  finally
    res.Free;
  end;
end;

procedure TCloudCommunicationModule.Start(APort: Integer;
  UseEncryption: Boolean);
begin
  // Prepare CloudTCPChannel
  CloudTCPChannel.Host := Settings.CloudServiceHost;
  CloudTCPChannel.Port := Settings.CloudServicePort;
  // Prepare DataTCPServer
  DataTCPServer.Port   := APort;
  DataTCPServer.Active := True;
  EncryptionEnvelope.Password := cDataServerCloudEncryptKey;
end;

procedure TCloudCommunicationModule.Stop;
begin
  if Assigned(FCheckCloudThread) then
  begin
    FCheckCloudThread.Terminate;
    FCheckCloudThread.WaitFor;
    FreeAndNil(FCheckCloudThread);
  end;

  if Assigned(FServerInfo) then
    FreeAndNil(FServerInfo);
  DataTCPServer.Active := False;
end;

procedure TCloudCommunicationModule.UnRegisterDataServerOnCloud;
var
  res: roCloudResult;
begin
  Safe.ProtectMethod;
  try
// Stop Registeration Threed

    res := (CloudService as ICloudService).UnRegisterDataServer(ServerInfo);
    if Assigned(res) then
    try
      Logger.Info('Data Server is unregistered from the Cloud');
    finally
      res.Free;
    end;

    fRegistered := False;
  except
    on E: Exception do
      Logger.Error('UnRegisterDataServerOnCloud: %s', [E.Message]);
  end;
end;

procedure TCloudCommunicationModule.UnRegisterSessionOnCloud(
  const SessionID: String; const ACloudUser: TCloudUserObject);
var
  res: roCloudResult;
begin
  Safe.ProtectMethod;
  res := (CloudService as ICloudService).UnRegisterUserSession(ACloudUser.UserCloudID, SessionID, nil);
  if Assigned(res) then
    res.Free;
end;

{ TCloudUserObject }

procedure TCloudUserObject.Assign(Source: TPersistent);
var
  localSource: TCloudUserObject absolute Source;
  roSource: roCloudUserRecord absolute Source;
begin
  if Source is TCloudUserObject then begin
    UserCloudID        := localSource.UserCloudID;
    DBConnectionString := localSource.DBConnectionString;
    AppDBType          := localSource.AppDBType;
    UserAutoIndex      := localSource.UserAutoIndex;
    UserID             := localSource.UserID;
    UserGlobalID       := localSource.UserGlobalID;
    CompID             := localSource.CompID;
    CompGlobalID       := localSource.CompGlobalID;
    UserLName          := localSource.UserLName;
    UserFName          := localSource.UserFName;
    UserEmail          := localSource.UserEmail;
  end
  else
  if Source is roCloudUserRecord then begin
    UserCloudID := roSource.UserCloudId;
    DBConnectionString := TzeiAccessControlFile3.ConnectionString(roSource.ConnectionString);
    UserID := roSource.UserId;
    CompID := roSource.UserCompId;
    AppDBType := adbtVR;
  end
  else
    inherited Assign(Source);
end;

function TCloudUserObject.GetDBConnectionName: String;
begin
  Result := TCommonUtils.DatabaseConnectionName(fDBConnectionString);
end;

function TCloudUserObject.GetDBServerType: TDBServertype;
begin
  Result := TCommonUtils.DatabaseServerType(fDBConnectionString);
end;

{ TCheckCloudThread }

constructor TCheckCloudThread.Create(AOwner: TCloudCommunicationModule);
begin
  inherited Create(True);
  FOwner := AOwner;
  FreeOnTerminate := False;
end;

destructor TCheckCloudThread.Destroy;
begin
  FOwner := nil;
  inherited;
end;

procedure TCheckCloudThread.DoCheckCloud;
var
  res: roCloudResult;
begin
  try
    if not Owner.Registred then
    begin
      Owner.RegisterDataServerOnCloud;
      Exit;
    end;

    res := CloudService.DataServerIsRegistered(Owner.ServerInfo);
    if Assigned(res) then
    try
      if res.Result = RE_SERVER_IS_NOT_REGISTERED then
        Owner.RegisterDataServerOnCloud;
    finally
      res.Free;
    end;
  except
    on E: Exception do
    begin
      Owner.Registred := False;
      Logger.Error('CheckCloud Exception: ' + E.Message);
    end;
  end;
end;

procedure TCheckCloudThread.Execute;
var
  Ticks: Integer;
begin
  Initialize;
  try
    Ticks := 0;
    while not Terminated do
    begin
      if Ticks >= (10 * MSecsPerSec) then
      begin
        Ticks := 0;
        DoCheckCloud;
      end;

      Sleep(100);
      Inc(Ticks, 100);
    end;
  finally
    Finalize;
  end;
end;

procedure TCheckCloudThread.Finalize;
begin
  FreeAndNil(FEncryption);
  FreeAndNil(FChannel);
  FreeAndNil(FMessage);
  FreeAndNil(FService);
end;

function TCheckCloudThread.GetCloudSevice: ICloudService;
begin
  Result := FService as ICloudService;
end;

procedure TCheckCloudThread.Initialize;
begin
  FMessage := TROBinMessage.Create(nil);
  FChannel := TROIndyTCPChannel.Create(nil);
  FEncryption := TROAESEncryptionEnvelope.Create(nil);
  FEncryption.EnvelopeMarker := 'AES';
  FEncryption.Password := cDataServerCloudEncryptKey;
  TROMessageEnvelopeItem(FMessage.Envelopes.Add).Envelope := FEncryption;
  FChannel.Host := Owner.CloudTCPChannel.Host;
  FChannel.Port := Owner.CloudTCPChannel.Port;
  FService := TRORemoteService.Create(nil);
  FService.Channel := FChannel;
  FService.Message := FMessage;
  FService.ServiceName := 'CloudService';
end;

initialization
finalization
  if __CloudCommunicationModule <> nil then begin
    FreeAndNil(__CloudCommunicationModule);
  end;

end.

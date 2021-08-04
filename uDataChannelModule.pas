unit uDataChannelModule;

interface

uses
  System.SysUtils, System.Classes, uROMessage, uROAESEncryptionEnvelope,
  uROBinMessage, uROChannelAwareComponent, uRORemoteService, uROComponent,
  uROBaseConnection, uROTransportChannel, uROBaseHTTPClient, uROIndyHTTPChannel;

type
  TDataChannelModule = class(TDataModule)
    DataHTTPChannel: TROIndyHTTPChannel;
    DataServer: TRORemoteService;
    DataBinMessage: TROBinMessage;
    EncryptionEnvelope: TROAESEncryptionEnvelope;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataChannelModule: TDataChannelModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

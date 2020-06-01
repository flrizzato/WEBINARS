unit NurseStationClientModuleU;

interface

uses
  System.SysUtils, System.Classes, IPPeerClient, REST.Backend.EMSProvider,
  REST.Backend.PushTypes, System.JSON, REST.Backend.EMSPushDevice,
  System.PushNotification, REST.Backend.EMSServices, REST.Backend.ServiceTypes,
  REST.Backend.MetaTypes, REST.Backend.BindSource,
  REST.Backend.ServiceComponents, Data.Bind.Components, Data.Bind.ObjectScope,
  REST.Backend.PushDevice, REST.Backend.Providers, REST.Client,
  REST.Backend.EndPoint;

type
  TNurseStationClientModule = class(TDataModule)
    EMSProvider1: TEMSProvider;
    PushEvents1: TPushEvents;
    BackendAuth1: TBackendAuth;
    BackendUsers1: TBackendUsers;
    BackendEndpointSendMessageNurse: TBackendEndpoint;
    BackendEndpointSendMessagePatient: TBackendEndpoint;
    BackendEndpointGetPatient: TBackendEndpoint;
    BackendEndpointAddPatient: TBackendEndpoint;
    procedure PushEvents1PushReceived(Sender: TObject; const AData: TPushData);
    procedure PushEvents1DeviceTokenReceived(Sender: TObject);
  private
    { Private declarations }
    FOnPushReceived: TProc<string, TJSONObject>;
    FOnDeviceTokenReceived: TProc;
  public
    procedure AddPatientData(const APatient : TJSONObject);
    function  GetPatientData(const AUserId : string): TJSONObject;
  public
    { Public declarations }
    procedure Login(const AUserName, APassword: string);
    procedure Logout;
    procedure Signup(const AUserName, APassword: string);
    procedure PushRegisterPatient;
    procedure PushRegisterNurse;
    procedure SendMessageNurse(const AStatus : string);
    procedure SendMessagePatient(const AUserId : String);
    function GetDescription: String; overload;
    function GetDescription(const AUserId : String): String; overload;
    property  OnDeviceTokenReceived : TProc read FOnDeviceTokenReceived write FOnDeviceTokenReceived;
    property  OnPushReceived : TProc<string, TJSONObject> read FOnPushReceived write FOnPushReceived;
  end;

var
  NurseStationClientModule: TNurseStationClientModule;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TNurseStationClientModule }

procedure TNurseStationClientModule.AddPatientData(const APatient: TJSONObject);
var
  LBackend : TBackendEndpoint;
begin
  LBackend := BackendEndpointAddPatient;
  LBackend.AddBody(APatient);
  LBackend.Execute();
end;

function TNurseStationClientModule.GetDescription(const AUserId: String): String;
var
  LUser : TBackendEntityValue;
  LArray : TJSOnArray;
begin
  LArray := TJSONArray.Create();
  try
    BackendUsers1.Users.FindUser(AUserId, LUser, LArray);
    Result := LArray.Items[0].GetValue<string>('description');
  finally
    LArray.Free;
  end;
end;

function TNurseStationClientModule.GetPatientData(const AUserId : string): TJSONObject;
var
  LBackend : TBackendEndpoint;
begin
  LBackend := BackendEndpointGetPatient;
  LBackend.Params.Items[0].Value := AUserId;
  LBackend.Execute();
  Result := (LBackend.Response.JSONValue as TJSONObject);
end;

procedure TNurseStationClientModule.Login(const AUserName, APassword: string);
begin
  BackendAuth1.UserName := AUserName;
  BackendAuth1.Password := APassword;
  BackendAuth1.Login();
end;

procedure TNurseStationClientModule.Logout;
begin
  BackendAuth1.Logout();
end;

procedure TNurseStationClientModule.PushEvents1DeviceTokenReceived(
  Sender: TObject);
begin
  if Assigned(FOnDeviceTokenReceived) then
    FOnDeviceTokenReceived;
end;

procedure TNurseStationClientModule.PushEvents1PushReceived(Sender: TObject;
  const AData: TPushData);
var
  LJSONObject: TJSONObject;
begin
  if Assigned(FOnPushReceived) then
  begin
    LJSONObject := TJSONObject.Create;
    try
      AData.Extras.Save(LJSONObject, '');
      FOnPushReceived(AData.Message, LJSONObject);
    finally
      LJSONObject.Free;
    end;
  end;
end;

procedure TNurseStationClientModule.PushRegisterNurse;
var
  LProp : TJSONObject;
begin
  if(PushEvents1.DeviceToken <> '')then
  begin
    LProp := TJSONObject.Create;
    try
      LProp.AddPair('nurseuser', 'nurses');
      PushEvents1.RegisterDevice(LProp);
    finally
      LProp.Free;
    end;
  end;
end;

function TNurseStationClientModule.GetDescription : String;
var
  LUser : TBackendEntityValue;
  LArray : TJSONArray;
begin
  LArray := TJSONArray.Create;
  try
    BackendUsers1.Users.QueryUserName(BackendAuth1.UserName, LUser, LArray);
    Result := LArray.Items[0].GetValue<string>('description');
  finally
    LArray.Free;
  end;
end;

procedure TNurseStationClientModule.PushRegisterPatient;
var
  LProp : TJSONObject;
  LUser : TBackendEntityValue;
begin
  if(PushEvents1.DeviceToken <> '')then
  begin
    LProp := TJSONObject.Create;
    try
      // Get the user Id
      BackendUsers1.Users.QueryUserName(BackendAuth1.UserName, LUser);
      LProp.AddPair('nurseuser', LUser.ObjectID);
      PushEvents1.RegisterDevice(LProp);
    finally
      LProp.Free;
    end;
  end;
end;

procedure TNurseStationClientModule.SendMessageNurse(const AStatus : string);
var
  Backend : TBackendEndpoint;
begin
  Backend := BackendEndpointSendMessageNurse;
  Backend.Params.Items[0].Value := AStatus;
  Backend.Execute();
end;

procedure TNurseStationClientModule.SendMessagePatient(const AUserId: String);
var
  Backend : TBackendEndpoint;
begin
  Backend := BackendEndpointSendMessagePatient;
  backend.Params[0].Value := AUserId;
  Backend.Execute();
end;

procedure TNurseStationClientModule.Signup(const AUserName, APassword: string);
begin
  BackendAuth1.UserName := AUserName;
  BackendAuth1.Password := APassword;
  BackendAuth1.Signup();
end;

end.

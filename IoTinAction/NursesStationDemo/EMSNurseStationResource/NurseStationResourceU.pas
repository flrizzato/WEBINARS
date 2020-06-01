unit NurseStationResourceU;

// EMS Resource Module

interface

uses
  System.SysUtils, System.Classes, System.JSON,
  EMS.Services, EMS.ResourceAPI, EMS.ResourceTypes, NurseStationStorageU;

type
  [ResourceName('NurseStation')]
  TNurseStationResource = class(TDataModule)
  private
    FNurseStationStorage : TNurseStationStorage;
  private
    procedure PushMessageNurses(const AContext: TEndpointContext; const AStatus : string);
    procedure PushMessagePatient(const AContext: TEndpointContext; const APatientId : string);
    procedure CheckAuthorized(const AContext: TEndpointContext);
    procedure HandleException;
    procedure CheckNurseStorage;
  public
    destructor Destroy; override;
  published
    [ResourceSuffix('AddPatient')]
    procedure PostAddPatientData(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
    [ResourceSuffix('GetPatient/{item}')]
    procedure GetPatientData(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
    [ResourceSuffix('SendMessageNurse/{item}')]
    procedure PostSendMessageNurse(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
    [ResourceSuffix('{item}/SendMessagePatient')]
    procedure PostSendMessagePatient(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
  end;

  EPatientError = class(Exception);
  EPatientNotFound = class(EPatientError);

implementation

uses
  REST.Backend.EMSApi, REST.Backend.PushTypes;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

function GetModuleDirectory: string;
begin
  Result := ExtractFilePath(StringReplace(GetModuleName(HInstance),'\\?\','',[rfReplaceAll]));
end;

procedure TNurseStationResource.CheckNurseStorage;
begin
  if FNurseStationStorage = nil then
    FNurseStationStorage := TNurseStationStorage.Create(Self, GetModuleDirectory());
end;

destructor TNurseStationResource.Destroy;
begin
  FNurseStationStorage.Free;
  inherited;
end;

procedure TNurseStationResource.GetPatientData(const AContext: TEndpointContext;
  const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LUserId : String;
  LJson : TJSONObject;
begin
  CheckAuthorized(AContext);
  CheckNurseStorage();
  LUserId := ARequest.Params.Values['item'];
  try
    LJson := FNurseStationStorage.GetDataPatient(LUserId);
    AResponse.Body.SetValue(LJson, True);
  except
    HandleException;
  end;
end;

procedure TNurseStationResource.CheckAuthorized(const AContext: TEndpointContext);
begin
  if AContext.User = nil then
    AContext.Response.RaiseUnauthorized('The operation is only permitted for logged in users');
end;

procedure TNurseStationResource.PostAddPatientData(const AContext: TEndpointContext; const ARequest: TEndpointRequest;
  const AResponse: TEndpointResponse);
var
  LJsonPatient : TJSONObject;
begin
  CheckAuthorized(AContext);
  CheckNurseStorage();
  try
    // Receive a JSON with the patient health data.
    if ARequest.Body.TryGetObject(LJsonPatient) then
    begin
      // Add the patient data
      FNurseStationStorage.AddDataPatient(LJsonPatient);
    end;
  except
    HandleException;
  end;
end;

procedure TNurseStationResource.PostSendMessageNurse(const AContext: TEndpointContext; const ARequest: TEndpointRequest;
  const AResponse: TEndpointResponse);
var
  LJSON : TJSONObject;
  LStatus : string;
begin
  CheckAuthorized(AContext);
  LStatus := ARequest.Params.Values['item'];
  try
    LJSON := TJSONObject.Create();
    LJSON.AddPair('return', 'OK');
    AResponse.Body.SetValue(LJSON, True);
    PushMessageNurses(AContext, LStatus);
  except
    HandleException;
  end;
end;

procedure TNurseStationResource.PostSendMessagePatient(const AContext: TEndpointContext; const ARequest: TEndpointRequest;
  const AResponse: TEndpointResponse);
var
  LJSON : TJSONObject;
  LPatientId : String;
begin
  CheckAuthorized(AContext);
  LPatientId := ARequest.Params.Values['item'];
  try
    LJSON := TJSONObject.Create();
    LJSON.AddPair('return', 'OK');
    AResponse.Body.SetValue(LJSON, True);
    PushMessagePatient(AContext, LPatientId);
  except
    HandleException;
  end;
end;

procedure TNurseStationResource.PushMessageNurses(const AContext: TEndpointContext; const AStatus : string);
var
  LEMSAPI: TEMSInternalAPI;
  LData: TJSONObject;
  LWhere: TJSONObject;
  LJSON: TJSONObject;
  // Json Message
  LJsonMess : TJSONObject;
begin
  // Create in-process EMS API
  LEMSAPI := TEMSInternalAPI.Create(AContext);
  LWhere := nil;
  LJSON := nil;
  LJsonMess := TJSONObject.Create();
  LJSON := TJSONObject.Create();
  LData := TJSONObject.Create();
  try
    LJSON.AddPair('data', LData);
    // Message and Status
    LJsonMess.AddPair('message', AContext.User.UserID);
    LJsonMess.AddPair('status', AStatus);
    // Gcm
    LData.AddPair('title', 'Reminder');
    LData.AddPair('message', LJsonMess.ToString());
    // IOS
    LData.AddPair('alert', LJsonMess.ToString());

    LWhere := TJSONObject.Create;
    LWhere.AddPair('nurseuser', 'nurses');  // Target assignee
    LEMSAPI.PushWhere(LData, LWhere);
  finally
    LEMSAPI.Free;
    LWhere.Free;
    LJSON.Free;
    LJsonMess.Free;
  end;
end;

procedure TNurseStationResource.PushMessagePatient(const AContext: TEndpointContext;
  const APatientId : string);
var
  LEMSAPI: TEMSInternalAPI;
  LData: TJSONObject;
  LWhere: TJSONObject;
  LJSON: TJSONObject;
begin
  // Create in-process EMS API
  LEMSAPI := TEMSInternalAPI.Create(AContext);
  LWhere := nil;
  LJSON := nil;
  try
    LJSON := TJSONObject.Create;
    LData := TJSONObject.Create;
    LJSON.AddPair('data', LData);
    // Gcm
    LData.AddPair('title', 'Reminder');
    LData.AddPair('message', 'The Nurse is ready to see you now');
    // IOS
    LData.AddPair('alert', 'The Nurse is ready to see you now');

    LWhere := TJSONObject.Create;
    LWhere.AddPair('nurseuser', APatientId);  // Target assignee
    LEMSAPI.PushWhere(LJSON, LWhere);
  finally
    LEMSAPI.Free;
    LWhere.Free;
    LJSON.Free;
  end;
end;

procedure TNurseStationResource.HandleException;
var
  LException: TObject;
  LMessage: string;
begin
  LException := ExceptObject;
  Assert(LException <> nil); // should be within an except block
  if LException is Exception then
  begin
    LMessage := Exception(LException).Message;
    if LException is EPatientError then
      EEMSHTTPError.RaiseDuplicate(LMessage)
    else if LException is EPatientNotFound then
      EEMSHTTPError.RaiseNotFound(LMessage)
    else
    begin
      LException := TObject(AcquireExceptionObject);
      Assert(LException <> nil);  // should be within an except block
      raise LException;
    end;
  end;
end;

procedure Register;
begin
  RegisterResource(TypeInfo(TNurseStationResource));
end;

initialization
  Register;
end.



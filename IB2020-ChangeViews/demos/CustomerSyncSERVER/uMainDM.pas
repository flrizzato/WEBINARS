unit uMainDM;

// EMS Resource Module

interface

uses
  System.SysUtils, System.Classes, System.JSON,
  EMS.Services, EMS.ResourceAPI, EMS.ResourceTypes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.ConsoleUI.Wait, FireDAC.Comp.UI,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, FireDAC.Stan.StorageJSON;

type

  [ResourceName('CustomerSync')]
  TCustomerSyncResource1 = class(TDataModule)
    qryCustomer: TFDQuery;
    qryCustomerCUSTNO: TFloatField;
    qryCustomerCOMPANY: TStringField;
    qryCustomerADDR1: TStringField;
    qryCustomerADDR2: TStringField;
    qryCustomerCITY: TStringField;
    qryCustomerSTATE: TStringField;
    qryCustomerZIP: TStringField;
    qryCustomerCOUNTRY: TStringField;
    qryCustomerPHONE: TStringField;
    qryCustomerFAX: TStringField;
    qryCustomerTAXRATE: TFloatField;
    qryCustomerCONTACT: TStringField;
    qryCustomerLASTINVOICEDATE: TSQLTimeStampField;
    cnnMastSQL: TFDConnection;
    FDTransDefault: TFDTransaction;
    FDTransSnapshot: TFDTransaction;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    memCustomerChanges: TFDMemTable;
    memCustomerChangesCUSTNO: TFloatField;
    memCustomerChangesCOMPANY: TStringField;
    memCustomerChangesADDR1: TStringField;
    memCustomerChangesADDR2: TStringField;
    memCustomerChangesCITY: TStringField;
    memCustomerChangesSTATE: TStringField;
    memCustomerChangesZIP: TStringField;
    memCustomerChangesCOUNTRY: TStringField;
    memCustomerChangesPHONE: TStringField;
    memCustomerChangesFAX: TStringField;
    memCustomerChangesTAXRATE: TFloatField;
    memCustomerChangesCONTACT: TStringField;
    memCustomerChangesLASTINVOICEDATE: TSQLTimeStampField;
  published
    procedure Get(const AContext: TEndpointContext;
      const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
    procedure Post(const AContext: TEndpointContext;
      const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}
{$R *.dfm}

procedure TCustomerSyncResource1.Get(const AContext: TEndpointContext;
  const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  fMemoryStream: TMemoryStream;
  sDeviceName, sDBUser, sDBPass: string;
begin
  if (not ARequest.Params.TryGetValue('DeviceName', sDeviceName)) or
    (not ARequest.Params.TryGetValue('DBUser', sDBUser)) or
    (not ARequest.Params.TryGetValue('DBPass', sDBPass)) then
  begin
    AResponse.Body.SetValue
      (TJSONString.Create('All parameters are mandatory!'), True);
    exit;
  end;

  try
    cnnMastSQL.Close;
    cnnMastSQL.Params.UserName := sDBUser;
    cnnMastSQL.Params.Password := sDBPass;
    cnnMastSQL.Open;

    cnnMastSQL.StartTransaction;
    cnnMastSQL.ExecSQL('SET SUBSCRIPTION CUSTOMER_SUB AT ' +
      QuotedSTR(sDeviceName) + ' ACTIVE');

    qryCustomer.Open;
    fMemoryStream := TMemoryStream.Create;
    qryCustomer.SaveToStream(fMemoryStream, TFDStorageFormat.sfJSON);
    AResponse.Body.SetStream(fMemoryStream, 'application/json', True);

    cnnMastSQL.Commit;
  except
    on E: Exception do
    begin
      cnnMastSQL.Rollback;
      raise Exception.Create('Get error:' + E.Message);
    end;
  end;
end;

procedure TCustomerSyncResource1.Post(const AContext: TEndpointContext;
  const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  fMemoryStream: TStream;
  sDeviceName, sDBUser, sDBPass: string;
begin
  if (not ARequest.Body.TryGetStream(fMemoryStream)) or
    (not ARequest.Params.TryGetValue('DeviceName', sDeviceName)) or
    (not ARequest.Params.TryGetValue('DBUser', sDBUser)) or
    (not ARequest.Params.TryGetValue('DBPass', sDBPass)) then
  begin
    AResponse.Body.SetValue
      (TJSONString.Create('All parameters are mandatory!'), True);
    exit;
  end;

  try
    memCustomerChanges.LoadFromStream(fMemoryStream, TFDStorageFormat.sfJSON);

    cnnMastSQL.Close;
    cnnMastSQL.Params.UserName := sDBUser;
    cnnMastSQL.Params.Password := sDBPass;
    cnnMastSQL.Open;

    cnnMastSQL.StartTransaction;

    qryCustomer.Open;
    qryCustomer.MergeDataSet(memCustomerChanges, TFDMergeDataMode.dmDeltaMerge,
      TFDMergeMetaMode.mmUpdate);
    if qryCustomer.ChangeCount > 0 then
      qryCustomer.ApplyUpdates(-1);

    cnnMastSQL.Commit;
  except
    on E: Exception do
    begin
      cnnMastSQL.Rollback;
      raise Exception.Create('Post error:' + E.Message);
    end;
  end;
end;

procedure Register;
begin
  RegisterResource(TypeInfo(TCustomerSyncResource1));
end;

initialization

Register;

end.

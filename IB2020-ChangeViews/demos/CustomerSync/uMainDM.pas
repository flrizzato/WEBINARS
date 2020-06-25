unit uMainDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.FMXUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.IBBase, FireDAC.Comp.UI,
  REST.Backend.EMSServices, REST.Backend.EMSFireDAC, REST.Backend.EMSProvider,
  FireDAC.Stan.StorageJSON, REST.Types, REST.Client, REST.Response.Adapter,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TMainDM = class(TDataModule)
    cnnMastSQL: TFDConnection;
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
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    memRemoteChanges: TFDMemTable;
    memRemoteChangesCUSTNO: TFloatField;
    memRemoteChangesCOMPANY: TStringField;
    memRemoteChangesADDR1: TStringField;
    memRemoteChangesADDR2: TStringField;
    memRemoteChangesCITY: TStringField;
    memRemoteChangesSTATE: TStringField;
    memRemoteChangesZIP: TStringField;
    memRemoteChangesCOUNTRY: TStringField;
    memRemoteChangesPHONE: TStringField;
    memRemoteChangesFAX: TStringField;
    memRemoteChangesTAXRATE: TFloatField;
    memRemoteChangesCONTACT: TStringField;
    memRemoteChangesLASTINVOICEDATE: TSQLTimeStampField;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    qryLocalChanges: TFDQuery;
    qryLocalChangesCUSTNO: TFloatField;
    qryLocalChangesCOMPANY: TStringField;
    qryLocalChangesADDR1: TStringField;
    qryLocalChangesADDR2: TStringField;
    qryLocalChangesCITY: TStringField;
    qryLocalChangesSTATE: TStringField;
    qryLocalChangesZIP: TStringField;
    qryLocalChangesCOUNTRY: TStringField;
    qryLocalChangesPHONE: TStringField;
    qryLocalChangesFAX: TStringField;
    qryLocalChangesTAXRATE: TFloatField;
    qryLocalChangesCONTACT: TStringField;
    qryLocalChangesLASTINVOICEDATE: TSQLTimeStampField;
    FDTransSnapshot: TFDTransaction;
    cnnMastSQLDelta: TFDConnection;
    RESTClientSync: TRESTClient;
    RESTRequestGET: TRESTRequest;
    RESTResponseGET: TRESTResponse;
    RESTRequestPOST: TRESTRequest;
    RESTResponsePOST: TRESTResponse;
    procedure qryCustomerAfterDelete(DataSet: TDataSet);
    procedure qryCustomerAfterPost(DataSet: TDataSet);
    procedure qryCustomerAfterCancel(DataSet: TDataSet);
    procedure cnnMastSQLBeforeConnect(Sender: TObject);
    procedure RESTRequestGETAfterExecute(Sender: TCustomRESTRequest);
  private
    { Private declarations }
    fDeviceName: string;
  public
    { Public declarations }
    property DeviceName: string read fDeviceName write fDeviceName;
    function DoDatabaseLogin(fUser, fPass: string): Boolean;
    procedure GetRemoteChanges;
    procedure GetLocalChanges;
    procedure ApplyAllChanges;
  end;

var
  MainDM: TMainDM;

const
  fRemoteDBUser: string = 'USER2';
  fRemoteDBPass: string = '123';

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}

uses System.IOUtils;

procedure TMainDM.cnnMastSQLBeforeConnect(Sender: TObject);

  procedure SetupDatabase(fCnn: TFDConnection);
  begin
    fCnn.Params.Database := TPath.GetDocumentsPath + PathDelim +
      'MASTSQL2020MOB.IB';
    fCnn.Params.Values['Protocol'] := 'local';
    fCnn.Params.Values['Server'] := '';
  end;

begin
{$IFDEF MSWINDOWS}
  //
{$ELSE}
  SetupDatabase(cnnMastSQL);
  SetupDatabase(cnnMastSQLDelta);
{$ENDIF}
end;

function TMainDM.DoDatabaseLogin(fUser, fPass: string): Boolean;

  procedure SetupUsername(fCnn: TFDConnection);
  begin
    fCnn.Close;
    fCnn.Params.UserName := fUser;
    fCnn.Params.Password := fPass;
    fCnn.Open;
  end;

begin
  try
    SetupUsername(cnnMastSQL);
    SetupUsername(cnnMastSQLDelta);
    result := True;
  except
    on E: Exception do
      raise Exception.Create('Error Message: ' + E.Message);
  end;
end;

procedure TMainDM.GetRemoteChanges;
begin
  try
    RESTRequestGET.Params.Clear;
    RESTRequestGET.AddParameter('DeviceName', fDeviceName, pkGETorPOST);
    RESTRequestGET.AddParameter('DBUser', fRemoteDBUser, pkGETorPOST);
    RESTRequestGET.AddParameter('DBPass', fRemoteDBPass, pkGETorPOST);
    RESTRequestGET.Execute;
  except
    on E: Exception do
      raise Exception.Create('Error Message:' + E.Message);
  end;
end;

procedure TMainDM.GetLocalChanges;
begin
  try
    if cnnMastSQLDelta.InTransaction then
      cnnMastSQLDelta.Rollback;
    cnnMastSQLDelta.StartTransaction;

    cnnMastSQLDelta.ExecSQL('SET SUBSCRIPTION CUSTOMER_SUB AT ' +
      QuotedSTR(fDeviceName) + ' ACTIVE');

    if qryLocalChanges.Active then
      qryLocalChanges.Close;
    qryLocalChanges.Open;
  except
    on E: Exception do
      raise Exception.Create('Error Message:' + E.Message);
  end;
end;

procedure TMainDM.ApplyAllChanges;
var
  fMemoryStream: TMemoryStream;
begin
  // sending local changes to the remote database
  if qryLocalChanges.Active and (qryLocalChanges.RecordCount > 0) then
  begin
    try
      fMemoryStream := TMemoryStream.Create;
      try
        qryLocalChanges.SaveToStream(fMemoryStream, TFDStorageFormat.sfJSON);

        RESTRequestPOST.Body.ClearBody;
        RESTRequestPOST.Body.Add(fMemoryStream,
          TRESTContentType.ctAPPLICATION_JSON);

        RESTRequestPOST.Params.Clear;
        RESTRequestPOST.AddParameter('DeviceName', fDeviceName, pkGETorPOST);
        RESTRequestPOST.AddParameter('DBUser', fRemoteDBUser, pkGETorPOST);
        RESTRequestPOST.AddParameter('DBPass', fRemoteDBPass, pkGETorPOST);
        RESTRequestPOST.Execute;

        if RESTResponsePOST.StatusCode = 200 then
        begin
          if cnnMastSQLDelta.InTransaction then
            cnnMastSQLDelta.Commit;
        end
        else
          raise Exception.Create('Response status code/message: ' +
            RESTResponsePOST.StatusCode.ToString + '/' +
            RESTResponsePOST.StatusText);
      except
        on E: Exception do
          raise Exception.Create('Post error:' + E.Message);
      end;
    finally
      fMemoryStream.Free;
    end;
  end;

  // applying remote changes in the local database
  if memRemoteChanges.Active and (memRemoteChanges.RecordCount > 0) then
  begin
    try
      qryCustomer.DisableControls;
      qryLocalChanges.DisableControls;
      try
        qryCustomer.Open;
        qryCustomer.MergeDataSet(memRemoteChanges,
          TFDMergeDataMode.dmDeltaMerge, TFDMergeMetaMode.mmUpdate);
        if qryCustomer.ChangeCount > 0 then
          qryCustomer.ApplyUpdates(-1);

        // defining the local check point
        cnnMastSQLDelta.StartTransaction;
        cnnMastSQLDelta.ExecSQL('SET SUBSCRIPTION CUSTOMER_SUB AT ' +
          QuotedSTR(fDeviceName) + ' ACTIVE');
        qryLocalChanges.Open;
        cnnMastSQLDelta.Commit;
      except
        on E: Exception do
        begin
          cnnMastSQL.Rollback;
          raise Exception.Create('Error Message:' + E.Message);
        end;
      end;
    finally
      qryCustomer.Close;
      qryCustomer.EnableControls;
      qryLocalChanges.Close;
      qryLocalChanges.EnableControls;
    end;
  end;

end;

procedure TMainDM.qryCustomerAfterCancel(DataSet: TDataSet);
begin
  TFDQuery(DataSet).CancelUpdates;
end;

procedure TMainDM.qryCustomerAfterDelete(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ApplyUpdates(-1);
end;

procedure TMainDM.qryCustomerAfterPost(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ApplyUpdates(-1);
end;

procedure TMainDM.RESTRequestGETAfterExecute(Sender: TCustomRESTRequest);
var
  fStringStream: TStringStream;
begin
  fStringStream := TStringStream.Create(RESTResponseGET.Content);
  try
    fStringStream.Position := 0;
    memRemoteChanges.LoadFromStream(fStringStream, TFDStorageFormat.sfJSON);
  finally
    fStringStream.Free;
  end;
end;

end.

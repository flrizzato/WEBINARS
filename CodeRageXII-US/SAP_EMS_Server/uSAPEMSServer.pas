unit uSAPEMSServer;

// EMS Resource Module

interface

uses
  System.SysUtils, System.Classes, System.JSON, Data.FmtBcd,
  EMS.Services, EMS.ResourceAPI, EMS.ResourceTypes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.CDataSAP, FireDAC.Phys.CDataSAPDef, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.ConsoleUI.Wait,
  FireDAC.Comp.UI, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.StorageJSON;

type
  [ResourceName('SAPEMSServer')]
  TSAPEMSServerResource1 = class(TDataModule)
    CdatasapConnection: TFDConnection;
    VbakView: TFDQuery;
    FDPhysCDataSAPDriverLink1: TFDPhysCDataSAPDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDSchemaAdapter1: TFDSchemaAdapter;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    VbakViewVBELN: TWideStringField;
    VbakViewAUDAT: TSQLTimeStampField;
    VbakViewVKORG: TWideStringField;
    VbakViewNETWR: TFloatField;
  published
    procedure Get(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TSAPEMSServerResource1.Get(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  fMem: TMemoryStream;
begin
  fMem := TMemoryStream.Create;
  try
    VbakView.Open;
    FDSchemaAdapter1.SaveToStream(fMem, TFDStorageFormat.sfJSON);
    AResponse.Body.SetStream(fMem, 'application/json', True);
  except
    on E: Exception do
    begin
      fMem.Free;
      raise;
    end;
  end;
end;

procedure Register;
begin
  RegisterResource(TypeInfo(TSAPEMSServerResource1));
end;

initialization
  Register;
end.



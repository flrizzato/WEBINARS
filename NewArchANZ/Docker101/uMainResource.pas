unit uMainResource;

// EMS Resource Module

interface

uses
  System.SysUtils, System.Classes, System.JSON,
  EMS.Services, EMS.ResourceAPI, EMS.ResourceTypes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.ConsoleUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  EMS.DataSetResource, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  [ResourceName('docker101')]
  TDockerResource1 = class(TDataModule)
    FDConnection1: TFDConnection;
    qrysakilaactor: TFDQuery;
    [ResourceSuffix('sakilaactor')]
    dsrsakilaactor: TEMSDataSetResource;
    qrysakilaactor_info: TFDQuery;
    [ResourceSuffix('sakilaactor_info')]
    dsrsakilaactor_info: TEMSDataSetResource;
    qrysakilaaddress: TFDQuery;
    [ResourceSuffix('sakilaaddress')]
    dsrsakilaaddress: TEMSDataSetResource;
    qrysakilacategory: TFDQuery;
    [ResourceSuffix('sakilacategory')]
    dsrsakilacategory: TEMSDataSetResource;
    qrysakilacity: TFDQuery;
    [ResourceSuffix('sakilacity')]
    dsrsakilacity: TEMSDataSetResource;
    qrysakilacountry: TFDQuery;
    [ResourceSuffix('sakilacountry')]
    dsrsakilacountry: TEMSDataSetResource;
    qrysakilacustomer: TFDQuery;
    [ResourceSuffix('sakilacustomer')]
    dsrsakilacustomer: TEMSDataSetResource;
    qrysakilacustomer_list: TFDQuery;
    [ResourceSuffix('sakilacustomer_list')]
    dsrsakilacustomer_list: TEMSDataSetResource;
    qrysakilafilm: TFDQuery;
    [ResourceSuffix('sakilafilm')]
    dsrsakilafilm: TEMSDataSetResource;
    qrysakilafilm_actor: TFDQuery;
    [ResourceSuffix('sakilafilm_actor')]
    dsrsakilafilm_actor: TEMSDataSetResource;
    qrysakilafilm_category: TFDQuery;
    [ResourceSuffix('sakilafilm_category')]
    dsrsakilafilm_category: TEMSDataSetResource;
    qrysakilafilm_list: TFDQuery;
    [ResourceSuffix('sakilafilm_list')]
    dsrsakilafilm_list: TEMSDataSetResource;
    qrysakilafilm_text: TFDQuery;
    [ResourceSuffix('sakilafilm_text')]
    dsrsakilafilm_text: TEMSDataSetResource;
    qrysakilainventory: TFDQuery;
    [ResourceSuffix('sakilainventory')]
    dsrsakilainventory: TEMSDataSetResource;
    qrysakilalanguage: TFDQuery;
    [ResourceSuffix('sakilalanguage')]
    dsrsakilalanguage: TEMSDataSetResource;
    qrysakilanicer_but_slower_film_list: TFDQuery;
    [ResourceSuffix('sakilanicer_but_slower_film_list')]
    dsrsakilanicer_but_slower_film_list: TEMSDataSetResource;
    qrysakilapayment: TFDQuery;
    [ResourceSuffix('sakilapayment')]
    dsrsakilapayment: TEMSDataSetResource;
    qrysakilarental: TFDQuery;
    [ResourceSuffix('sakilarental')]
    dsrsakilarental: TEMSDataSetResource;
    qrysakilasales_by_film_category: TFDQuery;
    [ResourceSuffix('sakilasales_by_film_category')]
    dsrsakilasales_by_film_category: TEMSDataSetResource;
    qrysakilasales_by_store: TFDQuery;
    [ResourceSuffix('sakilasales_by_store')]
    dsrsakilasales_by_store: TEMSDataSetResource;
    qrysakilastaff: TFDQuery;
    [ResourceSuffix('sakilastaff')]
    dsrsakilastaff: TEMSDataSetResource;
    qrysakilastaff_list: TFDQuery;
    [ResourceSuffix('sakilastaff_list')]
    dsrsakilastaff_list: TEMSDataSetResource;
    qrysakilastore: TFDQuery;
    [ResourceSuffix('sakilastore')]
    dsrsakilastore: TEMSDataSetResource;

  published

    [EndPointRequestSummary('Tests', 'ListItems', 'Retrieves list of items', 'application/json', '')]
    [EndPointResponseDetails(200, 'Ok', TAPIDoc.TPrimitiveType.spObject, TAPIDoc.TPrimitiveFormat.None, '', '')]
    procedure Get(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);

    [EndPointRequestSummary('Tests', 'GetItem', 'Retrieves item with specified ID', 'application/json', '')]
    [EndPointRequestParameter(TAPIDocParameter.TParameterIn.Path, 'item', 'A item ID', true, TAPIDoc.TPrimitiveType.spString,
      TAPIDoc.TPrimitiveFormat.None, TAPIDoc.TPrimitiveType.spString, '', '')]
    [EndPointResponseDetails(200, 'Ok', TAPIDoc.TPrimitiveType.spObject, TAPIDoc.TPrimitiveFormat.None, '', '')]
    [EndPointResponseDetails(404, 'Not Found', TAPIDoc.TPrimitiveType.spNull, TAPIDoc.TPrimitiveFormat.None, '', '')]
    [ResourceSuffix('{item}')]
    procedure GetItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);

    [EndPointRequestSummary('Tests', 'PostItem', 'Creates new item', '', 'application/json')]
    [EndPointRequestParameter(TAPIDocParameter.TParameterIn.Body, 'body', 'A new item content', true, TAPIDoc.TPrimitiveType.spObject,
      TAPIDoc.TPrimitiveFormat.None, TAPIDoc.TPrimitiveType.spObject, '', '')]
    [EndPointResponseDetails(200, 'Ok', TAPIDoc.TPrimitiveType.spNull, TAPIDoc.TPrimitiveFormat.None, '', '')]
    [EndPointResponseDetails(409, 'Item Exist', TAPIDoc.TPrimitiveType.spNull, TAPIDoc.TPrimitiveFormat.None, '', '')]
    procedure Post(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);

    [EndPointRequestSummary('Tests', 'PutItem', 'Updates item with specified ID', '', 'application/json')]
    [EndPointRequestParameter(TAPIDocParameter.TParameterIn.Path, 'item', 'A item ID', true, TAPIDoc.TPrimitiveType.spString,
      TAPIDoc.TPrimitiveFormat.None, TAPIDoc.TPrimitiveType.spString, '', '')]
    [EndPointRequestParameter(TAPIDocParameter.TParameterIn.Body, 'body', 'A item changes', true, TAPIDoc.TPrimitiveType.spObject,
      TAPIDoc.TPrimitiveFormat.None, TAPIDoc.TPrimitiveType.spObject, '', '')]
    [EndPointResponseDetails(200, 'Ok', TAPIDoc.TPrimitiveType.spNull, TAPIDoc.TPrimitiveFormat.None, '', '')]
    [EndPointResponseDetails(404, 'Not Found', TAPIDoc.TPrimitiveType.spNull, TAPIDoc.TPrimitiveFormat.None, '', '')]
    [ResourceSuffix('{item}')]
    procedure PutItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);

    [EndPointRequestSummary('Tests', 'DeleteItem', 'Deletes item with specified ID', '', '')]
    [EndPointRequestParameter(TAPIDocParameter.TParameterIn.Path, 'item', 'A item ID', true, TAPIDoc.TPrimitiveType.spString,
      TAPIDoc.TPrimitiveFormat.None, TAPIDoc.TPrimitiveType.spString, '', '')]
    [EndPointResponseDetails(200, 'Ok', TAPIDoc.TPrimitiveType.spNull, TAPIDoc.TPrimitiveFormat.None, '', '')]
    [EndPointResponseDetails(404, 'Not Found', TAPIDoc.TPrimitiveType.spNull, TAPIDoc.TPrimitiveFormat.None, '', '')]
    [ResourceSuffix('{item}')]
    procedure DeleteItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TDockerResource1.Get(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
begin
  // Sample code
  AResponse.Body.SetValue(TJSONString.Create('docker101'), True)
end;

procedure TDockerResource1.GetItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LItem: string;
begin
  LItem := ARequest.Params.Values['item'];
  // Sample code
  AResponse.Body.SetValue(TJSONString.Create('docker101 ' + LItem), True)
end;

procedure TDockerResource1.Post(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
begin
end;

procedure TDockerResource1.PutItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LItem: string;
begin
  LItem := ARequest.Params.Values['item'];
end;

procedure TDockerResource1.DeleteItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LItem: string;
begin
  LItem := ARequest.Params.Values['item'];
end;

procedure Register;
begin
  RegisterResource(TypeInfo(TDockerResource1));
end;

initialization
  Register;
end.



unit NurseStationStorageU;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.JSON;

type
  TNurseStationStorage = class(TDataModule)
    FDConnection1: TFDConnection;
    qrySelectId: TFDQuery;
    qryUpdate: TFDQuery;
    qryInsert: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    FPath : String;
    function ExistPatient(const AUserId : string) : boolean;
  public
    constructor Create(AOwner: TComponent; const APath : String);reintroduce;
    { Public declarations }
  public
    procedure AddDataPatient(const AData : TJSONObject);
    function GetDataPatient(const AUserId : String): TJSONObject;
  end;

var
  NurseStationStorage: TNurseStationStorage;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TNurseStationStorage }

procedure TNurseStationStorage.AddDataPatient(const AData: TJSONObject);
begin
  // Insert or update patient row
  if(ExistPatient(AData.GetValue('id').Value))then // Update
  begin
    qryUpdate.Params.ParamByName('heart').Value := AData.GetValue('heart_rate').Value;
    qryUpdate.Params.ParamByName('weight').Value := AData.GetValue('weight').Value;
    qryUpdate.Params.ParamByName('id').Value := AData.GetValue('id').Value;
    qryUpdate.ExecSQL();
  end
  else
  begin   // Insert
    qryInsert.Params.ParamByName('heart').Value := AData.GetValue('heart_rate').Value;
    qryInsert.Params.ParamByName('weight').Value := AData.GetValue('weight').Value;
    qryInsert.Params.ParamByName('id').Value := AData.GetValue('id').Value;
    qryInsert.ExecSQL();
  end;
end;

constructor TNurseStationStorage.Create(AOwner: TComponent; const APath: String);
begin
  inherited Create(AOwner);
  FPath := APath;
end;

procedure TNurseStationStorage.DataModuleCreate(Sender: TObject);
begin
  // C:\Developer\Embarcadero\NurseDemo\Final\Database\NURSESDB.IB
  //FDConnection1.Params.Database := FPath + '..\..\..\DATABASE\NURSESDB.IB';
  FDConnection1.Connected := True;
end;

function TNurseStationStorage.ExistPatient(const AUserId: string): boolean;
begin
  if(not FDConnection1.Connected)then
    FDConnection1.Connected := True;
  qrySelectId.ParamByName('id').Value := AUserId;
  qrySelectId.Active := True;
  if(qrySelectId.Eof)then
    Result := False
  else
    Result := True;
  qrySelectId.Active := False;
end;

function TNurseStationStorage.GetDataPatient(const AUserId: String): TJSONObject;
begin
  Result := TJSONObject.Create();
  // Assign the Id
  Result.AddPair('Id', AUserId);
  if(not FDConnection1.Connected)then
    FDConnection1.Connected := True;
  qrySelectId.ParamByName('id').Value := AUserId;
  qrySelectId.Active := True;
  if(not qrySelectId.Eof) then
  begin
    Result.AddPair('heart_rate', TJSONString.Create(qrySelectId.FieldByName('heart_rate').AsString));
    Result.AddPair('weight', TJSONString.Create(qrySelectId.FieldByName('weight').AsString));
  end
  else
  begin
    Result.AddPair('heart_rate', '0');
    Result.AddPair('weight', '0');
  end;
  qrySelectId.Active := False;
end;

end.

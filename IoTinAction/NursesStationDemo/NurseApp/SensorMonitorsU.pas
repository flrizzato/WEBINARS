unit SensorMonitorsU;

interface

uses
  System.Bluetooth.Components, System.Bluetooth,System.SysUtils, FMX.Edit;

type
  // Update Event Heart Monitor
  TEventHeartMonitorUpdateData = procedure(const AMeasurement : string; const ASensorLocation : String) of object;
  // Heart monitor
  THeartMonitor = class
  private
    FBluetoothLE : TBluetoothLE;
    FBLEDevice: TBluetoothLEDevice;
    FRateMeasurementData: string;
    FSensorLocationData: string;
    FHRGattService: TBluetoothGattService;
    FHRMeasurementGattCharact: TBluetoothGattCharacteristic;
    FBodySensorLocationGattCharact: TBluetoothGattCharacteristic;
    FOnUpdateData: TEventHeartMonitorUpdateData;
    procedure ManageCharacteristicData(const ACharacteristic: TBluetoothGattCharacteristic);
    function GetMeasurementData(Data: TBytes): String;
    function GetSensorLocationData(Index: Byte): String;
  protected
    procedure OnCharacteristicRead(const Sender: TObject; const ACharacteristic: TBluetoothGattCharacteristic;
      AGattStatus: TBluetoothGattStatus);
    procedure OnEndDiscoverDevices(const Sender: TObject; const ADeviceList: TBluetoothLEDeviceList);
    procedure UpdateData(const ADataMea : String; const ADataSensor : String);
  public
    constructor Create;
    procedure Connect;
    procedure Disconnect;
    destructor Destroy; override;
  public
    property RateMeasurementData : string read FRateMeasurementData;
    property SensorLocationData : string read FSensorLocationData;
    property OnUpdateData : TEventHeartMonitorUpdateData read FOnUpdateData write FOnUpdateData;
  end;

  // Update Event Heart Monitor
  TEventWeightMonitorUpdateData = procedure(const AWeight : double) of object;
  // Weight Monitor
  TWeightMonitor = class
  private
    FBluetoothLE : TBluetoothLE;
    FBLEDevice: TBluetoothLEDevice;
    FOnUpdateData: TEventWeightMonitorUpdateData;
    FWeightGattService: TBluetoothGattService;
    FWeightMeasurementGattCharacteristic: TBluetoothGattCharacteristic;
  protected
    procedure OnCharacteristicRead(const Sender: TObject; const ACharacteristic: TBluetoothGattCharacteristic;
      AGattStatus: TBluetoothGattStatus);
    procedure OnEndDiscoverDevices(const Sender: TObject; const ADeviceList: TBluetoothLEDeviceList);
    procedure UpdateData(const AWeight : double);
  public
    constructor Create;
    procedure Connect;
    procedure Disconnect;
    destructor Destroy; override;
  public
    property OnUpdateData : TEventWeightMonitorUpdateData read FOnUpdateData write FOnUpdateData;
  end;

implementation

uses
  System.Classes, FMX.Dialogs;

type
  TSensorContactStatus = (NonSupported, NonDetected, Detected);

  THRMFlags = record
    HRValue16bits: boolean;
    SensorContactStatus: TSensorContactStatus;
    EnergyExpended: boolean;
    RRInterval: boolean;
  end;

const
  HEART_HRSERVICE: TBluetoothUUID = '{0000180D-0000-1000-8000-00805F9B34FB}';
  HEART_HRMEASUREMENT_CHARACTERISTIC: TBluetoothUUID  = '{00002A37-0000-1000-8000-00805F9B34FB}';
  HEART_BODY_SENSOR_LOCATION_CHARACTERISTIC: TBluetoothUUID  = '{00002A38-0000-1000-8000-00805F9B34FB}';

  BodySensorLocations : array[0..6] of string = ('Other', 'Chest', 'Wrist', 'Finger', 'Hand', 'Ear Lobe', 'Foot');

  HEART_HR_VALUE_FORMAT_MASK = $1;
  HEART_SENSOR_CONTACT_STATUS_MASK = $6;
  HEART_ENERGY_EXPANDED_STATUS_MASK = $8;
  HEART_RR_INTERVAL_MASK = $10;

  WEIGHT_DEVICE: TBluetoothUUID = '{00001901-0000-1000-8000-00805F9B34FB}';
  WEIGHT_SERVICE: TBluetoothUUID = '{00001901-0000-1000-8000-00805F9B34FB}';
  WEIGHT_CHARACTERISTIC : TBluetoothUUID = '{00002B01-0000-1000-8000-00805F9B34FB}';

{ TWeightMonitor }

procedure THeartMonitor.Connect;
begin
  FBluetoothLE.Enabled := True;
  FBluetoothLE.DiscoverDevices(2500, [HEART_HRSERVICE]);
end;

constructor THeartMonitor.Create;
begin
  inherited;
  FBluetoothLE := TBluetoothLE.Create(nil);
  FBluetoothLE.OnCharacteristicRead := OnCharacteristicRead;
  FBluetoothLE.OnEndDiscoverDevices := OnEndDiscoverDevices;
end;

destructor THeartMonitor.Destroy;
begin
  Disconnect();
  FreeAndNil(FBluetoothLE);
  inherited;
end;

procedure THeartMonitor.Disconnect;
begin
  try
    if FHRMeasurementGattCharact <> nil then
    begin
      if FBluetoothLE.Enabled then
      begin
        FBluetoothLE.UnSubscribeToCharacteristic(FBLEDevice, FHRMeasurementGattCharact);
        FBluetoothLE.UnSubscribeToCharacteristic(FBLEDevice, FBodySensorLocationGattCharact);
        FBLEDevice.Disconnect();
      end
    end;
    FBluetoothLE.Enabled := False;
  except
    FBluetoothLE.Enabled := False;
  end;
end;

function GetFlags(Data: Byte): THRMFlags;
var
  LValue: Byte;
begin
  Result.HRValue16bits := (Data and HEART_HR_VALUE_FORMAT_MASK) = 1;
  LValue := (Data and HEART_SENSOR_CONTACT_STATUS_MASK) shr 1;
  case LValue of
    2: Result.SensorContactStatus := NonDetected;
    3: Result.SensorContactStatus := Detected;
    else
      Result.SensorContactStatus := NonSupported;
  end;
  Result.EnergyExpended := ((Data and HEART_ENERGY_EXPANDED_STATUS_MASK) shr 3) = 1;
  Result.RRInterval := ((Data and HEART_RR_INTERVAL_MASK) shr 4) = 1;
end;

function THeartMonitor.GetMeasurementData(Data: TBytes): String;
var
  Flags: THRMFlags;
  LBPM: Integer;
begin
  Flags := GetFlags(Data[0]);
  if Flags.HRValue16bits then
    LBPM := Data[1] + (Data[2] * 16)
  else
    LBPM := Data[1];
  begin
    Result := LBPM.ToString + ' bpm';
  end;
end;

function THeartMonitor.GetSensorLocationData(Index: Byte): String;
begin
  if Index > 6 then
    Result := ''
  else
    Result := BodySensorLocations[Index];
end;

procedure THeartMonitor.ManageCharacteristicData(const ACharacteristic: TBluetoothGattCharacteristic);
begin
  if ACharacteristic.UUID = HEART_HRMEASUREMENT_CHARACTERISTIC then
  begin
    FRateMeasurementData := GetMeasurementData(ACharacteristic.Value);
  end;
  if ACharacteristic.UUID = HEART_BODY_SENSOR_LOCATION_CHARACTERISTIC then
  begin
    FSensorLocationData := GetSensorLocationData(ACharacteristic.Value[0]);
  end;
  UpdateData(FRateMeasurementData, FSensorLocationData);
end;

function BytesToString(const B: TBytes): string;
var
  I: Integer;
begin
  if Length(B) > 0 then
  begin
    Result := Format('%0.2X', [B[0]]);
    for I := 1 to High(B) do
      Result := Result + Format(' %0.2X', [B[I]]);
  end
  else
    Result := '';
end;

procedure THeartMonitor.OnCharacteristicRead(const Sender: TObject;
  const ACharacteristic: TBluetoothGattCharacteristic; AGattStatus: TBluetoothGattStatus);
var
  LSValue: string;
begin
  if AGattStatus = TBluetoothGattStatus.Success then
  begin
    LSValue := BytesToString(ACharacteristic.Value);
    ManageCharacteristicData(ACharacteristic);
  end;
end;

procedure THeartMonitor.OnEndDiscoverDevices(const Sender: TObject;
  const ADeviceList: TBluetoothLEDeviceList);
begin
  try
    if(ADeviceList.Count > 0)then
    begin
      if FBluetoothLE.DiscoveredDevices.Count > 0 then
      begin
        FBLEDevice := FBluetoothLE.DiscoveredDevices.First();
        if FBluetoothLE.GetServices(FBLEDevice).Count > 0 then
        begin
          FHRGattService := nil;
          FHRMeasurementGattCharact := nil;
          FBodySensorLocationGattCharact := nil;
          FHRGattService := FBluetoothLE.GetService(FBLEDevice, HEART_HRSERVICE);
          if FHRGattService <> nil then
          begin
            FBluetoothLE.GetCharacteristics(FHRGattService);
            FHRMeasurementGattCharact := FBluetoothLE.GetCharacteristic
              (FHRGattService, HEART_HRMEASUREMENT_CHARACTERISTIC);
            FBodySensorLocationGattCharact := FBluetoothLE.GetCharacteristic
              (FHRGattService, HEART_BODY_SENSOR_LOCATION_CHARACTERISTIC);
          end;
          if FHRMeasurementGattCharact <> nil then
          begin
            if FBluetoothLE.Enabled then
            begin
              FBluetoothLE.SubscribeToCharacteristic(FBLEDevice,
                FHRMeasurementGattCharact);
            end
          end;
        end;
      end
    end
    else
    begin
        Disconnect();
        ShowMessage('Device not found!');
    end;
  except
    Disconnect();
    ShowMessage('Device not found!');
  end;
end;

procedure THeartMonitor.UpdateData(const ADataMea, ADataSensor: String);
begin
  if Assigned(FOnUpdateData) then
    OnUpdateData(ADataMea, ADataSensor);
end;

{ TWeightMonitor }

procedure TWeightMonitor.Connect;
begin
  FBluetoothLE.Enabled := True;
  FBluetoothLE.DiscoverDevices(3500, [WEIGHT_DEVICE]);
end;

constructor TWeightMonitor.Create;
begin
  inherited;
  FBluetoothLE := TBluetoothLE.Create(nil);
  FBluetoothLE.OnCharacteristicRead := OnCharacteristicRead;
  FBluetoothLE.OnEndDiscoverDevices := OnEndDiscoverDevices;
end;

destructor TWeightMonitor.Destroy;
begin
  Disconnect();
  FreeAndNil(FBluetoothLE);
  inherited;
end;

procedure TWeightMonitor.Disconnect;
begin
  try
    if FWeightMeasurementGattCharacteristic <> nil then
    begin
      if FBluetoothLE.Enabled then
      begin
        FBluetoothLE.UnSubscribeToCharacteristic(FBLEDevice, FWeightMeasurementGattCharacteristic);
        FBLEDevice.Disconnect();
      end
    end;
    FBluetoothLE.Enabled := False;
  except
    FBluetoothLE.Enabled := False;
  end;
end;

procedure TWeightMonitor.OnCharacteristicRead(const Sender: TObject;
  const ACharacteristic: TBluetoothGattCharacteristic; AGattStatus: TBluetoothGattStatus);
var
  WeightPounds : double;
begin
  if AGattStatus = TBluetoothGattStatus.Success then
  begin
    // calculate weight - characteristic is in hectograms
    // ignore last two bytes, take first 6 bytes - that is hectograms
    WeightPounds := (ACharacteristic.GetValueAsInteger shr 8) * 0.2205;
    UpdateData(WeightPounds);
  end;
end;

procedure TWeightMonitor.OnEndDiscoverDevices(const Sender: TObject;
  const ADeviceList: TBluetoothLEDeviceList);
begin
  try
    if(ADeviceList.Count > 0) then
    begin
      if FBluetoothLE.DiscoveredDevices.Count > 0 then
      begin
        FBLEDevice := FBluetoothLE.DiscoveredDevices.First();
        if FBluetoothLE.GetServices(FBLEDevice).Count > 0 then
        begin
          FWeightGattService := nil;
          FWeightMeasurementGattCharacteristic := nil;
          FWeightGattService := FBluetoothLE.GetService(FBLEDevice, WEIGHT_SERVICE);
          if FWeightGattService <> nil then
          begin
            FBluetoothLE.GetCharacteristics(FWeightGattService);
            FWeightMeasurementGattCharacteristic := FBluetoothLE.GetCharacteristic
              (FWeightGattService, WEIGHT_CHARACTERISTIC);
          end;
          if FWeightMeasurementGattCharacteristic <> nil then
          begin
            if FBluetoothLE.Enabled then
            begin
              FBluetoothLE.SubscribeToCharacteristic(FBLEDevice,
                FWeightMeasurementGattCharacteristic);
            end
          end;
        end;
      end
    end
    else
    begin
        Disconnect();
        ShowMessage('Device not found!');
    end;
  except
    Disconnect();
      ShowMessage('Device not found!');
  end;
end;

procedure TWeightMonitor.UpdateData(const AWeight: double);
begin
  if Assigned(FOnUpdateData) then
    OnUpdateData(AWeight);
end;

end.

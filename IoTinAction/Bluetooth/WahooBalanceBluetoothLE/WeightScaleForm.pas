unit WeightScaleForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani, FMX.StdCtrls, System.Bluetooth, FMX.Layouts,
  FMX.Memo, FMX.Controls.Presentation, FMX.Edit, FMX.Objects, IPPeerClient, IPPeerServer,
  System.Tether.Manager, System.Bluetooth.Components;

type

  TSensorContactStatus = (NonSupported, NonDetected, Detected);

  THRMFlags = record
    HRValue16bits: boolean;
    SensorContactStatus: TSensorContactStatus;
    EnergyExpended: boolean;
    RRInterval: boolean;
  end;

  TfrmWeightMonitor = class(TForm)
    btnConnect: TButton;
    lblDevice: TLabel;
    pnlMain: TPanel;
    pnlLog: TPanel;
    Splitter1: TSplitter;
    Memo1: TMemo;
    lblWeight: TLabel;
    BluetoothLE1: TBluetoothLE;
    btnDisconnect: TButton;
    procedure btnConnectClick(Sender: TObject);
    procedure BluetoothLE1EndDiscoverDevices(const Sender: TObject; const ADeviceList: TBluetoothLEDeviceList);
    procedure BluetoothLE1CharacteristicRead(const Sender: TObject; const ACharacteristic: TBluetoothGattCharacteristic;
      AGattStatus: TBluetoothGattStatus);
    procedure btnDisconnectClick(Sender: TObject);
  private
    { Private declarations }
    FBLEDevice: TBluetoothLEDevice;
    FWeightGattService: TBluetoothGattService;
    FWeightMeasurementGattCharacteristic: TBluetoothGattCharacteristic;
    procedure GetServiceAndCharacteristics;
  public
    { Public declarations }
  end;

const
  ScaleDeviceName = 'Wahoo Scale';
  ServiceUUID = '';
  CharactUUID = '';

  // 0x1901 is the weight service
  // 0x2B01 is the live weight characteristic readings    0x84ae0000 0001      - 38 lbs   17kg
  // 0b 10000100101011100000000000000000

  Weight_Device: TBluetoothUUID = '{00001901-0000-1000-8000-00805F9B34FB}';
  Weight_Service: TBluetoothUUID = '{00001901-0000-1000-8000-00805F9B34FB}';
  Weight_Characteristic: TBluetoothUUID  = '{00002B01-0000-1000-8000-00805F9B34FB}';

var
  frmWeightMonitor: TfrmWeightMonitor;

implementation

{$R *.fmx}
{$R *.iPad.fmx IOS}
{$R *.iPhone.fmx IOS}

procedure TfrmWeightMonitor.btnConnectClick(Sender: TObject);
begin
  lblWeight.Text := 'Weight: 0.0';
  lblDevice.Text := '';
  Memo1.Lines.Clear;
  BluetoothLE1.DiscoverDevices(3500, [Weight_Device]);
end;

procedure TfrmWeightMonitor.btnDisconnectClick(Sender: TObject);
begin
  if FWeightMeasurementGattCharacteristic <> nil then
    BluetoothLE1.UnSubscribeToCharacteristic(FBLEDevice, FWeightMeasurementGattCharacteristic);
  btnDisconnect.Enabled := false;  // disable disconnect from subscribe scale button
  btnConnect.Enabled := true;  // enable connect to scale button
end;

procedure TfrmWeightMonitor.BluetoothLE1EndDiscoverDevices(const Sender: TObject;
  const ADeviceList: TBluetoothLEDeviceList);
var
  I: Integer;
begin
  // log
  Memo1.Lines.Add(ADeviceList.Count.ToString +  ' devices discovered:');
  for I := 0 to ADeviceList.Count - 1 do Memo1.Lines.Add(ADeviceList[I].DeviceName);

  if BluetoothLE1.DiscoveredDevices.Count > 0 then
  begin
    FBLEDevice := BluetoothLE1.DiscoveredDevices.First; //assume first is the scale
    lblDevice.Text := ScaleDeviceName;

    if BluetoothLE1.GetServices(FBLEDevice).Count = 0 then
    begin
      Memo1.Lines.Add('No Weight services found!');
      lblWeight.Text := 'No Weight services found!';
    end
    else begin
      Memo1.Lines.Add('Wahoo Services Found: '+ IntToStr(BluetoothLE1.GetServices(FBLEDevice).Count));
      btnDisconnect.Enabled := true;  // enable disconnect button - from subscribe scale
      btnConnect.Enabled := false;  //disable button - connect to scale
      // get Weight Service and Characteristic
      GetServiceAndCharacteristics;

    end;
  end
  else
    lblDevice.Text := 'Weight Device not found';
end;


procedure TfrmWeightMonitor.GetServiceAndCharacteristics;
{
var
  I, J, K: Integer;
}
begin

{
  for I := 0 to FBLEDevice.Services.Count - 1 do
  begin
    Memo1.Lines.Add(FBLEDevice.Services[I].UUIDName + ' : ' + FBLEDevice.Services[I].UUID.ToString);
    for J := 0 to FBLEDevice.Services[I].Characteristics.Count - 1 do begin
      Memo1.Lines.Add('--> ' + FBLEDevice.Services[I].Characteristics[J].UUIDName + ' : ' +
                      FBLEDevice.Services[I].Characteristics[J].UUID.ToString);
      for K := 0 to FBLEDevice.Services[I].Characteristics[J].Descriptors.Count - 1 do begin
        Memo1.Lines.Add('----> ' + FBLEDevice.Services[I].Characteristics[J].Descriptors[K].UUIDName + ' : ' +
                      FBLEDevice.Services[I].Characteristics[J].Descriptors[K].UUID.ToString);
      end;
    end;
  end;
}

  FWeightGattService := nil;
  FWeightMeasurementGattCharacteristic := nil;

  // RTL source code says to call DiscoverServices
  //   first before GetServices, but not needed
  //  FBLEDevice.DiscoverServices();

  // get Weight Service by UUID
  FWeightGattService := BluetoothLE1.GetService(FBLEDevice, Weight_SERVICE);

  if FWeightGattService <> nil then begin
    memo1.Lines.Add('Service: '+FWeightGattService.UUID.ToString);
    // get Weight Characteristic
    Memo1.Lines.Add('Looking Char: '+Weight_CHARACTERISTIC.ToString);
    BluetoothLE1.GetCharacteristics(FWeightGattService);
    FWeightMeasurementGattCharacteristic := BluetoothLE1.GetCharacteristic(FWeightGattService,Weight_CHARACTERISTIC);

    if FWeightMeasurementGattCharacteristic <> nil then begin
      Memo1.Lines.Add('Char: '+FWeightMeasurementGattCharacteristic.UUID.ToString);
      // subscribe to the weight service
      // FBLEDevice.SetCharacteristicNotification(FWeightMeasurementGattCharact, True);
      BluetoothLE1.SubscribeToCharacteristic(FBLEDevice, FWeightMeasurementGattCharacteristic);
      Memo1.Lines.Add('Subscribed to Weight Measurement Characteristic');
    end
    else begin
      Memo1.Lines.Add('Weight Char not found');
      lblWeight.Text := 'Weight Char not found';
    end
  end
  else begin
    Memo1.Lines.Add('Weight Service not found');
    lblWeight.Text := 'Weight Service not found';
  end;
end;


procedure TfrmWeightMonitor.BluetoothLE1CharacteristicRead(const Sender: TObject;
  const ACharacteristic: TBluetoothGattCharacteristic; AGattStatus: TBluetoothGattStatus);
var
  LSValue: string;
  WeightPounds : double;
begin
  if AGattStatus <> TBluetoothGattStatus.Success then
    Memo1.Lines.Add('Error reading Characteristic ' + ACharacteristic.UUIDName + ': ' + Ord(AGattStatus).ToString)
  else
  begin

    LSValue := IntToStr(ACharacteristic.GetValueAsInteger);
    Memo1.Lines.Add(ACharacteristic.UUID.ToString + ' String: ' + LSValue);

    // calculate weight - characteristic is in hectograms
    // ignore last two bytes, take first 6 bytes - that is hectograms

    WeightPounds := (ACharacteristic.GetValueAsInteger shr 8) * 0.2205;
    Memo1.Lines.Add('Weight (pounds): '+Format('%8.2f',[WeightPounds]));
    lblWeight.Text := 'Weight: '+ Format('%8.2f',[WeightPounds]);

  end;
end;


end.

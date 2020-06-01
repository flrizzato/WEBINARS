unit NurseAppMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.ListBox, FMX.Layouts, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.TabControl, System.Bluetooth, System.Bluetooth.Components, SensorMonitorsU,
  System.JSON, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components;

type
  TForm23 = class(TForm)
    ToolBar1: TToolBar;
    Label1: TLabel;
    ListBox1: TListBox;
    PatientName: TListBoxItem;
    PatientHeartrate: TListBoxItem;
    PatientWeight: TListBoxItem;
    NameEdit: TComboBox;
    PatientEdit: TEdit;
    WeightEdit: TEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SaveData: TSpeedButton;
    SpeedButton6: TSpeedButton;
    TabControl1: TTabControl;
    GetData: TTabItem;
    StoredData: TTabItem;
    ToolBar2: TToolBar;
    StoredVitals: TLabel;
    ListBox2: TListBox;
    RecordedPatientVitals: TListBoxGroupHeader;
    StoredPatientName: TListBoxItem;
    StoredPatientHeartrate: TListBoxItem;
    StoredPatientWeight: TListBoxItem;
    lblNamePatient: TLabel;
    BindingsList1: TBindingsList;
    LinkFillControlToPropertyItemDataDetail: TLinkFillControlToProperty;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    // For update the UI
    procedure OnHearMonitorUpdateData(const AMeasurement : string; const ASensorLocation : String);
    procedure OnWeightMonitorUpdateData(const AWeight : double);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure UpdateStoredPatientData(const AData : TJSONObject);
    function GetPatientDataToSave(const AUserId: string): TJSONObject;
    procedure OnSaveData(Sender : TObject);
    function ExistInComboBox(const AUserId : string): boolean;
  private
    { Private declarations }
    FHeartMonitor : THeartMonitor;
    FWeightMonitor : TWeightMonitor;
    procedure PushRegister;
  public
    { Public declarations }
  end;

var
  Form23: TForm23;

implementation

uses
  NurseStationClientModuleU, System.PushNotification;

type
  TDataPatient = class
  private
    FUserId: String;
  public
    constructor Create(const AUserId : String);
    property UserId : String read FUserId write FUserId;
  end;

{$R *.fmx}


function TForm23.ExistInComboBox(const AUserId: string): boolean;
var
  I: Integer;
  AData : TDataPatient;
begin
  Result := False;
  for I := 0 to NameEdit.Items.Count - 1 do
  begin
    AData := NameEdit.Items.Objects[I] as TDataPatient;
    if(AData.UserId.Equals(AUserId))then
    begin
      Result := True;
      break;
    end;
  end;
end;

procedure TForm23.FormCreate(Sender: TObject);
var
  LDescription : String;
  LJsonMess : TJSONObject;
  lStatus : string;
  lUserId : string;
begin
  FHeartMonitor := THeartMonitor.Create();
  FHeartMonitor.OnUpdateData := OnHearMonitorUpdateData;
  FWeightMonitor := TWeightMonitor.Create();
  FWeightMonitor.OnUpdateData := OnWeightMonitorUpdateData;
  NurseStationClientModule.OnPushReceived :=
    procedure(AMessage : string; AExtras : TJSONObject)
    begin
      lJsonMess := TJSONObject.ParseJSONValue(AMessage) as TJSONObject;
      lStatus := lJsonMess.GetValue('status').Value;
      LUserId := LJsonMess.GetValue('message').Value;
      lDescription := NurseStationClientModule.GetDescription(LJsonMess.GetValue('message').Value);
      // Update the combobox via Push Message if not exist
      if(not ExistInComboBox(lUserId))then
      begin
        NameEdit.Items.AddObject(LDescription, TDataPatient.Create(lUserId));
      end;
      // Update the label
      if(lStatus.Equals('NurseRoom'))then
      begin
        lblNamepatient.Text := LDescription + ' has entered the room';
      end;
    end;
end;

procedure TForm23.FormDestroy(Sender: TObject);
begin
  FHeartMonitor.Disconnect();
  FreeAndNil(FHeartMonitor);
  FWeightMonitor.Disconnect();
  FreeAndNil(FWeightMonitor);
end;

procedure TForm23.FormShow(Sender: TObject);
begin
  // EMS Process
  NurseStationClientModule.Login('nurseuser', 'nursepass');
  PushRegister();
end;

function TForm23.GetPatientDataToSave(const AUserId: string): TJSONObject;
begin
  Result := TJSONObject.Create();
  Result.AddPair('id', AUserId);
  Result.AddPair('heart_rate', TJSONString.Create(PatientEdit.Text));
  Result.AddPair('weight', TJSONString.Create(WeightEdit.Text));
end;

procedure TForm23.NameEditChange(Sender: TObject);
var
  AData : TDataPatient;
begin
  if(NameEdit.Selected <> nil)then
  begin
    // Send Message Patient
    AData := TDataPatient(NameEdit.Items.Objects[NameEdit.Selected.Index]);
    NurseStationClientModule.SendMessagePatient(AData.UserId);
    // update the stored data UI
    UpdateStoredPatientData(NurseStationClientModule.GetPatientData(AData.UserId));
  end;
end;

procedure TForm23.OnHearMonitorUpdateData(const AMeasurement,
  ASensorLocation: String);
begin
  PatientEdit.Text := AMeasurement;
end;

procedure TForm23.OnSaveData(Sender: TObject);
var
  AData : TJSONObject;
begin
  if(NameEdit.Selected <> nil)then
  begin
    // Disabled the monitors
    FHeartMonitor.Disconnect();
    FWeightMonitor.Disconnect();
    try
      AData := GetPatientDataToSave((NameEdit.Selected.Data as TDataPatient).UserId);
      NurseStationClientModule.AddPatientData(AData);
      // Update the StoreData Tab
      UpdateStoredPatientData(AData);
      ShowMessage('The patient data saved');
    except
      ShowMessage('Error save the data');
    end;
  end
  else
    ShowMessage('You must choose a patient');
end;

procedure TForm23.OnWeightMonitorUpdateData(const AWeight: double);
begin
  WeightEdit.Text := Format('%8.2f pounds', [AWeight]);
end;

procedure TForm23.PushRegister;
begin
// Enable push if there are any push services
  if TPushServiceManager.Instance.Count > 0 then
  begin
    NurseStationClientModule.OnDeviceTokenReceived :=
      procedure
      begin
        NurseStationClientModule.PushRegisterNurse();
      end;

    if not NurseStationClientModule.PushEvents1.Active then
    try
      NurseStationClientModule.PushEvents1.Active := True;
    except
      // TODO
    end;
  end;
end;

procedure TForm23.SpeedButton2Click(Sender: TObject);
begin
  if(NameEdit.Selected <> nil) then
    FHeartMonitor.Connect()
  else
    ShowMessage('You must choose a patient');
end;

procedure TForm23.SpeedButton3Click(Sender: TObject);
begin
  if(NameEdit.Selected <> nil) then
    FWeightMonitor.Connect()
  else
    ShowMessage('You must choose a patient');
end;

procedure TForm23.UpdateStoredPatientData(const AData: TJSONObject);
begin
  StoredPatientHeartrate.ItemData.Detail := AData.GetValue<string>('heart_rate');
  StoredPatientWeight.ItemData.Detail := AData.GetValue<string>('weight');
end;

{ TDataPatient }

constructor TDataPatient.Create(const AUserId: String);
begin
  FUserId := AUserId;
end;

end.

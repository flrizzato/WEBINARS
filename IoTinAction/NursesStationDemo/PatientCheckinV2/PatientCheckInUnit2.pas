unit PatientCheckInUnit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.ListBox, FMX.Layouts,
  FMX.TabControl, System.Beacon, System.Beacon.Components, System.Actions,
  FMX.ActnList;

type
  TPatientBeaconCheckIn = class(TForm)
    LoginList: TListBox;
    ListBoxItem1: TListBoxItem;
    Username: TEdit;
    Password: TEdit;
    btnLoginAccount: TButton;
    Image1: TImage;
    TabControl1: TTabControl;
    Login: TTabItem;
    PatientBeaconCheckIn: TTabItem;
    ToolBar1: TToolBar;
    WelcomeLabel: TLabel;
    PatientName: TLabel;
    NotifyNurse: TImage;
    PatientIsCheckedIn: TImage;
    NotificationLabel: TLabel;
    DetectBeacon: TImage;
    BeaconDetected: TImage;
    Welcome: TTabItem;
    Image2: TImage;
    NextButton: TButton;
    Beacon1: TBeacon;
    BeaconFoundLabel: TLabel;
    DefaultLabel: TLabel;
    ActionList1: TActionList;
    ActionLogin: TAction;
    procedure FormCreate(Sender: TObject);
    procedure Beacon1BeaconEnter(const Sender: TObject; const ABeacon: IBeacon;
      const CurrentBeaconList: TBeaconList);
    procedure Beacon1BeaconProximity(const Sender: TObject;
      const ABeacon: IBeacon; Proximity: TBeaconProximity);
    procedure NextButtonClick(Sender: TObject);
    procedure ActionLoginExecute(Sender: TObject);
    procedure CheckShowMessages(const AMessage : string);
  private
    { Private declarations }
    FBeacon : IBeacon;
    procedure PushRegister;
  public
    { Public declarations }
  end;

var
  PatientBeaconCheckIn: TPatientBeaconCheckIn;

implementation

{$R *.fmx}
{$R *.iPhone55in.fmx IOS}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.NmXhdpiPh.fmx ANDROID}

uses
  NurseStationClientModuleU, System.PushNotification, System.JSON;


procedure TPatientBeaconCheckIn.ActionLoginExecute(Sender: TObject);
begin
  NurseStationClientModule.Login(Username.Text, Password.Text);
  PushRegister();
  TabControl1.ActiveTab := PatientBeaconCheckIn;
  PatientName.Text := NurseStationClientModule.GetDescription();
  // Notify EMS.
  NurseStationClientModule.SendMessageNurse('CheckIn');
end;

procedure TPatientBeaconCheckIn.Beacon1BeaconEnter(const Sender: TObject;
  const ABeacon: IBeacon; const CurrentBeaconList: TBeaconList);
begin
  if ABeacon <> nil then;
end;

procedure TPatientBeaconCheckIn.Beacon1BeaconProximity(const Sender: TObject;
  const ABeacon: IBeacon; Proximity: TBeaconProximity);
const
  HOSPITAL_HALL = 30784;
  NURSE_ROOM = 29597;
begin
  if Proximity = TBeaconProximity.Near  then
  begin
    If ABeacon.Minor = HOSPITAL_HALL then
    begin
      FBeacon := ABeacon;
      DefaultLabel.Visible := False;
      BeaconFoundLabel.Visible := True;
      NextButton.Visible := True;
      BeaconFoundLabel.Text := 'Welcome to the Hospital';
    end
    else if ABeacon.Minor = NURSE_ROOM then
    begin
      If NotifyNurse.Visible = True then
      begin
        // Notify EMS you are in the Nurse's room
        NurseStationClientModule.SendMessageNurse('NurseRoom');
        Beacon1.Enabled := False;
      end;
    end;

  end;
end;

procedure TPatientBeaconCheckIn.CheckShowMessages(const AMessage: string);
begin
  // not implemented
end;

procedure TPatientBeaconCheckIn.FormCreate(Sender: TObject);
begin
  TabControl1.ActiveTab := Welcome;
  NurseStationClientModule.OnPushReceived :=
    procedure(AMessage : string; AExtras : TJSONObject)
    begin
      // Change the image and enabled the text
      NotifyNurse.Visible := True;
      NotificationLabel.Visible := True;
    end;
end;

procedure TPatientBeaconCheckIn.NextButtonClick(Sender: TObject);
begin
  TabControl1.ActiveTab := Login;
end;

procedure TPatientBeaconCheckIn.PushRegister;
begin
  // Enable push if there are any push services
  if TPushServiceManager.Instance.Count > 0 then
  begin
    NurseStationClientModule.OnDeviceTokenReceived :=
      procedure
      begin
        NurseStationClientModule.PushRegisterPatient();
      end;

    if not NurseStationClientModule.PushEvents1.Active then
    try
      NurseStationClientModule.PushEvents1.Active := True;
    except
      // TODO
    end;
    if NurseStationClientModule.PushEvents1.StartupNotification <> nil then
      CheckShowMessages(NurseStationClientModule.PushEvents1.StartupNotification.Message);
  end;
end;

end.

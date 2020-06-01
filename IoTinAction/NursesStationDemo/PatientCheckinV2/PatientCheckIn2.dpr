program PatientCheckIn2;

uses
  System.StartUpCopy,
  FMX.Forms,
  NurseStationClientModuleU in 'NurseStationClientModuleU.pas' {NurseStationClientModule: TDataModule},
  PatientCheckInUnit2 in 'PatientCheckInUnit2.pas' {PatientBeaconCheckIn};

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait, TFormOrientation.InvertedPortrait];
  Application.CreateForm(TNurseStationClientModule, NurseStationClientModule);
  Application.CreateForm(TPatientBeaconCheckIn, PatientBeaconCheckIn);
  Application.Run;
end.

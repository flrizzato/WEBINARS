program NurseApp_PatientVitals;

uses
  System.StartUpCopy,
  FMX.Forms,
  NurseAppMainForm in 'NurseAppMainForm.pas' {Form23},
  SensorMonitorsU in 'SensorMonitorsU.pas',
  NurseStationClientModuleU in '..\PatientCheckinV2\NurseStationClientModuleU.pas' {NurseStationClientModule: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Landscape, TFormOrientation.InvertedLandscape];
  Application.CreateForm(TNurseStationClientModule, NurseStationClientModule);
  Application.CreateForm(TForm23, Form23);
  Application.Run;
end.

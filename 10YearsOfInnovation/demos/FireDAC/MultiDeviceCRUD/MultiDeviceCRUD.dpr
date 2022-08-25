program MultiDeviceCRUD;

uses
  System.StartUpCopy,
  FMX.Forms,
  Skia.FMX,
  uAppLib in 'uAppLib.pas',
  uMainForm in 'uMainForm.pas' {MainForm};

{$R *.res}

begin
  GlobalUseSkia := True;
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.

program CustomerSync;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMainDM in 'uMainDM.pas' {MainDM: TDataModule},
  uMainForm in 'uMainForm.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainDM, MainDM);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.

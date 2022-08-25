program ControlList101;

uses
  Vcl.Forms,
  uMainForm in 'uMainForm.pas' {MainForm},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Material Patterns Blue');
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.

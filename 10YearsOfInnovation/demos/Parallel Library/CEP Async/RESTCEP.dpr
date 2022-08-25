program RESTCEP;

uses
  Vcl.Forms,
  uMainForm in 'uMainForm.pas' {Form2},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows11 Modern Light');
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.

program WahooWeightScale;

uses
  System.StartUpCopy,
  FMX.Forms,
  WeightScaleForm in 'WeightScaleForm.pas' {frmWeightMonitor};

begin
  Application.Initialize;
  Application.CreateForm(TfrmWeightMonitor, frmWeightMonitor);
  Application.Run;
end.

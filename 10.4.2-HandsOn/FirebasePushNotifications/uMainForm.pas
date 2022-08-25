unit uMainForm;

interface

uses
  System.Classes, System.PushNotification,
  FMX.Controls, FMX.Controls.Presentation, FMX.Forms, FMX.Memo, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Types;

type
  TMainForm = class(TForm)
    memLog: TMemo;

    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FPushService: TPushService;
    FPushServiceConnection: TPushServiceConnection;

    procedure OnServiceConnectionChange(Sender: TObject;
      PushChanges: TPushService.TChanges);
    procedure OnServiceConnectionReceiveNotification(Sender: TObject;
      const ServiceNotification: TPushServiceNotification);
  end;

implementation

{$R *.fmx}

uses
{$IF Defined(ANDROID)}
  FMX.PushNotification.Android;
{$ENDIF}
{$IF Defined(IOS)}
  FMX.PushNotification.FCM.iOS;
{$ENDIF}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FPushService := TPushServiceManager.Instance.GetServiceByName
    (TPushService.TServiceNames.FCM);

  FPushServiceConnection := TPushServiceConnection.Create(FPushService);
  FPushServiceConnection.OnChange := OnServiceConnectionChange;
  FPushServiceConnection.OnReceiveNotification :=
    OnServiceConnectionReceiveNotification;
  FPushServiceConnection.Active := True;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  FPushServiceConnection.Free;
end;

procedure TMainForm.OnServiceConnectionChange(Sender: TObject;
  PushChanges: TPushService.TChanges);
begin
  if TPushService.TChange.Status in PushChanges then
  begin
    if FPushService.Status = TPushService.TStatus.Started then
    begin
      memLog.Lines.BeginUpdate;
      memLog.Lines.Add('Push service succeeded to start');
      memLog.Lines.Add('');
      memLog.Lines.EndUpdate;
    end
    else if FPushService.Status = TPushService.TStatus.StartupError then
    begin
      FPushServiceConnection.Active := False;

      memLog.Lines.BeginUpdate;
      memLog.Lines.Add('Push service failed to start');
      memLog.Lines.Add(FPushService.StartupError);
      memLog.Lines.Add('');
      memLog.Lines.EndUpdate;
    end;
  end;

  if TPushService.TChange.DeviceToken in PushChanges then
  begin
    memLog.Lines.BeginUpdate;
    memLog.Lines.Add('Device token received');
    memLog.Lines.Add('Device identifier: ' + FPushService.DeviceIDValue
      [TPushService.TDeviceIDNames.DeviceId]);
    memLog.Lines.Add('Device token: ' + FPushService.DeviceTokenValue
      [TPushService.TDeviceTokenNames.DeviceToken]);
    memLog.Lines.Add('');
    memLog.Lines.EndUpdate;
  end;
end;

procedure TMainForm.OnServiceConnectionReceiveNotification(Sender: TObject;
  const ServiceNotification: TPushServiceNotification);
begin
  memLog.Lines.BeginUpdate;
  memLog.Lines.Add('Push notification received');
  memLog.Lines.Add('DataKey: ' + ServiceNotification.DataKey);
  memLog.Lines.Add('Json: ' + ServiceNotification.Json.ToString);
  memLog.Lines.Add('DataObject: ' + ServiceNotification.DataObject.ToString);
  memLog.Lines.Add('');
  memLog.Lines.EndUpdate;
end;

end.

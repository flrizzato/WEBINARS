unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Media, FMX.Objects, FMX.ListBox, FMX.StdCtrls, FMX.Controls.Presentation;

type
  TMainForm = class(TForm)
    ToolBarMain: TToolBar;
    butStart: TButton;
    cmbDevices: TComboBox;
    imgContainer: TImage;
    StyleBook1: TStyleBook;
    procedure FormCreate(Sender: TObject);
    procedure cmbDevicesChange(Sender: TObject);
    procedure butStartClick(Sender: TObject);
  private
    { Private declarations }
    VideoCamera: TVideoCaptureDevice;
    procedure SampleBufferSync;
    procedure SampleBufferReady(Sender: TObject; const ATime: TMediaTime);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}
{$R *.Macintosh.fmx MACOS}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.iPhone55in.fmx IOS}
{ TForm1 }

procedure TMainForm.butStartClick(Sender: TObject);
begin
  if (VideoCamera <> nil) then
  begin
    if (VideoCamera.State = TCaptureDeviceState.Stopped) then
    begin
      VideoCamera.OnSampleBufferReady := SampleBufferReady;
      VideoCamera.Quality := TVideoCaptureQuality.PhotoQuality;
      VideoCamera.StartCapture;
    end
    else
    begin
      VideoCamera.StopCapture;
    end;
  end
  else
    raise Exception.Create('Dispositivo de captura de vídeo não disponível!');
end;

procedure TMainForm.cmbDevicesChange(Sender: TObject);
begin
  VideoCamera := TVideoCaptureDevice
    (TCaptureDeviceManager.Current.GetDevicesByName(cmbDevices.Selected.Text));

  if (VideoCamera <> nil) then
  begin
    butStart.Enabled := true;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
{$IF DEFINED(MSWINDOWS) OR DEFINED(MACOS)}
var
  DeviceList: TCaptureDeviceList;
  i: integer;
{$ENDIF}
begin
{$IF DEFINED(MSWINDOWS) OR DEFINED(MACOS)}
  DeviceList := TCaptureDeviceManager.Current.GetDevicesByMediaType
    (TMediaType.Video);
  for i := 0 to DeviceList.Count - 1 do
  begin
    cmbDevices.Items.Add(DeviceList[i].Name);
  end;
  cmbDevices.ItemIndex := 0;
{$ELSE}
  VideoCamera := TCaptureDeviceManager.Current.DefaultVideoCaptureDevice;
  butStart.Enabled := True;
{$ENDIF}
end;

procedure TMainForm.SampleBufferReady(Sender: TObject; const ATime: TMediaTime);
begin
  TThread.Queue(TThread.CurrentThread, SampleBufferSync);
end;

procedure TMainForm.SampleBufferSync;
begin
  VideoCamera.SampleBufferToBitmap(imgContainer.Bitmap, true);
end;

end.

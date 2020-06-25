unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, IdContext,
  IdCustomHTTPServer, IdBaseComponent, IdComponent, IdCustomTCPServer,
  IdHTTPServer, FMX.Media, FMX.Objects, FMX.StdCtrls, FMX.Controls.Presentation,
  IdSync, FMX.Edit, FMX.EditBox, FMX.NumberBox;

type
  TMainForm = class(TForm)
    ToolBar1: TToolBar;
    butStartVideo: TButton;
    butStartStream: TButton;
    imgCameraView: TImage;
    CameraComponent: TCameraComponent;
    IdHTTPServer: TIdHTTPServer;
    edtPort: TEdit;
    Label1: TLabel;
    StyleBook: TStyleBook;
    procedure FormShow(Sender: TObject);
    procedure IdHTTPServerCommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure CameraComponentSampleBufferReady(Sender: TObject;
      const ATime: TMediaTime);
    procedure butStartVideoClick(Sender: TObject);
    procedure butStartStreamClick(Sender: TObject);
  private
    { Private declarations }
    procedure GetImage;
  public
    { Public declarations }
  end;

type
  TGetImageStream = class(TIdSync)
  protected
    FStream: TStream;
    procedure DoSynchronize; override;
  public
    class procedure GetImage(aStream: TStream);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.iPad.fmx IOS}

uses FMX.Surfaces;

procedure TMainForm.butStartStreamClick(Sender: TObject);
begin
  IdHTTPServer.DefaultPort := StrtoInt(edtPort.Text);
  IdHTTPServer.Active := not IdHTTPServer.Active;
  if IdHTTPServer.Active then
    butStartStream.Text := 'Stop Stream'
  else
    butStartStream.Text := 'Start Stream';
end;

procedure TMainForm.butStartVideoClick(Sender: TObject);
begin
  CameraComponent.Active := not CameraComponent.Active;
  if CameraComponent.Active then
    butStartVideo.Text := 'Stop Video'
  else
    butStartVideo.Text := 'Start Video';
end;

procedure TMainForm.CameraComponentSampleBufferReady(Sender: TObject;
  const ATime: TMediaTime);
begin
  TThread.Queue(TThread.CurrentThread, GetImage);
end;

procedure TMainForm.GetImage;
begin
  CameraComponent.SampleBufferToBitmap(imgCameraView.Bitmap, True);
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  CameraComponent.Kind := TCameraKind.BackCamera;
  CameraComponent.Quality := TVideoCaptureQuality.LowQuality;
  CameraComponent.CaptureSettingPriority :=
    TVideoCaptureSettingPriority.FrameRate;
end;

{ TGetImageStream }

procedure TGetImageStream.DoSynchronize;
begin
  inherited;
  MainForm.imgCameraView.Bitmap.SaveToStream(FStream);
end;

class procedure TGetImageStream.GetImage(aStream: TStream);
begin
  with Create do
    try
      FStream := aStream;
      Synchronize;
    finally
      Free;
    end;
end;

procedure TMainForm.IdHTTPServerCommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  LStream: TMemoryStream;
begin
  LStream := TMemoryStream.Create;
  try
    TGetImageStream.GetImage(LStream);
    LStream.Position := 0;
  except
    LStream.Free;
    raise;
  end;
  AResponseInfo.ResponseNo := 200;
  AResponseInfo.ContentType := 'image/bmp';
  AResponseInfo.ContentStream := LStream;
end;

end.

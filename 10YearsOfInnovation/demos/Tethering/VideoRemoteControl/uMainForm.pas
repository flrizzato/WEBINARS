unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, IPPeerClient,
  IPPeerServer, System.Tether.Manager, System.Tether.AppProfile;

type
  TMainForm = class(TForm)
    layButtons: TLayout;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    CommandManager: TTetheringManager;
    CommandApp: TTetheringAppProfile;
    ToolBar1: TToolBar;
    butConnect: TButton;
    procedure CommandManagerEndAutoConnect(Sender: TObject);
    procedure butConnectClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}

procedure TMainForm.butConnectClick(Sender: TObject);
begin
  CommandManager.AutoConnect(5000, '192.168.1.200');
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  CommandApp.RunRemoteAction(CommandManager.RemoteProfiles.First, 'acPlay');

end;

procedure TMainForm.Button2Click(Sender: TObject);
begin
  CommandApp.RunRemoteAction(CommandManager.RemoteProfiles.First, 'acStop');

end;

procedure TMainForm.Button3Click(Sender: TObject);
begin
  CommandApp.RunRemoteAction(CommandManager.RemoteProfiles.First, 'acNext');

end;

procedure TMainForm.Button4Click(Sender: TObject);
begin
  CommandApp.RunRemoteAction(CommandManager.RemoteProfiles.First, 'acPrior');

end;

procedure TMainForm.CommandManagerEndAutoConnect(Sender: TObject);
begin
  if CommandApp.Connect(CommandManager.RemoteProfiles.First) then
    layButtons.Enabled := True;
end;

end.

unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    gridData: TDBGrid;
    gridDelta: TDBGrid;
    Splitter1: TSplitter;
    butGetData: TButton;
    butViewChanges: TButton;
    butMergeDelta: TButton;
    gridChanges: TDBGrid;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    Splitter2: TSplitter;
    butCommit: TButton;
    procedure butGetDataClick(Sender: TObject);
    procedure butViewChangesClick(Sender: TObject);
    procedure butMergeDeltaClick(Sender: TObject);
    procedure gridDeltaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure butCommitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses uMainDM;

procedure TMainForm.butCommitClick(Sender: TObject);
begin
  MainDM.CommitChanges;
end;

procedure TMainForm.butGetDataClick(Sender: TObject);
begin
  MainDM.GetData;
end;

procedure TMainForm.butViewChangesClick(Sender: TObject);
begin
  MainDM.ViewChanges;
end;

procedure TMainForm.butMergeDeltaClick(Sender: TObject);
begin
  MainDM.MergeDelta;
end;

procedure TMainForm.gridDeltaDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdFocused in State) and (Column.Field <> nil) then begin
    case Column.Field.DataSet.UpdateStatus of
    usUnmodified:
      TDBGrid(Sender).Canvas.Brush.Color := clSkyBlue;
    usModified:
      begin
        TDBGrid(Sender).Canvas.Brush.Color := clYellow;
        if VarCompareValue(Column.Field.OldValue, Column.Field.CurValue) <> vrEqual then
          TDBGrid(Sender).Canvas.Font.Style := [fsBold];
      end;
    usInserted:
      TDBGrid(Sender).Canvas.Brush.Color := clLime;
    usDeleted:
      TDBGrid(Sender).Canvas.Brush.Color := clRed;
    end;
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

end.

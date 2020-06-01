unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.ScrollBox, FMX.Grid, FMX.StdCtrls,
  FMX.Controls.Presentation, Data.Bind.EngExt, FMX.Bind.DBEngExt,
  Data.Bind.Components, Data.Bind.DBScope, FMX.Bind.Grid,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Grid, FMXTee.Engine,
  FMXTee.Series, FMXTee.Procs, FMXTee.Chart;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    stgResult: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    chartResult: TChart;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Series1: TBarSeries;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses uMainDM;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
  MyThread: TThread;
begin
  MainDM.EmpOppQuery.Open;

  MyThread := TThread.CreateAnonymousThread(
    procedure
    begin
      MainDM.EmpOppQuery.DisableControls;
      try
        while not MainDM.EmpOppQuery.Eof do
        begin
          TThread.Synchronize(MyThread,
            procedure
            begin
              chartResult.Series[0].Add(MainDM.EmpOppQueryAmount.Value,
                MainDM.EmpOppQueryName.AsString.Substring(0, 20));
            end);
          MainDM.EmpOppQuery.Next;
        end;
      finally
        MainDM.EmpOppQuery.First;
        MainDM.EmpOppQuery.EnableControls;
      end;
    end);
  MyThread.Start;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  chartResult.Pages.PreviousPage;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  chartResult.Pages.NextPage;
end;

end.

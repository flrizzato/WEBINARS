unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.DApt, REST.Backend.EMSServices, IPPeerClient,
  REST.Backend.EMSProvider, REST.Backend.EMSFireDAC, FireDAC.Comp.Client,
  Data.DB, FireDAC.Comp.DataSet, FMX.ListView, FireDAC.UI.Intf,
  FireDAC.FMXUI.Wait, FireDAC.Stan.StorageJSON, FireDAC.Comp.UI, System.Rtti,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, FMXTee.Engine,
  FMXTee.Series, FMXTee.Procs, FMXTee.Chart, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteVDataSet;

type
  TMainForm = class(TForm)
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    lstResult: TListView;
    FDMemTable1: TFDMemTable;
    FDTableAdapter1: TFDTableAdapter;
    FDSchemaAdapter1: TFDSchemaAdapter;
    EMSFireDACClient1: TEMSFireDACClient;
    EMSProvider1: TEMSProvider;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDMemTable1VBELN: TWideStringField;
    FDMemTable1AUDAT: TSQLTimeStampField;
    FDMemTable1VKORG: TWideStringField;
    FDMemTable1NETWR: TFloatField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    StyleBook1: TStyleBook;
    chartResult: TChart;
    FDConnection1: TFDConnection;
    FDLocalSQL1: TFDLocalSQL;
    FDQuery1: TFDQuery;
    Series1: TPieSeries;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.iPad.fmx IOS}
{$R *.Windows.fmx MSWINDOWS}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  chartResult.Series[0].Clear;
end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
var
  i: integer;
  MyThread: TThread;
begin
  EMSFireDACClient1.GetData;
  FDMemTable1.Open;

  FDConnection1.Open;
  FDQuery1.Open;

  MyThread := TThread.CreateAnonymousThread(
    procedure
    begin
      while not FDQuery1.Eof do
      begin
        TThread.Synchronize(MyThread,
          procedure
          begin
            chartResult.Series[0].Add(FDQuery1.FieldByName('TOTAL').AsFloat,
              FDQuery1.FieldByName('VKORG').AsString);
          end);
        FDQuery1.Next;
      end;
    end);
  MyThread.Start;
end;

procedure TMainForm.SpeedButton2Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.

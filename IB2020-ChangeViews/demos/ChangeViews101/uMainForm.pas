unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, FireDAC.VCLUI.Login, FireDAC.Comp.UI, Vcl.WinXCtrls,
  System.Actions, Vcl.ActnList, Vcl.ComCtrls;

type
  TMainForm = class(TForm)
    FDConnection1: TFDConnection;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    FDQuery1CUSTNO: TFloatField;
    FDQuery1COMPANY: TStringField;
    FDQuery1ADDR1: TStringField;
    FDQuery1ADDR2: TStringField;
    FDQuery1CITY: TStringField;
    FDQuery1STATE: TStringField;
    FDQuery1ZIP: TStringField;
    FDQuery1COUNTRY: TStringField;
    FDQuery1PHONE: TStringField;
    FDQuery1FAX: TStringField;
    FDQuery1TAXRATE: TFloatField;
    FDQuery1CONTACT: TStringField;
    FDQuery1LASTINVOICEDATE: TSQLTimeStampField;
    butOpen: TButton;
    FDGUIxLoginDialog1: TFDGUIxLoginDialog;
    ToggleSwitch1: TToggleSwitch;
    FDTransDefault: TFDTransaction;
    FDTransSnapshot: TFDTransaction;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    ActionList1: TActionList;
    acActiveSub: TAction;
    acInactiveSub: TAction;
    acOpenDataSet: TAction;
    butCommit: TButton;
    acCommit: TAction;
    StatusBar1: TStatusBar;
    procedure ToggleSwitch1Click(Sender: TObject);
    procedure acActiveSubExecute(Sender: TObject);
    procedure acOpenDataSetExecute(Sender: TObject);
    procedure acInactiveSubExecute(Sender: TObject);
    procedure acCommitExecute(Sender: TObject);
    procedure FDConnection1AfterConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

const
  cDeviceName: string = 'PC';

procedure TMainForm.acOpenDataSetExecute(Sender: TObject);
begin
  if FDQuery1.Active then
    FDQuery1.Close;
  FDQuery1.Open;
end;

procedure TMainForm.FDConnection1AfterConnect(Sender: TObject);
begin
  StatusBar1.SimpleText := ':: Connected User [' +
    FDConnection1.Params.UserName + ' ]';
end;

procedure TMainForm.acActiveSubExecute(Sender: TObject);
begin
  if FDConnection1.Connected then
  begin
    FDConnection1.Transaction := FDTransSnapshot;
    FDConnection1.StartTransaction;
    FDConnection1.ExecSQL('SET SUBSCRIPTION CUSTOMER_SUB AT ' +
      QuotedSTR(cDeviceName) + ' ACTIVE');
    acOpenDataSet.Execute;
  end;
end;

procedure TMainForm.acInactiveSubExecute(Sender: TObject);
begin
  if FDConnection1.Connected then
  begin
    FDConnection1.ExecSQL('SET SUBSCRIPTION CUSTOMER_SUB AT ' +
      QuotedSTR(cDeviceName) + ' INACTIVE');
    if FDConnection1.InTransaction then
      FDConnection1.Rollback;
    FDConnection1.Transaction := FDTransDefault;
    acOpenDataSet.Execute;
  end;
end;

procedure TMainForm.acCommitExecute(Sender: TObject);
begin
  if FDConnection1.InTransaction then
    FDConnection1.Commit;
end;

procedure TMainForm.ToggleSwitch1Click(Sender: TObject);
begin
  if ToggleSwitch1.IsOn then
    acActiveSub.Execute
  else
    acInactiveSub.Execute;
end;

end.

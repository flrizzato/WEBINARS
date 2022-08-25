unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.ListView.Types, FMX.ListView, FMX.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, Data.Bind.Components, System.Rtti, System.Bindings.Outputs,
  FMX.Bind.Editors, Data.Bind.DBScope, FireDAC.FMXUI.Wait, FireDAC.Comp.UI,
  FireDAC.Phys.IBBase, FireDAC.Phys.IB, System.IOUtils, FMX.Edit,
  System.Actions, FMX.ActnList, FMX.Effects, FMX.ListBox, FMX.Layouts,
  FMX.Bind.Navigator, FireDAC.Phys.IBDef, FMX.Controls.Presentation,
  FireDAC.Phys.IBLiteDef, FMX.ListView.Appearances, FMX.ListView.Adapters.Base;

type
  TMainForm = class(TForm)
    TabControlMain: TTabControl;
    tabSearch: TTabItem;
    ListView1: TListView;
    tabEdit: TTabItem;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDQuery1EMPNO: TIntegerField;
    FDQuery1LASTNAME: TStringField;
    FDQuery1FIRSTNAME: TStringField;
    FDQuery1PHONEEXT: TStringField;
    FDQuery1HIREDATE: TSQLTimeStampField;
    FDQuery1SALARY: TFloatField;
    BindingsList1: TBindingsList;
    BindSourceDB1: TBindSourceDB;
    FDQuery1FULLNAME: TStringField;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    edtNome: TEdit;
    edtSobrenome: TEdit;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    ActionList1: TActionList;
    ChangeTabAction1: TChangeTabAction;
    LinkListControlToField1: TLinkListControlToField;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    butVoltar: TSpeedButton;
    lsbMenu: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ShadowEffect1: TShadowEffect;
    LiveBindingsBindNavigateFirst1: TFMXBindNavigateFirst;
    LiveBindingsBindNavigatePrior1: TFMXBindNavigatePrior;
    LiveBindingsBindNavigateNext1: TFMXBindNavigateNext;
    LiveBindingsBindNavigateLast1: TFMXBindNavigateLast;
    LiveBindingsBindNavigateInsert1: TFMXBindNavigateInsert;
    LiveBindingsBindNavigateDelete1: TFMXBindNavigateDelete;
    LiveBindingsBindNavigateEdit1: TFMXBindNavigateEdit;
    LiveBindingsBindNavigatePost1: TFMXBindNavigatePost;
    LiveBindingsBindNavigateCancel1: TFMXBindNavigateCancel;
    LiveBindingsBindNavigateRefresh1: TFMXBindNavigateRefresh;
    LiveBindingsBindNavigateApplyUpdates1: TFMXBindNavigateApplyUpdates;
    LiveBindingsBindNavigateCancelUpdates1: TFMXBindNavigateCancelUpdates;
    butSave: TSpeedButton;
    butCancel: TSpeedButton;
    edtSalario: TEdit;
    LinkControlToField3: TLinkControlToField;
    Label1: TLabel;
    StyleBook1: TStyleBook;
    StyleBookLinux: TStyleBook;
    butDelete: TSpeedButton;
    procedure FDQuery1CalcFields(DataSet: TDataSet);
    procedure FDConnection1BeforeConnect(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FDQuery1AfterPost(DataSet: TDataSet);
    procedure FDQuery1AfterDelete(DataSet: TDataSet);
    procedure FDQuery1AfterCancel(DataSet: TDataSet);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edtSobrenomeKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtSalarioKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure BindSourceDB1SubDataSourceStateChange(Sender: TObject);
    procedure FDQuery1SALARYSetText(Sender: TField; const Text: string);
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
{$R *.Macintosh.fmx MACOS}
{$R *.Windows.fmx MSWINDOWS}
{$R *.iPhone55in.fmx IOS}

uses uAppLib, FMX.Styles, FMX.DialogService;

procedure TMainForm.edtNomeKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkReturn then
    edtSobrenome.SetFocus;
end;

procedure TMainForm.edtSobrenomeKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkReturn then
    edtSalario.SetFocus;
end;

procedure TMainForm.edtSalarioKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkReturn then
    edtNome.SetFocus;
end;

procedure TMainForm.FDConnection1BeforeConnect(Sender: TObject);
var
  fDBPath: string;
begin
{$IF DEFINED(MSWINDOWS) OR DEFINED(LINUX)}
  fDBPath := ExtractFilePath(ParamStr(0));
{$ELSE}
  fDBPath := TPath.GetDocumentsPath;
{$ENDIF}
  fDBPath := IncludeTrailingPathDelimiter(fDBPath) + 'MASTSQL.GDB';
  if FileExists(fDBPath) then
    FDConnection1.Params.Database := fDBPath;
end;

procedure TMainForm.FDQuery1AfterCancel(DataSet: TDataSet);
begin
  if FDQuery1.ChangeCount > 0 then
    FDQuery1.CancelUpdates;
end;

procedure TMainForm.FDQuery1AfterDelete(DataSet: TDataSet);
begin
  if FDQuery1.ChangeCount > 0 then
    FDQuery1.ApplyUpdates(-1);
end;

procedure TMainForm.FDQuery1AfterPost(DataSet: TDataSet);
begin
  if FDQuery1.ChangeCount > 0 then
    FDQuery1.ApplyUpdates(-1);
end;

procedure TMainForm.FDQuery1CalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('FULLNAME').AsString := DataSet.FieldByName('FIRSTNAME')
    .AsString + ' ' + DataSet.FieldByName('LASTNAME').AsString;
end;

procedure TMainForm.FDQuery1SALARYSetText(Sender: TField; const Text: string);
begin
  Sender.Value := TAppLib.NumberFormat(Text);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
{$IFDEF LINUX}
  Self.StyleBook := StyleBookLinux;
  Self.Width := 800;
  Self.Height := 600;
{$ENDIF}
  System.SysUtils.FormatSettings.ThousandSeparator := '.';
  System.SysUtils.FormatSettings.DecimalSeparator := ',';
  TabControlMain.ActiveTab := tabSearch;
  FDQuery1.Open;
end;

procedure TMainForm.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  if (Key = vkHardwareBack) and (ChangeTabAction1.Visible) and
    (TabControlMain.ActiveTab = tabEdit) then
  begin
    ChangeTabAction1.Tab := tabSearch;
    ChangeTabAction1.ExecuteTarget(Self);
    Key := 0;
  end;
end;

procedure TMainForm.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  ChangeTabAction1.Tab := tabEdit;
  ChangeTabAction1.ExecuteTarget(Self);
  ChangeTabAction1.Tab := tabSearch;
end;

procedure TMainForm.BindSourceDB1SubDataSourceStateChange(Sender: TObject);
begin
  ChangeTabAction1.Visible := (BindSourceDB1.DataSource.State in [dsBrowse]);
end;

end.

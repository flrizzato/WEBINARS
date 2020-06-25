unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  Data.Bind.GenData, Data.Bind.ObjectScope, FMX.TabControl, System.Rtti,
  FMX.Grid.Style, Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Bind.Grid,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, FMX.ScrollBox, FMX.Grid, Data.DB,
  FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation, Data.Bind.Controls,
  FMX.Layouts, FMX.Bind.Navigator, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView;

type
  TMainForm = class(TForm)
    tabCustomer: TTabControl;
    tbsCustomer: TTabItem;
    tbsDataSync: TTabItem;
    ToolBar1: TToolBar;
    edtUser: TEdit;
    edtPass: TEdit;
    butLogin: TButton;
    dsCustomer: TDataSource;
    StringGridCustomer: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    NavigatorBindSourceDB1: TBindNavigator;
    StyleBook1: TStyleBook;
    ListViewCustomer: TListView;
    LinkListControlToField1: TLinkListControlToField;
    Label1: TLabel;
    ToolBar2: TToolBar;
    edtDeviceName: TEdit;
    butLocalSync: TButton;
    Label2: TLabel;
    butRemoteSync: TButton;
    butApplySync: TButton;
    lblLocal: TLabel;
    stgLocalChanges: TStringGrid;
    lblRemote: TLabel;
    stgRemoteChanges: TStringGrid;
    BindSourceDB3: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB3: TLinkGridToDataSource;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    butListViewEdit: TButton;
    procedure butLoginClick(Sender: TObject);
    procedure ListViewCustomerItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure butRemoteSyncClick(Sender: TObject);
    procedure butLocalSyncClick(Sender: TObject);
    procedure butApplySyncClick(Sender: TObject);
    procedure butListViewEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}
{$R *.Windows.fmx MSWINDOWS}
{$R *.LgXhdpiPh.fmx ANDROID}

uses uMainDM, FMX.DialogService;

procedure TMainForm.butApplySyncClick(Sender: TObject);
begin
  MainDM.ApplyAllChanges;
end;

procedure TMainForm.butListViewEditClick(Sender: TObject);
begin
  ListViewCustomer.EditMode := not ListViewCustomer.EditMode;
end;

procedure TMainForm.butLocalSyncClick(Sender: TObject);
begin
  MainDM.DeviceName := edtDeviceName.Text;
  MainDM.GetLocalChanges;
end;

procedure TMainForm.butLoginClick(Sender: TObject);
begin
  if MainDM.DoDatabaseLogin(edtUser.Text, edtPass.Text) then
    MainDM.qryCustomer.Open;
end;

procedure TMainForm.butRemoteSyncClick(Sender: TObject);
begin
  MainDM.DeviceName := edtDeviceName.Text;
  MainDM.GetRemoteChanges;
end;

procedure TMainForm.ListViewCustomerItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  if ItemObject is TListItemAccessory then
  begin
    TDialogService.InputQuery('Update Customer', [''],
      [MainDM.qryCustomerCOMPANY.AsString],
      procedure(const AResult: TModalResult; const AValue: array of String)
      var
        LValue: string;
      begin
        LValue := AValue[0];
        if (AResult = mrOk) and (LValue.Trim.Length > 0) then
        begin
          MainDM.qryCustomer.Edit;
          MainDM.qryCustomerCOMPANY.AsString := LValue;
          MainDM.qryCustomer.Post;
        end;
      end);
  end;
end;

end.

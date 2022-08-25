unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, Vcl.ControlList, Vcl.StdCtrls, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Vcl.Bind.ControlList, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  FireDAC.Comp.DataSet, FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.Comp.UI,
  FireDAC.Phys.IBBase;

type
  TMainForm = class(TForm)
    ControlListMain: TControlList;
    Label1: TLabel;
    Label2: TLabel;
    ControlListButton1: TControlListButton;
    ControlListButton2: TControlListButton;
    EmployeeConnection: TFDConnection;
    JOBView: TFDQuery;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    Edit1: TEdit;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    JOBViewJOB_CODE: TStringField;
    JOBViewJOB_GRADE: TSmallintField;
    JOBViewJOB_COUNTRY: TStringField;
    JOBViewJOB_TITLE: TStringField;
    JOBViewMIN_SALARY: TFMTBCDField;
    JOBViewMAX_SALARY: TFMTBCDField;
    JOBViewJOB_REQUIREMENT: TMemoField;
    JOBViewLANGUAGE_REQ: TArrayField;
    JOBViewLANGUAGE_REQ0: TStringField;
    JOBViewLANGUAGE_REQ1: TStringField;
    JOBViewLANGUAGE_REQ2: TStringField;
    JOBViewLANGUAGE_REQ3: TStringField;
    JOBViewLANGUAGE_REQ4: TStringField;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    LinkPropertyToFieldCaption2: TLinkPropertyToField;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.Edit1Change(Sender: TObject);
begin
  if TEdit(Sender).GetTextLen > 3 then
     JOBView.FindNearest([TEdit(Sender).Text]);
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  JOBView.Open;
end;

end.

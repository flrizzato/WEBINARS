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
  FireDAC.Comp.DataSet;

type
  TMainForm = class(TForm)
    ControlListMain: TControlList;
    Label1: TLabel;
    Label2: TLabel;
    ControlListButton1: TControlListButton;
    ControlListButton2: TControlListButton;
    NorthwindConnection: TFDConnection;
    Productdetails_vView: TFDQuery;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Productdetails_vViewId: TIntegerField;
    Productdetails_vViewProductName: TStringField;
    Productdetails_vViewSupplierId: TIntegerField;
    Productdetails_vViewCategoryId: TIntegerField;
    Productdetails_vViewQuantityPerUnit: TStringField;
    Productdetails_vViewUnitPrice: TLargeintField;
    Productdetails_vViewUnitsInStock: TIntegerField;
    Productdetails_vViewUnitsOnOrder: TIntegerField;
    Productdetails_vViewReorderLevel: TIntegerField;
    Productdetails_vViewDiscontinued: TIntegerField;
    Productdetails_vViewCategoryName: TStringField;
    Productdetails_vViewCategoryDescription: TStringField;
    Productdetails_vViewSupplierName: TStringField;
    Productdetails_vViewSupplierRegion: TStringField;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    LinkPropertyToFieldCaption2: TLinkPropertyToField;
    Edit1: TEdit;
    procedure Edit1Change(Sender: TObject);
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
     Productdetails_vView.FindNearest([TEdit(Sender).Text]);
end;

end.

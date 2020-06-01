unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.VCLUI.Wait, Data.DB, Vcl.StdCtrls, FireDAC.Comp.UI,
  FireDAC.Phys.IBBase, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.BatchMove.JSON, FireDAC.Comp.BatchMove,
  FireDAC.Comp.BatchMove.DataSet;

type
  TForm1 = class(TForm)
    EmployeeConnection: TFDConnection;
    CustomerTable: TFDQuery;
    DBGrid1: TDBGrid;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    DataSource1: TDataSource;
    Button1: TButton;
    FDBatchMove1: TFDBatchMove;
    FDBatchMoveDataSetReader1: TFDBatchMoveDataSetReader;
    FDBatchMoveJSONWriter1: TFDBatchMoveJSONWriter;
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    CustomerTableCUST_NO: TFDAutoIncField;
    CustomerTableCUSTOMER: TStringField;
    CustomerTableCONTACT_FIRST: TStringField;
    CustomerTableCONTACT_LAST: TStringField;
    CustomerTablePHONE_NO: TStringField;
    CustomerTableADDRESS_LINE1: TStringField;
    CustomerTableADDRESS_LINE2: TStringField;
    CustomerTableCITY: TStringField;
    CustomerTableSTATE_PROVINCE: TStringField;
    CustomerTableCOUNTRY: TStringField;
    CustomerTablePOSTAL_CODE: TStringField;
    CustomerTableON_HOLD: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uJSONHelper;

procedure TForm1.Button1Click(Sender: TObject);
begin
  CustomerTable.Open;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  sstr: TStringStream;
begin
  sstr := TStringStream.Create;
  try
    CustomerTable.DisableControls;
    FDBatchMoveJSONWriter1.Stream := sstr;
    FDBatchMove1.Execute;
    Memo1.Lines.Text := sstr.DataString;
  finally
    sstr.Free;
    CustomerTable.EnableControls;
  end
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Memo1.Lines.Text := CustomerTable.AsJSONArray;
end;

end.

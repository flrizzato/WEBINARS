unit uMainDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.VCLUI.Login, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.IB, FireDAC.Phys.IBDef, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Comp.DataSet;

type
  TMainDM = class(TDataModule)
    qryCustomer: TFDQuery;
    qryCustomerCUSTNO: TFloatField;
    qryCustomerCOMPANY: TStringField;
    qryCustomerADDR1: TStringField;
    qryCustomerADDR2: TStringField;
    qryCustomerCITY: TStringField;
    qryCustomerSTATE: TStringField;
    qryCustomerZIP: TStringField;
    qryCustomerCOUNTRY: TStringField;
    qryCustomerPHONE: TStringField;
    qryCustomerFAX: TStringField;
    qryCustomerTAXRATE: TFloatField;
    qryCustomerCONTACT: TStringField;
    qryCustomerLASTINVOICEDATE: TSQLTimeStampField;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDGUIxLoginDialog1: TFDGUIxLoginDialog;
    FDConnection1: TFDConnection;
    FDTransDefault: TFDTransaction;
    FDTransSnapshot: TFDTransaction;
    qryCustomerChanges: TFDQuery;
    qryCustomerChangesCUSTNO: TFloatField;
    qryCustomerChangesCOMPANY: TStringField;
    qryCustomerChangesADDR1: TStringField;
    qryCustomerChangesADDR2: TStringField;
    qryCustomerChangesCITY: TStringField;
    qryCustomerChangesSTATE: TStringField;
    qryCustomerChangesZIP: TStringField;
    qryCustomerChangesCOUNTRY: TStringField;
    qryCustomerChangesPHONE: TStringField;
    qryCustomerChangesFAX: TStringField;
    qryCustomerChangesTAXRATE: TFloatField;
    qryCustomerChangesCONTACT: TStringField;
    qryCustomerChangesLASTINVOICEDATE: TSQLTimeStampField;
    mtbCustomerDelta: TFDMemTable;
    mtbCustomerDeltaCUSTNO: TFloatField;
    mtbCustomerDeltaCOMPANY: TStringField;
    mtbCustomerDeltaADDR1: TStringField;
    mtbCustomerDeltaADDR2: TStringField;
    mtbCustomerDeltaCITY: TStringField;
    mtbCustomerDeltaSTATE: TStringField;
    mtbCustomerDeltaZIP: TStringField;
    mtbCustomerDeltaCOUNTRY: TStringField;
    mtbCustomerDeltaPHONE: TStringField;
    mtbCustomerDeltaFAX: TStringField;
    mtbCustomerDeltaTAXRATE: TFloatField;
    mtbCustomerDeltaCONTACT: TStringField;
    mtbCustomerDeltaLASTINVOICEDATE: TSQLTimeStampField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData;
    procedure ViewChanges;
    procedure MergeDelta;
    procedure CommitChanges;
  end;

var
  MainDM: TMainDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TMainDM }

const
  cDeviceName: string = 'PC';

procedure TMainDM.GetData;
begin
  if qryCustomer.Active then
    qryCustomer.Close;
  qryCustomer.Open;
end;

procedure TMainDM.ViewChanges;
begin
  if FDConnection1.InTransaction then
    FDConnection1.Rollback;

  FDConnection1.Transaction := FDTransSnapshot;
  FDConnection1.StartTransaction;
  FDConnection1.ExecSQL('SET SUBSCRIPTION CUSTOMER_SUB AT ' +
    QuotedSTR(cDeviceName) + ' ACTIVE');

  if qryCustomerChanges.Active then
    qryCustomerChanges.Close;
  qryCustomerChanges.Open;
end;

procedure TMainDM.MergeDelta;
begin
  mtbCustomerDelta.MergeDataSet(qryCustomer,
                                TFDMergeDataMode.dmDataSet,
                                TFDMergeMetaMode.mmUpdate);
  mtbCustomerDelta.MergeDataSet(qryCustomerChanges,
                                TFDMergeDataMode.dmDeltaMerge,
                                TFDMergeMetaMode.mmUpdate);
end;

procedure TMainDM.CommitChanges;
begin
  if FDConnection1.InTransaction then
    FDConnection1.Commit;
end;

end.

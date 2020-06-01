unit uMainDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.FMXUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Phys.CDataSalesforce,
  FireDAC.Phys.CDataSalesforceDef, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.IBBase,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteVDataSet;

type
  TMainDM = class(TDataModule)
    EmployeeConnection: TFDConnection;
    EmployeeTable: TFDQuery;
    CdatasfConnection: TFDConnection;
    OpportunityTable: TFDQuery;
    FDPhysCDataSalesforceDriverLink1: TFDPhysCDataSalesforceDriverLink;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDLocalSQL1: TFDLocalSQL;
    LocalSQLConnection: TFDConnection;
    EmpOppQuery: TFDQuery;
    EmployeeTableEMP_NO: TSmallintField;
    EmployeeTableFIRST_NAME: TStringField;
    EmployeeTableLAST_NAME: TStringField;
    EmployeeTablePHONE_EXT: TStringField;
    EmployeeTableHIRE_DATE: TSQLTimeStampField;
    EmployeeTableDEPT_NO: TStringField;
    EmployeeTableJOB_CODE: TStringField;
    EmployeeTableJOB_GRADE: TSmallintField;
    EmployeeTableJOB_COUNTRY: TStringField;
    EmployeeTableSALARY: TBCDField;
    EmployeeTableFULL_NAME: TStringField;
    OpportunityTableId: TWideStringField;
    OpportunityTableIsDeleted: TBooleanField;
    OpportunityTableAccountId: TWideStringField;
    OpportunityTableIsPrivate: TBooleanField;
    OpportunityTableName: TWideStringField;
    OpportunityTableDescription: TWideMemoField;
    OpportunityTableStageName: TWideStringField;
    OpportunityTableAmount: TFloatField;
    OpportunityTableProbability: TFloatField;
    OpportunityTableExpectedRevenue: TFloatField;
    OpportunityTableTotalOpportunityQuantity: TFloatField;
    OpportunityTableCloseDate: TSQLTimeStampField;
    OpportunityTableType: TWideStringField;
    OpportunityTableNextStep: TWideStringField;
    OpportunityTableLeadSource: TWideStringField;
    OpportunityTableIsClosed: TBooleanField;
    OpportunityTableIsWon: TBooleanField;
    OpportunityTableForecastCategory: TWideStringField;
    OpportunityTableForecastCategoryName: TWideStringField;
    OpportunityTableCampaignId: TWideStringField;
    OpportunityTableHasOpportunityLineItem: TBooleanField;
    OpportunityTablePricebook2Id: TWideStringField;
    OpportunityTableOwnerId: TWideStringField;
    OpportunityTableCreatedDate: TSQLTimeStampField;
    OpportunityTableCreatedById: TWideStringField;
    OpportunityTableLastModifiedDate: TSQLTimeStampField;
    OpportunityTableLastModifiedById: TWideStringField;
    OpportunityTableSystemModstamp: TSQLTimeStampField;
    OpportunityTableLastActivityDate: TSQLTimeStampField;
    OpportunityTableFiscalQuarter: TIntegerField;
    OpportunityTableFiscalYear: TIntegerField;
    OpportunityTableFiscal: TWideStringField;
    OpportunityTableLastViewedDate: TSQLTimeStampField;
    OpportunityTableLastReferencedDate: TSQLTimeStampField;
    OpportunityTableHasOpenActivity: TBooleanField;
    OpportunityTableHasOverdueTask: TBooleanField;
    OpportunityTableDeliveryInstallationStatus__c: TWideStringField;
    OpportunityTableTrackingNumber__c: TWideStringField;
    OpportunityTableOrderNumber__c: TWideStringField;
    OpportunityTableCurrentGenerators__c: TWideStringField;
    OpportunityTableMainCompetitors__c: TWideStringField;
    OpportunityTableEMP_NO__c: TFloatField;
    EmpOppQueryEMP_NO: TSmallintField;
    EmpOppQueryFIRST_NAME: TStringField;
    EmpOppQueryLAST_NAME: TStringField;
    EmpOppQueryJOB_CODE: TStringField;
    EmpOppQueryName: TWideStringField;
    EmpOppQueryStageName: TWideStringField;
    EmpOppQueryAmount: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainDM: TMainDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.

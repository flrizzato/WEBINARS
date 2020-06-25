object MainDM: TMainDM
  OldCreateOrder = False
  Height = 402
  Width = 546
  object EmployeeConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=EMPLOYEE')
    LoginPrompt = False
    Left = 58
    Top = 28
  end
  object EmployeeTable: TFDQuery
    Connection = EmployeeConnection
    SQL.Strings = (
      'SELECT * FROM EMPLOYEE')
    Left = 58
    Top = 76
    object EmployeeTableEMP_NO: TSmallintField
      AutoGenerateValue = arAutoInc
      FieldName = 'EMP_NO'
      Origin = 'EMP_NO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object EmployeeTableFIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
      Origin = 'FIRST_NAME'
      Required = True
      Size = 15
    end
    object EmployeeTableLAST_NAME: TStringField
      FieldName = 'LAST_NAME'
      Origin = 'LAST_NAME'
      Required = True
    end
    object EmployeeTablePHONE_EXT: TStringField
      FieldName = 'PHONE_EXT'
      Origin = 'PHONE_EXT'
      Size = 4
    end
    object EmployeeTableHIRE_DATE: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'HIRE_DATE'
      Origin = 'HIRE_DATE'
    end
    object EmployeeTableDEPT_NO: TStringField
      FieldName = 'DEPT_NO'
      Origin = 'DEPT_NO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object EmployeeTableJOB_CODE: TStringField
      FieldName = 'JOB_CODE'
      Origin = 'JOB_CODE'
      Required = True
      Size = 5
    end
    object EmployeeTableJOB_GRADE: TSmallintField
      FieldName = 'JOB_GRADE'
      Origin = 'JOB_GRADE'
      Required = True
    end
    object EmployeeTableJOB_COUNTRY: TStringField
      FieldName = 'JOB_COUNTRY'
      Origin = 'JOB_COUNTRY'
      Required = True
      Size = 15
    end
    object EmployeeTableSALARY: TBCDField
      FieldName = 'SALARY'
      Origin = 'SALARY'
      Required = True
      Precision = 18
      Size = 2
    end
    object EmployeeTableFULL_NAME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FULL_NAME'
      Origin = 'FULL_NAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 37
    end
  end
  object CdatasfConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=CDataSF')
    LoginPrompt = False
    Left = 176
    Top = 31
  end
  object OpportunityTable: TFDQuery
    Connection = CdatasfConnection
    SQL.Strings = (
      'SELECT * FROM CData.Salesforce.Opportunity')
    Left = 176
    Top = 79
    object OpportunityTableId: TWideStringField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 36
    end
    object OpportunityTableIsDeleted: TBooleanField
      FieldName = 'IsDeleted'
      Origin = 'IsDeleted'
      Required = True
    end
    object OpportunityTableAccountId: TWideStringField
      FieldName = 'AccountId'
      Origin = 'AccountId'
      Size = 36
    end
    object OpportunityTableIsPrivate: TBooleanField
      FieldName = 'IsPrivate'
      Origin = 'IsPrivate'
      Required = True
    end
    object OpportunityTableName: TWideStringField
      FieldName = 'Name'
      Origin = 'Name'
      Required = True
      Size = 240
    end
    object OpportunityTableDescription: TWideMemoField
      FieldName = 'Description'
      Origin = 'Description'
      BlobType = ftWideMemo
      Size = 64000
    end
    object OpportunityTableStageName: TWideStringField
      FieldName = 'StageName'
      Origin = 'StageName'
      Required = True
      Size = 80
    end
    object OpportunityTableAmount: TFloatField
      FieldName = 'Amount'
      Origin = 'Amount'
    end
    object OpportunityTableProbability: TFloatField
      FieldName = 'Probability'
      Origin = 'Probability'
    end
    object OpportunityTableExpectedRevenue: TFloatField
      FieldName = 'ExpectedRevenue'
      Origin = 'ExpectedRevenue'
    end
    object OpportunityTableTotalOpportunityQuantity: TFloatField
      FieldName = 'TotalOpportunityQuantity'
      Origin = 'TotalOpportunityQuantity'
    end
    object OpportunityTableCloseDate: TSQLTimeStampField
      FieldName = 'CloseDate'
      Origin = 'CloseDate'
      Required = True
    end
    object OpportunityTableType: TWideStringField
      FieldName = 'Type'
      Origin = 'Type'
      Size = 80
    end
    object OpportunityTableNextStep: TWideStringField
      FieldName = 'NextStep'
      Origin = 'NextStep'
      Size = 510
    end
    object OpportunityTableLeadSource: TWideStringField
      FieldName = 'LeadSource'
      Origin = 'LeadSource'
      Size = 80
    end
    object OpportunityTableIsClosed: TBooleanField
      FieldName = 'IsClosed'
      Origin = 'IsClosed'
      Required = True
    end
    object OpportunityTableIsWon: TBooleanField
      FieldName = 'IsWon'
      Origin = 'IsWon'
      Required = True
    end
    object OpportunityTableForecastCategory: TWideStringField
      FieldName = 'ForecastCategory'
      Origin = 'ForecastCategory'
      Required = True
      Size = 80
    end
    object OpportunityTableForecastCategoryName: TWideStringField
      FieldName = 'ForecastCategoryName'
      Origin = 'ForecastCategoryName'
      Size = 80
    end
    object OpportunityTableCampaignId: TWideStringField
      FieldName = 'CampaignId'
      Origin = 'CampaignId'
      Size = 36
    end
    object OpportunityTableHasOpportunityLineItem: TBooleanField
      FieldName = 'HasOpportunityLineItem'
      Origin = 'HasOpportunityLineItem'
      Required = True
    end
    object OpportunityTablePricebook2Id: TWideStringField
      FieldName = 'Pricebook2Id'
      Origin = 'Pricebook2Id'
      Size = 36
    end
    object OpportunityTableOwnerId: TWideStringField
      FieldName = 'OwnerId'
      Origin = 'OwnerId'
      Required = True
      Size = 36
    end
    object OpportunityTableCreatedDate: TSQLTimeStampField
      FieldName = 'CreatedDate'
      Origin = 'CreatedDate'
      Required = True
    end
    object OpportunityTableCreatedById: TWideStringField
      FieldName = 'CreatedById'
      Origin = 'CreatedById'
      Required = True
      Size = 36
    end
    object OpportunityTableLastModifiedDate: TSQLTimeStampField
      FieldName = 'LastModifiedDate'
      Origin = 'LastModifiedDate'
      Required = True
    end
    object OpportunityTableLastModifiedById: TWideStringField
      FieldName = 'LastModifiedById'
      Origin = 'LastModifiedById'
      Required = True
      Size = 36
    end
    object OpportunityTableSystemModstamp: TSQLTimeStampField
      FieldName = 'SystemModstamp'
      Origin = 'SystemModstamp'
      Required = True
    end
    object OpportunityTableLastActivityDate: TSQLTimeStampField
      FieldName = 'LastActivityDate'
      Origin = 'LastActivityDate'
    end
    object OpportunityTableFiscalQuarter: TIntegerField
      FieldName = 'FiscalQuarter'
      Origin = 'FiscalQuarter'
    end
    object OpportunityTableFiscalYear: TIntegerField
      FieldName = 'FiscalYear'
      Origin = 'FiscalYear'
    end
    object OpportunityTableFiscal: TWideStringField
      FieldName = 'Fiscal'
      Origin = 'Fiscal'
      Size = 12
    end
    object OpportunityTableLastViewedDate: TSQLTimeStampField
      FieldName = 'LastViewedDate'
      Origin = 'LastViewedDate'
    end
    object OpportunityTableLastReferencedDate: TSQLTimeStampField
      FieldName = 'LastReferencedDate'
      Origin = 'LastReferencedDate'
    end
    object OpportunityTableHasOpenActivity: TBooleanField
      FieldName = 'HasOpenActivity'
      Origin = 'HasOpenActivity'
      Required = True
    end
    object OpportunityTableHasOverdueTask: TBooleanField
      FieldName = 'HasOverdueTask'
      Origin = 'HasOverdueTask'
      Required = True
    end
    object OpportunityTableDeliveryInstallationStatus__c: TWideStringField
      FieldName = 'DeliveryInstallationStatus__c'
      Origin = 'DeliveryInstallationStatus__c'
      Size = 510
    end
    object OpportunityTableTrackingNumber__c: TWideStringField
      FieldName = 'TrackingNumber__c'
      Origin = 'TrackingNumber__c'
      Size = 24
    end
    object OpportunityTableOrderNumber__c: TWideStringField
      FieldName = 'OrderNumber__c'
      Origin = 'OrderNumber__c'
      Size = 16
    end
    object OpportunityTableCurrentGenerators__c: TWideStringField
      FieldName = 'CurrentGenerators__c'
      Origin = 'CurrentGenerators__c'
      Size = 200
    end
    object OpportunityTableMainCompetitors__c: TWideStringField
      FieldName = 'MainCompetitors__c'
      Origin = 'MainCompetitors__c'
      Size = 200
    end
    object OpportunityTableEMP_NO__c: TFloatField
      FieldName = 'EMP_NO__c'
      Origin = 'EMP_NO__c'
    end
  end
  object FDPhysCDataSalesforceDriverLink1: TFDPhysCDataSalesforceDriverLink
    DriverID = 'CDataSalesforce'
    Left = 432
    Top = 24
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 432
    Top = 72
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 432
    Top = 128
  end
  object FDLocalSQL1: TFDLocalSQL
    Connection = LocalSQLConnection
    Active = True
    DataSets = <
      item
        DataSet = EmployeeTable
        Name = 'EMP'
      end
      item
        DataSet = OpportunityTable
        Name = 'OPP'
      end>
    Left = 112
    Top = 200
  end
  object LocalSQLConnection: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    Left = 112
    Top = 144
  end
  object EmpOppQuery: TFDQuery
    Connection = LocalSQLConnection
    SQL.Strings = (
      'SELECT EMP.EMP_NO, '
      '       EMP.FIRST_NAME,'
      '       EMP.LAST_NAME,'
      '       EMP.JOB_CODE,'
      '       OPP.NAME,'
      '       OPP.STAGENAME,'
      '       OPP.AMOUNT'
      '  FROM EMP'
      'INNER JOIN OPP ON (EMP.EMP_NO = OPP.EMP_NO__C)'
      'ORDER BY OPP.AMOUNT ASC')
    Left = 112
    Top = 256
    object EmpOppQueryEMP_NO: TSmallintField
      AutoGenerateValue = arAutoInc
      FieldName = 'EMP_NO'
      Origin = 'EMP_NO'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object EmpOppQueryFIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
      Origin = 'FIRST_NAME'
      Required = True
      Size = 15
    end
    object EmpOppQueryLAST_NAME: TStringField
      FieldName = 'LAST_NAME'
      Origin = 'LAST_NAME'
      Required = True
    end
    object EmpOppQueryJOB_CODE: TStringField
      FieldName = 'JOB_CODE'
      Origin = 'JOB_CODE'
      Required = True
      Size = 5
    end
    object EmpOppQueryName: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Name'
      Origin = 'Name'
      ProviderFlags = []
      ReadOnly = True
      Size = 240
    end
    object EmpOppQueryStageName: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'StageName'
      Origin = 'StageName'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object EmpOppQueryAmount: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'Amount'
      Origin = 'Amount'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end

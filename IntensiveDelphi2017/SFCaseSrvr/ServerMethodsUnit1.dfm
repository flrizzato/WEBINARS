object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 348
  Width = 472
  object FDCnn: TFDConnection
    Params.Strings = (
      'ConnectionDef=CDATASF')
    LoginPrompt = False
    Left = 56
    Top = 16
  end
  object CaseTable: TFDQuery
    Connection = FDCnn
    SQL.Strings = (
      'SELECT * FROM CData.Salesforce."Case" ORDER BY CaseNumber')
    Left = 55
    Top = 71
    object CaseTableId: TWideStringField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 36
    end
    object CaseTableIsDeleted: TBooleanField
      FieldName = 'IsDeleted'
      Origin = 'IsDeleted'
      Required = True
    end
    object CaseTableCaseNumber: TWideStringField
      FieldName = 'CaseNumber'
      Origin = 'CaseNumber'
      Required = True
      Size = 60
    end
    object CaseTableContactId: TWideStringField
      FieldName = 'ContactId'
      Origin = 'ContactId'
      Size = 36
    end
    object CaseTableAccountId: TWideStringField
      FieldName = 'AccountId'
      Origin = 'AccountId'
      Size = 36
    end
    object CaseTableAssetId: TWideStringField
      FieldName = 'AssetId'
      Origin = 'AssetId'
      Size = 36
    end
    object CaseTableParentId: TWideStringField
      FieldName = 'ParentId'
      Origin = 'ParentId'
      Size = 36
    end
    object CaseTableSuppliedName: TWideStringField
      FieldName = 'SuppliedName'
      Origin = 'SuppliedName'
      Size = 160
    end
    object CaseTableSuppliedEmail: TWideStringField
      FieldName = 'SuppliedEmail'
      Origin = 'SuppliedEmail'
      Size = 160
    end
    object CaseTableSuppliedPhone: TWideStringField
      FieldName = 'SuppliedPhone'
      Origin = 'SuppliedPhone'
      Size = 80
    end
    object CaseTableSuppliedCompany: TWideStringField
      FieldName = 'SuppliedCompany'
      Origin = 'SuppliedCompany'
      Size = 160
    end
    object CaseTableType: TWideStringField
      FieldName = 'Type'
      Origin = 'Type'
      Size = 80
    end
    object CaseTableStatus: TWideStringField
      FieldName = 'Status'
      Origin = 'Status'
      Size = 80
    end
    object CaseTableReason: TWideStringField
      FieldName = 'Reason'
      Origin = 'Reason'
      Size = 80
    end
    object CaseTableOrigin: TWideStringField
      FieldName = 'Origin'
      Origin = 'Origin'
      Size = 80
    end
    object CaseTableSubject: TWideStringField
      FieldName = 'Subject'
      Origin = 'Subject'
      Size = 510
    end
    object CaseTablePriority: TWideStringField
      FieldName = 'Priority'
      Origin = 'Priority'
      Size = 80
    end
    object CaseTableDescription: TWideMemoField
      FieldName = 'Description'
      Origin = 'Description'
      BlobType = ftWideMemo
      Size = 64000
    end
    object CaseTableIsClosed: TBooleanField
      FieldName = 'IsClosed'
      Origin = 'IsClosed'
      Required = True
    end
    object CaseTableClosedDate: TSQLTimeStampField
      FieldName = 'ClosedDate'
      Origin = 'ClosedDate'
    end
    object CaseTableIsEscalated: TBooleanField
      FieldName = 'IsEscalated'
      Origin = 'IsEscalated'
      Required = True
    end
    object CaseTableOwnerId: TWideStringField
      FieldName = 'OwnerId'
      Origin = 'OwnerId'
      Required = True
      Size = 36
    end
    object CaseTableCreatedDate: TSQLTimeStampField
      FieldName = 'CreatedDate'
      Origin = 'CreatedDate'
      Required = True
    end
    object CaseTableCreatedById: TWideStringField
      FieldName = 'CreatedById'
      Origin = 'CreatedById'
      Required = True
      Size = 36
    end
    object CaseTableLastModifiedDate: TSQLTimeStampField
      FieldName = 'LastModifiedDate'
      Origin = 'LastModifiedDate'
      Required = True
    end
    object CaseTableLastModifiedById: TWideStringField
      FieldName = 'LastModifiedById'
      Origin = 'LastModifiedById'
      Required = True
      Size = 36
    end
    object CaseTableSystemModstamp: TSQLTimeStampField
      FieldName = 'SystemModstamp'
      Origin = 'SystemModstamp'
      Required = True
    end
    object CaseTableContactPhone: TWideStringField
      FieldName = 'ContactPhone'
      Origin = 'ContactPhone'
      Size = 80
    end
    object CaseTableContactMobile: TWideStringField
      FieldName = 'ContactMobile'
      Origin = 'ContactMobile'
      Size = 80
    end
    object CaseTableContactEmail: TWideStringField
      FieldName = 'ContactEmail'
      Origin = 'ContactEmail'
      Size = 160
    end
    object CaseTableContactFax: TWideStringField
      FieldName = 'ContactFax'
      Origin = 'ContactFax'
      Size = 80
    end
    object CaseTableLastViewedDate: TSQLTimeStampField
      FieldName = 'LastViewedDate'
      Origin = 'LastViewedDate'
    end
    object CaseTableLastReferencedDate: TSQLTimeStampField
      FieldName = 'LastReferencedDate'
      Origin = 'LastReferencedDate'
    end
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Console'
    Left = 200
    Top = 16
  end
  object FDPhysCDataSalesforceDriverLink1: TFDPhysCDataSalesforceDriverLink
    DriverID = 'CDataSalesforce'
    Left = 200
    Top = 72
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 200
    Top = 136
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 200
    Top = 192
  end
end

object MainDM: TMainDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 355
  Width = 541
  object DSRestCnn: TDSRestConnection
    Host = 'localhost'
    Port = 8080
    LoginPrompt = False
    Left = 48
    Top = 24
    UniqueId = '{28F9CEF3-146B-47A4-AA5B-2836DB3C80CA}'
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 152
    Top = 24
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 280
    Top = 24
  end
  object CaseMemTable: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 48
    Top = 80
    object CaseMemTableId: TWideStringField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 36
    end
    object CaseMemTableIsDeleted: TBooleanField
      FieldName = 'IsDeleted'
      Origin = 'IsDeleted'
      Required = True
    end
    object CaseMemTableCaseNumber: TWideStringField
      FieldName = 'CaseNumber'
      Origin = 'CaseNumber'
      Required = True
      Size = 60
    end
    object CaseMemTableContactId: TWideStringField
      FieldName = 'ContactId'
      Origin = 'ContactId'
      Size = 36
    end
    object CaseMemTableAccountId: TWideStringField
      FieldName = 'AccountId'
      Origin = 'AccountId'
      Size = 36
    end
    object CaseMemTableAssetId: TWideStringField
      FieldName = 'AssetId'
      Origin = 'AssetId'
      Size = 36
    end
    object CaseMemTableParentId: TWideStringField
      FieldName = 'ParentId'
      Origin = 'ParentId'
      Size = 36
    end
    object CaseMemTableSuppliedName: TWideStringField
      FieldName = 'SuppliedName'
      Origin = 'SuppliedName'
      Size = 160
    end
    object CaseMemTableSuppliedEmail: TWideStringField
      FieldName = 'SuppliedEmail'
      Origin = 'SuppliedEmail'
      Size = 160
    end
    object CaseMemTableSuppliedPhone: TWideStringField
      FieldName = 'SuppliedPhone'
      Origin = 'SuppliedPhone'
      Size = 80
    end
    object CaseMemTableSuppliedCompany: TWideStringField
      FieldName = 'SuppliedCompany'
      Origin = 'SuppliedCompany'
      Size = 160
    end
    object CaseMemTableType: TWideStringField
      FieldName = 'Type'
      Origin = 'Type'
      Size = 80
    end
    object CaseMemTableStatus: TWideStringField
      FieldName = 'Status'
      Origin = 'Status'
      Size = 80
    end
    object CaseMemTableReason: TWideStringField
      FieldName = 'Reason'
      Origin = 'Reason'
      Size = 80
    end
    object CaseMemTableOrigin: TWideStringField
      FieldName = 'Origin'
      Origin = 'Origin'
      Size = 80
    end
    object CaseMemTableSubject: TWideStringField
      FieldName = 'Subject'
      Origin = 'Subject'
      Size = 510
    end
    object CaseMemTablePriority: TWideStringField
      FieldName = 'Priority'
      Origin = 'Priority'
      Size = 80
    end
    object CaseMemTableDescription: TWideMemoField
      FieldName = 'Description'
      Origin = 'Description'
      BlobType = ftWideMemo
      Size = 64000
    end
    object CaseMemTableIsClosed: TBooleanField
      FieldName = 'IsClosed'
      Origin = 'IsClosed'
      Required = True
    end
    object CaseMemTableClosedDate: TSQLTimeStampField
      FieldName = 'ClosedDate'
      Origin = 'ClosedDate'
    end
    object CaseMemTableIsEscalated: TBooleanField
      FieldName = 'IsEscalated'
      Origin = 'IsEscalated'
      Required = True
    end
    object CaseMemTableOwnerId: TWideStringField
      FieldName = 'OwnerId'
      Origin = 'OwnerId'
      Required = True
      Size = 36
    end
    object CaseMemTableCreatedDate: TSQLTimeStampField
      FieldName = 'CreatedDate'
      Origin = 'CreatedDate'
      Required = True
    end
    object CaseMemTableCreatedById: TWideStringField
      FieldName = 'CreatedById'
      Origin = 'CreatedById'
      Required = True
      Size = 36
    end
    object CaseMemTableLastModifiedDate: TSQLTimeStampField
      FieldName = 'LastModifiedDate'
      Origin = 'LastModifiedDate'
      Required = True
    end
    object CaseMemTableLastModifiedById: TWideStringField
      FieldName = 'LastModifiedById'
      Origin = 'LastModifiedById'
      Required = True
      Size = 36
    end
    object CaseMemTableSystemModstamp: TSQLTimeStampField
      FieldName = 'SystemModstamp'
      Origin = 'SystemModstamp'
      Required = True
    end
    object CaseMemTableContactPhone: TWideStringField
      FieldName = 'ContactPhone'
      Origin = 'ContactPhone'
      Size = 80
    end
    object CaseMemTableContactMobile: TWideStringField
      FieldName = 'ContactMobile'
      Origin = 'ContactMobile'
      Size = 80
    end
    object CaseMemTableContactEmail: TWideStringField
      FieldName = 'ContactEmail'
      Origin = 'ContactEmail'
      Size = 160
    end
    object CaseMemTableContactFax: TWideStringField
      FieldName = 'ContactFax'
      Origin = 'ContactFax'
      Size = 80
    end
    object CaseMemTableLastViewedDate: TSQLTimeStampField
      FieldName = 'LastViewedDate'
      Origin = 'LastViewedDate'
    end
    object CaseMemTableLastReferencedDate: TSQLTimeStampField
      FieldName = 'LastReferencedDate'
      Origin = 'LastReferencedDate'
    end
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 392
    Top = 24
  end
end

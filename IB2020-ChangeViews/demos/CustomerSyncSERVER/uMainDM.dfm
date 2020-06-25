object CustomerSyncResource1: TCustomerSyncResource1
  OldCreateOrder = False
  Height = 430
  Width = 627
  object qryCustomer: TFDQuery
    CachedUpdates = True
    FilterChanges = [rtModified, rtInserted, rtDeleted, rtUnmodified]
    Connection = cnnMastSQL
    ResourceOptions.AssignedValues = [rvStoreItems, rvStoreMergeData]
    SQL.Strings = (
      'SELECT * FROM CUSTOMER ORDER BY CUSTNO')
    Left = 80
    Top = 144
    object qryCustomerCUSTNO: TFloatField
      FieldName = 'CUSTNO'
      Origin = 'CUSTNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCustomerCOMPANY: TStringField
      FieldName = 'COMPANY'
      Origin = 'COMPANY'
      Required = True
      Size = 30
    end
    object qryCustomerADDR1: TStringField
      FieldName = 'ADDR1'
      Origin = 'ADDR1'
      Size = 30
    end
    object qryCustomerADDR2: TStringField
      FieldName = 'ADDR2'
      Origin = 'ADDR2'
      Size = 30
    end
    object qryCustomerCITY: TStringField
      FieldName = 'CITY'
      Origin = 'CITY'
      Size = 15
    end
    object qryCustomerSTATE: TStringField
      FieldName = 'STATE'
      Origin = 'STATE'
    end
    object qryCustomerZIP: TStringField
      FieldName = 'ZIP'
      Origin = 'ZIP'
      Size = 10
    end
    object qryCustomerCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Origin = 'COUNTRY'
    end
    object qryCustomerPHONE: TStringField
      FieldName = 'PHONE'
      Origin = 'PHONE'
      Size = 15
    end
    object qryCustomerFAX: TStringField
      FieldName = 'FAX'
      Origin = 'FAX'
      Size = 15
    end
    object qryCustomerTAXRATE: TFloatField
      FieldName = 'TAXRATE'
      Origin = 'TAXRATE'
    end
    object qryCustomerCONTACT: TStringField
      FieldName = 'CONTACT'
      Origin = 'CONTACT'
    end
    object qryCustomerLASTINVOICEDATE: TSQLTimeStampField
      FieldName = 'LASTINVOICEDATE'
      Origin = 'LASTINVOICEDATE'
    end
  end
  object cnnMastSQL: TFDConnection
    Params.Strings = (
      'Database=C:\data\MASTSQL2020.IB'
      'Protocol=TCPIP'
      'Server=localhost'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=IB')
    LoginPrompt = False
    Transaction = FDTransSnapshot
    UpdateTransaction = FDTransDefault
    Left = 88
    Top = 32
  end
  object FDTransDefault: TFDTransaction
    Connection = cnnMastSQL
    Left = 136
    Top = 88
  end
  object FDTransSnapshot: TFDTransaction
    Options.Isolation = xiSnapshot
    Connection = cnnMastSQL
    Left = 40
    Top = 88
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Console'
    Left = 520
    Top = 24
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 520
    Top = 80
  end
  object memCustomerChanges: TFDMemTable
    FieldDefs = <>
    CachedUpdates = True
    FilterChanges = [rtModified, rtInserted, rtDeleted, rtUnmodified]
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvStoreItems, rvSilentMode, rvStoreMergeData, rvStoreMergeMeta]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 304
    Top = 32
    object memCustomerChangesCUSTNO: TFloatField
      FieldName = 'CUSTNO'
      Origin = 'CUSTNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object memCustomerChangesCOMPANY: TStringField
      FieldName = 'COMPANY'
      Origin = 'COMPANY'
      Size = 30
    end
    object memCustomerChangesADDR1: TStringField
      FieldName = 'ADDR1'
      Origin = 'ADDR1'
      Size = 30
    end
    object memCustomerChangesADDR2: TStringField
      FieldName = 'ADDR2'
      Origin = 'ADDR2'
      Size = 30
    end
    object memCustomerChangesCITY: TStringField
      FieldName = 'CITY'
      Origin = 'CITY'
      Size = 15
    end
    object memCustomerChangesSTATE: TStringField
      FieldName = 'STATE'
      Origin = 'STATE'
    end
    object memCustomerChangesZIP: TStringField
      FieldName = 'ZIP'
      Origin = 'ZIP'
      Size = 10
    end
    object memCustomerChangesCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Origin = 'COUNTRY'
    end
    object memCustomerChangesPHONE: TStringField
      FieldName = 'PHONE'
      Origin = 'PHONE'
      Size = 15
    end
    object memCustomerChangesFAX: TStringField
      FieldName = 'FAX'
      Origin = 'FAX'
      Size = 15
    end
    object memCustomerChangesTAXRATE: TFloatField
      FieldName = 'TAXRATE'
      Origin = 'TAXRATE'
    end
    object memCustomerChangesCONTACT: TStringField
      FieldName = 'CONTACT'
      Origin = 'CONTACT'
    end
    object memCustomerChangesLASTINVOICEDATE: TSQLTimeStampField
      FieldName = 'LASTINVOICEDATE'
      Origin = 'LASTINVOICEDATE'
    end
  end
end

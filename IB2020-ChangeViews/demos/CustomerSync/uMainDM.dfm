object MainDM: TMainDM
  OldCreateOrder = False
  Height = 440
  Width = 771
  object cnnMastSQL: TFDConnection
    Params.Strings = (
      'Database=C:\data\MASTSQL2020.IB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=localhost'
      'DriverID=IB')
    LoginPrompt = False
    BeforeConnect = cnnMastSQLBeforeConnect
    Left = 56
    Top = 24
  end
  object qryCustomer: TFDQuery
    AfterPost = qryCustomerAfterPost
    AfterCancel = qryCustomerAfterCancel
    AfterDelete = qryCustomerAfterDelete
    CachedUpdates = True
    Connection = cnnMastSQL
    SQL.Strings = (
      'SELECT * FROM CUSTOMER ORDER BY CUSTNO')
    Left = 56
    Top = 136
    object qryCustomerCUSTNO: TFloatField
      FieldName = 'CUSTNO'
      Origin = 'CUSTNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryCustomerCOMPANY: TStringField
      FieldName = 'COMPANY'
      Origin = 'COMPANY'
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
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 656
    Top = 32
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 56
    Top = 80
  end
  object memRemoteChanges: TFDMemTable
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
    Left = 352
    Top = 192
    object memRemoteChangesCUSTNO: TFloatField
      FieldName = 'CUSTNO'
      Origin = 'CUSTNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object memRemoteChangesCOMPANY: TStringField
      FieldName = 'COMPANY'
      Origin = 'COMPANY'
      Size = 30
    end
    object memRemoteChangesADDR1: TStringField
      FieldName = 'ADDR1'
      Origin = 'ADDR1'
      Size = 30
    end
    object memRemoteChangesADDR2: TStringField
      FieldName = 'ADDR2'
      Origin = 'ADDR2'
      Size = 30
    end
    object memRemoteChangesCITY: TStringField
      FieldName = 'CITY'
      Origin = 'CITY'
      Size = 15
    end
    object memRemoteChangesSTATE: TStringField
      FieldName = 'STATE'
      Origin = 'STATE'
    end
    object memRemoteChangesZIP: TStringField
      FieldName = 'ZIP'
      Origin = 'ZIP'
      Size = 10
    end
    object memRemoteChangesCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Origin = 'COUNTRY'
    end
    object memRemoteChangesPHONE: TStringField
      FieldName = 'PHONE'
      Origin = 'PHONE'
      Size = 15
    end
    object memRemoteChangesFAX: TStringField
      FieldName = 'FAX'
      Origin = 'FAX'
      Size = 15
    end
    object memRemoteChangesTAXRATE: TFloatField
      FieldName = 'TAXRATE'
      Origin = 'TAXRATE'
    end
    object memRemoteChangesCONTACT: TStringField
      FieldName = 'CONTACT'
      Origin = 'CONTACT'
    end
    object memRemoteChangesLASTINVOICEDATE: TSQLTimeStampField
      FieldName = 'LASTINVOICEDATE'
      Origin = 'LASTINVOICEDATE'
    end
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 656
    Top = 96
  end
  object qryLocalChanges: TFDQuery
    CachedUpdates = True
    FilterChanges = [rtModified, rtInserted, rtDeleted, rtUnmodified]
    Connection = cnnMastSQLDelta
    SQL.Strings = (
      'SELECT * FROM CUSTOMER ORDER BY CUSTNO')
    Left = 176
    Top = 136
    object qryLocalChangesCUSTNO: TFloatField
      FieldName = 'CUSTNO'
      Origin = 'CUSTNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryLocalChangesCOMPANY: TStringField
      FieldName = 'COMPANY'
      Origin = 'COMPANY'
      Required = True
      Size = 30
    end
    object qryLocalChangesADDR1: TStringField
      FieldName = 'ADDR1'
      Origin = 'ADDR1'
      Size = 30
    end
    object qryLocalChangesADDR2: TStringField
      FieldName = 'ADDR2'
      Origin = 'ADDR2'
      Size = 30
    end
    object qryLocalChangesCITY: TStringField
      FieldName = 'CITY'
      Origin = 'CITY'
      Size = 15
    end
    object qryLocalChangesSTATE: TStringField
      FieldName = 'STATE'
      Origin = 'STATE'
    end
    object qryLocalChangesZIP: TStringField
      FieldName = 'ZIP'
      Origin = 'ZIP'
      Size = 10
    end
    object qryLocalChangesCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Origin = 'COUNTRY'
    end
    object qryLocalChangesPHONE: TStringField
      FieldName = 'PHONE'
      Origin = 'PHONE'
      Size = 15
    end
    object qryLocalChangesFAX: TStringField
      FieldName = 'FAX'
      Origin = 'FAX'
      Size = 15
    end
    object qryLocalChangesTAXRATE: TFloatField
      FieldName = 'TAXRATE'
      Origin = 'TAXRATE'
    end
    object qryLocalChangesCONTACT: TStringField
      FieldName = 'CONTACT'
      Origin = 'CONTACT'
    end
    object qryLocalChangesLASTINVOICEDATE: TSQLTimeStampField
      FieldName = 'LASTINVOICEDATE'
      Origin = 'LASTINVOICEDATE'
    end
  end
  object FDTransSnapshot: TFDTransaction
    Options.Isolation = xiSnapshot
    Connection = cnnMastSQLDelta
    Left = 176
    Top = 80
  end
  object cnnMastSQLDelta: TFDConnection
    Params.Strings = (
      'Database=C:\data\MASTSQL2020.IB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=localhost'
      'DriverID=IB')
    LoginPrompt = False
    Transaction = FDTransSnapshot
    BeforeConnect = cnnMastSQLBeforeConnect
    Left = 176
    Top = 24
  end
  object RESTClientSync: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://a56638a9e9c6.ngrok.io'
    ContentType = 'application/x-www-form-urlencoded'
    Params = <>
    Left = 352
    Top = 24
  end
  object RESTRequestGET: TRESTRequest
    Client = RESTClientSync
    Params = <>
    Resource = 'CustomerSync'
    Response = RESTResponseGET
    OnAfterExecute = RESTRequestGETAfterExecute
    Left = 304
    Top = 80
  end
  object RESTResponseGET: TRESTResponse
    Left = 304
    Top = 136
  end
  object RESTRequestPOST: TRESTRequest
    Client = RESTClientSync
    Method = rmPOST
    Params = <>
    Resource = 'CustomerSync'
    Response = RESTResponsePOST
    Left = 400
    Top = 80
  end
  object RESTResponsePOST: TRESTResponse
    ContentType = 'text/html'
    Left = 400
    Top = 136
  end
end

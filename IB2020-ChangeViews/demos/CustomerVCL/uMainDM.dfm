object MainDM: TMainDM
  OldCreateOrder = False
  Height = 475
  Width = 579
  object qryCustomer: TFDQuery
    CachedUpdates = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM CUSTOMER ORDER BY CUSTNO')
    Left = 48
    Top = 80
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
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 264
    Top = 24
  end
  object FDGUIxLoginDialog1: TFDGUIxLoginDialog
    Provider = 'Forms'
    Left = 152
    Top = 24
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\data\MASTSQL2020.IB'
      'Protocol=TCPIP'
      'Server=localhost'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=IB')
    LoginDialog = FDGUIxLoginDialog1
    Left = 52
    Top = 24
  end
  object FDTransDefault: TFDTransaction
    Connection = FDConnection1
    Left = 144
    Top = 80
  end
  object FDTransSnapshot: TFDTransaction
    Options.Isolation = xiSnapshot
    Options.DisconnectAction = xdNone
    Connection = FDConnection1
    Left = 240
    Top = 80
  end
  object qryCustomerChanges: TFDQuery
    CachedUpdates = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM CUSTOMER ORDER BY CUSTNO')
    Left = 48
    Top = 136
    object qryCustomerChangesCUSTNO: TFloatField
      FieldName = 'CUSTNO'
      Origin = 'CUSTNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCustomerChangesCOMPANY: TStringField
      FieldName = 'COMPANY'
      Origin = 'COMPANY'
      Required = True
      Size = 30
    end
    object qryCustomerChangesADDR1: TStringField
      FieldName = 'ADDR1'
      Origin = 'ADDR1'
      Size = 30
    end
    object qryCustomerChangesADDR2: TStringField
      FieldName = 'ADDR2'
      Origin = 'ADDR2'
      Size = 30
    end
    object qryCustomerChangesCITY: TStringField
      FieldName = 'CITY'
      Origin = 'CITY'
      Size = 15
    end
    object qryCustomerChangesSTATE: TStringField
      FieldName = 'STATE'
      Origin = 'STATE'
    end
    object qryCustomerChangesZIP: TStringField
      FieldName = 'ZIP'
      Origin = 'ZIP'
      Size = 10
    end
    object qryCustomerChangesCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Origin = 'COUNTRY'
    end
    object qryCustomerChangesPHONE: TStringField
      FieldName = 'PHONE'
      Origin = 'PHONE'
      Size = 15
    end
    object qryCustomerChangesFAX: TStringField
      FieldName = 'FAX'
      Origin = 'FAX'
      Size = 15
    end
    object qryCustomerChangesTAXRATE: TFloatField
      FieldName = 'TAXRATE'
      Origin = 'TAXRATE'
    end
    object qryCustomerChangesCONTACT: TStringField
      FieldName = 'CONTACT'
      Origin = 'CONTACT'
    end
    object qryCustomerChangesLASTINVOICEDATE: TSQLTimeStampField
      FieldName = 'LASTINVOICEDATE'
      Origin = 'LASTINVOICEDATE'
    end
  end
  object mtbCustomerDelta: TFDMemTable
    CachedUpdates = True
    FilterChanges = [rtModified, rtInserted, rtDeleted, rtUnmodified]
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 48
    Top = 192
    object mtbCustomerDeltaCUSTNO: TFloatField
      FieldName = 'CUSTNO'
      Origin = 'CUSTNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object mtbCustomerDeltaCOMPANY: TStringField
      FieldName = 'COMPANY'
      Origin = 'COMPANY'
      Required = True
      Size = 30
    end
    object mtbCustomerDeltaADDR1: TStringField
      FieldName = 'ADDR1'
      Origin = 'ADDR1'
      Size = 30
    end
    object mtbCustomerDeltaADDR2: TStringField
      FieldName = 'ADDR2'
      Origin = 'ADDR2'
      Size = 30
    end
    object mtbCustomerDeltaCITY: TStringField
      FieldName = 'CITY'
      Origin = 'CITY'
      Size = 15
    end
    object mtbCustomerDeltaSTATE: TStringField
      FieldName = 'STATE'
      Origin = 'STATE'
    end
    object mtbCustomerDeltaZIP: TStringField
      FieldName = 'ZIP'
      Origin = 'ZIP'
      Size = 10
    end
    object mtbCustomerDeltaCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Origin = 'COUNTRY'
    end
    object mtbCustomerDeltaPHONE: TStringField
      FieldName = 'PHONE'
      Origin = 'PHONE'
      Size = 15
    end
    object mtbCustomerDeltaFAX: TStringField
      FieldName = 'FAX'
      Origin = 'FAX'
      Size = 15
    end
    object mtbCustomerDeltaTAXRATE: TFloatField
      FieldName = 'TAXRATE'
      Origin = 'TAXRATE'
    end
    object mtbCustomerDeltaCONTACT: TStringField
      FieldName = 'CONTACT'
      Origin = 'CONTACT'
    end
    object mtbCustomerDeltaLASTINVOICEDATE: TSQLTimeStampField
      FieldName = 'LASTINVOICEDATE'
      Origin = 'LASTINVOICEDATE'
    end
  end
end

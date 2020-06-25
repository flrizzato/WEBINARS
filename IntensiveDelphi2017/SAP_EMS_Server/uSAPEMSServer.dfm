object SAPEMSServerResource1: TSAPEMSServerResource1
  OldCreateOrder = False
  Height = 362
  Width = 536
  object CdatasapConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=CDataSAP')
    LoginPrompt = False
    Left = 64
    Top = 16
  end
  object VbakView: TFDQuery
    Connection = CdatasapConnection
    SchemaAdapter = FDSchemaAdapter1
    SQL.Strings = (
      'SELECT VBELN, AUDAT, VKORG, NETWR'
      '  FROM CData.SAP.VBAK')
    Left = 64
    Top = 80
    object VbakViewVBELN: TWideStringField
      FieldName = 'VBELN'
      Origin = 'VBELN'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object VbakViewAUDAT: TSQLTimeStampField
      FieldName = 'AUDAT'
      Origin = 'AUDAT'
    end
    object VbakViewVKORG: TWideStringField
      FieldName = 'VKORG'
      Origin = 'VKORG'
      Size = 8
    end
    object VbakViewNETWR: TFloatField
      FieldName = 'NETWR'
      Origin = 'NETWR'
    end
  end
  object FDPhysCDataSAPDriverLink1: TFDPhysCDataSAPDriverLink
    DriverID = 'CDataSAP'
    Left = 192
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Console'
    Left = 192
    Top = 72
  end
  object FDSchemaAdapter1: TFDSchemaAdapter
    Left = 64
    Top = 144
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 328
    Top = 16
  end
end

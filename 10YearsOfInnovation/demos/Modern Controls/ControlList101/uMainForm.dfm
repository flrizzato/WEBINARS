object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'TControlList 101'
  ClientHeight = 343
  ClientWidth = 556
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 13
  object ControlListMain: TControlList
    AlignWithMargins = True
    Left = 5
    Top = 36
    Width = 546
    Height = 302
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    ItemCount = 77
    ItemIndex = 0
    ItemMargins.Left = 0
    ItemMargins.Top = 0
    ItemMargins.Right = 0
    ItemMargins.Bottom = 0
    ItemSelectionOptions.HotColorAlpha = 50
    ItemSelectionOptions.SelectedColorAlpha = 70
    ItemSelectionOptions.FocusedColorAlpha = 80
    ParentColor = False
    TabOrder = 0
    ExplicitHeight = 303
    object Label1: TLabel
      AlignWithMargins = True
      Left = 10
      Top = 25
      Width = 327
      Height = 38
      Margins.Left = 10
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      Caption = 'Prepared meats'
      EllipsisPosition = epEndEllipsis
      ShowAccelChar = False
      Transparent = True
      WordWrap = True
    end
    object Label2: TLabel
      Left = 10
      Top = 6
      Width = 71
      Height = 13
      Caption = 'Alice Mutton'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object ControlListButton1: TControlListButton
      AlignWithMargins = True
      Left = 459
      Top = 20
      Width = 30
      Height = 30
      Margins.Left = 2
      Margins.Top = 20
      Margins.Right = 2
      Margins.Bottom = 20
      Align = alRight
      LinkHotColor = clHighlight
      Style = clbkToolButton
      ExplicitLeft = 339
    end
    object ControlListButton2: TControlListButton
      AlignWithMargins = True
      Left = 493
      Top = 20
      Width = 30
      Height = 30
      Margins.Left = 2
      Margins.Top = 20
      Margins.Right = 2
      Margins.Bottom = 20
      Align = alRight
      LinkHotColor = clHighlight
      Style = clbkToolButton
      ExplicitLeft = 373
    end
  end
  object Edit1: TEdit
    AlignWithMargins = True
    Left = 5
    Top = 5
    Width = 546
    Height = 21
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    TabOrder = 1
    TextHint = 'Search here'
    OnChange = Edit1Change
  end
  object EmployeeConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=EMPLOYEE')
    Connected = True
    LoginPrompt = False
    Left = 304
    Top = 113
  end
  object JOBView: TFDQuery
    IndexFieldNames = 'JOB_TITLE'
    Connection = EmployeeConnection
    SQL.Strings = (
      'SELECT * FROM JOB')
    Left = 435
    Top = 113
    object JOBViewJOB_CODE: TStringField
      FieldName = 'JOB_CODE'
      Origin = 'JOB_CODE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object JOBViewJOB_GRADE: TSmallintField
      FieldName = 'JOB_GRADE'
      Origin = 'JOB_GRADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object JOBViewJOB_COUNTRY: TStringField
      FieldName = 'JOB_COUNTRY'
      Origin = 'JOB_COUNTRY'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object JOBViewJOB_TITLE: TStringField
      FieldName = 'JOB_TITLE'
      Origin = 'JOB_TITLE'
      Required = True
      Size = 25
    end
    object JOBViewMIN_SALARY: TFMTBCDField
      FieldName = 'MIN_SALARY'
      Origin = 'MIN_SALARY'
      Required = True
      Precision = 18
      Size = 2
    end
    object JOBViewMAX_SALARY: TFMTBCDField
      FieldName = 'MAX_SALARY'
      Origin = 'MAX_SALARY'
      Required = True
      Precision = 18
      Size = 2
    end
    object JOBViewJOB_REQUIREMENT: TMemoField
      FieldName = 'JOB_REQUIREMENT'
      Origin = 'JOB_REQUIREMENT'
      BlobType = ftMemo
    end
    object JOBViewLANGUAGE_REQ: TArrayField
      FieldName = 'LANGUAGE_REQ'
      Origin = 'LANGUAGE_REQ'
      ObjectType = 'JOB.LANGUAGE_REQ'
      object JOBViewLANGUAGE_REQ0: TStringField
        AutoGenerateValue = arDefault
        FieldName = 'LANGUAGE_REQ[0]'
        Size = 15
      end
      object JOBViewLANGUAGE_REQ1: TStringField
        AutoGenerateValue = arDefault
        FieldName = 'LANGUAGE_REQ[1]'
        Size = 15
      end
      object JOBViewLANGUAGE_REQ2: TStringField
        AutoGenerateValue = arDefault
        FieldName = 'LANGUAGE_REQ[2]'
        Size = 15
      end
      object JOBViewLANGUAGE_REQ3: TStringField
        AutoGenerateValue = arDefault
        FieldName = 'LANGUAGE_REQ[3]'
        Size = 15
      end
      object JOBViewLANGUAGE_REQ4: TStringField
        AutoGenerateValue = arDefault
        FieldName = 'LANGUAGE_REQ[4]'
        Size = 15
      end
    end
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = JOBView
    ScopeMappings = <>
    Left = 432
    Top = 176
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 436
    Top = 237
    object LinkPropertyToFieldCaption: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'JOB_TITLE'
      Component = Label2
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption2: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'JOB_REQUIREMENT'
      Component = Label1
      ComponentProperty = 'Caption'
    end
    object LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      GridControl = ControlListMain
      Columns = <>
    end
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 304
    Top = 176
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 304
    Top = 240
  end
end

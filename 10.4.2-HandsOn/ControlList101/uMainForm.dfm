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
  OldCreateOrder = False
  PixelsPerInch = 96
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
  object NorthwindConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=Northwind')
    Connected = True
    LoginPrompt = False
    Left = 328
    Top = 105
  end
  object Productdetails_vView: TFDQuery
    Active = True
    IndexFieldNames = 'ProductName'
    Connection = NorthwindConnection
    SQL.Strings = (
      'SELECT * FROM ProductDetails_V')
    Left = 443
    Top = 105
    object Productdetails_vViewId: TIntegerField
      FieldName = 'Id'
    end
    object Productdetails_vViewProductName: TStringField
      FieldName = 'ProductName'
      Size = 8000
    end
    object Productdetails_vViewSupplierId: TIntegerField
      FieldName = 'SupplierId'
      Required = True
    end
    object Productdetails_vViewCategoryId: TIntegerField
      FieldName = 'CategoryId'
      Required = True
    end
    object Productdetails_vViewQuantityPerUnit: TStringField
      FieldName = 'QuantityPerUnit'
      Size = 8000
    end
    object Productdetails_vViewUnitPrice: TLargeintField
      FieldName = 'UnitPrice'
      Required = True
    end
    object Productdetails_vViewUnitsInStock: TIntegerField
      FieldName = 'UnitsInStock'
      Required = True
    end
    object Productdetails_vViewUnitsOnOrder: TIntegerField
      FieldName = 'UnitsOnOrder'
      Required = True
    end
    object Productdetails_vViewReorderLevel: TIntegerField
      FieldName = 'ReorderLevel'
      Required = True
    end
    object Productdetails_vViewDiscontinued: TIntegerField
      FieldName = 'Discontinued'
      Required = True
    end
    object Productdetails_vViewCategoryName: TStringField
      FieldName = 'CategoryName'
      Size = 8000
    end
    object Productdetails_vViewCategoryDescription: TStringField
      FieldName = 'CategoryDescription'
      Size = 8000
    end
    object Productdetails_vViewSupplierName: TStringField
      FieldName = 'SupplierName'
      Size = 8000
    end
    object Productdetails_vViewSupplierRegion: TStringField
      FieldName = 'SupplierRegion'
      Size = 8000
    end
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = Productdetails_vView
    ScopeMappings = <>
    Left = 328
    Top = 160
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 428
    Top = 157
    object LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      GridControl = ControlListMain
      Columns = <>
    end
    object LinkPropertyToFieldCaption: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'ProductName'
      Component = Label2
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption2: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'CategoryDescription'
      Component = Label1
      ComponentProperty = 'Caption'
    end
  end
end

object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Customer VCL'
  ClientHeight = 523
  ClientWidth = 764
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 263
    Width = 764
    Height = 5
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 400
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 393
    Width = 764
    Height = 5
    Cursor = crVSplit
    Align = alBottom
    ExplicitLeft = -8
    ExplicitTop = 398
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 764
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object butGetData: TButton
      Left = 8
      Top = 13
      Width = 95
      Height = 25
      Caption = 'Get Data'
      TabOrder = 0
      OnClick = butGetDataClick
    end
    object butViewChanges: TButton
      Left = 109
      Top = 13
      Width = 95
      Height = 25
      Caption = 'View Changes'
      TabOrder = 1
      OnClick = butViewChangesClick
    end
    object butMergeDelta: TButton
      Left = 210
      Top = 13
      Width = 95
      Height = 25
      Caption = 'Merge Delta'
      TabOrder = 2
      OnClick = butMergeDeltaClick
    end
    object butCommit: TButton
      Left = 311
      Top = 13
      Width = 95
      Height = 25
      Caption = 'Commit Changes'
      TabOrder = 3
      OnClick = butCommitClick
    end
  end
  object gridData: TDBGrid
    Left = 0
    Top = 50
    Width = 764
    Height = 213
    Align = alClient
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CUSTNO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMPANY'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADDR1'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADDR2'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CITY'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATE'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZIP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COUNTRY'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PHONE'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FAX'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAXRATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTACT'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LASTINVOICEDATE'
        Width = 64
        Visible = True
      end>
  end
  object gridDelta: TDBGrid
    Left = 0
    Top = 398
    Width = 764
    Height = 125
    Align = alBottom
    DataSource = DataSource3
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = gridDeltaDrawColumnCell
  end
  object gridChanges: TDBGrid
    Left = 0
    Top = 268
    Width = 764
    Height = 125
    Align = alBottom
    DataSource = DataSource2
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CUSTNO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMPANY'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADDR1'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADDR2'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CITY'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATE'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZIP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COUNTRY'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PHONE'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FAX'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAXRATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTACT'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LASTINVOICEDATE'
        Width = 64
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = MainDM.qryCustomer
    Left = 672
    Top = 80
  end
  object DataSource2: TDataSource
    DataSet = MainDM.qryCustomerChanges
    Left = 672
    Top = 288
  end
  object DataSource3: TDataSource
    DataSet = MainDM.mtbCustomerDelta
    Left = 680
    Top = 416
  end
end

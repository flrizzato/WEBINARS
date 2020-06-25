object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Change Views 101'
  ClientHeight = 489
  ClientWidth = 760
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 760
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object butOpen: TButton
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 90
      Height = 40
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Action = acOpenDataSet
      Align = alLeft
      TabOrder = 0
    end
    object ToggleSwitch1: TToggleSwitch
      AlignWithMargins = True
      Left = 652
      Top = 10
      Width = 103
      Height = 30
      Margins.Left = 5
      Margins.Top = 10
      Margins.Right = 5
      Margins.Bottom = 10
      Align = alRight
      StateCaptions.CaptionOn = 'Sub On'
      StateCaptions.CaptionOff = 'Sub Off'
      SwitchHeight = 25
      SwitchWidth = 60
      TabOrder = 1
      ThumbColor = clHotLight
      OnClick = ToggleSwitch1Click
      ExplicitHeight = 25
    end
    object butCommit: TButton
      AlignWithMargins = True
      Left = 105
      Top = 5
      Width = 90
      Height = 40
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Action = acCommit
      Align = alLeft
      TabOrder = 2
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 50
    Width = 760
    Height = 395
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADDR2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CITY'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATE'
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PHONE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FAX'
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LASTINVOICEDATE'
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 445
    Width = 760
    Height = 25
    DataSource = DataSource1
    Align = alBottom
    TabOrder = 2
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 470
    Width = 760
    Height = 19
    Panels = <>
    SimplePanel = True
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
    AfterConnect = FDConnection1AfterConnect
    Left = 68
    Top = 112
  end
  object FDQuery1: TFDQuery
    CachedUpdates = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM CUSTOMER ORDER BY CUSTNO')
    Left = 64
    Top = 168
    object FDQuery1CUSTNO: TFloatField
      FieldName = 'CUSTNO'
      Origin = 'CUSTNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery1COMPANY: TStringField
      FieldName = 'COMPANY'
      Origin = 'COMPANY'
      Required = True
      Size = 30
    end
    object FDQuery1ADDR1: TStringField
      FieldName = 'ADDR1'
      Origin = 'ADDR1'
      Size = 30
    end
    object FDQuery1ADDR2: TStringField
      FieldName = 'ADDR2'
      Origin = 'ADDR2'
      Size = 30
    end
    object FDQuery1CITY: TStringField
      FieldName = 'CITY'
      Origin = 'CITY'
      Size = 15
    end
    object FDQuery1STATE: TStringField
      FieldName = 'STATE'
      Origin = 'STATE'
    end
    object FDQuery1ZIP: TStringField
      FieldName = 'ZIP'
      Origin = 'ZIP'
      Size = 10
    end
    object FDQuery1COUNTRY: TStringField
      FieldName = 'COUNTRY'
      Origin = 'COUNTRY'
    end
    object FDQuery1PHONE: TStringField
      FieldName = 'PHONE'
      Origin = 'PHONE'
      Size = 15
    end
    object FDQuery1FAX: TStringField
      FieldName = 'FAX'
      Origin = 'FAX'
      Size = 15
    end
    object FDQuery1TAXRATE: TFloatField
      FieldName = 'TAXRATE'
      Origin = 'TAXRATE'
    end
    object FDQuery1CONTACT: TStringField
      FieldName = 'CONTACT'
      Origin = 'CONTACT'
    end
    object FDQuery1LASTINVOICEDATE: TSQLTimeStampField
      FieldName = 'LASTINVOICEDATE'
      Origin = 'LASTINVOICEDATE'
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = FDQuery1
    Left = 64
    Top = 224
  end
  object FDGUIxLoginDialog1: TFDGUIxLoginDialog
    Provider = 'Forms'
    Left = 168
    Top = 112
  end
  object FDTransDefault: TFDTransaction
    Connection = FDConnection1
    Left = 144
    Top = 168
  end
  object FDTransSnapshot: TFDTransaction
    Options.Isolation = xiSnapshot
    Options.DisconnectAction = xdNone
    Connection = FDConnection1
    Left = 232
    Top = 168
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 280
    Top = 112
  end
  object ActionList1: TActionList
    Left = 512
    Top = 112
    object acOpenDataSet: TAction
      Caption = 'Open'
      OnExecute = acOpenDataSetExecute
    end
    object acActiveSub: TAction
      OnExecute = acActiveSubExecute
    end
    object acInactiveSub: TAction
      OnExecute = acInactiveSubExecute
    end
    object acCommit: TAction
      Caption = 'Commit'
      OnExecute = acCommitExecute
    end
  end
end

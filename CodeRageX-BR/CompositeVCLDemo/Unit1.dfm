object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 666
  ClientWidth = 521
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RkDBAddress1: TRkDBAddress
    Left = 24
    Top = 8
    Width = 280
    Height = 131
    CharCase = ecNormal
    FieldColor = clWindow
    DataSource = DataSource1
    DataFields.FirstName = 'CONTACT_FIRST'
    DataFields.LastName = 'CONTACT_LAST'
    DataFields.Address1 = 'ADDRESS_LINE1'
    DataFields.Address2 = 'ADDRESS_LINE2'
    DataFields.City = 'CITY'
    DataFields.State = 'STATE_PROVINCE'
    DataFields.ZIP = 'POSTAL_CODE'
    FieldCaptions.FirstName = 'First Name'
    FieldCaptions.LastName = 'Last Name'
    FieldCaptions.Address = 'Endereco'
    FieldCaptions.City = 'City'
    FieldCaptions.State = 'State'
    FieldCaptions.ZIP = 'ZIP'
    StateList.Strings = (
      'AK'
      'AL'
      'AR'
      'AZ'
      'CA'
      'CO'
      'CT'
      'DC'
      'DE'
      'FL'
      'GA'
      'HI'
      'IA'
      'ID'
      'IL'
      'IN'
      'KS'
      'KY'
      'LA'
      'MA'
      'MD'
      'ME'
      'MI'
      'MN'
      'MO'
      'MS'
      'MT'
      'NC'
      'ND'
      'NE'
      'NH'
      'NJ'
      'NM'
      'NV'
      'NY'
      'OH'
      'OK'
      'OR'
      'PA'
      'RI'
      'SC'
      'SD'
      'TN'
      'TX'
      'UT'
      'VA'
      'VT'
      'WA'
      'WI'
      'WV'
      'WY')
  end
  object RkDBAddress_Sub1: TRkDBAddress_Sub
    Left = 24
    Top = 176
    Width = 280
    Height = 131
    CharCase = ecNormal
    FieldColor = clWindow
    DataSource = DataSource1
    FirstNameLabel.Left = 0
    FirstNameLabel.Top = 0
    FirstNameLabel.Width = 51
    FirstNameLabel.Height = 13
    FirstNameLabel.Caption = 'First Name'
    FirstNameEdit.Left = 0
    FirstNameEdit.Top = 13
    FirstNameEdit.Width = 120
    FirstNameEdit.Height = 21
    FirstNameEdit.DataField = 'CONTACT_FIRST'
    FirstNameEdit.DataSource = DataSource1
    FirstNameEdit.TabOrder = 0
    LastNameLabel.Left = 130
    LastNameLabel.Top = 0
    LastNameLabel.Width = 50
    LastNameLabel.Height = 13
    LastNameLabel.Caption = 'Last Name'
    LastNameEdit.Left = 130
    LastNameEdit.Top = 13
    LastNameEdit.Width = 150
    LastNameEdit.Height = 21
    LastNameEdit.DataSource = DataSource1
    LastNameEdit.TabOrder = 1
    AddressLabel.Left = 0
    AddressLabel.Top = 36
    AddressLabel.Width = 39
    AddressLabel.Height = 13
    AddressLabel.Caption = 'Address'
    Address1Edit.Left = 0
    Address1Edit.Top = 49
    Address1Edit.Width = 280
    Address1Edit.Height = 21
    Address1Edit.DataSource = DataSource1
    Address1Edit.TabOrder = 2
    Address2Edit.Left = 0
    Address2Edit.Top = 74
    Address2Edit.Width = 280
    Address2Edit.Height = 21
    Address2Edit.DataSource = DataSource1
    Address2Edit.TabOrder = 3
    CityLabel.Left = 0
    CityLabel.Top = 97
    CityLabel.Width = 19
    CityLabel.Height = 13
    CityLabel.Caption = 'City'
    CityEdit.Left = 0
    CityEdit.Top = 110
    CityEdit.Width = 121
    CityEdit.Height = 21
    CityEdit.DataField = 'CITY'
    CityEdit.DataSource = DataSource1
    CityEdit.TabOrder = 4
    StateLabel.Left = 130
    StateLabel.Top = 97
    StateLabel.Width = 26
    StateLabel.Height = 13
    StateLabel.Caption = 'State'
    StateCombo.Left = 130
    StateCombo.Top = 110
    StateCombo.Width = 70
    StateCombo.Height = 21
    StateCombo.DataSource = DataSource1
    StateCombo.Items.Strings = (
      'AK'
      'AL'
      'AR'
      'AZ'
      'CA'
      'CO'
      'CT'
      'DC'
      'DE'
      'FL'
      'GA'
      'HI'
      'IA'
      'ID'
      'IL'
      'IN'
      'KS'
      'KY'
      'LA'
      'MA'
      'MD'
      'ME'
      'MI'
      'MN'
      'MO'
      'MS'
      'MT'
      'NC'
      'ND'
      'NE'
      'NH'
      'NJ'
      'NM'
      'NV'
      'NY'
      'OH'
      'OK'
      'OR'
      'PA'
      'RI'
      'SC'
      'SD'
      'TN'
      'TX'
      'UT'
      'VA'
      'VT'
      'WA'
      'WI'
      'WV'
      'WY')
    StateCombo.Sorted = True
    StateCombo.TabOrder = 5
    ZIPLabel.Left = 210
    ZIPLabel.Top = 97
    ZIPLabel.Width = 16
    ZIPLabel.Height = 13
    ZIPLabel.Caption = 'ZIP'
    ZIPEdit.Left = 210
    ZIPEdit.Top = 110
    ZIPEdit.Width = 70
    ZIPEdit.Height = 21
    ZIPEdit.DataSource = DataSource1
    ZIPEdit.TabOrder = 6
    StateList.Strings = (
      'AK'
      'AL'
      'AR'
      'AZ'
      'CA'
      'CO'
      'CT'
      'DC'
      'DE'
      'FL'
      'GA'
      'HI'
      'IA'
      'ID'
      'IL'
      'IN'
      'KS'
      'KY'
      'LA'
      'MA'
      'MD'
      'ME'
      'MI'
      'MN'
      'MO'
      'MS'
      'MT'
      'NC'
      'ND'
      'NE'
      'NH'
      'NJ'
      'NM'
      'NV'
      'NY'
      'OH'
      'OK'
      'OR'
      'PA'
      'RI'
      'SC'
      'SD'
      'TN'
      'TX'
      'UT'
      'VA'
      'VT'
      'WA'
      'WI'
      'WV'
      'WY')
  end
  object RkDBAddress_Frame1: TRkDBAddress_Frame
    Left = 24
    Top = 336
    Width = 287
    Height = 136
    TabOrder = 2
    DataSource = DataSource1
    DataFields.FirstName = 'CONTACT_FIRST'
    DataFields.LastName = 'CONTACT_LAST'
    DataFields.Address1 = 'ADDRESS_LINE1'
    DataFields.Address2 = 'ADDRESS_LINE2'
    DataFields.City = 'CITY'
    DataFields.State = 'STATE_PROVINCE'
    DataFields.ZIP = 'POSTAL_CODE'
    FieldCaptions.FirstName = 'First Name'
    FieldCaptions.LastName = 'Last Name'
    FieldCaptions.Address = 'Address'
    FieldCaptions.City = 'Cidade'
    FieldCaptions.State = 'State'
    FieldCaptions.ZIP = 'ZIP'
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Public\Documents\Embarcadero\Studio\17.0\Sampl' +
        'es\Data\EMPLOYEE.GDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=iB')
    Connected = True
    LoginPrompt = False
    Left = 392
    Top = 16
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM CUSTOMER')
    Left = 392
    Top = 64
    object FDQuery1CUST_NO: TIntegerField
      FieldName = 'CUST_NO'
      Origin = 'CUST_NO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery1CUSTOMER: TStringField
      FieldName = 'CUSTOMER'
      Origin = 'CUSTOMER'
      Required = True
      Size = 25
    end
    object FDQuery1CONTACT_FIRST: TStringField
      FieldName = 'CONTACT_FIRST'
      Origin = 'CONTACT_FIRST'
      Size = 15
    end
    object FDQuery1CONTACT_LAST: TStringField
      FieldName = 'CONTACT_LAST'
      Origin = 'CONTACT_LAST'
    end
    object FDQuery1PHONE_NO: TStringField
      FieldName = 'PHONE_NO'
      Origin = 'PHONE_NO'
    end
    object FDQuery1ADDRESS_LINE1: TStringField
      FieldName = 'ADDRESS_LINE1'
      Origin = 'ADDRESS_LINE1'
      Size = 30
    end
    object FDQuery1ADDRESS_LINE2: TStringField
      FieldName = 'ADDRESS_LINE2'
      Origin = 'ADDRESS_LINE2'
      Size = 30
    end
    object FDQuery1CITY: TStringField
      FieldName = 'CITY'
      Origin = 'CITY'
      Size = 25
    end
    object FDQuery1STATE_PROVINCE: TStringField
      FieldName = 'STATE_PROVINCE'
      Origin = 'STATE_PROVINCE'
      Size = 15
    end
    object FDQuery1COUNTRY: TStringField
      FieldName = 'COUNTRY'
      Origin = 'COUNTRY'
      Size = 15
    end
    object FDQuery1POSTAL_CODE: TStringField
      FieldName = 'POSTAL_CODE'
      Origin = 'POSTAL_CODE'
      Size = 12
    end
    object FDQuery1ON_HOLD: TStringField
      FieldName = 'ON_HOLD'
      Origin = 'ON_HOLD'
      FixedChar = True
      Size = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 392
    Top = 120
  end
end

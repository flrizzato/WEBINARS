object RkDBAddress_Frame: TRkDBAddress_Frame
  Left = 0
  Top = 0
  Width = 287
  Height = 136
  TabOrder = 0
  object LblFirstName: TLabel
    Left = 0
    Top = 0
    Width = 51
    Height = 13
    Caption = 'First Name'
  end
  object LblLastName: TLabel
    Left = 144
    Top = 0
    Width = 50
    Height = 13
    Caption = 'Last Name'
  end
  object LblAddress: TLabel
    Left = 0
    Top = 38
    Width = 39
    Height = 13
    Caption = 'Address'
  end
  object LblCity: TLabel
    Left = 0
    Top = 100
    Width = 19
    Height = 13
    Caption = 'City'
  end
  object LblState: TLabel
    Left = 136
    Top = 100
    Width = 26
    Height = 13
    Caption = 'State'
  end
  object LblZIP: TLabel
    Left = 216
    Top = 100
    Width = 16
    Height = 13
    Caption = 'ZIP'
  end
  object EdtFirstName: TDBEdit
    Left = 0
    Top = 14
    Width = 133
    Height = 21
    TabOrder = 0
  end
  object EdtLastName: TDBEdit
    Left = 144
    Top = 14
    Width = 141
    Height = 21
    TabOrder = 1
  end
  object EdtAddress1: TDBEdit
    Left = 0
    Top = 52
    Width = 285
    Height = 21
    TabOrder = 2
  end
  object EdtAddress2: TDBEdit
    Left = 0
    Top = 76
    Width = 285
    Height = 21
    TabOrder = 3
  end
  object EdtCity: TDBEdit
    Left = 0
    Top = 114
    Width = 125
    Height = 21
    TabOrder = 4
  end
  object CbxState: TDBComboBox
    Left = 136
    Top = 114
    Width = 69
    Height = 21
    Items.Strings = (
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
    TabOrder = 5
  end
  object EdtZIP: TDBEdit
    Left = 216
    Top = 114
    Width = 69
    Height = 21
    TabOrder = 6
    OnExit = EdtZIPExit
  end
end

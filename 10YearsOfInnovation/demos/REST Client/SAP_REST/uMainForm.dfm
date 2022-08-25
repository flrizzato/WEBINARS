object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'SAP REST Demo'
  ClientHeight = 659
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object lblStatus: TLabel
    AlignWithMargins = True
    Left = 10
    Top = 200
    Width = 604
    Height = 15
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alTop
    AutoSize = False
    Caption = 'Status:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitLeft = 16
    ExplicitTop = 245
    ExplicitWidth = 255
  end
  object lblToken: TLabel
    AlignWithMargins = True
    Left = 10
    Top = 235
    Width = 604
    Height = 15
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alTop
    AutoSize = False
    Caption = 'Token: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitLeft = 16
    ExplicitTop = 275
    ExplicitWidth = 255
  end
  object memResult: TMemo
    AlignWithMargins = True
    Left = 10
    Top = 270
    Width = 604
    Height = 155
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 10
    Top = 10
    Width = 604
    Height = 75
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alTop
    Caption = 'REST Client'
    TabOrder = 1
    object Button1: TButton
      AlignWithMargins = True
      Left = 12
      Top = 27
      Width = 75
      Height = 36
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alLeft
      Caption = 'GET'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
      ExplicitLeft = 16
      ExplicitTop = 80
      ExplicitHeight = 25
    end
    object Button3: TButton
      AlignWithMargins = True
      Left = 107
      Top = 27
      Width = 75
      Height = 36
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alLeft
      Caption = 'POST'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Button3Click
      ExplicitLeft = 297
      ExplicitTop = 29
      ExplicitHeight = 46
    end
  end
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 10
    Top = 105
    Width = 604
    Height = 75
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alTop
    Caption = 'HTTP Native Client'
    TabOrder = 2
    object Button6: TButton
      AlignWithMargins = True
      Left = 12
      Top = 27
      Width = 75
      Height = 36
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alLeft
      Caption = 'GET'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button6Click
      ExplicitHeight = 46
    end
    object Button8: TButton
      AlignWithMargins = True
      Left = 107
      Top = 27
      Width = 75
      Height = 36
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alLeft
      Caption = 'POST'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Button8Click
      ExplicitLeft = 202
      ExplicitHeight = 46
    end
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 10
    Top = 445
    Width = 604
    Height = 204
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alClient
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
  end
  object RESTClient1: TRESTClient
    Authenticator = HTTPBasicAuthenticator1
    Accept = '*/*'
    AcceptEncoding = 'gzip, deflate, br'
    BaseURL = 
      'https://dtxhed.it-cpi013-rt.cfapps.us21.hana.ondemand.com/http/i' +
      'f7/listforestregister'
    ContentType = 'application/x-www-form-urlencoded'
    Params = <>
    UserAgent = 'PostmanRuntime/7.29.2'
    Left = 424
    Top = 16
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvAccept, rvAcceptCharset, rvAcceptEncoding, rvConnectTimeout, rvReadTimeout]
    Accept = '*/*'
    AcceptCharset = ''
    AcceptEncoding = 'gzip, deflate, br'
    Client = RESTClient1
    Params = <
      item
        Kind = pkHTTPHEADER
        Name = 'Content-Type'
        Options = [poDoNotEncode]
        Value = 'application/json'
      end
      item
        Kind = pkHTTPHEADER
        Name = 'x-csrf-token'
        Options = [poDoNotEncode]
        Value = 'fetch'
      end>
    Response = RESTResponse1
    OnAfterExecute = RESTRequest1AfterExecute
    Left = 344
    Top = 120
  end
  object RESTResponse1: TRESTResponse
    Left = 344
    Top = 168
  end
  object HTTPBasicAuthenticator1: THTTPBasicAuthenticator
    Username = 'sb-cd63ade0-4c25-4f79-8529-61d9010b5174!b130|it-rt-dtxhed!b46'
    Password = 
      '3f56e5f8-debb-49c3-8f32-1ebf8585177d$fTCCqO0baM4bFS_dmLRC9HXJwgJ' +
      'mtEs6BPDD1G4b9u0='
    Left = 424
    Top = 64
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 420
    Top = 141
    object LinkPropertyToFieldCaption: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = RESTResponse1
      FieldName = 'StatusCode'
      Component = lblStatus
      CustomFormat = #39'Status: '#39' + %s'
      ComponentProperty = 'Caption'
    end
    object LinkControlToField1: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = RESTResponse2
      FieldName = 'JSONText'
      Control = memResult
      Track = False
    end
  end
  object RESTRequest2: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Method = rmPOST
    Params = <
      item
        Kind = pkHTTPHEADER
        Name = 'Content-Type'
        Options = [poDoNotEncode]
        Value = 'application/json'
      end
      item
        Kind = pkHTTPHEADER
        Name = 'X-CSRF-Token'
        Options = [poDoNotEncode]
        Value = '2Qr6HAt4HiFq3mTklG8qn1wYCUSstyP8'
      end
      item
        Kind = pkHTTPHEADER
        Name = 'Accept'
        Options = [poDoNotEncode]
        Value = '*/*'
      end
      item
        Kind = pkHTTPHEADER
        Name = 'Accept-Encoding'
        Options = [poDoNotEncode]
        Value = 'gzip, deflate, br'
      end
      item
        Kind = pkHTTPHEADER
        Name = 'Cache-Control'
        Options = [poDoNotEncode]
        Value = 'no-cache'
      end
      item
        Kind = pkREQUESTBODY
        Name = 'data_atualizacao'
        Options = [poDoNotEncode]
        Value = '{"data_atualizacao":"06/06/2022"}'
      end
      item
        Kind = pkCOOKIE
        Name = 'JSESSIONID'
        Options = [poDoNotEncode]
        Value = '0FF97927E7D8AF4997843217E88B44EC'
      end
      item
        Kind = pkCOOKIE
        Name = '__VCAP_ID__'
        Options = [poDoNotEncode]
        Value = '661ad6c9-1fed-4809-6356-42d2'
      end>
    Response = RESTResponse2
    ConnectTimeout = 0
    ReadTimeout = 0
    Left = 496
    Top = 120
  end
  object RESTResponse2: TRESTResponse
    Left = 496
    Top = 168
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = FDMemTable1
    FieldDefs = <>
    Response = RESTResponse2
    RootElement = 'Result'
    Left = 496
    Top = 216
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 496
    Top = 264
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = FDMemTable1
    Left = 496
    Top = 312
  end
end

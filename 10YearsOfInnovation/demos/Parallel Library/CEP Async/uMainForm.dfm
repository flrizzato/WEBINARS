object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Pesquisa por CEP'
  ClientHeight = 562
  ClientWidth = 530
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 25
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 530
    Height = 89
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 33
      Height = 25
      Caption = 'CEP'
    end
    object MaskEdit1: TMaskEdit
      Left = 8
      Top = 47
      Width = 142
      Height = 33
      EditMask = '99.999-999;0;_'
      MaxLength = 10
      TabOrder = 0
      Text = '01001000'
    end
    object Button1: TButton
      Left = 159
      Top = 47
      Width = 114
      Height = 33
      Caption = 'Pesquisar'
      Default = True
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 89
    Width = 530
    Height = 35
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = ' Resultado da pesquisa'
    Color = clBtnShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
  end
  object Panel3: TPanel
    Left = 0
    Top = 124
    Width = 530
    Height = 404
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel3'
    ShowCaption = False
    TabOrder = 2
    object Label2: TLabel
      Left = 16
      Top = 8
      Width = 30
      Height = 25
      Caption = 'cep'
      FocusControl = DBEdit1
    end
    object Label3: TLabel
      Left = 16
      Top = 72
      Width = 95
      Height = 25
      Caption = 'logradouro'
      FocusControl = DBEdit2
    end
    object Label4: TLabel
      Left = 16
      Top = 136
      Width = 116
      Height = 25
      Caption = 'complemento'
      FocusControl = DBEdit3
    end
    object Label5: TLabel
      Left = 16
      Top = 200
      Width = 51
      Height = 25
      Caption = 'bairro'
      FocusControl = DBEdit4
    end
    object Label6: TLabel
      Left = 16
      Top = 264
      Width = 87
      Height = 25
      Caption = 'localidade'
      FocusControl = DBEdit5
    end
    object Label7: TLabel
      Left = 16
      Top = 328
      Width = 17
      Height = 25
      Caption = 'uf'
      FocusControl = DBEdit6
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 32
      Width = 229
      Height = 33
      DataField = 'cep'
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 16
      Top = 96
      Width = 500
      Height = 33
      DataField = 'logradouro'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 16
      Top = 160
      Width = 500
      Height = 33
      DataField = 'complemento'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 16
      Top = 224
      Width = 500
      Height = 33
      DataField = 'bairro'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 16
      Top = 288
      Width = 500
      Height = 33
      DataField = 'localidade'
      DataSource = DataSource1
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 16
      Top = 352
      Width = 54
      Height = 33
      DataField = 'uf'
      DataSource = DataSource1
      TabOrder = 5
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 528
    Width = 530
    Height = 34
    Panels = <
      item
        Width = 50
      end>
    ParentFont = True
    UseSystemFont = False
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://viacep.com.br/ws'
    Params = <>
    Left = 336
    Top = 192
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <
      item
        Kind = pkURLSEGMENT
        Name = 'cep'
        Options = [poAutoCreated]
        Value = '01001000'
      end>
    Resource = '{cep}/json/'
    Response = RESTResponse1
    Left = 336
    Top = 248
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 336
    Top = 304
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = FDMemTable1
    FieldDefs = <>
    Response = RESTResponse1
    TypesMode = Rich
    Left = 256
    Top = 352
  end
  object FDMemTable1: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 256
    Top = 408
    object FDMemTable1cep: TWideStringField
      FieldName = 'cep'
      Size = 9
    end
    object FDMemTable1logradouro: TWideStringField
      FieldName = 'logradouro'
      Size = 100
    end
    object FDMemTable1complemento: TWideStringField
      FieldName = 'complemento'
      Size = 100
    end
    object FDMemTable1bairro: TWideStringField
      FieldName = 'bairro'
      Size = 100
    end
    object FDMemTable1localidade: TWideStringField
      FieldName = 'localidade'
      Size = 100
    end
    object FDMemTable1uf: TWideStringField
      FieldName = 'uf'
      Size = 2
    end
    object FDMemTable1ibge: TIntegerField
      FieldName = 'ibge'
    end
    object FDMemTable1gia: TIntegerField
      FieldName = 'gia'
    end
    object FDMemTable1ddd: TIntegerField
      FieldName = 'ddd'
    end
    object FDMemTable1siafi: TIntegerField
      FieldName = 'siafi'
    end
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 256
    Top = 296
  end
end

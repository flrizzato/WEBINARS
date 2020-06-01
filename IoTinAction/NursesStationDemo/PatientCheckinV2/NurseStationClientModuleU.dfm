object NurseStationClientModule: TNurseStationClientModule
  OldCreateOrder = False
  Height = 474
  Width = 444
  object EMSProvider1: TEMSProvider
    AndroidPush.GCMAppID = '736212208236'
    ApiVersion = '1'
    URLHost = '10.2.10.211'
    URLPort = 8080
    Left = 72
    Top = 48
  end
  object PushEvents1: TPushEvents
    Auth = BackendAuth1
    Provider = EMSProvider1
    AutoActivate = False
    AutoRegisterDevice = False
    OnDeviceTokenReceived = PushEvents1DeviceTokenReceived
    OnPushReceived = PushEvents1PushReceived
    Left = 72
    Top = 128
  end
  object BackendAuth1: TBackendAuth
    Provider = EMSProvider1
    LoginPrompt = False
    UserDetails = <>
    DefaultAuthentication = Application
    Left = 72
    Top = 208
  end
  object BackendUsers1: TBackendUsers
    Provider = EMSProvider1
    Auth = BackendAuth1
    Left = 248
    Top = 48
  end
  object BackendEndpointSendMessageNurse: TBackendEndpoint
    Provider = EMSProvider1
    Auth = BackendAuth1
    Method = rmPOST
    Params = <
      item
        Kind = pkURLSEGMENT
        name = 'item'
        Options = [poAutoCreated]
      end>
    Resource = 'NurseStation'
    ResourceSuffix = 'SendMessageNurse/{item}'
    Left = 248
    Top = 128
  end
  object BackendEndpointSendMessagePatient: TBackendEndpoint
    Provider = EMSProvider1
    Auth = BackendAuth1
    Method = rmPOST
    Params = <
      item
        Kind = pkURLSEGMENT
        name = 'item'
        Options = [poAutoCreated]
      end>
    Resource = 'NurseStation'
    ResourceSuffix = '{item}/SendMessagePatient'
    Left = 256
    Top = 216
  end
  object BackendEndpointGetPatient: TBackendEndpoint
    Provider = EMSProvider1
    Auth = BackendAuth1
    Params = <
      item
        Kind = pkURLSEGMENT
        name = 'item'
        Options = [poAutoCreated]
      end>
    Resource = 'NurseStation'
    ResourceSuffix = 'GetPatient/{item}'
    Left = 248
    Top = 288
  end
  object BackendEndpointAddPatient: TBackendEndpoint
    Provider = EMSProvider1
    Auth = BackendAuth1
    Method = rmPOST
    Params = <>
    Resource = 'NurseStation'
    ResourceSuffix = 'AddPatient'
    Left = 248
    Top = 368
  end
end

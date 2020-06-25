object NurseStationStorage: TNurseStationStorage
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 326
  Width = 386
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\DB_INTERBASE_XE7\NURSESDB.IB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=localhost'
      'DriverID=IB')
    LoginPrompt = False
    Left = 64
    Top = 32
  end
  object qrySelectId: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM PATIENT WHERE ID = :ID')
    Left = 64
    Top = 142
    ParamData = <
      item
        Name = 'ID'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end>
  end
  object qryUpdate: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'update patient set heart_rate = :heart, weight = :weight'
      'where id = :id')
    Left = 64
    Top = 200
    ParamData = <
      item
        Name = 'HEART'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'WEIGHT'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryInsert: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'insert into patient (id, heart_rate, weight)'
      'values (:id, :heart, :weight)')
    Left = 64
    Top = 88
    ParamData = <
      item
        Name = 'ID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'HEART'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'WEIGHT'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
end

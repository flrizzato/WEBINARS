object DockerResource1: TDockerResource1
  OldCreateOrder = False
  Height = 541
  Width = 667
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=MariaDB_macOS')
    LoginPrompt = False
    Left = 30
    Top = 16
  end
  object qrysakilaactor: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from sakila.actor')
    Left = 130
    Top = 16
  end
  object dsrsakilaactor: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qrysakilaactor
    Left = 130
    Top = 64
  end
  object qrysakilaactor_info: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from sakila.actor_info')
    Left = 230
    Top = 16
  end
  object dsrsakilaactor_info: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qrysakilaactor_info
    Left = 230
    Top = 64
  end
  object qrysakilaaddress: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from sakila.address')
    Left = 330
    Top = 16
  end
  object dsrsakilaaddress: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qrysakilaaddress
    Left = 330
    Top = 64
  end
  object qrysakilacategory: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from sakila.category')
    Left = 430
    Top = 16
  end
  object dsrsakilacategory: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qrysakilacategory
    Left = 430
    Top = 64
  end
  object qrysakilacity: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from sakila.city')
    Left = 530
    Top = 16
  end
  object dsrsakilacity: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qrysakilacity
    Left = 530
    Top = 64
  end
  object qrysakilacountry: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from sakila.country')
    Left = 130
    Top = 112
  end
  object dsrsakilacountry: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qrysakilacountry
    Left = 130
    Top = 160
  end
  object qrysakilacustomer: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from sakila.customer')
    Left = 230
    Top = 112
  end
  object dsrsakilacustomer: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qrysakilacustomer
    Left = 230
    Top = 160
  end
  object qrysakilacustomer_list: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from sakila.customer_list')
    Left = 330
    Top = 112
  end
  object dsrsakilacustomer_list: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qrysakilacustomer_list
    Left = 330
    Top = 160
  end
  object qrysakilafilm: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from sakila.film')
    Left = 430
    Top = 112
  end
  object dsrsakilafilm: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qrysakilafilm
    Left = 430
    Top = 160
  end
  object qrysakilafilm_actor: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from sakila.film_actor')
    Left = 530
    Top = 112
  end
  object dsrsakilafilm_actor: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qrysakilafilm_actor
    Left = 530
    Top = 160
  end
  object qrysakilafilm_category: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from sakila.film_category')
    Left = 130
    Top = 208
  end
  object dsrsakilafilm_category: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qrysakilafilm_category
    Left = 130
    Top = 256
  end
  object qrysakilafilm_list: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from sakila.film_list')
    Left = 230
    Top = 208
  end
  object dsrsakilafilm_list: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qrysakilafilm_list
    Left = 230
    Top = 256
  end
  object qrysakilafilm_text: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from sakila.film_text')
    Left = 330
    Top = 208
  end
  object dsrsakilafilm_text: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qrysakilafilm_text
    Left = 330
    Top = 256
  end
  object qrysakilainventory: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from sakila.inventory')
    Left = 430
    Top = 208
  end
  object dsrsakilainventory: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qrysakilainventory
    Left = 430
    Top = 256
  end
  object qrysakilalanguage: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from sakila.language')
    Left = 530
    Top = 208
  end
  object dsrsakilalanguage: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qrysakilalanguage
    Left = 530
    Top = 256
  end
  object qrysakilanicer_but_slower_film_list: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from sakila.nicer_but_slower_film_list')
    Left = 130
    Top = 304
  end
  object dsrsakilanicer_but_slower_film_list: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qrysakilanicer_but_slower_film_list
    Left = 130
    Top = 352
  end
  object qrysakilapayment: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from sakila.payment')
    Left = 230
    Top = 304
  end
  object dsrsakilapayment: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qrysakilapayment
    Left = 230
    Top = 352
  end
  object qrysakilarental: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from sakila.rental')
    Left = 330
    Top = 304
  end
  object dsrsakilarental: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qrysakilarental
    Left = 330
    Top = 352
  end
  object qrysakilasales_by_film_category: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from sakila.sales_by_film_category')
    Left = 430
    Top = 304
  end
  object dsrsakilasales_by_film_category: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qrysakilasales_by_film_category
    Left = 430
    Top = 352
  end
  object qrysakilasales_by_store: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from sakila.sales_by_store')
    Left = 530
    Top = 304
  end
  object dsrsakilasales_by_store: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qrysakilasales_by_store
    Left = 530
    Top = 352
  end
  object qrysakilastaff: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from sakila.staff')
    Left = 130
    Top = 400
  end
  object dsrsakilastaff: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qrysakilastaff
    Left = 130
    Top = 448
  end
  object qrysakilastaff_list: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from sakila.staff_list')
    Left = 230
    Top = 400
  end
  object dsrsakilastaff_list: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qrysakilastaff_list
    Left = 230
    Top = 448
  end
  object qrysakilastore: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from sakila.store')
    Left = 330
    Top = 400
  end
  object dsrsakilastore: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qrysakilastore
    Left = 330
    Top = 448
  end
end

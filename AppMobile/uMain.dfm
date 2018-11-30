object srvMobile: TsrvMobile
  OldCreateOrder = False
  OnCreate = ServiceCreate
  DisplayName = 'Sistema Impacto Mobile Service'
  AfterInstall = ServiceAfterInstall
  AfterUninstall = ServiceAfterUninstall
  OnContinue = ServiceContinue
  OnExecute = ServiceExecute
  OnPause = ServicePause
  OnStart = ServiceStart
  Height = 643
  Width = 1043
  object tmrMain: TTimer
    Interval = 6000
    OnTimer = tmrMainTimer
    Left = 32
    Top = 8
  end
  object DSServer: TSQLConnection
    ConnectionName = 'DataSnapCONNECTION'
    DriverName = 'Datasnap'
    KeepConnection = False
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=DBXDataSnap'
      'HostName=localhost'
      'Port=215'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=15.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'Filters={}')
    Left = 16
    Top = 64
    UniqueId = '{32735705-30E8-4DD9-8414-B45FA717CC3C}'
  end
  object dspcLan: TDSProviderConnection
    ServerClassName = 'TDSSMLan'
    SQLConnection = DSServer
    Left = 112
    Top = 72
  end
  object scnMysql: TSQLConnection
    ConnectionName = 'MYSQLCONNECTION'
    DriverName = 'MySQL'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXMySQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver160.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=16.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQLDr' +
        'iver160.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMySQLDriver,Version=16.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverMYSQL'
      'LibraryName=dbxmys.dll'
      'LibraryNameOsx=libsqlmys.dylib'
      'VendorLib=LIBMYSQL.dll'
      'VendorLibWin64=libmysql.dll'
      'VendorLibOsx=libmysqlclient.dylib'
      'MaxBlobSize=-1'
      'DriverName=MySQL'
      'HostName=rds-wildcard02.iset.io'
      'Database=iset_ishopping39959'
      'User_Name=iset_39959'
      'Password=B4Yacrub'
      'ServerCharSet='
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'ConnectTimeout=60'
      'Port=9195')
    Left = 800
    Top = 16
  end
  object sqlPedidos_MySql_Dados: TSQLDataSet
    BeforeOpen = sqlPedidos_MySql_DadosBeforeOpen
    AfterOpen = sqlPedidos_MySql_DadosAfterOpen
    CommandText = 'select * from pedidos where importado != 1 and orders_status = 3'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = scnMysql
    Left = 808
    Top = 184
    object sqlPedidos_MySql_Dadosorders_id: TIntegerField
      FieldName = 'orders_id'
      Required = True
    end
    object sqlPedidos_MySql_Dadosorders_comment: TMemoField
      FieldName = 'orders_comment'
      BlobType = ftMemo
      Size = 1
    end
    object sqlPedidos_MySql_Dadoscustomers_id: TIntegerField
      FieldName = 'customers_id'
      Required = True
    end
    object sqlPedidos_MySql_Dadoscustomers_name: TStringField
      FieldName = 'customers_name'
      Required = True
      Size = 200
    end
    object sqlPedidos_MySql_Dadoscustomers_lastname: TStringField
      FieldName = 'customers_lastname'
      Size = 50
    end
    object sqlPedidos_MySql_Dadoscustomers_firstname: TStringField
      FieldName = 'customers_firstname'
      Size = 50
    end
    object sqlPedidos_MySql_Dadoscustomers_company: TStringField
      FieldName = 'customers_company'
      Size = 200
    end
    object sqlPedidos_MySql_Dadoscustomers_street_address: TStringField
      FieldName = 'customers_street_address'
      Required = True
      Size = 255
    end
    object sqlPedidos_MySql_Dadoscustomers_street_number: TIntegerField
      FieldName = 'customers_street_number'
    end
    object sqlPedidos_MySql_Dadoscustomers_street_complemento: TStringField
      FieldName = 'customers_street_complemento'
      Size = 50
    end
    object sqlPedidos_MySql_Dadoscustomers_suburb: TStringField
      FieldName = 'customers_suburb'
      Size = 100
    end
    object sqlPedidos_MySql_Dadoscustomers_city: TStringField
      FieldName = 'customers_city'
      Required = True
      Size = 100
    end
    object sqlPedidos_MySql_Dadoscustomers_postcode: TStringField
      FieldName = 'customers_postcode'
      Required = True
      Size = 10
    end
    object sqlPedidos_MySql_Dadoscustomers_state: TStringField
      FieldName = 'customers_state'
    end
    object sqlPedidos_MySql_Dadoscustomers_country: TStringField
      FieldName = 'customers_country'
      Required = True
      Size = 100
    end
    object sqlPedidos_MySql_Dadoscustomers_ddd: TIntegerField
      FieldName = 'customers_ddd'
    end
    object sqlPedidos_MySql_Dadoscustomers_telephone: TStringField
      FieldName = 'customers_telephone'
      Size = 10
    end
    object sqlPedidos_MySql_Dadoscustomers_email_address: TStringField
      FieldName = 'customers_email_address'
      Required = True
      Size = 150
    end
    object sqlPedidos_MySql_Dadoscustomers_address_format_id: TIntegerField
      FieldName = 'customers_address_format_id'
      Required = True
    end
    object sqlPedidos_MySql_Dadosdelivery_firstname: TStringField
      FieldName = 'delivery_firstname'
      Size = 100
    end
    object sqlPedidos_MySql_Dadosdelivery_lastname: TStringField
      FieldName = 'delivery_lastname'
      Size = 100
    end
    object sqlPedidos_MySql_Dadosdelivery_company: TStringField
      FieldName = 'delivery_company'
      Size = 200
    end
    object sqlPedidos_MySql_Dadosdelivery_street_address: TStringField
      FieldName = 'delivery_street_address'
      Required = True
      Size = 255
    end
    object sqlPedidos_MySql_Dadosdelivery_street_number: TIntegerField
      FieldName = 'delivery_street_number'
    end
    object sqlPedidos_MySql_Dadosdelivery_street_complemento: TStringField
      FieldName = 'delivery_street_complemento'
      Size = 50
    end
    object sqlPedidos_MySql_Dadosdelivery_suburb: TStringField
      FieldName = 'delivery_suburb'
      Size = 100
    end
    object sqlPedidos_MySql_Dadosdelivery_city: TStringField
      FieldName = 'delivery_city'
      Required = True
      Size = 100
    end
    object sqlPedidos_MySql_Dadosdelivery_postcode: TStringField
      FieldName = 'delivery_postcode'
      Required = True
      Size = 10
    end
    object sqlPedidos_MySql_Dadosdelivery_state: TStringField
      FieldName = 'delivery_state'
    end
    object sqlPedidos_MySql_Dadosdelivery_country: TStringField
      FieldName = 'delivery_country'
      Required = True
      Size = 100
    end
    object sqlPedidos_MySql_Dadosdelivery_address_format_id: TIntegerField
      FieldName = 'delivery_address_format_id'
      Required = True
    end
    object sqlPedidos_MySql_Dadosbilling_name: TStringField
      FieldName = 'billing_name'
      Required = True
      Size = 64
    end
    object sqlPedidos_MySql_Dadosbilling_company: TStringField
      FieldName = 'billing_company'
      Size = 32
    end
    object sqlPedidos_MySql_Dadosbilling_street_address: TStringField
      FieldName = 'billing_street_address'
      Required = True
      Size = 64
    end
    object sqlPedidos_MySql_Dadosbilling_street_number: TIntegerField
      FieldName = 'billing_street_number'
    end
    object sqlPedidos_MySql_Dadosbilling_street_complemento: TStringField
      FieldName = 'billing_street_complemento'
      Size = 50
    end
    object sqlPedidos_MySql_Dadosbilling_suburb: TStringField
      FieldName = 'billing_suburb'
      Size = 32
    end
    object sqlPedidos_MySql_Dadosbilling_city: TStringField
      FieldName = 'billing_city'
      Required = True
      Size = 32
    end
    object sqlPedidos_MySql_Dadosbilling_postcode: TStringField
      FieldName = 'billing_postcode'
      Required = True
      Size = 10
    end
    object sqlPedidos_MySql_Dadosbilling_state: TStringField
      FieldName = 'billing_state'
      Size = 32
    end
    object sqlPedidos_MySql_Dadosbilling_country: TStringField
      FieldName = 'billing_country'
      Required = True
      Size = 32
    end
    object sqlPedidos_MySql_Dadosbilling_address_format_id: TIntegerField
      FieldName = 'billing_address_format_id'
      Required = True
    end
    object sqlPedidos_MySql_Dadospayment_method: TStringField
      FieldName = 'payment_method'
      Required = True
      Size = 200
    end
    object sqlPedidos_MySql_Dadospayment_title: TStringField
      FieldName = 'payment_title'
      Size = 255
    end
    object sqlPedidos_MySql_Dadospayment_n_parcelas: TShortintField
      FieldName = 'payment_n_parcelas'
    end
    object sqlPedidos_MySql_Dadospayment_card_info: TMemoField
      FieldName = 'payment_card_info'
      BlobType = ftMemo
      Size = 1
    end
    object sqlPedidos_MySql_Dadospayment_url: TStringField
      FieldName = 'payment_url'
      Size = 255
    end
    object sqlPedidos_MySql_Dadosshipping_method: TStringField
      FieldName = 'shipping_method'
      Required = True
      Size = 200
    end
    object sqlPedidos_MySql_Dadosshipping_date: TDateField
      FieldName = 'shipping_date'
    end
    object sqlPedidos_MySql_Dadosshipping_time: TStringField
      FieldName = 'shipping_time'
    end
    object sqlPedidos_MySql_Dadosshipping_tracking_code: TStringField
      FieldName = 'shipping_tracking_code'
    end
    object sqlPedidos_MySql_Dadoslast_modified: TSQLTimeStampField
      FieldName = 'last_modified'
    end
    object sqlPedidos_MySql_Dadosdate_purchased: TSQLTimeStampField
      FieldName = 'date_purchased'
    end
    object sqlPedidos_MySql_Dadosorders_status: TIntegerField
      FieldName = 'orders_status'
      Required = True
    end
    object sqlPedidos_MySql_Dadosorders_date_finished: TSQLTimeStampField
      FieldName = 'orders_date_finished'
    end
    object sqlPedidos_MySql_Dadoscurrency: TStringField
      FieldName = 'currency'
      FixedChar = True
      Size = 3
    end
    object sqlPedidos_MySql_Dadoscurrency_value: TFMTBCDField
      FieldName = 'currency_value'
      Precision = 16
      Size = 6
    end
    object sqlPedidos_MySql_Dadosendereco_ip: TStringField
      FieldName = 'endereco_ip'
    end
    object sqlPedidos_MySql_Dadosparceiro_id: TIntegerField
      FieldName = 'parceiro_id'
    end
    object sqlPedidos_MySql_Dadosid_lista: TIntegerField
      FieldName = 'id_lista'
    end
    object sqlPedidos_MySql_Dadosid_lista_customer_list: TIntegerField
      FieldName = 'id_lista_customer_list'
    end
    object sqlPedidos_MySql_Dadosorder_total: TSingleField
      FieldName = 'order_total'
    end
    object sqlPedidos_MySql_Dadosimportado: TIntegerField
      FieldName = 'importado'
    end
    object sqlPedidos_MySql_Dadosabandoned_notify: TIntegerField
      FieldName = 'abandoned_notify'
    end
    object sqlPedidos_MySql_Dadosml_order_id: TIntegerField
      FieldName = 'ml_order_id'
    end
  end
  object sqlPedidos_MySql_Itens: TSQLDataSet
    CommandText = 'select * from pedidos_produtos'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = scnMysql
    Left = 960
    Top = 184
    object sqlPedidos_MySql_Itensorders_products_id: TIntegerField
      FieldName = 'orders_products_id'
      Required = True
    end
    object sqlPedidos_MySql_Itensorders_id: TIntegerField
      FieldName = 'orders_id'
      Required = True
    end
    object sqlPedidos_MySql_Itensproducts_id: TIntegerField
      FieldName = 'products_id'
      Required = True
    end
    object sqlPedidos_MySql_Itensproducts_model: TStringField
      FieldName = 'products_model'
      Size = 255
    end
    object sqlPedidos_MySql_Itensproducts_name: TStringField
      FieldName = 'products_name'
      Size = 255
    end
    object sqlPedidos_MySql_Itensproducts_price: TFMTBCDField
      FieldName = 'products_price'
      Required = True
      Precision = 17
      Size = 4
    end
    object sqlPedidos_MySql_Itensfinal_price: TFMTBCDField
      FieldName = 'final_price'
      Required = True
      Precision = 17
      Size = 4
    end
    object sqlPedidos_MySql_Itensproducts_tax: TFMTBCDField
      FieldName = 'products_tax'
      Required = True
      Precision = 9
      Size = 4
    end
    object sqlPedidos_MySql_Itensproducts_quantity: TIntegerField
      FieldName = 'products_quantity'
      Required = True
    end
    object sqlPedidos_MySql_Itensproducts_weight: TSingleField
      FieldName = 'products_weight'
    end
    object sqlPedidos_MySql_Itensproducts_peso_cubico: TSingleField
      FieldName = 'products_peso_cubico'
    end
    object sqlPedidos_MySql_Itensproducts_cod_ref: TStringField
      FieldName = 'products_cod_ref'
      Size = 150
    end
    object sqlPedidos_MySql_Itensanexo: TStringField
      FieldName = 'anexo'
      Size = 100
    end
    object sqlPedidos_MySql_Itensdownload_count: TShortintField
      FieldName = 'download_count'
    end
    object sqlPedidos_MySql_Itensparceiro_id: TIntegerField
      FieldName = 'parceiro_id'
    end
    object sqlPedidos_MySql_Itensconfiguracao: TStringField
      FieldName = 'configuracao'
      Size = 255
    end
    object sqlPedidos_MySql_Itensgift: TShortintField
      FieldName = 'gift'
    end
    object sqlPedidos_MySql_Itensgift_card: TMemoField
      FieldName = 'gift_card'
      BlobType = ftMemo
      Size = 1
    end
    object sqlPedidos_MySql_Itensgift_price: TShortintField
      FieldName = 'gift_price'
    end
    object sqlPedidos_MySql_Itensfree: TShortintField
      FieldName = 'free'
    end
  end
  object dspPedidos_MySql_Dados: TDataSetProvider
    DataSet = sqlPedidos_MySql_Dados
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 808
    Top = 240
  end
  object dspPedidos_MySql_Itens: TDataSetProvider
    DataSet = sqlPedidos_MySql_Itens
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 960
    Top = 240
  end
  object dtsPedidos_MySql_Dados: TDataSource
    DataSet = cdsPedidos_MySql_Dados
    Left = 808
    Top = 352
  end
  object cdsPedidos_MySql_Itens: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'orders_id'
    MasterFields = 'orders_id'
    MasterSource = dtsPedidos_MySql_Dados
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspPedidos_MySql_Itens'
    Left = 960
    Top = 296
    object cdsPedidos_MySql_Itensorders_products_id: TIntegerField
      FieldName = 'orders_products_id'
      Required = True
    end
    object cdsPedidos_MySql_Itensorders_id: TIntegerField
      FieldName = 'orders_id'
      Required = True
    end
    object cdsPedidos_MySql_Itensproducts_id: TIntegerField
      FieldName = 'products_id'
      Required = True
    end
    object cdsPedidos_MySql_Itensproducts_model: TStringField
      FieldName = 'products_model'
      Size = 255
    end
    object cdsPedidos_MySql_Itensproducts_name: TStringField
      FieldName = 'products_name'
      Size = 255
    end
    object cdsPedidos_MySql_Itensproducts_price: TFMTBCDField
      FieldName = 'products_price'
      Required = True
      Precision = 17
      Size = 4
    end
    object cdsPedidos_MySql_Itensfinal_price: TFMTBCDField
      FieldName = 'final_price'
      Required = True
      Precision = 17
      Size = 4
    end
    object cdsPedidos_MySql_Itensproducts_tax: TFMTBCDField
      FieldName = 'products_tax'
      Required = True
      Precision = 9
      Size = 4
    end
    object cdsPedidos_MySql_Itensproducts_quantity: TIntegerField
      FieldName = 'products_quantity'
      Required = True
    end
    object cdsPedidos_MySql_Itensproducts_weight: TSingleField
      FieldName = 'products_weight'
    end
    object cdsPedidos_MySql_Itensproducts_peso_cubico: TSingleField
      FieldName = 'products_peso_cubico'
    end
    object cdsPedidos_MySql_Itensproducts_cod_ref: TStringField
      FieldName = 'products_cod_ref'
      Size = 150
    end
    object cdsPedidos_MySql_Itensanexo: TStringField
      FieldName = 'anexo'
      Size = 100
    end
    object cdsPedidos_MySql_Itensdownload_count: TShortintField
      FieldName = 'download_count'
    end
    object cdsPedidos_MySql_Itensparceiro_id: TIntegerField
      FieldName = 'parceiro_id'
    end
    object cdsPedidos_MySql_Itensconfiguracao: TStringField
      FieldName = 'configuracao'
      Size = 255
    end
    object cdsPedidos_MySql_Itensgift: TShortintField
      FieldName = 'gift'
    end
    object cdsPedidos_MySql_Itensgift_card: TMemoField
      FieldName = 'gift_card'
      BlobType = ftMemo
      Size = 1
    end
    object cdsPedidos_MySql_Itensgift_price: TShortintField
      FieldName = 'gift_price'
    end
    object cdsPedidos_MySql_Itensfree: TShortintField
      FieldName = 'free'
    end
  end
  object cdsPedidos_MySql_Dados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPedidos_MySql_Dados'
    Left = 808
    Top = 296
    object cdsPedidos_MySql_Dadosorders_id: TIntegerField
      FieldName = 'orders_id'
      Required = True
    end
    object cdsPedidos_MySql_Dadosorders_comment: TMemoField
      FieldName = 'orders_comment'
      BlobType = ftMemo
      Size = 1
    end
    object cdsPedidos_MySql_Dadoscustomers_id: TIntegerField
      FieldName = 'customers_id'
      Required = True
    end
    object cdsPedidos_MySql_Dadoscustomers_name: TStringField
      FieldName = 'customers_name'
      Required = True
      Size = 200
    end
    object cdsPedidos_MySql_Dadoscustomers_lastname: TStringField
      FieldName = 'customers_lastname'
      Size = 50
    end
    object cdsPedidos_MySql_Dadoscustomers_firstname: TStringField
      FieldName = 'customers_firstname'
      Size = 50
    end
    object cdsPedidos_MySql_Dadoscustomers_company: TStringField
      FieldName = 'customers_company'
      Size = 200
    end
    object cdsPedidos_MySql_Dadoscustomers_street_address: TStringField
      FieldName = 'customers_street_address'
      Required = True
      Size = 255
    end
    object cdsPedidos_MySql_Dadoscustomers_street_number: TIntegerField
      FieldName = 'customers_street_number'
    end
    object cdsPedidos_MySql_Dadoscustomers_street_complemento: TStringField
      FieldName = 'customers_street_complemento'
      Size = 50
    end
    object cdsPedidos_MySql_Dadoscustomers_suburb: TStringField
      FieldName = 'customers_suburb'
      Size = 100
    end
    object cdsPedidos_MySql_Dadoscustomers_city: TStringField
      FieldName = 'customers_city'
      Required = True
      Size = 100
    end
    object cdsPedidos_MySql_Dadoscustomers_postcode: TStringField
      FieldName = 'customers_postcode'
      Required = True
      Size = 10
    end
    object cdsPedidos_MySql_Dadoscustomers_state: TStringField
      FieldName = 'customers_state'
    end
    object cdsPedidos_MySql_Dadoscustomers_country: TStringField
      FieldName = 'customers_country'
      Required = True
      Size = 100
    end
    object cdsPedidos_MySql_Dadoscustomers_ddd: TIntegerField
      FieldName = 'customers_ddd'
    end
    object cdsPedidos_MySql_Dadoscustomers_telephone: TStringField
      FieldName = 'customers_telephone'
      Size = 10
    end
    object cdsPedidos_MySql_Dadoscustomers_email_address: TStringField
      FieldName = 'customers_email_address'
      Required = True
      Size = 150
    end
    object cdsPedidos_MySql_Dadoscustomers_address_format_id: TIntegerField
      FieldName = 'customers_address_format_id'
      Required = True
    end
    object cdsPedidos_MySql_Dadosdelivery_firstname: TStringField
      FieldName = 'delivery_firstname'
      Size = 100
    end
    object cdsPedidos_MySql_Dadosdelivery_lastname: TStringField
      FieldName = 'delivery_lastname'
      Size = 100
    end
    object cdsPedidos_MySql_Dadosdelivery_company: TStringField
      FieldName = 'delivery_company'
      Size = 200
    end
    object cdsPedidos_MySql_Dadosdelivery_street_address: TStringField
      FieldName = 'delivery_street_address'
      Required = True
      Size = 255
    end
    object cdsPedidos_MySql_Dadosdelivery_street_number: TIntegerField
      FieldName = 'delivery_street_number'
    end
    object cdsPedidos_MySql_Dadosdelivery_street_complemento: TStringField
      FieldName = 'delivery_street_complemento'
      Size = 50
    end
    object cdsPedidos_MySql_Dadosdelivery_suburb: TStringField
      FieldName = 'delivery_suburb'
      Size = 100
    end
    object cdsPedidos_MySql_Dadosdelivery_city: TStringField
      FieldName = 'delivery_city'
      Required = True
      Size = 100
    end
    object cdsPedidos_MySql_Dadosdelivery_postcode: TStringField
      FieldName = 'delivery_postcode'
      Required = True
      Size = 10
    end
    object cdsPedidos_MySql_Dadosdelivery_state: TStringField
      FieldName = 'delivery_state'
    end
    object cdsPedidos_MySql_Dadosdelivery_country: TStringField
      FieldName = 'delivery_country'
      Required = True
      Size = 100
    end
    object cdsPedidos_MySql_Dadosdelivery_address_format_id: TIntegerField
      FieldName = 'delivery_address_format_id'
      Required = True
    end
    object cdsPedidos_MySql_Dadosbilling_name: TStringField
      FieldName = 'billing_name'
      Required = True
      Size = 64
    end
    object cdsPedidos_MySql_Dadosbilling_company: TStringField
      FieldName = 'billing_company'
      Size = 32
    end
    object cdsPedidos_MySql_Dadosbilling_street_address: TStringField
      FieldName = 'billing_street_address'
      Required = True
      Size = 64
    end
    object cdsPedidos_MySql_Dadosbilling_street_number: TIntegerField
      FieldName = 'billing_street_number'
    end
    object cdsPedidos_MySql_Dadosbilling_street_complemento: TStringField
      FieldName = 'billing_street_complemento'
      Size = 50
    end
    object cdsPedidos_MySql_Dadosbilling_suburb: TStringField
      FieldName = 'billing_suburb'
      Size = 32
    end
    object cdsPedidos_MySql_Dadosbilling_city: TStringField
      FieldName = 'billing_city'
      Required = True
      Size = 32
    end
    object cdsPedidos_MySql_Dadosbilling_postcode: TStringField
      FieldName = 'billing_postcode'
      Required = True
      Size = 10
    end
    object cdsPedidos_MySql_Dadosbilling_state: TStringField
      FieldName = 'billing_state'
      Size = 32
    end
    object cdsPedidos_MySql_Dadosbilling_country: TStringField
      FieldName = 'billing_country'
      Required = True
      Size = 32
    end
    object cdsPedidos_MySql_Dadosbilling_address_format_id: TIntegerField
      FieldName = 'billing_address_format_id'
      Required = True
    end
    object cdsPedidos_MySql_Dadospayment_method: TStringField
      FieldName = 'payment_method'
      Required = True
      Size = 200
    end
    object cdsPedidos_MySql_Dadospayment_title: TStringField
      FieldName = 'payment_title'
      Size = 255
    end
    object cdsPedidos_MySql_Dadospayment_n_parcelas: TShortintField
      FieldName = 'payment_n_parcelas'
    end
    object cdsPedidos_MySql_Dadospayment_card_info: TMemoField
      FieldName = 'payment_card_info'
      BlobType = ftMemo
      Size = 1
    end
    object cdsPedidos_MySql_Dadospayment_url: TStringField
      FieldName = 'payment_url'
      Size = 255
    end
    object cdsPedidos_MySql_Dadosshipping_method: TStringField
      FieldName = 'shipping_method'
      Required = True
      Size = 200
    end
    object cdsPedidos_MySql_Dadosshipping_date: TDateField
      FieldName = 'shipping_date'
    end
    object cdsPedidos_MySql_Dadosshipping_time: TStringField
      FieldName = 'shipping_time'
    end
    object cdsPedidos_MySql_Dadosshipping_tracking_code: TStringField
      FieldName = 'shipping_tracking_code'
    end
    object cdsPedidos_MySql_Dadoslast_modified: TSQLTimeStampField
      FieldName = 'last_modified'
    end
    object cdsPedidos_MySql_Dadosdate_purchased: TSQLTimeStampField
      FieldName = 'date_purchased'
    end
    object cdsPedidos_MySql_Dadosorders_status: TIntegerField
      FieldName = 'orders_status'
      Required = True
    end
    object cdsPedidos_MySql_Dadosorders_date_finished: TSQLTimeStampField
      FieldName = 'orders_date_finished'
    end
    object cdsPedidos_MySql_Dadoscurrency: TStringField
      FieldName = 'currency'
      FixedChar = True
      Size = 3
    end
    object cdsPedidos_MySql_Dadoscurrency_value: TFMTBCDField
      FieldName = 'currency_value'
      Precision = 16
      Size = 6
    end
    object cdsPedidos_MySql_Dadosendereco_ip: TStringField
      FieldName = 'endereco_ip'
    end
    object cdsPedidos_MySql_Dadosparceiro_id: TIntegerField
      FieldName = 'parceiro_id'
    end
    object cdsPedidos_MySql_Dadosid_lista: TIntegerField
      FieldName = 'id_lista'
    end
    object cdsPedidos_MySql_Dadosid_lista_customer_list: TIntegerField
      FieldName = 'id_lista_customer_list'
    end
    object cdsPedidos_MySql_Dadosorder_total: TSingleField
      FieldName = 'order_total'
    end
    object cdsPedidos_MySql_Dadosimportado: TIntegerField
      FieldName = 'importado'
    end
    object cdsPedidos_MySql_Dadosabandoned_notify: TIntegerField
      FieldName = 'abandoned_notify'
    end
    object cdsPedidos_MySql_Dadosml_order_id: TIntegerField
      FieldName = 'ml_order_id'
    end
  end
  object cdsPedidos_Vendas_Dados: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspPedidos_Vendas_Dados'
    RemoteServer = dspcServer
    BeforeOpen = cdsPedidos_Vendas_DadosBeforeOpen
    BeforePost = cdsPedidos_Vendas_DadosBeforePost
    OnDeleteError = cdsPedidos_Vendas_DadosDeleteError
    OnEditError = cdsPedidos_Vendas_DadosEditError
    OnNewRecord = cdsPedidos_Vendas_DadosNewRecord
    OnPostError = cdsPedidos_Vendas_DadosPostError
    OnReconcileError = cdsPedidos_Vendas_DadosReconcileError
    BeforeApplyUpdates = cdsPedidos_Vendas_DadosBeforeApplyUpdates
    Left = 64
    Top = 152
    object cdsPedidos_Vendas_DadosEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object cdsPedidos_Vendas_DadosFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object cdsPedidos_Vendas_DadosNUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPedidos_Vendas_DadosSITUACAO: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object cdsPedidos_Vendas_DadosEMISSAO: TDateField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'EMISSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPedidos_Vendas_DadosESPECIEDOCUMENTO: TStringField
      DisplayLabel = 'Esp'#233'cie Documento'
      FieldName = 'ESPECIEDOCUMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object cdsPedidos_Vendas_DadosVENDEDOR: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'VENDEDOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsPedidos_Vendas_DadosCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsPedidos_Vendas_DadosNOMECLIENTE: TStringField
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'NOMECLIENTE'
      ProviderFlags = []
      Size = 60
    end
    object cdsPedidos_Vendas_DadosUF: TStringField
      FieldName = 'UF'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object cdsPedidos_Vendas_DadosTIPOENDERECO: TStringField
      DisplayLabel = 'Utilizar Endere'#231'o?'
      FieldName = 'TIPOENDERECO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object cdsPedidos_Vendas_DadosCLIENTEENTREGA: TIntegerField
      DisplayLabel = 'Cliente - Entrega'
      FieldName = 'CLIENTEENTREGA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPedidos_Vendas_DadosCONDICAOPAGAMENTO: TIntegerField
      DisplayLabel = 'Condi'#231#227'o de Pagamento'
      FieldName = 'CONDICAOPAGAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsPedidos_Vendas_DadosFORMAPAGAMENTO: TStringField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FORMAPAGAMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object cdsPedidos_Vendas_DadosCRITERIO: TStringField
      DisplayLabel = 'Crit'#233'rio RFA'
      FieldName = 'CRITERIO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object cdsPedidos_Vendas_DadosTABELA: TIntegerField
      DisplayLabel = 'Tabela'
      FieldName = 'TABELA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPedidos_Vendas_DadosMOEDA: TStringField
      DisplayLabel = 'Moeda'
      FieldName = 'MOEDA'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsPedidos_Vendas_DadosTAXA: TFloatField
      DisplayLabel = 'Taxa'
      FieldName = 'TAXA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsPedidos_Vendas_DadosTIPOPRECO: TStringField
      DisplayLabel = 'Tipo de Pre'#231'o'
      FieldName = 'TIPOPRECO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object cdsPedidos_Vendas_DadosTRANSPORTADORA: TIntegerField
      DisplayLabel = 'Transportadora'
      FieldName = 'TRANSPORTADORA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPedidos_Vendas_DadosCATEGORIA: TStringField
      DisplayLabel = 'Categoria'
      FieldName = 'CATEGORIA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 15
    end
    object cdsPedidos_Vendas_DadosSTATUSENTREGA: TStringField
      DisplayLabel = 'Status da Entrega'
      FieldName = 'STATUSENTREGA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsPedidos_Vendas_DadosVALORMERCADORIAS: TFloatField
      DisplayLabel = 'Valor Mercadorias'
      FieldName = 'VALORMERCADORIAS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosDESCONTO: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'DESCONTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object cdsPedidos_Vendas_DadosVALORDESCONTO: TFloatField
      DisplayLabel = 'Valor Desconto'
      FieldName = 'VALORDESCONTO'
      ProviderFlags = [pfInUpdate]
      OnValidate = cdsPedidos_Vendas_DadosVALORDESCONTOValidate
      currency = True
    end
    object cdsPedidos_Vendas_DadosCOMISSAO: TFloatField
      DisplayLabel = 'Comiss'#227'o'
      FieldName = 'COMISSAO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object cdsPedidos_Vendas_DadosBASECOMISSAO: TFloatField
      DisplayLabel = 'Base Comiss'#227'o'
      FieldName = 'BASECOMISSAO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosVALORCOMISSAO: TFloatField
      DisplayLabel = 'Valor Comiss'#227'o'
      FieldName = 'VALORCOMISSAO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosTIPOFRETE: TStringField
      DisplayLabel = 'Tipo de Frete'
      FieldName = 'TIPOFRETE'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsPedidos_Vendas_DadosVALORFRETE: TFloatField
      DisplayLabel = 'Valor Frete'
      FieldName = 'VALORFRETE'
      ProviderFlags = [pfInUpdate]
      OnValidate = cdsPedidos_Vendas_DadosVALORFRETEValidate
      currency = True
    end
    object cdsPedidos_Vendas_DadosVALORSEGURO: TFloatField
      DisplayLabel = 'Valor Seguro'
      FieldName = 'VALORSEGURO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosVALORDESPESAS: TFloatField
      DisplayLabel = 'Valor Despesas'
      FieldName = 'VALORDESPESAS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosVOLUMES: TFloatField
      DisplayLabel = 'Volumes'
      FieldName = 'VOLUMES'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPedidos_Vendas_DadosESPECIE: TStringField
      DisplayLabel = 'Esp'#233'cie'
      FieldName = 'ESPECIE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPedidos_Vendas_DadosMARCA: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPedidos_Vendas_DadosPESOLIQUIDO: TFloatField
      DisplayLabel = 'Peso L'#237'quido'
      FieldName = 'PESOLIQUIDO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object cdsPedidos_Vendas_DadosPESOBRUTO: TFloatField
      DisplayLabel = 'Peso Bruto'
      FieldName = 'PESOBRUTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object cdsPedidos_Vendas_DadosVALORFINANCEIRO: TFloatField
      DisplayLabel = 'Valor Financeiro'
      FieldName = 'VALORFINANCEIRO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosVALORBRUTO: TFloatField
      DisplayLabel = 'Valor Bruto'
      FieldName = 'VALORBRUTO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosVALORLIQUIDO: TFloatField
      DisplayLabel = 'Valor L'#237'quido'
      FieldName = 'VALORLIQUIDO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosBASEIPI: TFloatField
      DisplayLabel = 'Base IPI'
      FieldName = 'BASEIPI'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosVALORIPI: TFloatField
      DisplayLabel = 'Valor IPI'
      FieldName = 'VALORIPI'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosBASEICMS: TFloatField
      DisplayLabel = 'Base ICMS'
      FieldName = 'BASEICMS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosVALORICMS: TFloatField
      DisplayLabel = 'Valor ICMS'
      FieldName = 'VALORICMS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosBASEICMSST: TFloatField
      DisplayLabel = 'Base ICMS - ST'
      FieldName = 'BASEICMSST'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosVALORICMSST: TFloatField
      DisplayLabel = 'Valor ICMS - ST'
      FieldName = 'VALORICMSST'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPedidos_Vendas_DadosBASEISSA: TFloatField
      DisplayLabel = 'Base ISS - Apur.'
      FieldName = 'BASEISSA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosVALORISSA: TFloatField
      DisplayLabel = 'Valor ISS - Apur.'
      FieldName = 'VALORISSA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosBASEISSR: TFloatField
      DisplayLabel = 'Base ISS - Ret.'
      FieldName = 'BASEISSR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosVALORISSR: TFloatField
      DisplayLabel = 'Valor ISS - Ret.'
      FieldName = 'VALORISSR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosBASEPISA: TFloatField
      DisplayLabel = 'Base PIS - Apur.'
      FieldName = 'BASEPISA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosVALORPISA: TFloatField
      DisplayLabel = 'Valor PIS - Apur.'
      FieldName = 'VALORPISA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosBASEPISR: TFloatField
      DisplayLabel = 'Base PIS - Ret.'
      FieldName = 'BASEPISR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosVALORPISR: TFloatField
      DisplayLabel = 'Valor PIS - Ret.'
      FieldName = 'VALORPISR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosBASECOFINSA: TFloatField
      DisplayLabel = 'Base COFINS - Apur.'
      FieldName = 'BASECOFINSA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosVALORCOFINSA: TFloatField
      DisplayLabel = 'Valor COFINS - Apur.'
      FieldName = 'VALORCOFINSA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosBASECOFINSR: TFloatField
      DisplayLabel = 'Base COFINS - Ret.'
      FieldName = 'BASECOFINSR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosVALORCOFINSR: TFloatField
      DisplayLabel = 'Valor COFINS - Ret.'
      FieldName = 'VALORCOFINSR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosBASECSLLR: TFloatField
      DisplayLabel = 'Base CSLL - Ret.'
      FieldName = 'BASECSLLR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosVALORCSLLR: TFloatField
      DisplayLabel = 'Valor CSLL - Ret.'
      FieldName = 'VALORCSLLR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosBASEIRRFA: TFloatField
      DisplayLabel = 'Base IRRF - Apur.'
      FieldName = 'BASEIRRFA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosVALORIRRFA: TFloatField
      DisplayLabel = 'Valor IRRF - Apur.'
      FieldName = 'VALORIRRFA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosBASEIRRFR: TFloatField
      DisplayLabel = 'Base IRRF - Ret.'
      FieldName = 'BASEIRRFR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosVALORIRRFR: TFloatField
      DisplayLabel = 'Valor IRRF - Ret.'
      FieldName = 'VALORIRRFR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosBASEINSSA: TFloatField
      DisplayLabel = 'Base INSS - Apur.'
      FieldName = 'BASEINSSA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosVALORINSSA: TFloatField
      DisplayLabel = 'Valor INSS - Apur.'
      FieldName = 'VALORINSSA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosBASEINSSR: TFloatField
      DisplayLabel = 'Base INSS - Ret.'
      FieldName = 'BASEINSSR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosVALORINSSR: TFloatField
      DisplayLabel = 'Valor INSS - Ret.'
      FieldName = 'VALORINSSR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosNUMEROINTERNO: TStringField
      DisplayLabel = 'N'#250'mero Interno'
      FieldName = 'NUMEROINTERNO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object cdsPedidos_Vendas_DadosULTIMOORCAMENTO: TIntegerField
      DisplayLabel = #218'ltimo Or'#231'amento'
      FieldName = 'ULTIMOORCAMENTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0'
    end
    object cdsPedidos_Vendas_DadosULTIMANOTA: TIntegerField
      DisplayLabel = #218'ltima Nota'
      FieldName = 'ULTIMANOTA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPedidos_Vendas_DadosULTIMOPREFIXO: TStringField
      DisplayLabel = #218'ltimo Prefixo'
      FieldName = 'ULTIMOPREFIXO'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object cdsPedidos_Vendas_DadosULTIMOFATURAMENTO: TDateField
      DisplayLabel = #218'ltimo Faturamento'
      FieldName = 'ULTIMOFATURAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPedidos_Vendas_DadosULTIMASAIDA: TDateField
      DisplayLabel = #218'ltima Sa'#237'da'
      FieldName = 'ULTIMASAIDA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPedidos_Vendas_DadosCNPJCPF: TStringField
      DisplayLabel = 'CNPJ/CPF'
      FieldName = 'CNPJCPF'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object cdsPedidos_Vendas_DadosORIGEM: TStringField
      DisplayLabel = 'Origem'
      FieldName = 'ORIGEM'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object cdsPedidos_Vendas_DadosPRIORIDADE: TIntegerField
      DisplayLabel = 'Prioridade'
      FieldName = 'PRIORIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPedidos_Vendas_DadosSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsPedidos_Vendas_DadosUSUARIO: TIntegerField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPedidos_Vendas_DadosUFEMBARQUE: TStringField
      DisplayLabel = 'UF de Embarque'
      FieldName = 'UFEMBARQUE'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object cdsPedidos_Vendas_DadosLOCALEMBARQUE: TStringField
      DisplayLabel = 'Local de Embarque'
      FieldName = 'LOCALEMBARQUE'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object cdsPedidos_Vendas_DadosNOMELOCALEMBARQUE: TStringField
      DisplayLabel = 'Nome do Local de Embarque'
      FieldName = 'NOMELOCALEMBARQUE'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object cdsPedidos_Vendas_DadosOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 256
    end
    object cdsPedidos_Vendas_DadosIDNFEREF: TStringField
      DisplayLabel = 'Id NF-e Referenciada'
      FieldName = 'IDNFEREF'
      ProviderFlags = [pfInUpdate]
      Size = 44
    end
    object cdsPedidos_Vendas_DadosIDSFA: TStringField
      DisplayLabel = 'ID SFA'
      FieldName = 'IDSFA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
    end
    object cdsPedidos_Vendas_DadosIMPRESSO: TStringField
      DisplayLabel = 'Impresso'
      FieldName = 'IMPRESSO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsPedidos_Vendas_DadosCOLETA: TStringField
      DisplayLabel = 'Coleta'
      FieldName = 'COLETA'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object cdsPedidos_Vendas_DadosDATACOLETA: TDateField
      DisplayLabel = 'Data da Coleta'
      FieldName = 'DATACOLETA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPedidos_Vendas_DadosHORACOLETA: TTimeField
      DisplayLabel = 'Hora da Coleta'
      FieldName = 'HORACOLETA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPedidos_Vendas_DadosSTATUSCOLETA: TStringField
      DisplayLabel = 'Status da Coleta'
      FieldName = 'STATUSCOLETA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsPedidos_Vendas_DadosBASETRIBUTOS: TFloatField
      DisplayLabel = 'Base Tributos'
      FieldName = 'BASETRIBUTOS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosVALORTRIBUTOS: TFloatField
      DisplayLabel = 'Valor Tributos'
      FieldName = 'VALORTRIBUTOS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data de Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsPedidos_Vendas_DadosBASEICMSDIF: TFloatField
      DisplayLabel = 'Base ICMS Dif'
      FieldName = 'BASEICMSDIF'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosVALORICMSDIF: TFloatField
      DisplayLabel = 'Valor ICMS Dif'
      FieldName = 'VALORICMSDIF'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosBASEICMSFCP: TFloatField
      DisplayLabel = 'Base ICMS FCP'
      FieldName = 'BASEICMSFCP'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosVALORICMSFCP: TFloatField
      DisplayLabel = 'Valor ICMS FCP'
      FieldName = 'VALORICMSFCP'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosBASEICMSPUFD: TFloatField
      DisplayLabel = 'Base ICMS PUFD'
      FieldName = 'BASEICMSPUFD'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosVALORICMSPUFD: TFloatField
      DisplayLabel = 'Valor ICMS PUFD'
      FieldName = 'VALORICMSPUFD'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosBASEICMSPUFO: TFloatField
      DisplayLabel = 'Base ICMS PUFO'
      FieldName = 'BASEICMSPUFO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadosVALORICMSPUFO: TFloatField
      DisplayLabel = 'Valor ICMS PUFO'
      FieldName = 'VALORICMSPUFO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_DadossqlPedidos_Vendas_Itens: TDataSetField
      FieldName = 'sqlPedidos_Vendas_Itens'
    end
    object cdsPedidos_Vendas_DadosNOMEVENDEDOR: TStringField
      DisplayLabel = 'Nome do Vendedor'
      DisplayWidth = 25
      FieldName = 'NOMEVENDEDOR'
      ProviderFlags = []
      Size = 25
    end
    object cdsPedidos_Vendas_DadosINCLUIDO: TStringField
      DisplayLabel = 'Inclu'#237'do'
      FieldName = 'INCLUIDO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object cdsPedidos_Vendas_DadosALTERADO: TStringField
      DisplayLabel = 'Alterado'
      FieldName = 'ALTERADO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object cdsPedidos_Vendas_DadossqlPedidos_Vendas_Referenciadas: TDataSetField
      FieldName = 'sqlPedidos_Vendas_Referenciadas'
    end
    object cdsPedidos_Vendas_DadossqlPedidos_Vendas_Historicos: TDataSetField
      FieldName = 'sqlPedidos_Vendas_Historicos'
    end
  end
  object cdsPedidos_Vendas_Itens: TClientDataSet
    Aggregates = <>
    DataSetField = cdsPedidos_Vendas_DadossqlPedidos_Vendas_Itens
    FetchOnDemand = False
    PacketRecords = 0
    Params = <>
    RemoteServer = dspcLan
    BeforeInsert = cdsPedidos_Vendas_ItensBeforeInsert
    BeforePost = cdsPedidos_Vendas_ItensBeforePost
    AfterPost = cdsPedidos_Vendas_ItensAfterPost
    OnNewRecord = cdsPedidos_Vendas_ItensNewRecord
    Left = 72
    Top = 240
    object cdsPedidos_Vendas_ItensEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object cdsPedidos_Vendas_ItensFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object cdsPedidos_Vendas_ItensNUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPedidos_Vendas_ItensITEM: TIntegerField
      DisplayLabel = 'Item'
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0000'
      EditFormat = '0000'
    end
    object cdsPedidos_Vendas_ItensPRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'PRODUTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 15
    end
    object cdsPedidos_Vendas_ItensDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 240
    end
    object cdsPedidos_Vendas_ItensPRIMEIRAUNIDADE: TStringField
      DisplayLabel = '1aUM'
      FieldName = 'PRIMEIRAUNIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object cdsPedidos_Vendas_ItensLOCAL: TStringField
      DisplayLabel = 'Local'
      FieldName = 'LOCAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object cdsPedidos_Vendas_ItensQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object cdsPedidos_Vendas_ItensUNITARIO: TFloatField
      DisplayLabel = 'Unit'#225'rio'
      FieldName = 'UNITARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsPedidos_Vendas_ItensUNITARIOMOEDA: TFloatField
      DisplayLabel = 'Unit'#225'rio Moeda'
      FieldName = 'UNITARIOMOEDA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsPedidos_Vendas_ItensTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      currency = True
    end
    object cdsPedidos_Vendas_ItensVALORFINANCEIRO: TFloatField
      DisplayLabel = 'Valor Financeiro'
      FieldName = 'VALORFINANCEIRO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensVALORBRUTO: TFloatField
      DisplayLabel = 'Valor Bruto'
      FieldName = 'VALORBRUTO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensVALORLIQUIDO: TFloatField
      DisplayLabel = 'Valor L'#237'quido'
      FieldName = 'VALORLIQUIDO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensDESCONTO: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'DESCONTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object cdsPedidos_Vendas_ItensVALORDESCONTO: TFloatField
      DisplayLabel = 'Valor Desconto'
      FieldName = 'VALORDESCONTO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensCOMISSAO: TFloatField
      DisplayLabel = 'Comiss'#227'o'
      FieldName = 'COMISSAO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object cdsPedidos_Vendas_ItensBASECOMISSAO: TFloatField
      DisplayLabel = 'Base Comiss'#227'o'
      FieldName = 'BASECOMISSAO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensVALORCOMISSAO: TFloatField
      DisplayLabel = 'Valor Comiss'#227'o'
      FieldName = 'VALORCOMISSAO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensVALORDESPESAS: TFloatField
      DisplayLabel = 'Valor Despesas'
      FieldName = 'VALORDESPESAS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensVALORFRETE: TFloatField
      DisplayLabel = 'Valor Frete'
      FieldName = 'VALORFRETE'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensVALORSEGURO: TFloatField
      DisplayLabel = 'Valor Seguro'
      FieldName = 'VALORSEGURO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensPRECOLISTA: TFloatField
      DisplayLabel = 'Pre'#231'o Lista'
      FieldName = 'PRECOLISTA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsPedidos_Vendas_ItensENTREGA: TDateField
      DisplayLabel = 'Entrega'
      FieldName = 'ENTREGA'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPedidos_Vendas_ItensREGRA: TIntegerField
      DisplayLabel = 'Regra'
      FieldName = 'REGRA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsPedidos_Vendas_ItensCODIGOFISCAL: TStringField
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGOFISCAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 4
    end
    object cdsPedidos_Vendas_ItensCLASSIFICACAOFISCAL: TStringField
      DisplayLabel = 'CF'
      DisplayWidth = 2
      FieldName = 'CLASSIFICACAOFISCAL'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object cdsPedidos_Vendas_ItensMARGEMLUCRO: TFloatField
      DisplayLabel = '%ML'
      FieldName = 'MARGEMLUCRO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object cdsPedidos_Vendas_ItensIPI: TFloatField
      FieldName = 'IPI'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object cdsPedidos_Vendas_ItensBASEIPI: TFloatField
      DisplayLabel = 'Base IPI'
      FieldName = 'BASEIPI'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensVALORIPI: TFloatField
      DisplayLabel = 'Valor IPI'
      FieldName = 'VALORIPI'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensCSTIPI: TStringField
      DisplayLabel = 'CST IPI'
      FieldName = 'CSTIPI'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object cdsPedidos_Vendas_ItensICMS: TFloatField
      FieldName = 'ICMS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object cdsPedidos_Vendas_ItensBASEICMS: TFloatField
      DisplayLabel = 'Base ICMS'
      FieldName = 'BASEICMS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensVALORICMS: TFloatField
      DisplayLabel = 'Valor ICMS'
      FieldName = 'VALORICMS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensBASEICMSST: TFloatField
      DisplayLabel = 'Base ICMS - ST'
      FieldName = 'BASEICMSST'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensCSTICMS: TStringField
      DisplayLabel = 'CST ICMS'
      FieldName = 'CSTICMS'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object cdsPedidos_Vendas_ItensORIGEMST: TStringField
      DisplayLabel = 'Origem ST'
      FieldName = 'ORIGEMST'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsPedidos_Vendas_ItensVALORICMSST: TFloatField
      DisplayLabel = 'Valor ICMS - ST'
      FieldName = 'VALORICMSST'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensISS: TFloatField
      FieldName = 'ISS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object cdsPedidos_Vendas_ItensBASEISSA: TFloatField
      DisplayLabel = 'Base ISS - Apur.'
      FieldName = 'BASEISSA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensVALORISSA: TFloatField
      DisplayLabel = 'Valor ISS - Apur.'
      FieldName = 'VALORISSA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensBASEISSR: TFloatField
      DisplayLabel = 'Base ISS - Ret.'
      FieldName = 'BASEISSR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensVALORISSR: TFloatField
      DisplayLabel = 'Valor ISS - Ret.'
      FieldName = 'VALORISSR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensPISA: TFloatField
      DisplayLabel = 'PIS - Apur.'
      FieldName = 'PISA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object cdsPedidos_Vendas_ItensBASEPISA: TFloatField
      DisplayLabel = 'Base PIS - Apur.'
      FieldName = 'BASEPISA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensVALORPISA: TFloatField
      DisplayLabel = 'Valor PIS - Apur.'
      FieldName = 'VALORPISA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensPISR: TFloatField
      DisplayLabel = 'PIS - Ret.'
      FieldName = 'PISR'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object cdsPedidos_Vendas_ItensBASEPISR: TFloatField
      DisplayLabel = 'Base PIS - Ret.'
      FieldName = 'BASEPISR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensVALORPISR: TFloatField
      DisplayLabel = 'Valor PIS - Ret.'
      FieldName = 'VALORPISR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensCOFINSA: TFloatField
      DisplayLabel = 'COFINS - Apur.'
      FieldName = 'COFINSA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object cdsPedidos_Vendas_ItensBASECOFINSA: TFloatField
      DisplayLabel = 'Base COFINS - Apur.'
      FieldName = 'BASECOFINSA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensVALORCOFINSA: TFloatField
      DisplayLabel = 'Valor COFINS - Apur.'
      FieldName = 'VALORCOFINSA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensCOFINSR: TFloatField
      DisplayLabel = 'COFINS - Ret.'
      FieldName = 'COFINSR'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object cdsPedidos_Vendas_ItensBASECOFINSR: TFloatField
      DisplayLabel = 'Base COFINS - Ret.'
      FieldName = 'BASECOFINSR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensVALORCOFINSR: TFloatField
      DisplayLabel = 'Valor COFINS - Ret.'
      FieldName = 'VALORCOFINSR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensCSLLR: TFloatField
      DisplayLabel = 'CSLL - Ret.'
      FieldName = 'CSLLR'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object cdsPedidos_Vendas_ItensBASECSLLR: TFloatField
      DisplayLabel = 'Base CSLL - Ret.'
      FieldName = 'BASECSLLR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensVALORCSLLR: TFloatField
      DisplayLabel = 'Valor CSLL - Ret.'
      FieldName = 'VALORCSLLR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensIRRF: TFloatField
      FieldName = 'IRRF'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object cdsPedidos_Vendas_ItensBASEIRRFA: TFloatField
      DisplayLabel = 'Base IRRF - Apur.'
      FieldName = 'BASEIRRFA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensVALORIRRFA: TFloatField
      DisplayLabel = 'Valor IRRF - Apur.'
      FieldName = 'VALORIRRFA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensBASEIRRFR: TFloatField
      DisplayLabel = 'Base IRRF - Ret.'
      FieldName = 'BASEIRRFR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensVALORIRRFR: TFloatField
      DisplayLabel = 'Valor IRRF - Ret.'
      FieldName = 'VALORIRRFR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensINSS: TFloatField
      FieldName = 'INSS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object cdsPedidos_Vendas_ItensBASEINSSA: TFloatField
      DisplayLabel = 'Base INSS - Apur.'
      FieldName = 'BASEINSSA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensVALORINSSA: TFloatField
      DisplayLabel = 'Valor INSS - Apur.'
      FieldName = 'VALORINSSA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensBASEINSSR: TFloatField
      DisplayLabel = 'Base INSS - Ret.'
      FieldName = 'BASEINSSR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensVALORINSSR: TFloatField
      DisplayLabel = 'Valor INSS - Ret.'
      DisplayWidth = 10
      FieldName = 'VALORINSSR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensPESOLIQUIDO: TFloatField
      DisplayLabel = 'Peso L'#237'quido'
      FieldName = 'PESOLIQUIDO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object cdsPedidos_Vendas_ItensPESOBRUTO: TFloatField
      DisplayLabel = 'Peso Bruto'
      FieldName = 'PESOBRUTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object cdsPedidos_Vendas_ItensUNITARIOPL: TFloatField
      DisplayLabel = 'Unit'#225'rio P.L'
      FieldName = 'UNITARIOPL'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object cdsPedidos_Vendas_ItensUNITARIOPB: TFloatField
      DisplayLabel = 'Unit'#225'rio P.B'
      FieldName = 'UNITARIOPB'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object cdsPedidos_Vendas_ItensNUMEROOV: TIntegerField
      DisplayLabel = 'N'#250'mero OV'
      FieldName = 'NUMEROOV'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPedidos_Vendas_ItensITEMOV: TIntegerField
      DisplayLabel = 'Item OV'
      FieldName = 'ITEMOV'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPedidos_Vendas_ItensQUANTIDADELIBERADA: TFloatField
      DisplayLabel = 'Quantidade Liberada'
      FieldName = 'QUANTIDADELIBERADA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object cdsPedidos_Vendas_ItensPEDIDOCLIENTE: TStringField
      DisplayLabel = 'Pedido do Cliente'
      FieldName = 'PEDIDOCLIENTE'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsPedidos_Vendas_ItensITEMPEDIDOCLIENTE: TIntegerField
      DisplayLabel = 'Item Pedido Cliente'
      FieldName = 'ITEMPEDIDOCLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPedidos_Vendas_ItensDOCUMENTOORIGEM: TIntegerField
      DisplayLabel = 'Documento Origem'
      FieldName = 'DOCUMENTOORIGEM'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPedidos_Vendas_ItensPREFIXOORIGEM: TStringField
      DisplayLabel = 'Prefixo Origem'
      FieldName = 'PREFIXOORIGEM'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object cdsPedidos_Vendas_ItensITEMORIGEM: TIntegerField
      DisplayLabel = 'Item Origem'
      FieldName = 'ITEMORIGEM'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPedidos_Vendas_ItensFATURADO: TFloatField
      DisplayLabel = 'Faturado'
      FieldName = 'FATURADO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object cdsPedidos_Vendas_ItensELIMINADO: TFloatField
      DisplayLabel = 'Eliminado'
      FieldName = 'ELIMINADO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object cdsPedidos_Vendas_ItensPRODUTOCLIENTE: TStringField
      DisplayLabel = 'Produto no Cliente'
      FieldName = 'PRODUTOCLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPedidos_Vendas_ItensTIPOPRECO: TStringField
      DisplayLabel = 'Tipo de Pre'#231'o'
      FieldName = 'TIPOPRECO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object cdsPedidos_Vendas_ItensSITUACAO: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsPedidos_Vendas_ItensLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object cdsPedidos_Vendas_ItensVALIDADELOTE: TDateField
      DisplayLabel = 'Validade do Lote'
      FieldName = 'VALIDADELOTE'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPedidos_Vendas_ItensTRIBUTOS: TFloatField
      DisplayLabel = 'Tributos'
      FieldName = 'TRIBUTOS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object cdsPedidos_Vendas_ItensBASETRIBUTOS: TFloatField
      DisplayLabel = 'Base Tributos'
      FieldName = 'BASETRIBUTOS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensVALORTRIBUTOS: TFloatField
      DisplayLabel = 'Valor Tributos'
      FieldName = 'VALORTRIBUTOS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensADICIONAIS: TStringField
      DisplayLabel = 'Adicionais'
      FieldName = 'ADICIONAIS'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object cdsPedidos_Vendas_ItensDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data da Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsPedidos_Vendas_ItensNCM: TStringField
      FieldName = 'NCM'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object cdsPedidos_Vendas_ItensCEST: TStringField
      FieldName = 'CEST'
      ProviderFlags = [pfInUpdate]
      Size = 7
    end
    object cdsPedidos_Vendas_ItensICMSDIF: TFloatField
      DisplayLabel = 'ICMS Diferido'
      FieldName = 'ICMSDIF'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object cdsPedidos_Vendas_ItensBASEICMSDIF: TFloatField
      DisplayLabel = 'Base ICMS Dif'
      FieldName = 'BASEICMSDIF'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensVALORICMSDIF: TFloatField
      DisplayLabel = 'Valor ICMS Dif'
      FieldName = 'VALORICMSDIF'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensCSOSNICMS: TStringField
      DisplayLabel = 'CSOSN'
      FieldName = 'CSOSNICMS'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object cdsPedidos_Vendas_ItensSALDODEVOLVER: TFloatField
      DisplayLabel = 'Saldo Devolver'
      FieldName = 'SALDODEVOLVER'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object cdsPedidos_Vendas_ItensBASEICMSFCP: TFloatField
      DisplayLabel = 'Base ICMS FCP'
      FieldName = 'BASEICMSFCP'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensVALORICMSFCP: TFloatField
      DisplayLabel = 'Valor ICMS FCP'
      FieldName = 'VALORICMSFCP'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensBASEICMSPUFD: TFloatField
      DisplayLabel = 'Base ICMS PUFD'
      FieldName = 'BASEICMSPUFD'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensVALORICMSPUFD: TFloatField
      DisplayLabel = 'Valor ICMS PUFD'
      FieldName = 'VALORICMSPUFD'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensBASEICMSPUFO: TFloatField
      DisplayLabel = 'Base ICMS PUFO'
      FieldName = 'BASEICMSPUFO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsPedidos_Vendas_ItensVALORICMSPUFO: TFloatField
      DisplayLabel = 'Valor ICMS PUFO'
      FieldName = 'VALORICMSPUFO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA_VENDEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL_VENDEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspClientes'
    RemoteServer = dspcCad
    BeforeOpen = cdsClientesBeforeOpen
    BeforePost = cdsClientesBeforePost
    OnDeleteError = cdsClientesDeleteError
    OnEditError = cdsClientesEditError
    OnPostError = cdsClientesPostError
    OnReconcileError = cdsClientesReconcileError
    Left = 216
    Top = 184
    object cdsClientesEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object cdsClientesFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object cdsClientesCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsClientesSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object cdsClientesDATACADASTRO: TDateField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATACADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object cdsClientesNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
    object cdsClientesPESSOA: TStringField
      DisplayLabel = 'Pessoa'
      FieldName = 'PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object cdsClientesREDUZIDO: TStringField
      DisplayLabel = 'Reduzido'
      FieldName = 'REDUZIDO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object cdsClientesENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
    object cdsClientesNUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      DisplayWidth = 5
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 5
    end
    object cdsClientesCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object cdsClientesUF: TStringField
      FieldName = 'UF'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object cdsClientesMUNICIPIO: TStringField
      DisplayLabel = 'Munic'#237'pio'
      FieldName = 'MUNICIPIO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object cdsClientesCMUNICIPIO: TStringField
      DisplayLabel = 'C'#243'digo Munic'#237'pio'
      DisplayWidth = 7
      FieldName = 'CMUNICIPIO'
      ProviderFlags = [pfInUpdate]
      Size = 7
    end
    object cdsClientesBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object cdsClientesCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '99999-999;0;_'
      Size = 8
    end
    object cdsClientesCNPJ: TStringField
      FieldName = 'CNPJ'
      ProviderFlags = [pfInUpdate]
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object cdsClientesCPF: TStringField
      FieldName = 'CPF'
      ProviderFlags = [pfInUpdate]
      EditMask = '999.999.999-99;0;_'
      Size = 11
    end
    object cdsClientesIE: TStringField
      DisplayLabel = 'Inscri'#231#227'o Estadual'
      FieldName = 'IE'
      ProviderFlags = [pfInUpdate]
      Size = 22
    end
    object cdsClientesINDICADORIE: TStringField
      DisplayLabel = 'Indicador IE'
      FieldName = 'INDICADORIE'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsClientesIM: TStringField
      DisplayLabel = 'Inscri'#231#227'o Municipal'
      FieldName = 'IM'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object cdsClientesRG: TStringField
      FieldName = 'RG'
      ProviderFlags = [pfInUpdate]
      EditMask = '99.999.999-aa;0; '
      Size = 11
    end
    object cdsClientesEMAIL: TStringField
      DisplayLabel = 'E-Mail'
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object cdsClientesHOMEPAGE: TStringField
      DisplayLabel = 'HomePage'
      FieldName = 'HOMEPAGE'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object cdsClientesDATANASCIMENTO: TDateField
      DisplayLabel = 'Data Nascimento'
      FieldName = 'DATANASCIMENTO'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000;1;_'
    end
    object cdsClientesDDI: TStringField
      FieldName = 'DDI'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object cdsClientesDDD: TStringField
      FieldName = 'DDD'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object cdsClientesTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 9
      FieldName = 'TELEFONE'
      ProviderFlags = [pfInUpdate]
      EditMask = '90000-0009;0;_'
      Size = 9
    end
    object cdsClientesFAX: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
      ProviderFlags = [pfInUpdate]
      EditMask = '90000-0009;0;_'
      Size = 9
    end
    object cdsClientesCELULAR: TStringField
      DisplayLabel = 'Celular'
      FieldName = 'CELULAR'
      ProviderFlags = [pfInUpdate]
      EditMask = '90000-0009;0;_'
      Size = 9
    end
    object cdsClientesCONTATO: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'CONTATO'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object cdsClientesCPAIS: TStringField
      DisplayLabel = 'C'#243'digo do Pa'#237's'
      FieldName = 'CPAIS'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object cdsClientesNPAIS: TStringField
      DisplayLabel = 'Nome do Pa'#237's'
      FieldName = 'NPAIS'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cdsClientesIDESTRANGEIRO: TStringField
      DisplayLabel = 'Id Estrangeiro'
      FieldName = 'IDESTRANGEIRO'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object cdsClientesVENDEDOR: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'VENDEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object cdsClientesCOMISSAO: TFloatField
      DisplayLabel = 'Comiss'#227'o'
      FieldName = 'COMISSAO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object cdsClientesBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsClientesAGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'AGENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object cdsClientesCONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'CONTA'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsClientesGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsClientesTRANSPORTADORA: TIntegerField
      DisplayLabel = 'Transportadora'
      FieldName = 'TRANSPORTADORA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsClientesCONCEITO: TStringField
      DisplayLabel = 'Conceito'
      FieldName = 'CONCEITO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsClientesRISCO: TStringField
      DisplayLabel = 'Risco'
      FieldName = 'RISCO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsClientesCLASSEVALOR: TStringField
      DisplayLabel = 'Classe Valor'
      FieldName = 'CLASSEVALOR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsClientesTABELA: TStringField
      DisplayLabel = 'Tabela'
      FieldName = 'TABELA'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object cdsClientesLIMITECREDITO: TFloatField
      DisplayLabel = 'Limite Cr'#233'dito'
      FieldName = 'LIMITECREDITO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsClientesVENCIMENTOLC: TDateField
      DisplayLabel = 'Vencimento LC'
      FieldName = 'VENCIMENTOLC'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000;1;_'
    end
    object cdsClientesPRIMEIRACOMPRA: TDateField
      DisplayLabel = 'Primeira Compra'
      FieldName = 'PRIMEIRACOMPRA'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000;1;_'
    end
    object cdsClientesULTIMACOMPRA: TDateField
      DisplayLabel = #218'ltima Compra'
      FieldName = 'ULTIMACOMPRA'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000;1;_'
    end
    object cdsClientesSEGMENTOMERCADO: TIntegerField
      DisplayLabel = 'Segmento Mercado'
      FieldName = 'SEGMENTOMERCADO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsClientesMAIORSALDOLC: TFloatField
      DisplayLabel = 'Maior Saldo LC'
      FieldName = 'MAIORSALDOLC'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsClientesMENORSALDOLC: TFloatField
      DisplayLabel = 'Menor Saldo LC'
      FieldName = 'MENORSALDOLC'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsClientesMAIORCOMPRA: TFloatField
      DisplayLabel = 'Maior Compra'
      FieldName = 'MAIORCOMPRA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsClientesMENORCOMPRA: TFloatField
      DisplayLabel = 'Menor Compra'
      FieldName = 'MENORCOMPRA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsClientesMEDIAATRASO: TFloatField
      DisplayLabel = 'M'#233'dia Atraso'
      FieldName = 'MEDIAATRASO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
    end
    object cdsClientesSALDODEVEDOR: TFloatField
      DisplayLabel = 'Saldo Devedor'
      FieldName = 'SALDODEVEDOR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsClientesNUMEROCOMPRAS: TIntegerField
      DisplayLabel = 'N'#250'mero Compras'
      FieldName = 'NUMEROCOMPRAS'
      ProviderFlags = [pfInUpdate]
    end
    object cdsClientesTITULOSABERTOS: TIntegerField
      DisplayLabel = 'T'#237'tulos Abertos'
      FieldName = 'TITULOSABERTOS'
      ProviderFlags = [pfInUpdate]
    end
    object cdsClientesTITULOSATRASADOS: TIntegerField
      DisplayLabel = 'T'#237'tulos Atrasados'
      FieldName = 'TITULOSATRASADOS'
      ProviderFlags = [pfInUpdate]
    end
    object cdsClientesSALDOATRASADOS: TFloatField
      DisplayLabel = 'Saldo Atrasados'
      FieldName = 'SALDOATRASADOS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsClientesNUMEROPAGTOS: TIntegerField
      DisplayLabel = 'N'#250'mero Pagamentos'
      FieldName = 'NUMEROPAGTOS'
      ProviderFlags = [pfInUpdate]
    end
    object cdsClientesMAIORTITULO: TFloatField
      DisplayLabel = 'Maior T'#237'tulo'
      FieldName = 'MAIORTITULO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsClientesMENORTITULO: TFloatField
      DisplayLabel = 'Menor T'#237'tulo'
      FieldName = 'MENORTITULO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsClientesCHEQUESDEVOLVIDOS: TIntegerField
      DisplayLabel = 'Cheques Devolvidos'
      FieldName = 'CHEQUESDEVOLVIDOS'
      ProviderFlags = [pfInUpdate]
    end
    object cdsClientesULTIMADEVOLUCAO: TDateField
      DisplayLabel = #218'ltima Devolu'#231#227'o'
      FieldName = 'ULTIMADEVOLUCAO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsClientesOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object cdsClientesTIPOFRETE: TStringField
      DisplayLabel = 'Tipo Frete'
      FieldName = 'TIPOFRETE'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsClientesDESCONTO: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'DESCONTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object cdsClientesCONDICAOPAGAMENTO: TIntegerField
      DisplayLabel = 'Condi'#231#227'o de Pagamento'
      FieldName = 'CONDICAOPAGAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsClientesFORMAPAGAMENTO: TStringField
      DisplayLabel = 'Forma Pagamento'
      FieldName = 'FORMAPAGAMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object cdsClientesCATEGORIA: TStringField
      DisplayLabel = 'Categoria'
      FieldName = 'CATEGORIA'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object cdsClientesTIPOPRECO: TStringField
      DisplayLabel = 'Tipo Pre'#231'o'
      FieldName = 'TIPOPRECO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object cdsClientesENDERECOENTREGA: TStringField
      DisplayLabel = 'Endere'#231'o - Entrega'
      FieldName = 'ENDERECOENTREGA'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object cdsClientesNUMEROENTREGA: TStringField
      DisplayLabel = 'N'#250'mero - Entrega'
      DisplayWidth = 5
      FieldName = 'NUMEROENTREGA'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object cdsClientesCOMPLEMENTOENTREGA: TStringField
      DisplayLabel = 'Complemento - Entrega'
      FieldName = 'COMPLEMENTOENTREGA'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object cdsClientesUFENTREGA: TStringField
      DisplayLabel = 'UF - Entrega'
      FieldName = 'UFENTREGA'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object cdsClientesMUNICIPIOENTREGA: TStringField
      DisplayLabel = 'Munic'#237'pio - Entrega'
      FieldName = 'MUNICIPIOENTREGA'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cdsClientesBAIRROENTREGA: TStringField
      DisplayLabel = 'Bairro - Entrega'
      FieldName = 'BAIRROENTREGA'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cdsClientesCEPENTREGA: TStringField
      DisplayLabel = 'CEP - Entrega'
      FieldName = 'CEPENTREGA'
      ProviderFlags = [pfInUpdate]
      EditMask = '99999-999;0;_'
      Size = 8
    end
    object cdsClientesENDERECOCOBRANCA: TStringField
      DisplayLabel = 'Endere'#231'o - Cobran'#231'a'
      FieldName = 'ENDERECOCOBRANCA'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object cdsClientesNUMEROCOBRANCA: TStringField
      DisplayLabel = 'N'#250'mero - Cobran'#231'a'
      FieldName = 'NUMEROCOBRANCA'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object cdsClientesCOMPLEMENTOCOBRANCA: TStringField
      DisplayLabel = 'Complemento - Cobran'#231'a'
      FieldName = 'COMPLEMENTOCOBRANCA'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object cdsClientesUFCOBRANCA: TStringField
      DisplayLabel = 'UF - Cobran'#231'a'
      FieldName = 'UFCOBRANCA'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object cdsClientesMUNICIPIOCOBRANCA: TStringField
      DisplayLabel = 'Munic'#237'pio - Cobran'#231'a'
      FieldName = 'MUNICIPIOCOBRANCA'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cdsClientesBAIRROCOBRANCA: TStringField
      DisplayLabel = 'Bairro - Cobran'#231'a'
      FieldName = 'BAIRROCOBRANCA'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cdsClientesCEPCOBRANCA: TStringField
      DisplayLabel = 'CEP - Cobran'#231'a'
      FieldName = 'CEPCOBRANCA'
      ProviderFlags = [pfInUpdate]
      EditMask = '99999-999;0;_'
      Size = 8
    end
    object cdsClientesSUFRAMA: TStringField
      DisplayLabel = 'Suframa'
      FieldName = 'SUFRAMA'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object cdsClientesNOTIFICAEMAIL: TStringField
      DisplayLabel = 'Notifica por E-Mail'
      FieldName = 'NOTIFICAEMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsClientesEMAILNFE: TStringField
      DisplayLabel = 'Email p/ NF-e'
      FieldName = 'EMAILNFE'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object cdsClientesFORNECEDOR: TIntegerField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORNECEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object cdsClientesULTIMACONSULTA: TDateField
      DisplayLabel = #218'ltima Consulta'
      FieldName = 'ULTIMACONSULTA'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000;1;_'
    end
    object cdsClientesSTATUSCONSULTA: TStringField
      DisplayLabel = 'Status da Consulta'
      FieldName = 'STATUSCONSULTA'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object cdsClientesROTA: TStringField
      DisplayLabel = 'Rota'
      FieldName = 'ROTA'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object cdsClientesREGIAO: TStringField
      DisplayLabel = 'Regi'#227'o'
      FieldName = 'REGIAO'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object cdsClientesHASH: TStringField
      DisplayLabel = 'Hash Code'
      FieldName = 'HASH'
      ProviderFlags = [pfInUpdate]
      Size = 64
    end
    object cdsClientesDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data da Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dspcCad: TDSProviderConnection
    ServerClassName = 'TDSSMCad'
    SQLConnection = DSServer
    Left = 208
    Top = 8
  end
  object sqlClientes_Mysql: TSQLDataSet
    CommandText = 
      'select * from clientes where importado != 1 and customers_cpf_cn' +
      'pj is not null and customers_cpf_cnpj <> '#39#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = scnMysql
    Left = 656
    Top = 424
    object sqlClientes_Mysqlcustomers_id: TIntegerField
      FieldName = 'customers_id'
      Required = True
    end
    object sqlClientes_Mysqlcustomers_tipo_pessoa: TStringField
      FieldName = 'customers_tipo_pessoa'
      FixedChar = True
      Size = 1
    end
    object sqlClientes_Mysqlcustomers_status: TShortintField
      FieldName = 'customers_status'
      Required = True
    end
    object sqlClientes_Mysqlcustomers_grupo: TIntegerField
      FieldName = 'customers_grupo'
    end
    object sqlClientes_Mysqlcustomers_desconto: TSingleField
      FieldName = 'customers_desconto'
    end
    object sqlClientes_Mysqlcustomers_gender: TStringField
      FieldName = 'customers_gender'
      FixedChar = True
      Size = 1
    end
    object sqlClientes_Mysqlcustomers_firstname: TStringField
      FieldName = 'customers_firstname'
      Required = True
      Size = 40
    end
    object sqlClientes_Mysqlcustomers_lastname: TStringField
      FieldName = 'customers_lastname'
      Required = True
      Size = 40
    end
    object sqlClientes_Mysqlcustomers_cpf_cnpj: TStringField
      FieldName = 'customers_cpf_cnpj'
    end
    object sqlClientes_Mysqlcustomers_rg: TStringField
      FieldName = 'customers_rg'
      Size = 15
    end
    object sqlClientes_Mysqlcustomers_comoconheceu: TStringField
      FieldName = 'customers_comoconheceu'
      Size = 60
    end
    object sqlClientes_Mysqlcustomers_estadocivil: TStringField
      FieldName = 'customers_estadocivil'
    end
    object sqlClientes_Mysqlcustomers_dob: TDateField
      FieldName = 'customers_dob'
    end
    object sqlClientes_Mysqlcustomers_email_address: TStringField
      FieldName = 'customers_email_address'
      Required = True
      Size = 96
    end
    object sqlClientes_Mysqlcustomers_default_address_id: TIntegerField
      FieldName = 'customers_default_address_id'
      Required = True
    end
    object sqlClientes_Mysqlcustomers_ddd1: TIntegerField
      FieldName = 'customers_ddd1'
    end
    object sqlClientes_Mysqlcustomers_telephone: TStringField
      FieldName = 'customers_telephone'
      Size = 10
    end
    object sqlClientes_Mysqlcustomers_ddd2: TIntegerField
      FieldName = 'customers_ddd2'
    end
    object sqlClientes_Mysqlcustomers_fax: TStringField
      FieldName = 'customers_fax'
      Size = 10
    end
    object sqlClientes_Mysqlcustomers_ddd3: TIntegerField
      FieldName = 'customers_ddd3'
    end
    object sqlClientes_Mysqlcustomers_celular: TStringField
      FieldName = 'customers_celular'
      Size = 10
    end
    object sqlClientes_Mysqlcustomers_password: TStringField
      FieldName = 'customers_password'
      Required = True
      Size = 40
    end
    object sqlClientes_Mysqlcustomers_newsletter: TStringField
      FieldName = 'customers_newsletter'
      FixedChar = True
      Size = 1
    end
    object sqlClientes_Mysqlcustomers_prazo_boleto: TIntegerField
      FieldName = 'customers_prazo_boleto'
    end
    object sqlClientes_Mysqlcustomers_newsletter_enviado: TShortintField
      FieldName = 'customers_newsletter_enviado'
    end
    object sqlClientes_Mysqlcustomers_num_orders: TShortintField
      FieldName = 'customers_num_orders'
    end
    object sqlClientes_Mysqlcustomers_credit: TSingleField
      FieldName = 'customers_credit'
      Required = True
    end
    object sqlClientes_Mysqlcustomers_info_date_of_last_logon: TSQLTimeStampField
      FieldName = 'customers_info_date_of_last_logon'
    end
    object sqlClientes_Mysqlcustomers_info_number_of_logons: TIntegerField
      FieldName = 'customers_info_number_of_logons'
    end
    object sqlClientes_Mysqlcustomers_info_date_account_created: TSQLTimeStampField
      FieldName = 'customers_info_date_account_created'
    end
    object sqlClientes_Mysqlcustomers_info_date_account_last_modified: TSQLTimeStampField
      FieldName = 'customers_info_date_account_last_modified'
    end
    object sqlClientes_Mysqlglobal_product_notifications: TShortintField
      FieldName = 'global_product_notifications'
    end
    object sqlClientes_Mysqlcustomers_last_ip: TStringField
      FieldName = 'customers_last_ip'
    end
    object sqlClientes_MysqlImportado: TIntegerField
      FieldName = 'Importado'
    end
  end
  object dspcServer: TDSProviderConnection
    ServerClassName = 'TDSSMLan'
    SQLConnection = DSServer
    Left = 120
    Top = 8
  end
  object sqlPedidos_Mysql_Clientes: TSQLDataSet
    CommandText = 'select * from clientes'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = scnMysql
    Left = 648
    Top = 184
    object sqlPedidos_Mysql_Clientescustomers_id: TIntegerField
      FieldName = 'customers_id'
      Required = True
    end
    object sqlPedidos_Mysql_Clientescustomers_tipo_pessoa: TStringField
      FieldName = 'customers_tipo_pessoa'
      FixedChar = True
      Size = 1
    end
    object sqlPedidos_Mysql_Clientescustomers_status: TShortintField
      FieldName = 'customers_status'
      Required = True
    end
    object sqlPedidos_Mysql_Clientescustomers_grupo: TIntegerField
      FieldName = 'customers_grupo'
    end
    object sqlPedidos_Mysql_Clientescustomers_desconto: TSingleField
      FieldName = 'customers_desconto'
    end
    object sqlPedidos_Mysql_Clientescustomers_gender: TStringField
      FieldName = 'customers_gender'
      FixedChar = True
      Size = 1
    end
    object sqlPedidos_Mysql_Clientescustomers_firstname: TStringField
      FieldName = 'customers_firstname'
      Required = True
      Size = 40
    end
    object sqlPedidos_Mysql_Clientescustomers_lastname: TStringField
      FieldName = 'customers_lastname'
      Required = True
      Size = 40
    end
    object sqlPedidos_Mysql_Clientescustomers_cpf_cnpj: TStringField
      FieldName = 'customers_cpf_cnpj'
    end
    object sqlPedidos_Mysql_Clientescustomers_rg: TStringField
      FieldName = 'customers_rg'
      Size = 15
    end
    object sqlPedidos_Mysql_Clientescustomers_comoconheceu: TStringField
      FieldName = 'customers_comoconheceu'
      Size = 60
    end
    object sqlPedidos_Mysql_Clientescustomers_estadocivil: TStringField
      FieldName = 'customers_estadocivil'
    end
    object sqlPedidos_Mysql_Clientescustomers_dob: TDateField
      FieldName = 'customers_dob'
    end
    object sqlPedidos_Mysql_Clientescustomers_email_address: TStringField
      FieldName = 'customers_email_address'
      Required = True
      Size = 96
    end
    object sqlPedidos_Mysql_Clientescustomers_default_address_id: TIntegerField
      FieldName = 'customers_default_address_id'
      Required = True
    end
    object sqlPedidos_Mysql_Clientescustomers_ddd1: TIntegerField
      FieldName = 'customers_ddd1'
    end
    object sqlPedidos_Mysql_Clientescustomers_telephone: TStringField
      FieldName = 'customers_telephone'
      Size = 10
    end
    object sqlPedidos_Mysql_Clientescustomers_ddd2: TIntegerField
      FieldName = 'customers_ddd2'
    end
    object sqlPedidos_Mysql_Clientescustomers_fax: TStringField
      FieldName = 'customers_fax'
      Size = 10
    end
    object sqlPedidos_Mysql_Clientescustomers_ddd3: TIntegerField
      FieldName = 'customers_ddd3'
    end
    object sqlPedidos_Mysql_Clientescustomers_celular: TStringField
      FieldName = 'customers_celular'
      Size = 10
    end
    object sqlPedidos_Mysql_Clientescustomers_password: TStringField
      FieldName = 'customers_password'
      Required = True
      Size = 40
    end
    object sqlPedidos_Mysql_Clientescustomers_newsletter: TStringField
      FieldName = 'customers_newsletter'
      FixedChar = True
      Size = 1
    end
    object sqlPedidos_Mysql_Clientescustomers_prazo_boleto: TIntegerField
      FieldName = 'customers_prazo_boleto'
    end
    object sqlPedidos_Mysql_Clientescustomers_newsletter_enviado: TShortintField
      FieldName = 'customers_newsletter_enviado'
    end
    object sqlPedidos_Mysql_Clientescustomers_num_orders: TShortintField
      FieldName = 'customers_num_orders'
    end
    object sqlPedidos_Mysql_Clientescustomers_credit: TSingleField
      FieldName = 'customers_credit'
      Required = True
    end
    object sqlPedidos_Mysql_Clientescustomers_info_date_of_last_logon: TSQLTimeStampField
      FieldName = 'customers_info_date_of_last_logon'
    end
    object sqlPedidos_Mysql_Clientescustomers_info_number_of_logons: TIntegerField
      FieldName = 'customers_info_number_of_logons'
    end
    object sqlPedidos_Mysql_Clientescustomers_info_date_account_created: TSQLTimeStampField
      FieldName = 'customers_info_date_account_created'
    end
    object sqlPedidos_Mysql_Clientescustomers_info_date_account_last_modified: TSQLTimeStampField
      FieldName = 'customers_info_date_account_last_modified'
    end
    object sqlPedidos_Mysql_Clientesglobal_product_notifications: TShortintField
      FieldName = 'global_product_notifications'
    end
    object sqlPedidos_Mysql_Clientescustomers_last_ip: TStringField
      FieldName = 'customers_last_ip'
    end
    object sqlPedidos_Mysql_ClientesImportado: TIntegerField
      FieldName = 'Importado'
    end
  end
  object dspPedidos_Mysql_Clientes: TDataSetProvider
    DataSet = sqlPedidos_Mysql_Clientes
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 648
    Top = 240
  end
  object cdsPedidos_Mysql_Clientes: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'customers_id'
    MasterFields = 'customers_id'
    MasterSource = dtsPedidos_MySql_Dados
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspPedidos_Mysql_Clientes'
    Left = 648
    Top = 296
    object cdsPedidos_Mysql_Clientescustomers_id: TIntegerField
      FieldName = 'customers_id'
      Required = True
    end
    object cdsPedidos_Mysql_Clientescustomers_tipo_pessoa: TStringField
      FieldName = 'customers_tipo_pessoa'
      FixedChar = True
      Size = 1
    end
    object cdsPedidos_Mysql_Clientescustomers_status: TShortintField
      FieldName = 'customers_status'
      Required = True
    end
    object cdsPedidos_Mysql_Clientescustomers_grupo: TIntegerField
      FieldName = 'customers_grupo'
    end
    object cdsPedidos_Mysql_Clientescustomers_desconto: TSingleField
      FieldName = 'customers_desconto'
    end
    object cdsPedidos_Mysql_Clientescustomers_gender: TStringField
      FieldName = 'customers_gender'
      FixedChar = True
      Size = 1
    end
    object cdsPedidos_Mysql_Clientescustomers_firstname: TStringField
      FieldName = 'customers_firstname'
      Required = True
      Size = 40
    end
    object cdsPedidos_Mysql_Clientescustomers_lastname: TStringField
      FieldName = 'customers_lastname'
      Required = True
      Size = 40
    end
    object cdsPedidos_Mysql_Clientescustomers_cpf_cnpj: TStringField
      FieldName = 'customers_cpf_cnpj'
    end
    object cdsPedidos_Mysql_Clientescustomers_rg: TStringField
      FieldName = 'customers_rg'
      Size = 15
    end
    object cdsPedidos_Mysql_Clientescustomers_comoconheceu: TStringField
      FieldName = 'customers_comoconheceu'
      Size = 60
    end
    object cdsPedidos_Mysql_Clientescustomers_estadocivil: TStringField
      FieldName = 'customers_estadocivil'
    end
    object cdsPedidos_Mysql_Clientescustomers_dob: TDateField
      FieldName = 'customers_dob'
    end
    object cdsPedidos_Mysql_Clientescustomers_email_address: TStringField
      FieldName = 'customers_email_address'
      Required = True
      Size = 96
    end
    object cdsPedidos_Mysql_Clientescustomers_default_address_id: TIntegerField
      FieldName = 'customers_default_address_id'
      Required = True
    end
    object cdsPedidos_Mysql_Clientescustomers_ddd1: TIntegerField
      FieldName = 'customers_ddd1'
    end
    object cdsPedidos_Mysql_Clientescustomers_telephone: TStringField
      FieldName = 'customers_telephone'
      Size = 10
    end
    object cdsPedidos_Mysql_Clientescustomers_ddd2: TIntegerField
      FieldName = 'customers_ddd2'
    end
    object cdsPedidos_Mysql_Clientescustomers_fax: TStringField
      FieldName = 'customers_fax'
      Size = 10
    end
    object cdsPedidos_Mysql_Clientescustomers_ddd3: TIntegerField
      FieldName = 'customers_ddd3'
    end
    object cdsPedidos_Mysql_Clientescustomers_celular: TStringField
      FieldName = 'customers_celular'
      Size = 10
    end
    object cdsPedidos_Mysql_Clientescustomers_password: TStringField
      FieldName = 'customers_password'
      Required = True
      Size = 40
    end
    object cdsPedidos_Mysql_Clientescustomers_newsletter: TStringField
      FieldName = 'customers_newsletter'
      FixedChar = True
      Size = 1
    end
    object cdsPedidos_Mysql_Clientescustomers_prazo_boleto: TIntegerField
      FieldName = 'customers_prazo_boleto'
    end
    object cdsPedidos_Mysql_Clientescustomers_newsletter_enviado: TShortintField
      FieldName = 'customers_newsletter_enviado'
    end
    object cdsPedidos_Mysql_Clientescustomers_num_orders: TShortintField
      FieldName = 'customers_num_orders'
    end
    object cdsPedidos_Mysql_Clientescustomers_credit: TSingleField
      FieldName = 'customers_credit'
      Required = True
    end
    object cdsPedidos_Mysql_Clientescustomers_info_date_of_last_logon: TSQLTimeStampField
      FieldName = 'customers_info_date_of_last_logon'
    end
    object cdsPedidos_Mysql_Clientescustomers_info_number_of_logons: TIntegerField
      FieldName = 'customers_info_number_of_logons'
    end
    object cdsPedidos_Mysql_Clientescustomers_info_date_account_created: TSQLTimeStampField
      FieldName = 'customers_info_date_account_created'
    end
    object cdsPedidos_Mysql_Clientescustomers_info_date_account_last_modified: TSQLTimeStampField
      FieldName = 'customers_info_date_account_last_modified'
    end
    object cdsPedidos_Mysql_Clientesglobal_product_notifications: TShortintField
      FieldName = 'global_product_notifications'
    end
    object cdsPedidos_Mysql_Clientescustomers_last_ip: TStringField
      FieldName = 'customers_last_ip'
    end
    object cdsPedidos_Mysql_ClientesImportado: TIntegerField
      FieldName = 'Importado'
    end
  end
  object sqlAux: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = scnMysql
    Left = 808
    Top = 120
  end
  object sqlProdutos: TSQLDataSet
    SchemaName = 'iset_39959'
    CommandText = 'select * from produtos'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = scnMysql
    Left = 680
    Top = 8
    object sqlProdutosproducts_id: TIntegerField
      FieldName = 'products_id'
      Required = True
    end
    object sqlProdutosproducts_cod_ref: TStringField
      FieldName = 'products_cod_ref'
      Size = 100
    end
    object sqlProdutosproducts_name: TStringField
      FieldName = 'products_name'
      Required = True
      Size = 200
    end
    object sqlProdutosproducts_description: TMemoField
      FieldName = 'products_description'
      BlobType = ftMemo
      Size = 1
    end
    object sqlProdutosproducts_description2: TStringField
      FieldName = 'products_description2'
      Size = 255
    end
    object sqlProdutosproducts_quantity: TIntegerField
      FieldName = 'products_quantity'
      Required = True
    end
    object sqlProdutosproducts_price: TSingleField
      FieldName = 'products_price'
    end
  end
  object dspProdutos: TDataSetProvider
    DataSet = sqlProdutos
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 800
    Top = 72
  end
  object cdsProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutos'
    Left = 704
    Top = 48
    object cdsProdutosproducts_id: TIntegerField
      FieldName = 'products_id'
      Required = True
    end
    object cdsProdutosproducts_cod_ref: TStringField
      FieldName = 'products_cod_ref'
      Size = 100
    end
    object cdsProdutosproducts_name: TStringField
      FieldName = 'products_name'
      Required = True
      Size = 200
    end
    object cdsProdutosproducts_description: TMemoField
      FieldName = 'products_description'
      BlobType = ftMemo
      Size = 1
    end
    object cdsProdutosproducts_description2: TStringField
      FieldName = 'products_description2'
      Size = 255
    end
    object cdsProdutosproducts_quantity: TIntegerField
      FieldName = 'products_quantity'
      Required = True
    end
    object cdsProdutosproducts_price: TSingleField
      FieldName = 'products_price'
    end
  end
  object dspClientes_Mysql: TDataSetProvider
    DataSet = sqlClientes_Mysql
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 656
    Top = 472
  end
  object cdsClientes_Mysql: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClientes_Mysql'
    Left = 656
    Top = 528
    object cdsClientes_Mysqlcustomers_id: TIntegerField
      FieldName = 'customers_id'
      Required = True
    end
    object cdsClientes_Mysqlcustomers_tipo_pessoa: TStringField
      FieldName = 'customers_tipo_pessoa'
      FixedChar = True
      Size = 1
    end
    object cdsClientes_Mysqlcustomers_status: TShortintField
      FieldName = 'customers_status'
      Required = True
    end
    object cdsClientes_Mysqlcustomers_grupo: TIntegerField
      FieldName = 'customers_grupo'
    end
    object cdsClientes_Mysqlcustomers_desconto: TSingleField
      FieldName = 'customers_desconto'
    end
    object cdsClientes_Mysqlcustomers_gender: TStringField
      FieldName = 'customers_gender'
      FixedChar = True
      Size = 1
    end
    object cdsClientes_Mysqlcustomers_firstname: TStringField
      FieldName = 'customers_firstname'
      Required = True
      Size = 40
    end
    object cdsClientes_Mysqlcustomers_lastname: TStringField
      FieldName = 'customers_lastname'
      Required = True
      Size = 40
    end
    object cdsClientes_Mysqlcustomers_cpf_cnpj: TStringField
      FieldName = 'customers_cpf_cnpj'
    end
    object cdsClientes_Mysqlcustomers_rg: TStringField
      FieldName = 'customers_rg'
      Size = 15
    end
    object cdsClientes_Mysqlcustomers_comoconheceu: TStringField
      FieldName = 'customers_comoconheceu'
      Size = 60
    end
    object cdsClientes_Mysqlcustomers_estadocivil: TStringField
      FieldName = 'customers_estadocivil'
    end
    object cdsClientes_Mysqlcustomers_dob: TDateField
      FieldName = 'customers_dob'
    end
    object cdsClientes_Mysqlcustomers_email_address: TStringField
      FieldName = 'customers_email_address'
      Required = True
      Size = 96
    end
    object cdsClientes_Mysqlcustomers_default_address_id: TIntegerField
      FieldName = 'customers_default_address_id'
      Required = True
    end
    object cdsClientes_Mysqlcustomers_ddd1: TIntegerField
      FieldName = 'customers_ddd1'
    end
    object cdsClientes_Mysqlcustomers_telephone: TStringField
      FieldName = 'customers_telephone'
      Size = 10
    end
    object cdsClientes_Mysqlcustomers_ddd2: TIntegerField
      FieldName = 'customers_ddd2'
    end
    object cdsClientes_Mysqlcustomers_fax: TStringField
      FieldName = 'customers_fax'
      Size = 10
    end
    object cdsClientes_Mysqlcustomers_ddd3: TIntegerField
      FieldName = 'customers_ddd3'
    end
    object cdsClientes_Mysqlcustomers_celular: TStringField
      FieldName = 'customers_celular'
      Size = 10
    end
    object cdsClientes_Mysqlcustomers_password: TStringField
      FieldName = 'customers_password'
      Required = True
      Size = 40
    end
    object cdsClientes_Mysqlcustomers_newsletter: TStringField
      FieldName = 'customers_newsletter'
      FixedChar = True
      Size = 1
    end
    object cdsClientes_Mysqlcustomers_prazo_boleto: TIntegerField
      FieldName = 'customers_prazo_boleto'
    end
    object cdsClientes_Mysqlcustomers_newsletter_enviado: TShortintField
      FieldName = 'customers_newsletter_enviado'
    end
    object cdsClientes_Mysqlcustomers_num_orders: TShortintField
      FieldName = 'customers_num_orders'
    end
    object cdsClientes_Mysqlcustomers_credit: TSingleField
      FieldName = 'customers_credit'
      Required = True
    end
    object cdsClientes_Mysqlcustomers_info_date_of_last_logon: TSQLTimeStampField
      FieldName = 'customers_info_date_of_last_logon'
    end
    object cdsClientes_Mysqlcustomers_info_number_of_logons: TIntegerField
      FieldName = 'customers_info_number_of_logons'
    end
    object cdsClientes_Mysqlcustomers_info_date_account_created: TSQLTimeStampField
      FieldName = 'customers_info_date_account_created'
    end
    object cdsClientes_Mysqlcustomers_info_date_account_last_modified: TSQLTimeStampField
      FieldName = 'customers_info_date_account_last_modified'
    end
    object cdsClientes_Mysqlglobal_product_notifications: TShortintField
      FieldName = 'global_product_notifications'
    end
    object cdsClientes_Mysqlcustomers_last_ip: TStringField
      FieldName = 'customers_last_ip'
    end
    object cdsClientes_MysqlImportado: TIntegerField
      FieldName = 'Importado'
    end
  end
  object dtsClientes_Mysql: TDataSource
    DataSet = cdsClientes_Mysql
    Left = 656
    Top = 576
  end
  object cdsClientes_Endereco_Mysql: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'customers_id'
    MasterFields = 'customers_id'
    MasterSource = dtsClientes_Mysql
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspClientes_Endereco_Mysql'
    Left = 792
    Top = 528
    object cdsClientes_Endereco_Mysqladdress_book_id: TIntegerField
      FieldName = 'address_book_id'
      Required = True
    end
    object cdsClientes_Endereco_Mysqlcustomers_id: TIntegerField
      FieldName = 'customers_id'
      Required = True
    end
    object cdsClientes_Endereco_Mysqlentry_gender: TStringField
      FieldName = 'entry_gender'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsClientes_Endereco_Mysqlentry_company: TStringField
      FieldName = 'entry_company'
      Size = 60
    end
    object cdsClientes_Endereco_Mysqlentry_company_fantasia: TStringField
      FieldName = 'entry_company_fantasia'
      Size = 60
    end
    object cdsClientes_Endereco_Mysqlentry_inscricao_estadual: TStringField
      FieldName = 'entry_inscricao_estadual'
    end
    object cdsClientes_Endereco_Mysqlentry_empresa_atividade: TStringField
      FieldName = 'entry_empresa_atividade'
      Size = 100
    end
    object cdsClientes_Endereco_Mysqlentry_firstname: TStringField
      FieldName = 'entry_firstname'
      Required = True
      Size = 40
    end
    object cdsClientes_Endereco_Mysqlentry_lastname: TStringField
      FieldName = 'entry_lastname'
      Required = True
      Size = 40
    end
    object cdsClientes_Endereco_Mysqlentry_street_address: TStringField
      FieldName = 'entry_street_address'
      Required = True
      Size = 80
    end
    object cdsClientes_Endereco_Mysqlentry_street_number: TIntegerField
      FieldName = 'entry_street_number'
    end
    object cdsClientes_Endereco_Mysqlentry_street_complemento: TStringField
      FieldName = 'entry_street_complemento'
      Size = 50
    end
    object cdsClientes_Endereco_Mysqlentry_suburb: TStringField
      FieldName = 'entry_suburb'
      Size = 60
    end
    object cdsClientes_Endereco_Mysqlentry_postcode: TStringField
      FieldName = 'entry_postcode'
      Required = True
      Size = 10
    end
    object cdsClientes_Endereco_Mysqlentry_city: TStringField
      FieldName = 'entry_city'
      Required = True
      Size = 60
    end
    object cdsClientes_Endereco_Mysqlentry_country_id: TIntegerField
      FieldName = 'entry_country_id'
      Required = True
    end
    object cdsClientes_Endereco_Mysqlentry_zone_id: TIntegerField
      FieldName = 'entry_zone_id'
      Required = True
    end
  end
  object dspClientes_Endereco_Mysql: TDataSetProvider
    DataSet = sqlClientes_Endereco_Mysql
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 792
    Top = 472
  end
  object sqlClientes_Endereco_Mysql: TSQLDataSet
    CommandText = 'SELECT * FROM clientes_enderecos'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = scnMysql
    Left = 792
    Top = 424
    object sqlClientes_Endereco_Mysqladdress_book_id: TIntegerField
      FieldName = 'address_book_id'
      Required = True
    end
    object sqlClientes_Endereco_Mysqlcustomers_id: TIntegerField
      FieldName = 'customers_id'
      Required = True
    end
    object sqlClientes_Endereco_Mysqlentry_gender: TStringField
      FieldName = 'entry_gender'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlClientes_Endereco_Mysqlentry_company: TStringField
      FieldName = 'entry_company'
      Size = 60
    end
    object sqlClientes_Endereco_Mysqlentry_company_fantasia: TStringField
      FieldName = 'entry_company_fantasia'
      Size = 60
    end
    object sqlClientes_Endereco_Mysqlentry_inscricao_estadual: TStringField
      FieldName = 'entry_inscricao_estadual'
    end
    object sqlClientes_Endereco_Mysqlentry_empresa_atividade: TStringField
      FieldName = 'entry_empresa_atividade'
      Size = 100
    end
    object sqlClientes_Endereco_Mysqlentry_firstname: TStringField
      FieldName = 'entry_firstname'
      Required = True
      Size = 40
    end
    object sqlClientes_Endereco_Mysqlentry_lastname: TStringField
      FieldName = 'entry_lastname'
      Required = True
      Size = 40
    end
    object sqlClientes_Endereco_Mysqlentry_street_address: TStringField
      FieldName = 'entry_street_address'
      Required = True
      Size = 80
    end
    object sqlClientes_Endereco_Mysqlentry_street_number: TIntegerField
      FieldName = 'entry_street_number'
    end
    object sqlClientes_Endereco_Mysqlentry_street_complemento: TStringField
      FieldName = 'entry_street_complemento'
      Size = 50
    end
    object sqlClientes_Endereco_Mysqlentry_suburb: TStringField
      FieldName = 'entry_suburb'
      Size = 60
    end
    object sqlClientes_Endereco_Mysqlentry_postcode: TStringField
      FieldName = 'entry_postcode'
      Required = True
      Size = 10
    end
    object sqlClientes_Endereco_Mysqlentry_city: TStringField
      FieldName = 'entry_city'
      Required = True
      Size = 60
    end
    object sqlClientes_Endereco_Mysqlentry_country_id: TIntegerField
      FieldName = 'entry_country_id'
      Required = True
    end
    object sqlClientes_Endereco_Mysqlentry_zone_id: TIntegerField
      FieldName = 'entry_zone_id'
      Required = True
    end
  end
  object sqlEstados_Mysql: TSQLDataSet
    CommandText = 'SELECT * FROM estados'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = scnMysql
    Left = 936
    Top = 416
    object sqlEstados_Mysqlzone_id: TIntegerField
      FieldName = 'zone_id'
      Required = True
    end
    object sqlEstados_Mysqlzone_country_id: TIntegerField
      FieldName = 'zone_country_id'
      Required = True
    end
    object sqlEstados_Mysqlzone_code: TStringField
      FieldName = 'zone_code'
      Required = True
      Size = 32
    end
    object sqlEstados_Mysqlzone_name: TStringField
      FieldName = 'zone_name'
      Required = True
      Size = 32
    end
  end
  object cdsEstados_Mysql: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'zone_id'
    MasterFields = 'entry_zone_id'
    MasterSource = dtsClientes_Endereco_Mysql
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspEstados_Mysql'
    Left = 936
    Top = 528
    object cdsEstados_Mysqlzone_id: TIntegerField
      FieldName = 'zone_id'
      Required = True
    end
    object cdsEstados_Mysqlzone_country_id: TIntegerField
      FieldName = 'zone_country_id'
      Required = True
    end
    object cdsEstados_Mysqlzone_code: TStringField
      FieldName = 'zone_code'
      Required = True
      Size = 32
    end
    object cdsEstados_Mysqlzone_name: TStringField
      FieldName = 'zone_name'
      Required = True
      Size = 32
    end
  end
  object dspEstados_Mysql: TDataSetProvider
    DataSet = sqlEstados_Mysql
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 936
    Top = 472
  end
  object dtsClientes_Endereco_Mysql: TDataSource
    DataSet = cdsClientes_Endereco_Mysql
    Left = 792
    Top = 576
  end
  object cdsAuxiliar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAS_Auxiliar'
    RemoteServer = dspcLan
    Left = 680
    Top = 368
  end
  object Timer1: TTimer
    Left = 464
    Top = 112
  end
  object cdsProdutos_Cadastro: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA_GRUPOS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL_GRUPOS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspProdutos'
    RemoteServer = dspcCustoms
    BeforeOpen = cdsProdutos_CadastroBeforeOpen
    BeforePost = cdsClientesBeforePost
    Left = 216
    Top = 248
    object cdsProdutos_CadastroEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object cdsProdutos_CadastroFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsProdutos_CadastroSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsProdutos_CadastroCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsProdutos_CadastroINTERNO: TStringField
      DisplayLabel = 'C'#243'digo Interno'
      FieldName = 'INTERNO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cdsProdutos_CadastroDATACADASTRO: TDateField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATACADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object cdsProdutos_CadastroDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 80
    end
    object cdsProdutos_CadastroREDUZIDO: TStringField
      DisplayLabel = 'Nome Reduzido'
      FieldName = 'REDUZIDO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object cdsProdutos_CadastroGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutos_CadastroNOMEGRUPO: TStringField
      DisplayLabel = 'Nome do Grupo'
      DisplayWidth = 25
      FieldName = 'NOMEGRUPO'
      ProviderFlags = []
      Size = 25
    end
    object cdsProdutos_CadastroSUBGRUPO: TIntegerField
      DisplayLabel = 'SubGrupo'
      FieldName = 'SUBGRUPO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutos_CadastroFABRICANTE: TStringField
      DisplayLabel = 'Fabricante'
      FieldName = 'FABRICANTE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object cdsProdutos_CadastroMARCA: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object cdsProdutos_CadastroMODELO: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object cdsProdutos_CadastroORIGEMPRODUTO: TStringField
      DisplayLabel = 'Origem do Produto'
      FieldName = 'ORIGEMPRODUTO'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object cdsProdutos_CadastroNUMEROSERIE: TStringField
      DisplayLabel = 'N'#250'mero de S'#233'rie'
      FieldName = 'NUMEROSERIE'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object cdsProdutos_CadastroLOCALIZACAO: TStringField
      DisplayLabel = 'Localiza'#231#227'o'
      FieldName = 'LOCALIZACAO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object cdsProdutos_CadastroREGRAENTRADA: TIntegerField
      DisplayLabel = 'Regra Entrada'
      FieldName = 'REGRAENTRADA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutos_CadastroREGRASAIDA: TIntegerField
      DisplayLabel = 'Regra Sa'#237'da'
      FieldName = 'REGRASAIDA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutos_CadastroULTIMACOMPRA: TDateField
      DisplayLabel = 'Ultima Compra'
      FieldName = 'ULTIMACOMPRA'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000;1;_'
    end
    object cdsProdutos_CadastroULTIMOPRECO: TFloatField
      DisplayLabel = #218'ltimo Pre'#231'o'
      FieldName = 'ULTIMOPRECO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutos_CadastroULTIMOFORNECEDOR: TIntegerField
      DisplayLabel = #218'ltimo Fornecedor'
      FieldName = 'ULTIMOFORNECEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutos_CadastroCOMISSAO: TFloatField
      DisplayLabel = 'Comiss'#227'o'
      FieldName = 'COMISSAO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.0000%'
      EditFormat = '0.0000'
    end
    object cdsProdutos_CadastroSITUACAOTRIBUTARIA: TStringField
      DisplayLabel = 'Situa'#231#227'o Tribut'#225'ria'
      FieldName = 'SITUACAOTRIBUTARIA'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object cdsProdutos_CadastroORIGEMST: TStringField
      DisplayLabel = 'Origem do Produto (ST)'
      FieldName = 'ORIGEMST'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsProdutos_CadastroCLASSIFICACAOFISCAL: TStringField
      DisplayLabel = 'Classifica'#231#227'o Fiscal'
      DisplayWidth = 2
      FieldName = 'CLASSIFICACAOFISCAL'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object cdsProdutos_CadastroNCM: TStringField
      FieldName = 'NCM'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object cdsProdutos_CadastroCEST: TStringField
      FieldName = 'CEST'
      ProviderFlags = [pfInUpdate]
      Size = 7
    end
    object cdsProdutos_CadastroTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object cdsProdutos_CadastroPRIMEIRAUNIDADE: TStringField
      DisplayLabel = 'Primeira Unidade'
      FieldName = 'PRIMEIRAUNIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object cdsProdutos_CadastroLOCALPADRAO: TStringField
      DisplayLabel = 'Local Padr'#227'o'
      FieldName = 'LOCALPADRAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object cdsProdutos_CadastroSEGUNDAUNIDADE: TStringField
      DisplayLabel = 'Segunda Unidade'
      FieldName = 'SEGUNDAUNIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object cdsProdutos_CadastroTIPOCONVERSAO: TStringField
      DisplayLabel = 'Tipo Convers'#227'o'
      FieldName = 'TIPOCONVERSAO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsProdutos_CadastroFATORCONVERSAO: TFloatField
      DisplayLabel = 'Fator de Convers'#227'o'
      FieldName = 'FATORCONVERSAO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsProdutos_CadastroCUSTOPADRAO: TFloatField
      DisplayLabel = 'Custo Padr'#227'o'
      FieldName = 'CUSTOPADRAO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsProdutos_CadastroMOEDACUSTO: TStringField
      DisplayLabel = 'Moeda Custo'
      FieldName = 'MOEDACUSTO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsProdutos_CadastroCUSTOPADRAOMOEDA: TFloatField
      DisplayLabel = 'Custo Moeda'
      FieldName = 'CUSTOPADRAOMOEDA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsProdutos_CadastroULTIMACOTACAO: TFloatField
      DisplayLabel = #218'ltima Cota'#231#227'o'
      FieldName = 'ULTIMACOTACAO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsProdutos_CadastroPESOLIQUIDO: TFloatField
      DisplayLabel = 'Peso L'#237'quido'
      FieldName = 'PESOLIQUIDO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsProdutos_CadastroPESOBRUTO: TFloatField
      DisplayLabel = 'Peso Bruto'
      FieldName = 'PESOBRUTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsProdutos_CadastroCODIGOBARRAS: TStringField
      DisplayLabel = 'C'#243'digo Barras'
      DisplayWidth = 25
      FieldName = 'CODIGOBARRAS'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object cdsProdutos_CadastroOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object cdsProdutos_CadastroICMS: TFloatField
      FieldName = 'ICMS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object cdsProdutos_CadastroIPI: TFloatField
      FieldName = 'IPI'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object cdsProdutos_CadastroISS: TFloatField
      FieldName = 'ISS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object cdsProdutos_CadastroII: TFloatField
      FieldName = 'II'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object cdsProdutos_CadastroMARGEMLUCRO: TFloatField
      DisplayLabel = 'Margem Lucro'
      FieldName = 'MARGEMLUCRO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object cdsProdutos_CadastroTRIBUTOS: TFloatField
      DisplayLabel = 'Tributos'
      FieldName = 'TRIBUTOS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object cdsProdutos_CadastroFEDERAIS: TFloatField
      DisplayLabel = 'Federais'
      FieldName = 'FEDERAIS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object cdsProdutos_CadastroESTADUAIS: TFloatField
      DisplayLabel = 'Estaduais'
      FieldName = 'ESTADUAIS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object cdsProdutos_CadastroMUNICIPAIS: TFloatField
      DisplayLabel = 'Municipais'
      FieldName = 'MUNICIPAIS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object cdsProdutos_CadastroESTOQUESEGURANCA: TFloatField
      DisplayLabel = 'Estoque Seguran'#231'a'
      FieldName = 'ESTOQUESEGURANCA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object cdsProdutos_CadastroPONTOPEDIDO: TFloatField
      DisplayLabel = 'Ponto Pedido'
      FieldName = 'PONTOPEDIDO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object cdsProdutos_CadastroULTIMOINVENTARIO: TDateField
      DisplayLabel = 'Ultimo Invent'#225'rio'
      FieldName = 'ULTIMOINVENTARIO'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000;1;_'
    end
    object cdsProdutos_CadastroPINVENTARIO: TIntegerField
      DisplayLabel = 'Periodicidade Invent'#225'rio'
      FieldName = 'PINVENTARIO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutos_CadastroESTOQUEMINIMO: TFloatField
      DisplayLabel = 'Estoque M'#237'nimo'
      FieldName = 'ESTOQUEMINIMO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object cdsProdutos_CadastroESTOQUEMAXIMO: TFloatField
      DisplayLabel = 'Estoque M'#225'ximo'
      FieldName = 'ESTOQUEMAXIMO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object cdsProdutos_CadastroPRAZOENTREGA: TIntegerField
      DisplayLabel = 'Prazo de Entrega'
      FieldName = 'PRAZOENTREGA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutos_CadastroTIPOPRAZO: TStringField
      DisplayLabel = 'Tipo Prazo de Entrega'
      FieldName = 'TIPOPRAZO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsProdutos_CadastroLOTEECONOMICO: TFloatField
      DisplayLabel = 'Lote Econ'#244'mico'
      FieldName = 'LOTEECONOMICO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object cdsProdutos_CadastroLOTEMINIMO: TFloatField
      DisplayLabel = 'Lote M'#237'nimo'
      FieldName = 'LOTEMINIMO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object cdsProdutos_CadastroQUANTIDADEBASE: TFloatField
      DisplayLabel = 'Quantidade Base'
      FieldName = 'QUANTIDADEBASE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object cdsProdutos_CadastroPRODUCAOMINIMA: TFloatField
      DisplayLabel = 'Produ'#231#227'o M'#237'nima'
      FieldName = 'PRODUCAOMINIMA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object cdsProdutos_CadastroPRECOCUSTO1: TFloatField
      DisplayLabel = 'Pre'#231'o Custo 1'
      FieldName = 'PRECOCUSTO1'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsProdutos_CadastroPRECOCUSTO2: TFloatField
      DisplayLabel = 'Pre'#231'o Custo 2'
      FieldName = 'PRECOCUSTO2'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsProdutos_CadastroPRECOCUSTO3: TFloatField
      DisplayLabel = 'Pre'#231'o Custo 3'
      FieldName = 'PRECOCUSTO3'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsProdutos_CadastroPRECOCUSTO4: TFloatField
      DisplayLabel = 'Pre'#231'o Custo 4'
      FieldName = 'PRECOCUSTO4'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsProdutos_CadastroPRECOCUSTO5: TFloatField
      DisplayLabel = 'Pre'#231'o Custo 5'
      FieldName = 'PRECOCUSTO5'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsProdutos_CadastroPRECOCUSTO6: TFloatField
      DisplayLabel = 'Pre'#231'o Custo 6'
      FieldName = 'PRECOCUSTO6'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsProdutos_CadastroPRECOCUSTO7: TFloatField
      DisplayLabel = 'Pre'#231'o Custo 7'
      FieldName = 'PRECOCUSTO7'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsProdutos_CadastroPRECOCUSTO8: TFloatField
      DisplayLabel = 'Pre'#231'o Custo 8'
      FieldName = 'PRECOCUSTO8'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsProdutos_CadastroPRECOCUSTO9: TFloatField
      DisplayLabel = 'Pre'#231'o Custo 9'
      FieldName = 'PRECOCUSTO9'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsProdutos_CadastroPRECOCUSTO10: TFloatField
      DisplayLabel = 'Pre'#231'o Custo 10'
      FieldName = 'PRECOCUSTO10'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsProdutos_CadastroPRECOVENDA1: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 1'
      FieldName = 'PRECOVENDA1'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsProdutos_CadastroPRECOVENDA2: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 2'
      FieldName = 'PRECOVENDA2'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsProdutos_CadastroPRECOVENDA3: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 3'
      FieldName = 'PRECOVENDA3'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsProdutos_CadastroPRECOVENDA4: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 4'
      FieldName = 'PRECOVENDA4'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsProdutos_CadastroPRECOVENDA5: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 5'
      FieldName = 'PRECOVENDA5'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsProdutos_CadastroPRECOVENDA6: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 6'
      FieldName = 'PRECOVENDA6'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsProdutos_CadastroPRECOVENDA7: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 7'
      FieldName = 'PRECOVENDA7'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsProdutos_CadastroPRECOVENDA8: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 8'
      FieldName = 'PRECOVENDA8'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsProdutos_CadastroPRECOVENDA9: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 9'
      FieldName = 'PRECOVENDA9'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsProdutos_CadastroPRECOVENDA10: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 10'
      FieldName = 'PRECOVENDA10'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsProdutos_CadastroPRECOANTIGO1: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 01 - Antigo'
      FieldName = 'PRECOANTIGO1'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutos_CadastroPRECOANTIGO2: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 02 - Antigo'
      FieldName = 'PRECOANTIGO2'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutos_CadastroPRECOANTIGO3: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 03 - Antigo'
      FieldName = 'PRECOANTIGO3'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutos_CadastroPRECOANTIGO4: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 04 - Antigo'
      FieldName = 'PRECOANTIGO4'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutos_CadastroPRECOANTIGO5: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 05 - Antigo'
      FieldName = 'PRECOANTIGO5'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutos_CadastroPRECOANTIGO6: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 06 - Antigo'
      FieldName = 'PRECOANTIGO6'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutos_CadastroPRECOANTIGO7: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 07 - Antigo'
      FieldName = 'PRECOANTIGO7'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutos_CadastroPRECOANTIGO8: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 08 - Antigo'
      FieldName = 'PRECOANTIGO8'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutos_CadastroPRECOANTIGO9: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 09 - Antigo'
      FieldName = 'PRECOANTIGO9'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutos_CadastroPRECOANTIGO10: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 10 - Antigo'
      FieldName = 'PRECOANTIGO10'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutos_CadastroPRECOMINIMO: TFloatField
      DisplayLabel = 'Pre'#231'o M'#237'nimo'
      FieldName = 'PRECOMINIMO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsProdutos_CadastroPRECOMAXIMO: TFloatField
      DisplayLabel = 'Pre'#231'o M'#225'ximo'
      FieldName = 'PRECOMAXIMO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsProdutos_CadastroCORDESTAQUE: TIntegerField
      DisplayLabel = 'Cor de Destaque'
      FieldName = 'CORDESTAQUE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutos_CadastroIMAGEM: TStringField
      DisplayLabel = 'Imagem'
      FieldName = 'IMAGEM'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object cdsProdutos_CadastroCONTROLALOTE: TStringField
      DisplayLabel = 'Controla Lote?'
      FieldName = 'CONTROLALOTE'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsProdutos_CadastroREGRAMULTIPLO: TIntegerField
      DisplayLabel = 'Regra M'#250'ltiplo'
      FieldName = 'REGRAMULTIPLO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutos_CadastroULTIMAALTERACAOPRECO: TDateField
      DisplayLabel = #218'ltima Altera'#231#227'o de Pre'#231'o'
      FieldName = 'ULTIMAALTERACAOPRECO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutos_CadastroUSUARIOULTIMAALTERACAOPRECO: TIntegerField
      DisplayLabel = 'Usu'#225'rio - '#218'ltima Altera'#231#227'o de Pre'#231'o'
      FieldName = 'USUARIOULTIMAALTERACAOPRECO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutos_CadastroNROFCI: TStringField
      DisplayLabel = 'N'#250'mero FCI'
      FieldName = 'NROFCI'
      ProviderFlags = [pfInUpdate]
      Size = 32
    end
    object cdsProdutos_CadastroPERCENTUALFCI: TFloatField
      DisplayLabel = 'Percentual FCI'
      FieldName = 'PERCENTUALFCI'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object cdsProdutos_CadastroCOR: TStringField
      DisplayLabel = 'Cor'
      FieldName = 'COR'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object cdsProdutos_CadastroTAMANHO: TStringField
      DisplayLabel = 'Tamanho'
      FieldName = 'TAMANHO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object cdsProdutos_CadastroHASH: TStringField
      DisplayLabel = 'Hash Code'
      FieldName = 'HASH'
      ProviderFlags = [pfInUpdate]
      Size = 64
    end
    object cdsProdutos_CadastroINCLUIDO: TStringField
      DisplayLabel = 'Inclu'#237'do'
      FieldName = 'INCLUIDO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object cdsProdutos_CadastroALTERADO: TStringField
      DisplayLabel = 'Alterado'
      FieldName = 'ALTERADO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object cdsProdutos_CadastroDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data da Cria'#231#227'o '
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsProdutos_CadastroCODIGOSERVICOISS: TStringField
      FieldName = 'CODIGOSERVICOISS'
      Size = 4
    end
    object cdsProdutos_CadastroUFICMSST: TStringField
      FieldName = 'UFICMSST'
      Size = 30
    end
    object cdsProdutos_CadastroFOTO: TBlobField
      FieldName = 'FOTO'
      Size = 1
    end
    object cdsProdutos_CadastroITEMNOVO: TStringField
      FieldName = 'ITEMNOVO'
      Size = 1
    end
    object cdsProdutos_CadastroATIVO: TStringField
      FieldName = 'ATIVO'
      Size = 15
    end
    object cdsProdutos_CadastroNUMEROFCI: TStringField
      FieldName = 'NUMEROFCI'
    end
    object cdsProdutos_CadastroVALIDADEMINIMA: TIntegerField
      FieldName = 'VALIDADEMINIMA'
    end
    object cdsProdutos_CadastroTIPOPRAZOVALIDADEMINIMA: TStringField
      FieldName = 'TIPOPRAZOVALIDADEMINIMA'
      Size = 1
    end
    object cdsProdutos_CadastroVALIDADEMINIMAMARKUP: TIntegerField
      FieldName = 'VALIDADEMINIMAMARKUP'
    end
    object cdsProdutos_CadastroTIPOPRAZOVALIDADEMINIMAMARKUP: TStringField
      FieldName = 'TIPOPRAZOVALIDADEMINIMAMARKUP'
      Size = 1
    end
    object cdsProdutos_CadastroPRODUZIDO: TStringField
      FieldName = 'PRODUZIDO'
      Size = 1
    end
    object cdsProdutos_CadastroIDESTOQUE: TIntegerField
      FieldName = 'IDESTOQUE'
    end
  end
  object dspcCustoms: TDSProviderConnection
    ServerClassName = 'TDSSMCustoms'
    SQLConnection = DSServer
    Left = 208
    Top = 72
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DSServer
    Left = 216
    Top = 336
  end
end

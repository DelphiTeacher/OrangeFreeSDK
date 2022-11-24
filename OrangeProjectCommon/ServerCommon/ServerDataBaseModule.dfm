object dmServerDataBase: TdmServerDataBase
  Height = 296
  Width = 367
  object UniConnection1: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'alipay'
    SpecificOptions.Strings = (
      'MySQL.Charset=utf8mb4'
      'MySQL.UseUnicode=True')
    Username = 'root'
    Server = 'www.orangeui.cn'
    LoginPrompt = False
    Left = 64
    Top = 24
    EncryptedPassword = 'CEFFCCFFC7FFCAFFC8FFCAFF88FF9EFF91FF98FF91FF9AFF91FF98FF'
  end
  object kbmMWPooledSession1: TkbmMWPooledSession
    ConnectionPool = kbmMWUNIDACConnectionPool1
    AutoSessionName = False
    Left = 240
    Top = 112
  end
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 72
    Top = 120
  end
  object SQLiteUniProvider1: TSQLiteUniProvider
    Left = 72
    Top = 120
  end
  object kbmMWUNIDACConnectionPool1: TkbmMWUNIDACConnectionPool
    MaxConnections = 100
    Database = UniConnection1
    Left = 240
    Top = 24
  end
  object SQLServerUniProvider1: TSQLServerUniProvider
    Left = 72
    Top = 208
  end
end

object UniMainModule: TUniMainModule
  OldCreateOrder = False
  OnCreate = UniGUIMainModuleCreate
  MonitoredKeys.Keys = <>
  RTL = False
  Height = 542
  Width = 291
  object DataSource1: TDataSource
    DataSet = AppUsers
    Left = 24
    Top = 88
  end
  object DataSource2: TDataSource
    DataSet = Aliases
    Left = 24
    Top = 144
  end
  object WebLogs: TZReadOnlyQuery
    Connection = DataConnection
    SQL.Strings = (
      'select * from weblogs order by id desc;')
    Params = <>
    FetchRow = 100
    Left = 104
    Top = 208
  end
  object DataSource3: TDataSource
    DataSet = WebLogs
    Left = 24
    Top = 208
  end
  object InsertQ: TZQuery
    Connection = DataConnection
    Params = <>
    Left = 200
    Top = 88
  end
  object AppUsers: TZTable
    Connection = DataConnection
    TableName = 'users'
    Left = 104
    Top = 88
  end
  object Aliases: TZTable
    Connection = DataConnection
    TableName = 'aliases'
    Left = 104
    Top = 144
  end
  object SelectQ: TZReadOnlyQuery
    Connection = DataConnection
    Params = <>
    Left = 200
    Top = 144
  end
  object ReportGen: TZReadOnlyQuery
    Connection = DataConnection
    SQL.Strings = (
      
        'select weblogs.ip, count(weblogs.ip), aliases.description from w' +
        'eblogs, aliases'
      'where weblogs.ip=aliases.ip   '
      ' group by weblogs.ip  '
      'order by count(weblogs.ip) desc;')
    Params = <>
    FetchRow = 100
    Left = 104
    Top = 280
  end
  object DataSource4: TDataSource
    DataSet = ReportGen
    Left = 24
    Top = 280
  end
  object DataConnection: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    HostName = ''
    Port = 0
    Database = 'logger.db'
    User = ''
    Password = ''
    Protocol = 'mysql'
    Left = 24
    Top = 24
  end
  object DataSource5: TDataSource
    DataSet = DHCPLogsQuery
    Left = 24
    Top = 344
  end
  object DHCPLogsQuery: TZReadOnlyQuery
    Connection = DataConnection
    SQL.Strings = (
      
        'select * from dhcplogs where time>='#39'2012-07-11'#39' and time<='#39'2012-' +
        '07-11'#39';')
    Params = <>
    FetchRow = 100
    Left = 104
    Top = 344
  end
  object Settings: TZTable
    Connection = DataConnection
    TableName = 'settings'
    Left = 104
    Top = 416
  end
  object DataSource6: TDataSource
    DataSet = Settings
    Left = 32
    Top = 416
  end
end

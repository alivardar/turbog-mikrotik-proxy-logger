object TurboGMikrotikLogger: TTurboGMikrotikLogger
  OldCreateOrder = False
  AllowPause = False
  DisplayName = 'TurboG Mikrotik Logger'
  OnShutdown = UniGUIServiceShutdown
  OnStart = UniGUIServiceStart
  OnStop = UniGUIServiceStop
  Height = 404
  Width = 191
  object IdSyslogServer: TIdSyslogServer
    OnStatus = IdSyslogServerStatus
    Bindings = <>
    ThreadedEvent = True
    OnAfterBind = IdSyslogServerAfterBind
    OnSyslog = IdSyslogServerSyslog
    Left = 56
    Top = 16
  end
  object DataConnection: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16')
    AfterDisconnect = DataConnectionAfterDisconnect
    HostName = ''
    Port = 0
    Database = ''
    User = ''
    Password = ''
    Protocol = 'mysql-5'
    Left = 56
    Top = 64
  end
  object InsertQ: TZQuery
    Connection = DataConnection
    Params = <>
    Left = 56
    Top = 128
  end
  object TarihKontrol: TUniTimer
    OnTimer = TarihKontrolTimer
    Interval = 1800000
    Enabled = True
    RunOnce = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      '   '
      '}')
    Left = 56
    Top = 232
  end
  object SelectQ: TZReadOnlyQuery
    Connection = DataConnection
    Params = <>
    Left = 56
    Top = 184
  end
  object DHCPLogGenerator: TUniTimer
    OnTimer = DHCPLogGeneratorTimer
    Interval = 259200000
    Enabled = True
    RunOnce = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      '   '
      '}')
    Left = 56
    Top = 296
  end
end

program TurboGMikrotikLoggerServiceControl;

uses
  SvcMgr,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  Main in 'Main.pas' {MainForm: TUniForm},
  ServiceModule in 'ServiceModule.pas' {TurboGMikrotikLogger: TUniGUIService},
  AboutUnit in 'AboutUnit.pas' {About: TUniForm},
  LoginFormUnit in 'LoginFormUnit.pas' {LoginForm: TUniForm},
  AliasesUnit in 'AliasesUnit.pas' {Aliases: TUniForm},
  ApplicationUsersUnit in 'ApplicationUsersUnit.pas' {ApplicationUsers: TUniForm},
  UserBasedReportUnit in 'UserBasedReportUnit.pas' {UserBasedReport: TUniForm},
  Top100UsersUnit in 'Top100UsersUnit.pas' {Top100Users: TUniForm},
  Top100DomainsUnit in 'Top100DomainsUnit.pas' {Top100Domains: TUniForm},
  ayarunit in 'ayarunit.pas',
  DHCPLogsUnit in 'DHCPLogsUnit.pas' {DHCPLogsForm: TUniForm},
  SettingsUnit in 'SettingsUnit.pas' {SettingsForm: TUniForm};

{$R *.res}

begin

  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;

  Application.CreateForm(TTurboGMikrotikLogger, TurboGMikrotikLogger);
  Application.Run;
end.


#ifdef UNICODE
  #define isfiles "isfiles-unicode"
#else
  #define isfiles "isfiles"
#endif

[Setup]
AppName=TurboG Mikrotik Logger Services
AppId=TurboG Mikrotik Logger Services
AppVersion=2.2
AppPublisher=M.Ali VARDAR
AppPublisherURL=http://www.turbog.com/
AppSupportURL=http://forum.turbog.com/
AppUpdatesURL=http://www.turbog.com/
AppMutex=TurboGCompilerAppMutex,Global\TurboGCompilerAppMutex
DefaultDirName={pf}\TurboG Mikrotik Logger Services
DefaultGroupName=TurboG
AllowNoIcons=true
Compression=none
InternalCompressLevel=ultra
SolidCompression=true
Uninstallable=true
UninstallDisplayIcon={app}\favicon.ico
AppModifyPath="{app}\Ispack-TurboGMikrotikLogger.exe" /modify=1
WizardImageFile=compiler:WizModernImage-IS.bmp
WizardSmallImageFile=compiler:WizModernSmallImage-IS.bmp
SetupIconFile=D:\Projects\TurboGMikrotikLoggerService\favicon.ico
DisableWelcomePage=True
ShowLanguageDialog=no

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}

[Files]
Source: "C:\Program Files (x86)\ISTool\isxdl.dll"; Flags: dontcopy
Source: "D:\Projects\TurboGMikrotikLoggerService\autorestart.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projects\TurboGMikrotikLoggerService\config.ini"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projects\TurboGMikrotikLoggerService\debuglog.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projects\TurboGMikrotikLoggerService\favicon.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projects\TurboGMikrotikLoggerService\libmysql.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projects\TurboGMikrotikLoggerService\openwebman.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projects\TurboGMikrotikLoggerService\service_install.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projects\TurboGMikrotikLoggerService\service_uninstall.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projects\TurboGMikrotikLoggerService\TurboGMikrotikLoggerServiceControl.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projects\TurboGMikrotikLoggerService\ext-4.1.1a\*"; DestDir: "{app}\ext-4.1.1a\"; Flags: ignoreversion createallsubdirs recursesubdirs
Source: "D:\Projects\TurboGMikrotikLoggerService\editconfig.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projects\TurboGMikrotikLoggerService\MySQL_Database\latest.sql"; DestDir: "{app}\MySQL_Database"; Flags: ignoreversion
Source: "D:\Projects\TurboGMikrotikLoggerService\openreadme.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projects\TurboGMikrotikLoggerService\ReadMe.txt"; DestDir: "{app}"; Flags: ignoreversion

[UninstallDelete]
Type: filesandordirs; Name: {app}
Type: files; Name: {app}\TurboGApps.url

[UninstallRun]
Filename: {app}\TurboGMikrotikLoggerServiceControl.exe; Parameters: /uninstall /silent; RunOnceId: RemoveISSAssoc

[Run]
Filename: "{app}\TurboGMikrotikLoggerServiceControl.exe"; Parameters: "/install /silent"
Filename: "{app}\editconfig.bat"
Filename: "{app}\openreadme.bat"

[Icons]
Name: {group}\{cm:UninstallProgram, TurboG Mikrotik Logger}; Filename: {uninstallexe}

[INI]
Filename: {app}\TurboGApps.url; Section: InternetShortcut; Key: URL; String: http://www.turbog.com/

[Messages]
ButtonOK=Application using MySQL server for store logs. After installation MySQL configuration need to be correctly in config.ini file.

[ThirdParty]
CompileLogMethod=append



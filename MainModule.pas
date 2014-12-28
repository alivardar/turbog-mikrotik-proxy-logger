unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, DB, ZAbstractRODataset, ZDataset,
  ZAbstractConnection, ZConnection, ZAbstractDataset, ZAbstractTable, Controls,
  uniGUIBaseClasses, uniGUIClasses, uniBasicGrid, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdSMTP, uniTimer, IdUDPBase, IdUDPServer,
  IdSysLogServer, IdSysLogMessage, IdSocketHandle, IniFiles;

type
  TUniMainModule = class(TUniGUIMainModule)
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    WebLogs: TZReadOnlyQuery;
    DataSource3: TDataSource;
    InsertQ: TZQuery;
    AppUsers: TZTable;
    Aliases: TZTable;
    SelectQ: TZReadOnlyQuery;
    ReportGen: TZReadOnlyQuery;
    DataSource4: TDataSource;
    DataConnection: TZConnection;
    DataSource5: TDataSource;
    DHCPLogsQuery: TZReadOnlyQuery;
    Settings: TZTable;
    DataSource6: TDataSource;
    procedure UniGUIMainModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UniMainModule: TUniMainModule;

var
LoginFormActive : Boolean;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication, AboutUnit, ServiceModule, ayarunit;

function UniMainModule: TUniMainModule;
begin
  Result := TUniMainModule(UniApplication.UniMainModule)
end;


 function GetToken(Cadena,Separador:string;Token:integer):string;
 var
 Posicion:integer;
 begin
 while Token > 1 do begin
 Delete(Cadena,1,Pos(Separador,Cadena));
 Dec(Token);
 end;
 Posicion:=Pos(Separador,Cadena);
 if Posicion=0
 then result:=cadena
 else Result:=Copy(Cadena,1,Posicion-Length(Separador));
 end;

procedure WriteToLog(log:String);
var
   LogFileName : string;
   LogFile : TextFile;
   LogData: String;
begin

    LogFileName:=ExtractFilePath( paramstr(0) )+'debuglog.txt';

    AssignFile(LogFile, LogFileName);
    if FileExists(LogFileName) then
     Append(LogFile)
   else
     Rewrite(LogFile);

   try
     LogData := Format('%s : %s',[DateTimeToStr(Now), Log]) ;
     WriteLn(LogFile, LogData) ;
   finally
     CloseFile(LogFile)
   end;

end; //end proc


//procedure end

procedure TUniMainModule.UniGUIMainModuleCreate(Sender: TObject);
var
sql: String;
begin

try
   WorkDir:=ExtractFilePath( ParamStr(0) );
   SetCurrentDir (ExtractFileDir(ParamStr(0)));

   IniFileName:=Workdir+'config.ini';
   INIDosya := TIniFile.Create( IniFileName );

   //MySql Settings
   SQLHostName := INIDosya.ReadString('General','SQLHostName','');
   SQLUserName := INIDosya.ReadString('General','SQLUserName','');
   SQLPassword := INIDosya.ReadString('General','SQLPassword','');
   SQLDatabaseName := INIDosya.ReadString('General','SQLDatabaseName','');


   //Mail settings
   SMTPHostName := INIDosya.ReadString('General','SMTPHostName','');
   SMTPUser := INIDosya.ReadString('General','SMTPUser','');
   SMTPPassword := INIDosya.ReadString('General','SMTPPassword','');
   SMTPPort := INIDosya.ReadString('General','SMTPPort','');

   IPBind := INIDosya.ReadString('General','IPBind','0.0.0.0');
   SysLogPort:=INIDosya.ReadString('General','SysLogPort','514');
   ThemeName:=INIDosya.ReadString('General','ThemeName','classic');
   WWWPort:=INIDosya.ReadString('General','WWWPort','8077');

   INIDosya.Free;
except
    WriteToLog('Configuration read error. Please check your settings!');
end;

//Database operations
try
  DataConnection.Connected:=False;
  DataConnection.Protocol:='mysql-5';
  DataConnection.HostName:=SQLHostName;
  DataConnection.User:=SQLUserName;
  DataConnection.Password:=SQLPassword;
  DataConnection.Database:=SQLDatabaseName;
  DataConnection.Connected:=True;

  AppUsers.Open;
  Settings.Open;
  Aliases.Open;

except
  WriteToLog('Database settings error please check your settings!');
end;

try
UniMainModule.Theme:=ThemeName;
UniMainModule.AppUsers.Active:=True;
UniMainModule.Aliases.Active:=True;
UniMainModule.WebLogs.Open;
except
  WriteToLog('Error on settings apply!');
end;

end;

initialization
  RegisterMainModuleClass(TUniMainModule);
end.

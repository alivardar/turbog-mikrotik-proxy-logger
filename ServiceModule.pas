unit ServiceModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs,
  uniGUIService, ZAbstractConnection, ZConnection, IdBaseComponent, IdComponent,
  IdUDPBase, IdUDPServer, IdSysLogServer,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdSMTP, uniTimer,
  IdSysLogMessage, IdSocketHandle, IniFiles, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, uniGUIClasses;

type
  TTurboGMikrotikLogger = class(TUniGUIService)
    IdSyslogServer: TIdSyslogServer;
    DataConnection: TZConnection;
    InsertQ: TZQuery;
    TarihKontrol: TUniTimer;
    SelectQ: TZReadOnlyQuery;
    DHCPLogGenerator: TUniTimer;
    procedure IdSyslogServerStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: string);
    procedure UniGUIServiceStart(Sender: TService; var Started: Boolean);
    procedure UniGUIServiceStop(Sender: TService; var Stopped: Boolean);
    procedure UniGUIServiceShutdown(Sender: TService);
    procedure DataConnectionAfterDisconnect(Sender: TObject);
    procedure TarihKontrolTimer(Sender: TObject);
    procedure DHCPLogGeneratorTimer(Sender: TObject);
    procedure IdSyslogServerSyslog(Sender: TObject;
      ASysLogMessage: TIdSysLogMessage; ABinding: TIdSocketHandle);
    procedure IdSyslogServerAfterBind(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure InitService; override;
  public
    { Public declarations }
    function GetServiceController: TServiceController; override;
  end;

var
  TurboGMikrotikLogger: TTurboGMikrotikLogger;
  PrgUsername : String;

   //SQL Server
  SQLProtocol : String;
  SQLHostName : String;
  SQLUserName : String;
  SQLPassword : String;
  SQLDatabaseName : String;

  //Mail Server
  SMTPHostName : String;
  SMTPUser  : String;
  SMTPPassword : String;
  SMTPPort : String;

  //General
  AppLang : String;
  SendEmailonAlarm : String;

  WorkDir: String;
  IniFileName:String;
  INIDosya : TIniFile;
  IPBind: String;
  SysLogPort : String;
  ThemeName : String;
  WWWPort : String;
  DashDisplayRecord:String;

implementation

{$R *.dfm}

uses
  UniGUIVars, AliasesUnit, ServerModule, MainModule,  ayarunit;

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

    LogFileName:=ExtractFilePath(Paramstr(0))+'debuglog.txt';

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

end; //enf proc


procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  TurboGMikrotikLogger.Controller(CtrlCode);
end;

procedure TTurboGMikrotikLogger.DataConnectionAfterDisconnect(
  Sender: TObject);
begin
if TurboGMikrotikLogger.DataConnection.Connected=False then
  TurboGMikrotikLogger.DataConnection.Connected:=True;
end;

procedure TTurboGMikrotikLogger.DHCPLogGeneratorTimer(Sender: TObject);
var
   LogFileName : string;
   LogFile : TextFile;
   LogData: String;
   Dizin : String;
   db_ip, db_mac, db_kind : String;
   db_time : TDateTime;

   myDate : TDateTime;
   myYear, myMonth, myDay : Word;

begin

  WriteToLog('Daily DHCP logs started! ');

  SelectQ.Close;
  SelectQ.SQL.Clear;
  SelectQ.SQL.Add( 'select dhcp_log_dir from settings;' );
  SelectQ.Open;
  Dizin:=SelectQ.FieldByName('dhcp_log_dir').AsString;

  SelectQ.Close;
  SelectQ.SQL.Clear;
  SelectQ.SQL.Add( 'select * from dhcplogs where time<'''+  FormatDateTime('yyyy-MM-dd', Now+1 )+
  ''' and time>'''+   FormatDateTime('yyyy-MM-dd', Now-1 ) +''' order by time; ' );
  SelectQ.Open;

  myDate:=now;
  DecodeDate(myDate, myYear, myMonth, myDay);
  LogFileName:=Dizin+'\'+ IntToStr(myYear)+'_'+IntToStr(myMonth)+'_'+IntToStr(myDay)+'_daily_auto.txt';

    AssignFile(LogFile, LogFileName);
    if FileExists(LogFileName) then
     Append(LogFile)
   else
     Rewrite(LogFile);

   try
      SelectQ.First;
      while not SelectQ.Eof do
      begin

        db_ip:=SelectQ.FieldByName('ip').AsString;
        db_time:=SelectQ.FieldByName('time').AsDateTime;
        db_mac:=SelectQ.FieldByName('mac').AsString;
        db_kind:=SelectQ.FieldByName('kind').AsString;

        if db_kind='assigned' then
        begin
           LogData := Format('%s '#9''#9' %s '#9''#9' ------------------- '#9''#9' %s', [ db_ip, DateTimeToStr(db_time), db_mac ] ) ;
           WriteLn(LogFile, LogData) ;
        end;

        if db_kind='deassigned' then
        begin
           LogData := Format('%s '#9''#9' ------------------- '#9''#9' %s '#9''#9' %s', [ db_ip, DateTimeToStr(db_time), db_mac ] ) ;
           WriteLn(LogFile, LogData) ;
        end;

        SelectQ.Next;
      end;

   finally
     CloseFile(LogFile)
   end;

end;

function TTurboGMikrotikLogger.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TTurboGMikrotikLogger.IdSyslogServerAfterBind(Sender: TObject);
begin
WritetoLog('Service listening');
end;

procedure TTurboGMikrotikLogger.IdSyslogServerStatus(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: string);
begin
if IdSyslogServer.Active=False then IdSyslogServer.Active:=True;
end;

procedure TTurboGMikrotikLogger.IdSyslogServerSyslog(Sender: TObject;
  ASysLogMessage: TIdSysLogMessage; ABinding: TIdSocketHandle);
var
veriproc, vericontent : String;
abc:String;
data_ip, data_base_url, data_full_url: String;
data_mac, data_dhcpservername, data_kind : String;
logtype:String;
begin

WriteToLog('log------------');
logtype:=ASysLogMessage.Msg.Process;
vericontent:=ASysLogMessage.Msg.Content;

WriteToLog(ASysLogMessage.Msg.Text);
WriteToLog(vericontent);
WriteToLog(logtype);

if DataConnection.Connected=False then DataConnection.Connected:=True;

if (logtype='proxy') or (logtype='proxy:') then
begin
  //client ip
  data_ip:=GetToken(vericontent, ' ', 1);

  //base url
  data_base_url:=GetToken(vericontent, '/', 3);
  // full url without //
  abc:=GetToken(vericontent, ' ', 3);
  Delete(abc, 1, 7 );
  data_full_url:=abc;

  try
    InsertQ.Close;
    InsertQ.SQL.Clear;
    InsertQ.SQL.Add('insert into weblogs  (time, url_base, url_full, ip) values ('+
      'NOW(),'''+ trim(data_base_url) +''','''+ trim(data_full_url)  +''','''+
    trim(data_ip)  +'''); ');
    InsertQ.ExecSQL;
  except
   on E : Exception do
       WriteToLog(E.ClassName+' error raised, with message : '+E.Message);
  end;

end;  //proxy sonu

//***************************

if (logtype='dhcp') or (logtype='dhcp:') then
begin

      if (GetToken(vericontent, ' ', 2)='assigned') or (GetToken(vericontent, ' ', 2)='deassigned') then
      begin
       // WriteToLog(vericontent);

        //dhcp server name
        data_dhcpservername:=GetToken(vericontent, ' ', 1);
        //client ip
        data_ip:=GetToken(vericontent, ' ', 3);
        //client mac
        data_mac:=GetToken(vericontent, ' ', 5);

        //assigned or deassinged
        if (GetToken(vericontent, ' ', 2)='assigned') then data_kind:='assigned';
        if (GetToken(vericontent, ' ', 2)='deassigned') then data_kind:='deassigned';

          try
            InsertQ.Close;
            InsertQ.SQL.Clear;
            InsertQ.SQL.Add('insert into dhcplogs  (time, ip, mac, dhcpservername, kind) values ('+
            'NOW(),'''+ trim(data_ip) +''','''+ trim(data_mac)  +''','''+
             trim(data_dhcpservername)  +''','''+ trim(data_kind) +'''); ');

            InsertQ.ExecSQL;
          except
          on E : Exception do
           WriteToLog(E.ClassName+' error raised, with message : '+E.Message);
          end;

      end;//assigned ise
end;  //dhcp sonu


end;

procedure TTurboGMikrotikLogger.InitService;
begin
  SetServerClass(UniGUIServerModuleClass);
end;

procedure TTurboGMikrotikLogger.TarihKontrolTimer(Sender: TObject);
var
yil:String;
ay:String;
begin
DateTimeToString(yil, 'yyyy', Now );
DateTimeToString(ay, 'mm', Now );
//WriteToLog(yil);
//WriteToLog(ay);
if (StrToInt(yil)>=lastyear) and (StrToInt(ay)>=lastmonth) then
begin
WriteToLog('Date expired. please buy full edition from www.turbog.com ');
//IdSyslogServer.Active:=False;
expired:=True;
end;

end;

procedure TTurboGMikrotikLogger.UniGUIServiceShutdown(Sender: TService);
begin
IdSyslogServer.Active:=False;
end;

procedure TTurboGMikrotikLogger.UniGUIServiceStart(Sender: TService;
  var Started: Boolean);
begin
//Demo surum kontrol
//if (demoedition=True) then TarihKontrol.Enabled:=True else TarihKontrol.Enabled:=False;

//Belli aralýklarla dhcp dosya kopyalama
DHCPLogGenerator.Enabled:=True;


try
   WorkDir:=ExtractFilePath( ParamStr(0) );
   IniFileName:=Workdir+'config.ini';
   SetCurrentDir(Workdir);
   INIDosya := TIniFile.Create( IniFileName );

   //Sql Settings
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

   DashDisplayRecord:=INIDosya.ReadString('General','DashDisplayRecord','100');

   INIDosya.Free;
except
    WriteToLog('config.ini file read error. Please check your settings!');
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

except
  WriteToLog('Database settings error please check your settings!');
end;

//IdSyslogServer.DefaultPort:=StrtoInt(SysLogPort );
IdSyslogServer.Active:=True;
WriteToLog('Syslog server activate!');

//hata üretiyor bakýlacak servis çalýþmýyor
//UniMainModule.WebLogs.FetchRow:=StrToInt(DashDisplayRecord);

WriteToLog('Records fetched');

try
//configurations from mysql
  SelectQ.Close;
  SelectQ.SQL.Clear;
  SelectQ.SQL.Add( 'select * from settings;' );
  SelectQ.Open;

  WriteToLog('Settings read from SQL server');

  SelectQ.First;
  dhcp_log_generate_enable:=SelectQ.FieldByName('export_dhcp_log').AsString;
  dhcp_log_dir:=SelectQ.FieldByName('dhcp_log_dir').AsString;
  license_key:=SelectQ.FieldByName('license_key').AsString;
  license_owner:=SelectQ.FieldByName('license_owner').AsString;

  WriteToLog('Settings ready from SQL server');

except
    WriteToLog('Can not get settings from SQL server!');
end;

  //Zamaný düzenleme dhcp create etmek için
  if dhcp_log_generate_enable='True' then DHCPLogGenerator.Enabled:=True else
                                          DHCPLogGenerator.Enabled:=False;
  WriteToLog('dhcp_log_generate_enable');

end; //end of proc


procedure TTurboGMikrotikLogger.UniGUIServiceStop(Sender: TService;
  var Stopped: Boolean);
begin
IdSyslogServer.Active:=False;
end;







end.

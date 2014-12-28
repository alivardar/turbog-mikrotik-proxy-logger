unit DHCPLogsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniEdit, uniButton, uniPanel,
  uniDBNavigator, uniGUIBaseClasses, uniBasicGrid, uniDBGrid, uniDateTimePicker;

type
  TDHCPLogsForm = class(TUniForm)
    UniDBGrid1: TUniDBGrid;
    UniDBNavigator1: TUniDBNavigator;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    UniDateTimePicker1: TUniDateTimePicker;
    UniLabel2: TUniLabel;
    UniLabel1: TUniLabel;
    UniDateTimePicker2: TUniDateTimePicker;
    UniButton3: TUniButton;
    UniButton5: TUniButton;
    UniButton4: TUniButton;
    procedure UniButton2Click(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniButton5Click(Sender: TObject);
    procedure UniButton3Click(Sender: TObject);
    procedure UniButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function DHCPLogsForm: TDHCPLogsForm;

implementation

{$R *.dfm}

uses
  MainModule, ServiceModule;

function DHCPLogsForm: TDHCPLogsForm;
begin
  Result := TDHCPLogsForm(UniMainModule.GetFormInstance(TDHCPLogsForm));
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

procedure TDHCPLogsForm.UniButton1Click(Sender: TObject);
var
sqltext:String;
begin
if TurboGMikrotikLogger.DataConnection.Connected=False then TurboGMikrotikLogger.DataConnection.Connected:=True;

  UniMainModule.DHCPLogsQuery.Close;
  UniMainModule.DHCPLogsQuery.SQL.Clear;
  sqltext:='select * from dhcplogs where time>'''+  FormatDateTime('yyyy-MM-dd', UniDateTimePicker1.DateTime)+
  ''' and time<'''+   FormatDateTime('yyyy-MM-dd', UniDateTimePicker2.DateTime) +'''; ';
  UniMainModule.DHCPLogsQuery.SQL.Add(sqltext);
  UniMainModule.DHCPLogsQuery.Open;

  //WriteToLog(sqltext);

end;

procedure TDHCPLogsForm.UniButton2Click(Sender: TObject);
begin
Close;
end;

procedure TDHCPLogsForm.UniButton3Click(Sender: TObject);
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

  UniMainModule.SelectQ.Close;
  UniMainModule.SelectQ.SQL.Clear;
  UniMainModule.SelectQ.SQL.Add( 'select dhcp_log_dir from settings;' );
  UniMainModule.SelectQ.Open;
  Dizin:=UniMainModule.SelectQ.FieldByName('dhcp_log_dir').AsString;

  UniMainModule.SelectQ.Close;
  UniMainModule.SelectQ.SQL.Clear;
  UniMainModule.SelectQ.SQL.Add( 'select * from dhcplogs where time<'''+  FormatDateTime('yyyy-MM-dd', Now+1 )+
  ''' and time>'''+   FormatDateTime('yyyy-MM-dd', Now-1 ) +''' order by time; ' );
  UniMainModule.SelectQ.Open;

  myDate:=now;
  DecodeDate(myDate, myYear, myMonth, myDay);
  LogFileName:=Dizin+'\'+ IntToStr(myYear)+'_'+IntToStr(myMonth)+'_'+IntToStr(myDay)+'_Today.txt';


    AssignFile(LogFile, LogFileName);
    if FileExists(LogFileName) then
     Append(LogFile)
   else
     Rewrite(LogFile);

   try
      UniMainModule.SelectQ.First;
      while not UniMainModule.SelectQ.Eof do
      begin

        db_ip:=UniMainModule.SelectQ.FieldByName('ip').AsString;
        db_time:=UniMainModule.SelectQ.FieldByName('time').AsDateTime;
        db_mac:=UniMainModule.SelectQ.FieldByName('mac').AsString;
        db_kind:=UniMainModule.SelectQ.FieldByName('kind').AsString;

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

        UniMainModule.SelectQ.Next;
      end;

   finally
     CloseFile(LogFile)
   end;


UniApplication.UniSession.Alert('Text file generated on server to directory '+LogFileName);

end;


procedure TDHCPLogsForm.UniButton4Click(Sender: TObject);
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

  UniMainModule.SelectQ.Close;
  UniMainModule.SelectQ.SQL.Clear;
  UniMainModule.SelectQ.SQL.Add( 'select dhcp_log_dir from settings;' );
  UniMainModule.SelectQ.Open;
  Dizin:=UniMainModule.SelectQ.FieldByName('dhcp_log_dir').AsString;

  if   UniMainModule.DHCPLogsQuery.Active=False then
  begin
  UniApplication.UniSession.Alert('Please genearate a report!');
  Exit;
  end;

  myDate:=now;
  DecodeDate(myDate, myYear, myMonth, myDay);
  LogFileName:=Dizin+'\'+ IntToStr(myYear)+'_'+IntToStr(myMonth)+'_'+IntToStr(myDay)+'_ReportDayBetween.txt';

    AssignFile(LogFile, LogFileName);
    if FileExists(LogFileName) then
     Append(LogFile)
   else
     Rewrite(LogFile);

   try
      UniMainModule.DHCPLogsQuery.First;
      while not UniMainModule.DHCPLogsQuery.Eof do
      begin

        db_ip:=UniMainModule.DHCPLogsQuery.FieldByName('ip').AsString;
        db_time:=UniMainModule.DHCPLogsQuery.FieldByName('time').AsDateTime;
        db_mac:=UniMainModule.DHCPLogsQuery.FieldByName('mac').AsString;
        db_kind:=UniMainModule.DHCPLogsQuery.FieldByName('kind').AsString;

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

        UniMainModule.DHCPLogsQuery.Next;
      end;

   finally
     CloseFile(LogFile)
   end;


UniApplication.UniSession.Alert('Text file generated on server to directory '+Dizin);

end;


procedure TDHCPLogsForm.UniButton5Click(Sender: TObject);
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

  UniMainModule.SelectQ.Close;
  UniMainModule.SelectQ.SQL.Clear;
  UniMainModule.SelectQ.SQL.Add( 'select dhcp_log_dir from settings;' );
  UniMainModule.SelectQ.Open;
  Dizin:=UniMainModule.SelectQ.FieldByName('dhcp_log_dir').AsString;

  UniMainModule.SelectQ.Close;
  UniMainModule.SelectQ.SQL.Clear;
  UniMainModule.SelectQ.SQL.Add( 'select * from dhcplogs where time<'''+  FormatDateTime('yyyy-MM-dd', Now+1 )+
  ''' and time>'''+   FormatDateTime('yyyy-MM-dd', ( IncMonth( now, -1 ) ) ) +''' order by time; ' );
  UniMainModule.SelectQ.Open;

  myDate:=now;
  DecodeDate(myDate, myYear, myMonth, myDay);
  LogFileName:=Dizin+'\'+ IntToStr(myYear)+'_'+IntToStr(myMonth)+'_'+IntToStr(myDay)+'_30day.txt';

    AssignFile(LogFile, LogFileName);
    if FileExists(LogFileName) then
     Append(LogFile)
   else
     Rewrite(LogFile);

   try
      UniMainModule.SelectQ.First;
      while not UniMainModule.SelectQ.Eof do
      begin

        db_ip:=UniMainModule.SelectQ.FieldByName('ip').AsString;
        db_time:=UniMainModule.SelectQ.FieldByName('time').AsDateTime;
        db_mac:=UniMainModule.SelectQ.FieldByName('mac').AsString;
        db_kind:=UniMainModule.SelectQ.FieldByName('kind').AsString;

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

        UniMainModule.SelectQ.Next;
      end;

   finally
     CloseFile(LogFile)
   end;


UniApplication.UniSession.Alert('Text file generated on server to directory '+Dizin);

end;

procedure TDHCPLogsForm.UniFormShow(Sender: TObject);
begin
UniDateTimePicker1.DateTime:=Now;
UniDateTimePicker2.DateTime:=Now;
end;

end.

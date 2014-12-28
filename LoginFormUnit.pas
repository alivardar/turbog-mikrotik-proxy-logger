unit LoginFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniEdit, uniLabel, uniGUIBaseClasses,
  uniPanel, uniGroupBox;

type
  TLoginForm = class(TUniForm)
    UniEdit1: TUniEdit;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniEdit2: TUniEdit;
    UniButton1: TUniButton;
    procedure UniButton1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function LoginForm: TLoginForm;

var

LoginOK : Boolean;

implementation

{$R *.dfm}

uses
  MainModule, Main, ServiceModule;

function LoginForm: TLoginForm;
begin
  Result := TLoginForm(UniMainModule.GetFormInstance(TLoginForm));
end;

procedure TLoginForm.UniButton1Click(Sender: TObject);
var
sql : String;
begin

//mysql
sql:='select id from users where username='''+
 UniEdit1.Text +''' and password=md5('''+ UniEdit2.Text+''') ';

//sqlite
//sql:='select id from users where username='''+
//UniEdit1.Text +''' and password='''+ UniEdit2.Text+''' ';

if TurboGMikrotikLogger.DataConnection.Connected=False then
TurboGMikrotikLogger.DataConnection.Connected:=True;

//showmessage(sql);
UniMainModule.SelectQ.Close;
UniMainModule.SelectQ.SQL.Clear;
UniMainModule.SelectQ.SQL.Add(sql);
UniMainModule.SelectQ.Open;

if UniMainModule.SelectQ.RecordCount>0 then
begin
  UniMainModule.SelectQ.Close;
  LoginOK:=True;
  MainModule.LoginFormActive:=True;
  MainForm.Show;
  Close;
end
else
begin
  Showmessage('User name or password wrong!');
end;

UniMainModule.SelectQ.Close;

end;

procedure TLoginForm.UniFormClose(Sender: TObject; var Action: TCloseAction);
begin
if LoginOK=False then UniApplication.Terminate('Have a nice work!');
MainForm.Show;
end;

procedure TLoginForm.UniFormCreate(Sender: TObject);
begin
LoginOK:=False;
end;

end.

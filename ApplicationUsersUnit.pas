unit ApplicationUsersUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniEdit, uniButton, uniPanel,
  uniDBNavigator, uniGUIBaseClasses, uniBasicGrid, uniDBGrid;

type
  TApplicationUsers = class(TUniForm)
    UniDBGrid1: TUniDBGrid;
    UniDBNavigator1: TUniDBNavigator;
    UniButton1: TUniButton;
    UniEdit1: TUniEdit;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniEdit2: TUniEdit;
    UniButton2: TUniButton;
    procedure UniButton2Click(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function ApplicationUsers: TApplicationUsers;

implementation

{$R *.dfm}

uses
  MainModule, ServiceModule;

function ApplicationUsers: TApplicationUsers;
begin
  Result := TApplicationUsers(UniMainModule.GetFormInstance(TApplicationUsers));
end;

procedure TApplicationUsers.UniButton1Click(Sender: TObject);
begin
if TurboGMikrotikLogger.DataConnection.Connected=False then TurboGMikrotikLogger.DataConnection.Connected:=True;
  UniMainModule.InsertQ.SQL.Clear;
//mysql
  UniMainModule.InsertQ.SQL.Add('insert into users (username, password) values (''' +
  UniEdit1.Text+    ''', md5('''+ UniEdit2.Text +''') ) ');
//sqlite
 // UniMainModule.InsertQ.SQL.Add('insert into users (username, password) values (''' +
 // UniEdit1.Text+    ''', '''+ UniEdit2.Text +''' ) ');

  UniMainModule.InsertQ.ExecSQL;
  UniMainModule.AppUSers.Refresh;
end;

procedure TApplicationUsers.UniButton2Click(Sender: TObject);
begin
Close;
end;

end.

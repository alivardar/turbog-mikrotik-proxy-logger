unit Top100UsersUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniBasicGrid, uniDBGrid;

type
  TTop100Users = class(TUniForm)
    UniDBGrid1: TUniDBGrid;
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function Top100Users: TTop100Users;

implementation

{$R *.dfm}

uses
  MainModule, ServiceModule;

function Top100Users: TTop100Users;
begin
  Result := TTop100Users(UniMainModule.GetFormInstance(TTop100Users));
end;

procedure TTop100Users.UniFormClose(Sender: TObject; var Action: TCloseAction);
begin
UniMainModule.ReportGen.Close;
end;

procedure TTop100Users.UniFormShow(Sender: TObject);
begin
if TurboGMikrotikLogger.DataConnection.Connected=False then TurboGMikrotikLogger.DataConnection.Connected:=True;
UniMainModule.ReportGen.Close;
UniMainModule.ReportGen.SQL.Clear;
UniMainModule.ReportGen.SQl.Add(
'select weblogs.ip, count(weblogs.ip), aliases.description from weblogs, aliases '+
'where weblogs.ip=aliases.ip '+
'group by weblogs.ip '+
'order by count(weblogs.ip) desc;');
UniMainModule.ReportGen.Open;
end;

end.

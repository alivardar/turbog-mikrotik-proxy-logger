unit AliasesUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniRadioGroup,
  uniDBNavigator, uniEdit, uniGUIBaseClasses, uniPanel, uniLabel, uniButton;

type
  TAliases = class(TUniForm)
    UniDBGrid1: TUniDBGrid;
    UniDBNavigator1: TUniDBNavigator;
    UniButton2: TUniButton;
    UniButton1: TUniButton;
    UniEdit1: TUniEdit;
    UniEdit2: TUniEdit;
    UniLabel3: TUniLabel;
    UniLabel1: TUniLabel;
    procedure UniButton2Click(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function Aliases: TAliases;

implementation

{$R *.dfm}

uses
  MainModule, ServiceModule;

function Aliases: TAliases;
begin
  Result := TAliases(UniMainModule.GetFormInstance(TAliases));
end;

procedure TAliases.UniButton1Click(Sender: TObject);
begin
if TurboGMikrotikLogger.DataConnection.Connected=False then TurboGMikrotikLogger.DataConnection.Connected:=True;
  UniMainModule.InsertQ.SQL.Clear;
  UniMainModule.InsertQ.SQL.Add('insert into aliases (ip, description) values (''' +
    UniEdit1.Text+  ''', '''+ UniEdit2.Text +''' );');
  UniMainModule.InsertQ.ExecSQL;
  UniMainModule.Aliases.Refresh;
end;

procedure TAliases.UniButton2Click(Sender: TObject);
begin
Close;
end;

end.

unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Menus, uniMainMenu, pngimage, uniImage, uniPanel,
  uniGroupBox, uniGUIBaseClasses, uniStatusBar, uniEdit, uniLabel, uniButton,
  ZAbstractConnection, ZConnection, DB, ZAbstractRODataset, ZDataset, ImgList,
  uniToolBar, uniBasicGrid, uniDBGrid, uniTimer, uniImageList;

type
  TMainForm = class(TUniForm)
    UniStatusBar1: TUniStatusBar;
    UniMainMenu1: TUniMainMenu;
    Ayarlar1: TUniMenuItem;
    Hakknda1: TUniMenuItem;
    Hakknda2: TUniMenuItem;
    Logs1: TUniMenuItem;
    LastRecords1: TUniMenuItem;
    N1: TUniMenuItem;
    UserLogs1: TUniMenuItem;
    DefineUserwithIP1: TUniMenuItem;
    ApplicationUsers1: TUniMenuItem;
    UniDBGrid1: TUniDBGrid;
    N4: TUniMenuItem;
    op100Users1: TUniMenuItem;
    op100Domains1: TUniMenuItem;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    N2: TUniMenuItem;
    DHCPLogs1: TUniMenuItem;
    N3: TUniMenuItem;
    Settings1: TUniMenuItem;
    UniToolBar2: TUniToolBar;
    UniToolButton14: TUniToolButton;
    UniToolButton15: TUniToolButton;
    UniToolButton16: TUniToolButton;
    UniToolButton18: TUniToolButton;
    UniToolButton19: TUniToolButton;
    UniToolButton1: TUniToolButton;
    UniToolButton2: TUniToolButton;
    UniToolButton4: TUniToolButton;
    UniToolButton6: TUniToolButton;
    UniImageList1: TUniImageList;
    UniToolButton3: TUniToolButton;
    UniToolButton5: TUniToolButton;
    UniToolButton7: TUniToolButton;
    UniToolButton8: TUniToolButton;
    FilterIPEdit: TUniEdit;
    procedure UniFormShow(Sender: TObject);
    procedure MteriTanmlama1Click(Sender: TObject);
    procedure Hakknda2Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure ApplicationUsers1Click(Sender: TObject);
    procedure DefineUserwithIP1Click(Sender: TObject);
    procedure LastRecords1Click(Sender: TObject);
    procedure UserLogs1Click(Sender: TObject);
    procedure op100Users1Click(Sender: TObject);
    procedure op100Domains1Click(Sender: TObject);
    procedure DHCPLogs1Click(Sender: TObject);
    procedure Settings1Click(Sender: TObject);
    procedure UniToolButton14Click(Sender: TObject);
    procedure UniToolButton15Click(Sender: TObject);
    procedure UniToolButton16Click(Sender: TObject);
    procedure UniToolButton18Click(Sender: TObject);
    procedure UniToolButton19Click(Sender: TObject);
    procedure UniToolButton1Click(Sender: TObject);
    procedure UniToolButton2Click(Sender: TObject);
    procedure UniToolButton4Click(Sender: TObject);
    procedure UniToolButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainForm: TMainForm;



implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, AboutUnit, LoginFormUnit,
  CustomersUnit, AliasesUnit, ApplicationUsersUnit, Top100UsersUnit,
  UserBasedReportUnit, Top100DomainsUnit, ayarunit, DHCPLogsUnit, SettingsUnit;


function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
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

procedure TMainForm.ApplicationUsers1Click(Sender: TObject);
begin
ApplicationUsers.Showmodal;
end;

procedure TMainForm.Close1Click(Sender: TObject);
begin
Close;
end;

procedure TMainForm.DefineUserwithIP1Click(Sender: TObject);
begin
Aliases.ShowModal;
end;

procedure TMainForm.DHCPLogs1Click(Sender: TObject);
begin
DHCPLogsForm.Showmodal;
end;

procedure TMainForm.Hakknda2Click(Sender: TObject);
begin
About.ShowModal;
end;

procedure TMainForm.LastRecords1Click(Sender: TObject);
begin
UniMainModule.WebLogs.Close;
UniMainModule.WebLogs.Open;
end;

procedure TMainForm.MteriTanmlama1Click(Sender: TObject);
begin
CustomersForm.Showmodal;
end;

procedure TMainForm.op100Domains1Click(Sender: TObject);
begin
Top100Domains.Showmodal;
end;

procedure TMainForm.op100Users1Click(Sender: TObject);
begin
Top100Users.Showmodal;
end;

procedure TMainForm.Settings1Click(Sender: TObject);
begin
SettingsForm.Showmodal;
end;

procedure TMainForm.UniFormShow(Sender: TObject);
begin
  if not MainModule.LoginFormActive then
  begin
    Hide;
    LoginForm.Show;
  end;

UniMainModule.WebLogs.Close;
UniMainModule.WebLogs.Open;

if expired=True then
   MainForm.Caption:='Application expired and stoppped, please buy from www.turbog.com';

end;

procedure TMainForm.UniToolButton14Click(Sender: TObject);
begin
UniMainModule.WebLogs.Close;
UniMainModule.WebLogs.SQL.Clear;

if FilterIPEdit.Text <> '' then
  UniMainModule.WebLogs.SQL.Add('select * from weblogs where ip="'+FilterIPEdit.Text+'" order by id desc;')
else
  UniMainModule.WebLogs.SQL.Add('select * from weblogs order by id desc;');

UniMainModule.WebLogs.Open;
end;

procedure TMainForm.UniToolButton15Click(Sender: TObject);
begin
ApplicationUsers.Showmodal;
end;

procedure TMainForm.UniToolButton16Click(Sender: TObject);
begin
Aliases.ShowModal;
end;

procedure TMainForm.UniToolButton18Click(Sender: TObject);
begin
Top100Domains.Showmodal;
end;

procedure TMainForm.UniToolButton19Click(Sender: TObject);
begin
Top100Users.Showmodal;
end;

procedure TMainForm.UniToolButton1Click(Sender: TObject);
begin
UserBasedReport.Showmodal;
end;

procedure TMainForm.UniToolButton2Click(Sender: TObject);
begin
DHCPLogsForm.Showmodal;
end;

procedure TMainForm.UniToolButton4Click(Sender: TObject);
begin
SettingsForm.Showmodal;
end;

procedure TMainForm.UniToolButton6Click(Sender: TObject);
begin
Close;
end;

procedure TMainForm.UserLogs1Click(Sender: TObject);
begin
UserBasedReport.Showmodal;
end;

initialization
  RegisterMainFormClass(TMainForm);

end.

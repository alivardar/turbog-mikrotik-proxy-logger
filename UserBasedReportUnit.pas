unit UserBasedReportUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniDateTimePicker, uniButton, uniGUIBaseClasses,
  uniLabel, uniBasicGrid, uniDBGrid, uniMultiItem, uniListBox, uniDBListBox,
  uniPanel;

type
  TUserBasedReport = class(TUniForm)
    UniPanel1: TUniPanel;
    UniPanel3: TUniPanel;
    UniDBGrid1: TUniDBGrid;
    UniLabel1: TUniLabel;
    UniButton1: TUniButton;
    UniDateTimePicker1: TUniDateTimePicker;
    UniLabel2: TUniLabel;
    UniDateTimePicker2: TUniDateTimePicker;
    UniLabel3: TUniLabel;
    UniDBGrid2: TUniDBGrid;
    procedure UniButton1Click(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UserBasedReport: TUserBasedReport;

implementation

{$R *.dfm}

uses
  MainModule, ServiceModule;

function UserBasedReport: TUserBasedReport;
begin
  Result := TUserBasedReport(UniMainModule.GetFormInstance(TUserBasedReport));
end;

procedure TUserBasedReport.UniButton1Click(Sender: TObject);
begin
if TurboGMikrotikLogger.DataConnection.Connected=False then
      TurboGMikrotikLogger.DataConnection.Connected:=True;
UniMainModule.Aliases.Active:=True;
UniMainModule.ReportGen.Close;
UniMainModule.ReportGen.SQL.Clear;
UniMainModule.ReportGen.SQl.Add('select distinct url_base, time from weblogs '+
'where ip='''+ UniMainModule.Aliases.FieldByName('ip').AsString + ''''+
' and time>'''+  FormatDateTime('yyyy-MM-dd', UniDateTimePicker1.DateTime)+''''+
' and time<'''+  FormatDateTime('yyyy-MM-dd', UniDateTimePicker2.DateTime)+''' order by time' );
UniMainModule.ReportGen.Open;
end;

procedure TUserBasedReport.UniFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
UniMainModule.ReportGen.Close;
end;

procedure TUserBasedReport.UniFormShow(Sender: TObject);
begin
UniDateTimePicker1.DateTime:=Now;
UniDateTimePicker2.DateTime:=Now;
UniMainModule.ReportGen.Close;
end;

end.

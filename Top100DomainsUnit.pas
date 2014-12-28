unit Top100DomainsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniBasicGrid, uniDBGrid;

type
  TTop100Domains = class(TUniForm)
    UniDBGrid1: TUniDBGrid;
    procedure UniFormShow(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function Top100Domains: TTop100Domains;

implementation

{$R *.dfm}

uses
  MainModule;

function Top100Domains: TTop100Domains;
begin
  Result := TTop100Domains(UniMainModule.GetFormInstance(TTop100Domains));
end;

procedure TTop100Domains.UniFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
UniMainModule.ReportGen.Close;
end;

procedure TTop100Domains.UniFormShow(Sender: TObject);
begin
UniMainModule.ReportGen.Close;
UniMainModule.ReportGen.SQL.Clear;
UniMainModule.ReportGen.SQl.Add('select url_base, count(url_base) from weblogs group by url_base ' +
                                'order by count(url_base)desc');
UniMainModule.ReportGen.Open;
end;

end.

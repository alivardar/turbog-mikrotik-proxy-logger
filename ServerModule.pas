unit ServerModule;

interface

uses
  SysUtils, uniGUIServer, uniGUIMainModule;

type
  TUniServerModule = class(TUniGUIServerModule)
    procedure UniGUIServerModuleCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure FirstInit; override;
  public
    { Public declarations }
  end;

function UniServerModule: TUniServerModule;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServiceModule;

function UniServerModule: TUniServerModule;
begin
  Result:=TUniServerModule(UniGUIServerInstance);
end;

procedure TUniServerModule.FirstInit;
begin
  InitServerModule(Self);
end;

procedure TUniServerModule.UniGUIServerModuleCreate(Sender: TObject);
begin
UniServerModule.Port:= StrtoInt(ServiceModule.WWWPort);
end;

initialization
  RegisterServerModuleClass(TUniServerModule);
end.

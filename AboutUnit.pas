unit AboutUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniButton, uniImage, uniLabel,
  pngimage;

type
  TAbout = class(TUniForm)
    UniButton1: TUniButton;
    UniLabel1: TUniLabel;
    UniImage1: TUniImage;
    UniLabel3: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel4: TUniLabel;
    procedure UniButton1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function About: TAbout;

implementation

{$R *.dfm}

uses
  MainModule, ayarunit;

function About: TAbout;
begin
  Result := TAbout(UniMainModule.GetFormInstance(TAbout));
end;

procedure TAbout.UniButton1Click(Sender: TObject);
begin
Close;
end;

procedure TAbout.UniFormShow(Sender: TObject);
begin

UniLabel3.Caption:='Release '+app_relase;

if demoedition=True then
begin
   UniLabel5.Caption:='Time limited full edition!';
   UniLabel4.Caption:='Last date: '+InttoStr(lastyear)+' / '+InttoStr(lastmonth);
end else
begin
   UniLabel5.Caption:='Full edition!';
   UniLabel4.Caption:='';
end;

end;

end.

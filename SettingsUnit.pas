unit SettingsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniLabel, uniCheckBox,
  uniGUIBaseClasses, uniEdit, uniTabControl, uniPanel, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBEdit;

type
  TSettingsForm = class(TUniForm)
    UniDBEdit1: TUniDBEdit;
    UniLabel1: TUniLabel;
    UniDBComboBox1: TUniDBComboBox;
    UniLabel2: TUniLabel;
    UniButton1: TUniButton;
    procedure UniButton1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function SettingsForm: TSettingsForm;

implementation

{$R *.dfm}

uses
  MainModule, ayarunit;

function SettingsForm: TSettingsForm;
begin
  Result := TSettingsForm(UniMainModule.GetFormInstance(TSettingsForm));
end;

procedure TSettingsForm.UniButton1Click(Sender: TObject);
begin
UniMainModule.Settings.Post;
//UniApplication.UniSession.Alert('Please restart application service!');
Close;
end;

procedure TSettingsForm.UniFormShow(Sender: TObject);
begin
UniMainModule.Settings.Active:=True;
UniMainModule.Settings.First;
UniMainModule.Settings.Edit;
end;

end.

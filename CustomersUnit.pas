unit CustomersUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniMemo, uniDBMemo, uniPanel, uniDBNavigator,
  uniLabel, uniMultiItem, uniListBox, uniDBText, uniBasicGrid, uniDBGrid,
  uniGUIBaseClasses, uniEdit, uniDBEdit, uniButton;

type
  TCustomersForm = class(TUniForm)
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
    UniDBNavigator1: TUniDBNavigator;
    UniLabel2: TUniLabel;
    UniDBText1: TUniDBText;
    UniDBEdit1: TUniDBEdit;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniDBMemo1: TUniDBMemo;
    UniDBEdit4: TUniDBEdit;
    UniLabel7: TUniLabel;
    UniLabel6: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    UniDBEdit2: TUniDBEdit;
    UniLabel5: TUniLabel;
    UniDBGrid1: TUniDBGrid;
    UniListBox1: TUniListBox;
    UniLabel1: TUniLabel;
    UniEdit1: TUniEdit;
    UniButton1: TUniButton;
    UniLabel8: TUniLabel;
    UniDBEdit5: TUniDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function CustomersForm: TCustomersForm;

implementation

{$R *.dfm}

uses
  MainModule;

function CustomersForm: TCustomersForm;
begin
  Result := TCustomersForm(UniMainModule.GetFormInstance(TCustomersForm));
end;

end.

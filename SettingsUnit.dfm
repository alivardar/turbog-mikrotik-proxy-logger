object SettingsForm: TSettingsForm
  Left = 305
  Top = 281
  Caption = 'Settings'
  ClientHeight = 187
  ClientWidth = 635
  Color = clBtnFace
  OldCreateOrder = False
  OnShow = UniFormShow
  MonitoredKeys.Keys = <>
  RTL = False
  PixelsPerInch = 96
  TextHeight = 13
  object UniDBEdit1: TUniDBEdit
    Left = 224
    Top = 68
    Width = 401
    Height = 22
    Hint = ''
    DataField = 'dhcp_log_dir'
    DataSource = UniMainModule.DataSource6
    PasswordChar = #0
    CharCase = ecNormal
    MaxLength = 0
    CharEOL = #0
    TabOrder = 0
    Color = clWindow
  end
  object UniLabel1: TUniLabel
    Left = 16
    Top = 40
    Width = 170
    Height = 13
    Hint = ''
    Caption = 'Daily DHCP Logs Export to Text File'
    TabOrder = 1
  end
  object UniDBComboBox1: TUniDBComboBox
    Left = 224
    Top = 32
    Width = 193
    Height = 21
    Hint = ''
    DataField = 'export_dhcp_log'
    DataSource = UniMainModule.DataSource6
    Style = csDropDown
    MaxLength = 0
    Items.Strings = (
      'True'
      'False')
    ItemIndex = -1
    TabOrder = 2
  end
  object UniLabel2: TUniLabel
    Left = 16
    Top = 77
    Width = 74
    Height = 13
    Hint = ''
    Caption = 'Directory Name'
    TabOrder = 3
  end
  object UniButton1: TUniButton
    Left = 528
    Top = 128
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Close'
    TabOrder = 4
    OnClick = UniButton1Click
  end
end

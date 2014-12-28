object LoginForm: TLoginForm
  Left = 439
  Top = 493
  Caption = 'User Login'
  ClientHeight = 135
  ClientWidth = 311
  Color = clBtnFace
  OldCreateOrder = False
  OnClose = UniFormClose
  OnCreate = UniFormCreate
  MonitoredKeys.Keys = <>
  RTL = False
  PixelsPerInch = 96
  TextHeight = 13
  object UniEdit1: TUniEdit
    Left = 152
    Top = 16
    Width = 137
    Hint = ''
    PasswordChar = #0
    CharCase = ecNormal
    MaxLength = 0
    CharEOL = #0
    Text = ''
    TabOrder = 0
    Color = clWindow
  end
  object UniLabel1: TUniLabel
    Left = 32
    Top = 16
    Width = 68
    Height = 16
    Hint = ''
    Caption = 'User Name'
    ParentFont = False
    Font.Height = -13
    Font.Style = [fsBold]
    TabOrder = 1
  end
  object UniLabel2: TUniLabel
    Left = 32
    Top = 50
    Width = 63
    Height = 16
    Hint = ''
    Caption = 'Password'
    ParentFont = False
    Font.Height = -13
    Font.Style = [fsBold]
    TabOrder = 2
  end
  object UniEdit2: TUniEdit
    Left = 152
    Top = 44
    Width = 137
    Hint = ''
    PasswordChar = '*'
    CharCase = ecNormal
    MaxLength = 0
    CharEOL = #0
    Text = ''
    TabOrder = 3
    Color = clWindow
  end
  object UniButton1: TUniButton
    Left = 32
    Top = 80
    Width = 257
    Height = 33
    Hint = ''
    Caption = 'Login'
    ParentFont = False
    Font.Height = -15
    Font.Style = [fsBold]
    TabOrder = 4
    OnClick = UniButton1Click
  end
end

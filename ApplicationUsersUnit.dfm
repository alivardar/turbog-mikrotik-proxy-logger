object ApplicationUsers: TApplicationUsers
  Left = 452
  Top = 193
  Caption = 'Application Users'
  ClientHeight = 302
  ClientWidth = 579
  Color = clBtnFace
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  RTL = False
  PixelsPerInch = 96
  TextHeight = 13
  object UniDBGrid1: TUniDBGrid
    Left = 17
    Top = 87
    Width = 546
    Height = 205
    Hint = ''
    DataSource = UniMainModule.DataSource1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    WebOptions.LoadMaskMsg = 'Please wait...'
    HeaderTitleAlign = taLeftJustify
    StripeRows = False
    TabOrder = 0
    Columns = <
      item
        FieldName = 'id'
        Title.Caption = 'Id'
        Width = 64
        Visible = True
        Alignment = taRightJustify
        Expanded = False
      end
      item
        FieldName = 'username'
        Title.Caption = 'User Name'
        Width = 434
        Visible = True
        Expanded = False
      end>
  end
  object UniDBNavigator1: TUniDBNavigator
    Left = 304
    Top = 53
    Width = 256
    Height = 25
    Hint = ''
    DataSource = UniMainModule.DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete]
    ConfirmDelete = True
    TabOrder = 1
  end
  object UniButton1: TUniButton
    Left = 304
    Top = 15
    Width = 145
    Height = 25
    Hint = ''
    Caption = 'Save New User'
    TabOrder = 2
    OnClick = UniButton1Click
  end
  object UniEdit1: TUniEdit
    Left = 96
    Top = 18
    Width = 177
    Hint = ''
    PasswordChar = #0
    CharCase = ecNormal
    MaxLength = 0
    CharEOL = #0
    Text = ''
    TabOrder = 3
    Color = clWindow
  end
  object UniLabel1: TUniLabel
    Left = 24
    Top = 24
    Width = 51
    Height = 13
    Hint = ''
    Caption = 'User name'
    TabOrder = 4
  end
  object UniLabel2: TUniLabel
    Left = 24
    Top = 60
    Width = 46
    Height = 13
    Hint = ''
    Caption = 'Password'
    TabOrder = 5
  end
  object UniEdit2: TUniEdit
    Left = 96
    Top = 53
    Width = 177
    Hint = ''
    PasswordChar = '*'
    CharCase = ecNormal
    MaxLength = 0
    CharEOL = #0
    Text = ''
    TabOrder = 6
    Color = clWindow
  end
  object UniButton2: TUniButton
    Left = 485
    Top = 15
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Close'
    TabOrder = 7
    OnClick = UniButton2Click
  end
end

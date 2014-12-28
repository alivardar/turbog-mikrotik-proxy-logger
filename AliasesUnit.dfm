object Aliases: TAliases
  Left = 5
  Top = 106
  Caption = 'Aliases List'
  ClientHeight = 335
  ClientWidth = 636
  Color = clBtnFace
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniDBGrid1: TUniDBGrid
    Left = 15
    Top = 87
    Width = 608
    Height = 235
    DataSource = UniMainModule.DataSource2
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    WebOptions.LoadMaskMsg = 'Please wait...'
    StripeRows = False
    Align = alCustom
    TabOrder = 0
    Columns = <
      item
        FieldName = 'ip'
        Title.Caption = 'IP Address'
        Width = 209
        Visible = True
        Expanded = False
      end
      item
        FieldName = 'description'
        Title.Caption = 'Description'
        Width = 358
        Visible = True
        Expanded = False
      end>
  end
  object UniDBNavigator1: TUniDBNavigator
    Left = 323
    Top = 53
    Width = 305
    Height = 25
    DataSource = UniMainModule.DataSource2
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete]
    ConfirmDelete = True
    TabOrder = 1
  end
  object UniButton2: TUniButton
    Left = 541
    Top = 15
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 2
    OnClick = UniButton2Click
  end
  object UniButton1: TUniButton
    Left = 323
    Top = 15
    Width = 145
    Height = 25
    Caption = 'Save Alias'
    TabOrder = 3
    OnClick = UniButton1Click
  end
  object UniEdit1: TUniEdit
    Left = 96
    Top = 15
    Width = 177
    Height = 22
    PasswordChar = #0
    CharCase = ecNormal
    MaxLength = 0
    CharEOL = #0
    TabOrder = 4
    Color = clWindow
  end
  object UniEdit2: TUniEdit
    Left = 96
    Top = 53
    Width = 177
    Height = 22
    PasswordChar = #0
    CharCase = ecNormal
    MaxLength = 0
    CharEOL = #0
    TabOrder = 5
    Color = clWindow
  end
  object UniLabel3: TUniLabel
    Left = 17
    Top = 24
    Width = 52
    Height = 13
    Caption = 'IP Address'
    TabOrder = 6
  end
  object UniLabel1: TUniLabel
    Left = 16
    Top = 62
    Width = 53
    Height = 13
    Caption = 'Description'
    TabOrder = 7
  end
end

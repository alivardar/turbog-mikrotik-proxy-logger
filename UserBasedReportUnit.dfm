object UserBasedReport: TUserBasedReport
  Left = 231
  Top = 131
  Caption = 'User Based Report Details'
  ClientHeight = 525
  ClientWidth = 902
  Color = clBtnFace
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = UniFormClose
  OnShow = UniFormShow
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 902
    Height = 129
    BorderStyle = ubsNone
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    TabOrder = 0
    ExplicitLeft = 16
    ExplicitTop = 8
    ExplicitWidth = 273
    object UniLabel1: TUniLabel
      Left = 22
      Top = 11
      Width = 52
      Height = 13
      Caption = 'Begin Date'
      TabOrder = 1
    end
    object UniButton1: TUniButton
      Left = 103
      Top = 89
      Width = 105
      Height = 25
      Caption = 'Generate Report'
      TabOrder = 2
      OnClick = UniButton1Click
    end
    object UniDateTimePicker1: TUniDateTimePicker
      Left = 88
      Top = 9
      Width = 120
      Height = 21
      DateTime = 41047.000000000000000000
      DateFormat = 'yyyy-MM-dd'
      TimeFormat = 'HH:mm:ss'
      Kind = tUniDate
      FirstDayOfWeek = dowLocaleDefault
      TabOrder = 3
      ParentColor = False
      Color = clWhite
    end
    object UniLabel2: TUniLabel
      Left = 22
      Top = 56
      Width = 44
      Height = 13
      Caption = 'End Date'
      TabOrder = 4
    end
    object UniDateTimePicker2: TUniDateTimePicker
      Left = 88
      Top = 54
      Width = 120
      Height = 21
      DateTime = 41047.000000000000000000
      DateFormat = 'yyyy-MM-dd'
      TimeFormat = 'HH:mm:ss'
      Kind = tUniDate
      FirstDayOfWeek = dowLocaleDefault
      TabOrder = 5
      ParentColor = False
      Color = clWhite
    end
    object UniLabel3: TUniLabel
      Left = 238
      Top = 11
      Width = 22
      Height = 13
      Caption = 'User'
      TabOrder = 6
    end
    object UniDBGrid2: TUniDBGrid
      Left = 288
      Top = 3
      Width = 611
      Height = 120
      DataSource = UniMainModule.DataSource2
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      WebOptions.LoadMaskMsg = 'Please wait...'
      StripeRows = False
      Align = alCustom
      TabOrder = 7
      Columns = <
        item
          FieldName = 'description'
          Title.Caption = 'User'
          Width = 578
          Visible = True
          Expanded = False
        end>
    end
  end
  object UniPanel3: TUniPanel
    Left = 0
    Top = 129
    Width = 902
    Height = 396
    BorderStyle = ubsNone
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clBtnFace
    TabOrder = 1
    object UniDBGrid1: TUniDBGrid
      Left = 0
      Top = 0
      Width = 902
      Height = 396
      DataSource = UniMainModule.DataSource4
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      WebOptions.LoadMaskMsg = 'Please wait...'
      StripeRows = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
    end
  end
end

object DHCPLogsForm: TDHCPLogsForm
  Left = 0
  Top = 63
  Caption = 'DHCP Logs'
  ClientHeight = 547
  ClientWidth = 651
  Color = clBtnFace
  OldCreateOrder = False
  OnShow = UniFormShow
  MonitoredKeys.Keys = <>
  RTL = False
  PixelsPerInch = 96
  TextHeight = 13
  object UniDBGrid1: TUniDBGrid
    Left = 17
    Top = 95
    Width = 616
    Height = 387
    Hint = ''
    DataSource = UniMainModule.DataSource5
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    WebOptions.LoadMaskMsg = 'Please wait...'
    HeaderTitleAlign = taLeftJustify
    StripeRows = False
    TabOrder = 0
    Columns = <
      item
        FieldName = 'time'
        Title.Caption = 'Time'
        Width = 120
        Visible = True
        Expanded = False
      end
      item
        FieldName = 'ip'
        Title.Caption = 'IP'
        Width = 120
        Visible = True
        Expanded = False
      end
      item
        FieldName = 'mac'
        Title.Caption = 'MAC'
        Width = 120
        Visible = True
        Expanded = False
      end
      item
        FieldName = 'dhcpservername'
        Title.Caption = 'DHCP Server Name'
        Width = 100
        Visible = True
        Expanded = False
      end
      item
        FieldName = 'kind'
        Title.Caption = 'Operation'
        Width = 100
        Visible = True
        Expanded = False
      end>
  end
  object UniDBNavigator1: TUniDBNavigator
    Left = 377
    Top = 50
    Width = 256
    Height = 25
    Hint = ''
    DataSource = UniMainModule.DataSource5
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete]
    ConfirmDelete = True
    TabOrder = 1
  end
  object UniButton1: TUniButton
    Left = 377
    Top = 19
    Width = 145
    Height = 25
    Hint = ''
    Caption = 'Show DHCP Logs'
    TabOrder = 2
    OnClick = UniButton1Click
  end
  object UniButton2: TUniButton
    Left = 558
    Top = 16
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Close'
    TabOrder = 3
    OnClick = UniButton2Click
  end
  object UniDateTimePicker1: TUniDateTimePicker
    Left = 136
    Top = 20
    Width = 120
    Height = 21
    Hint = ''
    DateTime = 41047.000000000000000000
    DateFormat = 'yyyy-MM-dd'
    TimeFormat = 'HH:mm:ss'
    Kind = tUniDate
    FirstDayOfWeek = dowLocaleDefault
    TabOrder = 4
    ParentColor = False
    Color = clWhite
  end
  object UniLabel2: TUniLabel
    Left = 22
    Top = 28
    Width = 52
    Height = 13
    Hint = ''
    Caption = 'Begin Date'
    TabOrder = 5
  end
  object UniLabel1: TUniLabel
    Left = 22
    Top = 64
    Width = 44
    Height = 13
    Hint = ''
    Caption = 'End Date'
    TabOrder = 6
  end
  object UniDateTimePicker2: TUniDateTimePicker
    Left = 136
    Top = 56
    Width = 120
    Height = 21
    Hint = ''
    DateTime = 41047.000000000000000000
    DateFormat = 'yyyy-MM-dd'
    TimeFormat = 'HH:mm:ss'
    Kind = tUniDate
    FirstDayOfWeek = dowLocaleDefault
    TabOrder = 7
    ParentColor = False
    Color = clWhite
  end
  object UniButton3: TUniButton
    Left = 480
    Top = 504
    Width = 153
    Height = 25
    Hint = ''
    Caption = 'Yesterday Logs to Text File'
    TabOrder = 8
    OnClick = UniButton3Click
  end
  object UniButton5: TUniButton
    Left = 22
    Top = 504
    Width = 187
    Height = 25
    Hint = ''
    Caption = '30 Days Logs to Text File'
    TabOrder = 9
    OnClick = UniButton5Click
  end
  object UniButton4: TUniButton
    Left = 264
    Top = 504
    Width = 153
    Height = 25
    Hint = ''
    Caption = 'Export Report to Text File'
    TabOrder = 10
    OnClick = UniButton4Click
  end
end

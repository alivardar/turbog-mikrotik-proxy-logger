object Top100Users: TTop100Users
  Left = 97
  Top = 147
  Caption = 'Top 100 Users Surfers'
  ClientHeight = 466
  ClientWidth = 551
  Color = clBtnFace
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = UniFormClose
  OnShow = UniFormShow
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 0
    Width = 551
    Height = 466
    DataSource = UniMainModule.DataSource4
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    WebOptions.LoadMaskMsg = 'Please wait...'
    StripeRows = False
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Columns = <
      item
        FieldName = 'ip'
        Title.Caption = 'IP Address'
        Width = 100
        Visible = True
        Expanded = False
      end
      item
        FieldName = 'count(weblogs.ip)'
        Title.Caption = 'Count'
        Width = 94
        Visible = True
        Alignment = taRightJustify
        ReadOnly = True
        Expanded = False
      end
      item
        FieldName = 'description'
        Title.Caption = 'Description'
        Width = 274
        Visible = True
        Expanded = False
      end>
  end
end

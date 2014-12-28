object Top100Domains: TTop100Domains
  Left = 87
  Top = 116
  Caption = 'Top 100 Domains Visited'
  ClientHeight = 502
  ClientWidth = 528
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
    Width = 528
    Height = 502
    DataSource = UniMainModule.DataSource4
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    WebOptions.LoadMaskMsg = 'Please wait...'
    StripeRows = False
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Columns = <
      item
        FieldName = 'url_base'
        Title.Caption = 'URL'
        Width = 200
        Visible = True
        Expanded = False
      end
      item
        FieldName = 'count(url_base)'
        Title.Caption = 'Count'
        Width = 64
        Visible = True
        Expanded = False
      end>
  end
end

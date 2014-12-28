object CustomersForm: TCustomersForm
  Left = 278
  Top = 106
  Caption = 'M'#252#351'teriler'
  ClientHeight = 530
  ClientWidth = 930
  Color = clBtnFace
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 930
    Height = 321
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    TabOrder = 0
    object UniDBNavigator1: TUniDBNavigator
      Left = 40
      Top = 24
      Width = 321
      Height = 25
      DataSource = UniMainModule.DataSource3
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      ConfirmDelete = True
      TabOrder = 1
    end
    object UniLabel2: TUniLabel
      Left = 40
      Top = 76
      Width = 55
      Height = 13
      Caption = 'M'#252#351'teri No:'
      TabOrder = 2
    end
    object UniDBText1: TUniDBText
      Left = 152
      Top = 76
      Width = 62
      Height = 13
    end
    object UniDBEdit1: TUniDBEdit
      Left = 152
      Top = 107
      Width = 329
      Height = 22
      DataField = 'customername'
      DataSource = UniMainModule.DataSource3
      PasswordChar = #0
      CharCase = ecNormal
      MaxLength = 0
      CharEOL = #0
      TabOrder = 4
      Color = clWindow
    end
    object UniLabel3: TUniLabel
      Left = 39
      Top = 116
      Width = 89
      Height = 13
      Caption = 'M'#252#351'teri Ad'#305' '#220'nvan'#305
      TabOrder = 5
    end
    object UniLabel4: TUniLabel
      Left = 39
      Top = 147
      Width = 32
      Height = 13
      Caption = 'Adres:'
      TabOrder = 6
    end
    object UniDBMemo1: TUniDBMemo
      Left = 152
      Top = 147
      Width = 329
      Height = 58
      DataField = 'address'
      DataSource = UniMainModule.DataSource3
      TabOrder = 7
      Color = clWindow
    end
    object UniDBEdit4: TUniDBEdit
      Left = 632
      Top = 183
      Width = 257
      Height = 22
      DataField = 'contactperson'
      DataSource = UniMainModule.DataSource3
      PasswordChar = #0
      CharCase = ecNormal
      MaxLength = 0
      CharEOL = #0
      TabOrder = 8
      Color = clWindow
    end
    object UniLabel7: TUniLabel
      Left = 520
      Top = 192
      Width = 45
      Height = 13
      Caption = 'Yetkili Ki'#351'i'
      TabOrder = 9
    end
    object UniLabel6: TUniLabel
      Left = 520
      Top = 147
      Width = 49
      Height = 13
      Caption = 'Telefon2: '
      TabOrder = 10
    end
    object UniDBEdit3: TUniDBEdit
      Left = 632
      Top = 147
      Width = 257
      Height = 22
      DataField = 'telephone2'
      DataSource = UniMainModule.DataSource3
      PasswordChar = #0
      CharCase = ecNormal
      MaxLength = 0
      CharEOL = #0
      TabOrder = 11
      Color = clWindow
    end
    object UniDBEdit2: TUniDBEdit
      Left = 632
      Top = 107
      Width = 257
      Height = 22
      DataField = 'telephone1'
      DataSource = UniMainModule.DataSource3
      PasswordChar = #0
      CharCase = ecNormal
      MaxLength = 0
      CharEOL = #0
      TabOrder = 12
      Color = clWindow
    end
    object UniLabel5: TUniLabel
      Left = 520
      Top = 107
      Width = 52
      Height = 13
      Caption = 'Telefon1 : '
      TabOrder = 13
    end
    object UniListBox1: TUniListBox
      Left = 152
      Top = 232
      Width = 193
      Height = 75
      Items.Strings = (
        'Arama yok'
        'M'#252#351'teri ad'#305'na g'#246're'
        'M'#252#351'teri nosuna g'#246're'
        'Yetkili ki'#351'iye g'#246're')
      ItemIndex = -1
      TabOrder = 14
    end
    object UniLabel1: TUniLabel
      Left = 40
      Top = 294
      Width = 88
      Height = 13
      Caption = 'Arama Se'#231'enekleri'
      TabOrder = 15
    end
    object UniEdit1: TUniEdit
      Left = 376
      Top = 285
      Width = 177
      Height = 22
      PasswordChar = #0
      CharCase = ecNormal
      MaxLength = 0
      CharEOL = #0
      TabOrder = 16
      Color = clWindow
    end
    object UniButton1: TUniButton
      Left = 576
      Top = 282
      Width = 75
      Height = 25
      Caption = 'Ara'
      TabOrder = 17
    end
    object UniLabel8: TUniLabel
      Left = 520
      Top = 232
      Width = 48
      Height = 13
      Caption = 'Yetkili Mail'
      TabOrder = 18
    end
    object UniDBEdit5: TUniDBEdit
      Left = 632
      Top = 223
      Width = 257
      Height = 22
      DataField = 'contactpersonmail'
      DataSource = UniMainModule.DataSource3
      PasswordChar = #0
      CharCase = ecNormal
      MaxLength = 0
      CharEOL = #0
      TabOrder = 19
      Color = clWindow
    end
  end
  object UniPanel2: TUniPanel
    Left = 0
    Top = 321
    Width = 930
    Height = 209
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clBtnFace
    TabOrder = 1
    ExplicitTop = 377
    ExplicitHeight = 136
    object UniDBGrid1: TUniDBGrid
      Left = 1
      Top = 1
      Width = 928
      Height = 207
      DataSource = UniMainModule.DataSource3
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      WebOptions.LoadMaskMsg = 'Please wait...'
      StripeRows = False
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Columns = <
        item
          FieldName = 'idcustomer'
          Title.Caption = 'ID'
          Width = 50
          Visible = True
          Expanded = False
        end
        item
          FieldName = 'customername'
          Title.Caption = 'M'#252#351'teri'
          Width = 304
          Visible = True
          Expanded = False
        end
        item
          FieldName = 'address'
          Title.Caption = 'Adres'
          Width = 420
          Visible = True
          Expanded = False
        end
        item
          FieldName = 'telephone1'
          Title.Caption = 'Telefon1'
          Width = 100
          Visible = True
          Expanded = False
        end
        item
          FieldName = 'telephone2'
          Title.Caption = 'Telefon2'
          Width = 100
          Visible = True
          Expanded = False
        end
        item
          FieldName = 'contactperson'
          Title.Caption = 'Yetkili'
          Width = 150
          Visible = True
          Expanded = False
        end
        item
          FieldName = 'contactpersonmail'
          Title.Caption = 'Yetkili E-Posta'
          Width = 150
          Visible = True
          Expanded = False
        end>
    end
  end
end

object cz: Tcz
  Left = 616
  Top = 272
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1052#1077#1090#1086#1076' '#1062#1077#1079#1072#1088#1103
  ClientHeight = 391
  ClientWidth = 492
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 500
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBottom: TPanel
    Left = 0
    Top = 157
    Width = 492
    Height = 215
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object pnlKey: TPanel
      Left = 0
      Top = 0
      Width = 492
      Height = 40
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        492
        40)
      object edtKey: TLabeledEdit
        Left = 10
        Top = 17
        Width = 121
        Height = 21
        EditLabel.Width = 28
        EditLabel.Height = 13
        EditLabel.Caption = #1050#1083#1102#1095
        Enabled = False
        ImeName = #1056#1091#1089#1089#1082#1072#1103
        PasswordChar = '*'
        TabOrder = 0
        Text = '3'
        OnKeyPress = edtKeyKeyPress
      end
      object BitBtn1: TBitBtn
        Left = 352
        Top = 13
        Width = 130
        Height = 25
        Action = actRun
        Anchors = [akTop, akRight]
        Caption = #1047#1072#1096#1080#1092#1088#1086#1074#1072#1090#1100
        TabOrder = 2
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
          333333333333337FF3333333333333903333333333333377FF33333333333399
          03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
          99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
          99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
          03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
          33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
          33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
          3333777777333333333333333333333333333333333333333333}
        NumGlyphs = 2
      end
      object CheckBox1: TCheckBox
        Left = 145
        Top = 21
        Width = 97
        Height = 17
        Caption = #1056#1072#1089#1082#1086#1076#1080#1088#1086#1074#1072#1090#1100
        TabOrder = 1
        OnClick = CheckBox1Click
      end
    end
    object GrBoxOutPut: TGroupBox
      Left = 0
      Top = 40
      Width = 492
      Height = 175
      Align = alClient
      Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1085#1085#1099#1081' '#1090#1077#1082#1089#1090
      TabOrder = 1
      object memoOutput: TMemo
        Left = 2
        Top = 15
        Width = 488
        Height = 158
        Align = alClient
        ImeName = #1056#1091#1089#1089#1082#1072#1103
        Lines.Strings = (
          'Memo2')
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
        OnKeyDown = memoInputKeyDown
      end
    end
  end
  object GrBoxInput: TGroupBox
    Left = 0
    Top = 0
    Width = 492
    Height = 157
    Align = alTop
    Caption = #1048#1089#1093#1086#1076#1085#1099#1081' '#1090#1077#1082#1089#1090
    TabOrder = 0
    object memoInput: TMemo
      Left = 2
      Top = 15
      Width = 488
      Height = 140
      Align = alClient
      ImeName = #1056#1091#1089#1089#1082#1072#1103
      Lines.Strings = (
        'Memo1')
      ScrollBars = ssBoth
      TabOrder = 0
      OnChange = memoInputChange
      OnKeyDown = memoInputKeyDown
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 372
    Width = 492
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Width = 120
      end
      item
        Width = 50
      end>
  end
  object ActionList1: TActionList
    Left = 121
    Top = 40
    object actExit: TAction
      Caption = #1042#1099'&'#1093#1086#1076
      Hint = #1042#1099#1081#1090#1080' '#1080#1079' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      OnExecute = actExitExecute
    end
    object actLoad: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072'...'
      OnExecute = actLoadExecute
    end
    object actSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1092#1072#1081#1083'...'
      OnExecute = actSaveExecute
      OnUpdate = actSaveUpdate
    end
    object actRun: TAction
      Caption = #1047#1072#1096#1080#1092#1088#1086#1074#1072#1090#1100
      OnExecute = actRunExecute
      OnUpdate = actRunUpdate
    end
  end
  object MainMenu1: TMainMenu
    Left = 88
    Top = 40
    object mmiFile: TMenuItem
      Caption = '&'#1050#1086#1076#1080#1088#1086#1074#1072#1085#1080#1077
      object mmiLoad: TMenuItem
        Action = actLoad
      end
      object mmiSave: TMenuItem
        Action = actSave
      end
      object mmiSep1: TMenuItem
        Caption = '-'
      end
      object mmiRun: TMenuItem
        Action = actRun
      end
      object mmiSep2: TMenuItem
        Caption = '-'
      end
      object mmiExit: TMenuItem
        Action = actExit
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099'|*.txt|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Title = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1072#1081#1083
    Left = 88
    Top = 72
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.txt'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099'|*.txt|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Title = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090
    Left = 120
    Top = 72
  end
end

object CryptFile: TCryptFile
  Left = 634
  Top = 281
  BorderStyle = bsToolWindow
  Caption = #1047#1072#1097#1080#1090#1072' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 387
  ClientWidth = 568
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Gauge1: TGauge
    Left = 0
    Top = 59
    Width = 568
    Height = 16
    Align = alBottom
    ForeColor = clBlue
    Progress = 0
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 568
    Height = 57
    Align = alTop
    Caption = #1055#1072#1085#1077#1083#1100' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103
    TabOrder = 0
    object Button3: TButton
      Left = 8
      Top = 24
      Width = 177
      Height = 25
      Caption = '-= '#1057#1086#1079#1076#1072#1090#1100' '#1082#1088#1080#1087#1090#1086'-'#1082#1086#1085#1090#1077#1081#1085#1077#1088' =-'
      TabOrder = 0
      OnClick = Button3Click
    end
    object GroupBox3: TGroupBox
      Left = 392
      Top = 0
      Width = 177
      Height = 57
      Caption = #1060#1072#1081#1083' '#1085#1072' '#1076#1080#1089#1082#1077':'
      TabOrder = 1
      object DriveComboBox1: TDriveComboBox
        Left = 8
        Top = 24
        Width = 161
        Height = 19
        Enabled = False
        ImeName = #1056#1091#1089#1089#1082#1072#1103
        TabOrder = 0
        TextCase = tcUpperCase
        OnChange = DriveComboBox1Change
      end
    end
    object Button4: TButton
      Left = 192
      Top = 24
      Width = 193
      Height = 25
      Caption = '-= '#1059#1076#1072#1083#1080#1090#1100' '#1082#1088#1080#1087#1090#1086'-'#1082#1086#1085#1090#1077#1081#1085#1077#1088' =-'
      TabOrder = 2
      OnClick = Button4Click
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 139
    Width = 568
    Height = 248
    Align = alBottom
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
    TabOrder = 1
    object ListBox1: TListBox
      Left = 2
      Top = 15
      Width = 564
      Height = 106
      Align = alTop
      ImeName = #1056#1091#1089#1089#1082#1072#1103
      ItemHeight = 13
      TabOrder = 0
    end
    object StatusBar1: TStatusBar
      Left = 2
      Top = 227
      Width = 564
      Height = 19
      Panels = <
        item
          Text = #1057#1090#1072#1090#1091#1089':'
          Width = 50
        end
        item
          Width = 230
        end
        item
          Width = 230
        end
        item
          Text = 'v 1.0.3.3'
          Width = 50
        end>
    end
    object Memo1: TMemo
      Left = 2
      Top = 121
      Width = 564
      Height = 106
      Align = alClient
      ImeName = #1056#1091#1089#1089#1082#1072#1103
      ScrollBars = ssBoth
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 75
    Width = 568
    Height = 64
    Align = alBottom
    Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1050#1088#1080#1087#1090#1086'-'#1082#1086#1085#1090#1077#1081#1085#1077#1088#1086#1084
    TabOrder = 2
    object Button2: TButton
      Left = 8
      Top = 16
      Width = 177
      Height = 25
      Caption = '-= '#1054#1090#1082#1088#1099#1090#1100' '#1082#1088#1080#1087#1090#1086'-'#1082#1086#1085#1090#1077#1081#1085#1077#1088' =-'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 192
      Top = 16
      Width = 193
      Height = 25
      Caption = '-= '#1047#1072#1082#1088#1099#1090#1100' '#1082#1088#1080#1087#1090#1086'-'#1082#1086#1085#1090#1077#1081#1085#1077#1088' =-'
      TabOrder = 1
      OnClick = Button1Click
    end
    object GroupBox5: TGroupBox
      Left = 392
      Top = 0
      Width = 177
      Height = 54
      Caption = #1050#1088#1080#1087#1090#1086'-'#1082#1086#1085#1090#1077#1081#1085#1077#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 57
        Height = 13
        Caption = #1050#1086#1085#1090#1077#1081#1085#1077#1088':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 8
        Top = 32
        Width = 42
        Height = 13
        Caption = #1056#1072#1079#1084#1077#1088':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 72
        Top = 16
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label4: TLabel
        Left = 56
        Top = 32
        Width = 6
        Height = 13
        Caption = '0'
      end
    end
    object chk1: TCheckBox
      Left = 8
      Top = 45
      Width = 281
      Height = 17
      Caption = #1044#1077#1083#1072#1090#1100' '#1082#1086#1087#1080#1102' '#1082#1088#1080#1087#1090#1086'-'#1082#1086#1085#1090#1077#1081#1085#1077#1088#1072' '#1085#1072' '#1076#1088#1091#1075#1086#1081' '#1076#1080#1089#1082
      TabOrder = 3
      OnClick = chk1Click
    end
  end
  object DCP_rijndael1: TDCP_rijndael
    Id = 9
    Algorithm = 'Rijndael'
    MaxKeySize = 256
    BlockSize = 128
    Left = 512
    Top = 144
  end
  object DCP_sha5121: TDCP_sha512
    Id = 30
    Algorithm = 'SHA512'
    HashSize = 512
    Left = 480
    Top = 144
  end
end

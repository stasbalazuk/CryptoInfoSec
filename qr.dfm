object QRC: TQRC
  Left = 517
  Top = 242
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'QRCode v1.0.0.0  -= StalkerSTS =-'
  ClientHeight = 522
  ClientWidth = 665
  Color = clBtnFace
  Constraints.MinHeight = 320
  Constraints.MinWidth = 550
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object win1: TLabel
    Left = 440
    Top = 480
    Width = 82
    Height = 13
    Caption = #1056#1072#1079#1084#1077#1088' QRCode:'
  end
  object win2: TLabel
    Left = 528
    Top = 480
    Width = 47
    Height = 13
    Caption = #1064#1080#1088#1080#1085#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object win3: TLabel
    Left = 592
    Top = 480
    Width = 47
    Height = 13
    Caption = #1042#1099#1089#1086#1090#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtText: TEdit
    Left = 16
    Top = 568
    Width = 217
    Height = 21
    ImeName = 'Russian'
    TabOrder = 0
    Text = 'Hello world'
    OnChange = edtTextChange
  end
  object grp1: TGroupBox
    Left = 8
    Top = 8
    Width = 217
    Height = 505
    Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' QRCode'
    TabOrder = 1
    object lbledt1: TLabeledEdit
      Left = 8
      Top = 32
      Width = 201
      Height = 21
      EditLabel.Width = 66
      EditLabel.Height = 13
      EditLabel.Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
      ImeName = 'Russian'
      TabOrder = 0
      OnChange = lbledt1Change
    end
    object lbledt2: TLabeledEdit
      Left = 8
      Top = 72
      Width = 201
      Height = 21
      EditLabel.Width = 19
      EditLabel.Height = 13
      EditLabel.Caption = #1048#1084#1103
      ImeName = 'Russian'
      TabOrder = 1
      OnChange = lbledt2Change
    end
    object lbledt3: TLabeledEdit
      Left = 8
      Top = 112
      Width = 201
      Height = 21
      EditLabel.Width = 44
      EditLabel.Height = 13
      EditLabel.Caption = #1060#1072#1084#1080#1083#1080#1103
      ImeName = 'Russian'
      TabOrder = 2
      OnChange = lbledt3Change
    end
    object lbledt4: TLabeledEdit
      Left = 8
      Top = 152
      Width = 201
      Height = 21
      EditLabel.Width = 49
      EditLabel.Height = 13
      EditLabel.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
      ImeName = 'Russian'
      TabOrder = 3
      OnChange = lbledt4Change
    end
    object lbledt5: TLabeledEdit
      Left = 8
      Top = 192
      Width = 201
      Height = 21
      EditLabel.Width = 55
      EditLabel.Height = 13
      EditLabel.Caption = #1055#1088#1086#1092#1077#1089#1089#1080#1103
      ImeName = 'Russian'
      TabOrder = 4
      OnChange = lbledt5Change
    end
    object lbledt6: TLabeledEdit
      Left = 8
      Top = 232
      Width = 89
      Height = 21
      EditLabel.Width = 80
      EditLabel.Height = 13
      EditLabel.Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
      Enabled = False
      ImeName = 'Russian'
      TabOrder = 5
      OnChange = lbledt6Change
    end
    object lbledt7: TLabeledEdit
      Left = 8
      Top = 272
      Width = 201
      Height = 21
      EditLabel.Width = 108
      EditLabel.Height = 13
      EditLabel.Caption = #1057#1077#1084#1077#1081#1085#1086#1077' '#1087#1086#1083#1086#1078#1077#1085#1080#1077
      ImeName = 'Russian'
      TabOrder = 6
      OnChange = lbledt7Change
    end
    object lbledt8: TLabeledEdit
      Left = 8
      Top = 312
      Width = 201
      Height = 21
      EditLabel.Width = 81
      EditLabel.Height = 13
      EditLabel.Caption = #1053#1086#1084#1077#1088' '#1087#1072#1089#1087#1086#1088#1090#1072
      ImeName = 'Russian'
      TabOrder = 7
      OnChange = lbledt8Change
    end
    object lbledt9: TLabeledEdit
      Left = 8
      Top = 352
      Width = 201
      Height = 21
      EditLabel.Width = 130
      EditLabel.Height = 13
      EditLabel.Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#1082#1086#1076
      ImeName = 'Russian'
      TabOrder = 8
      OnChange = lbledt9Change
      OnKeyPress = lbledt9KeyPress
    end
    object edtQuietZone: TLabeledEdit
      Left = 8
      Top = 392
      Width = 201
      Height = 21
      EditLabel.Width = 94
      EditLabel.Height = 13
      EditLabel.Caption = #1047#1086#1085#1072' QRCode [1-4]'
      ImeName = 'Russian'
      TabOrder = 9
      OnChange = edtQuietZoneChange
      OnKeyPress = edtQuietZoneKeyPress
    end
    object lbledt11: TLabeledEdit
      Left = 8
      Top = 432
      Width = 121
      Height = 21
      EditLabel.Width = 118
      EditLabel.Height = 13
      EditLabel.Caption = #1050#1086#1076#1080#1088#1086#1074#1072#1085#1080#1077' - QRCode'
      ImeName = 'Russian'
      TabOrder = 10
    end
    object cmbEncoding: TComboBox
      Left = 136
      Top = 432
      Width = 73
      Height = 21
      Style = csDropDownList
      ImeName = 'Russian'
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 11
      Text = 'Auto'
      OnChange = cmbEncodingChange
      Items.Strings = (
        'Auto'
        'Numeric'
        'Alphanumeric'
        'ISO-8859-1'
        'UTF-8 without BOM'
        'UTF-8 with BOM')
    end
    object edtQuietZone1: TLabeledEdit
      Left = 8
      Top = 472
      Width = 201
      Height = 21
      EditLabel.Width = 64
      EditLabel.Height = 13
      EditLabel.Caption = 'CRC QRCode'
      Enabled = False
      ImeName = 'Russian'
      TabOrder = 12
    end
    object dtp1: TDateTimePicker
      Left = 104
      Top = 232
      Width = 105
      Height = 21
      Date = 41991.680629699080000000
      Time = 41991.680629699080000000
      ImeName = 'Russian'
      TabOrder = 13
      OnChange = dtp1Change
    end
  end
  object btnEncrypt: TButton
    Left = 232
    Top = 480
    Width = 97
    Height = 25
    Caption = #1047#1072#1096#1080#1092#1088#1086#1074#1072#1090#1100
    TabOrder = 2
    OnClick = btnEncryptClick
  end
  object grp2: TGroupBox
    Left = 232
    Top = 8
    Width = 425
    Height = 465
    Caption = #1055#1088#1086#1089#1084#1086#1090#1088' QRCode'
    TabOrder = 3
    object Image1: TImage
      Left = 2
      Top = 15
      Width = 421
      Height = 448
      Align = alClient
      Stretch = True
      Transparent = True
    end
  end
  object btnDecrypt: TButton
    Left = 336
    Top = 480
    Width = 97
    Height = 25
    Caption = #1056#1072#1089#1096#1080#1092#1088#1086#1074#1072#1090#1100
    TabOrder = 4
    OnClick = btnDecryptClick
  end
  object ipc1: TEdit
    Left = 528
    Top = 496
    Width = 57
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 5
    Text = '200'
    OnKeyPress = ipc1KeyPress
  end
  object ipc2: TEdit
    Left = 592
    Top = 496
    Width = 65
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 6
    Text = '200'
    OnKeyPress = ipc2KeyPress
  end
end

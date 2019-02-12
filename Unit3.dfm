object frmAboutBox: TfrmAboutBox
  Left = 706
  Top = 347
  ActiveControl = btnOk
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
  ClientHeight = 240
  ClientWidth = 308
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 97
    Top = 3
    Width = 131
    Height = 26
    Caption = 'CRF v1.0.0.0'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clMaroon
    Font.Height = -24
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object img1: TImage
    Left = 8
    Top = 4
    Width = 32
    Height = 24
    Picture.Data = {
      07544269746D6170F6010000424DF60100000000000076000000280000002000
      0000180000000100040000000000800100000000000000000000100000000000
      000000000000000080000080000000808000800000008000800080800000C0C0
      C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
      FF00F00000000000000000000000000000002222222222222222222222222222
      2220287F87777F87777F87777F87777F222027F7F222F7F222F7F222F7F222F7
      72202227777777777777777777777777222028F7FFFFFFFFFFFFFFFFFFFFFFF7
      F8202F77FFFFBFFFFBFFFFFBFFFFBFF77F2027F7FFF44444444444444F444FF7
      F7202727FBFFFFFBFFFFBFFFFBFFFBF727202727FFF4444444444FFFFFFFFFF7
      27202727FFFFBFFFFBFFFBFFFFBFFFF7272028F7FFFFFFFFFFFFFFF4FFFFFFF7
      F8202F77FBFFFFFF4FFBFFF4FFFFBFF77F2027F7FF7337F4FF44FF4F4F4F44F7
      F7202727F738337F444F44F4FB444FF727202727F383833F4FFFFFFF44FFFFF7
      27202727B838383FFFFBFFF4F44FBFF7272028F7F783837FFFFFFFFFFFFFFFF7
      F8202F77FF7837FFBFFFFBFFFBFFFFB77F2027F7FFFFFFFFFFFFFFFFFFFFFFF7
      F72028277777777777777777777777772820227F7F222F7F222F7F222F7F222F
      F7202287F87777F87777F87777F8777782202222222222222222222222222222
      222F}
  end
  object dblInputFileSize1: TLabel
    Left = 100
    Top = 30
    Width = 125
    Height = 13
    Hint = #1044#1083#1103' '#1086#1090#1087#1088#1072#1074#1082#1080' '#1087#1080#1089#1100#1084#1072' '#1082#1083#1080#1082#1085#1080#1090#1077' '#1076#1074#1072' '#1088#1072#1079#1072' ...'
    Caption = 'stalkersts2013@yandex.ru'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnDblClick = dblInputFileSize1DblClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 48
    Width = 289
    Height = 57
    Caption = #1051#1080#1094#1077#1085#1079#1080#1103':'
    TabOrder = 0
    object lblSystemID: TLabel
      Left = 32
      Top = 8
      Width = 249
      Height = 41
      Alignment = taCenter
      AutoSize = False
      Caption = 'Freeware'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clMaroon
      Font.Height = -37
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
  end
  object btnOk: TButton
    Left = 131
    Top = 209
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
    OnClick = btnOkClick
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 112
    Width = 289
    Height = 89
    Hint = #1044#1083#1103' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1103' '#1082#1083#1080#1082#1085#1080#1090#1077' '#1076#1074#1072' '#1088#1072#1079#1072' '#1087#1086' '#1074#1099#1073#1088#1072#1085#1086#1084#1091' '#1082#1086#1096#1077#1083#1100#1082#1091' ...'
    Caption = #1055#1086#1084#1086#1097#1100' '#1087#1088#1086#1077#1082#1090#1091
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    object lbl1: TLabel
      Left = 16
      Top = 16
      Width = 119
      Height = 21
      Caption = 'Z153633215917'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnDblClick = lbl1DblClick
    end
    object lbl2: TLabel
      Left = 16
      Top = 40
      Width = 119
      Height = 21
      Caption = 'E286050171346'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnDblClick = lbl2DblClick
    end
    object lbl3: TLabel
      Left = 152
      Top = 40
      Width = 121
      Height = 21
      Caption = 'U261245281360'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnDblClick = lbl3DblClick
    end
    object lbl4: TLabel
      Left = 152
      Top = 16
      Width = 121
      Height = 21
      Caption = 'R272181302678'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnDblClick = lbl4DblClick
    end
    object lbl5: TLabel
      Left = 16
      Top = 64
      Width = 263
      Height = 21
      Caption = #1071#1085#1076#1077#1082#1089' '#1076#1077#1085#1100#1075#1080': 410012015786021'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      OnDblClick = lbl5DblClick
    end
  end
end

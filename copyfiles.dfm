object copyf: Tcopyf
  Left = 625
  Top = 415
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077' '#1082#1088#1080#1087#1090#1086'-'#1082#1086#1085#1090#1077#1081#1085#1077#1088#1072
  ClientHeight = 45
  ClientWidth = 379
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 109
    Width = 37
    Height = 13
    Caption = 'Source:'
  end
  object Label2: TLabel
    Left = 16
    Top = 135
    Width = 56
    Height = 13
    Caption = 'Destination:'
  end
  object Edit1: TEdit
    Left = 67
    Top = 103
    Width = 241
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 80
    Top = 129
    Width = 228
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object Button1: TButton
    Left = 7
    Top = 155
    Width = 78
    Height = 20
    Caption = 'Copy'
    TabOrder = 2
    OnClick = Button1Click
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 0
    Width = 379
    Height = 25
    Align = alTop
    TabOrder = 3
  end
  object stat1: TStatusBar
    Left = 0
    Top = 26
    Width = 379
    Height = 19
    Panels = <
      item
        Text = #1057#1090#1072#1090#1091#1089':'
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object SaveDialog1: TSaveDialog
    Left = 320
    Top = 104
  end
  object tmr1: TTimer
    Enabled = False
    OnTimer = tmr1Timer
    Left = 320
    Top = 8
  end
end

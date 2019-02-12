object StegoBMP: TStegoBMP
  Left = 546
  Top = 219
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1057#1090#1077#1075#1072#1085#1086#1075#1088#1072#1092#1080#1095#1077#1089#1082#1086#1077' '#1096#1080#1092#1088#1086#1074#1072#1085#1080#1077' BMP '#1092#1072#1081#1083#1086#1074
  ClientHeight = 482
  ClientWidth = 352
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  DesignSize = (
    352
    482)
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 8
    Top = 36
    Width = 335
    Height = 237
    Anchors = [akLeft, akTop, akRight, akBottom]
    Stretch = True
  end
  object Label2: TLabel
    Left = 8
    Top = 280
    Width = 61
    Height = 13
    Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077':'
  end
  object Label1: TLabel
    Left = 88
    Top = 280
    Width = 104
    Height = 13
    Caption = '(Max. Message Size: )'
    Enabled = False
  end
  object lbl1: TLabel
    Left = 88
    Top = 296
    Width = 112
    Height = 13
    Caption = '(Count. Message Size: )'
    Enabled = False
  end
  object btnEncrypt: TButton
    Left = 2
    Top = 451
    Width = 91
    Height = 25
    Anchors = [akBottom]
    Caption = #1047#1072#1096#1080#1092#1088#1086#1074#1072#1090#1100
    Enabled = False
    TabOrder = 0
    OnClick = btnEncryptClick
  end
  object mmMessage: TMemo
    Left = 8
    Top = 312
    Width = 335
    Height = 135
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 1
    OnChange = mmMessageChange
  end
  object btnDecrypt: TButton
    Left = 100
    Top = 451
    Width = 94
    Height = 25
    Anchors = [akBottom]
    Caption = #1056#1072#1089#1096#1080#1092#1088#1086#1074#1072#1090#1100
    Enabled = False
    TabOrder = 2
    OnClick = btnDecryptClick
  end
  object btnLoadImage: TBitBtn
    Left = 8
    Top = 4
    Width = 121
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' BMP '
    TabOrder = 3
    OnClick = btnLoadImageClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF31111113
      FFFFFFF1BBBBBBBB3FFFFF1BBBBBBBBBB1FFFF3BBBBBBBBBB3FFFF3BBBBBBBBB
      B3FFFF3BBBBBBBBBB3FFFF3BBBBBBBBBB3FFFF3BBBBBBBBBB3FFFF3FFFFFFFFF
      F3FFFF333313333333FFFFF7F87FF78F7FFFFFF7F87FF7887FFFFFF7F877778F
      7FFFFFF7FF77778F7FFFFFFF7FFFFFF7FFFFFFFFF777777FFFFF}
  end
  object OpenPictureDialog1: TOpenPictureDialog
    DefaultExt = '.bmp'
    Filter = 'Bitmap files (*.bmp)|*.bmp'
    Title = 'Open Image'
    Left = 212
    Top = 56
  end
  object SavePictureDialog1: TSavePictureDialog
    DefaultExt = '.bmp'
    Filter = 'Bitmap files (*.bmp)|*.bmp'
    Title = 'Save encrypted picture as'
    Left = 212
    Top = 8
  end
end

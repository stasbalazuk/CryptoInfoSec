object SRT: TSRT
  Left = 284
  Top = 145
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = #1047#1072#1097#1080#1090#1072' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080'...'
  ClientHeight = 478
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 460
    Width = 624
    Height = 18
    Panels = <
      item
        Width = 50
      end>
  end
  object Pages1: TPageControl
    Left = 0
    Top = 0
    Width = 624
    Height = 460
    ActivePage = TabSymmetric
    Align = alClient
    Constraints.MinHeight = 460
    Constraints.MinWidth = 618
    TabOrder = 1
    TabPosition = tpBottom
    object TabSymmetric: TTabSheet
      Caption = #1057#1080#1084#1084#1077#1090#1088#1080#1095#1085#1086#1077' '#1096#1080#1092#1088#1086#1074#1072#1085#1080#1077
      object GroupAlgo: TGroupBox
        Left = 4
        Top = 32
        Width = 497
        Height = 37
        Caption = #1040#1083#1075#1086#1088#1080#1090#1084#1099' '#1096#1080#1092#1088#1086#1074#1072#1085#1080#1103
        Color = clWhite
        ParentColor = False
        TabOrder = 1
        object rbDES: TRadioButton
          Left = 8
          Top = 14
          Width = 41
          Height = 17
          Caption = 'DES'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = rbDESClick
        end
        object rbRC2: TRadioButton
          Left = 52
          Top = 14
          Width = 41
          Height = 17
          Caption = 'RC2'
          TabOrder = 1
          OnClick = rbRC2Click
        end
        object rbRC4: TRadioButton
          Left = 96
          Top = 14
          Width = 41
          Height = 17
          Caption = 'RC4'
          TabOrder = 2
          OnClick = rbRC4Click
        end
        object rbRC5: TRadioButton
          Left = 144
          Top = 14
          Width = 41
          Height = 17
          Caption = 'RC5'
          TabOrder = 3
          OnClick = rbRC5Click
        end
        object rbBF: TRadioButton
          Left = 188
          Top = 14
          Width = 61
          Height = 17
          Caption = 'Blowfish'
          TabOrder = 4
          OnClick = rbBFClick
        end
        object rbCast: TRadioButton
          Left = 248
          Top = 14
          Width = 49
          Height = 17
          Caption = 'CAST'
          TabOrder = 5
          OnClick = rbCastClick
        end
        object rbIdea: TRadioButton
          Left = 300
          Top = 14
          Width = 45
          Height = 17
          Caption = 'IDEA'
          TabOrder = 6
          OnClick = rbIdeaClick
        end
        object rbSafer: TRadioButton
          Left = 352
          Top = 14
          Width = 45
          Height = 17
          Caption = 'Safer'
          TabOrder = 7
          OnClick = rbSaferClick
        end
        object rbSkipJack: TRadioButton
          Left = 404
          Top = 14
          Width = 65
          Height = 17
          Caption = 'SkipJack'
          TabOrder = 8
          OnClick = rbSkipJackClick
        end
      end
      object GroupSymKey: TGroupBox
        Left = 4
        Top = 76
        Width = 601
        Height = 145
        Caption = #1050#1083#1102#1095
        Color = clWhite
        ParentColor = False
        TabOrder = 2
        object LabelSymKey: TLabel
          Left = 12
          Top = 36
          Width = 26
          Height = 13
          Caption = #1050#1083#1102#1095
        end
        object Label5: TLabel
          Left = 12
          Top = 16
          Width = 146
          Height = 13
          Caption = #1043#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100' '#1088#1072#1079#1084#1077#1088' '#1082#1083#1102#1095#1072
        end
        object LabelSymKeyLim: TLabel
          Left = 236
          Top = 16
          Width = 120
          Height = 13
          Caption = '8..256 bytes, multiple of 8'
        end
        object EditSymKey: TEdit
          Left = 12
          Top = 52
          Width = 437
          Height = 21
          TabOrder = 1
        end
        object btUpdSymKey: TButton
          Left = 504
          Top = 22
          Width = 89
          Height = 21
          Caption = #1054#1073#1085#1086#1074#1080#1090#1100
          Default = True
          TabOrder = 6
          OnClick = btUpdSymKeyClick
        end
        object rbSymKeyHex: TRadioButton
          Left = 412
          Top = 16
          Width = 45
          Height = 17
          Caption = 'Hex'
          Checked = True
          TabOrder = 2
          TabStop = True
          OnClick = rbSymKeyHexClick
        end
        object rbSymKeyStr: TRadioButton
          Left = 412
          Top = 32
          Width = 37
          Height = 17
          Caption = 'Str'
          TabOrder = 3
          OnClick = rbSymKeyStrClick
        end
        object btSaveSymKey: TButton
          Left = 504
          Top = 96
          Width = 89
          Height = 21
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
          TabOrder = 9
          OnClick = btSaveSymKeyClick
        end
        object btGenSymKey: TButton
          Left = 504
          Top = 48
          Width = 89
          Height = 21
          Caption = #1043#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100
          TabOrder = 7
          OnClick = btGenSymKeyClick
        end
        object btLoadSymKey: TButton
          Left = 504
          Top = 72
          Width = 89
          Height = 21
          Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
          TabOrder = 8
          OnClick = btLoadSymKeyClick
        end
        object EditSymKeyLen: TEdit
          Left = 168
          Top = 12
          Width = 57
          Height = 21
          TabOrder = 0
        end
        object PanelIV: TPanel
          Left = 168
          Top = 84
          Width = 233
          Height = 51
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Color = clWhite
          TabOrder = 5
          object LabelIV: TLabel
            Left = 8
            Top = 4
            Width = 110
            Height = 13
            Caption = 'IV (Init Vector) - 8 bytes'
          end
          object EditIV: TEdit
            Left = 8
            Top = 20
            Width = 125
            Height = 21
            TabOrder = 0
          end
          object rbIVHex: TRadioButton
            Left = 140
            Top = 22
            Width = 45
            Height = 17
            Caption = 'Hex'
            Checked = True
            TabOrder = 1
            TabStop = True
            OnClick = rbIVHexClick
          end
          object rbIVStr: TRadioButton
            Left = 188
            Top = 22
            Width = 37
            Height = 17
            Caption = 'Str'
            TabOrder = 2
            OnClick = rbIVStrClick
          end
        end
        object PanelSymKeyOpt: TPanel
          Left = 12
          Top = 84
          Width = 145
          Height = 51
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Color = clWhite
          TabOrder = 4
          object LabelSymKeyOpt: TLabel
            Left = 8
            Top = 4
            Width = 81
            Height = 13
            Caption = 'LabelSymKeyOpt'
          end
          object EditSymKeyOpt: TEdit
            Left = 8
            Top = 20
            Width = 125
            Height = 21
            TabOrder = 0
          end
        end
        object cbUseSaferSK: TCheckBox
          Left = 408
          Top = 123
          Width = 153
          Height = 13
          Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1077' Safer SK'
          TabOrder = 10
          Visible = False
          OnClick = cbUseSaferSKClick
        end
      end
      object GroupSymData: TGroupBox
        Left = 4
        Top = 268
        Width = 601
        Height = 153
        Caption = #1044#1072#1085#1085#1099#1077
        Color = clWhite
        ParentColor = False
        TabOrder = 4
        object PageControlSym: TPageControl
          Left = 8
          Top = 16
          Width = 489
          Height = 133
          ActivePage = TabSheet11
          TabOrder = 2
          object TabSheet11: TTabSheet
            BorderWidth = 2
            Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077
            object MemoSym1: TMemo
              Left = 0
              Top = 0
              Width = 477
              Height = 101
              Align = alClient
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
          object TabSheet12: TTabSheet
            BorderWidth = 2
            Caption = #1047#1072#1096#1080#1092#1088#1086#1074#1072#1085#1080#1077
            ImageIndex = 1
            object MemoSym2: TMemo
              Left = 0
              Top = 0
              Width = 477
              Height = 101
              Align = alClient
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
          object TabSheet13: TTabSheet
            BorderWidth = 2
            Caption = #1056#1072#1089#1096#1080#1092#1088#1086#1074#1072#1085#1080#1077
            ImageIndex = 2
            object MemoSym3: TMemo
              Left = 0
              Top = 0
              Width = 477
              Height = 101
              Align = alClient
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
        end
        object rbSymDataHex: TRadioButton
          Left = 388
          Top = 16
          Width = 45
          Height = 17
          Caption = 'Hex'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = rbSymDataHexClick
        end
        object rbSymDataStr: TRadioButton
          Left = 444
          Top = 16
          Width = 37
          Height = 17
          Caption = 'Str'
          TabOrder = 1
          OnClick = rbSymDataStrClick
        end
        object btEncryptSym: TButton
          Left = 504
          Top = 12
          Width = 89
          Height = 21
          Caption = #1047#1072#1096#1080#1092#1088#1086#1074#1072#1090#1100
          TabOrder = 3
          OnClick = btEncryptSymClick
        end
        object btDecryptSym: TButton
          Left = 504
          Top = 41
          Width = 89
          Height = 21
          Caption = #1056#1072#1089#1096#1080#1092#1088#1086#1074#1072#1090#1100
          TabOrder = 4
          OnClick = btDecryptSymClick
        end
        object btClearSymData: TButton
          Left = 504
          Top = 70
          Width = 89
          Height = 21
          Caption = #1054#1095#1080#1089#1090#1080#1090#1100
          TabOrder = 5
          OnClick = btClearSymDataClick
        end
        object btLoadSymData: TButton
          Left = 504
          Top = 99
          Width = 89
          Height = 21
          Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
          TabOrder = 6
          OnClick = btLoadSymDataClick
        end
        object btSaveSymData: TButton
          Left = 504
          Top = 128
          Width = 89
          Height = 21
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
          TabOrder = 7
          OnClick = btSaveSymDataClick
        end
      end
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 616
        Height = 29
        BorderWidth = 1
        ButtonHeight = 21
        ButtonWidth = 121
        Caption = 'ToolBar1'
        Color = clWhite
        EdgeBorders = [ebBottom]
        Flat = True
        ParentColor = False
        ShowCaptions = True
        TabOrder = 0
        object tbEncryptSymFile: TToolButton
          Left = 0
          Top = 0
          Caption = #1047#1072#1096#1080#1092#1088#1086#1074#1072#1090#1100' '#1092#1072#1081#1083'...'
          ImageIndex = 1
          OnClick = tbEncryptSymFileClick
        end
        object tbDecryptSymFile: TToolButton
          Left = 121
          Top = 0
          Caption = #1056#1072#1089#1096#1080#1092#1088#1086#1074#1072#1090#1100' '#1092#1072#1081#1083'...'
          ImageIndex = 2
          OnClick = tbDecryptSymFileClick
        end
      end
      object GroupCM: TGroupBox
        Left = 4
        Top = 226
        Width = 201
        Height = 37
        Caption = #1056#1077#1078#1080#1084' '#1096#1080#1092#1088#1072
        Color = clWhite
        ParentColor = False
        TabOrder = 3
        object rbECB: TRadioButton
          Left = 8
          Top = 16
          Width = 41
          Height = 17
          Caption = 'ECB'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = rbECBClick
        end
        object rbCBC: TRadioButton
          Left = 52
          Top = 16
          Width = 41
          Height = 17
          Caption = 'CBC'
          TabOrder = 1
          OnClick = rbCBCClick
        end
        object rbCFB: TRadioButton
          Left = 96
          Top = 16
          Width = 37
          Height = 17
          Caption = 'CFB'
          TabOrder = 2
          OnClick = rbCFBClick
        end
        object rbOFB: TRadioButton
          Left = 140
          Top = 16
          Width = 41
          Height = 17
          Caption = 'OFB'
          Color = clWhite
          ParentColor = False
          TabOrder = 3
          OnClick = rbOFBClick
        end
      end
    end
    object tabRSA: TTabSheet
      Caption = 'RSA '#1096#1080#1092#1088#1086#1074#1072#1085#1080#1077
      ImageIndex = 4
      object GroupRsaKey: TGroupBox
        Left = 4
        Top = 76
        Width = 601
        Height = 185
        Caption = #1050#1083#1102#1095
        TabOrder = 3
        object Label14: TLabel
          Left = 12
          Top = 16
          Width = 146
          Height = 13
          Caption = #1043#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100' '#1088#1072#1079#1084#1077#1088' '#1082#1083#1102#1095#1072
        end
        object LabelRsaKeyLim: TLabel
          Left = 240
          Top = 16
          Width = 73
          Height = 13
          Caption = '32 to 512 bytes'
        end
        object Label6: TLabel
          Left = 344
          Top = 16
          Width = 114
          Height = 13
          Caption = #1054#1090#1082#1088#1099#1090#1099#1081' '#1087#1086#1082#1072#1079#1072#1090#1077#1083#1100
        end
        object btUpdRsaKey: TButton
          Left = 512
          Top = 68
          Width = 81
          Height = 21
          Caption = #1054#1073#1085#1086#1074#1080#1090#1100
          TabOrder = 2
          OnClick = btUpdRsaKeyClick
        end
        object btSaveRsaKey: TButton
          Left = 512
          Top = 156
          Width = 81
          Height = 21
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
          TabOrder = 5
          OnClick = btSaveRsaKeyClick
        end
        object btGenRsaKey: TButton
          Left = 512
          Top = 97
          Width = 81
          Height = 21
          Caption = #1043#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100
          TabOrder = 3
          OnClick = btGenRsaKeyClick
        end
        object btLoadRsaKey: TButton
          Left = 512
          Top = 127
          Width = 81
          Height = 21
          Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
          TabOrder = 4
          OnClick = btLoadRsaKeyClick
        end
        object EditRsaKeyLen: TEdit
          Left = 168
          Top = 12
          Width = 57
          Height = 21
          TabOrder = 0
          Text = '32'
        end
        object PageControl1: TPageControl
          Left = 8
          Top = 40
          Width = 497
          Height = 137
          ActivePage = TabRSAKeyN
          TabOrder = 6
          TabPosition = tpBottom
          object TabRSAKeyN: TTabSheet
            Caption = #1054#1090#1082#1088#1099#1090#1099#1081' '#1082#1083#1102#1095
            object PageControl4: TPageControl
              Left = 0
              Top = 0
              Width = 513
              Height = 109
              ActivePage = TabSheet8
              TabOrder = 0
              object TabSheet7: TTabSheet
                Caption = #1052#1086#1076#1091#1083#1100
                object MemoRSAPubMod: TMemo
                  Left = 0
                  Top = 0
                  Width = 505
                  Height = 81
                  Align = alClient
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  ScrollBars = ssVertical
                  TabOrder = 0
                end
              end
              object TabSheet8: TTabSheet
                Caption = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1100
                ImageIndex = 1
                object MemoRSAPubExp: TMemo
                  Left = 0
                  Top = 0
                  Width = 505
                  Height = 81
                  Align = alClient
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  ScrollBars = ssVertical
                  TabOrder = 0
                end
              end
            end
          end
          object TabRSAKeyD: TTabSheet
            Caption = #1047#1072#1082#1088#1099#1090#1099#1081' '#1082#1083#1102#1095
            ImageIndex = 1
            object PageControl5: TPageControl
              Left = 0
              Top = 0
              Width = 489
              Height = 111
              ActivePage = TabSheet10
              Align = alClient
              TabOrder = 0
              object TabSheet9: TTabSheet
                Caption = #1052#1086#1076#1091#1083#1100
                object MemoRSAPrivMod: TMemo
                  Left = 0
                  Top = 0
                  Width = 481
                  Height = 83
                  Align = alClient
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  ScrollBars = ssVertical
                  TabOrder = 0
                end
              end
              object TabSheet10: TTabSheet
                Caption = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1100
                ImageIndex = 1
                object MemoRSAPrivExp: TMemo
                  Left = 0
                  Top = 0
                  Width = 481
                  Height = 83
                  Align = alClient
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  ScrollBars = ssVertical
                  TabOrder = 0
                end
              end
            end
          end
          object TabOaepSeed: TTabSheet
            BorderWidth = 2
            Caption = #1042#1080#1076' ('#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086', Hex)'
            ImageIndex = 3
            object MemoOaepSeed: TMemo
              Left = 0
              Top = 0
              Width = 485
              Height = 107
              Align = alClient
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
        end
        object btClearRSAKey: TButton
          Left = 512
          Top = 40
          Width = 81
          Height = 21
          Caption = #1054#1095#1080#1089#1090#1080#1090#1100
          TabOrder = 1
          OnClick = btClearRSAKeyClick
        end
        object EditSmallPubExp: TEdit
          Left = 464
          Top = 12
          Width = 65
          Height = 21
          TabOrder = 7
          Text = '0'
        end
      end
      object GroupRsaData: TGroupBox
        Left = 4
        Top = 268
        Width = 601
        Height = 157
        Caption = #1044#1072#1085#1085#1099#1077
        TabOrder = 4
        object btEncryptRsa: TButton
          Left = 512
          Top = 12
          Width = 81
          Height = 21
          Caption = #1047#1072#1096#1080#1092#1088#1086#1074#1072#1090#1100
          TabOrder = 0
          OnClick = btEncryptRsaClick
        end
        object btDecryptRsa: TButton
          Left = 512
          Top = 41
          Width = 81
          Height = 21
          Caption = #1056#1072#1089#1096#1080#1092#1088#1086#1074#1072#1090#1100
          TabOrder = 1
          OnClick = btDecryptRsaClick
        end
        object PageControlRSA: TPageControl
          Left = 8
          Top = 16
          Width = 497
          Height = 133
          ActivePage = TabRsa1
          TabOrder = 2
          object TabRsa1: TTabSheet
            BorderWidth = 2
            Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077
            object MemoRsa1: TMemo
              Left = 0
              Top = 0
              Width = 485
              Height = 101
              Align = alClient
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
          object TabSheet6: TTabSheet
            BorderWidth = 2
            Caption = #1047#1072#1096#1080#1092#1088#1086#1074#1072#1085#1080#1077
            ImageIndex = 1
            object MemoRsa2: TMemo
              Left = 0
              Top = 0
              Width = 485
              Height = 101
              Align = alClient
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
          object TabRsa3: TTabSheet
            BorderWidth = 2
            Caption = #1056#1072#1089#1096#1080#1092#1088#1086#1074#1072#1085#1080#1077
            ImageIndex = 2
            object MemoRsa3: TMemo
              Left = 0
              Top = 0
              Width = 485
              Height = 101
              Align = alClient
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
        end
        object rbRsaDataHex: TRadioButton
          Left = 404
          Top = 16
          Width = 45
          Height = 17
          Caption = 'Hex'
          Checked = True
          TabOrder = 3
          TabStop = True
          OnClick = rbRsaDataHexClick
        end
        object rbRsaDataStr: TRadioButton
          Left = 456
          Top = 16
          Width = 37
          Height = 17
          Caption = 'Str'
          TabOrder = 4
          OnClick = rbRsaDataStrClick
        end
        object btClearRsaData: TButton
          Left = 512
          Top = 70
          Width = 81
          Height = 21
          Caption = #1054#1095#1080#1089#1090#1080#1090#1100
          TabOrder = 5
          OnClick = btClearRsaDataClick
        end
        object btLoadRSAData: TButton
          Left = 512
          Top = 99
          Width = 81
          Height = 21
          Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
          TabOrder = 6
          OnClick = btLoadRSADataClick
        end
        object btSaveRSAData: TButton
          Left = 512
          Top = 128
          Width = 81
          Height = 21
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
          TabOrder = 7
          OnClick = btSaveRSADataClick
        end
      end
      object GroupScheme: TGroupBox
        Left = 4
        Top = 32
        Width = 189
        Height = 37
        Caption = #1057#1093#1077#1084#1072
        TabOrder = 1
        object rbPkcs: TRadioButton
          Left = 8
          Top = 14
          Width = 57
          Height = 17
          Caption = 'PKCS1'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = rbPkcsClick
        end
        object rbOaep: TRadioButton
          Left = 68
          Top = 14
          Width = 53
          Height = 17
          Caption = 'OAEP'
          TabOrder = 1
          OnClick = rbOaepClick
        end
        object rbPlain: TRadioButton
          Left = 128
          Top = 14
          Width = 50
          Height = 17
          Caption = 'Plain'
          TabOrder = 2
          OnClick = rbPlainClick
        end
      end
      object ToolBar5: TToolBar
        Left = 0
        Top = 0
        Width = 616
        Height = 29
        BorderWidth = 1
        ButtonHeight = 21
        ButtonWidth = 113
        Caption = 'ToolBar5'
        EdgeBorders = [ebBottom]
        Flat = True
        ShowCaptions = True
        TabOrder = 0
        object tbEncryptRsaFile: TToolButton
          Left = 0
          Top = 0
          Caption = #1047#1072#1096#1080#1092#1088#1086#1074#1072#1090#1100'...'
          ImageIndex = 0
          OnClick = tbEncryptRsaFileClick
        end
        object tbDecryptRsaFile: TToolButton
          Left = 113
          Top = 0
          Caption = #1056#1072#1089#1096#1080#1092#1088#1086#1074#1072#1090#1100'...'
          ImageIndex = 1
          OnClick = tbDecryptRsaFileClick
        end
        object ToolButton3: TToolButton
          Left = 226
          Top = 0
          Width = 8
          Caption = 'ToolButton3'
          ImageIndex = 2
          Style = tbsSeparator
        end
        object tbSignFile: TToolButton
          Left = 234
          Top = 0
          Caption = #1062#1080#1092#1088#1086#1074#1072#1103' '#1087#1086#1076#1087#1080#1089#1100'...'
          ImageIndex = 2
          OnClick = tbSignFileClick
        end
        object tbVerifyFile: TToolButton
          Left = 347
          Top = 0
          Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1062#1055'...'
          ImageIndex = 3
          OnClick = tbVerifyFileClick
        end
        object ToolButton6: TToolButton
          Left = 0
          Top = 0
          Width = 8
          Caption = 'ToolButton6'
          ImageIndex = 4
          Wrap = True
          Style = tbsSeparator
        end
        object btnImportRSAKeyPair: TToolButton
          Left = 0
          Top = 29
          Caption = #1048#1084#1087#1086#1088#1090' '#1082#1083#1102#1095#1077#1081'...'
          ImageIndex = 5
          OnClick = btnImportRSAKeyPairClick
        end
        object btnExportRSAKeyPair: TToolButton
          Left = 113
          Top = 29
          Caption = #1045#1082#1089#1087#1086#1088#1090' '#1082#1083#1102#1095#1077#1081'...'
          ImageIndex = 6
          OnClick = btnExportRSAKeyPairClick
        end
        object tbTestRsaKey: TToolButton
          Left = 226
          Top = 29
          Caption = 'Test keys...'
          ImageIndex = 4
          OnClick = tbTestRsaKeyClick
        end
      end
      object PanelShemeDigest: TPanel
        Left = 204
        Top = 37
        Width = 197
        Height = 32
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        object LabelRsaDigest: TLabel
          Left = 7
          Top = 10
          Width = 69
          Height = 13
          Caption = #1042#1099#1073#1086#1088' '#1089#1093#1077#1084#1099
        end
        object cbRsaDigest: TComboBox
          Left = 88
          Top = 5
          Width = 97
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnClick = cbRsaDigestClick
          Items.Strings = (
            'MD2'
            'MD4'
            'MD5'
            'SHA-1'
            'RIPEMD-160')
        end
      end
    end
    object TabDigest: TTabSheet
      Caption = #1048#1079#1083#1086#1078#1077#1085#1080#1077
      ImageIndex = 2
      object GroupBox1: TGroupBox
        Left = 4
        Top = 32
        Width = 317
        Height = 37
        Caption = #1040#1083#1075#1086#1088#1080#1090#1084
        TabOrder = 1
        object rbMD2: TRadioButton
          Left = 8
          Top = 14
          Width = 41
          Height = 17
          Caption = 'MD2'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = rbMD2Click
        end
        object rbMD4: TRadioButton
          Left = 60
          Top = 14
          Width = 41
          Height = 17
          Caption = 'MD4'
          TabOrder = 1
          OnClick = rbMD4Click
        end
        object rbMD5: TRadioButton
          Left = 112
          Top = 14
          Width = 41
          Height = 17
          Caption = 'MD5'
          TabOrder = 2
          OnClick = rbMD5Click
        end
        object rbSHA1: TRadioButton
          Left = 164
          Top = 14
          Width = 53
          Height = 17
          Caption = 'SHA-1'
          TabOrder = 3
          OnClick = rbSHA1Click
        end
        object rbRipEmd: TRadioButton
          Left = 224
          Top = 14
          Width = 85
          Height = 17
          Caption = 'RIPEMD-160'
          TabOrder = 4
          OnClick = rbRipEmdClick
        end
      end
      object GroupBox2: TGroupBox
        Left = 4
        Top = 80
        Width = 601
        Height = 117
        Caption = #1044#1072#1085#1085#1099#1077
        TabOrder = 2
        object Label1: TLabel
          Left = 8
          Top = 20
          Width = 76
          Height = 13
          Caption = #1056#1077#1089#1091#1088#1089' '#1076#1072#1085#1085#1099#1093
        end
        object Label8: TLabel
          Left = 8
          Top = 64
          Width = 58
          Height = 13
          Caption = #1048#1079#1083#1086#1078#1077#1085#1080#1077
        end
        object EditDgData: TEdit
          Left = 8
          Top = 36
          Width = 505
          Height = 21
          TabOrder = 0
        end
        object EditDigest: TEdit
          Left = 8
          Top = 80
          Width = 313
          Height = 21
          ReadOnly = True
          TabOrder = 4
        end
        object btDigest: TButton
          Left = 520
          Top = 36
          Width = 73
          Height = 21
          Caption = #1048#1079#1083#1086#1078#1080#1090#1100
          TabOrder = 3
          OnClick = btDigestClick
        end
        object rbDgDataHex: TRadioButton
          Left = 444
          Top = 12
          Width = 45
          Height = 17
          Caption = 'Hex'
          TabOrder = 1
          OnClick = rbDgDataHexClick
        end
        object rbDgDataStr: TRadioButton
          Left = 492
          Top = 12
          Width = 37
          Height = 17
          Caption = 'Str'
          Checked = True
          TabOrder = 2
          TabStop = True
          OnClick = rbDgDataStrClick
        end
      end
      object ToolBar3: TToolBar
        Left = 0
        Top = 0
        Width = 616
        Height = 29
        BorderWidth = 1
        ButtonHeight = 21
        ButtonWidth = 128
        Caption = 'ToolBar3'
        EdgeBorders = [ebBottom]
        Flat = True
        ShowCaptions = True
        TabOrder = 0
        object tbFileDigest: TToolButton
          Left = 0
          Top = 0
          Caption = #1060#1072#1081#1083#1086#1074#1086#1077' '#1080#1079#1083#1086#1078#1077#1085#1080#1077'...'
          ImageIndex = 0
          OnClick = tbDigestFileClick
        end
      end
    end
    object TabCoding: TTabSheet
      Caption = #1050#1086#1076#1080#1088#1086#1074#1072#1085#1080#1077
      ImageIndex = 3
      object ToolBar4: TToolBar
        Left = 0
        Top = 0
        Width = 616
        Height = 29
        BorderWidth = 1
        ButtonHeight = 21
        ButtonWidth = 121
        Caption = 'ToolBar1'
        EdgeBorders = [ebBottom]
        Flat = True
        ShowCaptions = True
        TabOrder = 0
        object tbEncodeFile: TToolButton
          Left = 0
          Top = 0
          Caption = #1047#1072#1096#1080#1092#1088#1086#1074#1072#1090#1100' '#1092#1072#1081#1083'...'
          ImageIndex = 5
          OnClick = tbEncodeFileClick
        end
        object tbDecodeFile: TToolButton
          Left = 121
          Top = 0
          Caption = #1056#1072#1089#1096#1080#1092#1088#1086#1074#1072#1090#1100' '#1092#1072#1081#1083'...'
          ImageIndex = 6
          OnClick = tbDecodeFileClick
        end
      end
      object GroupBox3: TGroupBox
        Left = 4
        Top = 32
        Width = 317
        Height = 37
        Caption = #1040#1083#1075#1086#1088#1080#1090#1084
        TabOrder = 1
        object rbBase64: TRadioButton
          Left = 8
          Top = 14
          Width = 61
          Height = 17
          Caption = 'Base64'
          Checked = True
          TabOrder = 0
          TabStop = True
        end
      end
      object GroupBox4: TGroupBox
        Left = 4
        Top = 80
        Width = 601
        Height = 201
        Caption = #1044#1072#1085#1085#1099#1077
        TabOrder = 2
        object Label9: TLabel
          Left = 8
          Top = 20
          Width = 76
          Height = 13
          Caption = #1056#1077#1089#1091#1088#1089' '#1076#1072#1085#1085#1099#1093
        end
        object Label10: TLabel
          Left = 8
          Top = 64
          Width = 110
          Height = 13
          Caption = #1050#1086#1076#1080#1088#1086#1074#1072#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
        end
        object Label11: TLabel
          Left = 8
          Top = 108
          Width = 124
          Height = 13
          Caption = #1044#1077#1082#1086#1076#1080#1088#1086#1074#1072#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
        end
        object EditCodeSource: TEdit
          Left = 8
          Top = 36
          Width = 489
          Height = 21
          TabOrder = 0
        end
        object EditEncoded: TEdit
          Left = 8
          Top = 80
          Width = 489
          Height = 21
          TabOrder = 1
        end
        object btEncode: TButton
          Left = 504
          Top = 36
          Width = 89
          Height = 21
          Caption = #1047#1072#1096#1080#1092#1088#1086#1074#1072#1090#1100
          TabOrder = 3
          OnClick = btEncodeClick
        end
        object EditDecoded: TEdit
          Left = 8
          Top = 124
          Width = 489
          Height = 21
          TabStop = False
          Enabled = False
          TabOrder = 2
        end
        object btDecode: TButton
          Left = 504
          Top = 80
          Width = 89
          Height = 21
          Caption = #1056#1072#1089#1096#1080#1092#1088#1086#1074#1072#1090#1100
          TabOrder = 4
          OnClick = btDecodeClick
        end
      end
    end
    object TabX509: TTabSheet
      Caption = 'X509 '#1057#1077#1088#1090#1080#1092#1080#1082#1072#1090
      ImageIndex = 5
      object PageControl3: TPageControl
        Left = 0
        Top = 29
        Width = 616
        Height = 405
        ActivePage = TabSheet2
        Align = alClient
        TabOrder = 0
        object TabSheet2: TTabSheet
          Caption = #1054#1073#1097#1077#1077
          object Image1: TImage
            Left = 8
            Top = 12
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
          object LabelCertFile: TLabel
            Left = 48
            Top = 23
            Width = 114
            Height = 13
            Caption = #1053#1086#1074#1099#1081' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object GroupBox5: TGroupBox
            Left = 8
            Top = 52
            Width = 225
            Height = 89
            Caption = 'X.509 '#1057#1077#1088#1090#1080#1092#1080#1082#1072#1090
            TabOrder = 0
            object Label2: TLabel
              Left = 14
              Top = 28
              Width = 37
              Height = 13
              Caption = #1042#1077#1088#1089#1080#1103
            end
            object Label3: TLabel
              Left = 13
              Top = 60
              Width = 86
              Height = 13
              Caption = #1057#1077#1088#1080#1081#1085#1099#1081' '#1085#1086#1084#1077#1088
            end
            object EditCertVersion: TEdit
              Left = 104
              Top = 24
              Width = 109
              Height = 21
              TabOrder = 0
              OnChange = EditCertVersionChange
            end
            object EditCertSerialNumber: TEdit
              Left = 104
              Top = 56
              Width = 109
              Height = 21
              TabOrder = 1
              OnChange = EditCertSerialNumberChange
            end
          end
        end
        object TabSheet18: TTabSheet
          Caption = #1044#1086#1089#1090#1086#1074#1077#1088#1085#1086#1089#1090#1100
          ImageIndex = 5
          object Label28: TLabel
            Left = 112
            Top = 16
            Width = 18
            Height = 13
            Caption = '&'#1043#1086#1076
            FocusControl = EditCertValidFromY
          end
          object Label29: TLabel
            Left = 176
            Top = 16
            Width = 33
            Height = 13
            Caption = '&'#1052#1077#1089#1103#1094
            FocusControl = EditCertValidFromM
          end
          object Label30: TLabel
            Left = 240
            Top = 16
            Width = 27
            Height = 13
            Caption = '&'#1044#1077#1085#1100
            FocusControl = EditCertValidFromD
          end
          object Label31: TLabel
            Left = 304
            Top = 16
            Width = 20
            Height = 13
            Caption = '&'#1063#1072#1089
            FocusControl = EditCertValidFromH
          end
          object Label32: TLabel
            Left = 368
            Top = 16
            Width = 31
            Height = 13
            Caption = #1052#1080'&'#1085#1091#1090
            FocusControl = EditCertValidFromN
          end
          object Label33: TLabel
            Left = 431
            Top = 16
            Width = 42
            Height = 13
            Caption = '&'#1057#1077#1082#1091#1085#1076#1072
            FocusControl = EditCertValidFromS
          end
          object Label34: TLabel
            Left = 112
            Top = 68
            Width = 18
            Height = 13
            Caption = '&'#1043#1086#1076
            FocusControl = EditCertValidToY
          end
          object Label35: TLabel
            Left = 176
            Top = 68
            Width = 33
            Height = 13
            Caption = '&'#1052#1077#1089#1103#1094
            FocusControl = EditCertValidToM
          end
          object Label36: TLabel
            Left = 240
            Top = 68
            Width = 27
            Height = 13
            Caption = '&'#1044#1077#1085#1100
            FocusControl = EditCertValidToD
          end
          object Label37: TLabel
            Left = 304
            Top = 68
            Width = 20
            Height = 13
            Caption = '&'#1063#1072#1089
            FocusControl = EditCertValidToH
          end
          object Label38: TLabel
            Left = 368
            Top = 68
            Width = 31
            Height = 13
            Caption = #1052#1080'&'#1085#1091#1090
            FocusControl = EditCertValidToN
          end
          object Label39: TLabel
            Left = 431
            Top = 68
            Width = 36
            Height = 13
            Caption = '&'#1057#1077#1082#1091#1085#1076
            FocusControl = EditCertValidToS
          end
          object Label40: TLabel
            Left = 8
            Top = 36
            Width = 85
            Height = 13
            Caption = #1044#1077#1081#1089#1090#1074#1080#1090#1077#1083#1077#1085' '#1089':'
          end
          object Label41: TLabel
            Left = 8
            Top = 88
            Width = 91
            Height = 13
            Caption = #1044#1077#1081#1089#1090#1074#1080#1090#1077#1083#1077#1085' '#1087#1086':'
          end
          object EditCertValidFromY: TEdit
            Left = 112
            Top = 32
            Width = 53
            Height = 21
            MaxLength = 2
            TabOrder = 0
            OnChange = EditCertValidFromChange
          end
          object EditCertValidFromM: TEdit
            Left = 176
            Top = 32
            Width = 53
            Height = 21
            MaxLength = 2
            TabOrder = 1
            OnChange = EditCertValidFromChange
          end
          object EditCertValidFromD: TEdit
            Left = 240
            Top = 32
            Width = 53
            Height = 21
            MaxLength = 2
            TabOrder = 2
            OnChange = EditCertValidFromChange
          end
          object EditCertValidFromH: TEdit
            Left = 304
            Top = 32
            Width = 53
            Height = 21
            MaxLength = 2
            TabOrder = 3
            OnChange = EditCertValidFromChange
          end
          object EditCertValidFromN: TEdit
            Left = 368
            Top = 32
            Width = 53
            Height = 21
            MaxLength = 2
            TabOrder = 4
            OnChange = EditCertValidFromChange
          end
          object EditCertValidFromS: TEdit
            Left = 432
            Top = 32
            Width = 53
            Height = 21
            MaxLength = 2
            TabOrder = 5
            OnChange = EditCertValidFromChange
          end
          object EditCertValidToY: TEdit
            Left = 112
            Top = 84
            Width = 53
            Height = 21
            MaxLength = 2
            TabOrder = 6
            OnChange = EditCertValidToChange
          end
          object EditCertValidToM: TEdit
            Left = 176
            Top = 84
            Width = 53
            Height = 21
            MaxLength = 2
            TabOrder = 7
            OnChange = EditCertValidToChange
          end
          object EditCertValidToD: TEdit
            Left = 240
            Top = 84
            Width = 53
            Height = 21
            MaxLength = 2
            TabOrder = 8
            OnChange = EditCertValidToChange
          end
          object EditCertValidToH: TEdit
            Left = 304
            Top = 84
            Width = 53
            Height = 21
            MaxLength = 2
            TabOrder = 9
            OnChange = EditCertValidToChange
          end
          object EditCertValidToN: TEdit
            Left = 368
            Top = 84
            Width = 53
            Height = 21
            MaxLength = 2
            TabOrder = 10
            OnChange = EditCertValidToChange
          end
          object EditCertValidToS: TEdit
            Left = 432
            Top = 84
            Width = 53
            Height = 21
            MaxLength = 2
            TabOrder = 11
            OnChange = EditCertValidToChange
          end
        end
        object TabSheet4: TTabSheet
          Caption = #1054#1090#1082#1088#1099#1090#1099#1081' '#1082#1083#1102#1095
          ImageIndex = 1
          object Label4: TLabel
            Left = 8
            Top = 10
            Width = 49
            Height = 13
            Caption = #1040#1083#1075#1086#1088#1080#1090#1084
          end
          object EditCertPKAlgorithm: TEdit
            Left = 64
            Top = 12
            Width = 121
            Height = 21
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 0
          end
          object GroupBox6: TGroupBox
            Left = 5
            Top = 48
            Width = 592
            Height = 233
            Caption = 'RSA '#1054#1090#1082#1088#1099#1090#1099#1081' '#1082#1083#1102#1095
            TabOrder = 1
            object PageControl7: TPageControl
              Left = 8
              Top = 24
              Width = 485
              Height = 197
              ActivePage = TabSheet16
              TabOrder = 0
              object TabSheet16: TTabSheet
                Caption = #1052#1086#1076#1091#1083#1100
                object MemoCertPKMod: TMemo
                  Left = 0
                  Top = 0
                  Width = 477
                  Height = 169
                  Align = alClient
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  ScrollBars = ssVertical
                  TabOrder = 0
                end
              end
              object TabSheet17: TTabSheet
                Caption = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1100
                ImageIndex = 1
                object MemoCertPKExp: TMemo
                  Left = 0
                  Top = 0
                  Width = 477
                  Height = 169
                  Align = alClient
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  ScrollBars = ssVertical
                  TabOrder = 0
                end
              end
            end
            object BtnCertPKLoad: TButton
              Left = 504
              Top = 44
              Width = 75
              Height = 25
              Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100'...'
              TabOrder = 1
              OnClick = BtnCertPKLoadClick
            end
          end
        end
        object TabSheet5: TTabSheet
          Caption = #1057#1080#1075#1085#1072#1090#1091#1088#1072
          ImageIndex = 2
          object Label12: TLabel
            Left = 328
            Top = 56
            Width = 69
            Height = 13
            Caption = 'ID - '#1040#1083#1075#1086#1088#1080#1090#1084
          end
          object Label27: TLabel
            Left = 8
            Top = 104
            Width = 48
            Height = 13
            Caption = #1047#1085#1072#1095#1077#1085#1080#1077
          end
          object RadioCertSign: TRadioGroup
            Left = 8
            Top = 12
            Width = 309
            Height = 81
            Caption = #1040#1083#1075#1086#1088#1080#1090#1084
            Columns = 2
            Items.Strings = (
              'MD2 with RSA'
              'MD4 with RSA'
              'MD5 with RSA'
              'SHA1 with RSA'
              #1044#1088#1091#1075#1086#1077)
            TabOrder = 0
            OnClick = RadioCertSignClick
          end
          object EditCertSignOID: TEdit
            Left = 328
            Top = 72
            Width = 121
            Height = 21
            TabOrder = 1
          end
          object MemoCertSignValue: TMemo
            Left = 8
            Top = 120
            Width = 441
            Height = 129
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 2
          end
          object BtnCertUpdateSign: TButton
            Left = 460
            Top = 156
            Width = 75
            Height = 25
            Caption = #1054#1073#1085#1086#1074#1083#1077#1085#1080#1077
            TabOrder = 3
            OnClick = BtnCertUpdateSignClick
          end
          object BtnVerifySignature: TButton
            Left = 460
            Top = 120
            Width = 75
            Height = 25
            Caption = #1055#1088#1086#1074#1077#1088#1082#1072
            TabOrder = 4
            OnClick = BtnVerifySignatureClick
          end
        end
        object TabSheet14: TTabSheet
          Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082'('#1050#1088#1080#1087#1090#1086#1087#1088#1086#1074#1072#1081#1076#1077#1088')'
          ImageIndex = 3
          object Label7: TLabel
            Left = 12
            Top = 8
            Width = 84
            Height = 13
            Caption = #1054#1073#1097#1077#1077' '#1048#1084#1103' (CN)'
            FocusControl = EditCertCN
          end
          object Label13: TLabel
            Left = 12
            Top = 52
            Width = 52
            Height = 13
            Caption = #1057#1090#1088#1072#1085#1072' (C)'
            FocusControl = EditCertC
          end
          object Label15: TLabel
            Left = 12
            Top = 96
            Width = 82
            Height = 13
            Caption = #1051#1086#1082#1072#1083#1100#1085#1086#1089#1090#1100' (L)'
            FocusControl = EditCertL
          end
          object Label16: TLabel
            Left = 12
            Top = 140
            Width = 144
            Height = 13
            Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' / '#1055#1088#1086#1074#1080#1085#1094#1080#1103' (ST)'
            FocusControl = EditCertST
          end
          object Label17: TLabel
            Left = 12
            Top = 184
            Width = 84
            Height = 13
            Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103' (O)'
            FocusControl = EditCertO
          end
          object Label18: TLabel
            Left = 12
            Top = 228
            Width = 161
            Height = 13
            Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1086#1085#1085#1072#1103' '#1077#1076#1080#1085#1080#1094#1072' (OU)'
          end
          object Label19: TLabel
            Left = 12
            Top = 272
            Width = 121
            Height = 13
            Caption = #1055#1086#1095#1090#1086#1074#1099#1081' '#1072#1076#1088#1077#1089' (E-Mail)'
            FocusControl = EditCertEMail
          end
          object EditCertCN: TEdit
            Left = 12
            Top = 24
            Width = 425
            Height = 21
            TabOrder = 0
            OnChange = EditCertCNChange
          end
          object EditCertC: TEdit
            Left = 12
            Top = 68
            Width = 425
            Height = 21
            TabOrder = 1
            OnChange = EditCertCChange
          end
          object EditCertL: TEdit
            Left = 12
            Top = 112
            Width = 425
            Height = 21
            TabOrder = 2
            OnChange = EditCertLChange
          end
          object EditCertST: TEdit
            Left = 12
            Top = 156
            Width = 425
            Height = 21
            TabOrder = 3
            OnChange = EditCertSTChange
          end
          object EditCertO: TEdit
            Left = 12
            Top = 200
            Width = 425
            Height = 21
            TabOrder = 4
            OnChange = EditCertOChange
          end
          object EditCertOU: TEdit
            Left = 12
            Top = 244
            Width = 425
            Height = 21
            TabOrder = 5
            OnChange = EditCertOUChange
          end
          object EditCertEMail: TEdit
            Left = 12
            Top = 288
            Width = 425
            Height = 21
            TabOrder = 6
            OnChange = EditCertEMailChange
          end
        end
        object TabSheet15: TTabSheet
          Caption = #1057#1091#1073#1098#1077#1082#1090'('#1055#1086#1083#1091#1095#1072#1090#1077#1083#1100')'
          ImageIndex = 4
          object Label20: TLabel
            Left = 12
            Top = 8
            Width = 84
            Height = 13
            Caption = #1054#1073#1097#1077#1077' '#1048#1084#1103' (CN)'
            FocusControl = EditCertSubCN
          end
          object Label21: TLabel
            Left = 12
            Top = 52
            Width = 52
            Height = 13
            Caption = #1057#1090#1088#1072#1085#1072' (C)'
            FocusControl = EditCertSubC
          end
          object Label22: TLabel
            Left = 12
            Top = 96
            Width = 82
            Height = 13
            Caption = #1051#1086#1082#1072#1083#1100#1085#1086#1089#1090#1100' (L)'
            FocusControl = EditCertSubL
          end
          object Label23: TLabel
            Left = 12
            Top = 140
            Width = 144
            Height = 13
            Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' / '#1055#1088#1086#1074#1080#1085#1094#1080#1103' (ST)'
            FocusControl = EditCertSubST
          end
          object Label24: TLabel
            Left = 12
            Top = 184
            Width = 84
            Height = 13
            Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103' (O)'
            FocusControl = EditCertSubO
          end
          object Label25: TLabel
            Left = 12
            Top = 228
            Width = 161
            Height = 13
            Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1086#1085#1085#1072#1103' '#1077#1076#1080#1085#1080#1094#1072' (OU)'
          end
          object Label26: TLabel
            Left = 12
            Top = 272
            Width = 121
            Height = 13
            Caption = #1055#1086#1095#1090#1086#1074#1099#1081' '#1072#1076#1088#1077#1089' (E-Mail)'
            FocusControl = EditCertSubEMail
          end
          object EditCertSubCN: TEdit
            Left = 12
            Top = 24
            Width = 425
            Height = 21
            TabOrder = 0
            OnChange = EditCertSubCNChange
          end
          object EditCertSubC: TEdit
            Left = 12
            Top = 68
            Width = 425
            Height = 21
            TabOrder = 1
            OnChange = EditCertSubCChange
          end
          object EditCertSubL: TEdit
            Left = 12
            Top = 112
            Width = 425
            Height = 21
            TabOrder = 2
            OnChange = EditCertSubLChange
          end
          object EditCertSubST: TEdit
            Left = 12
            Top = 156
            Width = 425
            Height = 21
            TabOrder = 3
            OnChange = EditCertSubSTChange
          end
          object EditCertSubO: TEdit
            Left = 12
            Top = 200
            Width = 425
            Height = 21
            TabOrder = 4
            OnChange = EditCertSubOChange
          end
          object EditCertSubOU: TEdit
            Left = 12
            Top = 244
            Width = 425
            Height = 21
            TabOrder = 5
            OnChange = EditCertSubOUChange
          end
          object EditCertSubEMail: TEdit
            Left = 12
            Top = 288
            Width = 425
            Height = 21
            TabOrder = 6
            OnChange = EditCertSubEMailChange
          end
        end
        object TabSheet19: TTabSheet
          Caption = #1056#1072#1089#1096#1080#1088#1077#1085#1080#1103
          ImageIndex = 6
          object StringGrid1: TStringGrid
            Left = 0
            Top = 0
            Width = 449
            Height = 377
            Align = alLeft
            ColCount = 3
            DefaultColWidth = 200
            DefaultRowHeight = 16
            FixedCols = 0
            RowCount = 33
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goAlwaysShowEditor]
            TabOrder = 0
            OnSelectCell = StringGrid1SelectCell
            OnSetEditText = StringGrid1SetEditText
            ColWidths = (
              148
              222
              55)
          end
          object ComboBoxYesNo: TComboBox
            Left = 372
            Top = 17
            Width = 53
            Height = 21
            Style = csDropDownList
            DropDownCount = 2
            ItemHeight = 13
            TabOrder = 1
            Visible = False
            OnClick = ComboBoxYesNoClick
            Items.Strings = (
              'Yes'
              'No')
          end
        end
      end
      object ToolBar7: TToolBar
        Left = 0
        Top = 0
        Width = 616
        Height = 29
        BorderWidth = 1
        ButtonHeight = 21
        ButtonWidth = 222
        Caption = 'ToolBar1'
        EdgeBorders = [ebBottom]
        Flat = True
        ShowCaptions = True
        TabOrder = 1
        object btnLoadCert: TToolButton
          Left = 0
          Top = 0
          Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1076#1072#1085#1085#1099#1093' '#1080#1079' '#1092#1072#1081#1083#1072' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1072'...'
          ImageIndex = 0
          OnClick = btnLoadCertClick
        end
        object BtnSaveCert: TToolButton
          Left = 222
          Top = 0
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1074' '#1092#1072#1081#1083' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1072'...'
          ImageIndex = 3
          OnClick = BtnSaveCertClick
        end
        object CheckBox1: TCheckBox
          Left = 444
          Top = 0
          Width = 157
          Height = 21
          Caption = #1058#1088#1072#1085#1089#1083#1080#1090' '#1085#1072' '#1040#1085#1075#1083#1080#1081#1089#1082#1080#1081
          TabOrder = 0
          OnClick = CheckBox1Click
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = #1056#1072#1079#1073#1086#1088' DER '#1092#1072#1081#1083#1072
      ImageIndex = 6
      object Splitter1: TSplitter
        Left = 0
        Top = 265
        Width = 616
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object ToolBar6: TToolBar
        Left = 0
        Top = 0
        Width = 616
        Height = 29
        BorderWidth = 1
        ButtonHeight = 21
        ButtonWidth = 88
        Caption = 'ToolBar6'
        EdgeBorders = [ebBottom]
        Flat = True
        ShowCaptions = True
        TabOrder = 0
        object btnParseDerFile: TToolButton
          Left = 0
          Top = 0
          Caption = #1056#1072#1079#1073#1086#1088' '#1092#1072#1081#1083#1072'...'
          ImageIndex = 0
          OnClick = btnParseDerFileClick
        end
      end
      object TreeViewDer: TTreeView
        Left = 0
        Top = 29
        Width = 616
        Height = 236
        Align = alTop
        Indent = 19
        TabOrder = 1
        OnClick = TreeViewDerClick
      end
      object MemoDerHex: TMemo
        Left = 0
        Top = 268
        Width = 616
        Height = 166
        Align = alClient
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 2
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Log'
      ImageIndex = 2
      TabVisible = False
      object MemoLog: TMemo
        Left = 0
        Top = 29
        Width = 610
        Height = 403
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object ToolBar2: TToolBar
        Left = 0
        Top = 0
        Width = 610
        Height = 29
        BorderWidth = 1
        ButtonHeight = 21
        ButtonWidth = 48
        Caption = 'ToolBar2'
        EdgeBorders = [ebBottom]
        Flat = True
        ShowCaptions = True
        TabOrder = 1
        object tbClearLog: TToolButton
          Left = 0
          Top = 0
          Caption = 'Clear log'
          ImageIndex = 0
          OnClick = tbClearLogClick
        end
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 518
    Top = 80
  end
  object SaveDialog1: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 552
    Top = 80
  end
end

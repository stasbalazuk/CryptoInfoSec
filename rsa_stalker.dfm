object Form1: TForm1
  Left = 180
  Top = 124
  BorderStyle = bsToolWindow
  Caption = 'RSA - '#1064#1080#1092#1088#1086#1074#1072#1085#1080#1077
  ClientHeight = 485
  ClientWidth = 846
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 467
    Width = 846
    Height = 18
    Panels = <
      item
        Width = 50
      end>
  end
  object Pages1: TPageControl
    Left = 0
    Top = 0
    Width = 846
    Height = 467
    ActivePage = tabRSA
    Align = alClient
    Constraints.MinHeight = 460
    Constraints.MinWidth = 618
    TabOrder = 1
    TabPosition = tpBottom
    object TabSymmetric: TTabSheet
      Caption = 'Symmetric'
      TabVisible = False
      object GroupAlgo: TGroupBox
        Left = 4
        Top = 32
        Width = 497
        Height = 37
        Caption = 'Algorithm'
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
        Caption = 'Key'
        TabOrder = 2
        object LabelSymKey: TLabel
          Left = 12
          Top = 36
          Width = 18
          Height = 13
          Caption = 'Key'
        end
        object Label5: TLabel
          Left = 12
          Top = 16
          Width = 97
          Height = 13
          Caption = 'Generate key of size'
        end
        object LabelSymKeyLim: TLabel
          Left = 188
          Top = 16
          Width = 120
          Height = 13
          Caption = '8..256 bytes, multiple of 8'
        end
        object EditSymKey: TEdit
          Left = 12
          Top = 52
          Width = 513
          Height = 21
          TabOrder = 1
        end
        object btUpdSymKey: TButton
          Left = 540
          Top = 16
          Width = 53
          Height = 21
          Caption = 'Update'
          Default = True
          TabOrder = 6
          OnClick = btUpdSymKeyClick
        end
        object rbSymKeyHex: TRadioButton
          Left = 444
          Top = 32
          Width = 45
          Height = 17
          Caption = 'Hex'
          Checked = True
          TabOrder = 2
          TabStop = True
          OnClick = rbSymKeyHexClick
        end
        object rbSymKeyStr: TRadioButton
          Left = 492
          Top = 32
          Width = 37
          Height = 17
          Caption = 'Str'
          TabOrder = 3
          OnClick = rbSymKeyStrClick
        end
        object btSaveSymKey: TButton
          Left = 540
          Top = 112
          Width = 53
          Height = 21
          Caption = 'Save'
          TabOrder = 9
          OnClick = btSaveSymKeyClick
        end
        object btGenSymKey: TButton
          Left = 540
          Top = 48
          Width = 53
          Height = 21
          Caption = 'Generate'
          TabOrder = 7
          OnClick = btGenSymKeyClick
        end
        object btLoadSymKey: TButton
          Left = 540
          Top = 80
          Width = 53
          Height = 21
          Caption = 'Load'
          TabOrder = 8
          OnClick = btLoadSymKeyClick
        end
        object EditSymKeyLen: TEdit
          Left = 120
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
          Left = 424
          Top = 107
          Width = 93
          Height = 13
          Caption = 'Use Safer SK'
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
        Caption = 'Data'
        TabOrder = 4
        object PageControlSym: TPageControl
          Left = 8
          Top = 16
          Width = 521
          Height = 133
          ActivePage = TabSheet11
          TabOrder = 2
          object TabSheet11: TTabSheet
            BorderWidth = 2
            Caption = 'Message'
            object MemoSym1: TMemo
              Left = 0
              Top = 0
              Width = 509
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
            Caption = 'Encryption'
            ImageIndex = 1
            object MemoSym2: TMemo
              Left = 0
              Top = 0
              Width = 509
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
            Caption = 'Decryption'
            ImageIndex = 2
            object MemoSym3: TMemo
              Left = 0
              Top = 0
              Width = 509
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
          Left = 444
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
          Left = 492
          Top = 16
          Width = 37
          Height = 17
          Caption = 'Str'
          TabOrder = 1
          OnClick = rbSymDataStrClick
        end
        object btEncryptSym: TButton
          Left = 540
          Top = 12
          Width = 53
          Height = 21
          Caption = 'Encrypt'
          TabOrder = 3
          OnClick = btEncryptSymClick
        end
        object btDecryptSym: TButton
          Left = 540
          Top = 41
          Width = 53
          Height = 21
          Caption = 'Decrypt'
          TabOrder = 4
          OnClick = btDecryptSymClick
        end
        object btClearSymData: TButton
          Left = 540
          Top = 70
          Width = 53
          Height = 21
          Caption = 'Clear'
          TabOrder = 5
          OnClick = btClearSymDataClick
        end
        object btLoadSymData: TButton
          Left = 540
          Top = 99
          Width = 53
          Height = 21
          Caption = 'Load'
          TabOrder = 6
          OnClick = btLoadSymDataClick
        end
        object btSaveSymData: TButton
          Left = 540
          Top = 128
          Width = 53
          Height = 21
          Caption = 'Save'
          TabOrder = 7
          OnClick = btSaveSymDataClick
        end
      end
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 838
        Height = 29
        BorderWidth = 1
        ButtonHeight = 21
        ButtonWidth = 69
        Caption = 'ToolBar1'
        EdgeBorders = [ebBottom]
        Flat = True
        ShowCaptions = True
        TabOrder = 0
        object tbEncryptSymFile: TToolButton
          Left = 0
          Top = 0
          Caption = 'Encrypt file...'
          ImageIndex = 1
          OnClick = tbEncryptSymFileClick
        end
        object tbDecryptSymFile: TToolButton
          Left = 69
          Top = 0
          Caption = 'Decrypt file...'
          ImageIndex = 2
          OnClick = tbDecryptSymFileClick
        end
      end
      object GroupCM: TGroupBox
        Left = 4
        Top = 226
        Width = 201
        Height = 37
        Caption = 'Cipher mode'
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
          TabOrder = 3
          OnClick = rbOFBClick
        end
      end
    end
    object tabRSA: TTabSheet
      Caption = 'RSA'
      ImageIndex = 4
      object GroupRsaKey: TGroupBox
        Left = 4
        Top = 76
        Width = 829
        Height = 185
        Caption = #1050#1083#1102#1095
        TabOrder = 3
        object Label14: TLabel
          Left = 28
          Top = 16
          Width = 70
          Height = 13
          Caption = #1044#1083#1080#1085#1072' '#1082#1083#1102#1095#1072':'
        end
        object LabelRsaKeyLim: TLabel
          Left = 184
          Top = 16
          Width = 73
          Height = 13
          Caption = '32 to 512 bytes'
        end
        object Label6: TLabel
          Left = 280
          Top = 16
          Width = 112
          Height = 13
          Caption = #1055#1091#1073#1083#1080#1095#1085#1099#1081' '#1101#1082#1089#1087#1086#1085#1077#1085#1090
        end
        object btUpdRsaKey: TButton
          Left = 712
          Top = 68
          Width = 105
          Height = 21
          Caption = #1054#1073#1085#1086#1074#1080#1090#1100
          TabOrder = 2
          OnClick = btUpdRsaKeyClick
        end
        object btSaveRsaKey: TButton
          Left = 712
          Top = 156
          Width = 105
          Height = 21
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
          TabOrder = 5
          OnClick = btSaveRsaKeyClick
        end
        object btGenRsaKey: TButton
          Left = 712
          Top = 97
          Width = 105
          Height = 21
          Caption = #1043#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100
          TabOrder = 3
          OnClick = btGenRsaKeyClick
        end
        object btLoadRsaKey: TButton
          Left = 712
          Top = 127
          Width = 105
          Height = 21
          Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
          TabOrder = 4
          OnClick = btLoadRsaKeyClick
        end
        object EditRsaKeyLen: TEdit
          Left = 120
          Top = 12
          Width = 57
          Height = 21
          TabOrder = 0
          Text = '32'
        end
        object PageControl1: TPageControl
          Left = 8
          Top = 40
          Width = 697
          Height = 137
          ActivePage = TabRSAKeyD
          TabOrder = 6
          TabPosition = tpBottom
          TabStop = False
          object TabRSAKeyN: TTabSheet
            Caption = #1055#1091#1073#1083#1080#1095#1085#1099#1081' '#1082#1083#1102#1095
            object PageControl4: TPageControl
              Left = 0
              Top = 0
              Width = 689
              Height = 109
              ActivePage = TabSheet8
              TabOrder = 0
              object TabSheet7: TTabSheet
                Caption = #1055#1088#1080#1074#1072#1090#1085#1099#1081
                object MemoRSAPubMod: TMemo
                  Left = 0
                  Top = 0
                  Width = 681
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
                Caption = #1055#1091#1073#1083#1080#1095#1085#1099#1081
                ImageIndex = 1
                object MemoRSAPubExp: TMemo
                  Left = 0
                  Top = 0
                  Width = 681
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
            Caption = #1055#1088#1080#1074#1072#1090#1085#1099#1081' '#1082#1083#1102#1095
            ImageIndex = 1
            object PageControl5: TPageControl
              Left = 0
              Top = 0
              Width = 689
              Height = 111
              ActivePage = TabSheet10
              Align = alClient
              TabOrder = 0
              object TabSheet9: TTabSheet
                Caption = #1055#1088#1080#1074#1072#1090#1085#1099#1081
                object MemoRSAPrivMod: TMemo
                  Left = 0
                  Top = 0
                  Width = 681
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
                Caption = #1055#1091#1073#1083#1080#1095#1085#1099#1081
                ImageIndex = 1
                object MemoRSAPrivExp: TMemo
                  Left = 0
                  Top = 0
                  Width = 681
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
          object Seed: TTabSheet
            Caption = 'Seed'
            Enabled = False
            ImageIndex = 2
            TabVisible = False
            object MemoOAEPSeed: TMemo
              Left = 0
              Top = 0
              Width = 689
              Height = 111
              Align = alClient
              TabOrder = 0
            end
          end
        end
        object btClearRSAKey: TButton
          Left = 712
          Top = 40
          Width = 105
          Height = 21
          Caption = #1054#1095#1080#1089#1090#1080#1090#1100
          TabOrder = 1
          OnClick = btClearRSAKeyClick
        end
        object EditSmallPubExp: TEdit
          Left = 400
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
        Width = 829
        Height = 165
        Caption = #1044#1072#1085#1085#1099#1077
        TabOrder = 4
        object btEncryptRsa: TButton
          Left = 712
          Top = 20
          Width = 105
          Height = 21
          Caption = #1064#1080#1092#1088#1086#1074#1072#1085#1080#1077
          TabOrder = 0
          OnClick = btEncryptRsaClick
        end
        object btDecryptRsa: TButton
          Left = 712
          Top = 49
          Width = 105
          Height = 21
          Caption = #1056#1072#1089#1096#1080#1092#1088#1086#1074#1072#1085#1080#1077
          TabOrder = 1
          OnClick = btDecryptRsaClick
        end
        object PageControlRSA: TPageControl
          Left = 8
          Top = 16
          Width = 697
          Height = 133
          ActivePage = TabSheet6
          TabOrder = 2
          object TabRsa1: TTabSheet
            BorderWidth = 2
            Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077
            object MemoRsa1: TMemo
              Left = 0
              Top = 0
              Width = 685
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
            Caption = #1064#1080#1092#1088#1086#1074#1072#1085#1080#1077
            ImageIndex = 1
            object MemoRsa2: TMemo
              Left = 0
              Top = 0
              Width = 685
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
              Width = 685
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
          Left = 260
          Top = 16
          Width = 45
          Height = 17
          Caption = #1061#1077#1082#1089
          Checked = True
          TabOrder = 3
          TabStop = True
          OnClick = rbRsaDataHexClick
        end
        object rbRsaDataStr: TRadioButton
          Left = 312
          Top = 16
          Width = 65
          Height = 17
          Caption = #1057#1090#1088#1086#1082#1072
          TabOrder = 4
          OnClick = rbRsaDataStrClick
        end
        object btClearRsaData: TButton
          Left = 712
          Top = 78
          Width = 105
          Height = 21
          Caption = #1054#1095#1080#1089#1090#1080#1090#1100
          TabOrder = 5
          OnClick = btClearRsaDataClick
        end
        object btLoadRSAData: TButton
          Left = 712
          Top = 107
          Width = 105
          Height = 21
          Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
          TabOrder = 6
          OnClick = btLoadRSADataClick
        end
        object btSaveRSAData: TButton
          Left = 712
          Top = 136
          Width = 105
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
        Caption = #1042#1099#1073#1086#1088' '#1089#1093#1077#1084#1099
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
        Width = 838
        Height = 33
        BorderWidth = 1
        ButtonHeight = 21
        ButtonWidth = 116
        Caption = 'ToolBar5'
        EdgeBorders = [ebBottom]
        Flat = True
        ShowCaptions = True
        TabOrder = 0
        object tbEncryptRsaFile: TToolButton
          Left = 0
          Top = 0
          Caption = #1047#1072#1096#1080#1092#1088#1086#1074#1072#1090#1100
          ImageIndex = 0
          OnClick = tbEncryptRsaFileClick
        end
        object tbDecryptRsaFile: TToolButton
          Left = 116
          Top = 0
          Caption = #1056#1072#1089#1096#1080#1092#1088#1086#1074#1072#1090#1100
          ImageIndex = 1
          OnClick = tbDecryptRsaFileClick
        end
        object ToolButton3: TToolButton
          Left = 232
          Top = 0
          Width = 8
          Caption = 'ToolButton3'
          ImageIndex = 2
          Style = tbsSeparator
        end
        object tbSignFile: TToolButton
          Left = 240
          Top = 0
          Caption = #1055#1086#1076#1087#1080#1089#1072#1090#1100' '#1092#1072#1081#1083'...'
          ImageIndex = 2
          OnClick = tbSignFileClick
        end
        object ToolButton6: TToolButton
          Left = 356
          Top = 0
          Width = 8
          Caption = 'ToolButton6'
          ImageIndex = 4
          Style = tbsSeparator
        end
        object tbVerifyFile: TToolButton
          Left = 364
          Top = 0
          Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1087#1086#1076#1087#1080#1089#1100'...'
          ImageIndex = 3
          OnClick = tbVerifyFileClick
        end
        object btnImportRSAKeyPair: TToolButton
          Left = 480
          Top = 0
          Caption = #1048#1084#1087#1086#1088#1090' '#1082#1083#1102#1095#1077#1081
          ImageIndex = 5
          OnClick = btnImportRSAKeyPairClick
        end
        object btnExportRSAKeyPair: TToolButton
          Left = 596
          Top = 0
          Caption = #1069#1082#1089#1087#1086#1088#1090' '#1082#1083#1102#1095#1077#1081
          ImageIndex = 6
          OnClick = btnExportRSAKeyPairClick
        end
        object tbTestRsaKey: TToolButton
          Left = 712
          Top = 0
          Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1082#1083#1102#1095#1077#1081
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
        Color = clWindow
        TabOrder = 2
        object LabelRsaDigest: TLabel
          Left = 7
          Top = 10
          Width = 89
          Height = 13
          Caption = #1057#1093#1077#1084#1072' '#1072#1083#1075#1086#1088#1080#1090#1084#1072
        end
        object cbRsaDigest: TComboBox
          Left = 104
          Top = 5
          Width = 81
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
    object TabSheet3: TTabSheet
      Caption = 'Log'
      ImageIndex = 2
      TabVisible = False
      object MemoLog: TMemo
        Left = 0
        Top = 29
        Width = 838
        Height = 405
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object ToolBar2: TToolBar
        Left = 0
        Top = 0
        Width = 838
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
    Top = 40
  end
  object SaveDialog1: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 544
    Top = 40
  end
end

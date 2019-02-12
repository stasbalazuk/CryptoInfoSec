object fcod: Tfcod
  Left = 827
  Top = 299
  AutoSize = True
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1050#1086#1076#1080#1088#1086#1074#1082#1072' '#1092#1072#1081#1083#1072
  ClientHeight = 324
  ClientWidth = 280
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  PrintScale = poNone
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object dblInputFileSize: TLabel
    Left = 8
    Top = 40
    Width = 80
    Height = 15
    Caption = #1056#1072#1079#1084#1077#1088' '#1092#1072#1081#1083#1072':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object lblInputFileSize1: TLabel
    Left = 112
    Top = 40
    Width = 6
    Height = 15
    Caption = '0'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object lbl1: TLabel
    Left = 8
    Top = 0
    Width = 90
    Height = 15
    Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1092#1072#1081#1083':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 8
    Top = 64
    Width = 99
    Height = 15
    Caption = #1042#1099#1093#1086#1076#1103#1097#1080#1081' '#1092#1072#1081#1083':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object grpOptions: TGroupBox
    Left = 0
    Top = 106
    Width = 280
    Height = 183
    Align = alBottom
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object lblCipher: TLabel
      Left = 8
      Top = 16
      Width = 85
      Height = 15
      Caption = #1042#1099#1073#1086#1088' '#1064#1080#1092#1088#1072':'
    end
    object lblHash: TLabel
      Left = 120
      Top = 16
      Width = 75
      Height = 15
      Caption = #1042#1099#1073#1086#1088' '#1061#1077#1096#1072':'
    end
    object lblKeySize: TLabel
      Left = 8
      Top = 64
      Width = 76
      Height = 15
      Caption = #1044#1083#1080#1085#1072' '#1082#1083#1102#1095#1072':'
    end
    object dblKeySize: TLabel
      Left = 108
      Top = 64
      Width = 60
      Height = 15
      Caption = 'dblKeySize'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object lblPassphrase: TLabel
      Left = 8
      Top = 88
      Width = 44
      Height = 15
      Caption = #1055#1072#1088#1086#1083#1100':'
    end
    object lblConfirmPassphrase: TLabel
      Left = 8
      Top = 136
      Width = 104
      Height = 15
      Caption = #1055#1086#1074#1090#1086#1088#1080#1090#1077' '#1087#1072#1088#1086#1083#1100':'
    end
    object cbxCipher: TComboBox
      Left = 8
      Top = 32
      Width = 105
      Height = 23
      Style = csDropDownList
      ItemHeight = 15
      Sorted = True
      TabOrder = 0
      OnChange = cbxCipherChange
    end
    object cbxHash: TComboBox
      Left = 120
      Top = 32
      Width = 153
      Height = 23
      Style = csDropDownList
      ItemHeight = 15
      Sorted = True
      TabOrder = 1
      OnChange = cbxCipherChange
    end
    object boxPassphrase: TEdit
      Left = 8
      Top = 104
      Width = 265
      Height = 23
      PasswordChar = '*'
      TabOrder = 2
      OnChange = boxPassphraseChange
    end
    object boxConfirmPassphrase: TEdit
      Left = 8
      Top = 152
      Width = 265
      Height = 23
      PasswordChar = '*'
      TabOrder = 3
      OnChange = boxPassphraseChange
    end
  end
  object Edit1InputFile: TEdit
    Left = 8
    Top = 16
    Width = 265
    Height = 23
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnExit = Edit1InputFileExit
  end
  object boxOutputFile: TEdit
    Left = 8
    Top = 80
    Width = 265
    Height = 23
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object grp1: TGroupBox
    Left = 0
    Top = 289
    Width = 280
    Height = 35
    Align = alBottom
    TabOrder = 3
    object btnEncrypt: TButton
      Left = 8
      Top = 5
      Width = 97
      Height = 25
      Caption = #1047#1072#1096#1080#1092#1088#1086#1074#1072#1090#1100
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnEncryptClick
    end
    object btnDecrypt: TButton
      Left = 104
      Top = 5
      Width = 105
      Height = 25
      Caption = #1056#1072#1089#1096#1080#1092#1088#1086#1074#1072#1090#1100
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnDecryptClick
    end
    object btnClose: TButton
      Left = 208
      Top = 5
      Width = 66
      Height = 25
      Cancel = True
      Caption = #1042#1099#1093#1086#1076
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnCloseClick
    end
  end
  object DCP_blowfish1: TDCP_blowfish
    Id = 5
    Algorithm = 'Blowfish'
    MaxKeySize = 448
    BlockSize = 64
    Left = 296
    Top = 16
  end
  object DCP_cast1281: TDCP_cast128
    Id = 7
    Algorithm = 'Cast128'
    MaxKeySize = 128
    BlockSize = 64
    Left = 328
    Top = 16
  end
  object DCP_des1: TDCP_des
    Id = 23
    Algorithm = 'DES'
    MaxKeySize = 64
    BlockSize = 64
    Left = 360
    Top = 16
  end
  object DCP_3des1: TDCP_3des
    Id = 24
    Algorithm = '3DES'
    MaxKeySize = 192
    BlockSize = 64
    Left = 392
    Top = 16
  end
  object DCP_ice1: TDCP_ice
    Id = 20
    Algorithm = 'Ice'
    MaxKeySize = 64
    BlockSize = 64
    Left = 424
    Top = 16
  end
  object DCP_thinice1: TDCP_thinice
    Id = 21
    Algorithm = 'Thin Ice'
    MaxKeySize = 64
    BlockSize = 64
    Left = 456
    Top = 16
  end
  object DCP_ice21: TDCP_ice2
    Id = 22
    Algorithm = 'Ice2'
    MaxKeySize = 128
    BlockSize = 64
    Left = 488
    Top = 16
  end
  object DCP_rc21: TDCP_rc2
    Id = 1
    Algorithm = 'RC2'
    MaxKeySize = 1024
    BlockSize = 64
    Left = 296
    Top = 48
  end
  object DCP_rc41: TDCP_rc4
    Id = 19
    Algorithm = 'RC4'
    MaxKeySize = 2048
    Left = 328
    Top = 48
  end
  object DCP_rijndael1: TDCP_rijndael
    Id = 9
    Algorithm = 'Rijndael'
    MaxKeySize = 256
    BlockSize = 128
    Left = 360
    Top = 48
  end
  object DCP_serpent1: TDCP_serpent
    Id = 26
    Algorithm = 'Serpent'
    MaxKeySize = 256
    BlockSize = 128
    Left = 392
    Top = 48
  end
  object DCP_tea1: TDCP_tea
    Id = 25
    Algorithm = 'Tea'
    MaxKeySize = 128
    BlockSize = 64
    Left = 424
    Top = 48
  end
  object DCP_twofish1: TDCP_twofish
    Id = 6
    Algorithm = 'Twofish'
    MaxKeySize = 256
    BlockSize = 128
    Left = 456
    Top = 48
  end
  object DCP_haval1: TDCP_haval
    Id = 14
    Algorithm = 'Haval (256bit, 5 passes)'
    HashSize = 256
    Left = 296
    Top = 104
  end
  object DCP_md41: TDCP_md4
    Id = 17
    Algorithm = 'MD4'
    HashSize = 128
    Left = 328
    Top = 104
  end
  object DCP_md51: TDCP_md5
    Id = 16
    Algorithm = 'MD5'
    HashSize = 128
    Left = 360
    Top = 104
  end
  object DCP_ripemd1281: TDCP_ripemd128
    Id = 27
    Algorithm = 'RipeMD-128'
    HashSize = 128
    Left = 392
    Top = 104
  end
  object DCP_ripemd1601: TDCP_ripemd160
    Id = 10
    Algorithm = 'RipeMD-160'
    HashSize = 160
    Left = 424
    Top = 104
  end
  object DCP_sha11: TDCP_sha1
    Id = 2
    Algorithm = 'SHA1'
    HashSize = 160
    Left = 456
    Top = 104
  end
  object DCP_sha2561: TDCP_sha256
    Id = 28
    Algorithm = 'SHA256'
    HashSize = 256
    Left = 488
    Top = 104
  end
  object DCP_sha3841: TDCP_sha384
    Id = 29
    Algorithm = 'SHA384'
    HashSize = 384
    Left = 296
    Top = 136
  end
  object DCP_sha5121: TDCP_sha512
    Id = 30
    Algorithm = 'SHA512'
    HashSize = 512
    Left = 328
    Top = 136
  end
  object DCP_tiger1: TDCP_tiger
    Id = 18
    Algorithm = 'Tiger'
    HashSize = 192
    Left = 360
    Top = 136
  end
  object dlgOutput: TSaveDialog
    Filter = 'All files (*.*)|*.*'
    Title = 'Output file'
    Left = 328
    Top = 192
  end
end

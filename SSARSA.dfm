�
 TSARSA 0�	  TPF0TSARSASARSALeft�Top� BorderStylebsToolWindowCaption&   RSA подпись сообщений ClientHeightClientWidthQColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	PositionpoMainFormCenter
OnActivateFormActivateOnCreate
FormCreatePixelsPerInch`
TextHeight TLabelLabel1LeftTop� Width,HeightCaption   >4?8AL  TLabelLabel4LeftTop� Width:HeightCaption	   !>>1I5=85  TLabelLabel3Left� TopWidthEHeightCaption   Хеш метод:Font.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  
TStatusBar
StatusBar1Left TopWidthQHeightPanels SimplePanel	  TMemommoSignatureLeftTop� WidthAHeightAFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameCourier New
Font.Style 
ParentFontTabOrder  	TGroupBox	GroupBox1LeftTopWidth� HeightICaption   ;NGTabOrder TLabelLabel2LeftTopWidthFHeightCaption   Длина ключа:  	TComboBox
cbxKeySizeLeftPTopWidthAHeightStylecsDropDownList
ItemHeightTabOrder OnChangecbxKeySizeChangeItems.Strings2565127681024   TButton
btnGenKeysLeftTop+Width� HeightCaption$   Создать пару ключейTabOrderOnClickbtnGenKeysClick   TEditedtMsgLeftTop� WidthAHeightTabOrderTextabc  TButtonbtnSignLeftTopXWidth� HeightCaption%   Подписать сообщениеTabOrderOnClickbtnSignClick  TButton	btnVerifyLeftToppWidthAHeightCaption'   -= Проверить подпись =-TabOrderOnClickbtnVerifyClick  	TComboBoxcbxHashMethodLeftTop
WidthAHeightStylecsDropDownList
ItemHeightTabOrderOnChangecbxHashMethodChangeItems.StringsSHA-1MD5   TButtonButton1Left� Top(Width� HeightCaption   Загрузить ключиTabOrderOnClickButton1Click  TButtonButton2Left� TopXWidth� HeightCaption.   Загрузить приватный ключTabOrderOnClickButton2Click  TButtonButton3Left� Top@Width� HeightCaption.   Загрузить публичный ключTabOrder	OnClickButton3Click  	TLbRSASSA	LbRSASSA1
HashMethodhmMD5PrimeTestIterations2KeySizeaks256OnGetSignatureLbRSASSA1GetSignature
OnProgressLbRSASSA1ProgressLeft� Topp   
�
 TTXTRSA 0h
  TPF0TTXTRSATXTRSALeftTop� BorderIconsbiSystemMenu
biMinimize BorderStylebsDialogCaption'   RSA - Шифрование текстаClientHeight�ClientWidth,Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height	Font.NameMS Sans Serif
Font.Pitch
fpVariable
Font.Style OldCreateOrder	PositionpoMainFormCenter
OnActivateFormActivateOnCreate
FormCreatePixelsPerInch`
TextHeight 
TStatusBar
StatusBar1Left Top�Width,HeightPanelsText   Статус:Width2 Width2  SimplePanel	  	TGroupBox	GroupBox1Left Top�Width,HeightDAlignalBottomCaption!   Панель управленияTabOrder TButton
btnEncryptLeftTopWidth� HeightCaption   0H8D@>20BLEnabledTabOrder OnClickbtnEncryptClick  TButton
btnDecryptLeft� TopWidth� HeightCaption    0AH8D@>20BLEnabledTabOrderOnClickbtnDecryptClick  TButtonbtn1Left� Top.Width� HeightHint   Загрузить ключ ...Caption   Приватный ключParentShowHintShowHint	TabOrderOnClick	btn1Click  TButtonbtn2LeftTop.Width� HeightHint   Загрузить ключ ...Caption   Публичный ключParentShowHintShowHint	TabOrderOnClick	btn2Click  	TGroupBox	GroupBox2LeftXTopWidth� Height3AlignalRightCaption   RSA настройкаTabOrder TLabellbl1LeftTopWidthFHeightCaption   Длина ключа:  TButton
btnGenKeysLeftXTopWidthqHeightCaption   RSA пара ключейTabOrder OnClickbtnGenKeysClick  	TComboBox
cbxKeySizeLeftTopWidthIHeightStylecsDropDownList
ItemHeightTabOrderOnChangecbxKeySizeChangeItems.Strings1282565127681024     	TGroupBox	GroupBox3Left Top� Width,Height� AlignalBottomCaption$   Зашифрованый текст:TabOrder TMemommoCipherTextLeftTopWidth(Height� AlignalClientFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameCourier New
Font.Pitch
fpVariable
Font.Style 	MaxLength�
ParentFont
ScrollBarsssBothTabOrder    	TGroupBox	GroupBox4Left Top Width,Height� AlignalClientCaption   Исходный текст:TabOrder TMemommoPlainText1LeftTopWidth(Height� AlignalClientFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameCourier New
Font.Pitch
fpVariable
Font.Style 	MaxLength�
ParentFont
ScrollBarsssBothTabOrder    TLbRSALbRSA1PrimeTestIterationsKeySizeaks128
OnProgressLbRSA1ProgressLeftTop   
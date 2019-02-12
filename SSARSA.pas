unit SSARSA;

interface

uses
{$IFDEF WIN32}
  Windows,
  Messages,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  ComCtrls,
{$ENDIF}
{$IFDEF LINUX}
  QForms,
  QStdCtrls,
  QControls,
  QExtCtrls,
  QComCtrls,
{$ENDIF}
  SysUtils,
  Classes,
  LbCipher,
  LbClass,
  LbAsym,
  LbRSA;

type
  TSARSA = class(TForm)
    Label1: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    StatusBar1: TStatusBar;
    mmoSignature: TMemo;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    cbxKeySize: TComboBox;
    btnGenKeys: TButton;
    edtMsg: TEdit;
    btnSign: TButton;
    btnVerify: TButton;
    cbxHashMethod: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    LbRSASSA1: TLbRSASSA;
    procedure btnSignClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGenKeysClick(Sender: TObject);
    procedure btnVerifyClick(Sender: TObject);
    procedure cbxKeySizeChange(Sender: TObject);
    procedure cbxHashMethodChange(Sender: TObject);
    procedure LbRSASSA1GetSignature(Sender: TObject;
      var Sig: TRSASignatureBlock);
    procedure LbRSASSA1Progress(Sender: TObject; var Abort: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SARSA: TSARSA;

implementation

{$R *.dfm}

uses
  LbUtils;

const
  sPass = ' Проверка подписи: Успешно!';
  sFail = ' Проверка подписи: Ошибка!';
  sSigning = ' Создание подписи';
  sPatience = ' Создаем RSA пару ключей - Приватный и Публичный!';
  sAbort = ' Создание ключей - Выполнено!';
  sSignM = ' Сообщение - подписано!';
  sLoad = 'Загрузка ключей - Выполнена!';
  sLoadPr = 'Загрузка приватного ключа - Выполнена!';
  sLoadPy = 'Загрузка публичного ключа - Выполнена!';

procedure TSARSA.FormCreate(Sender: TObject);
  { initialize edit controls }
begin
  cbxHashMethod.ItemIndex := Ord(LbRSASSA1.HashMethod);
  cbxKeySize.ItemIndex := Ord(LbRSASSA1.KeySize) - 1;
end;

procedure TSARSA.btnGenKeysClick(Sender: TObject);
  { generate RSA key pair }
begin
  Screen.Cursor := crAppStart;
  StatusBar1.SimpleText := sPatience;
  try
    LbRSASSA1.GenerateKeyPair;
    LbRSASSA1.PrivateKey.StoreToFile('PrivatKey.key');
    LbRSASSA1.PublicKey.StoreToFile('PublicKey.key');
    StatusBar1.SimpleText := sAbort;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TSARSA.btnSignClick(Sender: TObject);
  { sign message string, display signature as hex string }
begin
  Screen.Cursor := crHourglass;
  StatusBar1.SimpleText := sSigning;
  try
    LbRSASSA1.SignString(edtMsg.Text);
    mmoSignature.Text := LbRSASSA1.Signature.IntStr;
  finally
    Screen.Cursor := crDefault;
    StatusBar1.SimpleText := '';
    StatusBar1.SimpleText := sSignM;
  end;
end;

procedure TSARSA.btnVerifyClick(Sender: TObject);
  { verify signature against message }
begin
  if LbRSASSA1.VerifyString(edtMsg.Text) then
    StatusBar1.SimpleText := sPass
  else
    StatusBar1.SimpleText := sFail;
end;

procedure TSARSA.LbRSASSA1GetSignature(Sender: TObject;
  var Sig: TRSASignatureBlock);
  { convert signature string to binary and return it }
begin
  HexToBuffer(mmoSignature.Text, Sig, SizeOf(Sig));
end;

procedure TSARSA.cbxKeySizeChange(Sender: TObject);
  { key size changed }
begin
  LbRSASSA1.KeySize := TLbAsymKeySize(cbxKeySize.ItemIndex + 1);
end;

procedure TSARSA.cbxHashMethodChange(Sender: TObject);
  { hash method changed }
begin
  LbRSASSA1.HashMethod := TRSAHashMethod(cbxHashMethod.ItemIndex);
end;

procedure TSARSA.LbRSASSA1Progress(Sender: TObject; var Abort: Boolean);
  { process message loop and abort if need be }
begin
  Application.ProcessMessages;
end;

procedure TSARSA.Button1Click(Sender: TObject);
begin
  LbRSASSA1.PrivateKey.LoadFromFile('PrivatKey.key');
  LbRSASSA1.PublicKey.LoadFromFile('PublicKey.key');
  StatusBar1.SimpleText := sLoad;
end;

procedure TSARSA.Button3Click(Sender: TObject);
begin
  LbRSASSA1.PublicKey.LoadFromFile('PublicKey.key');
  StatusBar1.SimpleText := sLoadPy;
end;

procedure TSARSA.Button2Click(Sender: TObject);
begin
  LbRSASSA1.PrivateKey.LoadFromFile('PrivatKey.key');
  StatusBar1.SimpleText := sLoadPr;
end;

procedure TSARSA.FormActivate(Sender: TObject);
begin
with SARSA do
     SetWindowPos(Handle,
     HWND_TOPMOST,
     Left,
     Top,
     Width,
     Height,
     SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
end;

end.

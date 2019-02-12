unit RSATXT;

interface

uses
{$IFDEF WIN32}
  Windows,
  Messages,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ClipBrd,
  StdCtrls,
  ComCtrls,
{$ENDIF}
  SysUtils,
  Classes,
  LbRSA,
  LbCipher,
  LbClass,
  LbAsym;

type
  TTXTRSA = class(TForm)
    LbRSA1: TLbRSA;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    btnEncrypt: TButton;
    btnDecrypt: TButton;
    btn1: TButton;
    btn2: TButton;
    GroupBox2: TGroupBox;
    btnGenKeys: TButton;
    cbxKeySize: TComboBox;
    lbl1: TLabel;
    GroupBox3: TGroupBox;
    mmoCipherText: TMemo;
    GroupBox4: TGroupBox;
    mmoPlainText1: TMemo;
    procedure btnEncryptClick(Sender: TObject);
    procedure btnDecryptClick(Sender: TObject);
    procedure btnGenKeysClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbxKeySizeChange(Sender: TObject);
    procedure LbRSA1Progress(Sender: TObject; var Abort: Boolean);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  end;

var
  TXTRSA: TTXTRSA;

implementation

{$R *.dfm}

uses
  LbUtils, stsp;

const
  sEncrypt = ' Encrypting';
  sDecrypt = ' Decrypting';
  sPatience = ' Generating RSA key pair';


//Размер файла
function MakeMemSize(Size: Integer): String;
const
  kb=1024;
  mb=kb*kb;
  gb=mb*kb;
begin
  case Size of
    0..kb-1:Result:=IntToStr(size)+' Байт';
    kb..mb-1:Result:=Format('%.2f КБ',[Size/kb]);
    mb..gb-1:Result:=Format('%.2f МБ',[Size/mb]);
  else
    Result:=Format('%.2f ГБ',[Size/gb]);
  end;
end;

function GetFileSize(const FileName:string):longint;
var
 SearchRec:TSearchRec;
begin
if FindFirst(ExpandFileName(FileName), faAnyFile,SearchRec)=0
 then Result:=SearchRec.Size
 else Result:=-1;
      FindClose(SearchRec);
end;

procedure TTXTRSA.FormCreate(Sender: TObject);
  { initialize edit controls }
var
  i: Integer;
begin
  cbxKeySize.ItemIndex := Ord(LbRSA1.KeySize);
  if (FileExists(GetCurrentDir+'\Public.key')) and
     (FileExists(GetCurrentDir+'\Privat.key')) then begin
      btn1.Enabled:=True;
      btn2.Enabled:=True;
     end else begin
      btn1.Enabled:=False;
      btn2.Enabled:=False;
     end;
   if ExtractFileExt(CRF.Edit1.Text) = '.txt' then begin
   if FileExists(CRF.Edit1.Text) then
      i:=GetFileSize(CRF.Edit1.Text) else StatusBar1.Panels[1].Text := 'Файл недоступен!';
   if MakeMemSize(i) > '105000' then begin
      mmoPlainText1.Lines.LoadFromFile(CRF.Edit1.Text);
   end;
   end;
end;

procedure TTXTRSA.btnGenKeysClick(Sender: TObject);
  { generate RSA key pair }
begin
  Screen.Cursor := crHourGlass;
  StatusBar1.Panels[1].Text := sPatience;
  try
    LbRSA1.GenerateKeyPair;
    LbRSA1.PrivateKey.StoreToFile('Privat.key');
    LbRSA1.PublicKey.StoreToFile('Public.key');
    btnEncrypt.Enabled := True;
    btnDecrypt.Enabled := True;
  finally
    Screen.Cursor := crDefault;
    StatusBar1.Panels[1].Text := '';
  end;
end;

procedure TTXTRSA.btnEncryptClick(Sender: TObject);
  { encrypt plaintext string }
begin
  Screen.Cursor := crHourGlass;
  StatusBar1.Panels[1].Text := sEncrypt;
  try
    mmoCipherText.Text := LbRSA1.EncryptString(mmoPlainText1.Text);
  finally
    Screen.Cursor := crDefault;
    StatusBar1.Panels[1].Text := '';
  end;
  mmoPlainText1.Clear;
  Clipboard.AsText:=mmoCipherText.Text;
  StatusBar1.Panels[1].Text := 'Текст скопирован в буфер обмена!';
end;

procedure TTXTRSA.btnDecryptClick(Sender: TObject);
  { decrypt encoded ciphertext }
begin
  Screen.Cursor := crHourGlass;
  StatusBar1.Panels[1].Text := sDecrypt;
  try
    mmoPlainText1.Text := LbRSA1.DecryptString(mmoCipherText.Text);
  finally
    Screen.Cursor := crDefault;
    StatusBar1.Panels[1].Text := '';
  end;
end;

procedure TTXTRSA.cbxKeySizeChange(Sender: TObject);
  { key size changed }
begin
  LbRSA1.KeySize := TLbAsymKeySize(cbxKeySize.ItemIndex);
end;

procedure TTXTRSA.LbRSA1Progress(Sender: TObject; var Abort: Boolean);
begin
  Application.ProcessMessages;
end;

procedure TTXTRSA.btn1Click(Sender: TObject);
begin
    if FileExists(GetCurrentDir+'\Privat.key') then begin
       LbRSA1.PrivateKey.LoadFromFile(GetCurrentDir+'\Privat.key');
       LbRSA1.PublicKey.LoadFromFile(GetCurrentDir+'\Public.key');
       btnEncrypt.Enabled := True;
       StatusBar1.Panels[1].Text:='Приватный ключ - загружен успешно!';
    end else StatusBar1.Panels[1].Text:='Ошибка загрузки приватного ключа!';
end;

procedure TTXTRSA.btn2Click(Sender: TObject);
begin
    if FileExists(GetCurrentDir+'\Public.key') then begin
       LbRSA1.PublicKey.LoadFromFile(GetCurrentDir+'\Public.key');
       LbRSA1.PrivateKey.LoadFromFile(GetCurrentDir+'\Privat.key');
       btnDecrypt.Enabled := True;
       StatusBar1.Panels[1].Text:='Публичный ключ - загружен успешно!';
    end else StatusBar1.Panels[1].Text:='Ошибка загрузки публичного ключа!';
end;

procedure TTXTRSA.FormActivate(Sender: TObject);
begin
with TXTRSA do
     SetWindowPos(Handle,
     HWND_TOPMOST,
     Left,
     Top,
     Width,
     Height,
     SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
end;

end.

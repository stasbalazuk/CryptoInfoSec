unit codingf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DCPtiger, DCPsha512, DCPsha256, DCPsha1, DCPripemd160,
  DCPripemd128, DCPmd5, DCPmd4, DCPcrypt2, DCPhaval, DCPtwofish, DCPtea,
  DCPserpent, DCPblockciphers, DCPrijndael, registry, DCPrc4, DCPrc2, DCPice, DCPdes,
  DCPcast128, DCPblowfish, StdCtrls, ShlObj, Buttons;

type
  Tfcod = class(TForm)
    grpOptions: TGroupBox;
    cbxCipher: TComboBox;
    lblCipher: TLabel;
    lblHash: TLabel;
    cbxHash: TComboBox;
    lblKeySize: TLabel;
    dblKeySize: TLabel;
    boxPassphrase: TEdit;
    lblPassphrase: TLabel;
    boxConfirmPassphrase: TEdit;
    lblConfirmPassphrase: TLabel;
    DCP_blowfish1: TDCP_blowfish;
    DCP_cast1281: TDCP_cast128;
    DCP_des1: TDCP_des;
    DCP_3des1: TDCP_3des;
    DCP_ice1: TDCP_ice;
    DCP_thinice1: TDCP_thinice;
    DCP_ice21: TDCP_ice2;
    DCP_rc21: TDCP_rc2;
    DCP_rc41: TDCP_rc4;
    DCP_rijndael1: TDCP_rijndael;
    DCP_serpent1: TDCP_serpent;
    DCP_tea1: TDCP_tea;
    DCP_twofish1: TDCP_twofish;
    DCP_haval1: TDCP_haval;
    DCP_md41: TDCP_md4;
    DCP_md51: TDCP_md5;
    DCP_ripemd1281: TDCP_ripemd128;
    DCP_ripemd1601: TDCP_ripemd160;
    DCP_sha11: TDCP_sha1;
    DCP_sha2561: TDCP_sha256;
    DCP_sha3841: TDCP_sha384;
    DCP_sha5121: TDCP_sha512;
    DCP_tiger1: TDCP_tiger;
    dlgOutput: TSaveDialog;
    dblInputFileSize: TLabel;
    lblInputFileSize1: TLabel;
    Edit1InputFile: TEdit;
    lbl1: TLabel;
    boxOutputFile: TEdit;
    lbl2: TLabel;
    grp1: TGroupBox;
    btnEncrypt: TButton;
    btnDecrypt: TButton;
    btnClose: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Edit1InputFileExit(Sender: TObject);
    procedure cbxCipherChange(Sender: TObject);
    procedure boxPassphraseChange(Sender: TObject);
    procedure btnEncryptClick(Sender: TObject);
    procedure btnDecryptClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
    procedure DisableForm;
  public
    { Public declarations }
  end;

var
  fcod: Tfcod;
  s,s1,s2: string;

implementation

uses stsp;

{$R *.dfm}

procedure Tfcod.DisableForm;
begin
  grpOptions.Enabled:= false;
  btnEncrypt.Enabled:= false;
  btnDecrypt.Enabled:= false;
end;

//Файл без расширения
function ExtractOnlyFileName(const FileName: string): string;
begin
  result:=StringReplace(ExtractFileName(FileName),ExtractFileExt(FileName),'',[]);
end;

procedure Tfcod.FormCreate(Sender: TObject);
var
  i: integer;
begin
  Randomize;
  // iterate through all the components and find the ciphers/hashes
  for i := 0 to (ComponentCount - 1) do
  begin
    if (Components[i] is TDCP_cipher) then begin
       cbxCipher.Items.AddObject(StringReplace(TDCP_cipher(Components[i]).Algorithm,' ','',[RFReplaceall]),Components[i])
    end else if (Components[i] is TDCP_hash) then
       cbxHash.Items.AddObject(TDCP_hash(Components[i]).Algorithm,Components[i]);
  end;
  if (cbxCipher.Items.Count = 0) then
  begin
    MessageDlg('Такого шифра - НЕТ!',mtError,[mbOK],0);
    DisableForm;
  end
  else
  begin
    cbxCipher.ItemIndex := 0;
    if (cbxHash.Items.Count = 0) then
    begin
      MessageDlg('Такого хеша - НЕТ!',mtError,[mbOK],0);
      DisableForm;
    end
    else
    begin
      cbxHash.ItemIndex := 0;
      cbxCipher.OnChange(cbxCipher);
    end;
  end;
  Edit1InputFile.Text:=CRF.Edit1.Text;
  boxOutputFile.Text:=CRF.Edit1.Text+'.'+cbxCipher.Text+'1';
  s2:=StringReplace(ExtractFileExt(Edit1InputFile.Text),'1','',[RFReplaceall]);
  s2:=StringReplace(s2,'.','',[RFReplaceall]);
  cbxCipher.ItemIndex := cbxCipher.Items.IndexOF(s2);
end;

// Add commas into a numerical string (e.g. 12345678 becomes 12,345,678)
// Not the best way but I can't find the code I wrote last time...
function AddCommas(const S: string): string;
var
  i, j: integer;
begin
  i := Length(S) mod 3;
  if ((i <> 0) and (Length(S) > 3)) then
    Result := Copy(S,1,i) + ',';
  for j := 0 to ((Length(S) div 3) - 2) do
    Result := Result + Copy(S,1 + i + j*3,3) + ',';
  if (Length(S) > 3) then
    Result := Result + Copy(S,Length(S) - 2,3)
  else
    Result := S;
end;

procedure Tfcod.Edit1InputFileExit(Sender: TObject);
var
  strmInput: TFileStream;
begin
  if (Edit1InputFile.Text = '') then
      dblInputFileSize.Caption := 'нет выбранного файла'
  else if FileExists(Edit1InputFile.Text) then
  begin
    // If the file exists then see how big it is
    strmInput := nil;
    try
      strmInput := TFileStream.Create(Edit1InputFile.Text,fmOpenRead);
      dblInputFileSize.Caption := AddCommas(IntToStr(strmInput.Size)) + ' bytes';
      strmInput.Free;
    except
      strmInput.Free;
      dblInputFileSize.Caption := 'не могу открыть файл';
    end;
  end
  else
    dblInputFileSize.Caption := 'файл не существует';
end;

procedure Tfcod.cbxCipherChange(Sender: TObject);
var
  Cipher: TDCP_cipher;
  Hash: TDCP_hash;
begin
  // Set the effective keysize to be the minimum of the hash size and the max key size
  // i.e. if the max key size is sufficiently large then use the entire hash as the
  //  key, other wise truncate the hash
  Cipher := TDCP_cipher(cbxCipher.Items.Objects[cbxCipher.ItemIndex]);
  Hash := TDCP_hash(cbxHash.Items.Objects[cbxHash.ItemIndex]);
  if (Cipher.MaxKeySize < Hash.HashSize) then
    dblKeySize.Caption := IntToStr(Cipher.MaxKeySize) + ' бит'
  else dblKeySize.Caption := IntToStr(Hash.HashSize) + ' бит';
  ////////////////////////////////////////////////
  if ExtractFileExt(Edit1InputFile.Text) = '.blowfish1' then begin
     s:=ExtractOnlyFileName(Edit1InputFile.Text);
     s1:=ExtractFileDir(Edit1InputFile.Text);
     s:=s1+'\'+s;
     boxOutputFile.Text:=s;
     Exit;
  end;
  if ExtractFileExt(Edit1InputFile.Text) = '.Cast1281' then begin
     s:=ExtractOnlyFileName(Edit1InputFile.Text);
     s1:=ExtractFileDir(Edit1InputFile.Text);
     s:=s1+'\'+s;
     boxOutputFile.Text:=s;
     Exit;
  end;
  if ExtractFileExt(Edit1InputFile.Text) = '.Cast2561' then begin
     s:=ExtractOnlyFileName(Edit1InputFile.Text);
     s1:=ExtractFileDir(Edit1InputFile.Text);
     s:=s1+'\'+s;
     boxOutputFile.Text:=s;
     Exit;
  end;
  if ExtractFileExt(Edit1InputFile.Text) = '.Des1' then begin
     s:=ExtractOnlyFileName(Edit1InputFile.Text);
     s1:=ExtractFileDir(Edit1InputFile.Text);
     s:=s1+'\'+s;
     boxOutputFile.Text:=s;
     Exit;
  end;
  if ExtractFileExt(Edit1InputFile.Text) = '.3Des1' then begin
     s:=ExtractOnlyFileName(Edit1InputFile.Text);
     s1:=ExtractFileDir(Edit1InputFile.Text);
     s:=s1+'\'+s;
     boxOutputFile.Text:=s;
     Exit;
  end;
  if ExtractFileExt(Edit1InputFile.Text) = '.Ice1' then begin
     s:=ExtractOnlyFileName(Edit1InputFile.Text);
     s1:=ExtractFileDir(Edit1InputFile.Text);
     s:=s1+'\'+s;
     boxOutputFile.Text:=s;
     Exit;
  end;
  if ExtractFileExt(Edit1InputFile.Text) = '.Ice21' then begin
     s:=ExtractOnlyFileName(Edit1InputFile.Text);
     s1:=ExtractFileDir(Edit1InputFile.Text);
     s:=s1+'\'+s;
     boxOutputFile.Text:=s;
     Exit;
  end;
  if ExtractFileExt(Edit1InputFile.Text) = '.Idea1' then begin
     s:=ExtractOnlyFileName(Edit1InputFile.Text);
     s1:=ExtractFileDir(Edit1InputFile.Text);
     s:=s1+'\'+s;
     boxOutputFile.Text:=s;
     Exit;
  end;
  if ExtractFileExt(Edit1InputFile.Text) = '.ThinIce1' then begin
     s:=ExtractOnlyFileName(Edit1InputFile.Text);
     s1:=ExtractFileDir(Edit1InputFile.Text);
     s:=s1+'\'+s;
     boxOutputFile.Text:=s;
     Exit;
  end;
  if ExtractFileExt(Edit1InputFile.Text) = '.Mars1' then begin
     s:=ExtractOnlyFileName(Edit1InputFile.Text);
     s1:=ExtractFileDir(Edit1InputFile.Text);
     s:=s1+'\'+s;
     boxOutputFile.Text:=s;
     Exit;
  end;
  if ExtractFileExt(Edit1InputFile.Text) = '.Misty11' then begin
     s:=ExtractOnlyFileName(Edit1InputFile.Text);
     s1:=ExtractFileDir(Edit1InputFile.Text);
     s:=s1+'\'+s;
     boxOutputFile.Text:=s;
     Exit;
  end;
  if ExtractFileExt(Edit1InputFile.Text) = '.Serpent1' then begin
     s:=ExtractOnlyFileName(Edit1InputFile.Text);
     s1:=ExtractFileDir(Edit1InputFile.Text);
     s:=s1+'\'+s;
     boxOutputFile.Text:=s;
     Exit;
  end;
  if ExtractFileExt(Edit1InputFile.Text) = '.TEA1' then begin
     s:=ExtractOnlyFileName(Edit1InputFile.Text);
     s1:=ExtractFileDir(Edit1InputFile.Text);
     s:=s1+'\'+s;
     boxOutputFile.Text:=s;
     Exit;
  end;
  if ExtractFileExt(Edit1InputFile.Text) = '.Twofish1' then begin
     s:=ExtractOnlyFileName(Edit1InputFile.Text);
     s1:=ExtractFileDir(Edit1InputFile.Text);
     s:=s1+'\'+s;
     boxOutputFile.Text:=s;
     Exit;
  end;
  if ExtractFileExt(Edit1InputFile.Text) = '.RC21' then begin
     s:=ExtractOnlyFileName(Edit1InputFile.Text);
     s1:=ExtractFileDir(Edit1InputFile.Text);
     s:=s1+'\'+s;
     boxOutputFile.Text:=s;
     Exit;
  end;
  if ExtractFileExt(Edit1InputFile.Text) = '.RC41' then begin
     s:=ExtractOnlyFileName(Edit1InputFile.Text);
     s1:=ExtractFileDir(Edit1InputFile.Text);
     s:=s1+'\'+s;
     boxOutputFile.Text:=s;
     Exit;
  end;
  if ExtractFileExt(Edit1InputFile.Text) = '.RC51' then begin
     s:=ExtractOnlyFileName(Edit1InputFile.Text);
     s1:=ExtractFileDir(Edit1InputFile.Text);
     s:=s1+'\'+s;
     boxOutputFile.Text:=s;
     Exit;
  end;
  if ExtractFileExt(Edit1InputFile.Text) = '.RC61' then begin
     s:=ExtractOnlyFileName(Edit1InputFile.Text);
     s1:=ExtractFileDir(Edit1InputFile.Text);
     s:=s1+'\'+s;
     boxOutputFile.Text:=s;
     Exit;
  end;
  if ExtractFileExt(Edit1InputFile.Text) = '.Rijndael1' then begin
     s:=ExtractOnlyFileName(Edit1InputFile.Text);
     s1:=ExtractFileDir(Edit1InputFile.Text);
     s:=s1+'\'+s;
     boxOutputFile.Text:=s;
     Exit;
  end;
  ////////////////////////////////////////////////
      boxOutputFile.Text:=CRF.Edit1.Text+'.'+cbxCipher.Text+'1';
  ///////////Добавляем отображаемую иконку/////////////
      reg := tregistry.create;
     // устанавливаем главный раздел
      reg.rootkey := HKEY_CLASSES_ROOT;
    // создается ключ ".", если его нет
      reg.openkey('.'+cbxCipher.Text+'1',true);
    // создается параметр со значением "!txt", если его нет
      reg.writestring('', '!'+cbxCipher.Text+'1');
    // закрываем этот ключ
      reg.openkey('!'+cbxCipher.Text+'1'+'\defaulticon',true);
      reg.writestring('', paramstr(0) + ', 1');
      reg.closekey;
      reg.openkey('!'+cbxCipher.Text+'1'+'\shell\open\command', true);
      reg.writestring('', 'C:\CRF\crypt.exe %1'); //Вот, вместо пути, меняем на свой.
    // закрываем ключ
      reg.closekey;
    // освобождаем реестр, но настройки сохраняем
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////////////////
end;

procedure Tfcod.boxPassphraseChange(Sender: TObject);
begin
  if (Length(boxPassphrase.Text) > 0) then
  begin
    btnDecrypt.Enabled := true;
    if (boxPassphrase.Text = boxConfirmPassphrase.Text) then
      btnEncrypt.Enabled := true
    else
      btnEncrypt.Enabled := false;
  end
  else
    btnDecrypt.Enabled := false;
end;

function Min(a, b: integer): integer;
begin
  if (a < b) then
    Result := a
  else
    Result := b;
end;

procedure Tfcod.btnEncryptClick(Sender: TObject);
var
  Cipher: TDCP_cipher;         // the cipher to use
  CipherIV: array of byte;     // the initialisation vector (for chaining modes)
  Hash: TDCP_hash;             // the hash to use
  HashDigest: array of byte;   // the result of hashing the passphrase with the salt
  Salt: array[0..7] of byte;   // a random salt to help prevent precomputated attacks
  strmInput, strmOutput: TFileStream;
  i: integer;
begin
  if FileExists(boxOutputFile.Text) then
    if (MessageDlg('Выходной файл уже существует. Переписать?',mtConfirmation,mbYesNoCancel,0) <> mrYes) then
      Exit;
  strmInput := nil;
  strmOutput := nil;
  try
    strmInput := TFileStream.Create(Edit1InputFile.Text,fmOpenRead);
    strmOutput := TFileStream.Create(boxOutputFile.Text,fmCreate);
    Hash := TDCP_hash(cbxHash.Items.Objects[cbxHash.ItemIndex]);
    SetLength(HashDigest,Hash.HashSize div 8);
    for i := 0 to 7 do
      Salt[i] := Random(256);  // just fill the salt with random values (crypto secure PRNG would be better but not _really_ necessary)
    strmOutput.WriteBuffer(Salt,Sizeof(Salt));  // write out the salt so we can decrypt!
    Hash.Init;
    Hash.Update(Salt[0],Sizeof(Salt));   // hash the salt
    Hash.UpdateStr(boxPassphrase.Text);  // and the passphrase
    Hash.Final(HashDigest[0]);           // store the output in HashDigest
    Cipher := TDCP_cipher(cbxCipher.Items.Objects[cbxCipher.ItemIndex]);
    if (Cipher is TDCP_blockcipher) then      // if the cipher is a block cipher we need an initialisation vector
    begin
      SetLength(CipherIV,TDCP_blockcipher(Cipher).BlockSize div 8);
      for i := 0 to (Length(CipherIV) - 1) do
        CipherIV[i] := Random(256);           // again just random values for the IV
      strmOutput.WriteBuffer(CipherIV[0],Length(CipherIV));  // write out the IV so we can decrypt!
      Cipher.Init(HashDigest[0],Min(Cipher.MaxKeySize,Hash.HashSize),CipherIV);  // initialise the cipher with the hash as key
      TDCP_blockcipher(Cipher).CipherMode := cmCBC;   // use CBC chaining when encrypting
    end
    else
      Cipher.Init(HashDigest[0],Min(Cipher.MaxKeySize,Hash.HashSize),nil); // initialise the cipher with the hash as key
    Cipher.EncryptStream(strmInput,strmOutput,strmInput.Size); // encrypt the entire file
    Cipher.Burn;   // important! get rid of keying information
    strmInput.Free;
    strmOutput.Free;
    MessageBox(handle,PChar('Зашифрованный файл: '+ExtractFileName(Edit1InputFile.Text)), PChar('Внимание'), 64);
    Application.Terminate;
  except
    strmInput.Free;
    strmOutput.Free;
    MessageDlg('Произошла ошибка при обработке файла',mtError,[mbOK],0);
  end;
end;

procedure Tfcod.btnDecryptClick(Sender: TObject);
var
  Cipher: TDCP_cipher;         // the cipher to use
  CipherIV: array of byte;     // the initialisation vector (for chaining modes)
  Hash: TDCP_hash;             // the hash to use
  HashDigest: array of byte;   // the result of hashing the passphrase with the salt
  Salt: array[0..7] of byte;   // a random salt to help prevent precomputated attacks
  strmInput, strmOutput: TFileStream;
begin
  if FileExists(boxOutputFile.Text) then
    if (MessageDlg('Выходной файл уже существует. Переписать?',mtConfirmation,mbYesNoCancel,0) <> mrYes) then
      Exit;
  strmInput := nil;
  strmOutput := nil;
  try
    strmInput := TFileStream.Create(Edit1InputFile.Text,fmOpenRead);
    strmOutput := TFileStream.Create(boxOutputFile.Text,fmCreate);
    Hash := TDCP_hash(cbxHash.Items.Objects[cbxHash.ItemIndex]);
    SetLength(HashDigest,Hash.HashSize div 8);
    strmInput.ReadBuffer(Salt[0],Sizeof(Salt));  // read the salt in from the file
    Hash.Init;
    Hash.Update(Salt[0],Sizeof(Salt));   // hash the salt
    Hash.UpdateStr(boxPassphrase.Text);  // and the passphrase
    Hash.Final(HashDigest[0]);           // store the hash in HashDigest
    Cipher := TDCP_cipher(cbxCipher.Items.Objects[cbxCipher.ItemIndex]);
    if (Cipher is TDCP_blockcipher) then            // if it is a block cipher we need the IV
    begin
      SetLength(CipherIV,TDCP_blockcipher(Cipher).BlockSize div 8);
      strmInput.ReadBuffer(CipherIV[0],Length(CipherIV));       // read the initialisation vector from the file
      Cipher.Init(HashDigest[0],Min(Cipher.MaxKeySize,Hash.HashSize),CipherIV);  // initialise the cipher
      TDCP_blockcipher(Cipher).CipherMode := cmCBC;
    end
    else
    Cipher.Init(HashDigest[0],Min(Cipher.MaxKeySize,Hash.HashSize),nil);  // initialise the cipher
    Cipher.DecryptStream(strmInput,strmOutput,strmInput.Size - strmInput.Position); // decrypt!
    Cipher.Burn;
    strmInput.Free;
    strmOutput.Free;
    MessageBox(handle,PChar('Расшифрованый файл: '+ExtractFileName(Edit1InputFile.Text)), PChar('Внимание'), 64);
    Application.Terminate;
  except
    strmInput.Free;
    strmOutput.Free;
    MessageDlg('Произошла ошибка при обработке файла',mtError,[mbOK],0);
  end;
end;

procedure Tfcod.btnCloseClick(Sender: TObject);
begin
  Close;
end;


end.


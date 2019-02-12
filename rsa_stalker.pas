unit rsa_stalker;
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ToolWin, AppEvnts, ExtCtrls, XPMan, registry, ShlObj,
  ASCryptos, ASCryptoComp, ASGtMath, ASUtils, ASX509, ASDer, Grids;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    Pages1: TPageControl;
    TabSymmetric: TTabSheet;
    GroupAlgo: TGroupBox;
    rbDES: TRadioButton;
    GroupSymKey: TGroupBox;
    EditSymKey: TEdit;
    btUpdSymKey: TButton;
    rbSymKeyHex: TRadioButton;
    rbSymKeyStr: TRadioButton;
    GroupSymData: TGroupBox;
    rbSymDataHex: TRadioButton;
    rbSymDataStr: TRadioButton;
    TabSheet3: TTabSheet;
    MemoLog: TMemo;
    rbRC2: TRadioButton;
    rbRC4: TRadioButton;
    rbRC5: TRadioButton;
    rbBF: TRadioButton;
    rbCast: TRadioButton;
    rbIDEA: TRadioButton;
    btSaveSymKey: TButton;
    btGenSymKey: TButton;
    btLoadSymKey: TButton;
    LabelSymKey: TLabel;
    EditSymKeyLen: TEdit;
    Label5: TLabel;
    OpenDialog1: TOpenDialog;
    LabelSymKeyLim: TLabel;
    ToolBar1: TToolBar;
    tbEncryptSymFile: TToolButton;
    tbDecryptSymFile: TToolButton;
    ToolBar2: TToolBar;
    tbClearLog: TToolButton;
    tabRSA: TTabSheet;
    GroupRsaKey: TGroupBox;
    Label14: TLabel;
    LabelRsaKeyLim: TLabel;
    btUpdRsaKey: TButton;
    btSaveRsaKey: TButton;
    btGenRsaKey: TButton;
    btLoadRsaKey: TButton;
    EditRsaKeyLen: TEdit;
    GroupRsaData: TGroupBox;
    btEncryptRsa: TButton;
    btDecryptRsa: TButton;
    GroupScheme: TGroupBox;
    rbPkcs: TRadioButton;
    rbOaep: TRadioButton;
    ToolBar5: TToolBar;
    tbEncryptRsaFile: TToolButton;
    tbDecryptRsaFile: TToolButton;
    ToolButton3: TToolButton;
    tbSignFile: TToolButton;
    tbVerifyFile: TToolButton;
    ToolButton6: TToolButton;
    tbTestRsaKey: TToolButton;
    PanelIV: TPanel;
    EditIV: TEdit;
    LabelIV: TLabel;
    rbIVHex: TRadioButton;
    rbIVStr: TRadioButton;
    PanelShemeDigest: TPanel;
    cbRsaDigest: TComboBox;
    LabelRsaDigest: TLabel;
    PanelSymKeyOpt: TPanel;
    EditSymKeyOpt: TEdit;
    LabelSymKeyOpt: TLabel;
    rbSafer: TRadioButton;
    cbUseSaferSK: TCheckBox;
    rbSkipJack: TRadioButton;
    GroupCM: TGroupBox;
    rbECB: TRadioButton;
    rbCBC: TRadioButton;
    rbCFB: TRadioButton;
    rbOFB: TRadioButton;
    PageControl1: TPageControl;
    TabRSAKeyN: TTabSheet;
    TabRSAKeyD: TTabSheet;
    PageControlRSA: TPageControl;
    TabRsa1: TTabSheet;
    MemoRsa1: TMemo;
    TabSheet6: TTabSheet;
    MemoRsa2: TMemo;
    TabRsa3: TTabSheet;
    MemoRsa3: TMemo;
    rbRsaDataHex: TRadioButton;
    rbRsaDataStr: TRadioButton;
    rbPlain: TRadioButton;
    btClearRSAKey: TButton;
    btClearRsaData: TButton;
    EditSmallPubExp: TEdit;
    Label6: TLabel;
    PageControl4: TPageControl;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    MemoRSAPubMod: TMemo;
    PageControl5: TPageControl;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    MemoRSAPubExp: TMemo;
    MemoRSAPrivExp: TMemo;
    MemoRSAPrivMod: TMemo;
    btLoadRSAData: TButton;
    btSaveRSAData: TButton;
    PageControlSym: TPageControl;
    TabSheet11: TTabSheet;
    MemoSym1: TMemo;
    TabSheet12: TTabSheet;
    MemoSym2: TMemo;
    TabSheet13: TTabSheet;
    MemoSym3: TMemo;
    btEncryptSym: TButton;
    btDecryptSym: TButton;
    btClearSymData: TButton;
    btLoadSymData: TButton;
    btSaveSymData: TButton;
    SaveDialog1: TSaveDialog;
    btnImportRSAKeyPair: TToolButton;
    btnExportRSAKeyPair: TToolButton;
    Seed: TTabSheet;
    MemoOAEPSeed: TMemo;
    procedure btUpdSymKeyClick(Sender: TObject);
    procedure rbSymKeyHexClick(Sender: TObject);
    procedure rbSymKeyStrClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rbDESClick(Sender: TObject);
    procedure btEncryptSymClick(Sender: TObject);
    procedure btDecryptSymClick(Sender: TObject);
    procedure rbSymDataHexClick(Sender: TObject);
    procedure rbSymDataStrClick(Sender: TObject);
    procedure tbClearLogClick(Sender: TObject);
    procedure CryptAfterDecrypt(Sender: TObject);
    procedure CryptAfterDecryptBlock(Sender: TObject; Block: Pointer; Offset, Size: Cardinal);
    procedure CryptAfterEncrypt(Sender: TObject);
    procedure CryptAfterEncryptBlock(Sender: TObject; Block: Pointer; Offset, Size: Cardinal);
    procedure CryptAfterGenKeys(Sender: TObject);
    procedure CryptAfterLoadKeys(Sender: TObject);
    procedure CryptAfterSaveKeys(Sender: TObject);
    procedure CryptBeforeDecrypt(Sender: TObject);
    procedure CryptBeforeDecryptBlock(Sender: TObject; Block: Pointer; Offset, Size: Cardinal);
    procedure CryptBeforeEncrypt(Sender: TObject);
    procedure CryptBeforeEncryptBlock(Sender: TObject; Block: Pointer; Offset, Size: Cardinal);
    procedure CryptBeforeGenKeys(Sender: TObject);
    procedure CryptBeforeLoadKeys(Sender: TObject);
    procedure CryptBeforeSaveKeys(Sender: TObject);
    procedure SymmChangeInitVector(Sender: TObject);
    procedure SymmChangeKey(Sender: TObject);
    procedure SymmPostValidateKey(Sender: TObject; Key: Pointer;
      KeyByteLen: Integer; var KeyValid: Boolean);
    procedure rbECBClick(Sender: TObject);
    procedure rbCBCClick(Sender: TObject);
    procedure rbCFBClick(Sender: TObject);
    procedure rbOFBClick(Sender: TObject);
    procedure rbRC2Click(Sender: TObject);
    procedure rbRC4Click(Sender: TObject);
    procedure rbRC5Click(Sender: TObject);
    procedure rbBFClick(Sender: TObject);
    procedure rbCastClick(Sender: TObject);
    procedure rbIdeaClick(Sender: TObject);
    procedure AS_PrimeGenerator1TryRandomPrime(Sender: TObject;
      prime: GiantInt);
//  procedure rbRSAClick(Sender: TObject);
    procedure btGenSymKeyClick(Sender: TObject);
    procedure btLoadSymKeyClick(Sender: TObject);
    procedure btSaveSymKeyClick(Sender: TObject);
    procedure AS_PrimeGenerator1AfterGenPrime(Sender: TObject; prime: GiantInt);
    procedure FormDestroy(Sender: TObject);
    procedure rbMD2Click(Sender: TObject);
    procedure rbMD4Click(Sender: TObject);
    procedure rbMD5Click(Sender: TObject);
    procedure AfterCalcDigest(Sender: TObject);
    procedure BeforeCalcDigest(Sender: TObject);
    procedure tbEncryptSymFileClick(Sender: TObject);
    procedure tbDecryptSymFileClick(Sender: TObject);
    procedure tbDigestFileClick(Sender: TObject);
    procedure RSA1AfterSign(Sender: TObject; Data: Pointer;
      DataSize: Cardinal);
    procedure RSA1AfterVerify(Sender: TObject; Data: Pointer;
      DataSize: Cardinal; SignData: Pointer; SignSize: Cardinal);
    procedure RSA1BeforeSign(Sender: TObject; Data: Pointer;
      DataSize: Cardinal);
    procedure RSA1BeforeVerify(Sender: TObject; Data: Pointer;
      DataSize: Cardinal; SignData: Pointer; SignSize: Cardinal);
    procedure btDecodeClick(Sender: TObject);
    procedure Base641AfterDecode(Sender: TObject);
    procedure Base641AfterEncode(Sender: TObject);
    procedure Base641BeforeDecode(Sender: TObject);
    procedure Base641BeforeEncode(Sender: TObject);
    procedure btUpdRsaKeyClick(Sender: TObject);
    procedure btGenRsaKeyClick(Sender: TObject);
    procedure btLoadRsaKeyClick(Sender: TObject);
    procedure btSaveRsaKeyClick(Sender: TObject);
    procedure rbOaepClick(Sender: TObject);
    procedure rbPkcsClick(Sender: TObject);
    procedure btEncryptRsaClick(Sender: TObject);
    procedure btDecryptRsaClick(Sender: TObject);
    procedure tbSignFileClick(Sender: TObject);
    procedure tbVerifyFileClick(Sender: TObject);
    procedure tbTestRsaKeyClick(Sender: TObject);
    procedure tbEncryptRsaFileClick(Sender: TObject);
    procedure tbDecryptRsaFileClick(Sender: TObject);
    procedure rbRsaDataHexClick(Sender: TObject);
    procedure rbRsaDataStrClick(Sender: TObject);
    procedure rbIVHexClick(Sender: TObject);
    procedure rbIVStrClick(Sender: TObject);
    procedure cbRsaDigestClick(Sender: TObject);
    procedure rbSaferClick(Sender: TObject);
    procedure cbUseSaferSKClick(Sender: TObject);
    procedure rbSkipJackClick(Sender: TObject);
    procedure rbPlainClick(Sender: TObject);
    procedure btClearRSAKeyClick(Sender: TObject);
    procedure btClearRsaDataClick(Sender: TObject);
    procedure RSA1ChangeOID(Sender: TObject);
    procedure RSA1ChangePrivateKey(Sender: TObject);
    procedure RSA1ChangePublicKey(Sender: TObject);
    procedure btLoadRSADataClick(Sender: TObject);
    procedure btSaveRSADataClick(Sender: TObject);
    procedure btClearSymDataClick(Sender: TObject);
    procedure btLoadSymDataClick(Sender: TObject);
    procedure btSaveSymDataClick(Sender: TObject);
    procedure BtnVerifySignatureClick(Sender: TObject);
    procedure TreeViewDerClick(Sender: TObject);
    procedure BtnCertPKLoadClick(Sender: TObject);
    procedure RadioCertSignClick(Sender: TObject);
    procedure EditCertEMailChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnImportRSAKeyPairClick(Sender: TObject);
    procedure btnExportRSAKeyPairClick(Sender: TObject);
  private
    FSelCrypto:   TAS_SymmCryptography;
    FTempData:    TMemoryStream;
    FCertNode:    TDerNode;
    procedure SetStatus(Index: Integer; const Value: string);
    procedure RefreshSymKey;
    procedure RefreshRSAKey;
    function  HexStrToBuffer(const S: string; var blen: Integer): Pointer;
    procedure ShowDerTree(node: TDerNode; TreeView: TTreeView);
    procedure ShowDerTreeNode(TreeView: TTreeView; MemoHex: TMemo);

    procedure ShowX509Sertificate;
    procedure ShowCertExtensions;
    procedure ShowCertIssuer;
    procedure ShowCertPublicKey;
    procedure ShowCertSignature;
    procedure ShowCertSubject;
    procedure ShowCertValidity;
  public
    StartMoment: TDateTime;
    property  Status[Index: Integer]: string write SetStatus;
  end;

var
  Form1: TForm1;

implementation

uses fCryptoData, stsp;

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  rbDESClick(nil);
  rbECBClick(nil);
  rbSymKeyHexClick(nil);
  rbPkcsClick(nil);
  cbUseSaferSK.Checked := Data1.Safer1.UseSaferSK;
  RefreshSymKey;
  RefreshRSAKey;
  FTempData := TMemoryStream.Create;
  FCertNode := TDerNode.Create;
end;

// чтение из реестра
function RegQueryStr(RootKey: HKEY; Key, Name: string;
  Success: PBoolean = nil): string;
var
  Handle: HKEY;
  Res: LongInt;
  DataType, DataSize: DWORD;
begin
  if Assigned(Success) then
    Success^ := False;
  Res := RegOpenKeyEx(RootKey, PChar(Key), 0, KEY_QUERY_VALUE, Handle);
  if Res <> ERROR_SUCCESS then
    Exit;
  Res := RegQueryValueEx(Handle, PChar(Name), nil, @DataType, nil, @DataSize);
  if (Res <> ERROR_SUCCESS) or (DataType <> REG_SZ) then
  begin
    RegCloseKey(Handle);
    Exit;
  end;
  SetString(Result, nil, DataSize - 1);
  Res := RegQueryValueEx(Handle, PChar(Name), nil, @DataType,
    PByte(@Result[1]), @DataSize);
  if Assigned(Success) then
    Success^ := Res = ERROR_SUCCESS;
  RegCloseKey(Handle);
end;

// запись в реестра
function RegWriteStr(RootKey: HKEY; Key, Name, Value: string): Boolean;
var
  Handle: HKEY;
  Res: LongInt;
begin
  Result := False;
  Res := RegCreateKeyEx(RootKey, PChar(Key), 0, nil, REG_OPTION_NON_VOLATILE,
    KEY_ALL_ACCESS, nil, Handle, nil);
  if Res <> ERROR_SUCCESS then
    Exit;
  Res := RegSetValueEx(Handle, PChar(Name), 0, REG_SZ, PChar(Value),
    Length(Value) + 1);
  Result := Res = ERROR_SUCCESS;
  RegCloseKey(Handle);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FCertNode.Free;
  FTempData.Free;
end;

procedure TForm1.FormActivate(Sender: TObject);
var
  s: string;
begin
with Form1 do
     SetWindowPos(Handle,
     HWND_TOPMOST,
     Left,
     Top,
     Width,
     Height,
     SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
     s:=RegQueryStr(HKEY_CLASSES_ROOT,'LockF','Path_rsa');
  if s <> '' then begin
     btLoadRsaKey.Click;
  end;
  ShowX509Sertificate;
end;

procedure TForm1.SetStatus(Index: Integer; const Value: string);
begin
  StatusBar1.Panels[Index].Text := Value;
end;

function TForm1.HexStrToBuffer(const S: string; var blen: Integer): Pointer;
begin
  blen := HexStrNeedBytes(S);
  FTempData.SetSize(blen);
  HexStrToBytes(S, FTempData.Memory, False);
  Result := FTempData.Memory;
end;

// editing keys

procedure TForm1.RefreshSymKey;
begin
  if rbSymKeyHex.Checked then rbSymKeyHexClick(nil) else rbSymKeyStrClick(nil);
  if rbIVHex.Checked     then rbIVHexClick(nil)     else rbIVStrClick(nil);
end;

procedure TForm1.RefreshRSAKey;
var N1, N2, D, E: string;
begin
  Data1.RSA1.ExtractPublicKey(N1, E);
  Data1.RSA1.ExtractPrivateKey(N2, D);
  HexStrToLines(N1, MemoRSAPubMod.Lines,  16);
  HexStrToLines(E,  MemoRSAPubExp.Lines,  16);
  HexStrToLines(N2, MemoRSAPrivMod.Lines, 16);
  HexStrToLines(D,  MemoRSAPrivExp.Lines, 16);
end;

procedure TForm1.btUpdSymKeyClick(Sender: TObject);
begin
  try
    if rbDES.Checked then begin
      if EditSymKeyOpt.Text <> '' then
        Data1.DES1.CipherMask := StrToInt(EditSymKeyOpt.Text);
    end else
    if rbRC2.Checked then begin
      if EditSymKeyOpt.Text <> '' then
        Data1.RC21.EffectiveBits := StrToInt(EditSymKeyOpt.Text);
    end
    else
    if rbRC5.Checked then begin
      if EditSymKeyOpt.Text <> '' then
        Data1.RC51.NumRounds := StrToInt(EditSymKeyOpt.Text);
    end;

    if rbSymKeyHex.Checked then
      TAS_SymmCryptography(FSelCrypto).KeyHexStr := EditSymKey.Text else
      TAS_SymmCryptography(FSelCrypto).KeyText := EditSymKey.Text;

    if rbIVHex.Checked then
      TAS_SymmCryptography(FSelCrypto).InitVectorHexStr := EditIV.Text else
      TAS_SymmCryptography(FSelCrypto).InitVectorText := EditIV.Text;

  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
  Status[0] := '';
end;

procedure TForm1.btClearRSAKeyClick(Sender: TObject);
begin
  MemoRSAPubMod.Lines.Clear;
  MemoRSAPubExp.Lines.Clear;
  MemoRSAPrivMod.Lines.Clear;
  MemoRSAPrivExp.Lines.Clear;
  MemoOAEPSeed.Lines.Clear;
end;

procedure TForm1.btUpdRsaKeyClick(Sender: TObject);
begin
  try
    Data1.RSA1.AssignPublicKey(
      LinesToHexStr(MemoRSAPubMod.Lines),
      LinesToHexStr(MemoRSAPubExp.Lines));

    Data1.RSA1.AssignPrivateKey(
      LinesToHexStr(MemoRSAPrivMod.Lines),
      LinesToHexStr(MemoRSAPrivExp.Lines));
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
end;

procedure TForm1.btGenSymKeyClick(Sender: TObject);
begin
  try
    FSelCrypto.GenerateKeys(StrToInt(EditSymKeyLen.Text));
    EditSymKeyLen.Text := IntToStr(FSelCrypto.UserKeyByteLen);
    RefreshSymKey;
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
end;

procedure TForm1.btGenRsaKeyClick(Sender: TObject);
begin
  try
    Data1.RSA1.SmallPublicExp := StrToInt('$'+EditSmallPubExp.Text);
  except
    EditSmallPubExp.Text := '0';
    Data1.RSA1.SmallPublicExp  := 0;
  end;
  try
    Screen.Cursor := crHourGlass;
    StartMoment := Now;
    Data1.RSA1.GenerateKeys(StrToInt(EditRsaKeyLen.Text));
    RefreshRSAKey;
    Screen.Cursor := crDefault;
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
    Status[0] := Format('Генерация RSA ключей закончена.  (%f сек.)',
    [(Now - StartMoment) * 24 * 3600]);
  btUpdRsaKeyClick(nil);
end;

procedure TForm1.btLoadSymKeyClick(Sender: TObject);
var s, sext: string;
begin
  try
    OpenDialog1.FileName := '';
    s := Copy(FSelCrypto.Name, 1, Length(FSelCrypto.Name)-1);
    sext := 'key' + Lowercase(Copy(s, 1, 3));
    OpenDialog1.DefaultExt := sext;
    OpenDialog1.Filter := Format('%s ключе (*.%s)|*.%1:s', [s, sext]);
    if OpenDialog1.Execute then begin
      FSelCrypto.LoadKeysFromFile(OpenDialog1.FileName);
      RefreshSymKey;
      rbSymKeyHex.Checked := True;
    end;
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
end;

procedure TForm1.btLoadRsaKeyClick(Sender: TObject);
var
  s: string;
begin
  s:=RegQueryStr(HKEY_CLASSES_ROOT,'LockF','Path_rsa');
  try
    OpenDialog1.FileName := '';
    OpenDialog1.DefaultExt := 'keyrsa';
    OpenDialog1.Filter := 'RSA ключ (*.keyrsa)|*.keyrsa';
  if FileExists(s) then begin
     Data1.RSA1.LoadKeysFromFile(s);
     RefreshRSAKey;
  end else begin
  if OpenDialog1.Execute then begin
     Data1.RSA1.LoadKeysFromFile(OpenDialog1.FileName);
     RefreshRSAKey;
  end;
  end;
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
  Status[0] := '';
end;

procedure TForm1.btSaveSymKeyClick(Sender: TObject);
var s, sext: string;
begin
  try
    SaveDialog1.FileName := '';
    s := Copy(FSelCrypto.Name, 1, Length(FSelCrypto.Name)-1);
    sext := 'key' + Lowercase(Copy(s, 1, 3));
    SaveDialog1.DefaultExt := sext;
    SaveDialog1.Filter := Format('%s ключ (*.%s)|*.%1:s', [s, sext]);
    if SaveDialog1.Execute then FSelCrypto.SaveKeysToFile(SaveDialog1.FileName);
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
  Status[0] := '';
end;

procedure TForm1.btSaveRsaKeyClick(Sender: TObject);
begin
  try
    SaveDialog1.FileName := '';
    SaveDialog1.DefaultExt := 'keyrsa';
    SaveDialog1.Filter := 'RSA ключ (*.keyrsa)|*.keyrsa';
    if SaveDialog1.Execute then begin
       Data1.RSA1.SaveKeysToFile(SaveDialog1.FileName);
    if FileExists(SaveDialog1.FileName) then
       RegWriteStr(HKEY_CLASSES_ROOT,'LockF','Path_rsa',SaveDialog1.FileName);
    end;
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
  Status[0] := '';
end;

procedure TForm1.rbSymKeyHexClick(Sender: TObject);
begin
  EditSymKey.Text := TAS_SymmCryptography(FSelCrypto).KeyHexStr;
end;

procedure TForm1.rbSymKeyStrClick(Sender: TObject);
begin
  EditSymKey.Text := TAS_SymmCryptography(FSelCrypto).KeyText;
end;

procedure TForm1.rbIVHexClick(Sender: TObject);
begin
  EditIV.Text := TAS_SymmCryptography(FSelCrypto).InitVectorHexStr;
  EditIV.MaxLength := 16;
end;

procedure TForm1.rbIVStrClick(Sender: TObject);
begin
  EditIV.Text := TAS_SymmCryptography(FSelCrypto).InitVectorText;
  EditIV.MaxLength := 8;
end;

// algorithm

procedure TForm1.rbDESClick(Sender: TObject);
begin
  FSelCrypto := Data1.DES1;
  RefreshSymKey;

  LabelSymKeyLim.Caption := '8..256 bytes, multiple of 8';
  EditSymKeyLen.Text     := '24';
  EditSymKeyLen.Enabled  := True;

  PanelSymKeyOpt.Visible := True;
  LabelSymKeyOpt.Caption := 'Cipher mask';
  EditSymKeyOpt.Text     := IntToStr(Data1.DES1.CipherMask);
  cbUseSaferSK.Visible   := False;
end;

procedure TForm1.rbRC2Click(Sender: TObject);
begin
  FSelCrypto := Data1.RC21;
  RefreshSymKey;

  LabelSymKeyLim.Caption := '1..128 bytes';
  EditSymKeyLen.Text     := '16';
  EditSymKeyLen.Enabled  := True;

  PanelSymKeyOpt.Visible := True;
  LabelSymKeyOpt.Caption := 'Effective bits';
  EditSymKeyOpt.Text     := IntToStr(Data1.RC21.EffectiveBits);
  cbUseSaferSK.Visible   := False;
end;

procedure TForm1.rbRC4Click(Sender: TObject);
begin
  FSelCrypto := Data1.RC41;
  RefreshSymKey;

  LabelSymKeyLim.Caption := '1 or more bytes';
  EditSymKeyLen.Text     := '16';
  EditSymKeyLen.Enabled  := True;

  PanelSymKeyOpt.Visible := False;
  cbUseSaferSK.Visible   := False;
end;

procedure TForm1.rbRC5Click(Sender: TObject);
begin
  FSelCrypto := Data1.RC51;
  RefreshSymKey;

  LabelSymKeyLim.Caption := 'Up to 256 bytes';
  EditSymKeyLen.Text     := '16';
  EditSymKeyLen.Enabled  := True;

  PanelSymKeyOpt.Visible := True;
  LabelSymKeyOpt.Caption := 'Number of rounds';
  EditSymKeyOpt.Text     := IntToStr(Data1.RC51.NumRounds);
  cbUseSaferSK.Visible   := False;
end;

procedure TForm1.rbBFClick(Sender: TObject);
begin
  FSelCrypto := Data1.BlowFish1;
  RefreshSymKey;

  LabelSymKeyLim.Caption := 'Up to 72 bytes';
  EditSymKeyLen.Text     := '16';
  EditSymKeyLen.Enabled  := True;

  PanelSymKeyOpt.Visible := False;
  cbUseSaferSK.Visible   := False;
end;

procedure TForm1.rbCastClick(Sender: TObject);
begin
  FSelCrypto := Data1.Cast1;
  RefreshSymKey;

  LabelSymKeyLim.Caption := 'Up to 16 bytes';
  EditSymKeyLen.Text     := '16';
  EditSymKeyLen.Enabled  := False;
  PanelSymKeyOpt.Visible := False;
  cbUseSaferSK.Visible   := False;
end;

procedure TForm1.rbIdeaClick(Sender: TObject);
begin
  FSelCrypto := Data1.Idea1;
  RefreshSymKey;

  LabelSymKeyLim.Caption := '16 bytes';
  EditSymKeyLen.Text     := '16';
  EditSymKeyLen.Enabled  := False;
  PanelSymKeyOpt.Visible := False;
  cbUseSaferSK.Visible   := False;
end;

procedure TForm1.rbSaferClick(Sender: TObject);
begin
  FSelCrypto := Data1.Safer1;
  RefreshSymKey;

  LabelSymKeyLim.Caption := '16 bytes';
  EditSymKeyLen.Text     := '16';
  EditSymKeyLen.Enabled  := False;

  PanelSymKeyOpt.Visible := True;
  LabelSymKeyOpt.Caption := 'Number of rounds';
  EditSymKeyOpt.Text     := IntToStr(Data1.Safer1.NumRounds);
  cbUseSaferSK.Visible   := True;
end;

procedure TForm1.rbSkipJackClick(Sender: TObject);
begin
  FSelCrypto := Data1.SkipJack1;
  RefreshSymKey;

  LabelSymKeyLim.Caption := '10 bytes';
  EditSymKeyLen.Text     := '10';
  EditSymKeyLen.Enabled  := False;

  PanelSymKeyOpt.Visible := False;
  cbUseSaferSK.Visible   := False;
end;

procedure TForm1.cbUseSaferSKClick(Sender: TObject);
begin
  Data1.Safer1.UseSaferSK := cbUseSaferSK.Checked;
end;

procedure TForm1.rbPkcsClick(Sender: TObject);
begin
  LabelRsaKeyLim.Caption   := '32 to 512 bytes';
  EditRsaKeyLen.Text       := '32';
  Data1.RSA1.EncryptionScheme    := esPkcs1;
  PanelShemeDigest.Visible := False;
  //Разблокировка функций
  btClearRSAKey.Enabled:=True;
  btUpdRsaKey.Enabled:=True;
  btGenRsaKey.Enabled:=True;
  btLoadRsaKey.Enabled:=True;
  btSaveRsaKey.Enabled:=True;
  btEncryptRsa.Enabled:=True;
  btDecryptRsa.Enabled:=True;
  btClearRsaData.Enabled:=True;
  btLoadRSAData.Enabled:=True;
  btSaveRSAData.Enabled:=True;  
end;

procedure TForm1.rbOaepClick(Sender: TObject);
begin
  LabelRsaKeyLim.Caption   := '64 to 512 bytes';
  EditRsaKeyLen.Text       := '64';
  Data1.RSA1.EncryptionScheme := esOaep;
  PanelShemeDigest.Visible := True;
  if Data1.RSA1.EncryptingDigest = Data1.MDXforRSA then
    cbRsaDigest.ItemIndex  := Ord(Data1.MDXforRSA.Version)
  else
  if Data1.RSA1.EncryptingDigest = Data1.SHA1forRSA then
    cbRsaDigest.ItemIndex  := Ord(dgMD5)+1
  else
    cbRsaDigest.ItemIndex  := Ord(dgMD5)+2;
  MemoRSA2.Clear;
  MemoRSA3.Clear;
  //Блокировка функций
  btClearRSAKey.Enabled:=False;
  btUpdRsaKey.Enabled:=False;
  btGenRsaKey.Enabled:=False;
  btLoadRsaKey.Enabled:=False;
  btSaveRsaKey.Enabled:=False;
  btEncryptRsa.Enabled:=False;
  btDecryptRsa.Enabled:=False;
  btClearRsaData.Enabled:=False;
  btLoadRSAData.Enabled:=False;
  btSaveRSAData.Enabled:=False;
end;

procedure TForm1.rbPlainClick(Sender: TObject);
begin
  LabelRsaKeyLim.Caption   := '32 to 512 bytes';
  EditRsaKeyLen.Text       := '32';
  Data1.RSA1.EncryptionScheme    := esPlain;
  PanelShemeDigest.Visible := False;
  //Разблокировка функций
  btClearRSAKey.Enabled:=True;
  btUpdRsaKey.Enabled:=True;
  btGenRsaKey.Enabled:=True;
  btLoadRsaKey.Enabled:=True;
  btSaveRsaKey.Enabled:=True;
  btEncryptRsa.Enabled:=True;
  btDecryptRsa.Enabled:=True;
  btClearRsaData.Enabled:=True;
  btLoadRSAData.Enabled:=True;
  btSaveRSAData.Enabled:=True;
end;

procedure TForm1.cbRsaDigestClick(Sender: TObject);
begin
  case cbRsaDigest.ItemIndex of
    Ord(dgMD2)..Ord(dgMD5): Data1.RSA1.EncryptingDigest := Data1.MDXforRSA;
    Ord(dgMD5)+1:           Data1.RSA1.EncryptingDigest := Data1.SHA1forRSA;
    Ord(dgMD5)+2:           Data1.RSA1.EncryptingDigest := Data1.RIPEMDforRSA;
  end;
  MemoRSA2.Clear;
  MemoRSA3.Clear;
end;

// cipher mode

procedure TForm1.rbECBClick(Sender: TObject);
begin
  TAS_SymmCryptography(FSelCrypto).CipherMode := cmECB;
  PanelIV.Visible := False;
end;

procedure TForm1.rbCBCClick(Sender: TObject);
begin
  TAS_SymmCryptography(FSelCrypto).CipherMode := cmCBC;
  PanelIV.Visible := True;
end;

procedure TForm1.rbCFBClick(Sender: TObject);
begin
  TAS_SymmCryptography(FSelCrypto).CipherMode := cmCFB;
  PanelIV.Visible := True;
end;

procedure TForm1.rbOFBClick(Sender: TObject);
begin
  TAS_SymmCryptography(FSelCrypto).CipherMode := cmOFB;
  PanelIV.Visible := True;
end;

// data

procedure TForm1.rbSymDataHexClick(Sender: TObject);
var i: Integer;
begin
  for i := 0 to MemoSym1.Lines.Count-1 do
    MemoSym1.Lines[i] := StrToHexStr(MemoSym1.Lines[i], False);
  for i := 0 to MemoSym3.Lines.Count-1 do
    MemoSym3.Lines[i] := StrToHexStr(MemoSym3.Lines[i], False);
end;

procedure TForm1.rbSymDataStrClick(Sender: TObject);
var i: Integer;
begin
  for i := 0 to MemoSym1.Lines.Count-1 do
    MemoSym1.Lines[i] := HexStrToStr(MemoSym1.Lines[i], False);
  for i := 0 to MemoSym3.Lines.Count-1 do
    MemoSym3.Lines[i] := HexStrToStr(MemoSym3.Lines[i], False);
end;

procedure TForm1.rbRsaDataHexClick(Sender: TObject);
var i: Integer;
begin
  for i := 0 to MemoRsa1.Lines.Count-1 do
    MemoRsa1.Lines[i] := StrToHexStr(MemoRsa1.Lines[i], False);
  for i := 0 to MemoRsa3.Lines.Count-1 do
    MemoRsa3.Lines[i] := StrToHexStr(MemoRsa3.Lines[i], False);
end;

procedure TForm1.rbRsaDataStrClick(Sender: TObject);
var i: Integer;
begin
  for i := 0 to MemoRsa1.Lines.Count-1 do
    MemoRsa1.Lines[i] := HexStrToStr(MemoRsa1.Lines[i], False);
  for i := 0 to MemoRsa3.Lines.Count-1 do
    MemoRsa3.Lines[i] := HexStrToStr(MemoRsa3.Lines[i], False);
end;

// encrypt/decrypt

procedure TForm1.btEncryptRsaClick(Sender: TObject);
var S: string; P: Pointer; len: Integer;
begin
  btUpdRsaKeyClick(nil);  // save key if changed
  Data1.RSA1.SeedHexStr := LinesToHexStr(MemoOaepSeed.Lines);

  if rbRsaDataHex.Checked then begin
    S := LinesToHexStr(MemoRsa1.Lines);
    P := HexStrToBuffer(S, len);
  end
  else begin
    S := MemoRsa1.Lines.Text;
    P := @S[1];
    len := Length(S);
  end;

  try
    Data1.RSA1.Encrypt(P, len);
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;

  S := BytesToHexStr(Data1.RSA1.EncryptedData.Memory,
    Data1.RSA1.EncryptedData.Size, False);

  MemoRsa2.Lines.Clear;
  HexStrToLines(S, MemoRsa2.Lines, 16);

  MemoOaepSeed.Lines.Clear;
  HexStrToLines(Data1.Rsa1.SeedHexStr, MemoOaepSeed.Lines, 16);

  btDecryptRsaClick(nil);
end;

procedure TForm1.btDecryptRsaClick(Sender: TObject);
var P: Pointer; S: string; len: Integer;
begin
  S := LinesToHexStr(MemoRsa2.Lines);
  P := HexStrToBuffer(S, len);
  try
    Data1.RSA1.Decrypt(P, len);
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;

  if rbRsaDataHex.Checked then begin
    S := BytesToHexStr(Data1.RSA1.DecryptedData.Memory,
      Data1.RSA1.DecryptedData.Size, False);
    HexStrToLines(S, MemoRsa3.Lines, 16);
  end
  else begin
    SetLength(S, Data1.RSA1.DecryptedData.Size);
    Move(Data1.RSA1.DecryptedData.Memory^, S[1], Length(S));
    MemoRsa3.Lines.Text := S;
  end;
end;

//Файл без расширения
function ExtractOnlyFileName(const FileName: string): string;
begin
  result:=StringReplace(ExtractFileName(FileName),ExtractFileExt(FileName),'',[]);
end;

procedure TForm1.btClearRsaDataClick(Sender: TObject);
begin
  MemoRSA1.Lines.Clear;
  MemoRSA2.Lines.Clear;
  MemoRSA3.Lines.Clear;
end;

procedure btLoadData(const FileName: string; Lines: TStrings; AsText: Boolean);
var M: TMemoryStream; S: string;
begin
  if AsText then
    Lines.LoadFromFile(FileName)
  else begin
    M := TMemoryStream.Create;
    try
      M.LoadFromFile(FileName);
      S := BytesToHexStr(M.Memory, M.Size, False);
      HexStrToLines(S, Lines, 16);
    finally
      M.Free;
    end;
  end;
end;

procedure btSaveData(const FileName: string; Lines: TStrings; AsText: Boolean);
var M: TMemoryStream; S: string;
begin
  if AsText then
    Lines.SaveToFile(FileName)
  else begin
    M := TMemoryStream.Create;
    try
      S := LinesToHexStr(Lines);
      M.Size := HexStrNeedBytes(S);
      HexStrToBytes(S, M.Memory, False);
      M.SaveToFile(FileName);
    finally
      M.Free;
    end;
  end;
end;

procedure TForm1.btLoadRSADataClick(Sender: TObject);
begin
  OpenDialog1.FileName := '';
  OpenDialog1.Filter := 'All files (*.*)|*.*';
  if OpenDialog1.Execute then begin
    case PageControlRSA.ActivePageIndex of
      0: btLoadData(OpenDialog1.FileName, MemoRSA1.Lines, rbRSADataStr.Checked);
      1: btLoadData(OpenDialog1.FileName, MemoRSA2.Lines, rbRSADataStr.Checked);
      2: btLoadData(OpenDialog1.FileName, MemoRSA3.Lines, rbRSADataStr.Checked);
    end;
  end;
end;

procedure TForm1.btSaveRSADataClick(Sender: TObject);
begin
  SaveDialog1.FileName := '';
  SaveDialog1.Filter := 'All files (*.*)|*.*';
  if SaveDialog1.Execute then begin
    case PageControlRSA.ActivePageIndex of
      0: btSaveData(SaveDialog1.FileName, MemoRSA1.Lines, rbRSADataStr.Checked);
      1: btSaveData(SaveDialog1.FileName, MemoRSA2.Lines, rbRSADataStr.Checked);
      2: btSaveData(SaveDialog1.FileName, MemoRSA3.Lines, rbRSADataStr.Checked);
    end;
  end;
end;

procedure TForm1.tbEncryptSymFileClick(Sender: TObject);
var s, sext, senc: string;
begin
  try
    Screen.Cursor := crHourGlass;
    try
      OpenDialog1.FileName := '';
      OpenDialog1.Filter := 'All files (*.*)|*.*';
      if OpenDialog1.Execute then begin
        s := Copy(FSelCrypto.Name, 1, Length(FSelCrypto.Name)-1);
        sext := Lowercase(Copy(s, 1, 3));
        senc := ChangeFileExt(OpenDialog1.FileName, '.'+sext);
        Status[0] := 'Шифрование файла: ' + OpenDialog1.FileName + '...';
        FSelCrypto.EncryptFile(OpenDialog1.FileName, senc);
        MessageBox(handle,pchar('Зашифрованый файл есть: ' + senc),'Внимание',64);
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
  Status[0] := '';
end;

procedure TForm1.tbDecryptSymFileClick(Sender: TObject);
var s, sext, sdec: string;
begin
  try
    Screen.Cursor := crHourGlass;
    try
      OpenDialog1.FileName := '';
      OpenDialog1.Filter := 'All files (*.*)|*.*';
      s := Copy(FSelCrypto.Name, 1, Length(FSelCrypto.Name)-1);
      sext := Lowercase(Copy(s, 1, 3));
      OpenDialog1.DefaultExt := sext;
      OpenDialog1.Filter :=
        Format('%s encrypted files (*.%s)|*.%1:s|All files (*.*)|*.*',
        [s, sext]);
      if OpenDialog1.Execute then begin
        sdec := ChangeFileExt(OpenDialog1.FileName, '.tmp');
        Status[0] := 'Расшифрование файла: ' + OpenDialog1.FileName + '...';
        FSelCrypto.DecryptFile(OpenDialog1.FileName, sdec);
        MessageBox(handle,pchar('Расшифрованый файл есть: ' + sdec),'Внимание',64);
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
  Status[0] := '';
end;

procedure TForm1.tbEncryptRsaFileClick(Sender: TObject);
var senc: string;
    otv:word;
begin
    otv := MessageBox(handle,PChar('Перед шифрованием RSA методом - сгенерируйте ключ и сохраните его!'+#13#10+'Ключ нужен для расшифровки зашифрованного файла RSA методом!'+#13#10), PChar('Внимание'), 33);
 if otv=IDOK then begin
  try
    Screen.Cursor := crHourGlass;
    try
    if ParamStr(0) = CRF.Edit1.Text then begin
       MessageBox(handle,pchar('Нет файла для шифрования!'),'Внимание',64);
       Exit;
    end else begin
    if ExtractFileExt(CRF.Edit1.Text) = '.rsa' then begin
       MessageBox(handle, 'Файл уже зашифрован!','Внимание', MB_ICONINFORMATION or MB_OK);
       exit;
    end;
 ///////////Добавляем отображаемую иконку/////////////
    reg := tregistry.create;
 // устанавливаем главный раздел
    reg.rootkey := HKEY_CLASSES_ROOT;
 // создается ключ ".blowfish", если его нет
    reg.openkey('.rsa',true);
 // создается параметр со значением "!txt", если его нет
    reg.writestring('', '!rsa');
 // закрываем этот ключ
    reg.openkey('!rsa\defaulticon',true);
    reg.writestring('', paramstr(0) + ', 1');
    reg.closekey;
    reg.openkey('!rsa\shell\open\command', true);
    reg.writestring('', 'C:\CRF\crypt.exe %1'); //Вот, вместо пути, меняем на свой.
 // закрываем ключ
    reg.closekey;
 // освобождаем реестр, но настройки сохраняем
    reg.free;
    SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
 ////////////////////////////////////////////////////////////////
       senc := CRF.Edit1.Text+'.rsa';
       Status[0] := 'Зашифрованый файл: ' + CRF.Edit1.Text + '...';
       Data1.RSA1.EncryptFile(CRF.Edit1.Text, senc);
       DeleteFile(PChar(CRF.Edit1.Text));
       MessageBox(handle,pchar('Файл '+ senc + ' успешно зашифрован!'),'Внимание',64);
       Form1.Close;
       CRF.Close;
    end;
    finally
      Screen.Cursor := crDefault;
    end;
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
  Status[0] := '';
 end;
 if otv=IDCANCEL then begin
    Exit;
 end;
end;

procedure TForm1.tbDecryptRsaFileClick(Sender: TObject);
var sdec: string;
begin
  try
    Screen.Cursor := crHourGlass;
    try
      if ParamStr(0) = CRF.Edit1.Text then begin
         MessageBox(handle,pchar('Нет файла для расшифровывания!'),'Внимание',64);
         Exit;
      end else begin
      if ExtractFileExt(CRF.Edit1.Text) = '.rsa' then begin
         sdec := ExtractOnlyFileName(CRF.Edit1.Text);
         Status[0] := 'Расшифрованый файл: ' + CRF.Edit1.Text + '...';
         Data1.RSA1.DecryptFile(CRF.Edit1.Text, sdec);
      if FileExists(sdec) then begin
      if (FileExists(CRF.Edit1.Text)) and FileExists(sdec) then DeleteFile(PChar(CRF.Edit1.Text));
         MessageBox(handle, PChar('Файл '+ExtractFileName(CRF.Edit1.Text+' успешно расшифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
      end else begin
         MessageBox(handle, PChar('Файл '+ExtractFileName(CRF.Edit1.Text+' заблокирован!'+#13#10+'Для расшифровки сначало разблокируйте файл!')),'Внимание', MB_ICONINFORMATION or MB_OK);
      end;
      end else begin
         MessageBox(handle, PChar('Сперва зашифруйте файл '+ExtractFileName(CRF.Edit1.Text+' !')),'Внимание', MB_ICONINFORMATION or MB_OK);
      end;
   end;
    finally
      Screen.Cursor := crDefault;
    end;
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
  Status[0] := '';
  Form1.Close;
  CRF.Close;  
end;

// sign/verify

procedure TForm1.tbSignFileClick(Sender: TObject);
var s: string;
begin
  try
      Data1.RSA1.SignFile(CRF.Edit1.Text);
      s := ChangeFileExt(CRF.Edit1.Text, '.sig');
      Data1.RSA1.SaveSignatureToFile(s);
      MessageBox(handle,pchar('Цифровая подпись установлена на файл: ' + s),'Внимание',64);
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
  Status[0] := '';
end;

procedure TForm1.tbVerifyFileClick(Sender: TObject);
var s: string;
begin
  try
      s := ChangeFileExt(CRF.Edit1.Text, '.sig');
      Data1.RSA1.LoadSignatureFromFile(s);
      Data1.RSA1.VerifyFileSignature(CRF.Edit1.Text,
      Data1.RSA1.SignatureValue.Memory,
      Data1.RSA1.SignatureValue.Size);
      MessageBox(handle,pchar('Статус цифровой подписи - ОК!'),'Внимание',64);
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
  Status[0] := '';
end;

procedure TForm1.btnImportRSAKeyPairClick(Sender: TObject);
var Ext: string;
begin
  try
    OpenDialog1.Filter := 'DER files (*.der)|*.der|PEM files (*.pem)|*.pem';
    OpenDialog1.DefaultExt := 'der';
    OpenDialog1.FileName := '';
    if OpenDialog1.Execute then begin
      Ext := UpperCase(ExtractFileExt(OpenDialog1.FileName));
      if Ext = '.DER' then Data1.RSA1.ImportKeyPairFromDER(OpenDialog1.FileName) else
      if Ext = '.PEM' then Data1.RSA1.ImportKeyPairFromPEM(OpenDialog1.FileName) else Exit;
      RefreshRSAKey;
    end;
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
  Status[0] := '';
end;

procedure TForm1.btnExportRSAKeyPairClick(Sender: TObject);
var Ext: string;
begin
  try
    SaveDialog1.Filter := 'DER files (*.der)|*.der|PEM files (*.pem)|*.pem';
    SaveDialog1.DefaultExt := 'der';
    SaveDialog1.FileName := '';
    if SaveDialog1.Execute then begin
      Ext := UpperCase(ExtractFileExt(SaveDialog1.FileName));
      if Ext = '.DER' then Data1.RSA1.ExportKeyPairToDER(SaveDialog1.FileName) else
      if Ext = '.PEM' then Data1.RSA1.ExportKeyPairToPEM(SaveDialog1.FileName);
    end;
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
  Status[0] := '';
end;

procedure TForm1.tbTestRsaKeyClick(Sender: TObject);
begin
  if Data1.RSA1.TestKeyPair then
    MessageBox(handle,'Статус RSA ключей - OK','Внимание',64) else
    MessageBox(handle,'Статус RSA ключей - ОШИБКА','Внимание',16);
end;

// logging

procedure TForm1.tbClearLogClick(Sender: TObject);
begin
  MemoLog.Clear;
end;

procedure TForm1.CryptAfterDecrypt(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': AfterDecrypt');
end;

procedure TForm1.CryptAfterDecryptBlock(Sender: TObject;
  Block: Pointer; Offset, Size: DWord);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': После расшифрованый блок');
  Application.ProcessMessages;
end;

procedure TForm1.CryptAfterEncrypt(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': После шифрования');
end;

procedure TForm1.CryptAfterEncryptBlock(Sender: TObject;
  Block: Pointer; Offset, Size: DWord);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': После зашифрованый блок');
  Application.ProcessMessages;
end;

procedure TForm1.CryptAfterGenKeys(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': После генерации ключей');
end;

procedure TForm1.CryptAfterLoadKeys(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': AfterLoadKeys');
end;

procedure TForm1.CryptAfterSaveKeys(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': AfterSaveKeys');
end;

procedure TForm1.CryptBeforeDecrypt(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': BeforeDecrypt');
end;

procedure TForm1.CryptBeforeDecryptBlock(Sender: TObject;
  Block: Pointer; Offset, Size: DWord);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': Перед расшифрованием блока');
  Application.ProcessMessages;
end;

procedure TForm1.CryptBeforeEncrypt(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': Перед шифрованием');
end;

procedure TForm1.CryptBeforeEncryptBlock(Sender: TObject;
  Block: Pointer; Offset, Size: DWord);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': Перед шифрованием блока');
  Application.ProcessMessages;
end;

procedure TForm1.CryptBeforeGenKeys(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': Перед генерацией ключей');
end;

procedure TForm1.CryptBeforeLoadKeys(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': BeforeLoadKeys');
end;

procedure TForm1.CryptBeforeSaveKeys(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': BeforeSaveKeys');
end;

procedure TForm1.SymmChangeInitVector(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': ChangeInitVector');
end;

procedure TForm1.SymmChangeKey(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': ChangeKey');
end;

procedure TForm1.SymmPostValidateKey(Sender: TObject; Key: Pointer;
  KeyByteLen: Integer; var KeyValid: Boolean);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': Валидность ключа');
end;

procedure TForm1.AS_PrimeGenerator1TryRandomPrime(Sender: TObject; prime: GiantInt);
begin
  MemoLog.Lines.Add(Format('Генерация главного ключа: %s', [GiantIntToHex(prime, True)]));
  Application.ProcessMessages;
end;

procedure TForm1.AS_PrimeGenerator1AfterGenPrime(Sender: TObject; prime: GiantInt);
begin
  MemoLog.Lines.Add(Format('Поиск главного ключа: %s', [GiantIntToHex(prime, True)]));
end;

procedure TForm1.RSA1ChangePrivateKey(Sender: TObject);
begin
  MemoLog.Lines.Add('RSA: приватный ключ установлен!');
end;

procedure TForm1.RSA1ChangePublicKey(Sender: TObject);
begin
  MemoLog.Lines.Add('RSA: публичный ключ установлен!');
end;

procedure TForm1.RSA1ChangeOID(Sender: TObject);
begin
  MemoLog.Lines.Add(Format('RSA: объек ID установлен: %s', [Data1.RSA1.ObjectID]));
end;

// Digest

procedure TForm1.rbMD2Click(Sender: TObject);
begin
  Data1.MDX1.Version := dgMD2;
end;

procedure TForm1.rbMD4Click(Sender: TObject);
begin
  Data1.MDX1.Version := dgMD4;
end;

procedure TForm1.rbMD5Click(Sender: TObject);
begin
  Data1.MDX1.Version := dgMD5;
end;

procedure TForm1.tbDigestFileClick(Sender: TObject);
begin
end;

// encoding /decoding

procedure TForm1.btDecodeClick(Sender: TObject);
begin
end;

// logging

procedure TForm1.AfterCalcDigest(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': AfterCalcDigest');
end;

procedure TForm1.BeforeCalcDigest(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': BeforeCalcDigest');
end;

procedure TForm1.RSA1AfterSign(Sender: TObject; Data: Pointer; DataSize: Cardinal);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': AfterSign');
end;

procedure TForm1.RSA1AfterVerify(Sender: TObject; Data: Pointer;
  DataSize: Cardinal; SignData: Pointer; SignSize: Cardinal);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': AfterVerify');
end;

procedure TForm1.RSA1BeforeSign(Sender: TObject; Data: Pointer; DataSize: Cardinal);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': beforeSign');
end;

procedure TForm1.RSA1BeforeVerify(Sender: TObject; Data: Pointer;
  DataSize: Cardinal; SignData: Pointer; SignSize: Cardinal);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': BeforeVerify');
end;

procedure TForm1.Base641AfterDecode(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': AfterDecode');
end;

procedure TForm1.Base641AfterEncode(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': AfterEncode');
end;

procedure TForm1.Base641BeforeDecode(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': BeforeDecode');
end;

procedure TForm1.Base641BeforeEncode(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': BeforeEncode');
end;

// X.509

procedure TForm1.btEncryptSymClick(Sender: TObject);
var S: string; P: Pointer; len: Integer;
begin
  btUpdSymKeyClick(nil);

  if rbSymDataHex.Checked then begin
    S := LinesToHexStr(MemoSym1.Lines);
    P := HexStrToBuffer(S, len);
  end
  else begin
    S := MemoSym1.Lines.Text;
    P := @S[1];
    len := Length(S);
  end;

  try
    FSelCrypto.Encrypt(P, len);
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;

  if not FSelCrypto.CipherInPlace then begin
    P := FSelCrypto.EncryptedData.Memory;
    len := FSelCrypto.EncryptedData.Size;
  end;
  S := BytesToHexStr(P, len, False);

  MemoSym2.Lines.Clear;
  HexStrToLines(S, MemoSym2.Lines, 16);

  btDecryptSymClick(nil);
end;

procedure TForm1.btDecryptSymClick(Sender: TObject);
var P: Pointer; len: Integer; S: string;
begin
  S := LinesToHexStr(MemoSym2.Lines);
  P := HexStrToBuffer(S, len);
  try
    FSelCrypto.Decrypt(P, len);
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;

  if not FSelCrypto.CipherInPlace then begin
    P := FSelCrypto.DecryptedData.Memory;
    len := FSelCrypto.DecryptedData.Size;
  end;

  if rbSymDataHex.Checked then begin
    S := BytesToHexStr(P, len, False);
    HexStrToLines(S, MemoSym3.Lines, 16);
  end
  else begin
    SetLength(S, len);
    Move(P^, S[1], len);
    MemoSym3.Lines.Text := S;
  end;
end;

procedure TForm1.btClearSymDataClick(Sender: TObject);
begin
  MemoSym1.Lines.Clear;
  MemoSym2.Lines.Clear;
  MemoSym3.Lines.Clear;
end;

procedure TForm1.btLoadSymDataClick(Sender: TObject);
begin
  OpenDialog1.FileName := '';
  OpenDialog1.Filter := 'All files (*.*)|*.*';
  if OpenDialog1.Execute then begin
    case PageControlSym.ActivePageIndex of
      0: btLoadData(OpenDialog1.FileName, MemoSym1.Lines, rbSymDataStr.Checked);
      1: btLoadData(OpenDialog1.FileName, MemoSym2.Lines, rbSymDataStr.Checked);
      2: btLoadData(OpenDialog1.FileName, MemoSym3.Lines, rbSymDataStr.Checked);
    end;
  end;
end;

procedure TForm1.btSaveSymDataClick(Sender: TObject);
begin
  SaveDialog1.FileName := '';
  SaveDialog1.Filter := 'All files (*.*)|*.*';
  if SaveDialog1.Execute then begin
    case PageControlSym.ActivePageIndex of
      0: btSaveData(SaveDialog1.FileName, MemoSym1.Lines, rbSymDataStr.Checked);
      1: btSaveData(SaveDialog1.FileName, MemoSym2.Lines, rbSymDataStr.Checked);
      2: btSaveData(SaveDialog1.FileName, MemoSym3.Lines, rbSymDataStr.Checked);
    end;
  end;
end;

procedure TForm1.ShowDerTree(node: TDerNode; TreeView: TTreeView);

  procedure ShowDerNode(p: TDerNode; pparent: TTreeNode);
  var s: string; t: TTreeNode; i: Integer;
  begin
    if p.TagClass = ASN1_CLS_UNIVERSAL then begin
      case p.TagNumber of
        ASN1_TAG_BOOLEAN:
          if p.BoolValue <> 0 then s := 'TRUE' else s := 'FALSE';
        ASN1_TAG_INTEGER:
          s := 'INTEGER';
//        s := Format('INTEGER {%s}', [p.IntValue]);
        ASN1_TAG_BIT_STRING:
          s := 'BIT STRING';
//        s := Format('BIT STRING {%s}', [p.BitValue]);
        ASN1_TAG_OCTET_STRING:
          s := 'OCTET STRING';
//        s := Format('OCTET STRING {%s}', [p.OctetValue]);
        ASN1_TAG_NULL:
          s := 'NULL';
        ASN1_TAG_OBJECT_IDENTIFIER:
          s := p.OIDValue;
        ASN1_TAG_SEQUENCE:
          s := 'SEQUENCE';
        ASN1_TAG_SET:
          s := 'SET';
        ASN1_TAG_PrintableString, ASN1_TAG_T61String, ASN1_TAG_IA5String:
          s := p.StrValue;
        ASN1_TAG_UTCTime:
          s := p.TimeValue;
        else
          s := 'Unknown Tag';
//        s := p.OctetValue;
      end;
    end else
//    s := p.OctetValue;
      s := 'Unknown Class';

    t := TreeView.Items.AddChild(pparent, s);
    t.Data := p;
    for i := 0 to p.ChildCount-1 do begin
      ShowDerNode(p.Children[i], t);
    end;
  end;

begin
  TreeView.Items.Clear;
  ShowDerNode(node, nil);
  TreeView.FullExpand;
end;

procedure TForm1.BtnVerifySignatureClick(Sender: TObject);
begin
  try
    Data1.Cert1.VerifySignature;
  except
    on E: Exception do begin
      StatusBar1.Panels[0].Text := E.Message;
      Exit;
    end;
  end;
  MessageBox(handle,pchar('Статус цифровой подписи - ОК!'),'Внимание',64);
end;

procedure TForm1.ShowDerTreeNode(TreeView: TTreeView; MemoHex: TMemo);
var p: TDerNode;
begin
  MemoHex.Lines.Clear;
  if TreeView.Selected = nil then Exit;
  p := TreeView.Selected.Data;
  if p = nil then Exit;
  if p.TagClass = ASN1_CLS_UNIVERSAL then begin
    case p.TagNumber of
      ASN1_TAG_BOOLEAN:
        if p.BoolValue <> 0 then
          MemoHex.Lines.Add('TRUE') else
          MemoHex.Lines.Add('FALSE');
      ASN1_TAG_INTEGER:
        HexStrToLines(p.IntValue, MemoHex.Lines, 16);
      ASN1_TAG_BIT_STRING:
        HexStrToLines(p.BitValue, MemoHex.Lines, 16);
      ASN1_TAG_OCTET_STRING:
        HexStrToLines(p.OctetValue, MemoHex.Lines, 16);
      ASN1_TAG_NULL:
        MemoHex.Lines.Add('NULL');
      ASN1_TAG_OBJECT_IDENTIFIER:
        MemoHex.Lines.Add(p.OIDValue);
      ASN1_TAG_SEQUENCE:
        MemoHex.Lines.Add('SEQUENCE');
      ASN1_TAG_SET:
        MemoHex.Lines.Add('SET');
      ASN1_TAG_PrintableString, ASN1_TAG_T61String, ASN1_TAG_IA5String:
        MemoHex.Lines.Add(p.StrValue);
      ASN1_TAG_UTCTime:
        MemoHex.Lines.Add(p.TimeValue);
      else
        HexStrToLines(p.OctetValue, MemoHex.Lines, 16);
    end;
  end else
    HexStrToLines(p.OctetValue, MemoHex.Lines, 16);
end;

procedure TForm1.TreeViewDerClick(Sender: TObject);
begin

end;

// cert editor

procedure TForm1.ShowX509Sertificate;
begin
end;

procedure TForm1.ShowCertValidity;
begin
end;

procedure TForm1.ShowCertPublicKey;
begin
end;

procedure TForm1.ShowCertSignature;
begin
end;

procedure TForm1.ShowCertIssuer;

begin

end;

procedure TForm1.ShowCertSubject;
begin

end;

procedure TForm1.ShowCertExtensions;
begin

end;

// ***** edit certificate

procedure TForm1.BtnCertPKLoadClick(Sender: TObject);
begin
  OpenDialog1.Filter := 'RSA keys (*.keyrsa)|*.keyrsa';
  OpenDialog1.DefaultExt := 'keyrsa';
  if OpenDialog1.Execute then begin
    Data1.RSAforCert.LoadKeysFromFile(OpenDialog1.FileName);
    ShowCertPublicKey;
  end;
end;

procedure TForm1.RadioCertSignClick(Sender: TObject);
begin

end;

// ***** issuer

procedure TForm1.EditCertEMailChange(Sender: TObject);
begin

end;

// ***** subject

procedure EditToInt(Edit: TEdit; var V: Integer);
begin
  if Edit.Text = '' then V := 0 else V := StrToInt(Edit.Text);
end;

end.

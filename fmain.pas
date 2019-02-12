unit fmain;
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ToolWin, AppEvnts, ExtCtrls,
  ASCryptos, ASCryptoComp, ASGtMath, ASUtils, ASX509, ASDer, Grids;

type
  TSRT = class(TForm)
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
    TabDigest: TTabSheet;
    GroupBox1: TGroupBox;
    rbMD2: TRadioButton;
    rbMD4: TRadioButton;
    rbMD5: TRadioButton;
    rbSHA1: TRadioButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label8: TLabel;
    EditDgData: TEdit;
    EditDigest: TEdit;
    btDigest: TButton;
    rbDgDataHex: TRadioButton;
    rbDgDataStr: TRadioButton;
    ToolBar1: TToolBar;
    tbEncryptSymFile: TToolButton;
    tbDecryptSymFile: TToolButton;
    ToolBar2: TToolBar;
    tbClearLog: TToolButton;
    ToolBar3: TToolBar;
    tbFileDigest: TToolButton;
    rbRipEmd: TRadioButton;
    TabCoding: TTabSheet;
    ToolBar4: TToolBar;
    tbEncodeFile: TToolButton;
    tbDecodeFile: TToolButton;
    GroupBox3: TGroupBox;
    rbBase64: TRadioButton;
    GroupBox4: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    EditCodeSource: TEdit;
    EditEncoded: TEdit;
    btEncode: TButton;
    EditDecoded: TEdit;
    Label11: TLabel;
    btDecode: TButton;
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
    TabOaepSeed: TTabSheet;
    MemoOaepSeed: TMemo;
    TabX509: TTabSheet;
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
    TabSheet1: TTabSheet;
    ToolBar6: TToolBar;
    btnParseDerFile: TToolButton;
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
    TreeViewDer: TTreeView;
    PageControl3: TPageControl;
    TabSheet2: TTabSheet;
    ToolBar7: TToolBar;
    SaveDialog1: TSaveDialog;
    btnLoadCert: TToolButton;
    BtnSaveCert: TToolButton;
    Splitter1: TSplitter;
    MemoDerHex: TMemo;
    TabSheet4: TTabSheet;
    Label4: TLabel;
    EditCertPKAlgorithm: TEdit;
    GroupBox6: TGroupBox;
    PageControl7: TPageControl;
    TabSheet16: TTabSheet;
    MemoCertPKMod: TMemo;
    TabSheet17: TTabSheet;
    MemoCertPKExp: TMemo;
    BtnCertPKLoad: TButton;
    TabSheet5: TTabSheet;
    RadioCertSign: TRadioGroup;
    EditCertSignOID: TEdit;
    Label12: TLabel;
    TabSheet14: TTabSheet;
    Label7: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    EditCertCN: TEdit;
    EditCertC: TEdit;
    EditCertL: TEdit;
    EditCertST: TEdit;
    EditCertO: TEdit;
    EditCertOU: TEdit;
    EditCertEMail: TEdit;
    TabSheet15: TTabSheet;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    EditCertSubCN: TEdit;
    EditCertSubC: TEdit;
    EditCertSubL: TEdit;
    EditCertSubST: TEdit;
    EditCertSubO: TEdit;
    EditCertSubOU: TEdit;
    EditCertSubEMail: TEdit;
    MemoCertSignValue: TMemo;
    Label27: TLabel;
    TabSheet18: TTabSheet;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    EditCertValidFromY: TEdit;
    EditCertValidFromM: TEdit;
    EditCertValidFromD: TEdit;
    EditCertValidFromH: TEdit;
    EditCertValidFromN: TEdit;
    EditCertValidFromS: TEdit;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    EditCertValidToY: TEdit;
    EditCertValidToM: TEdit;
    EditCertValidToD: TEdit;
    EditCertValidToH: TEdit;
    EditCertValidToN: TEdit;
    EditCertValidToS: TEdit;
    Label40: TLabel;
    Label41: TLabel;
    TabSheet19: TTabSheet;
    StringGrid1: TStringGrid;
    BtnCertUpdateSign: TButton;
    ComboBoxYesNo: TComboBox;
    BtnVerifySignature: TButton;
    Image1: TImage;
    LabelCertFile: TLabel;
    GroupBox5: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    EditCertVersion: TEdit;
    EditCertSerialNumber: TEdit;
    btnImportRSAKeyPair: TToolButton;
    btnExportRSAKeyPair: TToolButton;
    CheckBox1: TCheckBox;
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
    procedure rbSHA1Click(Sender: TObject);
    procedure btDigestClick(Sender: TObject);
    procedure rbDgDataHexClick(Sender: TObject);
    procedure rbDgDataStrClick(Sender: TObject);
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
    procedure rbRipEmdClick(Sender: TObject);
    procedure tbEncodeFileClick(Sender: TObject);
    procedure btEncodeClick(Sender: TObject);
    procedure btDecodeClick(Sender: TObject);
    procedure Base641AfterDecode(Sender: TObject);
    procedure Base641AfterEncode(Sender: TObject);
    procedure Base641BeforeDecode(Sender: TObject);
    procedure Base641BeforeEncode(Sender: TObject);
    procedure tbDecodeFileClick(Sender: TObject);
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
    procedure btnLoadCertClick(Sender: TObject);
    procedure RSA1ChangeOID(Sender: TObject);
    procedure RSA1ChangePrivateKey(Sender: TObject);
    procedure RSA1ChangePublicKey(Sender: TObject);
    procedure BtnSaveCertClick(Sender: TObject);
    procedure btLoadRSADataClick(Sender: TObject);
    procedure btSaveRSADataClick(Sender: TObject);
    procedure btClearSymDataClick(Sender: TObject);
    procedure btLoadSymDataClick(Sender: TObject);
    procedure btSaveSymDataClick(Sender: TObject);
    procedure btnParseDerFileClick(Sender: TObject);
    procedure BtnVerifySignatureClick(Sender: TObject);
    procedure TreeViewDerClick(Sender: TObject);
    procedure EditCertVersionChange(Sender: TObject);
    procedure EditCertSerialNumberChange(Sender: TObject);
    procedure BtnCertPKLoadClick(Sender: TObject);
    procedure RadioCertSignClick(Sender: TObject);
    procedure EditCertCNChange(Sender: TObject);
    procedure EditCertCChange(Sender: TObject);
    procedure EditCertLChange(Sender: TObject);
    procedure EditCertSTChange(Sender: TObject);
    procedure EditCertOChange(Sender: TObject);
    procedure EditCertOUChange(Sender: TObject);
    procedure EditCertEMailChange(Sender: TObject);
    procedure EditCertSubCNChange(Sender: TObject);
    procedure EditCertSubCChange(Sender: TObject);
    procedure EditCertSubLChange(Sender: TObject);
    procedure EditCertSubSTChange(Sender: TObject);
    procedure EditCertSubOChange(Sender: TObject);
    procedure EditCertSubOUChange(Sender: TObject);
    procedure EditCertSubEMailChange(Sender: TObject);
    procedure EditCertValidFromChange(Sender: TObject);
    procedure EditCertValidToChange(Sender: TObject);
    procedure BtnCertUpdateSignClick(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ComboBoxYesNoClick(Sender: TObject);
    procedure StringGrid1SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure FormActivate(Sender: TObject);
    procedure btnImportRSAKeyPairClick(Sender: TObject);
    procedure btnExportRSAKeyPairClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
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

type UTF8String = type string;

var
  SRT: TSRT;

implementation

uses fCryptoData;

{$R *.DFM}

//Translit to english
function Translit(s: string): string;
const
  rus: string = 'абвгдеёжзийклмнопрстуфхцчшщьыъэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЫЪЭЮЯ';
  lat: array[1..66] of string = ('a', 'b', 'v', 'g', 'd', 'e', 'yo', 'zh', 'z', 'i', 'y', 'k', 'l', 'm', 'n', 'o', 'p', 'r', 's', 't', 'u', 'f', 'kh', 'ts', 'ch', 'sh', 'shch', '''', 'y', '''', 'e', 'yu', 'ya', 'A', 'B', 'V', 'G', 'D', 'E', 'Yo', 'Zh', 'Z', 'I', 'Y', 'K', 'L', 'M', 'N', 'O', 'P', 'R', 'S', 'T', 'U', 'F', 'Kh', 'Ts', 'Ch', 'Sh', 'Shch', '''', 'Y', '''', 'E', 'Yu', 'Ya');
var
  p, i, l: integer;
begin
  Result := '';
  l := Length(s);
  for i := 1 to l do
  begin
    p := Pos(s[i], rus);
    if p<1 then Result := Result + s[i] else Result := Result + lat[p];
  end;
end;

function Utf8Decode(const S: UTF8String): WideString;
var
  L: Integer;
  Temp: WideString;
begin
  Result := '';
  if S = '' then Exit;
  SetLength(Temp, Length(S));

  L := Utf8ToUnicode(PWideChar(Temp), Length(Temp)+1, PChar(S), Length(S));
  if L > 0 then
    SetLength(Temp, L-1)
  else
    Temp := '';
  Result := Temp;
end;

function AnsiToUtf8(const S: string): UTF8String;
begin
  Result := Utf8Encode(S);
end;

function Utf8ToAnsi(const S: UTF8String): string;
begin
  Result := Utf8Decode(S);
end;

{function Utf8ToUnicode(Dest: PWideChar; Source: PChar; MaxChars: Integer): Integer;
var
  len: Cardinal;
begin
  len := 0;
  if Source <> nil then
    while Source[len] <> #0 do
      Inc(len);
  Result := Utf8ToUnicode(Dest, MaxChars, Source, len);
end;}

function Utf8ToUnicode(Dest: PWideChar; MaxDestChars: Cardinal; Source: PChar; SourceBytes: Cardinal): Cardinal;
var
  i, count: Cardinal;
  c: Byte;
  wc: Cardinal;
begin
  if Source = nil then
  begin
    Result := 0;
    Exit;
  end;
  Result := Cardinal(-1);
  count := 0;
  i := 0;
  if Dest <> nil then
  begin
    while (i < SourceBytes) and (count < MaxDestChars) do
    begin
      wc := Cardinal(Source[i]);
      Inc(i);
      if (wc and $80) <> 0 then
      begin
        if i >= SourceBytes then Exit;          // incomplete multibyte char
        wc := wc and $3F;
        if (wc and $20) <> 0 then
        begin
          c := Byte(Source[i]);
          Inc(i);
          if (c and $C0) <> $80 then Exit;      // malformed trail byte or out of range char
          if i >= SourceBytes then Exit;        // incomplete multibyte char
          wc := (wc shl 6) or (c and $3F);
        end;
        c := Byte(Source[i]);
        Inc(i);
        if (c and $C0) <> $80 then Exit;       // malformed trail byte

        Dest[count] := WideChar((wc shl 6) or (c and $3F));
      end
      else
        Dest[count] := WideChar(wc);
      Inc(count);
    end;
    if count >= MaxDestChars then count := MaxDestChars-1;
    Dest[count] := #0;
  end
  else
  begin
    while (i < SourceBytes) do
    begin
      c := Byte(Source[i]);
      Inc(i);
      if (c and $80) <> 0 then
      begin
        if i >= SourceBytes then Exit;          // incomplete multibyte char
        c := c and $3F;
        if (c and $20) <> 0 then
        begin
          c := Byte(Source[i]);
          Inc(i);
          if (c and $C0) <> $80 then Exit;      // malformed trail byte or out of range char
          if i >= SourceBytes then Exit;        // incomplete multibyte char
        end;
        c := Byte(Source[i]);
        Inc(i);
        if (c and $C0) <> $80 then Exit;       // malformed trail byte
      end;
      Inc(count);
    end;
  end;
  Result := count+1;
end;

function Utf8Encode(const WS: WideString): UTF8String;
var
  L: Integer;
  Temp: UTF8String;
begin
  Result := '';
  if WS = '' then Exit;
  SetLength(Temp, Length(WS) * 3); // SetLength includes space for null terminator

  L := UnicodeToUtf8(PChar(Temp), Length(Temp)+1, PWideChar(WS), Length(WS));
  if L > 0 then
    SetLength(Temp, L-1)
  else
    Temp := '';
  Result := Temp;
end;

procedure TSRT.FormCreate(Sender: TObject);
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

procedure TSRT.FormDestroy(Sender: TObject);
begin
  FCertNode.Free;
  FTempData.Free;
end;

procedure TSRT.FormActivate(Sender: TObject);
begin
with SRT do
     SetWindowPos(Handle,
     HWND_TOPMOST,
     Left,
     Top,
     Width,
     Height,
     SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
     ShowX509Sertificate;
end;

procedure TSRT.SetStatus(Index: Integer; const Value: string);
begin
  StatusBar1.Panels[Index].Text := Value;
end;

function TSRT.HexStrToBuffer(const S: string; var blen: Integer): Pointer;
begin
  blen := HexStrNeedBytes(S);
  FTempData.SetSize(blen);
  HexStrToBytes(S, FTempData.Memory, False);
  Result := FTempData.Memory;
end;

// editing keys

procedure TSRT.RefreshSymKey;
begin
  if rbSymKeyHex.Checked then rbSymKeyHexClick(nil) else rbSymKeyStrClick(nil);
  if rbIVHex.Checked     then rbIVHexClick(nil)     else rbIVStrClick(nil);
end;

procedure TSRT.RefreshRSAKey;
var N1, N2, D, E: string;
begin
  Data1.RSA1.ExtractPublicKey(N1, E);
  Data1.RSA1.ExtractPrivateKey(N2, D);
  HexStrToLines(N1, MemoRSAPubMod.Lines,  16);
  HexStrToLines(E,  MemoRSAPubExp.Lines,  16);
  HexStrToLines(N2, MemoRSAPrivMod.Lines, 16);
  HexStrToLines(D,  MemoRSAPrivExp.Lines, 16);
end;

procedure TSRT.btUpdSymKeyClick(Sender: TObject);
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

procedure TSRT.btClearRSAKeyClick(Sender: TObject);
begin
  MemoRSAPubMod.Lines.Clear;
  MemoRSAPubExp.Lines.Clear;
  MemoRSAPrivMod.Lines.Clear;
  MemoRSAPrivExp.Lines.Clear;
  MemoOAEPSeed.Lines.Clear;
end;

procedure TSRT.btUpdRsaKeyClick(Sender: TObject);
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

procedure TSRT.btGenSymKeyClick(Sender: TObject);
begin
  try
    FSelCrypto.GenerateKeys(StrToInt(EditSymKeyLen.Text));
    EditSymKeyLen.Text := IntToStr(FSelCrypto.UserKeyByteLen);
    RefreshSymKey;
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
end;

procedure TSRT.btGenRsaKeyClick(Sender: TObject);
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
  Status[0] := Format('Генерация ключа RSA завершена.  (%f sec elapsed)',
    [(Now - StartMoment) * 24 * 3600]);
  btUpdRsaKeyClick(nil);
end;

procedure TSRT.btLoadSymKeyClick(Sender: TObject);
var s, sext: string;
begin
  try
    OpenDialog1.FileName := '';
    s := Copy(FSelCrypto.Name, 1, Length(FSelCrypto.Name)-1);
    sext := 'key' + Lowercase(Copy(s, 1, 3));
    OpenDialog1.DefaultExt := sext;
    OpenDialog1.Filter := Format('%s keys (*.%s)|*.%1:s', [s, sext]);
    if OpenDialog1.Execute then begin
      FSelCrypto.LoadKeysFromFile(OpenDialog1.FileName);
      RefreshSymKey;
      rbSymKeyHex.Checked := True;
    end;
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
end;

procedure TSRT.btLoadRsaKeyClick(Sender: TObject);
begin
  try
    OpenDialog1.FileName := '';
    OpenDialog1.DefaultExt := 'keyrsa';
    OpenDialog1.Filter := 'RSA keys (*.keyrsa)|*.keyrsa';
    if OpenDialog1.Execute then begin
      Data1.RSA1.LoadKeysFromFile(OpenDialog1.FileName);
      RefreshRSAKey;
    end;
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
  Status[0] := '';
end;

procedure TSRT.btSaveSymKeyClick(Sender: TObject);
var s, sext: string;
begin
  try
    SaveDialog1.FileName := '';
    s := Copy(FSelCrypto.Name, 1, Length(FSelCrypto.Name)-1);
    sext := 'key' + Lowercase(Copy(s, 1, 3));
    SaveDialog1.DefaultExt := sext;
    SaveDialog1.Filter := Format('%s keys (*.%s)|*.%1:s', [s, sext]);
    if SaveDialog1.Execute then FSelCrypto.SaveKeysToFile(SaveDialog1.FileName);
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
  Status[0] := '';
end;

procedure TSRT.btSaveRsaKeyClick(Sender: TObject);
begin
  try
    SaveDialog1.FileName := '';
    SaveDialog1.DefaultExt := 'keyrsa';
    SaveDialog1.Filter := 'RSA ключ (*.keyrsa)|*.keyrsa';
    if SaveDialog1.Execute then Data1.RSA1.SaveKeysToFile(SaveDialog1.FileName);
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
  Status[0] := '';
end;

procedure TSRT.rbSymKeyHexClick(Sender: TObject);
begin
  EditSymKey.Text := TAS_SymmCryptography(FSelCrypto).KeyHexStr;
end;

procedure TSRT.rbSymKeyStrClick(Sender: TObject);
begin
  EditSymKey.Text := TAS_SymmCryptography(FSelCrypto).KeyText;
end;

procedure TSRT.rbIVHexClick(Sender: TObject);
begin
  EditIV.Text := TAS_SymmCryptography(FSelCrypto).InitVectorHexStr;
  EditIV.MaxLength := 16;
end;

procedure TSRT.rbIVStrClick(Sender: TObject);
begin
  EditIV.Text := TAS_SymmCryptography(FSelCrypto).InitVectorText;
  EditIV.MaxLength := 8;
end;

// algorithm

procedure TSRT.rbDESClick(Sender: TObject);
begin
  FSelCrypto := Data1.DES1;
  RefreshSymKey;

  LabelSymKeyLim.Caption := '8..256 байты, кратные 8';
  EditSymKeyLen.Text     := '24';
  EditSymKeyLen.Enabled  := True;

  PanelSymKeyOpt.Visible := True;
  LabelSymKeyOpt.Caption := 'Маска Шифра';
  EditSymKeyOpt.Text     := IntToStr(Data1.DES1.CipherMask);
  cbUseSaferSK.Visible   := False;
end;

procedure TSRT.rbRC2Click(Sender: TObject);
begin
  FSelCrypto := Data1.RC21;
  RefreshSymKey;

  LabelSymKeyLim.Caption := '1..128 байтов';
  EditSymKeyLen.Text     := '16';
  EditSymKeyLen.Enabled  := True;

  PanelSymKeyOpt.Visible := True;
  LabelSymKeyOpt.Caption := 'Эффективные биты';
  EditSymKeyOpt.Text     := IntToStr(Data1.RC21.EffectiveBits);
  cbUseSaferSK.Visible   := False;
end;

procedure TSRT.rbRC4Click(Sender: TObject);
begin
  FSelCrypto := Data1.RC41;
  RefreshSymKey;

  LabelSymKeyLim.Caption := '1 или больше байтов';
  EditSymKeyLen.Text     := '16';
  EditSymKeyLen.Enabled  := True;

  PanelSymKeyOpt.Visible := False;
  cbUseSaferSK.Visible   := False;
end;

procedure TSRT.rbRC5Click(Sender: TObject);
begin
  FSelCrypto := Data1.RC51;
  RefreshSymKey;

  LabelSymKeyLim.Caption := 'Вплоть до 256 байтов';
  EditSymKeyLen.Text     := '16';
  EditSymKeyLen.Enabled  := True;

  PanelSymKeyOpt.Visible := True;
  LabelSymKeyOpt.Caption := 'Количество раундов';
  EditSymKeyOpt.Text     := IntToStr(Data1.RC51.NumRounds);
  cbUseSaferSK.Visible   := False;
end;

procedure TSRT.rbBFClick(Sender: TObject);
begin
  FSelCrypto := Data1.BlowFish1;
  RefreshSymKey;

  LabelSymKeyLim.Caption := 'Вплоть до 72 байтов';
  EditSymKeyLen.Text     := '16';
  EditSymKeyLen.Enabled  := True;

  PanelSymKeyOpt.Visible := False;
  cbUseSaferSK.Visible   := False;
end;

procedure TSRT.rbCastClick(Sender: TObject);
begin
  FSelCrypto := Data1.Cast1;
  RefreshSymKey;

  LabelSymKeyLim.Caption := 'Вплоть до 16 байтов';
  EditSymKeyLen.Text     := '16';
  EditSymKeyLen.Enabled  := False;
  PanelSymKeyOpt.Visible := False;
  cbUseSaferSK.Visible   := False;
end;

procedure TSRT.rbIdeaClick(Sender: TObject);
begin
  FSelCrypto := Data1.Idea1;
  RefreshSymKey;

  LabelSymKeyLim.Caption := '16 байтов';
  EditSymKeyLen.Text     := '16';
  EditSymKeyLen.Enabled  := False;
  PanelSymKeyOpt.Visible := False;
  cbUseSaferSK.Visible   := False;
end;

procedure TSRT.rbSaferClick(Sender: TObject);
begin
  FSelCrypto := Data1.Safer1;
  RefreshSymKey;

  LabelSymKeyLim.Caption := '16 байтов';
  EditSymKeyLen.Text     := '16';
  EditSymKeyLen.Enabled  := False;

  PanelSymKeyOpt.Visible := True;
  LabelSymKeyOpt.Caption := 'Количество раундов';
  EditSymKeyOpt.Text     := IntToStr(Data1.Safer1.NumRounds);
  cbUseSaferSK.Visible   := True;
end;

procedure TSRT.rbSkipJackClick(Sender: TObject);
begin
  FSelCrypto := Data1.SkipJack1;
  RefreshSymKey;

  LabelSymKeyLim.Caption := '10 байтов';
  EditSymKeyLen.Text     := '10';
  EditSymKeyLen.Enabled  := False;

  PanelSymKeyOpt.Visible := False;
  cbUseSaferSK.Visible   := False;
end;

procedure TSRT.cbUseSaferSKClick(Sender: TObject);
begin
  Data1.Safer1.UseSaferSK := cbUseSaferSK.Checked;
end;

procedure TSRT.rbPkcsClick(Sender: TObject);
begin
  LabelRsaKeyLim.Caption   := '32 в 512 байтов';
  EditRsaKeyLen.Text       := '32';
  Data1.RSA1.EncryptionScheme    := esPkcs1;
  PanelShemeDigest.Visible := False;
end;

procedure TSRT.rbOaepClick(Sender: TObject);
begin
  LabelRsaKeyLim.Caption   := '64 в 512 байтов';
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
end;

procedure TSRT.rbPlainClick(Sender: TObject);
begin
  LabelRsaKeyLim.Caption   := '32 в 512 байтов';
  EditRsaKeyLen.Text       := '32';
  Data1.RSA1.EncryptionScheme    := esPlain;
  PanelShemeDigest.Visible := False;
end;

procedure TSRT.cbRsaDigestClick(Sender: TObject);
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

procedure TSRT.rbECBClick(Sender: TObject);
begin
  TAS_SymmCryptography(FSelCrypto).CipherMode := cmECB;
  PanelIV.Visible := False;
end;

procedure TSRT.rbCBCClick(Sender: TObject);
begin
  TAS_SymmCryptography(FSelCrypto).CipherMode := cmCBC;
  PanelIV.Visible := True;
end;

procedure TSRT.rbCFBClick(Sender: TObject);
begin
  TAS_SymmCryptography(FSelCrypto).CipherMode := cmCFB;
  PanelIV.Visible := True;
end;

procedure TSRT.rbOFBClick(Sender: TObject);
begin
  TAS_SymmCryptography(FSelCrypto).CipherMode := cmOFB;
  PanelIV.Visible := True;
end;

// data

procedure TSRT.rbSymDataHexClick(Sender: TObject);
var i: Integer;
begin
  for i := 0 to MemoSym1.Lines.Count-1 do
    MemoSym1.Lines[i] := StrToHexStr(MemoSym1.Lines[i], False);
  for i := 0 to MemoSym3.Lines.Count-1 do
    MemoSym3.Lines[i] := StrToHexStr(MemoSym3.Lines[i], False);
end;

procedure TSRT.rbSymDataStrClick(Sender: TObject);
var i: Integer;
begin
  for i := 0 to MemoSym1.Lines.Count-1 do
    MemoSym1.Lines[i] := HexStrToStr(MemoSym1.Lines[i], False);
  for i := 0 to MemoSym3.Lines.Count-1 do
    MemoSym3.Lines[i] := HexStrToStr(MemoSym3.Lines[i], False);
end;

procedure TSRT.rbRsaDataHexClick(Sender: TObject);
var i: Integer;
begin
  for i := 0 to MemoRsa1.Lines.Count-1 do
    MemoRsa1.Lines[i] := StrToHexStr(MemoRsa1.Lines[i], False);
  for i := 0 to MemoRsa3.Lines.Count-1 do
    MemoRsa3.Lines[i] := StrToHexStr(MemoRsa3.Lines[i], False);
end;

procedure TSRT.rbRsaDataStrClick(Sender: TObject);
var i: Integer;
begin
  for i := 0 to MemoRsa1.Lines.Count-1 do
    MemoRsa1.Lines[i] := HexStrToStr(MemoRsa1.Lines[i], False);
  for i := 0 to MemoRsa3.Lines.Count-1 do
    MemoRsa3.Lines[i] := HexStrToStr(MemoRsa3.Lines[i], False);
end;

// encrypt/decrypt

procedure TSRT.btEncryptRsaClick(Sender: TObject);
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

procedure TSRT.btDecryptRsaClick(Sender: TObject);
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

procedure TSRT.btClearRsaDataClick(Sender: TObject);
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

procedure TSRT.btLoadRSADataClick(Sender: TObject);
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

procedure TSRT.btSaveRSADataClick(Sender: TObject);
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

procedure TSRT.tbEncryptSymFileClick(Sender: TObject);
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
        Status[0] := 'Encrypting file: ' + OpenDialog1.FileName + '...';
        FSelCrypto.EncryptFile(OpenDialog1.FileName, senc);
        MessageDlg('Encrypted file is: ' + senc, mtConfirmation, [mbOK], 0);
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
  Status[0] := '';
end;

procedure TSRT.tbDecryptSymFileClick(Sender: TObject);
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
        Status[0] := 'Decrypting file: ' + OpenDialog1.FileName + '...';
        FSelCrypto.DecryptFile(OpenDialog1.FileName, sdec);
        MessageDlg('Decrypted file is: ' + sdec, mtConfirmation, [mbOK], 0);
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
  Status[0] := '';
end;

procedure TSRT.tbEncryptRsaFileClick(Sender: TObject);
var senc: string;
begin
  try
    Screen.Cursor := crHourGlass;
    try
      OpenDialog1.FileName := '';
      OpenDialog1.Filter := 'All files (*.*)|*.*';
      if OpenDialog1.Execute then begin
        senc := ChangeFileExt(OpenDialog1.FileName, '.rsa');
        Status[0] := 'Encrypting file: ' + OpenDialog1.FileName + '...';
        Data1.RSA1.EncryptFile(OpenDialog1.FileName, senc);
        MessageDlg('Encrypted file is: ' + senc, mtConfirmation, [mbOK], 0);
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
  Status[0] := '';
end;

procedure TSRT.tbDecryptRsaFileClick(Sender: TObject);
var sdec: string;
begin
  try
    Screen.Cursor := crHourGlass;
    try
      OpenDialog1.FileName := '';
      OpenDialog1.DefaultExt := 'rsa';
      OpenDialog1.Filter := 'RSA encrypted files (*.rsa)|*.rsa|All files (*.*)|*.*';
      if OpenDialog1.Execute then begin
        sdec := ChangeFileExt(OpenDialog1.FileName, '.tmp');
        Status[0] := 'Decrypting file: ' + OpenDialog1.FileName + '...';
        Data1.RSA1.DecryptFile(OpenDialog1.FileName, sdec);
        MessageDlg('Decrypted file is: ' + sdec, mtConfirmation, [mbOK], 0);
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
  Status[0] := '';
end;

// sign/verify

procedure TSRT.tbSignFileClick(Sender: TObject);
var s: string;
begin
  try
    OpenDialog1.FileName := '';
    OpenDialog1.Filter := 'Все файлы (*.*)|*.*';
    if OpenDialog1.Execute then begin
      Data1.RSA1.SignFile(OpenDialog1.FileName);
      s := ChangeFileExt(OpenDialog1.FileName, '.sig');
      Data1.RSA1.SaveSignatureToFile(s);
      ShowMessage('Ищем подпись в файле: ' + s);
    end;
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
  Status[0] := '';
end;

procedure TSRT.tbVerifyFileClick(Sender: TObject);
var s: string;
begin
  try
    OpenDialog1.FileName := '';
    OpenDialog1.Filter := 'Все файлы (*.*)|*.*';
    if OpenDialog1.Execute then begin
      s := ChangeFileExt(OpenDialog1.FileName, '.sig');
      Data1.RSA1.LoadSignatureFromFile(s);
      Data1.RSA1.VerifyFileSignature(OpenDialog1.FileName,
        Data1.RSA1.SignatureValue.Memory,
        Data1.RSA1.SignatureValue.Size);
        MessageBox(handle,'Цифровая подпись верна!','Внимание',64);
    end;
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
  Status[0] := '';
end;

procedure TSRT.btnImportRSAKeyPairClick(Sender: TObject);
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

procedure TSRT.btnExportRSAKeyPairClick(Sender: TObject);
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

procedure TSRT.tbTestRsaKeyClick(Sender: TObject);
begin
  if Data1.RSA1.TestKeyPair then
    MessageDlg('RSA ключ OK',     mtInformation, [mbOK], 0) else
    MessageDlg('RSA ключ invalid', mtError,       [mbOK], 0);
end;

// logging

procedure TSRT.tbClearLogClick(Sender: TObject);
begin
  MemoLog.Clear;
end;

procedure TSRT.CryptAfterDecrypt(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': AfterDecrypt');
end;

procedure TSRT.CryptAfterDecryptBlock(Sender: TObject;
  Block: Pointer; Offset, Size: DWord);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': AfterDecryptBlock');
  Application.ProcessMessages;
end;

procedure TSRT.CryptAfterEncrypt(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': AfterEncrypt');
end;

procedure TSRT.CryptAfterEncryptBlock(Sender: TObject;
  Block: Pointer; Offset, Size: DWord);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': AfterEncryptBlock');
  Application.ProcessMessages;
end;

procedure TSRT.CryptAfterGenKeys(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': AfterGenKeys');
end;

procedure TSRT.CryptAfterLoadKeys(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': AfterLoadKeys');
end;

procedure TSRT.CryptAfterSaveKeys(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': AfterSaveKeys');
end;

procedure TSRT.CryptBeforeDecrypt(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': BeforeDecrypt');
end;

procedure TSRT.CryptBeforeDecryptBlock(Sender: TObject;
  Block: Pointer; Offset, Size: DWord);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': BeforeDecryptBlock');
  Application.ProcessMessages;
end;

procedure TSRT.CryptBeforeEncrypt(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': BeforeEncrypt');
end;

procedure TSRT.CryptBeforeEncryptBlock(Sender: TObject;
  Block: Pointer; Offset, Size: DWord);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': BeforeEncryptBlock');
  Application.ProcessMessages;
end;

procedure TSRT.CryptBeforeGenKeys(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': BeforeGenKeys');
end;

procedure TSRT.CryptBeforeLoadKeys(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': BeforeLoadKeys');
end;

procedure TSRT.CryptBeforeSaveKeys(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': BeforeSaveKeys');
end;

procedure TSRT.SymmChangeInitVector(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': ChangeInitVector');
end;

procedure TSRT.SymmChangeKey(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': ChangeKey');
end;

procedure TSRT.SymmPostValidateKey(Sender: TObject; Key: Pointer;
  KeyByteLen: Integer; var KeyValid: Boolean);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': PostValidateKey');
end;

procedure TSRT.AS_PrimeGenerator1TryRandomPrime(Sender: TObject; prime: GiantInt);
begin
  MemoLog.Lines.Add(Format('Проверка случайной величины: %s', [GiantIntToHex(prime, True)]));
  Application.ProcessMessages;
end;

procedure TSRT.AS_PrimeGenerator1AfterGenPrime(Sender: TObject; prime: GiantInt);
begin
  MemoLog.Lines.Add(Format('Поиск начало: %s', [GiantIntToHex(prime, True)]));
end;

procedure TSRT.RSA1ChangePrivateKey(Sender: TObject);
begin
  MemoLog.Lines.Add('RSA: закрытый ключ изменен');
end;

procedure TSRT.RSA1ChangePublicKey(Sender: TObject);
begin
  MemoLog.Lines.Add('RSA: открытый ключ изменен');
end;

procedure TSRT.RSA1ChangeOID(Sender: TObject);
begin
  MemoLog.Lines.Add(Format('RSA: объект ID изменен: %s', [Data1.RSA1.ObjectID]));
end;

// Digest

procedure TSRT.rbMD2Click(Sender: TObject);
begin
  Data1.MDX1.Version := dgMD2;
  EditDigest.Text := '';
end;

procedure TSRT.rbMD4Click(Sender: TObject);
begin
  Data1.MDX1.Version := dgMD4;
  EditDigest.Text := '';
end;

procedure TSRT.rbMD5Click(Sender: TObject);
begin
  Data1.MDX1.Version := dgMD5;
  EditDigest.Text := '';
end;

procedure TSRT.rbSHA1Click(Sender: TObject);
begin
  EditDigest.Text := '';
end;

procedure TSRT.rbRipEmdClick(Sender: TObject);
begin
  EditDigest.Text := '';
end;

procedure TSRT.btDigestClick(Sender: TObject);
var P: Pointer; len: Integer;
begin
  try
    if rbDgDataHex.Checked then begin
      P := HexStrToBuffer(EditDgData.Text, len);
      if rbSHA1.Checked then Data1.SHA1.CalcDigest(P, len) else
      if rbRipEmd.Checked then Data1.Rip1.CalcDigest(P, len) else
        Data1.MDX1.CalcDigest(P, len);
    end
    else begin
      if rbSHA1.Checked then Data1.SHA1.CalcDigestOfString(EditDgData.Text)
      else
      if rbRipEmd.Checked then Data1.Rip1.CalcDigestOfString(EditDgData.Text)
      else
        Data1.MDX1.CalcDigestOfString(EditDgData.Text);
    end;
    if rbSHA1.Checked then
      EditDigest.Text := BytesToHexStr(Data1.SHA1.Digest, Data1.SHA1.DigestSize, False)
    else
    if rbRipEmd.Checked then
      EditDigest.Text := BytesToHexStr(Data1.Rip1.Digest, Data1.Rip1.DigestSize, False)
    else
      EditDigest.Text := BytesToHexStr(Data1.MDX1.Digest, Data1.MDX1.DigestSize, False);
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
end;

procedure TSRT.rbDgDataHexClick(Sender: TObject);
begin
  EditDgData.Text := StrToHexStr(EditDgData.Text, False);
end;

procedure TSRT.rbDgDataStrClick(Sender: TObject);
begin
  EditDgData.Text := HexStrToStr(EditDgData.Text, False);
end;

procedure TSRT.tbDigestFileClick(Sender: TObject);
begin
  OpenDialog1.FileName := '';
  OpenDialog1.Filter := 'Все файлы (*.*)|*.*';
  if OpenDialog1.Execute then begin
    if rbSHA1.Checked then begin
      Data1.SHA1.CalcDigestOfFile(OpenDialog1.FileName);
      EditDigest.Text := BytesToHexStr(Data1.SHA1.Digest, Data1.SHA1.DigestSize, False);
    end else
    if rbRipEmd.Checked then begin
      Data1.Rip1.CalcDigestOfFile(OpenDialog1.FileName);
      EditDigest.Text := BytesToHexStr(Data1.Rip1.Digest, Data1.Rip1.DigestSize, False);
    end
    else begin
      Data1.MDX1.CalcDigestOfFile(OpenDialog1.FileName);
      EditDigest.Text := BytesToHexStr(Data1.MDX1.Digest, Data1.MDX1.DigestSize, False);
    end;
  end;
end;

// encoding /decoding

procedure TSRT.tbEncodeFileClick(Sender: TObject);
begin
  try
    OpenDialog1.FileName := '';
    OpenDialog1.Filter := 'Все файлы (*.*)|*.*';
    if OpenDialog1.Execute then begin
      if rbBase64.Checked then begin
        Data1.Base641.EncodeFile(OpenDialog1.FileName);
        Data1.Base641.EncodedData.SaveToFile(ChangeFileExt(OpenDialog1.FileName, '.b64'));
      end;
    end;
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
end;

procedure TSRT.tbDecodeFileClick(Sender: TObject);
begin
  try
    OpenDialog1.FileName := '';
    OpenDialog1.Filter := 'Все файлы (*.*)|*.*';
    if OpenDialog1.Execute then begin
      if rbBase64.Checked then begin
        Data1.Base641.DecodeFile(OpenDialog1.FileName);
        Data1.Base641.DecodedData.SaveToFile(ChangeFileExt(OpenDialog1.FileName, '.tmp'));
      end;
    end;
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
end;

procedure TSRT.btEncodeClick(Sender: TObject);
begin
  try
    if rbBase64.Checked then begin
      EditEncoded.Text := Data1.Base641.EncodeString(EditCodeSource.Text);
      EditDecoded.Text := Data1.Base641.DecodeString(EditEncoded.Text);
    end;
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
end;

procedure TSRT.btDecodeClick(Sender: TObject);
begin
  try
    if rbBase64.Checked then begin
      EditDecoded.Text := Data1.Base641.DecodeString(EditEncoded.Text);
    end;
  except
    on E: Exception do begin Status[0] := E.Message; Exit; end;
  end;
end;

// logging

procedure TSRT.AfterCalcDigest(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': AfterCalcDigest');
end;

procedure TSRT.BeforeCalcDigest(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': BeforeCalcDigest');
end;

procedure TSRT.RSA1AfterSign(Sender: TObject; Data: Pointer; DataSize: Cardinal);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': AfterSign');
end;

procedure TSRT.RSA1AfterVerify(Sender: TObject; Data: Pointer;
  DataSize: Cardinal; SignData: Pointer; SignSize: Cardinal);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': AfterVerify');
end;

procedure TSRT.RSA1BeforeSign(Sender: TObject; Data: Pointer; DataSize: Cardinal);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': beforeSign');
end;

procedure TSRT.RSA1BeforeVerify(Sender: TObject; Data: Pointer;
  DataSize: Cardinal; SignData: Pointer; SignSize: Cardinal);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': BeforeVerify');
end;

procedure TSRT.Base641AfterDecode(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': AfterDecode');
end;

procedure TSRT.Base641AfterEncode(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': AfterEncode');
end;

procedure TSRT.Base641BeforeDecode(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': BeforeDecode');
end;

procedure TSRT.Base641BeforeEncode(Sender: TObject);
var s: string;
begin
  s := Copy(TComponent(Sender).Name, 1, Length(TComponent(Sender).Name)-1);
  MemoLog.Lines.Add(s + ': BeforeEncode');
end;

// X.509

procedure TSRT.btnLoadCertClick(Sender: TObject);
var Ext: string;
begin
  OpenDialog1.Filter := 'DER files (*.der)|*.der|PEM files (*.pem)|*.pem';
  OpenDialog1.DefaultExt := 'der';
  if OpenDialog1.Execute then begin
    Ext := UpperCase(ExtractFileExt(OpenDialog1.FileName));
    if Ext = '.DER' then Data1.Cert1.LoadFromDERFile(OpenDialog1.FileName) else
    if Ext = '.PEM' then Data1.Cert1.LoadFromPEMFile(OpenDialog1.FileName) else Exit;
    LabelCertFile.Caption := OpenDialog1.FileName;
    ShowX509Sertificate;
  end;
end;

procedure TSRT.BtnSaveCertClick(Sender: TObject);
var Ext: string;
begin
  SaveDialog1.Filter := 'DER files (*.der)|*.der|PEM files (*.pem)|*.pem';
  SaveDialog1.DefaultExt := 'pem';
  if SaveDialog1.Execute then begin
    Ext := UpperCase(ExtractFileExt(SaveDialog1.FileName));
    if Ext = '.DER' then Data1.Cert1.SaveToDERFile(SaveDialog1.FileName) else
    if Ext = '.PEM' then Data1.Cert1.SaveToPEMFile(SaveDialog1.FileName) else Exit;
    LabelCertFile.Caption := SaveDialog1.FileName;
  end;
end;

procedure TSRT.btEncryptSymClick(Sender: TObject);
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

procedure TSRT.btDecryptSymClick(Sender: TObject);
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

procedure TSRT.btClearSymDataClick(Sender: TObject);
begin
  MemoSym1.Lines.Clear;
  MemoSym2.Lines.Clear;
  MemoSym3.Lines.Clear;
end;

procedure TSRT.btLoadSymDataClick(Sender: TObject);
begin
  OpenDialog1.FileName := '';
  OpenDialog1.Filter := 'Все файлы (*.*)|*.*';
  if OpenDialog1.Execute then begin
    case PageControlSym.ActivePageIndex of
      0: btLoadData(OpenDialog1.FileName, MemoSym1.Lines, rbSymDataStr.Checked);
      1: btLoadData(OpenDialog1.FileName, MemoSym2.Lines, rbSymDataStr.Checked);
      2: btLoadData(OpenDialog1.FileName, MemoSym3.Lines, rbSymDataStr.Checked);
    end;
  end;
end;

procedure TSRT.btSaveSymDataClick(Sender: TObject);
begin
  SaveDialog1.FileName := '';
  SaveDialog1.Filter := 'Все файлы (*.*)|*.*';
  if SaveDialog1.Execute then begin
    case PageControlSym.ActivePageIndex of
      0: btSaveData(SaveDialog1.FileName, MemoSym1.Lines, rbSymDataStr.Checked);
      1: btSaveData(SaveDialog1.FileName, MemoSym2.Lines, rbSymDataStr.Checked);
      2: btSaveData(SaveDialog1.FileName, MemoSym3.Lines, rbSymDataStr.Checked);
    end;
  end;
end;

procedure TSRT.btnParseDerFileClick(Sender: TObject);
var Ext: string;
begin
  OpenDialog1.FileName := '';
  OpenDialog1.Filter := 'DER files (*.der)|*.der|PEM files (*.pem)|*.pem';
  if OpenDialog1.Execute then begin
    Ext := UpperCase(ExtractFileExt(OpenDialog1.FileName));
    if Ext = '.DER' then FCertNode.LoadFromFile(OpenDialog1.FileName) else
    if Ext = '.PEM' then FCertNode.LoadFromPEMFile(OpenDialog1.FileName) else Exit;
    ShowDerTree(FCertNode, TreeViewDer);
  end;
end;

procedure TSRT.ShowDerTree(node: TDerNode; TreeView: TTreeView);

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

procedure TSRT.BtnVerifySignatureClick(Sender: TObject);
begin
  try
    Data1.Cert1.VerifySignature;
  except
    on E: Exception do begin
      StatusBar1.Panels[0].Text := E.Message;
      Exit;
    end;
  end;
  MessageBox(handle,'Цифровая подпись верна!','Внимание',64);
end;

procedure TSRT.ShowDerTreeNode(TreeView: TTreeView; MemoHex: TMemo);
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

procedure TSRT.TreeViewDerClick(Sender: TObject);
begin
  ShowDerTreeNode(TreeViewDer, MemoDerHex);
end;

// cert editor

procedure TSRT.ShowX509Sertificate;
begin
  EditCertVersion.Text := IntToStr(Data1.Cert1.Version);
  EditCertSerialNumber.Text := Data1.Cert1.SerialNumber;
  ShowCertValidity;
  ShowCertPublicKey;
  ShowCertSignature;
  ShowCertIssuer;
  ShowCertSubject;
  ShowCertExtensions;
end;

procedure TSRT.ShowCertValidity;
var y,m,d,h,n,s: Integer;
begin
  StrToYMDHNS(Data1.Cert1.NotValidBefore, y, m, d, h, n, s);
  EditCertValidFromY.Text := IntToStr(y);
  EditCertValidFromM.Text := IntToStr(m);
  EditCertValidFromD.Text := IntToStr(d);
  EditCertValidFromH.Text := IntToStr(h);
  EditCertValidFromN.Text := IntToStr(n);
  EditCertValidFromS.Text := IntToStr(s);

  StrToYMDHNS(Data1.Cert1.NotValidAfter, y, m, d, h, n, s);
  EditCertValidToY.Text := IntToStr(y);
  EditCertValidToM.Text := IntToStr(m);
  EditCertValidToD.Text := IntToStr(d);
  EditCertValidToH.Text := IntToStr(h);
  EditCertValidToN.Text := IntToStr(n);
  EditCertValidToS.Text := IntToStr(s);
end;

procedure TSRT.ShowCertPublicKey;
var PKMod, PKExp: string;
begin
  EditCertPKAlgorithm.Text := Data1.Cert1.PublicKeyAlgorithm;
  BitStrToRSAKey(Data1.Cert1.PublicKeyBitValue, PKMod, PKExp);
  HexStrToLines(PKMod, MemoCertPKMod.Lines, 16);
  HexStrToLines(PKExp, MemoCertPKExp.Lines, 16);
end;

procedure TSRT.ShowCertSignature;
begin
  EditCertSignOID.Text := Data1.Cert1.Signature;
  if Data1.Cert1.Signature = OID_MD2withRSA  then RadioCertSign.ItemIndex := 0 else
  if Data1.Cert1.Signature = OID_MD4withRSA  then RadioCertSign.ItemIndex := 1 else
  if Data1.Cert1.Signature = OID_MD5withRSA  then RadioCertSign.ItemIndex := 2 else
  if Data1.Cert1.Signature = OID_SHA1withRSA then RadioCertSign.ItemIndex := 3 else
    RadioCertSign.ItemIndex := 4;
  HexStrToLines(Data1.Cert1.SignatureValue, MemoCertSignValue.Lines, 16);
end;

procedure TSRT.ShowCertIssuer;
  procedure ExtractValue(List: Tstrings; const Name: string; Edit: TCustomEdit);
  var i: Integer;
  begin
    i := List.IndexOfName(Name);
    if i >= 0 then Edit.Text := List.Values[Name];
  end;
begin
  ExtractValue(Data1.Cert1.Issuer,  OID_CommonName,         EditCertCN);
  ExtractValue(Data1.Cert1.Issuer,  OID_CountryName,        EditCertC);
  ExtractValue(Data1.Cert1.Issuer,  OID_Locality,           EditCertL);
  ExtractValue(Data1.Cert1.Issuer,  OID_StateProvince,      EditCertST);
  ExtractValue(Data1.Cert1.Issuer,  OID_Organization,       EditCertO);
  ExtractValue(Data1.Cert1.Issuer,  OID_OrganizationalUnit, EditCertOU);
  ExtractValue(Data1.Cert1.Issuer,  OID_EMailAddress,       EditCertEMail);
end;

procedure TSRT.ShowCertSubject;
  procedure ExtractValue(List: Tstrings; const Name: string; Edit: TCustomEdit);
  var i: Integer;
  begin
    i := List.IndexOfName(Name);
    if i >= 0 then Edit.Text := List.Values[Name];
  end;
begin
  ExtractValue(Data1.Cert1.Subject, OID_CommonName,         EditCertSubCN);
  ExtractValue(Data1.Cert1.Subject, OID_CountryName,        EditCertSubC);
  ExtractValue(Data1.Cert1.Subject, OID_Locality,           EditCertSubL);
  ExtractValue(Data1.Cert1.Subject, OID_StateProvince,      EditCertSubST);
  ExtractValue(Data1.Cert1.Subject, OID_Organization,       EditCertSubO);
  ExtractValue(Data1.Cert1.Subject, OID_OrganizationalUnit, EditCertSubOU);
  ExtractValue(Data1.Cert1.Subject, OID_EMailAddress,       EditCertSubEMail);
end;

procedure TSRT.ShowCertExtensions;
var I, L: Integer; V: string;
begin
  for I := 0 to Data1.Cert1.Extensions.Count-1 do begin
    StringGrid1.Cells[0, I+1] := Data1.Cert1.Extensions.Names[I];
    V := Data1.Cert1.Extensions.Values[Data1.Cert1.Extensions.Names[I]];
    StringGrid1.Cells[1, I+1] := Copy(V, 1, Length(V)-2);
    L := Length(V);
    if L > 1 then begin
      if (V[L-1] = '0') and (V[L] = '0')  then
        StringGrid1.Cells[2, I+1] := 'No' else
        StringGrid1.Cells[2, I+1] := 'Yes';
    end else
      StringGrid1.Cells[2, I+1] := 'No';
  end;
end;

// ***** edit certificate

procedure TSRT.EditCertVersionChange(Sender: TObject);
begin
  if EditCertVersion.Text <> '' then Data1.Cert1.Version := StrToInt(EditCertVersion.Text);
end;

procedure TSRT.EditCertSerialNumberChange(Sender: TObject);
begin
  Data1.Cert1.SerialNumber := EditCertSerialNumber.Text;
end;

procedure TSRT.BtnCertPKLoadClick(Sender: TObject);
begin
  OpenDialog1.Filter := 'RSA ключ (*.keyrsa)|*.keyrsa';
  OpenDialog1.DefaultExt := 'keyrsa';
  if OpenDialog1.Execute then begin
    Data1.RSAforCert.LoadKeysFromFile(OpenDialog1.FileName);
    ShowCertPublicKey;
  end;
end;

procedure TSRT.RadioCertSignClick(Sender: TObject);
begin
  case RadioCertSign.ItemIndex of
    0: EditCertSignOID.Text := OID_MD2withRSA;
    1: EditCertSignOID.Text := OID_MD4withRSA;
    2: EditCertSignOID.Text := OID_MD5withRSA;
    3: EditCertSignOID.Text := OID_SHA1withRSA;
    else EditCertSignOID.Text := '';
  end;
end;

// ***** issuer

procedure TSRT.EditCertCNChange(Sender: TObject);
begin
  Data1.Cert1.Issuer.Values[OID_CommonName] := EditCertCN.Text;
end;

procedure TSRT.EditCertCChange(Sender: TObject);
begin
  Data1.Cert1.Issuer.Values[OID_CountryName] := EditCertC.Text;
end;

procedure TSRT.EditCertLChange(Sender: TObject);
begin
  Data1.Cert1.Issuer.Values[OID_Locality] := EditCertL.Text;
end;

procedure TSRT.EditCertSTChange(Sender: TObject);
begin
  Data1.Cert1.Issuer.Values[OID_StateProvince] := EditCertST.Text;
end;

procedure TSRT.EditCertOChange(Sender: TObject);
begin
  Data1.Cert1.Issuer.Values[OID_Organization] := EditCertO.Text;
end;

procedure TSRT.EditCertOUChange(Sender: TObject);
begin
  Data1.Cert1.Issuer.Values[OID_OrganizationalUnit] := EditCertOU.Text;
end;

procedure TSRT.EditCertEMailChange(Sender: TObject);
begin
  Data1.Cert1.Issuer.Values[OID_EMailAddress] := EditCertEMail.Text;
end;

// ***** subject

procedure TSRT.EditCertSubCNChange(Sender: TObject);
begin
  Data1.Cert1.Subject.Values[OID_CommonName] := EditCertSubCN.Text;
end;

procedure TSRT.EditCertSubCChange(Sender: TObject);
begin
  Data1.Cert1.Subject.Values[OID_CountryName] := EditCertSubC.Text;
end;

procedure TSRT.EditCertSubLChange(Sender: TObject);
begin
  Data1.Cert1.Subject.Values[OID_Locality] := EditCertSubL.Text;
end;

procedure TSRT.EditCertSubSTChange(Sender: TObject);
begin
  Data1.Cert1.Subject.Values[OID_StateProvince] := EditCertSubST.Text;
end;

procedure TSRT.EditCertSubOChange(Sender: TObject);
begin
  Data1.Cert1.Subject.Values[OID_Organization] := EditCertSubO.Text;
end;

procedure TSRT.EditCertSubOUChange(Sender: TObject);
begin
  Data1.Cert1.Subject.Values[OID_OrganizationalUnit] := EditCertSubOU.Text;
end;

procedure TSRT.EditCertSubEMailChange(Sender: TObject);
begin
  Data1.Cert1.Subject.Values[OID_EMailAddress] := EditCertSubEMail.Text;
end;

procedure EditToInt(Edit: TEdit; var V: Integer);
begin
  if Edit.Text = '' then V := 0 else V := StrToInt(Edit.Text);
end;

procedure TSRT.EditCertValidFromChange(Sender: TObject);
var y,m,d,h,n,s: Integer;
begin
  EditToInt(EditCertValidFromY, y);
  EditToInt(EditCertValidFromM, m);
  EditToInt(EditCertValidFromD, d);
  EditToInt(EditCertValidFromH, h);
  EditToInt(EditCertValidFromN, n);
  EditToInt(EditCertValidFromS, s);
  Data1.Cert1.NotValidBefore := YMDHNSToStr(y, m, d, h, n, s);
end;

procedure TSRT.EditCertValidToChange(Sender: TObject);
var y,m,d,h,n,s: Integer;
begin
  EditToInt(EditCertValidToY, y);
  EditToInt(EditCertValidToM, m);
  EditToInt(EditCertValidToD, d);
  EditToInt(EditCertValidToH, h);
  EditToInt(EditCertValidToN, n);
  EditToInt(EditCertValidToS, s);
  Data1.Cert1.NotValidAfter := YMDHNSToStr(y, m, d, h, n, s);
end;

procedure TSRT.BtnCertUpdateSignClick(Sender: TObject);
begin
  Data1.Cert1.Signature := EditCertSignOID.Text;
  Data1.Cert1.UpdateSignature;
  ShowCertPublicKey;
  ShowCertSignature;
end;

procedure TSRT.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  Rect: TRect;
  H, W: Integer;
begin
  Rect := StringGrid1.CellRect(ACol, ARow);
  H := Rect.Bottom - Rect.Top;
  W := Rect.Right  - Rect.Left + 2;
  case ACol of
    1:
      begin
        ComboBoxYesNo.Hide;
{       EllipsisBtn.SetBounds(Rect.Right-H, Rect.Top, H, H);
        EllipsisBtn.Show; }
      end;
    2:
      begin
//      EllipsisBtn.Hide;
        ComboBoxYesNo.SetBounds(Rect.Left, Rect.Top, W, H);
        if CompareText(StringGrid1.Cells[ACol, ARow], 'Yes') = 0 then
          ComboBoxYesNo.ItemIndex  := 0 else
          ComboBoxYesNo.ItemIndex  := 1;
        ComboBoxYesNo.Ctl3D := False;
        ComboBoxYesNo.Show;
      end;
    else
//    EllipsisBtn.Hide;
      ComboBoxYesNo.Hide;
  end;
end;

procedure TSRT.ComboBoxYesNoClick(Sender: TObject);
begin
  StringGrid1.Cells[StringGrid1.Col, StringGrid1.Row] := ComboBoxYesNo.Text;
end;

procedure TSRT.StringGrid1SetEditText(Sender: TObject;
  ACol, ARow: Integer; const Value: String);
var
  S, V: string;
begin
  S := Trim(StringGrid1.Cells[0, ARow]);
  if S <> '' then begin
    V := Trim(StringGrid1.Cells[1, ARow]);
    if CompareText(Trim(StringGrid1.Cells[2, ARow]), 'Yes') = 0 then
      V := V + 'FF' else
      V := V + '00';
    Data1.Cert1.Extensions.Values[S] := V;
  end;
end;

procedure TSRT.CheckBox1Click(Sender: TObject);
var
  a1,a2,a3,a4,a5,a6,a7,
  s1,s2,s3,s4,s5,s6,s7: string;
begin
  if CheckBox1.Checked then
   begin
   a1:=Translit(EditCertCN.Text);
   EditCertCN.Text:=a1;
   a2:=Translit(EditCertC.Text);
   EditCertC.Text:=a2;
   a3:=Translit(EditCertL.Text);
   EditCertL.Text:=a3;
   a4:=Translit(EditCertST.Text);
   EditCertST.Text:=a4;
   a5:=Translit(EditCertO.Text);
   EditCertO.Text:=a5;
   a6:=Translit(EditCertOU.Text);
   EditCertOU.Text:=a6;
   a7:=Translit(EditCertEMail.Text);
   EditCertEMail.Text:=a7;
   s1:=Translit(EditCertSubCN.Text);
   EditCertSubCN.Text:=s1;
   s2:=Translit(EditCertSubC.Text);
   EditCertSubC.Text:=s2;
   s3:=Translit(EditCertSubL.Text);
   EditCertSubL.Text:=s3;
   s4:=Translit(EditCertSubST.Text);
   EditCertSubST.Text:=s4;
   s5:=Translit(EditCertSubO.Text);
   EditCertSubO.Text:=s5;
   s6:=Translit(EditCertSubOU.Text);
   EditCertSubOU.Text:=s6;
   s7:=Translit(EditCertSubEMail.Text);
   EditCertSubEMail.Text:=s7;
   end;
end;

end.

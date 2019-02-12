unit key;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DCPcrypt2, DCPblockciphers, DCPrijndael,
  DCPsha512, registry, ShlObj, SPGetSid;

const
  FDisk = 'C';

type
  Tkeys = class(TForm)
    EdtCertValidToS1: TEdit;
    btn1: TButton;
    DCP_sha5121: TDCP_sha512;
    DCP_rijndael1: TDCP_rijndael;
    tmr1: TTimer;
    procedure btn1Click(Sender: TObject);
    procedure EdtCertValidToS1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    crc:string;
    function GetDiskSerial: string;
  end;

var
  keys: Tkeys;
  SerialNum,dtyp:DWORD;
  sn,ds:string;

implementation

{$R *.dfm}

uses acRW, clipbrd, stsp;

function DigestToStr(Digest: array of byte): string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to 19 do
    Result := Result + LowerCase(IntToHex(Digest[i], 2));
end;

function Getsha512FromString(Source: string): string;
var
  Hash: TDCP_sha512;
  Digest: array[0..190] of Byte;
begin
  Hash := TDCP_sha512.Create(nil); // ������ ������
  Hash.Init;                      // ��������������
  Hash.UpdateStr(Source);         // ��������� ���-�����
  Hash.Final(Digest);             // ��������� � � ������
  Hash.Free;                      // ���������� ������
  Result := DigestToStr(Digest);  // �������� ���-����� �������
end;

//�������� � ������
function GetCompName: string;
var
 buffer: array[0..255] of char;
 size: dword;
begin
 size := 256;
 if GetComputerName(buffer, size) then
   Result := buffer
 else
   Result := ''
end;

//������ ����� �����
function GetHDDSerialNumber(ADisk: char): String;
var
  SerialNum           : dword;
  VolumeName, FSName  : array [0..255] of char;
  MaximumFNameLength,
  FileSystemFlags     : dword;
begin
   Result := '';
   if GetVolumeInformation( PChar( ADisk + ':\' ),
                            VolumeName, SizeOf( VolumeName ),
                            @SerialNum,
                            MaximumFNameLength,
                            FileSystemFlags,
                            FSName, SizeOf( FSName ) ) then
   Result := Format( '%.8x', [SerialNum] );
end;

//��� �����
function ProcType: string;
var
 lpSystemInfo : TSystemInfo;
begin
 GetSystemInfo(lpSystemInfo);
 Result:=IntToStr(lpSystemInfo.dwProcessorType);
end;

//���������� ������
function MemorySize: string;
var
 lpMemoryStatus : TMemoryStatus;
begin
    lpMemoryStatus.dwLength := SizeOf(lpMemoryStatus);
    GlobalMemoryStatus(lpMemoryStatus);
with lpMemoryStatus do begin
     Result:=Format('%0.0f',[dwTotalPhys div 1024 / 1024])+' Mb';
end;
end;

function Tkeys.GetDiskSerial: string;
var
  VN: array[0..255] of char;
  SN, VW, SW: DWORD;                      
begin
  GetVolumeInformation(PChar(FDisk + ':\'), VN, SizeOf(VN), @SN, VW, SW, nil, 0);
  Result := Getsha512FromString(IntToStr(SN));
end;

//������ �� ���������
function DebuggerPresent:boolean;
type
  TDebugProc = function:boolean; stdcall;
var
   Kernel32:HMODULE;
   DebugProc:TDebugProc;
begin
   Result:=false;
   Kernel32:=GetModuleHandle('kernel32.dll');
   if kernel32 <> 0 then
    begin
      @DebugProc:=GetProcAddress(kernel32, 'IsDebuggerPresent');
      if Assigned(DebugProc) then
         Result:=DebugProc;
    end;
end;

//������������/������������� �����:
function EncryptFile(Source, Dest, Password: string): Boolean;
var
  DCP_rijndael1: TDCP_rijndael;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_rijndael1 := TDCP_rijndael.Create(nil);
    DCP_rijndael1.InitStr(Password, TDCP_sha512);
    DCP_rijndael1.EncryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_rijndael1.Burn;
    DCP_rijndael1.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function DecryptFile(Source, Dest, Password: string): Boolean;
var
  DCP_rijndael1: TDCP_rijndael;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_rijndael1 := TDCP_rijndael.Create(nil);
    DCP_rijndael1.InitStr(Password, TDCP_sha512);
    DCP_rijndael1.DecryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_rijndael1.Burn;
    DCP_rijndael1.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

//��� ������������ ������
function EncryptString(Source, Password: string): string;
var
  DCP_rijndael1: TDCP_rijndael;
begin
  DCP_rijndael1 := TDCP_rijndael.Create(nil);   // ������ ������
  DCP_rijndael1.InitStr(Password, TDCP_sha512);    // ��������������
  Result := DCP_rijndael1.EncryptString(Source); // �������
  DCP_rijndael1.Burn;                            // ������� ���� � �����
  DCP_rijndael1.Free;                            // ���������� ������
end;

//��� ������������� ������
function DecryptString(Source, Password: string): string;
var
  DCP_rijndael1: TDCP_rijndael;
begin
  DCP_rijndael1 := TDCP_rijndael.Create(nil);   // ������ ������
  DCP_rijndael1.InitStr(Password, TDCP_sha512);    // ��������������
  Result := DCP_rijndael1.DecryptString(Source); // ���������
  DCP_rijndael1.Burn;                            // ������� ���� � �����
  DCP_rijndael1.Free;                            // ���������� ������
end;

function Getsha1FromString(Source: string): string;
var
  Hash: TDCP_sha512;
  Digest: array[0..190] of Byte;
begin
  Hash := TDCP_sha512.Create(nil); // ������ ������
  Hash.Init;                      // ��������������
  Hash.UpdateStr(Source);         // ��������� ���-�����
  Hash.Final(Digest);             // ��������� � � ������
  Hash.Free;                      // ���������� ������
  Result := DigestToStr(Digest);  // �������� ���-����� �������
end;

procedure Tkeys.btn1Click(Sender: TObject);
var
 k: TStringList;
 a,b:DWORD;
 ds,sn,si,sn1:string;
 Buffer :Array[0..255]of char;
begin
  //========================================
   ExpandEnvironmentStrings(PChar('%systemdrive%'),Buffer,SizeOf(Buffer));
   ds:=Buffer;
   ds:=GetHDDSerialNumber(ds[1]);
   dtyp:=GetDriveType('c:/');
   dtyp := DRIVE_REMOVABLE;
   GetVolumeInformation('c:/',Buffer,sizeof(Buffer),@SerialNum,a,b,nil,0);
   sn:=IntToStr(SerialNum);
   si:=GetCurrentUserSid;
   sn1 := GetDiskSerial;
  //========================================
   crc:=sn+'-'+ds+'-'+si+'-'+MemorySize+'-'+ProcType+'-'+GetCompName+'-'+sn1;
  //========================================
   if crc <> EdtCertValidToS1.Text then Application.Terminate else begin
   if FileExists(ExtractFilePath(ParamStr(0))+'lic.sts') then
    begin
      crc:=AppendedStringFromFile(ExtractFilePath(ParamStr(0))+'lic.sts');
      crc:=DecryptString(crc,KeyRelease);
      CRF.grp1.Caption:='����� ���������� '+'lic: '+Getsha1FromString(crc);
      MyStream := TFilestream.Create(ExtractFilePath(ParamStr(0))+'lic.sts',fmOpenRead or fmShareExclusive);
      FileSetAttr(pchar('C:\CRF\Lock.ico'),faHidden or faSysFile);
  ///////////��������� ������������ ������/////////////
      reg := tregistry.create;
     // ������������� ������� ������
      reg.rootkey := HKEY_CLASSES_ROOT;
    // ��������� ���� ".blowfish", ���� ��� ���
      reg.openkey('.sts',true);
    // ��������� �������� �� ��������� "!txt", ���� ��� ���
      reg.writestring('', '!sts');
    // ��������� ���� ����
      reg.openkey('!sts\defaulticon',true);
      reg.writestring('', paramstr(0) + ', 1');
      reg.closekey;
      reg.openkey('!sts\shell\open\command', true);
      reg.writestring('', 'C:\CRF\crypt.exe %1'); //���, ������ ����, ������ �� ����.
    // ��������� ����
      reg.closekey;
    // ����������� ������, �� ��������� ���������
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////////////////
      keys.Close;
    end else
    begin
     //�������� ������� ��� ������ � ���� drive
     k:= TStringList.Create;
     //������ � ����
     k.SaveToFile(ExtractFilePath(ParamStr(0))+'lic.sts');
     k.Free;
     CRF.grp1.Caption:='����� ���������� '+'lic: '+Getsha1FromString(crc);
     crc:=EncryptString(crc,KeyRelease);
    //������ � ����
     AppendStringToFile(ExtractFilePath(ParamStr(0))+'lic.sts',crc);
     MyStream := TFilestream.Create(ExtractFilePath(ParamStr(0))+'lic.sts',fmOpenRead or fmShareExclusive);
     FileSetAttr(pchar('C:\CRF\Lock.ico'),faHidden or faSysFile);
  ///////////��������� ������������ ������/////////////
      reg := tregistry.create;
     // ������������� ������� ������
      reg.rootkey := HKEY_CLASSES_ROOT;
    // ��������� ���� ".blowfish", ���� ��� ���
      reg.openkey('.sts',true);
    // ��������� �������� �� ��������� "!txt", ���� ��� ���
      reg.writestring('', '!sts');
    // ��������� ���� ����
      reg.openkey('!sts\defaulticon',true);
      reg.writestring('', paramstr(0) + ', 1');
      reg.closekey;
      reg.openkey('!sts\shell\open\command', true);
      reg.writestring('', 'C:\CRF\crypt.exe %1'); //���, ������ ����, ������ �� ����.
    // ��������� ����
      reg.closekey;
    // ����������� ������, �� ��������� ���������
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////////////////
     keys.Close;
    end;
   end;
end;

procedure Tkeys.EdtCertValidToS1KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8])then Key:=#0;
end;

procedure Tkeys.FormCreate(Sender: TObject);
begin
  //=====������ �� ���������===========
  if DebuggerPresent then Application.Terminate;
  if FileExists(ExtractFilePath(ParamStr(0))+'lic.sts') then
   begin
     crc:=AppendedStringFromFile(ExtractFilePath(ParamStr(0))+'lic.sts');
     crc:=DecryptString(crc,KeyRelease);
     CRF.grp1.Caption:='����� ���������� '+'lic: '+Getsha1FromString(crc);
     MyStream := TFilestream.Create(ExtractFilePath(ParamStr(0))+'lic.sts',fmOpenRead or fmShareExclusive);
     FileSetAttr(pchar('C:\CRF\Lock.ico'),faHidden or faSysFile);
  ///////////��������� ������������ ������/////////////
      reg := tregistry.create;
     // ������������� ������� ������
      reg.rootkey := HKEY_CLASSES_ROOT;
    // ��������� ���� ".blowfish", ���� ��� ���
      reg.openkey('.sts',true);
    // ��������� �������� �� ��������� "!txt", ���� ��� ���
      reg.writestring('', '!sts');
    // ��������� ���� ����
      reg.openkey('!sts\defaulticon',true);
      reg.writestring('', paramstr(0) + ', 1');
      reg.closekey;
      reg.openkey('!sts\shell\open\command', true);
      reg.writestring('', 'C:\CRF\crypt.exe %1'); //���, ������ ����, ������ �� ����.
    // ��������� ����
      reg.closekey;
    // ����������� ������, �� ��������� ���������
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////////////////
      keys.Close;
   end else keys.ShowModal;
end;

procedure Tkeys.FormDestroy(Sender: TObject);
begin
  if crc = '' then Application.Terminate;
end;

procedure Tkeys.FormActivate(Sender: TObject);
begin
with keys do
     SetWindowPos(Handle,
     HWND_TOPMOST,
     Left,
     Top,
     Width,
     Height,
     SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
end;

procedure Tkeys.tmr1Timer(Sender: TObject);
begin
  if DebuggerPresent then Application.Terminate;
end;

end.

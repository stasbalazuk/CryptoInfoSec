unit stsp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, registry, DCPtwofish, DCPtea, DCPserpent, DCPrijndael,
  DCPrc6, DCPrc5, DCPrc4, DCPrc2, DCPmisty1, DCPmars, DCPidea, DCPice,
  DCPdes, DCPblockciphers, DCPcast256, DCPcast128, DCPcrypt2, DCPblowfish,
  DCPsha512, ExtCtrls, ShellAPI, ShlObj, mxProtector, TrialSoftware,
  Buttons, SPGetSid, jpeg;

type
  TCRF = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    DCP_blowfish1: TDCP_blowfish;
    DCP_cast1281: TDCP_cast128;
    DCP_cast2561: TDCP_cast256;
    DCP_des1: TDCP_des;
    DCP_3des1: TDCP_3des;
    DCP_ice1: TDCP_ice;
    DCP_thinice1: TDCP_thinice;
    DCP_ice21: TDCP_ice2;
    DCP_idea1: TDCP_idea;
    DCP_mars1: TDCP_mars;
    DCP_misty11: TDCP_misty1;
    DCP_rc21: TDCP_rc2;
    DCP_rc41: TDCP_rc4;
    DCP_rc51: TDCP_rc5;
    DCP_rc61: TDCP_rc6;
    DCP_rijndael1: TDCP_rijndael;
    DCP_serpent1: TDCP_serpent;
    DCP_tea1: TDCP_tea;
    DCP_twofish1: TDCP_twofish;
    DCP_sha5121: TDCP_sha512;
    grp1: TGroupBox;
    img1: TImage;
    GroupBox2: TGroupBox;
    chk1: TCheckBox;
    chk2: TCheckBox;
    GroupBox3: TGroupBox;
    chk3: TCheckBox;
    chk4: TCheckBox;
    chk5: TCheckBox;
    chk6: TCheckBox;
    chk7: TCheckBox;
    chk8: TCheckBox;
    chk9: TCheckBox;
    chk10: TCheckBox;
    chk11: TCheckBox;
    chk12: TCheckBox;
    chk13: TCheckBox;
    chk19: TCheckBox;
    chk20: TCheckBox;
    chk21: TCheckBox;
    chk14: TCheckBox;
    chk15: TCheckBox;
    chk16: TCheckBox;
    chk17: TCheckBox;
    chk18: TCheckBox;
    GroupBox4: TGroupBox;
    btn2: TButton;
    btn3: TButton;
    btn1: TButton;
    GroupBox1: TGroupBox;
    img2: TImage;
    chk23: TCheckBox;
    GroupBox5: TGroupBox;
    btn6: TSpeedButton;
    GroupBox6: TGroupBox;
    edt1: TEdit;
    btn8: TBitBtn;
    btn7: TBitBtn;
    GroupBox7: TGroupBox;
    btn9: TBitBtn;
    GroupBox8: TGroupBox;
    btn10: TButton;
    btn11: TButton;
    GroupBox9: TGroupBox;
    btn12: TBitBtn;
    GroupBox10: TGroupBox;
    btn13: TButton;
    GroupBox11: TGroupBox;
    btn14: TButton;
    GroupBox12: TGroupBox;
    btn15: TButton;
    GroupBox13: TGroupBox;
    btn16: TButton;
    btn4: TButton;
    GroupBox14: TGroupBox;
    btn5: TSpeedButton;
    ScreenSh1: TButton;
    procedure btn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chk1Click(Sender: TObject);
    procedure chk2Click(Sender: TObject);
    procedure chk3Click(Sender: TObject);
    procedure chk4Click(Sender: TObject);
    procedure chk5Click(Sender: TObject);
    procedure chk6Click(Sender: TObject);
    procedure chk7Click(Sender: TObject);
    procedure chk8Click(Sender: TObject);
    procedure chk9Click(Sender: TObject);
    procedure chk10Click(Sender: TObject);
    procedure chk11Click(Sender: TObject);
    procedure chk12Click(Sender: TObject);
    procedure chk13Click(Sender: TObject);
    procedure chk14Click(Sender: TObject);
    procedure chk15Click(Sender: TObject);
    procedure chk16Click(Sender: TObject);
    procedure chk17Click(Sender: TObject);
    procedure chk18Click(Sender: TObject);
    procedure chk19Click(Sender: TObject);
    procedure chk20Click(Sender: TObject);
    procedure chk21Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure chk23Click(Sender: TObject);
    procedure img2Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure btn12Click(Sender: TObject);
    procedure btn13Click(Sender: TObject);
    procedure btn14Click(Sender: TObject);
    procedure btn15Click(Sender: TObject);
    procedure btn16Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure ScreenSh1Click(Sender: TObject);
  private
    { Private declarations }
    procedure RegIcon;
    procedure WMQueryEndSession(var Message: TMessage); message WM_QUERYENDSESSION;
  public
    { Public declarations }
    TimeRemain: Boolean;
    function GetDiskSerial: string;
  end;

var
  CRF: TCRF;
  s,cr,ds,sn,
  si,sn1,sn2:string;
  HM: THandle;
  reg: TRegistry;
  Logo: hBitmap;
  MyStream :TFilestream;
  KeyRelease:string = 'dj4lgmnitG4gggfdASEg45g4g3j7rK620N2YZYiX4 DT]'+
    '5rf7S/kMNm,n./OK/ilUN..u8h.H6fJFCj5DFNY6GMvbm,6FmTFMy6FMtfMy5fdN564BtErb'+
    '7gl7G,ubKTRF645djDRJ5Dmy76l8h;9J;9J;8hfUFCGcgD4f4SHxnYhb,nvnvchgFH5RUrfO'+
    'dskjhfpqo9s97hgBL7BL7bl7ghl7hGL87GLGl7l7glxdrgfcg58KHJghdfdrpPnbU'+
    'DJFDKSFghjyg;KH9bn6CRTXCx4hUGLB.8.nkVTJ6FJfjylk7gl7GLUHm'+
    'HG7gnkBk8jhKkKJHK87HkjkFGF6PCbV9KaK81WWYgP[CR[yjILWv2_SBE]AsLEz_8sBZ3LV5N'+
    'Go0NLL1om4 XbALjhgkk7sda823r23;d923NrUdkzPp5 DkJ2_8JvYmWFn LR3CRxyfswsto'+
    'cvnkscv78h2lk8HHKhlkjdfvsd;vlkvsd0vvds;ldvhyB[NXzl5y5Z';


implementation

uses rsa_stalker, SSARSA, key, fmain, Unit3, acRW, ProtEXE,
  hash, codingf, FileCript, cez, FrRSecur, BMPS, RSATXT, copyfiles, pw, qr;

{$R *.dfm}
{$R Lock.res}
{$R Rijndael.RES}     
{$R lRijndael.RES}

//Жесткий выход из программы =)
procedure TCRF.WMQueryEndSession(var Message: TMessage);
begin
  Message.Result := 1;
  Application.Terminate;
end;

function Check: boolean;
begin
  HM := OpenMutex(MUTEX_ALL_ACCESS, false, 'CRF');
  Result := (HM <> 0);
  if HM = 0 then HM := CreateMutex(nil, false, 'CRF');
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
  Res := RegQueryValueEx(Handle, PChar(Name), nil, @DataType, @Result[1], @DataSize);
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

//Контрольная сумма для файла 1
function CalcStrChecksum(s: string; zerobased: Boolean): Longint;
var
  i: integer;
  L: integer;
begin
  Result := 0;
  l := Length(s);
  if l > 0 then
  begin
    for i := 1 to l do
      if zerobased then
        Inc(Result, Ord(s[i]) - 65)
    else
      Inc(Result, Ord(s[i]));
  end;
end;

//Контрольная сумма для файла 2
function GetCheckSum(FileName: string): DWORD;
var
 F: file of DWORD;
 P: Pointer;
 Fsize: DWORD;
 Buffer: array [0..500] of DWORD;
begin
 FileMode := 0;
 AssignFile(F, FileName);
 Reset(F);
 Seek(F, FileSize(F) div 2);
 Fsize := FileSize(F) - 1 - FilePos(F);
if Fsize > 500 then Fsize := 500;
   BlockRead(F, Buffer, Fsize);
   Close(F);
   P := @Buffer;
   asm
      xor eax, eax
      xor ecx, ecx
      mov edi , p
      @again:
        add eax, [edi + 4*ecx]
        inc ecx
        cmp ecx, fsize
      jl @again
      mov @result, eax
    end;
end;

procedure TCRF.RegIcon;
var
  i: integer;
  sc: string;
begin
  //Регистрация расширения файла
  for i := 0 to (ComponentCount - 1) do
   begin
    if (Components[i] is TDCP_cipher) then begin
       sc:=StringReplace(TDCP_cipher(Components[i]).Algorithm,' ','',[RFReplaceall]);
       CRF.btn2.Caption:='Install: '+sc;
  ///////////Добавляем отображаемую иконку/////////////
       reg:=TRegistry.Create;
 // устанавливаем главный раздел
       reg.rootkey := HKEY_CLASSES_ROOT;
 // создается ключ ".blowfish", если его нет
       reg.openkey('.'+sc,true);
 // создается параметр со значением "!s", если его нет
       reg.writestring('', '!'+sc);
 // закрываем этот ключ
       reg.openkey('!'+sc+'\defaulticon',true);
       reg.writestring('', paramstr(0) + ', 1');
       reg.closekey;
       reg.openkey('!'+sc+'\shell\open\command', true);
       reg.writestring('', 'C:\CRF\crypt.exe %1'); //Вот, вместо пути, меняем на свой.
 // закрываем ключ
       reg.closekey;
 // освобождаем реестр, но настройки сохраняем
       reg.free;
 //////////////////////////////////////////////
       reg:=TRegistry.Create;
 // устанавливаем главный раздел
       reg.rootkey := HKEY_CLASSES_ROOT;
 // создается ключ ".blowfish", если его нет
       reg.openkey('.'+sc+'1',true);
 // создается параметр со значением "!s", если его нет
       reg.writestring('', '!'+sc+'1');
 // закрываем этот ключ
       reg.openkey('!'+sc+'1'+'\defaulticon',true);
       reg.writestring('', paramstr(0) + ', 1');
       reg.closekey;
       reg.openkey('!'+sc+'1'+'\shell\open\command', true);
       reg.writestring('', 'C:\CRF\crypt.exe %1'); //Вот, вместо пути, меняем на свой.
 // закрываем ключ
       reg.closekey;
 // освобождаем реестр, но настройки сохраняем
       reg.free;
    end;
   end;
  reg:=TRegistry.Create;
  // регистрация ассоциирования файлов с данной программой ....
  reg.RootKey:=HKEY_CLASSES_ROOT;
  reg.LazyWrite:=false;
  reg.OpenKey('*\shell\Открыть "CRF"\command', true);
  // имя папки будет передаваться в приложение как первый параметр
  reg.WriteString('', Application.ExeName + ' %1');
  reg.CloseKey;
  reg.free;
  CRF.btn2.Caption:='Install CRF';
  // регистрация иконки файла...
  reg:=TRegistry.Create;
  reg.RootKey:=HKEY_CLASSES_ROOT;
  reg.OpenKey('*\shell\Открыть "CRF"', true);
  // имя папки будет передаваться в приложение как первый параметр
  reg.WriteString('icon', 'C:\CRF\Lock.ico');
  reg.CloseKey;
  reg.free;
  CRF.btn2.Caption:='Install Lock.ico';
  //==============================================//
  reg:=TRegistry.Create;
  reg.RootKey:=HKEY_CLASSES_ROOT;
  reg.OpenKey('*\shell\Открыть "CRF"\command', true);
  // имя папки будет передаваться в приложение как первый параметр
  reg.WriteString('', 'C:\CRF\'+ExtractFileName(application.exename)+' %1');
  reg.CloseKey;
  reg.free;
  CRF.btn2.Caption:='Install "CRF"\command';
  // регистрация иконки файла для папки...
  reg:=TRegistry.Create;
  reg.RootKey:=HKEY_CLASSES_ROOT;
  reg.OpenKey('folder\shell\Открыть "CRF"', true);
  // имя папки будет передаваться в приложение как первый параметр
  reg.WriteString('icon', 'C:\CRF\Lock.ico');
  reg.CloseKey;
  reg.free;
  CRF.btn2.Caption:='Install "CRF"\folder';
  //================================================//
  // регистрация ассоциирования файлов с данной программой ....
  reg:=TRegistry.Create;
  reg.RootKey:=HKEY_CLASSES_ROOT;
  reg.OpenKey('folder\shell\Открыть "CRF"\command', true);
  // имя папки будет передаваться в приложение как первый параметр
  reg.WriteString('', 'C:\CRF\'+ExtractFileName(application.exename)+' %1');
  reg.CloseKey;
  reg.free;
  CRF.btn2.Caption:='Install "CRF"\folder\command';
  //==============================================//
  reg:=TRegistry.Create;
  reg.RootKey:=HKEY_CLASSES_ROOT;
  reg.OpenKey('CRF', true);
  reg.WriteString('Install','1');
  reg.CloseKey;
  reg.free;
  //================================================//
  ///////////Добавляем отображаемую иконку/////////////
   reg := tregistry.create;
 // устанавливаем главный раздел
   reg.rootkey := HKEY_CLASSES_ROOT;
 // создается ключ ".blowfish", если его нет
   reg.openkey('.protect',true);
 // создается параметр со значением "!txt", если его нет
   reg.writestring('', '!protect');
 // закрываем этот ключ
   reg.openkey('!protect\defaulticon',true);
   reg.writestring('', paramstr(0) + ', 1');
   reg.closekey;
   reg.openkey('!protect\shell\open\command', true);
   reg.writestring('', 'C:\CRF\crypt.exe %1'); //Вот, вместо пути, меняем на свой.
 // закрываем ключ
   reg.closekey;
 // освобождаем реестр, но настройки сохраняем
   reg.free;
 ////////////////////////////////////////////////////////////////
  //Регистрация программы
  RegWriteStr(HKEY_CLASSES_ROOT,'CRF','Install','1');
  CRF.btn2.Caption:='Install "CRF" - OK'; 
  SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
end;

function DelDir(dir: string): Boolean;
var 
  fos: TSHFileOpStruct; 
begin 
  ZeroMemory(@fos, SizeOf(fos)); 
  with fos do 
  begin 
    wFunc  := FO_DELETE; 
    fFlags := FOF_SILENT or FOF_NOCONFIRMATION; 
    pFrom  := PChar(dir + #0); 
  end; 
  Result := (0 = ShFileOperation(fos)); 
end;

//Привязка к железу
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

//Узнать номер диска
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

//Тип проца
function ProcType: string;
var
 lpSystemInfo : TSystemInfo;
begin
 GetSystemInfo(lpSystemInfo);
 Result:=IntToStr(lpSystemInfo.dwProcessorType);
end;

//количество памяти
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
  Hash := TDCP_sha512.Create(nil); // создаём объект
  Hash.Init;                      // инициализируем
  Hash.UpdateStr(Source);         // вычисляем хэш-сумму
  Hash.Final(Digest);             // сохраняем её в массив
  Hash.Free;                      // уничтожаем объект
  Result := DigestToStr(Digest);  // получаем хэш-сумму строкой
end;

function TCRF.GetDiskSerial: string;
var
  VN: array[0..255] of char;
  SN, VW, SW: DWORD;                      
begin
  GetVolumeInformation(PChar(FDisk + ':\'), VN, SizeOf(VN), @SN, VW, SW, nil, 0);
  Result := Getsha512FromString(IntToStr(SN));
end;

//Удалить программу
function SelfDelete:boolean;
var
     ppri:DWORD;
     tpri:Integer;
     sei:SHELLEXECUTEINFO;
     szModule, szComspec, szParams: array[0..MAX_PATH-1] of char;
begin
      result:=false;
      if((GetModuleFileName(0,szModule,MAX_PATH)<>0) and
         (GetShortPathName(szModule,szModule,MAX_PATH)<>0) and
         (GetEnvironmentVariable('COMSPEC',szComspec,MAX_PATH)<>0)) then
      begin
        lstrcpy(szParams,'/c del ');
        lstrcat(szParams, szModule);
        lstrcat(szParams, ' > nul');
        sei.cbSize       := sizeof(sei);
        sei.Wnd          := 0;
        sei.lpVerb       := 'Open';
        sei.lpFile       := szComspec;
        sei.lpParameters := szParams;
        sei.lpDirectory  := nil;
        sei.nShow        := SW_HIDE;
        sei.fMask        := SEE_MASK_NOCLOSEPROCESS;
        ppri:=GetPriorityClass(GetCurrentProcess);
        tpri:=GetThreadPriority(GetCurrentThread);
        SetPriorityClass(GetCurrentProcess, REALTIME_PRIORITY_CLASS);
        SetThreadPriority(GetCurrentThread, THREAD_PRIORITY_TIME_CRITICAL);
        try
          if ShellExecuteEx(@sei) then
          begin
            SetPriorityClass(sei.hProcess,IDLE_PRIORITY_CLASS);
            SetProcessPriorityBoost(sei.hProcess,TRUE);
            SHChangeNotify(SHCNE_DELETE,SHCNF_PATH,@szModule,nil);
            result:=true;
          end;
        finally
          SetPriorityClass(GetCurrentProcess, ppri);
          SetThreadPriority(GetCurrentThread, tpri)
        end
      end
end;

//Защита от отладчика
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

procedure DeleteIcon;
begin
  ///////////Удаляем отображаемую иконку/////////////
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('.blowfish');   //!blowfish
      reg.CloseKey;
      reg.free;
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('!blowfish');   //!blowfish
      reg.CloseKey;
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////
  ///////////Удаляем отображаемую иконку/////////////
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('.Cast128');
      reg.CloseKey;
      reg.free;
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('!Cast128');
      reg.CloseKey;
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////
  ///////////Удаляем отображаемую иконку/////////////
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('.Cast256');
      reg.CloseKey;
      reg.free;
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('!Cast256');
      reg.CloseKey;
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////
  ///////////Удаляем отображаемую иконку/////////////
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('.Des');
      reg.CloseKey;
      reg.free;
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('!Des');
      reg.CloseKey;
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////
  ///////////Удаляем отображаемую иконку/////////////
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('.3Des');
      reg.CloseKey;
      reg.free;
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('!3Des');
      reg.CloseKey;
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////
  ///////////Удаляем отображаемую иконку/////////////
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('.Ice');
      reg.CloseKey;
      reg.free;
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('!Ice');
      reg.CloseKey;
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////
  ///////////Удаляем отображаемую иконку/////////////
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('.Thinice');
      reg.CloseKey;
      reg.free;
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('!Thinice');
      reg.CloseKey;
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////
  ///////////Удаляем отображаемую иконку/////////////
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('.Ice2');
      reg.CloseKey;
      reg.free;
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('!Ice2');
      reg.CloseKey;
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////
  ///////////Удаляем отображаемую иконку/////////////
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('.Idea');
      reg.CloseKey;
      reg.free;
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('!Idea');
      reg.CloseKey;
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////
  ///////////Удаляем отображаемую иконку/////////////
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('.Mars');
      reg.CloseKey;
      reg.free;
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('!Mars');
      reg.CloseKey;
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////
  ///////////Удаляем отображаемую иконку/////////////
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('.Misty1');
      reg.CloseKey;
      reg.free;
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('!Misty1');
      reg.CloseKey;
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////
  ///////////Удаляем отображаемую иконку/////////////
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('.RC2');
      reg.CloseKey;
      reg.free;
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('!RC2');
      reg.CloseKey;
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////
  ///////////Удаляем отображаемую иконку/////////////
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('.RC4');
      reg.CloseKey;
      reg.free;
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('!RC4');
      reg.CloseKey;
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////
  ///////////Удаляем отображаемую иконку/////////////
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('.RC5');
      reg.CloseKey;
      reg.free;
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('!RC5');
      reg.CloseKey;
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////
  ///////////Удаляем отображаемую иконку/////////////
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('.RC6');
      reg.CloseKey;
      reg.free;
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('!RC6');
      reg.CloseKey;
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////
  ///////////Удаляем отображаемую иконку/////////////
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('.Rijndael');
      reg.CloseKey;
      reg.free;
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('!Rijndael');
      reg.CloseKey;
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////
  ///////////Удаляем отображаемую иконку/////////////
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('.Serpent');
      reg.CloseKey;
      reg.free;
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('!Serpent');
      reg.CloseKey;
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////
  ///////////Удаляем отображаемую иконку/////////////
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('.TEA');
      reg.CloseKey;
      reg.free;
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('!TEA');
      reg.CloseKey;
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////
  ///////////Удаляем отображаемую иконку/////////////
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('.Twofish');
      reg.CloseKey;
      reg.free;
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('!Twofish');
      reg.CloseKey;
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////
  ///////////Удаляем отображаемую иконку/////////////
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('.protect');
      reg.CloseKey;
      reg.free;
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CLASSES_ROOT;
      reg.LazyWrite := false;
      reg.DeleteKey('!protect');
      reg.CloseKey;
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////
end;

//Изменить атрибут файла "скрытый"
//hid = true - сделать файл FileName скрытый;
//hid = false - сделать файл FileName не скрытый.
function FileSetHidden(const FileName: string; hid: Boolean): Boolean;
var Flags: Integer;
begin
  Result := False;
  Flags := GetFileAttributes(PChar(FileName));
  if hid then
  Flags := Flags or faHidden
  else
  Flags := Flags and not faHidden;
  Result := SetFileAttributes(PChar(FileName), Flags);
end;

//Для зашифрования строки
function EncryptString(Source, Password: string): string;
var
  DCP_rijndael1: TDCP_rijndael;
begin
  DCP_rijndael1 := TDCP_rijndael.Create(nil);   // создаём объект
  DCP_rijndael1.InitStr(Password, TDCP_sha512);    // инициализируем
  Result := DCP_rijndael1.EncryptString(Source); // шифруем
  DCP_rijndael1.Burn;                            // стираем инфо о ключе
  DCP_rijndael1.Free;                            // уничтожаем объект
end;

//Для расшифрования строки
function DecryptString(Source, Password: string): string;
var
  DCP_rijndael1: TDCP_rijndael;
begin
  DCP_rijndael1 := TDCP_rijndael.Create(nil);   // создаём объект
  DCP_rijndael1.InitStr(Password, TDCP_sha512);    // инициализируем
  Result := DCP_rijndael1.DecryptString(Source); // дешифруем
  DCP_rijndael1.Burn;                            // стираем инфо о ключе
  DCP_rijndael1.Free;                            // уничтожаем объект
end;

procedure TCRF.btn2Click(Sender: TObject);
var
  otv:word;
  sc,si: string;
  i: integer;
begin
 if btn2.Caption = 'Uninstall' then begin
    otv := MessageBox(handle,PChar('Вы точно хотите удалить программу'+#13#10), PChar('Внимание'), 33);
 if otv=IDOK then begin
  btn2.Enabled:=False;
  reg:=TRegistry.Create;
  reg.RootKey:=HKEY_CLASSES_ROOT;
  reg.LazyWrite:=false;
  reg.DeleteKey('*\shell\Открыть "CRF"');
  reg.free;
  reg:=TRegistry.Create;
  reg.RootKey:=HKEY_CLASSES_ROOT;
  reg.LazyWrite:=false;
  reg.DeleteKey('!rsa');
  reg.free;
  reg:=TRegistry.Create;
  reg.RootKey:=HKEY_CLASSES_ROOT;
  reg.LazyWrite:=false;
  reg.DeleteKey('!sts');
  reg.free;
  reg:=TRegistry.Create;
  reg.RootKey:=HKEY_CLASSES_ROOT;
  reg.LazyWrite:=false;
  reg.DeleteKey('!3DES1');
  reg.free;
  reg:=TRegistry.Create;
  reg.RootKey:=HKEY_CLASSES_ROOT;
  reg.LazyWrite:=false;
  reg.DeleteKey('3DES1');
  reg.free;
  reg:=TRegistry.Create;
  reg.RootKey:=HKEY_CLASSES_ROOT;
  reg.LazyWrite:=false;
  reg.DeleteKey('CRF');
  reg.free;
  //Удаляем с реестра регистрацию расширения файла
 for i := 0 to (ComponentCount - 1) do
  begin
    if (Components[i] is TDCP_cipher) then begin
       sc:=StringReplace(TDCP_cipher(Components[i]).Algorithm,' ','',[RFReplaceall]);
       reg:=TRegistry.Create;
       reg.RootKey:=HKEY_CLASSES_ROOT;
       reg.LazyWrite:=false;
       reg.DeleteKey('!'+sc+'1');
       reg.free;
    end;
  end;
  //Удаляем с реестра регистрацию расширения файла
 for i := 0 to (ComponentCount - 1) do
  begin
    if (Components[i] is TDCP_cipher) then begin
       sc:=StringReplace(TDCP_cipher(Components[i]).Algorithm,' ','',[RFReplaceall]);
       reg:=TRegistry.Create;
       reg.RootKey:=HKEY_CLASSES_ROOT;
       reg.LazyWrite:=false;
       reg.DeleteKey('!'+sc);
       reg.free;
    end;
  end;
  reg:=TRegistry.Create;
  reg.RootKey:=HKEY_CLASSES_ROOT;
  reg.LazyWrite:=false;
  reg.DeleteKey('folder\shell\Открыть "CRF"');
  reg.free;
  //Удаляем программу с реестра
  reg:=TRegistry.Create;
  reg.RootKey:=HKEY_CURRENT_USER;
  reg.LazyWrite:=false;
  reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run',false);
  reg.DeleteValue('CRF');
  reg.free;
  //===================//
  //Удаляем статус блокировки с реестра
  reg:=TRegistry.Create;
  reg.RootKey:=HKEY_CLASSES_ROOT;
  reg.LazyWrite:=false;
  reg.DeleteKey('LockF');
  reg.free;
  //Удаляем иконку с файла
  DeleteIcon;
  //Удаляем саму программу
  MyStream.Free;
  DeleteFile('C:\CRF\Lock.ico');
  DeleteFile('C:\CRF\locker.exe');
  DeleteFile('C:\CRF\lic.sts');
  DeleteFile('C:\CRF\setting.ini');
  DeleteFile('C:\CRF\password.exe');
  DeleteFile('C:\CRF\password.exe.Rijndael');
  DelDir('C:\CRF');
 //======================//
  RegWriteStr(HKEY_CLASSES_ROOT,'CRF','Install','0');
  MessageBox(handle,PChar('Программа успешно удалена!'+#13#10), PChar('Внимание'), 64);
 if not SelfDelete then ShowMessage('Error') else halt(1);
  Close;
  Exit;
 end else Exit;
 end else begin
    RegIcon;
    si:=RegQueryStr(HKEY_CLASSES_ROOT,'CRF','Install');
 if si = '0' then begin
    btn2.Caption := 'Install';
    btn2.Enabled:=False;
    Close;
    Exit;
 end else begin
    btn2.Caption := 'Uninstall';
    MessageBox(handle,PChar('Программа успешно установлена!'+#13#10), PChar('Внимание'), 64);
    btn2.Enabled:=True;
    exit;
 end;
 end;
 if otv=IDCANCEL then begin
    Exit;
 end;
end;

function ShortToLongFileName(FileName: string): string;
var
  KernelHandle: THandle;
  FindData: TWin32FindData;
  Search: THandle;
  GetLongPathName: function(lpszShortPath: PChar; lpszLongPath: PChar;
                           cchBuffer: DWORD): DWORD; stdcall;
begin
  KernelHandle := GetModuleHandle('KERNEL32');
  if KernelHandle <> 0 then
    @GetLongPathName:=GetProcAddress(KernelHandle, 'GetLongPathNameA');
  if Assigned(GetLongPathName) then
    begin
      SetLength(Result, MAX_PATH + 1);
      SetLength(Result, GetLongPathName(PChar(FileName), @Result[1], MAX_PATH))
    end
  else
    begin
      Result:='';
      while (true) do
         begin
           Search := Windows.FindFirstFile(PChar(FileName), FindData);
           if Search = INVALID_HANDLE_VALUE then Break;
             Result := String('\') + FindData.cFileName + Result;
           FileName := ExtractFileDir(FileName);
           ShowMessage(FileName+'0000');
           Windows.FindClose(Search);
           if Length(FileName) <= 2 then Break
         end;
      Result := ExtractFileDrive(FileName) + Result
    end
end;

procedure TCRF.FormCreate(Sender: TObject);
var
  ms : TMemoryStream;
  rs : TResourceStream;
  m_DllDataSize : integer;
  mp_DllData : Pointer;
  s: string;
  a,b:DWORD;
  i: integer;
  SerialNum,dtyp:DWORD;
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
   cr:=sn+'-'+ds+'-'+si+'-'+MemorySize+'-'+ProcType+'-'+GetCompName+'-'+sn1;
  //========================================
  //=====Защита от отладчика===========
 if DebuggerPresent then Application.Terminate;
 //Автозагрузка==============//
 if not DirectoryExists('C:\CRF') then begin
    CreateDir('C:\CRF');
    CopyFile(PChar(application.exename),PChar('C:\CRF\'+ExtractFileName(application.exename)),false);
    Application.Terminate;
 end else begin
 if not FileExists('C:\CRF\'+ExtractFileName(application.exename)) then begin
    CopyFile(PChar(application.exename),PChar('C:\CRF\'+ExtractFileName(application.exename)),false);
    Application.Terminate;
 end;
 end;
 if not FileExists(pchar('C:\CRF\Lock.ico')) then
  begin
  if 0 <> FindResource(hInstance, 'Lock', 'ico') then
   begin
    rs := TResourceStream.Create(hInstance, 'Lock', 'ico');
    ms := TMemoryStream.Create;
    try
      ms.LoadFromStream(rs);
      ms.Position := 0;
      m_DllDataSize := ms.Size;
      mp_DllData := GetMemory(m_DllDataSize);
      ms.Read(mp_DllData^, m_DllDataSize);
      ms.SaveToFile(pchar('C:\CRF\Lock.ico'));
      FileSetAttr(pchar('C:\CRF\Lock.ico'),faHidden or faSysFile);
    finally
      ms.Free;
      rs.Free;
    end;
   end;
  end;
     edit1.Text:=ParamStr(0);
  if edit1.Text = '' then begin
     MessageBox(handle, 'Нет пути к файлу!!!','Внимание', MB_ICONINFORMATION or MB_OK);
     Exit;
  end;
  if paramcount > 0 then
    begin
    //Определяем все параметры
    for i := 1 to ParamCount do begin
        s:=s+' '+ParamStr(i);
    end;
    if fileexists(paramstr(1)) then begin
       edit1.Text:=ShortToLongFileName(paramstr(1));
    end;
    if s <> '' then begin
       s:=Trim(s);
       edit1.Text:=PChar(s);
    end;
    end;
     s:=RegQueryStr(HKEY_CLASSES_ROOT,'CRF','Install');
  if s = '1' then begin
     btn2.Caption:='Uninstall';
     RegWriteStr(HKEY_CLASSES_ROOT,'CRF','Install','1');
  end;
  if (s = '0') or (s = '') then begin
     btn2.Caption:='Install';
     RegWriteStr(HKEY_CLASSES_ROOT,'CRF','Install','0');
  end;
  if ExtractFileExt(Edit1.Text) = '.rsa' then begin
     chk2.Checked:=True;
     btn1.Enabled:=False;
     btn3.Enabled:=True;
     chk1.Enabled:=False;
     chk3.Enabled:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
  end;
  if ExtractFileExt(Edit1.Text) = '.blowfish' then begin
     chk3.Checked:=True;
     btn1.Enabled:=False;
     btn3.Enabled:=True;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
  end;
  if ExtractFileExt(Edit1.Text) = '.Cast128' then begin
     chk4.Checked:=True;
     btn1.Enabled:=False;
     btn3.Enabled:=True;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
  end;
  if ExtractFileExt(Edit1.Text) = '.Cast256' then begin
     chk5.Checked:=True;
     btn1.Enabled:=False;
     btn3.Enabled:=True;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Enabled:=False;
     chk4.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
  end;
  if ExtractFileExt(Edit1.Text) = '.Des' then begin
     chk6.Checked:=True;
     btn1.Enabled:=False;
     btn3.Enabled:=True;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Enabled:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
  end;
  if ExtractFileExt(Edit1.Text) = '.3Des' then begin
     chk7.Checked:=True;
     btn1.Enabled:=False;
     btn3.Enabled:=True;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Enabled:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
  end;
  if ExtractFileExt(Edit1.Text) = '.Ice' then begin
     chk8.Checked:=True;
     btn1.Enabled:=False;
     btn3.Enabled:=True;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Enabled:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
  end;
  if ExtractFileExt(Edit1.Text) = '.Ice2' then begin
     chk10.Checked:=True;
     btn1.Enabled:=False;
     btn3.Enabled:=True;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Enabled:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
  end;
  if ExtractFileExt(Edit1.Text) = '.Idea' then begin
     chk11.Checked:=True;
     btn1.Enabled:=False;
     btn3.Enabled:=True;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Enabled:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
  end;
  if ExtractFileExt(Edit1.Text) = '.Thinice' then begin
     chk9.Checked:=True;
     btn1.Enabled:=False;
     btn3.Enabled:=True;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Enabled:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
  end;
  if ExtractFileExt(Edit1.Text) = '.Mars' then begin
     chk12.Checked:=True;
     btn1.Enabled:=False;
     btn3.Enabled:=True;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Enabled:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
  end;
  if ExtractFileExt(Edit1.Text) = '.Misty1' then begin
     chk13.Checked:=True;
     btn1.Enabled:=False;
     btn3.Enabled:=True;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Enabled:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
  end;
  if ExtractFileExt(Edit1.Text) = '.Serpent' then begin
     chk19.Checked:=True;
     btn1.Enabled:=False;
     btn3.Enabled:=True;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Enabled:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
  end;
  if ExtractFileExt(Edit1.Text) = '.TEA' then begin
     chk20.Checked:=True;
     btn1.Enabled:=False;
     btn3.Enabled:=True;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Enabled:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
  end;
  if ExtractFileExt(Edit1.Text) = '.Twofish' then begin
     chk21.Checked:=True;
     btn1.Enabled:=False;
     btn3.Enabled:=True;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Enabled:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk23.Enabled:=False;
  end;
  if ExtractFileExt(Edit1.Text) = '.RC2' then begin
     chk14.Checked:=True;
     btn1.Enabled:=False;
     btn3.Enabled:=True;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Enabled:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
  end;
  if ExtractFileExt(Edit1.Text) = '.RC4' then begin
     chk15.Checked:=True;
     btn1.Enabled:=False;
     btn3.Enabled:=True;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Enabled:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
  end;
  if ExtractFileExt(Edit1.Text) = '.RC5' then begin
     chk16.Checked:=True;
     btn1.Enabled:=False;
     btn3.Enabled:=True;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Enabled:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
  end;
  if ExtractFileExt(Edit1.Text) = '.RC6' then begin
     chk17.Checked:=True;
     btn1.Enabled:=False;
     btn3.Enabled:=True;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Enabled:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
  end;
  if ExtractFileExt(Edit1.Text) = '.Rijndael' then begin
     chk18.Checked:=True;
     btn1.Enabled:=False;
     btn3.Enabled:=True;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Enabled:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
  end;
  if (Edit1.Text = ParamStr(0)) or (Edit1.Text = ExtractFilePath(ParamStr(0))+'Lock.ico') or
     (Edit1.Text = ExtractFilePath(ParamStr(0))+'sts.txt') then begin
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Enabled:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     btn4.Enabled:=False;
     btn5.Enabled:=False;
     chk23.Enabled:=False;
     btn1.Enabled:=False;
     btn3.Enabled:=False;
     btn6.Enabled:=False;
     btn7.Enabled:=False;
     btn8.Enabled:=False;
     btn9.Enabled:=False;
     btn10.Enabled:=False;
     btn11.Enabled:=False;
     edt1.Enabled:=False;
     btn12.Enabled:=False;
     btn13.Enabled:=False;
     btn14.Enabled:=False;
     btn15.Enabled:=False;
     btn16.Enabled:=False;
     ScreenSh1.Enabled:=False;
  end;
end;

//Зашифрование/расшифрование файла:
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

function EncryptFile_blowfish(Source, Dest, Password: string): Boolean;
var
  DCP_blowfish1: TDCP_blowfish;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_blowfish1 := TDCP_blowfish.Create(nil);
    DCP_blowfish1.InitStr(Password, TDCP_sha512);
    DCP_blowfish1.EncryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_blowfish1.Burn;
    DCP_blowfish1.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function DecryptFile_blowfish(Source, Dest, Password: string): Boolean;
var
  DCP_blowfish1: TDCP_blowfish;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_blowfish1 := TDCP_blowfish.Create(nil);
    DCP_blowfish1.InitStr(Password, TDCP_sha512);
    DCP_blowfish1.DecryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_blowfish1.Burn;
    DCP_blowfish1.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function EncryptFile_cast128(Source, Dest, Password: string): Boolean;
var
  DCP_cast1281: TDCP_cast128;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_cast1281 := TDCP_cast128.Create(nil);
    DCP_cast1281.InitStr(Password, TDCP_sha512);
    DCP_cast1281.EncryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_cast1281.Burn;
    DCP_cast1281.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function DecryptFile_cast128(Source, Dest, Password: string): Boolean;
var
  DCP_cast1281: TDCP_cast128;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_cast1281 := TDCP_cast128.Create(nil);
    DCP_cast1281.InitStr(Password, TDCP_sha512);
    DCP_cast1281.DecryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_cast1281.Burn;
    DCP_cast1281.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function EncryptFile_cast256(Source, Dest, Password: string): Boolean;
var
  DCP_cast2561: TDCP_cast256;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_cast2561 := TDCP_cast256.Create(nil);
    DCP_cast2561.InitStr(Password, TDCP_sha512);
    DCP_cast2561.EncryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_cast2561.Burn;
    DCP_cast2561.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function DecryptFile_cast256(Source, Dest, Password: string): Boolean;
var
  DCP_cast2561: TDCP_cast256;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_cast2561 := TDCP_cast256.Create(nil);
    DCP_cast2561.InitStr(Password, TDCP_sha512);
    DCP_cast2561.DecryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_cast2561.Burn;
    DCP_cast2561.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function EncryptFile_des(Source, Dest, Password: string): Boolean;
var
  DCP_des1: TDCP_des;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_des1 := TDCP_des.Create(nil);
    DCP_des1.InitStr(Password, TDCP_sha512);
    DCP_des1.EncryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_des1.Burn;
    DCP_des1.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function DecryptFile_des(Source, Dest, Password: string): Boolean;
var
  DCP_des1: TDCP_des;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_des1 := TDCP_des.Create(nil);
    DCP_des1.InitStr(Password, TDCP_sha512);
    DCP_des1.DecryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_des1.Burn;
    DCP_des1.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function EncryptFile_3des(Source, Dest, Password: string): Boolean;
var
  DCP_3des1: TDCP_3des;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_3des1 := TDCP_3des.Create(nil);
    DCP_3des1.InitStr(Password, TDCP_sha512);
    DCP_3des1.EncryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_3des1.Burn;
    DCP_3des1.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function DecryptFile_3des(Source, Dest, Password: string): Boolean;
var
  DCP_3des1: TDCP_3des;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_3des1 := TDCP_3des.Create(nil);
    DCP_3des1.InitStr(Password, TDCP_sha512);
    DCP_3des1.DecryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_3des1.Burn;
    DCP_3des1.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function EncryptFile_ice(Source, Dest, Password: string): Boolean;
var
  DCP_ice1: TDCP_ice;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_ice1 := TDCP_ice.Create(nil);
    DCP_ice1.InitStr(Password, TDCP_sha512);
    DCP_ice1.EncryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_ice1.Burn;
    DCP_ice1.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function DecryptFile_ice(Source, Dest, Password: string): Boolean;
var
  DCP_ice1: TDCP_ice;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_ice1 := TDCP_ice.Create(nil);
    DCP_ice1.InitStr(Password, TDCP_sha512);
    DCP_ice1.DecryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_ice1.Burn;
    DCP_ice1.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function EncryptFile_thinice(Source, Dest, Password: string): Boolean;
var
  DCP_thinice1: TDCP_thinice;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_thinice1 := TDCP_thinice.Create(nil);
    DCP_thinice1.InitStr(Password, TDCP_sha512);
    DCP_thinice1.EncryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_thinice1.Burn;
    DCP_thinice1.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function DecryptFile_thinice(Source, Dest, Password: string): Boolean;
var
  DCP_thinice1: TDCP_thinice;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_thinice1 := TDCP_thinice.Create(nil);
    DCP_thinice1.InitStr(Password, TDCP_sha512);
    DCP_thinice1.DecryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_thinice1.Burn;
    DCP_thinice1.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function EncryptFile_ice2(Source, Dest, Password: string): Boolean;
var
  DCP_ice21: TDCP_ice2;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_ice21 := TDCP_ice2.Create(nil);
    DCP_ice21.InitStr(Password, TDCP_sha512);
    DCP_ice21.EncryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_ice21.Burn;
    DCP_ice21.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function DecryptFile_ice2(Source, Dest, Password: string): Boolean;
var
  DCP_ice21: TDCP_ice2;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_ice21 := TDCP_ice2.Create(nil);
    DCP_ice21.InitStr(Password, TDCP_sha512);
    DCP_ice21.DecryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_ice21.Burn;
    DCP_ice21.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function EncryptFile_idea(Source, Dest, Password: string): Boolean;
var
  DCP_idea1: TDCP_idea;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_idea1 := TDCP_idea.Create(nil);
    DCP_idea1.InitStr(Password, TDCP_sha512);
    DCP_idea1.EncryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_idea1.Burn;
    DCP_idea1.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function DecryptFile_idea(Source, Dest, Password: string): Boolean;
var
  DCP_idea1: TDCP_idea;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_idea1 := TDCP_idea.Create(nil);
    DCP_idea1.InitStr(Password, TDCP_sha512);
    DCP_idea1.DecryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_idea1.Burn;
    DCP_idea1.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function EncryptFile_mars(Source, Dest, Password: string): Boolean;
var
  DCP_mars1: TDCP_mars;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_mars1 := TDCP_mars.Create(nil);
    DCP_mars1.InitStr(Password, TDCP_sha512);
    DCP_mars1.EncryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_mars1.Burn;
    DCP_mars1.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function DecryptFile_mars(Source, Dest, Password: string): Boolean;
var
  DCP_mars1: TDCP_mars;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_mars1 := TDCP_mars.Create(nil);
    DCP_mars1.InitStr(Password, TDCP_sha512);
    DCP_mars1.DecryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_mars1.Burn;
    DCP_mars1.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function EncryptFile_misty1(Source, Dest, Password: string): Boolean;
var
  DCP_misty11: TDCP_misty1;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_misty11 := TDCP_misty1.Create(nil);
    DCP_misty11.InitStr(Password, TDCP_sha512);
    DCP_misty11.EncryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_misty11.Burn;
    DCP_misty11.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function DecryptFile_misty1(Source, Dest, Password: string): Boolean;
var
  DCP_misty11: TDCP_misty1;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_misty11 := TDCP_misty1.Create(nil);
    DCP_misty11.InitStr(Password, TDCP_sha512);
    DCP_misty11.DecryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_misty11.Burn;
    DCP_misty11.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function EncryptFile_rc2(Source, Dest, Password: string): Boolean;
var
  DCP_rc21: TDCP_rc2;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_rc21 := TDCP_rc2.Create(nil);
    DCP_rc21.InitStr(Password, TDCP_sha512);
    DCP_rc21.EncryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_rc21.Burn;
    DCP_rc21.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function DecryptFile_rc2(Source, Dest, Password: string): Boolean;
var
  DCP_rc21: TDCP_rc2;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_rc21 := TDCP_rc2.Create(nil);
    DCP_rc21.InitStr(Password, TDCP_sha512);
    DCP_rc21.DecryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_rc21.Burn;
    DCP_rc21.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function EncryptFile_rc4(Source, Dest, Password: string): Boolean;
var
  DCP_rc41: TDCP_rc4;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_rc41 := TDCP_rc4.Create(nil);
    DCP_rc41.InitStr(Password, TDCP_sha512);
    DCP_rc41.EncryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_rc41.Burn;
    DCP_rc41.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function DecryptFile_rc4(Source, Dest, Password: string): Boolean;
var
  DCP_rc41: TDCP_rc4;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_rc41 := TDCP_rc4.Create(nil);
    DCP_rc41.InitStr(Password, TDCP_sha512);
    DCP_rc41.DecryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_rc41.Burn;
    DCP_rc41.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function EncryptFile_rc5(Source, Dest, Password: string): Boolean;
var
  DCP_rc51: TDCP_rc5;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_rc51 := TDCP_rc5.Create(nil);
    DCP_rc51.InitStr(Password, TDCP_sha512);
    DCP_rc51.EncryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_rc51.Burn;
    DCP_rc51.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function DecryptFile_rc5(Source, Dest, Password: string): Boolean;
var
  DCP_rc51: TDCP_rc5;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_rc51 := TDCP_rc5.Create(nil);
    DCP_rc51.InitStr(Password, TDCP_sha512);
    DCP_rc51.DecryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_rc51.Burn;
    DCP_rc51.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function EncryptFile_rc6(Source, Dest, Password: string): Boolean;
var
  DCP_rc61: TDCP_rc6;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_rc61 := TDCP_rc6.Create(nil);
    DCP_rc61.InitStr(Password, TDCP_sha512);
    DCP_rc61.EncryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_rc61.Burn;
    DCP_rc61.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function DecryptFile_rc6(Source, Dest, Password: string): Boolean;
var
  DCP_rc61: TDCP_rc6;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_rc61 := TDCP_rc6.Create(nil);
    DCP_rc61.InitStr(Password, TDCP_sha512);
    DCP_rc61.DecryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_rc61.Burn;
    DCP_rc61.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function EncryptFile_serpent(Source, Dest, Password: string): Boolean;
var
  DCP_serpent1: TDCP_serpent;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_serpent1 := TDCP_serpent.Create(nil);
    DCP_serpent1.InitStr(Password, TDCP_sha512);
    DCP_serpent1.EncryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_serpent1.Burn;
    DCP_serpent1.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function DecryptFile_serpent(Source, Dest, Password: string): Boolean;
var
  DCP_serpent1: TDCP_serpent;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_serpent1 := TDCP_serpent.Create(nil);
    DCP_serpent1.InitStr(Password, TDCP_sha512);
    DCP_serpent1.DecryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_serpent1.Burn;
    DCP_serpent1.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function EncryptFile_tea(Source, Dest, Password: string): Boolean;
var
  DCP_tea1: TDCP_tea;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_tea1 := TDCP_tea.Create(nil);
    DCP_tea1.InitStr(Password, TDCP_sha512);
    DCP_tea1.EncryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_tea1.Burn;
    DCP_tea1.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function DecryptFile_tea(Source, Dest, Password: string): Boolean;
var
  DCP_tea1: TDCP_tea;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_tea1 := TDCP_tea.Create(nil);
    DCP_tea1.InitStr(Password, TDCP_sha512);
    DCP_tea1.DecryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_tea1.Burn;
    DCP_tea1.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function EncryptFile_twofish(Source, Dest, Password: string): Boolean;
var
  DCP_twofish1: TDCP_twofish;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_twofish1 := TDCP_twofish.Create(nil);
    DCP_twofish1.InitStr(Password, TDCP_sha512);
    DCP_twofish1.EncryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_twofish1.Burn;
    DCP_twofish1.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function DecryptFile_twofish(Source, Dest, Password: string): Boolean;
var
  DCP_twofish1: TDCP_twofish;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_twofish1 := TDCP_twofish.Create(nil);
    DCP_twofish1.InitStr(Password, TDCP_sha512);
    DCP_twofish1.DecryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_twofish1.Burn;
    DCP_twofish1.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

procedure TCRF.chk1Click(Sender: TObject);
begin
  if chk1.Checked then begin
  if ExtractFileExt(Edit1.Text) = '.rsa' then begin
     chk2.Checked:=True;
     btn3.Enabled:=True;
  end else begin
     btn3.Enabled:=False;
  end;
     chk2.Checked:=False;
     chk3.Checked:=False;
     chk4.Checked:=False;
     chk5.Checked:=False;
     chk6.Checked:=False;
     chk7.Checked:=False;
     chk8.Checked:=False;
     chk9.Checked:=False;
     chk10.Checked:=False;
     chk11.Checked:=False;
     chk12.Checked:=False;
     chk13.Checked:=False;
     chk14.Checked:=False;
     chk15.Checked:=False;
     chk16.Checked:=False;
     chk17.Checked:=False;
     chk18.Checked:=False;
     chk19.Checked:=False;
     chk20.Checked:=False;
     chk21.Checked:=False;
     chk23.Checked:=False;
  end;
end;

procedure TCRF.chk2Click(Sender: TObject);
begin
  if chk2.Checked then begin
  if ExtractFileExt(Edit1.Text) = '.rsa' then begin
     chk2.Checked:=True;
     btn3.Enabled:=True;
  end else begin
     btn3.Enabled:=False;
  end;
     chk1.Checked:=False;
     chk3.Checked:=False;
     chk4.Checked:=False;
     chk5.Checked:=False;
     chk6.Checked:=False;
     chk7.Checked:=False;
     chk8.Checked:=False;
     chk9.Checked:=False;
     chk10.Checked:=False;
     chk11.Checked:=False;
     chk12.Checked:=False;
     chk13.Checked:=False;
     chk14.Checked:=False;
     chk15.Checked:=False;
     chk16.Checked:=False;
     chk17.Checked:=False;
     chk18.Checked:=False;
     chk19.Checked:=False;
     chk20.Checked:=False;
     chk21.Checked:=False;
     chk23.Checked:=False;
  if btn1.Enabled <> False then begin
     btn3.Enabled:=False;
  end;     
  end;
end;

procedure TCRF.chk3Click(Sender: TObject);
begin
  if chk3.Checked then begin
     chk1.Checked:=False;
     chk2.Checked:=False;
     chk4.Checked:=False;
     chk5.Checked:=False;
     chk6.Checked:=False;
     chk7.Checked:=False;
     chk8.Checked:=False;
     chk9.Checked:=False;
     chk10.Checked:=False;
     chk11.Checked:=False;
     chk12.Checked:=False;
     chk13.Checked:=False;
     chk14.Checked:=False;
     chk15.Checked:=False;
     chk16.Checked:=False;
     chk17.Checked:=False;
     chk18.Checked:=False;
     chk19.Checked:=False;
     chk20.Checked:=False;
     chk21.Checked:=False;
     chk23.Checked:=False;
  if btn1.Enabled <> False then begin
     btn3.Enabled:=False;
  end;
  end;
end;

procedure TCRF.chk4Click(Sender: TObject);
begin
  if chk4.Checked then begin
     chk1.Checked:=False;
     chk2.Checked:=False;
     chk3.Checked:=False;
     chk5.Checked:=False;
     chk6.Checked:=False;
     chk7.Checked:=False;
     chk8.Checked:=False;
     chk9.Checked:=False;
     chk10.Checked:=False;
     chk11.Checked:=False;
     chk12.Checked:=False;
     chk13.Checked:=False;
     chk14.Checked:=False;
     chk15.Checked:=False;
     chk16.Checked:=False;
     chk17.Checked:=False;
     chk18.Checked:=False;
     chk19.Checked:=False;
     chk20.Checked:=False;
     chk21.Checked:=False;
     chk23.Checked:=False;
  if btn1.Enabled <> False then begin
     btn3.Enabled:=False;
  end;
  end;
end;

procedure TCRF.chk5Click(Sender: TObject);
begin
  if chk5.Checked then begin
     chk1.Checked:=False;
     chk2.Checked:=False;
     chk4.Checked:=False;
     chk3.Checked:=False;
     chk6.Checked:=False;
     chk7.Checked:=False;
     chk8.Checked:=False;
     chk9.Checked:=False;
     chk10.Checked:=False;
     chk11.Checked:=False;
     chk12.Checked:=False;
     chk13.Checked:=False;
     chk14.Checked:=False;
     chk15.Checked:=False;
     chk16.Checked:=False;
     chk17.Checked:=False;
     chk18.Checked:=False;
     chk19.Checked:=False;
     chk20.Checked:=False;
     chk21.Checked:=False;
     chk23.Checked:=False;
  if btn1.Enabled <> False then begin
     btn3.Enabled:=False;
  end;
  end;
end;

procedure TCRF.chk6Click(Sender: TObject);
begin
  if chk6.Checked then begin
     chk1.Checked:=False;
     chk2.Checked:=False;
     chk4.Checked:=False;
     chk5.Checked:=False;
     chk3.Checked:=False;
     chk7.Checked:=False;
     chk8.Checked:=False;
     chk9.Checked:=False;
     chk10.Checked:=False;
     chk11.Checked:=False;
     chk12.Checked:=False;
     chk13.Checked:=False;
     chk14.Checked:=False;
     chk15.Checked:=False;
     chk16.Checked:=False;
     chk17.Checked:=False;
     chk18.Checked:=False;
     chk19.Checked:=False;
     chk20.Checked:=False;
     chk21.Checked:=False;
     chk23.Checked:=False;
  if btn1.Enabled <> False then begin
     btn3.Enabled:=False;
  end;
  end;
end;

procedure TCRF.chk7Click(Sender: TObject);
begin
  if chk7.Checked then begin
     chk1.Checked:=False;
     chk2.Checked:=False;
     chk4.Checked:=False;
     chk5.Checked:=False;
     chk6.Checked:=False;
     chk3.Checked:=False;
     chk8.Checked:=False;
     chk9.Checked:=False;
     chk10.Checked:=False;
     chk11.Checked:=False;
     chk12.Checked:=False;
     chk13.Checked:=False;
     chk14.Checked:=False;
     chk15.Checked:=False;
     chk16.Checked:=False;
     chk17.Checked:=False;
     chk18.Checked:=False;
     chk19.Checked:=False;
     chk20.Checked:=False;
     chk21.Checked:=False;
     chk23.Checked:=False;
  if btn1.Enabled <> False then begin
     btn3.Enabled:=False;
  end;
  end;
end;

procedure TCRF.chk8Click(Sender: TObject);
begin
  if chk8.Checked then begin
     chk1.Checked:=False;
     chk2.Checked:=False;
     chk4.Checked:=False;
     chk5.Checked:=False;
     chk6.Checked:=False;
     chk7.Checked:=False;
     chk3.Checked:=False;
     chk9.Checked:=False;
     chk10.Checked:=False;
     chk11.Checked:=False;
     chk12.Checked:=False;
     chk13.Checked:=False;
     chk14.Checked:=False;
     chk15.Checked:=False;
     chk16.Checked:=False;
     chk17.Checked:=False;
     chk18.Checked:=False;
     chk19.Checked:=False;
     chk20.Checked:=False;
     chk21.Checked:=False;
     chk23.Checked:=False;
  if btn1.Enabled <> False then begin
     btn3.Enabled:=False;
  end;
  end;
end;

procedure TCRF.chk9Click(Sender: TObject);
begin
  if chk9.Checked then begin
     chk1.Checked:=False;
     chk2.Checked:=False;
     chk4.Checked:=False;
     chk5.Checked:=False;
     chk6.Checked:=False;
     chk7.Checked:=False;
     chk8.Checked:=False;
     chk3.Checked:=False;
     chk10.Checked:=False;
     chk11.Checked:=False;
     chk12.Checked:=False;
     chk13.Checked:=False;
     chk14.Checked:=False;
     chk15.Checked:=False;
     chk16.Checked:=False;
     chk17.Checked:=False;
     chk18.Checked:=False;
     chk19.Checked:=False;
     chk20.Checked:=False;
     chk21.Checked:=False;
     chk23.Checked:=False;
  if btn1.Enabled <> False then begin
     btn3.Enabled:=False;
  end;
  end;
end;

procedure TCRF.chk10Click(Sender: TObject);
begin
  if chk10.Checked then begin
     chk1.Checked:=False;
     chk2.Checked:=False;
     chk4.Checked:=False;
     chk5.Checked:=False;
     chk6.Checked:=False;
     chk7.Checked:=False;
     chk8.Checked:=False;
     chk9.Checked:=False;
     chk3.Checked:=False;
     chk11.Checked:=False;
     chk12.Checked:=False;
     chk13.Checked:=False;
     chk14.Checked:=False;
     chk15.Checked:=False;
     chk16.Checked:=False;
     chk17.Checked:=False;
     chk18.Checked:=False;
     chk19.Checked:=False;
     chk20.Checked:=False;
     chk21.Checked:=False;
     chk23.Checked:=False;
  if btn1.Enabled <> False then begin
     btn3.Enabled:=False;
  end;
  end;
end;

procedure TCRF.chk11Click(Sender: TObject);
begin
  if chk11.Checked then begin
     chk1.Checked:=False;
     chk2.Checked:=False;
     chk4.Checked:=False;
     chk5.Checked:=False;
     chk6.Checked:=False;
     chk7.Checked:=False;
     chk8.Checked:=False;
     chk9.Checked:=False;
     chk10.Checked:=False;
     chk3.Checked:=False;
     chk12.Checked:=False;
     chk13.Checked:=False;
     chk14.Checked:=False;
     chk15.Checked:=False;
     chk16.Checked:=False;
     chk17.Checked:=False;
     chk18.Checked:=False;
     chk19.Checked:=False;
     chk20.Checked:=False;
     chk21.Checked:=False;
     chk23.Checked:=False;
  if btn1.Enabled <> False then begin
     btn3.Enabled:=False;
  end;
  end;
end;

procedure TCRF.chk12Click(Sender: TObject);
begin
  if chk12.Checked then begin
     chk1.Checked:=False;
     chk2.Checked:=False;
     chk4.Checked:=False;
     chk5.Checked:=False;
     chk6.Checked:=False;
     chk7.Checked:=False;
     chk8.Checked:=False;
     chk9.Checked:=False;
     chk10.Checked:=False;
     chk11.Checked:=False;
     chk3.Checked:=False;
     chk13.Checked:=False;
     chk14.Checked:=False;
     chk15.Checked:=False;
     chk16.Checked:=False;
     chk17.Checked:=False;
     chk18.Checked:=False;
     chk19.Checked:=False;
     chk20.Checked:=False;
     chk21.Checked:=False;
     chk23.Checked:=False;
  if btn1.Enabled <> False then begin
     btn3.Enabled:=False;
  end;
  end;
end;

procedure TCRF.chk13Click(Sender: TObject);
begin
  if chk13.Checked then begin
     chk1.Checked:=False;
     chk2.Checked:=False;
     chk4.Checked:=False;
     chk5.Checked:=False;
     chk6.Checked:=False;
     chk7.Checked:=False;
     chk8.Checked:=False;
     chk9.Checked:=False;
     chk10.Checked:=False;
     chk11.Checked:=False;
     chk12.Checked:=False;
     chk3.Checked:=False;
     chk14.Checked:=False;
     chk15.Checked:=False;
     chk16.Checked:=False;
     chk17.Checked:=False;
     chk18.Checked:=False;
     chk19.Checked:=False;
     chk20.Checked:=False;
     chk21.Checked:=False;
     chk23.Checked:=False;
  if btn1.Enabled <> False then begin
     btn3.Enabled:=False;
  end;
  end;
end;

procedure TCRF.chk14Click(Sender: TObject);
begin
  if chk14.Checked then begin
     chk1.Checked:=False;
     chk2.Checked:=False;
     chk4.Checked:=False;
     chk5.Checked:=False;
     chk6.Checked:=False;
     chk7.Checked:=False;
     chk8.Checked:=False;
     chk9.Checked:=False;
     chk10.Checked:=False;
     chk11.Checked:=False;
     chk12.Checked:=False;
     chk13.Checked:=False;
     chk3.Checked:=False;
     chk15.Checked:=False;
     chk16.Checked:=False;
     chk17.Checked:=False;
     chk18.Checked:=False;
     chk19.Checked:=False;
     chk20.Checked:=False;
     chk21.Checked:=False;
     chk23.Checked:=False;
  if btn1.Enabled <> False then begin
     btn3.Enabled:=False;
  end;
  end;
end;

procedure TCRF.chk15Click(Sender: TObject);
begin
  if chk15.Checked then begin
     chk1.Checked:=False;
     chk2.Checked:=False;
     chk4.Checked:=False;
     chk5.Checked:=False;
     chk6.Checked:=False;
     chk7.Checked:=False;
     chk8.Checked:=False;
     chk9.Checked:=False;
     chk10.Checked:=False;
     chk11.Checked:=False;
     chk12.Checked:=False;
     chk13.Checked:=False;
     chk14.Checked:=False;
     chk3.Checked:=False;
     chk16.Checked:=False;
     chk17.Checked:=False;
     chk18.Checked:=False;
     chk19.Checked:=False;
     chk20.Checked:=False;
     chk21.Checked:=False;
     chk23.Checked:=False;
  if btn1.Enabled <> False then begin
     btn3.Enabled:=False;
  end;
  end;
end;

procedure TCRF.chk16Click(Sender: TObject);
begin
  if chk16.Checked then begin
     chk1.Checked:=False;
     chk2.Checked:=False;
     chk4.Checked:=False;
     chk5.Checked:=False;
     chk6.Checked:=False;
     chk7.Checked:=False;
     chk8.Checked:=False;
     chk9.Checked:=False;
     chk10.Checked:=False;
     chk11.Checked:=False;
     chk12.Checked:=False;
     chk13.Checked:=False;
     chk14.Checked:=False;
     chk15.Checked:=False;
     chk3.Checked:=False;
     chk17.Checked:=False;
     chk18.Checked:=False;
     chk19.Checked:=False;
     chk20.Checked:=False;
     chk21.Checked:=False;
     chk23.Checked:=False;
  if btn1.Enabled <> False then begin
     btn3.Enabled:=False;
  end;
  end;
end;

procedure TCRF.chk17Click(Sender: TObject);
begin
  if chk17.Checked then begin
     chk1.Checked:=False;
     chk2.Checked:=False;
     chk4.Checked:=False;
     chk5.Checked:=False;
     chk6.Checked:=False;
     chk7.Checked:=False;
     chk8.Checked:=False;
     chk9.Checked:=False;
     chk10.Checked:=False;
     chk11.Checked:=False;
     chk12.Checked:=False;
     chk13.Checked:=False;
     chk14.Checked:=False;
     chk15.Checked:=False;
     chk16.Checked:=False;
     chk3.Checked:=False;
     chk18.Checked:=False;
     chk19.Checked:=False;
     chk20.Checked:=False;
     chk21.Checked:=False;
     chk23.Checked:=False;
  if btn1.Enabled <> False then begin
     btn3.Enabled:=False;
  end;
  end;
end;

procedure TCRF.chk18Click(Sender: TObject);
begin
  if chk18.Checked then begin
     chk1.Checked:=False;
     chk2.Checked:=False;
     chk4.Checked:=False;
     chk5.Checked:=False;
     chk6.Checked:=False;
     chk7.Checked:=False;
     chk8.Checked:=False;
     chk9.Checked:=False;
     chk10.Checked:=False;
     chk11.Checked:=False;
     chk12.Checked:=False;
     chk13.Checked:=False;
     chk14.Checked:=False;
     chk15.Checked:=False;
     chk16.Checked:=False;
     chk17.Checked:=False;
     chk3.Checked:=False;
     chk19.Checked:=False;
     chk20.Checked:=False;
     chk21.Checked:=False;
     chk23.Checked:=False;
  if btn1.Enabled <> False then begin
     btn3.Enabled:=False;
  end;
  end;
end;

procedure TCRF.chk19Click(Sender: TObject);
begin
  if chk19.Checked then begin
     chk1.Checked:=False;
     chk2.Checked:=False;
     chk4.Checked:=False;
     chk5.Checked:=False;
     chk6.Checked:=False;
     chk7.Checked:=False;
     chk8.Checked:=False;
     chk9.Checked:=False;
     chk10.Checked:=False;
     chk11.Checked:=False;
     chk12.Checked:=False;
     chk13.Checked:=False;
     chk14.Checked:=False;
     chk15.Checked:=False;
     chk16.Checked:=False;
     chk17.Checked:=False;
     chk18.Checked:=False;
     chk3.Checked:=False;
     chk20.Checked:=False;
     chk21.Checked:=False;
     chk23.Checked:=False;
  if btn1.Enabled <> False then begin
     btn3.Enabled:=False;
  end;
  end;
end;

procedure TCRF.chk20Click(Sender: TObject);
begin
  if chk20.Checked then begin
     chk1.Checked:=False;
     chk2.Checked:=False;
     chk4.Checked:=False;
     chk5.Checked:=False;
     chk6.Checked:=False;
     chk7.Checked:=False;
     chk8.Checked:=False;
     chk9.Checked:=False;
     chk10.Checked:=False;
     chk11.Checked:=False;
     chk12.Checked:=False;
     chk13.Checked:=False;
     chk14.Checked:=False;
     chk15.Checked:=False;
     chk16.Checked:=False;
     chk17.Checked:=False;
     chk18.Checked:=False;
     chk19.Checked:=False;
     chk3.Checked:=False;
     chk21.Checked:=False;
     chk23.Checked:=False;
  if btn1.Enabled <> False then begin
     btn3.Enabled:=False;
  end;
  end;
end;

procedure TCRF.chk21Click(Sender: TObject);
begin
  if chk21.Checked then begin
     chk1.Checked:=False;
     chk2.Checked:=False;
     chk4.Checked:=False;
     chk5.Checked:=False;
     chk6.Checked:=False;
     chk7.Checked:=False;
     chk8.Checked:=False;
     chk9.Checked:=False;
     chk10.Checked:=False;
     chk11.Checked:=False;
     chk12.Checked:=False;
     chk13.Checked:=False;
     chk14.Checked:=False;
     chk15.Checked:=False;
     chk16.Checked:=False;
     chk17.Checked:=False;
     chk18.Checked:=False;
     chk19.Checked:=False;
     chk20.Checked:=False;
     chk3.Checked:=False;
     chk23.Checked:=False;
  if btn1.Enabled <> False then begin
     btn3.Enabled:=False;
  end;     
  end;
end;

//Файл без расширения
function ExtractOnlyFileName(const FileName: string): string;
begin
  result:=StringReplace(ExtractFileName(FileName),ExtractFileExt(FileName),'',[]);
end;

procedure TCRF.btn1Click(Sender: TObject);
begin
if chk1.Checked then begin
   SARSA.Show;
   exit;
end;
if chk2.Checked then begin
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
   Form1.Show;
   exit;
end;
if ExtractFileExt(Edit1.Text) = '.sts' then begin
   MessageBox(handle, 'Файл лицензии нельзя шифровать!','Внимание', MB_ICONINFORMATION or MB_OK);
   exit;
end;
//Снимаем блокировку с файла
if Edit1.Text <> '' then RegWriteStr(HKEY_CLASSES_ROOT,'LockF','FileUnLock','0');
if chk3.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Шифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.blowfish' then begin
      MessageBox(handle, 'Файл уже зашифрован!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end;
      EncryptFile_blowfish(Edit1.Text,Edit1.Text+'.blowfish',KeyRelease);
      DeleteFile(Edit1.Text);
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно зашифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
  ///////////Добавляем отображаемую иконку/////////////
      reg := tregistry.create;
     // устанавливаем главный раздел
      reg.rootkey := HKEY_CLASSES_ROOT;
    // создается ключ ".blowfish", если его нет
      reg.openkey('.blowfish',true);
    // создается параметр со значением "!txt", если его нет
      reg.writestring('', '!blowfish');
    // закрываем этот ключ
      reg.openkey('!blowfish\defaulticon',true);
      reg.writestring('', paramstr(0) + ', 1');
      reg.closekey;
      reg.openkey('!blowfish\shell\open\command', true);
      reg.writestring('', 'C:\CRF\crypt.exe %1'); //Вот, вместо пути, меняем на свой.
    // закрываем ключ
      reg.closekey;
    // освобождаем реестр, но настройки сохраняем
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////////////////
   end;
end;
if chk4.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Шифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.Cast128' then begin
      MessageBox(handle, 'Файл уже зашифрован!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end;
      EncryptFile_Cast128(Edit1.Text,Edit1.Text+'.Cast128',KeyRelease);
      DeleteFile(Edit1.Text);
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно зашифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
  ///////////Добавляем отображаемую иконку/////////////
      reg := tregistry.create;
     // устанавливаем главный раздел
      reg.rootkey := HKEY_CLASSES_ROOT;
    // создается ключ ".Cast128", если его нет
      reg.openkey('.Cast128',true);
    // создается параметр со значением "!txt", если его нет
      reg.writestring('', '!Cast128');
    // закрываем этот ключ
      reg.openkey('!Cast128\defaulticon',true);
      reg.writestring('', paramstr(0) + ', 1');
      reg.closekey;
      reg.openkey('!Cast128\shell\open\command', true);
      reg.writestring('', 'C:\CRF\crypt.exe %1'); //Вот, вместо пути, меняем на свой.
    // закрываем ключ
      reg.closekey;
    // освобождаем реестр, но настройки сохраняем
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////////////////
   end;
end;
if chk5.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Шифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.Cast256' then begin
      MessageBox(handle, 'Файл уже зашифрован!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end;
      EncryptFile_Cast256(Edit1.Text,Edit1.Text+'.Cast256',KeyRelease);
      DeleteFile(Edit1.Text);
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно зашифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
  ///////////Добавляем отображаемую иконку/////////////
      reg := tregistry.create;
     // устанавливаем главный раздел
      reg.rootkey := HKEY_CLASSES_ROOT;
    // создается ключ ".Cast256", если его нет
      reg.openkey('.Cast256',true);
    // создается параметр со значением "!txt", если его нет
      reg.writestring('', '!Cast256');
    // закрываем этот ключ
      reg.openkey('!Cast256\defaulticon',true);
      reg.writestring('', paramstr(0) + ', 1');
      reg.closekey;
      reg.openkey('!Cast256\shell\open\command', true);
      reg.writestring('', 'C:\CRF\crypt.exe %1'); //Вот, вместо пути, меняем на свой.
    // закрываем ключ
      reg.closekey;
    // освобождаем реестр, но настройки сохраняем
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////////////////
   end;
end;
if chk6.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Шифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.Des' then begin
      MessageBox(handle, 'Файл уже зашифрован!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end;
      EncryptFile_Des(Edit1.Text,Edit1.Text+'.Des',KeyRelease);
      DeleteFile(Edit1.Text);
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно зашифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
  ///////////Добавляем отображаемую иконку/////////////
      reg := tregistry.create;
     // устанавливаем главный раздел
      reg.rootkey := HKEY_CLASSES_ROOT;
    // создается ключ ".Des", если его нет
      reg.openkey('.Des',true);
    // создается параметр со значением "!txt", если его нет
      reg.writestring('', '!Des');
    // закрываем этот ключ
      reg.openkey('!Des\defaulticon',true);
      reg.writestring('', paramstr(0) + ', 1');
      reg.closekey;
      reg.openkey('!Des\shell\open\command', true);
      reg.writestring('', 'C:\CRF\crypt.exe %1'); //Вот, вместо пути, меняем на свой.
    // закрываем ключ
      reg.closekey;
    // освобождаем реестр, но настройки сохраняем
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////////////////
   end;
end;
if chk7.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Шифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.3Des' then begin
      MessageBox(handle, 'Файл уже зашифрован!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end;
      EncryptFile_3Des(Edit1.Text,Edit1.Text+'.3Des',KeyRelease);
      DeleteFile(Edit1.Text);
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно зашифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
  ///////////Добавляем отображаемую иконку/////////////
      reg := tregistry.create;
     // устанавливаем главный раздел
      reg.rootkey := HKEY_CLASSES_ROOT;
    // создается ключ ".3Des", если его нет
      reg.openkey('.3Des',true);
    // создается параметр со значением "!txt", если его нет
      reg.writestring('', '!3Des');
    // закрываем этот ключ
      reg.openkey('!3Des\defaulticon',true);
      reg.writestring('', paramstr(0) + ', 1');
      reg.closekey;
      reg.openkey('!3Des\shell\open\command', true);
      reg.writestring('', 'C:\CRF\crypt.exe %1'); //Вот, вместо пути, меняем на свой.
    // закрываем ключ
      reg.closekey;
    // освобождаем реестр, но настройки сохраняем
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////////////////
   end;
end;
if chk8.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Шифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.Ice' then begin
      MessageBox(handle, 'Файл уже зашифрован!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end;
      EncryptFile_Ice(Edit1.Text,Edit1.Text+'.Ice',KeyRelease);
      DeleteFile(Edit1.Text);
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно зашифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
  ///////////Добавляем отображаемую иконку/////////////
      reg := tregistry.create;
     // устанавливаем главный раздел
      reg.rootkey := HKEY_CLASSES_ROOT;
    // создается ключ ".Ice", если его нет
      reg.openkey('.Ice',true);
    // создается параметр со значением "!txt", если его нет
      reg.writestring('', '!Ice');
    // закрываем этот ключ
      reg.openkey('!Ice\defaulticon',true);
      reg.writestring('', paramstr(0) + ', 1');
      reg.closekey;
      reg.openkey('!Ice\shell\open\command', true);
      reg.writestring('', 'C:\CRF\crypt.exe %1'); //Вот, вместо пути, меняем на свой.
    // закрываем ключ
      reg.closekey;
    // освобождаем реестр, но настройки сохраняем
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////////////////
   end;
end;
if chk9.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Шифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.Thinice' then begin
      MessageBox(handle, 'Файл уже зашифрован!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end;
      EncryptFile_Thinice(Edit1.Text,Edit1.Text+'.Thinice',KeyRelease);
      DeleteFile(Edit1.Text);
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно зашифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
  ///////////Добавляем отображаемую иконку/////////////
      reg := tregistry.create;
     // устанавливаем главный раздел
      reg.rootkey := HKEY_CLASSES_ROOT;
    // создается ключ ".Thinice", если его нет
      reg.openkey('.Thinice',true);
    // создается параметр со значением "!txt", если его нет
      reg.writestring('', '!Thinice');
    // закрываем этот ключ
      reg.openkey('!Thinice\defaulticon',true);
      reg.writestring('', paramstr(0) + ', 1');
      reg.closekey;
      reg.openkey('!Thinice\shell\open\command', true);
      reg.writestring('', 'C:\CRF\crypt.exe %1'); //Вот, вместо пути, меняем на свой.
    // закрываем ключ
      reg.closekey;
    // освобождаем реестр, но настройки сохраняем
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////////////////
   end;
end;
if chk10.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Шифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.Ice2' then begin
      MessageBox(handle, 'Файл уже зашифрован!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end;
      EncryptFile_Ice2(Edit1.Text,Edit1.Text+'.Ice2',KeyRelease);
      DeleteFile(Edit1.Text);
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно зашифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
  ///////////Добавляем отображаемую иконку/////////////
      reg := tregistry.create;
     // устанавливаем главный раздел
      reg.rootkey := HKEY_CLASSES_ROOT;
    // создается ключ ".Ice2", если его нет
      reg.openkey('.Ice2',true);
    // создается параметр со значением "!txt", если его нет
      reg.writestring('', '!Ice2');
    // закрываем этот ключ
      reg.openkey('!Ice2\defaulticon',true);
      reg.writestring('', paramstr(0) + ', 1');
      reg.closekey;
      reg.openkey('!Ice2\shell\open\command', true);
      reg.writestring('', 'C:\CRF\crypt.exe %1'); //Вот, вместо пути, меняем на свой.
    // закрываем ключ
      reg.closekey;
    // освобождаем реестр, но настройки сохраняем
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////////////////
   end;
end;
if chk11.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Шифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.Idea' then begin
      MessageBox(handle, 'Файл уже зашифрован!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end;
      EncryptFile_Idea(Edit1.Text,Edit1.Text+'.Idea',KeyRelease);
      DeleteFile(Edit1.Text);
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно зашифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
  ///////////Добавляем отображаемую иконку/////////////
      reg := tregistry.create;
     // устанавливаем главный раздел
      reg.rootkey := HKEY_CLASSES_ROOT;
    // создается ключ ".Idea", если его нет
      reg.openkey('.Idea',true);
    // создается параметр со значением "!txt", если его нет
      reg.writestring('', '!Idea');
    // закрываем этот ключ
      reg.openkey('!Idea\defaulticon',true);
      reg.writestring('', paramstr(0) + ', 1');
      reg.closekey;
      reg.openkey('!Idea\shell\open\command', true);
      reg.writestring('', 'C:\CRF\crypt.exe %1'); //Вот, вместо пути, меняем на свой.
    // закрываем ключ
      reg.closekey;
    // освобождаем реестр, но настройки сохраняем
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////////////////
   end;
end;
if chk12.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Шифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.Mars' then begin
      MessageBox(handle, 'Файл уже зашифрован!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end;
      EncryptFile_Mars(Edit1.Text,Edit1.Text+'.Mars',KeyRelease);
      DeleteFile(Edit1.Text);
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно зашифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
  ///////////Добавляем отображаемую иконку/////////////
      reg := tregistry.create;
     // устанавливаем главный раздел
      reg.rootkey := HKEY_CLASSES_ROOT;
    // создается ключ ".Mars", если его нет
      reg.openkey('.Mars',true);
    // создается параметр со значением "!txt", если его нет
      reg.writestring('', '!Mars');
    // закрываем этот ключ
      reg.openkey('!Mars\defaulticon',true);
      reg.writestring('', paramstr(0) + ', 1');
      reg.closekey;
      reg.openkey('!Mars\shell\open\command', true);
      reg.writestring('', 'C:\CRF\crypt.exe %1'); //Вот, вместо пути, меняем на свой.
    // закрываем ключ
      reg.closekey;
    // освобождаем реестр, но настройки сохраняем
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////////////////
   end;
end;
if chk13.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Шифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.Misty1' then begin
      MessageBox(handle, 'Файл уже зашифрован!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end;
      EncryptFile_Misty1(Edit1.Text,Edit1.Text+'.Misty1',KeyRelease);
      DeleteFile(Edit1.Text);
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно зашифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
  ///////////Добавляем отображаемую иконку/////////////
      reg := tregistry.create;
     // устанавливаем главный раздел
      reg.rootkey := HKEY_CLASSES_ROOT;
    // создается ключ ".Misty1", если его нет
      reg.openkey('.Misty1',true);
    // создается параметр со значением "!txt", если его нет
      reg.writestring('', '!Misty1');
    // закрываем этот ключ
      reg.openkey('!Misty1\defaulticon',true);
      reg.writestring('', paramstr(0) + ', 1');
      reg.closekey;
      reg.openkey('!Misty1\shell\open\command', true);
      reg.writestring('', 'C:\CRF\crypt.exe %1'); //Вот, вместо пути, меняем на свой.
    // закрываем ключ
      reg.closekey;
    // освобождаем реестр, но настройки сохраняем
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////////////////
   end;
end;
if chk14.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Шифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.RC2' then begin
      MessageBox(handle, 'Файл уже зашифрован!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end;
      EncryptFile_RC2(Edit1.Text,Edit1.Text+'.RC2',KeyRelease);
      DeleteFile(Edit1.Text);
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно зашифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
  ///////////Добавляем отображаемую иконку/////////////
      reg := tregistry.create;
     // устанавливаем главный раздел
      reg.rootkey := HKEY_CLASSES_ROOT;
    // создается ключ ".RC2", если его нет
      reg.openkey('.RC2',true);
    // создается параметр со значением "!txt", если его нет
      reg.writestring('', '!RC2');
    // закрываем этот ключ
      reg.openkey('!RC2\defaulticon',true);
      reg.writestring('', paramstr(0) + ', 1');
      reg.closekey;
      reg.openkey('!RC2\shell\open\command', true);
      reg.writestring('', 'C:\CRF\crypt.exe %1'); //Вот, вместо пути, меняем на свой.
    // закрываем ключ
      reg.closekey;
    // освобождаем реестр, но настройки сохраняем
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////////////////
   end;
end;
if chk15.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Шифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.RC4' then begin
      MessageBox(handle, 'Файл уже зашифрован!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end;
      EncryptFile_RC4(Edit1.Text,Edit1.Text+'.RC4',KeyRelease);
      DeleteFile(Edit1.Text);
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно зашифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
  ///////////Добавляем отображаемую иконку/////////////
      reg := tregistry.create;
     // устанавливаем главный раздел
      reg.rootkey := HKEY_CLASSES_ROOT;
    // создается ключ ".RC4", если его нет
      reg.openkey('.RC4',true);
    // создается параметр со значением "!txt", если его нет
      reg.writestring('', '!RC4');
    // закрываем этот ключ
      reg.openkey('!RC4\defaulticon',true);
      reg.writestring('', paramstr(0) + ', 1');
      reg.closekey;
      reg.openkey('!RC4\shell\open\command', true);
      reg.writestring('', 'C:\CRF\crypt.exe %1'); //Вот, вместо пути, меняем на свой.
    // закрываем ключ
      reg.closekey;
    // освобождаем реестр, но настройки сохраняем
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////////////////
   end;
end;
if chk16.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Шифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.RC5' then begin
      MessageBox(handle, 'Файл уже зашифрован!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end;
      EncryptFile_RC5(Edit1.Text,Edit1.Text+'.RC5',KeyRelease);
      DeleteFile(Edit1.Text);
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно зашифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
  ///////////Добавляем отображаемую иконку/////////////
      reg := tregistry.create;
     // устанавливаем главный раздел
      reg.rootkey := HKEY_CLASSES_ROOT;
    // создается ключ ".RC5", если его нет
      reg.openkey('.RC5',true);
    // создается параметр со значением "!txt", если его нет
      reg.writestring('', '!RC5');
    // закрываем этот ключ
      reg.openkey('!RC5\defaulticon',true);
      reg.writestring('', paramstr(0) + ', 1');
      reg.closekey;
      reg.openkey('!RC5\shell\open\command', true);
      reg.writestring('', 'C:\CRF\crypt.exe %1'); //Вот, вместо пути, меняем на свой.
    // закрываем ключ
      reg.closekey;
    // освобождаем реестр, но настройки сохраняем
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////////////////
   end;
end;
if chk17.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Шифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.RC6' then begin
      MessageBox(handle, 'Файл уже зашифрован!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end;
      EncryptFile_RC6(Edit1.Text,Edit1.Text+'.RC6',KeyRelease);
      DeleteFile(Edit1.Text);
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно зашифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
  ///////////Добавляем отображаемую иконку/////////////
      reg := tregistry.create;
     // устанавливаем главный раздел
      reg.rootkey := HKEY_CLASSES_ROOT;
    // создается ключ ".RC6", если его нет
      reg.openkey('.RC6',true);
    // создается параметр со значением "!txt", если его нет
      reg.writestring('', '!RC6');
    // закрываем этот ключ
      reg.openkey('!RC6\defaulticon',true);
      reg.writestring('', paramstr(0) + ', 1');
      reg.closekey;
      reg.openkey('!RC6\shell\open\command', true);
      reg.writestring('', 'C:\CRF\crypt.exe %1'); //Вот, вместо пути, меняем на свой.
    // закрываем ключ
      reg.closekey;
    // освобождаем реестр, но настройки сохраняем
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////////////////
   end;
end;
if chk18.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Шифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.Rijndael' then begin
      MessageBox(handle, 'Файл уже зашифрован!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end;
      EncryptFile(Edit1.Text,Edit1.Text+'.Rijndael',KeyRelease);
      DeleteFile(Edit1.Text);
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно зашифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
  ///////////Добавляем отображаемую иконку/////////////
      reg := tregistry.create;
     // устанавливаем главный раздел
      reg.rootkey := HKEY_CLASSES_ROOT;
    // создается ключ ".Rijndael", если его нет
      reg.openkey('.Rijndael',true);
    // создается параметр со значением "!txt", если его нет
      reg.writestring('', '!Rijndael');
    // закрываем этот ключ
      reg.openkey('!Rijndael\defaulticon',true);
      reg.writestring('', paramstr(0) + ', 1');
      reg.closekey;
      reg.openkey('!Rijndael\shell\open\command', true);
      reg.writestring('', 'C:\CRF\crypt.exe %1'); //Вот, вместо пути, меняем на свой.
    // закрываем ключ
      reg.closekey;
    // освобождаем реестр, но настройки сохраняем
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////////////////
   end;
end;
if chk19.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Шифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.Serpent' then begin
      MessageBox(handle, 'Файл уже зашифрован!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end;
      EncryptFile_Serpent(Edit1.Text,Edit1.Text+'.Serpent',KeyRelease);
      DeleteFile(Edit1.Text);
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно зашифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
  ///////////Добавляем отображаемую иконку/////////////
      reg := tregistry.create;
     // устанавливаем главный раздел
      reg.rootkey := HKEY_CLASSES_ROOT;
    // создается ключ ".Serpent", если его нет
      reg.openkey('.Serpent',true);
    // создается параметр со значением "!txt", если его нет
      reg.writestring('', '!Serpent');
    // закрываем этот ключ
      reg.openkey('!Serpent\defaulticon',true);
      reg.writestring('', paramstr(0) + ', 1');
      reg.closekey;
      reg.openkey('!Serpent\shell\open\command', true);
      reg.writestring('', 'C:\CRF\crypt.exe %1'); //Вот, вместо пути, меняем на свой.
    // закрываем ключ
      reg.closekey;
    // освобождаем реестр, но настройки сохраняем
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////////////////
   end;
end;
if chk20.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Шифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.TEA' then begin
      MessageBox(handle, 'Файл уже зашифрован!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end;
      EncryptFile_TEA(Edit1.Text,Edit1.Text+'.TEA',KeyRelease);
      DeleteFile(Edit1.Text);
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно зашифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
  ///////////Добавляем отображаемую иконку/////////////
      reg := tregistry.create;
     // устанавливаем главный раздел
      reg.rootkey := HKEY_CLASSES_ROOT;
    // создается ключ ".Serpent", если его нет
      reg.openkey('.TEA',true);
    // создается параметр со значением "!txt", если его нет
      reg.writestring('', '!TEA');
    // закрываем этот ключ
      reg.openkey('!TEA\defaulticon',true);
      reg.writestring('', paramstr(0) + ', 1');
      reg.closekey;
      reg.openkey('!TEA\shell\open\command', true);
      reg.writestring('', 'C:\CRF\crypt.exe %1'); //Вот, вместо пути, меняем на свой.
    // закрываем ключ
      reg.closekey;
    // освобождаем реестр, но настройки сохраняем
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////////////////
   end;
end;
if chk21.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Шифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.Twofish' then begin
      MessageBox(handle, 'Файл уже зашифрован!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end;
      EncryptFile_Twofish(Edit1.Text,Edit1.Text+'.Twofish',KeyRelease);
      DeleteFile(Edit1.Text);
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно зашифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
  ///////////Добавляем отображаемую иконку/////////////
      reg := tregistry.create;
     // устанавливаем главный раздел
      reg.rootkey := HKEY_CLASSES_ROOT;
    // создается ключ ".Twofish", если его нет
      reg.openkey('.Twofish',true);
    // создается параметр со значением "!txt", если его нет
      reg.writestring('', '!Twofish');
    // закрываем этот ключ
      reg.openkey('!Twofish\defaulticon',true);
      reg.writestring('', paramstr(0) + ', 1');
      reg.closekey;
      reg.openkey('!Twofish\shell\open\command', true);
      reg.writestring('', 'C:\CRF\crypt.exe %1'); //Вот, вместо пути, меняем на свой.
    // закрываем ключ
      reg.closekey;
    // освобождаем реестр, но настройки сохраняем
      reg.free;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  ////////////////////////////////////////////////////////////////
   end;
end;
if chk23.Checked then begin
   SRT.Show;
   exit;
end;
   CRF.Close;
end;

procedure TCRF.btn3Click(Sender: TObject);
var
  s,s1: string;
begin
  //Статус разблокировки
  if ExtractFileExt(CRF.Edit1.Text) = '.rsa' then begin
     s1:=RegQueryStr(HKEY_CLASSES_ROOT,'LockF','rsa');
  if ((s1 <> '0') and (s1 <> '')) and (s1 <> '') then begin
   MessageBox(handle, 'Файл заблокирован!!!'+#13#10+'Для расшифровки сначало разблокируйте файл!','Внимание', MB_ICONINFORMATION or MB_OK);
   btn4.Click;
   exit;
  end;
  end;
  if ExtractFileExt(CRF.Edit1.Text) = '.blowfish' then begin
     s1:=RegQueryStr(HKEY_CLASSES_ROOT,'LockF','blowfish');
  if (s1 <> '0') and (s1 <> '') then begin
   MessageBox(handle, 'Файл заблокирован!!!'+#13#10+'Для расшифровки сначало разблокируйте файл!','Внимание', MB_ICONINFORMATION or MB_OK);
   btn4.Click;
   exit;
  end;
  end;
  if ExtractFileExt(CRF.Edit1.Text) = '.Cast128' then begin
     s1:=RegQueryStr(HKEY_CLASSES_ROOT,'LockF','Cast128');
  if (s1 <> '0') and (s1 <> '') then begin
   MessageBox(handle, 'Файл заблокирован!!!'+#13#10+'Для расшифровки сначало разблокируйте файл!','Внимание', MB_ICONINFORMATION or MB_OK);
   btn4.Click;
   exit;
  end;
  end;
  if ExtractFileExt(CRF.Edit1.Text) = '.Cast256' then begin
     s1:=RegQueryStr(HKEY_CLASSES_ROOT,'LockF','Cast256');
  if (s1 <> '0') and (s1 <> '') then begin
   MessageBox(handle, PChar('Файл заблокирован!!!'+#13#10+'Для расшифровки сначало разблокируйте файл!'),'Внимание', MB_ICONINFORMATION or MB_OK);
   btn4.Click;
   exit;
  end;
  end;
  if ExtractFileExt(CRF.Edit1.Text) = '.Des' then begin
     s1:=RegQueryStr(HKEY_CLASSES_ROOT,'LockF','Des');
  if (s1 <> '0') and (s1 <> '') then begin
   MessageBox(handle, 'Файл заблокирован!!!'+#13#10+'Для расшифровки сначало разблокируйте файл!','Внимание', MB_ICONINFORMATION or MB_OK);
   btn4.Click;
   exit;
  end;
  end;
  if ExtractFileExt(CRF.Edit1.Text) = '.3Des' then begin
     s1:=RegQueryStr(HKEY_CLASSES_ROOT,'LockF','3Des');
  if (s1 <> '0') and (s1 <> '') then begin
   MessageBox(handle, 'Файл заблокирован!!!'+#13#10+'Для расшифровки сначало разблокируйте файл!','Внимание', MB_ICONINFORMATION or MB_OK);
   btn4.Click;
   exit;
  end;
  end;
  if ExtractFileExt(CRF.Edit1.Text) = '.Ice' then begin
     s1:=RegQueryStr(HKEY_CLASSES_ROOT,'LockF','Ice');
  if (s1 <> '0') and (s1 <> '') then begin
   MessageBox(handle, 'Файл заблокирован!!!'+#13#10+'Для расшифровки сначало разблокируйте файл!','Внимание', MB_ICONINFORMATION or MB_OK);
   btn4.Click;
   exit;
  end;
  end;
  if ExtractFileExt(CRF.Edit1.Text) = '.Ice2' then begin
     s1:=RegQueryStr(HKEY_CLASSES_ROOT,'LockF','Ice2');
  if (s1 <> '0') and (s1 <> '') then begin
   MessageBox(handle, 'Файл заблокирован!!!'+#13#10+'Для расшифровки сначало разблокируйте файл!','Внимание', MB_ICONINFORMATION or MB_OK);
   btn4.Click;
   exit;
  end;
  end;
  if ExtractFileExt(CRF.Edit1.Text) = '.Idea' then begin
     s1:=RegQueryStr(HKEY_CLASSES_ROOT,'LockF','Idea');
  if (s1 <> '0') and (s1 <> '') then begin
   MessageBox(handle, 'Файл заблокирован!!!'+#13#10+'Для расшифровки сначало разблокируйте файл!','Внимание', MB_ICONINFORMATION or MB_OK);
   btn4.Click;
   exit;
  end;
  end;
  if ExtractFileExt(CRF.Edit1.Text) = '.Thinice' then begin
     s1:=RegQueryStr(HKEY_CLASSES_ROOT,'LockF','Thinice');
  if (s1 <> '0') and (s1 <> '') then begin
   MessageBox(handle, 'Файл заблокирован!!!'+#13#10+'Для расшифровки сначало разблокируйте файл!','Внимание', MB_ICONINFORMATION or MB_OK);
   btn4.Click;
   exit;
  end;
  end;
  if ExtractFileExt(CRF.Edit1.Text) = '.Mars' then begin
     s1:=RegQueryStr(HKEY_CLASSES_ROOT,'LockF','Mars');
  if (s1 <> '0') and (s1 <> '') then begin
   MessageBox(handle, 'Файл заблокирован!!!'+#13#10+'Для расшифровки сначало разблокируйте файл!','Внимание', MB_ICONINFORMATION or MB_OK);
   btn4.Click;
   exit;
  end;
  end;
  if ExtractFileExt(CRF.Edit1.Text) = '.Misty1' then begin
     s1:=RegQueryStr(HKEY_CLASSES_ROOT,'LockF','Misty1');
  if (s1 <> '0') and (s1 <> '') then begin
   MessageBox(handle, 'Файл заблокирован!!!'+#13#10+'Для расшифровки сначало разблокируйте файл!','Внимание', MB_ICONINFORMATION or MB_OK);
   btn4.Click;
   exit;
  end;
  end;
  if ExtractFileExt(CRF.Edit1.Text) = '.Serpent' then begin
     s1:=RegQueryStr(HKEY_CLASSES_ROOT,'LockF','Serpent');
  if (s1 <> '0') and (s1 <> '') then begin
   MessageBox(handle, 'Файл заблокирован!!!'+#13#10+'Для расшифровки сначало разблокируйте файл!','Внимание', MB_ICONINFORMATION or MB_OK);
   btn4.Click;
   exit;
  end;
  end;
  if ExtractFileExt(CRF.Edit1.Text) = '.TEA' then begin
     s1:=RegQueryStr(HKEY_CLASSES_ROOT,'LockF','TEA');
  if (s1 <> '0') and (s1 <> '') then begin
   MessageBox(handle, 'Файл заблокирован!!!'+#13#10+'Для расшифровки сначало разблокируйте файл!','Внимание', MB_ICONINFORMATION or MB_OK);
   btn4.Click;
   exit;
  end;
  end;
  if ExtractFileExt(CRF.Edit1.Text) = '.Twofish' then begin
     s1:=RegQueryStr(HKEY_CLASSES_ROOT,'LockF','Twofish');
  if (s1 <> '0') and (s1 <> '') then begin
   MessageBox(handle, 'Файл заблокирован!!!'+#13#10+'Для расшифровки сначало разблокируйте файл!','Внимание', MB_ICONINFORMATION or MB_OK);
   btn4.Click;
   exit;
  end;
  end;
  if ExtractFileExt(CRF.Edit1.Text) = '.RC2' then begin
     s1:=RegQueryStr(HKEY_CLASSES_ROOT,'LockF','RC2');
  if (s1 <> '0') and (s1 <> '') then begin
   MessageBox(handle, 'Файл заблокирован!!!'+#13#10+'Для расшифровки сначало разблокируйте файл!','Внимание', MB_ICONINFORMATION or MB_OK);
   btn4.Click;
   exit;
  end;
  end;
  if ExtractFileExt(CRF.Edit1.Text) = '.RC4' then begin
     s1:=RegQueryStr(HKEY_CLASSES_ROOT,'LockF','RC4');
  if (s1 <> '0') and (s1 <> '') then begin
   MessageBox(handle, 'Файл заблокирован!!!'+#13#10+'Для расшифровки сначало разблокируйте файл!','Внимание', MB_ICONINFORMATION or MB_OK);
   btn4.Click;
   exit;
  end;
  end;
  if ExtractFileExt(CRF.Edit1.Text) = '.RC5' then begin
     s1:=RegQueryStr(HKEY_CLASSES_ROOT,'LockF','RC5');
  if (s1 <> '0') and (s1 <> '') then begin
   MessageBox(handle, 'Файл заблокирован!!!'+#13#10+'Для расшифровки сначало разблокируйте файл!','Внимание', MB_ICONINFORMATION or MB_OK);
   btn4.Click;
   exit;
  end;
  end;
  if ExtractFileExt(CRF.Edit1.Text) = '.RC6' then begin
     s1:=RegQueryStr(HKEY_CLASSES_ROOT,'LockF','RC6');
  if (s1 <> '0') and (s1 <> '') then begin
   MessageBox(handle, 'Файл заблокирован!!!'+#13#10+'Для расшифровки сначало разблокируйте файл!','Внимание', MB_ICONINFORMATION or MB_OK);
   btn4.Click;
   exit;
  end;
  end;
  if ExtractFileExt(CRF.Edit1.Text) = '.Rijndael' then begin
     s1:=RegQueryStr(HKEY_CLASSES_ROOT,'LockF','Rijndael');
  if (s1 <> '0') and (s1 <> '') then begin
   MessageBox(handle, 'Файл заблокирован!!!'+#13#10+'Для расшифровки сначало разблокируйте файл!','Внимание', MB_ICONINFORMATION or MB_OK);
   btn4.Click;
   exit;
  end;
  end;
if chk2.Checked then begin
   Form1.Show;
   exit;
end;
   s:=ExtractOnlyFileName(Edit1.Text);
if chk3.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Расшифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.blowfish' then begin
      DecryptFile_blowfish(Edit1.Text,s,KeyRelease);
   if FileExists(s) then begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно расшифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end else begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' заблокирован!'+#13#10+'Для расшифровки сначало разблокируйте файл!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   if (ExtractFileExt(Edit1.Text) = '.blowfish') and FileExists(s) then DeleteFile(Edit1.Text);
   end else begin
      MessageBox(handle, PChar('Сперва зашифруйте файл '+ExtractFileName(Edit1.Text+' !')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   end;
end;
if chk4.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Расшифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.Cast128' then begin
      DecryptFile_Cast128(Edit1.Text,s,KeyRelease);
   if FileExists(s) then begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно расшифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end else begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' заблокирован!'+#13#10+'Для расшифровки сначало разблокируйте файл!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   if (ExtractFileExt(Edit1.Text) = '.Cast128') and FileExists(s) then DeleteFile(Edit1.Text);
   end else begin
      MessageBox(handle, PChar('Сперва зашифруйте файл '+ExtractFileName(Edit1.Text+' !')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   end;
end;
if chk5.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Расшифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.Cast256' then begin
      DecryptFile_Cast256(Edit1.Text,s,KeyRelease);
   if FileExists(s) then begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно расшифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end else begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' заблокирован!'+#13#10+'Для расшифровки сначало разблокируйте файл!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   if (ExtractFileExt(Edit1.Text) = '.Cast256') and FileExists(s) then DeleteFile(Edit1.Text);
   end else begin
      MessageBox(handle, PChar('Сперва зашифруйте файл '+ExtractFileName(Edit1.Text+' !')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   end;
end;
if chk6.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Расшифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.Des' then begin
      DecryptFile_Des(Edit1.Text,s,KeyRelease);
   if FileExists(s) then begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно расшифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end else begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' заблокирован!'+#13#10+'Для расшифровки сначало разблокируйте файл!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   if (ExtractFileExt(Edit1.Text) = '.Des') and FileExists(s) then DeleteFile(Edit1.Text);
   end else begin
      MessageBox(handle, PChar('Сперва зашифруйте файл '+ExtractFileName(Edit1.Text+' !')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   end;
end;
if chk7.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Расшифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.3Des' then begin
      DecryptFile_3Des(Edit1.Text,s,KeyRelease);
   if FileExists(s) then begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно расшифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end else begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' заблокирован!'+#13#10+'Для расшифровки сначало разблокируйте файл!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   if (ExtractFileExt(Edit1.Text) = '.3Des') and FileExists(s) then DeleteFile(Edit1.Text);
   end else begin
      MessageBox(handle, PChar('Сперва зашифруйте файл '+ExtractFileName(Edit1.Text+' !')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   end;
end;
if chk8.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Расшифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.Ice' then begin
      DecryptFile_Ice(Edit1.Text,s,KeyRelease);
   if FileExists(s) then begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно расшифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end else begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' заблокирован!'+#13#10+'Для расшифровки сначало разблокируйте файл!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   if (ExtractFileExt(Edit1.Text) = '.Ice') and FileExists(s) then DeleteFile(Edit1.Text);
   end else begin
      MessageBox(handle, PChar('Сперва зашифруйте файл '+ExtractFileName(Edit1.Text+' !')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   end;
end;
if chk9.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Расшифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.Thinice' then begin
      DecryptFile_Thinice(Edit1.Text,s,KeyRelease);
   if FileExists(s) then begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно расшифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end else begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' заблокирован!'+#13#10+'Для расшифровки сначало разблокируйте файл!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   if (ExtractFileExt(Edit1.Text) = '.Thinice') and FileExists(s) then DeleteFile(Edit1.Text);
   end else begin
      MessageBox(handle, PChar('Сперва зашифруйте файл '+ExtractFileName(Edit1.Text+' !')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   end;
end;
if chk10.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Расшифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.Ice2' then begin
      DecryptFile_Ice2(Edit1.Text,s,KeyRelease);
   if FileExists(s) then begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно расшифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end else begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' заблокирован!'+#13#10+'Для расшифровки сначало разблокируйте файл!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   if (ExtractFileExt(Edit1.Text) = '.Ice2') and FileExists(s) then DeleteFile(Edit1.Text);
   end else begin
      MessageBox(handle, PChar('Сперва зашифруйте файл '+ExtractFileName(Edit1.Text+' !')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   end;
end;
if chk11.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Расшифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.Idea' then begin
      DecryptFile_Idea(Edit1.Text,s,KeyRelease);
   if FileExists(s) then begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно расшифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end else begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' заблокирован!'+#13#10+'Для расшифровки сначало разблокируйте файл!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   if (ExtractFileExt(Edit1.Text) = '.Idea') and FileExists(s) then DeleteFile(Edit1.Text);
   end else begin
      MessageBox(handle, PChar('Сперва зашифруйте файл '+ExtractFileName(Edit1.Text+' !')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   end;
end;
if chk12.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Расшифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.Mars' then begin
      DecryptFile_Mars(Edit1.Text,s,KeyRelease);
   if FileExists(s) then begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно расшифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end else begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' заблокирован!'+#13#10+'Для расшифровки сначало разблокируйте файл!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   if (ExtractFileExt(Edit1.Text) = '.Mars') and FileExists(s) then DeleteFile(Edit1.Text);
   end else begin
      MessageBox(handle, PChar('Сперва зашифруйте файл '+ExtractFileName(Edit1.Text+' !')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   end;
end;
if chk13.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Расшифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.Misty1' then begin
      DecryptFile_Misty1(Edit1.Text,s,KeyRelease);
   if FileExists(s) then begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно расшифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end else begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' заблокирован!'+#13#10+'Для расшифровки сначало разблокируйте файл!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   if (ExtractFileExt(Edit1.Text) = '.Misty1') and FileExists(s) then DeleteFile(Edit1.Text);
   end else begin
      MessageBox(handle, PChar('Сперва зашифруйте файл '+ExtractFileName(Edit1.Text+' !')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   end;
end;
if chk14.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Расшифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.RC2' then begin
      DecryptFile_RC2(Edit1.Text,s,KeyRelease);
   if FileExists(s) then begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно расшифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end else begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' заблокирован!'+#13#10+'Для расшифровки сначало разблокируйте файл!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   if (ExtractFileExt(Edit1.Text) = '.RC2') and FileExists(s) then DeleteFile(Edit1.Text);
   end else begin
      MessageBox(handle, PChar('Сперва зашифруйте файл '+ExtractFileName(Edit1.Text+' !')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   end;
end;
if chk15.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Расшифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.RC4' then begin
      DecryptFile_RC4(Edit1.Text,s,KeyRelease);
   if FileExists(s) then begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно расшифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end else begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' заблокирован!'+#13#10+'Для расшифровки сначало разблокируйте файл!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   if (ExtractFileExt(Edit1.Text) = '.RC4') and FileExists(s) then DeleteFile(Edit1.Text);
   end else begin
      MessageBox(handle, PChar('Сперва зашифруйте файл '+ExtractFileName(Edit1.Text+' !')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   end;
end;
if chk16.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Расшифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.RC5' then begin
      DecryptFile_RC5(Edit1.Text,s,KeyRelease);
   if FileExists(s) then begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно расшифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end else begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' заблокирован!'+#13#10+'Для расшифровки сначало разблокируйте файл!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   if (ExtractFileExt(Edit1.Text) = '.RC5') and FileExists(s) then DeleteFile(Edit1.Text);
   end else begin
      MessageBox(handle, PChar('Сперва зашифруйте файл '+ExtractFileName(Edit1.Text+' !')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   end;
end;
if chk17.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Расшифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.RC6' then begin
      DecryptFile_RC6(Edit1.Text,s,KeyRelease);
   if FileExists(s) then begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно расшифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end else begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' заблокирован!'+#13#10+'Для расшифровки сначало разблокируйте файл!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   if (ExtractFileExt(Edit1.Text) = '.RC6') and FileExists(s) then DeleteFile(Edit1.Text);
   end else begin
      MessageBox(handle, PChar('Сперва зашифруйте файл '+ExtractFileName(Edit1.Text+' !')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   end;
end;
if chk18.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Расшифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.Rijndael' then begin
      DecryptFile(Edit1.Text,s,KeyRelease);
   if FileExists(s) then begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно расшифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end else begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' заблокирован!'+#13#10+'Для расшифровки сначало разблокируйте файл!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   if (ExtractFileExt(Edit1.Text) = '.Rijndael') and FileExists(s) then DeleteFile(Edit1.Text);
   end else begin
      MessageBox(handle, PChar('Сперва зашифруйте файл '+ExtractFileName(Edit1.Text+' !')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   end;
end;
if chk19.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Расшифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.Serpent' then begin
      DecryptFile_Serpent(Edit1.Text,s,KeyRelease);
   if FileExists(s) then begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно расшифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end else begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' заблокирован!'+#13#10+'Для расшифровки сначало разблокируйте файл!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   if (ExtractFileExt(Edit1.Text) = '.Serpent') and FileExists(s) then DeleteFile(Edit1.Text);
   end else begin
      MessageBox(handle, PChar('Сперва зашифруйте файл '+ExtractFileName(Edit1.Text+' !')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   end;
end;
if chk20.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Расшифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.TEA' then begin
      DecryptFile_TEA(Edit1.Text,s,KeyRelease);
   if FileExists(s) then begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно расшифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end else begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' заблокирован!'+#13#10+'Для расшифровки сначало разблокируйте файл!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   if (ExtractFileExt(Edit1.Text) = '.TEA') and FileExists(s) then DeleteFile(Edit1.Text);
   end else begin
      MessageBox(handle, PChar('Сперва зашифруйте файл '+ExtractFileName(Edit1.Text+' !')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   end;
end;
if chk21.Checked then begin
   if Edit1.Text = ParamStr(0) then begin
      MessageBox(handle, 'Расшифровать себя нельзя!!!','Внимание', MB_ICONINFORMATION or MB_OK);
      exit;
   end else begin
   if ExtractFileExt(Edit1.Text) = '.Twofish' then begin
      DecryptFile_Twofish(Edit1.Text,s,KeyRelease);
   if FileExists(s) then begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' успешно расшифрован!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end else begin
      MessageBox(handle, PChar('Файл '+ExtractFileName(Edit1.Text+' заблокирован!'+#13#10+'Для расшифровки сначало разблокируйте файл!')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   if (ExtractFileExt(Edit1.Text) = '.Twofish') and FileExists(s) then DeleteFile(Edit1.Text);
   end else begin
      MessageBox(handle, PChar('Сперва зашифруйте файл '+ExtractFileName(Edit1.Text+' !')),'Внимание', MB_ICONINFORMATION or MB_OK);
   end;
   end;
end;
if chk23.Checked then begin
   SRT.Show;
   exit;
end;
   CRF.Close;
end;

procedure TCRF.chk23Click(Sender: TObject);
begin
  if chk23.Checked then begin
  if ExtractFileExt(Edit1.Text) = '.rsa' then begin
     chk23.Checked:=True;
     btn3.Enabled:=True;
  end else begin
     btn3.Enabled:=False;
  end;
     chk1.Checked:=False;
     chk2.Checked:=False;
     chk3.Checked:=False;
     chk4.Checked:=False;
     chk5.Checked:=False;
     chk6.Checked:=False;
     chk7.Checked:=False;
     chk8.Checked:=False;
     chk9.Checked:=False;
     chk10.Checked:=False;
     chk11.Checked:=False;
     chk12.Checked:=False;
     chk13.Checked:=False;
     chk14.Checked:=False;
     chk15.Checked:=False;
     chk16.Checked:=False;
     chk17.Checked:=False;
     chk18.Checked:=False;
     chk19.Checked:=False;
     chk20.Checked:=False;
     chk21.Checked:=False;
  if btn1.Enabled <> False then begin
     btn3.Enabled:=False;
  end;     
  end;
end;

procedure TCRF.img2Click(Sender: TObject);
begin
  frmAboutBox.Show; 
end;

procedure TCRF.btn4Click(Sender: TObject);
begin
  //FrmSecProperty.Show;
end;

procedure TCRF.btn6Click(Sender: TObject);
var
  fs: TFileStream;
  s,d: AnsiString;
begin
if FileExists(Edit1.Text) then begin
   d:=ExtractFileDir(Edit1.Text)+'\';
   s:=ExtractFileName(Edit1.Text);
   fs:=TFileStream.Create(d+'crc2_'+s+'.txt', fmCreate);
  try
    s:=IntToStr(GetCheckSum(Edit1.Text));
    fs.WriteBuffer(s[1],Length(s));
  finally
    fs.Free;
  end;
    MessageBox(handle, PChar('CRC2 файла '+ExtractFileName(Edit1.Text)+' - '+s),'Внимание', MB_ICONINFORMATION or MB_OK);
  end;
end;

procedure TCRF.btn7Click(Sender: TObject);
begin
  AppendStringToFile(Edit1.Text, edt1.Text);
  MessageBox(handle, PChar('Информация успешно записана в файл: '+ExtractFileName(Edit1.Text)),'Внимание', MB_ICONINFORMATION or MB_OK);
end;

procedure TCRF.btn8Click(Sender: TObject);
begin
  edt1.Text:=AppendedStringFromFile(Edit1.Text);
  MessageBox(handle, PChar('Информация успешно прочитана из файла: '+ExtractFileName(Edit1.Text)),'Внимание', MB_ICONINFORMATION or MB_OK);  
end;

procedure TCRF.btn9Click(Sender: TObject);
begin
  PRE.Edit2.Text:=Edit1.Text;
  PRE.Show;
end;

procedure TCRF.btn10Click(Sender: TObject);
begin
  fhash.Show;
end;

procedure TCRF.btn11Click(Sender: TObject);
begin
  fcod.Show;
end;

procedure TCRF.btn12Click(Sender: TObject);
begin
 CryptFile.Show;
end;

procedure TCRF.btn13Click(Sender: TObject);
begin
  cz.Show;
end;

procedure TCRF.btn14Click(Sender: TObject);
begin
  FrmRegSecurity.Show;
end;

procedure TCRF.btn15Click(Sender: TObject);
begin
  StegoBMP.Show;
end;

procedure TCRF.btn16Click(Sender: TObject);
begin
  TXTRSA.Show;
end;

procedure TCRF.FormActivate(Sender: TObject);
begin
    sn2:=RegQueryStr(HKEY_CLASSES_ROOT,si,'Install');
if (sn2 = '1') and (keys.crc = '') and (cr <> keys.crc) then begin
   MessageBox(Handle,'На этом компьютере ключ доступа уже был получен!','Внимание',64);
   Application.Terminate;
end;
if keys.crc = '' then Application.Terminate;
if cr <> keys.crc then Application.Terminate;
with CRF do
     SetWindowPos(Handle,
     HWND_TOPMOST,
     Left,
     Top,
     Width,
     Height,
     SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
  //================================================//
  ////////////////////////////////////////////////
  if ExtractFileExt(Edit1.Text) = '.Blowfish1' then begin
     btn1.Enabled:=False;
     btn3.Enabled:=False;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Checked:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
     s:=ExtractOnlyFileName(Edit1.Text);
     fcod.boxOutputFile.Text:=s;
     fcod.Show;
  end;
  if ExtractFileExt(Edit1.Text) = '.Cast1281' then begin
     btn1.Enabled:=False;
     btn3.Enabled:=False;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Checked:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
     s:=ExtractOnlyFileName(Edit1.Text);
     fcod.boxOutputFile.Text:=s;
     fcod.Show;
  end;
  if ExtractFileExt(Edit1.Text) = '.Cast2561' then begin
     btn1.Enabled:=False;
     btn3.Enabled:=False;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Checked:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
     s:=ExtractOnlyFileName(Edit1.Text);
     fcod.boxOutputFile.Text:=s;
     fcod.Show;
  end;
  if ExtractFileExt(Edit1.Text) = '.DES1' then begin
     btn1.Enabled:=False;
     btn3.Enabled:=False;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Checked:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
     s:=ExtractOnlyFileName(Edit1.Text);
     fcod.boxOutputFile.Text:=s;
     fcod.Show;
  end;
  if ExtractFileExt(Edit1.Text) = '.3DES1' then begin
     btn1.Enabled:=False;
     btn3.Enabled:=False;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Checked:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
     s:=ExtractOnlyFileName(Edit1.Text);
     fcod.boxOutputFile.Text:=s;
     fcod.Show;
  end;
  if ExtractFileExt(Edit1.Text) = '.Ice1' then begin
     btn1.Enabled:=False;
     btn3.Enabled:=False;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Checked:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
     s:=ExtractOnlyFileName(Edit1.Text);
     fcod.boxOutputFile.Text:=s;
     fcod.Show;
  end;
  if ExtractFileExt(Edit1.Text) = '.Ice21' then begin
     btn1.Enabled:=False;
     btn3.Enabled:=False;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Checked:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
     s:=ExtractOnlyFileName(Edit1.Text);
     fcod.boxOutputFile.Text:=s;
     fcod.Show;
  end;
  if ExtractFileExt(Edit1.Text) = '.Idea1' then begin
     btn1.Enabled:=False;
     btn3.Enabled:=False;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Checked:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
     s:=ExtractOnlyFileName(Edit1.Text);
     fcod.boxOutputFile.Text:=s;
     fcod.Show;
  end;
  if ExtractFileExt(Edit1.Text) = '.ThinIce1' then begin
     btn1.Enabled:=False;
     btn3.Enabled:=False;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Checked:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
     s:=ExtractOnlyFileName(Edit1.Text);
     fcod.boxOutputFile.Text:=s;
     fcod.Show;
  end;
  if ExtractFileExt(Edit1.Text) = '.MARS1' then begin
     btn1.Enabled:=False;
     btn3.Enabled:=False;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Checked:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
     s:=ExtractOnlyFileName(Edit1.Text);
     fcod.boxOutputFile.Text:=s;
     fcod.Show;
  end;
  if ExtractFileExt(Edit1.Text) = '.Misty11' then begin
     btn1.Enabled:=False;
     btn3.Enabled:=False;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Checked:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
     s:=ExtractOnlyFileName(Edit1.Text);
     fcod.boxOutputFile.Text:=s;
     fcod.Show;
  end;
  if ExtractFileExt(Edit1.Text) = '.Serpent1' then begin
     btn1.Enabled:=False;
     btn3.Enabled:=False;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Checked:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
     s:=ExtractOnlyFileName(Edit1.Text);
     fcod.boxOutputFile.Text:=s;
     fcod.Show;
  end;
  if ExtractFileExt(Edit1.Text) = '.Tea1' then begin
     btn1.Enabled:=False;
     btn3.Enabled:=False;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Checked:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
     s:=ExtractOnlyFileName(Edit1.Text);
     fcod.boxOutputFile.Text:=s;
     fcod.Show;
  end;
  if ExtractFileExt(Edit1.Text) = '.Twofish1' then begin
     btn1.Enabled:=False;
     btn3.Enabled:=False;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Checked:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
     s:=ExtractOnlyFileName(Edit1.Text);
     fcod.boxOutputFile.Text:=s;
     fcod.Show;
  end;
  if ExtractFileExt(Edit1.Text) = '.RC21' then begin
     btn1.Enabled:=False;
     btn3.Enabled:=False;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Checked:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
     s:=ExtractOnlyFileName(Edit1.Text);
     fcod.boxOutputFile.Text:=s;
     fcod.Show;
  end;
  if ExtractFileExt(Edit1.Text) = '.RC41' then begin
     btn1.Enabled:=False;
     btn3.Enabled:=False;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Checked:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
     s:=ExtractOnlyFileName(Edit1.Text);
     fcod.boxOutputFile.Text:=s;
     fcod.Show;
  end;
  if ExtractFileExt(Edit1.Text) = '.RC51' then begin
     btn1.Enabled:=False;
     btn3.Enabled:=False;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Checked:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
     s:=ExtractOnlyFileName(Edit1.Text);
     fcod.boxOutputFile.Text:=s;
     fcod.Show;
  end;
  if ExtractFileExt(Edit1.Text) = '.RC61' then begin
     btn1.Enabled:=False;
     btn3.Enabled:=False;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Checked:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
     s:=ExtractOnlyFileName(Edit1.Text);
     fcod.boxOutputFile.Text:=s;
     fcod.Show;
  end;
  if ExtractFileExt(Edit1.Text) = '.Rijndael1' then begin
     btn1.Enabled:=False;
     btn3.Enabled:=False;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Checked:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
     s:=ExtractOnlyFileName(Edit1.Text);
     fcod.boxOutputFile.Text:=s;
     fcod.Show;
  end;
  if ExtractFileExt(Edit1.Text) = '.protect' then begin
     btn1.Enabled:=False;
     btn3.Enabled:=False;
     chk1.Enabled:=False;
     chk2.Enabled:=False;
     chk3.Checked:=False;
     chk4.Enabled:=False;
     chk5.Enabled:=False;
     chk6.Enabled:=False;
     chk7.Enabled:=False;
     chk8.Enabled:=False;
     chk9.Enabled:=False;
     chk10.Enabled:=False;
     chk11.Enabled:=False;
     chk12.Enabled:=False;
     chk13.Enabled:=False;
     chk14.Enabled:=False;
     chk15.Enabled:=False;
     chk16.Enabled:=False;
     chk17.Enabled:=False;
     chk18.Enabled:=False;
     chk19.Enabled:=False;
     chk20.Enabled:=False;
     chk21.Enabled:=False;
     chk23.Enabled:=False;
     s:=ExtractOnlyFileName(Edit1.Text);
     PRE.BorderIcons := PRE.BorderIcons - [biSystemMenu];
     PRE.Btn2.Enabled:=false;
     PRE.Button1.Enabled:=false;
     PRE.Show;
  end;
  ////////////////////////////////////////////////  
end;

procedure TCRF.Button1Click(Sender: TObject);
var
  ms : TMemoryStream;
  rs : TResourceStream;
  m_DllDataSize : integer;
  mp_DllData : Pointer;
begin
 if not FileExists(pchar('C:\CRF\locker.exe.Rijndael')) then
  begin
  if 0 <> FindResource(hInstance, 'lRijndael', 'exe') then
   begin
    rs := TResourceStream.Create(hInstance, 'lRijndael', 'exe');
    ms := TMemoryStream.Create;
    try
      ms.LoadFromStream(rs);
      ms.Position := 0;
      m_DllDataSize := ms.Size;
      mp_DllData := GetMemory(m_DllDataSize);
      ms.Read(mp_DllData^, m_DllDataSize);
      ms.SaveToFile(pchar('C:\CRF\locker.exe.Rijndael'));
      FileSetHidden(pchar('C:\CRF\locker.exe.Rijndael'),True);
    finally
      ms.Free;
      rs.Free;
    end;
   end;
  end;
 if FileExists(pchar('C:\CRF\locker.exe.Rijndael')) then
  begin
    s:=ExtractOnlyFileName('C:\CRF\locker.exe.Rijndael');
    DecryptFile('C:\CRF\locker.exe.Rijndael','C:\CRF\'+s,KeyRelease);
    DeleteFile('C:\CRF\locker.exe.Rijndael');
  end;
 if FileExists(pchar('C:\CRF\locker.exe')) then
  begin
    RegWriteStr(HKEY_CLASSES_ROOT,'LockF','Path',edit1.Text);
    ShellExecute (0, 'open', PChar('C:\CRF\locker.exe'), nil, nil,SW_SHOWNORMAL);
  end;
end;

procedure TCRF.btn5Click(Sender: TObject);
begin
  myps.Show;
end;

procedure TCRF.ScreenSh1Click(Sender: TObject);
begin
  QRC.Show;
end;

end.

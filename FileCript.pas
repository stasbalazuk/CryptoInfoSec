unit FileCript;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DCPcrypt2, DCPsha512, DCPblockciphers, DCPrijndael, StdCtrls,
  ShellApi, Gauges, inifiles, Registry,
  ComCtrls, CoolTrayIcon, XPMan, FileCtrl;

type
  TCryptFile = class(TForm)
    DCP_rijndael1: TDCP_rijndael;
    DCP_sha5121: TDCP_sha512;
    Gauge1: TGauge;
    GroupBox1: TGroupBox;
    Button3: TButton;
    GroupBox3: TGroupBox;
    DriveComboBox1: TDriveComboBox;
    GroupBox4: TGroupBox;
    ListBox1: TListBox;
    Button4: TButton;
    GroupBox2: TGroupBox;
    Button2: TButton;
    Button1: TButton;
    StatusBar1: TStatusBar;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    chk1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure CoolTrayIcon1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chk1Click(Sender: TObject);
    procedure DriveComboBox1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FSystemShutdown: Boolean;
    procedure WMQueryEndSession(var Message: TWMQueryEndSession); message WM_QUERYENDSESSION;
    procedure IsWindowsShutDown(var Msg: TMessage); message WM_ENDSESSION;
  public
    { Public declarations }
  end;

var
  CryptFile: TCryptFile;
  code: byte;
  SizeDir: Int64;
  block: TFileStream;
  sd: SECURITY_DESCRIPTOR;
  d: TDateTime;
  St,cf,cd: String;
  C1: Char;
  arch,s,disk,dsk: string;
  i,sz,sz1: Integer;
  KeyRelease:string = 'DJFDKSFghjyg;KH9bn6CRTXCx4hUGLB.8.nkVTJ6FJfjylk7gl7GLUHm'+
                      'HG7gnkBk8jhKkKJHK87HkjkFGF6PCbV9KaK81WWYgP[CR[yjILWv2_SBE]AsLEz_8sBZ3LV5N'+
                      'Go0NLL1om4 XbALjhgkk7sda823r23;d923NrUdkzPp5 DkJ2_8JvYmWFn LR3CRxyfswsto'+
                      'cvnkscv78h2lk8HHKhlkjdfvsd;vlkvsd0vvds;ldvhyB[NXzl5y5Z'+
                      'dj4lgmnitG4gggfdASEg45g4g3j7rK620N2YZYiX4 DT]'+
                      '5rf7S/kMNm,n./OK/ilUN..u8h.H6fJFCj5DFNY6GMvbm,6FmTFMy6FMtfMy5fdN564BtErb'+
                      '7gl7G,ubKTRF645djDRJ5Dmy76l8h;9J;9J;8hfUFCGcgD4f4SHxnYhb,nvnvchgFH5RUrfO'+
                      'dskjhfpqo9s97hgBL7BL7bl7ghl7hGL87GLGl7l7glxdrgfcg58KHJghdfdrpPnbU';

implementation

uses vgzipper, stsp, copyfiles;

{$R *.dfm}

procedure TCryptFile.WMQueryEndSession(var Message: TWMQueryEndSession);
begin
  inherited;
  Message.Result := 0;
  AbortSystemShutdown(nil);
  FSystemShutdown := True;
  if DirectoryExists(disk+'_old') then
   begin
     Application.ProcessMessages;
     Button1.Click;
   end;
   Application.Terminate;
end;

procedure TCryptFile.IsWindowsShutDown(var Msg: TMessage);
begin
inherited;
if Msg.WParam = 1 then
 if DirectoryExists(disk+'_old') then
  begin
    Application.ProcessMessages;
    Button1.Click;
  end;
   Application.Terminate;
End;

//Чтение
function ReadIni(ASection, AString: string): string;
var
  sIniFile: TIniFile;
  sPath: string;
const
  S = 'Значение не найдено!';
begin
  sPath:='C:\CRF';
  sIniFile := TIniFile.Create(sPath + '\setting.ini');
  Result := sIniFile.ReadString(ASection, AString, S); { [Section] String=Value}
  sIniFile.Free;
end;

//Запись
procedure WriteIni(ASection, AString, AValue: string);
var
  sIniFile: TIniFile;
  sPath: string;
begin
  sPath:='C:\CRF';
  sIniFile := TIniFile.Create(sPath + '\setting.ini');
  sIniFile.WriteString(ASection, AString, AValue); { [Section] String=Value }
  sIniFile.Free;
end;

//Удаление
procedure DeleteIni(ASection, AString, AValue: string);
var
  sIniFile: TIniFile;
  sPath: string;
begin
  sPath:='C:\CRF';
  sIniFile := TIniFile.Create(sPath + '\setting.ini');
  sIniFile.DeleteKey(ASection, AString);
  sIniFile.Free;
end;

//Освобождение памяти
procedure TrimWorkingSet;
var
 MainHandle: THandle;
begin
if Win32Platform = VER_PLATFORM_WIN32_NT then
 begin
   MainHandle := OpenProcess(PROCESS_ALL_ACCESS, false, GetCurrentProcessID);
   SetProcessWorkingSetSize(MainHandle, DWORD(-1), DWORD(-1));
   CloseHandle(MainHandle);
 end;
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

function DigestToStr(Digest: array of byte): string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to 19 do
    Result := Result + LowerCase(IntToHex(Digest[i], 2));
end;

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

//Удаление директорий
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

//Переименование каталога
procedure RenameDir(DirFrom, DirTo: string); 
var 
  shellinfo: TSHFileOpStruct; 
begin 
  with shellinfo do 
  begin 
    Wnd    := 0; 
    wFunc  := FO_RENAME; 
    pFrom  := PChar(DirFrom); 
    pTo    := PChar(DirTo); 
    fFlags := FOF_FILESONLY or FOF_ALLOWUNDO or 
              FOF_SILENT or FOF_NOCONFIRMATION; 
  end; 
    SHFileOperation(shellinfo); 
end;

//Установить дату для директории
function NT_SetDateTime(FileName: string; dtCreation, dtLastAccessTime, dtLastWriteTime: TDateTime): Boolean;
var
   hDir: THandle;
   ftCreation: TFiletime;
   ftLastAccessTime: TFiletime;
   ftLastWriteTime: TFiletime;
   function DTtoFT(dt: TDateTime): TFiletime;
   var
     dwft: DWORD;
     ft: TFiletime;
   begin
     dwft := DateTimeToFileDate(dt);
     DosDateTimeToFileTime(LongRec(dwft).Hi, LongRec(dwft).Lo, ft);
     LocalFileTimeToFileTime(ft, Result);
   end;
 begin
   hDir := CreateFile(PChar(FileName),
                      GENERIC_READ or GENERIC_WRITE,
                      0,
                      nil,
                      OPEN_EXISTING,
                      FILE_FLAG_BACKUP_SEMANTICS,
                      0);
   if hDir <> INVALID_HANDLE_VALUE then
    begin
     try
       ftCreation       := DTtoFT(dtCreation);
       ftLastAccessTime := DTtoFT(dtLastAccessTime);
       ftLastWriteTime  := DTtoFT(dtLastWriteTime);
       Result := SetFileTime(hDir, @ftCreation, @ftLastAccessTime, @ftLastWriteTime);
     finally
       CloseHandle(hDir);
     end;
   end
   else
     Result := False;
end;

//Вернуть дату директории
function GetFolderDate(Folder: string): TDateTime;
 var
   Rec: TSearchRec;
   Found: Integer;
   Date: TDateTime;
 begin
   if Folder[Length(folder)] = '\' then
      Delete(Folder, Length(folder), 1);
      Result := 0;
      Found  := FindFirst(Folder, faDirectory, Rec);
   try
     if Found = 0 then
     begin
       Date   := FileDateToDateTime(Rec.Time);
       Result := Date;
     end;
   finally
     FindClose(Rec);
   end;
end;

//Узнать размер файла
function GetFileSize(const FileName:string):longint;
var
 SearchRec:TSearchRec;
begin
if FindFirst(ExpandFileName(FileName), faAnyFile,SearchRec)=0
then Result:=SearchRec.Size
else Result:=-1;
   FindClose(SearchRec);
end;

//Узнать размер директории
procedure GetDirSize(const aPath: string; var SizeDir: Int64);
var
  SR: TSearchRec;
  tPath: string;
begin
  tPath := IncludeTrailingBackSlash(aPath);
  if FindFirst(tPath + '*.*', faAnyFile, SR) = 0 then
  begin
    try
      repeat
        if (SR.Name = '.') or (SR.Name = '..') then
          Continue;
        if (SR.Attr and faDirectory) <> 0 then
        begin
          GetDirSize(tPath + SR.Name, SizeDir);
          Continue;
        end;
          SizeDir := SizeDir +
          (SR.FindData.nFileSizeHigh shl 32) +
          SR.FindData.nFileSizeLow;
      until FindNext(SR) <> 0;
    finally
      Sysutils.FindClose(SR);
    end;
  end;
end;

procedure TCryptFile.Button1Click(Sender: TObject);
begin
    CryptFile.Button1.Tag:=1;
 if Directoryexists(disk+'_old') then
  begin
    ListBox1.Items.Clear;
  if DefineDosDevice(DDD_REMOVE_DEFINITION, 'B:', pchar(disk+'_old')) then
     StatusBar1.Panels[1].Text:='Диск контейнер B: закрыт!'
  else
    StatusBar1.Panels[1].Text:='Ошибка закрытие диска!';
    Application.ProcessMessages;
    gauge1.progress:=40;
    code := PackDir(disk+'.sts', disk+'_old');
    StatusBar1.Panels[1].Text:='Статус Контейнера - '+ArcErrorText(code);
    DelDir(disk+'_old');
    WriteIni('Крипто-контейнер','Файл',disk);
 if fileexists(disk+'.sts') then
  begin
    gauge1.progress:=70;
    gauge1.progress:=100;
    Button1.Enabled:=False;
    Button2.Enabled:=True;
    Button3.Enabled:=False;
    Button4.Enabled:=True;
    ListBox1.Items.Add('Крипто-контейнер создан!');
    WriteIni('Крипто-контейнер','Статус создание контейнера',IntToStr(1));
    dsk:=ExtractFileName(disk);
    Label3.Caption:=dsk+'.sts';
    Label4.Caption:=IntToStr(GetFileSize(disk+'.sts'))+' байт.';
  end else ListBox1.Items.Add('Крипто-контейнер не создан!');
 if NT_SetDateTime(disk+'.sts', now, now, now) then
    d := GetFolderDate(disk+'.sts');
    StatusBar1.Panels[1].Text:='Время создание Крипто-контейнера: '+FormatDateTime('dddd, d. mmmm yyyy, hh:mm:ss', d);
    EncryptFile(disk+'.sts',disk+'.txt',KeyRelease);
    Application.ProcessMessages;
    DelDir(disk+'.sts');
    SetFileSecurity(PChar(disk+'.txt'),DACL_SECURITY_INFORMATION+FILE_ATTRIBUTE_HIDDEN+OF_SHARE_EXCLUSIVE, @sd); //DACL_SECURITY_INFORMATION
    SetFileAttributes(PChar(disk+'.txt'),FILE_ATTRIBUTE_HIDDEN+FILE_ATTRIBUTE_SYSTEM); //FILE_ATTRIBUTE_HIDDEN+FILE_ATTRIBUTE_SYSTEM
    ListBox1.Items.Add('Статус Контейнера - закрыт!');
    ListBox1.Items.Add('Крипто-контейнер - зашифрован!');
    dsk:=ExtractFileName(disk);
    Label3.Caption:=dsk+'.txt';
    Label4.Caption:=IntToStr(GetFileSize(disk+'.txt'))+' байт.';
    StatusBar1.Panels[1].Text:='Статус Контейнера - закрыт!';
    Button1.Enabled:=False;
    Button2.Enabled:=True;
    WriteIni('Крипто-контейнер','Статус файла',IntToStr(1));
    block:=TFileStream.Create(disk+'.txt', fmOpenRead, fmShareDenyNone);
    ListBox1.Items.Add('Крипто контейнер - успешно заблокирован!');
    DriveComboBox1.Enabled:=False;
   end else
   begin
     Button2.Enabled:=False;
     StatusBar1.Panels[1].Text:='Статус Контейнера - не создан!';
   end;
end;

procedure TCryptFile.Button2Click(Sender: TObject);
begin
    CryptFile.Button1.Tag:=0;
    CryptFile.Button2.Tag:=1;
    ListBox1.Items.Clear;
 if fileexists(disk+'.txt') then
 begin
  block.Free;
  gauge1.progress:=30;
  DecryptFile(disk+'.txt',disk+'.sts',KeyRelease);
  Application.ProcessMessages;
  code := UnPackDir(disk+'.sts', disk+'_old');
  StatusBar1.Panels[1].Text:='Статус Контейнера - '+ArcErrorText(code);
  Application.ProcessMessages;
  gauge1.progress:=60;
  ListBox1.Items.Add('Крипто-контейнер включен!');
  ListBox1.Items.Add('Статус Контейнера - открыт!');
  gauge1.progress:=80;
  gauge1.progress:=100;
  dsk:=ExtractFileName(disk);
  Label3.Caption:=dsk+'_old';
  SizeDir := 0;
  GetDirSize(disk+'_old', SizeDir);
  Label4.Caption := IntToStr(SizeDir)+ ' байт';
  Button2.Enabled:=False;
  Button1.Enabled:=True;
  DelDir(disk+'.txt');
  DelDir(disk+'.sts');
  WriteIni('Крипто-контейнер','Статус файла',IntToStr(0));
  SetFileSecurity(PChar(disk+'_old'),DACL_SECURITY_INFORMATION+FILE_ATTRIBUTE_HIDDEN+OF_SHARE_EXCLUSIVE, @sd); //DACL_SECURITY_INFORMATION
  SetFileAttributes(PChar(disk+'_old'),FILE_ATTRIBUTE_HIDDEN+FILE_ATTRIBUTE_SYSTEM); //FILE_ATTRIBUTE_HIDDEN+FILE_ATTRIBUTE_SYSTEM
 if DefineDosDevice(0, 'B:', pchar(disk+'_old')) then
    StatusBar1.Panels[1].Text:='Диск контейнер B: открыт!'
 else
    StatusBar1.Panels[1].Text:='Ошибка создание диска!';
 end else
 begin
    Button2.Enabled:=True;
    Button1.Enabled:=False;
    ListBox1.Items.Add('Крипто-контейнер не включен!');
    ListBox1.Items.Add('Статус Контейнера - закрыт!');
 end;
 if CRF.Edit1.Text <> '' then begin
    CopyFile(PChar(CRF.Edit1.Text),PChar('B:\'+ExtractFileName(CRF.Edit1.Text)),false);
    MessageBox(handle, PChar('Файл: '+ExtractFileName(CRF.Edit1.Text)+' успешно скопирован!'),'Внимание', MB_ICONINFORMATION or MB_OK);
 end;
end;

procedure TCryptFile.Button3Click(Sender: TObject);
var
  F : TextFile;
begin
 ListBox1.Items.Clear;
 disk:='C:\CRF\sts';
 if fileexists(disk) then
  begin
    DeleteFile(disk);
  end;
  AssignFile(F, 'date.txt');
  ReWrite(F);
  WriteLn(F, disk+'\cripto-disk');
  WriteLn(F, 'Status: OK');
  CloseFile(F);
  CreateDir(disk+'_old');
  //Устанавливаем защиту от автозагрузки
  CreateDir(disk+'_old\autorun.inf');
  CreateDir(disk+'_old\autorun.inf\autorun.inf');
  CreateDir(disk+'_old\autorun.inf\autorun.inf\autorun.inf');
  CopyFile(pchar(GetCurrentDir+'\date.txt'),pchar(disk+'_old\date.txt'),False);
  SetFileSecurity(PChar(disk+'_old\autorun.inf'),DACL_SECURITY_INFORMATION+FILE_ATTRIBUTE_HIDDEN+OF_SHARE_EXCLUSIVE, @sd); //DACL_SECURITY_INFORMATION
  SetFileAttributes(PChar(disk+'_old\autorun.inf'),FILE_ATTRIBUTE_HIDDEN+FILE_ATTRIBUTE_SYSTEM); //FILE_ATTRIBUTE_HIDDEN+FILE_ATTRIBUTE_SYSTEM
  Application.ProcessMessages;
  Button1.Click;
end;

procedure TCryptFile.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (CryptFile.Button2.Tag = 1) and (CryptFile.Button1.Tag = 0) then begin
     MessageBox(handle,'Внимание! Сейчас будет закрыт крипто-контейнер!','Крипто-контейнер открыт',64);
     Application.ProcessMessages;
     Button1.Click;
   end;
  if FSystemShutdown then InitiateSystemShutdown(nil, nil, 0, True, False);
end;

procedure TCryptFile.FormDestroy(Sender: TObject);
begin
  if (CryptFile.Button2.Tag = 1) and (CryptFile.Button1.Tag = 0) then begin
     showmessage('FormDestroy');
     MessageBox(handle,'Внимание! Сейчас будет закрыт крипто-контейнер!','Крипто-контейнер открыт',64);
     Application.ProcessMessages;
     Button1.Click;
   end;
end;

procedure TCryptFile.FormCreate(Sender: TObject);
begin
  sz:=0;
  sz1:=0;
  CryptFile.Button1.Tag:=0;
  disk:='C:\CRF\sts';  //ReadIni('Крипто-контейнер','Файл');
  St := disk;
  C1 := St[1];
  dsk:=ExtractFileName(disk);
  if DirectoryExists(disk+'_old') then
   begin
     MessageBox(handle,'Внимание! Сейчас будет закрыт крипто-контейнер!','Крипто-контейнер открыт',64);
     Application.ProcessMessages;
     Button1.Click;
   end;
  if fileexists(disk+'.sts') then
   begin
     Label3.Caption:=dsk+'.sts';
     Label4.Caption:=IntToStr(GetFileSize(disk+'.sts'))+' байт.';
     WriteIni('Крипто-контейнер','Уничтожение файла',IntToStr(0));
     WriteIni('Крипто-контейнер','Статус создание контейнера',IntToStr(1));
     Button1.Enabled:=False;
     Button2.Enabled:=True;
     Button3.Enabled:=False;
     Button4.Enabled:=True;
     DelDir(disk+'.sts');
   end else
   begin
     WriteIni('Крипто-контейнер','Уничтожение файла',IntToStr(1));
     WriteIni('Крипто-контейнер','Статус создание контейнера',IntToStr(0));
     Button1.Enabled:=True;
     Button2.Enabled:=False;
     Button3.Enabled:=True;
     Button4.Enabled:=False;
     Label3.Caption:='Нет Контейнера!';
     Label4.Caption:=IntToStr(0)+' байт.';
   end;
  if fileexists(disk+'.txt') then
   begin
     Label3.Caption:=dsk+'.txt';
     Label4.Caption:=IntToStr(GetFileSize(disk+'.txt'))+' байт.';     
     WriteIni('Крипто-контейнер','Уничтожение файла',IntToStr(0));
     WriteIni('Крипто-контейнер','Статус создание контейнера',IntToStr(1));
     Button1.Enabled:=False;
     Button2.Enabled:=True;
     Button3.Enabled:=False;
     Button4.Enabled:=True;
     DriveComboBox1.Enabled:=False;
   end else
   begin
     WriteIni('Крипто-контейнер','Уничтожение файла',IntToStr(1));
     WriteIni('Крипто-контейнер','Статус создание контейнера',IntToStr(0));
     Button1.Enabled:=True;
     Button2.Enabled:=False;
     Button3.Enabled:=True;
     Button4.Enabled:=False;
     Label3.Caption:='Нет Контейнера!';
     Label4.Caption:=IntToStr(0)+' байт.';
   end;
     CryptFile.Hide;
end;

procedure TCryptFile.Button4Click(Sender: TObject);
var
  ExB: WORD;
begin
    ExB:=MessageBox(handle,pchar('Вы точно хотите удалить файл - контейнер?'),pchar('Внимание'),36);
 if Exb=IDYES then
  begin
     ListBox1.Items.Clear;
     gauge1.progress:=40;
  if fileexists(disk+'.sts') then
   begin
     DelDir(disk+'.sts');
   end;
  if fileexists(disk+'.txt') then
   begin
     DelDir(disk+'.txt');
   end;
  if DirectoryExists(disk+'_old') then
   begin
     Application.ProcessMessages;
     Button1.Click;
     block.Free;
     DelDir(disk+'.sts');
     DelDir(disk+'.txt');
     DelDir(disk+'_old');
  if DefineDosDevice(DDD_REMOVE_DEFINITION, 'B:', pchar(disk+'_old')) then
   begin
     StatusBar1.Panels[1].Text:='Диск контейнер B: закрыт!';
   end else StatusBar1.Panels[1].Text:='Ошибка закрытие диска!';
   end;
   Application.ProcessMessages;
   gauge1.progress:=70;
   gauge1.progress:=100;
   Button1.Enabled:=True;
   Button2.Enabled:=False;
   Button3.Enabled:=True;
   Button4.Enabled:=False;
   WriteIni('Крипто-контейнер','Уничтожение файла',IntToStr(1));
   WriteIni('Крипто-контейнер','Статус создание контейнера',IntToStr(0));
   ListBox1.Items.Add('Статус Контейнера - закрыт!');
   ListBox1.Items.Add('Крипто-контейнер - уничтожен!');
   StatusBar1.Panels[1].Text:='Статус Контейнера - уничтожен!';
   DriveComboBox1.Enabled:=True;
   Label3.Caption:='Нет Контейнера!';
   Label4.Caption:=IntToStr(0)+' байт.';
  end;
 if Exb=IDNO then
  begin
  if fileexists(disk+'.txt') then
   begin
     block.Free;
     block:=TFileStream.Create(disk+'.txt', fmOpenRead, fmShareDenyNone);
   end;
  end;
end;

procedure TCryptFile.CoolTrayIcon1Click(Sender: TObject);
begin
  TrimWorkingSet;
  CryptFile.Show;
end;

procedure TCryptFile.FormShow(Sender: TObject);
begin
with CryptFile do
     SetWindowPos(Handle,
     HWND_TOPMOST,
     Left,
     Top,
     Width,
     Height,
     SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
end;

procedure TCryptFile.chk1Click(Sender: TObject);
begin
  if chk1.Checked then begin
     s:=GroupBox3.Caption;
     GroupBox3.Caption:='Выберете диск:';
     DriveComboBox1.Enabled:=True;
  end else begin
     RegWriteStr(HKEY_CLASSES_ROOT,'CRF','CopyFile','0');
  end;
end;

procedure TCryptFile.DriveComboBox1Change(Sender: TObject);
begin
  DriveComboBox1.Enabled:=False;
  GroupBox3.Caption:=s;
  RegWriteStr(HKEY_CLASSES_ROOT,'CRF','CopyFile','1');
  RegWriteStr(HKEY_CLASSES_ROOT,'CRF','CopyFileDisk',DriveComboBox1.Drive);
end;

procedure TCryptFile.FormActivate(Sender: TObject);
begin
     CryptFile.Button1.Tag:=0;
     cf:=RegQueryStr(HKEY_CLASSES_ROOT,'CRF','CopyFile');
  if cf = '1' then begin
     chk1.Checked:=True;
     DriveComboBox1.Enabled:=False;
     cd:=RegQueryStr(HKEY_CLASSES_ROOT,'CRF','CopyFileDisk');
     cd:=cd+':\';
  if FileExists(cd+'sts.txt') then
     sz:=GetFileSize(cd+'sts.txt');
  if FileExists('C:\CRF\sts.txt') then
     sz1:=GetFileSize('C:\CRF\sts.txt');
  if sz < sz1 then begin
     copyf.Edit1.Text:='C:\CRF\sts.txt';
     copyf.Edit2.Text:=cd+'sts.txt';
     copyf.Show;
  end;
  end;
end;

end.

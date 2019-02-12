unit ProtEXE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, StdCtrls, acRW, ExtCtrls, DCPcrypt2,
  DCPblockciphers, DCPrijndael, DCPsha512;

type
  TPRE = class(TForm)
    GroupBox1: TGroupBox;
    Edit2: TEdit;
    Btn2: TButton;
    Save: TSaveDialog;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    Image1: TImage;
    Button1: TButton;
    Label2: TLabel;
    btn3: TButton;
    DCP_sha5121: TDCP_sha512;
    DCP_rijndael1: TDCP_rijndael;
    procedure Btn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PRE: TPRE;
  exeF: string;
  ms : TMemoryStream;
  rs : TResourceStream;
  m_DllDataSize : integer;
  mp_DllData : Pointer;
  KeyRelease:string = 'dj4lgmnitG4gggfdASEg45g4g3j7rK620N2YZYiX4 DT]'+
    '5rf7S/kMNm,n./OK/ilUN..u8h.H6fJFCj5DFNY6GMvbm,6FmTFMy6FMtfMy5fdN564BtErb'+
    '7gl7G,ubKTRF645djDRJ5Dmy76l8h;9J;9J;8hfUFCGcgD4f4SHxnYhb,nvnvchgFH5RUrfO'+
    'dskjhfpqo9s97hgBL7BL7bl7ghl7hGL87GLGl7l7glxdrgfcg58KHJghdfdrpPnbU'+
    'DJFDKSFghjyg;KH9bn6CRTXCx4hUGLB.8.nkVTJ6FJfjylk7gl7GLUHm'+
    'HG7gnkBk8jhKkKJHK87HkjkFGF6PCbV9KaK81WWYgP[CR[yjILWv2_SBE]AsLEz_8sBZ3LV5N'+
    'Go0NLL1om4 XbALjhgkk7sda823r23;d923NrUdkzPp5 DkJ2_8JvYmWFn LR3CRxyfswsto'+
    'cvnkscv78h2lk8HHKhlkjdfvsd;vlkvsd0vvds;ldvhyB[NXzl5y5Z';

implementation

uses stsp;

{$R *.dfm}

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

//Файл без расширения
function ExtractOnlyFileName(const FileName: string): string;
begin
  result:=StringReplace(ExtractFileName(FileName),ExtractFileExt(FileName),'',[]);
end;

function DigestToStr(Digest: array of byte): string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to 19 do
    Result := Result + LowerCase(IntToHex(Digest[i], 2));
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

procedure TPRE.Btn2Click(Sender: TObject);
var
  s,s1,s2,s3,s4,s5: string;
  st:TStringList;
  ms : TMemoryStream;
  rs : TResourceStream;
  m_DllDataSize : integer;
  mp_DllData : Pointer;
begin          //CRF.Edit1.Text
 if exeF = '' then exeF:=CRF.Edit1.Text;
    s:=ExtractFilePath(exeF);
    s1:=ExtractFileName(exeF);
    s3:=RegQueryStr(HKEY_CLASSES_ROOT,'CRF','FilePath');
 if s3 <> '' then begin
    s4:=ExtractFilePath(s3);
    s5:=ExtractFileName(s3);
 end;
 if ((s4+s5) = (s+s1)) and (s4+s5 <> '') then begin
    MessageBox(handle, PChar('Защита уже установлена на файл: '+ExtractFileName(s5)+#13#10+'Чтобы установить защиту на файл '+s1+' снимите защиту с файла: '+s5),'Внимание', MB_ICONINFORMATION or MB_OK);
    Btn3.Enabled:=false;
    Button1.Enabled:=false;
    Application.Terminate;
    Exit;
 end;
 if ((s4+s5) <> (s+s1)) and (s4+s5 <> '') then begin
    MessageBox(handle, PChar('Защита уже установлена на файл: '+ExtractFileName(s5)+#13#10+'Чтобы установить защиту на файл '+s1+' снимите защиту с файла: '+s5),'Внимание', MB_ICONINFORMATION or MB_OK);
    Btn3.Enabled:=false;
    Button1.Enabled:=false;
    Application.Terminate;
    Exit;
 end;
 if ExtractFileExt(exeF) = '.protect' then begin
    MessageBox(handle, PChar('Защита уже установлена на файл: '+ExtractFileName(exeF)),'Внимание', MB_ICONINFORMATION or MB_OK);
    Exit;
 end;
 if FileExists(s+s1+'.protect') then begin                                //CRF.Edit1
    MessageBox(handle, PChar('Защита уже установлена на файл: '+ExtractFileName(exeF)),'Внимание', MB_ICONINFORMATION or MB_OK);
    Exit;
 end;
 if not FileExists(pchar('C:\CRF\password.exe.Rijndael')) then
  begin
  if 0 <> FindResource(hInstance, 'Rijndael', 'exe') then
   begin
    rs := TResourceStream.Create(hInstance, 'Rijndael', 'exe');
    ms := TMemoryStream.Create;
    try
      ms.LoadFromStream(rs);
      ms.Position := 0;
      m_DllDataSize := ms.Size;
      mp_DllData := GetMemory(m_DllDataSize);
      ms.Read(mp_DllData^, m_DllDataSize);
      ms.SaveToFile(pchar('C:\CRF\password.exe.Rijndael'));
      FileSetHidden(pchar('C:\CRF\password.exe.Rijndael'),True);
    finally
      ms.Free;
      rs.Free;
    end;
   end;
  end else begin
  if FileExists(pchar('C:\CRF\password.exe.Rijndael')) then
   begin
     s:=ExtractOnlyFileName('C:\CRF\password.exe.Rijndael');
     DecryptFile('C:\CRF\password.exe.Rijndael','C:\CRF\'+s,KeyRelease);
     DeleteFile('C:\CRF\password.exe.Rijndael');
   end;
  end;
    s:=Trim(Edit1.Text);
    s1:=ExtractFilePath(exeF);
    s2:=ExtractFileName(exeF);
  if not FileExists(s1+'pass_'+s2+'.key') then begin
    st:=TStringList.Create;
    s:=EncryptString(Edit1.Text,KeyRelease);
    AppendStringToFile(exeF, s);
    st.Add(s);
    st.SaveToFile(s1+'pass_'+s2+'.key');
    st.Free;
    EncryptFile(PChar(s1+'pass_'+s2+'.key'),PChar(s1+'pass_'+s2+'.key'+'.protect_key'),KeyRelease);
    DeleteFile(PChar(s1+'pass_'+s2+'.key'));
  end else MessageBox(handle, PChar('Файл '+ExtractFileName(s1+'pass_'+s2+'.key.protect_key')+' - уже есть!'+#13#10+'Удалите или перенесите файл с паролем!'),'Внимание', MB_ICONINFORMATION or MB_OK);
  if FileExists(exeF) then begin
     RegWriteStr(HKEY_CLASSES_ROOT,'CRF','FilePath',exeF);
     RegWriteStr(HKEY_CLASSES_ROOT,'CRF','KeyF',s);
     EncryptFile(PChar(exeF),PChar(exeF+'.protect'),KeyRelease);
  if FileExists(pchar('C:\CRF\password.exe.Rijndael')) then
   begin
     s:=ExtractOnlyFileName('C:\CRF\password.exe.Rijndael');
     DecryptFile('C:\CRF\password.exe.Rijndael','C:\CRF\password.exe',KeyRelease);
     DeleteFile('C:\CRF\password.exe.Rijndael');
   end;
  if FileExists(pchar('C:\CRF\password.exe')) then
   begin
     CopyFile(PChar('C:\CRF\password.exe'), PChar(s1+'\password.exe'), False);
     FileSetHidden('C:\CRF\password.exe',False);
     DeleteFile('C:\CRF\password.exe');
     DeleteFile(PChar(exeF));     
   end;
     MessageBox(handle, PAnsiChar('Пароль успешно установлен на файл: '+ExtractFileName(exeF)), 'Пароль на Exe', 64);
     PRE.Close;
  end;
end;

procedure TPRE.Button1Click(Sender: TObject);
var
 i:integer;
const
 str='1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ';
 max=15;
begin
 Edit1.Text:='';
for i:=0 to max do
 begin
   Edit1.Text:=Edit1.Text+str[random(length(str))+1];
 end;
end;

procedure TPRE.FormCreate(Sender: TObject);
begin
  exeF:=CRF.Edit1.Text;
  if DebuggerPresent then Application.Terminate;
end;

procedure TPRE.btn3Click(Sender: TObject);
var
  s,s1,s2: string;
begin
   if exeF = '' then exeF:=CRF.Edit1.Text;
     s:=ExtractFilePath(exeF);
     s1:=ExtractFileName(exeF);
  if ExtractFileExt(exeF) = '.protect' then begin
     Btn2.Enabled:=false;
     Button1.Enabled:=false;
     s2:=ExtractOnlyFileName(exeF);
     FileSetHidden(PChar(exeF),False);
     DecryptFile(exeF,s2,KeyRelease);
  if FileExists(exeF) then DeleteFile(exeF);
  if FileExists(s+'password.exe') then DeleteFile(s+'password.exe');
  if FileExists('C:\CRF\password.exe.Rijndael') then DeleteFile('C:\CRF\password.exe.Rijndael');
  if FileExists('C:\CRF\password.exe') then DeleteFile('C:\CRF\password.exe');
  if FileExists(s+'pass_'+s2+'.key.protect_key') then DeleteFile(s+'pass_'+s2+'.key.protect_key');
     RegWriteStr(HKEY_CLASSES_ROOT,'CRF','FilePath','');
     RegWriteStr(HKEY_CLASSES_ROOT,'CRF','KeyF','');
     MessageBox(handle, PAnsiChar('Пароль успешно удален из файла: '+ExtractFileName(s2)), 'Внимание', 64);
     Application.Terminate;
     exit;
  end;
  if FileExists(exeF+'.protect') then begin
     s:=ExtractOnlyFileName(exeF+'.protect');
     FileSetHidden(PChar(exeF+'.protect'),False);
     DecryptFile(exeF+'.protect',s,KeyRelease);
  if FileExists(exeF+'.protect') then DeleteFile(exeF+'.protect');
  if FileExists(s+'pass_'+s1+'.key.protect_key') then DeleteFile(s+'pass_'+s1+'.key.protect_key');
     RegWriteStr(HKEY_CLASSES_ROOT,'CRF','FilePath','');
     RegWriteStr(HKEY_CLASSES_ROOT,'CRF','KeyF','');  
     MessageBox(handle, PAnsiChar('Пароль успешно удален из файла: '+ExtractFileName(exeF)), 'Внимание', 64);
     PRE.Close;
  end else begin
     Btn2.Enabled:=False;
     MessageBox(handle, PChar('Нет файла '+exeF+'.protect'+' для снятия пароля!'+#13#10+'Нет файла ключа: '+s+'pass_'+s1+'.key.protect_key'),'Внимание', MB_ICONINFORMATION or MB_OK);
  end;
end;

procedure TPRE.FormActivate(Sender: TObject);
var
  s1,s2: string;
  st:TStringList;
begin
with PRE do
     SetWindowPos(Handle,
     HWND_TOPMOST,
     Left,
     Top,
     Width,
     Height,
     SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
     s1:=ExtractFilePath(exeF);
     s2:=ExtractFileName(exeF);
  if FileExists(s1+'pass_'+s2+'.key.protect_key') then begin
     DecryptFile(s1+'pass_'+s2+'.key.protect_key',s1+'pass_'+s2+'.key',KeyRelease);
     st:=TStringList.Create;
     st.LoadFromFile(s1+'pass_'+s2+'.key');
     Edit1.Text:=st.Text;
     st.Free;
     DeleteFile(PChar(s1+'pass_'+s2+'.key'));
  end;
  exeF:=CRF.Edit1.Text;
  Edit1.SetFocus;
  if exeF <> '' then GroupBox2.Caption:='Пароль на файл: '+ExtractFileName(exeF);
end;

end.

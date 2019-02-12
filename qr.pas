unit qr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Forms, Dialogs, XQRCode, ExtCtrls,
  Controls,
  DCPrijndael,
  DCPsha512,
  ShellAPI, ShlObj,
  StdCtrls, Jpeg, ComCtrls;

type
  TQRC = class(TForm)
    edtText: TEdit;
    grp1: TGroupBox;
    lbledt1: TLabeledEdit;
    lbledt2: TLabeledEdit;
    lbledt3: TLabeledEdit;
    lbledt4: TLabeledEdit;
    lbledt5: TLabeledEdit;
    lbledt6: TLabeledEdit;
    lbledt7: TLabeledEdit;
    lbledt8: TLabeledEdit;
    lbledt9: TLabeledEdit;
    edtQuietZone: TLabeledEdit;
    lbledt11: TLabeledEdit;
    cmbEncoding: TComboBox;
    btnEncrypt: TButton;
    grp2: TGroupBox;
    Image1: TImage;
    btnDecrypt: TButton;
    edtQuietZone1: TLabeledEdit;
    dtp1: TDateTimePicker;
    win1: TLabel;
    ipc1: TEdit;
    ipc2: TEdit;
    win2: TLabel;
    win3: TLabel;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure cmbEncodingChange(Sender: TObject);
    procedure edtQuietZoneChange(Sender: TObject);
    procedure btnEncryptClick(Sender: TObject);
    procedure lbledt1Change(Sender: TObject);
    procedure lbledt2Change(Sender: TObject);
    procedure lbledt3Change(Sender: TObject);
    procedure lbledt4Change(Sender: TObject);
    procedure lbledt5Change(Sender: TObject);
    procedure lbledt6Change(Sender: TObject);
    procedure lbledt7Change(Sender: TObject);
    procedure lbledt8Change(Sender: TObject);
    procedure lbledt9Change(Sender: TObject);
    procedure BMP_To_JPEG();
    procedure JPEG_To_BMP();
    procedure FormActivate(Sender: TObject);
    procedure btnDecryptClick(Sender: TObject);
    procedure edtTextChange(Sender: TObject);
    procedure edtQuietZoneKeyPress(Sender: TObject; var Key: Char);
    procedure lbledt9KeyPress(Sender: TObject; var Key: Char);
    procedure dtp1Change(Sender: TObject);
    procedure ipc1KeyPress(Sender: TObject; var Key: Char);
    procedure ipc2KeyPress(Sender: TObject; var Key: Char);
  private
    QRCodeBitmap: TBitmap;
  public
    procedure upd;
    function MyQRCode(s: string): TBitmap;
  end;

const SIGNATURE = '[© itte.no]';

var
  QRC: TQRC;
  img: TBitMap;
  //==========KEY==========
  KeyRelease:string = 'DJFDKSFghjyg;KH9bn6CRTXCx4hUGLB.8.nkVTJ6FJfjylk7gl7GLUHm'+
                      'HG7gnkBk8jhKkKJHK87HkjkFGF6PCbV9KaK81WWYgP[CR[yjILWv2_SBE]AsLEz_8sBZ3LV5N'+
                      'HG7gnkBk8jhK3KJHK87HkjkFGF6PCbV9KaK81WWYgP[XR[yjILWv2_SBE]AsLEz_8sBZ3LV5N'+
                      'Go0NLL1om4;XbVLjhgkk7sda823r23;d923NrUdkzPp5/DkJ2_8JvYmWFn/LR3CRxyfswsto'+
                      'Go0NLL1om4 XbALjhgkk7sda823r23;d923NrYdkzPp5 DkJ2_8JvYmWFn LR3CRxyfswsto'+
                      'HG7gnkBk8jhKkKJHK87HkjkFGF6PCMV9KaK88WWYgP[CR[yjILWv2_SBE]AsLEz_8sBZ35V5N'+
                      'cvnkscv78h2lk8HHKhlkjdfvsd;vlkvSd0vvds;ldvhyB[NXzl5y5Z';

implementation

{$R *.dfm}

procedure TQRC.cmbEncodingChange(Sender: TObject);
begin
  upd;
  Update;
  lbledt11.Text:=cmbEncoding.Text;
  edtText.Text:=lbledt1.Text+' '
  +lbledt2.Text+' '
  +lbledt3.Text+' '
  +lbledt4.Text+' '
  +lbledt5.Text+' '
  +lbledt6.Text+' '
  +lbledt7.Text+' '
  +lbledt8.Text+' '
  +lbledt9.Text+' '
  +edtQuietZone.Text+' '
  +cmbEncoding.Text;
end;

procedure TQRC.edtQuietZoneChange(Sender: TObject);
begin
  edtText.Text:=lbledt1.Text+' '
  +lbledt2.Text+' '
  +lbledt3.Text+' '
  +lbledt4.Text+' '
  +lbledt5.Text+' '
  +lbledt6.Text+' '
  +lbledt7.Text+' '
  +lbledt8.Text+' '
  +lbledt9.Text+' '
  +edtQuietZone.Text;
end;

function EncS(Source, Password: string): string;
var
  DCP_rijndael1: TDCP_rijndael;
begin
  DCP_rijndael1 := TDCP_rijndael.Create(nil);   // создаём объект
  DCP_rijndael1.InitStr(Password, TDCP_sha512);    // инициализируем
  Result := DCP_rijndael1.EncryptString(Source); // шифруем
  DCP_rijndael1.Burn;                            // стираем инфо о ключе
  DCP_rijndael1.Free;                            // уничтожаем объект
end;

function DecS(Source, Password: string): string;
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

//Самоликвидация
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

//Удалить лишние пробелы в строке
function P(s: string): string;
var
  r: string;
begin
  Result := '';
  r := StringReplace(s, ' ', '', [rfReplaceAll]);
  Result := r;
end;

//Контрольная сумма для файла
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

//Процедура конветирования BMP в JPEG
procedure TQRC.BMP_To_JPEG();
var
 jpg:TJPEGImage;
 bmp:TBitmap;
begin
   try
    jpg:=TJPEGImage.Create;
    bmp:=TBitmap.Create;
    if not FileExists(ExtractFilePath(ParamStr(0))+'QRCode.bmp') then Exit;
    bmp.LoadFromFile(ExtractFilePath(ParamStr(0))+'QRCode.bmp');
    jpg.Assign(bmp);
    jpg.SaveToFile(ChangeFileExt(ExtractFilePath(ParamStr(0))+'QRCode.jpg','.jpg'));
    jpg.Free;
    FreeAndNil(bmp);
   except
    on e:Exception do
     begin
      jpg.Free;
      bmp.Free;
     end;
   end;
end;


//Процедура конветирования JPEG в BMP
procedure TQRC.JPEG_To_BMP();
var
 jpg:TJPEGImage;
 bmp:TBitmap;
begin
   try
    jpg:=TJPEGImage.Create;
    bmp:=TBitmap.Create;
    jpg.CompressionQuality:=100;
    jpg.Compress;
    if not FileExists(ExtractFilePath(ParamStr(0))+'QRCode.jpg') then Exit;
    jpg.LoadFromFile(ExtractFilePath(ParamStr(0))+'QRCode.jpg');
    bmp.Assign(jpg);
    bmp.SaveToFile(ChangeFileExt(ExtractFilePath(ParamStr(0))+'QRCode.bmp','.bmp'));
    FreeAndNil(jpg);
    FreeAndNil(bmp);
   except
    on e:Exception do
     begin
      FreeAndNil(jpg);
      FreeAndNil(bmp);
     end;
   end;
end;

function ExtractStegography(BMP: TBitmap; var Text: string; CheckingOnly: boolean = false): boolean;
var
  i,
  j: integer;
  Ch: Byte;
  PixSize: integer;
  PB    : pByte;
  Row   : pByteArray;
  BitCounter: integer;
  SigLength: integer;
begin
  Text:='';
  result:=false;
  SigLength:=Length(SIGNATURE);
  if not Assigned(BMP) then exit;
  with BMP do begin
    case PixelFormat of
      pf32bit: PixSize:=4;
      pf24bit: PixSize:=3;
      pf16bit: PixSize:=2;
      else
        MessageBox(Handle,'Cannot encrypt less than 16-bit color bmp''s !','ERROR',16);
    end;
    Ch:=0;
    BitCounter:=0;
    for i:=0 to Height-1 do begin
      Row:=ScanLine[i]; // Pointer to a buffer containing a horz line of pixels
      PB:=@Row[PixSize-1];
      for j:=0 to Width-1 do begin // One bit of encrypted data per per pixel !
        Ch:=Ch or ((PB^ and 1) shl BitCounter);
        if BitCounter = 7 then begin // Means we have read a full byte !
          if Ch <> 0 then begin // if the Character read is #0, we're at an end of data
            Text:=Text+Chr(Ch);
            if (Length(Text) = SigLength) then begin
              if Text = SIGNATURE then begin // it means it's a picture encrypted with this implementation
                result:=true;
              if QRC.btnDecrypt.Enabled then begin
                 QRC.btnEncrypt.Enabled:=False;
                 QRC.lbledt1.Enabled:=False;
                 QRC.lbledt2.Enabled:=False;
                 QRC.lbledt3.Enabled:=False;
                 QRC.lbledt4.Enabled:=False;
                 QRC.lbledt5.Enabled:=False;
                 QRC.lbledt6.Enabled:=False;
                 QRC.dtp1.Enabled:=False;
                 QRC.lbledt7.Enabled:=False;
                 QRC.lbledt8.Enabled:=False;
                 QRC.lbledt9.Enabled:=False;
                 QRC.edtQuietZone.Enabled:=False;
                 QRC.lbledt11.Enabled:=False;
                 QRC.cmbEncoding.Enabled:=False;
              end;
                Text:=''; // But we don't want that string to be returned. *Now* real data is following
              end;
              if CheckingOnly then begin // If it's a check, we don't want to read it all !
                Text:='';
                exit;
              end;
            end;
          end
          else if (i + j) > 0 then // Ch = #0 and it's *not* the very first pixel data !
          exit;
          Ch:=0;
          BitCounter:=0; // reset bit counter
        end
        else
        inc(BitCounter); //read next bit
        inc(PB, PixSize);
      end;
    end;
  end;
end;

// SIGNATURE + Meaage

procedure InsertStegography(BMP: TBitmap; Message: string);
var
  i, j  : integer;
  row   :  pByteArray;
  PB    : pByte;
  NextCh: PChar;
  PixSize: integer;
  BytesToGo: integer;
  BitCounter: integer;
begin
  if not Assigned(BMP) then exit;
  Message:=SIGNATURE+Message;
  BytesToGo:=Length(Message)+2; // We get an extra #0 at the end of the string when cast as PChar
  with BMP do begin
    case PixelFormat of
      pf32bit: PixSize:=4;
      pf24bit: PixSize:=3;
      pf16bit: PixSize:=2;
      else MessageBox(Handle,'Cannot encrypt less than 16-bit color bmp''s !','ERROR',16);
    end;
    if (Width*Height) div PixSize < BytesTogo then
    MessageBox(Handle,PAnsiChar('Too long string to encrypt (Max: '+IntToStr((Width*Height) div PixSize)+', Actual: '+IntToStr(BytesTogo)+')'),'ERROR',16);
    NextCh:=@Message[1]; // Set String pointer to first character
    BitCounter:=0;
    for i:=0 to Height-1 do begin
      Row:=ScanLine[i];
      PB:=@Row[PixSize-1];
      for j:=0 to Width-1 do begin
        PB^:=(PB^ and $FE) // We want the upper 7 bits of the byte to be unchanged
             or ((Ord(NextCh^) shr BitCounter) and 1); // and add an extra 0/1 to store 1/8 of a char value
        if (BitCounter = 7) then begin // We've written a full Char
          inc(NextCh); // Place PChar on next char in data string
          dec(BytesToGo); // dec number of bytes left
          BitCounter:=0; // and reset bit counter (=bit "index")
        end
        else inc(BitCounter);
        if BytesToGo = 0 then exit;
        inc(PB, PixSize); // Move BMP buffer pointer
      end;
    end;
  end;
end;

procedure TQRC.FormCreate(Sender: TObject);
var
  Tmp: string;
begin
  //=====Защита от отладчика===========
  if DebuggerPresent then begin
  if SelfDelete then halt(1);
     Exit;
  end;
     dtp1.DateTime:=Now;
  if FileExists(ExtractFilePath(ParamStr(0))+'QRCode.bmp') then begin
     Image1.Picture.Bitmap.LoadFromFile(ExtractFilePath(ParamStr(0))+'QRCode.bmp');
     grp2.Caption:='Просмотр QRCode: (Max. message size: '+IntToStr((Image1.Picture.Width*Image1.Picture.Height div 8) - Length(Signature))+')';
     btnEncrypt.Enabled:=Assigned(Image1.Picture.Bitmap);
     btnDecrypt.Enabled:=ExtractStegography(Image1.Picture.Bitmap, Tmp, true);
     grp2.Enabled:=Assigned(Image1.Picture);
     exit;
  end;
  if FileExists(ExtractFilePath(ParamStr(0))+'QRCode.jpg') then begin
     JPEG_To_BMP();
     Image1.Picture.Bitmap.LoadFromFile(ExtractFilePath(ParamStr(0))+'QRCode.bmp');
     grp2.Caption:='Просмотр QRCode: (Max. message size: '+IntToStr((Image1.Picture.Width*Image1.Picture.Height div 8) - Length(Signature))+')';
     btnDecrypt.Enabled:=ExtractStegography(Image1.Picture.Bitmap, Tmp, true);
     btnEncrypt.Enabled:=Assigned(Image1.Picture);
     grp2.Enabled:=Assigned(Image1.Picture);
  if FileExists(ExtractFilePath(ParamStr(0))+'QRCode.jpg') then DelDir(ExtractFilePath(ParamStr(0))+'QRCode.jpg');
  end else begin
     QRCodeBitmap := TBitmap.Create;
     upd;
  end;
end;

procedure TQRC.FormDestroy(Sender: TObject);
begin
  QRCodeBitmap.Free;
end;

procedure TQRC.PaintBox1Paint(Sender: TObject);
var
  Scale: Double;
begin
  Image1.Canvas.Brush.Color := clWhite;
  Image1.Canvas.FillRect(Rect(0, 0, Image1.Width, Image1.Height));
  if ((QRCodeBitmap.Width > 0) and (QRCodeBitmap.Height > 0)) then
  begin
    if (Image1.Width < Image1.Height) then
    begin
      Scale := Image1.Width / QRCodeBitmap.Width;
    end else
    begin
      Scale := Image1.Height / QRCodeBitmap.Height;
    end;
    Image1.Canvas.StretchDraw(Rect(0, 0, Trunc(Scale * QRCodeBitmap.Width), Trunc(Scale * QRCodeBitmap.Height)), QRCodeBitmap);
  end;
end;

function TQRC.MyQRCode(s: string): TBitmap;
var
  QRCode: TXQRCode;
  QRCodeBitmap: TBitmap;
  Row, Column: Integer;
begin
  QRCode := TXQRCode.Create;
  QRCodeBitmap := TBitmap.Create;
  result := TBitmap.Create; // создание самого объекта
  try
    QRCode.Data := s;
    QRCode.Encoding  := TQRCodeEncoding(cmbEncoding.ItemIndex);
    QRCode.QuietZone := StrToIntDef(edtQuietZone.Text, 4);
    QRCodeBitmap.Width:=QRCode.Rows;
    QRCodeBitmap.Height:=QRCode.Columns;
    for Row := 0 to QRCode.Rows - 1 do
    begin
      for Column := 0 to QRCode.Columns - 1 do
      begin
        if (QRCode.IsBlack[Row, Column]) then
        begin
          QRCodeBitmap.Canvas.Pixels[Column, Row] := clBlack;
        end
        else
        begin
          QRCodeBitmap.Canvas.Pixels[Column, Row] := clWhite;
        end;
      end;
    end;   
    Result.Assign(QRCodeBitmap);
  finally
    QRCodeBitmap.Free;
    QRCode.Free;
  end;
end;

procedure TQRC.upd;
begin
  img := MyQRCode(edtText.Text);
  Image1.Picture.Bitmap.Assign(img);
  img.Free; //разрушаем объект созданный в функии
end;


procedure TQRC.btnEncryptClick(Sender: TObject);
var
 SaveJpeg: TJpegImage;
 BitMap : TBitMap;
begin
  SaveJpeg := TjpegImage.Create;
  BitMap := TBitMap.Create;
  if (ipc1.Text = '') or (ipc2.Text = '') then Exit;
  BitMap.Width := StrToInt(ipc1.Text); // Ставиш размеры желаймой картинки Ширина
  BitMap.Height := StrToInt(ipc2.Text); // Ставиш размеры желаймой картинки Высота
  BitMap.Canvas.CopyRect(BitMap.Canvas.ClipRect,Image1.Canvas,Image1.Canvas.ClipRect);
  SaveJpeg.Assign(BitMap);
  SaveJpeg.CompressionQuality := 100; // От этого значения тоже зависит вес, но и качество
  SaveJpeg.PixelFormat := jf24Bit;
  SaveJpeg.Compress;
  SaveJpeg.SaveToFile(ExtractFilePath(ParamStr(0))+'QRCode.jpg');
  BitMap.Free;
  SaveJpeg.Free;
  JPEG_To_BMP();
  if FileExists(ExtractFilePath(ParamStr(0))+'QRCode.jpg') then DelDir(ExtractFilePath(ParamStr(0))+'QRCode.jpg');
  if FileExists(ExtractFilePath(ParamStr(0))+'QRCode.bmp') then begin
  edtQuietZone1.Text:=IntToStr(GetCheckSum(ExtractFilePath(ParamStr(0))+'QRCode.bmp'));
  lbledt11.Text:=P(cmbEncoding.Text);
  edtText.Text:=P(lbledt1.Text)+' '
  +P(lbledt2.Text)+' '
  +P(lbledt3.Text)+' '
  +P(lbledt4.Text)+' '
  +P(lbledt5.Text)+' '
  +P(lbledt6.Text)+' '
  +P(lbledt7.Text)+' '
  +P(lbledt8.Text)+' '
  +P(lbledt9.Text)+' '
  +P(edtQuietZone.Text)+' '
  +P(lbledt11.Text)+' '
  +P(cmbEncoding.Text)+' '
  +P(edtQuietZone1.Text);
  end;
  btnEncrypt.Enabled:=False;
  edtText.Text:=EncS(edtText.Text,KeyRelease);
  Image1.Picture.Bitmap.LoadFromFile(ExtractFilePath(ParamStr(0))+'QRCode.bmp');
  InsertStegography(Image1.Picture.Bitmap, SIGNATURE+Trim(edtText.Text));
  Image1.Picture.Bitmap.SaveToFile(ExtractFilePath(ParamStr(0))+'QRCode.bmp');
  if btnEncrypt.Enabled = False then begin
     btnDecrypt.Enabled:=True;
  end;
end;

procedure TQRC.lbledt1Change(Sender: TObject);
begin
  edtText.Text:=P(lbledt1.Text);
  upd;
end;

procedure TQRC.lbledt2Change(Sender: TObject);
begin
  edtText.Text:=P(lbledt1.Text)+' '+P(lbledt2.Text);
  upd;
end;

procedure TQRC.lbledt3Change(Sender: TObject);
begin
  edtText.Text:=P(lbledt1.Text)+' '+P(lbledt2.Text)+' '+P(lbledt3.Text);
  upd;
end;

procedure TQRC.lbledt4Change(Sender: TObject);
begin
  edtText.Text:=P(lbledt1.Text)+' '+P(lbledt2.Text)+' '+P(lbledt3.Text)+' '+P(lbledt4.Text);
  upd;
end;

procedure TQRC.lbledt5Change(Sender: TObject);
begin
  edtText.Text:=P(lbledt1.Text)+' '+P(lbledt2.Text)+' '+P(lbledt3.Text)+' '+P(lbledt4.Text)+' '+P(lbledt5.Text);
  upd;
end;

procedure TQRC.lbledt6Change(Sender: TObject);
begin
  edtText.Text:=P(lbledt1.Text)+' '
  +P(lbledt2.Text)+' '
  +P(lbledt3.Text)+' '
  +P(lbledt4.Text)+' '
  +P(lbledt5.Text)+' '
  +P(lbledt6.Text);
  upd;
end;

procedure TQRC.lbledt7Change(Sender: TObject);
begin
  edtText.Text:=P(lbledt1.Text)+' '
  +P(lbledt2.Text)+' '
  +P(lbledt3.Text)+' '
  +P(lbledt4.Text)+' '
  +P(lbledt5.Text)+' '
  +P(lbledt6.Text)+' '
  +P(lbledt7.Text);
  upd;
end;

procedure TQRC.lbledt8Change(Sender: TObject);
begin
  edtText.Text:=P(lbledt1.Text)+' '
  +P(lbledt2.Text)+' '
  +P(lbledt3.Text)+' '
  +P(lbledt4.Text)+' '
  +P(lbledt5.Text)+' '
  +P(lbledt6.Text)+' '
  +P(lbledt7.Text)+' '
  +P(lbledt8.Text);
  upd;
end;

procedure TQRC.lbledt9Change(Sender: TObject);
begin
  edtText.Text:=P(lbledt1.Text)+' '
  +P(lbledt2.Text)+' '
  +P(lbledt3.Text)+' '
  +P(lbledt4.Text)+' '
  +P(lbledt5.Text)+' '
  +P(lbledt6.Text)+' '
  +P(lbledt7.Text)+' '
  +P(lbledt8.Text)+' '
  +P(lbledt9.Text);
  upd;
end;

procedure TQRC.FormActivate(Sender: TObject);
begin
with QRC do
     SetWindowPos(Handle,
     HWND_TOPMOST,
     Left,
     Top,
     Width,
     Height,
     SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
end;

procedure TQRC.btnDecryptClick(Sender: TObject);
var
  Tmp: string;
  p : TStringList;
begin
  if ExtractStegography(Image1.Picture.Bitmap, Tmp) then begin
     edtText.Text:=Tmp;
     edtText.Text:=DecS(edtText.Text,KeyRelease);
     p:=TStringList.Create;
     ExtractStrings([' '],[' '],PChar(edtText.Text),p);
     lbledt1.Text:=p[0];
     lbledt2.Text:=p[1];
     lbledt3.Text:=p[2];
     lbledt4.Text:=p[3];
     lbledt5.Text:=p[4];
     lbledt6.Text:=p[5];
     lbledt7.Text:=p[6];
     lbledt8.Text:=p[7];
     lbledt9.Text:=p[8];
     edtQuietZone.Text:=p[9];
     if Copy(p[10],1,4) = 'Auto' then lbledt11.Text:='Auto';
     if Copy(p[10],1,7) = 'Numeric' then lbledt11.Text:='Numeric';
     if Copy(p[10],1,12) = 'Alphanumeric' then lbledt11.Text:='Alphanumeric';
     if Copy(p[10],1,10) = 'ISO-8859-1' then lbledt11.Text:='ISO-8859-1';
     if Copy(p[10],1,15) = 'UTF-8withoutBOM' then lbledt11.Text:='UTF-8 without BOM';
     if Copy(p[10],1,12) = 'UTF-8withBOM' then lbledt11.Text:='UTF-8 with BOM';
     edtQuietZone1.Text:=p[12];
     p.Free;
     dtp1.Date:=StrToDate(lbledt6.Text);
     cmbEncoding.ItemIndex:=cmbEncoding.Items.IndexOf(lbledt11.Text);
     upd;
  end;
  if btnDecrypt.Enabled then begin
     btnDecrypt.Enabled:=False;
     btnEncrypt.Enabled:=True;
     lbledt1.Enabled:=True;
     lbledt2.Enabled:=True;
     lbledt3.Enabled:=True;
     lbledt4.Enabled:=True;
     lbledt5.Enabled:=True;
     lbledt6.Enabled:=True;
     dtp1.Enabled:=True;
     lbledt7.Enabled:=True;
     lbledt8.Enabled:=True;
     lbledt9.Enabled:=True;
     edtQuietZone.Enabled:=True;
     lbledt11.Enabled:=True;
     cmbEncoding.Enabled:=True;
  end;
end;

procedure TQRC.edtTextChange(Sender: TObject);
begin
   grp2.Caption:='Просмотр QRCode: (Count. Message Size: '+inttostr(length(edtText.text))+')';   // длина текста в мемо
end;

procedure TQRC.edtQuietZoneKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['1', '1'..'4']) then Key:= #0;
if Length(Key) = 1 then edtQuietZone.Text:='';
end;

procedure TQRC.lbledt9KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0', '1'..'9']) then Key:= #0;
if Length(lbledt9.Text) > 9 then lbledt9.Text:='';
end;

procedure TQRC.dtp1Change(Sender: TObject);
begin
  lbledt6.Text:=DateToStr(dtp1.Date);
end;

procedure TQRC.ipc1KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0', '1'..'9']) then Key:= #0;
if Length(ipc1.Text) > 2 then ipc1.Text:='';
end;

procedure TQRC.ipc2KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0', '1'..'9']) then Key:= #0;
if Length(ipc2.Text) > 2 then ipc2.Text:='';
end;

end.

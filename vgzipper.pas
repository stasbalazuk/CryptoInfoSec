unit vgzipper;

interface

uses SysUtils, Classes, ZLib;

const
  ERR_OK         = 0;
  ERR_FILES      = 1;
  ERR_NO_FILES   = 2;
  ERR_CREATE_ARC = 3;
  ERR_NO_ARCHIVE = 4;
  ERR_BAD_ARCHIVE= 5;
  ERR_BAD_DATA   = 6;

function PackDir(ArcName, Path: string; OnWork: TNotifyEvent = nil): byte;
{* ���������� ������� �� ����� �������������.
   �� ����� ��� ������������ ������-���������� � ���� � ��������.
   OnWork - ������������. ����������� � �������� ���������. }
function UnPackDir(ArcName, Path: string; OnWork: TNotifyEvent = nil): byte;
{* ����������� �������.
   �� ����� ��� ������-���������� � ���� � ��������, ���� ����������� �����.
   OnWork - ������������. ����������� � �������� ����������. }
function ArcErrorText(code: byte): string;
{* ���������� ����� ������ }

implementation

uses FileCript;

const signature = 'STS'; // ���������. ���� VingradGZip.

function ArcErrorText(code: byte): string;
begin
  case code of
    ERR_OK:          result := '������';
    ERR_FILES:       result := '�� ��� ����� ��������';
    ERR_NO_FILES:    result := '��� ������ ��� ������';
    ERR_CREATE_ARC:  result := '������ �������� ����� ������-����������';
    ERR_NO_ARCHIVE:  result := '������-��������� �� ������ ��� ����������';
    ERR_BAD_ARCHIVE: result := '���� �� �������� ������-�����������';
    ERR_BAD_DATA:    result := '������-��������� ���������';
    else result := '';
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

//������ ������
function PackDir(ArcName, Path: string; OnWork: TNotifyEvent = nil): byte;
var
  fs: TFileStream;
  cs: TCompressionStream;

function FilesScan(Dir: string): byte;
var
  sr: TSearchRec;
  s:  string;
  ln: byte;
  sz: int64;
  fs: TFileStream;
begin
  result := ERR_OK;
  if FindFirst(Dir + '*.*', faAnyFile, sr) = 0 then
  begin
    repeat
      if sr.Name[1] <> '.' then begin
        if sr.Attr and faDirectory = faDirectory then
        begin
          ln := FilesScan(Dir + sr.Name + '\');
          if result = ERR_OK then result := ln;
        end else
        if (sr.Attr and faDirectory) <> faDirectory then
        begin
          s := sr.Name;
          CryptFile.Memo1.Lines.Add('������ ������: '+s);
          CryptFile.StatusBar1.Panels[2].Text:='������ �����: - '+IntToStr(sr.Size)+' ����';
          s := Dir + sr.Name;
          try
            fs := TFileStream.Create(s, fmOpenRead or fmShareDenyWrite);
            s := copy(s, Length(path)+1, Length(s));
            ln := Length(s);
            cs.Write(ln, 1);
            cs.Write(s[1], ln);
            sz := fs.Size;
            cs.Write(sz, SizeOf(sz));
            cs.CopyFrom(fs, sz);
            fs.Free;
          except
            result := ERR_FILES;
          end;
        end;
      end;
      until FindNext(sr) <> 0;
            FindClose(sr);
  end else result := ERR_NO_FILES;
end;

begin
  if Path[Length(Path)] <> '\' then Path := Path + '\';
  try
    fs := TFileStream.Create(ArcName, fmCreate or fmShareDenyWrite);
    fs.Write(signature[1], Length(signature));
  except
    result := ERR_CREATE_ARC;
    Exit;
  end;
  cs := TCompressionStream.Create(clMax, fs);
  if Assigned(OnWork) then cs.OnProgress := OnWork;
  result := FilesScan(Path);
  cs.Free; fs.Free;
end;

//������������� ������
function UnPackDir(ArcName, Path: string; OnWork: TNotifyEvent = nil): byte;
var
  fs,ts: TFileStream;
  ds:    TDecompressionStream;
  s:     string;
  ln:    byte;
  sz:    int64;
begin
  if Path[Length(Path)]<>'\' then Path := Path + '\';
  result := ERR_OK;
  try
    fs := TFileStream.Create(ArcName, fmOpenRead or fmShareDenyWrite);
  except
    result := ERR_NO_ARCHIVE;
    Exit;
  end;
  SetLength(s, Length(signature));
  fs.Read(s[1], Length(signature));
  ds := TDecompressionStream.Create(fs);
  if Assigned(OnWork) then ds.OnProgress := OnWork;
  if s <> signature then result := ERR_BAD_ARCHIVE
  else while (result=ERR_OK) do
   begin
    ln := 0; ds.Read(ln, SizeOf(ln));
    if ln = 0 then Break;
    SetLength(s, ln);
    ds.Read(s[1], ln);
    CryptFile.Memo1.Lines.Add('������������� ������: '+s);
    s := Path + s;
    try
      ForceDirectories(ExtractFilePath(s));
      ts := TFileStream.Create(s, fmCreate or fmShareDenyWrite);
      ds.Read(sz, SizeOf(sz));
      if sz > 0 then ts.CopyFrom(ds, sz);
      ts.Free;
    except
      result := ERR_BAD_DATA;
    end;
  end;
  fs.Free;
end;

end.
unit BMPS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtDlgs, Buttons, StdCtrls, ExtCtrls;

type
  TStegoBMP = class(TForm)
    Image1: TImage;
    btnEncrypt: TButton;
    mmMessage: TMemo;
    Label2: TLabel;
    btnDecrypt: TButton;
    btnLoadImage: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    SavePictureDialog1: TSavePictureDialog;
    Label1: TLabel;
    lbl1: TLabel;
    procedure btnLoadImageClick(Sender: TObject);
    procedure btnEncryptClick(Sender: TObject);
    procedure btnDecryptClick(Sender: TObject);
    procedure mmMessageChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StegoBMP: TStegoBMP;

implementation

{$R *.DFM}

  const SIGNATURE = '[© itte.no]';


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
        raise Exception.Create('Cannot encrypt less than 16-bit color bmp''s !');
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
      else
        raise Exception.Create('Cannot encrypt less than 16-bit color bmp''s !');
    end;
    if (Width*Height) div PixSize < BytesTogo then
      raise Exception.CreateFmt('Too long string to encrypt (Max: %d, Actual: %d)', [(Width*Height) div PixSize, BytesToGo]);
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
        else
          inc(BitCounter);
        if BytesToGo = 0 then exit;

        inc(PB, PixSize); // Move BMP buffer pointer
      end;
    end;
  end;
end;

procedure TStegoBMP.btnLoadImageClick(Sender: TObject);
var
  Tmp: string;
begin
  if OpenPictureDialog1.Execute then begin
    Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    Label1.Caption:='(Max. message size: '+IntToStr((Image1.Picture.Width*Image1.Picture.Height div 8) - Length(Signature))+')';
  end;
  btnDecrypt.Enabled:=ExtractStegography(Image1.Picture.Bitmap, Tmp, true);
  btnEncrypt.Enabled:=Assigned(Image1.Picture);
  Label1.Enabled:=Assigned(Image1.Picture);
end;

procedure TStegoBMP.btnEncryptClick(Sender: TObject);
begin
  InsertStegography(Image1.Picture.Bitmap, SIGNATURE+Trim(mmMessage.Text));
  if SavePictureDialog1.Execute then
     Image1.Picture.SaveToFile(SavePictureDialog1.FileName);
end;

procedure TStegoBMP.btnDecryptClick(Sender: TObject);
var
  Tmp: string;
begin
  if ExtractStegography(Image1.Picture.Bitmap, Tmp) then
     mmMessage.Text:=Tmp;
end;

procedure TStegoBMP.mmMessageChange(Sender: TObject);
begin
   lbl1.Caption:='(Count. Message Size: '+inttostr(length(mmMessage.text))+')';   // длина текста в мемо
end;

procedure TStegoBMP.FormActivate(Sender: TObject);
begin
with StegoBMP do
     SetWindowPos(Handle,
     HWND_TOPMOST,
     Left,
     Top,
     Width,
     Height,
     SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
end;

end.

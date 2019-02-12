unit hash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, CheckLst, DCPtiger, DCPsha512, DCPsha256,
  DCPsha1, DCPripemd160, DCPripemd128, DCPmd5, DCPmd4, DCPcrypt2, DCPhaval;

type
  Tfhash = class(TForm)
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
    grpInputFile: TGroupBox;
    boxInputFile: TEdit;
    grpHashes: TGroupBox;
    lstHashes: TCheckListBox;
    grpOutput: TGroupBox;
    txtOutput: TMemo;
    btnBrowseFiles: TSpeedButton;
    dlgOpen: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure btnBrowseFilesClick(Sender: TObject);
    procedure lstHashesClickCheck(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fhash: Tfhash;

implementation

uses stsp;

{$R *.dfm}

procedure Tfhash.FormCreate(Sender: TObject);
var
  i: integer;
  Hash: TDCP_hash;
begin
  ClientHeight := 416;
  ClientWidth := 408;
  // find all the hash algorithms on the form
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TDCP_hash then
    begin
      Hash := TDCP_hash(Components[i]);
      lstHashes.Items.AddObject(Hash.Algorithm + ' (Размер: ' + IntToStr(Hash.HashSize) + ' бит)',Components[i]);
    end;
  end;
  boxInputFile.Text:=CRF.Edit1.Text;
end;

procedure Tfhash.btnBrowseFilesClick(Sender: TObject);
begin
  if dlgOpen.Execute then
    boxInputFile.Text := dlgOpen.FileName;
end;

procedure Tfhash.lstHashesClickCheck(Sender: TObject);
var
  Hashes: array of TDCP_hash;
  HashDigest: array of byte;
  i, j, read: integer;
  s: string;
  buffer: array[0..16383] of byte;
  strmInput: TFileStream;
begin
  txtOutput.Clear;
  if not FileExists(boxInputFile.Text) then
  begin
    MessageDlg('Файл не существует',mtInformation,[mbOK],0);
    Exit;
  end;
  Hashes := nil;
  // make a list of all the hash algorithms to use
  for i := 0 to lstHashes.Items.Count - 1 do
  begin
    if lstHashes.Checked[i] then
    begin
      // yes I know this is inefficient but it's also easy ;-)
      SetLength(Hashes,Length(Hashes) + 1);
      Hashes[Length(Hashes) - 1] := TDCP_hash(lstHashes.Items.Objects[i]);
      TDCP_hash(lstHashes.Items.Objects[i]).Init;
    end;
  end;
  strmInput := nil;
  try
    strmInput := TFileStream.Create(boxInputFile.Text,fmOpenRead);
    repeat
      // read into the buffer
      read := strmInput.Read(buffer,Sizeof(buffer));
      // hash the buffer with each of the selected hashes
      for i := 0 to Length(Hashes) - 1 do
        Hashes[i].Update(buffer,read);
    until read <> Sizeof(buffer);
    strmInput.Free;
    // iterate through the selected hashes
    for i := 0 to Length(Hashes) - 1 do
    begin
      SetLength(HashDigest,Hashes[i].HashSize div 8);
      Hashes[i].Final(HashDigest[0]);  // get the output
      s := '';
      for j := 0 to Length(HashDigest) - 1 do  // convert it into a hex string
        s := s + IntToHex(HashDigest[j],2);
      txtOutput.Lines.Add(Hashes[i].Algorithm + ': ' + s);
    end;
  except
    strmInput.Free;
    MessageDlg('Произошла ошибка при чтении файла',mtError,[mbOK],0);
  end;
end;

procedure Tfhash.FormActivate(Sender: TObject);
begin
with fhash do
     SetWindowPos(Handle,
     HWND_TOPMOST,
     Left,
     Top,
     Width,
     Height,
     SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
end;

end.

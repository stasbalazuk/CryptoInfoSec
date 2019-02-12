unit cez;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, XPMan, ActnList, Menus, ClipBrd, Buttons;

type
  Tcz = class(TForm)
    pnlBottom: TPanel;
    pnlKey: TPanel;
    GrBoxInput: TGroupBox;
    GrBoxOutPut: TGroupBox;
    memoInput: TMemo;
    memoOutput: TMemo;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    MainMenu1: TMainMenu;
    mmiFile: TMenuItem;
    mmiExit: TMenuItem;
    mmiSep2: TMenuItem;
    mmiLoad: TMenuItem;
    mmiSave: TMenuItem;
    mmiSep1: TMenuItem;
    mmiRun: TMenuItem;
    actExit: TAction;
    actLoad: TAction;
    actSave: TAction;
    actRun: TAction;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    edtKey: TLabeledEdit;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    procedure actExitExecute(Sender: TObject);
    procedure actLoadExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actRunExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actSaveUpdate(Sender: TObject);
    procedure actRunUpdate(Sender: TObject);
    procedure edtKeyKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1Click(Sender: TObject);
    procedure memoInputChange(Sender: TObject);
    procedure memoInputKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  end;

var
  cz: Tcz;

implementation

{$R *.dfm}

procedure Tcz.actExitExecute(Sender: TObject);
begin
  Close;
end;

procedure Tcz.actLoadExecute(Sender: TObject);
begin
  if OpenDialog1.Execute then
    memoInput.Lines.LoadFromFile(OpenDialog1.FileName);
end;

procedure Tcz.actRunExecute(Sender: TObject);
var i, j, n, fl, pw: integer;
    ch: Char;
    stKey: string;
    flag: Boolean;
begin
  memoOutput.Text := '';
  //stKey := edtKey.Text;
  stKey := IntToStr(3);
  j := 1; fl := 0; pw := 0;
  for i := 1 to Length(memoInput.Text) do
  begin
    ch := memoInput.Text[i];
    flag := false;
    if ch in ['0'..'9'] then
    begin
      flag := true;
      fl := Ord('0'); pw := 13;
    end;
    if ch in ['!','@','#','$','%','^','&','*','(',')','_','-','+','=','~','/','\',':',';','"','|',',','.','?','<','>'] then
    begin
      flag := true;
      fl := Ord('!'); pw := 26;
    end;
    if ch in ['%'] then
    begin
      flag := true;
      fl := Ord('@'); pw := 26;
    end;
    if ch in ['a'..'z'] then
    begin
      flag := true;
      fl := Ord('a'); pw := 26;
    end;
    if ch in ['A'..'Z'] then
    begin
      flag := true;
      fl := Ord('A'); pw := 26;
    end;
    if ch in ['а'..'я'] then
    begin
      flag := true;
      fl := Ord('а'); pw := 32;
    end;
    if ch in ['А'..'Я'] then
    begin
      flag := true;
      fl := Ord('А'); pw := 32;
    end;
    if flag then
    begin
      if CheckBox1.Checked then
        n := (ORD(ch) - fl - ORD(stKey[j])+ 10*pw) mod pw + fl
      else
        n := (ORD(ch) - fl + ORD(stKey[j])) mod pw + fl;
      ch := Chr(n);
      Inc(j);
      if j > Length(stKey) then j := 1;
    end;
    memoOutput.Text := memoOutput.Text + ch;
  end;
    Clipboard.AsText:=memoOutput.Text;
end;

procedure Tcz.actRunUpdate(Sender: TObject);
begin
  actRun.Enabled := ((TRIM(memoInput.Text) <> '') AND (edtKey.Text <> ''));
end;

procedure Tcz.actSaveExecute(Sender: TObject);
begin
  if SaveDialog1.Execute then
    memoOutput.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure Tcz.actSaveUpdate(Sender: TObject);
begin
  actSave.Enabled := memoOutput.Text <>'';
end;

procedure Tcz.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
    actRun.Caption := 'Расшифровать'
  else
    actRun.Caption := 'Зашифровать';
end;

procedure Tcz.edtKeyKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    actRun.Execute;
end;

procedure Tcz.FormCreate(Sender: TObject);
begin
  memoInput.Text:='';
  memoOutput.Text:='';
end;

procedure Tcz.FormResize(Sender: TObject);
begin
  GrBoxInput.Height := (ClientHeight - pnlKey.Height - StatusBar1.Height) div 2;
end;

procedure Tcz.memoInputChange(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := IntToStr(Length(memoInput.Text)) + ' символов';
  StatusBar1.Panels[1].Text := 'Текст скопирован в буфер обмена!';
end;

procedure Tcz.memoInputKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Key = VkKeyScan('a')) or (Key = VkKeyScan('ф'))) and (ssCtrl in Shift) then
    (Sender as TMemo).SelectAll;
end;

procedure Tcz.FormActivate(Sender: TObject);
begin
with cz do
     SetWindowPos(Handle,
     HWND_TOPMOST,
     Left,
     Top,
     Width,
     Height,
     SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
end;

end.

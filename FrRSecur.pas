unit FrRSecur;

interface
{$I DEFINE.INC}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, NTCommon, AbstrSec, RegSecur, ExtCtrls, FrRBrows,
  ImgList, DetectWinOs;

type
  TFrmRegSecurity = class(TForm)
    Label1: TLabel;
    cmbComputer: TComboBox;
    Label2: TLabel;
    cmbRootKey: TComboBox;
    Label3: TLabel;
    edtRegistryPath: TEdit;
    btnBrowse: TButton;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    pclAccess: TPageControl;
    tbsAccessList: TTabSheet;
    pnlAccess: TPanel;
    gbxPermissions: TGroupBox;
    cbxKamQueryValue: TCheckBox;
    cbxKamSetValue: TCheckBox;
    cbxKamCreateSubKey: TCheckBox;
    cbxKamEnumSubKey: TCheckBox;
    cbxKamNotify: TCheckBox;
    cbxKamCreateLink: TCheckBox;
    cbxKamDelete: TCheckBox;
    cbxKamWriteDAC: TCheckBox;
    cbxKamWriteOwner: TCheckBox;
    cbxKamReadControl: TCheckBox;
    rbxFullPermission: TRadioButton;
    rbnOther: TRadioButton;
    lvUsers: TListView;
    grbFlags: TGroupBox;
    cbxObjectInherit: TCheckBox;
    cbxContainer: TCheckBox;
    cbxInheritOnly: TCheckBox;
    cbxNoPropogate: TCheckBox;
    tbsSystemAudit: TTabSheet;
    tbsOwnership: TTabSheet;
    pnlOwner: TPanel;
    btnTakeOwnerShip: TButton;
    cbxAutoInherit: TCheckBox;
    Bevel1: TBevel;
    btnAdd: TButton;
    btnDelete: TButton;
    cbxInherited: TCheckBox;
    Label11: TLabel;
    cmbACEType: TComboBox;
    imlUsers: TImageList;
    NTRegSecurity1: TNTRegSecurity;
    cmbDomain: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure pclAccessChange(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure cmbComputerChange(Sender: TObject);
    procedure cmbRootKeyChange(Sender: TObject);
    procedure edtRegistryPathExit(Sender: TObject);
    procedure edtRegistryPathKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnTakeOwnerShipClick(Sender: TObject);
    procedure lvUsersChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure cbxObjectInheritClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure lvUsersEditing(Sender: TObject; Item: TListItem;
      var AllowEdit: Boolean);
    procedure lvUsersEdited(Sender: TObject; Item: TListItem;
      var S: String);
    procedure cmbDomainChange(Sender: TObject);
    procedure cbxAutoInheritClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    OldName: string;
    procedure OnShowHint(var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
    procedure SetCheckBoxState(AControl: TCheckBox; State: boolean);
    procedure SetRadioButState(AControl: TRadioButton; State: boolean);
    procedure FillcmbACEType;
    procedure SetEnabledControlState(AControl: TComponent;
      AEnabled: boolean);
    procedure SetButtonState(AEnabled: boolean);
    procedure SetAutoInheritance(AList: TAccessList; AEnabled: boolean);
  public
    { Public declarations }
    List: TAccessList;
    procedure RefreshInfo;
  end;

var
  FrmRegSecurity: TFrmRegSecurity;

implementation

{$R *.DFM}
Uses NT_vs_95;

function PermissionsToStr(AMask: DWORD): string;
begin
  Result := '';
  if kamQueryValue     and AMask <> 0 then Result := Result + 'Q';
  if kamSetValue       and AMask <> 0 then Result := Result + 'S';
  if kamCreateSubKey   and AMask <> 0 then Result := Result + 'C';
  if kamEnumSubKey     and AMask <> 0 then Result := Result + 'E';
  if kamNotify         and AMask <> 0 then Result := Result + 'N';
  if kamCreateLink     and AMask <> 0 then Result := Result + 'L';
  if kamDelete         and AMask <> 0 then Result := Result + 'D';
  if kamWriteDAC       and AMask <> 0 then Result := Result + 'W';
  if kamWriteOwner     and AMask <> 0 then Result := Result + 'O';
  if kamReadControl    and AMask <> 0 then Result := Result + 'R';
  if kamFullControl    and AMask <> 0 then Result := 'F';
end;

function FlagsToStr(AFlags: TAceFlags): string;
begin
  Result := '';
  if acfObjInherit in AFlags then Result := Result + 'O';
  if acfContainer  in AFlags then Result := Result + 'C';
  if acfInheritOnly in AFlags then Result := Result + 'I';
  if acfNoPropagate in AFlags then Result := Result + 'N';
end;

function GetComputerNetName: string;
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

procedure TFrmRegSecurity.FormCreate(Sender: TObject);
var
  List: TStringList;
begin
  Application.OnShowHint := OnShowHint;
  cmbRootKey.ItemIndex := 2;
  cbxAutoInherit.Enabled := IsWindows2000OrHigher;
  try
    List :=  NTRegSecurity1.GetDomains(GetComputerNetName);
    try
      if List <> nil then cmbDomain.Items.Assign(List);
      cmbComputer.Items.Assign(NTRegSecurity1.Servers);
      if not IsWindowsNT then
        cmbComputer.ItemIndex := cmbComputer.Items.IndexOf(NTRegSecurity1.GetPrimaryDomainServerName);
    finally
      List.Free;
    end;
  except
    // on Windows NT the component should work even if it is not in the domain
    if not IsWindowsNT then raise;
  end;

  NTRegSecurity1.MachineName := cmbComputer.Text;
  FillcmbACEType;
  RefreshInfo;
end;

procedure TFrmRegSecurity.OnShowHint(var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
begin
  HintInfo.HintPos.X := HintInfo.HintControl.ClientOrigin.X+20;
  HintInfo.HintPos.Y := HintInfo.HintControl.ClientOrigin.Y;
  CanShow := true;
end;

procedure TFrmRegSecurity.FillcmbACEType;
begin
  cmbACEType.Items.Clear;
  if pclAccess.ActivePage = tbsAccessList then
    begin
    cmbACEType.Items.AddObject('Access Allowed', TObject(Pointer(actAccessAllowed)));
    cmbACEType.Items.AddObject('Access Denied', TObject(Pointer(actAccessDenied)));
    end;
  if pclAccess.ActivePage = tbsSystemAudit then
    begin
    cmbACEType.Items.AddObject('Audit Success', TObject(Pointer(actAuditSuccess)));
    cmbACEType.Items.AddObject('Audit Failure', TObject(Pointer(actAuditFailure)));
    cmbACEType.Items.AddObject('Audit Full',    TObject(Pointer(actAuditFull)));
   end;
end;

procedure TFrmRegSecurity.pclAccessChange(Sender: TObject);
begin
  if (pclAccess.ActivePage <> tbsOwnership) then
    pnlAccess.Parent  := pclAccess.ActivePage;

  FillcmbACEType;
  RefreshInfo;
end;

procedure TFrmRegSecurity.RefreshInfo;
var
  i: integer;
begin
  List := nil;
  lvUsers.Items.Clear;
  if (cmbDomain.Text <> '') and (cmbComputer.Text = '') then Exit;

  if pclAccess.ActivePage = tbsAccessList   then
    begin
    List := NTRegSecurity1.AccessList;
    SetCheckBoxState(cbxAutoInherit, NTRegSecurity1.ControlWord and SE_DACL_PROTECTED = 0);
    end;

  if pclAccess.ActivePage = tbsSystemAudit  then
    try
      List := NTRegSecurity1.SystemAudit;
      SetCheckBoxState(cbxAutoInherit, NTRegSecurity1.ControlWord and SE_SACL_PROTECTED = 0);
    except
      List := nil;
    end;

  pnlOwner.Caption := NTRegSecurity1.KeyOwner;

  if List <> nil then
    for i := 0 to List.Count - 1 do with lvUsers.Items.Add do
      begin
      Caption := List[i].UserName;
      SubItems.Add(PermissionsToStr(List[i].Mask));
      SubItems.Add(FlagsToStr(List[i].Flags));
      case List[i].AceType of
        actAccessAllowed: StateIndex := 0;
        actAccessDenied: StateIndex := 1;
        actAuditSuccess: StateIndex := 2;
        actAuditFailure: StateIndex := 3;
        actAuditFull: StateIndex := 4;
      end;
      end;

  SetRadioButState(rbxFullPermission,  false);
  SetRadioButState(rbnOther,           false);
  SetCheckBoxState(cbxKamQueryValue,   false);
  SetCheckBoxState(cbxKamSetValue,     false);
  SetCheckBoxState(cbxKamCreateSubKey, false);
  SetCheckBoxState(cbxKamEnumSubKey,   false);
  SetCheckBoxState(cbxKamNotify,       false);
  SetCheckBoxState(cbxKamCreateLink,   false);
  SetCheckBoxState(cbxKamDelete,       false);
  SetCheckBoxState(cbxKamWriteDAC,     false);
  SetCheckBoxState(cbxKamWriteOwner,   false);
  SetCheckBoxState(cbxKamReadControl,  false);

  SetEnabledControlState(pnlAccess, not cbxAutoInherit.Checked);

end;

procedure TFrmRegSecurity.SetCheckBoxState(AControl: TCheckBox; State: boolean);
var
  Event: TNotifyEvent;
begin
  Event := AControl.OnClick;
  AControl.OnClick := nil;
  AControl.Checked := State;
  AControl.OnClick := Event;
end;

procedure TFrmRegSecurity.SetRadioButState(AControl: TRadioButton; State: boolean);
var
  Event: TNotifyEvent;
begin
  Event := AControl.OnClick;
  AControl.OnClick := nil;
  AControl.Checked := State;
  AControl.OnClick := Event;
end;


procedure TFrmRegSecurity.btnBrowseClick(Sender: TObject);
begin
  with TFrmRegBrowser.Create(nil) do
    try
    NTRegSecurity1.CurrentPath := edtRegistryPath.Text;
    RootKey      := NTRegSecurity1.RootKey;
    MachineName  := NTRegSecurity1.MachineName;
    CurrentPath  := NTRegSecurity1.CurrentPath;

    if ShowModal = mrOk then
      begin
      NTRegSecurity1.CurrentPath := CurrentPath;
      edtRegistryPath.Text := NTRegSecurity1.CurrentPath;
      RefreshInfo;
      end;
    finally
    Free;
    end;
end;

procedure TFrmRegSecurity.cmbComputerChange(Sender: TObject);
begin
  NTRegSecurity1.MachineName := cmbComputer.Text;
  RefreshInfo;
end;

procedure TFrmRegSecurity.cmbRootKeyChange(Sender: TObject);
begin
  NTRegSecurity1.Rootkey := GetRootValue(cmbRootKey.Text);
  RefreshInfo;
end;

procedure TFrmRegSecurity.edtRegistryPathExit(Sender: TObject);
begin
  NTRegSecurity1.CurrentPath := edtRegistryPath.Text;
  RefreshInfo;
end;

procedure TFrmRegSecurity.edtRegistryPathKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    begin
    NTRegSecurity1.CurrentPath := edtRegistryPath.Text;
    ActiveControl := pclAccess.ActivePage;
    end;
end;

procedure TFrmRegSecurity.btnTakeOwnerShipClick(Sender: TObject);
begin
  NTRegSecurity1.TakeOwnership;
  RefreshInfo;
end;

procedure TFrmRegSecurity.lvUsersChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
var
  AMask:  DWORD;
  AFlags: TAceFlags;
  IsFullControl, IsInheritedACE: boolean;
  vAceType: DWORD;
  i: integer;
begin
  if (lvUsers.Items.Count = 0) or (lvUsers.Selected = nil) then Exit;
  AMask  := List[lvUsers.Selected.Index].Mask;
  AFlags := List[lvUsers.Selected.Index].Flags;
  vAceType := ord(List[lvUsers.Selected.Index].AceType);
  IsInheritedACE := acfInherited in AFlags;
  IsFullControl  := kamFullControl = AMask;

  SetEnabledControlState(pnlAccess, not IsInheritedACE);
  SetButtonState(not IsInheritedACE);

  SetRadioButState(rbxFullPermission, IsFullControl);
  SetRadioButState(rbnOther, not IsFullControl);
  SetCheckBoxState(cbxKamQueryValue,   (kamQueryValue   and AMask > 0) and not IsFullControl);
  SetCheckBoxState(cbxKamSetValue,     (kamSetValue     and AMask > 0) and not IsFullControl);
  SetCheckBoxState(cbxKamCreateSubKey, (kamCreateSubKey and AMask > 0) and not IsFullControl);
  SetCheckBoxState(cbxKamEnumSubKey,   (kamEnumSubKey   and AMask > 0) and not IsFullControl);
  SetCheckBoxState(cbxKamNotify,       (kamNotify       and AMask > 0) and not IsFullControl);
  SetCheckBoxState(cbxKamCreateLink,   (kamCreateLink   and AMask > 0) and not IsFullControl);
  SetCheckBoxState(cbxKamDelete,       (kamDelete       and AMask > 0) and not IsFullControl);
  SetCheckBoxState(cbxKamWriteDAC,     (kamWriteDAC     and AMask > 0) and not IsFullControl);
  SetCheckBoxState(cbxKamWriteOwner,   (kamWriteOwner   and AMask > 0) and not IsFullControl);
  SetCheckBoxState(cbxKamReadControl,  (kamReadControl  and AMask > 0) and not IsFullControl);

  SetCheckBoxState(cbxObjectInherit, acfObjInherit in AFlags);
  SetCheckBoxState(cbxContainer, acfContainer in AFlags);
  SetCheckBoxState(cbxInheritOnly, acfInheritOnly in AFlags);
  SetCheckBoxState(cbxNoPropogate, acfNoPropagate in AFlags);
  SetCheckBoxState(cbxInherited, acfInherited in AFlags);

  for i := 0 to cmbACEType.Items.Count - 1 do
    if DWORD(Pointer(cmbACEType.Items.Objects[i])) = vAceType then
      cmbACEType.ItemIndex := i;
end;

procedure TFrmRegSecurity.cbxObjectInheritClick(Sender: TObject);
var
  AMask:  DWORD;
  AFlags: TAceFlags;
  index:  integer;
begin
  if (lvUsers.Selected = nil) or (List = nil) then Exit;
  AMask := 0;
  AFlags := [];
  if (Sender is TCheckBox) and (TCheckBox(Sender).Parent = gbxPermissions) then
    begin
    SetRadioButState(rbxFullPermission, false);
    SetRadioButState(rbnOther, true);
    end;

  if cbxKamQueryValue.Checked then    AMask := AMask or kamQueryValue;
  if cbxKamSetValue.Checked then      AMask := AMask or kamSetValue;
  if cbxKamCreateSubKey.Checked then  AMask := AMask or kamCreateSubKey;
  if cbxKamEnumSubKey.Checked then    AMask := AMask or kamEnumSubKey;
  if cbxKamNotify.Checked then        AMask := AMask or kamNotify;
  if cbxKamCreateLink.Checked then    AMask := AMask or kamCreateLink;
  if cbxKamDelete.Checked then        AMask := AMask or kamDelete;
  if cbxKamWriteDAC.Checked then      AMask := AMask or kamWriteDAC;
  if cbxKamWriteOwner.Checked then    AMask := AMask or kamWriteOwner;
  if cbxKamReadControl.Checked then   AMask := AMask or kamReadControl;
  if rbxFullPermission.Checked then   AMask := kamFullControl;

  if cbxObjectInherit.Checked then AFlags := AFlags + [acfObjInherit];
  if cbxContainer.Checked then AFlags := AFlags + [acfContainer];
  if cbxInheritOnly.Checked then AFlags := AFlags + [acfInheritOnly];
  if cbxNoPropogate.Checked then AFlags := AFlags + [acfNoPropagate];

  index := lvUsers.Selected.Index;
  List.BeginUpdate;
  List[Index].Mask := AMask;
  List[Index].Flags := AFlags;
  List[Index].AceType := TAceType(integer(cmbACEType.Items.Objects[cmbACEType.ItemIndex]));
  List.EndUpdate;
    
  RefreshInfo;
  lvUsers.Selected := lvUsers.Items[index];
end;

procedure TFrmRegSecurity.btnAddClick(Sender: TObject);
var
  AUserName: string;
  vAceType:  TAceType;
begin
  if (List = nil) then Exit;
  if IsWindowsNT then AUserName := GetEveryOneName('') else
     AUserName := GetEveryOneName(NTRegSecurity1.MachineName);
  if pclAccess.ActivePage = tbsSystemAudit then vAceType := actAuditFailure
    else vAceType := actAccessAllowed;
  List.Add(AUserName, 0, [], vAceType);
  RefreshInfo;
  lvUsers.Selected := lvUsers.Items[lvUsers.Items.Count - 1];
end;

procedure TFrmRegSecurity.btnDeleteClick(Sender: TObject);
begin
  if (lvUsers.Items.Count = 0) or
     (lvUsers.Selected = nil) or
     (List = nil) then Exit;
  List.Delete(lvUsers.Selected.Index);
  RefreshInfo;
end;

procedure TFrmRegSecurity.lvUsersEditing(Sender: TObject; Item: TListItem;
  var AllowEdit: Boolean);
begin
  OldName := lvUsers.Selected.Caption;
end;

procedure TFrmRegSecurity.lvUsersEdited(Sender: TObject; Item: TListItem;
  var S: String);
var
  index: integer;
begin
  index := lvUsers.Selected.Index;
  try
  List[Index].UserName := S;
  except
  S := OldName; raise;
  end;
end;

procedure TFrmRegSecurity.cmbDomainChange(Sender: TObject);
begin
  NTRegSecurity1.DomainName := cmbDomain.Text;
  cmbComputer.Items.Assign(NTRegSecurity1.Servers);
  RefreshInfo;
end;

procedure TFrmRegSecurity.SetEnabledControlState(AControl: TComponent; AEnabled: boolean);
var
  i: integer;
begin
  if (AControl = cbxAutoInherit) or (AControl = cbxInherited) then Exit;
  if (AControl is TCheckBox) then (AControl as TCheckBox).Enabled :=  AEnabled;
  if (AControl is TRadioButton) then (AControl as TRadioButton).Enabled :=  AEnabled;
  if (AControl is TComboBox) then (AControl as TComboBox).Enabled :=  AEnabled;
  if AControl is TWinControl then
    with AControl as TWinControl do
      for i := 0 to ControlCount - 1 do
        SetEnabledControlState(Controls[i], AEnabled);
end;

procedure TFrmRegSecurity.SetButtonState(AEnabled: boolean);
begin
  btnDelete.Enabled := AEnabled;
end;

procedure TFrmRegSecurity.cbxAutoInheritClick(Sender: TObject);
var
  vControlWord: DWORD;
  vCursor: TCursor;
begin
  if Application.MessageBox('This may damage security for this registry key '+#$0D#$0A+
                            'and all the keys down the hierarchy. Are you sure '+#$0D#$0A+
                            'to change auto inheritance properties?',' Confirmation',
                            MB_YESNO + MB_ICONHAND) = idNo then
     begin
     SetCheckBoxState(cbxAutoInherit, not cbxAutoInherit.Checked);
     Exit;
     end;

  vCursor := Screen.Cursor;
  try

  // 1. Set the bit saying that DACL (SACL) (un)protected
    vControlWord := NTRegSecurity1.ControlWord;

    if pclAccess.ActivePage = tbsAccessList   then
      begin
      if cbxAutoInherit.Checked then vControlWord := vControlWord and not SE_DACL_PROTECTED
        else vControlWord := vControlWord or SE_DACL_PROTECTED;
      NTRegSecurity1.ControlWord := vControlWord;
    // if inherit permission - execute DoAutoPropogate
    // else - mark ACEs as not inherited
      if cbxAutoInherit.Checked then NTRegSecurity1.DoAutoPropagate
        else SetAutoInheritance(NTRegSecurity1.AccessList, false);
      end;

    if pclAccess.ActivePage = tbsSystemAudit  then
      begin
      if cbxAutoInherit.Checked then vControlWord := vControlWord and not SE_SACL_PROTECTED
        else vControlWord := vControlWord or SE_SACL_PROTECTED;
      NTRegSecurity1.ControlWord := vControlWord;
    // if inherit permission - execute DoAutoPropogate
    // else - mark ACEs as not inherited
      if cbxAutoInherit.Checked then NTRegSecurity1.DoAutoPropagate
        else SetAutoInheritance(NTRegSecurity1.SystemAudit, false);
      end;

  finally
    Screen.Cursor := vCursor;
  end;

  RefreshInfo;
end;

procedure TFrmRegSecurity.SetAutoInheritance(AList: TAccessList; AEnabled: boolean);
var
  i: integer;
begin
// This procedure is a simplified version (for demo only) of how it should be;
// it sets or resets acfInherited flag;

// What it should do is:
// when setting autoinheritence, it should copy permissions from the
// parent object, with acfInherited flag cleared;
// when disabling autoinheritence, it should mark the existing ACEs as non-inherited;
// (as it works now)

  AList.BeginUpdate;
  try
    for i := 0 to AList.Count - 1 do
      if AEnabled then AList.Items[i].Flags := AList.Items[i].Flags + [acfInherited]
        else AList.Items[i].Flags := AList.Items[i].Flags - [acfInherited];
  finally
    AList.EndUpdate;
  end;
end;


procedure TFrmRegSecurity.FormActivate(Sender: TObject);
begin
with FrmRegSecurity do
     SetWindowPos(Handle,
     HWND_TOPMOST,
     Left,
     Top,
     Width,
     Height,
     SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
end;

end.
 
program crypt;

uses
  Forms,
  Windows,
  stsp in 'stsp.pas' {CRF},
  fCryptoData in 'fCryptoData.pas' {Data1: TDataModule},
  rsa_stalker in 'rsa_stalker.pas' {Form1},
  SSARSA in 'SSARSA.pas' {SARSA},
  key in 'key.pas' {keys},
  fmain in 'fmain.pas' {SRT},
  Unit3 in 'Unit3.pas' {frmAboutBox},
  FrRSecur in 'FrRSecur.pas' {FrmRegSecurity},
  ProtEXE in 'ProtEXE.pas' {PRE},
  hash in 'hash.pas' {fhash},
  codingf in 'codingf.pas' {fcod},
  FileCript in 'FileCript.pas' {CryptFile},
  cez in 'cez.pas' {cz},
  BMPS in 'BMPS.pas' {StegoBMP},
  RSATXT in 'RSATXT.pas' {TXTRSA},
  pw in 'pw.pas' {myps},
  copyfiles in 'copyfiles.pas' {copyf},
  qr in 'qr.pas' {QRC};

{$R *.res}
{$R UAC.RES}

var
  HM: THandle;
function Check: boolean;
begin
  HM := OpenMutex(MUTEX_ALL_ACCESS, false, 'CRF');
  Result := (HM <> 0);
  if HM = 0 then HM := CreateMutex(nil, false, 'CRF');
end;

begin
  if Check then Exit;
  Application.Initialize;
  Application.CreateForm(TCRF, CRF);
  Application.CreateForm(Tfcod, fcod);
  Application.CreateForm(Tkeys, keys);
  Application.CreateForm(TData1, Data1);
  Application.CreateForm(TSRT, SRT);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TSARSA, SARSA);
  Application.CreateForm(TfrmAboutBox, frmAboutBox);
  Application.CreateForm(TPRE, PRE);
  Application.CreateForm(Tfhash, fhash);
  Application.CreateForm(TCryptFile, CryptFile);
  Application.CreateForm(Tcz, cz);
  Application.CreateForm(TFrmRegSecurity, FrmRegSecurity);
  Application.CreateForm(TStegoBMP, StegoBMP);
  Application.CreateForm(TTXTRSA, TXTRSA);
  Application.CreateForm(Tmyps, myps);
  Application.CreateForm(Tcopyf, copyf);
  Application.CreateForm(TQRC, QRC);
  Application.Run;
end.

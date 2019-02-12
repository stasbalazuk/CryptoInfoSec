unit fCryptoData;
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ASX509, ASCryptoComp, ASGtMath;

type
  TData1 = class(TDataModule)
    AS_RandomGenerator1: TAS_RandomGenerator;
    AS_PrimeGenerator1: TAS_PrimeGenerator;
    MDXforRSA: TAS_DigestMDX;
    SHA1forRSA: TAS_DigestSHA1;
    RSA1: TAS_RSACryptography;
    RIPEMDforRSA: TAS_DigestRIPEMD160;
    Base641: TAS_Base64Coding;
    Rip1: TAS_DigestRIPEMD160;
    SHA1: TAS_DigestSHA1;
    MDX1: TAS_DigestMDX;
    SkipJack1: TAS_SkipJackCryptography;
    Safer1: TAS_SaferCryptography;
    IDEA1: TAS_IDEACryptography;
    CAST1: TAS_CASTCryptography;
    Blowfish1: TAS_BFCryptography;
    RC51: TAS_RC5Cryptography;
    RC41: TAS_RC4Cryptography;
    RC21: TAS_RC2Cryptography;
    DES1: TAS_DESCryptography;
    Cert1: TAS_X509Certificate;
    RSAforCert: TAS_RSACryptography;
    procedure AS_RandomGenerator1AfterGenRandom(Sender: TObject;
      rnd: GiantInt);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Data1: TData1;

implementation

uses rsa_stalker;

{$R *.DFM}

procedure TData1.AS_RandomGenerator1AfterGenRandom(Sender: TObject; rnd: GiantInt);
begin
    Form1.Status[0] := Format('Generating RSA key...  (%f sec elapsed)',
    [(Now - Form1.StartMoment) * 24 * 3600]);
end;

end.

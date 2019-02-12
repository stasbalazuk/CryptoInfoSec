unit copyfiles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls;

type
  Tcopyf = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    ProgressBar1: TProgressBar;
    SaveDialog1: TSaveDialog;
    stat1: TStatusBar;
    tmr1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmr1Timer(Sender: TObject);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  copyf: Tcopyf;
  EnCours: Int64;

implementation

{$R *.dfm}

// Fonction "CallBack" appel�e par CopyFileEx pour signaler l'avancement de la copie
function CopyCallBack(
  TotalFileSize: LARGE_INTEGER;          // Taille totale du fichier en octets
  TotalBytesTransferred: LARGE_INTEGER;  // Nombre d'octets d�j�s transf�r�s
  StreamSize: LARGE_INTEGER;             // Taille totale du flux en cours
  StreamBytesTransferred: LARGE_INTEGER; // Nombre d'octets d�j� tranf�r�s dans ce flus
  dwStreamNumber: DWord;                 // Num�ro de flux actuem
  dwCallbackReason: DWord;               // Raison de l'appel de cette fonction
  hSourceFile: THandle;                  // handle du fichier source
  hDestinationFile: THandle;             // handle du fichier destination
  ProgressBar : TProgressBar             // param�tre pass� � la fonction qui est une
                                         // recopie du param�tre pass� � CopyFile Ex
                                         // Il sert � passer l'adresse du progress bar �
                                         // mettre � jour pour la copie. C'est une
                                         // excellente id�e de DelphiProg
  ): DWord; far; stdcall;
begin
  // Calcul de la position du progresbar en pourcent, le calcul doit �tre effectu� dans
  // une variable interm�diaire de type Int64. Pour �viter les d�bordement de calcul
  // dans la propri�t� Position de type integer.
  EnCours := TotalBytesTransferred.QuadPart * 100 div TotalFileSize.QuadPart;
  copyf.stat1.Panels[1].Text:='��������: '+IntToStr(EnCours)+' %';
  If ProgressBar<>Nil Then ProgressBar.Position := EnCours;
  // La fonction doit d�finir si la copie peut �tre continu�e.
  Result := PROGRESS_CONTINUE;
end;

procedure Tcopyf.Button1Click(Sender: TObject);
var Retour: LongBool;
begin
  if (Edit1.Text = '') or (Edit2.Text = '') or (Edit1.Text = Edit2.Text) then
      Exit;
  Retour := False;
  if not CopyFileEx(
    PChar(Edit1.Text),     // Nom du fichier d'origine
    PChar(Edit2.Text),     // Nom du fichier de destination
    @CopyCallBack,         // Adresse de la fonction appel�e durant la copie
    ProgressBar1,          // Param�tre auxiliaire qui sert ici � d�finir le progress bar
                           // � mettre � jour [DelphiProg]
    @Retour,               // adresse d'une variable bool��ne que la fonction teste
                           // en permanence pour �ventuellement stopper la copie
    COPY_FILE_RESTARTABLE) // Si la copie est stopp�e, un nouvel appel avec les m�mes
                           // param�tres permet de la continuer
    then ShowMessage(IntToStr(GetLastError));
end;

procedure Tcopyf.FormActivate(Sender: TObject);
begin
 if (Edit1.Text <> '') and
    (Edit2.Text <> '') then begin
     tmr1.Enabled:=True;
     Button1.Click;
 end;
end;

procedure Tcopyf.FormShow(Sender: TObject);
begin
  //���������
  SetWindowPos( Handle, HWND_TOPMOST, Left, Top, Width, Height,
  SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE );
end;

procedure Tcopyf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //����������
  SetWindowPos(copyf.Handle, HWND_NOTOPMOST, copyf.Left, copyf.Top, copyf.Width, copyf.Height,
  SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE );
end;

procedure Tcopyf.tmr1Timer(Sender: TObject);
begin
  if ProgressBar1.Position = 100 then begin
     copyf.Caption:='������-��������� ������� ����������!';
     Application.Terminate;
  end;
end;

end.

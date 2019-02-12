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
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  copyf: Tcopyf;
  EnCours: Int64;

implementation

{$R *.dfm}

// Fonction "CallBack" appelée par CopyFileEx pour signaler l'avancement de la copie
function CopyCallBack(
  TotalFileSize: LARGE_INTEGER;          // Taille totale du fichier en octets
  TotalBytesTransferred: LARGE_INTEGER;  // Nombre d'octets déjàs transférés
  StreamSize: LARGE_INTEGER;             // Taille totale du flux en cours
  StreamBytesTransferred: LARGE_INTEGER; // Nombre d'octets déjà tranférés dans ce flus
  dwStreamNumber: DWord;                 // Numéro de flux actuem
  dwCallbackReason: DWord;               // Raison de l'appel de cette fonction
  hSourceFile: THandle;                  // handle du fichier source
  hDestinationFile: THandle;             // handle du fichier destination
  ProgressBar : TProgressBar             // paramètre passé à la fonction qui est une
                                         // recopie du paramètre passé à CopyFile Ex
                                         // Il sert à passer l'adresse du progress bar à
                                         // mettre à jour pour la copie. C'est une
                                         // excellente idée de DelphiProg
  ): DWord; far; stdcall;
begin
  // Calcul de la position du progresbar en pourcent, le calcul doit être effectué dans
  // une variable intermédiaire de type Int64. Pour éviter les débordement de calcul
  // dans la propriété Position de type integer.
  EnCours := TotalBytesTransferred.QuadPart * 100 div TotalFileSize.QuadPart;
  copyf.stat1.Panels[1].Text:='Ïðîãðåññ: '+IntToStr(EnCours)+' %';
  If ProgressBar<>Nil Then ProgressBar.Position := EnCours;
  // La fonction doit définir si la copie peut être continuée.
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
    @CopyCallBack,         // Adresse de la fonction appelée durant la copie
    ProgressBar1,          // Paramètre auxiliaire qui sert ici à définir le progress bar
                           // à mettre à jour [DelphiProg]
    @Retour,               // adresse d'une variable booléène que la fonction teste
                           // en permanence pour éventuellement stopper la copie
    COPY_FILE_RESTARTABLE) // Si la copie est stoppée, un nouvel appel avec les mêmes
                           // paramètres permet de la continuer
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
  //Âêëþ÷åíèå
  SetWindowPos( Handle, HWND_TOPMOST, Left, Top, Width, Height,
  SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE );
end;

procedure Tcopyf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Âûêëþ÷åíèå
  SetWindowPos(copyf.Handle, HWND_NOTOPMOST, copyf.Left, copyf.Top, copyf.Width, copyf.Height,
  SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE );
end;

procedure Tcopyf.tmr1Timer(Sender: TObject);
begin
  if ProgressBar1.Position = 100 then begin
     copyf.Caption:='Êðèïòî-êîíòåéíåð óñïåøíî ñêîïèðîâàí!';
     Application.Terminate;
  end;
end;

end.

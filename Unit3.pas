unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellAPI, ExtCtrls, clipbrd;

type
  TfrmAboutBox = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    lblSystemID: TLabel;
    btnOk: TButton;
    img1: TImage;
    GroupBox2: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    dblInputFileSize1: TLabel;
    procedure btnOkClick(Sender: TObject);
    procedure lbl1DblClick(Sender: TObject);
    procedure lbl2DblClick(Sender: TObject);
    procedure lbl4DblClick(Sender: TObject);
    procedure lbl3DblClick(Sender: TObject);
    procedure lbl5DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblInputFileSize1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAboutBox: TfrmAboutBox;
  idsys: string;

implementation

{$R *.dfm}

uses stsp;

procedure TfrmAboutBox.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAboutBox.lbl1DblClick(Sender: TObject);
begin
   Clipboard.AsText:='Z153633215917';
   MessageBox(handle,'Кошелек Z153633215917 в буфере обмена!','Внимание',64);
end;

procedure TfrmAboutBox.lbl2DblClick(Sender: TObject);
begin
   Clipboard.AsText:='E286050171346';
   MessageBox(handle,'Кошелек E286050171346 в буфере обмена!','Внимание',64);
end;

procedure TfrmAboutBox.lbl4DblClick(Sender: TObject);
begin
   Clipboard.AsText:='R272181302678';
   MessageBox(handle,'Кошелек R272181302678 в буфере обмена!','Внимание',64);
end;

procedure TfrmAboutBox.lbl3DblClick(Sender: TObject);
begin
   Clipboard.AsText:='U261245281360';
   MessageBox(handle,'Кошелек U261245281360 в буфере обмена!','Внимание',64);
end;

procedure TfrmAboutBox.lbl5DblClick(Sender: TObject);
begin
   Clipboard.AsText:='410012015786021';
   MessageBox(handle,'Яндекс счет 410012015786021 в буфере обмена!','Внимание',64);
end;

procedure TfrmAboutBox.FormActivate(Sender: TObject);
begin
with frmAboutBox do
     SetWindowPos(Handle,
     HWND_TOPMOST,
     Left,
     Top,
     Width,
     Height,
     SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
end;

procedure TfrmAboutBox.dblInputFileSize1DblClick(Sender: TObject);
begin
  // Послать E-mail
  ShellExecute(Handle,nil,PAnsiChar('mailto:stalkersts2013@yandex.ru?&subject=I%20want%20to%20help%20the%20project%20CRF%20v1.0.0.0&body=I%20want%20to%20help%20the%20project%20amount:'),nil,nil,SW_SHOWNORMAL);
end;

end.

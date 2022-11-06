unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, SHDocVw, ExtCtrls, MPlayer;

type
  TForm9 = class(TForm)
    img1: TImage;
    img2: TImage;
    img3: TImage;
    img4: TImage;
    lbl1: TLabel;
    mp1: TMediaPlayer;
    pnl1: TPanel;
    img5: TImage;
    img6: TImage;
    procedure img2Click(Sender: TObject);
    procedure img3Click(Sender: TObject);
    procedure img4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure img5Click(Sender: TObject);
    procedure img6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses Unit4, Unit2;

{$R *.dfm}

procedure TForm9.img2Click(Sender: TObject);
begin
Form9.Visible:=false;
form4.Visible:=true;
img1.Picture.LoadFromFile('resources\pictures\Пистолет1.emf');
lbl1.Caption:='1';
img4.Visible:=false;
img5.Visible:=False;
img6.Visible:=false;
if pnl1.Visible=True then begin
pnl1.Visible:=false;
mp1.Stop;
Form2.mp1.Play;
end;
end;

procedure TForm9.img3Click(Sender: TObject);
var n:Integer;
begin
lbl1.caption:=IntToStr(StrToInt(lbl1.caption)+1); //+1 к caption за клик
img4.Visible:=true;
n:=StrToInt(lbl1.caption); //Присваивание переменной n значения caption
if n=8 then begin;
pnl1.Visible:=true;
mp1.FileName := 'resources\videos\Пистолет1.mp4';
mp1.Open;
mp1.Play;
mp1.DisplayRect:=pnl1.ClientRect;
form2.mp1.pause;
img5.Visible:=True;
end else if n=14 then begin
pnl1.Visible:=true;
mp1.FileName := 'resources\videos\Пистолет3.mp4';
mp1.Open;
mp1.Play;
mp1.DisplayRect:=pnl1.ClientRect;
form2.mp1.Pause;
img5.Visible:=true;
end else
begin
img1.Picture.LoadFromFile('resources\pictures\Пистолет'+IntToStr(n)+'.emf');//загрузка изображения из файла
if StrToInt(Form2.lbl3.Caption) mod 2 = 1 then
form2.mp1.Play;
img6.Visible:=false;
img5.Visible:=false;
if pnl1.Visible=true then
begin
mp1.Stop;
pnl1.Visible:=false;
end;
end;
if n=14 then img3.Visible:=False;
end;

procedure TForm9.img4Click(Sender: TObject);
var n:Integer;
begin
lbl1.caption:=IntToStr(StrToInt(lbl1.caption)-1); //-1 от caption за клик
n:=StrToInt(lbl1.caption);
img3.Visible:=true;
if n=8 then begin;
pnl1.Visible:=True;
mp1.FileName := 'resources\videos\Пистолет1.mp4';
mp1.Open;
mp1.Play;
mp1.DisplayRect:=pnl1.ClientRect;
form2.mp1.Pause;
img5.Visible:=true;
end else
begin
img5.Visible:=false;
img6.Visible:=false;
img1.Picture.LoadFromFile('resources\pictures\Пистолет'+IntToStr(n)+'.emf');
if StrToInt(Form2.lbl3.Caption) mod 2 = 1 then
form2.mp1.Play;
if pnl1.Visible=true then
begin
mp1.Stop;
pnl1.Visible:=false;
end;
end;
if n=1 then img4.Visible:=false;
end;

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TForm9.img5Click(Sender: TObject);
begin
if pnl1.Visible=True then
mp1.stop;
img5.Visible:=false;
img6.Visible:=true;
end;

procedure TForm9.img6Click(Sender: TObject);
begin
img6.Visible:=false;
img5.Visible:=true;
if pnl1.Visible=True then
mp1.Play;
end;

end.

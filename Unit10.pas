unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, SHDocVw, ExtCtrls, MPlayer;

type
  TForm10 = class(TForm)
    img1: TImage;
    lbl1: TLabel;
    img2: TImage;
    img3: TImage;
    img4: TImage;
    pnl1: TPanel;
    mp1: TMediaPlayer;
    img5: TImage;
    img6: TImage;
    procedure img3Click(Sender: TObject);
    procedure img4Click(Sender: TObject);
    procedure img2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure img6Click(Sender: TObject);
    procedure img5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

uses Unit4, Unit2;

{$R *.dfm}

procedure TForm10.img3Click(Sender: TObject);
var n:Integer;
begin
lbl1.caption:=IntToStr(StrToInt(lbl1.caption)+1); //+1 к caption за клик
img4.Visible:=true;
n:=StrToInt(lbl1.caption);  //Задание переменной n значения caption
if n=9 then begin
img5.Visible:=true;
pnl1.Visible:=True;
mp1.FileName := 'resources\videos\Винтовка1.mp4';
mp1.Open;
mp1.Play;
mp1.DisplayRect:=pnl1.ClientRect;
form2.mp1.Pause;
end else if n=15 then begin
pnl1.Visible:=true;
img5.Visible:=True;
mp1.FileName := 'resources\videos\Винтовка2.mp4';
mp1.Open;
mp1.Play;
mp1.DisplayRect:=pnl1.ClientRect;
form2.mp1.Pause;
end else
begin
img5.Visible:=false;
img6.Visible:=False;
img1.Picture.LoadFromFile('resources\pictures\Винтовка'+IntToStr(n)+'.emf');//загрузка изображения из файла
if StrToInt(Form2.lbl3.Caption) mod 2 = 1 then
form2.mp1.Play;
if pnl1.Visible=true then
begin
mp1.Stop;
pnl1.Visible:=false;
end;
end;
if n=15 then img3.Visible:=False;
end;

procedure TForm10.img4Click(Sender: TObject);
var n:integer;
begin
lbl1.caption:=IntToStr(StrToInt(lbl1.caption)-1); //-1 от caption за клик
n:=StrToInt(lbl1.caption);
img3.Visible:=true;
if n=9 then begin;
pnl1.Visible:=True;
mp1.FileName := 'resources\videos\Винтовка1.mp4';
mp1.Open;
mp1.Play;
mp1.DisplayRect:=pnl1.ClientRect;
form2.mp1.Pause;
end else
begin
img5.Visible:=false;
img6.Visible:=false;
img1.Picture.LoadFromFile('resources\pictures\Винтовка'+IntToStr(n)+'.emf');
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

procedure TForm10.img2Click(Sender: TObject);
begin
Form10.Visible:=false;
img5.Visible:=false;
img6.Visible:=false;
form4.Visible:=true;
img1.Picture.LoadFromFile('resources\pictures\Винтовка1.emf');
img4.Visible:=false;
lbl1.Caption:='1';
if pnl1.Visible=True then begin
pnl1.Visible:=false;
mp1.Stop;
Form2.mp1.Play;
end;
end;

procedure TForm10.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TForm10.img6Click(Sender: TObject);
begin
img6.Visible:=false;
img5.Visible:=true;
if pnl1.Visible=True then
mp1.Play;
end;

procedure TForm10.img5Click(Sender: TObject);
begin
if pnl1.Visible=True then
mp1.stop;
img5.Visible:=false;
img6.Visible:=true;
end;

end.

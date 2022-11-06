unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MPlayer, ComCtrls, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    tmr1: TTimer;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    tmr2: TTimer;
    tmr3: TTimer;
    tmr4: TTimer;
    lbl5: TLabel;
    img2: TImage;
    mp1: TMediaPlayer;
    tmr5: TTimer;
    tmr6: TTimer;
    img1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure tmr2Timer(Sender: TObject);
    procedure tmr3Timer(Sender: TObject);
    procedure tmr4Timer(Sender: TObject);
    procedure img2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure img2Click(Sender: TObject);
    procedure tmr5Timer(Sender: TObject);
    procedure tmr6Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  fon:TBitmap;
  korb:TBitmap;
  x:Integer;
  shx:integer;

implementation

uses Unit2;
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
shx:=6;
fon:=TBitmap.Create;    //Создание фона
fon.loadfromfile('resources\pictures\Фон.bmp'); //Загрузка фона из файла
korb:=TBitmap.create;
korb.LoadFromFile('resources\pictures\Пуля.bmp');
korb.Transparent:=True;
img1.Canvas.Draw(0,0,fon);
img1.Canvas.Draw(x,300,korb);
img1.Canvas.Draw(0,0,fon);    // рисование фона и движущегося элемента
img1.Canvas.Draw(x,300,korb);
end;

procedure TForm1.tmr1Timer(Sender: TObject);
begin
x:=x+shx;    // задание координат смещения
if x>695 then shx:=shx*-1;
if x<0 then shx:=shx*-1;
img1.Canvas.Draw(0,0,fon);
img1.Canvas.Draw(x,350,korb); //передвижение элемента
if x>695 then     //если элемент долетел до конца, то:
begin
tmr1.Enabled:=False;
tmr2.Enabled:=False;
tmr3.Enabled:=False;
tmr4.Enabled:=False;
lbl1.Visible:=False;
lbl2.Visible:=False;
lbl3.Visible:=False;
lbl4.Visible:=False;
lbl5.Visible:=True;
img2.Visible:=True;
tmr5.Enabled:=True;
end;
end;
procedure TForm1.tmr2Timer(Sender: TObject);
begin
lbl2.Visible:=True;
end;

procedure TForm1.tmr3Timer(Sender: TObject);
begin
lbl3.Visible:=True;
end;

procedure TForm1.tmr4Timer(Sender: TObject);
begin
lbl4.Visible:=True;
end;

procedure TForm1.img2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var h:hcursor;
begin
h:=LoadCursorFromFile('resources\cursors\gun.cur');//Загрузка курсора из файла
Screen.Cursors[1]:=h;
Form1.Cursor:=1;
end;

procedure TForm1.img2Click(Sender: TObject);
var h:hcursor;
begin
h:=LoadCursorFromFile('resources\cursors\gun1.cur');
Screen.Cursors[1]:=h;
Form1.Cursor:=1;
mp1.FileName := 'resources\sounds\Выстрел2.1.wav'; //Загрузка аудио из файла
mp1.Open;
mp1.Play;    //Проигрывание аудио
tmr6.enabled:=True;
end;

procedure TForm1.tmr5Timer(Sender: TObject);
begin
img1.Canvas.Draw(0,0,fon);
tmr5.Enabled:=false;
end ;

procedure TForm1.tmr6Timer(Sender: TObject);
begin
Form1.Visible:=false;
Form2.Visible:=true;
tmr6.Enabled:=false;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

end.

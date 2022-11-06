unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, MPlayer, StdCtrls, jpeg;

type
  TForm7 = class(TForm)
    img1: TImage;
    lbl1: TLabel;
    SumClick: TLabel;
    lbl2: TLabel;
    Time: TLabel;
    lbl3: TLabel;
    img2: TImage;
    mp1: TMediaPlayer;
    tmr1: TTimer;
    tmr2: TTimer;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    img3: TImage;
    img4: TImage;
    img6: TImage;
    img7: TImage;
    img8: TImage;
    img9: TImage;
    img10: TImage;
    img11: TImage;
    procedure tmr1Timer(Sender: TObject);
    procedure tmr2Timer(Sender: TObject);
    procedure img1Click(Sender: TObject);
    procedure img2Click(Sender: TObject);
    procedure tmr3Timer(Sender: TObject);
    procedure img2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure img1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure img3Click(Sender: TObject);
    procedure img4Click(Sender: TObject);
    procedure img6Click(Sender: TObject);
    procedure img6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure img9Click(Sender: TObject);
    procedure img7Click(Sender: TObject);
    procedure img10Click(Sender: TObject);
    procedure img11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses Unit2, Unit1, Unit3, Unit5;

{$R *.dfm}

procedure TForm7.tmr1Timer(Sender: TObject);
var i:Integer;
begin
i:=Random(2);  //задание переменной рандомного значения
if i=1 then
img1.Visible:=True
else img2.Visible:=True;
end;

procedure TForm7.tmr2Timer(Sender: TObject);
begin
if StrToInt (Time.Caption) > 0 then begin
Time.Caption := IntToStr (StrToInt (Time.Caption) - 1); //-1 от счётчика времени
img1.Visible:=false;
img2.Visible:=False;
end
else
begin tmr1.Enabled := false;
tmr2.Enabled := false;
Form7.Cursor:=crDefault;    //задание дефолтного курсора
img4.Visible:=True;
lbl6.Visible:=false;
lbl7.Visible:=False;
img7.Visible:=true;
img3.Picture.LoadFromFile('resources\pictures\Повторить.emf');
img3.Visible:=true;
Application.Title:='Пулевая стрельба';   //задание названия сообщения
if SumClick.Caption = '0' then       //если количество попаданий =0 :
ShowMessage ('Вы проиграли!')    //вывод сообщения на экран
else
ShowMessage ('Поздравляем! Вы попали ' + SumClick.Caption + ' раз!');
lbl6.Visible:=false;
lbl7.Visible:=false;
end;
end;

procedure TForm7.img1Click(Sender: TObject);
var h:hcursor;
begin
if tmr2.Enabled = true then
SumClick.Caption := IntToStr (StrToInt (SumClick.Caption) + 1); //+1 к счётчику выстрелов
if tmr1.Enabled = true then begin
lbl7.Caption := IntToStr (StrToInt (lbl7.Caption) - 1); //-1 от количества патронов
lbl5.Caption := IntToStr (StrToInt (lbl5.Caption) + 1);
h:=LoadCursorFromFile('resources\cursors\gun1.cur'); //загрузка курсора из файла
Screen.Cursors[1]:=h;
Form7.Cursor:=1;
if StrToInt(Form2.lbl2.Caption) mod 2 =1 then begin
mp1.FileName := 'resources\sounds\Выстрел2.2.wav';  //загрузка аудио из файла
mp1.Open;
mp1.Play;                                    //проигрывание аудио
end;
if  lbl7.Caption='0' then begin
lbl6.Visible:=False;
lbl7.Visible:=False;
tmr1.Enabled := false;
tmr2.Enabled := false;
img1.Visible:=False;
Form5.Cursor:=crDefault;
img4.Visible:=True;
img7.Visible:=true;
img3.Picture.LoadFromFile('resources\pictures\Повторить.emf');
img3.Visible:=true;
Application.Title:='Пулевая стрельба';
ShowMessage('Ой! Закончились патроны! Вы попали '+ SumClick.Caption + ' раз!');
end;
end else Cursor:=crDefault;
end;

procedure TForm7.img2Click(Sender: TObject);
begin
if tmr2.Enabled = true then begin
lbl7.Caption := IntToStr (StrToInt (lbl7.Caption) - 1);
tmr2.Enabled:=False;
tmr1.Enabled:=False;
Application.Title:='Пулевая стрельба';
ShowMessage('Вы проиграли! Выстрел в мирного жителя!');
img4.visible:=true;
img1.visible:=false;
img2.visible:=false;
lbl6.Visible:=false;
lbl7.Visible:=False;
img7.Visible:=true;
img3.Picture.LoadFromFile('resources\pictures\Повторить.emf');
img3.Visible:=true;
lbl5.Caption := IntToStr (StrToInt (lbl5.Caption) + 1);
if StrToInt(Form2.lbl2.Caption) mod 2 =1 then begin
mp1.FileName := 'resources\sounds\Выстрел2.2.wav';
mp1.Open;
mp1.Play;
end;
end;
end;

procedure TForm7.tmr3Timer(Sender: TObject);
begin
if tmr1.Enabled = true then begin
  img1.Visible:=False;
  img2.Visible:=false;
end;
end;
procedure TForm7.img2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  var h:hcursor;
begin
if tmr1.Enabled = true then begin
h:=LoadCursorFromFile('resources\cursors\gun.cur');
Screen.Cursors[1]:=h;
Form7.Cursor:=1;
end else Cursor:=crDefault;
end;

procedure TForm7.img1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  var h:hcursor;
begin
if tmr1.Enabled = true then begin
h:=LoadCursorFromFile('resources\cursors\gun.cur');
Screen.Cursors[1]:=h;
Form7.Cursor:=1;
end else Cursor:=crDefault;
end;

procedure TForm7.img3Click(Sender: TObject);
begin
if tmr1.Enabled = false then
begin
img1.Left:=400;  //задание положения изображений
img2.Left:=400;
img1.Top:=152;
img2.Top:=184;
img1.Visible:=False;
img2.Visible:=False;
SumClick.Caption := '0'; //присваивание значений переменным
Time.Caption := '25';
lbl5.caption:='0';
lbl7.Caption:='25';
tmr1.Enabled := true;
tmr2.Enabled := true;
img4.Visible:=False;
lbl7.Visible:=True;
lbl6.Visible:=True;
img7.Visible:=false;
end;
img3.Visible:=False;
end;

procedure TForm7.img4Click(Sender: TObject);
begin
form7.Visible:=false;
form3.visible:=True;
mp1.close;
SumClick.Caption:='0';
Time.Caption:='15';
lbl5.Caption:='0';
lbl7.Caption:='25';
img3.Picture.LoadFromFile('resources\pictures\Начать.emf');
end;

procedure TForm7.img6Click(Sender: TObject);
var h:HCURSOR;
begin
if tmr1.Enabled = true then begin
lbl7.Caption := IntToStr (StrToInt (lbl7.Caption) - 1);
h:=LoadCursorFromFile('resources\cursors\gun1.cur');
Screen.Cursors[1]:=h;
Form7.Cursor:=1;
if StrToInt(Form2.lbl2.Caption) mod 2 =1 then begin
mp1.FileName := 'resources\sounds\Выстрел2.2.wav';
mp1.Open;
mp1.Play;
end;
lbl5.Caption := IntToStr (StrToInt (lbl5.Caption) + 1);
if  lbl7.Caption='0' then begin
lbl6.Visible:=False;
lbl7.Visible:=False;
tmr1.Enabled := false;
tmr2.Enabled := false;
img1.Visible:=False;
Form5.Cursor:=crDefault;
img4.Visible:=True;
img7.Visible:=true;
img3.Picture.LoadFromFile('resources\pictures\Повторить.emf');
img3.Visible:=true;
Application.Title:='Пулевая стрельба';
ShowMessage('Ой! Закончились патроны! Вы попали '+ SumClick.Caption + ' раз!');
end;
end else Cursor:=crDefault;
end;

procedure TForm7.img6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  var h:hcursor;
begin
if tmr1.Enabled = true then begin
h:=LoadCursorFromFile('resources\cursors\gun.cur');
Screen.Cursors[1]:=h;
Form7.Cursor:=1;
end else Cursor:=crDefault;
end;

procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TForm7.img9Click(Sender: TObject);
begin
img3.Visible:=true;
img4.Visible:=True;
img8.Visible:=False;
img7.Visible:=True;
img9.Visible:=false;
img10.Visible:=false;
img11.Visible:=false;
end;

procedure TForm7.img7Click(Sender: TObject);
begin
img4.Visible:=false;
img8.Visible:=true;
img7.Visible:=False;
img9.Visible:=true;
img10.Visible:=True;
img8.Picture.LoadFromFile('resources\pictures\Правила5.emf');
img3.Visible:=false;
end;

procedure TForm7.img10Click(Sender: TObject);
begin
img10.Visible:=False;
img11.Visible:=True;
img8.Picture.LoadFromFile('resources\pictures\Правила6.emf');
end;

procedure TForm7.img11Click(Sender: TObject);
begin
img11.Visible:=False;
img10.Visible:=True;
img8.Picture.LoadFromFile('resources\pictures\Правила5.emf');
end;

end.

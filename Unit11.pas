unit Unit11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, MPlayer;

type
  TForm11 = class(TForm)
    img1: TImage;
    img2: TImage;
    img3: TImage;
    img5: TImage;
    Time: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    SumClick: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    tmr1: TTimer;
    tmr2: TTimer;
    mp1: TMediaPlayer;
    img6: TImage;
    img7: TImage;
    img8: TImage;
    img9: TImage;
    img10: TImage;
    img11: TImage;
    img12: TImage;
    img13: TImage;
    img14: TImage;
    img15: TImage;
    img16: TImage;
    img17: TImage;
    img18: TImage;
    img19: TImage;
    procedure img3Click(Sender: TObject);
    procedure img2Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure tmr2Timer(Sender: TObject);
    procedure img5Click(Sender: TObject);
    procedure img2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure img1Click(Sender: TObject);
    procedure img1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure img6Click(Sender: TObject);
    procedure img7Click(Sender: TObject);
    procedure img8Click(Sender: TObject);
    procedure img9Click(Sender: TObject);
    procedure img10Click(Sender: TObject);
    procedure img11Click(Sender: TObject);
    procedure img12Click(Sender: TObject);
    procedure img13Click(Sender: TObject);
    procedure img14Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure img15Click(Sender: TObject);
    procedure img17Click(Sender: TObject);
    procedure img18Click(Sender: TObject);
    procedure img19Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

uses Unit3, Unit1, Unit5, Unit2;

{$R *.dfm}

procedure TForm11.img3Click(Sender: TObject);
begin
Form11.Visible:=false;
form3.visible:=True;
mp1.close;
img2.Visible:=true;
SumClick.Caption:='0';
time.Caption:='15';
lbl7.Caption:='25';
lbl5.Caption:='0';
img5.left:=480;
img5.Top:=136;
img6.left:=496;
img6.Top:=152;
img7.left:=512;
img7.Top:=168;
img8.left:=528;
img8.Top:=184;
img9.left:=544;
img9.Top:=200;
img10.left:=560;
img10.Top:=216;
img11.left:=576;
img11.Top:=232;
img12.left:=592;
img12.Top:=248;
img13.left:=608;
img13.Top:=266;
img14.left:=624;
img14.Top:=282;
img2.Picture.LoadFromFile('resources\pictures\Начать.emf');
end;

procedure TForm11.img2Click(Sender: TObject);
var h:HCURSOR;
begin
h:=LoadCursorFromFile('resources\cursors\gun1.cur'); //загрузка курсора из файла
Screen.Cursors[1]:=h;
Form11.Cursor:=1;
img15.Visible:=False;
if tmr1.Enabled = false then
begin
lbl7.Caption:='25';
SumClick.Caption := '0';
Time.Caption := '15';
lbl5.Caption:='0';
tmr1.Enabled := true;
tmr2.Enabled := true;
img3.Visible:=False;
lbl6.Visible:=True;
lbl7.Visible:=True;
img2.Visible:=false;
end;
end;

procedure TForm11.tmr1Timer(Sender: TObject);
begin
img5.Left:=random(form11.ClientWidth - img5.Width); //рандомное нахождение
img5.Top:=random(Form11.ClientHeight - img5.Height);//изображения на форме
img6.Left:=trunc(img5.Left+img5.Width/19.5);
img6.Top:=Trunc(img5.Top+img5.Height/19.5);
img7.Left:=trunc(img6.Left+img6.Width/17.5);
img7.Top:=Trunc(img6.Top+img6.Height/17.5);
img8.Left:=trunc(img7.Left+img7.Width/15.5);
img8.Top:=Trunc(img7.Top+img7.Height/15.5);
img9.Left:=trunc(img8.Left+img8.Width/13.5);
img9.Top:=Trunc(img8.Top+img8.Height/13.4);
img10.Left:=trunc(img9.Left+img9.Width/11.5);
img10.Top:=Trunc(img9.Top+img9.Height/11.5);
img11.Left:=trunc(img10.Left+img10.Width/9.5);
img11.Top:=Trunc(img10.Top+img10.Height/9.5);
img12.Left:=trunc(img11.Left+img11.Width/7.5);
img12.Top:=Trunc(img11.Top+img11.Height/7.5);
img13.Left:=trunc(img12.Left+img12.Width/5.5);
img13.Top:=Trunc(img12.Top+img12.Height/5.5);
img14.Left:=trunc(img13.Left+img13.Width/3.5);
img14.Top:=Trunc(img13.Top+img13.Height/3.5);
end;

procedure TForm11.tmr2Timer(Sender: TObject);
begin
if StrToInt (Time.Caption) > 0 then  //сравнение caption с 0
Time.Caption := IntToStr (StrToInt (Time.Caption) - 1) //если больше, уменьшать на 1
else begin
lbl6.Visible:=False;
lbl7.Visible:=False;
tmr1.Enabled := false;
tmr2.Enabled := false;
img5.left:=480;
img5.Top:=136;
img6.left:=496;
img6.Top:=152;
img7.left:=512;
img7.Top:=168;
img8.left:=528;
img8.Top:=184;
img9.left:=544;
img9.Top:=200;
img10.left:=560;
img10.Top:=216;
img11.left:=576;
img11.Top:=232;
img12.left:=592;
img12.Top:=248;
img13.left:=608;
img13.Top:=266;
img14.left:=624;
img14.Top:=282;
img15.Visible:=true;
img2.Picture.LoadFromFile('resources\pictures\Повторить.emf');
img2.Visible:=True;
Form11.Cursor:=crDefault;   //Вместо загруженного курсора вернуть обычный
img3.Visible:=True;
Application.Title:='Пулевая стрельба';  //Задание названия окна сообщения
if SumClick.Caption = '0' then
ShowMessage ('Вы проиграли!')   //Вывод на экран сообщения
else
ShowMessage ('Поздравляем! Вы заработали ' + SumClick.Caption + ' очков!');
end;
end;

procedure TForm11.img5Click(Sender: TObject);
var h:hcursor;
begin
if tmr2.Enabled = true then
SumClick.Caption := IntToStr (StrToInt (SumClick.Caption) + 1);
if tmr1.Enabled = true then begin
lbl7.Caption := IntToStr (StrToInt (lbl7.Caption) - 1);
lbl5.Caption := IntToStr (StrToInt (lbl5.Caption) + 1);
h:=LoadCursorFromFile('resources\cursors\gun1.cur'); //загрузка курсора из файла
Screen.Cursors[1]:=h;
Form11.Cursor:=1;
if StrToInt(Form2.lbl2.Caption) mod 2 =1 then begin
mp1.FileName := 'resources\sounds\Выстрел1.wav';  //загрузка аудио из файла
mp1.Open;
mp1.Play;                            //проигрывание аудио
end;
if  lbl7.Caption='0' then begin
lbl6.Visible:=False;
lbl7.Visible:=False;
tmr1.Enabled := false;
tmr2.Enabled := false;
Form11.Cursor:=crDefault;
img3.Visible:=True;
img15.Visible:=true;
img2.Picture.LoadFromFile('resources\pictures\Повторить.emf');
img2.Visible:=True;
Application.Title:='Пулевая стрельба';
ShowMessage('Ой! Закончились патроны! Вы попали '+ SumClick.Caption + ' раз!');
end;
end else Cursor:=crDefault;
end;

procedure TForm11.img2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  var h:hcursor;
begin
if tmr1.Enabled = true then begin
h:=LoadCursorFromFile('resources\cursors\gun.cur');
Screen.Cursors[1]:=h;
Form11.Cursor:=1;
end else Cursor:=crDefault;
end;

procedure TForm11.img1Click(Sender: TObject);
var h: HCURSOR;
begin
if tmr1.Enabled = true then begin
h:=LoadCursorFromFile('resources\cursors\gun1.cur');
Screen.Cursors[1]:=h;
Form11.Cursor:=1;
if StrToInt(Form2.lbl2.Caption) mod 2 =1 then begin
mp1.FileName := 'resources\sounds\Выстрел1.wav';
mp1.Open;
mp1.Play;
end;
lbl5.Caption := IntToStr (StrToInt (lbl5.Caption) + 1);
lbl7.Caption := IntToStr (StrToInt (lbl7.Caption) - 1);
if  lbl7.Caption='0' then begin
lbl6.Visible:=False;
lbl7.Visible:=False;
tmr1.Enabled := false;
tmr2.Enabled := false;
Form11.Cursor:=crDefault;
img3.Visible:=True;
img15.Visible:=true;
img2.Picture.LoadFromFile('resources\pictures\Повторить.emf');
img2.Visible:=True;
Application.Title:='Пулевая стрельба';
ShowMessage('Ой! Закончились патроны! Вы попали '+ SumClick.Caption + ' раз!');
end;
end else Cursor:=crDefault;
end;

procedure TForm11.img1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  var h:HCURSOR;
begin
if tmr1.Enabled = true then begin
h:=LoadCursorFromFile('resources\cursors\gun.cur');
Screen.Cursors[1]:=h;
Form11.Cursor:=1;
end else Cursor:=crDefault;
end;

procedure TForm11.img6Click(Sender: TObject);
var h:HCURSOR;
begin
if tmr2.Enabled = true then
SumClick.Caption := IntToStr (StrToInt (SumClick.Caption) + 2);
if tmr1.Enabled = true then begin
lbl7.Caption := IntToStr (StrToInt (lbl7.Caption) - 1);
lbl5.Caption := IntToStr (StrToInt (lbl5.Caption) + 1);
h:=LoadCursorFromFile('resources\cursors\gun1.cur'); //загрузка курсора из файла
Screen.Cursors[1]:=h;
Form11.Cursor:=1;
if StrToInt(Form2.lbl2.Caption) mod 2 =1 then begin
mp1.FileName := 'resources\sounds\Выстрел1.wav';  //загрузка аудио из файла
mp1.Open;
mp1.Play;                            //проигрывание аудио
end;
if  lbl7.Caption='0' then begin
lbl6.Visible:=False;
lbl7.Visible:=False;
tmr1.Enabled := false;
tmr2.Enabled := false;
Form11.Cursor:=crDefault;
img3.Visible:=True;
img15.Visible:=true;
img2.Picture.LoadFromFile('resources\pictures\Повторить.emf');
img2.Visible:=True;
Application.Title:='Пулевая стрельба';
ShowMessage('Ой! Закончились патроны! Вы попали '+ SumClick.Caption + ' раз!');
end;
end else Cursor:=crDefault;
end;

procedure TForm11.img7Click(Sender: TObject);
var h:HCURSOR;
begin
if tmr2.Enabled = true then
SumClick.Caption := IntToStr (StrToInt (SumClick.Caption) + 3);
if tmr1.Enabled = true then begin
lbl7.Caption := IntToStr (StrToInt (lbl7.Caption) - 1);
lbl5.Caption := IntToStr (StrToInt (lbl5.Caption) + 1);
h:=LoadCursorFromFile('resources\cursors\gun1.cur'); //загрузка курсора из файла
Screen.Cursors[1]:=h;
Form11.Cursor:=1;
if StrToInt(Form2.lbl2.Caption) mod 2 =1 then begin
mp1.FileName := 'resources\sounds\Выстрел1.wav';  //загрузка аудио из файла
mp1.Open;
mp1.Play;                            //проигрывание аудио
end;
if  lbl7.Caption='0' then begin
lbl6.Visible:=False;
lbl7.Visible:=False;
tmr1.Enabled := false;
tmr2.Enabled := false;
Form11.Cursor:=crDefault;
img3.Visible:=True;
img15.Visible:=true;
img2.Picture.LoadFromFile('resources\pictures\Повторить.emf');
img2.Visible:=True;
Application.Title:='Пулевая стрельба';
ShowMessage('Ой! Закончились патроны! Вы попали '+ SumClick.Caption + ' раз!');
end;
end else Cursor:=crDefault;
end;

procedure TForm11.img8Click(Sender: TObject);
var h:HCURSOR;
begin
if tmr2.Enabled = true then
SumClick.Caption := IntToStr (StrToInt (SumClick.Caption) + 4);
if tmr1.Enabled = true then begin
lbl7.Caption := IntToStr (StrToInt (lbl7.Caption) - 1);
lbl5.Caption := IntToStr (StrToInt (lbl5.Caption) + 1);
h:=LoadCursorFromFile('resources\cursors\gun1.cur'); //загрузка курсора из файла
Screen.Cursors[1]:=h;
Form11.Cursor:=1;
if StrToInt(Form2.lbl2.Caption) mod 2 =1 then begin
mp1.FileName := 'resources\sounds\Выстрел1.wav';  //загрузка аудио из файла
mp1.Open;
mp1.Play;                            //проигрывание аудио
end;
if  lbl7.Caption='0' then begin
lbl6.Visible:=False;
lbl7.Visible:=False;
tmr1.Enabled := false;
tmr2.Enabled := false;
Form11.Cursor:=crDefault;
img3.Visible:=True;
img15.Visible:=true;
img2.Picture.LoadFromFile('resources\pictures\Повторить.emf');
img2.Visible:=True;
Application.Title:='Пулевая стрельба';
ShowMessage('Ой! Закончились патроны! Вы попали '+ SumClick.Caption + ' раз!');
end;
end else Cursor:=crDefault;
end;

procedure TForm11.img9Click(Sender: TObject);
var h:hcursor;
begin
if tmr2.Enabled = true then
SumClick.Caption := IntToStr (StrToInt (SumClick.Caption) + 5);
if tmr1.Enabled = true then begin
lbl7.Caption := IntToStr (StrToInt (lbl7.Caption) - 1);
lbl5.Caption := IntToStr (StrToInt (lbl5.Caption) + 1);
h:=LoadCursorFromFile('resources\cursors\gun1.cur'); //загрузка курсора из файла
Screen.Cursors[1]:=h;
Form11.Cursor:=1;
if StrToInt(Form2.lbl2.Caption) mod 2 =1 then begin
mp1.FileName := 'resources\sounds\Выстрел1.wav';  //загрузка аудио из файла
mp1.Open;
mp1.Play;                            //проигрывание аудио
end;
if  lbl7.Caption='0' then begin
lbl6.Visible:=False;
lbl7.Visible:=False;
tmr1.Enabled := false;
tmr2.Enabled := false;
Form11.Cursor:=crDefault;
img3.Visible:=True;
img15.Visible:=true;
img2.Picture.LoadFromFile('resources\pictures\Повторить.emf');
img2.Visible:=True;
Application.Title:='Пулевая стрельба';
ShowMessage('Ой! Закончились патроны! Вы попали '+ SumClick.Caption + ' раз!');
end;
end else Cursor:=crDefault;
end;

procedure TForm11.img10Click(Sender: TObject);
var h:HCURSOR;
begin
if tmr2.Enabled = true then
SumClick.Caption := IntToStr (StrToInt (SumClick.Caption) + 6);
if tmr1.Enabled = true then begin
lbl7.Caption := IntToStr (StrToInt (lbl7.Caption) - 1);
lbl5.Caption := IntToStr (StrToInt (lbl5.Caption) + 1);
h:=LoadCursorFromFile('resources\cursors\gun1.cur'); //загрузка курсора из файла
Screen.Cursors[1]:=h;
Form11.Cursor:=1;
if StrToInt(Form2.lbl2.Caption) mod 2 =1 then begin
mp1.FileName := 'resources\sounds\Выстрел1.wav';  //загрузка аудио из файла
mp1.Open;
mp1.Play;                            //проигрывание аудио
end;
if  lbl7.Caption='0' then begin
lbl6.Visible:=False;
lbl7.Visible:=False;
tmr1.Enabled := false;
tmr2.Enabled := false;
Form11.Cursor:=crDefault;
img3.Visible:=True;
img15.Visible:=true;
img2.Picture.LoadFromFile('resources\pictures\Повторить.emf');
img2.Visible:=True;
Application.Title:='Пулевая стрельба';
ShowMessage('Ой! Закончились патроны! Вы попали '+ SumClick.Caption + ' раз!');
end;
end else Cursor:=crDefault;
end;

procedure TForm11.img11Click(Sender: TObject);
var h:HCURSOR;
begin
if tmr2.Enabled = true then
SumClick.Caption := IntToStr (StrToInt (SumClick.Caption) + 7);
if tmr1.Enabled = true then begin
lbl7.Caption := IntToStr (StrToInt (lbl7.Caption) - 1);
lbl5.Caption := IntToStr (StrToInt (lbl5.Caption) + 1);
h:=LoadCursorFromFile('resources\cursors\gun1.cur'); //загрузка курсора из файла
Screen.Cursors[1]:=h;
Form11.Cursor:=1;
if StrToInt(Form2.lbl2.Caption) mod 2 =1 then begin
mp1.FileName := 'resources\sounds\Выстрел1.wav';  //загрузка аудио из файла
mp1.Open;
mp1.Play;                            //проигрывание аудио
end;
if  lbl7.Caption='0' then begin
lbl6.Visible:=False;
lbl7.Visible:=False;
tmr1.Enabled := false;
tmr2.Enabled := false;
Form11.Cursor:=crDefault;
img3.Visible:=True;
img15.Visible:=true;
img2.Picture.LoadFromFile('resources\pictures\Повторить.emf');
img2.Visible:=True;
Application.Title:='Пулевая стрельба';
ShowMessage('Ой! Закончились патроны! Вы попали '+ SumClick.Caption + ' раз!');
end;
end else Cursor:=crDefault;
end;

procedure TForm11.img12Click(Sender: TObject);
var h:HCURSOR;
begin
if tmr2.Enabled = true then
SumClick.Caption := IntToStr (StrToInt (SumClick.Caption) + 8);
if tmr1.Enabled = true then begin
lbl7.Caption := IntToStr (StrToInt (lbl7.Caption) - 1);
lbl5.Caption := IntToStr (StrToInt (lbl5.Caption) + 1);
h:=LoadCursorFromFile('resources\cursors\gun1.cur'); //загрузка курсора из файла
Screen.Cursors[1]:=h;
Form11.Cursor:=1;
if StrToInt(Form2.lbl2.Caption) mod 2 =1 then begin
mp1.FileName := 'resources\sounds\Выстрел1.wav';  //загрузка аудио из файла
mp1.Open;
mp1.Play;                            //проигрывание аудио
end;
if  lbl7.Caption='0' then begin
lbl6.Visible:=False;
lbl7.Visible:=False;
tmr1.Enabled := false;
tmr2.Enabled := false;
Form11.Cursor:=crDefault;
img3.Visible:=True;
img15.Visible:=true;
img2.Picture.LoadFromFile('resources\pictures\Повторить.emf');
img2.Visible:=True;
Application.Title:='Пулевая стрельба';
ShowMessage('Ой! Закончились патроны! Вы попали '+ SumClick.Caption + ' раз!');
end;
end else Cursor:=crDefault;
end;

procedure TForm11.img13Click(Sender: TObject);
var h:HCURSOR;
begin
if tmr2.Enabled = true then
SumClick.Caption := IntToStr (StrToInt (SumClick.Caption) + 9);
if tmr1.Enabled = true then begin
lbl7.Caption := IntToStr (StrToInt (lbl7.Caption) - 1);
lbl5.Caption := IntToStr (StrToInt (lbl5.Caption) + 1);
h:=LoadCursorFromFile('resources\cursors\gun1.cur'); //загрузка курсора из файла
Screen.Cursors[1]:=h;
Form11.Cursor:=1;
if StrToInt(Form2.lbl2.Caption) mod 2 =1 then begin
mp1.FileName := 'resources\sounds\Выстрел1.wav';  //загрузка аудио из файла
mp1.Open;
mp1.Play;                            //проигрывание аудио
end;
if  lbl7.Caption='0' then begin
lbl6.Visible:=False;
lbl7.Visible:=False;
tmr1.Enabled := false;
tmr2.Enabled := false;
Form11.Cursor:=crDefault;
img3.Visible:=True;
img15.Visible:=true;
img2.Picture.LoadFromFile('resources\pictures\Повторить.emf');
img2.Visible:=True;
Application.Title:='Пулевая стрельба';
ShowMessage('Ой! Закончились патроны! Вы попали '+ SumClick.Caption + ' раз!');
end;
end else Cursor:=crDefault;
end;

procedure TForm11.img14Click(Sender: TObject);
var h:HCURSOR;
begin
if tmr2.Enabled = true then
SumClick.Caption := IntToStr (StrToInt (SumClick.Caption) + 10);
if tmr1.Enabled = true then begin
lbl7.Caption := IntToStr (StrToInt (lbl7.Caption) - 1);
lbl5.Caption := IntToStr (StrToInt (lbl5.Caption) + 1);
h:=LoadCursorFromFile('resources\cursors\gun1.cur'); //загрузка курсора из файла
Screen.Cursors[1]:=h;
Form11.Cursor:=1;
if StrToInt(Form2.lbl2.Caption) mod 2 =1 then begin
mp1.FileName := 'resources\sounds\Выстрел1.wav';  //загрузка аудио из файла
mp1.Open;
mp1.Play;                            //проигрывание аудио
end;
if  lbl7.Caption='0' then begin
lbl6.Visible:=False;
lbl7.Visible:=False;
tmr1.Enabled := false;
tmr2.Enabled := false;
Form11.Cursor:=crDefault;
img3.Visible:=True;
img15.Visible:=true;
img2.Picture.LoadFromFile('resources\pictures\Повторить.emf');
img2.Visible:=True;
Application.Title:='Пулевая стрельба';
ShowMessage('Ой! Закончились патроны! Вы попали '+ SumClick.Caption + ' раз!');
end;
end else Cursor:=crDefault;
end;

procedure TForm11.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TForm11.img15Click(Sender: TObject);
begin
img15.Visible:=false;
img16.Visible:=true;
img17.Visible:=True;
img2.Visible:=false;
img3.Visible:=false;
img18.Visible:=true;
img16.Picture.LoadFromFile('resources\pictures\Правила7.emf');
end;

procedure TForm11.img17Click(Sender: TObject);
begin
img15.Visible:=True;
img16.Visible:=False;
img17.Visible:=False;
img3.Visible:=True;
img2.Visible:=true;
img18.Visible:=false;
img19.Visible:=false;
end;

procedure TForm11.img18Click(Sender: TObject);
begin
img18.Visible:=false;
img19.Visible:=True;
img16.Picture.LoadFromFile('resources\pictures\Правила8.emf');
end;

procedure TForm11.img19Click(Sender: TObject);
begin
img19.Visible:=false;
img18.Visible:=True;
img16.Picture.LoadFromFile('resources\pictures\Правила7.emf');
end;

end.

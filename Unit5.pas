unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MPlayer, StdCtrls, ExtCtrls, jpeg;

type
  TForm5 = class(TForm)
    tmr1: TTimer;
    lbl1: TLabel;
    tmr2: TTimer;
    mp1: TMediaPlayer;
    img1: TImage;
    lbl2: TLabel;
    SumClick: TLabel;
    lbl3: TLabel;
    Time: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    img2: TImage;
    img3: TImage;
    img5: TImage;
    img6: TImage;
    img7: TImage;
    img8: TImage;
    img9: TImage;
    img10: TImage;
    procedure tmr1Timer(Sender: TObject);
    procedure tmr2Timer(Sender: TObject);
    procedure img1Click(Sender: TObject);
    procedure img2Click(Sender: TObject);
    procedure img3Click(Sender: TObject);
    procedure img5Click(Sender: TObject);
    procedure img5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure img6Click(Sender: TObject);
    procedure img8Click(Sender: TObject);
    procedure img9Click(Sender: TObject);
    procedure img10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses Unit2, Unit1, Unit3;

{$R *.dfm}

procedure TForm5.tmr1Timer(Sender: TObject);
begin
img1.Left:=random(form5.ClientWidth - img1.Width); //рандомное нахождение
img1.Top:=random(form5.ClientHeight - img1.Height);//изображения на форме
end;

procedure TForm5.tmr2Timer(Sender: TObject);
begin
if StrToInt (Time.Caption) > 0 then  //сравнение caption с 0
Time.Caption := IntToStr (StrToInt (Time.Caption) - 1) //если больше, уменьшать на 1
else begin
lbl6.Visible:=False;
lbl7.Visible:=False;
tmr1.Enabled := false;
tmr2.Enabled := false;
img1.Visible:=False;
Form5.Cursor:=crDefault;   //Вместо загруженного курсора вернуть обычный
img3.Visible:=True;
img6.Visible:=true;
img2.Picture.LoadFromFile('resources\pictures\Повторить.emf');
img2.Visible:=true;
Application.Title:='Пулевая стрельба';  //Задание названия окна сообщения
if SumClick.Caption = '0' then
ShowMessage ('Вы проиграли!')   //Вывод на экран сообщения
else
ShowMessage ('Поздравляем! Вы попали ' + SumClick.Caption + ' раз!');
end;
end;

procedure TForm5.img1Click(Sender: TObject);
var h:hcursor; //Переменная курсора
begin
if tmr2.Enabled = true then
SumClick.Caption := IntToStr (StrToInt (SumClick.Caption) + 1);
if tmr1.Enabled = true then begin
lbl7.Caption := IntToStr (StrToInt (lbl7.Caption) - 1);
lbl5.Caption := IntToStr (StrToInt (lbl5.Caption) + 1);
h:=LoadCursorFromFile('resources\cursors\gun1.cur'); //загрузка курсора из файла
Screen.Cursors[1]:=h;
Form5.Cursor:=1;
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
img1.Visible:=False;
Form5.Cursor:=crDefault;
img3.Visible:=True;
img2.Picture.LoadFromFile('resources\pictures\Повторить.emf');
img2.Visible:=true;
img6.Visible:=true;
Application.Title:='Пулевая стрельба';
ShowMessage('Ой! Закончились патроны! Вы попали '+ SumClick.Caption + ' раз!');
end;
end else Cursor:=crDefault;
end;

procedure TForm5.img2Click(Sender: TObject);
begin
if tmr1.Enabled = false then
begin
img2.Visible:=false;
lbl7.Caption:='25';
SumClick.Caption := '0';
Time.Caption := '15';
lbl5.Caption:='0';
tmr1.Enabled := true;
tmr2.Enabled := true;
img3.Visible:=False;
lbl6.Visible:=True;
lbl7.Visible:=True;
img1.Visible:=True;
img1.Left:=448;
img1.Top:=192;
img6.Visible:=false;
img9.Visible:=false;
img10.Visible:=False;
end;
end;


procedure TForm5.img3Click(Sender: TObject);
begin
Form5.visible:=false;
mp1.Close;
Form3.Visible:=true;
SumClick.Caption:='0';
Time.Caption:='0';
lbl5.Caption:='0';
lbl7.Caption:='25';
img1.Left:=476;
img1.Top:=176;
img2.Picture.LoadFromFile('resources\pictures\Начать.emf');
end;

procedure TForm5.img5Click(Sender: TObject);
var h:HCURSOR;
begin
if tmr1.Enabled = true then begin
h:=LoadCursorFromFile('resources\cursors\gun1.cur');
Screen.Cursors[1]:=h;
Form5.Cursor:=1;
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
img1.Visible:=False;
Form5.Cursor:=crDefault;
img3.Visible:=True;
img6.Visible:=True;
img2.Picture.LoadFromFile('resources\pictures\Повторить.emf');
img2.Visible:=true;
Application.Title:='Пулевая стрельба';
ShowMessage('Ой! Закончились патроны! Вы попали '+ SumClick.Caption + ' раз!');
end;
end else Cursor:=crDefault;
end;

  procedure TForm5.img5MouseMove(Sender: TObject; Shift: TShiftState; X,
    Y: Integer);
  var h:HCURSOR;
begin
if tmr1.Enabled = true then begin
h:=LoadCursorFromFile('resources\cursors\gun.cur');
Screen.Cursors[1]:=h;
Form5.Cursor:=1;
end else Cursor:=crDefault;
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TForm5.img6Click(Sender: TObject);
begin
img2.Visible:=False;
img3.Visible:=false;
img6.Visible:=false;
img9.Visible:=true;
img7.Visible:=True;
img8.Visible:=true;
img7.Picture.LoadFromFile('resources\pictures\Правила1.emf');
end;

procedure TForm5.img8Click(Sender: TObject);
begin
img2.Visible:=true;
img3.Visible:=True;;
img7.Visible:=false;
img8.Visible:=False;
img6.Visible:=true;
img9.Visible:=False;
img10.Visible:=false;
end;

procedure TForm5.img9Click(Sender: TObject);
begin
img9.Visible:=false;
img10.visible:=True;
img7.Picture.LoadFromFile('resources\pictures\Правила2.emf');
end;

procedure TForm5.img10Click(Sender: TObject);
begin
img10.Visible:=false;
img9.visible:=True;
img7.Picture.LoadFromFile('resources\pictures\Правила1.emf');
end;

end.

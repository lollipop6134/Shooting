unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, MPlayer, StdCtrls, jpeg;

type
  TForm6 = class(TForm)
    lbl1: TLabel;
    SumClick: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    Time: TLabel;
    img1: TImage;
    img2: TImage;
    tmr1: TTimer;
    tmr2: TTimer;
    mp1: TMediaPlayer;
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
    procedure img3Click(Sender: TObject);
    procedure img4Click(Sender: TObject);
    procedure img6Click(Sender: TObject);
    procedure img6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure img7Click(Sender: TObject);
    procedure img9Click(Sender: TObject);
    procedure img10Click(Sender: TObject);
    procedure img11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses Unit1, Unit3, Unit5, Unit2;

{$R *.dfm}

procedure TForm6.tmr1Timer(Sender: TObject);
begin
img1.Left := random (form6.ClientWidth - img1.Width); //рандомное положение
img1.Top := random (form6.ClientHeight - img1.Height);  //картинок на форме
img2.Left := random (form6.ClientWidth - img2.Width);
img2.Top := random (form6.ClientHeight - img2.Height);
end;

procedure TForm6.tmr2Timer(Sender: TObject);
begin
if StrToInt (Time.Caption) > 0 then
Time.Caption := IntToStr (StrToInt (Time.Caption) - 1)
else
begin tmr1.Enabled := false;
tmr2.Enabled := false;
Form6.Cursor:=crDefault;
img4.Visible:=True;
lbl6.Visible:=False;
lbl7.Visible:=false;
img7.Visible:=true;
img3.Picture.LoadFromFile('resources\pictures\Повторить.emf');
img3.Visible:=True;
img1.Left:=288;
img1.Top:=192;  //задание положения изображений на форме
img2.left:=472;
img2.Top:=216;
Application.Title:='Пулевая стрельба'; //задание названия сообщения
if SumClick.Caption = '0' then begin
ShowMessage ('Вы проиграли!');        //вызов сообщения
img1.Left:=288;
img1.Top:=192;
img2.left:=472;
img2.Top:=216;
end else begin
ShowMessage ('Поздравляем! Вы попали ' + SumClick.Caption + ' раз!');
end;
end;
end;

procedure TForm6.img1Click(Sender: TObject);
var h:hcursor;
begin
if tmr2.Enabled = true then
SumClick.Caption := IntToStr (StrToInt (SumClick.Caption) + 1); //счётчик попаданий
if tmr1.Enabled = true then begin
lbl7.Caption := IntToStr (StrToInt (lbl7.Caption) - 1); //отнимаем 1 от счётчика патронов
lbl5.Caption := IntToStr (StrToInt (lbl5.Caption) + 1);  //прибавляем 1 к счётчику выстрелов
h:=LoadCursorFromFile('resources\cursors\gun1.cur'); //загрузка курсора из файла
Screen.Cursors[1]:=h;
Form6.Cursor:=1;
if StrToInt(Form2.lbl2.Caption) mod 2 =1 then begin
mp1.FileName := 'resources\sounds\Выстрел2.wav';  //загрузка аудио из файла
mp1.Open;
mp1.Play;                                    //проигрывание аудио
end;
end else Cursor:=crDefault;          //задание дефолтного курсора
end;

procedure TForm6.img2Click(Sender: TObject);
begin
if tmr2.Enabled = true then begin
tmr2.Enabled:=False;
if StrToInt(Form2.lbl2.Caption) mod 2 =1 then begin
mp1.FileName := 'resources\sounds\Выстрел2.wav';
mp1.Open;
mp1.Play;
end;
lbl7.Caption := IntToStr (StrToInt (lbl7.Caption) - 1);
tmr1.Enabled:=False;
Application.Title:='Пулевая стрельба';
ShowMessage('Вы проиграли! Выстрел в мирного жителя!');
img7.Visible:=true;
img4.visible:=true;
img1.Left:=288;
img1.Top:=192;
img2.left:=472;
img2.Top:=216;
lbl5.Caption := IntToStr (StrToInt (lbl5.Caption) + 1);
lbl7.Visible:=False;
lbl6.Visible:=false;
img3.Picture.LoadFromFile('resources\pictures\Повторить.emf');
img3.Visible:=True;
end;
end;

procedure TForm6.img3Click(Sender: TObject);
begin
if tmr1.Enabled = false then
begin
img1.Visible:=True;
img2.Visible:=True;
SumClick.Caption := '0';
Time.Caption := '15';
lbl5.Caption:='0';
lbl7.Caption:='25';
tmr1.Enabled := true;
tmr2.Enabled := true;
img4.Visible:=False;
lbl6.Visible:=true;
lbl7.Visible:=True;
end;
img3.Visible:=False;
img7.Visible:=false;
end;

procedure TForm6.img4Click(Sender: TObject);
begin
form6.visible:=false;
form3.visible:=True;
mp1.Close;
SumClick.Caption:='0';
Time.Caption:='15';
lbl5.Caption:='0';
lbl7.Caption:='25';
img3.Picture.LoadFromFile('resources\pictures\Начать.emf');
end;

procedure TForm6.img6Click(Sender: TObject);
var h:HCURSOR;
begin
if tmr1.Enabled = true then begin
lbl7.Caption := IntToStr (StrToInt (lbl7.Caption) - 1);
h:=LoadCursorFromFile('resources\cursors\gun1.cur');
Screen.Cursors[1]:=h;
Form6.Cursor:=1;
if StrToInt(Form2.lbl2.Caption) mod 2 =1 then begin
mp1.FileName := 'resources\sounds\Выстрел2.wav';
mp1.Open;
mp1.Play;
end;
lbl5.Caption := IntToStr (StrToInt (lbl5.Caption) + 1);
if  lbl7.Caption='0' then begin
lbl6.Visible:=False;
lbl7.Visible:=False;
tmr1.Enabled := false;
tmr2.Enabled := false;
Form5.Cursor:=crDefault;
img4.Visible:=True;
img1.Left:=288;
img1.Top:=192;
img2.left:=472;
img2.Top:=216;
img7.Visible:=true;
img3.Picture.LoadFromFile('resources\pictures\Повторить.emf');
img3.Visible:=true;
Application.Title:='Пулевая стрельба';
ShowMessage('Ой! Закончились патроны! Вы попали '+ SumClick.Caption + ' раз!');
end;
end else Cursor:=crDefault;
end;

procedure TForm6.img6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  var h:HCURSOR;
begin
if tmr1.Enabled = true then begin
h:=LoadCursorFromFile('resources\cursors\gun.cur');
Screen.Cursors[1]:=h;
Form6.Cursor:=1;
end else Cursor:=crDefault;
end;

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TForm6.img7Click(Sender: TObject);
begin
img4.Visible:=false;
img7.Visible:=false;
img8.Visible:=true;
img9.Visible:=true;
img10.Visible:=True;
img3.Visible:=false;
img8.Picture.LoadFromFile('resources\pictures\Правила3.emf');
end;

procedure TForm6.img9Click(Sender: TObject);
begin
img3.Visible:=true;
img4.Visible:=True;
img7.Visible:=true;
img8.Visible:=false;
img9.Visible:=false;
img10.Visible:=false;
img11.Visible:=false;
end;

procedure TForm6.img10Click(Sender: TObject);
begin
img10.Visible:=false;
img11.Visible:=true;
img8.Picture.LoadFromFile('resources\pictures\Правила4.emf');
end;

procedure TForm6.img11Click(Sender: TObject);
begin
img11.Visible:=false;
img10.Visible:=true;
img8.Picture.LoadFromFile('resources\pictures\Правила3.emf');
end;

end.

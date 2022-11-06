unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, MPlayer, ShellAPI;

type
  TForm2 = class(TForm)
    lbl1: TLabel;
    img1: TImage;
    lbl2: TLabel;
    img2: TImage;
    img3: TImage;
    img4: TImage;
    img5: TImage;
    img6: TImage;
    mp1: TMediaPlayer;
    img7: TImage;
    lbl3: TLabel;
    img8: TImage;
    img9: TImage;
    lbl4: TLabel;
    lbl5: TLabel;
    img10: TImage;
    img11: TImage;
    lbl6: TLabel;
    img13: TImage;
    tmr1: TTimer;
    lst1: TListBox;
    procedure img1Click(Sender: TObject);
    procedure img2Click(Sender: TObject);
    procedure img3Click(Sender: TObject);
    procedure img4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure img7Click(Sender: TObject);
    procedure img8Click(Sender: TObject);
    procedure img10Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lbl4Click(Sender: TObject);
    procedure lbl5Click(Sender: TObject);
    procedure img11Click(Sender: TObject);
    procedure img13Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  music_index:Integer;
implementation

uses Unit1, Unit3, Unit4, Unit13, Unit14;

{$R *.dfm}

procedure TForm2.img1Click(Sender: TObject);
var n:integer;
begin
lbl2.caption:=IntToStr(StrToInt(lbl2.caption)+1); //увеличение на 1 caption
n:=StrToInt(lbl2.caption);          //Присваиваю n значение caption lbl2
if n mod 2 =0 then begin
img1.Picture.LoadFromFile('Выкл.emf');       //Загрузка картинки из файла
lbl5.Caption:='Выстрелы выключены'; end
else begin img1.Picture.LoadFromFile('Вкл.emf');
lbl5.Caption:='Выстрелы включены'; end;
end;

procedure TForm2.img2Click(Sender: TObject);
begin
form2.Visible:=false;
form3.visible:=true;
end;

procedure TForm2.img3Click(Sender: TObject);
begin
Form1.Close;
end;

procedure TForm2.img4Click(Sender: TObject);
begin
Form2.Visible:=false;
form4.visible:=True;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
mp1.FileName :=lst1.Items[0];
music_index := 0;
mp1.Open;
mp1.Play;
end;
procedure TForm2.img7Click(Sender: TObject);
var n:Integer;
begin
lbl3.caption:=IntToStr(StrToInt(lbl3.caption)+1); //увеличение на 1 caption
n:=StrToInt(lbl3.caption);          //Присваиваю n значение caption lbl2
if n mod 2 =0 then begin
img7.Picture.LoadFromFile('Выкл.emf');       //Загрузка картинки из файла
mp1.pause;
lbl4.Caption:='Музыка выключена'; end
else begin
img7.Picture.LoadFromFile('Вкл.emf');
mp1.Play;
lbl4.Caption:='Музыка включена';
end;
end;

procedure TForm2.img8Click(Sender: TObject);
begin
img1.Visible:=True;
img7.Visible:=True;
img9.Visible:=True;
img3.Enabled:=False;
img4.enabled:=false;
img5.Enabled:=false;
lbl4.Visible:=true;
lbl5.Visible:=true;
img10.Visible:=true;
img11.Enabled:=False;
img9.Enabled:=False;
lbl6.Visible:=False;
end;

procedure TForm2.img10Click(Sender: TObject);
begin
img1.Visible:=False;
img7.Visible:=False;
img9.Visible:=False;
img3.Enabled:=true;;
img4.enabled:=true;;
img5.Enabled:=true;;
lbl4.Visible:=False;;
lbl5.Visible:=false;
img10.Visible:=false;
img8.Enabled:=true;
img11.Enabled:=true;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TForm2.lbl4Click(Sender: TObject);
var n:Integer;
begin
lbl3.caption:=IntToStr(StrToInt(lbl3.caption)+1); //увеличение на 1 caption
n:=StrToInt(lbl3.caption);          //Присваиваю n значение caption lbl2
if n mod 2 =0 then begin
img7.Picture.LoadFromFile('Выкл.emf');       //Загрузка картинки из файла
mp1.pause;
lbl4.Caption:='Музыка выключена'; end
else begin
img7.Picture.LoadFromFile('Вкл.emf');
mp1.Play;
lbl4.Caption:='Музыка включена';
end;
end;

procedure TForm2.lbl5Click(Sender: TObject);
var n:Integer;
begin
lbl2.caption:=IntToStr(StrToInt(lbl2.caption)+1); //увеличение на 1 caption
n:=StrToInt(lbl2.caption);          //Присваиваю n значение caption lbl2
if n mod 2 =0 then begin
img1.Picture.LoadFromFile('Выкл.emf');       //Загрузка картинки из файла
lbl5.Caption:='Выстрелы выключены'; end
else begin img1.Picture.LoadFromFile('Вкл.emf');
lbl5.Caption:='Выстрелы включены'; end;
end;

procedure TForm2.img11Click(Sender: TObject);
begin
Form2.Visible:=False;
form13.visible:=True;
end;

procedure TForm2.img13Click(Sender: TObject);
begin
ShellExecute(0,PChar('Open'),PChar('Help.chm'),nil,nil,SW_SHOW);
end;

procedure TForm2.tmr1Timer(Sender: TObject);
var n:Integer;
begin
n:=StrToInt(lbl2.caption);
if mp1.Mode=mpstopped then begin
if music_index = lst1.count-1 then music_index:=-1;
if n mod 2=1 then begin
mp1.FileName:=lst1.Items[music_index+1];
music_index := music_index + 1;
mp1.Open;
mp1.Play;
end;
end;
end;

end.

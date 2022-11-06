unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg;

type
  TForm8 = class(TForm)
    img1: TImage;
    img2: TImage;
    img3: TImage;
    img4: TImage;
    lbl1: TLabel;
    img5: TImage;
    procedure img1Click(Sender: TObject);
    procedure img2Click(Sender: TObject);
    procedure img3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

uses Unit4, Unit2;

{$R *.dfm}

procedure TForm8.img1Click(Sender: TObject);
var n:integer;
begin
Form8.Visible:=false;
form4.Visible:=true;
lbl1.Caption:='1';
n:=StrToInt(lbl1.caption); //присваивание значения caption переменной n
img4.Picture.LoadFromFile(IntToStr(n)+'.emf');//загрузка изображения из файла
img3.Visible:=false;
end;

procedure TForm8.img2Click(Sender: TObject);
var n:Integer;
begin
lbl1.caption:=IntToStr(StrToInt(lbl1.caption)+1); //+1 к caption за клик
img3.Visible:=true;
n:=StrToInt(lbl1.caption); //присваивание значения caption переменной n
img4.Picture.LoadFromFile(IntToStr(n)+'.emf');//загрузка изображения из файла
if n=6 then begin
form2.img2.visible:=True;
Form2.img5.Visible:=False;
Form2.img5.Left:=1;
Form2.lbl1.Visible:=false;
img2.Visible:=false;
n:=1;
end;
end;

procedure TForm8.img3Click(Sender: TObject);
var n:Integer;
begin
lbl1.caption:=IntToStr(StrToInt(lbl1.caption)-1);
n:=StrToInt(lbl1.caption);
img4.Picture.LoadFromFile(IntToStr(n)+'.emf');
if n=6 then n:=1 else img2.Visible:=true;  //проверка условия
if n=1 then img3.Visible:=false;   //если n=1, спрятать картинку
end;

procedure TForm8.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

end.

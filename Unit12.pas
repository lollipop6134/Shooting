unit Unit12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls;

type
  TForm12 = class(TForm)
    img1: TImage;
    img2: TImage;
    img3: TImage;
    lbl1: TLabel;
    img4: TImage;
    rg1: TRadioGroup;
    procedure img1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure img3Click(Sender: TObject);
    procedure img4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;
  f:Text;
  s:UTF8String;
  Nvern,ball:integer;

implementation

uses Unit4;

{$R *.dfm}

procedure TForm12.img1Click(Sender: TObject);
begin
rg1.Items.clear;
rg1.Visible:=True;
lbl1.Visible:=false;
form12.Visible:=false;
form4.visible:=True;
rg1.Items.clear;
rg1.Caption:='';
lbl1.Visible:=false;
end;

procedure TForm12.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TForm12.img3Click(Sender: TObject);
begin
rg1.Visible:=true;
lbl1.Visible:=False;
if (rg1.ItemIndex>-1) and (not Eof(f)) then begin
if rg1.ItemIndex = Nvern-1 then ball:=ball+1; //≈сли выбранный вариант соответствует
rg1.Items.Clear; //номеру верного ответа то балл прибавл€етс€
Repeat //и очищаетс€ поле дл€ следующего вопроса
if (s[1]='-') then begin
delete(s,1,1);
rg1.Caption:=Utf8ToAnsi(s);
end
else if s[1]='*' then begin
delete(s,1,1);
Nvern:=StrToInt(s);
end
else rg1.Items.Add(Utf8ToAnsi(s));
readln(f,s);
until (s[1]='-') or (Eof(f));
end
//≈сли конец файла достигнут, значит вопросы закончились
else if (Eof(f)) then begin
delete(s,1,1);
Nvern:=StrToInt(s);
if rg1.ItemIndex = Nvern-1 then ball:=ball+1;
rg1.Visible:=False;
lbl1.Caption:='–езультат: '+IntToStr(ball); //¬ывод количества баллов
lbl1.Visible:=true;
CloseFile(f);
img1.Visible:=true;
img4.Visible:=true;
img3.Visible:=false;
end;
end;

procedure TForm12.img4Click(Sender: TObject);
begin
rg1.Visible:=True;
lbl1.Visible:=false;
rg1.Items.Clear;
img1.Visible:=false;
img4.Visible:=false;
img3.Visible:=true;
AssignFile(f,'test.txt');
reset(f);
readln(f,s);
ball:=0;
repeat
if (s[1]='-') then begin
delete(s,1,1);
rg1.Caption:=Utf8ToAnsi(s);
end
else if s[1]='*' then begin
delete(s,1,1);
Nvern:=StrToInt(s);
end

else rg1.Items.Add(Utf8ToAnsi(s));
readln(f,s);
until (s[1]='-') or (Eof(f));

end;

end.

unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg;

type
  TForm13 = class(TForm)
    img1: TImage;
    img2: TImage;
    img3: TImage;
    img4: TImage;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    img5: TImage;
    img6: TImage;
    lbl3: TLabel;
    procedure img1Click(Sender: TObject);
    procedure img3Click(Sender: TObject);
    procedure img2Click(Sender: TObject);
    procedure img6Click(Sender: TObject);
    procedure img5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm13.img1Click(Sender: TObject);
begin
form13.Visible:=false;
form2.visible:=true;
if Form2.img11.Visible=True then begin
  lbl1.Visible:=false;
  lbl2.Visible:=false;
  lbl3.Visible:=false;
  img5.Visible:=false;
  img6.Visible:=false;
  img2.Visible:=True;
  img3.Visible:=True;
  edt1.Visible:=false;
  edt2.Visible:=false;
  edt3.Visible:=false;
  edt4.Visible:=false;
  edt1.Text:='';
  edt2.Text:='';
end;
end;

procedure TForm13.img3Click(Sender: TObject);
begin
edt3.Visible:=true;
edt4.Visible:=True;
img2.Visible:=false;
lbl1.Visible:=true;
lbl2.Visible:=true;
img3.Visible:=false;
img6.Visible:=true;
end;

procedure TForm13.img2Click(Sender: TObject);
begin
img3.Visible:=false;
edt1.Visible:=true;
edt2.Visible:=True;
lbl1.Visible:=true;
lbl2.Visible:=true;
img2.Visible:=false;
img5.Visible:=true;
end;

procedure TForm13.img6Click(Sender: TObject);
var SaveTxt:TStringList;
begin
SaveTxt:=TStringList.Create;
SaveTxt.LoadFromFile(ExtractFilePath(Application.ExeName)+'Users.txt');
if (edt3.Text <> '') and (edt4.Text <> '') then begin
 SaveTxt.add(edt3.Text+' '+edt4.Text);
 SaveTxt.SaveToFile(ExtractFilePath(Application.ExeName)+'Users.txt');
 Form13.Visible:=False;
 form2.Visible:=True;
 Form2.lbl6.Visible:=true;
 form2.lbl6.Caption:='Добро пожаловать, '+edt3.Text+'!';
 form2.img11.Visible:=false;
end;
end;

procedure TForm13.img5Click(Sender: TObject);
var SaveTxt:TStringList;
i:Integer;
LogAndPass:string;
begin
SaveTxt:=TStringList.Create;
SaveTxt.LoadFromFile(ExtractFilePath(Application.ExeName)+'Users.txt');
LogAndPass:=edt1.Text+' '+edt2.Text;
lbl3.Visible:=True;
for i:=0 to SaveTxt.Count-1 do
begin
 if LogAndPass = SaveTxt[i] then begin
 Form13.Visible:=false;
 form2.Visible:=true;
 Form2.img11.Visible:=false;
 Form2.lbl6.Visible:=True;
 Form2.lbl6.Caption:='Добро пожаловать, '+edt1.Text+'!';
end else lbl3.Caption:='Введённый логин или пароль не подходит!';
end;
end;

end.

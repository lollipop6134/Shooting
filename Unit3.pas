unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg;

type
  TForm3 = class(TForm)
    img1: TImage;
    img2: TImage;
    img3: TImage;
    img4: TImage;
    img5: TImage;
    img6: TImage;
    procedure img1Click(Sender: TObject);
    procedure img2Click(Sender: TObject);
    procedure img3Click(Sender: TObject);
    procedure img4Click(Sender: TObject);
    procedure img6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit2, Unit5, Unit6, Unit7, Unit11;

{$R *.dfm}

procedure TForm3.img1Click(Sender: TObject);
begin
Form3.Visible:=false;
form2.visible:=True;
end;

procedure TForm3.img2Click(Sender: TObject);
begin
Form3.Visible:=false;
Form5.visible:=True;
end;

procedure TForm3.img3Click(Sender: TObject);
begin
Form3.visible:=False;
form6.visible:=True;
end;

procedure TForm3.img4Click(Sender: TObject);
begin
Form3.visible:=false;
form7.visible:=True;
end;

procedure TForm3.img6Click(Sender: TObject);
begin
form3.Visible:=false;
form11.visible:=True;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

end.

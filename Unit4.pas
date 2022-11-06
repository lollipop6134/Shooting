unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg;

type
  TForm4 = class(TForm)
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure img6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit2, Unit8, Unit9, Unit10, Unit12;

{$R *.dfm}

procedure TForm4.img1Click(Sender: TObject);
begin
Form4.Visible:=false;
form2.visible:=True;
end;

procedure TForm4.img2Click(Sender: TObject);
begin
Form4.Visible:=false;
form8.visible:=True;
end;

procedure TForm4.img3Click(Sender: TObject);
begin
Form4.Visible:=false;
Form9.visible:=True;
end;

procedure TForm4.img4Click(Sender: TObject);
begin
Form4.Visible:=False;
form10.visible:=True;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TForm4.img6Click(Sender: TObject);
begin
Form4.Visible:=false;
form12.visible:=true;
end;

end.

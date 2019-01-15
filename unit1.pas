unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, ComCtrls, mmsystem;

type

  { TForm1 }

  TForm1 = class(TForm)
      Button1: TButton;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Image1: TImage;
    Image2: TImage;
    Label10: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Memo4: TMemo;
    Next1: TButton;
    Next2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Next3: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Next2Click(Sender: TObject);
    procedure NextLengthBoxClick(Sender: TObject);
   // procedure Button2Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);

  private

  public

  end;

var
  Form1: TForm1;
  x,y,z,xbox,ybox:integer;
  wrap:boolean;
  flag: string;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.NextLengthBoxClick(Sender: TObject);
var max,min,cost:integer;
begin
  cost := 0;
  if (flag = 'cube') then begin
  if (StrToint(Edit4.text) <> 0) and (StrToint(Edit5.text)<>0) and (StrToint(Edit6.text)<>0) then begin

        Panel4.Visible:= false;

        x:= StrToint(Edit4.text);
        y:= StrToint(Edit5.text);
        z:= StrToint(Edit6.text);
        if (x>=y) and (x>=z) then max:=x
        else if (z>=x) and (z>=y) then max:=z
        else max:=y;
        if (x<=y) and (x<=z) then min:=x
        else if (z<=x) and (z<=y) then min:=z
        else min:=y;
        xbox:= 2*(x+y+z-max);
        ybox:= 2*(x+y+z-min);
        if (xbox>100) and (ybox>100) then
           wrap:=false
        else wrap:=true;
        if xbox div  200 > 0 then
           cost:= 150*(xbox div 200)  //150 рублей за бумагу 100 на 200 и тип может понадобиться несколько листов , нну я так думаю
        else if ybox div  200 > 0 then
           cost:= 150*(ybox div  200);
        if cost = 0 then cost:=150;
      end
      else exit;
      Panel5.Visible:= true;
      Panel6.Visible:= False;
      if wrap then

  	 	    Memo1.Text:='Вы можете упаковать ваш подарок с помощью бумаги размером: ' + InttoStr(xbox)+  'X' + InttoStr(xbox)+ '.'+'Средняя цена: ' + IntToStr(cost)+';'+'Спасибо за использование нашего приложения. Приятных праздников <3'

      else Memo1.Text:='Вы очень щедрый человек, и поэтому ваш подарок очень большой. Вы  не сможете упаковать ваш подарок с помощью бумаги. Но вы можете украсить его бантом. Получательб будет несомненно рад.'+'Спасибо за использование нашего приложения. Приятных праздников <3';
  end
  else
  if (StrToint(Edit4.text) <> 0) and (StrToint(Edit5.text)<>0) and (StrToint(Edit6.text)<>0) then begin
  	Panel6.Visible:= false;
    y := StrToInt(Edit5.text);
  	Panel5.Visible:= true;
    Memo1.Text := 'К сожалению, ваш подарок нельзя упаковать обёрточной бумагой, но вы можете воспользоваться красивым пакетом высотой' + ' ' + ' ' + IntToStr(y) + '.' + ' ' + 'Спасибо за использование нашего приложения. Приятных праздников <3';
    end;
end;

procedure TForm1.Next2Click(Sender: TObject);
begin
  sndPlaySound('We-wish-you-a-merry-Christmas.wav', SND_ASYNC or Snd_noDefault);
  if (not RadioButton1.Checked) and (not RadioButton2.Checked) then
  begin
   // label6.Visible:=true;
    exit;
  end;
  Panel2.Visible:= false;
  if RadioButton1.Checked then begin
  	 flag := 'cube';
     Panel4.Visible:= true;
  end;
  if RadioButton2.Checked then begin
     flag := 'notCube';
     Panel4.Visible:= true;
  end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
    sndPlaySound('We-wish-you-a-merry-Christmas.wav', SND_ASYNC or Snd_noDefault);
end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

{procedure TForm1.Button2Click(Sender: TObject);
begin
  Button2.Visible:=false;
  Panel1.Visible:=true;
  Panel2.Visible:=true;
end; }

procedure TForm1.PageControl1Change(Sender: TObject);
begin

end;

end.


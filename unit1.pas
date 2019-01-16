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
      Button2: TButton;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Image1: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
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
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Next2Click(Sender: TObject);
    procedure NextLengthBoxClick(Sender: TObject);
   // procedure Button2Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Snow();
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
procedure TForm1.Snow();
var vy: integer;
begin
  Image3.top:= Image3.top + 20;
  Image5.top:= Image5.top + 25;
  Image10.top:= Image10.top + 15;
  Image11.top:= Image11.top + 18;
  Image12.top:= Image12.top + 30;
  Image13.top:= Image13.top + 23;
  Image14.top:= Image14.top + 21;
  Image15.top:= Image15.top + 8;
  if (Image3.top > Form1.height) then begin
     Image3.Top := 0 - Image3.height;
  end;
  if (Image5.top > Form1.height) then begin
     Image5.Top := 0 - Image5.height;
  end;
  if (Image10.top > Form1.height) then begin
     Image10.Top := 0 - Image10.height;
  end;
  if (Image11.top > Form1.height) then begin
     Image11.Top := 0 - Image11.height;
  end;
  if (Image12.top > Form1.height) then begin
     Image12.Top := 0 - Image3.height;
  end;
  if (Image13.top > Form1.height) then begin
     Image13.Top := 0 - Image3.height;
  end;
  if (Image14.top > Form1.height) then begin
     Image14.Top := 0 - Image3.height;
  end;
  if (Image15.top > Form1.height) then begin
     Image15.Top := 0 - Image3.height;
  end;

end;

procedure TForm1.NextLengthBoxClick(Sender: TObject);
var max,min,cost, n:integer;
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
           cost:= 150*(xbox div 200)
        else if ybox div  200 > 0 then
           cost:= 150*(ybox div  200);
        if cost = 0 then cost:=150;
      end
      else exit;
      Panel5.Visible:= true;
      Panel6.Visible:= False;
      if wrap then

  	 	    Memo1.Text:='Вы можете упаковать ваш подарок с помощью бумаги размером: ' + InttoStr(xbox)+  'X' + InttoStr(xbox)+ '.'+'Средняя цена: ' + IntToStr(cost)+';'+'Спасибо за использование нашего приложения. Приятных праздников <3'

      else Memo1.Text:='Вы очень щедрый человек, и поэтому ваш подарок очень большой. Вы  не сможете упаковать ваш подарок с помощью бумаги. Но вы можете украсить его бантом. Получатель будет несомненно рад.'+'Спасибо за использование нашего приложения. Приятных праздников <3';
  end
  else
  if (StrToint(Edit4.text) <> 0) and (StrToint(Edit5.text)<>0) and (StrToint(Edit6.text)<>0) then begin
  	Panel6.Visible:= false;

    x := StrToInt(Edit4.text);
  	Panel5.Visible:= true;
    if (x > 30) then
    begin
      	n := x div 30 + 1;

    	Memo1.Text:='Вы очень щедрый человек, и поэтому ваш подарок очень большой. Ваш подарок не поместится даже в пакетик. Но вы можете украсить его бантом или разрубить на'+' '+intToSTr(n)+' '+'частей и купить'+' '+intToStr(n)+' '+'пакетиков из пятёрочки за'+IntToStr(n*5)+'рублей. Получатель будет несомненно рад. Спасибо за использование нашего приложения. Приятных праздников <3';
    end
    else
    	Memo1.Text := 'К сожалению, ваш подарок нельзя упаковать обёрточной бумагой, но вы можете воспользоваться красивым пакетиком из пятёрочки за 5 рублей  высотой' + ' ' + ' ' + IntToStr(x) + '.' + ' ' + 'Спасибо за использование нашего приложения. Приятных праздников <3';
    end;
end;

procedure TForm1.Next2Click(Sender: TObject);
begin


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

procedure TForm1.Button2Click(Sender: TObject);
begin
         Panel2.Visible := true;
         Panel5.Visible := false;
         Panel6.Visible := true;
         Panel1.Visible := true;
         Edit4.text:='0';
         Edit5.text:='0';
         Edit6.text:='0';


end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

procedure TForm1.Image3Click(Sender: TObject);
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

procedure TForm1.Panel3Click(Sender: TObject);
begin

end;

procedure TForm1.Panel6Click(Sender: TObject);
begin
    sndPlaySound('We-wish-you-a-merry-Christmas.wav', SND_ASYNC or Snd_noDefault);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
    Snow();
end;

end.


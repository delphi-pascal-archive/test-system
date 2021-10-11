unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ShellAPI, StdCtrls, SUISkinEngine, ComCtrls, ToolWin,
  ExtCtrls, ImgList;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Memo1: TMemo;
    N9: TMenuItem;
    suiSkinEngine1: TsuiSkinEngine;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    ImageList1: TImageList;
    N10: TMenuItem;
    N11: TMenuItem;
    N4: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    procedure N8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
  private
    { Private declarations }
  public

  
    { Public declarations }
  end;

var
  Form1: TForm1;
  str,str1:string;
   cd:integer;

implementation

{$R *.dfm}


Function Decode(S: String; Code: Integer): String; 
Var t: Integer; 
Begin 
  For t:=1 to Length(S) Do S[t]:=Chr(Ord(S[t]) xor Code); 
  Result:=S;
End;


procedure TForm1.N8Click(Sender: TObject);
begin
Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
with OpenDialog1 do begin 
  Options:=Options+[ofPathMustExist,ofFileMustExist]; 
  InitialDir:=ExtractFilePath(Application.ExeName); 
  Filter:='Text files (*.txt)|*.txt'; 
 end;
 with SaveDialog1 do begin 
  InitialDir:=ExtractFilePath(Application.ExeName); 
  Filter:='Text files (*.txt)|*.txt'; 
 end;
 Memo1.ScrollBars := ssBoth;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
if OpenDialog1.Execute then begin
  Form1.Caption := OpenDialog1.FileName;
  Memo1.Lines.LoadFromFile
    (OpenDialog1.FileName);
  Memo1.SelStart := 0;
 end;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
SaveDialog1.FileName := Form1.Caption; 
 if SaveDialog1.Execute then begin 
   Memo1.Lines.SaveToFile 
     (SaveDialog1.FileName + '.txt'); 
   Form1.Caption:=SaveDialog1.FileName; 
 end;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
if Memo1.Text=''then
begin
ShowMessage('Введите текст!!!');
end
else
cd:=12;
str:=Memo1.Text;
str1:=Decode(str,cd);
Memo1.Text:=str1;

end;

procedure TForm1.N9Click(Sender: TObject);
begin
Memo1.Clear;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
StatusBar1.Panels[1].Text:='Текущее время: '+TimeToStr(Time);
StatusBar1.Panels[0].Text:='Текущая дата: '+DateToStr(Date);
end;

procedure TForm1.N11Click(Sender: TObject);
begin
ShowMessage(''+form1.Caption+#13+#10+
              ' '+#13+#10+
              'Разработчик: Посохов А.Н. '+#13+#10+
              ' '+#13+#10+
              'Группа: ПР-41'+#13+#10+
              ' '+#13+#10+
              'НЭПТ 2009 !!!');
end;

procedure TForm1.N12Click(Sender: TObject);
begin
suiSkinEngine1.Active:=false;
suiSkinEngine1.SkinFile:='theme\OneBlue';
suiSkinEngine1.Active:=True;
end;

procedure TForm1.N13Click(Sender: TObject);
begin
suiSkinEngine1.Active:=false;
end;

end.

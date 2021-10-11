unit Unit1;

interface



uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtCtrls, StdCtrls, ImgList,
  Grids, DBGrids, DBCtrls, DB, DBTables, ADODB, StoHtmlHelp, Mask, QRCtrls,
  QuickRpt, SUISkinEngine;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Button1: TButton;
    FindDialog1: TFindDialog;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    N5: TMenuItem;
    N6: TMenuItem;
    ImageList1: TImageList;
    N7: TMenuItem;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADOTable2: TADOTable;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    FIO: TEdit;
    GRUP: TEdit;
    Button2: TButton;
    Var1: TRadioButton;
    Var2: TRadioButton;
    Var3: TRadioButton;
    Var4: TRadioButton;
    Var5: TRadioButton;
    Var6: TRadioButton;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    ADOTable3: TADOTable;
    ADOTable4: TADOTable;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    ADOQuery1: TADOQuery;
    DataSource5: TDataSource;
    DataSource6: TDataSource;
    DBGrid6: TDBGrid;
    ADOTable6: TADOTable;
    DBGrid5: TDBGrid;
    ADOTable5: TADOTable;
    DBText1: TDBText;
    ADOQuery2: TADOQuery;
    ADOTable7: TADOTable;
    DataSource7: TDataSource;
    DBGrid7: TDBGrid;
    ADOConnection2: TADOConnection;
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel6: TQRLabel;
    PrintDialog1: TPrintDialog;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    MP101: TMenuItem;
    DiamondBlue1: TMenuItem;
    SteelBlack1: TMenuItem;
    suiSkinEngine2: TsuiSkinEngine;
    Memo1: TMemo;
    QRLabel7: TQRLabel;
    Timer2: TTimer;
    N11: TMenuItem;
    procedure N4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Var1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure SteelBlack1Click(Sender: TObject);
    procedure DiamondBlue1Click(Sender: TObject);
    procedure MP101Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1   :TForm1;

  ds,fm   :string;
  ocen    :string;
  FAM,Group:string;
  Min     :integer;
  kol_v,ix:integer;
  tm      :integer;
  shet,vpr:integer;
  razn    :real;
  shifr,neshifr:string;
  cd      :integer;
  prv     :integer;
  
  
implementation

uses Unit2, Unit3;

{$R *.dfm}

Function Decode(S: String; Code: Integer): String;
Var t: Integer;
Begin
  For t:=1 to Length(S) Do S[t]:=Chr(Ord(S[t]) xor Code);
  Result:=S;
End;

procedure TForm1.N4Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var sob:string;
begin
sob:=('Время вышло !!!');

StatusBar1.Panels[1].Text:=' '+' '+'Вопрос №'+''+IntToStr(vpr);

StatusBar1.Panels[0].Text:=' '+' '+'Времени осталось: ' + Format('%d : %2d',[Min div 60, Min mod 60 ]);
  Dec(Min);
  if Min < 0 then
begin
timer1.enabled:=false;
MessageDlg( sob, mtInformation, [mbOk], 0);

Button1.Visible:=false;
ocen:='';
razn:=(shet/kol_v)*100;
      if ((razn>=0)and(razn<=49))then
      begin
      ocen:='2';
      end;
      if ((razn>=50)and(razn<=69))then
      begin
      ocen:='3';
      end;
      if ((razn>=70)and(razn<=89))then
      begin
      ocen:='4';
      end;
      if ((razn>=90)and(razn<=100))then
      begin
      ocen:='5';
      end;

QRLabel1.Caption:='';
QRLabel2.Caption:='';
QRLabel3.Caption:='';
QRLabel4.Caption:='';
QRLabel5.Caption:='';
QRLabel6.Caption:='';
QRLabel7.Caption:='';
QRSysData1.Caption:='';

QRLabel1.Caption:='Дисциплина:'+' '+ds;
QRLabel2.Caption:='ФИО:'+' '+Fam;
QRLabel3.Caption:='Группа:'+' '+Group;
QRLabel4.Caption:=' '+'Количество вопросов в тесте:'+' '+IntToStr(kol_v);
QRLabel5.Caption:=' '+'Количество отвеченных вопросов:'+' '+IntToStr(vpr-1);
QRLabel6.Caption:=' '+'Количество верных ответов:'+' '+IntToStr(shet-1);
QRLabel7.Caption:=' '+'Предпологаемая оценка:'+' '+ocen;

QRSysData1.Caption:=DateTimeToStr(Date)+' '+TimeToStr(time);

N2.Enabled:=true;
SaveDialog1.FileName := FAM;

// Сохранение результатов тестирования
SaveDialog1.FileName := FAM;
Memo1.Clear;
Memo1.Lines.Add('Дисциплина:'+' '+ds);
Memo1.Lines.Add('');
Memo1.Lines.Add('ФИО:'+' '+Fam);
Memo1.Lines.Add('');
Memo1.Lines.Add('Группа:'+' '+Group);
Memo1.Lines.Add('');
Memo1.Lines.Add('Количество вопросов в тесте:'+' '+IntToStr(kol_v));
Memo1.Lines.Add('');
Memo1.Lines.Add('Количество отвеченных вопросов:'+' '+IntToStr(vpr-1));
Memo1.Lines.Add('');
Memo1.Lines.Add('Количество верных ответов:'+' '+IntToStr(shet-1));
Memo1.Lines.Add('');
Memo1.Lines.Add('Предпологаемая оценка:'+' '+ocen);
Memo1.Lines.Add('');
Memo1.Lines.Add('Дата:'+' '+DateToStr(date)+' '+TimeToStr(time));

neshifr:='';
shifr:='';
cd:=12;
neshifr:=Memo1.Text;
shifr:=Decode(neshifr,cd);
Memo1.Text:=shifr;
Memo1.Lines.SaveToFile(SaveDialog1.FileName + '.txt');
//---------------------------------------------------------

PageControl1.ActivePageIndex := 2;
TabSheet1.Enabled := False;
TabSheet2.Enabled := false;
TabSheet3.Enabled := true;

end;

end;


procedure TForm1.N6Click(Sender: TObject);
begin
pro.showmodal;
end;

procedure TForm1.N7Click(Sender: TObject);
//label gt;
var pyt:string;
    ixx,ixy :integer;
    //prv:integer;
begin
//gt:
shet:=0;
vpr:=0;
prv:=0;

FIO.Clear;
GRUP.Clear;
n2.Enabled:=false;
n11.Enabled:=false;

// Очистка отчета
QRLabel1.Caption:='';
QRLabel2.Caption:='';
QRLabel3.Caption:='';
QRLabel4.Caption:='';
QRLabel5.Caption:='';
QRLabel6.Caption:='';
QRLabel7.Caption:='';
QRSysData1.Caption:='';
//------------------------

// Очистка вариантов ответов
Var1.Caption:='';
Var2.Caption:='';
Var3.Caption:='';
Var4.Caption:='';
Var5.Caption:='';
Var6.Caption:='';
//--------------------

DBText1.Visible:=true;
Var1.Visible:=false;
Var2.Visible:=false;
Var3.Visible:=false;
Var4.Visible:=false;
Var5.Visible:=false;
Var6.Visible:=false;
Button1.Visible:=true;

ADOConnection1.Connected:=false;
pyt:='';
OpenDialog1.Execute;
pyt:=OpenDialog1.FileName;
ADOConnection1.ConnectionString:=pyt;
ADOConnection1.Connected:=true;

ADOTable1.Active:=true;
ADOTable2.Active:=true;
ADOTable3.Active:=true;
ADOTable4.Active:=true;
ADOTable7.Active:=true;


for ixy:=1 to ADOTable4.RecordCount do
begin
ADOTable4.Delete;
ADOTable4.Next;
end;
for ixx:=1 to ADOTable3.RecordCount do
begin
ADOTable3.Delete;
ADOTable3.Next;
end;

ds:='';
ds:=ADOTable7.FieldByName('Название дисциплины').AsString;
kol_v:=strtoint(ADOTable7.FieldByName('Количество вопросов').AsString);
ix:=ADOTable1.RecordCount;
tm:=StrToInt(ADOTable7.FieldByName('Время').AsString);
prv:=ADOTable1.RecordCount;

if (kol_v>(prv-20)) then
begin
ShowMessage('Структура БД не верна, добавьте больше вопросов');
ShowMessage('Программа завершает работу');
//goto gt;
close;
end else


Form1.Caption:=fm+' '+'по дисциплине'+' '+'"'+ds+'"';

PageControl1.ActivePageIndex := 0;
TabSheet1.Enabled := true;
TabSheet2.Enabled := false;
TabSheet3.Enabled := false;


end;

procedure TForm1.DataSource1DataChange(Sender: TObject; Field: TField);
begin
DBGrid1.DataSource;
end;

procedure TForm1.Button2Click(Sender: TObject);
label q1;
var a:array[1..dsMaxStringSize] of integer;
    b,i,x:integer;
begin
 randomize;

 timer1.enabled:=true;
 Min:=tm*60;

 if (FIO.Text = '')and(GRUP.Text = '')  then
  begin
   ShowMessage('Заполните поле Фамилия'+#13+#10+
               ' '+#13+#10+
               'Заполните поле Группа');
  end;

 if (FIO.Text <> '')and(GRUP.Text = '')  then
  begin
   ShowMessage('Заполните поле Группа');
  end;

 if (FIO.Text = '')and(GRUP.Text <> '')  then
  begin
   ShowMessage('Заполните поле Фамилия');
  end;

 if (FIO.Text <> '')and(GRUP.Text <> '')  then
  begin
   ShowMessage('Студент:'+' '+FIO.Text +#13+#10+
               ' '+#13+#10+
               'Из группы:'+' '+GRUP.Text +#13+#10+
               ' '+#13+#10+
               'Начал тестирование');

  PageControl1.ActivePageIndex := 1;
  TabSheet1.Enabled := false;
  TabSheet2.Enabled := true;

  FAM:=FIO.Text;
  Group:=GRUP.Text;
  Button1.Visible:=true;

   for i:=1 to kol_v do
    begin
    b:=random(ix)+1;
    //ShowMessage(inttostr(b));
     for x:=1 to kol_v do
       if (a[i]=b) then continue
        else
         begin
          a[i]:=b;
         end;
    end;

     for i:=1 to kol_v do
    //if (inttostr(a[i])<>ADOTable4.FieldByName('Код').AsString) then
      begin
       ADOQuery1.Active := false;
       ADOQuery1.SQL.Clear;
       ADOQuery1.SQL.Add('SELECT * FROM Вопрос WHERE Код = '+inttostr(a[i])+' ');
       ADOQuery1.Active := true;

       ADOTable4.Insert;
       ADOTable4.FieldByName('Код').AsString:=DBGrid5.Fields[0].AsString;
       ADOTable4.FieldByName('Вопрос').AsString:=DBGrid5.Fields[1].AsString;
       ADOTable4.FieldByName('ID').AsString:=IntToStr(i);
       ADOTable4.post;

       ADOQuery2.Active := false;
       ADOQuery2.SQL.Clear;
       ADOQuery2.SQL.Add('SELECT * FROM Варианты WHERE Код = '+inttostr(a[i])+' ');
       ADOQuery2.Active := true;

       ADOTable3.Insert;
       ADOTable3.FieldByName('Код').AsString:=DBGrid5.Fields[0].AsString;
       ADOTable3.FieldByName('Ответ 1').AsString:=DBGrid6.Fields[1].AsString;
       ADOTable3.FieldByName('Ответ 2').AsString:=DBGrid6.Fields[2].AsString;
       ADOTable3.FieldByName('Ответ 3').AsString:=DBGrid6.Fields[3].AsString;
       ADOTable3.FieldByName('Ответ 4').AsString:=DBGrid6.Fields[4].AsString;
       ADOTable3.FieldByName('Ответ 5').AsString:=DBGrid6.Fields[5].AsString;
       ADOTable3.FieldByName('Ответ 6').AsString:=DBGrid6.Fields[6].AsString;
       ADOTable3.FieldByName('ID').AsString:=IntToStr(i); 
       ADOTable3.post;
     end;
     
end;


ADOTable3.First;
ADOTable4.First;

Var1.Caption:='';
Var2.Caption:='';
Var3.Caption:='';
Var4.Caption:='';
Var5.Caption:='';
Var6.Caption:='';

Var1.Visible:=false;
Var2.Visible:=false;
Var3.Visible:=false;
Var4.Visible:=false;
Var5.Visible:=false;
Var6.Visible:=false;

if (ADOTable3.FieldByName('Ответ 1').AsString<>'') then
begin
Var1.Visible:=true;
Var1.Caption:=ADOTable3.FieldByName('Ответ 1').AsString;
end;

if (ADOTable3.FieldByName('Ответ 2').AsString<>'') then
begin
Var2.Visible:=true;
Var2.Caption:=ADOTable3.FieldByName('Ответ 2').AsString;
end;

if (ADOTable3.FieldByName('Ответ 3').AsString<>'') then
begin
Var3.Visible:=true;
Var3.Caption:=ADOTable3.FieldByName('Ответ 3').AsString;
end;

if (ADOTable3.FieldByName('Ответ 4').AsString<>'') then
begin
Var4.Visible:=true;
Var4.Caption:=ADOTable3.FieldByName('Ответ 4').AsString;
end;

if (ADOTable3.FieldByName('Ответ 5').AsString<>'') then
begin
Var5.Visible:=true;
Var5.Caption:=ADOTable3.FieldByName('Ответ 5').AsString;
end;

if (ADOTable3.FieldByName('Ответ 6').AsString<>'') then
begin
Var6.Visible:=true;
Var6.Caption:=ADOTable3.FieldByName('Ответ 6').AsString;
end;

inc(vpr);
inc(shet);

end;

procedure TForm1.Button1Click(Sender: TObject);
begin

// Проверка на наличие выбора варианта ответа
{if not ((Var1.Checked=false)and(Var2.Checked=false)and(Var3.Checked=false)and(Var4.Checked=false)and(Var5.Checked=false)and(Var6.Checked=false)) then
begin
ShowMessage('Выберите вариант ответа');
end else}

inc(vpr);

ADOTable3.Next;
ADOTable4.Next;

Var1.Caption:='';
Var2.Caption:='';
Var3.Caption:='';
Var4.Caption:='';
Var5.Caption:='';
Var6.Caption:='';

Var1.Checked:=false;
Var2.Checked:=false;
Var3.Checked:=false;
Var4.Checked:=false;
Var5.Checked:=false;
Var6.Checked:=false;

Var1.Visible:=false;
Var2.Visible:=false;
Var3.Visible:=false;
Var4.Visible:=false;
Var5.Visible:=false;
Var6.Visible:=false;

// Проверка на наличие вариантов, если нет, то вариант не отображается 
if (ADOTable3.FieldByName('Ответ 1').AsString<>'') then
begin
Var1.Visible:=true;
Var1.Caption:=ADOTable3.FieldByName('Ответ 1').AsString;
end;

if (ADOTable3.FieldByName('Ответ 2').AsString<>'') then
begin
Var2.Visible:=true;
Var2.Caption:=ADOTable3.FieldByName('Ответ 2').AsString;
end;

if (ADOTable3.FieldByName('Ответ 3').AsString<>'') then
begin
Var3.Visible:=true;
Var3.Caption:=ADOTable3.FieldByName('Ответ 3').AsString;
end;

if (ADOTable3.FieldByName('Ответ 4').AsString<>'') then
begin
Var4.Visible:=true;
Var4.Caption:=ADOTable3.FieldByName('Ответ 4').AsString;
end;

if (ADOTable3.FieldByName('Ответ 5').AsString<>'') then
begin
Var5.Visible:=true;
Var5.Caption:=ADOTable3.FieldByName('Ответ 5').AsString;
end;

if (ADOTable3.FieldByName('Ответ 6').AsString<>'') then
begin
Var6.Visible:=true;
Var6.Caption:=ADOTable3.FieldByName('Ответ 6').AsString;
end;

if (vpr>kol_v) then
begin
DBText1.Visible:=false;

Var1.Visible:=false;
Var2.Visible:=false;
Var3.Visible:=false;
Var4.Visible:=false;
Var5.Visible:=false;
Var6.Visible:=false;

Button1.Visible:=false;

razn:=(shet/vpr)*100;
      if ((razn>=0)and(razn<=49))then
      begin
      ocen:='2';
      end;
      if ((razn>=50)and(razn<=69))then
      begin
      ocen:='3';
      end;
      if ((razn>=70)and(razn<=89))then
      begin
      ocen:='4';
      end;
      if ((razn>=90)and(razn<=100))then
      begin
      ocen:='5';
      end;


QRLabel1.Caption:='';
QRLabel2.Caption:='';
QRLabel3.Caption:='';
QRLabel4.Caption:='';
QRLabel5.Caption:='';
QRLabel6.Caption:='';
QRLabel7.Caption:='';

QRSysData1.Caption:='';

QRLabel1.Caption:='Дисциплина:'+' '+ds;
QRLabel2.Caption:='ФИО:'+' '+Fam;
QRLabel3.Caption:='Группа:'+' '+Group;
QRLabel4.Caption:=' '+'Количество вопросов в тесте:'+' '+IntToStr(kol_v);
QRLabel5.Caption:=' '+'Количество отвеченных вопросов:'+' '+IntToStr(vpr-1);
QRLabel6.Caption:=' '+'Количество верных ответов:'+' '+IntToStr(shet-1);
QRLabel7.Caption:=' '+'Предпологаемая оценка:'+' '+ocen;

QRSysData1.Caption:=DateTimeToStr(Date)+' '+TimeToStr(time);

N2.Enabled:=true;
n11.Enabled:=true;
SaveDialog1.FileName := FAM;

// Сохранение результатов тестирования
Memo1.Clear;
Memo1.Lines.Add('Дисциплина:'+' '+ds);
Memo1.Lines.Add('');
Memo1.Lines.Add('ФИО:'+' '+Fam);
Memo1.Lines.Add('');
Memo1.Lines.Add('Группа:'+' '+Group);
Memo1.Lines.Add('');
Memo1.Lines.Add('Количество вопросов в тесте:'+' '+IntToStr(kol_v));
Memo1.Lines.Add('');
Memo1.Lines.Add('Количество отвеченных вопросов:'+' '+IntToStr(vpr-1));
Memo1.Lines.Add('');
Memo1.Lines.Add('Количество верных ответов:'+' '+IntToStr(shet-1));
Memo1.Lines.Add('');
Memo1.Lines.Add('Предпологаемая оценка:'+' '+ocen);
Memo1.Lines.Add('');
Memo1.Lines.Add('Дата:'+' '+DateToStr(date)+' '+TimeToStr(time));

neshifr:='';
shifr:='';
cd:=12;
neshifr:=Memo1.Text;
shifr:=Decode(neshifr,cd);
Memo1.Text:=shifr;
Memo1.Lines.SaveToFile(SaveDialog1.FileName + '.txt');

PageControl1.ActivePageIndex := 2;
TabSheet1.Enabled := False;
TabSheet2.Enabled := false;
TabSheet3.Enabled := true;

Timer1.Enabled:=false;
end else
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
fm:=Form1.Caption;
end;

procedure TForm1.Var1Click(Sender: TObject);
begin
if (Var1.Checked=true)then
begin
inc(shet);
end;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
QuickRep1.Preview;
end;

procedure TForm1.SteelBlack1Click(Sender: TObject);
begin
suiSkinEngine2.Active:=false;
suiSkinEngine2.SkinFile := 'Theme\SteelBlack.sui';
suiSkinEngine2.Active:=True;
end;

procedure TForm1.DiamondBlue1Click(Sender: TObject);
begin
suiSkinEngine2.Active:=false;
suiSkinEngine2.SkinFile := 'Theme\DiamondBlue.sui';
suiSkinEngine2.Active:=True;
end;

procedure TForm1.MP101Click(Sender: TObject);
begin
suiSkinEngine2.Active:=false;
suiSkinEngine2.SkinFile := 'Theme\MP10.sui';
suiSkinEngine2.Active:=True;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
suiSkinEngine2.Active:=false;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
logo.showmodal;
end;

procedure TForm1.N11Click(Sender: TObject);
var
ixxx,ixyy :integer;
begin
shet:=0;
vpr:=0;
prv:=0;

FIO.Clear;
GRUP.Clear;
n2.Enabled:=false;

// Очистка отчета
QRLabel1.Caption:='';
QRLabel2.Caption:='';
QRLabel3.Caption:='';
QRLabel4.Caption:='';
QRLabel5.Caption:='';
QRLabel6.Caption:='';
QRLabel7.Caption:='';
QRSysData1.Caption:='';
//------------------------

// Очистка вариантов ответов
Var1.Caption:='';
Var2.Caption:='';
Var3.Caption:='';
Var4.Caption:='';
Var5.Caption:='';
Var6.Caption:='';
//--------------------

DBText1.Visible:=true;
Var1.Visible:=false;
Var2.Visible:=false;
Var3.Visible:=false;
Var4.Visible:=false;
Var5.Visible:=false;
Var6.Visible:=false;
Button1.Visible:=true;

for ixyy:=1 to ADOTable4.RecordCount do
begin
ADOTable4.Delete;
ADOTable4.Next;
end;
for ixxx:=1 to ADOTable3.RecordCount do
begin
ADOTable3.Delete;
ADOTable3.Next;
end;

PageControl1.ActivePageIndex := 0;
TabSheet1.Enabled := true;
TabSheet2.Enabled := false;
TabSheet3.Enabled := false;
end;

end.

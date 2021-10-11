program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {logo},
  Unit3 in 'Unit3.pas' {pro};

{$R *.res}

begin
  Application.Initialize;
  Application.HelpFile := '';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tlogo, logo);
  Application.CreateForm(Tpro, pro);
  Application.Run;
end.

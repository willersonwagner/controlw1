program atualiza1;

uses
  Forms,
  atualiza in 'atualiza.pas' {Form1},
  SevenZip in 'SevenZip.pas',
  funcoesDAV in '..\funcoesDAV.pas',
  classes1 in '..\classes1.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

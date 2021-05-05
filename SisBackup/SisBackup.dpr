program SisBackup;

uses
  System.StartUpCopy,
  FMX.Forms,
  UCloudStorageDemo in 'UCloudStorageDemo.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.

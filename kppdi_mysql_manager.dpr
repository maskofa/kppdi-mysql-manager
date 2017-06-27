program kppdi_mysql_manager;

uses
  System.StartUpCopy,
  FMX.Forms,
  ufrmContainer in 'ufrmContainer.pas' {frmContainer},
  uCore in 'uCore.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmContainer, frmContainer);
  Application.Run;
end.

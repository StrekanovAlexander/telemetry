program Telemetry;

uses
  Vcl.Forms,
  uFormMain in 'source\forms\uFormMain.pas' {formMain},
  uDataModule in 'source\data\uDataModule.pas' {DataModuleTelemetry: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformMain, formMain);
  Application.CreateForm(TDataModuleTelemetry, DataModuleTelemetry);
  Application.Run;
end.

unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  System.IOUtils, System.UITypes, Vcl.Dialogs, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDataModuleTelemetry = class(TDataModule)
    FDConnection1: TFDConnection;
    qMeasurements: TFDQuery;
    dsMeasurements: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleTelemetry: TDataModuleTelemetry;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModuleTelemetry.DataModuleCreate(Sender: TObject);
var
  DBPath: string;
begin

  DBPath := TPath.Combine(ExtractFilePath(ParamStr(0)), '..\..\db\telemetry.fdb');

  if not FileExists(DBPath) then
    begin
      MessageDlg('File of database was not found:' + sLineBreak + DBPath, mtError, [mbOK], 0);
      Exit;
    end;

  FDConnection1.Params.Clear;
  FDConnection1.Params.Add('DriverID=FB');
  FDConnection1.Params.Add('Server=localhost');
  FDConnection1.Params.Add('Database=' + DBPath);
  FDConnection1.Params.Add('User_Name=SYSDBA');
  FDConnection1.Params.Add('Password=masterkey');
  FDConnection1.Params.Add('Protocol=TCPIP');
  FDConnection1.Params.Add('CharacterSet=UTF8');
  FDConnection1.LoginPrompt := False;

  try
    FDConnection1.Connected := True;
  except
    on E: Exception do
      MessageDlg('Database connection error:' + sLineBreak + E.Message, mtError, [mbOK], 0);
  end;

end;

end.

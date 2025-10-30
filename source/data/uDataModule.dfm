object DataModuleTelemetry: TDataModuleTelemetry
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=localhost'
      'CharacterSet=UTF8'
      'Protocol=TCPIP'
      'Database=D:\dev\delphi\delphi13\telemetry\db\telemetry.fdb'
      'DriverID=FB')
    LoginPrompt = False
    Left = 32
    Top = 24
  end
  object qMeasurements: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM MEASUREMENTS ORDER BY CREATED_AT DESC')
    Left = 424
    Top = 32
  end
  object dsMeasurements: TDataSource
    DataSet = qMeasurements
    Left = 528
    Top = 32
  end
end

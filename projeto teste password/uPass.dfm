object Form1: TForm1
  Left = 440
  Top = 305
  Width = 141
  Height = 102
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object AlterdataConnection1: TAlterdataConnection
    SpecificOptions.Strings = (
      'SQL Server.LockTimeout=-1')
    LoginPrompt = False
    Left = 8
    Top = 16
  end
  object UniSQLMonitor1: TUniSQLMonitor
    Left = 56
    Top = 24
  end
end

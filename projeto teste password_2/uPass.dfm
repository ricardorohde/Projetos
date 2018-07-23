object Form1: TForm1
  Left = 440
  Top = 305
  Width = 124
  Height = 195
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
  object dbConDbf: TDatabase
    SessionName = 'Default'
    Left = 24
    Top = 80
  end
  object qryDbf: TQuery
    Left = 72
    Top = 80
  end
  object Session: TSession
    KeepConnections = False
    NetFileDir = 'C:\'
    Left = 24
    Top = 16
  end
end

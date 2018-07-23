object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 334
  ClientWidth = 455
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 455
    Height = 334
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object UniConnection1: TUniConnection
    ProviderName = 'ASE'
    Port = 5003
    Database = 'hom_64'
    Username = 'sa'
    Password = 'tusrmvkc'
    Server = '10.10.10.31'
    Connected = True
    LoginPrompt = False
    Left = 88
    Top = 40
  end
  object UniQuery1: TUniQuery
    Connection = UniConnection1
    Left = 72
    Top = 96
  end
  object DataSource1: TDataSource
    DataSet = UniQuery1
    Left = 144
    Top = 96
  end
  object ASEUniProvider1: TASEUniProvider
    Left = 152
    Top = 40
  end
  object Session: TSession
    Active = True
    KeepConnections = False
    SessionName = 'Session'
    Left = 40
    Top = 152
  end
  object dbMain: TItDatabase
    DatabaseName = 'dbMain'
    DriverName = 'SYBASE'
    LoginPrompt = False
    Params.Strings = (
      'DATABASE NAME=hom_64'
      'SERVER NAME=syb157'
      'USER NAME=sa'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'BLOB EDIT LOGGING='
      'LANGDRIVER='
      'SQLQRYMODE=SERVER'
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'DATE MODE=1'
      'SCHEMA CACHE TIME=-1'
      'MAX QUERY TIME=300'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=FALSE'
      'SCHEMA CACHE DIR='
      'HOST NAME='
      'APPLICATION NAME='
      'NATIONAL LANG NAME='
      'ENABLE BCD=FALSE'
      'TDS PACKET SIZE=512'
      'BLOBS TO CACHE=64'
      'BLOB SIZE=32'
      'CS CURSOR ROWS=1'
      'PASSWORD=tusrmvkc')
    ReadOnly = True
    SessionName = 'Session'
    Left = 38
    Top = 26
  end
end

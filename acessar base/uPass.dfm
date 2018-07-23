object Form1: TForm1
  Left = 374
  Top = 138
  Width = 690
  Height = 481
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
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 674
    Height = 169
    Align = alTop
    Lines.Strings = (
      'select * from ')
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 169
    Width = 674
    Height = 239
    Align = alClient
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Calibri'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 408
    Width = 674
    Height = 34
    Align = alBottom
    TabOrder = 2
    object Button1: TButton
      Left = 583
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
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
  object SetupQuery1: TSetupQuery
    SpecificOptions.Strings = (
      'PostgreSQL.UnknownAsString=True'
      'PostgreSQL.UseParamTypes=True')
    Left = 552
    Top = 208
  end
  object DataSource1: TDataSource
    DataSet = SetupQuery1
    Left = 512
    Top = 208
  end
end

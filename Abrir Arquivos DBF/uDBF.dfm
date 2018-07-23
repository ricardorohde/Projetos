object Form1: TForm1
  Left = 169
  Top = 233
  Width = 483
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 475
    Height = 41
    Align = alTop
    TabOrder = 0
    object edtArquivo: TEdit
      Left = 8
      Top = 8
      Width = 297
      Height = 21
      TabOrder = 0
    end
    object Button1: TButton
      Left = 311
      Top = 7
      Width = 54
      Height = 25
      Caption = '...'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 475
    Height = 412
    Align = alClient
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '.DBF'
    Filter = 'Somente Arquivos .DBF|*.DBF'
    InitialDir = 'C:'
    Left = 440
    Top = 40
  end
  object qryDbf: TQuery
    Left = 432
    Top = 8
  end
  object dbConDbf: TDatabase
    SessionName = 'Default'
    Left = 384
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = qryDbf
    Left = 384
    Top = 56
  end
  object Session: TSession
    KeepConnections = False
    NetFileDir = 'C:\'
    Left = 384
    Top = 112
  end
end

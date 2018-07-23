object Form1: TForm1
  Left = 312
  Top = 175
  Width = 586
  Height = 521
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 441
    Width = 570
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Button2: TButton
      Left = 488
      Top = 8
      Width = 75
      Height = 25
      Caption = 'service'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 408
      Top = 8
      Width = 75
      Height = 25
      Caption = 'newservice'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 256
      Top = 8
      Width = 139
      Height = 25
      Caption = 'Recebe Movimento'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 570
    Height = 441
    Align = alClient
    DataSource = dtsmovimento
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object dtsmovimento: TDataSource
    Left = 16
    Top = 120
  end
end

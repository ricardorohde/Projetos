object Form1: TForm1
  Left = 192
  Top = 124
  Width = 407
  Height = 223
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 82
    Width = 40
    Height = 13
    Caption = 'N'#250'mero:'
  end
  object Edit1: TEdit
    Left = 104
    Top = 78
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object btnJogar: TButton
    Left = 232
    Top = 75
    Width = 75
    Height = 25
    Caption = 'Jogar'
    TabOrder = 1
    OnClick = btnJogarClick
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    Left = 40
    Top = 120
  end
  object ServerSocket1: TServerSocket
    Active = True
    Port = 3100
    ServerType = stNonBlocking
    OnClientConnect = ServerSocket1ClientConnect
    OnClientRead = ServerSocket1ClientRead
    Left = 80
    Top = 120
  end
end

object Form1: TForm1
  Left = 192
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Chronometer'
  ClientHeight = 288
  ClientWidth = 566
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 24
  object Display: TLabel
    Left = 208
    Top = 32
    Width = 148
    Height = 29
    Caption = '00:00:00:000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 32
    Top = 232
    Width = 506
    Height = 24
    Caption = 'The Club - O Maior Clube de programadores do Brasil'
  end
  object Label2: TLabel
    Left = 32
    Top = 264
    Width = 267
    Height = 24
    Caption = 'Acesse www.theclub.com.br'
  end
  object btnstart: TButton
    Left = 168
    Top = 96
    Width = 217
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = btnstartClick
  end
  object btnstop: TButton
    Left = 168
    Top = 136
    Width = 217
    Height = 25
    Caption = 'Stop'
    TabOrder = 1
    OnClick = btnstopClick
  end
  object btnReset: TButton
    Left = 168
    Top = 184
    Width = 217
    Height = 25
    Caption = 'Reset'
    TabOrder = 2
    OnClick = btnResetClick
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10
    OnTimer = Timer1Timer
    Left = 424
    Top = 24
  end
end

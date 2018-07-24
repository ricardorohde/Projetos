object fmProcura: TfmProcura
  Left = 342
  Top = 229
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'fmProcura'
  ClientHeight = 230
  ClientWidth = 357
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object paTitulo: TPanel
    Left = 0
    Top = 0
    Width = 357
    Height = 0
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
  end
  object dsMain: TDataSource
    DataSet = qyMain
    Left = 12
    Top = 6
  end
  object qyMain: TADOQuery
    Parameters = <>
    Left = 48
    Top = 8
  end
end

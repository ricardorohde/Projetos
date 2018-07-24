object fmAssistente: TfmAssistente
  Left = 272
  Top = 245
  Width = 516
  Height = 363
  Caption = 'fmAssistente'
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
  object paTitulo: TPanel
    Left = 0
    Top = 0
    Width = 508
    Height = 35
    Align = alTop
    Alignment = taLeftJustify
    BevelInner = bvLowered
    TabOrder = 0
  end
  object paBotoes: TPanel
    Left = 0
    Top = 302
    Width = 508
    Height = 34
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    object sbOk: TSpeedButton
      Left = 240
      Top = 6
      Width = 65
      Height = 22
      Caption = '&OK'
      Visible = False
    end
    object sbCancelar: TSpeedButton
      Left = 306
      Top = 6
      Width = 65
      Height = 22
      Caption = '&Cancelar'
      Visible = False
      OnClick = sbCancelarClick
    end
    object sbAnterior: TSpeedButton
      Left = 372
      Top = 6
      Width = 65
      Height = 22
      Caption = '<< &Anterior'
      Visible = False
      OnClick = sbAnteriorClick
    end
    object sbProximo: TSpeedButton
      Left = 438
      Top = 6
      Width = 65
      Height = 22
      Caption = '&Proximo >>'
      Visible = False
      OnClick = sbProximoClick
    end
  end
  object pcPrincipal: TPageControl
    Left = 0
    Top = 35
    Width = 508
    Height = 267
    Align = alClient
    TabOrder = 2
  end
end

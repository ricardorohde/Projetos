object frmImportadorAFD: TfrmImportadorAFD
  Left = 283
  Top = 228
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmImportadorAFD'
  ClientHeight = 311
  ClientWidth = 558
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pcPrincipal: TcxPageControl
    Left = 157
    Top = 0
    Width = 401
    Height = 270
    ActivePage = pgSelecao2
    Align = alClient
    TabOrder = 0
    ClientRectBottom = 270
    ClientRectRight = 401
    ClientRectTop = 24
    object pgBemVindo: TcxTabSheet
      Caption = 'Bem Vindo'
      ImageIndex = 0
    end
    object pgSelecao1: TcxTabSheet
      Caption = 'Sele'#231#227'o 1'
      ImageIndex = 1
    end
    object pgSelecao2: TcxTabSheet
      Caption = 'Sele'#231#227'o 2'
      ImageIndex = 2
    end
    object pgProcessamento: TcxTabSheet
      Caption = 'Processamento'
      ImageIndex = 3
    end
    object pgFinal: TcxTabSheet
      Caption = 'Final'
      ImageIndex = 4
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 157
    Height = 270
    Align = alLeft
    TabOrder = 1
    object cxImage1: TcxImage
      Left = 5
      Top = 2
      TabOrder = 0
      Height = 265
      Width = 150
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 270
    Width = 558
    Height = 41
    Align = alBottom
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Vers'#227'o'
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 296
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Anterior'
      TabOrder = 1
    end
    object BitBtn3: TBitBtn
      Left = 376
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Pr'#243'ximo'
      TabOrder = 2
    end
    object BitBtn4: TBitBtn
      Left = 464
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Concluir'
      TabOrder = 3
    end
  end
end

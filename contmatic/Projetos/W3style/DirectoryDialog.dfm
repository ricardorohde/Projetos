object fmDirectoryDialog: TfmDirectoryDialog
  Left = 218
  Top = 149
  Width = 374
  Height = 229
  Caption = 'fmDirectoryDialog'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object paPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 366
    Height = 202
    Align = alClient
    Caption = 'paPrincipal'
    TabOrder = 0
    object sbOk: TSpeedButton
      Left = 222
      Top = 175
      Width = 65
      Height = 21
      Caption = '&OK'
      OnClick = sbOkClick
    end
    object sbCancelar: TSpeedButton
      Left = 290
      Top = 175
      Width = 65
      Height = 21
      Caption = '&Cancelar'
      OnClick = sbCancelarClick
    end
    object laDiretorio: TLabel
      Left = 12
      Top = 162
      Width = 113
      Height = 13
      Caption = 'C:\sistemas_d7\w3style'
    end
    object dlbDiretorio: TDirectoryListBox
      Left = 10
      Top = 36
      Width = 345
      Height = 124
      DirLabel = laDiretorio
      ItemHeight = 16
      TabOrder = 0
    end
    object dcbDrive: TDriveComboBox
      Left = 10
      Top = 12
      Width = 345
      Height = 19
      DirList = dlbDiretorio
      TabOrder = 1
    end
  end
end

object Form1: TForm1
  Left = 375
  Top = 125
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'sintegra'
  ClientHeight = 202
  ClientWidth = 289
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 289
    Height = 36
    Align = alTop
    TabOrder = 0
    object edtArquivo: TEdit
      Left = 6
      Top = 6
      Width = 203
      Height = 21
      TabOrder = 0
      Text = 'C:\G5\Arquivos Sintegra\Teste\ARQ60ABRIL2010.txt'
    end
    object btnArquivo: TButton
      Left = 214
      Top = 5
      Width = 35
      Height = 25
      Caption = '...'
      TabOrder = 1
      OnClick = btnArquivoClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 161
    Width = 289
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnOk: TButton
      Left = 123
      Top = 7
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCancelar: TButton
      Left = 208
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 38
    Width = 289
    Height = 120
    TabOrder = 2
  end
  object OpenDialog1: TOpenDialog
    Left = 256
  end
end

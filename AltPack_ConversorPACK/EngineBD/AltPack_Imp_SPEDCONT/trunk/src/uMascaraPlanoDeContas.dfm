object frmMascaraPlanoDeContas: TfrmMascaraPlanoDeContas
  Left = 192
  Top = 125
  BorderStyle = bsSingle
  ClientHeight = 203
  ClientWidth = 325
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 70
    Width = 325
    Height = 92
    Align = alClient
    TabOrder = 0
    object Label2: TLabel
      Left = 14
      Top = 33
      Width = 207
      Height = 13
      Caption = 'M'#225'scara Class. Interna (Plano de Contas): '
    end
    object edtMascaraPlanodeContas: TEdit
      Left = 14
      Top = 51
      Width = 182
      Height = 21
      MaxLength = 20
      TabOrder = 0
      OnKeyPress = edtMascaraPlanodeContasKeyPress
    end
    object chkMascaraForAll: TCheckBox
      Left = 14
      Top = 7
      Width = 307
      Height = 17
      Caption = 'Assumir essa m'#225'scara para todos arquivos selecionados: '
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 162
    Width = 325
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnGravar: TBitBtn
      Left = 243
      Top = 9
      Width = 75
      Height = 25
      Caption = '&Ok'
      TabOrder = 0
      OnClick = btnGravarClick
      Glyph.Data = {
        AA010000424DAA01000000000000AA0000002800000010000000100000000100
        08000000000000010000D10E0000D10E00001D0000001D00000000730000007B
        000000840000008F0000007B0300008406000098060000980B000098110000A1
        110000AB11000BA1160000B616001C841C0000C01C00169823001CA12A000BB6
        2A0000CA2A00388F31001698310016C0400050A1480000FF480073AB60008FB6
        7B0040E08F00FF00FF00FFFFFF001B1B1B1B1B1304161B1B1B1B1B1B1B1B1B1B
        1B1B1B0B0A01181B1B1B1B1B1B1B1B1B1B1B160A0C030D1B1B1B1B1B1B1B1B1B
        1B1B050E0C0601191B1B1B1B1B1B1B1B1B130E0C170E02001B1B1B1B1B1B1B1B
        1B0B1517170A0C01181B1B1B1B1B1B1B1B11171713130C030D1B1B1B1B1B1B1B
        1B1B08081B1B070C01191B1B1B1B1B1B1B1B1B1B1B1B100C02001B1B1B1B1B1B
        1B1B1B1B1B1B1B090C01181B1B1B1B1B1B1B1B1B1B1B1B130C0F101B1B1B1B1B
        1B1B1B1B1B1B1B1B141A0F181B1B1B1B1B1B1B1B1B1B1B1B1012181B1B1B1B1B
        1B1B1B1B1B1B1B1B1B191B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B}
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 325
    Height = 70
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label1: TLabel
      Left = 6
      Top = 4
      Width = 302
      Height = 16
      Caption = 'Informe a m'#225'scara de classifica'#231#227'o interna do '
    end
    object Label3: TLabel
      Left = 6
      Top = 25
      Width = 108
      Height = 16
      Caption = 'plano de contas:'
    end
    object lblEmpresa: TLabel
      Left = 8
      Top = 46
      Width = 64
      Height = 16
      Caption = 'Empresa: '
    end
  end
end

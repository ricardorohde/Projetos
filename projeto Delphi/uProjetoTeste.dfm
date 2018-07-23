object Form1: TForm1
  Left = 215
  Top = 221
  Width = 536
  Height = 255
  Caption = 'Cadastro de Empresa'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 176
    Width = 520
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btnGravar: TBitBtn
      Left = 192
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Gravar'
      TabOrder = 0
      OnClick = btnGravarClick
      Kind = bkOK
    end
    object btnEditar: TBitBtn
      Left = 272
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Editar'
      TabOrder = 1
      OnClick = btnEditarClick
      Kind = bkRetry
    end
    object btnExcluir: TBitBtn
      Left = 352
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Ex&cluir'
      TabOrder = 2
      OnClick = btnExcluirClick
      Kind = bkAbort
    end
    object btnFechar: TBitBtn
      Left = 432
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Fechar'
      TabOrder = 3
      OnClick = btnFecharClick
      Kind = bkClose
    end
    object btnPesquisar: TBitBtn
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Pesquisar'
      TabOrder = 4
      OnClick = btnPesquisarClick
      Kind = bkHelp
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 520
    Height = 176
    Align = alClient
    TabOrder = 1
    object lbl1: TLabel
      Left = 24
      Top = 24
      Width = 80
      Height = 13
      Caption = 'C'#243'digo Empresa:'
    end
    object lbl2: TLabel
      Left = 160
      Top = 22
      Width = 31
      Height = 26
      Caption = 'Nome:'#13#10
    end
    object lbl3: TLabel
      Left = 24
      Top = 71
      Width = 30
      Height = 13
      Caption = 'CNPJ:'
    end
    object lbl4: TLabel
      Left = 160
      Top = 71
      Width = 57
      Height = 13
      Caption = 'Logradouro:'
    end
    object lbl5: TLabel
      Left = 368
      Top = 71
      Width = 40
      Height = 13
      Caption = 'N'#250'mero:'
    end
    object lbl6: TLabel
      Left = 24
      Top = 124
      Width = 36
      Height = 13
      Caption = 'Cidade:'
    end
    object lbl7: TLabel
      Left = 160
      Top = 124
      Width = 30
      Height = 13
      Caption = 'Bairro:'
    end
    object lbl8: TLabel
      Left = 368
      Top = 124
      Width = 17
      Height = 13
      Caption = 'UF:'
    end
    object edtCod: TEdit
      Left = 24
      Top = 40
      Width = 57
      Height = 21
      TabOrder = 0
    end
    object edtNome: TEdit
      Left = 160
      Top = 40
      Width = 193
      Height = 21
      TabOrder = 1
    end
    object edtCnpj: TEdit
      Left = 24
      Top = 89
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object edtLogradouro: TEdit
      Left = 160
      Top = 89
      Width = 193
      Height = 21
      TabOrder = 3
    end
    object edtNumero: TEdit
      Left = 368
      Top = 89
      Width = 81
      Height = 21
      TabOrder = 4
    end
    object edtCidade: TEdit
      Left = 24
      Top = 141
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object edtBairro: TEdit
      Left = 160
      Top = 141
      Width = 121
      Height = 21
      TabOrder = 6
    end
    object edtUf: TEdit
      Left = 368
      Top = 141
      Width = 121
      Height = 21
      TabOrder = 7
    end
  end
end

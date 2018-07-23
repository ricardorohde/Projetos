object frmCadastroClientes: TfrmCadastroClientes
  Left = 0
  Top = 0
  Caption = 'Cadastro de Clientes'
  ClientHeight = 330
  ClientWidth = 273
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 9
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel
    Left = 8
    Top = 49
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object edtCodigo: TEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtNome: TEdit
    Left = 8
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 289
    Width = 273
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 118
    object btnSalvar: TBitBtn
      Left = 136
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Salvar'
      DoubleBuffered = True
      Kind = bkOK
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btnSalvarClick
    end
  end
  object ListBox1: TListBox
    Left = 8
    Top = 104
    Width = 257
    Height = 137
    ItemHeight = 13
    TabOrder = 3
  end
end

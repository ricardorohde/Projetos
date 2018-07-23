object frmLayOutACJEF: TfrmLayOutACJEF
  Left = 339
  Top = 199
  BorderStyle = bsSingle
  Caption = 'Verificar LayOut ACJEF'
  ClientHeight = 421
  ClientWidth = 361
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 361
    Height = 161
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 42
      Width = 20
      Height = 13
      Caption = 'PIS:'
    end
    object Label2: TLabel
      Left = 8
      Top = 83
      Width = 27
      Height = 13
      Caption = 'Data:'
    end
    object Label3: TLabel
      Left = 8
      Top = 3
      Width = 81
      Height = 13
      Caption = 'Arquivo de texto'
    end
    object edtPis: TEdit
      Left = 8
      Top = 58
      Width = 138
      Height = 21
      MaxLength = 12
      TabOrder = 2
    end
    object edtData: TMaskEdit
      Left = 8
      Top = 99
      Width = 63
      Height = 21
      EditMask = '!99/99/0000;0; '
      MaxLength = 10
      TabOrder = 3
    end
    object edtArquivo: TEdit
      Left = 8
      Top = 18
      Width = 225
      Height = 21
      TabOrder = 0
    end
    object btnArquivo: TButton
      Left = 237
      Top = 17
      Width = 27
      Height = 21
      Caption = '...'
      TabOrder = 1
      OnClick = btnArquivoClick
    end
    object btnGerar: TButton
      Left = 8
      Top = 128
      Width = 89
      Height = 25
      Caption = 'Gerar'
      TabOrder = 4
      OnClick = btnGerarClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 161
    Width = 361
    Height = 260
    Align = alClient
    DataSource = dtsACJEF
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'N_Campo'
        Title.Caption = 'N'#176' Campo'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descri'#231#227'o do Campo'
        Width = 212
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor'
        Width = 80
        Visible = True
      end>
  end
  object OpenDialog1: TOpenDialog
    Left = 272
    Top = 16
  end
  object client: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 128
    object clientN_Campo: TIntegerField
      FieldName = 'N_Campo'
    end
    object clientDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object clientVALOR: TStringField
      FieldName = 'VALOR'
      Size = 4
    end
  end
  object dtsACJEF: TDataSource
    DataSet = client
    Left = 144
    Top = 128
  end
end

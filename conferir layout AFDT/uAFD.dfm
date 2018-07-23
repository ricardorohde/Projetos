object frmAFD: TfrmAFD
  Left = 211
  Top = 204
  BorderStyle = bsSingle
  Caption = 'Conferir Lay Out AFDT'
  ClientHeight = 451
  ClientWidth = 958
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
    Width = 958
    Height = 73
    Align = alTop
    TabOrder = 0
    object Label4: TLabel
      Left = 10
      Top = 23
      Width = 41
      Height = 13
      Caption = 'Arquivo:'
    end
    object btnArquivo: TButton
      Left = 373
      Top = 35
      Width = 38
      Height = 25
      Caption = '...'
      TabOrder = 1
      OnClick = btnArquivoClick
    end
    object edtArquivo: TEdit
      Left = 10
      Top = 37
      Width = 358
      Height = 21
      TabOrder = 0
    end
    object chkMultiplos: TCheckBox
      Left = 13
      Top = 6
      Width = 116
      Height = 17
      Caption = 'Multiplos Arquivos'
      TabOrder = 2
      OnClick = chkMultiplosClick
    end
    object Panel3: TPanel
      Left = 428
      Top = 14
      Width = 441
      Height = 51
      BorderStyle = bsSingle
      TabOrder = 3
      object Label3: TLabel
        Left = 186
        Top = 3
        Width = 20
        Height = 13
        Caption = 'PIS:'
        Color = clWhite
        ParentColor = False
      end
      object Label2: TLabel
        Left = 102
        Top = 3
        Width = 52
        Height = 13
        Caption = 'Data Final:'
        Color = clWhite
        ParentColor = False
      end
      object Label1: TLabel
        Left = 19
        Top = 3
        Width = 57
        Height = 13
        Caption = 'Data Inicial:'
        Color = clWhite
        ParentColor = False
      end
      object btnGerar: TButton
        Left = 326
        Top = 14
        Width = 73
        Height = 25
        Caption = 'Gerar'
        TabOrder = 0
        OnClick = btnGerarClick
      end
      object edtPIS: TEdit
        Left = 184
        Top = 18
        Width = 134
        Height = 21
        MaxLength = 12
        TabOrder = 1
        OnExit = edtPISExit
      end
      object edtDtFim: TMaskEdit
        Left = 101
        Top = 18
        Width = 76
        Height = 21
        EditMask = '!99/99/0000;1; '
        MaxLength = 10
        TabOrder = 2
        Text = '  /  /    '
      end
      object edtDtIni: TMaskEdit
        Left = 17
        Top = 18
        Width = 77
        Height = 21
        EditMask = '!99/99/0000;1; '
        MaxLength = 10
        TabOrder = 3
        Text = '  /  /    '
      end
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 73
    Width = 958
    Height = 360
    Align = alClient
    DataSource = dtsAFD
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DtMovimentacao'
        Title.Caption = 'Data'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Marcacao'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Num. REP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tipo_Marcacao'
        Title.Caption = 'Tipo da Marcacao'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Num_Marcacao'
        Title.Caption = 'Seq. Marcacao'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tipo_Reg'
        Title.Caption = 'Tipo Registro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Motivo'
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 433
    Width = 958
    Height = 18
    Align = alBottom
    TabOrder = 2
    object lblRegistros: TLabel
      Left = 16
      Top = 3
      Width = 132
      Height = 13
      Caption = 'Quantidade de Registros: 0'
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 888
    Top = 11
  end
  object client: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'IdxPrimario'
        Fields = 'PIS;DtMovimentacao'
        Options = [ixPrimary]
      end>
    Params = <>
    StoreDefs = True
    Left = 888
    Top = 40
    object clientDtMovimentacao: TStringField
      FieldName = 'DtMovimentacao'
      Size = 12
    end
    object clientMarcacao: TStringField
      FieldName = 'Marcacao'
      Size = 5
    end
    object clientPIS: TStringField
      FieldName = 'PIS'
      Size = 12
    end
    object clientNREP: TStringField
      FieldName = 'Num. REP'
      Size = 17
    end
    object clientTipo_Marcacao: TStringField
      FieldName = 'Tipo_Marcacao'
    end
    object clientNum_Marcacao: TStringField
      FieldName = 'Num_Marcacao'
      Size = 2
    end
    object clientTipo_Reg: TStringField
      FieldName = 'Tipo_Reg'
    end
    object clientMotivo: TStringField
      FieldName = 'Motivo'
      Size = 100
    end
  end
  object dtsAFD: TDataSource
    DataSet = client
    OnDataChange = dtsAFDDataChange
    Left = 888
    Top = 72
  end
  object shlGetDirectory: TcxShellBrowserDialog
    FolderLabelCaption = 'Selecione o diret'#243'rio'
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = True
    Path = 'C:\'
    Left = 920
    Top = 8
  end
  object AltFFVclSkin1: TAltNxVclSkin
    Active = True
    TipoIdentificacaoUsuario = iuID
    Left = 917
    Top = 37
  end
end

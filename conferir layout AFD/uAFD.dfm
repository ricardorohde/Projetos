object frmAFD: TfrmAFD
  Left = 215
  Top = 148
  BorderStyle = bsSingle
  Caption = 'Conferir Lay Out AFD'
  ClientHeight = 602
  ClientWidth = 532
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
    Width = 532
    Height = 159
    Align = alTop
    TabOrder = 0
    object Shape1: TShape
      Left = 10
      Top = 73
      Width = 495
      Height = 50
    end
    object Label1: TLabel
      Left = 19
      Top = 81
      Width = 57
      Height = 13
      Caption = 'Data Inicial:'
      Color = clWhite
      ParentColor = False
    end
    object Label2: TLabel
      Left = 102
      Top = 81
      Width = 52
      Height = 13
      Caption = 'Data Final:'
      Color = clWhite
      ParentColor = False
    end
    object Label3: TLabel
      Left = 186
      Top = 81
      Width = 20
      Height = 13
      Caption = 'PIS:'
      Color = clWhite
      ParentColor = False
    end
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
      TabOrder = 4
      OnClick = btnArquivoClick
    end
    object edtArquivo: TEdit
      Left = 10
      Top = 37
      Width = 358
      Height = 21
      TabOrder = 0
    end
    object btnGerar: TButton
      Left = 326
      Top = 92
      Width = 75
      Height = 25
      Caption = 'Gerar'
      TabOrder = 5
      OnClick = btnGerarClick
    end
    object edtDtIni: TMaskEdit
      Left = 17
      Top = 94
      Width = 77
      Height = 21
      EditMask = '!99/99/0000;1; '
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
    object edtPIS: TEdit
      Left = 184
      Top = 94
      Width = 136
      Height = 21
      MaxLength = 12
      TabOrder = 3
      OnExit = edtPISExit
    end
    object edtDtFim: TMaskEdit
      Left = 101
      Top = 94
      Width = 77
      Height = 21
      EditMask = '!99/99/0000;1; '
      MaxLength = 10
      TabOrder = 2
      Text = '  /  /    '
    end
    object chkMultiplos: TCheckBox
      Left = 13
      Top = 6
      Width = 116
      Height = 17
      Caption = 'Multiplos Arquivos'
      TabOrder = 6
      OnClick = chkMultiplosClick
    end
    object btnGerarArquivo: TButton
      Left = 299
      Top = 129
      Width = 202
      Height = 25
      Caption = 'Gerar Arquivo com os Dados Filtrados'
      Enabled = False
      TabOrder = 7
      OnClick = btnGerarArquivoClick
    end
    object Button1: TButton
      Left = 10
      Top = 129
      Width = 135
      Height = 25
      Caption = 'Adicionar Movimenta'#231#227'o'
      TabOrder = 8
      OnClick = Button1Click
    end
    object btnExcluirMov: TButton
      Left = 153
      Top = 129
      Width = 135
      Height = 25
      Caption = 'Excluir Movimenta'#231#227'o'
      TabOrder = 9
      OnClick = btnExcluirMovClick
    end
    object btnPonteirar: TButton
      Left = 414
      Top = 92
      Width = 75
      Height = 25
      Caption = 'Ponteirar'
      TabOrder = 10
      OnClick = btnPonteirarClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 159
    Width = 532
    Height = 425
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
        FieldName = 'PIS'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DtMovimentacao'
        Title.Caption = 'Data'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HrMovimentacao1'
        Title.Caption = 'Hora1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HrMovimentacao2'
        Title.Caption = 'Hora2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HrMovimentacao3'
        Title.Caption = 'Hora3'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HrMovimentacao4'
        Title.Caption = 'Hora4'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HrMovimentacao5'
        Title.Caption = 'Hora5'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HrMovimentacao6'
        Title.Caption = 'Hora6'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HrMovimentacao7'
        Title.Caption = 'Hora7'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HrMovimentacao8'
        Title.Caption = 'Hora8'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HrMovimentacao9'
        Title.Caption = 'Hora9'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HrMovimentacao10'
        Title.Caption = 'Hora10'
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 584
    Width = 532
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
    Left = 416
    Top = 3
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
    Left = 416
    Top = 32
    object clientPIS: TStringField
      FieldName = 'PIS'
      Size = 12
    end
    object clientDtMovimentacao: TStringField
      FieldName = 'DtMovimentacao'
      Size = 12
    end
    object clientHrMovimentacao1: TStringField
      FieldName = 'HrMovimentacao1'
      Size = 5
    end
    object clientHrMovimentacao2: TStringField
      FieldName = 'HrMovimentacao2'
      Size = 5
    end
    object clientHrMovimentacao3: TStringField
      FieldName = 'HrMovimentacao3'
      Size = 5
    end
    object clientHrMovimentacao4: TStringField
      FieldName = 'HrMovimentacao4'
      Size = 5
    end
    object clientHrMovimentacao5: TStringField
      FieldName = 'HrMovimentacao5'
      Size = 5
    end
    object clientHrMovimentacao6: TStringField
      FieldName = 'HrMovimentacao6'
      Size = 6
    end
    object clientHrMovimentacao7: TStringField
      FieldName = 'HrMovimentacao7'
      Size = 5
    end
    object clientHrMovimentacao8: TStringField
      FieldName = 'HrMovimentacao8'
      Size = 5
    end
    object clientHrMovimentacao9: TStringField
      FieldName = 'HrMovimentacao9'
      Size = 5
    end
    object clientHrMovimentacao10: TStringField
      FieldName = 'HrMovimentacao10'
      Size = 5
    end
    object clientNSR1: TStringField
      FieldName = 'NSR1'
      Size = 9
    end
    object clientNSR2: TStringField
      FieldName = 'NSR2'
      Size = 9
    end
    object clientNSR3: TStringField
      FieldName = 'NSR3'
      Size = 9
    end
    object clientNSR4: TStringField
      FieldName = 'NSR4'
      Size = 9
    end
    object clientNSR5: TStringField
      FieldName = 'NSR5'
      Size = 9
    end
    object clientNSR6: TStringField
      FieldName = 'NSR6'
      Size = 9
    end
    object clientNSR7: TStringField
      FieldName = 'NSR7'
      Size = 9
    end
    object clientNSR8: TStringField
      FieldName = 'NSR8'
      Size = 9
    end
    object clientNSR9: TStringField
      FieldName = 'NSR9'
      Size = 9
    end
    object clientNSR10: TStringField
      FieldName = 'NSR10'
      Size = 9
    end
  end
  object dtsAFD: TDataSource
    DataSet = client
    OnDataChange = dtsAFDDataChange
    Left = 416
    Top = 64
  end
  object shlGetDirectory: TcxShellBrowserDialog
    FolderLabelCaption = 'Selecione o diret'#243'rio'
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = True
    Path = 'C:\'
    Left = 448
  end
  object AltFFVclSkin1: TAltNxVclSkin
    Active = True
    TipoIdentificacaoUsuario = iuID
    Left = 445
    Top = 29
  end
end

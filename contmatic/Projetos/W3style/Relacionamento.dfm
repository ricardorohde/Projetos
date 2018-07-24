object fmRelacionamento: TfmRelacionamento
  Left = 260
  Top = 186
  BorderStyle = bsDialog
  Caption = 'fmRelacionamento'
  ClientHeight = 311
  ClientWidth = 547
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 547
    Height = 31
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 92
      Height = 13
      Caption = 'Relacionamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object DBGrid1: TDBGridPesquisa
    Left = 0
    Top = 31
    Width = 547
    Height = 111
    Align = alTop
    DataSource = dsRelacionamento
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NOTABELA'
        Title.Caption = 'Tabela'
        Width = 267
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QtRegistros'
        Title.Caption = 'Qtd. Registros'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CDRELACIONAMENTO_TABELA'
        Title.Caption = 'Cod Relacionamento'
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 142
    Width = 547
    Height = 29
    Align = alTop
    TabOrder = 2
    object Label2: TLabel
      Left = 10
      Top = 8
      Width = 126
      Height = 13
      Caption = 'Campos Relacionados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object DBGrid2: TDBGridPesquisa
    Left = 0
    Top = 171
    Width = 547
    Height = 99
    Align = alClient
    DataSource = dsCampos
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DSCAMPO'
        Title.Caption = 'Campo'
        Width = 259
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAMPO_REFERENCIADO'
        Title.Caption = 'Campo Referenciado'
        Width = 254
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 270
    Width = 547
    Height = 41
    Align = alBottom
    TabOrder = 4
    object btOk: TButton
      Left = 222
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Ok'
      Default = True
      TabOrder = 0
      OnClick = btOkClick
    end
  end
  object qyRelacionamento: TQuery
    OnCalcFields = qyRelacionamentoCalcFields
    DatabaseName = 'dbMain'     SessionName = 'Session'
    SQL.Strings = (
      'SELECT CDRELACIONAMENTO_TABELA,'
      '               NOTABELA'
      'FROM RELACIONAMENTO_TABELA'
      'WHERE NOTABELA_REFERENCIADA = :NOTABELA_REFERENCIADA')
    Left = 60
    Top = 66
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NOTABELA_REFERENCIADA'
        ParamType = ptUnknown
      end>
    object qyRelacionamentoCDRELACIONAMENTO_TABELA: TFloatField
      FieldName = 'CDRELACIONAMENTO_TABELA'
      Origin = 'DBMAIN.RELACIONAMENTO_TABELA.CDRELACIONAMENTO_TABELA'
    end
    object qyRelacionamentoNOTABELA: TStringField
      DisplayWidth = 60
      FieldName = 'NOTABELA'
      Origin = 'DBMAIN.TABELA.NOTABELA'
      Size = 30
    end
    object qyRelacionamentoQtRegistros: TIntegerField
      DisplayWidth = 12
      FieldKind = fkCalculated
      FieldName = 'QtRegistros'
      Calculated = True
    end
  end
  object dsRelacionamento: TDataSource
    DataSet = qyRelacionamento
    Left = 62
    Top = 30
  end
  object qyCampo: TQuery
    DatabaseName = 'dbMain'     SessionName = 'Session'
    DataSource = dsRelacionamento
    SQL.Strings = (
      'SELECT CT.DSCAMPO,'
      '       CTR.DSCAMPO CAMPO_REFERENCIADO'
      'FROM CAMPO_RELACIONAMENTO_TABELA CRT,'
      '     CAMPO_TABELA CT,'
      '     CAMPO_TABELA CTR'
      'WHERE  CRT.NOTABELA = CT.NOTABELA'
      'AND    CRT.NOCAMPO = CT.NOCAMPO'
      'AND    CRT.NOTABELA_REFERENCIADA = CTR.NOTABELA'
      'AND    CRT.NOCAMPO_REFERENCIADO = CTR.NOCAMPO'
      'AND    CRT.CDRELACIONAMENTO_TABELA = :CDRELACIONAMENTO_TABELA')
    Left = 54
    Top = 242
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CDRELACIONAMENTO_TABELA'
        ParamType = ptUnknown
      end>
  end
  object dsCampos: TDataSource
    DataSet = qyCampo
    Left = 22
    Top = 202
  end
  object qyCalc_Campo: TQuery
    DatabaseName = 'dbMain'     SessionName = 'Session'
    SQL.Strings = (
      'SELECT CRT.NOCAMPO,'
      '       CRT.NOCAMPO_REFERENCIADO'
      'FROM CAMPO_RELACIONAMENTO_TABELA CRT'
      'WHERE  CRT.CDRELACIONAMENTO_TABELA = :CDRELACIONAMENTO_TABELA')
    Left = 144
    Top = 34
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CDRELACIONAMENTO_TABELA'
        ParamType = ptUnknown
      end>
  end
  object qyTmp: TQuery
    DatabaseName = 'dbMain'     SessionName = 'Session'
    Left = 208
    Top = 34
  end
end

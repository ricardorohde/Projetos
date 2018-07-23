object frmConfigure: TfrmConfigure
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Configurando o Impacto Mobile - SFA'
  ClientHeight = 473
  ClientWidth = 617
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 617
    Height = 429
    Align = alClient
    Caption = 'Informa'#231#245'es Gerais'
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 20
      Width = 73
      Height = 13
      Caption = 'Ambiente Ativo'
      FocusControl = dbedtActived
    end
    object Label3: TLabel
      Left = 5
      Top = 60
      Width = 79
      Height = 13
      Caption = 'Caminho do LOG'
      FocusControl = dbedtLogPath
    end
    object Label2: TLabel
      Left = 5
      Top = 96
      Width = 26
      Height = 13
      Caption = 'Porta'
      FocusControl = DBEdit1
    end
    object Label4: TLabel
      Left = 5
      Top = 136
      Width = 41
      Height = 13
      Caption = 'Empresa'
      FocusControl = DBEdit2
    end
    object Label5: TLabel
      Left = 5
      Top = 176
      Width = 20
      Height = 13
      Caption = 'Filial'
      FocusControl = DBEdit3
    end
    object Label6: TLabel
      Left = 5
      Top = 217
      Width = 33
      Height = 13
      Caption = 'Estado'
      FocusControl = DBEdit4
    end
    object Label7: TLabel
      Left = 5
      Top = 253
      Width = 135
      Height = 13
      Caption = 'Hora para atualiza'#231#227'o pre'#231'o'
      FocusControl = DBEdit5
    end
    object Label8: TLabel
      Left = 5
      Top = 296
      Width = 188
      Height = 13
      Caption = 'Atualiza o Estoque (Tempo para Horas)'
      FocusControl = DBEdit6
    end
    object Label9: TLabel
      Left = 5
      Top = 338
      Width = 191
      Height = 13
      Caption = 'Hora para atualiza'#231#227'o clientes/produtos'
    end
    object dbedtActived: TDBEdit
      Left = 5
      Top = 36
      Width = 600
      Height = 21
      DataField = 'ACTIVED'
      DataSource = dtsMobile
      TabOrder = 0
    end
    object dbedtLogPath: TDBEdit
      Left = 5
      Top = 76
      Width = 564
      Height = 21
      DataField = 'LOG_PATH'
      DataSource = dtsMobile
      TabOrder = 1
    end
    object Button1: TButton
      Left = 571
      Top = 74
      Width = 34
      Height = 25
      Caption = 'Abrir'
      TabOrder = 2
      OnClick = Button1Click
    end
    object DBEdit1: TDBEdit
      Left = 5
      Top = 112
      Width = 134
      Height = 21
      DataField = 'PORTA'
      DataSource = dtsMobile
      TabOrder = 3
    end
    object DBEdit2: TDBEdit
      Left = 5
      Top = 152
      Width = 43
      Height = 21
      DataField = 'EMPRESA'
      DataSource = dtsMobile
      TabOrder = 4
    end
    object DBEdit3: TDBEdit
      Left = 5
      Top = 192
      Width = 41
      Height = 21
      DataField = 'FILIAL'
      DataSource = dtsMobile
      TabOrder = 5
    end
    object DBEdit4: TDBEdit
      Left = 5
      Top = 233
      Width = 30
      Height = 21
      DataField = 'STATE'
      DataSource = dtsMobile
      TabOrder = 6
    end
    object DBEdit5: TDBEdit
      Left = 3
      Top = 269
      Width = 134
      Height = 21
      DataField = 'HORAPRECO'
      DataSource = dtsMobile
      MaxLength = 5
      TabOrder = 7
    end
    object DBEdit6: TDBEdit
      Left = 5
      Top = 312
      Width = 134
      Height = 21
      DataField = 'ATUALIZAESTOQUE'
      DataSource = dtsMobile
      TabOrder = 8
    end
    object DBEdit7: TDBEdit
      Left = 5
      Top = 356
      Width = 132
      Height = 21
      DataField = 'HORAINICIOIMPORTACAO'
      DataSource = dtsMobile
      MaxLength = 16
      TabOrder = 9
    end
    object dbchkPrimeiraExecucao: TDBCheckBox
      Left = 5
      Top = 390
      Width = 124
      Height = 17
      Caption = 'Primeira Execu'#231#227'o'
      DataField = 'PRIMEIRAEXECUCAO'
      DataSource = dtsMobile
      TabOrder = 10
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 429
    Width = 617
    Height = 44
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    object btnConfirmar: TButton
      Left = 454
      Top = 12
      Width = 75
      Height = 25
      Caption = '&Confirmar'
      ModalResult = 1
      TabOrder = 0
      OnClick = btnConfirmarClick
    end
    object btnFechar: TButton
      Left = 535
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Fecha&r'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object cdsMobile: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ACTIVED'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'LOG_PATH'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'PORTA'
        DataType = ftInteger
      end
      item
        Name = 'EMPRESA'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'FILIAL'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'STATE'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'HORAPRECO'
        DataType = ftTime
      end
      item
        Name = 'ATUALIZAESTOQUE'
        DataType = ftInteger
      end
      item
        Name = 'HORAINICIOIMPORTACAO'
        DataType = ftTime
      end
      item
        Name = 'PRIMEIRAEXECUCAO'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 560
    Top = 160
    Data = {
      120100009619E0BD01000000180000000A000000000003000000120107414354
      495645440100490000000100055749445448020002008000084C4F475F504154
      48010049000000010005574944544802000200800005504F5254410400010000
      00000007454D5052455341010049000000010005574944544802000200020006
      46494C49414C0100490000000100055749445448020002000200055354415445
      010049000000010005574944544802000200020009484F5241505245434F0400
      0700000000000F415455414C495A414553544F51554504000100000000001448
      4F5241494E4943494F494D504F52544143414F0400070000000000105052494D
      45495241455845435543414F02000300000000000000}
    object cdsMobileACTIVED: TStringField
      FieldName = 'ACTIVED'
      OnValidate = cdsMobileACTIVEDValidate
      Size = 128
    end
    object cdsMobileLOG_PATH: TStringField
      FieldName = 'LOG_PATH'
      OnValidate = cdsMobileLOG_PATHValidate
      Size = 128
    end
    object cdsMobilePORTA: TIntegerField
      DisplayLabel = 'Porta'
      FieldName = 'PORTA'
      OnValidate = cdsMobilePORTAValidate
    end
    object cdsMobileEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      OnValidate = cdsMobileEMPRESAValidate
      Size = 2
    end
    object cdsMobileFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      OnValidate = cdsMobileFILIALValidate
      Size = 2
    end
    object cdsMobileSTATE: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'STATE'
      Size = 2
    end
    object cdsMobileHORAPRECO: TTimeField
      DisplayLabel = 'Hora para atualiza'#231#227'o'
      FieldName = 'HORAPRECO'
      EditMask = '90:00;1;_'
    end
    object cdsMobileATUALIZAESTOQUE: TIntegerField
      DisplayLabel = 'Atualiza o Estoque (Tempo para Horas)'
      FieldName = 'ATUALIZAESTOQUE'
    end
    object cdsMobileHORAINICIOIMPORTACAO: TDateTimeField
      DisplayLabel = 'Hora para In'#237'cio atualiza'#231#227'o'
      FieldName = 'HORAINICIOIMPORTACAO'
      EditMask = '!99/99/0000 00:00;1; '
    end
    object cdsMobilePRIMEIRAEXECUCAO: TBooleanField
      FieldName = 'PRIMEIRAEXECUCAO'
    end
  end
  object dtsMobile: TDataSource
    DataSet = cdsMobile
    OnDataChange = dtsMobileDataChange
    Left = 560
    Top = 208
  end
  object sdgLog: TSaveDialog
    DefaultExt = 'log'
    FileName = 'AppMobile'
    Filter = 'Log|*.log'
    Title = 'Caminho do Log'
    Left = 560
    Top = 112
  end
end

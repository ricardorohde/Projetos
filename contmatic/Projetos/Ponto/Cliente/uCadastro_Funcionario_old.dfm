inherited frmCadastro_Funcionario: TfrmCadastro_Funcionario
  Caption = 'Cadastro de Funcion'#225'rio'
  ClientWidth = 607
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 607
    ActivePage = tsDetalhe
    inherited tsDados: TTabSheet
      inherited DBGrid1: TDBGrid
        Width = 599
        Columns = <
          item
            Alignment = taLeftJustify
            Expanded = False
            FieldName = 'CODIGO_EXTERNO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Alignment = taCenter
            Title.Caption = 'Nome'
            Width = 269
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_NASCIMENTO'
            Title.Alignment = taCenter
            Title.Caption = 'Data Nasc.'
            Width = 128
            Visible = True
          end>
      end
    end
    inherited tsDetalhe: TTabSheet
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 87
        Top = 9
        Width = 27
        Height = 13
        Caption = 'Nome'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 8
        Top = 48
        Width = 81
        Height = 13
        Caption = 'Data Nascimento'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 8
        Top = 128
        Width = 32
        Height = 13
        Caption = 'Sal'#225'rio'
        FocusControl = DBEdit4
      end
      object DBEdit1: TDBEdit
        Left = 8
        Top = 24
        Width = 70
        Height = 21
        DataField = 'CODIGO_EXTERNO'
        DataSource = dtsTabela
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 87
        Top = 25
        Width = 346
        Height = 21
        DataField = 'NOME'
        DataSource = dtsTabela
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 8
        Top = 64
        Width = 120
        Height = 21
        DataField = 'DATA_NASCIMENTO'
        DataSource = dtsTabela
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 8
        Top = 144
        Width = 134
        Height = 21
        DataField = 'SALARIO'
        DataSource = dtsTabela
        TabOrder = 3
      end
    end
  end
  inherited Bar: TToolBar
    Width = 607
  end
  inherited StatusBar1: TStatusBar
    Width = 607
  end
  inherited cdsTabela: TEMSTable
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspFuncionario'
    object cdsTabelaID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
      Origin = '"ID_FUNCIONARIO"'
    end
    object cdsTabelaCODIGO_EXTERNO: TIntegerField
      FieldName = 'CODIGO_EXTERNO'
      Origin = '"CODIGO_EXTERNO"'
      DisplayFormat = '00000'
    end
    object cdsTabelaNOME: TWideStringField
      FieldName = 'NOME'
      Origin = '"NOME"'
      Size = 50
    end
    object cdsTabelaDATA_NASCIMENTO: TSQLTimeStampField
      FieldName = 'DATA_NASCIMENTO'
      Origin = '"DATA_NASCIMENTO"'
    end
    object cdsTabelaSALARIO: TFloatField
      FieldName = 'SALARIO'
      Origin = '"SALARIO"'
    end
    object cdsTabelaEMPRESA_ID: TIntegerField
      FieldName = 'EMPRESA_ID'
    end
    object cdsTabelaPIS: TWideStringField
      FieldName = 'PIS'
    end
    object cdsTabelaRG: TWideStringField
      FieldName = 'RG'
      Size = 10
    end
    object cdsTabelaCTPS: TWideStringField
      FieldName = 'CTPS'
      Size = 30
    end
    object cdsTabelaDATA_ADMISSAO: TSQLTimeStampField
      FieldName = 'DATA_ADMISSAO'
    end
    object cdsTabelaDATA_DEMISSAO: TSQLTimeStampField
      FieldName = 'DATA_DEMISSAO'
    end
    object cdsTabelaCPF: TWideStringField
      FieldName = 'CPF'
      Size = 14
    end
    object cdsTabelaCONFIGURACAO_INDIVIDUAL: TBooleanField
      FieldName = 'CONFIGURACAO_INDIVIDUAL'
    end
  end
end

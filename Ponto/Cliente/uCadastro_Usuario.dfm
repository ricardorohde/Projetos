inherited frmCadastro_Usuario: TfrmCadastro_Usuario
  Caption = 'Cadastro de Usuario'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    ActivePage = tsDetalhe
    inherited tsDados: TTabSheet
      inherited grid: TcxGrid
        inherited tv1: TcxGridDBTableView
          OptionsView.GroupByBox = False
          object tv1USUARIO: TcxGridDBColumn
            Caption = 'Usu'#225'rio'
            DataBinding.FieldName = 'USUARIO'
            HeaderAlignmentHorz = taCenter
            Width = 266
          end
        end
      end
    end
    inherited tsDetalhe: TTabSheet
      inherited PageControle: TcxPageControl
        LookAndFeel.SkinName = ''
        inherited tsPrincipal: TcxTabSheet
          object Label1: TLabel
            Left = 152
            Top = 8
            Width = 36
            Height = 13
            Caption = 'Usu'#225'rio'
            FocusControl = edtUsuario
          end
          object Label2: TLabel
            Left = 8
            Top = 48
            Width = 30
            Height = 13
            Caption = 'Senha'
            FocusControl = edtSenha
          end
          object Label3: TLabel
            Left = 8
            Top = 8
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
            FocusControl = edtCodigo
          end
          object edtUsuario: TDBEdit
            Left = 152
            Top = 24
            Width = 193
            Height = 21
            DataField = 'USUARIO'
            DataSource = dtsTabela
            TabOrder = 1
          end
          object edtSenha: TDBEdit
            Left = 8
            Top = 64
            Width = 150
            Height = 21
            DataField = 'SENHA'
            DataSource = dtsTabela
            PasswordChar = '*'
            TabOrder = 2
          end
          object edtCodigo: TDBEdit
            Left = 8
            Top = 24
            Width = 134
            Height = 21
            DataField = 'CODIGO_EXTERNO'
            DataSource = dtsTabela
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited cdsTabela: TClientDataSet
    ProviderName = 'dspUsuario'
    RemoteServer = DM_Cadastro_Usuario.DCOMCon_Usuario
    object cdsTabelaID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
    end
    object cdsTabelaUSUARIO: TWideStringField
      FieldName = 'USUARIO'
      Size = 30
    end
    object cdsTabelaSENHA: TWideStringField
      FieldName = 'SENHA'
      Size = 255
    end
    object cdsTabelaCODIGO_EXTERNO: TIntegerField
      FieldName = 'CODIGO_EXTERNO'
    end
  end
  inherited Parametros: TEMSParameters
    ListFieldsPesquisa.Strings = (
      'C'#243'digo;CODIGO_EXTERNO;40;Retorno;integer;'
      'Usu'#225'rio;USUARIO;150;;string;')
    ListDataSet.Strings = (
      'cdsTabela')
    TableName = 'USUARIOS'
    FieldCampoCodigo = 'CODIGO_EXTERNO'
    FieldCampoID = 'ID_USUARIO'
    CampoCodigo = edtCodigo
  end
end

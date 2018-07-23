inherited frmCadastro_Empresa: TfrmCadastro_Empresa
  Left = 403
  Top = 232
  Caption = 'Cadastro de Empresas'
  ClientWidth = 640
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 640
    ActivePage = tsDetalhe
    inherited tsDados: TTabSheet
      inherited grid: TcxGrid
        Width = 632
        inherited tv1: TcxGridDBTableView
          object tv1CODIGO_EXTERNO: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'CODIGO_EXTERNO'
            HeaderAlignmentHorz = taCenter
            Width = 136
          end
          object tv1NOME_FANTASIA: TcxGridDBColumn
            Caption = 'Nome Fantasia'
            DataBinding.FieldName = 'NOME_FANTASIA'
            HeaderAlignmentHorz = taCenter
            Width = 344
          end
          object tv1CNPJ: TcxGridDBColumn
            DataBinding.FieldName = 'CNPJ'
            HeaderAlignmentHorz = taCenter
            Width = 172
          end
        end
      end
    end
    inherited tsDetalhe: TTabSheet
      inherited PageControle: TcxPageControl
        Width = 632
        Color = clBtnFace
        LookAndFeel.SkinName = ''
        ClientRectLeft = 88
        ClientRectRight = 631
        inherited tsPrincipal: TcxTabSheet
          TabVisible = True
          object Label1: TLabel
            Left = 17
            Top = 2
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
            Color = 16119285
            FocusControl = edtCodigo
            ParentColor = False
          end
          object Label4: TLabel
            Left = 17
            Top = 41
            Width = 60
            Height = 13
            Caption = 'Raz'#227'o Social'
            Color = 16119285
            FocusControl = edtRazaoSocial
            ParentColor = False
          end
          object Label7: TLabel
            Left = 325
            Top = 41
            Width = 77
            Height = 13
            Caption = 'Dia Fechamento'
            Color = 16119285
            FocusControl = edtFechamento
            ParentColor = False
          end
          object Label2: TLabel
            Left = 95
            Top = 2
            Width = 71
            Height = 13
            Caption = 'Nome Fantasia'
            Color = 16119285
            FocusControl = edtNome
            ParentColor = False
          end
          object gpxDocumentos: TGroupBox
            Left = 17
            Top = 84
            Width = 385
            Height = 58
            Caption = 'Documentos'
            Color = 16119285
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 4
            object Label3: TLabel
              Left = 5
              Top = 14
              Width = 25
              Height = 13
              Caption = 'CNPJ'
              Color = 16119285
              FocusControl = edtCNPJ
              ParentColor = False
            end
            object Label5: TLabel
              Left = 200
              Top = 14
              Width = 87
              Height = 13
              Caption = 'Inscri'#231#227'o Estadual'
              Color = 16119285
              FocusControl = edtInscricaoEstadual
              ParentColor = False
            end
            object edtCNPJ: TDBEdit
              Left = 5
              Top = 30
              Width = 186
              Height = 21
              DataField = 'CNPJ'
              DataSource = dtsTabela
              TabOrder = 0
            end
            object edtInscricaoEstadual: TDBEdit
              Left = 200
              Top = 30
              Width = 170
              Height = 21
              DataField = 'INSCRICAO_ESTADUAL'
              DataSource = dtsTabela
              TabOrder = 1
            end
          end
          object gpxEndereco: TGroupBox
            Left = 17
            Top = 145
            Width = 385
            Height = 144
            Caption = 'Endere'#231'o'
            Color = 16119285
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 5
            object Label8: TLabel
              Left = 5
              Top = 17
              Width = 55
              Height = 13
              Caption = 'Logradouro'
              Color = 16119285
              FocusControl = edtLogradouro
              ParentColor = False
            end
            object Label9: TLabel
              Left = 312
              Top = 17
              Width = 37
              Height = 13
              Caption = 'N'#250'mero'
              Color = 16119285
              FocusControl = edtNumero
              ParentColor = False
            end
            object Label10: TLabel
              Left = 5
              Top = 58
              Width = 65
              Height = 13
              Caption = 'Complemento'
              Color = 16119285
              FocusControl = edtComplemento
              ParentColor = False
            end
            object Label11: TLabel
              Left = 109
              Top = 58
              Width = 28
              Height = 13
              Caption = 'Bairro'
              Color = 16119285
              FocusControl = edtBairro
              ParentColor = False
            end
            object Label6: TLabel
              Left = 244
              Top = 99
              Width = 43
              Height = 13
              Caption = 'Munic'#237'pio'
              Color = 16119285
              ParentColor = False
            end
            object Label12: TLabel
              Left = 5
              Top = 98
              Width = 19
              Height = 13
              Caption = 'CEP'
              Color = 16119285
              FocusControl = edtCEP
              ParentColor = False
            end
            object Label25: TLabel
              Left = 111
              Top = 98
              Width = 33
              Height = 13
              Caption = 'Estado'
              Color = 16119285
              FocusControl = edtCEP
              ParentColor = False
            end
            object edtLogradouro: TDBEdit
              Left = 5
              Top = 32
              Width = 300
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ENDERECO'
              DataSource = dtsTabela
              TabOrder = 0
            end
            object edtNumero: TDBEdit
              Left = 312
              Top = 32
              Width = 65
              Height = 21
              DataField = 'NUMERO'
              DataSource = dtsTabela
              TabOrder = 1
            end
            object edtComplemento: TDBEdit
              Left = 5
              Top = 74
              Width = 100
              Height = 21
              DataField = 'COMPLEMENTO'
              DataSource = dtsTabela
              TabOrder = 2
            end
            object edtBairro: TDBEdit
              Left = 109
              Top = 74
              Width = 196
              Height = 21
              CharCase = ecUpperCase
              DataField = 'BAIRRO'
              DataSource = dtsTabela
              TabOrder = 3
            end
            object edtCEP: TDBEdit
              Left = 5
              Top = 114
              Width = 100
              Height = 21
              DataField = 'CEP'
              DataSource = dtsTabela
              TabOrder = 4
            end
            object cboEstado: TcxDBLookupComboBox
              Left = 111
              Top = 114
              DataBinding.DataField = 'ID_ESTADO'
              DataBinding.DataSource = dtsTabela
              Properties.KeyFieldNames = 'ID_ESTADO'
              Properties.ListColumns = <
                item
                  FieldName = 'NOME'
                end>
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = dtsEstados
              Properties.OnChange = cboEstadoPropertiesChange
              TabOrder = 5
              Width = 129
            end
            object edtMunicipio: TDBEditBtn
              Left = 244
              Top = 114
              Width = 129
              Height = 21
              ListFields.Strings = (
                'C'#243'digo do Munic'#237'pio;COD_MUNICIPIO;80;Retorno;integer;'
                'Munic'#237'pio;NOME;200;;string;')
              Enabled = False
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF4D74AB234179C5ABA7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFF4173AF008EEC009AF41F4B80FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFF2F6EB22BA7
                F516C0FF00A0F3568BC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFEFFFF2974BB68C4F86BD4FF279CE66696C8FFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3D8FD5A4E3FEB5EEFF4CAA
                E7669DD2FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEA188898A6A6A93736E866567B0
                9595BAA8B1359EE8BDF5FF77C4EF63A1DAFFFFFFFFFFFFFFFFFFFFFFFFD7CDCD
                7E5857DFD3CBFFFFF7FFFFE7FFFEDBD6BB9E90584D817B8E1794E46BB5E9FFFF
                FFFFFFFFFFFFFFFFFFFFEDE9E9886565FFFFFFFFFFFFFDF8E8FAF2DCF8EDCFFF
                F1CFF6DEBA9F5945C0C7D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA38889F6EFEA
                FFFFFFFEFBF5FBF7E8F9F4DAF5EBCCE6CEACF3DAB8E2BD99AB8B8EFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF937674FFFFFFFDFBF1FCF8EEFAF3E1FCF5E3F7F0D7F0
                DFC1E7C9A9F0D1ABA87E75F8F6F6FFFFFFFFFFFFFFFFFFFFFFFF997D7AFFFFFC
                F9F2E1FAF3DEFAF7E5FAF1DCF1DFC0EDD9BAECD8B9EDCAA5AF8679EDE8E9FFFF
                FFFFFFFFFFFFFFFFFFFF9C807BFFFFEBF9EED5FAF1D7F9F2DAF2E3C6FEFBF9FF
                FFF0EFDFC0E9C69EB0857BF5F2F3FFFFFFFFFFFFFFFFFFFFFFFFAF9596F7EAC8
                F9EBCCEFDCBEF4E4C7F0E1C5FDFCECFAF5DDEFDCBCDFB087B59A9AFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFDED4D7BA998CFDECC4EDD4B0E5CAA8EFDBBFF2E3C4F2
                DEBCEABF93BB8E7DE7DFE2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEBFC5
                BE9A8DE6C7A5EFCBA3ECC8A2E8BE94DCAA86BE9585DFD6D7FFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E4E6C9B3B4B99C93C3A097BF9F96CC
                B9B7F1EEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              NumGlyphs = 1
              TabOrder = 6
              ListSource = dtsMunicipio
              DataSource = dtsTabela
              FieldName = 'CODIGO_MUNICIPIO'
            end
          end
          object gpxContato: TGroupBox
            Left = 17
            Top = 294
            Width = 385
            Height = 70
            Caption = 'Contato'
            Color = 16119285
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 6
            object Label13: TLabel
              Left = 4
              Top = 16
              Width = 42
              Height = 13
              Caption = 'Telefone'
              Color = 16119285
              FocusControl = edtTelefone
              ParentColor = False
            end
            object Label14: TLabel
              Left = 138
              Top = 16
              Width = 28
              Height = 13
              Caption = 'E-Mail'
              Color = 16119285
              FocusControl = edtEmail
              ParentColor = False
            end
            object edtTelefone: TDBEdit
              Left = 4
              Top = 32
              Width = 130
              Height = 21
              DataField = 'TELEFONE'
              DataSource = dtsTabela
              TabOrder = 0
            end
            object edtEmail: TDBEdit
              Left = 138
              Top = 32
              Width = 235
              Height = 21
              CharCase = ecLowerCase
              DataField = 'EMAIL'
              DataSource = dtsTabela
              TabOrder = 1
            end
          end
          object edtCodigo: TDBEdit
            Left = 17
            Top = 18
            Width = 70
            Height = 21
            DataField = 'CODIGO_EXTERNO'
            DataSource = dtsTabela
            TabOrder = 0
          end
          object edtNome: TDBEdit
            Left = 95
            Top = 18
            Width = 305
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NOME_FANTASIA'
            DataSource = dtsTabela
            TabOrder = 1
          end
          object edtRazaoSocial: TDBEdit
            Left = 17
            Top = 57
            Width = 300
            Height = 21
            CharCase = ecUpperCase
            DataField = 'RAZAO_SOCIAL'
            DataSource = dtsTabela
            TabOrder = 2
          end
          object edtFechamento: TDBEdit
            Left = 325
            Top = 57
            Width = 76
            Height = 21
            DataField = 'DIA_FECHAMENTO'
            DataSource = dtsTabela
            TabOrder = 3
          end
        end
        object tsConfiguracao: TcxTabSheet
          Caption = 'Configura'#231#227'o'
          Color = 16119285
          ImageIndex = 1
          ParentColor = False
          object Label15: TLabel
            Left = 5
            Top = 6
            Width = 36
            Height = 13
            Caption = 'Per'#237'odo'
          end
          object Label16: TLabel
            Left = 136
            Top = 6
            Width = 33
            Height = 13
            Caption = 'Turnos'
            FocusControl = edtTurnos
          end
          object Label24: TLabel
            Left = 200
            Top = 0
            Width = 63
            Height = 13
            Caption = 'ID_EMPRESA'
            FocusControl = DBEdit1
          end
          object edtPeriodo: TcxDBDateEdit
            Left = 5
            Top = 20
            DataBinding.DataField = 'PERIODO'
            DataBinding.DataSource = dtsEmpresa_Parametros
            TabOrder = 0
            Width = 121
          end
          object edtTurnos: TDBEdit
            Left = 136
            Top = 20
            Width = 58
            Height = 21
            DataField = 'TURNOS'
            DataSource = dtsEmpresa_Parametros
            TabOrder = 1
          end
          object gpxPagamentoHE: TGroupBox
            Left = 5
            Top = 45
            Width = 188
            Height = 64
            Caption = 'Pagamento de Hora Extra '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object chkAntesHorario: TDBCheckBox
              Left = 7
              Top = 19
              Width = 162
              Height = 17
              Caption = 'Antes do Hor'#225'rio'
              DataField = 'PAGAMENTO_HE_ANTES_HORARIO'
              DataSource = dtsEmpresa_Parametros
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object chkDepoisHorario: TDBCheckBox
              Left = 7
              Top = 40
              Width = 170
              Height = 17
              Caption = 'Depois do Hor'#225'rio'
              DataField = 'PAGAMENTO_HE_DEPOIS_HORARIO'
              DataSource = dtsEmpresa_Parametros
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
          end
          object gpxTolerancia: TGroupBox
            Left = 200
            Top = 45
            Width = 185
            Height = 64
            Caption = 'Toler'#226'ncia '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            object Label17: TLabel
              Left = 6
              Top = 15
              Width = 83
              Height = 13
              Caption = 'Hora Extra (Min):'
              FocusControl = edtToleranciaHE
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label18: TLabel
              Left = 26
              Top = 41
              Width = 63
              Height = 13
              Caption = 'Atraso (Min):'
              FocusControl = edtToleranciaAtraso
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edtToleranciaHE: TDBEdit
              Left = 91
              Top = 11
              Width = 67
              Height = 21
              DataField = 'TOLERANCIA_HORAEXTRA'
              DataSource = dtsEmpresa_Parametros
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object edtToleranciaAtraso: TDBEdit
              Left = 91
              Top = 38
              Width = 67
              Height = 21
              DataField = 'TOLERANCIA_ATRASO'
              DataSource = dtsEmpresa_Parametros
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
          object gpxInicioExpediente: TGroupBox
            Left = 389
            Top = 47
            Width = 132
            Height = 64
            Caption = 'Inicio Expediente '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            object edtInicioExpediente: TcxDBTimeEdit
              Left = 13
              Top = 25
              DataBinding.DataField = 'INICIO_EXPEDIENTE'
              DataBinding.DataSource = dtsEmpresa_Parametros
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              TabOrder = 0
              Width = 102
            end
          end
          object gpxHorasExtras: TGroupBox
            Left = 5
            Top = 111
            Width = 516
            Height = 86
            Caption = 'Horas Extras '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            object gpxPrimeirasHE: TGroupBox
              Left = 6
              Top = 15
              Width = 211
              Height = 66
              Caption = '                             Primeiras Horas Extras'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object Label21: TLabel
                Left = 6
                Top = 34
                Width = 89
                Height = 13
                Caption = 'Porcentagem (%):'
                FocusControl = edtPorcentagemHE
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object edtPrimeirasHE: TcxDBTimeEdit
                Left = 4
                Top = 0
                DataBinding.DataField = 'HORAS_BONIFICACAO'
                DataBinding.DataSource = dtsEmpresa_Parametros
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                TabOrder = 0
                Width = 89
              end
              object edtPorcentagemHE: TDBEdit
                Left = 102
                Top = 31
                Width = 80
                Height = 21
                DataField = 'PORC_HORAS_BONIFICACAO'
                DataSource = dtsEmpresa_Parametros
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
            end
            object gpxFolgasFeriados: TGroupBox
              Left = 218
              Top = 15
              Width = 163
              Height = 66
              Caption = 'Folgas/Feriados/Descanso'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              object Label22: TLabel
                Left = 6
                Top = 20
                Width = 89
                Height = 13
                Caption = 'Porcentagem (%):'
                FocusControl = edtPorcentagemHE
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object edtPorcentagemFolgasFeriados: TDBEdit
                Left = 6
                Top = 38
                Width = 80
                Height = 21
                DataField = 'PORC_BONIFICACAO_FERIADO_FOLGA'
                DataSource = dtsEmpresa_Parametros
                TabOrder = 0
              end
            end
            object gpxDemaisHoras: TGroupBox
              Left = 384
              Top = 15
              Width = 127
              Height = 66
              Caption = 'Demais Horas Extras '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              object Label19: TLabel
                Left = 6
                Top = 20
                Width = 89
                Height = 13
                Caption = 'Porcentagem (%):'
                FocusControl = edtPorcentagemHE
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object edtPorcentagemHorasExtras: TDBEdit
                Left = 6
                Top = 38
                Width = 80
                Height = 21
                DataField = 'PORC_BONIFICACAO_DEMAIS_HORAS'
                DataSource = dtsEmpresa_Parametros
                TabOrder = 0
              end
            end
          end
          object gpxAdicionalNoturno: TGroupBox
            Left = 5
            Top = 197
            Width = 308
            Height = 81
            Caption = 'Adicional Noturno'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 6
            object Label20: TLabel
              Left = 6
              Top = 25
              Width = 55
              Height = 13
              Caption = 'Hora In'#237'cio:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label23: TLabel
              Left = 157
              Top = 25
              Width = 46
              Height = 13
              Caption = 'Hora Fim:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edtInicioAdicionalNoturno: TcxDBTimeEdit
              Left = 63
              Top = 22
              DataBinding.DataField = 'HORA_INICIO_ADICIONALNOTURNO'
              DataBinding.DataSource = dtsEmpresa_Parametros
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              TabOrder = 0
              Width = 89
            end
            object edtFimAdicionalNoturno: TcxDBTimeEdit
              Left = 206
              Top = 22
              DataBinding.DataField = 'HORA_FIM_ADICIONALNOTURNO'
              DataBinding.DataSource = dtsEmpresa_Parametros
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              TabOrder = 1
              Width = 89
            end
            object chkDescontarIntervaloNoturno: TDBCheckBox
              Left = 6
              Top = 53
              Width = 203
              Height = 17
              Caption = 'Descontar Intervalo Noturno'
              DataField = 'DESCONTO_INTERVALO_NOTURNO'
              DataSource = dtsEmpresa_Parametros
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
          end
          object gpxOutrasConfiguracoes: TGroupBox
            Left = 315
            Top = 197
            Width = 206
            Height = 80
            Caption = 'Outras Configura'#231#245'es'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 7
            object chkUtilizaBH: TDBCheckBox
              Left = 6
              Top = 18
              Width = 195
              Height = 17
              Caption = 'Empresa Utiliza Banco de Horas'
              DataField = 'TRABALHA_BANCOHORAS'
              DataSource = dtsEmpresa_Parametros
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object chkAlmocoFlexivel: TDBCheckBox
              Left = 6
              Top = 38
              Width = 190
              Height = 17
              Caption = 'Almo'#231'o Ser'#225' Flex'#237'vel'
              DataField = 'ALMOCO_FLEXIVEL'
              DataSource = dtsEmpresa_Parametros
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object chkEntrada_SaidaFlexivel: TDBCheckBox
              Left = 6
              Top = 57
              Width = 195
              Height = 17
              Caption = 'Hor'#225'rio de Entrada/Sa'#237'da Flex'#237'veis'
              DataField = 'ENTRADA_SAIDA_FLEXIVEL'
              DataSource = dtsEmpresa_Parametros
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
          end
          object DBEdit1: TDBEdit
            Left = 200
            Top = 16
            Width = 134
            Height = 21
            DataField = 'ID_EMPRESA'
            DataSource = dtsEmpresa_Parametros
            TabOrder = 8
          end
        end
      end
    end
  end
  inherited Status: TStatusBar
    Width = 640
  end
  inherited pnlControles: TPanel
    Width = 640
    inherited Navigator: TcxDBNavigator
      Left = 221
    end
    inherited btnSair: TBitBtn
      Left = 409
    end
  end
  inherited dtsTabela: TDataSource
    AutoEdit = True
    Left = 40
    Top = 184
  end
  inherited cdsTabela: TClientDataSet
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_EMPRESA'
        ParamType = ptInput
      end>
    ProviderName = 'dsp_Empresa'
    RemoteServer = DM_Cadastro_Empresa.DCOMCon_Empresa
    Left = 40
    Top = 152
    object cdsTabelaID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
      Origin = '"ID_EMPRESA"'
    end
    object cdsTabelaCODIGO_EXTERNO: TIntegerField
      FieldName = 'CODIGO_EXTERNO'
      Origin = '"CODIGO_EXTERNO"'
    end
    object cdsTabelaRAZAO_SOCIAL: TWideStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = '"RAZAO_SOCIAL"'
      Size = 50
    end
    object cdsTabelaNOME_FANTASIA: TWideStringField
      FieldName = 'NOME_FANTASIA'
      Origin = '"NOME_FANTASIA"'
      Size = 50
    end
    object cdsTabelaCNPJ: TWideStringField
      FieldName = 'CNPJ'
      Origin = '"CNPJ"'
      Size = 14
    end
    object cdsTabelaINSCRICAO_ESTADUAL: TWideStringField
      FieldName = 'INSCRICAO_ESTADUAL'
      Origin = '"INSCRICAO_ESTADUAL"'
    end
    object cdsTabelaCODIGO_MUNICIPIO: TIntegerField
      FieldName = 'CODIGO_MUNICIPIO'
      Origin = '"CODIGO_MUNICIPIO"'
    end
    object cdsTabelaENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Origin = '"ENDERECO"'
      Size = 50
    end
    object cdsTabelaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = '"NUMERO"'
    end
    object cdsTabelaCOMPLEMENTO: TWideStringField
      FieldName = 'COMPLEMENTO'
      Origin = '"COMPLEMENTO"'
      Size = 30
    end
    object cdsTabelaBAIRRO: TWideStringField
      FieldName = 'BAIRRO'
      Origin = '"BAIRRO"'
      Size = 30
    end
    object cdsTabelaCEP: TWideStringField
      FieldName = 'CEP'
      Origin = '"CEP"'
      Size = 10
    end
    object cdsTabelaTELEFONE: TWideStringField
      FieldName = 'TELEFONE'
      Origin = '"TELEFONE"'
    end
    object cdsTabelaEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Origin = '"EMAIL"'
      Size = 30
    end
    object cdsTabelaDIA_FECHAMENTO: TIntegerField
      FieldName = 'DIA_FECHAMENTO'
      Origin = '"DIA_FECHAMENTO"'
    end
    object cdsTabelaID_ESTADO: TIntegerField
      FieldName = 'ID_ESTADO'
      Origin = '"ID_ESTADO"'
    end
  end
  inherited Parametros: TEMSParameters
    ListFieldsPesquisa.Strings = (
      'C'#243'digo;CODIGO_EXTERNO;40;Retorno;integer;'
      'Nome da Empresa;NOME_FANTASIA;200;;string;'
      'CNPJ;CNPJ;100;;string;')
    ListDataSet.Strings = (
      'cdsEmpresa_Parametros'
      'cdsTabela')
    TableName = 'EMPRESA'
    FieldCampoCodigo = 'CODIGO_EXTERNO'
    FieldCampoID = 'ID_EMPRESA'
    CampoCodigo = edtCodigo
    Left = 40
    Top = 216
  end
  inherited cxStyleRepository1: TcxStyleRepository
    Left = 8
    Top = 184
  end
  object dtsEmpresa_Parametros: TDataSource
    DataSet = cdsEmpresa_Parametros
    Left = 8
    Top = 216
  end
  object cdsEmpresa_Parametros: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_EMPRESA'
        ParamType = ptInput
      end>
    ProviderName = 'dspEmpresa_Parametros'
    RemoteServer = DM_Cadastro_Empresa.DCOMCon_Empresa
    Left = 8
    Top = 152
    object cdsEmpresa_ParametrosID_PARAMETROS_EMPRESA: TIntegerField
      FieldName = 'ID_PARAMETROS_EMPRESA'
    end
    object cdsEmpresa_ParametrosID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
    end
    object cdsEmpresa_ParametrosPERIODO: TSQLTimeStampField
      FieldName = 'PERIODO'
    end
    object cdsEmpresa_ParametrosTURNOS: TIntegerField
      FieldName = 'TURNOS'
    end
    object cdsEmpresa_ParametrosPAGAMENTO_HE_ANTES_HORARIO: TBooleanField
      FieldName = 'PAGAMENTO_HE_ANTES_HORARIO'
    end
    object cdsEmpresa_ParametrosPAGAMENTO_HE_DEPOIS_HORARIO: TBooleanField
      FieldName = 'PAGAMENTO_HE_DEPOIS_HORARIO'
    end
    object cdsEmpresa_ParametrosTOLERANCIA_HORAEXTRA: TIntegerField
      FieldName = 'TOLERANCIA_HORAEXTRA'
    end
    object cdsEmpresa_ParametrosTOLERANCIA_ATRASO: TIntegerField
      FieldName = 'TOLERANCIA_ATRASO'
    end
    object cdsEmpresa_ParametrosINICIO_EXPEDIENTE: TTimeField
      FieldName = 'INICIO_EXPEDIENTE'
    end
    object cdsEmpresa_ParametrosHORAS_BONIFICACAO: TTimeField
      FieldName = 'HORAS_BONIFICACAO'
    end
    object cdsEmpresa_ParametrosPORC_HORAS_BONIFICACAO: TIntegerField
      FieldName = 'PORC_HORAS_BONIFICACAO'
    end
    object cdsEmpresa_ParametrosPORC_BONIFICACAO_FERIADO_FOLGA: TIntegerField
      FieldName = 'PORC_BONIFICACAO_FERIADO_FOLGA'
    end
    object cdsEmpresa_ParametrosPORC_BONIFICACAO_DEMAIS_HORAS: TIntegerField
      FieldName = 'PORC_BONIFICACAO_DEMAIS_HORAS'
    end
    object cdsEmpresa_ParametrosHORA_INICIO_ADICIONALNOTURNO: TIntegerField
      FieldName = 'HORA_INICIO_ADICIONALNOTURNO'
    end
    object cdsEmpresa_ParametrosHORA_FIM_ADICIONALNOTURNO: TIntegerField
      FieldName = 'HORA_FIM_ADICIONALNOTURNO'
    end
    object cdsEmpresa_ParametrosDESCONTO_INTERVALO_NOTURNO: TBooleanField
      FieldName = 'DESCONTO_INTERVALO_NOTURNO'
    end
    object cdsEmpresa_ParametrosTRABALHA_BANCOHORAS: TBooleanField
      FieldName = 'TRABALHA_BANCOHORAS'
    end
    object cdsEmpresa_ParametrosALMOCO_FLEXIVEL: TBooleanField
      FieldName = 'ALMOCO_FLEXIVEL'
    end
    object cdsEmpresa_ParametrosENTRADA_SAIDA_FLEXIVEL: TBooleanField
      FieldName = 'ENTRADA_SAIDA_FLEXIVEL'
    end
  end
  object cdsMunicipio: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_COD_MUNICIPIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UF'
        ParamType = ptInput
      end>
    ProviderName = 'dspMunicipio'
    RemoteServer = DM_Cadastro_Municipio.DCOMCon_Municipio
    Left = 5
    Top = 246
    object cdsMunicipioID_COD_MUNICIPIO: TIntegerField
      FieldName = 'ID_COD_MUNICIPIO'
    end
    object cdsMunicipioCOD_MUNICIPIO: TFloatField
      FieldName = 'COD_MUNICIPIO'
    end
    object cdsMunicipioUF: TWideStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsMunicipioNOME: TWideStringField
      FieldName = 'NOME'
      Size = 255
    end
    object cdsMunicipioNOME_SEM_ACENTO: TWideStringField
      FieldName = 'NOME_SEM_ACENTO'
      Size = 255
    end
  end
  object dtsMunicipio: TDataSource
    DataSet = cdsMunicipio
    Left = 40
    Top = 246
  end
  object dtsEstados: TDataSource
    DataSet = DM_Utils.cdsEstados
    Left = 41
    Top = 276
  end
  object frxReport1: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42132.785243993060000000
    ReportOptions.LastChange = 42132.787486122690000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 548
    Top = 77
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      object MasterData1: TfrxMasterData
        Height = 41.574830000000000000
        Top = 18.897650000000000000
        Width = 793.701300000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1CODIGO_EXTERNO: TfrxMemoView
          Left = 34.015770000000000000
          Top = 18.897650000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CODIGO_EXTERNO'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."CODIGO_EXTERNO"]')
          ParentFont = False
        end
        object frxDBDataset1RAZAO_SOCIAL: TfrxMemoView
          Left = 124.724490000000000000
          Top = 15.118120000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'RAZAO_SOCIAL'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."RAZAO_SOCIAL"]')
          ParentFont = False
        end
        object frxDBDataset1CNPJ: TfrxMemoView
          Left = 555.590910000000000000
          Top = 11.338590000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataField = 'CNPJ'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBDataset1."CNPJ"]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID_EMPRESA=ID_EMPRESA'
      'CODIGO_EXTERNO=CODIGO_EXTERNO'
      'RAZAO_SOCIAL=RAZAO_SOCIAL'
      'NOME_FANTASIA=NOME_FANTASIA'
      'CNPJ=CNPJ'
      'INSCRICAO_ESTADUAL=INSCRICAO_ESTADUAL'
      'CODIGO_MUNICIPIO=CODIGO_MUNICIPIO'
      'ENDERECO=ENDERECO'
      'NUMERO=NUMERO'
      'COMPLEMENTO=COMPLEMENTO'
      'BAIRRO=BAIRRO'
      'CEP=CEP'
      'TELEFONE=TELEFONE'
      'EMAIL=EMAIL'
      'DIA_FECHAMENTO=DIA_FECHAMENTO'
      'ID_ESTADO=ID_ESTADO')
    DataSet = cdsTabela
    Left = 556
    Top = 141
  end
end

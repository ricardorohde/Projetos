inherited frmCadastro_Horario: TfrmCadastro_Horario
  Left = 236
  Top = 233
  Caption = 'Cadastro de Hor'#225'rios'
  ClientHeight = 361
  ClientWidth = 587
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 587
    Height = 314
    inherited tsDados: TTabSheet
      inherited grid: TcxGrid
        Width = 579
        Height = 286
        inherited tv1: TcxGridDBTableView
          object tv1CODIGO_EXTERNO: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'CODIGO_EXTERNO'
            HeaderAlignmentHorz = taCenter
            Width = 105
          end
          object tv1DESCRICAO: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'DESCRICAO'
            HeaderAlignmentHorz = taCenter
            Width = 317
          end
        end
      end
    end
    inherited tsDetalhe: TTabSheet
      inherited PageControle: TcxPageControl
        Width = 579
        Height = 286
        LookAndFeel.SkinName = ''
        ClientRectBottom = 285
        ClientRectRight = 578
        inherited tsPrincipal: TcxTabSheet
          object lbl1: TLabel
            Left = 8
            Top = 8
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
            FocusControl = edtCodigo
          end
          object lbl2: TLabel
            Left = 112
            Top = 8
            Width = 46
            Height = 13
            Caption = 'Descri'#231#227'o'
            FocusControl = edtDescricao
          end
          object edtCodigo: TDBEdit
            Left = 8
            Top = 24
            Width = 100
            Height = 21
            DataField = 'CODIGO_EXTERNO'
            DataSource = dtsTabela
            TabOrder = 0
          end
          object edtDescricao: TDBEdit
            Left = 112
            Top = 24
            Width = 300
            Height = 21
            CharCase = ecUpperCase
            DataField = 'DESCRICAO'
            DataSource = dtsTabela
            TabOrder = 1
          end
          object grdHorario: TcxGrid
            Left = 0
            Top = 81
            Width = 575
            Height = 201
            TabOrder = 2
            object tvHorario: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              NavigatorButtons.PriorPage.Visible = False
              NavigatorButtons.NextPage.Visible = False
              NavigatorButtons.Insert.Visible = True
              NavigatorButtons.Append.Visible = False
              NavigatorButtons.Refresh.Visible = False
              NavigatorButtons.SaveBookmark.Visible = False
              NavigatorButtons.GotoBookmark.Visible = False
              NavigatorButtons.Filter.Visible = False
              DataController.DataSource = dtsHORARIO_DETALHE
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsCustomize.ColumnGrouping = False
              OptionsCustomize.ColumnMoving = False
              OptionsView.Navigator = True
              OptionsView.GroupByBox = False
              Styles.Header = Style_Header
              object tvHorarioDIA_SEMANA: TcxGridDBColumn
                Caption = 'Dia'
                DataBinding.FieldName = 'DIA_SEMANA'
                PropertiesClassName = 'TcxLookupComboBoxProperties'
                Properties.KeyFieldNames = 'Dia'
                Properties.ListColumns = <
                  item
                    FieldName = 'Descricao'
                  end>
                Properties.ListOptions.ShowHeader = False
                Properties.ListSource = dtsDiaSemana
                HeaderAlignmentHorz = taCenter
                Width = 65
              end
              object tvHorarioENTRADA: TcxGridDBColumn
                Caption = 'Entrada'
                DataBinding.FieldName = 'ENTRADA'
                PropertiesClassName = 'TcxTimeEditProperties'
                HeaderAlignmentHorz = taCenter
                MinWidth = 80
                Options.Filtering = False
                Options.FilteringFilteredItemsList = False
                Options.FilteringMRUItemsList = False
                Options.FilteringPopup = False
                Options.FilteringPopupMultiSelect = False
                Options.Grouping = False
                Options.HorzSizing = False
                Options.Moving = False
                Width = 80
              end
              object tvHorarioALMOCO_INICIO: TcxGridDBColumn
                Caption = 'Inicio do Almo'#231'o'
                DataBinding.FieldName = 'ALMOCO_INICIO'
                PropertiesClassName = 'TcxTimeEditProperties'
                HeaderAlignmentHorz = taCenter
                MinWidth = 120
                Options.Filtering = False
                Options.FilteringFilteredItemsList = False
                Options.FilteringMRUItemsList = False
                Options.FilteringPopup = False
                Options.FilteringPopupMultiSelect = False
                Options.Grouping = False
                Options.HorzSizing = False
                Options.Moving = False
                Width = 120
              end
              object tvHorarioALMOCO_FIM: TcxGridDBColumn
                Caption = 'Fim do Almo'#231'o'
                DataBinding.FieldName = 'ALMOCO_FIM'
                PropertiesClassName = 'TcxTimeEditProperties'
                HeaderAlignmentHorz = taCenter
                MinWidth = 100
                Options.Filtering = False
                Options.FilteringFilteredItemsList = False
                Options.FilteringMRUItemsList = False
                Options.FilteringPopup = False
                Options.FilteringPopupMultiSelect = False
                Options.Grouping = False
                Options.HorzSizing = False
                Options.Moving = False
                Width = 100
              end
              object tvHorarioSAIDA: TcxGridDBColumn
                Caption = 'Saida'
                DataBinding.FieldName = 'SAIDA'
                PropertiesClassName = 'TcxTimeEditProperties'
                HeaderAlignmentHorz = taCenter
                MinWidth = 100
                Options.Filtering = False
                Options.FilteringFilteredItemsList = False
                Options.FilteringMRUItemsList = False
                Options.FilteringPopup = False
                Options.FilteringPopupMultiSelect = False
                Options.Grouping = False
                Options.HorzSizing = False
                Options.Moving = False
                Width = 100
              end
              object tvHorarioHORAS_A_TRABALHAR: TcxGridDBColumn
                Caption = 'Total de Horas'
                DataBinding.FieldName = 'HORAS_A_TRABALHAR'
                HeaderAlignmentHorz = taCenter
                MinWidth = 101
                Options.Editing = False
                Options.Filtering = False
                Options.FilteringFilteredItemsList = False
                Options.FilteringMRUItemsList = False
                Options.FilteringPopup = False
                Options.FilteringPopupMultiSelect = False
                Options.Grouping = False
                Options.HorzSizing = False
                Options.Moving = False
                Width = 101
              end
            end
            object lvHorario: TcxGridLevel
              GridView = tvHorario
            end
          end
          object btnRepetir: TBitBtn
            Left = 8
            Top = 50
            Width = 137
            Height = 25
            Caption = 'Repetir Hor'#225'rios'
            TabOrder = 3
            OnClick = btnRepetirClick
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000ACA9A9B5B1B0
              BBB7B7BAB7B5BAB7B5BAB7B5BAB7B5BAB7B5BAB7B5BAB7B5BAB7B5BAB7B5BAB7
              B5BBB7B6B5B1B0ACA9A9B6B4B1E2E1E0ADAAA7B3B0AEB3B0AEB3B0AEB3B0AEB3
              B0AEB3B0AEB3B0AEB3B0AEB3B0ADB4B1AEB0ADA9E2E0E0B6B4B1C5C3C0EDECEB
              D1CFCED4D4D1D4D4D1D4D4D1D4D4D1D4D4D1D4D4D1D4D4D1D4D3D1D6D4D1E2D7
              DDE7D3DDFBF3F9C4C2BFCFCBC9FFFFFFFAF9F9FBFBFAFBFBFAFBFBFAFBFBFAFB
              FBFAFBFBFAFBFBFAFAFAF9FFFFFFB2DABA19A83CD1E5CEDAD3D6DCDAD9FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDE9
              C810C154D4F0D6E8DDE3CBC8C6F6F6F6F0EFF0F0EFF0F0EFF0F0EFF0F0EFF0F0
              F0F1F1FBFFF2FCFFF4FEFFF5FEFFFAFFFFF1F0F2FFF8FDCBC8C7F9F9F8E2E0DF
              E6E4E3E5E4E3E5E4E3E5E4E3E6E5E4E7E8E9CEB8A8CCBBB3CBBAB7CCBBB7CCB7
              B1E6E4E7E4E4E4F9F9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFC66818DF9423CC6A00D17100B24000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0955AF6D56DE7A520EEAF2BC977
              1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFD59A5AF3D57AE7AE36ECB741CC7E26FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8985AF6DF94ECBD4CF1C759D183
              28FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4DFC1DFA141EB
              C982ECC56FF5D984F1CB68F1CD6AE8B653E1A745CA7926DAA575FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFAEEDCECBE67FBF0BCF5D97DF4D57BF5D77DF8DF
              84E2A541E7C196FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB
              F0DEECC772FCF4CEF9E08CF9E898E8B24CEAC190FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF1DBF1CC7EFDF6CBF1C860F1CF
              99FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFDF6E8EEC563F6D9A0FFFFFFFFFFFFFFFFFFFFFFFF}
          end
          object dbchkPOSSUI_ESCALA: TDBCheckBox
            Left = 418
            Top = 24
            Width = 111
            Height = 17
            Caption = 'Possui Escala'
            DataField = 'POSSUI_ESCALA'
            DataSource = dtsTabela
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
        end
      end
    end
  end
  inherited Status: TStatusBar
    Top = 342
    Width = 587
  end
  inherited pnlControles: TPanel
    Width = 587
  end
  inherited dtsTabela: TDataSource
    Left = 80
    Top = 176
  end
  inherited cdsTabela: TClientDataSet
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_HORARIO'
        ParamType = ptInput
      end>
    ProviderName = 'dspHORARIO'
    Left = 16
    Top = 176
    object cdsTabelaID_HORARIO: TIntegerField
      FieldName = 'ID_HORARIO'
    end
    object cdsTabelaCODIGO_EXTERNO: TIntegerField
      FieldName = 'CODIGO_EXTERNO'
    end
    object cdsTabelaDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsTabelaPOSSUI_ESCALA: TBooleanField
      FieldName = 'POSSUI_ESCALA'
    end
  end
  inherited Parametros: TEMSParameters
    ListFieldsPesquisa.Strings = (
      'C'#243'digo;CODIGO_EXTERNO;40;Retorno;integer;'
      'Descri'#231#227'o;DESCRICAO;200;;string;')
    ListDataSet.Strings = (
      'cdsTabela')
    TableName = 'HORARIO'
    FieldCampoCodigo = 'CODIGO_EXTERNO'
    FieldCampoID = 'ID_HORARIO'
    CampoCodigo = edtCodigo
    Left = 80
    Top = 240
  end
  inherited cxStyleRepository1: TcxStyleRepository
    Left = 48
    Top = 208
  end
  object cdsHORARIO_DETALHE: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_HORARIO_DETALHE'
        DataType = ftInteger
      end
      item
        Name = 'ID_HORARIO'
        DataType = ftInteger
      end
      item
        Name = 'ENTRADA'
        DataType = ftTime
      end
      item
        Name = 'ALMOCO_INICIO'
        DataType = ftTime
      end
      item
        Name = 'ALMOCO_FIM'
        DataType = ftTime
      end
      item
        Name = 'SAIDA'
        DataType = ftTime
      end
      item
        Name = 'DIA_SEMANA'
        DataType = ftInteger
      end
      item
        Name = 'HORAS_A_TRABALHAR'
        DataType = ftTime
      end>
    IndexDefs = <
      item
        Name = 'IdxDIA_SEMANA'
        Fields = 'DIA_SEMANA'
        Options = [ixDescending]
      end>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_HORARIO'
        ParamType = ptInput
      end>
    ProviderName = 'dspHORARIO_DETALHE'
    RemoteServer = DM_Cadastro_Horario.DCOMCon_Horario
    StoreDefs = True
    BeforePost = cdsHORARIO_DETALHEBeforePost
    AfterPost = cdsHORARIO_DETALHEAfterPost
    OnNewRecord = cdsHORARIO_DETALHENewRecord
    Left = 48
    Top = 176
    object cdsHORARIO_DETALHEID_HORARIO_DETALHE: TIntegerField
      FieldName = 'ID_HORARIO_DETALHE'
    end
    object cdsHORARIO_DETALHEID_HORARIO: TIntegerField
      FieldName = 'ID_HORARIO'
    end
    object cdsHORARIO_DETALHEENTRADA: TTimeField
      FieldName = 'ENTRADA'
    end
    object cdsHORARIO_DETALHEALMOCO_INICIO: TTimeField
      FieldName = 'ALMOCO_INICIO'
    end
    object cdsHORARIO_DETALHEALMOCO_FIM: TTimeField
      FieldName = 'ALMOCO_FIM'
    end
    object cdsHORARIO_DETALHESAIDA: TTimeField
      FieldName = 'SAIDA'
    end
    object cdsHORARIO_DETALHEDIA_SEMANA: TIntegerField
      FieldName = 'DIA_SEMANA'
    end
    object cdsHORARIO_DETALHEHORAS_A_TRABALHAR: TTimeField
      FieldName = 'HORAS_A_TRABALHAR'
    end
  end
  object dtsHORARIO_DETALHE: TDataSource
    AutoEdit = False
    DataSet = cdsHORARIO_DETALHE
    Left = 48
    Top = 240
  end
  object dtsDiaSemana: TDataSource
    AutoEdit = False
    DataSet = cdsDiaSemana
    Left = 80
    Top = 208
  end
  object cdsDiaSemana: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 208
    object cdsDiaSemanaDia: TIntegerField
      FieldName = 'Dia'
    end
    object cdsDiaSemanaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 15
    end
  end
  object cdsHORARIO_DETALHEFind: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_HORARIO'
        ParamType = ptInput
      end>
    ProviderName = 'dspHORARIO_DETALHE'
    RemoteServer = DM_Cadastro_Horario.DCOMCon_Horario
    BeforePost = cdsHORARIO_DETALHEBeforePost
    AfterPost = cdsHORARIO_DETALHEAfterPost
    OnNewRecord = cdsHORARIO_DETALHENewRecord
    Left = 16
    Top = 240
    object IntegerField1: TIntegerField
      FieldName = 'ID_HORARIO_DETALHE'
    end
    object IntegerField2: TIntegerField
      FieldName = 'ID_HORARIO'
    end
    object TimeField1: TTimeField
      FieldName = 'ENTRADA'
    end
    object TimeField2: TTimeField
      FieldName = 'ALMOCO_INICIO'
    end
    object TimeField3: TTimeField
      FieldName = 'ALMOCO_FIM'
    end
    object TimeField4: TTimeField
      FieldName = 'SAIDA'
    end
    object IntegerField3: TIntegerField
      FieldName = 'DIA_SEMANA'
    end
    object TimeField5: TTimeField
      FieldName = 'HORAS_A_TRABALHAR'
    end
  end
end

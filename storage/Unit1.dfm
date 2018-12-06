object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 437
  ClientWidth = 471
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object wwDBDateTimePicker1: TwwDBDateTimePicker
    Left = 40
    Top = 16
    Width = 121
    Height = 21
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'Tahoma'
    CalendarAttributes.Font.Style = []
    Epoch = 1950
    ShowButton = True
    TabOrder = 0
  end
  object wwDBDateTimePicker2: TwwDBDateTimePicker
    Left = 40
    Top = 43
    Width = 121
    Height = 21
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'Tahoma'
    CalendarAttributes.Font.Style = []
    Epoch = 1950
    ShowButton = True
    TabOrder = 1
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 264
    Top = 8
    object ClientDataSet1CODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object ClientDataSet1NOME: TStringField
      FieldName = 'NOME'
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 264
    Top = 64
  end
  object rsRegData: TrsRegData
    RootKey = rkCurrentUser
    Left = 193
    Top = 12
  end
  object rsPropSaver: TrsPropSaver
    CustomProperties = rsCustomProperties
    FormPlacementOptions = [pfpPlacement, pfpState]
    Storage = rsStorage
    RootSection = 'Form1.rsPropSaver'
    WhenLoad = wlManual
    WhenSave = wsManual
    Left = 186
    Top = 68
  end
  object PopupMenu: TPopupMenu
    Left = 246
    Top = 130
    object MnuEditar: TMenuItem
      Caption = '&Editar'
      object MnuDesfazer: TMenuItem
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object MnuRecortar: TMenuItem
      end
      object MnuCopiar: TMenuItem
      end
      object MnuColar: TMenuItem
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Selecionartudo1: TMenuItem
      end
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object MnuPropriedades: TMenuItem
      Caption = '&Propriedades'
      object MnuPropriedadeLer: TMenuItem
        Caption = '&Ler'
        object MnuLerPropriedades0: TMenuItem
          Caption = 'Propriedades &0'
          OnClick = MnuLerPropriedades0Click
        end
        object MnuLerPropriedades1: TMenuItem
          Tag = 1
          Caption = 'Propriedades &1'
          OnClick = MnuLerPropriedades0Click
        end
        object MnuLerPropriedades2: TMenuItem
          Tag = 2
          Caption = 'Propriedades &2'
          OnClick = MnuLerPropriedades0Click
        end
        object MnuLerPropriedades3: TMenuItem
          Tag = 3
          Caption = 'Propriedades &3'
          OnClick = MnuLerPropriedades0Click
        end
        object MnuLerPropriedades4: TMenuItem
          Tag = 4
          Caption = 'Propriedades &4'
          OnClick = MnuLerPropriedades0Click
        end
        object MnuLerPropriedades5: TMenuItem
          Tag = 5
          Caption = 'Propriedades &5'
          OnClick = MnuLerPropriedades0Click
        end
        object MnuLerPropriedades6: TMenuItem
          Tag = 6
          Caption = 'Propriedades &6'
          OnClick = MnuLerPropriedades0Click
        end
        object MnuLerPropriedades7: TMenuItem
          Tag = 7
          Caption = 'Propriedades &7'
          OnClick = MnuLerPropriedades0Click
        end
        object MnuLerPropriedades8: TMenuItem
          Tag = 8
          Caption = 'Propriedades &8'
          OnClick = MnuLerPropriedades0Click
        end
        object MnuLerPropriedades9: TMenuItem
          Tag = 9
          Caption = 'Propriedades &9'
          OnClick = MnuLerPropriedades0Click
        end
      end
      object MnuPropriedadeGravar: TMenuItem
        Caption = '&Gravar'
        object MnuGravarPropriedades0: TMenuItem
          Caption = 'Propriedades &0'
          OnClick = MnuGravarPropriedades0Click
        end
        object MnuGravarPropriedades1: TMenuItem
          Tag = 1
          Caption = 'Propriedades &1'
          OnClick = MnuGravarPropriedades0Click
        end
        object MnuGravarPropriedades2: TMenuItem
          Tag = 2
          Caption = 'Propriedades &2'
          OnClick = MnuGravarPropriedades0Click
        end
        object MnuGravarPropriedades3: TMenuItem
          Tag = 3
          Caption = 'Propriedades &3'
          OnClick = MnuGravarPropriedades0Click
        end
        object MnuGravarPropriedades4: TMenuItem
          Tag = 4
          Caption = 'Propriedades &4'
          OnClick = MnuGravarPropriedades0Click
        end
        object MnuGravarPropriedades5: TMenuItem
          Tag = 5
          Caption = 'Propriedades &5'
          OnClick = MnuGravarPropriedades0Click
        end
        object MnuGravarPropriedades6: TMenuItem
          Tag = 6
          Caption = 'Propriedades &6'
          OnClick = MnuGravarPropriedades0Click
        end
        object MnuGravarPropriedades7: TMenuItem
          Tag = 7
          Caption = 'Propriedades &7'
          OnClick = MnuGravarPropriedades0Click
        end
        object MnuGravarPropriedades8: TMenuItem
          Tag = 8
          Caption = 'Propriedades &8'
          OnClick = MnuGravarPropriedades0Click
        end
        object MnuGravarPropriedades9: TMenuItem
          Tag = 9
          Caption = 'Propriedades &9'
          OnClick = MnuGravarPropriedades0Click
        end
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object MnuPropriedadeApagar: TMenuItem
        Caption = '&Apagar'
        object MnuApagarPropriedades0: TMenuItem
          Caption = 'Propriedades &0'
          OnClick = MnuApagarPropriedades0Click
        end
        object MnuApagarPropriedades1: TMenuItem
          Tag = 1
          Caption = 'Propriedades &1'
          OnClick = MnuApagarPropriedades0Click
        end
        object MnuApagarPropriedades2: TMenuItem
          Tag = 2
          Caption = 'Propriedades &2'
          OnClick = MnuApagarPropriedades0Click
        end
        object MnuApagarPropriedades3: TMenuItem
          Tag = 3
          Caption = 'Propriedades &3'
          OnClick = MnuApagarPropriedades0Click
        end
        object MnuApagarPropriedades4: TMenuItem
          Tag = 4
          Caption = 'Propriedades &4'
          OnClick = MnuApagarPropriedades0Click
        end
        object MnuApagarPropriedades5: TMenuItem
          Tag = 5
          Caption = 'Propriedades &5'
          OnClick = MnuApagarPropriedades0Click
        end
        object MnuApagarPropriedades6: TMenuItem
          Tag = 6
          Caption = 'Propriedades &6'
          OnClick = MnuApagarPropriedades0Click
        end
        object MnuApagarPropriedades7: TMenuItem
          Tag = 7
          Caption = 'Propriedades &7'
          OnClick = MnuApagarPropriedades0Click
        end
        object MnuApagarPropriedades8: TMenuItem
          Tag = 8
          Caption = 'Propriedades &8'
          OnClick = MnuApagarPropriedades0Click
        end
        object MnuApagarPropriedades9: TMenuItem
          Tag = 9
          Caption = 'Propriedades &9'
          OnClick = MnuApagarPropriedades0Click
        end
        object N5: TMenuItem
          Caption = '-'
        end
        object MnuApagarTodasPropriedades: TMenuItem
          Tag = 10
          Caption = '&Todas'
        end
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object MnuPararTab: TMenuItem
        Caption = '&Parar Tab'
        object MnuPararTabDesabilitar: TMenuItem
          Caption = '&Desabilitar'
          ShortCut = 49220
        end
        object MnuPararTabHabilitar: TMenuItem
          Caption = '&Habilitar'
          ShortCut = 49224
        end
      end
    end
    object Customizar: TMenuItem
      Caption = 'Customizar'
      Visible = False
      object Propriedades1: TMenuItem
        Caption = 'Propriedades'
        ShortCut = 121
      end
      object Desabilitar1: TMenuItem
        Caption = 'Desabilitar componente'
        ShortCut = 123
      end
      object Habilitar1: TMenuItem
        Tag = 1
        Caption = 'Habilitar componente'
        ShortCut = 122
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object Salvarformulrio1: TMenuItem
        Caption = 'Salvar formul'#225'rio'
      end
      object Desabilitarformulrio1: TMenuItem
        Caption = 'Desabilitar formul'#225'rio'
      end
      object Habilitarformulrio1: TMenuItem
        Tag = 1
        Caption = 'Habilitar formul'#225'rio'
      end
    end
  end
  object rsStorage: TrsStorage
    Active = True
    StorageData = rsRegData
    Options = [soSaveEmptySection]
    Left = 178
    Top = 144
  end
  object rsCustomProperties: TrsCustomProperties
    Properties = <
      item
        PropClass = 'TCustomEdit'
        PropName = 'Text'
      end
      item
        PropClass = 'TwwDBLookupCombo'
        PropName = 'Value'
      end
      item
        PropClass = 'TwwDBLookupCombo'
        PropName = 'Value'
      end
      item
        PropClass = 'TRxDBLookupCombo'
        PropName = 'Value'
      end>
    Left = 314
    Top = 136
  end
end

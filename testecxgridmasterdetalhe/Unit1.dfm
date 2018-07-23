object Form1: TForm1
  Left = 104
  Top = 132
  Width = 979
  Height = 563
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 16
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object cxGrid1: TcxGrid
    Left = 16
    Top = 64
    Width = 881
    Height = 417
    TabOrder = 1
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dtsMaster
      DataController.MasterKeyFieldNames = 'CdEmpresa'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ExpandButtonsForEmptyDetails = False
      object cxGrid1DBTableView1cdEmpresa: TcxGridDBColumn
        DataBinding.FieldName = 'cdEmpresa'
      end
      object cxGrid1DBTableView1NmEmpresa: TcxGridDBColumn
        DataBinding.FieldName = 'NmEmpresa'
      end
    end
    object cxGrid1DBTableView2: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dtsDetalhe
      DataController.DetailKeyFieldNames = 'CdEmpresa'
      DataController.MasterKeyFieldNames = 'cdEmpresa'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          FieldName = 'CdChamada'
          Column = cxGrid1DBTableView2CdChamada
          DisplayText = 'TESTE1'
        end>
      DataController.Summary.SummaryGroups = <
        item
          Links = <>
          SummaryItems = <>
        end>
      FilterRow.SeparatorWidth = 2
      OptionsView.ExpandButtonsForEmptyDetails = False
      object cxGrid1DBTableView2CdEmpresa: TcxGridDBColumn
        DataBinding.FieldName = 'CdEmpresa'
      end
      object cxGrid1DBTableView2NmFuncionario: TcxGridDBColumn
        DataBinding.FieldName = 'NmFuncionario'
      end
      object cxGrid1DBTableView2CdChamada: TcxGridDBColumn
        DataBinding.FieldName = 'CdChamada'
      end
    end
    object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Bands = <
        item
        end>
    end
    object cxGrid1DBTableView3: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dtsMaster
      DataController.DetailKeyFieldNames = 'cdEmpresa'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ExpandButtonsForEmptyDetails = False
      object cxGrid1DBTableView3cdEmpresa: TcxGridDBColumn
        DataBinding.FieldName = 'cdEmpresa'
      end
      object cxGrid1DBTableView3NmEmpresa: TcxGridDBColumn
        DataBinding.FieldName = 'NmEmpresa'
      end
    end
    object cxGrid1DBBandedTableView2: TcxGridDBBandedTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dtsDetalhe
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Bands = <
        item
          Caption = 'MASTER'
        end>
      object cxGrid1DBBandedTableView2CdEmpresa: TcxGridDBBandedColumn
        DataBinding.FieldName = 'CdEmpresa'
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
    end
    object cxGrid1DBBandedTableView3: TcxGridDBBandedTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dtsDetalhe
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Bands = <
        item
          Caption = 'DETALHE'
        end>
      object cxGrid1DBBandedTableView3NmFuncionario: TcxGridDBBandedColumn
        DataBinding.FieldName = 'NmFuncionario'
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView3CdChamada: TcxGridDBBandedColumn
        DataBinding.FieldName = 'CdChamada'
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
    end
    object cxGrid1DBBandedTableView4: TcxGridDBBandedTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dtsDetalhe
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Bands = <
        item
          Caption = 'CODIGO'
        end>
      object cxGrid1DBBandedTableView4CdChamada: TcxGridDBBandedColumn
        DataBinding.FieldName = 'CdChamada'
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
    end
    object cxGrid1DBBandedTableView5: TcxGridDBBandedTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Bands = <
        item
        end>
    end
    object cxGrid1DBBandedTableView6: TcxGridDBBandedTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dtsDetalhe
      DataController.DetailKeyFieldNames = 'CdEmpresa'
      DataController.KeyFieldNames = 'CdEmpresa'
      DataController.MasterKeyFieldNames = 'cdEmpresa'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Bands = <
        item
          Caption = 'C'#243'd.Empresa'
        end
        item
          Caption = 'Nome'
        end
        item
          Caption = 'C'#243'd.Funcion'#225'rio'
        end>
      object cxGrid1DBBandedTableView6CdEmpresa: TcxGridDBBandedColumn
        DataBinding.FieldName = 'CdEmpresa'
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView6NmFuncionario: TcxGridDBBandedColumn
        DataBinding.FieldName = 'NmFuncionario'
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView6CdChamada: TcxGridDBBandedColumn
        DataBinding.FieldName = 'CdChamada'
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
    end
    object cxGrid1DBBandedTableView7: TcxGridDBBandedTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dtsDetalhe2
      DataController.DetailKeyFieldNames = 'cdEmpresa'
      DataController.KeyFieldNames = 'CdEmpresa'
      DataController.MasterKeyFieldNames = 'cdEmpresa'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Bands = <
        item
          Caption = 'CODIGO'
        end>
      object cxGrid1DBBandedTableView7CdChamada: TcxGridDBBandedColumn
        DataBinding.FieldName = 'CdChamada'
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
    end
    object cxGrid1DBBandedTableView8: TcxGridDBBandedTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dtsDetalhe
      DataController.DetailKeyFieldNames = 'CdEmpresa'
      DataController.KeyFieldNames = 'CdEmpresa'
      DataController.MasterKeyFieldNames = 'cdEmpresa'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Bands = <
        item
          Caption = 'NOME'
        end>
      object cxGrid1DBBandedTableView8NmFuncionario: TcxGridDBBandedColumn
        DataBinding.FieldName = 'NmFuncionario'
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView3
      Options.TabsForEmptyDetails = False
      object cxGrid1Level2: TcxGridLevel
        GridView = cxGrid1DBBandedTableView6
      end
    end
  end
  object cdsMaster: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 16
    object cdsMastercdEmpresa: TIntegerField
      FieldName = 'cdEmpresa'
    end
    object cdsMasterNmEmpresa: TStringField
      FieldName = 'NmEmpresa'
      Size = 50
    end
  end
  object cdsDetalhe: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 152
    Top = 16
    object cdsDetalheCdEmpresa: TIntegerField
      FieldName = 'CdEmpresa'
    end
    object cdsDetalheNmFuncionario: TStringField
      FieldName = 'NmFuncionario'
      Size = 50
    end
    object cdsDetalheCdChamada: TStringField
      FieldName = 'CdChamada'
      Size = 10
    end
  end
  object dtsMaster: TDataSource
    DataSet = cdsMaster
    Left = 216
    Top = 16
  end
  object dtsDetalhe: TDataSource
    DataSet = cdsDetalhe
    Left = 248
    Top = 16
  end
  object dtsDetalhe2: TDataSource
    DataSet = cdsDetalhe2
    Left = 280
    Top = 16
  end
  object cdsDetalhe2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 16
    object IntegerField1: TIntegerField
      FieldName = 'CdEmpresa'
    end
    object StringField1: TStringField
      FieldName = 'NmFuncionario'
      Size = 50
    end
    object StringField2: TStringField
      FieldName = 'CdChamada'
      Size = 10
    end
  end
end

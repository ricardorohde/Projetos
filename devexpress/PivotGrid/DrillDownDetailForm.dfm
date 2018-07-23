inherited fmDrilldownDetail: TfmDrilldownDetail
  Caption = 'Drill Down Details'
  ClientWidth = 755
  ExplicitWidth = 763
  ExplicitHeight = 596
  PixelsPerInch = 96
  TextHeight = 13
  inherited paMenu: TPanel
    Width = 755
    ExplicitWidth = 755
    inherited paBaseClose: TPanel
      Left = 569
      ExplicitLeft = 569
    end
    object btnPrint: TLMDButton
      Left = 0
      Top = 1
      Width = 75
      Height = 25
      Action = actPrint
      TabOrder = 1
    end
    object btnExport: TLMDButton
      Left = 81
      Top = 1
      Width = 104
      Height = 25
      Action = actExportToExcel
      TabOrder = 2
    end
    object ckOpenFileAfterExport: TCheckBox
      Left = 191
      Top = 5
      Width = 138
      Height = 17
      Caption = 'Open File After Export'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
  end
  object grDrillDown: TcxGrid [1]
    Left = 0
    Top = 27
    Width = 755
    Height = 535
    Align = alClient
    TabOrder = 1
    object tvDrillDown: TcxGridDBTableView
      DataController.DataSource = fmAccountingDataViewer.dsAccountDetails
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object lvDrillDown: TcxGridLevel
      GridView = tvDrillDown
    end
  end
  inherited alMain: TActionList
    Left = 672
    Top = 64
    object actExportToExcel: TAction
      Caption = 'Export To Excel'
      OnExecute = actExportToExcelExecute
    end
    object actPrint: TAction
      Caption = 'Print'
      OnExecute = actPrintExecute
    end
  end
  object dxComponentPrinter: TdxComponentPrinter
    CurrentLink = linkDetailGrid
    Version = 0
    OnStartGenerateReport = dxComponentPrinterStartGenerateReport
    Left = 672
    Top = 96
    object linkDetailGrid: TdxGridReportLink
      Component = grDrillDown
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 200
      PrinterPage.Header = 200
      PrinterPage.Margins.Bottom = 500
      PrinterPage.Margins.Left = 500
      PrinterPage.Margins.Right = 500
      PrinterPage.Margins.Top = 500
      PrinterPage.PageSize.X = 8500
      PrinterPage.PageSize.Y = 11000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 1
      BuiltInReportLink = True
    end
  end
  object sdExportFile: TSaveDialog
    DefaultExt = 'xls'
    Filter = 'Excel Workbook 97-2003|*.xls'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Specify file for Export - must have XLS extension'
    Left = 672
    Top = 128
  end
end

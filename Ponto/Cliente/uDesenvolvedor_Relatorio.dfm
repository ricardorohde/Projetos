object frmDesenvolvedor_Relatorio: TfrmDesenvolvedor_Relatorio
  Left = 197
  Top = 171
  Width = 928
  Height = 480
  Caption = 'Desenvolver Relat'#243'rio'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TcxPageControl
    Left = 0
    Top = 0
    Width = 920
    Height = 434
    ActivePage = DesignerSheet
    Align = alClient
    TabOrder = 0
    OnChange = PageControlChange
    ClientRectBottom = 434
    ClientRectRight = 920
    ClientRectTop = 24
    object DesignerSheet: TcxTabSheet
      Caption = 'Desenhar P'#225'gina'
      ImageIndex = 0
    end
    object PreviewSheet: TcxTabSheet
      Caption = 'Exibir'
      ImageIndex = 1
      object frxPreview1: TfrxPreview
        Left = 0
        Top = -43
        Width = 920
        Height = 453
        OutlineVisible = True
        OutlineWidth = 121
        ThumbnailVisible = False
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    Left = 216
    Top = 120
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Background = False
    Creator = 'FastReport (http://www.fast-report.com)'
    HTMLTags = True
    Left = 248
    Top = 120
  end
  object frxReport1: TfrxReport
    Version = '4.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    OldStyleProgress = True
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39069.938386493060000000
    ReportOptions.LastChange = 39069.938386493060000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 148
    Top = 116
    Datasets = <>
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
    end
  end
  object frxDesigner1: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    Restrictions = []
    RTLLanguage = False
    Left = 184
    Top = 116
  end
  object MainMenu1: TMainMenu
    Left = 96
    Top = 104
    object File1: TMenuItem
      Caption = 'Arquivo'
      object NewMI: TMenuItem
        Caption = 'Novo...'
      end
      object NewReportMI: TMenuItem
        Caption = 'Novo Relat'#243'rio'
      end
      object NewPageMI: TMenuItem
        Caption = 'Nova P'#225'gina'
      end
      object NewDialogMI: TMenuItem
        Caption = 'New Dialog'
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object OpenMI: TMenuItem
        Caption = 'Abrir...'
      end
      object SaveMI: TMenuItem
        Caption = 'Salvar'
      end
      object SaveasMI: TMenuItem
        Caption = 'Salvar como...'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object PreviewMI: TMenuItem
        Caption = 'Visualizar'
      end
      object PagesettingsMI: TMenuItem
        Caption = 'Configura'#231#245'es de p'#225'gina...'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object ExitMI: TMenuItem
        Caption = 'Sair'
        OnClick = ExitMIClick
      end
    end
    object Edit1: TMenuItem
      Caption = 'Editar'
      object UndoMI: TMenuItem
        Caption = 'Desfazer'
      end
      object RedoMI: TMenuItem
        Caption = 'Refazer'
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object CutMI: TMenuItem
        Caption = 'Recortar'
      end
      object CopyMI: TMenuItem
        Caption = 'Copiar'
      end
      object PasteMI: TMenuItem
        Caption = 'Colar'
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object DeleteMI: TMenuItem
        Caption = 'Deletar'
      end
      object DeletePageMI: TMenuItem
        Caption = 'Deletar P'#225'gina'
      end
      object SelectAllMI: TMenuItem
        Caption = 'Selecionar Tudo'
      end
      object GroupMI: TMenuItem
        Caption = 'Agrupar'
      end
      object UngroupMI: TMenuItem
        Caption = 'Desabrupar'
      end
      object EditMI: TMenuItem
        Caption = 'Edit'
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object FindMI: TMenuItem
        Caption = 'Find'
      end
      object ReplaceMI: TMenuItem
        Caption = 'Replace'
      end
      object FindNextMI: TMenuItem
        Caption = 'Find Next'
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object BringtoFrontMI: TMenuItem
        Caption = 'Bring to Front'
      end
      object SendtoBackMI: TMenuItem
        Caption = 'Send to Back'
      end
    end
    object Report1: TMenuItem
      Caption = 'Relat'#243'rio'
      object DataMI: TMenuItem
        Caption = 'Dados...'
      end
      object VariablesMI: TMenuItem
        Caption = 'Vari'#225'veis...'
      end
      object StylesMI: TMenuItem
        Caption = 'Estilos...'
      end
      object ReportOptionsMI: TMenuItem
        Caption = 'Op'#231#245'es...'
      end
    end
    object View1: TMenuItem
      Caption = 'Exibir'
      object ToolbarsMI: TMenuItem
        Caption = 'Toolbars'
        object StandardMI: TMenuItem
          Caption = 'Standard'
        end
        object TextMI: TMenuItem
          Caption = 'Text'
        end
        object FrameMI: TMenuItem
          Caption = 'Frame'
        end
        object AlignmentPaletteMI: TMenuItem
          Caption = 'Alignment Palette'
        end
        object ObjectInspectorMI: TMenuItem
          Caption = 'Object Inspector'
        end
        object DataTreeMI: TMenuItem
          Caption = 'Data Tree'
        end
        object ReportTreeMI: TMenuItem
          Caption = 'Report Tree'
        end
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object RulersMI: TMenuItem
        Caption = 'R'#233'guas'
      end
      object GuidesMI: TMenuItem
        Caption = 'Guias'
      end
      object DeleteGuidesMI: TMenuItem
        Caption = 'Deletar Guias'
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object OptionsMI: TMenuItem
        Caption = 'Op'#231#245'es...'
      end
    end
    object Help1: TMenuItem
      Caption = 'Ajuda'
      object HelpContentsMI: TMenuItem
        Caption = 'Conte'#250'do...'
      end
      object AboutFastReportMI: TMenuItem
        Caption = 'Sobre FastReports...'
      end
    end
  end
end

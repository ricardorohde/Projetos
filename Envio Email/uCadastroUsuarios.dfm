object frmCadastroUsuarios: TfrmCadastroUsuarios
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastro de Usu'#225'rios'
  ClientHeight = 391
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 350
    Width = 360
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = 112
    ExplicitTop = 307
    ExplicitWidth = 185
    object btnGravar: TBitBtn
      Left = 192
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Gravar'
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
    end
    object btnCancelar: TBitBtn
      Left = 273
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 0
    Width = 360
    Height = 350
    Align = alClient
    TabOrder = 1
    Properties.ActivePage = tbDados
    Properties.CustomButtons.Buttons = <>
    ExplicitLeft = 40
    ExplicitTop = 8
    ExplicitWidth = 289
    ExplicitHeight = 193
    ClientRectBottom = 350
    ClientRectRight = 360
    ClientRectTop = 24
    object tbDados: TcxTabSheet
      Caption = 'Dados'
      ImageIndex = 0
      ExplicitLeft = -40
      ExplicitTop = 3
      ExplicitWidth = 289
      ExplicitHeight = 169
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 360
        Height = 326
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 3
        ExplicitTop = 3
        ExplicitWidth = 361
        ExplicitHeight = 265
        object tv: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.GroupByBox = False
        end
        object lv: TcxGridLevel
          GridView = tv
        end
      end
    end
    object tbDetalhe: TcxTabSheet
      Caption = 'Detalhe'
      ImageIndex = 1
      ExplicitWidth = 289
      ExplicitHeight = 169
    end
  end
  object ADODataSet1: TADODataSet
    Parameters = <>
    Left = 304
    Top = 16
  end
end

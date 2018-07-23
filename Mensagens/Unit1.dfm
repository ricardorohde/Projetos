object Form1: TForm1
  Left = 206
  Top = 191
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 331
  ClientWidth = 539
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 27
    Width = 539
    Height = 304
    ActivePage = cxTabSheet1
    Align = alClient
    TabOrder = 0
    OnChange = cxPageControl1Change
    ClientRectBottom = 304
    ClientRectRight = 539
    ClientRectTop = 24
    object cxTabSheet1: TcxTabSheet
      Caption = 'Dados'
      ImageIndex = 0
      object Grid: TcxGrid
        Left = 0
        Top = 0
        Width = 539
        Height = 280
        Align = alClient
        TabOrder = 0
        object tv1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dtsMensagem
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.GroupByBox = False
          object tv1CODIGO: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'CODIGO'
            HeaderAlignmentHorz = taCenter
            Width = 44
          end
          object tv1MENSAGEM: TcxGridDBColumn
            Caption = 'Mensagem'
            DataBinding.FieldName = 'MENSAGEM'
            HeaderAlignmentHorz = taCenter
            Width = 350
          end
        end
        object tv2: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dtsMensagem_Detalhe
          DataController.DetailKeyFieldNames = 'CODIGO'
          DataController.KeyFieldNames = 'CODIGO'
          DataController.MasterKeyFieldNames = 'CODIGO'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.GroupByBox = False
          object tv2TIPO: TcxGridDBColumn
            DataBinding.FieldName = 'TIPO'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Items = <
              item
                Description = 'E-MAIL'
                ImageIndex = 0
                Value = 1
              end
              item
                Description = 'SMS'
                Value = 2
              end
              item
                Description = 'E-MAIL/SMS'
                Value = 3
              end>
          end
          object tv2CODPRE: TcxGridDBColumn
            DataBinding.FieldName = 'CODPRE'
          end
          object tv2TIPPRE: TcxGridDBColumn
            DataBinding.FieldName = 'TIPPRE'
          end
          object tv2CODPRO: TcxGridDBColumn
            DataBinding.FieldName = 'CODPRO'
          end
        end
        object lv1: TcxGridLevel
          GridView = tv1
          object lv2: TcxGridLevel
            GridView = tv2
          end
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Detalhe'
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 539
        Height = 280
        Align = alClient
        TabOrder = 0
        object grdMensagem_Detalhe: TcxGrid
          Left = 1
          Top = 138
          Width = 537
          Height = 141
          Align = alBottom
          TabOrder = 0
          object tv: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = dtsMensagem_Aux
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsView.GroupByBox = False
            object tvTIPO: TcxGridDBColumn
              Caption = 'Tipo Mensagem'
              DataBinding.FieldName = 'TIPO'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Items = <
                item
                  Description = 'E-MAIL'
                  ImageIndex = 0
                  Value = 1
                end
                item
                  Description = 'SMS'
                  Value = 2
                end
                item
                  Description = 'E-MAIL/SMS'
                  Value = 3
                end>
              Width = 87
            end
            object tvCODPRE: TcxGridDBColumn
              Caption = 'C'#243'digo Pr'#234'mio'
              DataBinding.FieldName = 'CODPRE'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.ImmediatePost = True
              Properties.KeyFieldNames = 'CODPRE'
              Properties.ListColumns = <
                item
                  FieldName = 'CODPRE'
                end>
              Properties.ListSource = dtsPremio
            end
            object tvTIPPRE: TcxGridDBColumn
              Caption = 'Tipo Pr'#234'mio'
              DataBinding.FieldName = 'TIPPRE'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.ImmediatePost = True
              Properties.KeyFieldNames = 'TIPPRE'
              Properties.ListColumns = <
                item
                  FieldName = 'TIPPRE'
                end>
              Properties.ListSource = dtsPremio
            end
            object tvCODPRO: TcxGridDBColumn
              Caption = 'C'#243'd. Produto'
              DataBinding.FieldName = 'CODPRO'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'CODIGO'
              Properties.ListColumns = <
                item
                  FieldName = 'NOMPRO'
                end>
              Properties.ListSource = dtsProduto
              Width = 100
            end
          end
          object lv: TcxGridLevel
            GridView = tv
          end
        end
        object mmoMensagem: TMemo
          Left = 1
          Top = 1
          Width = 537
          Height = 137
          Align = alClient
          Lines.Strings = (
            '')
          MaxLength = 255
          TabOrder = 1
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 539
    Height = 27
    Align = alTop
    TabOrder = 1
    object btnNovaMensagem: TcxButton
      Left = 3
      Top = 1
      Width = 75
      Height = 25
      TabOrder = 0
      OnClick = btnNovaMensagemClick
      Align = alRight
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7C5EA296FD4
        3082DF3281DD3281DD3281DD3281DD3281DD3281DD3281DD307ADA2F76D82F77
        D82F78DA276FD4B7C5EA5B83D51893E81285E41487E51487E51487E51487E514
        87E51487E51485E3138DE91490E9148EE9148FEA1392EB5881D62C8BE01CADF6
        095ACE095ACE095ACE095ACE095ACE095ACE095ACE095ACE0E92EE14BAFC13B4
        F813B4F813C0FF1676DC3E93E226B1F10F95E90F95E90F95E90F95E90F95E90F
        95E90F95E90F95E90F95E914BAF712B2F512B2F513BFFA217EDC3B95E325C0F4
        095ACE095ACE095ACE095ACE095ACE095ACE095ACE095ACE10A1ED14C2F712BC
        F512BBF511C9FA2282DF3C96E324C9F60786DF0A8AE10A8AE10A8AE10A8AE10A
        8AE10A8AE10988E000A6F000C0F900BBF700BAF500CBFC2188E13693E223E2FC
        0ED0F911D2F911D2F911D2F911D2F911D2F90FD2FA0FD1F631B6E931B6E931B6
        E931B6E931B6E91172D63194E31CE2FC0ECBF40FCCF50FCCF50FCCF50FCCF50F
        CCF509CEF718C3F5FFD1A7FDAD3EF9B14EFFB84CB7D6D20C6AD23398E318E8FA
        0BD0F50CD1F50CD1F50CD1F50CD1F50DD1F506D5F711C6F7F7D7ACEBA81DE7AD
        31FFB331B0E0E00D74D52F9BE429FCFC06D5F706D5F706D5F706D5F706D5F706
        D5F706D5F71AD8EEFFFBE6FFF6CFFFF7D4FFFCD5BDF9EB007DD46491E429FCFC
        29FCFC29FCFC29FCFC29FCFC0EE4F70EE4F70EE4F70EE4F70EE4F70EE4F70EE4
        F70EE4F70EE4F7588FE3B9C9F24093E5449EE7439AE6439AE6449AE6449AE644
        9AE6449AE6459CE63A97E43A96E33996E23999E42F8AE0BAC8F2FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object cxDBNavigator1: TcxDBNavigator
      Left = 78
      Top = 1
      Width = 460
      Height = 25
      Buttons.OnButtonClick = cxDBNavigator1ButtonsButtonClick
      Buttons.First.Visible = False
      Buttons.PriorPage.Visible = False
      Buttons.Prior.Visible = False
      Buttons.Next.Visible = False
      Buttons.NextPage.Visible = False
      Buttons.Last.Visible = False
      Buttons.Append.Visible = False
      Buttons.Refresh.Visible = False
      Buttons.SaveBookmark.Visible = False
      Buttons.GotoBookmark.Visible = False
      Buttons.Filter.Visible = False
      DataSource = dtsMensagem_Aux
      InfoPanel.Font.Charset = DEFAULT_CHARSET
      InfoPanel.Font.Color = clDefault
      InfoPanel.Font.Height = -11
      InfoPanel.Font.Name = 'MS Sans Serif'
      InfoPanel.Font.Style = []
      Align = alRight
      TabOrder = 1
    end
  end
  object qryMensagem: TQuery
    Left = 136
    Top = 73
  end
  object dtsMensagem: TDataSource
    DataSet = qryMensagem
    Left = 56
    Top = 73
  end
  object cdsMensagem_Detalhe: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 129
    object cdsMensagem_DetalheCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsMensagem_DetalheTIPO: TIntegerField
      FieldName = 'TIPO'
    end
    object cdsMensagem_DetalheCODPRE: TStringField
      FieldName = 'CODPRE'
      Size = 30
    end
    object cdsMensagem_DetalheTIPPRE: TStringField
      FieldName = 'TIPPRE'
      Size = 30
    end
    object cdsMensagem_DetalheCODPRO: TIntegerField
      FieldName = 'CODPRO'
    end
    object cdsMensagem_DetalheBOTAO: TIntegerField
      FieldName = 'BOTAO'
    end
  end
  object dtsMensagem_Detalhe: TDataSource
    DataSet = cdsMensagem_Detalhe
    Left = 144
    Top = 121
  end
  object qryPremio: TQuery
    Left = 280
    Top = 81
    object qryPremioCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object qryPremioCODPRE: TStringField
      FieldName = 'CODPRE'
      Size = 30
    end
    object qryPremioTIPPRE: TStringField
      FieldName = 'TIPPRE'
      Size = 30
    end
  end
  object qryProduto: TQuery
    Left = 280
    Top = 129
    object qryProdutoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object qryProdutoNOMPRO: TStringField
      FieldName = 'NOMPRO'
      Size = 50
    end
  end
  object dtsPremio: TDataSource
    DataSet = qryPremio
    Left = 336
    Top = 89
  end
  object dtsProduto: TDataSource
    DataSet = qryProduto
    Left = 344
    Top = 145
  end
  object cdsMensagem_Aux: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsMensagem_AuxBeforePost
    AfterPost = cdsMensagem_AuxAfterPost
    Left = 424
    Top = 73
    object cdsMensagem_AuxCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsMensagem_AuxTIPO: TIntegerField
      FieldName = 'TIPO'
    end
    object cdsMensagem_AuxCODPRE: TStringField
      FieldName = 'CODPRE'
      Size = 30
    end
    object cdsMensagem_AuxTIPPRE: TStringField
      FieldName = 'TIPPRE'
      Size = 30
    end
    object cdsMensagem_AuxCODPRO: TIntegerField
      FieldName = 'CODPRO'
    end
    object cdsMensagem_AuxBOTAO: TIntegerField
      FieldName = 'BOTAO'
    end
  end
  object dtsMensagem_Aux: TDataSource
    DataSet = cdsMensagem_Aux
    Left = 432
    Top = 137
  end
end

object frmEntrada: TfrmEntrada
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Entrada'
  ClientHeight = 520
  ClientWidth = 761
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lstPrincipal: TListBox
    Left = 0
    Top = 0
    Width = 129
    Height = 501
    Align = alLeft
    ItemHeight = 13
    TabOrder = 0
    ExplicitHeight = 440
  end
  object Panel1: TPanel
    Left = 129
    Top = 0
    Width = 632
    Height = 501
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 587
    ExplicitHeight = 440
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 630
      Height = 34
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 585
      object btnEscrever: TButton
        Left = 523
        Top = 5
        Width = 97
        Height = 25
        Caption = 'Escrever'
        TabOrder = 0
        OnClick = btnEscreverClick
      end
    end
    object memLog: TMemo
      Left = 1
      Top = 411
      Width = 630
      Height = 89
      Align = alBottom
      TabOrder = 1
      ExplicitTop = 350
      ExplicitWidth = 585
    end
    object cxGrid1: TcxGrid
      Left = 1
      Top = 35
      Width = 630
      Height = 376
      Align = alClient
      TabOrder = 2
      ExplicitLeft = 25
      ExplicitTop = 41
      object cxGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dtsEmails
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.GroupByBox = False
        object cxGrid1DBTableView1Login: TcxGridDBColumn
          DataBinding.FieldName = 'Login'
          Visible = False
          GroupIndex = 0
        end
        object cxGrid1DBTableView1remetente: TcxGridDBColumn
          DataBinding.FieldName = 'remetente'
          Width = 300
        end
        object cxGrid1DBTableView1assunto: TcxGridDBColumn
          DataBinding.FieldName = 'assunto'
          Width = 300
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 501
    Width = 761
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
    ExplicitLeft = -1
    ExplicitTop = 493
    ExplicitWidth = 716
  end
  object IdMappedPOP31: TIdMappedPOP3
    Bindings = <>
    Greeting.Code = '+OK'
    Greeting.Text.Strings = (
      'POP3 proxy ready')
    ReplyUnknownCommand.Code = '-ERR'
    ReplyUnknownCommand.Text.Strings = (
      'command must be either USER or QUIT')
    UserHostDelimiter = '#'
    Left = 712
    Top = 208
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 712
    Top = 96
  end
  object IdIMAP41: TIdIMAP4
    SASLMechanisms = <>
    MilliSecsToWaitToClearBuffer = 10
    Left = 712
    Top = 144
  end
  object dtsEmails: TDataSource
    DataSet = cdsEmails_View
    Left = 336
    Top = 8
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = Timer1Timer
    Left = 384
    Top = 8
  end
  object con: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;User ID=sa;Initial Catalog=email;Data Source=EDSON-PC\S' +
      'QLEXPRESS'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 440
    Top = 8
  end
  object cdsEmails: TADODataSet
    Connection = con
    CursorType = ctStatic
    CommandText = 'SELECT * FROM tblEmail'
    Parameters = <>
    Left = 288
    Top = 8
    object cdsEmailsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object cdsEmailsremetente: TStringField
      FieldName = 'remetente'
      Size = 255
    end
    object cdsEmailsassunto: TStringField
      FieldName = 'assunto'
      Size = 255
    end
    object cdsEmailstexto: TMemoField
      FieldName = 'texto'
      BlobType = ftMemo
    end
    object cdsEmailsIdUsuario: TIntegerField
      FieldName = 'IdUsuario'
    end
    object cdsEmailsidEmail: TIntegerField
      FieldName = 'idEmail'
    end
  end
  object qryUsuarios: TADOQuery
    Parameters = <>
    Left = 496
    Top = 8
  end
  object cdsEmails_View: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 144
    object cdsEmails_ViewID: TAutoIncField
      FieldName = 'ID'
    end
    object cdsEmails_ViewLogin: TStringField
      FieldName = 'Login'
      Size = 50
    end
    object cdsEmails_Viewremetente: TStringField
      FieldName = 'remetente'
      Size = 255
    end
    object cdsEmails_Viewassunto: TStringField
      FieldName = 'assunto'
      Size = 255
    end
    object cdsEmails_ViewIdEmail: TIntegerField
      FieldName = 'IdEmail'
    end
  end
end

object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 321
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 635
    Height = 281
    Align = alTop
    DataSource = dtsMonitoramento
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object cdsMonitoramento: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 40
    object cdsMonitoramentoSTATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object cdsMonitoramentoACAO: TIntegerField
      FieldName = 'ACAO'
    end
    object cdsMonitoramentoEVENTO: TStringField
      FieldName = 'EVENTO'
    end
    object cdsMonitoramentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object cdsMonitoramentoTIPO: TIntegerField
      FieldName = 'TIPO'
    end
    object cdsMonitoramentoAMBIENTE: TIntegerField
      FieldName = 'AMBIENTE'
    end
  end
  object dtsMonitoramento: TDataSource
    DataSet = cdsMonitoramento
    Left = 440
    Top = 40
  end
end

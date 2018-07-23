object DM_Utils: TDM_Utils
  OldCreateOrder = False
  Left = 305
  Top = 232
  Height = 198
  Width = 248
  object DCOMCon_Utils: TDCOMConnection
    Connected = True
    ServerGUID = '{A402B49E-86E7-4566-8303-F9441EF36CC0}'
    ServerName = 'ServidorPonto.RDM_Utils'
    Left = 56
    Top = 16
  end
  object cdsRetornoID: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'TABELA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CAMPO'
        ParamType = ptInput
      end>
    ProviderName = 'dspRetornoID'
    RemoteServer = DCOMCon_Utils
    Left = 144
    Top = 16
    object cdsRetornoIDid: TLargeintField
      FieldName = 'id'
      ReadOnly = True
    end
  end
  object cdsEstados: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'UF'
        ParamType = ptInput
      end>
    ProviderName = 'dspEstados'
    RemoteServer = DCOMCon_Utils
    Left = 56
    Top = 72
    object cdsEstadosID_ESTADO: TIntegerField
      FieldName = 'ID_ESTADO'
    end
    object cdsEstadosUF: TWideStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsEstadosNOME: TWideStringField
      FieldName = 'NOME'
      Size = 50
    end
  end
end

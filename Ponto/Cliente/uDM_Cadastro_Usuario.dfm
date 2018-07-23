object DM_Cadastro_Usuario: TDM_Cadastro_Usuario
  OldCreateOrder = False
  Left = 192
  Top = 107
  Height = 196
  Width = 243
  object DCOMCon_Usuario: TDCOMConnection
    Connected = True
    ServerGUID = '{0E960896-7C4B-47F1-98E4-F05DF3D3B20B}'
    ServerName = 'ServidorPonto.RDM_Usuario'
    Left = 96
    Top = 24
  end
  object cds_Usuario: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'USUARIO'
        ParamType = ptInput
      end>
    ProviderName = 'dspUsuario'
    RemoteServer = DCOMCon_Usuario
    Left = 80
    Top = 96
    object cds_UsuarioID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
    end
    object cds_UsuarioUSUARIO: TWideStringField
      FieldName = 'USUARIO'
      Size = 30
    end
    object cds_UsuarioSENHA: TWideStringField
      FieldName = 'SENHA'
      Size = 255
    end
    object cds_UsuarioCODIGO_EXTERNO: TIntegerField
      FieldName = 'CODIGO_EXTERNO'
    end
  end
end

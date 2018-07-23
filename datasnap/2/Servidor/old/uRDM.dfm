object RDM: TRDM
  OldCreateOrder = False
  Pooled = False
  Left = 298
  Top = 246
  Height = 216
  Width = 269
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=PGNP.1;Password=123;Persist Security Info=True;User ID=' +
      'postgres;Initial Catalog=postgres;Data Source=localhost;Extended' +
      ' Properties="SSL=allow;"'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'PGNP.1'
    Left = 32
    Top = 24
  end
  object ADODataSet1: TADODataSet
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'SELECT "ID_HORARIO"'#13#10#9#9',"CODIGO_EXTERNO"'#13#10#9#9',"DESCRICAO"'#13#10#9#9',"PO' +
      'SSUI_ESCALA"'#13#10#9'FROM "public"."HORARIO"'
    Parameters = <>
    Left = 128
    Top = 24
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = ADODataSet1
    Left = 72
    Top = 80
  end
end

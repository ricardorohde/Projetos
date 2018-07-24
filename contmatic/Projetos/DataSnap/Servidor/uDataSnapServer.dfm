object DataSnapServer: TDataSnapServer
  OldCreateOrder = False
  Left = 376
  Top = 250
  Height = 211
  Width = 318
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=PGNP.1;Password=123;Persist Security Info=True;User ID=' +
      'postgres;Initial Catalog=folha;Data Source=localhost;Extended Pr' +
      'operties="SSL=allow;"'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'PGNP.1'
    Left = 48
    Top = 24
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM func')
    Left = 136
    Top = 24
    object ADOQuery1funcid: TIntegerField
      FieldName = 'funcid'
    end
    object ADOQuery1numregistro: TIntegerField
      FieldName = 'numregistro'
    end
    object ADOQuery1numchapa: TIntegerField
      FieldName = 'numchapa'
    end
    object ADOQuery1nome: TWideStringField
      FieldName = 'nome'
      Size = 40
    end
    object ADOQuery1endereco: TWideStringField
      FieldName = 'endereco'
      Size = 40
    end
    object ADOQuery1numero: TIntegerField
      FieldName = 'numero'
    end
    object ADOQuery1compl: TWideStringField
      FieldName = 'compl'
      Size = 25
    end
    object ADOQuery1bairro: TWideStringField
      FieldName = 'bairro'
      Size = 30
    end
    object ADOQuery1cidade: TWideStringField
      FieldName = 'cidade'
      Size = 30
    end
    object ADOQuery1uf: TWideStringField
      FieldName = 'uf'
      Size = 2
    end
    object ADOQuery1cep: TWideStringField
      FieldName = 'cep'
      Size = 9
    end
    object ADOQuery1fone: TWideStringField
      FieldName = 'fone'
      Size = 15
    end
    object ADOQuery1datanasc: TDateField
      FieldName = 'datanasc'
    end
    object ADOQuery1nomepai: TWideStringField
      FieldName = 'nomepai'
      Size = 40
    end
    object ADOQuery1nomemae: TWideStringField
      FieldName = 'nomemae'
      Size = 40
    end
    object ADOQuery1estcivil: TIntegerField
      FieldName = 'estcivil'
    end
    object ADOQuery1sexo: TIntegerField
      FieldName = 'sexo'
    end
    object ADOQuery1ctpsserieuf: TWideStringField
      FieldName = 'ctpsserieuf'
      Size = 15
    end
    object ADOQuery1pis: TWideStringField
      FieldName = 'pis'
      Size = 15
    end
    object ADOQuery1cpf: TWideStringField
      FieldName = 'cpf'
      Size = 18
    end
    object ADOQuery1rg: TWideStringField
      FieldName = 'rg'
      Size = 14
    end
    object ADOQuery1titeleitor: TWideStringField
      FieldName = 'titeleitor'
      Size = 14
    end
    object ADOQuery1zona: TWideStringField
      FieldName = 'zona'
      Size = 3
    end
    object ADOQuery1secao: TWideStringField
      FieldName = 'secao'
      Size = 4
    end
    object ADOQuery1reservista: TWideStringField
      FieldName = 'reservista'
      Size = 15
    end
    object ADOQuery1carthabilt: TWideStringField
      FieldName = 'carthabilt'
      Size = 11
    end
    object ADOQuery1tpsanguinio: TWideStringField
      FieldName = 'tpsanguinio'
      Size = 12
    end
    object ADOQuery1naturalidade: TWideStringField
      FieldName = 'naturalidade'
      Size = 30
    end
    object ADOQuery1ufnasc: TWideStringField
      FieldName = 'ufnasc'
      Size = 2
    end
    object ADOQuery1nacionalidade: TIntegerField
      FieldName = 'nacionalidade'
    end
    object ADOQuery1datachegada: TDateField
      FieldName = 'datachegada'
    end
    object ADOQuery1situacaocaged: TIntegerField
      FieldName = 'situacaocaged'
    end
    object ADOQuery1grauinstr: TIntegerField
      FieldName = 'grauinstr'
    end
    object ADOQuery1vinculoempreg: TIntegerField
      FieldName = 'vinculoempreg'
    end
    object ADOQuery1admrefgts: TIntegerField
      FieldName = 'admrefgts'
    end
    object ADOQuery1tipocontrato: TIntegerField
      FieldName = 'tipocontrato'
    end
    object ADOQuery1validadeexmed: TIntegerField
      FieldName = 'validadeexmed'
    end
    object ADOQuery1op13ferres: TIntegerField
      FieldName = 'op13ferres'
    end
    object ADOQuery1dataadmissao: TDateField
      FieldName = 'dataadmissao'
    end
    object ADOQuery1dataopcaofgts: TDateField
      FieldName = 'dataopcaofgts'
    end
    object ADOQuery1dataexmedico: TDateField
      FieldName = 'dataexmedico'
    end
    object ADOQuery1datatransf: TDateField
      FieldName = 'datatransf'
    end
    object ADOQuery1datarescisao: TDateField
      FieldName = 'datarescisao'
    end
    object ADOQuery1numcontfgts: TWideStringField
      FieldName = 'numcontfgts'
      Size = 10
    end
    object ADOQuery1numbanco: TIntegerField
      FieldName = 'numbanco'
    end
    object ADOQuery1numerocc: TWideStringField
      FieldName = 'numerocc'
      Size = 10
    end
    object ADOQuery1tiposalario: TIntegerField
      FieldName = 'tiposalario'
    end
    object ADOQuery1codsind: TIntegerField
      FieldName = 'codsind'
    end
    object ADOQuery1tptributsind: TIntegerField
      FieldName = 'tptributsind'
    end
    object ADOQuery1qtdehsmensal: TIntegerField
      FieldName = 'qtdehsmensal'
    end
    object ADOQuery1qtdehssemana: TIntegerField
      FieldName = 'qtdehssemana'
    end
    object ADOQuery1tempoexper: TIntegerField
      FieldName = 'tempoexper'
    end
    object ADOQuery1tempoprorrog: TIntegerField
      FieldName = 'tempoprorrog'
    end
    object ADOQuery1codlocal: TIntegerField
      FieldName = 'codlocal'
    end
    object ADOQuery1coddepto: TIntegerField
      FieldName = 'coddepto'
    end
    object ADOQuery1codsetor: TIntegerField
      FieldName = 'codsetor'
    end
    object ADOQuery1codsecao: TIntegerField
      FieldName = 'codsecao'
    end
    object ADOQuery1codrisco: TIntegerField
      FieldName = 'codrisco'
    end
    object ADOQuery1emissorrg: TIntegerField
      FieldName = 'emissorrg'
    end
    object ADOQuery1emissorufrg: TWideStringField
      FieldName = 'emissorufrg'
      Size = 2
    end
    object ADOQuery1dataexprg: TDateField
      FieldName = 'dataexprg'
    end
    object ADOQuery1dataexpctps: TDateField
      FieldName = 'dataexpctps'
    end
    object ADOQuery1tipovisto: TWideStringField
      FieldName = 'tipovisto'
      Size = 25
    end
    object ADOQuery1numrne: TWideStringField
      FieldName = 'numrne'
      Size = 15
    end
    object ADOQuery1validaderne: TDateField
      FieldName = 'validaderne'
    end
    object ADOQuery1dataexpctpsex: TDateField
      FieldName = 'dataexpctpsex'
    end
    object ADOQuery1valctpsex: TDateField
      FieldName = 'valctpsex'
    end
    object ADOQuery1numctpsex: TWideStringField
      FieldName = 'numctpsex'
      Size = 13
    end
    object ADOQuery1datacadpis: TDateField
      FieldName = 'datacadpis'
    end
    object ADOQuery1matriculasind: TWideStringField
      FieldName = 'matriculasind'
      Size = 7
    end
    object ADOQuery1nomeconsreg: TWideStringField
      FieldName = 'nomeconsreg'
      Size = 40
    end
    object ADOQuery1numconsreg: TWideStringField
      FieldName = 'numconsreg'
      Size = 10
    end
    object ADOQuery1siglaconsreg: TWideStringField
      FieldName = 'siglaconsreg'
      Size = 10
    end
    object ADOQuery1regiaoconsreg: TWideStringField
      FieldName = 'regiaoconsreg'
      Size = 31
    end
    object ADOQuery1partcipa: TBooleanField
      FieldName = 'partcipa'
    end
    object ADOQuery1qtdedepsalfam: TIntegerField
      FieldName = 'qtdedepsalfam'
    end
    object ADOQuery1qtdedepirrf: TIntegerField
      FieldName = 'qtdedepirrf'
    end
    object ADOQuery1codhorario: TIntegerField
      FieldName = 'codhorario'
    end
    object ADOQuery1observacao: TMemoField
      FieldName = 'observacao'
      BlobType = ftMemo
    end
    object ADOQuery1phx_apelido: TWideStringField
      FieldName = 'phx_apelido'
      Size = 8
    end
    object ADOQuery1pk_func: TIntegerField
      FieldName = 'pk_func'
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = ADOQuery1
    OnDataRequest = DataSetProvider1DataRequest
    Left = 224
    Top = 24
  end
end

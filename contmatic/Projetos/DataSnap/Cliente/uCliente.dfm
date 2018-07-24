inherited frmCliente: TfrmCliente
  Caption = 'Cliente'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    ActivePage = tsDetalhe
    inherited tsDetalhe: TTabSheet
      object Label1: TLabel
        Left = 8
        Top = 0
        Width = 26
        Height = 13
        Caption = 'nome'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 8
        Top = 40
        Width = 45
        Height = 13
        Caption = 'endereco'
        FocusControl = DBEdit2
      end
      object DBEdit1: TDBEdit
        Left = 8
        Top = 16
        Width = 300
        Height = 21
        DataField = 'nome'
        DataSource = dtsTabela
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 8
        Top = 56
        Width = 300
        Height = 21
        DataField = 'endereco'
        DataSource = dtsTabela
        TabOrder = 1
      end
    end
  end
  inherited cdsTabela: TEMSTable
    Active = True
    ProviderName = 'DataSetProvider1'
    RemoteServer = dtmPrincipal.SocketConnection1
    object cdsTabelafuncid: TIntegerField
      FieldName = 'funcid'
    end
    object cdsTabelanumregistro: TIntegerField
      FieldName = 'numregistro'
    end
    object cdsTabelanumchapa: TIntegerField
      FieldName = 'numchapa'
    end
    object cdsTabelanome: TWideStringField
      FieldName = 'nome'
      Size = 40
    end
    object cdsTabelaendereco: TWideStringField
      FieldName = 'endereco'
      Size = 40
    end
    object cdsTabelanumero: TIntegerField
      FieldName = 'numero'
    end
    object cdsTabelacompl: TWideStringField
      FieldName = 'compl'
      Size = 25
    end
    object cdsTabelabairro: TWideStringField
      FieldName = 'bairro'
      Size = 30
    end
    object cdsTabelacidade: TWideStringField
      FieldName = 'cidade'
      Size = 30
    end
    object cdsTabelauf: TWideStringField
      FieldName = 'uf'
      Size = 2
    end
    object cdsTabelacep: TWideStringField
      FieldName = 'cep'
      Size = 9
    end
    object cdsTabelafone: TWideStringField
      FieldName = 'fone'
      Size = 15
    end
    object cdsTabeladatanasc: TDateField
      FieldName = 'datanasc'
    end
    object cdsTabelanomepai: TWideStringField
      FieldName = 'nomepai'
      Size = 40
    end
    object cdsTabelanomemae: TWideStringField
      FieldName = 'nomemae'
      Size = 40
    end
    object cdsTabelaestcivil: TIntegerField
      FieldName = 'estcivil'
    end
    object cdsTabelasexo: TIntegerField
      FieldName = 'sexo'
    end
    object cdsTabelactpsserieuf: TWideStringField
      FieldName = 'ctpsserieuf'
      Size = 15
    end
    object cdsTabelapis: TWideStringField
      FieldName = 'pis'
      Size = 15
    end
    object cdsTabelacpf: TWideStringField
      FieldName = 'cpf'
      Size = 18
    end
    object cdsTabelarg: TWideStringField
      FieldName = 'rg'
      Size = 14
    end
    object cdsTabelatiteleitor: TWideStringField
      FieldName = 'titeleitor'
      Size = 14
    end
    object cdsTabelazona: TWideStringField
      FieldName = 'zona'
      Size = 3
    end
    object cdsTabelasecao: TWideStringField
      FieldName = 'secao'
      Size = 4
    end
    object cdsTabelareservista: TWideStringField
      FieldName = 'reservista'
      Size = 15
    end
    object cdsTabelacarthabilt: TWideStringField
      FieldName = 'carthabilt'
      Size = 11
    end
    object cdsTabelatpsanguinio: TWideStringField
      FieldName = 'tpsanguinio'
      Size = 12
    end
    object cdsTabelanaturalidade: TWideStringField
      FieldName = 'naturalidade'
      Size = 30
    end
    object cdsTabelaufnasc: TWideStringField
      FieldName = 'ufnasc'
      Size = 2
    end
    object cdsTabelanacionalidade: TIntegerField
      FieldName = 'nacionalidade'
    end
    object cdsTabeladatachegada: TDateField
      FieldName = 'datachegada'
    end
    object cdsTabelasituacaocaged: TIntegerField
      FieldName = 'situacaocaged'
    end
    object cdsTabelagrauinstr: TIntegerField
      FieldName = 'grauinstr'
    end
    object cdsTabelavinculoempreg: TIntegerField
      FieldName = 'vinculoempreg'
    end
    object cdsTabelaadmrefgts: TIntegerField
      FieldName = 'admrefgts'
    end
    object cdsTabelatipocontrato: TIntegerField
      FieldName = 'tipocontrato'
    end
    object cdsTabelavalidadeexmed: TIntegerField
      FieldName = 'validadeexmed'
    end
    object cdsTabelaop13ferres: TIntegerField
      FieldName = 'op13ferres'
    end
    object cdsTabeladataadmissao: TDateField
      FieldName = 'dataadmissao'
    end
    object cdsTabeladataopcaofgts: TDateField
      FieldName = 'dataopcaofgts'
    end
    object cdsTabeladataexmedico: TDateField
      FieldName = 'dataexmedico'
    end
    object cdsTabeladatatransf: TDateField
      FieldName = 'datatransf'
    end
    object cdsTabeladatarescisao: TDateField
      FieldName = 'datarescisao'
    end
    object cdsTabelanumcontfgts: TWideStringField
      FieldName = 'numcontfgts'
      Size = 10
    end
    object cdsTabelanumbanco: TIntegerField
      FieldName = 'numbanco'
    end
    object cdsTabelanumerocc: TWideStringField
      FieldName = 'numerocc'
      Size = 10
    end
    object cdsTabelatiposalario: TIntegerField
      FieldName = 'tiposalario'
    end
    object cdsTabelacodsind: TIntegerField
      FieldName = 'codsind'
    end
    object cdsTabelatptributsind: TIntegerField
      FieldName = 'tptributsind'
    end
    object cdsTabelaqtdehsmensal: TIntegerField
      FieldName = 'qtdehsmensal'
    end
    object cdsTabelaqtdehssemana: TIntegerField
      FieldName = 'qtdehssemana'
    end
    object cdsTabelatempoexper: TIntegerField
      FieldName = 'tempoexper'
    end
    object cdsTabelatempoprorrog: TIntegerField
      FieldName = 'tempoprorrog'
    end
    object cdsTabelacodlocal: TIntegerField
      FieldName = 'codlocal'
    end
    object cdsTabelacoddepto: TIntegerField
      FieldName = 'coddepto'
    end
    object cdsTabelacodsetor: TIntegerField
      FieldName = 'codsetor'
    end
    object cdsTabelacodsecao: TIntegerField
      FieldName = 'codsecao'
    end
    object cdsTabelacodrisco: TIntegerField
      FieldName = 'codrisco'
    end
    object cdsTabelaemissorrg: TIntegerField
      FieldName = 'emissorrg'
    end
    object cdsTabelaemissorufrg: TWideStringField
      FieldName = 'emissorufrg'
      Size = 2
    end
    object cdsTabeladataexprg: TDateField
      FieldName = 'dataexprg'
    end
    object cdsTabeladataexpctps: TDateField
      FieldName = 'dataexpctps'
    end
    object cdsTabelatipovisto: TWideStringField
      FieldName = 'tipovisto'
      Size = 25
    end
    object cdsTabelanumrne: TWideStringField
      FieldName = 'numrne'
      Size = 15
    end
    object cdsTabelavalidaderne: TDateField
      FieldName = 'validaderne'
    end
    object cdsTabeladataexpctpsex: TDateField
      FieldName = 'dataexpctpsex'
    end
    object cdsTabelavalctpsex: TDateField
      FieldName = 'valctpsex'
    end
    object cdsTabelanumctpsex: TWideStringField
      FieldName = 'numctpsex'
      Size = 13
    end
    object cdsTabeladatacadpis: TDateField
      FieldName = 'datacadpis'
    end
    object cdsTabelamatriculasind: TWideStringField
      FieldName = 'matriculasind'
      Size = 7
    end
    object cdsTabelanomeconsreg: TWideStringField
      FieldName = 'nomeconsreg'
      Size = 40
    end
    object cdsTabelanumconsreg: TWideStringField
      FieldName = 'numconsreg'
      Size = 10
    end
    object cdsTabelasiglaconsreg: TWideStringField
      FieldName = 'siglaconsreg'
      Size = 10
    end
    object cdsTabelaregiaoconsreg: TWideStringField
      FieldName = 'regiaoconsreg'
      Size = 31
    end
    object cdsTabelapartcipa: TBooleanField
      FieldName = 'partcipa'
    end
    object cdsTabelaqtdedepsalfam: TIntegerField
      FieldName = 'qtdedepsalfam'
    end
    object cdsTabelaqtdedepirrf: TIntegerField
      FieldName = 'qtdedepirrf'
    end
    object cdsTabelacodhorario: TIntegerField
      FieldName = 'codhorario'
    end
    object cdsTabelaobservacao: TMemoField
      FieldName = 'observacao'
      BlobType = ftMemo
    end
    object cdsTabelaphx_apelido: TWideStringField
      FieldName = 'phx_apelido'
      Size = 8
    end
    object cdsTabelapk_func: TIntegerField
      FieldName = 'pk_func'
    end
  end
end

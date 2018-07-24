inherited frmHorarios: TfrmHorarios
  Caption = 'Horarios'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    inherited tsDados: TTabSheet
      inherited DBGrid1: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'horarioid'
            Title.Caption = 'C'#243'digo'
            Width = 112
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Title.Caption = 'Descri'#231#227'o'
            Visible = True
          end>
      end
    end
    inherited tsDetalhe: TTabSheet
      object Label1: TLabel
        Left = 3
        Top = 39
        Width = 45
        Height = 13
        Caption = 'descricao'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 3
        Top = 0
        Width = 42
        Height = 13
        Caption = 'horarioid'
        FocusControl = DBEdit2
      end
      object DBEdit1: TDBEdit
        Left = 3
        Top = 55
        Width = 300
        Height = 21
        DataField = 'descricao'
        DataSource = dtsTabela
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 3
        Top = 16
        Width = 134
        Height = 21
        DataField = 'horarioid'
        DataSource = dtsTabela
        TabOrder = 1
      end
    end
  end
  inherited cdsTabela: TClientDataSet
    object cdsTabelahorarioid: TIntegerField
      FieldName = 'horarioid'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsTabelasegent1: TTimeField
      FieldName = 'segent1'
    end
    object cdsTabelasegsai1: TTimeField
      FieldName = 'segsai1'
    end
    object cdsTabelasegent2: TTimeField
      FieldName = 'segent2'
    end
    object cdsTabelasegsai2: TTimeField
      FieldName = 'segsai2'
    end
    object cdsTabelatercent1: TTimeField
      FieldName = 'tercent1'
    end
    object cdsTabelatercsai1: TTimeField
      FieldName = 'tercsai1'
    end
    object cdsTabelatercent2: TTimeField
      FieldName = 'tercent2'
    end
    object cdsTabelatercsai2: TTimeField
      FieldName = 'tercsai2'
    end
    object cdsTabelaquarent1: TTimeField
      FieldName = 'quarent1'
    end
    object cdsTabelaquarsai1: TTimeField
      FieldName = 'quarsai1'
    end
    object cdsTabelaquarent2: TTimeField
      FieldName = 'quarent2'
    end
    object cdsTabelaquarsai2: TTimeField
      FieldName = 'quarsai2'
    end
    object cdsTabelaquinent1: TTimeField
      FieldName = 'quinent1'
    end
    object cdsTabelaquintsai1: TTimeField
      FieldName = 'quintsai1'
    end
    object cdsTabelaquinent2: TTimeField
      FieldName = 'quinent2'
    end
    object cdsTabelaquinsai2: TTimeField
      FieldName = 'quinsai2'
    end
    object cdsTabelasextent1: TTimeField
      FieldName = 'sextent1'
    end
    object cdsTabelasextsai1: TTimeField
      FieldName = 'sextsai1'
    end
    object cdsTabelasextent2: TTimeField
      FieldName = 'sextent2'
    end
    object cdsTabelasextsai2: TTimeField
      FieldName = 'sextsai2'
    end
    object cdsTabelasabent1: TTimeField
      FieldName = 'sabent1'
    end
    object cdsTabelasabsai1: TTimeField
      FieldName = 'sabsai1'
    end
    object cdsTabelasabent2: TTimeField
      FieldName = 'sabent2'
    end
    object cdsTabelasabsai2: TTimeField
      FieldName = 'sabsai2'
    end
    object cdsTabeladoment1: TTimeField
      FieldName = 'doment1'
    end
    object cdsTabeladomsai1: TTimeField
      FieldName = 'domsai1'
    end
    object cdsTabeladoment2: TTimeField
      FieldName = 'doment2'
    end
    object cdsTabeladomsai2: TTimeField
      FieldName = 'domsai2'
    end
    object cdsTabelaescala: TBooleanField
      FieldName = 'escala'
    end
    object cdsTabeladescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
    object cdsTabelapk_horarios: TAutoIncField
      FieldName = 'pk_horarios'
    end
  end
end

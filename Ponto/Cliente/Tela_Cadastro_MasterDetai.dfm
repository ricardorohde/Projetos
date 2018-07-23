inherited frmTelaDeCadastro1: TfrmTelaDeCadastro1
  Caption = 'frmTelaDeCadastro1'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Top = 70
    Height = 359
    inherited tsDetalhe: TTabSheet
      inherited PageControle: TcxPageControl
        Height = 331
        LookAndFeel.SkinName = ''
        ClientRectBottom = 331
      end
    end
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 28
    Width = 508
    Height = 42
    Align = alTop
    TabOrder = 3
    object Label1: TLabel
      Left = 6
      Top = 3
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object edtNomeMaster: TEdit
      Left = 130
      Top = 15
      Width = 309
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edtCodigoMaster: TDBSearchEdit
      Left = 6
      Top = 15
      Width = 121
      Height = 21
      CaseSensitive = True
      LookUpAll = True
      TabOrder = 1
      OnKeyPress = edtCodigoMasterKeyPress
      OnMouseMove = btnNovoMouseMove
      SkipEdit = False
    end
  end
end

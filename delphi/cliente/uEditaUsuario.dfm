object frmEditarUsuario: TfrmEditarUsuario
  Left = 292
  Top = 212
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Editar Usu'#225'rio'
  ClientHeight = 149
  ClientWidth = 274
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 274
    Height = 108
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 39
      Height = 13
      Caption = 'Usu'#225'rio:'
      FocusControl = edtUsuario
    end
    object Label2: TLabel
      Left = 8
      Top = 56
      Width = 19
      Height = 13
      Caption = 'I.P.:'
      FocusControl = edtIP
    end
    object edtUsuario: TDBEdit
      Left = 8
      Top = 32
      Width = 257
      Height = 21
      DataField = 'Usuario'
      DataSource = frmPrincipal.dtsUsuarios
      TabOrder = 0
    end
    object edtIP: TDBEdit
      Left = 8
      Top = 72
      Width = 113
      Height = 21
      DataField = 'IP'
      DataSource = frmPrincipal.dtsUsuarios
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 108
    Width = 274
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 112
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 192
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Fechar'
      TabOrder = 1
      Kind = bkNo
    end
  end
end

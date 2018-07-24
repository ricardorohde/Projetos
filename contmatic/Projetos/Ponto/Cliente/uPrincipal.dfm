object frmPrincipal: TfrmPrincipal
  Left = 284
  Top = 143
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Ponto Eletr'#244'nico'
  ClientHeight = 434
  ClientWidth = 615
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PrintScale = poPrintToFit
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = 0
    Width = 615
    Height = 434
    Align = alClient
    TabOrder = 0
    ControlData = {
      4C000000903F0000DB2C00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object MainMenu1: TMainMenu
    Left = 344
    Top = 48
    object mniArquivos: TMenuItem
      Caption = 'Arquivos'
      object mniCadastro: TMenuItem
        Caption = 'Cadastro'
        object mniEmpresa: TMenuItem
          Caption = 'Empresas'
          OnClick = mniEmpresaClick
        end
        object mniFuncionarios: TMenuItem
          Caption = 'Funcion'#225'rios'
          OnClick = mniFuncionariosClick
        end
        object Horario: TMenuItem
          Caption = 'Hor'#225'rio'
        end
        object Feriado: TMenuItem
          Caption = 'Feriado'
        end
      end
      object mniSair: TMenuItem
        Caption = 'Sair'
        OnClick = mniSairClick
      end
    end
  end
  object cxLocalizer1: TcxLocalizer
    Left = 312
    Top = 48
  end
end

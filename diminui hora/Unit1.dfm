object Form1: TForm1
  Left = 333
  Top = 242
  BorderStyle = bsSingle
  Caption = 'Processar Hora'
  ClientHeight = 208
  ClientWidth = 300
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
  object pgPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 300
    Height = 167
    ActivePage = pgConvert
    Align = alClient
    TabOrder = 0
    object pgDimimui: TTabSheet
      Caption = 'Dimimuir'
      object GroupBox1: TGroupBox
        Left = 136
        Top = 0
        Width = 149
        Height = 136
        Caption = 'Double'
        TabOrder = 0
        object Label4: TLabel
          Left = 6
          Top = 11
          Width = 29
          Height = 13
          Caption = 'Hora1'
        end
        object Label5: TLabel
          Left = 6
          Top = 59
          Width = 29
          Height = 13
          Caption = 'Hora2'
        end
        object btnCalcularDouble: TButton
          Left = 5
          Top = 107
          Width = 75
          Height = 25
          Caption = 'Calcular'
          TabOrder = 0
          OnClick = btnCalcularDoubleClick
        end
        object edtDouble1: TEdit
          Left = 6
          Top = 27
          Width = 119
          Height = 21
          MaxLength = 10
          TabOrder = 1
          OnKeyPress = edtDouble1KeyPress
        end
        object edtDouble2: TEdit
          Left = 6
          Top = 75
          Width = 121
          Height = 21
          MaxLength = 10
          TabOrder = 2
          OnKeyPress = edtDouble1KeyPress
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 132
        Height = 137
        Caption = 'Hora '
        TabOrder = 1
        object Hora1: TLabel
          Left = 6
          Top = 11
          Width = 29
          Height = 13
          Caption = 'Hora1'
        end
        object Label1: TLabel
          Left = 6
          Top = 59
          Width = 29
          Height = 13
          Caption = 'Hora2'
        end
        object edtHora1: TMaskEdit
          Left = 6
          Top = 27
          Width = 114
          Height = 21
          EditMask = '!90:00;1; '
          MaxLength = 5
          TabOrder = 0
          Text = '  :  '
        end
        object edtHora2: TMaskEdit
          Left = 6
          Top = 75
          Width = 116
          Height = 21
          EditMask = '!90:00;1; '
          MaxLength = 5
          TabOrder = 1
          Text = '  :  '
        end
        object btnCalcular: TButton
          Left = 6
          Top = 107
          Width = 75
          Height = 25
          Caption = 'Calcular'
          TabOrder = 2
          OnClick = btnCalcularClick
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Soma'
      ImageIndex = 4
      object Label2: TLabel
        Left = 6
        Top = 11
        Width = 29
        Height = 13
        Caption = 'Hora1'
      end
      object Label3: TLabel
        Left = 6
        Top = 59
        Width = 29
        Height = 13
        Caption = 'Hora2'
      end
      object edtHorasoma1: TMaskEdit
        Left = 6
        Top = 27
        Width = 116
        Height = 21
        EditMask = '!90:00;1; '
        MaxLength = 5
        TabOrder = 0
        Text = '  :  '
      end
      object edtHorasoma2: TMaskEdit
        Left = 6
        Top = 75
        Width = 118
        Height = 21
        EditMask = '!90:00;1; '
        MaxLength = 5
        TabOrder = 1
        Text = '  :  '
      end
      object btnCalcularsoma: TButton
        Left = 6
        Top = 107
        Width = 75
        Height = 25
        Caption = 'Calcular'
        TabOrder = 2
        OnClick = btnCalcularsomaClick
      end
    end
    object pgConvert: TTabSheet
      Caption = 'Converter'
      ImageIndex = 1
      object btnConverter: TButton
        Left = 6
        Top = 107
        Width = 75
        Height = 25
        Caption = 'Converter'
        TabOrder = 0
        OnClick = btnConverterClick
      end
      object edtHora: TMaskEdit
        Left = 6
        Top = 27
        Width = 117
        Height = 21
        EditMask = '!90:00;1; '
        MaxLength = 5
        TabOrder = 1
        Text = '  :  '
      end
      object rbHoraToDouble: TRadioButton
        Left = 6
        Top = 8
        Width = 113
        Height = 17
        Caption = 'Hora para Double'
        Checked = True
        TabOrder = 2
        TabStop = True
        OnClick = rbHoraToDoubleClick
      end
      object rbDoubleToHora: TRadioButton
        Left = 8
        Top = 56
        Width = 113
        Height = 17
        Caption = 'Double para Hora'
        TabOrder = 3
        OnClick = rbDoubleToHoraClick
      end
      object edtdouble: TEdit
        Left = 6
        Top = 75
        Width = 118
        Height = 21
        TabOrder = 4
        Visible = False
        OnKeyPress = edtDouble1KeyPress
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Minuto/Hora'
      ImageIndex = 2
      object btnConverterMinHora: TButton
        Left = 6
        Top = 107
        Width = 75
        Height = 25
        Caption = 'Converter'
        TabOrder = 0
        OnClick = btnConverterMinHoraClick
      end
      object edtMinutos: TEdit
        Left = 6
        Top = 75
        Width = 121
        Height = 21
        TabOrder = 1
        OnKeyPress = edtDouble1KeyPress
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Hora/Minuto'
      ImageIndex = 3
      object btnHoraMin: TButton
        Left = 6
        Top = 107
        Width = 75
        Height = 25
        Caption = 'Converter'
        TabOrder = 0
        OnClick = btnHoraMinClick
      end
      object edtHoras: TMaskEdit
        Left = 6
        Top = 75
        Width = 117
        Height = 21
        EditMask = '!90:00;1; '
        MaxLength = 5
        TabOrder = 1
        Text = '  :  '
      end
    end
  end
  object pnlResultado: TPanel
    Left = 0
    Top = 167
    Width = 300
    Height = 41
    Align = alBottom
    Caption = 'Resultado:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
end

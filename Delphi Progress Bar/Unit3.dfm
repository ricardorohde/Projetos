object Form3: TForm3
  Left = 425
  Top = 308
  Width = 362
  Height = 254
  Caption = 'Edi'#231#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 16
    Width = 90
    Height = 13
    Caption = 'Pesquisar arquivo.:'
  end
  object lbl2: TLabel
    Left = 8
    Top = 40
    Width = 90
    Height = 13
    Caption = 'Pesquisar Pessoa.:'
  end
  object lbl3: TLabel
    Left = 8
    Top = 64
    Width = 91
    Height = 13
    Caption = 'Nome....................:'
  end
  object lbl4: TLabel
    Left = 8
    Top = 88
    Width = 167
    Height = 13
    Caption = 'Nota 1............................................:'
  end
  object lbl5: TLabel
    Left = 8
    Top = 112
    Width = 167
    Height = 13
    Caption = 'Nota 2............................................:'
  end
  object lbl6: TLabel
    Left = 8
    Top = 136
    Width = 167
    Height = 13
    Caption = 'Nota 3............................................:'
  end
  object edtNome: TEdit
    Left = 103
    Top = 60
    Width = 145
    Height = 21
    TabOrder = 0
  end
  object edtNota1: TEdit
    Left = 182
    Top = 84
    Width = 65
    Height = 21
    TabOrder = 1
  end
  object edtNota2: TEdit
    Left = 183
    Top = 110
    Width = 65
    Height = 21
    TabOrder = 2
  end
  object edtNota3: TEdit
    Left = 183
    Top = 136
    Width = 65
    Height = 21
    TabOrder = 3
  end
  object btnSalvar: TBitBtn
    Left = 182
    Top = 178
    Width = 75
    Height = 25
    Caption = '&Salvar'
    TabOrder = 4
    OnClick = btnSalvarClick
    Kind = bkYes
  end
  object btnCancelar: TBitBtn
    Left = 263
    Top = 178
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 5
    OnClick = btnCancelarClick
    Kind = bkCancel
  end
  object btnCarregar: TBitBtn
    Left = 304
    Top = 35
    Width = 33
    Height = 28
    TabOrder = 6
    OnClick = btnCarregarClick
    Glyph.Data = {
      36100000424D3610000000000000360000002800000020000000200000000100
      2000000000000010000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000999999029999
      9904999999049999990299999902000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000999999029999990E1D80
      1D60137F13741C721C3C3B7A3B0A508050020000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000999999029999990A9497942E098C
      09E1009900FF099300FF248500F5048900C700840091007A005C0069002A0065
      0006000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000999999029999990499999920819181640190
      01FD069700FF909023FFD88310FFC67F01FF978600FF628A00FF2D8B00FF098B
      00ED008900BD0083008700770052006A00200066000600000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009898980299999914999999485D885DA30097
      00FF279205FFFAC48CFFFECA96FFF7BD81FFEFAB5FFFEC9D3BFFE88D18FFD786
      02FFAE8B00FF748E02FF398F03FF0D9204FD049007E3048C09B30486097E0274
      0448006A01160066000200000000000000000000000000000000000000000000
      00000000000000000000999999029898980A9999993299999976418A41CB0099
      00FF5E961CFFFECB98FFFFCC99FFFFCC99FFFFCC99FFFFCC99FFFFCC99FFFAC3
      8BFFF3B169FFF0A346FFEF9E35FFE69B32FFBEA43BFF85A131FF4D9C1FFF1F9F
      17FF0C9D19FF0C9819DB0478093C000000000000000000000000000000000000
      00000000000000000000999999049999991E9999995E9999999B278C27E50099
      00FF99A240FFFFCC99FFFFCC99FFFFCC99FFFFCC99FFFFCC99FFFFCC99FFFFCC
      99FFFECA96FFF2B977FFE6A756FFE59C4BFFF8BC65FFFED08AFFFED9A3FFF3D4
      A5FFCBC084FF2E9E23FD016C0328000000000000000000000000000000000000
      00000000000099999902999999129999994499999987979897AD0F8D0FF50099
      00FFD4AE63FFFFCC99FFFFCC99FFFFCC99FFFFCC99FFFFCC99FFFFCC99FFFFCC
      99FFFECA96FFF0B570FFE09D43FFEEAD69FFF3B86DFFFED394FFFFE0B1FFFFEB
      CDFFE1D2A8FF1A9821D100650002000000000000000000000000000000000000
      000099999902999999089999992E99999972999999A3849284B9039305FF1C95
      05FFF6C086FFFFCC99FFFFCC99FFFFCC99FFFFCC99FFFFCC99FFFFCC99FFFFCC
      99FFFDCA96FFEFB56EFFDE983EFFF6CA9CFFF6C895FFFBD397FFFEE4BCFFFFEF
      D8FFA0BD73FF0F901E7E00000000000000000000000000000000000000000000
      0000999999049999991E9999995A99999997999999AF618C62C9069D0CFF5299
      1DFFFECB98FFFFCC99FFFFCC99FFFFCC99FFFFCC99FFFFCC99FFFFCC99FFFFCC
      99FFFDC994FFEDB168FFDE9944FFFDEDDDFFFEECDAFFF6CD97FFFEE8C6FFFEF1
      DFFF5AA53EFF05740B2E00000000000000000000000000000000000000009898
      9802999999109999994299999987989898AB999999B3428E46D90BA416FF8CA6
      42FFFFD0A1FFFFCF9FFFFFCE9EFFFFCD9CFFFFCD9BFFFFCC9AFFFFCC99FFFFCC
      99FFFDC993FFEEB26BFFE5AE6CFFFFFEFEFFFFFDFCFFF7E0C2FFFDE9CCFFEBD8
      B6FF26A233D50066000400000000000000000000000000000000000000009999
      99049999991C9999995C99999999999999AF999999B32A9432E910A81FFFC5B4
      6AFFFFD5ABFFFED6A9FFFED4A6FFFED2A5FFFED2A5FFFFD1A3FFFFD0A2FFFFCF
      A0FFFECE9DFFF9C58EFFEEB474FFEEC496FFF3DBC3FFFBF3EBFFF9E4C8FFB0C5
      85FF16972C870000000000000000000000000000000000000000000000009999
      990299999914989898449999997699999995979897A7179B25F920A927FFF1C6
      96FFFEDBB5FFFDDDADFFFAD7A2FFF7D199FFF5CC91FFF4C88CFFF4C68AFFF4C5
      89FFF5C58BFFF7C78FFFF9C993FFF9C894FFF7C38AFFEFB577FFF1CEA8FF6CB1
      57FF07760F320000000000000000000000000000000000000000000000009999
      990299999906999999149999993099999950718C718516A92BFF4DA531FFFDDE
      BEFFFEE0BFFFFEDFB7FFFCDBAFFFF9D5A4FFF6CF98FFF3C88BFFEFC07EFFECB9
      72FFE9B367FFE7AD5EFFE4A754FFE2A34DFFEDB773FFF9C898FFEACCA6FF33A6
      40DF006600040000000000000000000000000000000000000000000000000000
      0000999999029999990299999908999999142B8733701CB438FF84B156FFFFE6
      CDFFFEE4C8FFFEE3C7FFFFE3C8FFFFE2C6FFFFE2C4FFFFE1C3FFFEDFBEFFFCDB
      B7FFFAD6ADFFF7CFA0FFF3C791FFEFBE80FFF9D0A3FFF3C596FFC0CB97FF24A2
      408D000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099999902999999021495268D21BA42FFBAC080FFFFEB
      D7FFFDE0B4FFFAD8A4FFF8D39CFFF6CF98FFF5CD97FFF4CC97FFF4CC98FFF5CD
      9BFFF6CFA0FFF7D2A7FFFAD7B0FFFCDBB8FFFFE0C2FFF2CEA9FF88BB6FFF0D79
      153C000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000065000219A333BF2CBB48FFE6D3AEFFFFEF
      DFFFFEE5C2FFFBDFB6FFF9D8A9FFF6D19BFFF3C98DFFF0C281FFEDBB74FFEAB4
      69FFE7AE5FFFE4A856FFE1A24CFFE9B46EFFFBDDBFFFECCCA8FF56AD56E30065
      0004000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000066000620AD40EF4DB64DFFFBECDEFFFEF4
      EAFFFEF4E8FFFEF3E8FFFEF3E7FFFFF2E6FFFEF1E3FFFEEEDDFFFDEAD5FFFBE5
      CCFFF9DFBFFFF6D8B2FFF3CFA2FFF8DBB9FFF3CFABFFD2CFA5FF3FA953950000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000046F082C2ABF54FF7EBC68FFFFFBF8FFFEE9
      CBFFFBD9A6FFF9D6A3FFF7D5A3FFF6D4A4FFF5D5A7FFF5D6ADFFF6D9B3FFF7DD
      BCFFF9E2C6FFFBE7D1FFFDECDBFFFEF1E3FFF2D4B5FFA6C385FF208529400000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000138D276033CB65FFB0CB92FFFFFEFEFFFEEC
      D0FFFCE2BBFFF9DBACFFF6D29DFFF3CB8FFFF0C382FFEDBB75FFEAB56BFFE7AF
      61FFE5A957FFE2A44FFFE4AA5CFFFDF0E4FFEECDABFF76B269E70066000A0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000026A5439542CE70FFDFD7B7FFFFFEFEFFFFFE
      FEFFFFFFFFFFFFFFFFFFFEFEFEFFFEFCF9FFFDF9F3FFFCF5EBFFFAEFDEFFF8E7
      CFFFF5DFC0FFF1D4ADFFF4DCBCFFF4DDC6FFDFD1ADFF5DB1699B000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000037B357CB63C46CFFF8F0E6FFFEF6EAFFFCE1
      B7FFFADFB6FFF9DEB6FFF7DDB6FFF7DDB8FFF6DFBDFFF6E0C2FFF7E3C7FFF7E6
      CFFFF8EBD8FFFAEFE2FFFDFAF7FFF2DAC2FFC3CC9DFF2A873048000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000066000E4CC16DF38FC47BFFFEFDFCFFFEEFD7FFFCDE
      AFFFF9D7A4FFF6D098FFF3C98CFFF0C381FFEEBD77FFEBB76DFFE8B164FFE5AB
      5AFFE3A550FFE0A048FFF9ECDCFFF0D3B5FF94B576ED066A060A000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000177E1E3666D388FFBACD99FFFEFEFEFFFDFDFCFFFDFD
      FBFFFEFCF9FFFEFBF7FFFDF9F3FFFDF7EEFFFCF3E7FFFAEFDFFFF9EAD5FFF7E4
      CAFFF5DEC0FFF3DBBAFFF7E7D6FFE7CCA7FF7ABA81A300000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000389C466C7EDE9DFFD9D3B1FFEAEAEAFFE2E2E2FFCCDA
      E1FFDBE8EEFFEDF4F8FFFCFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFEFCFB0FFDACDA6FF3E90415000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000058B46AA191DCA2FFD0BF99FFBDB9ACFFB4B1A7FF88A0
      A2FF069ECFFF059ED0FF0796C7FF1999C7FF2A9FC9FF3DA6CDFF50AED1FF8FBE
      CAFFE9DBC0FFEBDCC1FFE0D9B9FFAED5B2EF0066000C00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006DC07ED399E2B0FF9AD9AEFF96C0A2FF91B19BFF8CAF
      98FF74D2E3FF76EEFEFF57E4FCFF3BD8F8FF24CAF1FF13BDE9FF07B1E2FF1C97
      B0C976B37B7869AA6D68579D595A338635320000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002382293827842C3E12701330327B4532177797D12779
      9EFFBCD7E4F7C4DEE9F3BBDDE8EFABDBE7E799DAE7E77BD5E5DB60CFE5D92096
      BE4C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099999902186F9A040E6A
      9904006699040066990400669904006699020065980200669902006699020066
      9902000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
  end
  object edtPesquisaNome: TEdit
    Left = 104
    Top = 36
    Width = 193
    Height = 21
    TabOrder = 7
  end
  object edtPesquisarArquivo: TEdit
    Left = 104
    Top = 8
    Width = 193
    Height = 21
    TabOrder = 8
  end
  object btnPesquisar: TBitBtn
    Left = 302
    Top = 7
    Width = 41
    Height = 25
    TabOrder = 9
    OnClick = btnPesquisarClick
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001111110E00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000038383838323232C12E2E2EF91111110A000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000030303072333333FD535353FF4141419900000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000029292972363636FF757575FF686868E31818181200000000000000000000
      0000000000000000000000000000000000000000000000000000000000002020
      2032333333FB898989FF848484F33B3B3B340000000000000000000000000000
      000000000000111111023838383C3D3D3D7C4343438544444462343434122525
      25B58F8F8FFF8C8C8CE747474738000000000000000000000000000000000000
      00002B2B2B124242429B89898995E4E4E47AF2F2F27CBCBCBC896C6C6CB55D5D
      5DF77575759B2121211600000000000000000000000000000000000000001818
      180436363697A7A7A73CF9F9F93AFEFEFE48FFFFFF4CFEFEFE42EEEEEE3A6A6A
      6A8F404040480000000000000000000000000000000000000000000000003030
      305831313140EFEFEF12FFFFFF20FFFFFF2AFFFFFF2EFFFFFF26FEFEFE1AC1C1
      C11A444444A11111110200000000000000000000000000000000000000003939
      397E0000000AFEFEFE04FFFFFF0AFFFFFF18FFFFFF1CFFFFFF10FFFFFF065C5C
      5C02494949783131312600000000000000000000000000000000000000003F3F
      3F7E5A5A5A0CFFFFFF40FFFFFF5AFFFFFF5EFFFFFF60FFFFFF5EFFFFFF4EFCFC
      FC203A3A3A5A3939393C00000000000000000000000000000000000000004343
      437EAFAFAF24FEFEFE6EFFFFFF6EFFFFFF6EFFFFFF6EFFFFFF6EFFFFFF6EFBFB
      FB52404040762A2A2A2000000000000000000000000000000000000000004343
      434C5A5A5A54FDFDFD7CFFFFFF7CFFFFFF7CFFFFFF7CFFFFFF7CFEFEFE7CE4E4
      E454424242950000000000000000000000000000000000000000000000001111
      11024646468BB8B8B866FCFCFC8BFEFEFE89FFFFFF89FEFEFE89F4F4F47E5555
      558D454545360000000000000000000000000000000000000000000000000000
      0000202020084646468176767695B9B9B97ECDCDCD7A9C9C9C8B5050509D4646
      463E000000000000000000000000000000000000000000000000000000000000
      000000000000000000002E2E2E204E4E4E604B4B4B6C45454544191919060000
      0000000000000000000000000000000000000000000000000000}
  end
  object dlgOpen: TOpenDialog
    Top = 184
  end
end
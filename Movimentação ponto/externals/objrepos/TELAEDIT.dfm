object frmEdita: TfrmEdita
  Left = 408
  Top = 233
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = '-'
  ClientHeight = 261
  ClientWidth = 362
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 228
    Width = 362
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnGravar: TBitBtn
      Left = 203
      Top = 4
      Width = 75
      Height = 25
      Caption = '&Gravar'
      TabOrder = 0
      OnClick = btnGravarClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF004B00004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B000F9E1C0F9D1E00
        4B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF004B001CB13511A4220C9C1911A021004B00FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF004B002EC65224BC43139224004B000D
        931A0E9D1D004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00
        35CA5E39D4651CA134004B00FF00FF004B000A86150F991C004B00FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF004B0029B548004B00FF00FFFF00FFFF
        00FFFF00FF004B000C9518004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00098611004B
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF004B00004B00FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF004B00004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object btnCancelar: TBitBtn
      Left = 284
      Top = 4
      Width = 75
      Height = 25
      Cancel = True
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B000000010000000100000031DE000031
        E7000031EF000031F700FF00FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
        0404040404040404000004000004040404040404040404000004040000000404
        0404040404040000040404000000000404040404040000040404040402000000
        0404040400000404040404040404000000040000000404040404040404040400
        0101010004040404040404040404040401010204040404040404040404040400
        0201020304040404040404040404030201040403030404040404040404050203
        0404040405030404040404040303050404040404040303040404040303030404
        0404040404040403040403030304040404040404040404040404030304040404
        0404040404040404040404040404040404040404040404040404}
    end
    object btnAjuda: TBitBtn
      Left = 123
      Top = 4
      Width = 75
      Height = 25
      Caption = '&Ajuda'
      TabOrder = 2
      Visible = False
      OnClick = btnAjudaClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFDEC0B2DABFB2D5BCB1D0B7ACD1B4A6DDBAA9FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE1BFB0E6D7D0E3E5E6DCE0E6CE
        C7C7C4BDBFBCBCC0B7AFADB8A49DDDBAA9FF00FFFF00FFFF00FFFF00FFFF00FF
        E3C1B2F0EDE9F0F8FCDEBFB1CB7E59C9734AC77249C27653C09C8EB1AFB1B4A4
        A0D1B2A4FF00FFFF00FFFF00FFE1BDADF6F0EFFAFFFFD38B69BC4616BF4A1AF3
        D8C9EEC7B5BD4616BF4918C17E5EB7B4B7B8AAA6DDBAA9FF00FFFF00FFF0E1D9
        FFFFFFDA9A7ABA4111BD4B1BBF4E1FE2AA8EDE9F81BD4C1CBD4C1CBF4515C583
        65BFBDC1CCB5ACFF00FFE3C1B2FEFCFCF4DED1C25524BF4C1DBD4A1CC25728DE
        9F80D78B67BD4A1ABF4E1EBF4C1CBF4F1FCAB1A6C9C4C4DDBAA9EACEC2FFFFFF
        E2A787C45723C55A29BF4F1EC65D2FFEF8F4F8EBE5C15425BB4616BF4F1FBD45
        16CB896BD5D8DDDCBCAFEED7CEFFFFFFDC976DCA662DCA6631C75E2BC15423E7
        B79FFFFFFFEBC9B7C2592BBC4919BC4717CA754DE1E6EDDDC2B6EED7CCFFFFFF
        E1A375D07439D0723BCB6933C9632EC65C29E6B69CFFFFFFF4E0D5C45A2CBA41
        12CC7850EDF3F8E1C5BAE9CCC0FFFFFFEBC09CD57E41D7834CD88754CF723BCB
        6731C55A26E6B599FFFFFFDC9A79B73B0CD79676F3FAFFE2C4B6E9CCC0FCFAFA
        FAEEE0DC8E4FF2D1B7FFFFFEE1A377CE6B30C75E25DD9972FFFFFFE2A98AC04D
        1CEED9CEF3F0EFE2C4B6FF00FFF0E0D7FFFFFFEEC59FE9B282FFFFFFFCF7F3EA
        BB9CE9BA98FCF6F2FEFAF7D37B4ADEA07FFFFFFFEAD4CAFF00FFFF00FFE6C7BA
        F8EEEAFFFFFFEDC298EBC092F8E9D9FCF7F2FCF6EFF6E0CFE19E72E3AB84FFFF
        FFF3E7E2EAD4CAFF00FFFF00FFFF00FFE6C7BAF7EDE9FFFFFFF7E3CFEFC7A0ED
        C299EABB93EAB892F4D9C5FFFFFFF4E9E3E2C1B1FF00FFFF00FFFF00FFFF00FF
        FF00FFE6C7BAF3E6E0F8F3F2FEFCFBFFFEFCFEFCFBFCFBFBFAF3F2F2E0D7F2E0
        D7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE5C6B8E5C6B8E9
        CCC1E9CBBFE6C7BAE6C7BAFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 362
    Height = 228
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 2
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 2
      Top = 2
      Width = 358
      Height = 224
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Dados'
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 350
          Height = 196
          Align = alClient
          BevelOuter = bvNone
          BorderWidth = 2
          TabOrder = 0
          object gpxDados: TGroupBox
            Left = 2
            Top = 2
            Width = 346
            Height = 192
            Align = alClient
            TabOrder = 0
          end
        end
      end
    end
  end
end

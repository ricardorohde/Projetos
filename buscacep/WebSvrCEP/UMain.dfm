object Form1: TForm1
  Left = 372
  Top = 376
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta de CEP'
  ClientHeight = 273
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 40
    Width = 97
    Height = 14
    Caption = 'Buscar pelo CEP'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 230
    Height = 14
    Caption = 'http://www.republicavirtual.com.br/'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object ECEP: TEdit
    Left = 8
    Top = 57
    Width = 129
    Height = 24
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvSpace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnKeyPress = ECEPKeyPress
  end
  object RichEdit1: TRichEdit
    Left = 8
    Top = 88
    Width = 369
    Height = 113
    Enabled = False
    ReadOnly = True
    TabOrder = 1
  end
  object edtLogradouro: TEdit
    Left = 8
    Top = 201
    Width = 369
    Height = 21
    TabOrder = 2
  end
  object edtBairro: TEdit
    Left = 8
    Top = 223
    Width = 369
    Height = 21
    TabOrder = 3
  end
  object edtCidade: TEdit
    Left = 8
    Top = 245
    Width = 369
    Height = 21
    TabOrder = 4
  end
  object Button1: TButton
    Left = 142
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 5
    OnClick = Button1Click
  end
  object IdHTTP: TIdHTTP
    MaxLineAction = maException
    ReadTimeout = 0
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 136
    Top = 128
  end
  object XMLBuscaCEP: TXMLDocument
    Left = 48
    Top = 104
    DOMVendorDesc = 'MSXML'
  end
end

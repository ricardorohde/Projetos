object FrmEmployee: TFrmEmployee
  Left = 0
  Top = 0
  Caption = 'Pesquisar Employee'
  ClientHeight = 234
  ClientWidth = 547
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 11
    Width = 51
    Height = 13
    Caption = 'First Name'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 48
    Width = 547
    Height = 186
    Align = alBottom
    DataSource = dsEmployee
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = EditEmployee
  end
  object EdtName: TEdit
    Left = 88
    Top = 8
    Width = 217
    Height = 21
    TabOrder = 1
  end
  object BtPesquisar: TButton
    Left = 320
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 2
    OnClick = BtPesquisarClick
  end
  object dsEmployee: TDataSource
    DataSet = DMClient.cdsAUX
    Left = 216
    Top = 56
  end
end

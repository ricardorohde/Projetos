object FrmEditEmployee: TFrmEditEmployee
  Left = 0
  Top = 0
  Caption = 'Employee'
  ClientHeight = 327
  ClientWidth = 562
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
    Left = 24
    Top = 16
    Width = 41
    Height = 13
    Caption = 'EMP_NO'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 24
    Top = 56
    Width = 63
    Height = 13
    Caption = 'FIRST_NAME'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 240
    Top = 56
    Width = 58
    Height = 13
    Caption = 'LAST_NAME'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 29
    Top = 99
    Width = 58
    Height = 13
    Caption = 'PHONE_EXT'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 102
    Top = 99
    Width = 56
    Height = 13
    Caption = 'HIRE_DATE'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 24
    Top = 145
    Width = 46
    Height = 13
    Caption = 'DEPT_NO'
    FocusControl = DBEdit6
  end
  object Label7: TLabel
    Left = 76
    Top = 145
    Width = 53
    Height = 13
    Caption = 'JOB_CODE'
    FocusControl = DBEdit7
  end
  object Label8: TLabel
    Left = 164
    Top = 145
    Width = 59
    Height = 13
    Caption = 'JOB_GRADE'
    FocusControl = DBEdit8
  end
  object Label9: TLabel
    Left = 316
    Top = 145
    Width = 73
    Height = 13
    Caption = 'JOB_COUNTRY'
    FocusControl = DBEdit9
  end
  object Label10: TLabel
    Left = 24
    Top = 188
    Width = 38
    Height = 13
    Caption = 'SALARY'
    FocusControl = DBEdit10
  end
  object Label11: TLabel
    Left = 24
    Top = 228
    Width = 57
    Height = 13
    Caption = 'FULL_NAME'
    FocusControl = DBEdit11
  end
  object DBEdit1: TDBEdit
    Left = 24
    Top = 32
    Width = 134
    Height = 21
    DataField = 'EMP_NO'
    DataSource = dsEMPLOYEE
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 24
    Top = 72
    Width = 199
    Height = 21
    DataField = 'FIRST_NAME'
    DataSource = dsEMPLOYEE
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 240
    Top = 72
    Width = 264
    Height = 21
    DataField = 'LAST_NAME'
    DataSource = dsEMPLOYEE
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 24
    Top = 118
    Width = 56
    Height = 21
    DataField = 'PHONE_EXT'
    DataSource = dsEMPLOYEE
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 102
    Top = 115
    Width = 199
    Height = 21
    DataField = 'HIRE_DATE'
    DataSource = dsEMPLOYEE
    TabOrder = 4
  end
  object DBEdit6: TDBEdit
    Left = 24
    Top = 161
    Width = 43
    Height = 21
    DataField = 'DEPT_NO'
    DataSource = dsEMPLOYEE
    TabOrder = 5
  end
  object DBEdit7: TDBEdit
    Left = 76
    Top = 161
    Width = 69
    Height = 21
    DataField = 'JOB_CODE'
    DataSource = dsEMPLOYEE
    TabOrder = 6
  end
  object DBEdit8: TDBEdit
    Left = 164
    Top = 161
    Width = 134
    Height = 21
    DataField = 'JOB_GRADE'
    DataSource = dsEMPLOYEE
    TabOrder = 7
  end
  object DBEdit9: TDBEdit
    Left = 316
    Top = 164
    Width = 199
    Height = 21
    DataField = 'JOB_COUNTRY'
    DataSource = dsEMPLOYEE
    TabOrder = 8
  end
  object DBEdit10: TDBEdit
    Left = 24
    Top = 204
    Width = 251
    Height = 21
    DataField = 'SALARY'
    DataSource = dsEMPLOYEE
    TabOrder = 9
  end
  object DBEdit11: TDBEdit
    Left = 24
    Top = 244
    Width = 485
    Height = 21
    DataField = 'FULL_NAME'
    DataSource = dsEMPLOYEE
    TabOrder = 10
  end
  object BtGravar: TButton
    Left = 24
    Top = 271
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 11
    OnClick = BtGravarClick
  end
  object BtBusiness: TButton
    Left = 296
    Top = 271
    Width = 75
    Height = 25
    Caption = 'Business'
    TabOrder = 12
    OnClick = BtBusinessClick
  end
  object EdMediaSalario: TEdit
    Left = 394
    Top = 273
    Width = 121
    Height = 21
    TabOrder = 13
  end
  object dsEMPLOYEE: TDataSource
    DataSet = DMClient.cdsEMPLOYEE
    Left = 368
    Top = 89
  end
end

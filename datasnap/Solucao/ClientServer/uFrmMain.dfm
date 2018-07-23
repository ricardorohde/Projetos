object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Cadastro Client / Server - Guinther Pauli'
  ClientHeight = 246
  ClientWidth = 549
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = Menu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 24
    Width = 517
    Height = 193
    Lines.Strings = (
      'Desenvolvido por:'
      'Guinther Pauli'
      'Emails: guintherpauli@gmail.com; guinther@gpauli.com'
      'GPauli Cursos e Treinamentos'
      
        'Delphi Certified Professional - 3,5,6,7,2005,2006,Delphi Web,Kyl' +
        'ix,XE'
      
        'Microsoft Certified Professional - MCP,MCAD,MCSD.NET,MCTS,MCPD (' +
        'C#,ASP.NET,Arquitetura)'
      'Colaborador Editorial Revistas .net Magazine e ClubeDelphi'
      'MVP (Most Valuable Professional) - Embarcadero Technologies - US'
      'http://www.gpauli.com'
      'http://www.facebook.com/guintherpauli'
      'http://www.twitter.com/guintherpauli'
      'http://br.linkedin.com/in/guintherpauli')
    TabOrder = 0
  end
  object Menu: TMainMenu
    Left = 64
    Top = 40
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Employee1: TMenuItem
        Caption = 'Employee'
        OnClick = Employee1Click
      end
    end
  end
end

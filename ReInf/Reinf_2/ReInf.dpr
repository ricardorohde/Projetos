program ReInf;

uses
  Forms,
  SysUtils,
  IniFiles,
  uPrin in 'uPrin.pas' {frmPrincipal},
  Module in 'C:\AdmBens\ERP_Desktop\Fontes2009\Formulario\Module.pas' {DMPrincipal: TDataModule},
  Utils in 'C:\AdmBens\ERP_Desktop\Fontes2009\Interface_Calculo\Utils.pas',
  CustomUtil in 'C:\AdmBens\ERP_Desktop\Fontes2009\Interface_Calculo\CustomUtil.pas',
  Gr_Custom in 'C:\AdmBens\ERP_Desktop\Fontes2009\Formulario\Gr_Custom.pas' {FrmCustom},
  Int_Dados in 'C:\AdmBens\ERP_Desktop\Fontes2009\Interface_Calculo\Int_Dados.pas' {FrmDados},
  BaseLibrary in 'C:\AdmBens\ERP_Desktop\Fontes2009\BaseLibrary.pas';

{$R *.res}

var
  ConfigurarBanco: Boolean;
//  ckey:Tkey=($0C,$FD,$0B,$14,$A8,$A0,$A3,$50,$2D,$0E,$2B,$4B,$62,$39,$86,$D1);
    usu, sen, cam, ser : string;
begin
  Application.Initialize;

  CustomUtil.Definir_Modo( ParamStr(1) );
  CustomUtil.Definir_Versao_Modulo;

  Application.Title := CustomUtil.CustomTitle( 'ReInf' );

  if UpperCase(ParamStr(1)) = 'CONFIGURAR'  then
  with TFrmDados.Create(Application) do
    Try
      ShowModal;
    Finally
      free;
    end;
  with TIniFile.Create(changefileext(Application.ExeName, '.INI')) do
  try
    if ReadString('Dados', 'Caminho', '') = '' then
    begin
        with TIniFile.Create(ExtractFilePath(Application.ExeName)+'basesistemas.ini') do
        try
          if ReadString('Dados', 'Caminho', '') = '' then
            ConfigurarBanco := True
          else
            ConfigurarBanco := false;
        finally
           free;
        end;
    end
    else
      ConfigurarBanco := false;
  finally
    free;
  end;

  if ConfigurarBanco then
  with TIniFile.Create(ExtractFilePath(Application.Exename) + 'sqs2000condo.ini') do
  try
    if ReadString('Dados', 'Caminho', '') = ''  then
      ConfigurarBanco := True
    else
    begin
      ConfigurarBanco := false;
      Cam:=ReadString('Dados', 'Caminho'        , '');
      Ser:=ReadString('Dados', 'Servidor'       , '');
      usu:=ReadString('Dados', 'User_name'      , '');
      sen:=ReadString('Dados', 'password'       , '');
    end
  finally
    free;
  end;


  if ConfigurarBanco then
  with TIniFile.Create(ExtractFilePath(Application.Exename) + 'sqs2000Loca.ini') do
  try
    if ReadString('Dados', 'Caminho', '') = '' then
      ConfigurarBanco := True
    else
    begin
      ConfigurarBanco := false;
      Cam:=ReadString('Dados', 'Caminho'        , '');
      Ser:=ReadString('Dados', 'Servidor'       , '');
      usu:=ReadString('Dados', 'User_name'      , '');
      sen:=ReadString('Dados', 'password'       , '');
    end
  finally
    free;
  end;

  if cam <> '' then
  with TIniFile.Create(changefileext(Application.ExeName, '.INI')) do
  begin
    WriteString('Dados', 'Servidor', ser);
    WriteString('Dados', 'Caminho', cam);
    WriteString('Dados', 'User_name', usu);
    WriteString('Dados', 'password', sen);
    free;
  end;

  if ConfigurarBanco then
    with TFrmDados.Create(Application) do
    Try
      ShowModal;
    Finally
      free;
    end;

  Application.ShowMainForm := False;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDMPrincipal, DMPrincipal);
  Application.CreateForm(TFrmCustom, FrmCustom);
  Application.Run;
end.

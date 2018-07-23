unit Project1TestCases;

interface

uses
  SysUtils,
  TestFrameWork;

type
 TTestCaseFirst = class(TTestCase)
 protected
   procedure SetUp; override;
   procedure TearDown; override;

 published
   procedure TestFirst;
 end;

 TTesteCaseEstados =  class(TTestCase)

 protected
   procedure SetUp; override;
   procedure TearDown; override;

 published
   procedure VerificarSeEstadoDoAcreEstaCorreto();
   procedure VerificarSeEstadoDoALAGOASEstaCorreto();
   procedure VerificarSeEstadoDoAMAPAEstaCorreto();
   procedure VerificarSeEstadoDoAMAZONASEstaCorreto();
   procedure VerificarSeEstadoDoBAHIAEstaCorreto();
   procedure VerificarSeEstadoDoCEARAEstaCorreto();
   procedure VerificarSeEstadoDoDISTRITO_FEDERALEstaCorreto();
   procedure VerificarSeEstadoDoESPIRITO_SANTOEstaCorreto();
   procedure VerificarSeEstadoDoRORAIMAEstaCorreto();
   procedure VerificarSeEstadoDoGOIASEstaCorreto();
   procedure VerificarSeEstadoDoMARANHAOEstaCorreto();
   procedure VerificarSeEstadoDoMATOGROSSOEstaCorreto();
   procedure VerificarSeEstadoDoMATOGROSSO_DO_SULEstaCorreto();
   procedure VerificarSeEstadoDoMINAS_GERAISEstaCorreto();
   procedure VerificarSeEstadoDoPARAEstaCorreto();
   procedure VerificarSeEstadoDoPARAIBAEstaCorreto();
   procedure VerificarSeEstadoDoPARANAEstaCorreto();
   procedure VerificarSeEstadoDoPERNAMBUCOEstaCorreto();
   procedure VerificarSeEstadoDoPIAUIEstaCorreto();
   procedure VerificarSeEstadoDoRIO_DE_JANEIROEstaCorreto();
   procedure VerificarSeEstadoDoRIO_GRANDE_DO_NORTEEstaCorreto();
   procedure VerificarSeEstadoDoRIO_GRANDE_DO_SULEstaCorreto();
   procedure VerificarSeEstadoDoRONDONIAEstaCorreto();
   procedure VerificarSeEstadoDoTOCANTINSEstaCorreto();
   procedure VerificarSeEstadoDoSANTA_CATARINAEstaCorreto();
   procedure VerificarSeEstadoDoSAO_PAULOEstaCorreto();
   procedure VerificarSeEstadoDoSERGIPEEstaCorreto();

 end;

implementation

uses
  uDM;

procedure TTestCaseFirst.SetUp;
begin
  inherited;
end;

procedure TTestCaseFirst.TearDown;
begin
  inherited;
end;

procedure TTestCaseFirst.TestFirst;
begin
  Check(1 + 1 = 2, 'Catastrophic arithmetic failure!');
//  CheckEquals('123', dmPrincipal.RemoverCaracteres('ABC123!', 'Z') , 'Teste');
end;

procedure TTesteCaseEstados.VerificarSeEstadoDoAcreEstaCorreto;
begin
  CheckEquals('ACRE', DM.SelecionarEstado('AC') , 'Estado do Acre está incorreto');
end;

procedure TTesteCaseEstados.VerificarSeEstadoDoALAGOASEstaCorreto;
begin
  CheckEquals('ALAGOAS', DM.SelecionarEstado('AL') , 'Estado do ALAGOAS está incorreto');
end;

procedure TTesteCaseEstados.VerificarSeEstadoDoAMAPAEstaCorreto;
begin
  CheckEquals('AMAPÁ', DM.SelecionarEstado('AP') , 'Estado do AMAPÁ está incorreto');
end;

procedure TTesteCaseEstados.VerificarSeEstadoDoAMAZONASEstaCorreto;
begin
  CheckEquals('AMAZONAS', DM.SelecionarEstado('AM') , 'Estado do AMAZONAS está incorreto');
end;

procedure TTesteCaseEstados.VerificarSeEstadoDoBAHIAEstaCorreto;
begin
  CheckEquals('BAHIA', DM.SelecionarEstado('BA') , 'Estado do BAHIA está incorreto');
end;

procedure TTesteCaseEstados.VerificarSeEstadoDoCEARAEstaCorreto;
begin
  CheckEquals('CEARÁ', DM.SelecionarEstado('CE') , 'Estado do CEARÁ está incorreto');
end;

procedure TTesteCaseEstados.VerificarSeEstadoDoDISTRITO_FEDERALEstaCorreto;
begin
  CheckEquals('DISTRITO FEDERAL', DM.SelecionarEstado('DF') , 'Estado do DISTRITO FEDERAL está incorreto');
end;

procedure TTesteCaseEstados.VerificarSeEstadoDoESPIRITO_SANTOEstaCorreto;
begin
  CheckEquals('ESPÍRITO SANTO', DM.SelecionarEstado('ES') , 'Estado do ESPÍRITO SANTO está incorreto');
end;

procedure TTesteCaseEstados.VerificarSeEstadoDoGOIASEstaCorreto;
begin
  CheckEquals('GOIÁS', DM.SelecionarEstado('GO') , 'Estado do GOIÁS está incorreto');
end;

procedure TTesteCaseEstados.VerificarSeEstadoDoMARANHAOEstaCorreto;
begin
  CheckEquals('MARANHÃO', DM.SelecionarEstado('MA') , 'Estado do MARANHÃO está incorreto');
end;

procedure TTesteCaseEstados.VerificarSeEstadoDoMATOGROSSO_DO_SULEstaCorreto;
begin
  CheckEquals('MATO GROSSO DO SUL', DM.SelecionarEstado('MS') , 'Estado do MATO GROSSO DO SUL está incorreto');
end;

procedure TTesteCaseEstados.VerificarSeEstadoDoMATOGROSSOEstaCorreto;
begin
  CheckEquals('MATO GROSSO', DM.SelecionarEstado('MT') , 'Estado do MATO GROSSO está incorreto');
end;

procedure TTesteCaseEstados.VerificarSeEstadoDoMINAS_GERAISEstaCorreto;
begin
  CheckEquals('MINAS GERAIS', DM.SelecionarEstado('MG') , 'Estado do MINAS GERAIS está incorreto');
end;

procedure TTesteCaseEstados.VerificarSeEstadoDoPARAEstaCorreto;
begin
  CheckEquals('PARÁ', DM.SelecionarEstado('PA') , 'Estado do PARÁ está incorreto');
end;

procedure TTesteCaseEstados.VerificarSeEstadoDoPARAIBAEstaCorreto;
begin
  CheckEquals('PARAIBA', DM.SelecionarEstado('PB') , 'Estado do PARAIBA está incorreto');
end;

procedure TTesteCaseEstados.VerificarSeEstadoDoPARANAEstaCorreto;
begin
  CheckEquals('PARANÁ', DM.SelecionarEstado('PR') , 'Estado do PARANÁ está incorreto');
end;

procedure TTesteCaseEstados.VerificarSeEstadoDoPERNAMBUCOEstaCorreto;
begin
  CheckEquals('PERNAMBUCO', DM.SelecionarEstado('PE') , 'Estado do PERNAMBUCO está incorreto');
end;

procedure TTesteCaseEstados.VerificarSeEstadoDoPIAUIEstaCorreto;
begin
  CheckEquals('PIAUÍ', DM.SelecionarEstado('PI') , 'Estado do PIAUÍ está incorreto');
end;

procedure TTesteCaseEstados.VerificarSeEstadoDoRIO_DE_JANEIROEstaCorreto;
begin
  CheckEquals('RIO DE JANEIRO', DM.SelecionarEstado('RJ') , 'Estado do RIO DE JANEIRO está incorreto');
end;

procedure TTesteCaseEstados.VerificarSeEstadoDoRIO_GRANDE_DO_NORTEEstaCorreto;
begin
  CheckEquals('RIO GRANDE DO NORTE', DM.SelecionarEstado('RN') , 'Estado do RIO GRANDE DO NORTE está incorreto');
end;

procedure TTesteCaseEstados.VerificarSeEstadoDoRIO_GRANDE_DO_SULEstaCorreto;
begin
  CheckEquals('RIO GRANDE DO SUL', DM.SelecionarEstado('RS') , 'Estado do RIO GRANDE DO SUL está incorreto');
end;

procedure TTesteCaseEstados.VerificarSeEstadoDoRONDONIAEstaCorreto;
begin
  CheckEquals('RONDÔNIA', DM.SelecionarEstado('RO') , 'Estado do RONDÔNIA está incorreto');
end;

procedure TTesteCaseEstados.VerificarSeEstadoDoRORAIMAEstaCorreto;
begin
  CheckEquals('RORAIMA', DM.SelecionarEstado('RR') , 'Estado do RORAIMA está incorreto');
end;

procedure TTesteCaseEstados.VerificarSeEstadoDoSANTA_CATARINAEstaCorreto;
begin
  CheckEquals('SANTA CATARINA', DM.SelecionarEstado('SC') , 'Estado do SANTA CATARINA está incorreto');
end;

procedure TTesteCaseEstados.VerificarSeEstadoDoSAO_PAULOEstaCorreto;
begin
  CheckEquals('SÃO PAULO', DM.SelecionarEstado('SP') , 'Estado do SÃO PAULO está incorreto');
end;

procedure TTesteCaseEstados.VerificarSeEstadoDoSERGIPEEstaCorreto;
begin
  CheckEquals('SERGIPE', DM.SelecionarEstado('SE') , 'Estado do SERGIPE está correto');
end;

procedure TTesteCaseEstados.VerificarSeEstadoDoTOCANTINSEstaCorreto;
begin
  CheckEquals('TOCANTINS', DM.SelecionarEstado('TO') , 'Estado do TOCANTINS está incorreto');
end;

procedure TTesteCaseEstados.SetUp;
begin
  inherited;
end;

procedure TTesteCaseEstados.TearDown;
begin
  inherited;
end;

initialization
//  TestFramework.RegisterTest('Primeiro Teste' , TTestCaseFirst.Suite);
//  TestFramework.RegisterTest('Teste dos Estados' , TTesteCaseEstados.Suite);

//  TestFramework.RegisterTest(TTestCaseFirst.Suite);
  TestFramework.RegisterTests('Testes', [ TTestCaseFirst.Suite,
                                          TTesteCaseEstados.Suite ]);
end.

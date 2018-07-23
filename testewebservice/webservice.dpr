program webservice;

uses
  Forms,
  teste in 'teste.pas' {Form1},
  NewService in 'NewService.pas',
  Service in 'Service.pas',
  RetornarXMLSchemaCadastro in 'RetornarXMLSchemaCadastro.pas',
  RetornarXMLSchemaMovimento in 'RetornarXMLSchemaMovimento.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

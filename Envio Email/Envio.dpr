program Envio;

uses
  Vcl.Forms,
  uEntrada in 'uEntrada.pas' {frmEntrada},
  uEscreverEmail in 'uEscreverEmail.pas' {frmEscreverEmail},
  uConexaoDB in 'uConexaoDB.pas',
  uCadastroUsuarios in 'uCadastroUsuarios.pas' {frmCadastroUsuarios};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmEntrada, frmEntrada);
  Application.Run;
end.

program ProjetoTeste;

uses
  ExceptionLog,
  Forms,
  uProjetoTeste in 'uProjetoTeste.pas' {Form1},
  uAcessaBanco in 'uAcessaBanco.pas',
  uPesquisa in 'base\uPesquisa.pas' {frmPesquisa};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmPesquisa, frmPesquisa);
  Application.Run;
end.

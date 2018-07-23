program Conexao;

uses
  Forms,
  UConexao in 'UConexao.pas' {fmConexao},
  USelecionarArquivo in 'USelecionarArquivo.pas' {fmSelecionar};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmConexao, fmConexao);
  Application.Run;
end.

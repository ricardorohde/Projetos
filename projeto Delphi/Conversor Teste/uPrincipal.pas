unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    btnFechar: TBitBtn;
    btn2: TBitBtn;
    procedure btnFecharClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
    procedure ConverteEmpresaPhd;
    procedure ConverteEmpresaDp;
    procedure ConverteSindicato;
    procedure ConverteHorario;
    procedure ConverteFuncao;
    procedure ConverteFuncionario;
    procedure ConverteDependente;

    procedure DeleteAllFiles;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses uConexao, uProgress;

{$R *.dfm}

procedure TForm1.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.btn2Click(Sender: TObject);
var lProgress : TProgress;
begin
  DeleteAllFiles;
  lProgress := TProgress.Create();//(100, 'Empresa PHD');
  try
    lProgress.Execute;
//    lProgress.Execute(100, 'Empresa PHD');
//    ConverteEmpresaPhd;
////    lProgress.Execute(100, 'Empresa DP');
//    ConverteEmpresaDp;
////    lProgress.Execute(100, 'Sindicato');
//    ConverteSindicato;
////    lProgress.Execute(100, 'Horário');
//    ConverteHorario;
////    lProgress.Execute(100, 'Função');
//    ConverteFuncao;
////    lProgress.Execute(100, 'Funcionário');
//    ConverteFuncionario;
////    lProgress.Execute(100, 'Dependente');
//    ConverteDependente;
//    ShowMessage('Conversão realizada com sucesso!!!');
    lProgress.Stop;
  finally
    FreeAndNil(lProgress);
  end;
end;

procedure TForm1.ConverteEmpresaPhd;
var lConexao : TAcessarFirebird;
begin
  lConexao := TAcessarFirebird.Create;
  try
//    try
//      begin
        lConexao.InserirDados;
//        ShowMessage('Tabela EmpresaPHD convertida com sucesso.');
//      end;
//      except on E : Exception do
//        ShowMessage('Falha ao converter a tabela EmpresaPHD, verificar: ' + E.Message);
//    end;
  finally
    FreeAndNil(lConexao);
  end;
end;

procedure TForm1.ConverteEmpresaDp;
var lCon : TAcessarFirebird;
begin
  lCon := TAcessarFirebird.Create;
  try
//    try
//      begin
        lCon.InserirDadosDpEmp;
//        ShowMessage('Tabela EmpresaDP convertida com sucesso.');
//      end;
//    except on E : Exception do
//      ShowMessage('Falha ao converter a tabela EmpresaDP, verificar: ' + E.Message);
//    end;
  finally
    FreeAndNil(lCon);
  end;
end;

procedure TForm1.ConverteSindicato;
var lConexao : TAcessarFirebird;
begin
  lConexao := TAcessarFirebird.Create;
  try
//    try
//      begin
        lConexao.InserirDadosDpSind;
 //       ShowMessage('Tabela Sindicato convertida com sucesso.');
//      end;
//    except on E : Exception do
//      ShowMessage('Falha ao converter a tabela Sindicato, verificar: ' + E.Message);
//    end;
  finally
    FreeAndNil(lConexao);
  end;
end;

procedure TForm1.ConverteHorario;
var lConexao : TAcessarFirebird;
begin
  lConexao := TAcessarFirebird.Create;
    try
//      try
//        begin
          lConexao.InserirDadosDpHorario;
//          ShowMessage('Tabela Horario convertida com sucesso.');
//        end;
//      except on E : Exception do
//        ShowMessage('Falha ao converter a tabela Horario, verificar: ' + E.Message);
//      end;
    finally
      FreeAndNil(lConexao);
    end;
end;

procedure TForm1.ConverteFuncao;
var lConexao : TAcessarFirebird;
begin
  lConexao := TAcessarFirebird.Create;
  try
//    try
//      begin
        lConexao.InserirDadosDpFuncao;
//        ShowMessage('Tabela Funcao convertida com sucesso.');
//      end;
//    except on E : Exception do
//      ShowMessage('Falha ao converter a tabela Funcao, verificar: ' + E.Message);
//    end;
  finally
    FreeAndNil(lConexao);
  end;
end;

procedure TForm1.ConverteFuncionario;
var lConexao : TAcessarFirebird;
begin
  lConexao := TAcessarFirebird.Create;
  try
//    try
//      begin
        lConexao.InserirDadosDpFunc;
//        ShowMessage('Tabela Funcionario convertida com sucesso.');
//      end;
//    except on E : Exception do
//      ShowMessage('Falha ao converter a tabela Funcionario, verificar: ' + E.Message);
//    end;
  finally
    FreeAndNil(lConexao);
  end;
end;

procedure TForm1.ConverteDependente;
var lConectar : TAcessarFirebird;
begin
  lConectar := TAcessarFirebird.Create;
  try
//    try
//      begin
        lConectar.InserirDadosDpDepend;
//        ShowMessage('Tabela Dependente convertida com sucesso.');
//      end;
//    except on E : Exception do
//      ShowMessage('Falha ao converter a tabela Dependente, verificar: ' + E.Message);
//    end;
  finally
    FreeAndNil(lConectar);
  end;
end;

procedure TForm1.DeleteAllFiles;
const ADirOrigem = 'C:\Users\thiago.dsn.pack\Desktop\projeto Delphi\Conversor Teste\base';

var
  Arquivos    : TSearchRec;
  Encontrou   : Integer;
  lDirDestino : string;
  lExt        : string;
begin
  SetCurrentDir(ADirOrigem);
  
  Encontrou := FindFirst('*', faArchive, Arquivos);
  while Encontrou = 0 do
    begin
      DeleteFile(ADirOrigem + '\'+ Arquivos.Name);

      //Coloque como True se quiser que se já existir o arquivo ele seja sobrescrito
      Encontrou := FindNext(Arquivos);
    end;
end;

end.

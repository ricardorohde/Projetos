unit Unit1;

interface

uses
  Forms, Windows, Messages, SysUtils, Classes, Graphics, Controls, Dialogs, ExtCtrls,
  Db, DBClient, MidasLib, Alterdata, Variants, Grids, DBGrids,
  StdCtrls;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    TFuncionario  : TClientDataSet;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure TForm1.FormCreate(Sender: TObject);
begin
  TFuncionario  := TClientDataSet.Create(nil);
  {TFuncionario.FieldDefs.Clear;
  TFuncionario.FieldDefs.Add('ID', ftString, 50, false );
  TFuncionario.FieldDefs.Add('GestorID', ftString, 50, false );
  TFuncionario.FieldDefs.Add('IdEmpresaExterno', ftInteger, 0, false );
  TFuncionario.FieldDefs.Add('IdFuncionarioExterno', ftString, 20, false );
  TFuncionario.FieldDefs.Add('Nome', ftString, 100, false );
  TFuncionario.FieldDefs.Add('NomeCurto', ftString, 30, false );
  TFuncionario.FieldDefs.Add('DtNascimeto', ftDateTime, 0, false );
  TFuncionario.FieldDefs.Add('Mensagem', ftString, 255, false );
  TFuncionario.FieldDefs.Add('HrEntrada', ftDateTime, 0, false );
  TFuncionario.FieldDefs.Add('HrSaidaAlmoco', ftDateTime, 0, false );
  TFuncionario.FieldDefs.Add('HrEntradaAlmoco', ftDateTime, 0, false );
  TFuncionario.FieldDefs.Add('HrSaida', ftDateTime, 0, false );
  TFuncionario.FieldDefs.Add('HrSaidaIntervalo', ftDateTime, 0, false );
  TFuncionario.FieldDefs.Add('HrEntradaIntervalo', ftDateTime, 0, false );
  TFuncionario.FieldDefs.Add('DiasFolga', ftString, 10, false );
  TFuncionario.FieldDefs.Add('VerificaMarcacaoDIG',  ftString, 100, false );
  TFuncionario.FieldDefs.Add('VerificaMarcacaoCod',  ftString, 20, false );
  TFuncionario.FieldDefs.Add('VerificaMarcacaoSenha', ftString, 10, false );
  TFuncionario.FieldDefs.Add('DtDemissao', ftDateTime, 0, false );
  TFuncionario.FieldDefs.Add('Foto', ftString, 255, false );
  TFuncionario.FieldDefs.Add('TpPessoa', ftString, 1, false );
  TFuncionario.FieldDefs.Add('IdFuncionarioDig', ftAutoInc, 0, false );
  TFuncionario.FieldDefs.Add('DtAlteracaoCad',ftDateTime, 0, false );
  TFuncionario.fieldDefs.add('ConsideraAlmoco',ftBoolean,0,false);
  TFuncionario.fieldDefs.add('IntervaloMinimoAlmoco',ftInteger,0,false);
  TFuncionario.CreateDataSet;}
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
   TFuncionario.LoadFromFile('c:\temp\exe\Funcionario.xml');

   TFuncionario.LogChanges := False;

  DataSource1.DataSet := TFuncionario;
end;

end.
 
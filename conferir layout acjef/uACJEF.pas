unit uACJEF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Grids, DBGrids, ExtCtrls, DB, DBClient;

type
  TCamposACJEF = record
    HrEntrada: string;
    Cod_Horario: string;
    HorasDiurnas: string;
    HorasNoturnas: string;
    HorasExtras1: string;
    Percentual1: string;
    Modalidade1: string;
    HorasExtras2: string;
    HorasExtras3: string;
    HorasExtras4: string;
    Percentual2: string;
    Percentual3: string;
    Percentual4: string;
    Modalidade2: string;
    Modalidade3: string;
    Modalidade4: string;
    Faltas_Atrasos: string;
    Sinal_compensar: string;
    saldo_compensar: string;
  end;
  
  TfrmLayOutACJEF = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    edtPis: TEdit;
    Label1: TLabel;
    edtData: TMaskEdit;
    Label2: TLabel;
    edtArquivo: TEdit;
    Label3: TLabel;
    btnArquivo: TButton;
    OpenDialog1: TOpenDialog;
    btnGerar: TButton;
    client: TClientDataSet;
    dtsACJEF: TDataSource;
    clientDESCRICAO: TStringField;
    clientVALOR: TStringField;
    clientN_Campo: TIntegerField;
    procedure btnArquivoClick(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function preencheLayOut(pStringList : TStringList): boolean;
    procedure adicionaLinhaClient(pLinha : String);
    function preencheacampos (pLinha : String): TCamposACJEF;
  public
    { Public declarations }
  end;

var
  frmLayOutACJEF: TfrmLayOutACJEF;

implementation

{$R *.dfm}

procedure TfrmLayOutACJEF.btnArquivoClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edtArquivo.text := OpenDialog1.FileName;
end;

procedure TfrmLayOutACJEF.btnGerarClick(Sender: TObject);
var lcStringList : TStringList;
begin
  client.Close;
  lcStringList := TStringList.Create;
  try
    if FileExists(edtArquivo.Text) then
      begin
        lcStringList.LoadFromFile(edtArquivo.Text);
        if not preencheLayOut(lcStringList) then
          ShowMessage('Dados Não encontrados.Verifique as Informações digitadas!');
      end
    else
      ShowMessage('O Arquivo não existe.Verifique!!!');
  finally
    FreeAndNil(lcStringList);
  end;
end;

function TfrmLayOutACJEF.preencheLayOut(pStringList: TStringList): boolean;
var i : integer;
    lcLinha : string;
begin
  client.CreateDataSet;
  result := false;
  for i := 0 to pStringList.Count - 1 do
  begin
    lcLinha := pStringList.Strings[i];
    if (Pos(edtPis.Text,lcLinha) <> 0) and (Pos(edtdata.Text,lcLinha) <> 0)then
    begin
      result := true;
      adicionaLinhaClient(lcLinha);
    end;
    client.Open;
    client.First;
  end;
end;

procedure TfrmLayOutACJEF.adicionaLinhaClient(pLinha: String);
var lcCamposACJEF : TCamposACJEF;
begin
  lcCamposACJEF := preencheacampos(pLinha);
  Client.Append;
  clientN_Campo.AsInteger  := 5;
  clientDESCRICAO.AsString := 'Horario da Entrada';
  clientVALOR.asstring     := lcCamposACJEF.HrEntrada;
  Client.Post;

  Client.Append;
  clientN_Campo.AsInteger  := 6;
  clientDESCRICAO.AsString := 'Código do Horário';
  clientVALOR.asstring     := lcCamposACJEF.Cod_Horario;
  Client.Post;

  Client.Append;
  clientN_Campo.AsInteger  := 7;
  clientDESCRICAO.AsString := 'Horas Diurnas não extraordinárias';
  clientVALOR.asstring     := lcCamposACJEF.HorasDiurnas;
  Client.Post;

  Client.Append;
  clientN_Campo.AsInteger  := 8;
  clientDESCRICAO.AsString := 'Horas Noturnas não extraordinárias';
  clientVALOR.asstring     := lcCamposACJEF.HorasNoturnas;
  Client.Post;

  Client.Append;
  clientN_Campo.AsInteger  := 9;
  clientDESCRICAO.AsString := 'Horas Extras 1';
  clientVALOR.asstring     := lcCamposACJEF.HorasExtras1;
  Client.Post;

  Client.Append;
  clientN_Campo.AsInteger  := 10;
  clientDESCRICAO.AsString := 'Percentual do adicional de Horas Extras 1';
  clientVALOR.asstring     := lcCamposACJEF.Percentual1;
  Client.Post;

  Client.Append;
  clientN_Campo.AsInteger  := 11;
  clientDESCRICAO.AsString := 'Modalidade da Hora Extra 1';
  clientVALOR.asstring     := lcCamposACJEF.Modalidade1;
  Client.Post;

  Client.Append;
  clientN_Campo.AsInteger  := 12;
  clientDESCRICAO.AsString := 'Horas Extras 2';
  clientVALOR.asstring     := lcCamposACJEF.HorasExtras2;
  Client.Post;

  Client.Append;
  clientN_Campo.AsInteger  := 13;
  clientDESCRICAO.AsString := 'Percentual do adicional de Horas Extras 2';
  clientVALOR.asstring     := lcCamposACJEF.Percentual2;
  Client.Post;

  Client.Append;
  clientN_Campo.AsInteger  := 14;
  clientDESCRICAO.AsString := 'Modalidade da Hora Extra 2';
  clientVALOR.asstring     := lcCamposACJEF.Modalidade2;
  Client.Post;

  Client.Append;
  clientN_Campo.AsInteger  := 15;
  clientDESCRICAO.AsString := 'Horas Extras 3';
  clientVALOR.asstring     := lcCamposACJEF.HorasExtras3;
  Client.Post;

  Client.Append;
  clientN_Campo.AsInteger  := 16;
  clientDESCRICAO.AsString := 'Percentual do adicional de Horas Extras 3';
  clientVALOR.asstring     := lcCamposACJEF.Percentual3;
  Client.Post;

  Client.Append;
  clientN_Campo.AsInteger  := 17;
  clientDESCRICAO.AsString := 'Modalidade da Hora Extra 3';
  clientVALOR.asstring     := lcCamposACJEF.Modalidade3;
  Client.Post;

  Client.Append;
  clientN_Campo.AsInteger  := 18;
  clientDESCRICAO.AsString := 'Horas Extras 4';
  clientVALOR.asstring     := lcCamposACJEF.HorasExtras4;
  Client.Post;

  Client.Append;
  clientN_Campo.AsInteger  := 19;
  clientDESCRICAO.AsString := 'Percentual do adicional de Horas Extras 4';
  clientVALOR.asstring     := lcCamposACJEF.Percentual4;
  Client.Post;

  Client.Append;
  clientN_Campo.AsInteger  := 20;
  clientDESCRICAO.AsString := 'Modalidade da Hora Extra 4';
  clientVALOR.asstring     := lcCamposACJEF.Modalidade4;
  Client.Post;

  Client.Append;
  clientN_Campo.AsInteger  := 21;
  clientDESCRICAO.AsString := 'Horas de Faltas e/ou Atrasos';
  clientVALOR.asstring     := lcCamposACJEF.Faltas_Atrasos;
  Client.Post;

  Client.Append;
  clientN_Campo.AsInteger  := 22;
  clientDESCRICAO.AsString := 'Sinal de Horas para compensar';
  clientVALOR.asstring     := lcCamposACJEF.Sinal_compensar;
  Client.Post;

  Client.Append;
  clientN_Campo.AsInteger  := 23;
  clientDESCRICAO.AsString := 'Saldo de Horas para compensar';
  clientVALOR.asstring     := lcCamposACJEF.saldo_compensar;
  Client.Post;
end;

function TfrmLayOutACJEF.preencheacampos(pLinha: String): TCamposACJEF;
begin
  Result.HrEntrada       := Copy(pLinha,31,4);
  Result.Cod_Horario     := Copy(pLinha,35,4);
  Result.HorasDiurnas    := Copy(pLinha,39,4);
  Result.HorasNoturnas   := Copy(pLinha,43,4);
  Result.HorasExtras1    := Copy(pLinha,47,4);
  Result.Percentual1     := Copy(pLinha,51,4);
  Result.Modalidade1     := Copy(pLinha,55,1);
  Result.HorasExtras2    := Copy(pLinha,56,4);
  Result.Percentual2     := Copy(pLinha,60,4);
  Result.Modalidade2     := Copy(pLinha,64,1);
  Result.HorasExtras3    := Copy(pLinha,65,4);
  Result.Percentual3     := Copy(pLinha,69,4);
  Result.Modalidade3     := Copy(pLinha,73,1);
  Result.HorasExtras4    := Copy(pLinha,74,4);
  Result.Percentual4     := Copy(pLinha,78,4);
  Result.Modalidade4     := Copy(pLinha,82,1);
  Result.Faltas_Atrasos  := Copy(pLinha,83,4);
  Result.Sinal_compensar := Copy(pLinha,87,1);
  Result.saldo_compensar := Copy(pLinha,88,4);
end;

procedure TfrmLayOutACJEF.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = chr(13) then
  begin
    if not (activeControl is TMemo) then
    begin
      selectnext(activeControl,true,true);
      Key := chr(0);
    end;
  end;
end;

end.

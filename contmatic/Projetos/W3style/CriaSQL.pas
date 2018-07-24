unit CriaSQL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, ADODB;

type
  TfmCriaSQL = class(TForm)
    edNoTabela: TEdit;
    edAlias: TEdit;
    mmSQL: TMemo;
    btExecutar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    btOK: TButton;
    btCancelar: TButton;
    ckAs: TCheckBox;
    qySQL: TADOQuery;
    conexao: TADOConnection;
    procedure btExecutarClick(Sender: TObject);
    procedure btOKClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);

  private
    { Private declarations }
      
    function Conectar(): Boolean;
  public
    { Public declarations }
    Class Procedure CriaSQL( pSQL : TStrings; pConnection : TADOConnection );
  end;

var
  fmCriaSQL: TfmCriaSQL;

implementation

uses UConfiguracao;

{$R *.DFM}
Class procedure TfmCriaSQL.CriaSQL( pSQL : TStrings; pConnection : TADOConnection );
var viModalResult : integer;
begin
   with create(Application) do
   begin
//      qySQL.databasename := pDataBaseName;
//      qySQL.SessionName  := pSessionName;
      qySQL.Connection := pConnection;
      viModalResult := showmodal;
      if viModalResult = mrOk then
      begin
         pSql.assign(mmSQL.Lines);
      end
   end;
end;

function TfmCriaSQL.Conectar(): Boolean;
var
  fmConfiguracao : TfmConfiguracao;
  lConfiguracao  : TConfiguracao;
begin
  result := false;
  fmConfiguracao := TfmConfiguracao.Create(nil);
  try
    lConfiguracao := fmConfiguracao.LerConfiguracao();
    if (lConfiguracao.Servidor = '') or
       (lConfiguracao.Usuario = '') or
       (lConfiguracao.Senha = '') or
       (lConfiguracao.Porta = '') or
       (lConfiguracao.DataBase = '') then
    begin
      if (fmConfiguracao.ShowModal = mrOk) then
        lConfiguracao := fmConfiguracao.LerConfiguracao()
      else
        Exit;
    end;

    try
      if conexao.Connected then
        conexao.Close;

      conexao.LoginPrompt := False;
      conexao.ConnectionString:= 'Provider=ASEOLEDB.1;Password=' + lConfiguracao.Senha + ';Persist Security Info=True;' +
                                 'User ID=' + lConfiguracao.Usuario + ';Data Source="' + lConfiguracao.Servidor +
                                 ';' +  lConfiguracao.Porta + '";Initial Catalog='+ lConfiguracao.DataBase;
//      Data_Principal.ado_conexao.ConnectionString:= 'Provider=ASEOLEDB.1;Password=tusrmvkc;Persist Security Info=True;' +
//                                                    'User ID=sa;Data Source="10.10.10.31;5003";Initial Catalog=incentivale';

      conexao.CommandTimeout:=5;
      conexao.Open;
      conexao.CommandTimeout:=30;

      result := conexao.Connected;
    except on e:Exception  do
      ShowMessage('Erro: '+ E.Message);
    end;
  finally
    FreeAndNil(fmConfiguracao);
  end;
end;

procedure TfmCriaSQL.btExecutarClick(Sender: TObject);
var i : integer;
    vslinha : string;
    vsSeparador_Alias : string;
begin
   if not Conectar() then
   begin
     ShowMessage('Não foi possível realizar a conexao. Verifique o arquivo "Configuração.ini"!');
     Exit;
   end;

   if ckAs.checked then
     vsSeparador_Alias := ' AS '
   else
     vsSeparador_Alias := ' ';

   with qySQL do
   begin
     Connection := conexao;
     close;
     sql.clear;
     sql.add('SELECT * FROM '+ edNoTabela.TEXT);
     sql.add('WHERE 1=2');
     open;
     mmSQL.Lines.clear;
     mmSQL.Lines.add('SELECT');
     for i := 0 to ( FieldCount -1 ) DO
     begin
       if edAlias.Text = '' then
         begin
           vslinha := FieldS[I].FieldName;
         end
       else
         begin
           vslinha := edAlias.Text +'.'+FieldS[I].FieldName+ ' ' + vsSeparador_Alias + ' ' + FieldS[I].FieldName;
         end;
       if i <> ( FieldCount -1 ) then
         vsLinha := vsLinha + ',';

        mmSQL.Lines.add('  '+ vsLinha )
     end;
     mmSQL.Lines.add('FROM');
     mmSQL.Lines.add('  '+edNoTabela.TEXT+ ' '+ edAlias.TEXT);
   end;
end;

procedure TfmCriaSQL.btOKClick(Sender: TObject);
begin
   ModalResult := mrOk;
end;

procedure TfmCriaSQL.btCancelarClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

end.

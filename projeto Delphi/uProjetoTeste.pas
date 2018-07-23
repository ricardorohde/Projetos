unit uProjetoTeste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet, IBQuery,
  IBDatabase, uAcessaBanco, StrUtils, uPesquisa;

type
  TForm1 = class(TForm)
    pnl1: TPanel;
    btnGravar: TBitBtn;
    btnEditar: TBitBtn;
    btnExcluir: TBitBtn;
    btnFechar: TBitBtn;
    pnl2: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    edtCod: TEdit;
    edtNome: TEdit;
    edtCnpj: TEdit;
    edtLogradouro: TEdit;
    edtNumero: TEdit;
    edtCidade: TEdit;
    edtBairro: TEdit;
    edtUf: TEdit;
    btnPesquisar: TBitBtn;
    procedure btnFecharClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);


  private
    { Private declarations }
    function AlimentaRegistro : TRegistro;
    function VerificaCampos : Boolean;

    procedure LimpaCampos();

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function TForm1.AlimentaRegistro: TRegistro;
begin
//  if VerificaCampos then                               //Função verificaCampos é usado para checar se todos os componentes do tipo
//    begin                                              // edtBox  estão vazios e exibe uma mensagem para preenche-los
      Result.Nome       := edtNome.Text;
      Result.Codigo     := StrToIntDef(edtCod.Text, 0);
      Result.Cnpj       := edtCnpj.Text;
      Result.Logradouro := edtLogradouro.Text;
      Result.Numero     := StrToIntDef(edtNumero.Text, 0);
      Result.Cidade     := edtCidade.Text;
      Result.Bairro     := edtBairro.Text;
      Result.Uf         := edtUf.Text;
//    end
//  else
//    begin
//      ShowMessage('Favor preencher todos os campos');
//    end;
end;

procedure TForm1.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.btnGravarClick(Sender: TObject);
var lBanco : TAcessaBanco;
begin
  lBanco := TAcessaBanco.Create;
  try
    lbanco.State    := tsInsert;       //verificar qual o estado, no caso é o botao insert, entao chama o estado insert
    lbanco.Registro := AlimentaRegistro;  //alimenta registro para nao ter que lbanco.nome := edtNome.Text ....
    try
      lbanco.Execute;
      ShowMessage('Dados inseridos com sucesso');
      LimpaCampos();
    except
      ShowMessage('Não foi possível Inserir no banco, verificar');
    end;
  finally
    FreeAndNil(lBanco);
  end;
end;



procedure TForm1.LimpaCampos;
begin
  edtCod.Clear;
  edtNome.Clear;
  edtCnpj.Clear;
  edtLogradouro.Clear;
  edtNumero.Clear;
  edtCidade.Clear;
  edtBairro.Clear;
  edtUf.Clear;
end;

function TForm1.VerificaCampos: Boolean;
var i : Integer;
begin
  Result := True;
  for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TEdit then
        if (TEdit(Components[i]).Text = '') and Result then//and AnsiIndexText(TEdit(Components[i]).Name,['edtCod','edtNome']) then
          Result := False;
    end;

end;


procedure TForm1.btnExcluirClick(Sender: TObject);
var lBanco : TAcessaBanco;
begin
  if (edtCod.Text <> '') then
    begin
      lBanco := TAcessaBanco.Create;
      try
        lBanco.State    := tsDelete;
        lBanco.Registro := AlimentaRegistro;
        lBanco.Execute;
        ShowMessage('Registro deletado com sucesso');
        LimpaCampos();
      finally
        FreeAndNil(lBanco);

      end;
    end;
end;

procedure TForm1.btnEditarClick(Sender: TObject);
var lBanco : TAcessaBanco;
begin
  lBanco := TAcessaBanco.Create;
  try
    lBanco.State := tsEdit;
    lBanco.Registro := AlimentaRegistro;
    lBanco.Execute;
    ShowMessage('Registro editado com sucesso');
  finally
    FreeAndNil(lBanco);
  end;
end;

procedure TForm1.btnPesquisarClick(Sender: TObject);
var lBanco : TAcessaBanco;
begin
  lBanco := TAcessaBanco.Create;
  frmPesquisa := TfrmPesquisa.Create(self);
  try
//    lBanco.State := tsEdit;
//    lBanco.Registro := AlimentaRegistro;
    frmPesquisa.DataSet := lBanco.Selecionar('EMPRESA');

    frmPesquisa.ShowModal;
  finally
    FreeAndNil(lBanco);
  end;


end;

end.

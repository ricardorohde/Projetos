unit uMascaraPlanoDeContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Alterdata;

type
  TfrmMascaraPlanoDeContas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnGravar: TBitBtn;
    edtMascaraPlanodeContas: TEdit;
    Label2: TLabel;
    chkMascaraForAll: TCheckBox;
    Panel3: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    lblEmpresa: TLabel;
    procedure btnGravarClick(Sender: TObject);
    procedure edtMascaraPlanodeContasKeyPress(Sender: TObject;
      var Key: Char);
  private
    { Private declarations }

    FMascaraForAll      : Boolean;
    FMascaraPlanoContas : String;

    function GetMascaraPlanoContas: String;
    procedure SetMascaraPlanoContas(const Value: String);
    function GetMascaraForAll: Boolean;
    procedure SetMascaraForAll(const Value: Boolean);

  public
    { Public declarations }

    property MascaraForAll      : Boolean read GetMascaraForAll      write SetMascaraForAll;
    property MascaraPlanoContas : String  read GetMascaraPlanoContas write SetMascaraPlanoContas;
  end;

var
  frmMascaraPlanoDeContas: TfrmMascaraPlanoDeContas;

implementation

{$R *.dfm}

{ TForm1 }

function TfrmMascaraPlanoDeContas.GetMascaraForAll: Boolean;
begin
  result := FMascaraForAll;
end;

function TfrmMascaraPlanoDeContas.GetMascaraPlanoContas: String;
begin
  result := FMascaraPlanoContas;
end;

procedure TfrmMascaraPlanoDeContas.SetMascaraForAll(const Value: Boolean);
begin
  FMascaraForAll := Value;
end;

procedure TfrmMascaraPlanoDeContas.SetMascaraPlanoContas(const Value: String);
begin
  FMascaraPlanoContas := Value;
end;

procedure TfrmMascaraPlanoDeContas.btnGravarClick(Sender: TObject);
begin
  if Empty(edtMascaraPlanodeContas.Text) then
    begin
      MessageBox(0, 'Informações incorretas.Verifique!!!', 'Atenção', MB_ICONWARNING or MB_OK);
      edtMascaraPlanodeContas.SetFocus;
    end
  else
    begin
      FMascaraForAll      := chkMascaraForAll.Checked;
      FMascaraPlanoContas := edtMascaraPlanodeContas.Text;
      Close;
    end;
end;

procedure TfrmMascaraPlanoDeContas.edtMascaraPlanodeContasKeyPress(
  Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    btnGravar.Click;
end;

end.

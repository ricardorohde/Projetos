unit uCadastro_Funcionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Tela_Cadastro, DB, DBClient, EMSTable, ImgList, ComCtrls,
  ToolWin, Grids, DBGrids, StdCtrls, Mask, DBCtrls;

type
  TfrmCadastro_Funcionario = class(TfrmTelaDeCadastro)
    cdsTabelaID_FUNCIONARIO: TIntegerField;
    cdsTabelaCODIGO_EXTERNO: TIntegerField;
    cdsTabelaNOME: TWideStringField;
    cdsTabelaDATA_NASCIMENTO: TSQLTimeStampField;
    cdsTabelaSALARIO: TFloatField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    cdsTabelaEMPRESA_ID: TIntegerField;
    cdsTabelaPIS: TWideStringField;
    cdsTabelaRG: TWideStringField;
    cdsTabelaCTPS: TWideStringField;
    cdsTabelaDATA_ADMISSAO: TSQLTimeStampField;
    cdsTabelaDATA_DEMISSAO: TSQLTimeStampField;
    cdsTabelaCPF: TWideStringField;
    cdsTabelaCONFIGURACAO_INDIVIDUAL: TBooleanField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure BeforeDestruction; override;
    procedure AfterConstruction; override;
  end;

var
  frmCadastro_Funcionario: TfrmCadastro_Funcionario;

implementation

uses uDM_Cadastro_Funcionario;

{$R *.dfm}

{ TfrmCadastro_Funcionario }

procedure TfrmCadastro_Funcionario.AfterConstruction;
begin
  inherited;
    
  DM_Cadastro_Funcionario := TDM_Cadastro_Funcionario.Create(Self);
end;

procedure TfrmCadastro_Funcionario.BeforeDestruction;
begin
  FreeAndNil( DM_Cadastro_Funcionario );
  inherited;
end;

end.

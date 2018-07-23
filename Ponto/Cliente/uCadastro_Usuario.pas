unit uCadastro_Usuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Tela_Cadastro, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, EMSParameters, DBClient, cxNavigator,
  cxDBNavigator, StdCtrls, Buttons, ExtCtrls, ComCtrls, cxPC, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Mask, DBCtrls;

type
  TfrmCadastro_Usuario = class(TfrmTelaDeCadastro)
    tv1USUARIO: TcxGridDBColumn;
    Label1: TLabel;
    edtUsuario: TDBEdit;
    Label2: TLabel;
    edtSenha: TDBEdit;
    Label3: TLabel;
    edtCodigo: TDBEdit;
    cdsTabelaID_USUARIO: TIntegerField;
    cdsTabelaUSUARIO: TWideStringField;
    cdsTabelaSENHA: TWideStringField;
    cdsTabelaCODIGO_EXTERNO: TIntegerField;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    
    { Public declarations }
    
  end;

var
  frmCadastro_Usuario: TfrmCadastro_Usuario;

implementation

uses uDM_Cadastro_Usuario;

{$R *.dfm}

{ TfrmCadastro_Usuario }

procedure TfrmCadastro_Usuario.AfterConstruction;
begin
  inherited;
  DM_Cadastro_Usuario    := TDM_Cadastro_Usuario.Create(Self);
  cdsTabela.RemoteServer := DM_Cadastro_Usuario.DCOMCon_Usuario;
end;

procedure TfrmCadastro_Usuario.BeforeDestruction;
begin
  inherited;
  FreeAndNil( DM_Cadastro_Usuario );
end;

procedure TfrmCadastro_Usuario.FormShow(Sender: TObject);
begin
  inherited;
  cdsTabela.Filtered := False;
  cdsTabela.Filter   := 'USUARIO <> ' + QuotedStr('SYS');
  cdsTabela.Filtered := True;
end;

end.

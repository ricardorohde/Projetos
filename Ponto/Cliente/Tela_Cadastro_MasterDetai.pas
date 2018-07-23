unit Tela_Cadastro_MasterDetai;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Tela_Cadastro, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, Mask, LookupEdit, dbLookUpEdit, DBSearchEdit,
  StdCtrls, EMSParameters, DBClient, cxNavigator, cxDBNavigator, Buttons,
  ExtCtrls, ComCtrls, cxPC, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

type
  TfrmTelaDeCadastro1 = class(TfrmTelaDeCadastro)
    Panel1: TPanel;
    Label1: TLabel;
    edtNomeMaster: TEdit;
    edtCodigoMaster: TDBSearchEdit;
    procedure edtCodigoMasterKeyPress(Sender: TObject; var Key: Char);
    procedure btnEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTelaDeCadastro1: TfrmTelaDeCadastro1;

implementation

{$R *.dfm}

procedure TfrmTelaDeCadastro1.edtCodigoMasterKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    edtCodigoMaster.OnExit(Sender);
end;

procedure TfrmTelaDeCadastro1.btnEditarClick(Sender: TObject);
begin
  if Validar() then
    edtCodigoMaster.OnExit(Sender)
  else
    Exit;

  inherited;
end;

end.

unit uCadastro_Municipio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Tela_Cadastro, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, EMSParameters, DBClient, cxNavigator,
  cxDBNavigator, StdCtrls, Buttons, ExtCtrls, ComCtrls, cxPC, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxImageComboBox, cxDBEdit, Mask, DBCtrls;

type
  TfrmCadastro_Municipio = class(TfrmTelaDeCadastro)
    cdsTabelaID_COD_MUNICIPIO: TIntegerField;
    cdsTabelaCOD_MUNICIPIO: TFloatField;
    cdsTabelaUF: TWideStringField;
    cdsTabelaNOME: TWideStringField;
    cdsTabelaNOME_SEM_ACENTO: TWideStringField;
    Label1: TLabel;
    edtCodigo: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtNome: TDBEdit;
    cboUF: TcxDBImageComboBox;
    tv1COD_MUNICIPIO: TcxGridDBColumn;
    tv1UF: TcxGridDBColumn;
    tv1NOME: TcxGridDBColumn;
  private
    { Private declarations }
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    
    { Public declarations }
    
  end;

var
  frmCadastro_Municipio: TfrmCadastro_Municipio;

implementation

uses uDM_Cadastro_Municipio;

{$R *.dfm}

{ TfrmCadastro_Municipio }

procedure TfrmCadastro_Municipio.AfterConstruction;
begin
  inherited;
  DM_Cadastro_Municipio  := TDM_Cadastro_Municipio.Create(Self);
  cdsTabela.RemoteServer := DM_Cadastro_Municipio.DCOMCon_Municipio;
end;

procedure TfrmCadastro_Municipio.BeforeDestruction;
begin
  inherited;
  FreeAndNil( DM_Cadastro_Municipio );
end;

end.

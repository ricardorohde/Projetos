unit uCadastro_Feriado;

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
  cxDropDownEdit, cxCalendar, cxDBEdit, Mask, DBCtrls, LookupEdit,
  dbLookUpEdit, DBSearchEdit, cxImageComboBox;

type
  TfrmCadastro_Feriado = class(TfrmTelaDeCadastro)
    cdsTabelaID_FERIADO: TIntegerField;
    cdsTabelaCODIGO_EXTERNO: TIntegerField;
    cdsTabelaDATA_FERIADO: TSQLTimeStampField;
    cdsTabelaDESCRICAO: TWideStringField;
    cdsTabelaABRANGENCIA: TIntegerField;
    cdsTabelaCODIGO_MUNICIPIO: TIntegerField;
    tv1CODIGO_EXTERNO: TcxGridDBColumn;
    tv1DATA_FERIADO: TcxGridDBColumn;
    tv1DESCRICAO: TcxGridDBColumn;
    tv1ABRANGENCIA: TcxGridDBColumn;
    Label1: TLabel;
    edtCodigo: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtDescricao: TDBEdit;
    edtDataFeriado: TcxDBDateEdit;
    rgbAbrangencia: TDBRadioGroup;
    edtMunicipio: TDBSearchEdit;
    procedure rgbAbrangenciaClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    { Public declarations }

  end;

var
  frmCadastro_Feriado: TfrmCadastro_Feriado;

implementation

uses uDM_Cadastro_Feriado;

{$R *.dfm}

{ TfrmCadastro_Feriado }

procedure TfrmCadastro_Feriado.AfterConstruction;
begin
  inherited;
  DM_Cadastro_Feriado    := TDM_Cadastro_Feriado.Create(Self);
  cdsTabela.RemoteServer := DM_Cadastro_Feriado.DCOMCon_Feriado;
end;

procedure TfrmCadastro_Feriado.BeforeDestruction;
begin
  inherited;
  FreeAndNil( DM_Cadastro_Feriado );
end;

procedure TfrmCadastro_Feriado.rgbAbrangenciaClick(Sender: TObject);
begin
  inherited;

  edtMunicipio.Visible := rgbAbrangencia.ItemIndex = 2;
end;

end.

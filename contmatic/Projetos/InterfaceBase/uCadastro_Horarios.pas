unit uCadastro_Horarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Tela_Cadastro, DB, DBClient, ComCtrls, ToolWin, Grids, DBGrids,
  StdCtrls, Mask, DBCtrls, ImgList, EMSTable, DataModule;

type
  TfrmCadastro_Horarios = class(TfrmTelaDeCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    dtsHorario_Detalhe: TDataSource;
    EMSTable1: TEMSTable;
    EMSTable1codigo: TIntegerField;
    cdsTabelaID_HORARIO: TIntegerField;
    cdsTabelaCODIGO_EXTERNO: TAutoIncField;
    cdsTabelaDESCRICAO: TStringField;
    cdsTabelaPOSSUI_ESCALA: TBooleanField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastro_Horarios: TfrmCadastro_Horarios;

implementation

{$R *.dfm}

procedure TfrmCadastro_Horarios.FormCreate(Sender: TObject);
begin
  inherited;
//  cdsTabela.Connection := DataModule1.ADConnection1;
  Connection := DataModule1.ADConnection1;
end;

end.

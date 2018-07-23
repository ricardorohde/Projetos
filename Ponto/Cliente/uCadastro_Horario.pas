unit uCadastro_Horario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Tela_Cadastro, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, EMSParameters, DBClient, cxNavigator,
  cxDBNavigator, StdCtrls, Buttons, ExtCtrls, ComCtrls, cxPC, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, DBCtrls, Mask, cxDBLookupComboBox, cxTimeEdit;

type
  TfrmCadastro_Horario = class(TfrmTelaDeCadastro)
    cdsTabelaID_HORARIO: TIntegerField;
    cdsTabelaCODIGO_EXTERNO: TIntegerField;
    cdsTabelaDESCRICAO: TWideStringField;
    cdsTabelaPOSSUI_ESCALA: TBooleanField;
    tv1CODIGO_EXTERNO: TcxGridDBColumn;
    tv1DESCRICAO: TcxGridDBColumn;
    lbl1: TLabel;
    edtCodigo: TDBEdit;
    lbl2: TLabel;
    edtDescricao: TDBEdit;
    cdsHORARIO_DETALHE: TClientDataSet;
    dtsHORARIO_DETALHE: TDataSource;
    cdsHORARIO_DETALHEID_HORARIO_DETALHE: TIntegerField;
    cdsHORARIO_DETALHEID_HORARIO: TIntegerField;
    cdsHORARIO_DETALHEENTRADA: TTimeField;
    cdsHORARIO_DETALHEALMOCO_INICIO: TTimeField;
    cdsHORARIO_DETALHEALMOCO_FIM: TTimeField;
    cdsHORARIO_DETALHESAIDA: TTimeField;
    cdsHORARIO_DETALHEDIA_SEMANA: TIntegerField;
    cdsHORARIO_DETALHEHORAS_A_TRABALHAR: TTimeField;
    tvHorario: TcxGridDBTableView;
    lvHorario: TcxGridLevel;
    grdHorario: TcxGrid;
    tvHorarioENTRADA: TcxGridDBColumn;
    tvHorarioALMOCO_INICIO: TcxGridDBColumn;
    tvHorarioALMOCO_FIM: TcxGridDBColumn;
    tvHorarioSAIDA: TcxGridDBColumn;
    tvHorarioDIA_SEMANA: TcxGridDBColumn;
    tvHorarioHORAS_A_TRABALHAR: TcxGridDBColumn;
    dtsDiaSemana: TDataSource;
    cdsDiaSemana: TClientDataSet;
    cdsDiaSemanaDia: TIntegerField;
    cdsDiaSemanaDescricao: TStringField;
    cdsHORARIO_DETALHEFind: TClientDataSet;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    TimeField1: TTimeField;
    TimeField2: TTimeField;
    TimeField3: TTimeField;
    TimeField4: TTimeField;
    IntegerField3: TIntegerField;
    TimeField5: TTimeField;
    btnRepetir: TBitBtn;
    dbchkPOSSUI_ESCALA: TDBCheckBox;
    procedure PageControlChange(Sender: TObject);
    procedure cdsHORARIO_DETALHENewRecord(DataSet: TDataSet);
    procedure dtsTabelaDataChange(Sender: TObject; Field: TField);
    procedure cdsHORARIO_DETALHEBeforePost(DataSet: TDataSet);
    procedure cdsHORARIO_DETALHEAfterPost(DataSet: TDataSet);
    procedure btnRepetirClick(Sender: TObject);
  private
    procedure CriarClientDiaSemana;
    function Validar: Boolean;
    { Private declarations }
  public
    procedure BeforeDestruction; override;
    procedure AfterConstruction; override;
    { Public declarations }

  end;

var
  frmCadastro_Horario: TfrmCadastro_Horario;

implementation

uses uDM_Cadastro_Horario, LIB, uCadastro_Horario_RepetirHorarios;

{$R *.dfm}

{ TfrmCadastro_Horario }
procedure TfrmCadastro_Horario.CriarClientDiaSemana();
var
  i : Integer;
begin
  cdsDiaSemana.CreateDataSet;
  for i := 1 to 7 do
    cdsDiaSemana.AppendRecord([i, DiaSemana(i)]);
end;


procedure TfrmCadastro_Horario.AfterConstruction;
begin
  inherited;
  DM_Cadastro_Horario    := TDM_Cadastro_Horario.Create(Self);
  cdsTabela.RemoteServer := DM_Cadastro_Horario.DCOMCon_Horario;
  CriarClientDiaSemana();
end;

procedure TfrmCadastro_Horario.BeforeDestruction;
begin
  inherited;
  FreeAndNil( DM_Cadastro_Horario );
end;

procedure TfrmCadastro_Horario.PageControlChange(Sender: TObject);
begin
  inherited;

  cdsHORARIO_DETALHE.Close;
  if PageControl.ActivePage = tsDetalhe then
  begin
    cdsHORARIO_DETALHE.Params.ParamByName('ID_HORARIO').AsInteger := cdsTabelaID_HORARIO.AsInteger;
    cdsHORARIO_DETALHE.Active := True;
  end;
end;

procedure TfrmCadastro_Horario.cdsHORARIO_DETALHENewRecord(
  DataSet: TDataSet);
begin
  cdsHORARIO_DETALHE.FieldByName('ID_HORARIO').AsInteger := cdsTabelaID_HORARIO.AsInteger;
  inherited;
end;

procedure TfrmCadastro_Horario.dtsTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  grdHorario.Enabled := (cdsTabela.State in [dsInsert, dsEdit]);
  btnRepetir.Enabled := (cdsTabela.State in [dsInsert, dsEdit]);
end;

function TfrmCadastro_Horario.Validar(): Boolean;
begin
  Result := False;

  cdsHORARIO_DETALHEFind.Close;
  cdsHORARIO_DETALHEFind.Params.ParamByName('ID_HORARIO').AsInteger := cdsTabelaID_HORARIO.AsInteger;
  cdsHORARIO_DETALHEFind.Active := True;

  if cdsHORARIO_DETALHEFind.Locate('DIA_SEMANA', VarArrayOf([cdsHORARIO_DETALHE.FieldByName('DIA_SEMANA').AsInteger]), []) then
  begin
    Aviso('Dia da semana já foi informado. Verifique!');
    Exit;
  end;

  if (cdsHORARIO_DETALHEENTRADA.AsDateTime = 0) then
  begin
    Aviso('Horário de entrada não pode estar vazio. Verifique!');
    Exit;
  end;

  if (cdsHORARIO_DETALHESAIDA.AsDateTime = 0) then
  begin
    Aviso('Horário de saida não pode estar vazio. Verifique!');
    Exit;
  end;

  if (cdsHORARIO_DETALHEENTRADA.AsDateTime >= cdsHORARIO_DETALHESAIDA.AsDateTime) then
  begin
    Aviso('Horário de entrada não pode ser maior ou igual que o horário de saida. Verifique!');
    Exit;
  end;

  if (cdsHORARIO_DETALHEALMOCO_INICIO.AsDateTime > 0) and
     (cdsHORARIO_DETALHEALMOCO_FIM.AsDateTime > 0) and
     ((cdsHORARIO_DETALHEALMOCO_FIM.AsDateTime - cdsHORARIO_DETALHEALMOCO_INICIO.AsDateTime) < StrToTime('00:30')) then
  begin
    Aviso('Horário de almoço deve ser maior que 30 minutos. Verifique!');
    Exit;
  end;  

  if (cdsHORARIO_DETALHEALMOCO_INICIO.AsDateTime > 0) and
     (cdsHORARIO_DETALHEALMOCO_FIM.AsDateTime > 0) and
     (cdsHORARIO_DETALHEALMOCO_INICIO.AsDateTime > cdsHORARIO_DETALHEALMOCO_FIM.AsDateTime) then
  begin
    Aviso('Horário de inicio do almoço não pode ser maior que o horário do fim do almoço. Verifique!');
    Exit;
  end;

  Result := True;
end;

procedure TfrmCadastro_Horario.cdsHORARIO_DETALHEBeforePost(
  DataSet: TDataSet);
begin
  if not Validar() then
    Abort;
    
  inherited;

  if (cdsHORARIO_DETALHEALMOCO_INICIO.AsDateTime <> 0) and
     (cdsHORARIO_DETALHEALMOCO_FIM.AsDateTime <> 0) then
    begin
      cdsHORARIO_DETALHEHORAS_A_TRABALHAR.AsDateTime := (cdsHORARIO_DETALHEALMOCO_INICIO.AsDateTime - cdsHORARIO_DETALHEENTRADA.AsDateTime) +
        (cdsHORARIO_DETALHESAIDA.AsDateTime - cdsHORARIO_DETALHEALMOCO_FIM.AsDateTime);
    end
  else
    cdsHORARIO_DETALHEHORAS_A_TRABALHAR.AsDateTime := (cdsHORARIO_DETALHESAIDA.AsDateTime - cdsHORARIO_DETALHEENTRADA.AsDateTime);
end;

procedure TfrmCadastro_Horario.cdsHORARIO_DETALHEAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  cdsHORARIO_DETALHE.ApplyUpdates(0);
end;

procedure TfrmCadastro_Horario.btnRepetirClick(Sender: TObject);
begin
  inherited;

  frmRepetirHorarios := TfrmRepetirHorarios.Create(nil);
  frmRepetirHorarios.IdHorario := cdsTabelaID_HORARIO.AsInteger;
  frmRepetirHorarios.ShowModal;
  FreeAndNil(frmRepetirHorarios);

  cdsHORARIO_DETALHE.Close;
  cdsHORARIO_DETALHE.Params.ParamByName('ID_HORARIO').AsInteger := cdsTabelaID_HORARIO.AsInteger;
  cdsHORARIO_DETALHE.Active := True;
end;

end.

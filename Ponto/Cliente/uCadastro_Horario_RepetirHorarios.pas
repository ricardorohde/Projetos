unit uCadastro_Horario_RepetirHorarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxMaskEdit, cxSpinEdit, cxTimeEdit,
  Menus, cxButtons, Buttons, DB, DBClient;

type
  TfrmRepetirHorarios = class(TForm)
    Panel1: TPanel;
    chkSegunda: TCheckBox;
    chkTerca: TCheckBox;
    chkQuarta: TCheckBox;
    chkQuinta: TCheckBox;
    chkSabado: TCheckBox;
    chkSexta: TCheckBox;
    chkDomingo: TCheckBox;
    Panel2: TPanel;
    Panel3: TPanel;
    edtEntrada: TcxTimeEdit;
    Label1: TLabel;
    edtInicioAlmoco: TcxTimeEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtFimAlmoco: TcxTimeEdit;
    Label4: TLabel;
    edtSaida: TcxTimeEdit;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    cdsHORARIO_DETALHE: TClientDataSet;
    cdsHORARIO_DETALHEID_HORARIO_DETALHE: TIntegerField;
    cdsHORARIO_DETALHEID_HORARIO: TIntegerField;
    cdsHORARIO_DETALHEENTRADA: TTimeField;
    cdsHORARIO_DETALHEALMOCO_INICIO: TTimeField;
    cdsHORARIO_DETALHEALMOCO_FIM: TTimeField;
    cdsHORARIO_DETALHESAIDA: TTimeField;
    cdsHORARIO_DETALHEDIA_SEMANA: TIntegerField;
    cdsHORARIO_DETALHEHORAS_A_TRABALHAR: TTimeField;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    FIdHorario: Integer;
    function Validar(): Boolean;
    procedure SetIdHorario(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }
    property IdHorario : Integer read FIdHorario write SetIdHorario;
    procedure BeforeDestruction; override;
    procedure AfterConstruction; override;
  end;

var
  frmRepetirHorarios: TfrmRepetirHorarios;

implementation

uses uCadastro_Horario, LIB, uDM_Cadastro_Horario;

{$R *.dfm}

function TfrmRepetirHorarios.Validar(): Boolean;
begin
  Result := False;

  if (edtEntrada.EditValue = 0) then
  begin
    Aviso('Horário de entrada não pode estar vazio. Verifique!');
    edtEntrada.SetFocus;
    Exit;
  end;

  if (edtSaida.EditValue = 0) then
  begin
    Aviso('Horário de saida não pode estar vazio. Verifique!');
    edtSaida.SetFocus;
    Exit;
  end;

  if (edtEntrada.EditValue >= edtSaida.EditValue) then
  begin
    Aviso('Horário de entrada não pode ser maior ou igual que o horário de saida. Verifique!');
    edtEntrada.SetFocus;
    Exit;
  end;

  if (edtInicioAlmoco.EditValue > 0) and (edtFimAlmoco.EditValue > 0) and
     ((edtFimAlmoco.EditValue - edtInicioAlmoco.EditValue) < StrToTime('00:30')) then
  begin
    Aviso('Horário de almoço deve ser maior que 30 minutos. Verifique!');
    edtFimAlmoco.SetFocus;
    Exit;
  end;

  if (edtInicioAlmoco.EditValue > 0) and (edtFimAlmoco.EditValue > 0) and
     (edtInicioAlmoco.EditValue > edtFimAlmoco.EditValue) then
  begin
    Aviso('Horário de inicio do almoço não pode ser maior que o horário do fim do almoço. Verifique!');
    edtInicioAlmoco.SetFocus;
    Exit;
  end;  

  Result := True;
end;

procedure TfrmRepetirHorarios.btnOkClick(Sender: TObject);
var
  i                  : Integer;
  liDiaSemana        : Integer;
  lHorario_Trabalhar : TTime;
begin
  if not Validar() then
    Exit;

  if (edtInicioAlmoco.EditValue <> 0) and
     (edtFimAlmoco.EditValue <> 0) then
    begin
      lHorario_Trabalhar := (edtInicioAlmoco.EditValue - edtEntrada.EditValue) +
        (edtSaida.EditValue - edtFimAlmoco.EditValue);
    end
  else
    lHorario_Trabalhar := (edtSaida.EditValue - edtEntrada.EditValue);

  for i := 0 to ComponentCount -1 do
  begin
    if (Components[i] is TCheckBox) and
       (TCheckBox(Components[i]).Tag > 0) and
        TCheckBox(Components[i]).Checked then
    begin
      liDiaSemana := TCheckBox(Components[i]).Tag;
      cdsHORARIO_DETALHE.First;
      if not cdsHORARIO_DETALHE.Locate('ID_HORARIO;DIA_SEMANA', VarArrayOf([FIdHorario, liDiaSemana]), []) then
        cdsHORARIO_DETALHE.Append
      else
        cdsHORARIO_DETALHE.Edit;

      cdsHORARIO_DETALHE.FieldByName('ID_HORARIO').AsInteger         := FIdHorario;
      cdsHORARIO_DETALHE.FieldByName('DIA_SEMANA').AsInteger         := TCheckBox(Components[i]).Tag;
      cdsHORARIO_DETALHE.FieldByName('ENTRADA').AsDateTime           := edtEntrada.EditValue;
      if edtInicioAlmoco.EditValue <> 0 then
        cdsHORARIO_DETALHE.FieldByName('ALMOCO_INICIO').AsDateTime := edtInicioAlmoco.EditValue
      else
        cdsHORARIO_DETALHE.FieldByName('ALMOCO_INICIO').Clear;

      if edtInicioAlmoco.EditValue <> 0 then
        cdsHORARIO_DETALHE.FieldByName('ALMOCO_FIM').AsDateTime := edtFimAlmoco.EditValue
      else
        cdsHORARIO_DETALHE.FieldByName('ALMOCO_FIM').Clear;

      cdsHORARIO_DETALHE.FieldByName('SAIDA').AsDateTime             := edtSaida.EditValue;
      cdsHORARIO_DETALHE.FieldByName('HORAS_A_TRABALHAR').AsDateTime := lHorario_Trabalhar;
      cdsHORARIO_DETALHE.Post;
      cdsHORARIO_DETALHE.ApplyUpdates(0);
    end;
  end;
  Close;
end;

procedure TfrmRepetirHorarios.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRepetirHorarios.SetIdHorario(const Value: Integer);
begin
  FIdHorario := Value;
end;

procedure TfrmRepetirHorarios.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    Perform(Wm_NextDlgCtl,0,0);
end;

procedure TfrmRepetirHorarios.AfterConstruction;
begin
  inherited;
  DM_Cadastro_Horario             := TDM_Cadastro_Horario.Create(Self);
  cdsHORARIO_DETALHE.RemoteServer := DM_Cadastro_Horario.DCOMCon_Horario;
end;

procedure TfrmRepetirHorarios.BeforeDestruction;
begin
  inherited;
  FreeAndNil( DM_Cadastro_Horario );
end;

procedure TfrmRepetirHorarios.FormShow(Sender: TObject);
begin
  cdsHORARIO_DETALHE.Close;
  cdsHORARIO_DETALHE.Params.ParamByName('ID_HORARIO').AsInteger := FIdHorario;
  cdsHORARIO_DETALHE.Active := True;
end;

end.

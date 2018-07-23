{ ********************************************************************* }
{ }
{ TRS Sistemas - Runtime Library Functions }
{ }
{ Copyright(c) 2006-2012 TRS Sistemas e Soluções em Informática Ltda. }
{ }
{ Author: Thiago Rodrigo da Silva }
{ ********************************************************************* }
{ Geração de Borderôs de Remessa }
{ }
{ ********************************************************************* }
{ Data última alteração: }
{ Últimas alterações: }
{ }
{ ********************************************************************* }

unit uGeracao_Borderos_Remessa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, StdCtrls, ExtCtrls, Buttons, Mask, DBCtrls,
  uInput_Params, uTypes, uLibrary, uRecError, DSConnect, PngSpeedButton;

type
  TfrmGeracao_Borderos_Remessa = class(TfrmInput_Params)
    Label23: TLabel;
    dbedtEmissaoDe: TDBEdit;
    Label11: TLabel;
    dbedtEmissaoAte: TDBEdit;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    dbedtBorderoAte: TDBEdit;
    Label1: TLabel;
    dbedtBorderoDe: TDBEdit;
    Label2: TLabel;
    dtsBorderos: TDataSource;
    cdsBorderos: TClientDataSet;
    dbcboCarteira: TDBComboBox;
    Label8: TLabel;
    cdsPerguntasCARTEIRA: TStringField;
    cdsPerguntasBORDERODE: TIntegerField;
    cdsPerguntasBORDEROATE: TIntegerField;
    cdsPerguntasEMISSAODE: TDateField;
    cdsPerguntasEMISSAOATE: TDateField;
    dbedtNomeBanco: TDBEdit;
    spdBancos: TSpeedButton;
    dbedtConta: TDBEdit;
    dbedtAgencia: TDBEdit;
    dbedtBanco: TDBEdit;
    Label6: TLabel;
    cdsPerguntasBANCO: TIntegerField;
    cdsPerguntasAGENCIA: TStringField;
    cdsPerguntasCONTA: TStringField;
    cdsPerguntasNOMEBANCO: TStringField;
    dspcBorderos: TDSProviderConnection;
    procedure dtsPerguntasDataChange(Sender: TObject; Field: TField);
    procedure btnConfirmarClick(Sender: TObject);
    procedure cdsPerguntasEditError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsPerguntasPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsContas_ReceberReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure spdClientesDeClick(Sender: TObject);
    procedure spdClientesAteClick(Sender: TObject);
    procedure spdBancosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbedtEmissaoDeChange(Sender: TObject);
  private
  public
    procedure ShowFields; override;
  end;

var
  frmGeracao_Borderos_Remessa: TfrmGeracao_Borderos_Remessa;

implementation

uses uDMMain, uClientes, uBancos, uFornecedores, uSeleciona_Titulos_Remessa;

{$R *.dfm}

procedure TfrmGeracao_Borderos_Remessa.cdsContas_ReceberReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TfrmGeracao_Borderos_Remessa.cdsPerguntasEditError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  __SuperClass.GenericsF.ShowException(E);
  Action := daAbort;
end;

procedure TfrmGeracao_Borderos_Remessa.cdsPerguntasPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  __SuperClass.GenericsF.ShowException(E);
  Action := daAbort;
end;

procedure TfrmGeracao_Borderos_Remessa.btnConfirmarClick(Sender: TObject);
var
  TOwner: TUEntityOwnerArray;
  SQL: WideString;
begin
  inherited;
  try
    with btnConfirmar do
      Enabled := False;
    with btnCancelar do
      Enabled := False;

    SetLength(TOwner, 2);
    TOwner[0].Name := 'BANCOS';
    TOwner[1].Name := 'BORDEROS_DADOS';
    __SuperClass.DBFunctions.GetEntityOwner(TOwner);

    SQL := 'SELECT';
    if (cdsPerguntasCARTEIRA.AsString = MB_CONTAS_PAGAR) then
      SQL := SQL + ' ''0'' AS CARTEIRA,'
    else
      SQL := SQL + ' ''1'' AS CARTEIRA,';
    SQL := SQL + ' ''0'' AS SELECIONADO,';
    SQL := SQL + ' BORDEROS_DADOS.EMPRESA,';
    SQL := SQL + ' BORDEROS_DADOS.FILIAL,';
    SQL := SQL + ' BORDEROS_DADOS.NUMERO,';
    SQL := SQL + ' BORDEROS_DADOS.EMISSAO,';
    SQL := SQL + ' BORDEROS_DADOS.DATACRIACAO,';
    SQL := SQL + ' BORDEROS_DADOS.BANCO,';
    SQL := SQL + ' BORDEROS_DADOS.AGENCIA,';
    SQL := SQL + ' BORDEROS_DADOS.CONTA,';
    SQL := SQL + ' BORDEROS_DADOS.QUANTIDADE,';
    SQL := SQL + ' BORDEROS_DADOS.VALORTOTAL,';
    SQL := SQL + ' BANCOS.EMPRESA AS EMPRESA_BANCOS, ';
    SQL := SQL + ' BANCOS.FILIAL AS FILIAL_BANCOS, ';
    SQL := SQL + ' BANCOS.CODIGO,';
    SQL := SQL + ' BANCOS.DVAGENCIA, ';
    SQL := SQL + ' BANCOS.DVCONTA, ';
    SQL := SQL + ' BANCOS.GERANOSSONUMERO,';
    SQL := SQL + ' BANCOS.EMITEBOLETO,';
    SQL := SQL + ' BANCOS.INICIONUMERO,';
    SQL := SQL + ' BANCOS.PROXIMONUMERO,';
    SQL := SQL + ' BANCOS.VARIACAOCARTEIRA,';
    SQL := SQL + ' BANCOS.FIMNUMERO,';
    SQL := SQL + ' BANCOS.INSTRUCAOBANCARIA,';
    SQL := SQL + ' BANCOS.DEMONSTRATIVO,';
    SQL := SQL + ' BANCOS.DOCUMENTOINTERNO,';
    SQL := SQL + ' BANCOS.LICENCACOBREBEMX,';
    SQL := SQL + ' BANCOS.JUNTAAGREGADOS,';
    SQL := SQL + ' BANCOS.CODIGOCEDENTE,';
    SQL := SQL + ' BANCOS.SIGLACEDENTE,';
    SQL := SQL + ' BANCOS.NOTIFICAEMAIL,';
    SQL := SQL + ' BANCOS.DIASPROTESTO,';
    SQL := SQL + ' BANCOS.DVAGENCIA,';
    SQL := SQL + ' BANCOS.DVCONTA, ';
    SQL := SQL + ' BANCOS.INSTRUCAOCOBRANCA1,';
    SQL := SQL + ' BANCOS.INSTRUCAOCOBRANCA2,';
    SQL := SQL + ' BANCOS.INSTRUCAOCOBRANCA3, ';
    SQL := SQL + ' BANCOS.OBSERVACAO ';
    SQL := SQL + ' FROM BORDEROS_DADOS';
    SQL := SQL + ' INNER JOIN BANCOS ON';
    SQL := SQL + '  (';
    SQL := SQL + '    BANCOS.EMPRESA = :EMPRESA_BANCOS';
    SQL := SQL + '    AND BANCOS.FILIAL = :FILIAL_BANCOS';
    SQL := SQL + '    AND BANCOS.CODIGO = BORDEROS_DADOS.BANCO';
    SQL := SQL + '    AND BANCOS.AGENCIA = BORDEROS_DADOS.AGENCIA';
    SQL := SQL + '    AND BANCOS.CONTA = BORDEROS_DADOS.CONTA';
    SQL := SQL + '  ) ';
    SQL := SQL + ' WHERE  BORDEROS_DADOS.EMPRESA  = :EMPRESA_BORDEROS';
    SQL := SQL + ' AND    BORDEROS_DADOS.FILIAL   = :FILIAL_BORDEROS';
    SQL := SQL + ' AND    BORDEROS_DADOS.EMISSAO BETWEEN :EMISSAODE AND :EMISSAOATE';
    SQL := SQL + ' AND    BORDEROS_DADOS.NUMERO BETWEEN :BORDERODE AND :BORDEROATE';
    SQL := SQL + ' AND    ((BORDEROS_DADOS.ARQUIVO IS NULL) OR (BORDEROS_DADOS.ARQUIVO =''''))';
    SQL := SQL + ' AND    BORDEROS_DADOS.GERACAOARQUIVO IS NULL';
    SQL := SQL + ' AND    BORDEROS_DADOS.BANCO    = :BANCO';
    SQL := SQL + ' AND    BORDEROS_DADOS.AGENCIA  = :AGENCIA';
    SQL := SQL + ' AND    BORDEROS_DADOS.CONTA    = :CONTA';
    SQL := SQL + ' ORDER BY BORDEROS_DADOS.NUMERO';

    with cdsBorderos, cdsBorderos.Params do
    begin
      CommandText := SQL;

      with ParamByName('EMPRESA_BANCOS') do
      begin
        DataType := ftString;
        ParamType := ptInput;
        AsString := TOwner[0].Company;
      end;
      with ParamByName('FILIAL_BANCOS') do
      begin
        DataType := ftString;
        ParamType := ptInput;
        AsString := TOwner[0].Branch;
      end;

      with ParamByName('EMPRESA_BORDEROS') do
      begin
        DataType := ftString;
        ParamType := ptInput;
        AsString := TOwner[1].Company;
      end;
      with ParamByName('FILIAL_BORDEROS') do
      begin
        DataType := ftString;
        ParamType := ptInput;
        AsString := TOwner[1].Branch;
      end;

      with ParamByName('EMISSAODE') do
      begin
        DataType := ftDateTime;
        ParamType := ptInput;
        AsDate := cdsPerguntasEMISSAODE.AsDateTime;
      end;
      with ParamByName('EMISSAOATE') do
      begin
        DataType := ftDateTime;
        ParamType := ptInput;
        AsDate := cdsPerguntasEMISSAOATE.AsDateTime;
      end;

      with ParamByName('BORDERODE') do
      begin
        DataType := ftInteger;
        ParamType := ptInput;
        AsInteger := cdsPerguntasBORDERODE.AsInteger;
      end;
      with ParamByName('BORDEROATE') do
      begin
        DataType := ftInteger;
        ParamType := ptInput;
        AsInteger := cdsPerguntasBORDEROATE.AsInteger;
      end;

      with ParamByName('BANCO') do
      begin
        DataType := ftInteger;
        ParamType := ptInput;
        AsInteger := cdsPerguntasBANCO.AsInteger;
      end;
      with ParamByName('AGENCIA') do
      begin
        DataType := ftString;
        ParamType := ptInput;
        AsString := cdsPerguntasAGENCIA.AsString;
      end;
      with ParamByName('CONTA') do
      begin
        DataType := ftString;
        ParamType := ptInput;
        AsString := cdsPerguntasCONTA.AsString;
      end;
    end;

    Screen.Cursor := crSQLWait;
    Application.ProcessMessages;

    __SuperClass.DBFunctions.OpenDataSet(cdsBorderos, False, False, -1);

    Screen.Cursor := crArrow;
    Application.ProcessMessages;

    if cdsBorderos.IsEmpty then
      __SuperClass.GenericsF.DisplayMessage('Não existem dados a serem exibidos.', '', 'Verifique o filtro informado.',
        'Informação', MB_ICONEXCLAMATION)
    else
    begin
      TNumericField(cdsBorderos.FieldByName('VALORTOTAL')).DisplayFormat := '###,###,##0.00';
      TNumericField(cdsBorderos.FieldByName('NUMERO')).DisplayFormat := '00000';
      TNumericField(cdsBorderos.FieldByName('QUANTIDADE')).DisplayFormat := '000';

      frmSeleciona_Titulos_Remessa := TfrmSeleciona_Titulos_Remessa.Create(Self);
      try
        with frmSeleciona_Titulos_Remessa do
        begin
          cdsBorderos := Self.cdsBorderos;
          dtsBorderos := Self.dtsBorderos;
          ShowModal;
        end;
      finally
        FreeAndNil(frmSeleciona_Titulos_Remessa);
      end;
    end;

    __SuperClass.DBFunctions.CloseDataSet(cdsBorderos);
  finally
    with btnConfirmar do
      Enabled := True;
    with btnCancelar do
      Enabled := True;
  end;
end;

procedure TfrmGeracao_Borderos_Remessa.ShowFields;
begin
  inherited;
  with dbcboCarteira do
    ItemIndex := Items.IndexOfName(cdsPerguntasCARTEIRA.AsString);
end;

procedure TfrmGeracao_Borderos_Remessa.spdClientesDeClick(Sender: TObject);
var
  AFields: TUStringArray;
  SFields: TUStringArray;
begin
  inherited;

  if (cdsPerguntasCARTEIRA.AsString = MB_CONTAS_PAGAR) then
  begin
    frmFornecedores := TfrmFornecedores.Create(Self);
    try
      SetLength(AFields, 2);
      AFields[0] := 'PROPRIETARIODE';
      AFields[1] := 'NOMEPROPRIETARIODE';

      SetLength(SFields, 2);
      SFields[0] := 'CODIGO';
      SFields[1] := 'REDUZIDO';

      __SuperClass.DBFunctions.ApplyFieldsInDataSet(frmFornecedores, frmFornecedores.cdsFornecedores,
        frmFornecedores.dtsFornecedores, cdsPerguntas, AFields, SFields);
    finally
      FreeAndNil(frmFornecedores);
    end;
  end else if (cdsPerguntasCARTEIRA.AsString = MB_CONTAS_RECEBER) then
  begin
    frmClientes := TfrmClientes.Create(Self);
    try
      SetLength(AFields, 2);
      AFields[0] := 'PROPRIETARIODE';
      AFields[1] := 'NOMEPROPRIETARIODE';

      SetLength(SFields, 2);
      SFields[0] := 'CODIGO';
      SFields[1] := 'REDUZIDO';

      __SuperClass.DBFunctions.ApplyFieldsInDataSet(frmClientes, frmClientes.cdsClientes, frmClientes.dtsClientes, cdsPerguntas,
        AFields, SFields);
    finally
      FreeAndNil(frmClientes);
    end;
  end else begin
    __SuperClass.GenericsF.DisplayMessage('Favor selecionar o tipo de cobrança.', '', 'Verifique o filtro informado.',
      'Informação', MB_ICONEXCLAMATION);
    dbcboCarteira.SetFocus;
  end;

end;

procedure TfrmGeracao_Borderos_Remessa.spdBancosClick(Sender: TObject);
var
  AFields: TUStringArray;
  SFields: TUStringArray;
begin
  inherited;
  frmBancos := TfrmBancos.Create(Self);
  try
    SetLength(AFields, 4);
    AFields[0] := 'BANCO';
    AFields[1] := 'AGENCIA';
    AFields[2] := 'CONTA';
    AFields[3] := 'NOMEBANCO';

    SetLength(SFields, 4);
    SFields[0] := 'CODIGO';
    SFields[1] := 'AGENCIA';
    SFields[2] := 'CONTA';
    SFields[3] := 'REDUZIDO';
    __SuperClass.DBFunctions.ApplyFieldsInDataSet(frmBancos, frmBancos.cdsBancos, frmBancos.dtsBancos, cdsPerguntas,
      AFields, SFields);
  finally
    FreeAndNil(frmBancos);
  end;
end;

procedure TfrmGeracao_Borderos_Remessa.spdClientesAteClick(Sender: TObject);
var
  AFields: TUStringArray;
  SFields: TUStringArray;
begin
  inherited;

  if (cdsPerguntasCARTEIRA.AsString = MB_CONTAS_PAGAR) then
  begin
    frmFornecedores := TfrmFornecedores.Create(Self);
    try
      SetLength(AFields, 2);
      AFields[0] := 'PROPRIETARIOATE';
      AFields[1] := 'NOMEPROPRIETARIOATE';

      SetLength(SFields, 2);
      SFields[0] := 'CODIGO';
      SFields[1] := 'REDUZIDO';
      __SuperClass.DBFunctions.ApplyFieldsInDataSet(frmFornecedores, frmFornecedores.cdsFornecedores,
        frmFornecedores.dtsFornecedores, cdsPerguntas, AFields, SFields);
    finally
      FreeAndNil(frmFornecedores);
    end;
  end else if (cdsPerguntasCARTEIRA.AsString = MB_CONTAS_RECEBER) then
  begin
    frmClientes := TfrmClientes.Create(Self);
    try
      SetLength(AFields, 2);
      AFields[0] := 'PROPRIETARIOATE';
      AFields[1] := 'NOMEPROPRIETARIOATE';

      SetLength(SFields, 2);
      SFields[0] := 'CODIGO';
      SFields[1] := 'REDUZIDO';
      __SuperClass.DBFunctions.ApplyFieldsInDataSet(frmClientes, frmClientes.cdsClientes, frmClientes.dtsClientes, cdsPerguntas,
        AFields, SFields);
    finally
      FreeAndNil(frmClientes);
    end;
  end else begin
    __SuperClass.GenericsF.DisplayMessage('Favor selecionar o tipo de cobrança.', '', 'Verifique o filtro informado.',
      'Informação', MB_ICONEXCLAMATION);
    dbcboCarteira.SetFocus;
  end;
end;

procedure TfrmGeracao_Borderos_Remessa.dbedtEmissaoDeChange(Sender: TObject);
begin
  inherited;
  __SuperClass.DBFunctions.ClearEditMaskField(Sender);
end;

procedure TfrmGeracao_Borderos_Remessa.dtsPerguntasDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  ShowFields;
end;

procedure TfrmGeracao_Borderos_Remessa.FormCreate(Sender: TObject);
begin
  inherited;
  frmGeracao_Borderos_Remessa := Self;
end;

{$REGION 'Inicialização/Finalização da classe'}

initialization

RegisterClass(TfrmGeracao_Borderos_Remessa);

finalization

UnRegisterClass(TfrmGeracao_Borderos_Remessa);
{$ENDREGION}

end.

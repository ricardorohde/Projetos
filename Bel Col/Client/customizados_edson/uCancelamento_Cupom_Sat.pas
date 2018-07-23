unit uCancelamento_Cupom_Sat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uInput_Params, Data.DB,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, PngSpeedButton, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, Datasnap.DSConnect, frxClass, frxDBSet;

type
  TfrmCancelamento_Cupom_Sat = class(TfrmInput_Params)
    cdsPerguntasNUMERO: TIntegerField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    cdsVenda_Balcao_Dados: TClientDataSet;
    dpscRel: TDSProviderConnection;
    cdsVenda_Balcao_DadosEMPRESA: TStringField;
    cdsVenda_Balcao_DadosFILIAL: TStringField;
    cdsVenda_Balcao_DadosNUMERO: TIntegerField;
    cdsVenda_Balcao_DadosSITUACAO: TStringField;
    cdsVenda_Balcao_DadosEMISSAO: TDateField;
    cdsVenda_Balcao_DadosVENDEDOR: TIntegerField;
    cdsVenda_Balcao_DadosCLIENTE: TIntegerField;
    cdsVenda_Balcao_DadosUF: TStringField;
    cdsVenda_Balcao_DadosTIPOENDERECO: TStringField;
    cdsVenda_Balcao_DadosCLIENTEENTREGA: TIntegerField;
    cdsVenda_Balcao_DadosSTATUSENTREGA: TStringField;
    cdsVenda_Balcao_DadosCONDICAOPAGAMENTO: TIntegerField;
    cdsVenda_Balcao_DadosFORMAPAGAMENTO: TStringField;
    cdsVenda_Balcao_DadosTABELA: TIntegerField;
    cdsVenda_Balcao_DadosMOEDA: TStringField;
    cdsVenda_Balcao_DadosTAXA: TFloatField;
    cdsVenda_Balcao_DadosTIPOPRECO: TStringField;
    cdsVenda_Balcao_DadosTRANSPORTADORA: TIntegerField;
    cdsVenda_Balcao_DadosCATEGORIA: TStringField;
    cdsVenda_Balcao_DadosVALORMERCADORIAS: TFloatField;
    cdsVenda_Balcao_DadosDESCONTO: TFloatField;
    cdsVenda_Balcao_DadosVALORDESCONTO: TFloatField;
    cdsVenda_Balcao_DadosCOMISSAO: TFloatField;
    cdsVenda_Balcao_DadosBASECOMISSAO: TFloatField;
    cdsVenda_Balcao_DadosVALORCOMISSAO: TFloatField;
    cdsVenda_Balcao_DadosTIPOFRETE: TStringField;
    cdsVenda_Balcao_DadosVALORFRETE: TFloatField;
    cdsVenda_Balcao_DadosVALORSEGURO: TFloatField;
    cdsVenda_Balcao_DadosDESPESAS: TFloatField;
    cdsVenda_Balcao_DadosVALORDESPESAS: TFloatField;
    cdsVenda_Balcao_DadosVOLUMES: TFloatField;
    cdsVenda_Balcao_DadosESPECIE: TStringField;
    cdsVenda_Balcao_DadosMARCA: TStringField;
    cdsVenda_Balcao_DadosPESOLIQUIDO: TFloatField;
    cdsVenda_Balcao_DadosPESOBRUTO: TFloatField;
    cdsVenda_Balcao_DadosVALORFINANCEIRO: TFloatField;
    cdsVenda_Balcao_DadosVALORBRUTO: TFloatField;
    cdsVenda_Balcao_DadosORIGEM: TStringField;
    cdsVenda_Balcao_DadosNUMEROINTERNO: TStringField;
    cdsVenda_Balcao_DadosVALORLIQUIDO: TFloatField;
    cdsVenda_Balcao_DadosVALORRECEBIDO: TFloatField;
    cdsVenda_Balcao_DadosVALORTROCO: TFloatField;
    cdsVenda_Balcao_DadosBASEIPI: TFloatField;
    cdsVenda_Balcao_DadosVALORIPI: TFloatField;
    cdsVenda_Balcao_DadosBASEICMS: TFloatField;
    cdsVenda_Balcao_DadosVALORICMS: TFloatField;
    cdsVenda_Balcao_DadosVALORICMSST: TFloatField;
    cdsVenda_Balcao_DadosBASEICMSST: TFloatField;
    cdsVenda_Balcao_DadosBASEISSA: TFloatField;
    cdsVenda_Balcao_DadosVALORISSA: TFloatField;
    cdsVenda_Balcao_DadosBASEISSR: TFloatField;
    cdsVenda_Balcao_DadosVALORISSR: TFloatField;
    cdsVenda_Balcao_DadosBASEPISA: TFloatField;
    cdsVenda_Balcao_DadosVALORPISA: TFloatField;
    cdsVenda_Balcao_DadosBASECOFINSA: TFloatField;
    cdsVenda_Balcao_DadosVALORCOFINSA: TFloatField;
    cdsVenda_Balcao_DadosBASEIRRFA: TFloatField;
    cdsVenda_Balcao_DadosVALORIRRFA: TFloatField;
    cdsVenda_Balcao_DadosBASEIRRFR: TFloatField;
    cdsVenda_Balcao_DadosVALORIRRFR: TFloatField;
    cdsVenda_Balcao_DadosBASEINSSA: TFloatField;
    cdsVenda_Balcao_DadosVALORINSSA: TFloatField;
    cdsVenda_Balcao_DadosBASEINSSR: TFloatField;
    cdsVenda_Balcao_DadosVALORINSSR: TFloatField;
    cdsVenda_Balcao_DadosESTACAO: TIntegerField;
    cdsVenda_Balcao_DadosPREFIXOECF: TStringField;
    cdsVenda_Balcao_DadosNUMEROECF: TStringField;
    cdsVenda_Balcao_DadosCNPJCPF: TStringField;
    cdsVenda_Balcao_DadosOBSERVACAO: TStringField;
    cdsVenda_Balcao_DadosESPECIEDOCUMENTO: TStringField;
    cdsVenda_Balcao_DadosBASETRIBUTOS: TFloatField;
    cdsVenda_Balcao_DadosVALORTRIBUTOS: TFloatField;
    cdsVenda_Balcao_DadosDATACRIACAO: TSQLTimeStampField;
    cdsVenda_Balcao_DadosADICIONAIS: TStringField;
    cdsVenda_Balcao_DadosHORATRANSMISSAO: TTimeField;
    cdsVenda_Balcao_DadosDATATRANSMISSAO: TDateField;
    cdsVenda_Balcao_DadosARQUIVOCFESAT: TMemoField;
    cdsVenda_Balcao_DadosQRCODE: TMemoField;
    cdsVenda_Balcao_DadosIDCFE: TStringField;
    cdsVenda_Balcao_DadosIMGQRCODE: TBlobField;
    cdsVenda_Balcao_DadosQRCODECANCELAMENTO: TMemoField;
    cdsVenda_Balcao_DadosIDCFECANCELAMENTO: TStringField;
    fdbVenda_Balcao_Dados: TfrxDBDataset;
    cdsVenda_Balcao_DadosHORATRANSMISSAOCANCELAMENTO: TTimeField;
    cdsVenda_Balcao_DadosDATATRANSMISSAOCANCELAMENTO: TDateField;
    cdsVenda_Balcao_DadosARQUIVOCFESATCANCELAMENTO: TMemoField;
    frxReport1: TfrxReport;
    cdsVenda_Balcao_DadosXMLCANCELAMENTOCFE: TMemoField;
    cdsVenda_Balcao_DadosSERIESAT: TIntegerField;
    procedure btnConfirmarClick(Sender: TObject);
    procedure cdsVenda_Balcao_DadosReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsVenda_Balcao_DadosPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
  private
    procedure EfetuaCancelamentoNFCE();
    procedure EfetuaCancelamentoSAT();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCancelamento_Cupom_Sat: TfrmCancelamento_Cupom_Sat;

implementation

uses uDmMain, uTypes, uSat, uInforma_CNPJ_CPF_Cupom, uRecError, uNFCE;
{$R *.dfm}

procedure TfrmCancelamento_Cupom_Sat.EfetuaCancelamentoNFCE();
var
  lNFCE: TNFCE;
begin
  inherited;

  lNFCE:= TNFCE.Create;
  try
    lNFCE.CancelaCupom.CancelaCupom();
  finally
    FreeAndNil( lNFCE );
  end;
end;

procedure TfrmCancelamento_Cupom_Sat.EfetuaCancelamentoSAT();
const
  PIPE = '|';
var
  Cancelamento: TCancelamento;
  ResultadoCancelamento: TSat.TResultado;
begin
  try
    TSat.GetInstance.Cnpj := '16885463000118';
    TSat.GetInstance.Uf := ufSP;

    if StrToBoolDef(VarToStrDef(__SuperClass.DBFunctions.GetParamValue('SV_SAT_HOMOLOGAÇÃO'), 'false'), False) then
    begin
      TSat.GetInstance.Cnpj := '16716114000172'; // cnpj de homologação, Cnpj da Bematech
      TSat.GetInstance.Nome := 'SGR-SAT SISTEMA DE GESTAO E RETAGUARDA DO SAT'; // Assinatura de homologação
    end
    else
    begin
      TSat.GetInstance.Cnpj := '16885463000118'; // Cnpj SoftHouse
      TSat.GetInstance.Nome := VarToStrDef(__SuperClass.DBFunctions.GetParamValue('SV_SAT_ASSINATURA'), EmptyStr);
      // Assinatura criptografada
      { 'VKpp7WxqpKiLGMffpoGR4/YiuPY+EtJv/9uCn06XPlFS2n3+iwwkMEN/GoGxCQnf6emFw+uaAh9nZfzQ/Xr9tV/u432kI7uR9SqHcK7' +
        'Pglwz2I1Frc+e3z3weA1uEmE3B7clMmqMNUiOuHnA5YZeXJw3E4Ud4kLTvkiCznMYkm/SMcYqloN+8Av/hgv2zesmwGxCwELrCIKfss8wgFsne3JVuIz' +
        'UQ2V9EOpDh4/j0gpr7PwfcEAFwdoqvqGejVZnayULftuiGvCnLZA55GHz3ZFHqt04TXm2O+WM3cyQRPzovmlpvydmDsBZ3RM667jfAlP41wvfOJy65rNPVrODvA=='; }
    end;

    TSat.GetInstance.CodigoAtivacao := __SuperClass.DBFunctions.GetParamValue('SV_SAT_CODIGO_ATIVACAO');

    if (cdsVenda_Balcao_DadosIDCFECANCELAMENTO.AsString = EmptyStr) or (cdsVenda_Balcao_DadosIDCFECANCELAMENTO.AsString = #0) then
    begin
      Cancelamento := TCancelamento.Create;
      Cancelamento.NumeroCaixa := __SuperClass.User.StationId;
      Cancelamento.ChaveAcesso := cdsVenda_Balcao_DadosIDCFE.AsString;
      try
        frmInforma_Cpf_Cnpj := TfrmInforma_Cpf_Cnpj.Create(Self);
        if frmInforma_Cpf_Cnpj.ShowModal = mrOk then
        begin
          if frmInforma_Cpf_Cnpj.rbtCpf.Checked then
            Cancelamento.Tipo := Cpf
          else if frmInforma_Cpf_Cnpj.rbtCnpj.Checked then
            Cancelamento.Tipo := Cnpj
          else
            Cancelamento.Tipo := Cpf;
          Cancelamento.CnpjCpf := frmInforma_Cpf_Cnpj.medCpfCnpj.Text;
        end;
      finally
        if Assigned(frmInforma_Cpf_Cnpj) then
          FreeAndNil(frmInforma_Cpf_Cnpj);
      end;

      ResultadoCancelamento := TSat.GetInstance.CancelarVenda(Cancelamento);

      cdsVenda_Balcao_Dados.Edit;
      cdsVenda_Balcao_DadosIDCFECANCELAMENTO.AsString := ResultadoCancelamento.ChaveAcesso;
      cdsVenda_Balcao_DadosDATATRANSMISSAOCANCELAMENTO.AsDateTime := ResultadoCancelamento.Data;
      cdsVenda_Balcao_DadosHORATRANSMISSAOCANCELAMENTO.AsDateTime := ResultadoCancelamento.Hora;
      cdsVenda_Balcao_DadosQRCODECANCELAMENTO.AsString := ResultadoCancelamento.QrCode;
      cdsVenda_Balcao_DadosARQUIVOCFESATCANCELAMENTO.AsString := ResultadoCancelamento.Arquivo;
      cdsVenda_Balcao_DadosXMLCANCELAMENTOCFE.AsString := ResultadoCancelamento.Xml;
      cdsVenda_Balcao_DadosSITUACAO.AsString := VB_CANCELADO;
      cdsVenda_Balcao_Dados.Post;

      cdsVenda_Balcao_Dados.ApplyUpdates(-1);
    end;

    cdsVenda_Balcao_Dados.Edit;
    cdsVenda_Balcao_DadosIMGQRCODE.LoadFromStream(TSat.GetInstance.GerarQRCode(cdsVenda_Balcao_DadosIDCFECANCELAMENTO.AsString +
      PIPE + FormatDateTime('YYYYMMDD', cdsVenda_Balcao_DadosDATATRANSMISSAOCANCELAMENTO.AsDateTime) + FormatDateTime('HHMMSS',
      cdsVenda_Balcao_DadosHORATRANSMISSAOCANCELAMENTO.AsDateTime) + PIPE + StringReplace(FormatFloat('0.00',
      cdsVenda_Balcao_DadosVALORFINANCEIRO.AsFloat), ',', '.', []) + PIPE + cdsVenda_Balcao_DadosCNPJCPF.AsString + PIPE +
      cdsVenda_Balcao_DadosQRCODECANCELAMENTO.AsString));

    TSat.GetInstance.Status;
    cdsVenda_Balcao_DadosSERIESAT.AsString := TSat.GetInstance.Serie;

    cdsVenda_Balcao_Dados.Post;
  finally
    if Assigned(Cancelamento) then
      Cancelamento.Free;
  end;
end;

procedure TfrmCancelamento_Cupom_Sat.btnConfirmarClick(Sender: TObject);
var
  RptPar: Variant;
  LstPar: TMStringArray;
  Preview: Boolean;
  Sql: String;
  Filial: String;
  Empresa: String;
begin
  inherited;
  SetLength(LstPar, 5, 2);
  // Definindo os parâmetros

  __SuperClass.DBFunctions.GetEntityOwner('VENDAS_BALCAO_DADOS', Empresa, Filial);

  Sql := 'select * from VENDAS_BALCAO_DADOS where EMPRESA = :EMPRESA and FILIAL = :FILIAL and NUMERO = :NUMERO and IDCFE is not null';

  cdsVenda_Balcao_Dados.Close;
  cdsVenda_Balcao_Dados.CommandText := Sql;

  cdsVenda_Balcao_Dados.Params.ParamByName('EMPRESA').DataType := ftString;
  cdsVenda_Balcao_Dados.Params.ParamByName('EMPRESA').ParamType := ptInput;
  cdsVenda_Balcao_Dados.Params.ParamByName('EMPRESA').AsString := Empresa;

  cdsVenda_Balcao_Dados.Params.ParamByName('FILIAL').DataType := ftString;
  cdsVenda_Balcao_Dados.Params.ParamByName('FILIAL').ParamType := ptInput;
  cdsVenda_Balcao_Dados.Params.ParamByName('FILIAL').AsString := Filial;

  cdsVenda_Balcao_Dados.Params.ParamByName('NUMERO').DataType := ftInteger;
  cdsVenda_Balcao_Dados.Params.ParamByName('NUMERO').ParamType := ptInput;
  cdsVenda_Balcao_Dados.Params.ParamByName('NUMERO').AsInteger := cdsPerguntasNUMERO.AsInteger;

  cdsVenda_Balcao_Dados.Open;

  if cdsVenda_Balcao_Dados.IsEmpty then
  begin
    __SuperClass.GenericsF.DisplayMessage('Não existem dados a serem exibidos.', '', 'Verifique o filtro informado.',
      'Informação', MB_ICONEXCLAMATION);
    Exit;
  end;

  if VarToStrDef(__SuperClass.DBFunctions.GetParamValue('SV_TIPO_ENVIO_SEFAZ'), '') = 'NFCE' then
    EfetuaCancelamentoNFCE()
  else
    EfetuaCancelamentoSAT();

  Preview := StrToBoolDef(VarToStrDef(__SuperClass.DBFunctions.GetParamValue('SV_PREVIEW_CUPOM'), 'false'), False);

  SetLength(LstPar, 1, 2);
  LstPar[0][0] := '';
  LstPar[0][1] := '';
  // Definindo os parâmetros
  RptPar := VarArrayCreate([0, 3], varVariant);
  RptPar[0] := VarArrayOf(['PARAMETROS', __SuperClass.GenericsF.GetRptFormattedParams(LstPar)]);
  RptPar[1] := VarArrayOf(['_REMETENTE', '']);
  RptPar[2] := VarArrayOf(['_ASSINATURA', __SuperClass.User.FullName]);
  RptPar[3] := VarArrayOf(['_EMAIL', __SuperClass.User.MailAccount]);

  __SuperClass.GenericsF.BuildReport('rptImpressao_Cancelamento_Cupom', 'Cancelamento Cupom Fiscal', RptPar, Preview, nil,
    fdbVenda_Balcao_Dados, true);
end;

procedure TfrmCancelamento_Cupom_Sat.cdsVenda_Balcao_DadosPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  inherited;
  __SuperClass.GenericsF.ShowException(E);
  Action := daAbort;
end;

procedure TfrmCancelamento_Cupom_Sat.cdsVenda_Balcao_DadosReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

{$REGION 'Inicialização/Finalização da classe'}

initialization

RegisterClass(TfrmCancelamento_Cupom_Sat);

finalization

UnRegisterClass(TfrmCancelamento_Cupom_Sat);
{$ENDREGION}

end.

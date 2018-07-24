unit uDM_Cadastro_Funcionario;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect, EMSTable;

type
  TDM_Cadastro_Funcionario = class(TDataModule)
    DCOMCon_Funcionario: TDCOMConnection;
    cdsFuncionario: TClientDataSet;
    cdsFuncionarioID_FUNCIONARIO: TIntegerField;
    cdsFuncionarioCODIGO_EXTERNO: TIntegerField;
    cdsFuncionarioNOME: TWideStringField;
    cdsFuncionarioDATA_NASCIMENTO: TSQLTimeStampField;
    cdsFuncionarioSALARIO: TFloatField;
    cdsFuncionarioEMPRESA_ID: TIntegerField;
    cdsFuncionarioPIS: TWideStringField;
    cdsFuncionarioRG: TWideStringField;
    cdsFuncionarioCTPS: TWideStringField;
    cdsFuncionarioDATA_ADMISSAO: TSQLTimeStampField;
    cdsFuncionarioDATA_DEMISSAO: TSQLTimeStampField;
    cdsFuncionarioCPF: TWideStringField;
    cdsFuncionarioCONFIGURACAO_INDIVIDUAL: TBooleanField;
    cdsFuncionario_Dados_Complementar: TClientDataSet;
    cdsFuncionario_Dados_Pessoais: TClientDataSet;
    cdsFuncionario_Observacao: TClientDataSet;
    cdsFuncionario_Parametros: TClientDataSet;
    cdsFuncionario_Dados_ComplementarID_FUNCIONARIO_DADOS_C: TIntegerField;
    cdsFuncionario_Dados_ComplementarID_FUNCIONARIO: TIntegerField;
    cdsFuncionario_Dados_ComplementarID_HORARIO: TIntegerField;
    cdsFuncionario_Dados_ComplementarID_TIPO_JORNADA: TIntegerField;
    cdsFuncionario_Dados_ComplementarID_JORNADA: TIntegerField;
    cdsFuncionario_Dados_ComplementarINICIO_EXPEDIENTE: TTimeField;
    cdsFuncionario_Dados_ComplementarHORAS_FIXAS: TBooleanField;
    cdsFuncionario_Dados_ComplementarQUANTIDADE_HORAS_FIXAS: TIntegerField;
    cdsFuncionario_Dados_ComplementarID_DIGITAIS: TIntegerField;
    cdsFuncionario_Dados_PessoaisID_FUNCIONARIO_DADOS_P: TIntegerField;
    cdsFuncionario_Dados_PessoaisID_FUNCIONARIO: TIntegerField;
    cdsFuncionario_Dados_PessoaisENDERECO: TWideStringField;
    cdsFuncionario_Dados_PessoaisNUMERO: TIntegerField;
    cdsFuncionario_Dados_PessoaisCOMPLEMENTO: TWideStringField;
    cdsFuncionario_Dados_PessoaisBAIRRO: TWideStringField;
    cdsFuncionario_Dados_PessoaisCEP: TWideStringField;
    cdsFuncionario_Dados_PessoaisCODIGO_MUNICIPIO: TIntegerField;
    cdsFuncionario_Dados_PessoaisTELEFONE: TWideStringField;
    cdsFuncionario_Dados_PessoaisCELULAR: TWideStringField;
    cdsFuncionario_ObservacaoID_FUNCIONARIO_OBSERVACAO: TIntegerField;
    cdsFuncionario_ObservacaoID_FUNCIONARIO: TIntegerField;
    cdsFuncionario_ObservacaoNOME_EXIBICAO: TWideStringField;
    cdsFuncionario_ObservacaoSENHA_RELOGIO: TWideStringField;
    cdsFuncionario_ParametrosID_FUNCIONARIO_PARAMETROS: TIntegerField;
    cdsFuncionario_ParametrosID_FUNCIONARIO: TIntegerField;
    cdsFuncionario_ParametrosPERIODO: TSQLTimeStampField;
    cdsFuncionario_ParametrosTURNOS: TIntegerField;
    cdsFuncionario_ParametrosPAGAMENTO_HE_ANTES_HORARIO: TBooleanField;
    cdsFuncionario_ParametrosPAGAMENTO_HE_DEPOIS_HORARIO: TBooleanField;
    cdsFuncionario_ParametrosTOLERANCIA_HORAEXTRA: TIntegerField;
    cdsFuncionario_ParametrosTOLERANCIA_ATRASO: TIntegerField;
    cdsFuncionario_ParametrosINICIO_EXPEDIENTE: TTimeField;
    cdsFuncionario_ParametrosHORAS_BONIFICACAO: TTimeField;
    cdsFuncionario_ParametrosPORC_HORAS_BONIFICACAO: TIntegerField;
    cdsFuncionario_ParametrosPORC_BONIFICACAO_FERIADO_FOLGA: TIntegerField;
    cdsFuncionario_ParametrosPORC_BONIFICACAO_DEMAIS_HORAS: TIntegerField;
    cdsFuncionario_ParametrosHORA_INICIO_ADICIONALNOTURNO: TIntegerField;
    cdsFuncionario_ParametrosHORA_FIM_ADICIONALNOTURNO: TIntegerField;
    cdsFuncionario_ParametrosDESCONTO_INTERVALO_NOTURNO: TBooleanField;
    cdsFuncionario_ParametrosTRABALHA_BANCOHORAS: TBooleanField;
    cdsFuncionario_ParametrosALMOCO_FLEXIVEL: TBooleanField;
    cdsFuncionario_ParametrosENTRADA_SAIDA_FLEXIVEL: TBooleanField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;

var
  DM_Cadastro_Funcionario: TDM_Cadastro_Funcionario;

implementation

{$R *.dfm}

{ TDM_Cadastro_Funcionario }

procedure TDM_Cadastro_Funcionario.AfterConstruction;
begin
  inherited;
  DCOMCon_Funcionario.ServerName := 'ServidorPonto.RDM_Funcionario';
  DCOMCon_Funcionario.Connected  := True;
end;

end.

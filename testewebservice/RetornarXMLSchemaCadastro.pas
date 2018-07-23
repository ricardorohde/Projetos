
{******************************************************************************************************}
{                                                                                                      }
{                                           XML Data Binding                                           }
{                                                                                                      }
{         Generated on: 04/09/2009 08:35:55                                                            }
{       Generated from: C:\Documents and Settings\Administrator\Desktop\RetornaXMLSchemaCadastro.XML   }
{   Settings stored in: C:\Documents and Settings\Administrator\Desktop\RetornaXMLSchemaCadastro.xdb   }
{                                                                                                      }
{******************************************************************************************************}

unit RetornarXMLSchemaCadastro;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLDsCadastroType = interface;
  IXMLTerminalType = interface;
  IXMLTerminalTypeList = interface;
  IXMLConfiguracaoType = interface;
  IXMLConfiguracaoTypeList = interface;
  IXMLFuncionarioType = interface;
  IXMLFuncionarioTypeList = interface;
  IXMLDigitalType = interface;
  IXMLDigitalTypeList = interface;
  IXMLFuncionarioToleranciaType = interface;
  IXMLFuncionarioToleranciaTypeList = interface;
  IXMLHorarioComplementarType = interface;
  IXMLHorarioComplementarTypeList = interface;
  IXMLHorarioEscalaType = interface;
  IXMLHorarioEscalaTypeList = interface;
  IXMLHorarioTurnoType = interface;
  IXMLHorarioTurnoTypeList = interface;

{ IXMLDsCadastroType }

  IXMLDsCadastroType = interface(IXMLNode)
    ['{45945157-313D-4B93-8A21-8DF1B677CAD1}']
    { Property Accessors }
    function Get_Terminal: IXMLTerminalTypeList;
    function Get_Configuracao: IXMLConfiguracaoTypeList;
    function Get_Funcionario: IXMLFuncionarioTypeList;
    function Get_Digital: IXMLDigitalTypeList;
    function Get_FuncionarioTolerancia: IXMLFuncionarioToleranciaTypeList;
    function Get_HorarioComplementar: IXMLHorarioComplementarTypeList;
    function Get_HorarioEscala: IXMLHorarioEscalaTypeList;
    function Get_HorarioTurno: IXMLHorarioTurnoTypeList;
    { Methods & Properties }
    property Terminal: IXMLTerminalTypeList read Get_Terminal;
    property Configuracao: IXMLConfiguracaoTypeList read Get_Configuracao;
    property Funcionario: IXMLFuncionarioTypeList read Get_Funcionario;
    property Digital: IXMLDigitalTypeList read Get_Digital;
    property FuncionarioTolerancia: IXMLFuncionarioToleranciaTypeList read Get_FuncionarioTolerancia;
    property HorarioComplementar: IXMLHorarioComplementarTypeList read Get_HorarioComplementar;
    property HorarioEscala: IXMLHorarioEscalaTypeList read Get_HorarioEscala;
    property HorarioTurno: IXMLHorarioTurnoTypeList read Get_HorarioTurno;
  end;

{ IXMLTerminalType }

  IXMLTerminalType = interface(IXMLNode)
    ['{D2D18E9C-B034-4380-8779-FF9C1659A310}']
    { Property Accessors }
    function Get_ID: WideString;
    function Get_GestorID: WideString;
    function Get_Mec_terminal: WideString;
    function Get_UF: WideString;
    function Get_Nome: WideString;
    function Get_DtHoraUltimoEnvio: WideString;
    function Get_DtHoraProximoEnvio: WideString;
    function Get_VersaoIcartao: Integer;
    function Get_RecebeMov: Boolean;
    procedure Set_ID(Value: WideString);
    procedure Set_GestorID(Value: WideString);
    procedure Set_Mec_terminal(Value: WideString);
    procedure Set_UF(Value: WideString);
    procedure Set_Nome(Value: WideString);
    procedure Set_DtHoraUltimoEnvio(Value: WideString);
    procedure Set_DtHoraProximoEnvio(Value: WideString);
    procedure Set_VersaoIcartao(Value: Integer);
    procedure Set_RecebeMov(Value: Boolean);
    { Methods & Properties }
    property ID: WideString read Get_ID write Set_ID;
    property GestorID: WideString read Get_GestorID write Set_GestorID;
    property Mec_terminal: WideString read Get_Mec_terminal write Set_Mec_terminal;
    property UF: WideString read Get_UF write Set_UF;
    property Nome: WideString read Get_Nome write Set_Nome;
    property DtHoraUltimoEnvio: WideString read Get_DtHoraUltimoEnvio write Set_DtHoraUltimoEnvio;
    property DtHoraProximoEnvio: WideString read Get_DtHoraProximoEnvio write Set_DtHoraProximoEnvio;
    property VersaoIcartao: Integer read Get_VersaoIcartao write Set_VersaoIcartao;
    property RecebeMov: Boolean read Get_RecebeMov write Set_RecebeMov;
  end;

{ IXMLTerminalTypeList }

  IXMLTerminalTypeList = interface(IXMLNodeCollection)
    ['{9AD55451-0A19-41C0-97DA-FA1A1BFAB929}']
    { Methods & Properties }
    function Add: IXMLTerminalType;
    function Insert(const Index: Integer): IXMLTerminalType;
    function Get_Item(Index: Integer): IXMLTerminalType;
    property Items[Index: Integer]: IXMLTerminalType read Get_Item; default;
  end;

{ IXMLConfiguracaoType }

  IXMLConfiguracaoType = interface(IXMLNode)
    ['{54D6BC7E-72F4-430B-A47C-ADA44EB7151F}']
    { Property Accessors }
    function Get_ID: WideString;
    function Get_GestorID: WideString;
    function Get_NmIdentificacao: WideString;
    function Get_Valor: WideString;
    procedure Set_ID(Value: WideString);
    procedure Set_GestorID(Value: WideString);
    procedure Set_NmIdentificacao(Value: WideString);
    procedure Set_Valor(Value: WideString);
    { Methods & Properties }
    property ID: WideString read Get_ID write Set_ID;
    property GestorID: WideString read Get_GestorID write Set_GestorID;
    property NmIdentificacao: WideString read Get_NmIdentificacao write Set_NmIdentificacao;
    property Valor: WideString read Get_Valor write Set_Valor;
  end;

{ IXMLConfiguracaoTypeList }

  IXMLConfiguracaoTypeList = interface(IXMLNodeCollection)
    ['{B2AA9E3A-B411-4E85-B2CF-6E5F9B5B9F34}']
    { Methods & Properties }
    function Add: IXMLConfiguracaoType;
    function Insert(const Index: Integer): IXMLConfiguracaoType;
    function Get_Item(Index: Integer): IXMLConfiguracaoType;
    property Items[Index: Integer]: IXMLConfiguracaoType read Get_Item; default;
  end;

{ IXMLFuncionarioType }

  IXMLFuncionarioType = interface(IXMLNode)
    ['{4D054E43-609C-4FBF-AF89-284ECD4B0046}']
    { Property Accessors }
    function Get_ID: WideString;
    function Get_GestorID: WideString;
    function Get_IdEmpresaExterno: Integer;
    function Get_IdFuncionarioExterno: WideString;
    function Get_Nome: WideString;
    function Get_NomeCurto: WideString;
    function Get_DtNascimento: WideString;
    function Get_Mensagem: WideString;
    function Get_HrEntrada: WideString;
    function Get_HrSaidaAlmoco: WideString;
    function Get_HrEntradaAlmoco: WideString;
    function Get_HrSaida: WideString;
    function Get_HrSaidaIntervalo: WideString;
    function Get_HrEntradaIntervalo: WideString;
    function Get_DiasFolga: WideString;
    function Get_VerificaMarcacaoCod: WideString;
    function Get_DtDemissao: WideString;
    function Get_VerificaMarcacaoSenha: WideString;
    function Get_VerificaMarcacaoDIG: WideString;
    function Get_DtAlteracaoCad: WideString;
    function Get_IntervaloMinimoAlmoco: Integer;
    function Get_ConsideraAlmoco: Boolean;
    function Get_TpPessoa: WideString;
    procedure Set_ID(Value: WideString);
    procedure Set_GestorID(Value: WideString);
    procedure Set_IdEmpresaExterno(Value: Integer);
    procedure Set_IdFuncionarioExterno(Value: WideString);
    procedure Set_Nome(Value: WideString);
    procedure Set_NomeCurto(Value: WideString);
    procedure Set_DtNascimento(Value: WideString);
    procedure Set_Mensagem(Value: WideString);
    procedure Set_HrEntrada(Value: WideString);
    procedure Set_HrSaidaAlmoco(Value: WideString);
    procedure Set_HrEntradaAlmoco(Value: WideString);
    procedure Set_HrSaida(Value: WideString);
    procedure Set_HrSaidaIntervalo(Value: WideString);
    procedure Set_HrEntradaIntervalo(Value: WideString);
    procedure Set_DiasFolga(Value: WideString);
    procedure Set_VerificaMarcacaoCod(Value: WideString);
    procedure Set_DtDemissao(Value: WideString);
    procedure Set_VerificaMarcacaoSenha(Value: WideString);
    procedure Set_VerificaMarcacaoDIG(Value: WideString);
    procedure Set_DtAlteracaoCad(Value: WideString);
    procedure Set_IntervaloMinimoAlmoco(Value: Integer);
    procedure Set_ConsideraAlmoco(Value: Boolean);
    procedure Set_TpPessoa(Value: WideString);
    { Methods & Properties }
    property ID: WideString read Get_ID write Set_ID;
    property GestorID: WideString read Get_GestorID write Set_GestorID;
    property IdEmpresaExterno: Integer read Get_IdEmpresaExterno write Set_IdEmpresaExterno;
    property IdFuncionarioExterno: WideString read Get_IdFuncionarioExterno write Set_IdFuncionarioExterno;
    property Nome: WideString read Get_Nome write Set_Nome;
    property NomeCurto: WideString read Get_NomeCurto write Set_NomeCurto;
    property DtNascimento: WideString read Get_DtNascimento write Set_DtNascimento;
    property Mensagem: WideString read Get_Mensagem write Set_Mensagem;
    property HrEntrada: WideString read Get_HrEntrada write Set_HrEntrada;
    property HrSaidaAlmoco: WideString read Get_HrSaidaAlmoco write Set_HrSaidaAlmoco;
    property HrEntradaAlmoco: WideString read Get_HrEntradaAlmoco write Set_HrEntradaAlmoco;
    property HrSaida: WideString read Get_HrSaida write Set_HrSaida;
    property HrSaidaIntervalo: WideString read Get_HrSaidaIntervalo write Set_HrSaidaIntervalo;
    property HrEntradaIntervalo: WideString read Get_HrEntradaIntervalo write Set_HrEntradaIntervalo;
    property DiasFolga: WideString read Get_DiasFolga write Set_DiasFolga;
    property VerificaMarcacaoCod: WideString read Get_VerificaMarcacaoCod write Set_VerificaMarcacaoCod;
    property DtDemissao: WideString read Get_DtDemissao write Set_DtDemissao;
    property VerificaMarcacaoSenha: WideString read Get_VerificaMarcacaoSenha write Set_VerificaMarcacaoSenha;
    property VerificaMarcacaoDIG: WideString read Get_VerificaMarcacaoDIG write Set_VerificaMarcacaoDIG;
    property DtAlteracaoCad: WideString read Get_DtAlteracaoCad write Set_DtAlteracaoCad;
    property IntervaloMinimoAlmoco: Integer read Get_IntervaloMinimoAlmoco write Set_IntervaloMinimoAlmoco;
    property ConsideraAlmoco: Boolean read Get_ConsideraAlmoco write Set_ConsideraAlmoco;
    property TpPessoa: WideString read Get_TpPessoa write Set_TpPessoa;
  end;

{ IXMLFuncionarioTypeList }

  IXMLFuncionarioTypeList = interface(IXMLNodeCollection)
    ['{088CC3DD-0A40-48C7-8D80-838E12453D5A}']
    { Methods & Properties }
    function Add: IXMLFuncionarioType;
    function Insert(const Index: Integer): IXMLFuncionarioType;
    function Get_Item(Index: Integer): IXMLFuncionarioType;
    property Items[Index: Integer]: IXMLFuncionarioType read Get_Item; default;
  end;

{ IXMLDigitalType }

  IXMLDigitalType = interface(IXMLNode)
    ['{C0D132F9-7045-49AA-9C8B-B7A19A6BC885}']
    { Property Accessors }
    function Get_ID: WideString;
    function Get_GestorID: WideString;
    function Get_FuncionarioID: WideString;
    function Get_Digital: WideString;
    function Get_DtAlteracaoCad: WideString;
    function Get_IdFuncionarioExterno: WideString;
    function Get_IdEmpresaExterno: Integer;
    function Get_TpPessoa: WideString;
    procedure Set_ID(Value: WideString);
    procedure Set_GestorID(Value: WideString);
    procedure Set_FuncionarioID(Value: WideString);
    procedure Set_Digital(Value: WideString);
    procedure Set_DtAlteracaoCad(Value: WideString);
    procedure Set_IdFuncionarioExterno(Value: WideString);
    procedure Set_IdEmpresaExterno(Value: Integer);
    procedure Set_TpPessoa(Value: WideString);
    { Methods & Properties }
    property ID: WideString read Get_ID write Set_ID;
    property GestorID: WideString read Get_GestorID write Set_GestorID;
    property FuncionarioID: WideString read Get_FuncionarioID write Set_FuncionarioID;
    property Digital: WideString read Get_Digital write Set_Digital;
    property DtAlteracaoCad: WideString read Get_DtAlteracaoCad write Set_DtAlteracaoCad;
    property IdFuncionarioExterno: WideString read Get_IdFuncionarioExterno write Set_IdFuncionarioExterno;
    property IdEmpresaExterno: Integer read Get_IdEmpresaExterno write Set_IdEmpresaExterno;
    property TpPessoa: WideString read Get_TpPessoa write Set_TpPessoa;
  end;

{ IXMLDigitalTypeList }

  IXMLDigitalTypeList = interface(IXMLNodeCollection)
    ['{1F4E1B20-D13D-48EE-92A7-7071D6AACB40}']
    { Methods & Properties }
    function Add: IXMLDigitalType;
    function Insert(const Index: Integer): IXMLDigitalType;
    function Get_Item(Index: Integer): IXMLDigitalType;
    property Items[Index: Integer]: IXMLDigitalType read Get_Item; default;
  end;

{ IXMLFuncionarioToleranciaType }

  IXMLFuncionarioToleranciaType = interface(IXMLNode)
    ['{43DB0560-B06D-43FE-BBA7-1E986B5571A4}']
    { Property Accessors }
    function Get_ID: WideString;
    function Get_FuncionarioID: WideString;
    function Get_IgnoraToleranciaEntrada: Boolean;
    function Get_IgnoraToleranciaEntradaAntecipada: Boolean;
    function Get_IgnoraToleranciaSaidaAlmoco: Boolean;
    function Get_IgnoraToleranciaSaidaAlmocoAntecipada: Boolean;
    function Get_IgnoraToleranciaEntradaAlmoco: Boolean;
    function Get_IgnoraToleranciaEntradaAlmocoAntecipada: Boolean;
    function Get_IgnoraToleranciaSaida: Boolean;
    function Get_IgnoraToleranciaSaidaAntecipada: Boolean;
    function Get_ToleranciaEntrada: Integer;
    function Get_ToleranciaEntradaAntecipada: Integer;
    function Get_ToleranciaSaidaAlmoco: Integer;
    function Get_ToleranciaSaidaAlmocoAntecipada: Integer;
    function Get_ToleranciaEntradaAlmoco: Integer;
    function Get_ToleranciaEntradaAlmocoAntecipada: Integer;
    function Get_ToleranciaSaida: Integer;
    function Get_ToleranciaSaidaAntecipada: Integer;
    function Get_IdEmpresaExterno: Integer;
    function Get_IdFuncionarioExterno: WideString;
    function Get_TpPessoa: WideString;
    procedure Set_ID(Value: WideString);
    procedure Set_FuncionarioID(Value: WideString);
    procedure Set_IgnoraToleranciaEntrada(Value: Boolean);
    procedure Set_IgnoraToleranciaEntradaAntecipada(Value: Boolean);
    procedure Set_IgnoraToleranciaSaidaAlmoco(Value: Boolean);
    procedure Set_IgnoraToleranciaSaidaAlmocoAntecipada(Value: Boolean);
    procedure Set_IgnoraToleranciaEntradaAlmoco(Value: Boolean);
    procedure Set_IgnoraToleranciaEntradaAlmocoAntecipada(Value: Boolean);
    procedure Set_IgnoraToleranciaSaida(Value: Boolean);
    procedure Set_IgnoraToleranciaSaidaAntecipada(Value: Boolean);
    procedure Set_ToleranciaEntrada(Value: Integer);
    procedure Set_ToleranciaEntradaAntecipada(Value: Integer);
    procedure Set_ToleranciaSaidaAlmoco(Value: Integer);
    procedure Set_ToleranciaSaidaAlmocoAntecipada(Value: Integer);
    procedure Set_ToleranciaEntradaAlmoco(Value: Integer);
    procedure Set_ToleranciaEntradaAlmocoAntecipada(Value: Integer);
    procedure Set_ToleranciaSaida(Value: Integer);
    procedure Set_ToleranciaSaidaAntecipada(Value: Integer);
    procedure Set_IdEmpresaExterno(Value: Integer);
    procedure Set_IdFuncionarioExterno(Value: WideString);
    procedure Set_TpPessoa(Value: WideString);
    { Methods & Properties }
    property ID: WideString read Get_ID write Set_ID;
    property FuncionarioID: WideString read Get_FuncionarioID write Set_FuncionarioID;
    property IgnoraToleranciaEntrada: Boolean read Get_IgnoraToleranciaEntrada write Set_IgnoraToleranciaEntrada;
    property IgnoraToleranciaEntradaAntecipada: Boolean read Get_IgnoraToleranciaEntradaAntecipada write Set_IgnoraToleranciaEntradaAntecipada;
    property IgnoraToleranciaSaidaAlmoco: Boolean read Get_IgnoraToleranciaSaidaAlmoco write Set_IgnoraToleranciaSaidaAlmoco;
    property IgnoraToleranciaSaidaAlmocoAntecipada: Boolean read Get_IgnoraToleranciaSaidaAlmocoAntecipada write Set_IgnoraToleranciaSaidaAlmocoAntecipada;
    property IgnoraToleranciaEntradaAlmoco: Boolean read Get_IgnoraToleranciaEntradaAlmoco write Set_IgnoraToleranciaEntradaAlmoco;
    property IgnoraToleranciaEntradaAlmocoAntecipada: Boolean read Get_IgnoraToleranciaEntradaAlmocoAntecipada write Set_IgnoraToleranciaEntradaAlmocoAntecipada;
    property IgnoraToleranciaSaida: Boolean read Get_IgnoraToleranciaSaida write Set_IgnoraToleranciaSaida;
    property IgnoraToleranciaSaidaAntecipada: Boolean read Get_IgnoraToleranciaSaidaAntecipada write Set_IgnoraToleranciaSaidaAntecipada;
    property ToleranciaEntrada: Integer read Get_ToleranciaEntrada write Set_ToleranciaEntrada;
    property ToleranciaEntradaAntecipada: Integer read Get_ToleranciaEntradaAntecipada write Set_ToleranciaEntradaAntecipada;
    property ToleranciaSaidaAlmoco: Integer read Get_ToleranciaSaidaAlmoco write Set_ToleranciaSaidaAlmoco;
    property ToleranciaSaidaAlmocoAntecipada: Integer read Get_ToleranciaSaidaAlmocoAntecipada write Set_ToleranciaSaidaAlmocoAntecipada;
    property ToleranciaEntradaAlmoco: Integer read Get_ToleranciaEntradaAlmoco write Set_ToleranciaEntradaAlmoco;
    property ToleranciaEntradaAlmocoAntecipada: Integer read Get_ToleranciaEntradaAlmocoAntecipada write Set_ToleranciaEntradaAlmocoAntecipada;
    property ToleranciaSaida: Integer read Get_ToleranciaSaida write Set_ToleranciaSaida;
    property ToleranciaSaidaAntecipada: Integer read Get_ToleranciaSaidaAntecipada write Set_ToleranciaSaidaAntecipada;
    property IdEmpresaExterno: Integer read Get_IdEmpresaExterno write Set_IdEmpresaExterno;
    property IdFuncionarioExterno: WideString read Get_IdFuncionarioExterno write Set_IdFuncionarioExterno;
    property TpPessoa: WideString read Get_TpPessoa write Set_TpPessoa;
  end;

{ IXMLFuncionarioToleranciaTypeList }

  IXMLFuncionarioToleranciaTypeList = interface(IXMLNodeCollection)
    ['{C4A603F0-E315-462B-BA48-73A2EFA3B588}']
    { Methods & Properties }
    function Add: IXMLFuncionarioToleranciaType;
    function Insert(const Index: Integer): IXMLFuncionarioToleranciaType;
    function Get_Item(Index: Integer): IXMLFuncionarioToleranciaType;
    property Items[Index: Integer]: IXMLFuncionarioToleranciaType read Get_Item; default;
  end;

{ IXMLHorarioComplementarType }

  IXMLHorarioComplementarType = interface(IXMLNode)
    ['{5332D0CE-5DB7-4D61-8FD5-D9AF892C8B8D}']
    { Property Accessors }
    function Get_ID: WideString;
    function Get_GestorID: WideString;
    function Get_FuncionarioID: WideString;
    function Get_Entrada: WideString;
    function Get_SaidaAlmoco: WideString;
    function Get_EntradaAlmoco: WideString;
    function Get_Saida: WideString;
    function Get_SaidaIntervalo: WideString;
    function Get_EntradaIntervalo: WideString;
    function Get_Inicio: WideString;
    function Get_Fim: WideString;
    function Get_DiaSemana: Integer;
    function Get_IdEmpresaExterno: Integer;
    function Get_IdFuncionarioExterno: WideString;
    function Get_TpPessoa: WideString;
    procedure Set_ID(Value: WideString);
    procedure Set_GestorID(Value: WideString);
    procedure Set_FuncionarioID(Value: WideString);
    procedure Set_Entrada(Value: WideString);
    procedure Set_SaidaAlmoco(Value: WideString);
    procedure Set_EntradaAlmoco(Value: WideString);
    procedure Set_Saida(Value: WideString);
    procedure Set_SaidaIntervalo(Value: WideString);
    procedure Set_EntradaIntervalo(Value: WideString);
    procedure Set_Inicio(Value: WideString);
    procedure Set_Fim(Value: WideString);
    procedure Set_DiaSemana(Value: Integer);
    procedure Set_IdEmpresaExterno(Value: Integer);
    procedure Set_IdFuncionarioExterno(Value: WideString);
    procedure Set_TpPessoa(Value: WideString);
    { Methods & Properties }
    property ID: WideString read Get_ID write Set_ID;
    property GestorID: WideString read Get_GestorID write Set_GestorID;
    property FuncionarioID: WideString read Get_FuncionarioID write Set_FuncionarioID;
    property Entrada: WideString read Get_Entrada write Set_Entrada;
    property SaidaAlmoco: WideString read Get_SaidaAlmoco write Set_SaidaAlmoco;
    property EntradaAlmoco: WideString read Get_EntradaAlmoco write Set_EntradaAlmoco;
    property Saida: WideString read Get_Saida write Set_Saida;
    property SaidaIntervalo: WideString read Get_SaidaIntervalo write Set_SaidaIntervalo;
    property EntradaIntervalo: WideString read Get_EntradaIntervalo write Set_EntradaIntervalo;
    property Inicio: WideString read Get_Inicio write Set_Inicio;
    property Fim: WideString read Get_Fim write Set_Fim;
    property DiaSemana: Integer read Get_DiaSemana write Set_DiaSemana;
    property IdEmpresaExterno: Integer read Get_IdEmpresaExterno write Set_IdEmpresaExterno;
    property IdFuncionarioExterno: WideString read Get_IdFuncionarioExterno write Set_IdFuncionarioExterno;
    property TpPessoa: WideString read Get_TpPessoa write Set_TpPessoa;
  end;

{ IXMLHorarioComplementarTypeList }

  IXMLHorarioComplementarTypeList = interface(IXMLNodeCollection)
    ['{E0C93E8A-494B-4B73-8F1D-2830070CEC82}']
    { Methods & Properties }
    function Add: IXMLHorarioComplementarType;
    function Insert(const Index: Integer): IXMLHorarioComplementarType;
    function Get_Item(Index: Integer): IXMLHorarioComplementarType;
    property Items[Index: Integer]: IXMLHorarioComplementarType read Get_Item; default;
  end;

{ IXMLHorarioEscalaType }

  IXMLHorarioEscalaType = interface(IXMLNode)
    ['{15FBE699-636C-4CA9-9202-3C5766574241}']
    { Property Accessors }
    function Get_ID: WideString;
    function Get_GestorID: WideString;
    function Get_FuncionarioID: WideString;
    function Get_Entrada: WideString;
    function Get_SaidaAlmoco: WideString;
    function Get_EntradaAlmoco: WideString;
    function Get_Saida: WideString;
    function Get_SaidaIntervalo: WideString;
    function Get_EntradaIntervalo: WideString;
    function Get_Referencia: WideString;
    function Get_Folga: Boolean;
    function Get_IdEmpresaExterno: Integer;
    function Get_IdFuncionarioExterno: WideString;
    function Get_TpPessoa: WideString;
    procedure Set_ID(Value: WideString);
    procedure Set_GestorID(Value: WideString);
    procedure Set_FuncionarioID(Value: WideString);
    procedure Set_Entrada(Value: WideString);
    procedure Set_SaidaAlmoco(Value: WideString);
    procedure Set_EntradaAlmoco(Value: WideString);
    procedure Set_Saida(Value: WideString);
    procedure Set_SaidaIntervalo(Value: WideString);
    procedure Set_EntradaIntervalo(Value: WideString);
    procedure Set_Referencia(Value: WideString);
    procedure Set_Folga(Value: Boolean);
    procedure Set_IdEmpresaExterno(Value: Integer);
    procedure Set_IdFuncionarioExterno(Value: WideString);
    procedure Set_TpPessoa(Value: WideString);
    { Methods & Properties }
    property ID: WideString read Get_ID write Set_ID;
    property GestorID: WideString read Get_GestorID write Set_GestorID;
    property FuncionarioID: WideString read Get_FuncionarioID write Set_FuncionarioID;
    property Entrada: WideString read Get_Entrada write Set_Entrada;
    property SaidaAlmoco: WideString read Get_SaidaAlmoco write Set_SaidaAlmoco;
    property EntradaAlmoco: WideString read Get_EntradaAlmoco write Set_EntradaAlmoco;
    property Saida: WideString read Get_Saida write Set_Saida;
    property SaidaIntervalo: WideString read Get_SaidaIntervalo write Set_SaidaIntervalo;
    property EntradaIntervalo: WideString read Get_EntradaIntervalo write Set_EntradaIntervalo;
    property Referencia: WideString read Get_Referencia write Set_Referencia;
    property Folga: Boolean read Get_Folga write Set_Folga;
    property IdEmpresaExterno: Integer read Get_IdEmpresaExterno write Set_IdEmpresaExterno;
    property IdFuncionarioExterno: WideString read Get_IdFuncionarioExterno write Set_IdFuncionarioExterno;
    property TpPessoa: WideString read Get_TpPessoa write Set_TpPessoa;
  end;

{ IXMLHorarioEscalaTypeList }

  IXMLHorarioEscalaTypeList = interface(IXMLNodeCollection)
    ['{7B8A90CB-7492-4217-AB94-3EB95DFB54A7}']
    { Methods & Properties }
    function Add: IXMLHorarioEscalaType;
    function Insert(const Index: Integer): IXMLHorarioEscalaType;
    function Get_Item(Index: Integer): IXMLHorarioEscalaType;
    property Items[Index: Integer]: IXMLHorarioEscalaType read Get_Item; default;
  end;

{ IXMLHorarioTurnoType }

  IXMLHorarioTurnoType = interface(IXMLNode)
    ['{4036165A-7087-4720-9552-119ACF457CBC}']
    { Property Accessors }
    function Get_ID: WideString;
    function Get_GestorID: WideString;
    function Get_FuncionarioID: WideString;
    function Get_Entrada: WideString;
    function Get_SaidaAlmoco: WideString;
    function Get_EntradaAlmoco: WideString;
    function Get_Saida: WideString;
    function Get_SaidaIntervalo: WideString;
    function Get_EntradaIntervalo: WideString;
    function Get_Inicio: WideString;
    function Get_Fim: WideString;
    function Get_Tipo: WideString;
    function Get_IdEmpresaExterno: Integer;
    function Get_IdFuncionarioExterno: WideString;
    function Get_TpPessoa: WideString;
    procedure Set_ID(Value: WideString);
    procedure Set_GestorID(Value: WideString);
    procedure Set_FuncionarioID(Value: WideString);
    procedure Set_Entrada(Value: WideString);
    procedure Set_SaidaAlmoco(Value: WideString);
    procedure Set_EntradaAlmoco(Value: WideString);
    procedure Set_Saida(Value: WideString);
    procedure Set_SaidaIntervalo(Value: WideString);
    procedure Set_EntradaIntervalo(Value: WideString);
    procedure Set_Inicio(Value: WideString);
    procedure Set_Fim(Value: WideString);
    procedure Set_Tipo(Value: WideString);
    procedure Set_IdEmpresaExterno(Value: Integer);
    procedure Set_IdFuncionarioExterno(Value: WideString);
    procedure Set_TpPessoa(Value: WideString);
    { Methods & Properties }
    property ID: WideString read Get_ID write Set_ID;
    property GestorID: WideString read Get_GestorID write Set_GestorID;
    property FuncionarioID: WideString read Get_FuncionarioID write Set_FuncionarioID;
    property Entrada: WideString read Get_Entrada write Set_Entrada;
    property SaidaAlmoco: WideString read Get_SaidaAlmoco write Set_SaidaAlmoco;
    property EntradaAlmoco: WideString read Get_EntradaAlmoco write Set_EntradaAlmoco;
    property Saida: WideString read Get_Saida write Set_Saida;
    property SaidaIntervalo: WideString read Get_SaidaIntervalo write Set_SaidaIntervalo;
    property EntradaIntervalo: WideString read Get_EntradaIntervalo write Set_EntradaIntervalo;
    property Inicio: WideString read Get_Inicio write Set_Inicio;
    property Fim: WideString read Get_Fim write Set_Fim;
    property Tipo: WideString read Get_Tipo write Set_Tipo;
    property IdEmpresaExterno: Integer read Get_IdEmpresaExterno write Set_IdEmpresaExterno;
    property IdFuncionarioExterno: WideString read Get_IdFuncionarioExterno write Set_IdFuncionarioExterno;
    property TpPessoa: WideString read Get_TpPessoa write Set_TpPessoa;
  end;

{ IXMLHorarioTurnoTypeList }

  IXMLHorarioTurnoTypeList = interface(IXMLNodeCollection)
    ['{FFC36CA9-8C87-4211-ADF5-1907D2E0D7E9}']
    { Methods & Properties }
    function Add: IXMLHorarioTurnoType;
    function Insert(const Index: Integer): IXMLHorarioTurnoType;
    function Get_Item(Index: Integer): IXMLHorarioTurnoType;
    property Items[Index: Integer]: IXMLHorarioTurnoType read Get_Item; default;
  end;

{ Forward Decls }

  TXMLDsCadastroType = class;
  TXMLTerminalType = class;
  TXMLTerminalTypeList = class;
  TXMLConfiguracaoType = class;
  TXMLConfiguracaoTypeList = class;
  TXMLFuncionarioType = class;
  TXMLFuncionarioTypeList = class;
  TXMLDigitalType = class;
  TXMLDigitalTypeList = class;
  TXMLFuncionarioToleranciaType = class;
  TXMLFuncionarioToleranciaTypeList = class;
  TXMLHorarioComplementarType = class;
  TXMLHorarioComplementarTypeList = class;
  TXMLHorarioEscalaType = class;
  TXMLHorarioEscalaTypeList = class;
  TXMLHorarioTurnoType = class;
  TXMLHorarioTurnoTypeList = class;

{ TXMLDsCadastroType }

  TXMLDsCadastroType = class(TXMLNode, IXMLDsCadastroType)
  private
    FTerminal: IXMLTerminalTypeList;
    FConfiguracao: IXMLConfiguracaoTypeList;
    FFuncionario: IXMLFuncionarioTypeList;
    FDigital: IXMLDigitalTypeList;
    FFuncionarioTolerancia: IXMLFuncionarioToleranciaTypeList;
    FHorarioComplementar: IXMLHorarioComplementarTypeList;
    FHorarioEscala: IXMLHorarioEscalaTypeList;
    FHorarioTurno: IXMLHorarioTurnoTypeList;
  protected
    { IXMLDsCadastroType }
    function Get_Terminal: IXMLTerminalTypeList;
    function Get_Configuracao: IXMLConfiguracaoTypeList;
    function Get_Funcionario: IXMLFuncionarioTypeList;
    function Get_Digital: IXMLDigitalTypeList;
    function Get_FuncionarioTolerancia: IXMLFuncionarioToleranciaTypeList;
    function Get_HorarioComplementar: IXMLHorarioComplementarTypeList;
    function Get_HorarioEscala: IXMLHorarioEscalaTypeList;
    function Get_HorarioTurno: IXMLHorarioTurnoTypeList;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTerminalType }

  TXMLTerminalType = class(TXMLNode, IXMLTerminalType)
  protected
    { IXMLTerminalType }
    function Get_ID: WideString;
    function Get_GestorID: WideString;
    function Get_Mec_terminal: WideString;
    function Get_UF: WideString;
    function Get_Nome: WideString;
    function Get_DtHoraUltimoEnvio: WideString;
    function Get_DtHoraProximoEnvio: WideString;
    function Get_VersaoIcartao: Integer;
    function Get_RecebeMov: Boolean;
    procedure Set_ID(Value: WideString);
    procedure Set_GestorID(Value: WideString);
    procedure Set_Mec_terminal(Value: WideString);
    procedure Set_UF(Value: WideString);
    procedure Set_Nome(Value: WideString);
    procedure Set_DtHoraUltimoEnvio(Value: WideString);
    procedure Set_DtHoraProximoEnvio(Value: WideString);
    procedure Set_VersaoIcartao(Value: Integer);
    procedure Set_RecebeMov(Value: Boolean);
  end;

{ TXMLTerminalTypeList }

  TXMLTerminalTypeList = class(TXMLNodeCollection, IXMLTerminalTypeList)
  protected
    { IXMLTerminalTypeList }
    function Add: IXMLTerminalType;
    function Insert(const Index: Integer): IXMLTerminalType;
    function Get_Item(Index: Integer): IXMLTerminalType;
  end;

{ TXMLConfiguracaoType }

  TXMLConfiguracaoType = class(TXMLNode, IXMLConfiguracaoType)
  protected
    { IXMLConfiguracaoType }
    function Get_ID: WideString;
    function Get_GestorID: WideString;
    function Get_NmIdentificacao: WideString;
    function Get_Valor: WideString;
    procedure Set_ID(Value: WideString);
    procedure Set_GestorID(Value: WideString);
    procedure Set_NmIdentificacao(Value: WideString);
    procedure Set_Valor(Value: WideString);
  end;

{ TXMLConfiguracaoTypeList }

  TXMLConfiguracaoTypeList = class(TXMLNodeCollection, IXMLConfiguracaoTypeList)
  protected
    { IXMLConfiguracaoTypeList }
    function Add: IXMLConfiguracaoType;
    function Insert(const Index: Integer): IXMLConfiguracaoType;
    function Get_Item(Index: Integer): IXMLConfiguracaoType;
  end;

{ TXMLFuncionarioType }

  TXMLFuncionarioType = class(TXMLNode, IXMLFuncionarioType)
  protected
    { IXMLFuncionarioType }
    function Get_ID: WideString;
    function Get_GestorID: WideString;
    function Get_IdEmpresaExterno: Integer;
    function Get_IdFuncionarioExterno: WideString;
    function Get_Nome: WideString;
    function Get_NomeCurto: WideString;
    function Get_DtNascimento: WideString;
    function Get_Mensagem: WideString;
    function Get_HrEntrada: WideString;
    function Get_HrSaidaAlmoco: WideString;
    function Get_HrEntradaAlmoco: WideString;
    function Get_HrSaida: WideString;
    function Get_HrSaidaIntervalo: WideString;
    function Get_HrEntradaIntervalo: WideString;
    function Get_DiasFolga: WideString;
    function Get_VerificaMarcacaoCod: WideString;
    function Get_DtDemissao: WideString;
    function Get_VerificaMarcacaoSenha: WideString;
    function Get_VerificaMarcacaoDIG: WideString;
    function Get_DtAlteracaoCad: WideString;
    function Get_IntervaloMinimoAlmoco: Integer;
    function Get_ConsideraAlmoco: Boolean;
    function Get_TpPessoa: WideString;
    procedure Set_ID(Value: WideString);
    procedure Set_GestorID(Value: WideString);
    procedure Set_IdEmpresaExterno(Value: Integer);
    procedure Set_IdFuncionarioExterno(Value: WideString);
    procedure Set_Nome(Value: WideString);
    procedure Set_NomeCurto(Value: WideString);
    procedure Set_DtNascimento(Value: WideString);
    procedure Set_Mensagem(Value: WideString);
    procedure Set_HrEntrada(Value: WideString);
    procedure Set_HrSaidaAlmoco(Value: WideString);
    procedure Set_HrEntradaAlmoco(Value: WideString);
    procedure Set_HrSaida(Value: WideString);
    procedure Set_HrSaidaIntervalo(Value: WideString);
    procedure Set_HrEntradaIntervalo(Value: WideString);
    procedure Set_DiasFolga(Value: WideString);
    procedure Set_VerificaMarcacaoCod(Value: WideString);
    procedure Set_DtDemissao(Value: WideString);
    procedure Set_VerificaMarcacaoSenha(Value: WideString);
    procedure Set_VerificaMarcacaoDIG(Value: WideString);
    procedure Set_DtAlteracaoCad(Value: WideString);
    procedure Set_IntervaloMinimoAlmoco(Value: Integer);
    procedure Set_ConsideraAlmoco(Value: Boolean);
    procedure Set_TpPessoa(Value: WideString);
  end;

{ TXMLFuncionarioTypeList }

  TXMLFuncionarioTypeList = class(TXMLNodeCollection, IXMLFuncionarioTypeList)
  protected
    { IXMLFuncionarioTypeList }
    function Add: IXMLFuncionarioType;
    function Insert(const Index: Integer): IXMLFuncionarioType;
    function Get_Item(Index: Integer): IXMLFuncionarioType;
  end;

{ TXMLDigitalType }

  TXMLDigitalType = class(TXMLNode, IXMLDigitalType)
  protected
    { IXMLDigitalType }
    function Get_ID: WideString;
    function Get_GestorID: WideString;
    function Get_FuncionarioID: WideString;
    function Get_Digital: WideString;
    function Get_DtAlteracaoCad: WideString;
    function Get_IdFuncionarioExterno: WideString;
    function Get_IdEmpresaExterno: Integer;
    function Get_TpPessoa: WideString;
    procedure Set_ID(Value: WideString);
    procedure Set_GestorID(Value: WideString);
    procedure Set_FuncionarioID(Value: WideString);
    procedure Set_Digital(Value: WideString);
    procedure Set_DtAlteracaoCad(Value: WideString);
    procedure Set_IdFuncionarioExterno(Value: WideString);
    procedure Set_IdEmpresaExterno(Value: Integer);
    procedure Set_TpPessoa(Value: WideString);
  end;

{ TXMLDigitalTypeList }

  TXMLDigitalTypeList = class(TXMLNodeCollection, IXMLDigitalTypeList)
  protected
    { IXMLDigitalTypeList }
    function Add: IXMLDigitalType;
    function Insert(const Index: Integer): IXMLDigitalType;
    function Get_Item(Index: Integer): IXMLDigitalType;
  end;

{ TXMLFuncionarioToleranciaType }

  TXMLFuncionarioToleranciaType = class(TXMLNode, IXMLFuncionarioToleranciaType)
  protected
    { IXMLFuncionarioToleranciaType }
    function Get_ID: WideString;
    function Get_FuncionarioID: WideString;
    function Get_IgnoraToleranciaEntrada: Boolean;
    function Get_IgnoraToleranciaEntradaAntecipada: Boolean;
    function Get_IgnoraToleranciaSaidaAlmoco: Boolean;
    function Get_IgnoraToleranciaSaidaAlmocoAntecipada: Boolean;
    function Get_IgnoraToleranciaEntradaAlmoco: Boolean;
    function Get_IgnoraToleranciaEntradaAlmocoAntecipada: Boolean;
    function Get_IgnoraToleranciaSaida: Boolean;
    function Get_IgnoraToleranciaSaidaAntecipada: Boolean;
    function Get_ToleranciaEntrada: Integer;
    function Get_ToleranciaEntradaAntecipada: Integer;
    function Get_ToleranciaSaidaAlmoco: Integer;
    function Get_ToleranciaSaidaAlmocoAntecipada: Integer;
    function Get_ToleranciaEntradaAlmoco: Integer;
    function Get_ToleranciaEntradaAlmocoAntecipada: Integer;
    function Get_ToleranciaSaida: Integer;
    function Get_ToleranciaSaidaAntecipada: Integer;
    function Get_IdEmpresaExterno: Integer;
    function Get_IdFuncionarioExterno: WideString;
    function Get_TpPessoa: WideString;
    procedure Set_ID(Value: WideString);
    procedure Set_FuncionarioID(Value: WideString);
    procedure Set_IgnoraToleranciaEntrada(Value: Boolean);
    procedure Set_IgnoraToleranciaEntradaAntecipada(Value: Boolean);
    procedure Set_IgnoraToleranciaSaidaAlmoco(Value: Boolean);
    procedure Set_IgnoraToleranciaSaidaAlmocoAntecipada(Value: Boolean);
    procedure Set_IgnoraToleranciaEntradaAlmoco(Value: Boolean);
    procedure Set_IgnoraToleranciaEntradaAlmocoAntecipada(Value: Boolean);
    procedure Set_IgnoraToleranciaSaida(Value: Boolean);
    procedure Set_IgnoraToleranciaSaidaAntecipada(Value: Boolean);
    procedure Set_ToleranciaEntrada(Value: Integer);
    procedure Set_ToleranciaEntradaAntecipada(Value: Integer);
    procedure Set_ToleranciaSaidaAlmoco(Value: Integer);
    procedure Set_ToleranciaSaidaAlmocoAntecipada(Value: Integer);
    procedure Set_ToleranciaEntradaAlmoco(Value: Integer);
    procedure Set_ToleranciaEntradaAlmocoAntecipada(Value: Integer);
    procedure Set_ToleranciaSaida(Value: Integer);
    procedure Set_ToleranciaSaidaAntecipada(Value: Integer);
    procedure Set_IdEmpresaExterno(Value: Integer);
    procedure Set_IdFuncionarioExterno(Value: WideString);
    procedure Set_TpPessoa(Value: WideString);
  end;

{ TXMLFuncionarioToleranciaTypeList }

  TXMLFuncionarioToleranciaTypeList = class(TXMLNodeCollection, IXMLFuncionarioToleranciaTypeList)
  protected
    { IXMLFuncionarioToleranciaTypeList }
    function Add: IXMLFuncionarioToleranciaType;
    function Insert(const Index: Integer): IXMLFuncionarioToleranciaType;
    function Get_Item(Index: Integer): IXMLFuncionarioToleranciaType;
  end;

{ TXMLHorarioComplementarType }

  TXMLHorarioComplementarType = class(TXMLNode, IXMLHorarioComplementarType)
  protected
    { IXMLHorarioComplementarType }
    function Get_ID: WideString;
    function Get_GestorID: WideString;
    function Get_FuncionarioID: WideString;
    function Get_Entrada: WideString;
    function Get_SaidaAlmoco: WideString;
    function Get_EntradaAlmoco: WideString;
    function Get_Saida: WideString;
    function Get_SaidaIntervalo: WideString;
    function Get_EntradaIntervalo: WideString;
    function Get_Inicio: WideString;
    function Get_Fim: WideString;
    function Get_DiaSemana: Integer;
    function Get_IdEmpresaExterno: Integer;
    function Get_IdFuncionarioExterno: WideString;
    function Get_TpPessoa: WideString;
    procedure Set_ID(Value: WideString);
    procedure Set_GestorID(Value: WideString);
    procedure Set_FuncionarioID(Value: WideString);
    procedure Set_Entrada(Value: WideString);
    procedure Set_SaidaAlmoco(Value: WideString);
    procedure Set_EntradaAlmoco(Value: WideString);
    procedure Set_Saida(Value: WideString);
    procedure Set_SaidaIntervalo(Value: WideString);
    procedure Set_EntradaIntervalo(Value: WideString);
    procedure Set_Inicio(Value: WideString);
    procedure Set_Fim(Value: WideString);
    procedure Set_DiaSemana(Value: Integer);
    procedure Set_IdEmpresaExterno(Value: Integer);
    procedure Set_IdFuncionarioExterno(Value: WideString);
    procedure Set_TpPessoa(Value: WideString);
  end;

{ TXMLHorarioComplementarTypeList }

  TXMLHorarioComplementarTypeList = class(TXMLNodeCollection, IXMLHorarioComplementarTypeList)
  protected
    { IXMLHorarioComplementarTypeList }
    function Add: IXMLHorarioComplementarType;
    function Insert(const Index: Integer): IXMLHorarioComplementarType;
    function Get_Item(Index: Integer): IXMLHorarioComplementarType;
  end;

{ TXMLHorarioEscalaType }

  TXMLHorarioEscalaType = class(TXMLNode, IXMLHorarioEscalaType)
  protected
    { IXMLHorarioEscalaType }
    function Get_ID: WideString;
    function Get_GestorID: WideString;
    function Get_FuncionarioID: WideString;
    function Get_Entrada: WideString;
    function Get_SaidaAlmoco: WideString;
    function Get_EntradaAlmoco: WideString;
    function Get_Saida: WideString;
    function Get_SaidaIntervalo: WideString;
    function Get_EntradaIntervalo: WideString;
    function Get_Referencia: WideString;
    function Get_Folga: Boolean;
    function Get_IdEmpresaExterno: Integer;
    function Get_IdFuncionarioExterno: WideString;
    function Get_TpPessoa: WideString;
    procedure Set_ID(Value: WideString);
    procedure Set_GestorID(Value: WideString);
    procedure Set_FuncionarioID(Value: WideString);
    procedure Set_Entrada(Value: WideString);
    procedure Set_SaidaAlmoco(Value: WideString);
    procedure Set_EntradaAlmoco(Value: WideString);
    procedure Set_Saida(Value: WideString);
    procedure Set_SaidaIntervalo(Value: WideString);
    procedure Set_EntradaIntervalo(Value: WideString);
    procedure Set_Referencia(Value: WideString);
    procedure Set_Folga(Value: Boolean);
    procedure Set_IdEmpresaExterno(Value: Integer);
    procedure Set_IdFuncionarioExterno(Value: WideString);
    procedure Set_TpPessoa(Value: WideString);
  end;

{ TXMLHorarioEscalaTypeList }

  TXMLHorarioEscalaTypeList = class(TXMLNodeCollection, IXMLHorarioEscalaTypeList)
  protected
    { IXMLHorarioEscalaTypeList }
    function Add: IXMLHorarioEscalaType;
    function Insert(const Index: Integer): IXMLHorarioEscalaType;
    function Get_Item(Index: Integer): IXMLHorarioEscalaType;
  end;

{ TXMLHorarioTurnoType }

  TXMLHorarioTurnoType = class(TXMLNode, IXMLHorarioTurnoType)
  protected
    { IXMLHorarioTurnoType }
    function Get_ID: WideString;
    function Get_GestorID: WideString;
    function Get_FuncionarioID: WideString;
    function Get_Entrada: WideString;
    function Get_SaidaAlmoco: WideString;
    function Get_EntradaAlmoco: WideString;
    function Get_Saida: WideString;
    function Get_SaidaIntervalo: WideString;
    function Get_EntradaIntervalo: WideString;
    function Get_Inicio: WideString;
    function Get_Fim: WideString;
    function Get_Tipo: WideString;
    function Get_IdEmpresaExterno: Integer;
    function Get_IdFuncionarioExterno: WideString;
    function Get_TpPessoa: WideString;
    procedure Set_ID(Value: WideString);
    procedure Set_GestorID(Value: WideString);
    procedure Set_FuncionarioID(Value: WideString);
    procedure Set_Entrada(Value: WideString);
    procedure Set_SaidaAlmoco(Value: WideString);
    procedure Set_EntradaAlmoco(Value: WideString);
    procedure Set_Saida(Value: WideString);
    procedure Set_SaidaIntervalo(Value: WideString);
    procedure Set_EntradaIntervalo(Value: WideString);
    procedure Set_Inicio(Value: WideString);
    procedure Set_Fim(Value: WideString);
    procedure Set_Tipo(Value: WideString);
    procedure Set_IdEmpresaExterno(Value: Integer);
    procedure Set_IdFuncionarioExterno(Value: WideString);
    procedure Set_TpPessoa(Value: WideString);
  end;

{ TXMLHorarioTurnoTypeList }

  TXMLHorarioTurnoTypeList = class(TXMLNodeCollection, IXMLHorarioTurnoTypeList)
  protected
    { IXMLHorarioTurnoTypeList }
    function Add: IXMLHorarioTurnoType;
    function Insert(const Index: Integer): IXMLHorarioTurnoType;
    function Get_Item(Index: Integer): IXMLHorarioTurnoType;
  end;

{ Global Functions }

function GetDsCadastro(Doc: IXMLDocument): IXMLDsCadastroType;
function LoadDsCadastro(const FileName: WideString): IXMLDsCadastroType;
function NewDsCadastro: IXMLDsCadastroType;

const
  TargetNamespace = 'http://tempuri.org/DsCadastro.xsd';

implementation

{ Global Functions }

function GetDsCadastro(Doc: IXMLDocument): IXMLDsCadastroType;
begin
  Result := Doc.GetDocBinding('DsCadastro', TXMLDsCadastroType, TargetNamespace) as IXMLDsCadastroType;
end;

function LoadDsCadastro(const FileName: WideString): IXMLDsCadastroType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('DsCadastro', TXMLDsCadastroType, TargetNamespace) as IXMLDsCadastroType;
end;

function NewDsCadastro: IXMLDsCadastroType;
begin
  Result := NewXMLDocument.GetDocBinding('DsCadastro', TXMLDsCadastroType, TargetNamespace) as IXMLDsCadastroType;
end;

{ TXMLDsCadastroType }

procedure TXMLDsCadastroType.AfterConstruction;
begin
  RegisterChildNode('Terminal', TXMLTerminalType);
  RegisterChildNode('Configuracao', TXMLConfiguracaoType);
  RegisterChildNode('Funcionario', TXMLFuncionarioType);
  RegisterChildNode('Digital', TXMLDigitalType);
  RegisterChildNode('FuncionarioTolerancia', TXMLFuncionarioToleranciaType);
  RegisterChildNode('HorarioComplementar', TXMLHorarioComplementarType);
  RegisterChildNode('HorarioEscala', TXMLHorarioEscalaType);
  RegisterChildNode('HorarioTurno', TXMLHorarioTurnoType);
  FTerminal := CreateCollection(TXMLTerminalTypeList, IXMLTerminalType, 'Terminal') as IXMLTerminalTypeList;
  FConfiguracao := CreateCollection(TXMLConfiguracaoTypeList, IXMLConfiguracaoType, 'Configuracao') as IXMLConfiguracaoTypeList;
  FFuncionario := CreateCollection(TXMLFuncionarioTypeList, IXMLFuncionarioType, 'Funcionario') as IXMLFuncionarioTypeList;
  FDigital := CreateCollection(TXMLDigitalTypeList, IXMLDigitalType, 'Digital') as IXMLDigitalTypeList;
  FFuncionarioTolerancia := CreateCollection(TXMLFuncionarioToleranciaTypeList, IXMLFuncionarioToleranciaType, 'FuncionarioTolerancia') as IXMLFuncionarioToleranciaTypeList;
  FHorarioComplementar := CreateCollection(TXMLHorarioComplementarTypeList, IXMLHorarioComplementarType, 'HorarioComplementar') as IXMLHorarioComplementarTypeList;
  FHorarioEscala := CreateCollection(TXMLHorarioEscalaTypeList, IXMLHorarioEscalaType, 'HorarioEscala') as IXMLHorarioEscalaTypeList;
  FHorarioTurno := CreateCollection(TXMLHorarioTurnoTypeList, IXMLHorarioTurnoType, 'HorarioTurno') as IXMLHorarioTurnoTypeList;
  inherited;
end;

function TXMLDsCadastroType.Get_Terminal: IXMLTerminalTypeList;
begin
  Result := FTerminal;
end;

function TXMLDsCadastroType.Get_Configuracao: IXMLConfiguracaoTypeList;
begin
  Result := FConfiguracao;
end;

function TXMLDsCadastroType.Get_Funcionario: IXMLFuncionarioTypeList;
begin
  Result := FFuncionario;
end;

function TXMLDsCadastroType.Get_Digital: IXMLDigitalTypeList;
begin
  Result := FDigital;
end;

function TXMLDsCadastroType.Get_FuncionarioTolerancia: IXMLFuncionarioToleranciaTypeList;
begin
  Result := FFuncionarioTolerancia;
end;

function TXMLDsCadastroType.Get_HorarioComplementar: IXMLHorarioComplementarTypeList;
begin
  Result := FHorarioComplementar;
end;

function TXMLDsCadastroType.Get_HorarioEscala: IXMLHorarioEscalaTypeList;
begin
  Result := FHorarioEscala;
end;

function TXMLDsCadastroType.Get_HorarioTurno: IXMLHorarioTurnoTypeList;
begin
  Result := FHorarioTurno;
end;

{ TXMLTerminalType }

function TXMLTerminalType.Get_ID: WideString;
begin
  Result := ChildNodes['ID'].Text;
end;

procedure TXMLTerminalType.Set_ID(Value: WideString);
begin
  ChildNodes['ID'].NodeValue := Value;
end;

function TXMLTerminalType.Get_GestorID: WideString;
begin
  Result := ChildNodes['GestorID'].Text;
end;

procedure TXMLTerminalType.Set_GestorID(Value: WideString);
begin
  ChildNodes['GestorID'].NodeValue := Value;
end;

function TXMLTerminalType.Get_Mec_terminal: WideString;
begin
  Result := ChildNodes['Mec_terminal'].Text;
end;

procedure TXMLTerminalType.Set_Mec_terminal(Value: WideString);
begin
  ChildNodes['Mec_terminal'].NodeValue := Value;
end;

function TXMLTerminalType.Get_UF: WideString;
begin
  Result := ChildNodes['UF'].Text;
end;

procedure TXMLTerminalType.Set_UF(Value: WideString);
begin
  ChildNodes['UF'].NodeValue := Value;
end;

function TXMLTerminalType.Get_Nome: WideString;
begin
  Result := ChildNodes['Nome'].Text;
end;

procedure TXMLTerminalType.Set_Nome(Value: WideString);
begin
  ChildNodes['Nome'].NodeValue := Value;
end;

function TXMLTerminalType.Get_DtHoraUltimoEnvio: WideString;
begin
  Result := ChildNodes['DtHoraUltimoEnvio'].Text;
end;

procedure TXMLTerminalType.Set_DtHoraUltimoEnvio(Value: WideString);
begin
  ChildNodes['DtHoraUltimoEnvio'].NodeValue := Value;
end;

function TXMLTerminalType.Get_DtHoraProximoEnvio: WideString;
begin
  Result := ChildNodes['DtHoraProximoEnvio'].Text;
end;

procedure TXMLTerminalType.Set_DtHoraProximoEnvio(Value: WideString);
begin
  ChildNodes['DtHoraProximoEnvio'].NodeValue := Value;
end;

function TXMLTerminalType.Get_VersaoIcartao: Integer;
begin
  Result := ChildNodes['VersaoIcartao'].NodeValue;
end;

procedure TXMLTerminalType.Set_VersaoIcartao(Value: Integer);
begin
  ChildNodes['VersaoIcartao'].NodeValue := Value;
end;

function TXMLTerminalType.Get_RecebeMov: Boolean;
begin
  Result := ChildNodes['RecebeMov'].NodeValue;
end;

procedure TXMLTerminalType.Set_RecebeMov(Value: Boolean);
begin
  ChildNodes['RecebeMov'].NodeValue := Value;
end;

{ TXMLTerminalTypeList }

function TXMLTerminalTypeList.Add: IXMLTerminalType;
begin
  Result := AddItem(-1) as IXMLTerminalType;
end;

function TXMLTerminalTypeList.Insert(const Index: Integer): IXMLTerminalType;
begin
  Result := AddItem(Index) as IXMLTerminalType;
end;
function TXMLTerminalTypeList.Get_Item(Index: Integer): IXMLTerminalType;
begin
  Result := List[Index] as IXMLTerminalType;
end;

{ TXMLConfiguracaoType }

function TXMLConfiguracaoType.Get_ID: WideString;
begin
  Result := ChildNodes['ID'].Text;
end;

procedure TXMLConfiguracaoType.Set_ID(Value: WideString);
begin
  ChildNodes['ID'].NodeValue := Value;
end;

function TXMLConfiguracaoType.Get_GestorID: WideString;
begin
  Result := ChildNodes['GestorID'].Text;
end;

procedure TXMLConfiguracaoType.Set_GestorID(Value: WideString);
begin
  ChildNodes['GestorID'].NodeValue := Value;
end;

function TXMLConfiguracaoType.Get_NmIdentificacao: WideString;
begin
  Result := ChildNodes['NmIdentificacao'].Text;
end;

procedure TXMLConfiguracaoType.Set_NmIdentificacao(Value: WideString);
begin
  ChildNodes['NmIdentificacao'].NodeValue := Value;
end;

function TXMLConfiguracaoType.Get_Valor: WideString;
begin
  Result := ChildNodes['Valor'].Text;
end;

procedure TXMLConfiguracaoType.Set_Valor(Value: WideString);
begin
  ChildNodes['Valor'].NodeValue := Value;
end;

{ TXMLConfiguracaoTypeList }

function TXMLConfiguracaoTypeList.Add: IXMLConfiguracaoType;
begin
  Result := AddItem(-1) as IXMLConfiguracaoType;
end;

function TXMLConfiguracaoTypeList.Insert(const Index: Integer): IXMLConfiguracaoType;
begin
  Result := AddItem(Index) as IXMLConfiguracaoType;
end;
function TXMLConfiguracaoTypeList.Get_Item(Index: Integer): IXMLConfiguracaoType;
begin
  Result := List[Index] as IXMLConfiguracaoType;
end;

{ TXMLFuncionarioType }

function TXMLFuncionarioType.Get_ID: WideString;
begin
  Result := ChildNodes['ID'].Text;
end;

procedure TXMLFuncionarioType.Set_ID(Value: WideString);
begin
  ChildNodes['ID'].NodeValue := Value;
end;

function TXMLFuncionarioType.Get_GestorID: WideString;
begin
  Result := ChildNodes['GestorID'].Text;
end;

procedure TXMLFuncionarioType.Set_GestorID(Value: WideString);
begin
  ChildNodes['GestorID'].NodeValue := Value;
end;

function TXMLFuncionarioType.Get_IdEmpresaExterno: Integer;
begin
  Result := ChildNodes['IdEmpresaExterno'].NodeValue;
end;

procedure TXMLFuncionarioType.Set_IdEmpresaExterno(Value: Integer);
begin
  ChildNodes['IdEmpresaExterno'].NodeValue := Value;
end;

function TXMLFuncionarioType.Get_IdFuncionarioExterno: WideString;
begin
  Result := ChildNodes['IdFuncionarioExterno'].Text;
end;

procedure TXMLFuncionarioType.Set_IdFuncionarioExterno(Value: WideString);
begin
  ChildNodes['IdFuncionarioExterno'].NodeValue := Value;
end;

function TXMLFuncionarioType.Get_Nome: WideString;
begin
  Result := ChildNodes['Nome'].Text;
end;

procedure TXMLFuncionarioType.Set_Nome(Value: WideString);
begin
  ChildNodes['Nome'].NodeValue := Value;
end;

function TXMLFuncionarioType.Get_NomeCurto: WideString;
begin
  Result := ChildNodes['NomeCurto'].Text;
end;

procedure TXMLFuncionarioType.Set_NomeCurto(Value: WideString);
begin
  ChildNodes['NomeCurto'].NodeValue := Value;
end;

function TXMLFuncionarioType.Get_DtNascimento: WideString;
begin
  Result := ChildNodes['DtNascimento'].Text;
end;

procedure TXMLFuncionarioType.Set_DtNascimento(Value: WideString);
begin
  ChildNodes['DtNascimento'].NodeValue := Value;
end;

function TXMLFuncionarioType.Get_Mensagem: WideString;
begin
  Result := ChildNodes['Mensagem'].Text;
end;

procedure TXMLFuncionarioType.Set_Mensagem(Value: WideString);
begin
  ChildNodes['Mensagem'].NodeValue := Value;
end;

function TXMLFuncionarioType.Get_HrEntrada: WideString;
begin
  Result := ChildNodes['HrEntrada'].Text;
end;

procedure TXMLFuncionarioType.Set_HrEntrada(Value: WideString);
begin
  ChildNodes['HrEntrada'].NodeValue := Value;
end;

function TXMLFuncionarioType.Get_HrSaidaAlmoco: WideString;
begin
  Result := ChildNodes['HrSaidaAlmoco'].Text;
end;

procedure TXMLFuncionarioType.Set_HrSaidaAlmoco(Value: WideString);
begin
  ChildNodes['HrSaidaAlmoco'].NodeValue := Value;
end;

function TXMLFuncionarioType.Get_HrEntradaAlmoco: WideString;
begin
  Result := ChildNodes['HrEntradaAlmoco'].Text;
end;

procedure TXMLFuncionarioType.Set_HrEntradaAlmoco(Value: WideString);
begin
  ChildNodes['HrEntradaAlmoco'].NodeValue := Value;
end;

function TXMLFuncionarioType.Get_HrSaida: WideString;
begin
  Result := ChildNodes['HrSaida'].Text;
end;

procedure TXMLFuncionarioType.Set_HrSaida(Value: WideString);
begin
  ChildNodes['HrSaida'].NodeValue := Value;
end;

function TXMLFuncionarioType.Get_HrSaidaIntervalo: WideString;
begin
  Result := ChildNodes['HrSaidaIntervalo'].Text;
end;

procedure TXMLFuncionarioType.Set_HrSaidaIntervalo(Value: WideString);
begin
  ChildNodes['HrSaidaIntervalo'].NodeValue := Value;
end;

function TXMLFuncionarioType.Get_HrEntradaIntervalo: WideString;
begin
  Result := ChildNodes['HrEntradaIntervalo'].Text;
end;

procedure TXMLFuncionarioType.Set_HrEntradaIntervalo(Value: WideString);
begin
  ChildNodes['HrEntradaIntervalo'].NodeValue := Value;
end;

function TXMLFuncionarioType.Get_DiasFolga: WideString;
begin
  Result := ChildNodes['DiasFolga'].Text;
end;

procedure TXMLFuncionarioType.Set_DiasFolga(Value: WideString);
begin
  ChildNodes['DiasFolga'].NodeValue := Value;
end;

function TXMLFuncionarioType.Get_VerificaMarcacaoCod: WideString;
begin
  Result := ChildNodes['VerificaMarcacaoCod'].Text;
end;

procedure TXMLFuncionarioType.Set_VerificaMarcacaoCod(Value: WideString);
begin
  ChildNodes['VerificaMarcacaoCod'].NodeValue := Value;
end;

function TXMLFuncionarioType.Get_DtDemissao: WideString;
begin
  Result := ChildNodes['DtDemissao'].Text;
end;

procedure TXMLFuncionarioType.Set_DtDemissao(Value: WideString);
begin
  ChildNodes['DtDemissao'].NodeValue := Value;
end;

function TXMLFuncionarioType.Get_VerificaMarcacaoSenha: WideString;
begin
  Result := ChildNodes['VerificaMarcacaoSenha'].Text;
end;

procedure TXMLFuncionarioType.Set_VerificaMarcacaoSenha(Value: WideString);
begin
  ChildNodes['VerificaMarcacaoSenha'].NodeValue := Value;
end;

function TXMLFuncionarioType.Get_VerificaMarcacaoDIG: WideString;
begin
  Result := ChildNodes['VerificaMarcacaoDIG'].Text;
end;

procedure TXMLFuncionarioType.Set_VerificaMarcacaoDIG(Value: WideString);
begin
  ChildNodes['VerificaMarcacaoDIG'].NodeValue := Value;
end;

function TXMLFuncionarioType.Get_DtAlteracaoCad: WideString;
begin
  Result := ChildNodes['DtAlteracaoCad'].Text;
end;

procedure TXMLFuncionarioType.Set_DtAlteracaoCad(Value: WideString);
begin
  ChildNodes['DtAlteracaoCad'].NodeValue := Value;
end;

function TXMLFuncionarioType.Get_IntervaloMinimoAlmoco: Integer;
begin
  Result := ChildNodes['IntervaloMinimoAlmoco'].NodeValue;
end;

procedure TXMLFuncionarioType.Set_IntervaloMinimoAlmoco(Value: Integer);
begin
  ChildNodes['IntervaloMinimoAlmoco'].NodeValue := Value;
end;

function TXMLFuncionarioType.Get_ConsideraAlmoco: Boolean;
begin
  Result := ChildNodes['ConsideraAlmoco'].NodeValue;
end;

procedure TXMLFuncionarioType.Set_ConsideraAlmoco(Value: Boolean);
begin
  ChildNodes['ConsideraAlmoco'].NodeValue := Value;
end;

function TXMLFuncionarioType.Get_TpPessoa: WideString;
begin
  Result := ChildNodes['TpPessoa'].Text;
end;

procedure TXMLFuncionarioType.Set_TpPessoa(Value: WideString);
begin
  ChildNodes['TpPessoa'].NodeValue := Value;
end;

{ TXMLFuncionarioTypeList }

function TXMLFuncionarioTypeList.Add: IXMLFuncionarioType;
begin
  Result := AddItem(-1) as IXMLFuncionarioType;
end;

function TXMLFuncionarioTypeList.Insert(const Index: Integer): IXMLFuncionarioType;
begin
  Result := AddItem(Index) as IXMLFuncionarioType;
end;
function TXMLFuncionarioTypeList.Get_Item(Index: Integer): IXMLFuncionarioType;
begin
  Result := List[Index] as IXMLFuncionarioType;
end;

{ TXMLDigitalType }

function TXMLDigitalType.Get_ID: WideString;
begin
  Result := ChildNodes['ID'].Text;
end;

procedure TXMLDigitalType.Set_ID(Value: WideString);
begin
  ChildNodes['ID'].NodeValue := Value;
end;

function TXMLDigitalType.Get_GestorID: WideString;
begin
  Result := ChildNodes['GestorID'].Text;
end;

procedure TXMLDigitalType.Set_GestorID(Value: WideString);
begin
  ChildNodes['GestorID'].NodeValue := Value;
end;

function TXMLDigitalType.Get_FuncionarioID: WideString;
begin
  Result := ChildNodes['FuncionarioID'].Text;
end;

procedure TXMLDigitalType.Set_FuncionarioID(Value: WideString);
begin
  ChildNodes['FuncionarioID'].NodeValue := Value;
end;

function TXMLDigitalType.Get_Digital: WideString;
begin
  Result := ChildNodes['Digital'].Text;
end;

procedure TXMLDigitalType.Set_Digital(Value: WideString);
begin
  ChildNodes['Digital'].NodeValue := Value;
end;

function TXMLDigitalType.Get_DtAlteracaoCad: WideString;
begin
  Result := ChildNodes['DtAlteracaoCad'].Text;
end;

procedure TXMLDigitalType.Set_DtAlteracaoCad(Value: WideString);
begin
  ChildNodes['DtAlteracaoCad'].NodeValue := Value;
end;

function TXMLDigitalType.Get_IdFuncionarioExterno: WideString;
begin
  Result := ChildNodes['IdFuncionarioExterno'].Text;
end;

procedure TXMLDigitalType.Set_IdFuncionarioExterno(Value: WideString);
begin
  ChildNodes['IdFuncionarioExterno'].NodeValue := Value;
end;

function TXMLDigitalType.Get_IdEmpresaExterno: Integer;
begin
  Result := ChildNodes['IdEmpresaExterno'].NodeValue;
end;

procedure TXMLDigitalType.Set_IdEmpresaExterno(Value: Integer);
begin
  ChildNodes['IdEmpresaExterno'].NodeValue := Value;
end;

function TXMLDigitalType.Get_TpPessoa: WideString;
begin
  Result := ChildNodes['TpPessoa'].Text;
end;

procedure TXMLDigitalType.Set_TpPessoa(Value: WideString);
begin
  ChildNodes['TpPessoa'].NodeValue := Value;
end;

{ TXMLDigitalTypeList }

function TXMLDigitalTypeList.Add: IXMLDigitalType;
begin
  Result := AddItem(-1) as IXMLDigitalType;
end;

function TXMLDigitalTypeList.Insert(const Index: Integer): IXMLDigitalType;
begin
  Result := AddItem(Index) as IXMLDigitalType;
end;
function TXMLDigitalTypeList.Get_Item(Index: Integer): IXMLDigitalType;
begin
  Result := List[Index] as IXMLDigitalType;
end;

{ TXMLFuncionarioToleranciaType }

function TXMLFuncionarioToleranciaType.Get_ID: WideString;
begin
  Result := ChildNodes['ID'].Text;
end;

procedure TXMLFuncionarioToleranciaType.Set_ID(Value: WideString);
begin
  ChildNodes['ID'].NodeValue := Value;
end;

function TXMLFuncionarioToleranciaType.Get_FuncionarioID: WideString;
begin
  Result := ChildNodes['FuncionarioID'].Text;
end;

procedure TXMLFuncionarioToleranciaType.Set_FuncionarioID(Value: WideString);
begin
  ChildNodes['FuncionarioID'].NodeValue := Value;
end;

function TXMLFuncionarioToleranciaType.Get_IgnoraToleranciaEntrada: Boolean;
begin
  Result := ChildNodes['IgnoraToleranciaEntrada'].NodeValue;
end;

procedure TXMLFuncionarioToleranciaType.Set_IgnoraToleranciaEntrada(Value: Boolean);
begin
  ChildNodes['IgnoraToleranciaEntrada'].NodeValue := Value;
end;

function TXMLFuncionarioToleranciaType.Get_IgnoraToleranciaEntradaAntecipada: Boolean;
begin
  Result := ChildNodes['IgnoraToleranciaEntradaAntecipada'].NodeValue;
end;

procedure TXMLFuncionarioToleranciaType.Set_IgnoraToleranciaEntradaAntecipada(Value: Boolean);
begin
  ChildNodes['IgnoraToleranciaEntradaAntecipada'].NodeValue := Value;
end;

function TXMLFuncionarioToleranciaType.Get_IgnoraToleranciaSaidaAlmoco: Boolean;
begin
  Result := ChildNodes['IgnoraToleranciaSaidaAlmoco'].NodeValue;
end;

procedure TXMLFuncionarioToleranciaType.Set_IgnoraToleranciaSaidaAlmoco(Value: Boolean);
begin
  ChildNodes['IgnoraToleranciaSaidaAlmoco'].NodeValue := Value;
end;

function TXMLFuncionarioToleranciaType.Get_IgnoraToleranciaSaidaAlmocoAntecipada: Boolean;
begin
  Result := ChildNodes['IgnoraToleranciaSaidaAlmocoAntecipada'].NodeValue;
end;

procedure TXMLFuncionarioToleranciaType.Set_IgnoraToleranciaSaidaAlmocoAntecipada(Value: Boolean);
begin
  ChildNodes['IgnoraToleranciaSaidaAlmocoAntecipada'].NodeValue := Value;
end;

function TXMLFuncionarioToleranciaType.Get_IgnoraToleranciaEntradaAlmoco: Boolean;
begin
  Result := ChildNodes['IgnoraToleranciaEntradaAlmoco'].NodeValue;
end;

procedure TXMLFuncionarioToleranciaType.Set_IgnoraToleranciaEntradaAlmoco(Value: Boolean);
begin
  ChildNodes['IgnoraToleranciaEntradaAlmoco'].NodeValue := Value;
end;

function TXMLFuncionarioToleranciaType.Get_IgnoraToleranciaEntradaAlmocoAntecipada: Boolean;
begin
  Result := ChildNodes['IgnoraToleranciaEntradaAlmocoAntecipada'].NodeValue;
end;

procedure TXMLFuncionarioToleranciaType.Set_IgnoraToleranciaEntradaAlmocoAntecipada(Value: Boolean);
begin
  ChildNodes['IgnoraToleranciaEntradaAlmocoAntecipada'].NodeValue := Value;
end;

function TXMLFuncionarioToleranciaType.Get_IgnoraToleranciaSaida: Boolean;
begin
  Result := ChildNodes['IgnoraToleranciaSaida'].NodeValue;
end;

procedure TXMLFuncionarioToleranciaType.Set_IgnoraToleranciaSaida(Value: Boolean);
begin
  ChildNodes['IgnoraToleranciaSaida'].NodeValue := Value;
end;

function TXMLFuncionarioToleranciaType.Get_IgnoraToleranciaSaidaAntecipada: Boolean;
begin
  Result := ChildNodes['IgnoraToleranciaSaidaAntecipada'].NodeValue;
end;

procedure TXMLFuncionarioToleranciaType.Set_IgnoraToleranciaSaidaAntecipada(Value: Boolean);
begin
  ChildNodes['IgnoraToleranciaSaidaAntecipada'].NodeValue := Value;
end;

function TXMLFuncionarioToleranciaType.Get_ToleranciaEntrada: Integer;
begin
  Result := ChildNodes['ToleranciaEntrada'].NodeValue;
end;

procedure TXMLFuncionarioToleranciaType.Set_ToleranciaEntrada(Value: Integer);
begin
  ChildNodes['ToleranciaEntrada'].NodeValue := Value;
end;

function TXMLFuncionarioToleranciaType.Get_ToleranciaEntradaAntecipada: Integer;
begin
  Result := ChildNodes['ToleranciaEntradaAntecipada'].NodeValue;
end;

procedure TXMLFuncionarioToleranciaType.Set_ToleranciaEntradaAntecipada(Value: Integer);
begin
  ChildNodes['ToleranciaEntradaAntecipada'].NodeValue := Value;
end;

function TXMLFuncionarioToleranciaType.Get_ToleranciaSaidaAlmoco: Integer;
begin
  Result := ChildNodes['ToleranciaSaidaAlmoco'].NodeValue;
end;

procedure TXMLFuncionarioToleranciaType.Set_ToleranciaSaidaAlmoco(Value: Integer);
begin
  ChildNodes['ToleranciaSaidaAlmoco'].NodeValue := Value;
end;

function TXMLFuncionarioToleranciaType.Get_ToleranciaSaidaAlmocoAntecipada: Integer;
begin
  Result := ChildNodes['ToleranciaSaidaAlmocoAntecipada'].NodeValue;
end;

procedure TXMLFuncionarioToleranciaType.Set_ToleranciaSaidaAlmocoAntecipada(Value: Integer);
begin
  ChildNodes['ToleranciaSaidaAlmocoAntecipada'].NodeValue := Value;
end;

function TXMLFuncionarioToleranciaType.Get_ToleranciaEntradaAlmoco: Integer;
begin
  Result := ChildNodes['ToleranciaEntradaAlmoco'].NodeValue;
end;

procedure TXMLFuncionarioToleranciaType.Set_ToleranciaEntradaAlmoco(Value: Integer);
begin
  ChildNodes['ToleranciaEntradaAlmoco'].NodeValue := Value;
end;

function TXMLFuncionarioToleranciaType.Get_ToleranciaEntradaAlmocoAntecipada: Integer;
begin
  Result := ChildNodes['ToleranciaEntradaAlmocoAntecipada'].NodeValue;
end;

procedure TXMLFuncionarioToleranciaType.Set_ToleranciaEntradaAlmocoAntecipada(Value: Integer);
begin
  ChildNodes['ToleranciaEntradaAlmocoAntecipada'].NodeValue := Value;
end;

function TXMLFuncionarioToleranciaType.Get_ToleranciaSaida: Integer;
begin
  Result := ChildNodes['ToleranciaSaida'].NodeValue;
end;

procedure TXMLFuncionarioToleranciaType.Set_ToleranciaSaida(Value: Integer);
begin
  ChildNodes['ToleranciaSaida'].NodeValue := Value;
end;

function TXMLFuncionarioToleranciaType.Get_ToleranciaSaidaAntecipada: Integer;
begin
  Result := ChildNodes['ToleranciaSaidaAntecipada'].NodeValue;
end;

procedure TXMLFuncionarioToleranciaType.Set_ToleranciaSaidaAntecipada(Value: Integer);
begin
  ChildNodes['ToleranciaSaidaAntecipada'].NodeValue := Value;
end;

function TXMLFuncionarioToleranciaType.Get_IdEmpresaExterno: Integer;
begin
  Result := ChildNodes['IdEmpresaExterno'].NodeValue;
end;

procedure TXMLFuncionarioToleranciaType.Set_IdEmpresaExterno(Value: Integer);
begin
  ChildNodes['IdEmpresaExterno'].NodeValue := Value;
end;

function TXMLFuncionarioToleranciaType.Get_IdFuncionarioExterno: WideString;
begin
  Result := ChildNodes['IdFuncionarioExterno'].Text;
end;

procedure TXMLFuncionarioToleranciaType.Set_IdFuncionarioExterno(Value: WideString);
begin
  ChildNodes['IdFuncionarioExterno'].NodeValue := Value;
end;

function TXMLFuncionarioToleranciaType.Get_TpPessoa: WideString;
begin
  Result := ChildNodes['TpPessoa'].Text;
end;

procedure TXMLFuncionarioToleranciaType.Set_TpPessoa(Value: WideString);
begin
  ChildNodes['TpPessoa'].NodeValue := Value;
end;

{ TXMLFuncionarioToleranciaTypeList }

function TXMLFuncionarioToleranciaTypeList.Add: IXMLFuncionarioToleranciaType;
begin
  Result := AddItem(-1) as IXMLFuncionarioToleranciaType;
end;

function TXMLFuncionarioToleranciaTypeList.Insert(const Index: Integer): IXMLFuncionarioToleranciaType;
begin
  Result := AddItem(Index) as IXMLFuncionarioToleranciaType;
end;
function TXMLFuncionarioToleranciaTypeList.Get_Item(Index: Integer): IXMLFuncionarioToleranciaType;
begin
  Result := List[Index] as IXMLFuncionarioToleranciaType;
end;

{ TXMLHorarioComplementarType }

function TXMLHorarioComplementarType.Get_ID: WideString;
begin
  Result := ChildNodes['ID'].Text;
end;

procedure TXMLHorarioComplementarType.Set_ID(Value: WideString);
begin
  ChildNodes['ID'].NodeValue := Value;
end;

function TXMLHorarioComplementarType.Get_GestorID: WideString;
begin
  Result := ChildNodes['GestorID'].Text;
end;

procedure TXMLHorarioComplementarType.Set_GestorID(Value: WideString);
begin
  ChildNodes['GestorID'].NodeValue := Value;
end;

function TXMLHorarioComplementarType.Get_FuncionarioID: WideString;
begin
  Result := ChildNodes['FuncionarioID'].Text;
end;

procedure TXMLHorarioComplementarType.Set_FuncionarioID(Value: WideString);
begin
  ChildNodes['FuncionarioID'].NodeValue := Value;
end;

function TXMLHorarioComplementarType.Get_Entrada: WideString;
begin
  Result := ChildNodes['Entrada'].Text;
end;

procedure TXMLHorarioComplementarType.Set_Entrada(Value: WideString);
begin
  ChildNodes['Entrada'].NodeValue := Value;
end;

function TXMLHorarioComplementarType.Get_SaidaAlmoco: WideString;
begin
  Result := ChildNodes['SaidaAlmoco'].Text;
end;

procedure TXMLHorarioComplementarType.Set_SaidaAlmoco(Value: WideString);
begin
  ChildNodes['SaidaAlmoco'].NodeValue := Value;
end;

function TXMLHorarioComplementarType.Get_EntradaAlmoco: WideString;
begin
  Result := ChildNodes['EntradaAlmoco'].Text;
end;

procedure TXMLHorarioComplementarType.Set_EntradaAlmoco(Value: WideString);
begin
  ChildNodes['EntradaAlmoco'].NodeValue := Value;
end;

function TXMLHorarioComplementarType.Get_Saida: WideString;
begin
  Result := ChildNodes['Saida'].Text;
end;

procedure TXMLHorarioComplementarType.Set_Saida(Value: WideString);
begin
  ChildNodes['Saida'].NodeValue := Value;
end;

function TXMLHorarioComplementarType.Get_SaidaIntervalo: WideString;
begin
  Result := ChildNodes['SaidaIntervalo'].Text;
end;

procedure TXMLHorarioComplementarType.Set_SaidaIntervalo(Value: WideString);
begin
  ChildNodes['SaidaIntervalo'].NodeValue := Value;
end;

function TXMLHorarioComplementarType.Get_EntradaIntervalo: WideString;
begin
  Result := ChildNodes['EntradaIntervalo'].Text;
end;

procedure TXMLHorarioComplementarType.Set_EntradaIntervalo(Value: WideString);
begin
  ChildNodes['EntradaIntervalo'].NodeValue := Value;
end;

function TXMLHorarioComplementarType.Get_Inicio: WideString;
begin
  Result := ChildNodes['Inicio'].Text;
end;

procedure TXMLHorarioComplementarType.Set_Inicio(Value: WideString);
begin
  ChildNodes['Inicio'].NodeValue := Value;
end;

function TXMLHorarioComplementarType.Get_Fim: WideString;
begin
  Result := ChildNodes['Fim'].Text;
end;

procedure TXMLHorarioComplementarType.Set_Fim(Value: WideString);
begin
  ChildNodes['Fim'].NodeValue := Value;
end;

function TXMLHorarioComplementarType.Get_DiaSemana: Integer;
begin
  Result := ChildNodes['DiaSemana'].NodeValue;
end;

procedure TXMLHorarioComplementarType.Set_DiaSemana(Value: Integer);
begin
  ChildNodes['DiaSemana'].NodeValue := Value;
end;

function TXMLHorarioComplementarType.Get_IdEmpresaExterno: Integer;
begin
  Result := ChildNodes['IdEmpresaExterno'].NodeValue;
end;

function TXMLHorarioComplementarType.Get_IdFuncionarioExterno: WideString;
begin
  Result := ChildNodes['IdFuncionarioExterno'].Text;
end;

function TXMLHorarioComplementarType.Get_TpPessoa: WideString;
begin
  Result := ChildNodes['TpPessoa'].Text;
end;

procedure TXMLHorarioComplementarType.Set_IdEmpresaExterno(Value: Integer);
begin
  ChildNodes['IdEmpresaExterno'].NodeValue := Value;
end;

procedure TXMLHorarioComplementarType.Set_IdFuncionarioExterno(
  Value: WideString);
begin
  ChildNodes['IdFuncionarioExterno'].NodeValue := Value;
end;

procedure TXMLHorarioComplementarType.Set_TpPessoa(Value: WideString);
begin
  ChildNodes['TpPessoa'].NodeValue := Value;
end;

{ TXMLHorarioComplementarTypeList }

function TXMLHorarioComplementarTypeList.Add: IXMLHorarioComplementarType;
begin
  Result := AddItem(-1) as IXMLHorarioComplementarType;
end;

function TXMLHorarioComplementarTypeList.Insert(const Index: Integer): IXMLHorarioComplementarType;
begin
  Result := AddItem(Index) as IXMLHorarioComplementarType;
end;
function TXMLHorarioComplementarTypeList.Get_Item(Index: Integer): IXMLHorarioComplementarType;
begin
  Result := List[Index] as IXMLHorarioComplementarType;
end;

{ TXMLHorarioEscalaType }

function TXMLHorarioEscalaType.Get_ID: WideString;
begin
  Result := ChildNodes['ID'].Text;
end;

procedure TXMLHorarioEscalaType.Set_ID(Value: WideString);
begin
  ChildNodes['ID'].NodeValue := Value;
end;

function TXMLHorarioEscalaType.Get_GestorID: WideString;
begin
  Result := ChildNodes['GestorID'].Text;
end;

procedure TXMLHorarioEscalaType.Set_GestorID(Value: WideString);
begin
  ChildNodes['GestorID'].NodeValue := Value;
end;

function TXMLHorarioEscalaType.Get_FuncionarioID: WideString;
begin
  Result := ChildNodes['FuncionarioID'].Text;
end;

procedure TXMLHorarioEscalaType.Set_FuncionarioID(Value: WideString);
begin
  ChildNodes['FuncionarioID'].NodeValue := Value;
end;

function TXMLHorarioEscalaType.Get_Entrada: WideString;
begin
  Result := ChildNodes['Entrada'].Text;
end;

procedure TXMLHorarioEscalaType.Set_Entrada(Value: WideString);
begin
  ChildNodes['Entrada'].NodeValue := Value;
end;

function TXMLHorarioEscalaType.Get_SaidaAlmoco: WideString;
begin
  Result := ChildNodes['SaidaAlmoco'].Text;
end;

procedure TXMLHorarioEscalaType.Set_SaidaAlmoco(Value: WideString);
begin
  ChildNodes['SaidaAlmoco'].NodeValue := Value;
end;

function TXMLHorarioEscalaType.Get_EntradaAlmoco: WideString;
begin
  Result := ChildNodes['EntradaAlmoco'].Text;
end;

procedure TXMLHorarioEscalaType.Set_EntradaAlmoco(Value: WideString);
begin
  ChildNodes['EntradaAlmoco'].NodeValue := Value;
end;

function TXMLHorarioEscalaType.Get_Saida: WideString;
begin
  Result := ChildNodes['Saida'].Text;
end;

procedure TXMLHorarioEscalaType.Set_Saida(Value: WideString);
begin
  ChildNodes['Saida'].NodeValue := Value;
end;

function TXMLHorarioEscalaType.Get_SaidaIntervalo: WideString;
begin
  Result := ChildNodes['SaidaIntervalo'].Text;
end;

procedure TXMLHorarioEscalaType.Set_SaidaIntervalo(Value: WideString);
begin
  ChildNodes['SaidaIntervalo'].NodeValue := Value;
end;

function TXMLHorarioEscalaType.Get_EntradaIntervalo: WideString;
begin
  Result := ChildNodes['EntradaIntervalo'].Text;
end;

procedure TXMLHorarioEscalaType.Set_EntradaIntervalo(Value: WideString);
begin
  ChildNodes['EntradaIntervalo'].NodeValue := Value;
end;

function TXMLHorarioEscalaType.Get_Referencia: WideString;
begin
  Result := ChildNodes['Referencia'].Text;
end;

procedure TXMLHorarioEscalaType.Set_Referencia(Value: WideString);
begin
  ChildNodes['Referencia'].NodeValue := Value;
end;

function TXMLHorarioEscalaType.Get_Folga: Boolean;
begin
  Result := ChildNodes['Folga'].NodeValue;
end;

procedure TXMLHorarioEscalaType.Set_Folga(Value: Boolean);
begin
  ChildNodes['Folga'].NodeValue := Value;
end;

function TXMLHorarioEscalaType.Get_IdEmpresaExterno: Integer;
begin
  Result := ChildNodes['IdEmpresaExterno'].NodeValue;
end;

function TXMLHorarioEscalaType.Get_IdFuncionarioExterno: WideString;
begin
  Result := ChildNodes['IdFuncionarioExterno'].Text;
end;

function TXMLHorarioEscalaType.Get_TpPessoa: WideString;
begin
  Result := ChildNodes['TpPessoa'].Text;
end;

procedure TXMLHorarioEscalaType.Set_IdEmpresaExterno(Value: Integer);
begin
  ChildNodes['IdEmpresaExterno'].NodeValue := Value;
end;

procedure TXMLHorarioEscalaType.Set_IdFuncionarioExterno(
  Value: WideString);
begin
  ChildNodes['IdFuncionarioExterno'].NodeValue := Value;
end;

procedure TXMLHorarioEscalaType.Set_TpPessoa(Value: WideString);
begin
  ChildNodes['TpPessoa'].NodeValue := Value;
end;

{ TXMLHorarioEscalaTypeList }

function TXMLHorarioEscalaTypeList.Add: IXMLHorarioEscalaType;
begin
  Result := AddItem(-1) as IXMLHorarioEscalaType;
end;

function TXMLHorarioEscalaTypeList.Insert(const Index: Integer): IXMLHorarioEscalaType;
begin
  Result := AddItem(Index) as IXMLHorarioEscalaType;
end;
function TXMLHorarioEscalaTypeList.Get_Item(Index: Integer): IXMLHorarioEscalaType;
begin
  Result := List[Index] as IXMLHorarioEscalaType;
end;

{ TXMLHorarioTurnoType }

function TXMLHorarioTurnoType.Get_ID: WideString;
begin
  Result := ChildNodes['ID'].Text;
end;

procedure TXMLHorarioTurnoType.Set_ID(Value: WideString);
begin
  ChildNodes['ID'].NodeValue := Value;
end;

function TXMLHorarioTurnoType.Get_GestorID: WideString;
begin
  Result := ChildNodes['GestorID'].Text;
end;

procedure TXMLHorarioTurnoType.Set_GestorID(Value: WideString);
begin
  ChildNodes['GestorID'].NodeValue := Value;
end;

function TXMLHorarioTurnoType.Get_FuncionarioID: WideString;
begin
  Result := ChildNodes['FuncionarioID'].Text;
end;

procedure TXMLHorarioTurnoType.Set_FuncionarioID(Value: WideString);
begin
  ChildNodes['FuncionarioID'].NodeValue := Value;
end;

function TXMLHorarioTurnoType.Get_Entrada: WideString;
begin
  Result := ChildNodes['Entrada'].Text;
end;

procedure TXMLHorarioTurnoType.Set_Entrada(Value: WideString);
begin
  ChildNodes['Entrada'].NodeValue := Value;
end;

function TXMLHorarioTurnoType.Get_SaidaAlmoco: WideString;
begin
  Result := ChildNodes['SaidaAlmoco'].Text;
end;

procedure TXMLHorarioTurnoType.Set_SaidaAlmoco(Value: WideString);
begin
  ChildNodes['SaidaAlmoco'].NodeValue := Value;
end;

function TXMLHorarioTurnoType.Get_EntradaAlmoco: WideString;
begin
  Result := ChildNodes['EntradaAlmoco'].Text;
end;

procedure TXMLHorarioTurnoType.Set_EntradaAlmoco(Value: WideString);
begin
  ChildNodes['EntradaAlmoco'].NodeValue := Value;
end;

function TXMLHorarioTurnoType.Get_Saida: WideString;
begin
  Result := ChildNodes['Saida'].Text;
end;

procedure TXMLHorarioTurnoType.Set_Saida(Value: WideString);
begin
  ChildNodes['Saida'].NodeValue := Value;
end;

function TXMLHorarioTurnoType.Get_SaidaIntervalo: WideString;
begin
  Result := ChildNodes['SaidaIntervalo'].Text;
end;

procedure TXMLHorarioTurnoType.Set_SaidaIntervalo(Value: WideString);
begin
  ChildNodes['SaidaIntervalo'].NodeValue := Value;
end;

function TXMLHorarioTurnoType.Get_EntradaIntervalo: WideString;
begin
  Result := ChildNodes['EntradaIntervalo'].Text;
end;

procedure TXMLHorarioTurnoType.Set_EntradaIntervalo(Value: WideString);
begin
  ChildNodes['EntradaIntervalo'].NodeValue := Value;
end;

function TXMLHorarioTurnoType.Get_Inicio: WideString;
begin
  Result := ChildNodes['Inicio'].Text;
end;

procedure TXMLHorarioTurnoType.Set_Inicio(Value: WideString);
begin
  ChildNodes['Inicio'].NodeValue := Value;
end;

function TXMLHorarioTurnoType.Get_Fim: WideString;
begin
  Result := ChildNodes['Fim'].Text;
end;

procedure TXMLHorarioTurnoType.Set_Fim(Value: WideString);
begin
  ChildNodes['Fim'].NodeValue := Value;
end;

function TXMLHorarioTurnoType.Get_Tipo: WideString;
begin
  Result := ChildNodes['Tipo'].Text;
end;

procedure TXMLHorarioTurnoType.Set_Tipo(Value: WideString);
begin
  ChildNodes['Tipo'].NodeValue := Value;
end;

function TXMLHorarioTurnoType.Get_IdEmpresaExterno: Integer;
begin
  Result := ChildNodes['IdEmpresaExterno'].NodeValue;
end;

function TXMLHorarioTurnoType.Get_IdFuncionarioExterno: WideString;
begin
  Result := ChildNodes['idFuncionarioExterno'].Text;
end;

function TXMLHorarioTurnoType.Get_TpPessoa: WideString;
begin
  Result := ChildNodes['TpPessoa'].Text;
end;

procedure TXMLHorarioTurnoType.Set_IdEmpresaExterno(Value: Integer);
begin
  ChildNodes['IdEmpresaExterno'].NodeValue := Value;
end;

procedure TXMLHorarioTurnoType.Set_IdFuncionarioExterno(Value: WideString);
begin
  ChildNodes['IdFuncionarioExterno'].NodeValue := Value;
end;

procedure TXMLHorarioTurnoType.Set_TpPessoa(Value: WideString);
begin
  ChildNodes['TpPessoa'].NodeValue := Value;
end;

{ TXMLHorarioTurnoTypeList }

function TXMLHorarioTurnoTypeList.Add: IXMLHorarioTurnoType;
begin
  Result := AddItem(-1) as IXMLHorarioTurnoType;
end;

function TXMLHorarioTurnoTypeList.Insert(const Index: Integer): IXMLHorarioTurnoType;
begin
  Result := AddItem(Index) as IXMLHorarioTurnoType;
end;
function TXMLHorarioTurnoTypeList.Get_Item(Index: Integer): IXMLHorarioTurnoType;
begin
  Result := List[Index] as IXMLHorarioTurnoType;
end;

end.

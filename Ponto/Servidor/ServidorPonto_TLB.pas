unit ServidorPonto_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 05/05/2015 11:14:31 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Edson\Projetos\Ponto\Servidor\ServidorPonto.tlb (1)
// LIBID: {7C8A86DD-53D8-432E-99B4-74D981247386}
// LCID: 0
// Helpfile: 
// HelpString: ServidorPonto Library
// DepndLst: 
//   (1) v1.0 Midas, (C:\Windows\SysWOW64\midas.dll)
//   (2) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, Midas, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  ServidorPontoMajorVersion = 1;
  ServidorPontoMinorVersion = 0;

  LIBID_ServidorPonto: TGUID = '{7C8A86DD-53D8-432E-99B4-74D981247386}';

  IID_IRDM_Funcionario: TGUID = '{2517DBBC-FC50-4F35-B43A-36CCB8FD33BC}';
  CLASS_RDM_Funcionario: TGUID = '{24470B2D-9AC3-49F4-8D37-691FD30652DB}';
  IID_IRDM_EMPRESA: TGUID = '{18BBF8C4-E0C7-43DC-A017-F213309884B1}';
  CLASS_RDM_EMPRESA: TGUID = '{C2DABBFE-319C-4FA0-B623-C31018AC4D85}';
  IID_IRDM_Usuario: TGUID = '{32DC172F-476B-462E-8426-BA7C48C9C83D}';
  CLASS_RDM_Usuario: TGUID = '{0E960896-7C4B-47F1-98E4-F05DF3D3B20B}';
  IID_IRDM_Horario: TGUID = '{250E5C5F-4038-4F27-A050-B102C0AEFA44}';
  CLASS_RDM_Horario: TGUID = '{2FCF1EB1-A88D-4A9E-BC8A-F7FB5AC549A0}';
  IID_IRDM_Feriado: TGUID = '{D17ECCE5-8E17-49CC-9520-B8D6FDDD700D}';
  CLASS_RDM_Feriado: TGUID = '{0ACB3AC8-8C5E-4F1D-BD9E-31F892AE3C49}';
  IID_IRDM_Utils: TGUID = '{4399BC04-7FBF-4FDD-AA9F-B5A887FD1D3C}';
  CLASS_RDM_Utils: TGUID = '{A402B49E-86E7-4566-8303-F9441EF36CC0}';
  IID_IRDM_Municipio: TGUID = '{83EC3666-1CBB-4941-87DD-57DFC63E5E06}';
  CLASS_RDM_Municipio: TGUID = '{1ACB962D-2867-47F5-AF58-7263FA47615C}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IRDM_Funcionario = interface;
  IRDM_FuncionarioDisp = dispinterface;
  IRDM_EMPRESA = interface;
  IRDM_EMPRESADisp = dispinterface;
  IRDM_Usuario = interface;
  IRDM_UsuarioDisp = dispinterface;
  IRDM_Horario = interface;
  IRDM_HorarioDisp = dispinterface;
  IRDM_Feriado = interface;
  IRDM_FeriadoDisp = dispinterface;
  IRDM_Utils = interface;
  IRDM_UtilsDisp = dispinterface;
  IRDM_Municipio = interface;
  IRDM_MunicipioDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  RDM_Funcionario = IRDM_Funcionario;
  RDM_EMPRESA = IRDM_EMPRESA;
  RDM_Usuario = IRDM_Usuario;
  RDM_Horario = IRDM_Horario;
  RDM_Feriado = IRDM_Feriado;
  RDM_Utils = IRDM_Utils;
  RDM_Municipio = IRDM_Municipio;


// *********************************************************************//
// Interface: IRDM_Funcionario
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2517DBBC-FC50-4F35-B43A-36CCB8FD33BC}
// *********************************************************************//
  IRDM_Funcionario = interface(IAppServer)
    ['{2517DBBC-FC50-4F35-B43A-36CCB8FD33BC}']
    procedure Deletar(ID: Double); safecall;
  end;

// *********************************************************************//
// DispIntf:  IRDM_FuncionarioDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2517DBBC-FC50-4F35-B43A-36CCB8FD33BC}
// *********************************************************************//
  IRDM_FuncionarioDisp = dispinterface
    ['{2517DBBC-FC50-4F35-B43A-36CCB8FD33BC}']
    procedure Deletar(ID: Double); dispid 301;
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer; 
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                           Options: Integer; const CommandText: WideString; var Params: OleVariant; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// Interface: IRDM_EMPRESA
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {18BBF8C4-E0C7-43DC-A017-F213309884B1}
// *********************************************************************//
  IRDM_EMPRESA = interface(IAppServer)
    ['{18BBF8C4-E0C7-43DC-A017-F213309884B1}']
    procedure Deletar(ID: Double); safecall;
  end;

// *********************************************************************//
// DispIntf:  IRDM_EMPRESADisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {18BBF8C4-E0C7-43DC-A017-F213309884B1}
// *********************************************************************//
  IRDM_EMPRESADisp = dispinterface
    ['{18BBF8C4-E0C7-43DC-A017-F213309884B1}']
    procedure Deletar(ID: Double); dispid 301;
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer; 
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                           Options: Integer; const CommandText: WideString; var Params: OleVariant; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// Interface: IRDM_Usuario
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {32DC172F-476B-462E-8426-BA7C48C9C83D}
// *********************************************************************//
  IRDM_Usuario = interface(IAppServer)
    ['{32DC172F-476B-462E-8426-BA7C48C9C83D}']
    procedure Deletar(ID: Double); safecall;
  end;

// *********************************************************************//
// DispIntf:  IRDM_UsuarioDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {32DC172F-476B-462E-8426-BA7C48C9C83D}
// *********************************************************************//
  IRDM_UsuarioDisp = dispinterface
    ['{32DC172F-476B-462E-8426-BA7C48C9C83D}']
    procedure Deletar(ID: Double); dispid 301;
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer; 
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                           Options: Integer; const CommandText: WideString; var Params: OleVariant; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// Interface: IRDM_Horario
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {250E5C5F-4038-4F27-A050-B102C0AEFA44}
// *********************************************************************//
  IRDM_Horario = interface(IAppServer)
    ['{250E5C5F-4038-4F27-A050-B102C0AEFA44}']
    procedure Deletar(ID: Double); safecall;
  end;

// *********************************************************************//
// DispIntf:  IRDM_HorarioDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {250E5C5F-4038-4F27-A050-B102C0AEFA44}
// *********************************************************************//
  IRDM_HorarioDisp = dispinterface
    ['{250E5C5F-4038-4F27-A050-B102C0AEFA44}']
    procedure Deletar(ID: Double); dispid 301;
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer; 
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                           Options: Integer; const CommandText: WideString; var Params: OleVariant; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// Interface: IRDM_Feriado
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D17ECCE5-8E17-49CC-9520-B8D6FDDD700D}
// *********************************************************************//
  IRDM_Feriado = interface(IAppServer)
    ['{D17ECCE5-8E17-49CC-9520-B8D6FDDD700D}']
    procedure Deletar(ID: Double); safecall;
  end;

// *********************************************************************//
// DispIntf:  IRDM_FeriadoDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D17ECCE5-8E17-49CC-9520-B8D6FDDD700D}
// *********************************************************************//
  IRDM_FeriadoDisp = dispinterface
    ['{D17ECCE5-8E17-49CC-9520-B8D6FDDD700D}']
    procedure Deletar(ID: Double); dispid 301;
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer; 
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                           Options: Integer; const CommandText: WideString; var Params: OleVariant; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// Interface: IRDM_Utils
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4399BC04-7FBF-4FDD-AA9F-B5A887FD1D3C}
// *********************************************************************//
  IRDM_Utils = interface(IAppServer)
    ['{4399BC04-7FBF-4FDD-AA9F-B5A887FD1D3C}']
  end;

// *********************************************************************//
// DispIntf:  IRDM_UtilsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4399BC04-7FBF-4FDD-AA9F-B5A887FD1D3C}
// *********************************************************************//
  IRDM_UtilsDisp = dispinterface
    ['{4399BC04-7FBF-4FDD-AA9F-B5A887FD1D3C}']
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer; 
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                           Options: Integer; const CommandText: WideString; var Params: OleVariant; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// Interface: IRDM_Municipio
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {83EC3666-1CBB-4941-87DD-57DFC63E5E06}
// *********************************************************************//
  IRDM_Municipio = interface(IAppServer)
    ['{83EC3666-1CBB-4941-87DD-57DFC63E5E06}']
    procedure Deletar(ID: Double); safecall;
  end;

// *********************************************************************//
// DispIntf:  IRDM_MunicipioDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {83EC3666-1CBB-4941-87DD-57DFC63E5E06}
// *********************************************************************//
  IRDM_MunicipioDisp = dispinterface
    ['{83EC3666-1CBB-4941-87DD-57DFC63E5E06}']
    procedure Deletar(ID: Double); dispid 301;
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer; 
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                           Options: Integer; const CommandText: WideString; var Params: OleVariant; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoRDM_Funcionario provides a Create and CreateRemote method to          
// create instances of the default interface IRDM_Funcionario exposed by              
// the CoClass RDM_Funcionario. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRDM_Funcionario = class
    class function Create: IRDM_Funcionario;
    class function CreateRemote(const MachineName: string): IRDM_Funcionario;
  end;

// *********************************************************************//
// The Class CoRDM_EMPRESA provides a Create and CreateRemote method to          
// create instances of the default interface IRDM_EMPRESA exposed by              
// the CoClass RDM_EMPRESA. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRDM_EMPRESA = class
    class function Create: IRDM_EMPRESA;
    class function CreateRemote(const MachineName: string): IRDM_EMPRESA;
  end;

// *********************************************************************//
// The Class CoRDM_Usuario provides a Create and CreateRemote method to          
// create instances of the default interface IRDM_Usuario exposed by              
// the CoClass RDM_Usuario. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRDM_Usuario = class
    class function Create: IRDM_Usuario;
    class function CreateRemote(const MachineName: string): IRDM_Usuario;
  end;

// *********************************************************************//
// The Class CoRDM_Horario provides a Create and CreateRemote method to          
// create instances of the default interface IRDM_Horario exposed by              
// the CoClass RDM_Horario. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRDM_Horario = class
    class function Create: IRDM_Horario;
    class function CreateRemote(const MachineName: string): IRDM_Horario;
  end;

// *********************************************************************//
// The Class CoRDM_Feriado provides a Create and CreateRemote method to          
// create instances of the default interface IRDM_Feriado exposed by              
// the CoClass RDM_Feriado. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRDM_Feriado = class
    class function Create: IRDM_Feriado;
    class function CreateRemote(const MachineName: string): IRDM_Feriado;
  end;

// *********************************************************************//
// The Class CoRDM_Utils provides a Create and CreateRemote method to          
// create instances of the default interface IRDM_Utils exposed by              
// the CoClass RDM_Utils. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRDM_Utils = class
    class function Create: IRDM_Utils;
    class function CreateRemote(const MachineName: string): IRDM_Utils;
  end;

// *********************************************************************//
// The Class CoRDM_Municipio provides a Create and CreateRemote method to          
// create instances of the default interface IRDM_Municipio exposed by              
// the CoClass RDM_Municipio. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRDM_Municipio = class
    class function Create: IRDM_Municipio;
    class function CreateRemote(const MachineName: string): IRDM_Municipio;
  end;

implementation

uses ComObj;

class function CoRDM_Funcionario.Create: IRDM_Funcionario;
begin
  Result := CreateComObject(CLASS_RDM_Funcionario) as IRDM_Funcionario;
end;

class function CoRDM_Funcionario.CreateRemote(const MachineName: string): IRDM_Funcionario;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RDM_Funcionario) as IRDM_Funcionario;
end;

class function CoRDM_EMPRESA.Create: IRDM_EMPRESA;
begin
  Result := CreateComObject(CLASS_RDM_EMPRESA) as IRDM_EMPRESA;
end;

class function CoRDM_EMPRESA.CreateRemote(const MachineName: string): IRDM_EMPRESA;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RDM_EMPRESA) as IRDM_EMPRESA;
end;

class function CoRDM_Usuario.Create: IRDM_Usuario;
begin
  Result := CreateComObject(CLASS_RDM_Usuario) as IRDM_Usuario;
end;

class function CoRDM_Usuario.CreateRemote(const MachineName: string): IRDM_Usuario;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RDM_Usuario) as IRDM_Usuario;
end;

class function CoRDM_Horario.Create: IRDM_Horario;
begin
  Result := CreateComObject(CLASS_RDM_Horario) as IRDM_Horario;
end;

class function CoRDM_Horario.CreateRemote(const MachineName: string): IRDM_Horario;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RDM_Horario) as IRDM_Horario;
end;

class function CoRDM_Feriado.Create: IRDM_Feriado;
begin
  Result := CreateComObject(CLASS_RDM_Feriado) as IRDM_Feriado;
end;

class function CoRDM_Feriado.CreateRemote(const MachineName: string): IRDM_Feriado;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RDM_Feriado) as IRDM_Feriado;
end;

class function CoRDM_Utils.Create: IRDM_Utils;
begin
  Result := CreateComObject(CLASS_RDM_Utils) as IRDM_Utils;
end;

class function CoRDM_Utils.CreateRemote(const MachineName: string): IRDM_Utils;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RDM_Utils) as IRDM_Utils;
end;

class function CoRDM_Municipio.Create: IRDM_Municipio;
begin
  Result := CreateComObject(CLASS_RDM_Municipio) as IRDM_Municipio;
end;

class function CoRDM_Municipio.CreateRemote(const MachineName: string): IRDM_Municipio;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RDM_Municipio) as IRDM_Municipio;
end;

end.

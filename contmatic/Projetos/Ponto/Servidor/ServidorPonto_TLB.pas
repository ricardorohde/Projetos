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
// File generated on 31/03/2015 18:34:54 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Edson\Projetos\Ponto\Servidor\ServidorPonto.tlb (1)
// LIBID: {7C8A86DD-53D8-432E-99B4-74D981247386}
// LCID: 0
// Helpfile: 
// HelpString: ServidorPonto Library
// DepndLst: 
//   (1) v1.0 Midas, (C:\Phoenix\midas.dll)
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
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IRDM_Funcionario = interface;
  IRDM_FuncionarioDisp = dispinterface;
  IRDM_EMPRESA = interface;
  IRDM_EMPRESADisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  RDM_Funcionario = IRDM_Funcionario;
  RDM_EMPRESA = IRDM_EMPRESA;


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

end.

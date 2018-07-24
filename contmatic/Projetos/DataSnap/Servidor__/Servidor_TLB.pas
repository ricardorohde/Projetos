unit Servidor_TLB;

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
// File generated on 27/03/2015 12:05:41 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Edson\Projetos\DataSnap\Servidor\Servidor.tlb (1)
// LIBID: {686919E7-7BC3-4D93-9822-5388E346FA2A}
// LCID: 0
// Helpfile: 
// HelpString: Servidor Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v1.0 Midas, (C:\Phoenix\midas.dll)
//   (3) v4.0 StdVCL, (C:\Windows\SysWOW64\stdvcl40.dll)
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
  ServidorMajorVersion = 1;
  ServidorMinorVersion = 0;

  LIBID_Servidor: TGUID = '{686919E7-7BC3-4D93-9822-5388E346FA2A}';

  IID_ISERVER: TGUID = '{E6E3E8EF-B25D-409F-B2FA-74994766EF05}';
  CLASS_SERVER: TGUID = '{8895EAAE-4E06-4C34-8F4C-5A3461D3ED8F}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ISERVER = interface;
  ISERVERDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  SERVER = ISERVER;


// *********************************************************************//
// Interface: ISERVER
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E6E3E8EF-B25D-409F-B2FA-74994766EF05}
// *********************************************************************//
  ISERVER = interface(IAppServer)
    ['{E6E3E8EF-B25D-409F-B2FA-74994766EF05}']
  end;

// *********************************************************************//
// DispIntf:  ISERVERDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E6E3E8EF-B25D-409F-B2FA-74994766EF05}
// *********************************************************************//
  ISERVERDisp = dispinterface
    ['{E6E3E8EF-B25D-409F-B2FA-74994766EF05}']
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
// The Class CoSERVER provides a Create and CreateRemote method to          
// create instances of the default interface ISERVER exposed by              
// the CoClass SERVER. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSERVER = class
    class function Create: ISERVER;
    class function CreateRemote(const MachineName: string): ISERVER;
  end;

implementation

uses ComObj;

class function CoSERVER.Create: ISERVER;
begin
  Result := CreateComObject(CLASS_SERVER) as ISERVER;
end;

class function CoSERVER.CreateRemote(const MachineName: string): ISERVER;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SERVER) as ISERVER;
end;

end.

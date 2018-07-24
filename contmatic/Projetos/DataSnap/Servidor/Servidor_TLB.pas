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
// File generated on 27/03/2015 14:18:01 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Edson\Projetos\DataSnap\Servidor\Servidor.tlb (1)
// LIBID: {69FC1A0A-0BE6-4E19-913C-9A67F2D67A6C}
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

  LIBID_Servidor: TGUID = '{69FC1A0A-0BE6-4E19-913C-9A67F2D67A6C}';

  IID_IDataSnapServer: TGUID = '{002CB3E1-14BA-4EFA-A716-48406C0B66C6}';
  CLASS_DataSnapServer: TGUID = '{773F1CB1-3295-49DD-940C-7EF7F47A2D37}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IDataSnapServer = interface;
  IDataSnapServerDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  DataSnapServer = IDataSnapServer;


// *********************************************************************//
// Interface: IDataSnapServer
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {002CB3E1-14BA-4EFA-A716-48406C0B66C6}
// *********************************************************************//
  IDataSnapServer = interface(IAppServer)
    ['{002CB3E1-14BA-4EFA-A716-48406C0B66C6}']
  end;

// *********************************************************************//
// DispIntf:  IDataSnapServerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {002CB3E1-14BA-4EFA-A716-48406C0B66C6}
// *********************************************************************//
  IDataSnapServerDisp = dispinterface
    ['{002CB3E1-14BA-4EFA-A716-48406C0B66C6}']
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
// The Class CoDataSnapServer provides a Create and CreateRemote method to          
// create instances of the default interface IDataSnapServer exposed by              
// the CoClass DataSnapServer. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDataSnapServer = class
    class function Create: IDataSnapServer;
    class function CreateRemote(const MachineName: string): IDataSnapServer;
  end;

implementation

uses ComObj;

class function CoDataSnapServer.Create: IDataSnapServer;
begin
  Result := CreateComObject(CLASS_DataSnapServer) as IDataSnapServer;
end;

class function CoDataSnapServer.CreateRemote(const MachineName: string): IDataSnapServer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DataSnapServer) as IDataSnapServer;
end;

end.

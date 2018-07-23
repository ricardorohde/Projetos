unit Server_TLB;

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

// PASTLWTR : $Revision:   1.88  $
// File generated on 8/28/99 4:57:10 PM from Type Library described below.

// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
// ************************************************************************ //
// Type Lib: D:\Borland\Argus\Projects\Demos\3Tier\Server.tlb (1)
// IID\LCID: {50982DA6-5D34-11D3-BDA2-008048C61588}\0
// Helpfile: 
// DepndLst: 
//   (1) v1.0 Midas, (C:\WINNT\System32\midas.dll)
//   (2) v2.0 stdole, (C:\WINNT\System32\STDOLE2.TLB)
//   (3) v4.0 StdVCL, (C:\WINNT\System32\STDVCL40.DLL)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, OleCtrls, StdVCL, 
  MIDAS;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  ServerMajorVersion = 1;
  ServerMinorVersion = 0;

  LIBID_Server: TGUID = '{50982DA6-5D34-11D3-BDA2-008048C61588}';

  IID_IServerDMClass: TGUID = '{50982DA7-5D34-11D3-BDA2-008048C61588}';
  CLASS_ServerDMClass: TGUID = '{50982DA9-5D34-11D3-BDA2-008048C61588}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IServerDMClass = interface;
  IServerDMClassDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  ServerDMClass = IServerDMClass;


// *********************************************************************//
// Interface: IServerDMClass
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {50982DA7-5D34-11D3-BDA2-008048C61588}
// *********************************************************************//
  IServerDMClass = interface(IAppServer)
    ['{50982DA7-5D34-11D3-BDA2-008048C61588}']
    function  Login(const Username: WideString; const Password: WideString): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IServerDMClassDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {50982DA7-5D34-11D3-BDA2-008048C61588}
// *********************************************************************//
  IServerDMClassDisp = dispinterface
    ['{50982DA7-5D34-11D3-BDA2-008048C61588}']
    function  Login(const Username: WideString; const Password: WideString): WordBool; dispid 1;
    function  AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                              MaxErrors: Integer; out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function  AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                            Options: Integer; const CommandText: WideString; 
                            var Params: OleVariant; var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function  AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function  AS_GetProviderNames: OleVariant; dispid 20000003;
    function  AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function  AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                            var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoServerDMClass provides a Create and CreateRemote method to          
// create instances of the default interface IServerDMClass exposed by              
// the CoClass ServerDMClass. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoServerDMClass = class
    class function Create: IServerDMClass;
    class function CreateRemote(const MachineName: string): IServerDMClass;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TServerDMClass
// Help String      : ServerDMClass Object
// Default Interface: IServerDMClass
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TServerDMClassProperties= class;
{$ENDIF}
  TServerDMClass = class(TOleServer)
  private
    FIntf:        IServerDMClass;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TServerDMClassProperties;
    function      GetServerProperties: TServerDMClassProperties;
{$ENDIF}
    function      GetDefaultInterface: IServerDMClass;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IServerDMClass);
    procedure Disconnect; override;
    function  AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                              MaxErrors: Integer; out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant;
    function  AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                            Options: Integer; const CommandText: WideString; 
                            var Params: OleVariant; var OwnerData: OleVariant): OleVariant;
    function  AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant;
    function  AS_GetProviderNames: OleVariant;
    function  AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant;
    function  AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                            var OwnerData: OleVariant): OleVariant;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant);
    function  Login(const Username: WideString; const Password: WideString): WordBool;
    property  DefaultInterface: IServerDMClass read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TServerDMClassProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TServerDMClass
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TServerDMClassProperties = class(TPersistent)
  private
    FServer:    TServerDMClass;
    function    GetDefaultInterface: IServerDMClass;
    constructor Create(AServer: TServerDMClass);
  protected
  public
    property DefaultInterface: IServerDMClass read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

implementation

uses ComObj;

class function CoServerDMClass.Create: IServerDMClass;
begin
  Result := CreateComObject(CLASS_ServerDMClass) as IServerDMClass;
end;

class function CoServerDMClass.CreateRemote(const MachineName: string): IServerDMClass;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ServerDMClass) as IServerDMClass;
end;

procedure TServerDMClass.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{50982DA9-5D34-11D3-BDA2-008048C61588}';
    IntfIID:   '{50982DA7-5D34-11D3-BDA2-008048C61588}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TServerDMClass.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IServerDMClass;
  end;
end;

procedure TServerDMClass.ConnectTo(svrIntf: IServerDMClass);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TServerDMClass.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TServerDMClass.GetDefaultInterface: IServerDMClass;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TServerDMClass.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TServerDMClassProperties.Create(Self);
{$ENDIF}
end;

destructor TServerDMClass.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TServerDMClass.GetServerProperties: TServerDMClassProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TServerDMClass.AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                                         MaxErrors: Integer; out ErrorCount: Integer; 
                                         var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_ApplyUpdates(ProviderName, Delta, MaxErrors, ErrorCount, OwnerData);
end;

function  TServerDMClass.AS_GetRecords(const ProviderName: WideString; Count: Integer; 
                                       out RecsOut: Integer; Options: Integer; 
                                       const CommandText: WideString; var Params: OleVariant; 
                                       var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_GetRecords(ProviderName, Count, RecsOut, Options, CommandText, 
                                           Params, OwnerData);
end;

function  TServerDMClass.AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_DataRequest(ProviderName, Data);
end;

function  TServerDMClass.AS_GetProviderNames: OleVariant;
begin
  Result := DefaultInterface.AS_GetProviderNames;
end;

function  TServerDMClass.AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_GetParams(ProviderName, OwnerData);
end;

function  TServerDMClass.AS_RowRequest(const ProviderName: WideString; Row: OleVariant; 
                                       RequestType: Integer; var OwnerData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.AS_RowRequest(ProviderName, Row, RequestType, OwnerData);
end;

procedure TServerDMClass.AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                                    var Params: OleVariant; var OwnerData: OleVariant);
begin
  DefaultInterface.AS_Execute(ProviderName, CommandText, Params, OwnerData);
end;

function  TServerDMClass.Login(const Username: WideString; const Password: WideString): WordBool;
begin
  Result := DefaultInterface.Login(Username, Password);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TServerDMClassProperties.Create(AServer: TServerDMClass);
begin
  inherited Create;
  FServer := AServer;
end;

function TServerDMClassProperties.GetDefaultInterface: IServerDMClass;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents('Servers',[TServerDMClass]);
end;

end.

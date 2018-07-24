unit AlterdataSystemUtils;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

  function IsWindows64: Boolean;
  function GetDirectorySystem: string;

implementation

function IsWindows64: Boolean;
type
  TIsWow64Process = function(AHandle:THandle; var AIsWow64: BOOL): BOOL; stdcall;
var
  vResult: Boolean;
  vIsWow64: BOOL;
  vKernel32Handle: DWORD;
  vIsWow64Process: TIsWow64Process;
begin
  vResult := False;

  vKernel32Handle := LoadLibrary('kernel32.dll');
  if (vKernel32Handle = 0) then Exit;
    try
      @vIsWow64Process := GetProcAddress(vKernel32Handle, 'IsWow64Process');
      if not Assigned(vIsWow64Process) then
        Exit;

      vIsWow64 := False;
      if (vIsWow64Process(GetCurrentProcess, vIsWow64)) then
        vResult := vIsWow64;
    finally
      FreeLibrary(vKernel32Handle);
    end;

  if vResult then
    Result := True
  else
    Result := False;
end;

function GetDirectorySystem: string;
type
  TIsWow64Process = function(AHandle:THandle; var AIsWow64: BOOL): BOOL; stdcall;
var
  vResult: Boolean;
  vIsWow64: BOOL;
  vKernel32Handle: DWORD;
  vIsWow64Process: TIsWow64Process;
begin
  vResult := False;

  vKernel32Handle := LoadLibrary('kernel32.dll');
  if (vKernel32Handle = 0) then Exit;
    try
      @vIsWow64Process := GetProcAddress(vKernel32Handle, 'IsWow64Process');
      if not Assigned(vIsWow64Process) then
        Exit;

      vIsWow64 := False;
      if (vIsWow64Process(GetCurrentProcess, vIsWow64)) then
        vResult := vIsWow64;
    finally
      FreeLibrary(vKernel32Handle);
    end;

  if vResult then
    Result := GetEnvironmentVariable('HOMEDRIVE') + '\WINDOWS\SYSWOW64\'
  else
    Result := GetEnvironmentVariable('HOMEDRIVE') + '\Windows\SYSTEM32\';
end;

end.

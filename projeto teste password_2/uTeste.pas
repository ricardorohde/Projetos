unit uTeste;

interface

uses Forms,IniFiles,SysUtils;

type
  TTeste = class

  private
    { Private declarations }
  public
    { Public declarations }
    procedure Teste(a,b : string);
  end;

implementation

{ TTeste }

procedure TTeste.Teste(a, b: string);
var lIni : TIniFile;
begin
//  if DirectoryExists('C:') then
//    begin
//      if FileExists( ExtractFilePath(Application.ExeName) + 'Configuracao.ini' ) then
//        begin
    lIni := TInifile.Create( ExtractFilePath(Application.ExeName) + 'Configuracao.ini' );
    try
      lIni.WriteString('Conf','L',a);
      lIni.WriteString('Conf','S',b);
    finally
      FreeandNil(lIni);
    end; {try}
//        end;
//    end;
end;

end.

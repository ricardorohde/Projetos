unit uInicializacao;

interface

uses Windows, SysUtils, messages, Classes, Forms, shellApi, uDeclara, iniFiles, {sobre,} Dialogs,
     dtmPrincipal, modCOM002A, dbErro, dbtables, utool2,modCOM003L, Variants, Graphics, Controls, StdCtrls;

  function inicializacaoOK : boolean;

implementation

function TempDir:string;
var buffer:array[0..144]of char;
begin
 GetTempPath(144,buffer);
 Result:=StrPas(buffer);
end;

function GetEnvVarValue(const VarName: string): string;
var
  BufSize: Integer;  // buffer size required for value
begin
  // Get required buffer size (inc. terminal #0)
  BufSize := GetEnvironmentVariable(PChar(VarName), nil, 0);
  if BufSize > 0 then
  begin
    // Read env var value into result string
    SetLength(Result, BufSize - 1);
    GetEnvironmentVariable(PChar(VarName),
      PChar(Result), BufSize);
  end
  else
    // No such environment variable
    Result := '';
end;

function inicializacaoOK : boolean;
var i : integer;
begin
  result := false;

  AppDir := ExtractFileDir(ParamStr(0));
  vParams := TStringList.create;
  for i := 0 to paramcount do
    vParams.Add(UpperCase(ParamStr(i)));

  begin
    if FileExists(AppDir+'\'+AppSystem+'.ini') then
      AppIni := TIniFile.Create(AppDir+'\'+AppSystem+'.ini')
    else
      raise exception.Create('Arquivo de Inicialização "'+AppSystem+'.ini" não encontrado' );

    AppSetClientASE := trim(AppIni.readString('Sybase', 'SetClientASE',''));

    if(AppSetClientASE = 'S')then
     begin
      //showmessage('SYBASE Atual: ' + GetEnvironmentVariable('SYBASE'));
      //showmessage('PATH Atual: ' + GetEnvironmentVariable('PATH'));
      AppSYBASE := trim(AppIni.readString('Sybase', 'SYBASE',''));
      AppPATH := trim(AppIni.readString('Sybase', 'PATH',''));
      SetEnvironmentVariable(PChar('SYBASE'),PChar(AppSYBASE));
      SetEnvironmentVariable(PChar('PATH'),PChar(AppPATH));
      //showmessage('SYBASE Alterado: ' + GetEnvironmentVariable('SYBASE'));
      //showmessage('PATH Alterado: ' + GetEnvironmentVariable('PATH'));
     end;


    AppPathKey := trim(AppIni.readString('Geral', 'PathKey',''));

    if (copy(AppPathKey,1,1) = '.') then
    begin
       AppPathKey := GetCurrentDir + copy(AppPathKey,2,length(AppPathKey));
    end;

    {AppDirTemp := AppIni.readString('Geral', 'PathTemp','');

    AppDirTemp := trim(AppDirTemp);

    if (copy(AppDirTemp,length(AppDirTemp),1) = '\') then
    begin
       AppDirTemp := copy(AppDirTemp,1,length(AppDirTemp)-1);
    end;}

    if((AppIni.readString('Geral', 'PathTemp','') = '%UserProfile%\') or (AppIni.readString('Geral', 'PathTemp','') = '%UserProfile%'))then
     AppDirTemp := GetEnvVarValue('USERPROFILE') + '\'
    else
     AppDirTemp := TempDir;

    AppDirLog := AppIni.readString('Geral', 'PathLog','');

    //CRIA DIRETORIO DE INSTANCIA TEMPORARIO
    //(FORMATO: POLARIS + ANO, MES, DIA, HORA, MINUTO, SEGUNDO + Nº RANDOMICO DO DELPHI)
//    AppDirTempInst := AppDirTemp+'\'+AppSystem+FormatDateTime('yyyymmddhhnnss',NOW())+IntToStr(Application.Handle);
    AppDirTempInst := AppDirTemp+AppSystem+FormatDateTime('yyyymmddhhnnss',NOW())+IntToStr(Application.Handle);
    try
     mkdir(AppDirTempInst);
    except
     raise exception.Create('Arquivo de Temporário de Instancia não foi criado' );
    end;

    AppSysOper := '';
    AppOperAdmin := 'N';

    // Sobre
    if vParams.IndexOf(UpperCase('/Info')) >= 0  then
    begin
//      Application.CreateForm(TfmSOBRE, fmSOBRE);
//      fmSOBRE.ShowModal;
//      fmSOBRE.free;
    end
    else
    begin
      AppModo_Debug := (vParams.IndexOf(UpperCase('/Debug')) >= 0 );
      AppModo_Carga := (vParams.IndexOf(UpperCase('/Carga')) >= 0 );

      Application.Title := AppTitle;
      // DATA MODULE PRINCIPAL( CONECTA NO BD )
      try
        Application.createForm(TdmPrincipal,dmPrincipal);
        Application.CreateForm(TdmCOM002A, dmCOM002A);
        Application.CreateForm(TdmCOM003L, dmCOM003L);
      except
        on e : exception do
        begin
          if (AppModo_Debug) then
            TfmErro.showError( application, e, 'Erro instanciando dmPrincipal ' )
          else
            TfmErro.showError( application, e, 'Erro na inicialização do sistema '+char(13) +
                                               '( função "uTool2.InicializacaoOK" )' );
        end;
      end;
      result := true;
    end;
 end;
end;

initialization
 // *** Valores ***
 CurrencyString        := 'R$'; // Símbolo da Moeda.
 CurrencyFormat        := 2;    // Formato da moeda p/ valores positivos. Ex.: R$ 25.
 NegCurrFormat         := 12;   // Formato da moeda p/ valores negativos. Ex.: R$ -25.
 ThousandSeparator     := '.';  // Separador de Milhar.
 DecimalSeparator      := ',';  // Separador de decimal.
 CurrencyDecimals      := 2;    // Quantidade de casas decimais.

 // *** Data ***
 DateSeparator         := '/';                       // Separador.
 ShortDateFormat       := 'dd/MM/yyyy';              // Formato para data.
 LongDateFormat        := 'dddd, d de MMMM de yyyy'; // Extenso da data.

 // *** Hora ***
 TimeSeparator         := ':';         // Separador.
 TimeAMString          := '';          // Não utilizado pois o formato de hora é de 24 horas.
 TimePMString          := '';          // Não utilizado pois o formato de hora é de 24 horas.
 ShortTimeFormat       := 'HH:mm:ss';  // Formato de hora.
 LongTimeFormat        := 'HH:mm:ss';  // Formato de hora.

 // *** Extensos ***
 // Meses do ano
 LongMonthNames[1]  := 'Janeiro';
 LongMonthNames[2]  := 'Fevereiro';
 LongMonthNames[3]  := 'Março';
 LongMonthNames[4]  := 'Abril';
 LongMonthNames[5]  := 'Maio';
 LongMonthNames[6]  := 'Junho';
 LongMonthNames[7]  := 'Julho';
 LongMonthNames[8]  := 'Agosto';
 LongMonthNames[9]  := 'Setembro';
 LongMonthNames[10] := 'Outubro';
 LongMonthNames[11] := 'Novembro';
 LongMonthNames[12] := 'Dezembro';

 // Meses do ano - Abreviado
 ShortMonthNames[1]  := 'Jan';
 ShortMonthNames[2]  := 'Fev';
 ShortMonthNames[3]  := 'Mar';
 ShortMonthNames[4]  := 'Abr';
 ShortMonthNames[5]  := 'Mai';
 ShortMonthNames[6]  := 'Jun';
 ShortMonthNames[7]  := 'Jul';
 ShortMonthNames[8]  := 'Ago';
 ShortMonthNames[9]  := 'Set';
 ShortMonthNames[10] := 'Out';
 ShortMonthNames[11] := 'Nov';
 ShortMonthNames[12] := 'Dez';

 // Dias da Semana
 LongDayNames[1] := 'Domingo';
 LongDayNames[2] := 'Segunda';
 LongDayNames[3] := 'Terça';
 LongDayNames[4] := 'Quarta';
 LongDayNames[5] := 'Quinta';
 LongDayNames[6] := 'Sexta';
 LongDayNames[7] := 'Sábado';

 // Dias da Semana - Abreviado
 ShortDayNames[1] := 'Dom';
 ShortDayNames[2] := 'Seg';
 ShortDayNames[3] := 'Ter';
 ShortDayNames[4] := 'Qua';
 ShortDayNames[5] := 'Qui';
 ShortDayNames[6] := 'Sex';
 ShortDayNames[7] := 'Sáb';

 Application.UpdateFormatSettings := False;

finalization
  if Assigned(AppIni) then
    AppIni.free;
  if Assigned(vParams) then
    vParams.free;
  //DELETA DIRETORIO DE INSTANCIA TEMPORARIO
  DelTree(AppDirTempInst);
end.

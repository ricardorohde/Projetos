unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, alterdata, IniFiles, StdCtrls,
  cxShellBrowserDialog, dxmdaset, AltSetupMemData, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter(*, uCalculoHorario, uLibPonto,
  uVariaveisPonto*);

type
  TfrmMovimentacao = class(TForm)
    tv: TcxGridDBTableView;
    grdMovimentacaoLevel1: TcxGridLevel;
    grdMovimentacao: TcxGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Label4: TLabel;
    edtArquivo: TEdit;
    btnArquivo: TButton;
    shlGetDirectory: TcxShellBrowserDialog;
    tvData: TcxGridDBColumn;
    tvHora1: TcxGridDBColumn;
    tvHora2: TcxGridDBColumn;
    tvHora3: TcxGridDBColumn;
    tvHora4: TcxGridDBColumn;
    tvHora5: TcxGridDBColumn;
    tvHora6: TcxGridDBColumn;
    tvHora7: TcxGridDBColumn;
    tvHora8: TcxGridDBColumn;
    tvHora9: TcxGridDBColumn;
    tvHora10: TcxGridDBColumn;
    mmdMovimentacao: TSetupMemData;
    mmdMovimentacaoData: TDateTimeField;
    mmdMovimentacaoHora1: TStringField;
    mmdMovimentacaoHora2: TStringField;
    mmdMovimentacaoHora3: TStringField;
    mmdMovimentacaoHora6: TStringField;
    mmdMovimentacaoHora4: TStringField;
    mmdMovimentacaoHora5: TStringField;
    mmdMovimentacaoHora7: TStringField;
    mmdMovimentacaoHora8: TStringField;
    mmdMovimentacaoHora9: TStringField;
    mmdMovimentacaoHora10: TStringField;
    dtsMovimentacao: TDataSource;
    btnAtualizar: TButton;
    cboPis: TComboBox;
    btnExportar: TButton;
    tvMovimentado: TcxGridDBColumn;
    mmdMovimentacaoMovimentado: TStringField;
    btnRelatorio: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnArquivoClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
  private
    { Private declarations }
    FDataIni       : TDateTime;
    FDataFim       : TDateTime;
    FListaArquivos : TStringList;

    procedure AtualizarMovimentacao;
//    procedure GravarConfiguracao;
//    function  LerConfiguracao : TDateTime;
    procedure ProcessarMovimentacao(pFileName : string);
    procedure ProcessarArquivos;
    procedure ListarArquivos(Diretorio: string; Sub:Boolean);
    function TemAtributo(Attr, Val: Integer): Boolean;
    function Between(DateCompare, Data1, Data2 : TDateTime):Boolean;
    procedure InserirNoDataSet(pLinha : String);
    procedure Editar(pHora : String);
    procedure Ordenar_Horarios(pMovimentacoes : Array of String);
    function OnlyNumber(Const Value:String):String;
    Function CalcularMovimentacao() : Double;

    //Function RetornaAtrasoHoraExtra : TMinutos;
//    function RetornaHora(pHorario: string) : double;
    //TCalculoHorario
  public
    { Public declarations }
  end;

var
  frmMovimentacao: TfrmMovimentacao;

implementation

uses uRelatorio;

{$R *.dfm}

//procedure TfrmMovimentacao.GravarConfiguracao;
//var
//  Configuracao : TIniFile;
//begin
//  Configuracao := TInifile.Create( ExtractFilePath(Application.ExeName) + 'Movimentação.ini' );
//  try
//    Configuracao.WriteDate('DataUltimaBaixa','Cofiguração', Date);
//  finally
//    FreeandNil(Configuracao);
//  end; {try}
//end;

//function TfrmMovimentacao.LerConfiguracao: TDateTime;
//var
//  Configuracao : TIniFile;
//begin
//  Configuracao := TInifile.Create( ExtractFilePath(Application.ExeName) + 'Movimentação.ini' );
//  try
//    result := Configuracao.ReadDate('DataUltimaBaixa','Cofiguração', 0);
//  finally
//    FreeandNil(Configuracao);
//  end; {try}
//end;

procedure TfrmMovimentacao.btnArquivoClick(Sender: TObject);
begin
  if shlGetDirectory.Execute then
    edtArquivo.Text := shlGetDirectory.Path;
end;

procedure TfrmMovimentacao.ListarArquivos(Diretorio: string; Sub: Boolean);
var
  F: TSearchRec;
  Ret: Integer;
  TempNome: string;
begin
  Ret := FindFirst(Diretorio+'\*.txt', faAnyFile, F);
  try
    while Ret = 0 do
      begin
        if TemAtributo(F.Attr, faDirectory) then
          begin
            if (F.Name <> '.') And (F.Name <> '..') then
              if Sub then
                begin
                  TempNome := Diretorio+'\' + F.Name;
                  ListarArquivos(TempNome, True, );
                end;
          end
        else
          FListaArquivos.Add(Diretorio+'\'+F.Name);

        Ret := FindNext(F);
      end;
  finally
    FindClose(F);
  end;
end;

function TfrmMovimentacao.TemAtributo(Attr, Val: Integer): Boolean;
begin
  Result := Attr and Val = Val;
end;

procedure TfrmMovimentacao.FormShow(Sender: TObject);
begin
  AtualizarMovimentacao;
end;

procedure TfrmMovimentacao.ProcessarArquivos;
var
  i : Integer;
begin
  mmdMovimentacao.Close;
  mmdMovimentacao.Open;
  FListaArquivos := TStringList.Create;
  try
    ListarArquivos(edtArquivo.text,False);
    for i := 0 to FListaArquivos.Count - 1 do
      ProcessarMovimentacao(FListaArquivos.Strings[i]);
  finally
    FreeAndNil(FListaArquivos);
  end;

  mmdMovimentacao.SortedField := 'Data';
  mmdMovimentacao.SortOptions := [];
end;

procedure TfrmMovimentacao.ProcessarMovimentacao(pFileName : string);
var
  lStringList : TStringList;
  i           : Integer;
  lFileName   : string;
  lStrAux     : String;
  lDataAux    : TDateTime;
begin
  lDataAux  := 0;
  lFileName := ExtractFileName(pFileName);
  lStrAux   := Copy(lFileName, 1, 2) + '/'+ Copy(lFileName, 3, 2) + '/' + Copy(lFileName, 5, 4);
  if IsDate(lStrAux)then
    lDataAux := StrToDate(lStrAux);

  if Between(lDataAux, FDataIni, FDataFim) then
    begin
      lStringList := TStringList.create();
      try
        lStringList.LoadFromFile(pFileName);
        for i := 0 to lStringList.Count -1 do
          InserirNoDataSet(lStringList.Strings[i]);
      finally
        FreeAndNil(lStringList);
      end;
    end;
end;

function TfrmMovimentacao.Between(DateCompare, Data1, Data2: TDateTime): Boolean;
begin
  result := (DateCompare >= Data1) and (DateCompare <= Data2);
end;

procedure TfrmMovimentacao.InserirNoDataSet(pLinha: String);
var
  lPIS  : String;
  lData : String;
  lHora : string;
begin
  if (Length(pLinha)> 35) then
    Exit;

  lPIS  := Copy(pLinha, 23, 12);
  if (Pos(lPIS, cboPis.Text)<= 0)  then
    Exit;

  lData := Copy(pLinha, 11, 2) + '/' + Copy(pLinha, 13, 2) + '/' + Copy(pLinha, 15, 4);
  lHora := Copy(pLinha, 19, 2) + ':' + Copy(pLinha, 21, 2);

  if (not IsDate(lData)) or (not IsTime(lHora)) then
    Exit;

  if not mmdMovimentacao.Locate('Data', VarArrayOf([StrToDate(lData)]), [loCaseInsensitive]) then
    begin
      mmdMovimentacao.Append;
      mmdMovimentacaoData.AsDateTime := StrToDate(lData);
      mmdMovimentacaoHora1.AsString  := lHora;
      mmdMovimentacao.Post;
    end
  else
    Editar(lHora);
end;

procedure TfrmMovimentacao.Editar(pHora: String);
var
  i : Integer;

  function ConferirHoraIgual(pHora : string) : Boolean;
  var
    i : Integer;
  begin
    result := False;
    for i := 1 to 10 do
      if SameText(mmdMovimentacao.Fields.FieldByName('Hora'+ IntToStr(i)).AsString, pHora) then
        begin
          result := True;
          Break;
        end;
  end;
begin
  if ConferirHoraIgual(pHora) then
    Exit;

  mmdMovimentacao.Edit;
  for i := 2 to 10 do
    if Empty(mmdMovimentacao.Fields.FieldByName('Hora'+ IntToStr(i)).AsString)then
      begin
        mmdMovimentacao.Fields.FieldByName('Hora'+ IntToStr(i)).AsString := pHora;
        Break;
      end;
      
  Ordenar_Horarios([mmdMovimentacao.Fields.FieldByName('Hora1').AsString,
                    mmdMovimentacao.Fields.FieldByName('Hora2').AsString,
                    mmdMovimentacao.Fields.FieldByName('Hora3').AsString,
                    mmdMovimentacao.Fields.FieldByName('Hora4').AsString,
                    mmdMovimentacao.Fields.FieldByName('Hora5').AsString,
                    mmdMovimentacao.Fields.FieldByName('Hora6').AsString,
                    mmdMovimentacao.Fields.FieldByName('Hora7').AsString,
                    mmdMovimentacao.Fields.FieldByName('Hora8').AsString,
                    mmdMovimentacao.Fields.FieldByName('Hora9').AsString,
                    mmdMovimentacao.Fields.FieldByName('Hora10').AsString]);

  mmdMovimentacao.Fields.FieldByName('Movimentado').AsString := FormatDateTime('hh:mm', CalcularMovimentacao());
  mmdMovimentacao.Post;
end;

Function TfrmMovimentacao.CalcularMovimentacao() : Double;
var
  i : Integer;
begin
  result := 0;
  i      := 10;
  while (i > 0)do
    begin
      if not Empty(mmdMovimentacao.Fields.FieldByName('Hora'+ IntToStr(i)).AsString) then
        result := result + Abs(StrToDateTimeDef(mmdMovimentacao.Fields.FieldByName('Hora'+ IntToStr(i)).AsString, 0) -
                               StrToDateTimeDef(mmdMovimentacao.Fields.FieldByName('Hora'+ IntToStr(i - 1)).AsString, 0));
      i := i - 2;
    end;
end;

procedure TfrmMovimentacao.Ordenar_Horarios(pMovimentacoes: array of String);
Var
   lArrayAux: Array[1..10] of string;
   i, j :  Byte;
   lAux,
   lAux2,
   lAux3 : string;
begin
  for i := 0 to (Length(pMovimentacoes)-1) do
    if not Empty(pMovimentacoes[i]) then
      lArrayAux[i + 1] := pMovimentacoes[i];

  for i := Low(lArrayAux) to (High(lArrayAux)-1) do
    begin
      for j := i + 1 to High(lArrayAux) do
        begin
          lAux2 := OnlyNumber(lArrayAux[i]);
          lAux3 := OnlyNumber(lArrayAux[j]);

          if not empty(lAux2) and not empty(lAux3) then
            if lAux2 > lAux3 then
              begin
                lAux         := lArrayAux[i];
                lArrayAux[i] := lArrayAux[j];
                lArrayAux[j] := lAux
              end;
        end;
    end;

  for i := Low(lArrayAux) to High(lArrayAux) do
    if not Empty(lArrayAux[i]) and IsTime(lArrayAux[i]) then
      mmdMovimentacao.Fields.FieldByName('Hora' + IntToStr(i)).AsString := FormatDateTime('hh:mm', StrToTime(lArrayAux[i]));
end;

function TfrmMovimentacao.OnlyNumber(const value: String): String;
var
  i: integer;
  lStrAux: string;
begin
  lStrAux := '';
  for i := 1 To Length(Value) Do
    begin
      if (Value[i] in ['0'..'9'])then
        begin
          lStrAux := lStrAux + Copy(Value, i, 1);
        end;
    end;
  result := lStrAux;
end;

//function TfrmMovimentacao.RetornaHora(pHorario: string): double;
//var
//  lHorario, lAux  : string;
//begin
//  if pHorario = '' then
//    result := 0
//  else
//    begin
//      lAux := copy(pHorario, 1, 2) + ':' + copy(pHorario, 3, 2);
//      if IsTime(lAux) then
//        begin
//          lHorario := SwapString(pHorario, ':', '');
//          lHorario := copy(lHorario, 1, 2) + ':' + copy(lHorario, 3, 2);
//          result := StrToTime(lHorario);
//        end
//      else
//        result := 0;
//    end;
//end;

procedure TfrmMovimentacao.btnAtualizarClick(Sender: TObject);
begin
  AtualizarMovimentacao;
end;

procedure TfrmMovimentacao.AtualizarMovimentacao;
//var lDataAux : TDateTime;
begin
  FDataIni := MonthFirstDate(Date) - 11;
  FDataFim := Date;

  ProcessarArquivos;
//  GravarConfiguracao;
end;

procedure TfrmMovimentacao.btnExportarClick(Sender: TObject);
var
  lSL   : TStringList;
  i     : Integer;
  lStr  : string;
  lFile : string;
begin
  lSL := TStringList.Create;
  try
    lSL.Add('Data Movimentação | Hora 1 | Hora 2 | Hora 3 | Hora 4 | Hora 5 | Hora 6 | Hora 7 | Hora 8 | Hora 9 | Hora 10 | TOTAL  |');
    mmdMovimentacao.First;
    while not mmdMovimentacao.Eof do
      begin
        lStr := mmdMovimentacaoData.AsString + '        | ';
        for i := 1 to 10 do
          if not Empty(mmdMovimentacao.Fields.FieldByName('Hora'+ IntToStr(i)).AsString) then
            lStr := lStr +  mmdMovimentacao.Fields.FieldByName('Hora'+ IntToStr(i)).AsString + '  | ';

        lStr := PadR(lStr, 109,' ') + '| ' +  mmdMovimentacaoMovimentado.AsString + '  | ';
        lSL.Add(lStr);
        mmdMovimentacao.Next;
      end;
    lFile := 'C:\Movimentacao - '+ Trim(Copy(cboPis.Text, 1, Pos('-', cboPis.Text)-1)) + '.txt';
    lSL.SaveToFile(lFile);

    showMessage('Arquivo: ' + lFile + #10 + 'Gerado com sucesso!!!');
  finally
    FreeAndNil(lSL);
  end;
end;

//function TfrmMovimentacao.RetornaAtrasoHoraExtra: TMinutos;
//begin
//
//end;

procedure TfrmMovimentacao.btnRelatorioClick(Sender: TObject);
begin
  frmRelatorio := TfrmRelatorio.Create(self);
  try
    frmRelatorio.QuickRep1.ReportTitle := 'Movimentação '+ cboPis.Text; 
    frmRelatorio.QuickRep1.Preview;
  finally
    frmRelatorio.Free();
  end;
end;

end.

{*******************************************************************************
*** Programa:  Gerar_CSV - Destinado à geração de CSV                        ***
*** Autor:     EDSON DE MELO                                                 ***
*** Data:      23/05/2014                                                    ***
*** Descrição:                                                               ***
********************************************************************************
********************************************************************************
***              HISTORICO MANUTENCAO DA PROCEDURE                           ***
*** ------------------------------------------------------------------------ ***
***   Release/RP : Release 62_5_V4                                           ***
***  Analista    : EDSON DE MELO                                             ***
***  Alteracao   : 16/06/2014                                                ***
***  Comentarios : GAPS CREDICARD                                            ***
*******************************************************************************}
unit Gerar_CSV;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  childPadrao, ExtCtrls, Mask, StdCtrls, Grids, DBGrids, DBGridPesquisa,
  Buttons, LookupEdit, dbLookUpEdit, DBFindEdit, 
  Db, DBTables, ELibFnc, ModPrincipal, variants, cxGridTableView, cxGridDBTableView,
  uDeclara, DbErro, cxGridBandedTableView, cxGridDBBandedTableView;

  type
    TGerar_CSV = class

    private
      fslExtracao : TStringList;
      fsdExporta  : TSaveDialog;

      procedure AdicionarNomeColunasNoArquivo(psCabecalho : string; pqExtracao: TDataSet;
        ptvTableView: TcxGridTableView);
      procedure AdicionarValoresNoArquivo(psTableName : string; pqExtracao: TDataSet;
        ptvTableView: TcxGridTableView);

      function IsDate(pValue : String): Boolean;
    public
      procedure Gerar_CSV(paExtracao  : array of TDataSet;
                          paTableName : array of string;
                          paTableView : array of TcxGridTableView;
                          pCabecalho:TStringList = nil);

      procedure BeforeDestruction; override;
      procedure AfterConstruction; override;
  end;

  const SEPARADOR = ';';
implementation

uses cxGridCustomTableView;

{ TGerar_CSV }

procedure TGerar_CSV.AfterConstruction;
begin
  inherited;
  fslExtracao := TStringList.Create;
  fsdExporta  := TSaveDialog.Create(nil);
end;

procedure TGerar_CSV.BeforeDestruction;
begin
  FreeAndNil(fsdExporta);
  FreeAndNil(fslExtracao);

  inherited;
end;

procedure TGerar_CSV.AdicionarNomeColunasNoArquivo(psCabecalho : string; pqExtracao: TDataSet;
  ptvTableView: TcxGridTableView);
var
  i           : Integer;
  iQtColumn   : Integer;
  vsCabecalho : String;
begin
  if (not pqExtracao.Active) or (pqExtracao.IsEmpty)then
    Exit;

  iQtColumn := TcxGridDBTableView(ptvTableView).ColumnCount - 1;

  vsCabecalho := '';
  if psCabecalho <> '' then
    vsCabecalho := psCabecalho + SEPARADOR;

  for i := 0 to iQtColumn do
  begin
    if not TcxGridDBTableView(ptvTableView).Columns[i].Visible then
      Continue;

    vsCabecalho := vsCabecalho + TcxGridDBTableView(ptvTableView).Columns[i].Caption;
    if (i < iQtColumn) then
      vsCabecalho := vsCabecalho + SEPARADOR;
  end;

  fslExtracao.Add(vsCabecalho);
end;

procedure TGerar_CSV.AdicionarValoresNoArquivo(psTableName : string; pqExtracao: TDataSet;
  ptvTableView: TcxGridTableView);
var
  i         : Integer;
  iQtColumn : Integer;
  vsDetalhe : String;
  vsCampo   : String;
  lsValor   : string;
  lsTeste   : string;
begin
  if (not pqExtracao.Active) or (pqExtracao.IsEmpty)then
    Exit;

  iQtColumn := TcxGridDBTableView(ptvTableView).ColumnCount - 1;

  pqExtracao.First;
  while not pqExtracao.Eof do
  begin
    vsDetalhe := '';
    if psTableName <> '' then
      vsDetalhe := psTableName + SEPARADOR;

    for i := 0 to iQtColumn do
    begin
      vsCampo := Trim(TcxGridDBTableView(ptvTableView).Columns[i].DataBinding.FieldName);
          
      if not TcxGridDBTableView(ptvTableView).Columns[i].Visible or
         not Assigned(pqExtracao.FindField(vsCampo)) then
        Continue;

      lsValor := Trim(pqExtracao.FieldByName(vsCampo).AsString);

      if (lsValor <> '')
         and (pqExtracao.FieldByName(vsCampo) is TStringField)
         and IsDate('01/'+ lsValor) then
        vsDetalhe:= vsDetalhe + QuotedStr(lsValor)
      else
      if ((Copy(vsCampo,Length(vsCampo) ,1) = 'X') and (lsValor <> '')) or
         ((pqExtracao.FieldByName(vsCampo) is TStringField) and
          (lsValor <> '') and (lsValor[1] = '0'))then
        vsDetalhe:= vsDetalhe + QuotedStr(lsValor)
      else
        vsDetalhe:= vsDetalhe + lsValor;

      if (i < iQtColumn) then
        vsDetalhe := vsDetalhe + SEPARADOR;
    end;

    fslExtracao.Add(vsDetalhe);
    pqExtracao.Next;
  end;
end;

function TGerar_CSV.IsDate(pValue : String) : Boolean;
var
  dtValue : TDateTime;
begin
  result := False;
  if (Length(pValue) < 10) then
    Exit;

  if StrToDateTimeDef(pValue, -1) <> -1 then
    Result := True;
End;

procedure TGerar_CSV.Gerar_CSV(paExtracao: array of TDataSet;
  paTableName : array of string; paTableView: array of TcxGridTableView; pCabecalho: TStringList);
var
  i       : Integer;
  iPag    : Integer;
  iColumn : Integer;
begin
  if Assigned(pCabecalho) then
    fslExtracao.Add(pCabecalho.Text);

  for i := 0 to High(paExtracao) do
  begin
    if i > 0 then
      fslExtracao.Add('');

    if (paTableName[i] <> '') then
      begin
        AdicionarNomeColunasNoArquivo('TABELA', paExtracao[i], paTableView[i]);
        AdicionarValoresNoArquivo(paTableName[i], paExtracao[i], paTableView[i]);
      end
    else
      begin
        AdicionarNomeColunasNoArquivo('', paExtracao[i], paTableView[i]);
        AdicionarValoresNoArquivo('', paExtracao[i], paTableView[i]);
      end;

    fslExtracao.Add('');    
  end;

  if fslExtracao.Count = 0 then
  begin
    MessageDlg('Arquivo não pode ser gerado pois não há informação.', mtWarning, [mbOK], 0);
    Exit;
  end;

  fsdExporta.InitialDir := AppDirTemp;
  fsdExporta.Title      := 'Salvar arquivo CSV';
  fsdExporta.DefaultExt := 'csv';
  fsdExporta.Filter     :='*.csv';
  try
    if fsdExporta.Execute then
    begin
      if not FileExists(fsdExporta.FileName) then
        begin
          fslExtracao.SaveToFile(fsdExporta.FileName);
          ShowMessage('Arquivo Gerado Corretamente !!!');
        end
      else
        if application.MessageBox('Deseja substituir o arquivo existente?', 'CSV', MB_YESNO + MB_DEFBUTTON1) = IDYES then
        begin
          fslExtracao.SaveToFile(fsdExporta.FileName);
          ShowMessage('Arquivo Gerado Corretamente !!!');
        end;
    end;
  except
    on e:exception do
      TFmErro.ShowError(self,e, 'Erro na Geração do Arquivo de Exportação, pode ser que o arquivo já esteja aberto.');
  end;
end;

end.

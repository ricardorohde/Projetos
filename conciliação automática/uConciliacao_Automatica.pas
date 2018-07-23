unit uConciliacao_Automatica;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, StdCtrls, ExtCtrls, DBCtrls, Mask, Buttons,
  DSConnect, uInput_Params, uTypes, uLibrary, uRecError,uSeleciona_Conciliacao_Automatica,
  PngSpeedButton, StrUtils, uOFXReader;

type
  TfrmConciliacao_Automatica = class(TfrmInput_Params)
    cdsPerguntasCAMINHOARQUIVO: TStringField;
    Label1: TLabel;
    dbedtBanco: TDBEdit;
    dbedtAgencia: TDBEdit;
    dbedtConta: TDBEdit;
    SpeedButton1: TSpeedButton;
    dbedtNomeBancoAte: TDBEdit;
    Label2: TLabel;
    cdsPerguntasBANCO: TIntegerField;
    cdsPerguntasAGENCIA: TStringField;
    cdsPerguntasCONTA: TStringField;
    dbedtArquivoOrigem: TDBEdit;
    cdsPerguntasNOMEBANCO: TStringField;
    cdsEfetiva_Movimentos: TClientDataSet;
    cdsEfetiva_MovimentosCONCILIADO: TStringField;
    cdsEfetiva_MovimentosMOVIMENTO: TDateField;
    cdsEfetiva_MovimentosVALOR: TCurrencyField;
    cdsEfetiva_MovimentosSELECIONADO: TStringField;
    cdsEfetiva_MovimentosHISTORICO: TStringField;
    cdsEfetiva_MovimentosTIPOMOVIMENTO: TStringField;
    cdsMovimentos_Bancarios: TClientDataSet;
    cdsMovimentos_BancariosEMPRESA: TStringField;
    cdsMovimentos_BancariosFILIAL: TStringField;
    cdsMovimentos_BancariosMOVIMENTO: TStringField;
    cdsMovimentos_BancariosEMISSAO: TDateField;
    cdsMovimentos_BancariosESPECIE: TStringField;
    cdsMovimentos_BancariosDESCRICAOESPECIE: TStringField;
    cdsMovimentos_BancariosBANCO: TIntegerField;
    cdsMovimentos_BancariosAGENCIA: TStringField;
    cdsMovimentos_BancariosCONTA: TStringField;
    cdsMovimentos_BancariosDOCUMENTO: TStringField;
    cdsMovimentos_BancariosIDENTIFICADOR: TIntegerField;
    cdsMovimentos_BancariosBANCOCHEQUE: TIntegerField;
    cdsMovimentos_BancariosAGENCIACHEQUE: TStringField;
    cdsMovimentos_BancariosCONTACHEQUE: TStringField;
    cdsMovimentos_BancariosPROPRIETARIOCHEQUE: TStringField;
    cdsMovimentos_BancariosVALOR: TFloatField;
    cdsMovimentos_BancariosMOVIMENTACAO: TDateField;
    cdsMovimentos_BancariosCATEGORIA: TStringField;
    cdsMovimentos_BancariosPREFIXO: TStringField;
    cdsMovimentos_BancariosNUMERO: TIntegerField;
    cdsMovimentos_BancariosPARCELA: TIntegerField;
    cdsMovimentos_BancariosTIPO: TStringField;
    cdsMovimentos_BancariosPROPRIETARIO: TIntegerField;
    cdsMovimentos_BancariosDECRESCIMO: TFloatField;
    cdsMovimentos_BancariosOUTROSDESCONTOS: TFloatField;
    cdsMovimentos_BancariosACRESCIMO: TFloatField;
    cdsMovimentos_BancariosMULTA: TFloatField;
    cdsMovimentos_BancariosTAXAPERMANENCIA: TFloatField;
    cdsMovimentos_BancariosJUROS: TFloatField;
    cdsMovimentos_BancariosBENEFICIARIO: TStringField;
    cdsMovimentos_BancariosCONCILIADO: TStringField;
    cdsMovimentos_BancariosEMPRESAORIGEM: TStringField;
    cdsMovimentos_BancariosFILIALORIGEM: TStringField;
    cdsMovimentos_BancariosORIGEM: TStringField;
    cdsMovimentos_BancariosCONFIGURACAO: TStringField;
    cdsMovimentos_BancariosSELECIONADO: TStringField;
    cdsMovimentos_BancariosIDCMP: TStringField;
    cdsMovimentos_BancariosLOTE: TIntegerField;
    cdsMovimentos_BancariosDATACRIACAO: TSQLTimeStampField;
    cdsMovimentos_BancariossqlMovimentos_Bancarios_Rateios: TDataSetField;
    dspcMovimentos_Bancarios: TDSProviderConnection;
    dtsMovimentos_Bancarios: TDataSource;
    opdlg: TOpenDialog;
    btnArquivo: TButton;
    cdsMovimentos_Arquivo: TClientDataSet;
    cdsMovimentos_ArquivoCONCILIADO: TStringField;
    cdsMovimentos_ArquivoMOVIMENTO: TDateField;
    cdsMovimentos_ArquivoTIPOMOVIMENTO: TStringField;
    cdsMovimentos_ArquivoVALOR: TCurrencyField;
    cdsMovimentos_ArquivoHISTORICO: TStringField;
    cdsMovimentos_ArquivoID: TStringField;
    cdsMovimentos_ArquivoDOCUMENTO: TStringField;
    cdsEfetiva_MovimentosID: TStringField;
    cdsEfetiva_MovimentosDOCUMENTO: TStringField;
    cdsEfetiva_MovimentosSTATUS: TStringField;
    cdsMovimentos_BancariosVALORBASE: TFloatField;
    cdsMovimentos_BancariosBASE10925: TFloatField;
    cdsMovimentos_BancariosVALORPIS: TFloatField;
    cdsMovimentos_BancariosVALORCOFINS: TFloatField;
    cdsMovimentos_BancariosVALORCSLL: TFloatField;
    cdsMovimentos_BancariosRETENCAO10925: TFloatField;
    cdsMovimentos_BancariosCC: TStringField;
    cdsMovimentos_BancariosBORDERO: TIntegerField;
    cdsMovimentos_BancariosINCLUIDO: TStringField;
    cdsMovimentos_BancariosALTERADO: TStringField;
    cdsMovimentos_BancariosID: TStringField;
    cdsMovimentos_BancariosTIPOMOVIMENTO: TStringField;
    cdsMovimentos_BancariosHISTORICO: TStringField;
    cdsMovimentos_ArquivoINCLUIDO: TIntegerField;
    cdsEfetiva_MovimentosHISTORICO_ARQUIVO: TStringField;
    cdsEfetiva_MovimentosVALOR_ARQUIVO: TCurrencyField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnArquivoClick(Sender: TObject);

  private
    procedure ProcessarArquivoOFX(FileName: string);
    procedure AdicionarMovimentosBancarios(DataInicial, DataFinal: TDateTime);
    function Validar(YMOFXReader1: TYMOFXReader): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;
var
  frmConciliacao_Automatica: TfrmConciliacao_Automatica;

implementation

uses uDMMain,uBancos;

{$R *.dfm}

procedure TfrmConciliacao_Automatica.btnArquivoClick(Sender: TObject);
begin
  inherited;
  if opdlg.Execute then
  begin
    cdsPerguntas.Edit;
    cdsPerguntasCAMINHOARQUIVO.AsString:= opdlg.FileName;
    cdsPerguntas.Post;
  end;
end;

procedure TfrmConciliacao_Automatica.AdicionarMovimentosBancarios(DataInicial, DataFinal: TDateTime);
var
  Empresa: String;
  Filial: String;
  lsTipoMov: string;
  SQL: WideString;
  i: Integer;
  lbIsEquals: string;
  lbAchou: Boolean;
begin
  __SuperClass.DBFunctions.GetEntityOwner('MOVIMENTOS_BANCARIOS', Empresa, Filial);

  SQL :=  'SELECT * ';
  SQL := SQL + 'FROM MOVIMENTOS_BANCARIOS ';
  SQL := SQL + 'WHERE EMPRESA = :EMPRESA AND FILIAL = :FILIAL AND BANCO = :BANCO AND AGENCIA = :AGENCIA AND CONTA = :CONTA AND ';
  SQL := SQL + 'MOVIMENTACAO BETWEEN :MOVIMENTODE AND :MOVIMENTOATE ';
//  SQL := SQL + 'AND VALOR = :VALOR ';
  SQL := SQL + 'ORDER BY MOVIMENTACAO, BANCO, AGENCIA, CONTA';

  with cdsMovimentos_Bancarios, cdsMovimentos_Bancarios.Params do
  begin
    CommandText := SQL;
    with ParamByName('EMPRESA') do
    begin
      DataType  := ftString;
      ParamType := ptInput;
      AsString  := Empresa;
    end;
    with ParamByName('FILIAL') do
    begin
      DataType  := ftString;
      ParamType := ptInput;
      AsString  := Filial;
    end;
    with ParamByName('BANCO') do
    begin
      DataType  := ftInteger;
      ParamType := ptInput;
      AsInteger := cdsPerguntasBANCO.AsInteger;
    end;
    with ParamByName('AGENCIA') do
    begin
      DataType  := ftString;
      ParamType := ptInput;
      AsString  := cdsPerguntasAGENCIA.AsString;
    end;
    with ParamByName('CONTA') do
    begin
      DataType  := ftString;
      ParamType := ptInput;
      AsString  := cdsPerguntasCONTA.AsString;
    end;
    with ParamByName('MOVIMENTODE') do
    begin
      DataType  := ftDateTime;
      ParamType := ptInput;
      AsDate    := DataInicial;
    end;
    with ParamByName('MOVIMENTOATE') do
    begin
      DataType  := ftDatetime;
      ParamType := ptInput;
      AsDate    := DataFinal;
    end;

    __SuperClass.DBFunctions.OpenDataSet(cdsMovimentos_Bancarios, False, False, -1);

    cdsMovimentos_Arquivo.DisableControls;
    cdsMovimentos_Bancarios.First;
    while not cdsMovimentos_Bancarios.Eof do
    begin
      //Busca pelo ID
      cdsMovimentos_Arquivo.CancelRange;
      cdsMovimentos_Arquivo.IndexFieldNames:= 'ID';
      cdsMovimentos_Arquivo.SetRange([cdsMovimentos_BancariosID.AsString], [cdsMovimentos_BancariosID.AsString]);
      if cdsMovimentos_Arquivo.IsEmpty then
      begin
        lsTipoMov:= 'D';
        if StrToIntDef(cdsMovimentos_BancariosCONFIGURACAO.AsString, 0)> 1000 then
          lsTipoMov:= 'C';

        cdsMovimentos_Arquivo.CancelRange;
        cdsMovimentos_Arquivo.IndexName:= 'IdxPrimario';
        cdsMovimentos_Arquivo.SetRange([cdsMovimentos_BancariosMOVIMENTACAO.AsDateTime, cdsMovimentos_BancariosDOCUMENTO.AsString, lsTipoMov, cdsMovimentos_BancariosVALOR.AsFloat],
                                       [cdsMovimentos_BancariosMOVIMENTACAO.AsDateTime, cdsMovimentos_BancariosDOCUMENTO.AsString, lsTipoMov, cdsMovimentos_BancariosVALOR.AsFloat]);

        if cdsMovimentos_Arquivo.IsEmpty then
        begin
          cdsMovimentos_Arquivo.CancelRange;
          cdsMovimentos_Arquivo.IndexName:= 'IdxDocumento';
          cdsMovimentos_Arquivo.SetRange([cdsMovimentos_BancariosMOVIMENTACAO.AsDateTime, cdsMovimentos_BancariosDOCUMENTO.AsString, lsTipoMov],
                                         [cdsMovimentos_BancariosMOVIMENTACAO.AsDateTime, cdsMovimentos_BancariosDOCUMENTO.AsString, lsTipoMov]);
        end;
      end;

      if (cdsMovimentos_Arquivo.IsEmpty) or (not cdsMovimentos_Arquivo.IsEmpty and (cdsMovimentos_ArquivoINCLUIDO.AsInteger = 1)) then
        begin
          lsTipoMov:= 'D';
          if StrToIntDef(cdsMovimentos_BancariosCONFIGURACAO.AsString, 0)> 1000 then
            lsTipoMov:= 'C';
          cdsEfetiva_Movimentos.Append;
          cdsEfetiva_MovimentosSELECIONADO.AsString := VB_NAO;
          cdsEfetiva_MovimentosCONCILIADO.AsString := VB_NAO;
          cdsEfetiva_MovimentosMOVIMENTO.AsDateTime := cdsMovimentos_BancariosMOVIMENTACAO.AsDateTime;
          cdsEfetiva_MovimentosTIPOMOVIMENTO.AsString := lsTipoMov;
          cdsEfetiva_MovimentosVALOR.AsFloat := cdsMovimentos_BancariosVALOR.AsFloat;
          cdsEfetiva_MovimentosHISTORICO.AsString := cdsMovimentos_BancariosHISTORICO.AsString;
          cdsEfetiva_MovimentosID.AsString:= cdsMovimentos_BancariosID.AsString;
          cdsEfetiva_MovimentosDOCUMENTO.AsString:= cdsMovimentos_BancariosDOCUMENTO.AsString;
          cdsEfetiva_MovimentosSTATUS.AsString:= STATUS_ADICIONADO;
          cdsEfetiva_Movimentos.Post;
        end
      else
        begin
          cdsMovimentos_Arquivo.First;
          while not cdsMovimentos_Arquivo.Eof do
          begin
            lbIsEquals:= EmptyStr;
            for i := 0 to cdsMovimentos_Arquivo.FieldCount -1 do
            begin
              case AnsiIndexStr( AnsiUpperCase(cdsMovimentos_Arquivo.Fields[i].FieldName),
                                 ['MOVIMENTO', 'TIPOMOVIMENTO', 'VALOR', 'HISTORICO']) of
                0: if cdsMovimentos_Arquivo.Fields[i].AsDateTime <> cdsMovimentos_BancariosMOVIMENTACAO.AsDateTime then
                     lbIsEquals:= lbIsEquals + 'D';
                1:
                  begin
                    lsTipoMov:= Trim(cdsMovimentos_BancariosTIPOMOVIMENTO.AsString);
                    if lsTipoMov = EmptyStr then
                    begin
                      lsTipoMov:= 'D';
                      if StrToIntDef(cdsMovimentos_BancariosCONFIGURACAO.AsString, 0)> 1000 then
                        lsTipoMov:= 'C';
                    end;

                    if Trim(cdsMovimentos_Arquivo.Fields[i].AsString) <> lsTipoMov then
                      lbIsEquals:= lbIsEquals + 'T';
                  end;
                2: if cdsMovimentos_Arquivo.Fields[i].AsFloat <> cdsMovimentos_BancariosVALOR.AsFloat then
                     lbIsEquals:= lbIsEquals + 'V';
                3: if cdsMovimentos_Arquivo.Fields[i].AsString <> cdsMovimentos_BancariosHISTORICO.AsString then
                     lbIsEquals:= lbIsEquals + 'H'
              end;
            end;

            if cdsEfetiva_Movimentos.Locate('ID', cdsMovimentos_ArquivoID.AsString, [loCaseInsensitive]) then
            begin
              if cdsMovimentos_ArquivoINCLUIDO.AsInteger = 0 then
              begin
                cdsEfetiva_Movimentos.Edit;
                if lbIsEquals <> EmptyStr then
                  begin
                    cdsEfetiva_MovimentosSTATUS.AsString:= STATUS_ALTERADO;
                    if Pos('V', lbIsEquals)> 0 then
                      cdsEfetiva_MovimentosVALOR_ARQUIVO.AsFloat:= cdsMovimentos_ArquivoVALOR.AsFloat;

                    if Pos('H', lbIsEquals)> 0 then
                      cdsEfetiva_MovimentosHISTORICO_ARQUIVO.AsString:= cdsMovimentos_ArquivoHISTORICO.AsString;
                  end
                else
                if cdsMovimentos_BancariosCONCILIADO.AsString = '1' then
                  cdsEfetiva_MovimentosSTATUS.AsString:= STATUS_OK
                else
                  cdsEfetiva_MovimentosSTATUS.AsString:= STATUS_ALTERADO_NAO_CONCILIADO;

                lsTipoMov:= 'D';
                if StrToIntDef(cdsMovimentos_BancariosCONFIGURACAO.AsString, 0)> 1000 then
                  lsTipoMov:= 'C';
                cdsEfetiva_MovimentosMOVIMENTO.AsDateTime:= cdsMovimentos_BancariosMOVIMENTACAO.AsDateTime;
                cdsEfetiva_MovimentosTIPOMOVIMENTO.AsString:= lsTipoMov;
                cdsEfetiva_MovimentosVALOR.AsFloat:= cdsMovimentos_BancariosVALOR.AsFloat;
                cdsEfetiva_MovimentosHISTORICO.AsString:= cdsMovimentos_BancariosHISTORICO.AsString;
                cdsEfetiva_Movimentos.Post;

                cdsMovimentos_Arquivo.Edit;
                cdsMovimentos_ArquivoINCLUIDO.AsInteger:= 1;
                cdsMovimentos_Arquivo.Post;
              end;
            end;
            cdsMovimentos_Arquivo.Next;
          end;
        end;

      cdsMovimentos_Bancarios.Next;
    end;
    cdsMovimentos_Arquivo.EnableControls;
    cdsEfetiva_Movimentos.First;
  end;
end;

function TfrmConciliacao_Automatica.Validar(YMOFXReader1: TYMOFXReader):Boolean;
begin
  Result:= False;
  if cdsPerguntasBANCO.AsInteger <> YMOFXReader1.BancoID then
  begin
    __SuperClass.GenericsF.DisplayMessage('Código do banco informado diferente do código do banco do arquivo.', '', 'Verifique o código informado.', 'Informação', MB_ICONEXCLAMATION);
    dbedtBanco.SetFocus;
    Exit;
  end;

  if cdsPerguntasAGENCIA.AsString = EmptyStr then
  begin
    __SuperClass.GenericsF.DisplayMessage('Agência não foi informada.', '', 'Verifique a agência informada.', 'Informação', MB_ICONEXCLAMATION);
    dbedtAgencia.SetFocus;
    Exit;
  end;

//  if cdsPerguntasAGENCIA.AsString <> YMOFXReader1.AccountType then
//  begin
//    __SuperClass.GenericsF.DisplayMessage('Agência informada diferente da agência do arquivo.', '', 'Verifique a agência informada.', 'Informação', MB_ICONEXCLAMATION);
//    dbedtAgencia.SetFocus;
//    Exit;
//  end;

  if Copy(cdsPerguntasCONTA.AsString, 1, 6) <> YMOFXReader1.ContaID then
  begin
    __SuperClass.GenericsF.DisplayMessage('Conta informada diferente da conta do arquivo.', '', 'Verifique a conta informada.', 'Informação', MB_ICONEXCLAMATION);
    dbedtConta.SetFocus;
    Exit;
  end;

  Result:= True;
end;

procedure TfrmConciliacao_Automatica.ProcessarArquivoOFX(FileName: string);
var
  YMOFXReader1: TYMOFXReader;
  i:integer;
  lDataInicial: TDateTime;
  lDataFinal: TDateTime;
begin
  lDataInicial:= 0;
  lDataFinal:= 0;
  YMOFXReader1:= TYMOFXReader.create(self);
  try
    YMOFXReader1.OFXFile := FileName;
    YMOFXReader1.Process;

    if not Validar(YMOFXReader1) then
      Exit;

    for i := 0 to YMOFXReader1.Count-1 do
    begin
      cdsMovimentos_Arquivo.Append;
      cdsMovimentos_ArquivoCONCILIADO.AsString := VB_NAO;
      cdsMovimentos_ArquivoMOVIMENTO.AsDateTime := YMOFXReader1.Get(i).MovDate;
      cdsMovimentos_ArquivoTIPOMOVIMENTO.AsString := Trim(YMOFXReader1.Get(i).MovType);
      cdsMovimentos_ArquivoVALOR.AsFloat := YMOFXReader1.Get(i).Value;
      cdsMovimentos_ArquivoHISTORICO.AsString := YMOFXReader1.Get(i).Desc;
      cdsMovimentos_ArquivoID.AsString:= YMOFXReader1.Get(i).ID;
      cdsMovimentos_ArquivoDOCUMENTO.AsString:= YMOFXReader1.Get(i).Document;
      cdsMovimentos_ArquivoINCLUIDO.AsInteger:= 0;
      cdsMovimentos_Arquivo.Post;

      cdsEfetiva_Movimentos.Append;
      cdsEfetiva_MovimentosSELECIONADO.AsString := VB_NAO;
      cdsEfetiva_MovimentosCONCILIADO.AsString := VB_NAO;
      cdsEfetiva_MovimentosMOVIMENTO.AsDateTime := YMOFXReader1.Get(i).MovDate;
      cdsEfetiva_MovimentosTIPOMOVIMENTO.AsString := Trim(YMOFXReader1.Get(i).MovType);
      cdsEfetiva_MovimentosVALOR.AsFloat := YMOFXReader1.Get(i).Value;
      cdsEfetiva_MovimentosHISTORICO.AsString := YMOFXReader1.Get(i).Desc;
      cdsEfetiva_MovimentosID.AsString:= YMOFXReader1.Get(i).ID;
      cdsEfetiva_MovimentosDOCUMENTO.AsString:= YMOFXReader1.Get(i).Document;
      cdsEfetiva_MovimentosSTATUS.AsString:= STATUS_A_CONCILIAR;
      cdsEfetiva_Movimentos.Post;

      if (lDataInicial = 0) or (YMOFXReader1.Get(i).MovDate < lDataInicial) then
        lDataInicial:= YMOFXReader1.Get(i).MovDate;

      if YMOFXReader1.Get(i).MovDate > lDataFinal then
        lDataFinal:= YMOFXReader1.Get(i).MovDate;
    end;

    AdicionarMovimentosBancarios(lDataInicial, lDataFinal);

    frmSeleciona_Conciliacao_Automatica := TfrmSeleciona_Conciliacao_Automatica.Create(Self);
    try
      with frmSeleciona_Conciliacao_Automatica do
      begin
        cdsEfetiva_Movimentos:= Self.cdsEfetiva_Movimentos;
        cdsMovimentos_Arquivo:= Self.cdsMovimentos_Arquivo;
        SaldoInicial := YMOFXReader1.SaldoInicial;
        Banco := cdsPerguntasBANCO.AsInteger;
        Agencia := cdsPerguntasAGENCIA.AsString;
        Conta := cdsPerguntasCONTA.AsString;

        ShowModal;
      end;
    finally
      FreeAndNil(frmSeleciona_Conciliacao_Automatica);
    end;
  finally
    FreeAndNil( YMOFXReader1 );
  end;
end;

procedure TfrmConciliacao_Automatica.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  try
    btnConfirmar.Enabled:= False;
    btnCancelar.Enabled:= False;
    cdsEfetiva_Movimentos.Close;
    cdsEfetiva_Movimentos.CreateDataSet;
    cdsMovimentos_Arquivo.Close;
    cdsMovimentos_Arquivo.CreateDataSet;

    if not (FileExists(cdsPerguntasCAMINHOARQUIVO.AsString)) then
    begin
      __SuperClass.GenericsF.DisplayMessage('O Arquivo indicado no parametro não existe, por favor verifique os parametros informados.', '', 'Verifique o filtro informado.', 'Informação', MB_ICONEXCLAMATION);
      exit;
    end;

    ProcessarArquivoOFX(cdsPerguntasCAMINHOARQUIVO.AsString);
  finally
    btnConfirmar.Enabled := True;
    btnCancelar.Enabled := True;
  end;
end;

procedure TfrmConciliacao_Automatica.SpeedButton1Click(Sender: TObject);
var AFields : TUStringArray;
    SFields : TUStringArray;
begin
  inherited;
  frmBancos := TfrmBancos.Create(Self);
  try
    // campos que receberão os dados
    SetLength(AFields,4);
    AFields[0] := 'BANCO';
    AFields[1] := 'AGENCIA';
    AFields[2] := 'CONTA';
    AFields[3] := 'NOMEBANCO';
    // campos que proverão os dados
    SetLength(SFields,4);
    SFields[0] := 'CODIGO';
    SFields[1] := 'AGENCIA';
    SFields[2] := 'CONTA';
    SFields[3] := 'REDUZIDO';
    __SuperClass.DBFunctions.ApplyFieldsInDataSet(frmBancos, frmBancos.cdsBancos, frmBancos.dtsBancos, cdsPerguntas, AFields, SFields);
  finally
    FreeAndNil(frmBancos);
  end;
end;

{$Region 'Inicialização/Finalização da classe'}
initialization
  RegisterClass(TfrmConciliacao_Automatica);

finalization
  UnRegisterClass(TfrmConciliacao_Automatica);
{$EndRegion}


end.

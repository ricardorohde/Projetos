{ ********************************************************************* }
{ }
{ TRS Sistemas - Runtime Library Functions }
{ }
{ Copyright(c) 2006-2012 TRS Sistemas e Soluções em Informática Ltda. }
{ }
{ Author: Jhonatan J Ramos }
{ ********************************************************************* }
{ Seleciona Títulos para Impressão de Boletos }
{ }
{ ********************************************************************* }
{ Data última alteração: }
{ Últimas alterações: }
{ }
{ ********************************************************************* }

unit uSeleciona_Titulos_Boletos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFBase, Grids, DBGrids, StdCtrls, ExtCtrls, uTypes,
  uProgressMsg, ImgList, DB, DBClient, {$IFDEF USAVARIANTS} Variants, {$ENDIF}
  ComObj, DSConnect, SHFolder;

type
  TfrmSeleciona_Titulos_Boletos = class(TfrmFBase)
    pnlPrincipal: TPanel;
    pnlBottom: TPanel;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    dbgrid: TDBGrid;
    imgLegendas: TImageList;
    lblValor_Total: TLabel;
    lblTotal_Titulos: TLabel;
    lblValor_Selecionado: TLabel;
    lblTitulos_Selecionado: TLabel;
    imgPrincipal: TImageList;
    cdsBancos: TClientDataSet;
    dspcBancos: TDSProviderConnection;
    cdsAuxiliar: TClientDataSet;
    dspcAuxiliar: TDSProviderConnection;
    procedure FormShow(Sender: TObject);
    procedure dbgridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnConfirmarClick(Sender: TObject);
    procedure dbgridDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbgridKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    LicencaCobreBemX: TLicencaCobreBemX;
    procedure CalculaTotal;
    procedure CalculaSelecao(var Total: Double; var Itens: Integer);
    procedure MarcaSelecao(Marca: Boolean);
    procedure PegaImagensCodigoBarras();
    procedure GravaNossoNumero(Carteira: String; Prefixo: String; Parcela, Numero: Integer; Tipo: String; Cliente: Integer;
      ProximoNumero: String);
    procedure GravaPortador(Carteira: String; Prefixo: String; Parcela, Numero: Integer; Tipo: String; Cliente: Integer;
      Banco: Integer; Agencia, Conta: String);
    procedure GravaProximoNumero(Banco: Integer; Agencia, Conta, ProximoNumero: String);
  public
    cdsTitulos: TClientDataSet;
    dtsTitulos: TDataSource;
    Selecionado: Boolean;
  end;

var
  frmSeleciona_Titulos_Boletos: TfrmSeleciona_Titulos_Boletos;

implementation

uses uImpressao_Boletos, uDMMain;

{$R *.dfm}

procedure TfrmSeleciona_Titulos_Boletos.dbgridDblClick(Sender: TObject);
begin
  inherited;
  with cdsTitulos do
  begin
    Edit;
    if (FieldByName('SELECIONADO').AsString = VB_SIM) then
    begin
      FieldByName('SELECIONADO').AsString := VB_NAO;
    end
    else
      FieldByName('SELECIONADO').AsString := VB_SIM;
    Post;
  end;
  CalculaTotal;
end;

procedure TfrmSeleciona_Titulos_Boletos.dbgridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (Column.FieldName = 'SELECIONADO') then
  begin
    dbgrid.Canvas.FillRect(Rect);
    imgPrincipal.Draw(dbgrid.Canvas, Rect.Left + 5, Rect.Top + 1, 0);
    if (Column.Field.Value = VB_SIM) then
      imgPrincipal.Draw(dbgrid.Canvas, Rect.Left + 5, Rect.Top + 1, 2)
    else
      imgPrincipal.Draw(dbgrid.Canvas, Rect.Left + 5, Rect.Top + 1, 1);
  end;
end;

procedure TfrmSeleciona_Titulos_Boletos.dbgridKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    with dbgrid do
      OnDblClick(Sender);
end;

procedure TfrmSeleciona_Titulos_Boletos.CalculaTotal;
var
  Total: Double;
  Itens: Integer;
  Total_Selecionado: Double;
  Itens_Selecionado: Integer;
  Reg: TBookMark;
begin
  Total := 0;
  Itens := 0;
  Total_Selecionado := 0;
  Itens_Selecionado := 0;
  Reg := Nil;

  with cdsTitulos do
  begin
    try
      DisableControls;
      Reg := GetBookMark;
      First;
      while not Eof do
      begin
        Inc(Itens);
        Total := Total + FieldByName('SALDO').AsCurrency;
        if (FieldByName('SELECIONADO').AsString = VB_SIM) then
        begin
          Total_Selecionado := Total_Selecionado + FieldByName('SALDO').AsCurrency;
          Inc(Itens_Selecionado);
        end;
        Next;
      end;
    finally
      GotoBookMark(Reg);
      FreeBookMark(Reg);
      EnableControls;
    end;
  end;

  lblValor_Total.Caption := Format('Valor Total: %s', [FormatFloat('R$ #,###,###,##0.00', Total)]);
  lblTotal_Titulos.Caption := Format('Título(s): %s', [IntToStr(Itens)]);

  lblValor_Selecionado.Caption := Format('Valor Total Selecionado: %s', [FormatFloat('R$ #,###,###,##0.00', Total_Selecionado)]);
  lblTitulos_Selecionado.Caption := Format('Títulos Selecionados: %s', [IntToStr(Itens_Selecionado)]);

  Application.ProcessMessages;
end;

procedure TfrmSeleciona_Titulos_Boletos.CalculaSelecao(var Total: Double; var Itens: Integer);
var
  Reg: TBookMark;
begin
  Total := 0;
  Itens := 0;
  Reg := Nil;

  with cdsTitulos do
  begin
    try
      DisableControls;
      Reg := GetBookMark;
      First;
      while not Eof do
      begin
        if (FieldByName('SELECIONADO').AsString = VB_SIM) then
        begin
          Total := Total + FieldByName('SALDO').AsCurrency;
          Inc(Itens);
        end;
        Next;
      end;
    finally
      GotoBookMark(Reg);
      FreeBookMark(Reg);
      EnableControls;
    end;
  end;
end;

procedure TfrmSeleciona_Titulos_Boletos.FormCreate(Sender: TObject);
var
  ArquivoLicencaCobreBemX: String;
  ArquivoImagemBoleto: String;
  StreamLicenca: TMemoryStream;
  StreamImagem: TMemoryStream;
begin
  inherited;
  ArquivoLicencaCobreBemX := __SuperClass.DBFunctions.GetParamValue('SV_ARQUIVO_LICENCA_COBREBEMX');
  ArquivoImagemBoleto := __SuperClass.DBFunctions.GetParamValue('SV_ARQUIVO_IMAGEM_BOLETO');

  if FileExists(Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), ArquivoLicencaCobreBemX])) then
    LicencaCobreBemX.Arquivo := Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
      ArquivoLicencaCobreBemX])
  else
  begin
    try
      StreamLicenca := __SuperClass.GenericsF.LoadRemoteFile('System', ArquivoLicencaCobreBemX);
      StreamLicenca.SaveToFile(Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
        ArquivoLicencaCobreBemX]));

      LicencaCobreBemX.Arquivo := Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
        ArquivoLicencaCobreBemX]);
    finally
      StreamLicenca.Free;
    end;
  end;

  if FileExists(Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), ArquivoImagemBoleto])) then
    LicencaCobreBemX.LogoTipo := Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
      ArquivoImagemBoleto])
  else
  begin
    try
      StreamImagem := __SuperClass.GenericsF.LoadRemoteFile('Images', ArquivoImagemBoleto);
      StreamImagem.SaveToFile(Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
        ArquivoImagemBoleto]));

      LicencaCobreBemX.LogoTipo := Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
        ArquivoImagemBoleto]);
    finally
      StreamImagem.Free;
    end;
  end;

  PegaImagensCodigoBarras;

  LicencaCobreBemX.Habilitado := FileExists(LicencaCobreBemX.Arquivo);
end;

procedure TfrmSeleciona_Titulos_Boletos.FormDestroy(Sender: TObject);
begin
  inherited;
  __SuperClass.DBFunctions.CloseDataSet(cdsTitulos);
end;

procedure TfrmSeleciona_Titulos_Boletos.FormShow(Sender: TObject);
begin
  inherited;
  dbgrid.DataSource := dtsTitulos;
  MarcaSelecao(Selecionado);
  CalculaTotal;
end;

procedure TfrmSeleciona_Titulos_Boletos.GravaNossoNumero(Carteira: String; Prefixo: String; Parcela, Numero: Integer;
  Tipo: String; Cliente: Integer; ProximoNumero: String);
var
  Empresa, Filial: String;
  SQL: String;
begin
  __SuperClass.DBFunctions.GetEntityOwner('CONTAS_RECEBER', Empresa, Filial);

  SQL := 'UPDATE CONTAS_RECEBER ';
  SQL := SQL + Format('SET NOSSONUMERO = %s ', [QuotedStr(ProximoNumero)]);
  SQL := SQL + Format('WHERE EMPRESA = %s AND FILIAL = %s AND ', [QuotedStr(Empresa), QuotedStr(Filial)]);
  SQL := SQL + Format('PREFIXO = %s AND NUMERO = %s AND ', [QuotedStr(Prefixo), IntToStr(Numero)]);
  SQL := SQL + Format('TIPO = %s AND CLIENTE = %s AND ', [QuotedStr(Tipo), IntToStr(Cliente)]);
  SQL := SQL + Format('PARCELA = %s ', [IntToStr(Parcela)]);

  with cdsAuxiliar do
  begin
    Close;
    CommandText := SQL;

    Execute;
  end;

end;

procedure TfrmSeleciona_Titulos_Boletos.GravaPortador(Carteira, Prefixo: String;
  Parcela, Numero: Integer; Tipo: String; Cliente, Banco: Integer; Agencia,
  Conta: String);
var
  Empresa, Filial: String;
  SQL: String;
begin
  __SuperClass.DBFunctions.GetEntityOwner('CONTAS_RECEBER', Empresa, Filial);

  SQL := 'UPDATE CONTAS_RECEBER ';
  SQL := SQL + Format('SET BANCO = %s, AGENCIA = %s, CONTA = %s ', [IntToStr(Banco), QuotedStr(Agencia), QuotedStr(Conta)]);
  SQL := SQL + Format('WHERE EMPRESA = %s AND FILIAL = %s AND ', [QuotedStr(Empresa), QuotedStr(Filial)]);
  SQL := SQL + Format('PREFIXO = %s AND NUMERO = %s AND ', [QuotedStr(Prefixo), IntToStr(Numero)]);
  SQL := SQL + Format('TIPO = %s AND CLIENTE = %s AND ', [QuotedStr(Tipo), IntToStr(Cliente)]);
  SQL := SQL + Format('PARCELA = %s ', [IntToStr(Parcela)]);

  with cdsAuxiliar do
  begin
    Close;
    CommandText := SQL;

    Execute;
  end;

end;

procedure TfrmSeleciona_Titulos_Boletos.GravaProximoNumero(Banco: Integer; Agencia, Conta, ProximoNumero: String);
var
  Empresa: String;
  Filial: String;
  SQL: String;
begin
  __SuperClass.DBFunctions.GetEntityOwner('BANCOS', Empresa, Filial);

  SQL := 'UPDATE BANCOS ';
  SQL := SQL + Format('SET PROXIMONUMERO = %s ', [QuotedStr(ProximoNumero)]);
  SQL := SQL + Format('WHERE CODIGO = %s AND AGENCIA = %s AND CONTA = %s AND ',
    [IntToStr(Banco), QuotedStr(Agencia), QuotedStr(Conta)]);
  SQL := SQL + Format('EMPRESA = %s AND FILIAL = %s ', [QuotedStr(Empresa), QuotedStr(Filial)]);

  with cdsAuxiliar do
  begin
    Close;
    CommandText := SQL;
    Execute;
  end;
end;

procedure TfrmSeleciona_Titulos_Boletos.MarcaSelecao(Marca: Boolean);
var
  Reg: TBookMark;
begin
  Reg := Nil;

  with cdsTitulos do
  begin
    try
      DisableControls;
      Reg := GetBookMark;
      First;
      while not Eof do
      begin
        Edit;
        FieldByName('SELECIONADO').AsString := __SuperClass.GenericsF.IfThen(Marca, VB_SIM, VB_NAO);
        Post;

        Next;
      end;
    finally
      GotoBookMark(Reg);
      FreeBookMark(Reg);
      EnableControls;
    end;
  end;
end;

procedure TfrmSeleciona_Titulos_Boletos.PegaImagensCodigoBarras;
var
  StreamImagem: TMemoryStream;
  ArquivoA: String;
  ArquivoB: String;
  ArquivoC: String;
  ArquivoD: String;
begin
  ArquivoA := 'a.gif';
  ArquivoB := 'b.gif';
  ArquivoC := 'c.gif';
  ArquivoD := 'd.gif';

  // A
  if FileExists(Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), ArquivoA])) then
    LicencaCobreBemX.LogoTipo := Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), ArquivoA])
  else
  begin
    try
      StreamImagem := __SuperClass.GenericsF.LoadRemoteFile('Images', ArquivoA);
      StreamImagem.SaveToFile(Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), ArquivoA]));
    finally
      StreamImagem.Free;
    end;
  end;

  // B
  if FileExists(Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), ArquivoB])) then
    LicencaCobreBemX.LogoTipo := Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), ArquivoB])
  else
  begin
    try
      StreamImagem := __SuperClass.GenericsF.LoadRemoteFile('Images', ArquivoB);
      StreamImagem.SaveToFile(Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), ArquivoB]));
    finally
      StreamImagem.Free;
    end;
  end;

  // C
  if FileExists(Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), ArquivoC])) then
    LicencaCobreBemX.LogoTipo := Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), ArquivoC])
  else
  begin
    try
      StreamImagem := __SuperClass.GenericsF.LoadRemoteFile('Images', ArquivoC);
      StreamImagem.SaveToFile(Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), ArquivoC]));
    finally
      StreamImagem.Free;
    end;
  end;

  // D
  if FileExists(Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), ArquivoD])) then
    LicencaCobreBemX.LogoTipo := Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), ArquivoD])
  else
  begin
    try
      StreamImagem := __SuperClass.GenericsF.LoadRemoteFile('Images', ArquivoD);
      StreamImagem.SaveToFile(Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), ArquivoD]));
    finally
      StreamImagem.Free;
    end;
  end;

end;

procedure TfrmSeleciona_Titulos_Boletos.btnConfirmarClick(Sender: TObject);
var
  Reg: TBookMark;
  Msg: TProgressMsg;
  Total: Double;
  Itens: Integer;
  Contador: Integer;
  Empresa: WideString;
  Filial: WideString;
  Falha: Boolean;
  CobreBemX: Variant;
  Boleto: Variant;
  EmailSacado: Variant;
  ProximoNumero: String;
  TOwner: TUEntityOwnerArray;
  SQL: String;
  Demonstrativo: String;
  Instrucoes: String;
  ImagemBoleto: String;
  StreamLicenca: TMemoryStream;
  CodigoAgenciaCustomizado: function(CodigoAgencia: String): String;
  NumeroContaCorrenteCustomizado: function(NumeroContaCorrente: String): String;
  CodigoCedenteCustomizado: function(CodigoCedente: String): String;
  NossoNumeroCustomizado: function(cdsBanco: TClientDataSet): String;
  I: Integer;
  ProximoNumeroAuxiliar: Int64;
  lStrAux: string;
begin
  inherited;
  Reg := Nil;
  Total := 0;
  Itens := 0;
  Contador := 0;
  Falha := False;
  CalculaSelecao(Total, Itens);
  ProximoNumero := '0';
  ProximoNumeroAuxiliar := 0;

  if ((Total = 0) or (Itens = 0)) then
    begin
      __SuperClass.GenericsF.DisplayMessage('Nenhum título selecionado.', '', 'Selecione ao menos 1 título.', 'Informação',
        MB_ICONEXCLAMATION);
      ModalResult := mrNone;
    end
  else
    begin
      if (MessageBox(Application.Handle, 'Confirma a impressão dos boletos?', 'Pergunta', MB_YESNO + MB_ICONQUESTION) = IDYES) then
      begin
        try
          with cdsTitulos do
          begin
            cdsTitulos.First;
            CobreBemX := CreateOleObject('CobreBemX.ContaCorrente');
            CobreBemX.ConfiguraContaCorrente;
            try
              CobreBemX.ArquivoLicenca := LicencaCobreBemX.Arquivo;

              I := 0;
              TryStrToInt(FieldByName('CODIGOCEDENTE').AsString, I);
              CobreBemX.CodigoCedente := FormatFloat('000000000000000', I);
              // Dados da conta
              case StrToIntDef(FieldByName('BANCO').AsString, 0) of
                237:// Bradesco
                  begin
                    TryStrToInt(FieldByName('AGENCIA').AsString, I);
                    CobreBemX.CodigoAgencia := Format('%s-%s', [FormatFloat('0000', I), FieldByName('DVAGENCIA').AsString]);
                    TryStrToInt(FieldByName('CONTA').AsString, I);
                    CobreBemX.NumeroContaCorrente := Format('%s-%s', [FormatFloat('0000000', I), FieldByName('DVCONTA').AsString]);
                  end;
                341:
                  begin
                    TryStrToInt(FieldByName('AGENCIA').AsString, I);
                    CobreBemX.CodigoAgencia := Format('%s', [FormatFloat('0000', I)]);
                    TryStrToInt(FieldByName('CONTA').AsString, I);
                    CobreBemX.NumeroContaCorrente := Format('%s-%s', [FormatFloat('00000', I), FieldByName('DVCONTA').AsString]);
                  end;
                33: //Santander
                  begin
                    TryStrToInt(FieldByName('AGENCIA').AsString, I);
                    CobreBemX.CodigoAgencia := Format('%s-%s', [FormatFloat('0000', I), cdsBorderos.FieldByName('DVAGENCIA').AsString]);;
                    TryStrToInt(FieldByName('CONTA').AsString, I);
                    CobreBemX.NumeroContaCorrente := Format('%s-%s', [FormatFloat('000000000', I), cdsBorderos.FieldByName('DVCONTA').AsString]);

                    TryStrToInt(FieldByName('CODIGOCEDENTE').AsString, I);
                    lStrAux:= FormatFloat('0000000', I);
                    CobreBemX.CodigoCedente := Format('%s-%s', [Copy(lStrAux, 1, 6), Copy(lStrAux, 7, 1)]);

                    //Thiago disse que vai criar um campo para substituir o campo de observação
                    TryStrToInt(FieldByName('OBSERVACAO').AsString, I);
                    CobreBemX.OutroDadoConfiguracao1 := Format('%s', [FormatFloat('00000000000000000000', I)]);
                  end;
              else
                begin
                  TryStrToInt(FieldByName('AGENCIA').AsString, I);
                  CobreBemX.CodigoAgencia := Format('%s%s', [FormatFloat('0000', I), FieldByName('DVAGENCIA').AsString]);
                  TryStrToInt(FieldByName('CONTA').AsString, I);
                  CobreBemX.NumeroContaCorrente := Format('%s%s', [FormatFloat('0000000', I), FieldByName('DVCONTA').AsString]);
                end;
              end;

              // DF
              if (__SuperClass.GetPackage(BPL_ACCUSTOMS).Handle <> 0) then
              begin
                //
                @CodigoAgenciaCustomizado := GetProcAddress(__SuperClass.GetPackage(BPL_ACCUSTOMS).Handle,
                  PChar('CodigoAgenciaCustomizado'));
                if Assigned(CodigoAgenciaCustomizado) then
                  CobreBemX.CodigoAgencia := CodigoAgenciaCustomizado(CobreBemX.CodigoAgencia);
                //
                @NumeroContaCorrenteCustomizado := GetProcAddress(__SuperClass.GetPackage(BPL_ACCUSTOMS).Handle,
                  PChar('NumeroContaCorrenteCustomizado'));
                if Assigned(NumeroContaCorrenteCustomizado) then
                  CobreBemX.CodigoConta := NumeroContaCorrenteCustomizado(CobreBemX.NumeroContaCorrente);
                //
                @CodigoCedenteCustomizado := GetProcAddress(__SuperClass.GetPackage(BPL_ACCUSTOMS).Handle,
                  PChar('CodigoCedenteCustomizado'));
                if Assigned(CodigoCedenteCustomizado) then
                  CobreBemX.CodigoCedente := CodigoCedenteCustomizado(CobreBemX.CodigoCedente);
              end;
              // Dados para nosso número
              CobreBemX.InicioNossoNumero := FieldByName('INICIONUMERO').AsString;
              CobreBemX.FimNossoNumero := FieldByName('FIMNUMERO').AsString;
              CobreBemX.ProximoNossoNumero := FieldByName('PROXIMONUMERO').AsString;
              ImagemBoleto := FieldByName('BANCO').AsString;
              if Length(ImagemBoleto) = 1 then
                ImagemBoleto := '00' + ImagemBoleto
              else if Length(ImagemBoleto) = 2 then
                ImagemBoleto := '0' + ImagemBoleto;
              ImagemBoleto := ImagemBoleto + '.jpg';

              if FileExists(Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), ImagemBoleto])) then
                LicencaCobreBemX.LogoTipo := Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
                  ImagemBoleto])
              else
              begin
                try
                  StreamLicenca := __SuperClass.GenericsF.LoadRemoteFile('Images', ImagemBoleto);
                  StreamLicenca.SaveToFile(Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
                    ImagemBoleto]));

                  LicencaCobreBemX.LogoTipo := Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
                    ImagemBoleto]);
                finally
                  StreamLicenca.Free;
                end;
              end;

              CobreBemX.PadroesBoleto.PadroesBoletoImpresso.ArquivoLogotipo := LicencaCobreBemX.LogoTipo;
              CobreBemX.PadroesBoleto.PadroesBoletoImpresso.CaminhoImagensCodigoBarras :=
                Format('%s\', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA)]);
              CobreBemX.PadroesBoleto.IdentificacaoCedente := FieldByName('CODIGOCEDENTE').AsString;
              CobreBemX.PadroesBoleto.PadroesBoletoImpresso.MargemSuperior := 8;
              CobreBemX.DocumentosCobranca.Clear;
              ProximoNumero := FieldByName('PROXIMONUMERO').AsString;

              // Pega o próximo número do cadastro de bancos
              while not Eof do
              begin
                if (FieldByName('SELECIONADO').AsString = VB_SIM) then
                begin
                  Boleto := CobreBemX.DocumentosCobranca.Add;
                  Boleto.NumeroDocumento := FieldByName('NUMERO').AsString;
                  Boleto.NomeSacado := FieldByName('NOME').AsString;
                  Boleto.EnderecoSacado := FieldByName('ENDERECO').AsString;
                  Boleto.BairroSacado := FieldByName('BAIRRO').AsString;
                  Boleto.CidadeSacado := FieldByName('MUNICIPIO').AsString;
                  Boleto.TipoDocumentoCobranca := FieldByName('TIPO').AsString;

                  if (FieldByName('PESSOA').AsString = '1') then
                    Boleto.CNPJSacado := FieldByName('CNPJ').AsString
                  else
                    Boleto.CPFSacado := FieldByName('CPF').AsString;

                  Boleto.EstadoSacado := FieldByName('UF').AsString;
                  Boleto.CepSacado := FieldByName('CEP').AsString;
                  Boleto.DataDocumento := FormatDateTime('dd/mm/yyyy', FieldByName('EMISSAO').AsDateTime);
                  Boleto.DataVencimento := FormatDateTime('dd/mm/yyyy', (FieldByName('VENCIMENTO').AsDateTime));
                  Boleto.ValorDocumento := FieldByName('SALDO').AsFloat;
                  Boleto.PercentualJurosDiaAtraso := FieldByName('JUROS').AsFloat;
                  Boleto.ValorDesconto := FieldByName('DECRESCIMO').AsString;
                  Boleto.ValorOutrosAcrescimos := FieldByName('ACRESCIMO').AsFloat;

                  Demonstrativo := FieldByName('DEMONSTRATIVO').AsString;
                  Demonstrativo := StringReplace(Demonstrativo, '%PREFIXO%', Format('[%s]', [FieldByName('PREFIXO').AsString]),
                    [rfReplaceAll]);
                  Demonstrativo := StringReplace(Demonstrativo, '%NOTA%', Format('[%s]', [FieldByName('NUMERO').AsString]),
                    [rfReplaceAll]);
                  Demonstrativo := StringReplace(Demonstrativo, '%IDCNAB%', Format('[%s]', [FieldByName('IDCNAB').AsString]),
                    [rfReplaceAll]);
                  Boleto.PadroesBoleto.Demonstrativo := Demonstrativo;

                  Instrucoes := FieldByName('INSTRUCAOBANCARIA').AsString;
                  Instrucoes := StringReplace(Instrucoes, '%PREFIXO%', Format('[%s]', [FieldByName('PREFIXO').AsString]),
                    [rfReplaceAll]);;
                  Instrucoes := StringReplace(Instrucoes, '%NOTA%', Format('[%s]', [FieldByName('NUMERO').AsString]),
                    [rfReplaceAll]);;
                  Instrucoes := StringReplace(Instrucoes, '%IDCNAB%', Format('[%s]', [FieldByName('IDCNAB').AsString]),
                    [rfReplaceAll]);
                  Boleto.PadroesBoleto.InstrucoesCaixa := Instrucoes;

                  if FieldByName('NOSSONUMERO').AsString = '' then
                  begin
                    if (__SuperClass.GetPackage(BPL_ACCUSTOMS).Handle <> 0) then
                    begin
                      @NossoNumeroCustomizado := GetProcAddress(__SuperClass.GetPackage(BPL_ACCUSTOMS).Handle,
                        PChar('NossoNumeroCustomizado'));
                      if Assigned(NossoNumeroCustomizado) then
                      begin
                        // Grava o nosso número no título em questão
                        GravaNossoNumero(MB_CONTAS_RECEBER, FieldByName('PREFIXO').AsString, FieldByName('PARCELA').AsInteger,
                          FieldByName('NUMERO').AsInteger, FieldByName('TIPO').AsString, FieldByName('CLIENTE').AsInteger,
                          ProximoNumero);

                        // Atribui o nosso número ao título em questão
                        ProximoNumero := NossoNumeroCustomizado(cdsBancos);
                        Boleto.NossoNumero := ProximoNumero;

                        // Incrementa nosso número
                        ProximoNumero := IntToStr(StrToInt64(ProximoNumero) + 1);

                        GravaProximoNumero(FieldByName('BANCO').AsInteger, FieldByName('AGENCIA').AsString,
                          FieldByName('CONTA').AsString, ProximoNumero);
                      end
                      else
                      begin
                        // Grava o nosso número no título em questão
                        GravaNossoNumero(MB_CONTAS_RECEBER, FieldByName('PREFIXO').AsString, FieldByName('PARCELA').AsInteger,
                          FieldByName('NUMERO').AsInteger, FieldByName('TIPO').AsString, FieldByName('CLIENTE').AsInteger,
                          ProximoNumero);

                        // Atribui o nosso número ao título em questão
                        Boleto.NossoNumero := ProximoNumero;

                        // Incrementa nosso número
                        ProximoNumero := IntToStr(StrToInt64(ProximoNumero) + 1);

                        GravaProximoNumero(FieldByName('BANCO').AsInteger, FieldByName('AGENCIA').AsString,
                          FieldByName('CONTA').AsString, ProximoNumero);
                      end;
                    end
                    else
                    begin
                      // Grava o nosso número no título em questão
                      GravaNossoNumero(MB_CONTAS_RECEBER, FieldByName('PREFIXO').AsString, FieldByName('PARCELA').AsInteger,
                        FieldByName('NUMERO').AsInteger, FieldByName('TIPO').AsString, FieldByName('CLIENTE').AsInteger,
                        ProximoNumero);

                      // Atribui o nosso número ao título em questão
                      Boleto.NossoNumero := ProximoNumero;

                      // Incrementa nosso número
                      ProximoNumero := IntToStr(StrToInt64(ProximoNumero) + 1);

                      GravaProximoNumero(FieldByName('BANCO').AsInteger, FieldByName('AGENCIA').AsString,
                        FieldByName('CONTA').AsString, ProximoNumero);
                    end;
                    GravaPortador(MB_CONTAS_RECEBER, FieldByName('PREFIXO').AsString, FieldByName('PARCELA').AsInteger,
                    FieldByName('NUMERO').AsInteger, FieldByName('TIPO').AsString, FieldByName('CLIENTE').AsInteger,
                    FieldByName('BANCO').AsInteger, FieldByName('AGENCIA').AsString, FieldByName('CONTA').AsString);
                  end
                  else
                    // Atribui o nosso número ao título em questão
                    Boleto.NossoNumero := FieldByName('NOSSONUMERO').AsString;
                end;

                cdsTitulos.Next;
              end;

              CobreBemX.PadroesBoleto.PadroesBoletoEmail.URLImagensCodigoBarras := 'http://www.bptob.com/imagenscbe/';
              CobreBemX.PadroesBoleto.PadroesBoletoEmail.URLLogotipo := 'http://www.cobrebemx.com/banners/BannerCBX.gif';
              CobreBemX.PadroesBoleto.PadroesBoletoEmail.PadroesEmail.Assunto := 'Boleto de Cobrança - ' +
                __SuperClass.User.Branch.FullName;
              CobreBemX.PadroesBoleto.PadroesBoletoEmail.PadroesEmail.FormaEnvio := 0;
              CobreBemX.PadroesBoleto.PadroesBoletoEmail.SMTP.Porta := 25;
              CobreBemX.PadroesBoleto.PadroesBoletoEmail.SMTP.Servidor := __SuperClass.User.SMTPServer;
              CobreBemX.PadroesBoleto.PadroesBoletoEmail.SMTP.Usuario := __SuperClass.User.MailAccount;
              CobreBemX.PadroesBoleto.PadroesBoletoEmail.SMTP.Senha := __SuperClass.User.MailPassword;

              CobreBemX.ConfiguraContaCorrente;
              CobreBemX.CalcularDadosBoletos;

              ProximoNumeroAuxiliar := StrToInt64(ProximoNumero);
              if (FieldByName('PROXIMONUMERO').AsInteger <> ProximoNumeroAuxiliar) then
              begin
                // Grava o próximo numero no banco
                GravaProximoNumero(FieldByName('BANCO').AsInteger, FieldByName('AGENCIA').AsString, FieldByName('CONTA').AsString, ProximoNumero);
              end;

              CobreBemX.ImprimeBoletos;
            finally
              CobreBemX := Unassigned;
            end;
          end;
        except
          on E: Exception do
          begin
            Falha := True;
            __SuperClass.GenericsF.DisplayMessage('Falha na geração do Boletos.', Format('%s.', [E.Message]), 'Tente novamente.',
              'Informação', MB_ICONINFORMATION);
          end;
        end;
      end;
    end;
end;

end.

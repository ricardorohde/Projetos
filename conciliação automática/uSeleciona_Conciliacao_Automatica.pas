unit uSeleciona_Conciliacao_Automatica;

interface

uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Data.DB, DBClient, StdCtrls, ExtCtrls, DBCtrls, Mask, Buttons,
  DSConnect, uInput_Params, uTypes, uLibrary, uRecError, Vcl.Grids, Vcl.DBGrids,
  Vcl.Imaging.jpeg, Vcl.ImgList,uDmMain, Vcl.Menus, StrUtils, W7Classes,
  W7Buttons, VrControls, VrGradient, AdvGlowButton, AeroButtons;

type
  TfrmSeleciona_Conciliacao_Automatica = class(TForm)
    pnlTop: TPanel;
    lblText: TLabel;
    imgConc: TImage;
    Label1: TLabel;
    lblSaldoInicial: TLabel;
    Label2: TLabel;
    lblMovimentacoes: TLabel;
    Label4: TLabel;
    lblSaldoFinal: TLabel;
    Panel1: TPanel;
    dtsMovimentosArquivo: TDataSource;
    imgLegendas: TImageList;
    imgPrincipal: TImageList;
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
    AppPopup: TPopupMenu;
    mnuInforma_Data: TMenuItem;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblSaldoBanco: TLabel;
    cdsExecute: TClientDataSet;
    dspcVincular_Coleta: TDSProviderConnection;
    pnlLeft: TPanel;
    dggrdMovimentosArquivo: TDBGrid;
    pnlRight: TPanel;
    Label7: TLabel;
    dbgrdResultado: TDBGrid;
    dtsGridResultado: TDataSource;
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
    gpxLegenda: TGroupBox;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape1: TShape;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Panel2: TPanel;
    VrGradient1: TVrGradient;
    btnConfirmarConciliacao: TAdvGlowButton;
    btnExcluir: TAdvGlowButton;
    Label8: TLabel;
    Splitter1: TSplitter;
    Shape5: TShape;
    Label13: TLabel;
    procedure CalculaTotal();
    procedure dggrdMovimentosArquivoDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dggrdMovimentosArquivoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnConfirmarConciliacaoClick(Sender: TObject);
    procedure mnuInforma_DataClick(Sender: TObject);
    procedure dbgrdResultadoTitleClick(Column: TColumn);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormResize(Sender: TObject);

  private
    { Private declarations }
    FiSelecionado: Integer;
    procedure RealizarConciliacao();
    procedure InserirMovimentoBancario(psEmpresa, psFilial: string);
    procedure DeleteOrEditMovimentoBancario(psEmpresa, psFilial: string; AValorOld: Extended; pbIsEdit: Boolean = True);
    procedure cdsSetOrderDBGrid(var cds: TClientDataSet; var DBG: TDBGrid;
      Column: TColumn);
  public
    cdsEfetiva_Movimentos:TClientDataSet;
    cdsMovimentos_Arquivo:TClientDataSet;

    SaldoInicial: Double;
    Banco:Integer;
    Agencia:String;
    Conta:String;
  end;

var
  frmSeleciona_Conciliacao_Automatica: TfrmSeleciona_Conciliacao_Automatica;

const
  STATUS_OK = 'OK';
  STATUS_ADICIONADO = 'ADICIONADO';
  STATUS_ALTERADO = 'ALTERADO';
  STATUS_ALTERADO_NAO_CONCILIADO = 'ALTERADO_NAO_CONCILIADO';
  STATUS_A_CONCILIAR = 'A_CONCILIAR';

implementation

uses
  uProgressMsg;

{$R *.dfm}

procedure TfrmSeleciona_Conciliacao_Automatica.btnConfirmarConciliacaoClick(Sender: TObject);
begin
  RealizarConciliacao();
end;

procedure TfrmSeleciona_Conciliacao_Automatica.btnExcluirClick(Sender: TObject);
var
  lsEmpresa, lsFilial: string;
begin
  __SuperClass.DBFunctions.GetEntityOwner('MOVIMENTOS_BANCARIOS', lsEmpresa, lsFilial);

  if Application.MessageBox('Tem certeza que deseja excluir os registros selecionados?','Confirmação',MB_YESNO + MB_ICONINFORMATION + MB_DEFBUTTON3) = MRYES then
  begin
    cdsEfetiva_Movimentos.DisableControls;
    cdsEfetiva_Movimentos.First;
    while not cdsEfetiva_Movimentos.Eof do
    begin
      if (cdsEfetiva_Movimentos.FieldByName('SELECIONADO').AsString = VB_SIM) then
      begin
        if cdsEfetiva_Movimentos.FieldByName('STATUS').AsString = STATUS_ADICIONADO then
        begin
          DeleteOrEditMovimentoBancario(lsEmpresa, lsFilial, cdsEfetiva_Movimentos.FieldByName('VALOR').AsFloat, False);
          cdsEfetiva_Movimentos.Delete;
          Continue;
        end;
      end;

      cdsEfetiva_Movimentos.Next;
    end;
    cdsEfetiva_Movimentos.EnableControls;
  end;
end;

procedure TfrmSeleciona_Conciliacao_Automatica.CalculaTotal();
var
  Total: Double;
  Itens: Integer;
  Total_Selecionado: Double;
  Itens_Selecionado: Integer;
  Reg: TBookMark;
begin

  Total   := 0;
  Itens := 0;
  Total_Selecionado:= 0;
  Itens_Selecionado:= 0;

  Reg := Nil;
  with cdsEfetiva_Movimentos do
  begin
    try
      DisableControls;
      Reg := GetBookMark;
      First;
      while not Eof do
      begin
        Inc(Itens);
        if(cdsEfetiva_Movimentos.FieldByName('TIPOMOVIMENTO').AsString = 'C') then
          Total := Total + FieldByName('VALOR').AsCurrency
        else
          Total := Total - FieldByName('VALOR').AsCurrency;

        Next;
      end;
    finally
      GotoBookMark(Reg);
      FreeBookMark(Reg);
      EnableControls;
    end;
  end;

  lblSaldoInicial.Caption   := Format('%s', [FormatFloat('R$ #,###,###,##0.00', SaldoInicial)]);

  if(SaldoInicial < 0 ) then
    lblSaldoInicial.Font.Color := clRed
  else
    lblSaldoInicial.Font.Color := clGreen;

  lblMovimentacoes.Caption   := Format('%s', [FormatFloat('R$ #,###,###,##0.00', Total)]);

  if(Total < 0 ) then
    lblMovimentacoes.Font.Color := clRed
  else
    lblMovimentacoes.Font.Color := clGreen;

  lblSaldoFinal.Caption   := Format('%s', [FormatFloat('R$ #,###,###,##0.00', SaldoInicial + Total)]);

  if(SaldoInicial + Total < 0 ) then
    lblSaldoFinal.Font.Color := clRed
  else
    lblSaldoFinal.Font.Color := clGreen;

  lblSaldoBanco.Caption :=  Format('%s', [FormatFloat('R$ #,###,###,##0.00', __SuperClass.GenericsF.PegaSaldoBancario(Banco,Agencia,Conta,__SuperClass.User.DataBase))]);
end;

procedure TfrmSeleciona_Conciliacao_Automatica.dbgrdResultadoTitleClick(
  Column: TColumn);
begin
  if Column.FieldName = 'SELECIONADO' then
    begin
      if FiSelecionado = 0 then
        FiSelecionado:= 1
      else
        FiSelecionado:= 0;

      cdsEfetiva_Movimentos.DisableControls;
      cdsEfetiva_Movimentos.First;
      while not cdsEfetiva_Movimentos.Eof do
      begin
        cdsEfetiva_Movimentos.Edit;
        cdsEfetiva_Movimentos.FieldByName('SELECIONADO').AsInteger:= FiSelecionado;
        cdsEfetiva_Movimentos.Post;
        cdsEfetiva_Movimentos.Next;
      end;
      cdsEfetiva_Movimentos.First;
      cdsEfetiva_Movimentos.EnableControls;

      if AnsiUpperCase(Column.Title.Caption) = 'MARCAR TODOS'  then
        Column.Title.Caption:= 'Desmarcar todos'
      else
        Column.Title.Caption:= 'Marcar todos';
    end
  else
    cdsSetOrderDBGrid( cdsEfetiva_Movimentos, dbgrdResultado, Column );
end;

procedure TfrmSeleciona_Conciliacao_Automatica.cdsSetOrderDBGrid(var cds:TClientDataSet;
  var DBG: TDBGrid; Column : TColumn);
const
  idxDefault = 'DEFAULT_ORDER';
var
  strColumn : string;
  i         : integer;
  bolUsed   : boolean;
  idOptions: TIndexOptions;
  lsIdxName: string;
  OldFetch: Boolean;
  lBookMark: TBookmark;
begin
  DBG.OnDblClick:= nil;
  lBookMark:= cds.GetBookmark;
  strColumn:= idxDefault;
  idOptions:= [];

  if Column.Field.FieldKind in [fkCalculated, fkLookup, fkAggregate] then
    exit;

  if Column.Field.DataType in [ftBlob, ftMemo] then
    exit;

  for I := 0 to DBG.Columns.Count - 1 do
  begin
    DBG.Columns[I].Title.Font.Color := clBlack;
  end;

  DBG.Columns[Column.Index].Title.Font.Color := clRed;

  bolUsed := 'Idx' + Column.Field.FieldName = cds.IndexName;

  cds.IndexDefs.Update;
  for I := 0 to cds.IndexDefs.Count - 1 do
  begin
    if cds.IndexDefs.Items[I].Name = 'Idx' + Column.Field.FieldName then
    begin
      strColumn := 'Idx' + Column.Field.FieldName;
      case (cds.IndexDefs[i].Options = [ixDescending]) of
        True: idOptions := [];
        False: idOptions := [ixDescending];
      end;
    end;
  end;

  lsIdxName:= 'Idx'+ Column.Field.FieldName;
  if (strColumn = idxDefault) or (bolUsed) then
  begin
    if bolUsed then
      cds.DeleteIndex(lsIdxName);
    try
      cds.AddIndex(lsIdxName, Column.Field.FieldName, idOptions);
      strColumn := lsIdxName;
    except
      if bolUsed then
        strColumn := idxDefault;
    end;
  end;

  try
    OldFetch := cds.FetchOnDemand;
    cds.FetchOnDemand := False; // Desabilita o Fetch para evitar que traga todos os registros
    cds.IndexName:= strColumn;
    cds.FetchOnDemand := OldFetch;
  except
    cds.IndexName := idxDefault;
  end;

  cds.GotoBookmark(lBookMark);
  cds.FreeBookmark(lBookMark);
  DBG.OnDblClick:= dggrdMovimentosArquivoDblClick;
end;

procedure TfrmSeleciona_Conciliacao_Automatica.dggrdMovimentosArquivoDblClick(
  Sender: TObject);
begin
  with cdsEfetiva_Movimentos do
  begin
    Edit;
    if (FieldByName('SELECIONADO').AsString = VB_SIM) then
      FieldByName('SELECIONADO').AsString := VB_NAO
    else
      FieldByName('SELECIONADO').AsString := VB_SIM;
    Post;
  end;
end;

procedure TfrmSeleciona_Conciliacao_Automatica.dggrdMovimentosArquivoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (Column.FieldName = 'SELECIONADO') then
  begin
    dbgrdResultado.Canvas.FillRect(Rect);
    imgPrincipal.Draw(dbgrdResultado.Canvas, Rect.Left + 5, Rect.Top + 1, 0);
    if (Column.Field.Value = VB_SIM) then
      imgPrincipal.Draw(dbgrdResultado.Canvas, Rect.Left + 5, Rect.Top + 1, 2)
    else
      imgPrincipal.Draw(dbgrdResultado.Canvas, Rect.Left + 5, Rect.Top + 1, 1);
  end;

  if(Column.FieldName <> 'SELECIONADO') then
  begin
    case AnsiIndexStr(cdsEfetiva_Movimentos.FieldByName('STATUS').AsString,
                      [STATUS_ADICIONADO, STATUS_ALTERADO, STATUS_ALTERADO_NAO_CONCILIADO,
                      STATUS_A_CONCILIAR, STATUS_OK]) of
      0:
        begin
          dbgrdResultado.Canvas.Brush.Color:= $005555FF;//Vermelho
          dbgrdResultado.Canvas.FillRect(Rect);
          dbgrdResultado.DefaultDrawDataCell(Rect, Column.Field, State);
        end;
      1:
        begin
          if ((Uppercase(Column.FieldName) = 'VALOR') and
              (dbgrdResultado.DataSource.DataSet.FieldByName('VALOR_ARQUIVO').AsString <> EmptyStr)) or
             ((Uppercase(Column.FieldName) = 'HISTORICO') and
              (dbgrdResultado.DataSource.DataSet.FieldByName('HISTORICO_ARQUIVO').AsString <> EmptyStr)) then
            begin
              dbgrdResultado.Canvas.Font.Color := clRed;
              dbgrdResultado.Canvas.Font.Style:= [fsbold];
            end
          else
           begin
             dbgrdResultado.Canvas.Font.Color := clBlack;
             dbgrdResultado.Canvas.Font.Style:= [];
           end;

          dbgrdResultado.Canvas.Brush.Color:= $006CFFFF;//Amarelo
          dbgrdResultado.Canvas.FillRect(Rect);
          dbgrdResultado.DefaultDrawDataCell(Rect, Column.Field, State);
        end;
      2:
        begin
          dbgrdResultado.Canvas.Brush.Color:= clSilver;//Cinza
          dbgrdResultado.Canvas.FillRect(Rect);
          dbgrdResultado.DefaultDrawDataCell(Rect, Column.Field, State);
        end;
      3:
        begin
          dbgrdResultado.Canvas.Brush.Color:= $00F9A099;//Azul
          dbgrdResultado.Canvas.FillRect(Rect);
          dbgrdResultado.DefaultDrawDataCell(Rect, Column.Field, State);
        end;
      4:
        begin
          dbgrdResultado.Canvas.Brush.Color:= $0056BE29;//Verda
          dbgrdResultado.Canvas.FillRect(Rect);
          dbgrdResultado.DefaultDrawDataCell(Rect, Column.Field, State);
        end;
    end;
  end;
end;

procedure TfrmSeleciona_Conciliacao_Automatica.FormCreate(Sender: TObject);
begin
   frmSeleciona_Conciliacao_Automatica := Self;
end;

procedure TfrmSeleciona_Conciliacao_Automatica.FormResize(Sender: TObject);
begin
  gpxLegenda.Left:= pnlTop.Width - gpxLegenda.Width - 15;
  btnConfirmarConciliacao.Left:= pnlTop.Width - btnConfirmarConciliacao.Width - btnExcluir.Width - 10;
  btnExcluir.Left:= pnlTop.Width - btnExcluir.Width - 5;
  pnlLeft.Width:= (pnlTop.Width div 2) - 50;
  dggrdMovimentosArquivo.Width:= (pnlTop.Width div 2) - 100;
end;

procedure TfrmSeleciona_Conciliacao_Automatica.FormShow(Sender: TObject);
begin
  dtsMovimentosArquivo.DataSet:= cdsMovimentos_Arquivo;
  __SuperClass.DBFunctions.OpenDataSet(cdsMovimentos_Arquivo, True, True, 0);

  dtsGridResultado.DataSet:= cdsEfetiva_Movimentos;
  __SuperClass.DBFunctions.OpenDataSet(cdsEfetiva_Movimentos, True, True, 0);
  cdsEfetiva_Movimentos.IndexName:= 'IdxStatus';
  CalculaTotal;

  cdsEfetiva_Movimentos.First;
  FiSelecionado:= cdsEfetiva_Movimentos.FieldByName('SELECIONADO').AsInteger;
end;

procedure TfrmSeleciona_Conciliacao_Automatica.mnuInforma_DataClick(
  Sender: TObject);
var
  Conciliacao: TDateTime;
begin
  with cdsMovimentos_Bancarios do
  begin
    Conciliacao := FieldByName('MOVIMENTACAO').AsDateTime;
    if __SuperClass.DBFunctions.ShowCalendar(Sender, Conciliacao) then
    begin
      Edit;
      FieldByName('CONCILIADO').AsString     := VB_SIM;
      FieldByName('MOVIMENTACAO').AsDateTime := Conciliacao;
      Post;
      CalculaTotal;
    end;
  end;
end;

procedure TfrmSeleciona_Conciliacao_Automatica.InserirMovimentoBancario(psEmpresa, psFilial: string);
begin
  //Movimentos não encontrados
  cdsMovimentos_Bancarios.Close;
  cdsMovimentos_Bancarios.PacketRecords:= 0;
  cdsMovimentos_Bancarios.Open;
  cdsMovimentos_Bancarios.Insert;
  cdsMovimentos_BancariosEMPRESA.AsString            := psEmpresa;
  cdsMovimentos_BancariosFILIAL.AsString             := psFilial;
  if(cdsEfetiva_Movimentos.FieldByName('TIPOMOVIMENTO').AsString = 'D') then
    cdsMovimentos_BancariosMOVIMENTO.AsString          := MB_CONTAS_PAGAR
  else
    cdsMovimentos_BancariosMOVIMENTO.AsString          := MB_CONTAS_RECEBER;

  cdsMovimentos_BancariosCATEGORIA.AsString          := '1'; //Definir
  cdsMovimentos_BancariosBENEFICIARIO.AsString       := 'CONCILIACAO AUTOMATICA';
  cdsMovimentos_BancariosEMISSAO.asDateTime          := __SuperClass.User.DataBase;

  cdsMovimentos_BancariosESPECIE.AsString            := '01';
  cdsMovimentos_BancariosBANCO.asInteger             := Banco;
  cdsMovimentos_BancariosAGENCIA.AsString            := Agencia;
  cdsMovimentos_BancariosCONTA.AsString              := Conta;

  cdsMovimentos_BancariosDOCUMENTO.AsString          := cdsEfetiva_Movimentos.FieldByName('DOCUMENTO').AsString;
  cdsMovimentos_BancariosIDENTIFICADOR.AsInteger     := Random(999999);
  cdsMovimentos_BancariosVALOR.AsCurrency            := cdsEfetiva_Movimentos.FieldByName('VALOR').AsCurrency;
  cdsMovimentos_BancariosMOVIMENTACAO.AsDateTime     := cdsEfetiva_Movimentos.FieldByName('MOVIMENTO').AsDateTime;
  cdsMovimentos_BancariosCONCILIADO.AsString         := VB_SIM;
  cdsMovimentos_BancariosEMPRESAORIGEM.AsString      := __SuperClass.User.Company.Code;
  cdsMovimentos_BancariosFILIALORIGEM.AsString       := __SuperClass.User.Branch.Code;
  cdsMovimentos_BancariosORIGEM.AsString             := 'AUT';
  cdsMovimentos_BancariosID.AsString                 := cdsEfetiva_Movimentos.FieldByName('ID').AsString;
  cdsMovimentos_BancariosTIPOMOVIMENTO.AsString      := cdsEfetiva_Movimentos.FieldByName('TIPOMOVIMENTO').AsString;
  cdsMovimentos_BancariosHISTORICO.AsString          := cdsEfetiva_Movimentos.FieldByName('HISTORICO').AsString;

   if(cdsEfetiva_Movimentos.FieldByName('TIPOMOVIMENTO').AsString = 'D') then
    cdsMovimentos_BancariosCONFIGURACAO.AsString       := MB_CONTAS_PAGAR + VB_SIM + VB_NAO + VB_NAO
   else
   cdsMovimentos_BancariosCONFIGURACAO.AsString        := MB_CONTAS_RECEBER + VB_SIM + VB_NAO + VB_NAO;

  cdsMovimentos_BancariosDATACRIACAO.AsDateTime      := __SuperClass.ServerDateTime;
  cdsMovimentos_Bancarios.Post;
   __SuperClass.DBFunctions.dbApply(cdsMovimentos_Bancarios);
end;

procedure TfrmSeleciona_Conciliacao_Automatica.DeleteOrEditMovimentoBancario(psEmpresa, psFilial: string; AValorOld: Extended; pbIsEdit: Boolean = True);
var
  lsSQL: string;
begin
  __SuperClass.DBFunctions.GetEntityOwner('MOVIMENTOS_BANCARIOS', psEmpresa, psFilial);

  lsSQL :=  'SELECT * ';
  lsSQL := lsSQL + 'FROM MOVIMENTOS_BANCARIOS ';
  lsSQL := lsSQL + 'WHERE EMPRESA = :EMPRESA AND FILIAL = :FILIAL AND BANCO = :BANCO AND AGENCIA = :AGENCIA AND CONTA = :CONTA AND ';
  lsSQL := lsSQL + 'MOVIMENTACAO BETWEEN :MOVIMENTODE AND :MOVIMENTOATE AND ';
  lsSQL := lsSQL + 'VALOR = :VALOR AND COALESCE(ID, '''') = '''' ';
  lsSQL := lsSQL + 'ORDER BY MOVIMENTACAO, BANCO, AGENCIA, CONTA';

  with cdsMovimentos_Bancarios, cdsMovimentos_Bancarios.Params do
  begin
    CommandText := lsSQL;
    with ParamByName('EMPRESA') do
    begin
      DataType  := ftString;
      ParamType := ptInput;
      AsString  := psEmpresa;
    end;
    with ParamByName('FILIAL') do
    begin
      DataType  := ftString;
      ParamType := ptInput;
      AsString  := psFilial;
    end;
    with ParamByName('BANCO') do
    begin
      DataType  := ftInteger;
      ParamType := ptInput;
      AsInteger := Banco;
    end;
    with ParamByName('AGENCIA') do
    begin
      DataType  := ftString;
      ParamType := ptInput;
      AsString  := Agencia;
    end;
    with ParamByName('CONTA') do
    begin
      DataType  := ftString;
      ParamType := ptInput;
      AsString  := Conta  ;
    end;
    with ParamByName('MOVIMENTODE') do
    begin
      DataType  := ftDateTime;
      ParamType := ptInput;
      AsDate    := cdsEfetiva_Movimentos.FieldByName('MOVIMENTO').AsDateTime;
    end;
    with ParamByName('MOVIMENTOATE') do
    begin
      DataType  := ftDatetime;
      ParamType := ptInput;
      AsDate    := cdsEfetiva_Movimentos.FieldByName('MOVIMENTO').AsDateTime;
    end;
    with ParamByName('VALOR') do
    begin
      DataType  := ftFloat;
      ParamType := ptInput;
      AsFloat   := AValorOld;
    end;

    __SuperClass.DBFunctions.OpenDataSet(cdsMovimentos_Bancarios, False, False, -1);

    if not IsEmpty then
      if pbIsEdit then
        begin
          cdsMovimentos_Bancarios.First;
          while not cdsMovimentos_Bancarios.Eof do
          begin
            cdsMovimentos_Bancarios.Edit;
            cdsMovimentos_BancariosCONCILIADO.AsString:= VB_SIM;
            cdsMovimentos_BancariosID.AsString:= cdsEfetiva_Movimentos.FieldByName('ID').AsString;
            cdsMovimentos_BancariosTIPOMOVIMENTO.AsString:= cdsEfetiva_Movimentos.FieldByName('TIPOMOVIMENTO').AsString;
            cdsMovimentos_BancariosHISTORICO.AsString:= cdsEfetiva_Movimentos.FieldByName('HISTORICO').AsString;
            cdsMovimentos_BancariosVALOR.AsCurrency:= cdsEfetiva_Movimentos.FieldByName('VALOR').AsCurrency;
            cdsMovimentos_BancariosMOVIMENTACAO.AsDateTime:= cdsEfetiva_Movimentos.FieldByName('MOVIMENTO').AsDateTime;
            cdsMovimentos_BancariosDOCUMENTO.AsString:= cdsEfetiva_Movimentos.FieldByName('DOCUMENTO').AsString;
            cdsMovimentos_Bancarios.Post;
            __SuperClass.DBFunctions.dbApply(cdsMovimentos_Bancarios);

            cdsMovimentos_Bancarios.Next;
          end;
        end
      else
        begin
          cdsMovimentos_Bancarios.Delete;
          __SuperClass.DBFunctions.dbApply(cdsMovimentos_Bancarios);
        end;
  end;
end;

procedure TfrmSeleciona_Conciliacao_Automatica.RealizarConciliacao();
var
  lsEmpresa: string;
  lsFilial: string;
  lsStatusOld: string;
  i: Integer;
  Msg: TProgressMsg;
  lValorOld: Extended;
begin
  try
    __SuperClass.DBFunctions.GetEntityOwner('MOVIMENTOS_BANCARIOS', lsEmpresa, lsFilial);
    __SuperClass.GenericsF.DisplayInformation(itBegin, Msg, '');
    cdsEfetiva_Movimentos.IndexName:= '';
    cdsEfetiva_Movimentos.DisableControls;
    cdsMovimentos_Arquivo.DisableControls;
    cdsEfetiva_Movimentos.First;
    while not cdsEfetiva_Movimentos.Eof do
    begin
      __SuperClass.GenericsF.DisplayInformation(itUpdate, Msg, 'Aguarde, atualizando registros...');
      application.ProcessMessages;
      if (cdsEfetiva_Movimentos.FieldByName('SELECIONADO').AsString = VB_SIM) then
      begin
        if AnsiMatchStr(cdsEfetiva_Movimentos.FieldByName('STATUS').AsString,
                        [STATUS_A_CONCILIAR, STATUS_ALTERADO, STATUS_ALTERADO_NAO_CONCILIADO]) then
        begin
          lsStatusOld:= cdsEfetiva_Movimentos.FieldByName('STATUS').AsString;

          lValorOld:= cdsEfetiva_Movimentos.FieldByName('VALOR').AsFloat;
          cdsEfetiva_Movimentos.Edit;
          cdsMovimentos_Arquivo.CancelRange;
          cdsMovimentos_Arquivo.IndexFieldNames:= 'ID';
          cdsMovimentos_Arquivo.SetRange([cdsEfetiva_Movimentos.FieldByName('ID').AsString], [cdsEfetiva_Movimentos.FieldByName('ID').AsString]);
          if not cdsMovimentos_Arquivo.IsEmpty then
            for i := 0 to cdsMovimentos_Arquivo.FieldCount -1 do
              if Assigned( cdsEfetiva_Movimentos.FindField( cdsMovimentos_Arquivo.Fields[i].FieldName ) )  then
              begin
                cdsEfetiva_Movimentos.FieldByName(cdsMovimentos_Arquivo.Fields[i].FieldName).Value:=
                  cdsMovimentos_Arquivo.Fields[i].Value;
              end;
          cdsEfetiva_Movimentos.FieldByName('STATUS').AsString := STATUS_OK;
          cdsEfetiva_Movimentos.FieldByName('CONCILIADO').AsString := VB_SIM;
          cdsEfetiva_Movimentos.FieldByName('SELECIONADO').AsString := VB_NAO;
          cdsEfetiva_Movimentos.FieldByName('VALOR_ARQUIVO').Clear;
          cdsEfetiva_Movimentos.FieldByName('HISTORICO_ARQUIVO').AsString := '';
          cdsEfetiva_Movimentos.Post;

          if AnsiSameStr(lsStatusOld, STATUS_A_CONCILIAR) then
            InserirMovimentoBancario(lsEmpresa, lsFilial)
          else
          if AnsiMatchStr(lsStatusOld, [STATUS_ALTERADO, STATUS_ALTERADO_NAO_CONCILIADO]) then
            DeleteOrEditMovimentoBancario(lsEmpresa, lsFilial, lValorOld);
        end;
      end;

      cdsEfetiva_Movimentos.Next;
    end;
  finally
    cdsMovimentos_Arquivo.CancelRange;
    cdsEfetiva_Movimentos.First;
    cdsEfetiva_Movimentos.EnableControls;
    cdsMovimentos_Arquivo.EnableControls;
    __SuperClass.GenericsF.DisplayInformation(itClose, Msg, '');
    __SuperClass.GenericsF.DisplayMessage('Rotina de Conciliação concluida.', '', 'Sucesso.', 'Informação', MB_ICONINFORMATION) ;
    cdsEfetiva_Movimentos.EmptyDataSet;
    cdsEfetiva_Movimentos.Close;
    cdsEfetiva_Movimentos.Open;
    cdsEfetiva_Movimentos.IndexName:= 'IdxStatus';
    frmSeleciona_Conciliacao_Automatica.Close;
  end;
end;

//private TfrmSeleciona_Conciliacao_Automatica.ResizeLeftPanel();
//var
//  panelCentralWidth: Integer;
//begin
//  panelCentralWidth = (int)(.95*(statusBar1.Width - panel_esq.Width)) - panel_centro_meio.Width;
//
//      panel_centro_esq.Width = panelCentralWidth/2;
//
//      panel_centro_dir.Width = panelCentralWidth/2;
//
//end;

end.

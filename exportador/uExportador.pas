unit uExportador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, nxdb, StdCtrls, Mask, nxllTransport,
  nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  nxsdServerEngine, nxreRemoteServerEngine, ExtCtrls, Grids, DBGrids,
  dxmdaset, AltSetupMemData;

type
  TForm1 = class(TForm)
    nxRemoteServerEngine1: TnxRemoteServerEngine;
    nxWinsockTransport1: TnxWinsockTransport;
    nxSession1: TnxSession;
    dbteste: TnxDatabase;
    btnAtivar: TButton;
    cbservers: TComboBox;
    OpenDialog1: TOpenDialog;
    edtArquivo: TEdit;
    btnselarquivo: TButton;
    cboAlias: TComboBox;
    Panel1: TPanel;
    btnGerar: TButton;
    cboEmpresa: TComboBox;
    edtDtFiltro: TMaskEdit;
    edtDtDesejada: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Query: TnxQuery;
    chkwdp: TCheckBox;
    nxQuery1: TnxQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    SetupMemData1: TSetupMemData;
    Querytets: TStringField;
    cboOpcao: TComboBox;
    Label7: TLabel;
    procedure btnAtivarClick(Sender: TObject);
    procedure btnselarquivoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cboEmpresaEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnGerarClick(Sender: TObject);
  private
    { Private declarations }
    procedure iniciardatabase;
    function Eom(Data: TDateTime):TDateTime;
    function StrZero(cNumero : string; cDigitos: Integer): String;

    procedure ProcessaMovimentacaoPonto;
    procedure ProcessaContaSpedContabil;
    procedure ProcessaLancamentoAutomatico;

    //function RetornaIdConta(ACdChamda, AidPlanoDeContas : string): string;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnAtivarClick(Sender: TObject);
begin
  if (btnAtivar.Caption = 'Ativar') then
    begin
      btnAtivar.Caption := 'Desativar';
      nxWinsockTransport1.Close;
      nxWinsockTransport1.ServerNameRuntime := UpperCase(cbservers.Text);
      nxWinsockTransport1.ServerNameDesigntime := UpperCase(cbservers.Text);
      nxWinsockTransport1.Active := True;
      nxRemoteServerEngine1.Active := True;
      nxSession1.Open;
      nxSession1.GetAliasNames(cboAlias.Items);
      cbservers.Enabled := False;
    end
  else
    begin
      btnAtivar.Caption := 'Ativar';
      nxWinsockTransport1.Close;
      nxWinsockTransport1.ServerNameRuntime := '';
      nxWinsockTransport1.ServerNameDesigntime := '';
      nxWinsockTransport1.Active := False;
      nxRemoteServerEngine1.Active := False;
      nxSession1.Close;
      cbservers.Enabled := True;
    end;
end;

procedure TForm1.btnselarquivoClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edtArquivo.Text := OpenDialog1.FileName;
end;

procedure TForm1.iniciardatabase;
begin
  nxWinsockTransport1.GetServerNames(cbservers.Items,100);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  iniciardatabase;

  cboOpcao.Items.Add('Movimentação Ponto');
  cboOpcao.Items.Add('SPED - Contábil');
  cboOpcao.Items.Add('Lançamento Automático');
end;

procedure TForm1.cboEmpresaEnter(Sender: TObject);
var lcQuery : TnxQuery;
begin
  cboEmpresa.Items.Clear;
  dbteste.AliasName := 'wphd';
  dbteste.Active := True;

  lcQuery := TnxQuery.Create(nil);
  try
    lcQuery.database := dbteste;
    lcQuery.Close;
    lcQuery.SQL.Clear;
    lcQuery.SQL.ADD('SELECT (cast (CdEmpresa as varchar(5)) || '' - '' ||NmEmpresa ) as NmEmpresa FROM wphd.Empresa ');
    lcQuery.SQL.ADD('order by CdEmpresa');
    lcQuery.Open;
    lcQuery.First;
    while not lcQuery.Eof do
    begin
      cboEmpresa.Items.add(lcQuery.fieldByname('NmEmpresa').AsString);
      lcQuery.Next;
    end;
  finally
    FreeAndNil(lcQuery);
  end;
end;

function TForm1.Eom(Data: TDateTime):TDateTime;
var
  Present: TDateTime;
  Ano, Mes, Dia :  Word;
begin
  Present:= Data;
  DecodeDate(Present, Ano, Mes, Dia);
  Present := Present + (32 - Dia);
  DecodeDate(Present, Ano, Mes, Dia);
  Present := EncodeDate(Ano, Mes, 01 ) -1;
  DecodeDate(Present, Ano, Mes, Dia);
  Result := Present;
end;

function TForm1.StrZero(cNumero : string; cDigitos: Integer): String;
var
  I : Integer;
  Texto : String;
begin
  Texto := cNumero;
  for I := 1 to cDigitos - Length(cNumero) do
  begin
    Texto := '0' + Texto;
  end;
  Result := Texto;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = chr(13) then
  begin
    if not (activeControl is TMemo) then
    begin
      selectnext(activeControl,true,true);
      Key := chr(0);
    end;
  end;
end;

procedure TForm1.ProcessaMovimentacaoPonto;
var lcstringList : TStringList;
    i : Byte;
    DtDesejada : TDateTime;
    lcLinha,
    lcAlias,
    lctblFuncionario : string;
begin
  lcAlias := 'wponto';
  if chkwdp.Checked then
    lcAlias := 'wdp';

  lctblFuncionario := lcAlias +'.F' + StrZero(Copy(cboEmpresa.Text,1,Pos('-',cboEmpresa.Text)-2),5);

  if (cboAlias.Text = '' ) then
    begin
      ShowMessage('Erro!!');
    end
  else
    begin
      lcstringList := TStringList.Create;
      try
        cboEmpresa.Items.Clear;
        if dbteste.Active then
          dbteste.Active := not dbteste.Active;
        dbteste.AliasName := cboAlias.Text;
        dbteste.Active := True;
        DtDesejada := StrToDate('01/'+ edtDtDesejada.text);

        Query.database := dbteste;
        Query.Close;
        Query.SQL.Clear;
        Query.SQL.ADD('SELECT');
        for i := 1 to 10 do
          Query.SQL.ADD('HrMovimentacao' + IntToStr(i)+ ',');

        Query.SQL.ADD('DtMovimentacao,NrCartaoPonto FROM wponto.Movimen M ');
        Query.SQL.ADD('left Join '+ lctblFuncionario +' F on (F.IdFuncionario = M.IdFuncionario) ');
        Query.SQL.ADD('where DtMovimentacao between :pDtIni and :pDtfim ');
        Query.ParamByName('pDtIni').AsDateTime := StrToDate('01/'+ edtDtFiltro.Text);
        Query.ParamByName('pDtfim').AsDateTime := Eom(StrToDate('01/'+ edtDtFiltro.Text));
        Query.Open;
        Query.First;
        while not Query.Eof do
        begin
          for i := 1 to 10 do
          begin
            if (Query.fieldByName('HrMovimentacao' + IntToStr(i)).AsString <> '') then
            begin
              lcLinha := StrZero(Query.fieldByName('NrCartaoPonto').AsString,4) + FormatDateTime('DD',Query.fieldByName('DtMovimentacao').AsDateTime)+
                         FormatDateTime('MM',DtDesejada)+ FormatDateTime('YYYY',DtDesejada)+
                         Query.fieldByName('HrMovimentacao' + IntToStr(i)).AsString;
              lcstringList.Add(lcLinha);
            end;
          end;
          Query.Next;
        end;
        lcstringList.SaveToFile(edtArquivo.Text);
      finally
        FreeAndNil(lcstringList);
        ShowMessage('Operação realizada com sucesso!!!');
      end;
    end;
end;

procedure TForm1.ProcessaContaSpedContabil;
//var lcQuery : TnxQuery;
var lClassInterna : string;
    lIds          : string;
    I : Integer;
begin
  dbteste.Close;
  cboEmpresa.Items.Clear;
  dbteste.AliasName := 'WCONT';
  dbteste.Active := True;

//  lcQuery := TnxQuery.Create(nil);
//  try
  nxQuery1.database := dbteste;
  nxQuery1.Close;
  nxQuery1.AliasName := 'WCONT';
  nxQuery1.SQL.Clear;
  nxQuery1.SQL.ADD('SELECT * FROM wcont.Contas');
  nxQuery1.SQL.ADD('where idPlanodeContas = 6');
  //lcQuery.SQL.ADD('order by CdEmpresa');
  nxQuery1.Open;

  SetupMemData1.Close;
  SetupMemData1.ClearFields;
  SetupMemData1.LoadFromDataset(nxQuery1);


  nxQuery1.Close;
  nxQuery1.database := dbteste;
  nxQuery1.AliasName := 'WCONT';
  nxQuery1.SQL.Clear;
  nxQuery1.SQL.ADD('delete from wcont.Contas');
  //lcQuery.SQL.ADD('order by CdEmpresa');
  nxQuery1.ExecSQL;

  nxQuery1.Close;

  lIds  := '';
  SetupMemData1.First;
  while not SetupMemData1.Eof do
    begin
      lClassInterna := StringReplace(SetupMemData1.Fields.FieldByName('cdclassInterna').AsString, '-','',[rfReplaceAll]);
      lClassInterna := StringReplace(lClassInterna, '.','',[rfReplaceAll]);

      if (pos(lClassInterna + '|', lIds) = 0) then
        begin
          lIds := lIds + lClassInterna + '|';

          nxQuery1.database := dbteste;
          nxQuery1.Close;
          nxQuery1.AliasName := 'WCONT';
          nxQuery1.SQL.Clear;
          nxQuery1.SQL.ADD('insert into wcont.Contas (');

          for i := 1 to SetupMemData1.FieldCount - 1 do
            begin
              if not SetupMemData1.Fields[i].IsNull then
                begin
                  if (i = 1) then
                    nxQuery1.SQL.ADD(SetupMemData1.Fields[i].FieldName)
                  else
                    nxQuery1.SQL.ADD(',' + SetupMemData1.Fields[i].FieldName);
                end;
            end;

          nxQuery1.SQL.ADD(') Values ( ');
          for i := 1 to SetupMemData1.FieldCount - 1 do
            begin
              if not SetupMemData1.Fields[i].IsNull then
                begin
                  if (i = 1) then
                    nxQuery1.SQL.ADD(':p' + SetupMemData1.Fields[i].FieldName)
                  else
                    nxQuery1.SQL.ADD(',:p' + SetupMemData1.Fields[i].FieldName);
                end;
            end;

          nxQuery1.SQL.ADD(')');

          for i := 1 to SetupMemData1.FieldCount - 1 do
            begin
              if not SetupMemData1.Fields[i].IsNull then
                begin
                  if (Uppercase(SetupMemData1.Fields[i].FieldName) = 'CDCHAMADA') then
                    nxQuery1.ParamByName('p' + SetupMemData1.Fields[i].FieldName).AsString := lClassInterna
                  else if not SetupMemData1.Fields[i].IsNull then
                    nxQuery1.ParamByName('p' + SetupMemData1.Fields[i].FieldName).Value := SetupMemData1.Fields[i].Value
                end;
            end;

          //nxQuery1.SQL.SaveToFile('C:\sql\edson.txt');
          nxQuery1.ExecSQL;
        end;

      SetupMemData1.Next;
    end;

  showMessage('Finalizado com sucesso!!!');
end;

procedure TForm1.ProcessaLancamentoAutomatico;
var lIdContaDev   : string;
    lIdContaCred  : string;
begin
  dbteste.Close;
  cboEmpresa.Items.Clear;
  dbteste.AliasName := 'WCONT';
  dbteste.Active := True;

//  lcQuery := TnxQuery.Create(nil);
//  try
  nxQuery1.database := dbteste;
  nxQuery1.Close;
  nxQuery1.AliasName := 'WCONT';
  nxQuery1.SQL.Clear;
  nxQuery1.SQL.ADD('DROP FUNCTION IF EXISTS ClearString;');
  nxQuery1.SQL.ADD(' CREATE FUNCTION CLEARSTRING( P1 VarChar(18) )');
  nxQuery1.SQL.ADD(' RETURNS VARCHAR(18)');
  nxQuery1.SQL.ADD(' BEGIN');
  nxQuery1.SQL.ADD('        DECLARE R1 VARCHAR(18);');
  nxQuery1.SQL.ADD('        DECLARE I INTEGER;');
  nxQuery1.SQL.ADD('        SET I = 1;');
  nxQuery1.SQL.ADD('        SET R1 = '''';');
  nxQuery1.SQL.ADD('        WHILE I <= 18 DO');
  nxQuery1.SQL.ADD('          IF (SUBSTRING(P1 FROM I FOR 1) <> ''/'') AND');
  nxQuery1.SQL.ADD('              (SUBSTRING(P1 FROM I FOR 1) <> ''-'') AND');
  nxQuery1.SQL.ADD('              (SUBSTRING(P1 FROM I FOR 1) <> '' '') AND');
  nxQuery1.SQL.ADD('              (UPPER(SUBSTRING(P1 FROM I FOR 1)) <> ''C'') AND');
  nxQuery1.SQL.ADD('              (UPPER(SUBSTRING(P1 FROM I FOR 1)) <> ''I'') AND');
  nxQuery1.SQL.ADD('              (SUBSTRING(P1 FROM I FOR 1) <> ''.'') THEN');
  nxQuery1.SQL.ADD('             SET R1 = R1 || (SUBSTRING(P1 FROM I FOR 1));');
  nxQuery1.SQL.ADD('          END IF;');
  nxQuery1.SQL.ADD('          SET I = I + 1;');
  nxQuery1.SQL.ADD('        END WHILE;');
  nxQuery1.SQL.ADD('        RETURN R1;');
  nxQuery1.SQL.ADD(' END;');
  nxQuery1.ExecSQL;



  nxQuery1.database := dbteste;
  nxQuery1.Close;
  nxQuery1.AliasName := 'WCONT';
  nxQuery1.SQL.Clear;
  nxQuery1.SQL.ADD('select');
  nxQuery1.SQL.ADD('Coalesce(Contas1.IdConta, teste.idContaDevedora)  as IdConta1');
  nxQuery1.SQL.ADD(',coalesce(Contas2.IdConta, teste.IdContaCredora)  as IdConta2');
  nxQuery1.SQL.ADD(',teste.*');
  nxQuery1.SQL.ADD('from (');
  nxQuery1.SQL.ADD('SELECT clearString(C1.cdclassInterna) as cdclassInternaDev');
  nxQuery1.SQL.ADD(' ,C1.IdPlanodeContas as IdPlanodeContasDev');
  nxQuery1.SQL.ADD(' ,clearString(C2.cdclassInterna) as cdclassInternaCred');
  nxQuery1.SQL.ADD(',C2.IdPlanodeContas as IdPlanodeContasCred');
  nxQuery1.SQL.ADD(' ,LC.*');
  nxQuery1.SQL.ADD('FROM wcont.LContas AS LC');
  nxQuery1.SQL.ADD('left join wcont.ContasRestaurada As C1 on (C1.IdConta = LC.IdContaDevedora and C1.IdPlanodeContas = LC.IdPlanodeContas)');
  nxQuery1.SQL.ADD('left join wcont.ContasRestaurada As C2 on (C2.IdConta = LC.IdContaCredora and C2.IdPlanodeContas = LC.IdPlanodeContas)');
  nxQuery1.SQL.ADD(') As teste');
  nxQuery1.SQL.ADD('left join  wcont.contas as Contas1 on (Contas1.CdChamada = teste.cdclassInternaDev');
  nxQuery1.SQL.ADD('                                                                 and Contas1.IdPlanodeContas = teste.IdPlanodeContasDev)');
  nxQuery1.SQL.ADD('left join  wcont.contas as Contas2 on (Contas2.CdChamada = teste.cdclassInternaCred');
  nxQuery1.SQL.ADD('                                                                 and Contas2.IdPlanodeContas = teste.IdPlanodeContasCred)');
  nxQuery1.Open;

  SetupMemData1.Close;
  SetupMemData1.ClearFields;
  SetupMemData1.LoadFromDataset(nxQuery1);

  //DataSource1.DataSet := nxQuery1;

//  nxQuery1.Close;
//  nxQuery1.database := dbteste;
//  nxQuery1.AliasName := 'WCONT';
//  nxQuery1.SQL.Clear;
//  nxQuery1.SQL.ADD('delete from wcont.Contas');
//  //lcQuery.SQL.ADD('order by CdEmpresa');
//  nxQuery1.ExecSQL;
//
//  nxQuery1.Close;
//

  SetupMemData1.First;
  while not SetupMemData1.Eof do
    begin
      lIdContaDev   := SetupMemData1.Fields.FieldByName('IdConta1').AsString;

      lIdContaCred  := SetupMemData1.Fields.FieldByName('IdConta2').AsString;

      nxQuery1.Close;
      nxQuery1.database := dbteste;
      nxQuery1.AliasName := 'WCONT';
      nxQuery1.SQL.Clear;
      nxQuery1.SQL.ADD('update wcont.LContas set');
      nxQuery1.SQL.ADD('IdContaDevedora = '+ lIdContaDev);
      nxQuery1.SQL.ADD(',IdContaCredora = '+ lIdContaCred);
      nxQuery1.SQL.ADD('where IdRegistro = '+ QuotedStr(SetupMemData1.Fields.FieldByName('IdRegistro').AsString));
      //nxQuery1.SQL.SaveToFile('C:\sql\exportador\LContas.txt');
      nxQuery1.ExecSQL;

      SetupMemData1.Next;
    end;
//
  showMessage('Finalizado com sucesso!!!');
end;

procedure TForm1.btnGerarClick(Sender: TObject);
begin
  case cboOpcao.ItemIndex of
    0: ProcessaMovimentacaoPonto;
    1: ProcessaContaSpedContabil;
    2: ProcessaLancamentoAutomatico;
  end;
end;

//function TForm1.RetornaIdConta(ACdChamda, AidPlanoDeContas : string): string;
//var lQuery : TnxQuery;
//begin
//  result := '';
//  dbteste.Close;
//  dbteste.AliasName := 'WCONT';
//  dbteste.Active := True;
//
//  lQuery := TnxQuery.Create(nil);
//  try
//    lQuery.database := dbteste;
//    lQuery.Close;
//    lQuery.SQL.Clear;
//    lQuery.SQL.ADD('SELECT IdConta FROM WCONT.Contas');
//    lQuery.SQL.ADD('where CdChamada = ' + QuotedStr(ACdChamda));
//    lQuery.SQL.ADD('and  IdPlanoDeContas = ' + AidPlanoDeContas);
//    nxQuery1.SQL.SaveToFile('C:\sql\exportador\Contas.txt');
//    lQuery.Open;
//
//    if not lQuery.IsEmpty then
//      result := lQuery.Fields.FieldByName('IdConta').AsString;
//  finally
//    FreeAndNil(lQuery);
//  end;
//end;

end.

unit teste;

interface

uses Forms, Windows, Messages, SysUtils, Classes, Graphics, Controls, Dialogs, ExtCtrls,
     ComCtrls, DBTables, Registry, Db, FileCtrl, DBClient, xmldom, XMLDoc,
     XMLIntf, XSBuiltIns, MidasLib, Alterdata, Variants, Types, AltFStatus, SOAPHTTPClient,
     NewService,AltLog, StdCtrls,Service, RetornarXMLSchemaMovimento, RetornarXMLSchemaCadastro,
  Grids, DBGrids;
type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Button2: TButton;
    Button1: TButton;
    Button3: TButton;
    DBGrid1: TDBGrid;
    dtsmovimento: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    procedure executawebservice_newService;
    procedure executawebservice_Service;
    procedure RecebeMovimento_service;
    function XsDt2Dt(Xs: WideString): TDateTime; overload;
    function XsDt2Dt(Xs: TXsDateTime): TDateTime; overload;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Math, DateUtils, ConvUtils, InvokeRegistry;

{$R *.dfm}

procedure TForm1.executawebservice_newService;
var FNewService : NewServiceSoap;
    lcListaFuncionario : ArrayOfFuncionario;
    lcListaFuncionarionew : ArrayOfFuncionario;
    lcFuncionario    : Funcionario;
    i,cont : Integer;
    TerminalId : string;
    data : TXSDateTime;
begin
  FNewService := GetNewServiceSoap(True);
  TerminalId  := '70a450ea-7a8f-4c52-8644-399fff6c5370';
  data := TXSDateTime.Create;

  data.AsDateTime :=  StrToDate('30/06/2011');

  lcListaFuncionario := FNewService.ReceberFuncionarioIDs_ForDate(TerminalId,data);

  lcListaFuncionarionew := FNewService.ReceberFuncionarioIDs(TerminalId);

  (*cont:= 0;
  for i := 0 to Length(lcListaFuncionario) - 1 do
  begin
    {lcFuncionarionew := FNewService.ReceberFuncionarios(lcListaFuncionario[i]);
    ShowMessage(lcFuncionario.ID);}
    //ShowMessage(lcListaFuncionario[i].ID);
    inc(cont);
  end;
  ShowMessage(IntToStr(cont));*)

  for i := 0 to Length(lcListaFuncionarionew) - 1 do
  begin
    {lcFuncionarionew := FNewService.ReceberFuncionarios(lcListaFuncionario[i]);
    ShowMessage(lcFuncionario.ID);}
    ShowMessage(lcListaFuncionarionew[i].ID);
    //inc(cont);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  executawebservice_newService;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  executawebservice_Service;
end;

procedure TForm1.executawebservice_Service;
var FService : WebSPontoSoap;
    tblmov   : IXMLDsMovimentoType;
    confterminal : IXMLTerminalType;
    lMovimento : TClientDataSet;
    GuidAux   : TGUID;
    data : TXSDateTime;
    I : integer;
begin
  FService := GetWebSPontoSoap(True);


  lMovimento := TClientDataSet.Create(nil);

  try
    I := 0;
    lMovimento.LoadFromFile('C:\temp\exe\Movimento.xml');

    tblmov := NewDsMovimento;
    lMovimento.First;
    while not lMovimento.Eof do
    begin
      //data := TXSDateTime.Create;
      //data.AsDateTime := lMovimento.FieldByName('DtHrMovimentacao').AsDateTime;

      tblmov.Add;
      CreateGUID( GuidAux );
      tblmov.Movimento[I].ID                := GUIDToString( GuidAux );
      tblmov.Movimento[I].GestorID          := lMovimento.FieldByName('GestorID').AsString;
      tblmov.Movimento[I].FuncionarioID     := lMovimento.FieldByName('FuncionarioID').AsString;
      tblmov.Movimento[I].DtHrMovimentacao  := DateTimeToXMLTime( lMovimento.FieldByName('DtHrMovimentacao').AsDateTime, False );
      inc(I);
      //FreeAndnil(data);

      lMovimento.Next;
    end;
  finally
    FreeAndNil(lMovimento);
  end;

  //FService.Configuracacoes_WebSPonto()
  if (FService.ConectarWebSPonto_Terminal('e4e2ef21-7c20-4d6e-badf-8a9a5b7d70ae','1F5620D79E1E81C33F734B169CD607AF') = 0)then
    begin
      //tblmov.LoadFromFile('C:\temp\exe\Movimento.xml');
      if (tblmov.Count > 0) then
        Fservice.EnviaMovimento(tblmov.XML);
    end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  RecebeMovimento_service
end;

procedure TForm1.RecebeMovimento_service;
var FService : WebSPontoSoap;
    tblmov   : IXMLDsMovimentoType;
    confterminal : IXMLTerminalType;
    lMovimento : TClientDataSet;
    GuidAux   : TGUID;
    data : TXSDateTime;
    I : integer;

    Resultado : WideString;
    xmlDoc    : IXMLDocument;
    DataIni,
    DataFim   : TXSDateTime;

    DabaseMov : IXMLDsMovimentoType;
begin


  FService := GetWebSPontoSoap(True);

  DataIni := TXSDateTime.Create;
  DataFim := TXSDateTime.Create;
  xmlDoc    := TXMLDocument.Create( Application );

  lMovimento    := TClientDataSet.Create(Application);
  lMovimento.FieldDefs.Clear;
  lMovimento.FieldDefs.Add('ID', ftAutoInc, 0, false );
  lMovimento.FieldDefs.Add('ICartaoID', ftString, 50, false );
  lMovimento.FieldDefs.Add('FuncionarioID', ftString, 50, false );
  lMovimento.FieldDefs.Add('GestorID', ftString, 50, false );
  lMovimento.FieldDefs.Add('IdEmpresaExterno', ftInteger, 0, false );
  lMovimento.FieldDefs.Add('IdFuncionarioExterno', ftString, 20, false );
  lMovimento.FieldDefs.Add('DtHrMovimentacao', ftDateTime, 0, false );
  lMovimento.FieldDefs.Add('TpPessoa', ftString, 1, false );

  lMovimento.IndexDefs.Clear;
  lMovimento.IndexDefs.Add('idxMov', 'IdEmpresaExterno;IdFuncionarioExterno;TpPessoa;DtHrMovimentacao', [ ixCaseInsensitive ] );
  lMovimento.IndexName := 'idxMov';
  lMovimento.CreateDataSet;

  try
    DataIni.AsDateTime := StrToDateTime('27/01/2012 00:00');
    DataFim.AsDateTime := StrToDateTime('27/01/2012 23:59');

    //FService.Configuracacoes_WebSPonto()
    if (FService.ConectarWebSPonto_Terminal('e4e2ef21-7c20-4d6e-badf-8a9a5b7d70ae','1F5620D79E1E81C33F734B169CD607AF') = 0)then
      begin
        Resultado := FService.BaixarMovimento(DataIni,DataFim,'S');
        xmlDoc.LoadFromXml(Resultado);

        DabaseMov := GetDsMovimento(xmlDoc);

        lMovimento.EmptyDataSet;

        for I := 0 to DabaseMov.Count -1 do
          begin
            lMovimento.Append;
            lMovimento.fields.fieldByName('ICartaoID').asString            := DabaseMov.Movimento[i].ID;
            lMovimento.fields.FieldByName('GestorID').AsString             := DabaseMov.Movimento[i].GestorID;
            lMovimento.fields.FieldByName('IdEmpresaExterno').AsInteger    := DabaseMov.Movimento[i].IdEmpresaExterno;
            lMovimento.fields.FieldByName('IdFuncionarioExterno').AsString := DabaseMov.Movimento[i].IdFuncionarioExterno;
            lMovimento.fields.FieldByName('FuncionarioID').AsString        := DabaseMov.Movimento[i].FuncionarioID;
            lMovimento.fields.FieldByName('DtHrMovimentacao').AsDateTime   := XsDt2Dt(DabaseMov.Movimento[i].DtHrMovimentacao);
            lMovimento.fields.FieldByName('TpPessoa').AsString             := DabaseMov.Movimento[i].TpPessoa;
            lMovimento.Post;
          end;

        DabaseMov.Clear;
        if lMovimento.Active and (lMovimento.RecordCount > 0)then
          dtsmovimento.DataSet := lMovimento;
      end;
  finally
    FreeAndNil(DataIni);
    FreeAndNil(DataFim);
    //FreeAndNil(lMovimento);
  end;
end;

function TForm1.XsDt2Dt(Xs: WideString): TDateTime;
var
  _xsDT: TXSDateTime;
begin
  _xsDT := TXSDateTime.Create;
  _xsDT.XSToNative(Xs);
  Result := XsDt2Dt(_xsDT);
end;

function TForm1.XsDt2Dt(Xs: TXsDateTime): TDateTime;
begin
  Result := EncodeDateTime(Xs.Year, Xs.Month, xs.Day, xs.Hour, xs.Minute, xs.Second, xs.Millisecond );
end;

end.

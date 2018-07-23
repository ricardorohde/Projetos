(*******************************************************************************
--------------------------------------------------------------------------------
Classe para consumir Webervices para Consulta de CEP ("BuscarCep.com.br") - V2
--------------------------------------------------------------------------------

Desenvolvido por: João Henrique de Souza
E-Mail: juaumkiko@msn.com
Testado com: Delphi XE3
Agradecimentos: Henrique Leonardo  - hleonardopa@yahoo.com.br

-------------
Configuração:
-------------
Altere o valor da constante FChave no OnCreate da Classe TBuscarCEP para o valor
da sua CHAVE recebida ao efetuar o seu cadastro no site www.buscarcep.com.br
ou especifique a chave ao criar a Classe;

------------------------------
Exemplo de Uso no seu sistema:
------------------------------
uses uBuscarCEP;
...
procedure TForm1.Button1Click(Sender: TObject);
var
  loBuscarCep: TBuscarCEP;
begin
  loBuscarCep:= TBuscarCEP.Create('NumeroDaChave');
    //se não quiser especificar sempre o NumeroDaChave, basta especificar o mesmo
    //na declaração do constructor da Classe TBuscarChave
    //Ou use apenas "loBuscarCep:= TBuscarCEP.Create;"
    //que será utilizado por padrao a chave de testes (1 consulta por minuto)
  try
    //if loBuscarCEP.BuscaCEP('07042-000') then {Consulta por CEP}
    if loBuscarCEP.BuscaLogradouro('Brasile','Guarulhos') then {Consulta por Logradouro}
      ShowMessage(loBuscarCEP.CEP+#13+loBuscarCEP.Logradouro);
  finally
    loBuscarCep.Free;
  end;
end;
...


23/09/2013
-Mudança de componente XMLDocument para idHTTP
-Inclusão de Configurações de Proxy

31/07/2012
-Melhora no Código
-Opção de dar duplo clique no form de resultados quando consultar por logradouro
-Opção de especificar a Chave no Create da Classe.

23/11/2015 - Jonathan First
- Adicinado correção a possíveis erros "HTTP/1.1 403 Forbiddden"
- URL do WebService agora com URL Encoding
- Conversão do retorno do WebService, case venha com caracteres especiais
*******************************************************************************)

unit uBuscarCEP;

interface

uses Forms, Classes, SysUtils, Grids, DB, DBGrids, DBClient, StdCtrls, ExtCtrls,
     Controls, Buttons, Graphics, IdURI,
     IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TBuscarCEP = class(TObject)
  private
    FQuantidade: integer;
    FIBGE_UF: integer;
    FLogradouro: string;
    FBairro: string;
    FIBGE_Municipio_Verificador: integer;
    FIBGE_Municipio: integer;
    FUF: string;
    FCEP: string;
    FLimite_Buscas: integer;
    FResultado_TXT: string;
    FResultado: integer;
    FCidade: string;
    FData: string;
    FTipo_Logradouro: string;
    FXMLResposta: String;
    FXMLRespostaDataPacket: String;

    FChave: string;
    FProxyServer: string;
    FProxyPort: integer;
    FProxyUser: string;
    FProxyPass: string;

    function RetornaValorTag(XML, Tag: string): string;
    function doPesquisa(URL: string; const MostraForm: boolean = true): boolean;
    function MontaDataPacket: string;
    function SelecionaLogradouro: Boolean;
  public
    constructor Create(const ChaveBuscarCEP: string = 'Chave_Gratuita_BuscarCep';
                       const ProxyServer: string = '';
                       const ProxyPort: integer = 0;
                       const ProxyUser: string = '';
                       const ProxyPass: string = '');

    function BuscaCEP(CEP: string): Boolean;
    function BuscaLogradouro(Logradouro, Cidade: string;
                            const TipoLogradouro: string = '';
                            const UF: string = '';
                            const Bairro: string = '';
                            const MostraForm: boolean = true): Boolean;

    property Chave: string read FChave;
    property Quantidade: integer read FQuantidade;
    property XMLResposta: String read FXMLResposta;
    property XMLRespostaDataPacket: String read FXMLRespostaDataPacket;
    property CEP: string read FCEP;
    property UF: string read FUF;
    property Cidade: string read FCidade;
    property Bairro: string read FBairro;
    property Tipo_Logradouro: string read FTipo_Logradouro;
    property Logradouro: string read FLogradouro;
    property Data: string read FData;
    property Resultado: integer read FResultado;
    property Resultado_TXT: string read FResultado_TXT;
    property Limite_Buscas: integer read FLimite_Buscas;
    property IBGE_UF: integer read FIBGE_UF;
    property IBGE_Municipio: integer read FIBGE_Municipio;
    property IBGE_Municipio_Verificador: integer read FIBGE_Municipio_Verificador;
  end;

  TFormPesquisa = class(TCustomForm)
  private
    FBuscarCEP: TBuscarCEP;
    loCDS: TClientDataSet;
    loGrid: TDBGrid;
    loPanel: TPanel;
    loButton1: TBitBtn;
    loButton2: TBitBtn;
    loDataSource: TDataSource;
    loLabel: TLabel;
    procedure FormCreateNew(Sender: TObject);
    procedure loButton1Click(Sender: TObject);
    procedure loGridTitleClick(Column: TColumn);
  public
    constructor CreateNew(Owner: TComponent; BuscarCEP: TBuscarCEP); reintroduce;
  end;

implementation

{ TBuscarCEP }

function TBuscarCEP.BuscaCEP(CEP: string): Boolean;
const
  //cURL: string = 'http://www.buscarcep.com.br/?cep=<CEP>&formato=xml&chave=<CHAVE>';
  cURL = 'https://viacep.com.br/ws/<CEP>/xml/';
var
  lURL: string;
begin
  lURL := cURL;
//  lURL := StringReplace(lURL,'<CHAVE>',FCHAVE,[rfReplaceAll, rfIgnoreCase]);
  lURL := StringReplace(lURL,'<CEP>',CEP,[rfReplaceAll, rfIgnoreCase]);
  Result := doPesquisa(lURL);
end;

function TBuscarCEP.BuscaLogradouro(Logradouro, Cidade: string;
  const TipoLogradouro, UF, Bairro: string; const MostraForm: boolean): Boolean;
const
  cURL: string = 'http://www.buscarcep.com.br/?<TIPO_LOGRADOURO><LOGRADOURO><UF><CIDADE><BAIRRO>formato=xml&chave=<CHAVE>';
var
  lURL: string;
begin
  if (Trim(Logradouro)='') or (Trim(Cidade)='') then
    raise Exception.Create('ERRO !!'+#13#13+'Especifique pelo menos um Logradouro e Cidade.');

  lURL := cURL;
  lURL := StringReplace(lURL,'<CHAVE>',FCHAVE,[rfReplaceAll, rfIgnoreCase]);
  lURL := StringReplace(lURL,'<LOGRADOURO>','logradouro='+Trim(Logradouro)+'&',[rfReplaceAll, rfIgnoreCase]);
  lURL := StringReplace(lURL,'<CIDADE>','cidade='+Trim(Cidade)+'&',[rfReplaceAll, rfIgnoreCase]);

  if Trim(TipoLogradouro) <> '' then
    lURL := StringReplace(lURL,'<TIPO_LOGRADOURO>','tipo_logradouro='+Trim(TipoLogradouro)+'&',[rfReplaceAll, rfIgnoreCase])
  else
    lURL := StringReplace(lURL,'<TIPO_LOGRADOURO>','',[rfReplaceAll, rfIgnoreCase]);

  if Trim(UF) <> '' then
    lURL := StringReplace(lURL,'<UF>','uf='+Trim(UF)+'&',[rfReplaceAll, rfIgnoreCase])
  else
    lURL := StringReplace(lURL,'<UF>','',[rfReplaceAll, rfIgnoreCase]);

  if Trim(Bairro) <> '' then
    lURL := StringReplace(lURL,'<BAIRRO>','bairro='+Trim(Bairro)+'&',[rfReplaceAll, rfIgnoreCase])
  else
    lURL := StringReplace(lURL,'<BAIRRO>','',[rfReplaceAll, rfIgnoreCase]);

  Result := doPesquisa(lURL,MostraForm);
end;

constructor TBuscarCEP.Create(const ChaveBuscarCEP, ProxyServer: string;
  const ProxyPort: integer; const ProxyUser, ProxyPass: string);
begin
  inherited Create;
  FChave := ChaveBuscarCEP;  //insira aqui a sua chave
  FProxyServer:= ProxyServer;
  FProxyPort:= ProxyPort;
  FProxyUser:= ProxyUser;
  FProxyPass:= ProxyPass;
end;

function TBuscarCEP.doPesquisa(URL: string; const MostraForm: boolean): boolean;
var
  xHTTP: TidHTTP;
  xXML : TStringStream;
  URLCorreta: String;
begin
  Result := False;
  xHTTP:= TidHTTP.Create(nil);
  xXML:= TStringStream.Create('');
  try
    try
      {Configuração de Proxy se Houver}
      if FProxyServer <> '' then
        xHTTP.ProxyParams.ProxyServer := FProxyServer;
      if FProxyPort <> 0 then
        xHTTP.ProxyParams.ProxyPort := FProxyPort;
      if FProxyUser <> '' then
      begin
        xHTTP.ProxyParams.BasicAuthentication := True;
        xHTTP.ProxyParams.ProxyUsername := FProxyUser;
      end;
      if FProxyPass <> '' then
        xHTTP.ProxyParams.ProxyPassword := FProxyPass;

      {Consulta CEP}
      URLCorreta:= TIdURI.URLEncode(URL);
      xHTTP.Request.UserAgent := 'Mozilla/3.0 (compatible; IndyLibrary)';
      xHTTP.HandleRedirects := True;
      //xHTTP.Get(URLCorreta,xXML);
      xHTTP.Post(URLCorreta,xXML);
      xXML.Position := 0;

      FXMLResposta := UTF8Decode(xXML.DataString);

      {Leitura do Resultado}
      FQuantidade    := StrToIntDef(RetornaValorTag(FXMLResposta,'quantidade'),0);
      FResultado     := StrToIntDef(RetornaValorTag(FXMLResposta,'resultado'),0);
      FResultado_TXT := RetornaValorTag(FXMLResposta,'resultado_txt');
      FLimite_Buscas := StrToIntDef(RetornaValorTag(FXMLResposta,'limite_buscas'),0);
      FXMLRespostaDataPacket := MontaDataPacket;

      if FResultado = 0 then
        raise Exception.Create('Erro na comunicação com o site www.buscarcep.com.br')
      else if FResultado <> 1 then
        raise Exception.Create('ERRO ('+IntToStr(FResultado)+') !! '+#13#13+UpperCase(FResultado_TXT));

      if FQuantidade = 1 then
      begin
        FCEP                        := RetornaValorTag(FXMLResposta,'cep');
        FUF                         := RetornaValorTag(FXMLResposta,'uf');
        FCidade                     := RetornaValorTag(FXMLResposta,'cidade');
        FBairro                     := RetornaValorTag(FXMLResposta,'bairro');
        FLogradouro                 := RetornaValorTag(FXMLResposta,'logradouro');
        FTipo_Logradouro            := RetornaValorTag(FXMLResposta,'tipo_logradouro');
        FData                       := RetornaValorTag(FXMLResposta,'data');
        FIBGE_UF                    := StrToIntDef(RetornaValorTag(FXMLResposta,'ibge_uf'),0);
        FIBGE_Municipio             := StrToIntDef(RetornaValorTag(FXMLResposta,'ibge_municipio'),0);
        FIBGE_Municipio_Verificador := StrToIntDef(RetornaValorTag(FXMLResposta,'ibge_municipio_verificador'),0);
        Result := True;
      end
      else
        Result := SelecionaLogradouro;
    except
      on E: Exception do
      begin
        Result := False;
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(xXML);
    FreeAndNil(xHTTP);
  end;
end;

function TBuscarCEP.RetornaValorTag(XML, Tag: string): string;
var
  PosIni, PosFin: integer;
  TagIni, TagFin: string;
begin
  Result := '';

  TagIni := '<'+UpperCase(Trim(TAG))+'>';
  TagFin := '</'+UpperCase(Trim(TAG))+'>';

  PosIni := pos(TagIni,UpperCase(XML));
  if PosIni <> 0 then
  begin
    PosIni := PosIni+Length(TagIni);
    PosFin := pos(TagFin,UpperCase(XML));
    if PosFin <> 0 then
      Result := Copy(XML,PosIni,PosFin-PosIni);
  end;
end;

function TBuscarCEP.MontaDataPacket: string;
  function CabecalhoDataPacket: string;
  begin
    Result :=
      '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'+
      '<DATAPACKET Version="2.0">'+
      '<METADATA>'+
      '<FIELDS>'+
      '<FIELD fieldtype="string" attrname="RESULTADO" WIDTH="10"/>'+
      '<FIELD fieldtype="string" attrname="RESULTADO_TXT" WIDTH="100"/>'+
      '<FIELD fieldtype="string" attrname="LIMITE_BUSCAS" WIDTH="10"/>'+
      '<FIELD fieldtype="string" attrname="CEP" WIDTH="8"/>'+
      '<FIELD fieldtype="string" attrname="UF" WIDTH="2"/>'+
      '<FIELD fieldtype="string" attrname="TIPO_LOGRADOURO" WIDTH="20"/>'+
      '<FIELD fieldtype="string" attrname="LOGRADOURO" WIDTH="200"/>'+
      '<FIELD fieldtype="string" attrname="CIDADE" WIDTH="80"/>'+
      '<FIELD fieldtype="string" attrname="BAIRRO" WIDTH="80"/>'+
      '<FIELD fieldtype="string" attrname="DATA" WIDTH="25"/>'+
      '<FIELD fieldtype="string" attrname="IBGE_UF" WIDTH="2"/>'+
      '<FIELD fieldtype="string" attrname="IBGE_MUNICIPIO" WIDTH="5"/>'+
      '<FIELD fieldtype="string" attrname="IBGE_MUNICIPIO_VERIFICADOR" WIDTH="7"/>'+
      '</FIELDS>'+
      '<PARAMS/>'+
      '</METADATA>'+
      '<ROWDATA>';
  end;
  function RodapeDataPacket: string;
  begin
    Result :=
      '</ROWDATA>'+
      '</DATAPACKET>';
  end;
var
  lCont: integer;
  lXML, lXML_Temp: String;
begin
  lXML := FXMLResposta;
  Result := CabecalhoDataPacket;
  for lCont := 1 to FQuantidade do
  begin
    lXML_Temp := RetornaValorTag(lXML,'retorno');
    lXML := StringReplace(lXML,'<retorno>'+lXML_Temp+'</retorno>','',[rfIgnoreCase]);

    Result := Result +
      '<ROW RESULTADO =" '                  + RetornaValorTag(lXML_Temp,'resultado')+
         '" RESULTADO_TXT="'                + RetornaValorTag(lXML_Temp,'resultado_txt')+
         '" LIMITE_BUSCAS="'                + RetornaValorTag(lXML_Temp,'limite_buscas')+
         '" CEP="'                          + RetornaValorTag(lXML_Temp,'cep')+
         '" UF="'                           + RetornaValorTag(lXML_Temp,'uf')+
         '" TIPO_LOGRADOURO="'              + RetornaValorTag(lXML_Temp,'tipo_logradouro')+
         '" LOGRADOURO="'                   + RetornaValorTag(lXML_Temp,'logradouro')+
         '" CIDADE="'                       + RetornaValorTag(lXML_Temp,'cidade')+
         '" BAIRRO="'                       + RetornaValorTag(lXML_Temp,'bairro')+
         '" DATA= "'                        + RetornaValorTag(lXML_Temp,'data')+
         '" IBGE_UF= "'                     + RetornaValorTag(lXML_Temp,'ibge_uf')+
         '" IBGE_MUNICIPIO= "'              + RetornaValorTag(lXML_Temp,'ibge_municipio')+
         '" IBGE_MUNICIPIO_VERIFICADOR= "'  + RetornaValorTag(lXML_Temp,'ibge_municipio_verificador')+
         '" RowState="4"/>';
  end;
  Result := Result + RodapeDataPacket;
end;

function TBuscarCEP.SelecionaLogradouro: Boolean;
var
  loFormPesquisa: TFormPesquisa;
begin
  loFormPesquisa:= TFormPesquisa.CreateNew(nil,Self);
  try
    Result := (loFormPesquisa.ShowModal = mrOk);
  finally
    loFormPesquisa.Free;
  end;
end;

{ TFormPesquisa }

constructor TFormPesquisa.CreateNew(Owner: TComponent; BuscarCEP: TBuscarCEP);
begin
  Self.OnCreate := FormCreateNew;
  inherited CreateNew(Owner);
  FBuscarCEP := BuscarCEP;
end;

procedure TFormPesquisa.FormCreateNew(Sender: TObject);
begin
  Self.Height := 300;
  Self.Width := 780;
  Self.Position := poScreenCenter;
  Self.BorderStyle := bsDialog;
  Self.Caption := 'Selecione um Logradouro';

  loCDS:= TClientDataSet.Create(Self);
  loCDS.XMLData := FBuscarCEP.FXMLRespostaDataPacket;
  loCDS.FieldByName('RESULTADO').Visible := False;
  loCDS.FieldByName('RESULTADO_TXT').Visible := False;
  loCDS.FieldByName('LIMITE_BUSCAS').Visible := False;
  loCDS.FieldByName('DATA').Visible := False;
  loCDS.FieldByName('IBGE_UF').Visible := False;
  loCDS.FieldByName('IBGE_MUNICIPIO').Visible := False;
  loCDS.FieldByName('TIPO_LOGRADOURO').DisplayLabel := 'Tipo Logradouro';
  loCDS.FieldByName('TIPO_LOGRADOURO').DisplayWidth := 12;
  loCDS.FieldByName('LOGRADOURO').DisplayLabel := 'Logradouro';
  loCDS.FieldByName('LOGRADOURO').DisplayWidth := 45;
  loCDS.FieldByName('CIDADE').DisplayLabel := 'Cidade';
  loCDS.FieldByName('CIDADE').DisplayWidth := 20;
  loCDS.FieldByName('BAIRRO').DisplayLabel := 'Bairro';
  loCDS.FieldByName('BAIRRO').DisplayWidth := 20;
  loCDS.FieldByName('IBGE_MUNICIPIO_VERIFICADOR').DisplayLabel := 'Cód. IBGE';

  loDataSource:= TDataSource.Create(Self);
  loDataSource.DataSet := loCDS;

  loGrid:= TDBGrid.Create(Self);
  loGrid.ReadOnly := True;
  loGrid.Options := loGrid.Options + [dgRowSelect];
  loGrid.Parent := Self;
  loGrid.Align := alClient;
  loGrid.DataSource := loDataSource;
  loGrid.OnTitleClick := loGridTitleClick;
  loGrid.OnDblClick := loButton1Click;

  loLabel := TLabel.Create(Self);
  loLabel.Parent := Self;
  loLabel.Caption := 'Máximo de resultados que podem ser exibidos por minuto: '+IntToStr(FBuscarCEP.FLIMITE_BUSCAS)+#13+
                     'Mais informações em www.buscarcep.com.br';
  loLabel.Font.Style := [fsItalic];
  loLabel.Align := alBottom;
  loLabel.Alignment := taCenter;

  loPanel := TPanel.Create(Self);
  loPanel.Parent := Self;
  loPanel.Align := alBottom;

  loButton1 := TBitBtn.Create(loPanel);
  loButton1.Parent := loPanel;
  loButton1.Width := 200;
  loButton1.Align := alClient;
  loButton1.Kind := bkOK;
  loButton1.Caption := 'Seleciona Logradouro';
  loButton1.OnClick := loButton1Click;

  loButton2 := TBitBtn.Create(loPanel);
  loButton2.Parent := loPanel;
  loButton2.Width := 150;
  loButton2.Align := alRight;
  loButton2.Kind := bkCANCEL;
  loButton2.Caption := 'Cancelar';
end;

procedure TFormPesquisa.loButton1Click(Sender: TObject);
begin
  FBuscarCEP.FLimite_Buscas              := loCDS.FieldByName('limite_buscas').AsInteger;
  FBuscarCEP.FCEP                        := loCDS.FieldByName('cep').AsString;
  FBuscarCEP.FUF                         := loCDS.FieldByName('uf').AsString;
  FBuscarCEP.FCidade                     := loCDS.FieldByName('cidade').AsString;
  FBuscarCEP.FBairro                     := loCDS.FieldByName('bairro').AsString;
  FBuscarCEP.FLogradouro                 := loCDS.FieldByName('logradouro').AsString;
  FBuscarCEP.FTipo_Logradouro            := loCDS.FieldByName('tipo_logradouro').AsString;
  FBuscarCEP.FData                       := loCDS.FieldByName('data').AsString;
  FBuscarCEP.FIBGE_UF                    := loCDS.FieldByName('ibge_uf').AsInteger;
  FBuscarCEP.FIBGE_Municipio             := loCDS.FieldByName('ibge_municipio').AsInteger;
  FBuscarCEP.FIBGE_Municipio_Verificador := loCDS.FieldByName('ibge_municipio_verificador').AsInteger;
  ModalResult := mrOk;
end;

procedure TFormPesquisa.loGridTitleClick(Column: TColumn);
const
  idxDefault = 'DEFAULT_ORDER';
var
  strColumn : string;
  i         : integer;
  bolUsed   : boolean;
  idOptions : TIndexOptions;
begin
  strColumn := idxDefault;

  if Column.Field.FieldKind in [fkCalculated, fkLookup, fkAggregate] then
    Exit;

  if Column.Field.DataType in [ftBlob, ftMemo] then
    Exit;

  for i := 0 to loGrid.Columns.Count - 1 do
  begin
    loGrid.Columns[i].Title.Font.Color := clBlack;
  end;

  loGrid.Columns[Column.Index].Title.Font.Color := clRed;

  bolUsed := (Column.Field.FieldName = loCDS.IndexName);

  loCDS.IndexDefs.Update;
  for i := 0 to loCDS.IndexDefs.Count - 1 do
  begin
    if loCDS.IndexDefs.Items[i].Name = Column.Field.FieldName then
    begin
      strColumn := Column.Field.FieldName;
      case (loCDS.IndexDefs.Items[i].Options = [ixDescending]) of
        True  : idOptions := [];
        False : idOptions := [ixDescending];
      end;
    end;
  end;

  if (strColumn = idxDefault) or (bolUsed) then
  begin
    if bolUsed then
      loCDS.DeleteIndex(Column.Field.FieldName);
    try
      loCDS.AddIndex(Column.Field.FieldName,
                   Column.Field.FieldName,
                   idOptions,
                   '',
                   '',
                   0);
      strColumn := Column.Field.FieldName;
    except
      if bolUsed then
        strColumn := idxDefault;
    end;
  end;

  try
    loCDS.IndexName := strColumn;
  except
    loCDS.IndexName := idxDefault;
  end;
end;

end.

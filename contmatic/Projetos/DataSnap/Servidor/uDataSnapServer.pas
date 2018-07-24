unit uDataSnapServer;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, Servidor_TLB, StdVcl, DB, ADODB, Provider, Dialogs;

type
  TDataSnapServer = class(TRemoteDataModule, IDataSnapServer)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSetProvider1: TDataSetProvider;
    ADOQuery1funcid: TIntegerField;
    ADOQuery1numregistro: TIntegerField;
    ADOQuery1numchapa: TIntegerField;
    ADOQuery1nome: TWideStringField;
    ADOQuery1endereco: TWideStringField;
    ADOQuery1numero: TIntegerField;
    ADOQuery1compl: TWideStringField;
    ADOQuery1bairro: TWideStringField;
    ADOQuery1cidade: TWideStringField;
    ADOQuery1uf: TWideStringField;
    ADOQuery1cep: TWideStringField;
    ADOQuery1fone: TWideStringField;
    ADOQuery1datanasc: TDateField;
    ADOQuery1nomepai: TWideStringField;
    ADOQuery1nomemae: TWideStringField;
    ADOQuery1estcivil: TIntegerField;
    ADOQuery1sexo: TIntegerField;
    ADOQuery1ctpsserieuf: TWideStringField;
    ADOQuery1pis: TWideStringField;
    ADOQuery1cpf: TWideStringField;
    ADOQuery1rg: TWideStringField;
    ADOQuery1titeleitor: TWideStringField;
    ADOQuery1zona: TWideStringField;
    ADOQuery1secao: TWideStringField;
    ADOQuery1reservista: TWideStringField;
    ADOQuery1carthabilt: TWideStringField;
    ADOQuery1tpsanguinio: TWideStringField;
    ADOQuery1naturalidade: TWideStringField;
    ADOQuery1ufnasc: TWideStringField;
    ADOQuery1nacionalidade: TIntegerField;
    ADOQuery1datachegada: TDateField;
    ADOQuery1situacaocaged: TIntegerField;
    ADOQuery1grauinstr: TIntegerField;
    ADOQuery1vinculoempreg: TIntegerField;
    ADOQuery1admrefgts: TIntegerField;
    ADOQuery1tipocontrato: TIntegerField;
    ADOQuery1validadeexmed: TIntegerField;
    ADOQuery1op13ferres: TIntegerField;
    ADOQuery1dataadmissao: TDateField;
    ADOQuery1dataopcaofgts: TDateField;
    ADOQuery1dataexmedico: TDateField;
    ADOQuery1datatransf: TDateField;
    ADOQuery1datarescisao: TDateField;
    ADOQuery1numcontfgts: TWideStringField;
    ADOQuery1numbanco: TIntegerField;
    ADOQuery1numerocc: TWideStringField;
    ADOQuery1tiposalario: TIntegerField;
    ADOQuery1codsind: TIntegerField;
    ADOQuery1tptributsind: TIntegerField;
    ADOQuery1qtdehsmensal: TIntegerField;
    ADOQuery1qtdehssemana: TIntegerField;
    ADOQuery1tempoexper: TIntegerField;
    ADOQuery1tempoprorrog: TIntegerField;
    ADOQuery1codlocal: TIntegerField;
    ADOQuery1coddepto: TIntegerField;
    ADOQuery1codsetor: TIntegerField;
    ADOQuery1codsecao: TIntegerField;
    ADOQuery1codrisco: TIntegerField;
    ADOQuery1emissorrg: TIntegerField;
    ADOQuery1emissorufrg: TWideStringField;
    ADOQuery1dataexprg: TDateField;
    ADOQuery1dataexpctps: TDateField;
    ADOQuery1tipovisto: TWideStringField;
    ADOQuery1numrne: TWideStringField;
    ADOQuery1validaderne: TDateField;
    ADOQuery1dataexpctpsex: TDateField;
    ADOQuery1valctpsex: TDateField;
    ADOQuery1numctpsex: TWideStringField;
    ADOQuery1datacadpis: TDateField;
    ADOQuery1matriculasind: TWideStringField;
    ADOQuery1nomeconsreg: TWideStringField;
    ADOQuery1numconsreg: TWideStringField;
    ADOQuery1siglaconsreg: TWideStringField;
    ADOQuery1regiaoconsreg: TWideStringField;
    ADOQuery1partcipa: TBooleanField;
    ADOQuery1qtdedepsalfam: TIntegerField;
    ADOQuery1qtdedepirrf: TIntegerField;
    ADOQuery1codhorario: TIntegerField;
    ADOQuery1observacao: TMemoField;
    ADOQuery1phx_apelido: TWideStringField;
    ADOQuery1pk_func: TIntegerField;
    function DataSetProvider1DataRequest(Sender: TObject;
      Input: OleVariant): OleVariant;
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

class procedure TDataSnapServer.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

function TDataSnapServer.DataSetProvider1DataRequest(Sender: TObject;
  Input: OleVariant): OleVariant;
begin
  ShowMessage('teste');
end;

initialization
  TComponentFactory.Create(ComServer, TDataSnapServer,
    Class_DataSnapServer, ciMultiInstance, tmApartment);
end.

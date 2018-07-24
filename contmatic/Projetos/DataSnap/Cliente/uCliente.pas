unit uCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Tela_Cadastro, DB, DBClient, EMSTable, ImgList, ComCtrls,
  ToolWin, Grids, DBGrids, StdCtrls, Mask, DBCtrls;

type
  TfrmCliente = class(TfrmTelaDeCadastro)
    cdsTabelafuncid: TIntegerField;
    cdsTabelanumregistro: TIntegerField;
    cdsTabelanumchapa: TIntegerField;
    cdsTabelanome: TWideStringField;
    cdsTabelaendereco: TWideStringField;
    cdsTabelanumero: TIntegerField;
    cdsTabelacompl: TWideStringField;
    cdsTabelabairro: TWideStringField;
    cdsTabelacidade: TWideStringField;
    cdsTabelauf: TWideStringField;
    cdsTabelacep: TWideStringField;
    cdsTabelafone: TWideStringField;
    cdsTabeladatanasc: TDateField;
    cdsTabelanomepai: TWideStringField;
    cdsTabelanomemae: TWideStringField;
    cdsTabelaestcivil: TIntegerField;
    cdsTabelasexo: TIntegerField;
    cdsTabelactpsserieuf: TWideStringField;
    cdsTabelapis: TWideStringField;
    cdsTabelacpf: TWideStringField;
    cdsTabelarg: TWideStringField;
    cdsTabelatiteleitor: TWideStringField;
    cdsTabelazona: TWideStringField;
    cdsTabelasecao: TWideStringField;
    cdsTabelareservista: TWideStringField;
    cdsTabelacarthabilt: TWideStringField;
    cdsTabelatpsanguinio: TWideStringField;
    cdsTabelanaturalidade: TWideStringField;
    cdsTabelaufnasc: TWideStringField;
    cdsTabelanacionalidade: TIntegerField;
    cdsTabeladatachegada: TDateField;
    cdsTabelasituacaocaged: TIntegerField;
    cdsTabelagrauinstr: TIntegerField;
    cdsTabelavinculoempreg: TIntegerField;
    cdsTabelaadmrefgts: TIntegerField;
    cdsTabelatipocontrato: TIntegerField;
    cdsTabelavalidadeexmed: TIntegerField;
    cdsTabelaop13ferres: TIntegerField;
    cdsTabeladataadmissao: TDateField;
    cdsTabeladataopcaofgts: TDateField;
    cdsTabeladataexmedico: TDateField;
    cdsTabeladatatransf: TDateField;
    cdsTabeladatarescisao: TDateField;
    cdsTabelanumcontfgts: TWideStringField;
    cdsTabelanumbanco: TIntegerField;
    cdsTabelanumerocc: TWideStringField;
    cdsTabelatiposalario: TIntegerField;
    cdsTabelacodsind: TIntegerField;
    cdsTabelatptributsind: TIntegerField;
    cdsTabelaqtdehsmensal: TIntegerField;
    cdsTabelaqtdehssemana: TIntegerField;
    cdsTabelatempoexper: TIntegerField;
    cdsTabelatempoprorrog: TIntegerField;
    cdsTabelacodlocal: TIntegerField;
    cdsTabelacoddepto: TIntegerField;
    cdsTabelacodsetor: TIntegerField;
    cdsTabelacodsecao: TIntegerField;
    cdsTabelacodrisco: TIntegerField;
    cdsTabelaemissorrg: TIntegerField;
    cdsTabelaemissorufrg: TWideStringField;
    cdsTabeladataexprg: TDateField;
    cdsTabeladataexpctps: TDateField;
    cdsTabelatipovisto: TWideStringField;
    cdsTabelanumrne: TWideStringField;
    cdsTabelavalidaderne: TDateField;
    cdsTabeladataexpctpsex: TDateField;
    cdsTabelavalctpsex: TDateField;
    cdsTabelanumctpsex: TWideStringField;
    cdsTabeladatacadpis: TDateField;
    cdsTabelamatriculasind: TWideStringField;
    cdsTabelanomeconsreg: TWideStringField;
    cdsTabelanumconsreg: TWideStringField;
    cdsTabelasiglaconsreg: TWideStringField;
    cdsTabelaregiaoconsreg: TWideStringField;
    cdsTabelapartcipa: TBooleanField;
    cdsTabelaqtdedepsalfam: TIntegerField;
    cdsTabelaqtdedepirrf: TIntegerField;
    cdsTabelacodhorario: TIntegerField;
    cdsTabelaobservacao: TMemoField;
    cdsTabelaphx_apelido: TWideStringField;
    cdsTabelapk_func: TIntegerField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCliente: TfrmCliente;

implementation

uses udtmPrincipal;

{$R *.dfm}

end.

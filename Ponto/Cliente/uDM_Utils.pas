unit uDM_Utils;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect;

type
  TDM_Utils = class(TDataModule)
    DCOMCon_Utils: TDCOMConnection;
    cdsRetornoID: TClientDataSet;
    cdsRetornoIDid: TLargeintField;
    cdsEstados: TClientDataSet;
    cdsEstadosID_ESTADO: TIntegerField;
    cdsEstadosUF: TWideStringField;
    cdsEstadosNOME: TWideStringField;
  private
    { Private declarations }
  public
    procedure AfterConstruction; override;
    { Public declarations }
    
  end;

var
  DM_Utils: TDM_Utils;

implementation

{$R *.dfm}

{ TDM_Utils }

procedure TDM_Utils.AfterConstruction;
begin
  inherited;
  DCOMCon_Utils.ServerName := 'ServidorPonto.RDM_Utils';
  DCOMCon_Utils.Connected  := True;
end;

end.

unit uDM;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect;

type
  TDM = class(TDataModule)
    DCOMConnection1: TDCOMConnection;
    ClientDataSet1: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.

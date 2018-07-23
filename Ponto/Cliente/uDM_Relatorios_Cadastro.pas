unit uDM_Relatorios_Cadastro;

interface

uses
  SysUtils, Classes, frxClass, frxDBSet;

type
  TDataModule1 = class(TDataModule)
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

end.

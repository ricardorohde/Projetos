unit uHorarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Tela_Cadastro, DB, DBClient, ComCtrls, ToolWin, Grids, DBGrids,
  StdCtrls, Mask, DBCtrls;

type
  TfrmHorarios = class(TfrmTelaDeCadastro)
    cdsTabelahorarioid: TIntegerField;
    cdsTabelasegent1: TTimeField;
    cdsTabelasegsai1: TTimeField;
    cdsTabelasegent2: TTimeField;
    cdsTabelasegsai2: TTimeField;
    cdsTabelatercent1: TTimeField;
    cdsTabelatercsai1: TTimeField;
    cdsTabelatercent2: TTimeField;
    cdsTabelatercsai2: TTimeField;
    cdsTabelaquarent1: TTimeField;
    cdsTabelaquarsai1: TTimeField;
    cdsTabelaquarent2: TTimeField;
    cdsTabelaquarsai2: TTimeField;
    cdsTabelaquinent1: TTimeField;
    cdsTabelaquintsai1: TTimeField;
    cdsTabelaquinent2: TTimeField;
    cdsTabelaquinsai2: TTimeField;
    cdsTabelasextent1: TTimeField;
    cdsTabelasextsai1: TTimeField;
    cdsTabelasextent2: TTimeField;
    cdsTabelasextsai2: TTimeField;
    cdsTabelasabent1: TTimeField;
    cdsTabelasabsai1: TTimeField;
    cdsTabelasabent2: TTimeField;
    cdsTabelasabsai2: TTimeField;
    cdsTabeladoment1: TTimeField;
    cdsTabeladomsai1: TTimeField;
    cdsTabeladoment2: TTimeField;
    cdsTabeladomsai2: TTimeField;
    cdsTabelaescala: TBooleanField;
    cdsTabeladescricao: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    cdsTabelapk_horarios: TAutoIncField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHorarios: TfrmHorarios;

implementation

uses DataModule;

{$R *.dfm}

procedure TfrmHorarios.FormCreate(Sender: TObject);
begin
  inherited;
  TableName  := 'horarios';
  PrimaryKey := 'horarioid';
  Connection := DataModule1.ADConnection1;
end;

end.

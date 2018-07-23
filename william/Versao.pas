unit Versao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, uEditFormat, Buttons, ExtCtrls, ComCtrls,
  ToolWin, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxmdaset, AltSetupMemData, DBClient,
  MemDS, DBAccess, Uni, SetupTable, alterdataconnection, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, AlterdataSelecaoDeRtm, AlterdataHints,
  Alterdata, StrUtils, Grids, DBGrids, Menus, cxCheckBox, cxGridBandedTableView,
  cxGridDBBandedTableView, cxDBLookupComboBox, cxCalc, cxSpinEdit, DataBaseStart,
  SetupQuery, DASQLMonitor, UniSQLMonitor, Alterdata;

type
  TForm1 = class(TForm)
    edtNome: TEdit;
    Label1: TLabel;
    edtSenha: TEdit;
    Label2: TLabel;
    edtServidor: TEdit;
    Label3: TLabel;
    edtBase: TEdit;
    Label4: TLabel;
    Panel1: TPanel;
    edtCdEmpresa: TEdit;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label6: TLabel;
    cboTipo: TComboBox;
    AlterdataConnection1: TAlterdataConnection;
    UniSQLMonitor1: TUniSQLMonitor;
    SetupQuery1: TSetupQuery;
    edtDataIni: TMaskEdit;
    lblDtEntSai: TLabel;
    Label7: TLabel;
    edtDataFim: TMaskEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure DuplicarInventario;
    procedure MudarVersao;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  try
    DataBaseStart.Connect(AlterdataConnection1, cboTipo.Text ,edtServidor.Text,edtBase.Text,edtNome.text,edtSenha.Text);

    if not AlterdataConnection1.Connected then
      showMessage('Não foi possível realizar a conexão com o banco de dados.Verifique!!!')
    else
      MudarVersao;
  except
    close;
  end;
end;

procedure TForm1.DuplicarInventario;
var lQuery : TSetupQuery;
    i : Integer;
begin
  lQuery := TSetupQuery.Create('WFISCAL');
  try
    SetupQuery1.Close;
    SetupQuery1.SQL.Clear;
    SetupQuery1.Schema := 'WFISCAL';
    SetupQuery1.SQL.Add('select *');
    SetupQuery1.SQL.Add('from &Tabela');
    SetupQuery1.SQL.Add('WHERE (IV.dtRefDe  = :pDataINI) AND');
    SetupQuery1.SQL.Add('      (IV.dtRefAte = :pDataFIM)');
    SetupQuery1.MacroByName('Tabela').AsString := 'wfiscal.IV' + StrZero(edtCdEmpresa.Text, 5);
    SetupQuery1.ParamByName('pDataINI').AsDateTime := StrToDate(edtDataIni.Text);
    SetupQuery1.ParamByName('pDataFIM').AsDateTime := StrToDate(edtDataFim.Text);
    SetupQuery1.Open;

    lQuery.SQL := SetupQuery1.SQL;
    lQuery.MacroByName('Tabela').AsString := 'wfiscal.IV' + StrZero(edtCdEmpresa.Text, 5);
    lQuery.ParamByName('pDataINI').AsDateTime := StrToDate(edtDataIni.Text);
    lQuery.ParamByName('pDataFIM').AsDateTime := StrToDate(edtDataFim.Text);
    lQuery.Open;

    SetupQuery1.First;
    while not SetupQuery1.Eof do
      begin
        lQuery.Append;
        for i := 0 to lQuery.FieldCount do
          begin
            lQuery.Fields
          end;
        lQuery.Post;
        SetupQuery1.Next;
      end;
  finally
    FreeAndNil(lQuery);
  end;

  showMessage('Sucesso!!!' + #10 + 'Rows affecteds: ' + IntToStr(SetupQuery1.RowsAffected));
end;

end.

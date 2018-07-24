unit uPesquisaPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, DB, DBClient, Grids, DBGrids;

type
  TListFields = record
    Caption   : string;
    FieldName : string;
    Retorno   : Boolean;
    Width     : Integer;
    Tipo      : string;
  end;

  type TArrayOfListFields = array of TListFields;

  TPesquisa = class
    procedure Pesquisar(DataSet :TDataSet; pCamposPesquisa : TArrayOfListFields);
  end;

  TfrmPesquisaPadrao = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    edtPesquisa: TEdit;
    btnPesquisa: TSpeedButton;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    dtsPesquisa: TDataSource;
    grdPesquisa: TDBGrid;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure grdPesquisaDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FResultado: Variant;
    FCampoRetorno: string;
    FCamposPesquisa: TArrayOfListFields;
    procedure SetResultado(const Value: Variant);
    procedure SetCampoRetorno(const Value: string);
    procedure Buscar;
    function FieldRetorno: string;
//    function IsDate(Value: string): Boolean;
//    function IsFloat(Value: string): Boolean;
//    function IsInteger(Value: string): Boolean;
//    function RetornarTipo(Value: string): string;
    procedure SetCamposPesquisa(const Value: TArrayOfListFields);
    procedure CriaColunas();
    { Private declarations }
  public
    { Public declarations }
    property Resultado    : Variant read FResultado    write SetResultado;
    property CampoRetorno : string  read FCampoRetorno write SetCampoRetorno;

    property CamposPesquisa : TArrayOfListFields read FCamposPesquisa write SetCamposPesquisa; 
  end;

var
  frmPesquisaPadrao: TfrmPesquisaPadrao;

implementation

uses uDM_Pesquisa;

{$R *.dfm}

{ TfrmPesquisa }

procedure TfrmPesquisaPadrao.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmPesquisaPadrao.btnOkClick(Sender: TObject);
begin
  if VarToStrDef(FResultado, '') = '' then
    btnPesquisa.Click;
    
  ModalResult := mrOk;
end;

{ TPesquisa }

procedure TPesquisa.Pesquisar(DataSet :TDataSet; pCamposPesquisa : TArrayOfListFields);
begin
  frmPesquisaPadrao := TfrmPesquisaPadrao.Create(nil);
  try
    frmPesquisaPadrao.dtsPesquisa.DataSet := DataSet;
    frmPesquisaPadrao.CamposPesquisa      := pCamposPesquisa;
    if frmPesquisaPadrao.ShowModal = mrOk then
    begin
      DataSet.Locate(frmPesquisaPadrao.CampoRetorno, VarArrayOf([frmPesquisaPadrao.Resultado]), [loCaseInsensitive]);
    end
  finally
    FreeAndNil( frmPesquisaPadrao );
  end;
end;

procedure TfrmPesquisaPadrao.CriaColunas();
var
  i : Integer;
begin
  for i := Low(FCamposPesquisa) to High(FCamposPesquisa) do
  begin
    frmPesquisaPadrao.grdPesquisa.Columns.Add;
    frmPesquisaPadrao.grdPesquisa.Columns[i].FieldName     := FCamposPesquisa[i].FieldName;
    frmPesquisaPadrao.grdPesquisa.Columns[i].Title.Caption := FCamposPesquisa[i].Caption;
    frmPesquisaPadrao.grdPesquisa.Columns[i].Width         := FCamposPesquisa[i].Width;

    if FCamposPesquisa[i].Retorno then
      frmPesquisaPadrao.CampoRetorno := FCamposPesquisa[i].FieldName;
  end;
end;

procedure TfrmPesquisaPadrao.SetCampoRetorno(const Value: string);
begin
  FCampoRetorno := Value;
end;

procedure TfrmPesquisaPadrao.SetResultado(const Value: Variant);
begin
  FResultado := Value;
end;


procedure TfrmPesquisaPadrao.Buscar();
var
  i             : Integer;
  lDataSet      : TDataSet;
  lFieldRetorno : string;
  lBookMark     : TBookmark;
begin
  FResultado := '';

  if Trim(edtPesquisa.Text) = '' then
    Exit;

  lFieldRetorno := FieldRetorno();
  if Trim(lFieldRetorno) = '' then
    Exit;

  lDataSet := dtsPesquisa.DataSet;
  for i := Low( FCamposPesquisa ) to High( FCamposPesquisa ) do
  begin
    if not Assigned( lDataSet.FindField(FCamposPesquisa[i].FieldName) ) then
      Continue;

    lDataSet.DisableControls;
    lDataSet.First;
    while not lDataSet.Eof do
    begin
      if not lDataSet.FieldByName(FCamposPesquisa[i].FieldName).IsNull then
        if (lDataSet.FieldByName(FCamposPesquisa[i].FieldName).AsString = edtPesquisa.Text) or
           ( (FCamposPesquisa[i].Tipo = 'STRING') and
             (AnsiPos(AnsiUpperCase(edtPesquisa.Text), AnsiUpperCase(lDataSet.FieldByName(FCamposPesquisa[i].FieldName).AsString)) > 0)) then
        begin
          FResultado := lDataSet.FieldByName(lFieldRetorno).Value;
          lBookMark := lDataSet.GetBookmark;
          Break;
        end;

      lDataSet.Next;
    end;

    lDataSet.EnableControls;
  end;

  dtsPesquisa.DataSet.GotoBookmark(lBookMark);
  lDataSet.FreeBookmark(lBookMark);
end;

procedure TfrmPesquisaPadrao.btnPesquisaClick(Sender: TObject);
begin
  Buscar();
end;

procedure TfrmPesquisaPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmPesquisaPadrao.edtPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    btnPesquisa.Click;
  end;
end;

function TfrmPesquisaPadrao.FieldRetorno() : string;
var
  i : Integer;
begin
  Result := '';
  for i := Low( FCamposPesquisa ) to High( FCamposPesquisa ) do
    if FCamposPesquisa[i].Retorno then
    begin
      if Assigned( grdPesquisa.DataSource.DataSet.FindField(FCamposPesquisa[i].FieldName) ) then
      begin
        Result := FCamposPesquisa[i].FieldName;
        Break;
      end;
    end;
end;

//function TfrmPesquisaPadrao.IsInteger(Value : string): Boolean;
//begin
//  result := StrToIntDef(Value, -9999999)<> -9999999;
//end;
//
//function TfrmPesquisaPadrao.IsFloat(Value : string): Boolean;
//begin
//  result := StrToFloatDef( StringReplace(Value, ',', '.', [rfReplaceAll]), -9999999)<> -9999999;
//end;
//
//function TfrmPesquisaPadrao.IsDate(Value : string): Boolean;
//begin
//  result := not (StrToDateDef( Value, 0) = 0);
//end;

//function TfrmPesquisaPadrao.RetornarTipo(Value : string): string;
//begin
//  Result := 'STRING';
//  if IsInteger(Value) then
//    Result := 'INTEGER'
//  else
//  if IsFloat(Value) then
//    Result := 'FLOAT'
//  else
//  if IsDate(Value) then
//    Result := 'DATE';
//end;

procedure TfrmPesquisaPadrao.grdPesquisaDblClick(Sender: TObject);
var
  lFieldRetorno : string;
begin
  lFieldRetorno := FieldRetorno();

  if Assigned( grdPesquisa.DataSource.DataSet.FindField( lFieldRetorno ) ) then
  begin
    FResultado := grdPesquisa.DataSource.DataSet.FieldByName( lFieldRetorno ).Value;
  end;

  ModalResult := mrOk;
end;

procedure TfrmPesquisaPadrao.SetCamposPesquisa(
  const Value: TArrayOfListFields);
begin
  FCamposPesquisa := Value;
end;

procedure TfrmPesquisaPadrao.FormShow(Sender: TObject);
begin
  CriaColunas();
end;

end.

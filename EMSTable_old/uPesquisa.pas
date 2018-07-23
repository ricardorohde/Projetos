unit uPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, Mask,
  DBCtrls, StrUtils, LookupEdit;

type
  TfrmPesquisa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    edtPesquisa: TEdit;
    Label1: TLabel;
    btnPesquisa: TBitBtn;
    grdPesquisa: TDBGrid;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure btnPesquisaClick(Sender: TObject);
    procedure grdPesquisaDblClick(Sender: TObject);
  private
    { Private declarations }
    FListFields : array of TListFields;
    FRetorno : Variant;

    function IsInteger(Value: string): Boolean;
    function IsFloat(Value: string): Boolean;
    function IsDate(Value: string): Boolean;
    function RetornarTipo(Value: string): string;
    function FieldRetorno(): string;
    procedure Buscar();
    procedure AlimentarArrayListFields();
  public
    { Public declarations }
    class function Pesquisar() : Variant;
  end;

var
  frmPesquisa: TfrmPesquisa;

implementation

uses DbLookupEdit;

{$R *.dfm}

procedure TfrmPesquisa.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

class function TfrmPesquisa.Pesquisar: Variant;
begin
  Result := '';
  if (TDBLookupEdit(frmPesquisa.Owner).ListFields.Count <= 0) then
    Exit;

  if TDBLookupEdit(frmPesquisa.Owner).ListSource.DataSet.IsEmpty then
    Exit;

  if frmPesquisa.ShowModal = mrOk then
    Result := frmPesquisa.FRetorno;
end;

procedure TfrmPesquisa.FormShow(Sender: TObject);
var
  i : Integer;
begin
  Width := 0;
  AlimentarArrayListFields();

  for i := Low(FListFields) to High(FListFields) do
  begin
    grdPesquisa.Columns.Add;
    grdPesquisa.Columns[i].FieldName     := FListFields[i].FieldName;
    grdPesquisa.Columns[i].Title.Caption := FListFields[i].Caption;
    grdPesquisa.Columns[i].Width         := FListFields[i].Width;

    Width := Width + grdPesquisa.Columns[i].Width;
  end;
  Width := Width + 40;

  if Width < 260 then Width := 260;

  btnOk.Left       := Width - btnOk.Width - btnCancelar.Width -10;
  btnCancelar.Left := Width - btnCancelar.Width-5;
  grdPesquisa.DataSource.DataSet.First;
end;

procedure TfrmPesquisa.btnOkClick(Sender: TObject);
begin
  if VarToStrDef(FRetorno, '') = '' then
    btnPesquisa.Click;

  ModalResult := mrOk;
end;

procedure TfrmPesquisa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key = #13 then
  begin
//    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmPesquisa.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    btnPesquisa.Click;
  end;
end;

function TfrmPesquisa.FieldRetorno() : string;
var
  i : Integer;
begin
  Result := '';
  for i := Low( FListFields ) to High( FListFields ) do
    if FListFields[i].Retorno then
    begin
      if Assigned( grdPesquisa.DataSource.DataSet.FindField(FListFields[i].FieldName) ) then
      begin
        Result := FListFields[i].FieldName;
        Break;
      end;
    end;
end;

procedure TfrmPesquisa.Buscar();
var
  i             : Integer;
  lDataSet      : TDataSet;
  lFieldRetorno : string;
  lBookMark     : TBookmark;
begin
  FRetorno := '';

  if Trim(edtPesquisa.Text) = '' then
    Exit;

  lFieldRetorno := FieldRetorno();
  if Trim(lFieldRetorno) = '' then
    Exit;

  lDataSet := grdPesquisa.DataSource.DataSet;
  for i := Low( FListFields ) to High( FListFields ) do
    if FListFields[i].Tipo = RetornarTipo(edtPesquisa.Text) then
    begin
      if not Assigned( lDataSet.FindField(FListFields[i].FieldName) ) then
        Continue;

      lDataSet.DisableControls;
      lDataSet.First;
      while not lDataSet.Eof do
      begin
        if (lDataSet.FieldByName(FListFields[i].FieldName).AsString = edtPesquisa.Text) or
           ( (FListFields[i].Tipo = 'STRING') and
             (AnsiPos(AnsiUpperCase(edtPesquisa.Text), AnsiUpperCase(lDataSet.FieldByName(FListFields[i].FieldName).AsString)) > 0)) then
        begin
          FRetorno := lDataSet.FieldByName(lFieldRetorno).Value;
          lBookMark := lDataSet.GetBookmark;
          Break;
        end;

        lDataSet.Next;
      end;

      lDataSet.EnableControls;
    end;

  grdPesquisa.DataSource.DataSet.GotoBookmark(lBookMark);
  lDataSet.FreeBookmark(lBookMark);
end;

procedure TfrmPesquisa.btnPesquisaClick(Sender: TObject);
begin
  Buscar();
end;

function TfrmPesquisa.IsInteger(Value : string): Boolean;
begin
  result := StrToIntDef(Value, -9999999)<> -9999999;
end;

function TfrmPesquisa.IsFloat(Value : string): Boolean;
begin
  result := StrToFloatDef( StringReplace(Value, ',', '.', [rfReplaceAll]), -9999999)<> -9999999;
end;

function TfrmPesquisa.IsDate(Value : string): Boolean;
begin
  result := not (StrToDateDef( Value, 0) = 0);
end;

function TfrmPesquisa.RetornarTipo(Value : string): string;
begin
  Result := 'STRING';
  if IsInteger(Value) then
    Result := 'INTEGER'
  else
  if IsFloat(Value) then
    Result := 'FLOAT'
  else
  if IsDate(Value) then
    Result := 'DATE';
end;

procedure TfrmPesquisa.grdPesquisaDblClick(Sender: TObject);
var
  lFieldRetorno : string;
begin
  lFieldRetorno := FieldRetorno();

  if Assigned( grdPesquisa.DataSource.DataSet.FindField( lFieldRetorno ) ) then
  begin
    FRetorno := grdPesquisa.DataSource.DataSet.FieldByName( lFieldRetorno ).Value;
  end;

  ModalResult := mrOk;
end;

procedure TfrmPesquisa.AlimentarArrayListFields();
var
  i           : Integer;
  lStrAux     : string;
begin
  Width := 0;

  for i := 0 to TDBLookupEdit(Self.Owner).ListFields.Count -1 do
  begin
    lStrAux := TDBLookupEdit(Self.Owner).ListFields.Strings[i];

    SetLength(FListFields, Length(FListFields) + 1);

    FListFields[ High(FListFields) ].Caption  := Copy(lStrAux, 1, Pos(';',lStrAux)-1);
    Delete(lStrAux, 1, Pos(';',lStrAux));

    FListFields[ High(FListFields) ].FieldName := Copy(lStrAux, 1, Pos(';',lStrAux)-1);
    Delete(lStrAux, 1, Pos(';',lStrAux));

    FListFields[ High(FListFields) ].Width := StrToIntDef( Copy(lStrAux, 1, Pos(';',lStrAux)-1), 20 );
    Delete(lStrAux, 1, Pos(';',lStrAux));

    FListFields[ High(FListFields) ].Retorno := UpperCase( Copy(lStrAux, 1, Pos(';',lStrAux)-1) ) = 'RETORNO';
    Delete(lStrAux, 1, Pos(';',lStrAux));

    FListFields[ High(FListFields) ].Tipo := UpperCase( Copy(lStrAux, 1, Pos(';',lStrAux)-1) );
    Delete(lStrAux, 1, Pos(';',lStrAux));
  end;
end;

end.

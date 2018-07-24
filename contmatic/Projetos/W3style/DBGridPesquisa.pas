unit DBGridPesquisa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, stdctrls, uTool, dbTables, db,ITValida, ADODB;

type
  TDBGridPesquisa = class(TDBGRID)
  private
    { Private declarations }
    edtRect : TRect;
    edPesquisa : TEdit;

  protected
    { Protected declarations }

    procedure KeyPress(var Key: Char); override;
    procedure DrawColumnCell(const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState); override;
    procedure MakeSearch;
    procedure CriaEdPesquisa( key : Char);
    procedure HideEdPesquisa( Sender : TObject);

    //Edit
    procedure edtKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtKeyPress(Sender: TObject; var Key: Char);
    procedure Locate_Calculado( psFiltro : string );
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure SelectAll;
  published
    { Published declarations }

  end;
const csCheck ='ü'; //usar fonte wingdings

procedure Register;

implementation

procedure TDBGridPesquisa.SelectAll;
var vBookMark : TBookMark;
begin
  if ( dgMultiSelect in Options ) and
     Assigned( datasource ) and
     Assigned( datasource.dataset ) and
     ( datasource.dataset.State = dsBrowse ) then
  begin
    vBookMark := datasource.dataset.GetBookmark;
    datasource.dataset.first;
    while not datasource.dataset.eof  do
    begin
       SelectedRows.CurrentRowSelected := true;
       datasource.dataset.next;
    end;
    datasource.dataset.GotoBookmark(vBookMark);
    datasource.dataset.FreeBookmark( vBookMark);
  end;
end;

constructor TDBGridPesquisa.Create(AOwner: TComponent);
begin
  inherited;
  valida_Sistema(self);
end;

destructor TDBGridPesquisa.Destroy;
begin
  if ( edPesquisa <> nil ) then
     edPesquisa.Free;
  inherited Destroy;
end;

procedure TDBGridPesquisa.KeyPress(var Key: Char);
begin
  inherited;
  // Verifica se o caracter digitado e valido para a coluna
  if ( not (csDesigning in ComponentState )  ) and
     ( SelectedField <> nil         ) and
     ( F_CharOK( SelectedField.DataType, key ) ) and
     ( not ( dgRowSelect in options ) )then
  begin
     CriaEdPesquisa(key);
  end;
end;

procedure TDBGridPesquisa.DrawColumnCell(const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (State = [gdSelected,gdFocused]) then edtRect := Rect;
end;

procedure TDBGridPesquisa.edtKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
   vk_return : MakeSearch;
   vk_escape : HideEdPesquisa(self);
  end;
end;


procedure TDBGridPesquisa.MakeSearch;
var Param : Variant;
begin
  if ( edPesquisa.Text <> '' ) and
     ( DataSource.DataSet <> nil )then
  begin
     Param := edPesquisa.Text;
     if SelectedField.Calculated then
     begin
        Locate_Calculado( Param );
     end
     else
     begin
        TADOQuery(DataSource.DataSet).Locate(SelectedField.FieldName,
               Param, [loCaseInsensitive, loPartialKey]);
     end;
     HideEdPesquisa(self);
  end;
  // COLOCAR AFTER SEARCH
end;

procedure TDBGridPesquisa.Locate_Calculado( psFiltro : string );
var vBookMark : TBookmark;
    vbEncontrou : boolean;
begin
   vbEncontrou := false;

   with datasource.dataset do
   begin
    vBookMark := GetBookmark;
    disableControls;
    first;
    while (not eof ) and ( not vbEncontrou ) do
    begin
      if UpperCase(psFiltro) = UpperCase( copy(selectedfield.AsString,0,length(psFiltro) ) ) then
         vbEncontrou := true
      else
         next;
    end;
    // se não encontrou, volta para o registro_original
    if not vbEncontrou then
       GotoBookmark(vBookMark);

    FreeBookmark(vBookMark);
  end;
end;

procedure TDBGridPesquisa.edtKeyPress(Sender: TObject; var Key: Char);
begin
  if ( Ord(Key) <> vk_Back                               ) and
     ( not F_CharOK( SelectedField.DataType, key ) ) then
  begin
     Key := #0;
  end;
end;


procedure TDBGridPesquisa.CriaEdPesquisa(key : char);
begin
     // Posiciona um edit para receber informacoes para filtro no grid
  edPesquisa := Tedit.create(self);
  with edPesquisa do
  begin
     onKeyDown  := edtKeyDown;
     onKeyPress := edtKeyPress;
     onExit     := HideEdPesquisa;
     CharCase   := ecUpperCase;
     Font.Style := [fsBold];
     Color := clInfoBk;
     BorderStyle := bsSingle;
     parent := self;
     Height := edtRect.Bottom - edtRect.Top;
     Width := edtRect.Right - edtRect.Left;
     Left :={ self.Left +} edtRect.Left{ + 2};
     Top := {self.Top +} edtRect.Top {+ 2};
     BringToFront;
     Visible := True;
     SetFocus;
     Text := Key;
     selstart := 1;
  end;

end;

procedure TDBGridPesquisa.HideEdPesquisa(Sender: TObject);
begin
  edPesquisa.Clear;
  edPesquisa.SendtoBack;
  edPesquisa.visible := false;
  self.setfocus;
end;

procedure Register;
begin
  RegisterComponents('W3Style', [TDBGridPesquisa]);
end;


end.

unit uUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp, StdCtrls, ExtCtrls, ComCtrls, Menus,ShellApi,Registry,
  DB, DBClient, Grids, DBGrids,LIB, IniFiles;

type
  TfrmUsuarios = class(TForm)
    Panel1: TPanel;
    gridUsuarios: TDBGrid;
    PopupMenu1: TPopupMenu;
    Editar1: TMenuItem;
    Excuir1: TMenuItem;
    procedure gridUsuariosDblClick(Sender: TObject);
    procedure Excuir1Click(Sender: TObject);
    procedure Editar1Click(Sender: TObject);
  private
    { Private declarations }
    procedure WMMove(var Msg: TMessage); message WM_MOVE;

  public
    { Public declarations }
    procedure AjustarForm;
    procedure CriaTabShetUsuario;
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

uses usocket, uEditaUsuario;

{$R *.dfm}

{ TfrmUsuarios }

procedure TfrmUsuarios.AjustarForm;
begin
  if assigned(frmUsuarios) then
    begin
      //frmUsuarios.Width := frmPrincipal.Width;
      frmUsuarios.Left := frmPrincipal.Left + frmPrincipal.Width + 13;
      frmUsuarios.Top := frmPrincipal.Top;
    end;
end;

procedure TfrmUsuarios.WMMove(var Msg: TMessage);
begin
  AjustarForm;
end;

procedure TfrmUsuarios.gridUsuariosDblClick(Sender: TObject);
begin
  CriaTabShetUsuario;
end;

procedure TfrmUsuarios.CriaTabShetUsuario;
var
  TabSheet2 : TTabSheet;
  lUsuarioIP,
  lUsuario :string;

  Index : Integer;


  function ExistePage(pTab : string) : boolean;
  var i : Integer;
  begin
    result := false;
    for i := 0 to frmPrincipal.pgConversas.PageCount -1 do
    begin
      if (TTabSheet(frmPrincipal.pgConversas.Pages[i]).Caption = pTab) then
      begin
        Index := i;
        Result := true;
      end;
    end;
  end;

begin
  frmPrincipal.mmoConversa.Clear;
  frmPrincipal.mmoCrip.Clear;
  lUsuario   := frmPrincipal.dtsUsuarios.DataSet.FieldByName('Usuario').AsString;
  lUsuarioIP := frmPrincipal.dtsUsuarios.DataSet.FieldByName('IP').AsString;
  if not ExistePage(lUsuario) then
    begin
      TabSheet2 := TTabSheet.Create(frmPrincipal.pgConversas);
      TabSheet2.PageControl := frmPrincipal.pgConversas;
      //TabSheet2.Name    := stringReplace(lUsuario,'.','',[rfReplaceAll]) + stringReplace(lUsuarioIP,'.','',[rfReplaceAll]);
      TabSheet2.Name    := 'A'+ stringReplace(lUsuarioIP,'.','',[rfReplaceAll]);
      TabSheet2.Caption := lUsuario;
      TabSheet2.Enabled := false;
      TabSheet2.PageControl.ActivePageIndex := TabSheet2.PageControl.PageCount;
      frmPrincipal.pgConversas.ActivePage := TabSheet2;
    end
  else
    frmPrincipal.pgConversas.ActivePageIndex := Index;
end;

procedure TfrmUsuarios.Excuir1Click(Sender: TObject);
begin
  frmPrincipal.dtsUsuarios.DataSet.Delete;
end;

procedure TfrmUsuarios.Editar1Click(Sender: TObject);
begin
  frmPrincipal.dtsUsuarios.DataSet.Edit;
  frmEditarUsuario := TfrmEditarUsuario.Create(nil);
  frmEditarUsuario.ShowModal;
end;

end.


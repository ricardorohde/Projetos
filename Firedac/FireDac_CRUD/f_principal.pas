unit f_principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.MySQL,
  FireDAC.Comp.UI, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids;

type
  Tfrm_principal = class(TForm)
    dbg_mestre: TDBGrid;
    btn_open: TBitBtn;
    btn_incluir: TBitBtn;
    btn_salvar: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_excluir: TBitBtn;
    edt_descricao: TDBEdit;
    ckb_ativo: TDBCheckBox;
    lbl_descricao: TLabel;
    btn_editar: TBitBtn;
    fdcon_principal: TFDConnection;
    fdgxwtcrsr_principal: TFDGUIxWaitCursor;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    fdq_mestre: TFDQuery;
    dts_mestre: TDataSource;
    procedure btn_openClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_principal: Tfrm_principal;

implementation

{$R *.dfm}

procedure Tfrm_principal.btn_cancelarClick(Sender: TObject);
begin
   fdq_mestre.Cancel;
end;

procedure Tfrm_principal.btn_editarClick(Sender: TObject);
begin
   fdq_mestre.Edit;
end;

procedure Tfrm_principal.btn_excluirClick(Sender: TObject);
begin
   fdq_mestre.Delete;
end;

procedure Tfrm_principal.btn_incluirClick(Sender: TObject);
begin
   fdq_mestre.Append;
end;

procedure Tfrm_principal.btn_openClick(Sender: TObject);
begin
   fdq_mestre.Open;
end;

procedure Tfrm_principal.btn_salvarClick(Sender: TObject);
begin
   fdq_mestre.Post;
end;

end.

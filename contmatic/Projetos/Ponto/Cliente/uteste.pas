unit uteste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Tela_Cadastro, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, EMSParameters, DBClient, cxNavigator,
  cxDBNavigator, StdCtrls, Buttons, ExtCtrls, ComCtrls, cxPC, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid;

type
  TfrmTelaDeCadastro1 = class(TfrmTelaDeCadastro)
    cxTabSheet1: TcxTabSheet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTelaDeCadastro1: TfrmTelaDeCadastro1;

implementation

{$R *.dfm}

end.

unit uCadastroUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.Buttons, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  Vcl.ExtCtrls;

type
  TfrmCadastroUsuarios = class(TForm)
    Panel1: TPanel;
    cxPageControl1: TcxPageControl;
    tbDados: TcxTabSheet;
    tbDetalhe: TcxTabSheet;
    cxGrid1: TcxGrid;
    tv: TcxGridDBTableView;
    lv: TcxGridLevel;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    ADODataSet1: TADODataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroUsuarios: TfrmCadastroUsuarios;

implementation

{$R *.dfm}

end.

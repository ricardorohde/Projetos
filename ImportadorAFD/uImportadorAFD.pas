unit uImportadorAFD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, ExtCtrls, cxPC,
  cxContainer, cxEdit, cxImage, StdCtrls, Buttons;

type
  TfrmImportadorAFD = class(TForm)
    pcPrincipal: TcxPageControl;
    pgBemVindo: TcxTabSheet;
    pgSelecao1: TcxTabSheet;
    pgSelecao2: TcxTabSheet;
    pgProcessamento: TcxTabSheet;
    pgFinal: TcxTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    cxImage1: TcxImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportadorAFD: TfrmImportadorAFD;

implementation

{$R *.dfm}

end.

unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxButtonEdit, cxGridCustomTableView, cxGridCardView, cxGridDBCardView,
  cxGridCustomView, cxGridTableView, cxGridDBTableView, DBClient, cxClasses,
  cxGridLevel, cxGrid, dxSkinsCore, dxSkinscxPCPainter, cxNavigator,
  cxGridCustomLayoutView;

type
  TForm1 = class(TForm)
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    CDSimple: TClientDataSet;
    cxGrid2: TcxGrid;
    ViewMaster: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    CDMaster: TClientDataSet;
    CDDetail: TClientDataSet;
    CDMasterid: TIntegerField;
    CDDetailid: TIntegerField;
    CDDetailid_master: TIntegerField;
    cxGrid2Level1: TcxGridLevel;
    ViewDetail: TcxGridDBCardView;
    DSSimple: TDataSource;
    DSMaster: TDataSource;
    DSDetail: TDataSource;
    CDSimpleid: TIntegerField;
    CDSimplefoo: TStringField;
    CDDetailfoo3: TStringField;
    CDMasterfoo2: TStringField;
    ViewSimple: TcxGridDBCardView;
    ViewSimpleid: TcxGridDBCardViewRow;
    ViewSimplefoo: TcxGridDBCardViewRow;
    ViewSimpleBUTTON: TcxGridDBCardViewRow;
    ViewDetailid: TcxGridDBCardViewRow;
    ViewDetailid_master: TcxGridDBCardViewRow;
    ViewDetailfoo3: TcxGridDBCardViewRow;
    ViewMasterid: TcxGridDBColumn;
    ViewMasterfoo2: TcxGridDBColumn;
    ViewDetailBUTTON: TcxGridDBCardViewRow;
    ViewMasterBUTTON: TcxGridDBColumn;
    procedure cxGrid1DBCardView1BUTTONPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.cxGrid1DBCardView1BUTTONPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var c : TComponent;
begin
  c := TComponent(Sender).Owner;
  ShowMessage(c.Name);

  if (c = ViewSimple)
    then ShowMessage('1')
  else if (c = ViewMaster)
    then ShowMessage('2')
  else
   if ((TcxGridDBCardView(c).PatternGridView as TcxGridDBCardView) = ViewDetail)
    then ShowMessage('3__' + (TcxGridDBCardView(c).PatternGridView as TcxGridDBCardView).Name);



end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CDSimple.Insert;
  CDSimple.FieldByName('id').AsInteger := 1;
  CDSimple.FieldByName('foo').AsString := 'blabla....';
  CDSimple.Post;

  CDMaster.Insert;
  CDMaster.FieldByName('id').AsInteger := 1;
  CDMaster.FieldByName('foo2').AsString := 'heheeee';
  CDMaster.Post;
  CDMaster.Insert;
  CDMaster.FieldByName('id').AsInteger := 2;
  CDMaster.FieldByName('foo2').AsString := 'haaaaaaaaaa';
  CDMaster.Post;

  CDDetail.Insert;
  CDDetail.FieldByName('id').AsInteger := 1;
  CDDetail.FieldByName('id_master').AsInteger := 1;
  CDDetail.FieldByName('foo3').AsString := 'some thing else';
  CDDetail.Post;
  CDDetail.Insert;
  CDDetail.FieldByName('id').AsInteger := 2;
  CDDetail.FieldByName('id_master').AsInteger := 1;
  CDDetail.FieldByName('foo3').AsString := 'nothing to do';
  CDDetail.Post;


end;

end.

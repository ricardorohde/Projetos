unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGrid, cxGridCustomTableView, cxGridTableView, cxControls,
  cxGridCustomView, cxClasses, cxGridLevel, cxGridDBTableView,
  cxGridCustomPopupMenu, cxGridPopupMenu;

type
  TForm2 = class(TForm)
    cxGridViewRepository1: TcxGridViewRepository;
    cxGridViewRepository1TableView2: TcxGridTableView;
    cxGridViewRepository1TableView2Column1: TcxGridColumn;
    cxGridViewRepository1TableView2Column2: TcxGridColumn;
    cxGridViewRepository1TableView2Column3: TcxGridColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGridPopupMenu1: TcxGridPopupMenu;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  cxGrid1Level1.GridView := cxGridViewRepository1TableView2;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

  form2 := nil;
end;

end.

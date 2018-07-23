unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridBandedTableView, cxGridDBBandedTableView, DBTables, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  dxmdaset, StdCtrls, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  TForm4 = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1Name: TcxGridDBColumn;
    cxGrid1DBTableView1Capital: TcxGridDBColumn;
    cxGrid1DBTableView1Continent: TcxGridDBColumn;
    cxGrid1DBTableView1Area: TcxGridDBColumn;
    cxGrid1DBTableView1Population: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    DataSource1: TDataSource;
    Table1: TTable;
    cxGrid1Level2: TcxGridLevel;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1Name: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Capital: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Continent: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Area: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Population: TcxGridDBBandedColumn;
    Button1: TButton;
    dxMemData1: TdxMemData;
    cxComboBox1: TcxComboBox;
    dxMemData1caption: TStringField;
    dxMemData1mezonev: TStringField;
    DataSource2: TDataSource;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1RecId: TcxGridDBColumn;
    cxGrid2DBTableView1caption: TcxGridDBColumn;
    cxGrid2DBTableView1mezonev: TcxGridDBColumn;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);

  procedure MyProc(var MemTabla: TdxMemData; InputView: TcxGridTableView ;InputCombo: TcxComboBox );
  var
   I: Integer;
  begin
    for I := 0 to InputView.ColumnCount - 1 do
    begin
      MemTabla.Insert;
      MemTabla.FieldByName('caption').AsString := InputView.Columns[i].Caption;
      MemTabla.FieldByName('mezonev').AsString := TcxGridDBTableView(InputView).Columns[i].DataBinding.FieldName;
      MemTabla.Post;
      InputCombo.Properties.Items.Add(InputView.Columns[i].Caption);
    end;
  end;

begin
  MyProc( dxMemData1,  cxGrid1DBTableView1, cxComboBox1);
  MyProc( dxMemData1,   cxGrid1DBBandedTableView1, cxComboBox1);
end;



end.

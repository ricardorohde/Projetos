unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxmdaset, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    dxMemData1: TdxMemData;
    dxMemData1Group: TStringField;
    dxMemData1Quote: TIntegerField;
    dxMemData1Totale: TIntegerField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1RecId: TcxGridDBColumn;
    cxGrid1DBTableView1Group: TcxGridDBColumn;
    cxGrid1DBTableView1Quote: TcxGridDBColumn;
    cxGrid1DBTableView1Totale: TcxGridDBColumn;
    procedure cxGrid1DBTableView1DataControllerSummaryFooterSummaryItemsSummary(
      ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
      var OutArguments: TcxSummaryEventOutArguments);
  private
    { Private declarations }
    //procedure CriarSumarios();
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//procedure TForm1.CriarSumarios();
//var
//  i        : Integer;
//  aSummary : TcxGridColumnSummary;
//begin
//  for i := 0 to tv.ColumnCount -1 do
//  begin
//    if AnsiMatchStr(tv.Columns[i].DataBinding.FieldName, ['VLLANCAMENTO', 'VLRESERVADO', 'VLPENDENTE']) then
//    begin
//      aSummary:= TcxGridColumnSummary.Create(tv.Columns[i]);
//      tv.Columns[i].Summary.FooterKind        := skSum;
//      tv.Columns[i].Summary.GroupFooterKind   := skSum;
//      case AnsiIndexStr(tv.Columns[i].DataBinding.FieldName, ['VLLANCAMENTO', 'VLRESERVADO', 'VLPENDENTE']) of
//        0 : tv.Columns[i].Summary.FooterFormat      := 'Saldo Disponível: 0.00';
//        1 : tv.Columns[i].Summary.FooterFormat      := 'Saldo Migrado: 0.00';
//        2 : tv.Columns[i].Summary.FooterFormat      := 'Valor pendente de postagem: 0.00';
//      end;
//
//      tv.Columns[i].Summary.GroupFooterFormat := tv.Columns[i].Summary.FooterFormat;
//    end;
//  end;
//end;

procedure TForm1.cxGrid1DBTableView1DataControllerSummaryFooterSummaryItemsSummary(
                 ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments; var OutArguments: TcxSummaryEventOutArguments);
var
  SumTotale, SumQuote: Extended;
  I: Integer;
begin
  if VarToStr(ASender.DataController.Values[Arguments.RecordIndex, cxGrid1DBTableView1Group.Index]) <> 'Sotto' then
  begin
    SumTotale := SumTotale + ASender.DataController.Values[Arguments.RecordIndex, cxGrid1DBTableView1Totale.Index];
    SumQuote   := SumQuote   + ASender.DataController.Values[Arguments.RecordIndex, cxGrid1DBTableView1Quote.Index];
  end;
  if Arguments.SummaryItem = Arguments.SummaryItem.SummaryItems[ASender.ItemOfItemLink(cxGrid1DBTableView1Totale).Index] then
    OutArguments.Value := SumTotale
  else
    if Arguments.SummaryItem = Arguments.SummaryItem.SummaryItems[ASender.ItemOfItemLink(cxGrid1DBTableView1Quote).Index] then
      OutArguments.Value := SumQuote;
end;

end.

unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxGridCustomTableView, cxGridTableView, cxControls, cxGridCustomView,
  StdCtrls, cxClasses, cxGridLevel, cxGrid, cxTextEdit, cxCalc;

type
  TForm2 = class(TForm)
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Button1: TButton;
    cxGrid1TableView1: TcxGridTableView;
    cxGrid1TableView1Column1: TcxGridColumn;
    cxGrid1TableView1Column2: TcxGridColumn;
    cxGrid1TableView1Column3: TcxGridColumn;
    cxGrid1TableView1Column4: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  Form2: TForm2;

implementation

uses cxExportGrid4Link, ShellAPI;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
    sXlsFile: String;
    tmp: Array[0..MAX_PATH] of Char;
begin
   GetTempPath(SizeOf(tmp), tmp);
   sXlsFile := IncludeTrailingBackslash(StrPas(tmp))+'test_export.xls';

   ExportGrid4ToExcel(sXlsFile, cxGrid1); //, True, True, False);

   ShellExecute(Application.Handle, 'OPEN', PChar(sXlsFile), nil, nil, SW_SHOWNORMAL);
end;

procedure TForm2.FormCreate(Sender: TObject);
var n: integer;
begin
   with cxGrid1TableView1 do
   begin
      with DataController do
      begin
         BeginFullUpdate;
         try
            RecordCount := 11;
            for n := 0 to 10 do
            begin
               Values[n, 0] := 'String '+IntToStr(n);
               Values[n, 1] := n;
               if n mod 2 = 0 then
               begin
                  Values[n, 2] := n;
                  Values[n, 3] := n;
               end
               else
               begin
                  Values[n, 2] := 'String '+IntToStr(n);
                  Values[n, 3] := 'String '+IntToStr(n);
               end;
            end;
         finally
            EndFullUpdate;
         end;
      end;
   end;
end;

end.
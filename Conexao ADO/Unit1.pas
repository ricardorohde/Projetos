unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls, Mask, DBCtrls,
  ComCtrls;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Panel1: TPanel;
    btnEditar: TButton;
    btnDelete: TButton;
    btnInsert: TButton;
    btnRefresh: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    ADOQuery1CODORG: TIntegerField;
    ADOQuery1NOMORG: TStringField;
    ADOQuery1CDSTATUS_ORGANIZACAO: TStringField;
    ADOQuery1CDOPERADOR_INCLUSAO: TStringField;
    ADOQuery1DTINCLUSAO: TDateTimeField;
    ADOQuery1CDSITUACAO: TStringField;
    ADOQuery1CDOPERADOR_ALTERACAO: TStringField;
    ADOQuery1DTALTERACAO: TDateTimeField;
    ADOQuery1SNGESTOR: TStringField;
    ADOQuery1CDPESSOA: TIntegerField;
    ADOQuery1LOGOTP: TBlobField;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    DBEdit9: TDBEdit;
    btnPost: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnDeleteClick(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.Connection := ADOConnection1;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('DELETE FROM ORGANIZACAO');
  ADOQuery1.SQL.Add('WHERE CODORG = 1');
  ADOQuery1.ExecSQL;
end;

procedure TForm1.btnEditarClick(Sender: TObject);
begin
//  ADOQuery1.Close;
//  ADOQuery1.Connection := ADOConnection1;
//  ADOQuery1.SQL.Clear;
//  ADOQuery1.SQL.Add('UPDATE [dbo].[ORGANIZACAO]SET ');
//  ADOQuery1.SQL.Add('	NOMORG = ''TESTE EDSON''');
//  ADOQuery1.SQL.Add('WHERE CODORG = 1');
//  ADOQuery1.ExecSQL;
  ADOQuery1.Edit;
  ADOQuery1NOMORG.AsString := 'TESTE 01';
  ADOQuery1.Post;
end;

procedure TForm1.btnInsertClick(Sender: TObject);
begin
  ADOQuery1.Insert;
  PageControl1.ActivePageIndex := 1;
//  ADOQuery1.Close;
//  ADOQuery1.Connection := ADOConnection1;
//  ADOQuery1.SQL.Clear;
//  ADOQuery1.SQL.Add('INSERT INTO [dbo].[ORGANIZACAO]');
//  ADOQuery1.SQL.Add('		(CODORG');
//  ADOQuery1.SQL.Add('		,NOMORG');
//  ADOQuery1.SQL.Add('		,CDSTATUS_ORGANIZACAO');
//  ADOQuery1.SQL.Add('		,LOGOTP');
//  ADOQuery1.SQL.Add('		,CDOPERADOR_INCLUSAO');
//  ADOQuery1.SQL.Add('		,DTINCLUSAO');
//  ADOQuery1.SQL.Add('		,CDSITUACAO');
//  ADOQuery1.SQL.Add('		,CDOPERADOR_ALTERACAO');
//  ADOQuery1.SQL.Add('		,DTALTERACAO');
//  ADOQuery1.SQL.Add('		,SNGESTOR');
//  ADOQuery1.SQL.Add('		,CDPESSOA)');
//  ADOQuery1.SQL.Add('	VALUES');
//  ADOQuery1.SQL.Add('		(1');
//  ADOQuery1.SQL.Add('		,''TESTE1''');
//  ADOQuery1.SQL.Add('		,''060ON''');
//  ADOQuery1.SQL.Add('		,NULL');
//  ADOQuery1.SQL.Add('		,''SYS''');
//  ADOQuery1.SQL.Add('		,''20140729''');
//  ADOQuery1.SQL.Add('		,''004A''');
//  ADOQuery1.SQL.Add('		,''SYS''');
//  ADOQuery1.SQL.Add('		,''20140729''');
//  ADOQuery1.SQL.Add('		,''S''');
//  ADOQuery1.SQL.Add('		,NULL)');
//  ADOQuery1.ExecSQL;
end;

procedure TForm1.btnPostClick(Sender: TObject);
begin
//  ADOQuery1.Prepared := True;
  ADOQuery1.Post;
  PageControl1.ActivePageIndex := 0;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  sl : TStringList;
  lNow : TDateTime;
begin
  PageControl1.ActivePageIndex := 0;
  sl := TStringList.Create;
  try
    sl.Add('SELECT CODORG');
    sl.Add('		, NOMORG');
    sl.Add('		, CDSTATUS_ORGANIZACAO');
    sl.Add('		, LOGOTP');
    sl.Add('		, CDOPERADOR_INCLUSAO');
    sl.Add('		, DTINCLUSAO');
    sl.Add('		, CDSITUACAO');
    sl.Add('		, CDOPERADOR_ALTERACAO');
    sl.Add('		, DTALTERACAO');
    sl.Add('		, SNGESTOR');
    sl.Add('		, CDPESSOA');
    sl.Add('FROM ORGANIZACAO');
//    sl.Add('where 1 =3');
    sl.Add('ORDER BY   NOMORG');

    lNow := Now;
    ADOQuery1.Close;
    ADOQuery1.Connection := ADOConnection1;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Assign(sl);
    ADOQuery1.Prepared := True;
    ADOQuery1.Open;
    lNow := lNow - Now;

//    ShowMessage('ADO  ' + FormatDateTime('hh:nn:zzz', lNow));

//    lNow := Now;
//    UniQuery1.Close;
//    UniQuery1.SQL.Clear;
//    UniQuery1.SQL.Assign(sl);
//    UniQuery1.Open;
//    lNow := lNow - Now;
//
//    ShowMessage('UNIDAC  ' + FormatDateTime('hh:nn:zzz', lNow));
  finally
    FreeAndNil(sl);
  end;
end;

end.

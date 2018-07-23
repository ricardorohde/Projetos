unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, DB, DBClient, xmldoc, StdCtrls,
  xmldom, XMLIntf, msxmldom;

type
  TForm1 = class(TForm)
    ClientDataSet1: TClientDataSet;
    ClientDataSet1IDMASTER: TIntegerField;
    ClientDataSet1DESCRICAO: TStringField;
    ClientDataSet2: TClientDataSet;
    ClientDataSet2ID: TIntegerField;
    ClientDataSet2IDMASTER: TIntegerField;
    ClientDataSet2DESCRICAO: TStringField;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBNavigator1: TDBNavigator;
    Button1: TButton;
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    function Teste(Node: IXMLNode): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function PosEx(const SubStr, S: AnsiString; Offset: Cardinal = 1): Integer;
var
  I,X: Integer;
  Len, LenSubStr: Integer;
begin
  if Offset = 1 then
    Result := Pos(SubStr, S)
  else
  begin
    I := Offset;
    LenSubStr := Length(SubStr);
    Len := Length(S) - LenSubStr + 1;
    while I <= Len do
    begin
      if S[I] = SubStr[1] then
      begin
        X := 1;
        while (X < LenSubStr) and (S[I + X] = SubStr[X + 1]) do
          Inc(X);
        if (X = LenSubStr) then
        begin
          Result := I;
          exit;
        end;
      end;
      Inc(I);
    end;
    Result := 0;
  end;
end;

function PosLast(const SubStr, S: AnsiString ): Integer;
Var P : Integer ;
begin
  Result := 0 ;
  P := Pos( SubStr, S) ;
  while P <> 0 do
  begin
     Result := P ;
     P := PosEx( String(SubStr), String(S), P+1) ;
  end ;
end ;

procedure TForm1.Button1Click(Sender: TObject);
var
  XML: IXMLDocument;
  i: Integer;
  Aux: string;
  PosSig, PosIni, PosFim: Integer;

  function RemoveEspacos( const AXML, TagIni, TagFim : String): String;
  begin
    Result := '';
    PosIni := PosLast(TagIni, AXML);
    if PosIni > 0 then
    begin
      PosFim := PosEx(TagFim, AXML, PosIni + 1);
      if PosFim > 0 then
        Result := copy(AXML, 1, PosIni - 1) +
                  StringReplace(copy(AXML, PosIni, PosFim-PosIni), ' ', '', [rfReplaceAll])+
                  copy(AXML, PosFim, Length(AXML));
    end;

    if Result = '' then
      Result := AXML;
  end;

begin
  try
    xml:= Txmldocument.Create(self);
    xml.LoadFromFile('C:\Edson\Nfse\Retorno\NFSe_201700000001740_4THG-I58C.xml');
    xml.Active:= True;


    Memo1.Lines.Add( Teste(xml.DocumentElement.ChildNodes[0]) );
    Memo1.Lines.SaveToFile('c:\edson.txt');
  finally
    xml:= nil;
  end;
end;

function TForm1.Teste(Node: IXMLNode ): string;
//var
//  NodeRec: IXMLNode;
begin
  if Node.HasChildNodes then
    Result:= Teste(Node.ChildNodes[0])
  else
    result:= result + Format('<%s>%s</%s>', [Node.NodeName, VarTostrDef(Node.NodeValue, ''),Node.NodeName]);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  ClientDataSet1.CreateDataSet;
  ClientDataSet2.CreateDataSet;

  ClientDataSet1.Append;
  ClientDataSet1IDMASTER.AsInteger := 1;
  ClientDataSet1DESCRICAO.AsString := 'RESGISTRO 1';
  ClientDataSet1.Post;

  ClientDataSet1.Append;
  ClientDataSet1IDMASTER.AsInteger := 2;
  ClientDataSet1DESCRICAO.AsString := 'RESGISTRO 2';
  ClientDataSet1.Post;

  ClientDataSet1.Append;
  ClientDataSet1IDMASTER.AsInteger := 3;
  ClientDataSet1DESCRICAO.AsString := 'RESGISTRO 3';
  ClientDataSet1.Post;

  ClientDataSet2.Append;
  ClientDataSet2ID.AsInteger := 1;
  ClientDataSet2IDMASTER.AsInteger := 1;
  ClientDataSet2DESCRICAO.AsString := 'PERTENCE AO REGISTRO 1';
  ClientDataSet2.Post;


  ClientDataSet2.Append;
  ClientDataSet2ID.AsInteger := 2;
  ClientDataSet2IDMASTER.AsInteger := 1;
  ClientDataSet2DESCRICAO.AsString := 'PERTENCE AO REGISTRO 1';
  ClientDataSet2.Post;

  ClientDataSet2.Append;
  ClientDataSet2ID.AsInteger := 3;
  ClientDataSet2IDMASTER.AsInteger := 1;
  ClientDataSet2DESCRICAO.AsString := 'PERTENCE AO REGISTRO 1';
  ClientDataSet2.Post;

  ClientDataSet2.Append;
  ClientDataSet2ID.AsInteger := 4;
  ClientDataSet2IDMASTER.AsInteger := 2;
  ClientDataSet2DESCRICAO.AsString := 'PERTENCE AO REGISTRO 2';
  ClientDataSet2.Post;


  ClientDataSet2.Append;
  ClientDataSet2ID.AsInteger := 5;
  ClientDataSet2IDMASTER.AsInteger := 2;
  ClientDataSet2DESCRICAO.AsString := 'PERTENCE AO REGISTRO 2';
  ClientDataSet2.Post;

  ClientDataSet2.Append;
  ClientDataSet2ID.AsInteger := 6;
  ClientDataSet2IDMASTER.AsInteger := 3;
  ClientDataSet2DESCRICAO.AsString := 'PERTENCE AO REGISTRO 3';
  ClientDataSet2.Post;
end;

end.

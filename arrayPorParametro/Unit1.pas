unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TMyRecord = record
    codigo : Integer;
    descricao : string;
  end;

  type TArrayMyRecord = array of TMyRecord;

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }

    procedure PassarArrayParametro(pArray : TArrayMyRecord);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  lArray : TArrayMyRecord;
  i : Integer;
begin
  SetLength(lArray, 101);

  for i := Low(lArray) to High(lArray) do
  begin
    lArray[i].codigo    := i;
    lArray[i].descricao := 'Descrição - '+ IntToStr(i);
  end;

  PassarArrayParametro(lArray);
end;

procedure TForm1.PassarArrayParametro(pArray: TArrayMyRecord);
var
  i : Integer;
begin
  Memo1.Lines.Clear;
  for i := Low(pArray) to High(pArray) do
  begin
    Memo1.Lines.Add(IntToStr(pArray[i].codigo) + ' - ' + pArray[i].descricao);
  end;
end;

end.

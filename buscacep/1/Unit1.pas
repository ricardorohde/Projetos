unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBuscarCEP, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  BuscarCEP: TBuscarCEP;
begin
  BuscarCEP := TBuscarCEP.Create('147Kg3iT');
  try
    if BuscarCEP.BuscaCEP(Edit1.Text) then
    begin
      Memo1.Lines.Clear;
      Memo1.Lines.Add(Format('CEP: %s', [BuscarCEP.CEP]));
      Memo1.Lines.Add(Format('%s', [BuscarCEP.Tipo_Logradouro]));
      Memo1.Lines.Add(Format('%s', [BuscarCEP.Logradouro]));
      Memo1.Lines.Add(Format('%s', [BuscarCEP.Cidade]));
      Memo1.Lines.Add(Format('%s', [BuscarCEP.UF]));
      Memo1.Lines.Add(Format('%d', [BuscarCEP.IBGE_UF]));
      Memo1.Lines.Add(Format('%d', [BuscarCEP.IBGE_Municipio]));
      Memo1.Lines.Add(Format('%d', [BuscarCEP.IBGE_Municipio_Verificador]));
    end;

  finally
    BuscarCEP.Free;
  end;
end;

end.

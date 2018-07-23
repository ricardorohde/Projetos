unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Uni, uLogin;

type
  TForm1 = class(TForm)
    UniConnection1: TUniConnection;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
begin
//  frmLogin := TfrmLogin.Create(Self, UniConnection1);
//  try
//    frmLogin.tpConexao := tcPostgres;
//    frmLogin.ShowModal;
//  finally
//    FreeAndNil(frmLogin);
//  end;
end;

end.

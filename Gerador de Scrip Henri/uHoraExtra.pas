unit uHoraExtra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DB, DBClient, Grids, DBGrids,
  cxShellBrowserDialog,FileCtrl,StrUtils;

type
  TAFD = record
    DtMovimentacao : TDateTime;
    HrMovimentacao : TTime;
  end;
  TfrmhoraExtra = class(TForm)
    Panel1: TPanel;
    edtArquivo: TEdit;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Label2: TLabel;
    Panel2: TPanel;
    btnExecutar: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    function GerarScrip(pArquivo : string) : boolean;
  public
    { Public declarations }
  end;

var
  frmhoraExtra: TfrmhoraExtra;

implementation

{$R *.dfm}

procedure TfrmhoraExtra.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edtArquivo.Text := OpenDialog1.FileName;
end;

procedure TfrmhoraExtra.btnExecutarClick(Sender: TObject);
begin
  if not GerarScrip(edtArquivo.Text)then
    ShowMessage('Arquivo Invalido.Verifique!')
  else
    ShowMessage('Sucesso!!!');
end;

procedure TfrmhoraExtra.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = chr(13) then
  begin
    if not (activeControl is TMemo) then
    begin
      selectnext(activeControl,true,true);
      Key := chr(0);
    end;
  end;
end;

function TfrmhoraExtra.GerarScrip(pArquivo : string) : boolean;
var lcStringList1,               //Pega o arquivo texto
    lcStringList2 : TStringList; //responsável pelo retorno
    lcCodigo,
    lcPis,
    lcNome,
    lcLinha : string;
    i : integer;
begin
  result := false;
  lcStringList1 := TStringList.Create;
  lcStringList2 := TStringList.Create;
  try
    if (pArquivo <> '') and FileExists(pArquivo) then
    begin
      lcStringList1.LoadFromFile(pArquivo);

      for i := 0 to lcStringList1.Count - 1 do
      begin
        lcLinha  := lcStringList1.Strings[i];

        if (Length(lcLinha) = 84) then
        begin
          lcCodigo := Copy(lcLinha,1,20);
          lcPis    := Copy(lcLinha,21,12);
          lcNome   := Copy(lcLinha,33,52);
          lcStringList2.Add('INSERT INTO HE02 (HE02_ST_MATRICULA, HE02_ST_PIS, HE02_ST_NOME) VALUES ('+QuotedStr(lcCodigo)+','+QuotedStr(lcPis)+','+QuotedStr(UpperCase(TrimRight(lcNome)))+')');
          result := True;
        end;
      end;
    end;
  finally
    if result then
      lcStringList2.SaveToFile(ExtractFilePath(pArquivo)+ 'SCRIPT_HENRY.txt');
      
    FreeAndNil(lcStringList1);
    FreeAndNil(lcStringList2);
  end;
end;

procedure TfrmhoraExtra.Button2Click(Sender: TObject);
begin
  {INSERT INTO HE02 (HE02_ST_MATRICULA, HE02_ST_PIS, HE02_ST_NOME) VALUES ('00000000000000000012','012345678901','FUNCIONARIO TESTE');}
  showMessage('Código Funcionário com 20 digitos (Completar com zeros a Esquerda)'+ #13#10+
              'Pis do Funcionário com 12 digitos (Completar com zeros a Esquerda)'+ #13#10+
              'Nome do Funcionário com 52 digitos')
end;

end.

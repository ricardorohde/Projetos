unit uAdicionarMov;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask;

type
  TfrmAdicionarMov = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnAdicionar: TButton;
    btnCancelar: TButton;
    Label1: TLabel;
    edtData: TMaskEdit;
    edtHora1: TMaskEdit;
    edtHora2: TMaskEdit;
    edtHora3: TMaskEdit;
    edtHora4: TMaskEdit;
    edtHora5: TMaskEdit;
    edtHora6: TMaskEdit;
    edtHora7: TMaskEdit;
    edtHora8: TMaskEdit;
    edtHora9: TMaskEdit;
    edtHora10: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label5: TLabel;
    edtPIS: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Procedure Adicionar_Mov;
    function Empty(pValue : string) : boolean;
  public
    { Public declarations }
  end;

var
  frmAdicionarMov: TfrmAdicionarMov;

implementation

uses uAFD, DBClient, DB;

{$R *.dfm}

procedure TfrmAdicionarMov.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmAdicionarMov.btnAdicionarClick(Sender: TObject);
begin
  if (edtPIS.Text <> '') and (StringReplace(edtData.Text,'/','',[rfReplaceAll]) <> '') then
    begin
      Adicionar_Mov;
      close;
    end
  else
    begin
      ShowMessage('o PIS e a Data não foram preenchidos corretamente.Verifique');
      abort;
    end;
end;

procedure TfrmAdicionarMov.Adicionar_Mov;
var
   lcNSR : array[1..10] of string;
   i : integer;
begin
  frmAFD.client.Last;
  for i := 1 to 10 do
  begin
    if not Empty(frmAFD.client.FieldByName('NSR' + IntToStr(i)).AsString) then
      lcNSR[i] := frmAFD.StrZero(IntToStr(frmAFD.client.FieldByName('NSR' + IntToStr(i)).asinteger + 1),9);
  end;

  frmAFD.client.Append;
  frmAFD.clientPIS.AsString            := edtPIS.Text;
  frmAFD.clientDtMovimentacao.AsString := edtData.Text;
  if not Empty(edtHora1.Text) then
  begin
    frmAFD.clientHrMovimentacao1.AsString := edtHora1.Text;
    frmAFD.clientNSR1.AsString            := lcNSR[1];
  end;
  if not Empty(edtHora2.Text) then
  begin
    frmAFD.clientHrMovimentacao2.AsString := edtHora2.Text;
    frmAFD.clientNSR2.AsString            := lcNSR[2];
  end;

  if not Empty(edtHora3.Text) then
  begin
    frmAFD.clientHrMovimentacao3.AsString := edtHora3.Text;
    frmAFD.clientNSR3.AsString            := lcNSR[3];
  end;

  if not Empty(edtHora4.Text) then
  begin
    frmAFD.clientHrMovimentacao4.AsString := edtHora4.Text;
    frmAFD.clientNSR4.AsString            := lcNSR[4];
  end;

  if not Empty(edtHora5.Text) then
  begin
    frmAFD.clientHrMovimentacao5.AsString := edtHora5.Text;
    frmAFD.clientNSR5.AsString            := lcNSR[5];
  end;

  if not Empty(edtHora6.Text) then
  begin
    frmAFD.clientHrMovimentacao6.AsString := edtHora6.Text;
    frmAFD.clientNSR6.AsString            := lcNSR[6];
  end;

  if not Empty(edtHora7.Text) then
  begin
    frmAFD.clientHrMovimentacao7.AsString := edtHora7.Text;
    frmAFD.clientNSR7.AsString            := lcNSR[7];
  end;

  if not Empty(edtHora8.Text) then
  begin
    frmAFD.clientHrMovimentacao8.AsString := edtHora8.Text;
    frmAFD.clientNSR8.AsString            := lcNSR[8];
  end;

  if not Empty(edtHora9.Text) then
  begin
    frmAFD.clientHrMovimentacao9.AsString := edtHora9.Text;
    frmAFD.clientNSR9.AsString            := lcNSR[9];
  end;

  if not Empty(edtHora10.Text) then
  begin
    frmAFD.clientHrMovimentacao10.AsString := edtHora10.Text;
    frmAFD.clientNSR10.AsString            := lcNSR[10];
  end;

  frmAFD.client.Post;
end;

procedure TfrmAdicionarMov.FormShow(Sender: TObject);
begin
  if not Empty(frmAFD.edtPIS.Text) then
    edtPIS.Text := frmAFD.edtPIS.Text;
end;

function TfrmAdicionarMov.Empty(pValue : string) : boolean;
begin
  result := trim(StringReplace(pValue,':','',[rfReplaceAll])) = '';
end;


procedure TfrmAdicionarMov.FormKeyPress(Sender: TObject; var Key: Char);
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

end.

(*
  Autor: Walfrido César Cintra;
  Email: walfridocesar@hotmail.com
  Observação: esse exemplo foi baseado no webservice do REPÚBLICA VIRTUAL
  Se alguém melhorar o código com novas idéias me mande uma cópia

*)

unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, xmldom, XMLIntf, msxmldom, XMLDoc,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TForm1 = class(TForm)
    ECEP: TEdit;
    RichEdit1: TRichEdit;
    Label1: TLabel;
    IdHTTP: TIdHTTP;
    XMLBuscaCEP: TXMLDocument;
    edtLogradouro: TEdit;
    edtBairro: TEdit;
    edtCidade: TEdit;
    Button1: TButton;
    Label2: TLabel;
    procedure ECEPKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  TSConsulta: TStringList;
implementation

{$R *.dfm}

procedure TForm1.ECEPKeyPress(Sender: TObject; var Key: Char);
begin
     if not (Key in ['0'..'9', #8]) then
        Key := #0;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
   Consulta: String;
   Resposta: TStringStream;
begin
     if (ECEP.Text = '') or (Length(ECEP.Text) < 8) or  (Length(ECEP.Text) > 8) then
     begin
        Application.MessageBox('CEP nulo ou inválido.', 'Erro - Aviso do Sistema', mb_iconwarning+mb_ok);
        exit;
     end;
     RichEdit1.Clear;
     Resposta   := TStringStream.Create('');
     TSConsulta := TStringList.Create;
     IdHTTP.Request.UserAgent:='Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV2';
     TSConsulta.Values['&cep']  := ECEP.Text;
     TSConsulta.Values['&formato']  := 'xml';

     //TSConsulta.Values['&formato']  := 'query_string';
     IdHTTP.Post('http://cep.republicavirtual.com.br/web_cep.php?', TSConsulta, Resposta);
     XMLBuscaCEP.Active := True;
     XMLBuscaCEP.Encoding := 'iso-8859-1';
     XMLBuscaCEP.LoadFromStream(Resposta);

     //RichEdit1.Lines.Add(Resposta.DataString);

     RichEdit1.Lines.Add('Tipo de logradouro: '+XMLBuscaCEP.DocumentElement.ChildNodes['tipo_logradouro'].NodeValue);
     RichEdit1.Lines.Add('Logradouro: '+#9+XMLBuscaCEP.DocumentElement.ChildNodes['tipo_logradouro'].NodeValue+' '+XMLBuscaCEP.DocumentElement.ChildNodes['logradouro'].NodeValue);
     edtLogradouro.Text := XMLBuscaCEP.DocumentElement.ChildNodes['tipo_logradouro'].NodeValue+' '+XMLBuscaCEP.DocumentElement.ChildNodes['logradouro'].NodeValue;

     RichEdit1.Lines.Add('Bairro: '+#9+#9+XMLBuscaCEP.DocumentElement.ChildNodes['bairro'].NodeValue);
     edtBairro.Text := XMLBuscaCEP.DocumentElement.ChildNodes['bairro'].NodeValue;

     RichEdit1.Lines.Add('Município: '+#9+XMLBuscaCEP.DocumentElement.ChildNodes['cidade'].NodeValue);
     edtCidade.Text := XMLBuscaCEP.DocumentElement.ChildNodes['cidade'].NodeValue;

     RichEdit1.Lines.Add('UF: '+#9+#9+XMLBuscaCEP.DocumentElement.ChildNodes['uf'].NodeValue);
     TSConsulta.Free;
     Resposta.Free;
     XMLBuscaCEP.Active := False;

end;

end.

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StrUtils, Dialogs, StdCtrls, ExtCtrls, OleCtrls, SHDocVw, Buttons, MSHTML,
  Alterdata, WinInet, ppViewr, DBCtrls, ComCtrls, IdComponent, AltStatus, DB,
  DBClient, cxPC, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxGraphics, rxStrHlder, Menus, ActnList, ActiveX;

type
  TForm1 = class(TForm)
    WebBrowser1: TWebBrowser;
    ArquivoJavascript: TStrHolder;
    Panel1: TPanel;
    Button1: TButton;
    procedure btnIrClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FDocument    : IHTMLDocument2;
    FHTMLWindow  : IHTMLWindow2;
    FElements    : IHTMLElementCollection;
    FItemElement : IHTMLElement;
      
    procedure PreencherSenha;
    function Javascript(): OleVariant;
    procedure InjetarArquivoJavascript;
    function ExecuteScript(Script: string): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnIrClick(Sender: TObject);
begin
//  if edtEndereco.Text <> '' then
//    webbrowser1.Navigate(edtEndereco.Text);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
//  edtEndereco.Text := 'http://www8.receita.fazenda.gov.br/SimplesNacional/controleAcesso/Autentica.aspx?id=8';
  webbrowser1.Navigate('https://webmail.alterdata.com.br/WorldClient.dll');
  //PreencherSenha;
end;


function TForm1.Javascript: OleVariant;
begin
  FDocument   := WebBrowser1.Document as IHTMLDocument2;
  FHTMLWindow := FDocument.parentWindow;
  Result      := OleVariant(FHTMLWindow);
end;

procedure TForm1.PreencherSenha;
begin

  //FHTMLWindow := FDocument.parentWindow as IHTMLWindow2;

  //FHTMLWindow.execScript('$("#passwordTranslationString").Value = "edson_feso@hotmail.com"', 'JavaScript');
  //ExecuteScript('$("#passwordTranslationString").Value = "edson_feso@hotmail.com"');
  ExecuteScript('document.getElementById("passwordTranslationString").Value = ''teste''');
end;

procedure TForm1.InjetarArquivoJavascript();
begin
end;

function TForm1.ExecuteScript(Script: string): Boolean;
var
  Win: IHTMLWindow2;
  Olelanguage: Olevariant;
begin
  FDocument := WebBrowser1.Document as IHTMLDocument2;
  if Assigned(FDocument) then
    begin
      try
        Win := FDocument.parentWindow;
        if Assigned(Win) then
          begin
            try
              Olelanguage := 'JavaScript';
              Win.ExecScript(Script, Olelanguage);
            finally
              Win :=  nil;
            end;
          end;
      finally
        FDocument := nil;
      end;
    end;
end;
procedure TForm1.Button1Click(Sender: TObject);
begin
  PreencherSenha;
end;

end.

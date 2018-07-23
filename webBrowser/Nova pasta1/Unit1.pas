unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, SHDocVw, ExtCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    WebBrowser1: TWebBrowser;
    Panel1: TPanel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
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

procedure TForm1.FormCreate(Sender: TObject);
begin
WebBrowser1.Navigate('https://www8.receita.fazenda.gov.br/SimplesNacional/controleacesso/autentica.aspx?id=6');
end;

procedure TForm1.Button1Click(Sender: TObject);
//begin
//Memo1.Text :=
//WebBrowser1.OleObject.Document.frames.item(0).document.forms.Item(0).Item(0).Value:= '06/2013';
// webbrowser1.OleObject.Document.frames.item(('UIFrame')).Document.GetElementbyclass(('RichTextEditor_surface')).innerHTML:= '';
var
  g, f, k : integer;
  pDispatch : IDISPATCH;
//  textarea: IHTMLTextAreaElement;
begin
  for f := 0 to WebBrowser1.OleObject.Document.frames.Length - 1 do
    begin
      showmessage(intToStr(WebBrowser1.OleObject.Document.frames.item(f).document.Forms.Length));
//        for g := 0 to WebBrowser1.OleObject.Document.frames.item(f).document.Forms.Length-1 do
//          begin
//             for k := 0 to WebBrowser1.OleObject.Document.frames.item(f).document.forms.item(g).elements.length-1 do
//              begin
//                showmessage(WebBrowser1.OleObject.Document.frames.item(f).document.forms.item(g).elements.item(k).name);
//                showmessage(WebBrowser1.OleObject.Document.frames.item(f).document.forms.item(g).elements.item(k).tagname);
//                showmessage(WebBrowser1.OleObject.Document.frames.item(f).document.forms.item(g).elements.item(k).type);
//                {Fill text field}
//                WebBrowser1.OleObject.Document.frames.item(f).document.forms.item(g).elements.item('name').value := 'Bob';
//                {Fill in a text area}
//                pDispatch := WebBrowser1.OleObject.Document.frames.item(2).document.forms.item(0).elements.item('S1', 0);
//                  try
//                    OleCheck(pDispatch.QueryInterface(IID_IHTMLTextAreaElement, textarea));
//                    textarea.Set_value('Hello');
//                  except
//                  end;
//              end;
//          end;
    end;
end;

end.

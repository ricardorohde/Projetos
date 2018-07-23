unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, SHDocVw, ExtCtrls, MSHTML, ComObj, ComCtrls, ActiveX;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    WebBrowser1: TWebBrowser;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
  textarea: IHTMLTextAreaElement;

begin
  for f := 0 to WebBrowser1.OleObject.Document.frames.Length - 1 do
    begin
      showmessage(intToStr(WebBrowser1.OleObject.Document.frames.item(f).document.Length));
        for g := 0 to WebBrowser1.OleObject.Document.frames.item(f).document.Length-1 do
          begin
             for k := 0 to WebBrowser1.OleObject.Document.frames.item(f).document.item(g).elements.length-1 do
              begin
                showmessage(WebBrowser1.OleObject.Document.frames.item(f).document.item(g).elements.item(k).name);
                showmessage(WebBrowser1.OleObject.Document.frames.item(f).document.item(g).elements.item(k).tagname);
                showmessage(WebBrowser1.OleObject.Document.frames.item(f).document.item(g).elements.item(k).type);
                {Fill text field}
                WebBrowser1.OleObject.Document.frames.item(f).document.forms.item(g).elements.item('name').value := 'Bob';
                {Fill in a text area}
//                pDispatch := WebBrowser1.OleObject.Document.frames.item(2).document.forms.item(0).elements.item('S1', 0);
//                  try
//                    OleCheck(pDispatch.QueryInterface(IID_IHTMLTextAreaElement, textarea));
//                    textarea.Set_value('Hello');
//                  except
//                  end;
              end;
          end;
    end;
end;

//function GetFrameByID(ABrowser:TWebBrowser;aFrameID: integer): IHTMLDocument2;
//var
//  searchdoc : IHTMLDocument2; // temporarily holds the resulting page
//  i         : integer;  // IDcount
//  FoundIt : boolean
//
//  // This is the inner recursive portion of the function
//  function Enum(AHTMLDocument:IHTMLDocument2;aFrameID:integer):boolean;
//  var
//     OleContainer: IOleContainer;
//     EnumUnknown: IEnumUnknown;
//     Unknown: IUnknown;
//     Fetched: LongInt;
//     WebBrowser: IWebBrowser;
//     i : integer;
//     FBase     : IHTMLFrameBase;
//  begin
//     inc(i);
//     Result:=True;
//     if not Assigned(AHtmlDocument) then Exit;
//     if not Supports(AHtmlDocument, IOleContainer, OleContainer) then Exit;
//     if Failed(OleContainer.EnumObjects(OLECONTF_EMBEDDINGS, EnumUnknown)) then 
//     Exit;
//
//     while (EnumUnknown.Next(1, Unknown, @Fetched)=S_OK) do
//     begin
//       if Supports(Unknown, IHTMLFrameBase, FBase) then
//       begin
//         // Here we ask if we have the right Frame
//         if i = aFrameID then
//         begin
//           if Supports(Unknown, IWebBrowser, WebBrowser) then
//           begin
//             searchdoc := (WebBrowser.Document as IHTMLDocument2);
//             FoundIt := true;
//             exit;
//           end;
//         end;
//       end;
//       if NOT (FoundIt) then
//       begin
//         if Supports(Unknown, IWebBrowser, WebBrowser) then
//         begin
//           Result:=Enum((WebBrowser.Document as IHtmlDocument2),aFrameName);
//           if not Result then Exit;
//         end;
//       end else exit;
//     end;
//  end;
//
//begin
//  i := -1;
//  result := nil; // just in case
//  Enum((ABrowser.Document as IHTMLDocument2),aFrameID);
//  if FoundIt then
//    result := searchdoc
//  else
//    result := nil; 
//end;

function GetFrameByName(ABrowser:TWebBrowser;aFrameName: string): IHTMLDocument2;
var
  searchdoc : IHTMLDocument2; // temporarily holds the resulting page
  FoundIt : boolean; // Flag if we found the right Frame

  // This is the inner recursive portion of the function
  function Enum(AHTMLDocument:IHTMLDocument2;aFrameName:string):boolean;
  var
     OleContainer: IOleContainer;
     EnumUnknown: IEnumUnknown;
     Unknown: IUnknown;
     Fetched: LongInt;
     WebBrowser: IWebBrowser;
     FBase     : IHTMLFrameBase;
     i : integer;
  begin
     inc(i);
     Result:=True;
     if not Assigned(AHtmlDocument) then Exit;
     if not Supports(AHtmlDocument, IOleContainer, OleContainer) then Exit;
     Failed(OleContainer.EnumObjects(OLECONTF_EMBEDDINGS, EnumUnknown));
     //Exit;

    while (EnumUnknown.Next(1, Unknown, @Fetched)=S_OK) do
    begin
     if Supports(Unknown, IHTMLFrameBase, FBase) then
     begin
       // Here we ask if we have the right Frame
       //if i = aFrameID then
//       if LowerCase(FBase.name) = LowerCase(aFrameName) then
       begin
         if Supports(Unknown, IWebBrowser, WebBrowser) then
         begin
           searchdoc := (WebBrowser.Document as IHTMLDocument2);
           FoundIt := true;
           exit;
         end;
       end;
     end;
     if NOT (FoundIt) then
     begin
       if Supports(Unknown, IWebBrowser, WebBrowser) then
       begin
         Result:=Enum((WebBrowser.Document as IHtmlDocument2),aFrameName);
         if not Result then Exit;
       end;
     end else exit;
    end;

//
//     Result:=True;
//     if not Assigned(AHtmlDocument) then Exit;
//     if not Supports(AHtmlDocument, IOleContainer, OleContainer) then Exit;
//     if Failed(OleContainer.EnumObjects(OLECONTF_EMBEDDINGS, EnumUnknown)) then
//     Exit;

//     while (EnumUnknown.Next(1, Unknown, @Fetched)=S_OK) do
//     begin
//       if Supports(Unknown, IHTMLFrameBase,FBase) then
//       begin
//         // Here we ask if we have the right Frame
//         if LowerCase(FBase.name) = LowerCase(aFrameName) then
//         begin
//           if Supports(Unknown, IWebBrowser, WebBrowser) then
//           begin
//             searchdoc := (WebBrowser.Document as IHTMLDocument2);
//             FoundIt:=true;
//             exit;
//           end;
//         end;
//       end;
//       if NOT (FoundIt) then
//       begin
//         if Supports(Unknown, IWebBrowser, WebBrowser) then
//         begin
//           Result:=Enum((WebBrowser.Document as IHtmlDocument2),aFrameName);
//           if not Result then Exit;
//         end;
//       end else exit;
//     end;
  end;

begin
  FoundIt := false;
  result := nil; // just in case
  Enum((ABrowser.Document as IHTMLDocument2),aFrameName);
  if FoundIt then 
    result := searchdoc
  else
    result := nil;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  FDocument,
  FDocumentFrame : IHTMLDocument2;
  FElements,
  FElements2,
  FElementsFrame : IHTMLElementCollection;
  FItemLength,
  FItemLength2,
  j, i: integer;
  FItemElement,
  FItemElement2: IHTMLElement;
  teste : IHTMLFrameBase;
begin
  FDocumentFrame := GetFrameByName(WebBrowser1,'IFrame');

  FElements := FDocumentFrame.all;

  Memo1.Lines.Clear;
  for i:=0 to FElements.length-1 do
    begin
      FItemElement:= FElements.item(i, 0) as IHTMLElement;

      //showmessage(FItemElement.className);
      if not (FItemElement.className = '') then
        Memo1.Lines.Add(FItemElement.className);
    end;

//  showmessage(FDocumentFrame.toString);


  //FDocument := WebBrowser1.Document as IHTMLDocument2;
  //FElements := FDocument.all.tags('IFrame') as IHtmlElementCollection;

  //showmessage(teste.);

{
  FItemLength := FElements.length;
  for i := 0 to FItemLength -1 do
    begin
      //FElementsFrame := FElements.item(i, 0) as IHtmlElementCollection;
      teste := FElements2.item(j, 0) as IHTMLFramesCollection2;

      //FDocumentFrame := FItemElement.all  as IHTMLDocument2;
      //showmessage(IntToStr(FElementsFrame.length));
//      teste.

//      FItemElement.getAttribute('INPUT',0)

//      FElements2:= FItemElement.all.tags('INPUT') as IHtmlElementCollection;
      FItemLength2:= FElements2.length;
      for j:= 0 to FItemLength2-1 do
        begin
          FItemElement2:= FElements2.item(j, 0) as IHTMLElement;
        end;
    end;
    }
end;

end.

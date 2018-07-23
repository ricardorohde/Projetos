unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, xmldom, XMLIntf, msxmldom, XMLDoc, ExtCtrls;

type
  TForm1 = class(TForm)
    Memo: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    function LerTag(const Strtag: String): String;
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
  vXMLDoc: TXMLDocument;
  NodeRec: IXMLNode;
  recibo, datahora: WideString;
begin
  vXMLDoc := TXMLDocument.Create(self);
  vXMLDoc.LoadFromFile('C:\Edson\Projetos\xml\xmls\852350_NFSeNotaFiscaldeServiçosEletrônica_000354.xml'); //Le Arquivo Recibo XML');
  Memo.lines.Clear;

  // Campo memo para o exemplo
  Memo.lines.Add( '-------------------------------------------------');
  Memo.lines.Add( VXMLDoc.XML.Text +#13+#13 ); 
  
  // Prepara para ler os dados da tag "infRec" 
  NodeRec := vXMLDoc.DocumentElement.ChildNodes.FindNode('infRec'); 
  // Lendo os campos da tag infRec 
(*  recibo := NodeRec.ChildNodes['nRec'].text;     // posso ler assim
  datahora := NodeRec.ChildNodes['dhRecbto'].text;

  // adiciona os dados no Memo (apenas exemplo)
  if recibo <> '' then
  begin
    Memo.Lines.Add('-----------------------------------------------');
    Memo.Lines.Add( recibo+' ---- '+datahora );
  end;*)
end;


function TForm1.LerTag(const Strtag: String): String;
var
  stPath:String;
  i,x,j:integer; 
  xmlD:IXmlDocument; //Pela explicaçção dada acima 
  Node,NodeChild,NodeAux:IXmlNode; 
  OpenD: TOpenDialog;
begin 

  if trim(StrTag) = '' then
  begin
   Showmessage('Digite o Nome da Tag '); 
   abort; 
  end; 
  x:=0; 
  try 
    OpenD:=TOpenDialog.Create(nil); 
    openD.Filter:='*Xml|*.Xml'; 
    OpenD.InitialDir:=ExtractFilePath(application.ExeName); 
    if not openD.Execute then 
       abort; 
        stPath:=openD.FileName; 
        xmlD:=TXmlDocument.Create(stPath);//declarado com a String 
        try 
          XmlD.FileName:=stPath; 
          XmlD.Active:=true; 
          for i := 0 to XmlD.DocumentElement.ChildNodes.Count - 1 do 
            begin 
              Node:=XmlD.DocumentElement.ChildNodes[I]; 
              if Node.NodeName = Trim(StrTag) then 
                begin 
                  if not VarIsNull(Node.NodeValue) then 
                    begin 
                      result:=VarToStr(Node.NodeValue); 
                      Inc(x); 
                    end; 
                 end 
              else 
                begin 
                  for j := 0 to Node.ChildNodes.Count - 1 do 
                    begin 
                      NodeChild:=Node.ChildNodes[j]; 
                      NodeAux:=NodeChild.ChildNodes.FindNode(StrTag); 
                      if Assigned(NodeAux) then 
                        begin 
                          if not VarIsNull(NodeAux.NodeValue) then 
                            begin 
                              result:=VarToStr(NodeAux.NodeValue); 
                              Inc(x) 
                            end; 
                        end; 
                    end; 
                end; 
            if x = 0  then 
              abort; 
          end; 
      except 
         on e:exception do 
         begin 
          Showmessage('Problemas ao ler o Tag'+#13+ 
              'Mensagem Original = '+e.Message); 
          Abort; 
         end; 
       end; 
  finally
      OPenD.Free; 
     // XmlD.Free; por ser Interface 
  end;
end;
end.

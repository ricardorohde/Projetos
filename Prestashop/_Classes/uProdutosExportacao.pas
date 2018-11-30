unit uProdutosExportacao;

interface

uses System.Classes, System.SysUtils, Vcl.Forms, Dialogs, {System.Contnrs,}
  DBXJSON, DBXJsonReflect, uWebServiceHttp, xmldom, XMLIntf, msxmldom, XMLDoc,
  StrUtils, msxml, System.Types, System.Variants, DBClient, mshtml, ActiveX,
  ComObj, Generics.Collections, uPedido, LIB, uProduto, uAcessoSite,

  //firedac
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;
  type
    TProdutosExp = class(TAcessoSite)
  private

      Procedure AddProduto(Produto: TProduto);
    public
      procedure BeforeDestruction; override;
      procedure AfterConstruction; override;

      procedure ExportarProdutos();
      function Add: TProdutosExp;
    end;

implementation

uses Module;

{ TProdutos }

function TProdutosExp.Add: TProdutosExp;
begin
  Result:= TProdutosExp.Create;
end;

procedure TProdutosExp.AddProduto(Produto: TProduto);
var
  lsProduto: string;
  lsQuantidade: string;
  lsKey: string;
begin
  lsProduto:= Format('&product=%s', [produto.Codigosite]);
  lsQuantidade:= Format('&qtd=%s', [FloatToStr(produto.QuantidadeBase)]);
  lsKey:= Format('&key=%s', ['XTM4T52R7EKV1557DGYMTVZCDWG78KGT']);
  PostXML(Format('/actions/erp_stock.php?set=export%s', [lsProduto + lsQuantidade + lsKey]))
end;

procedure TProdutosExp.AfterConstruction;
begin
  inherited;

end;

procedure TProdutosExp.BeforeDestruction;
begin
  inherited;

end;

procedure TProdutosExp.ExportarProdutos();
var
  Qry: TFDQuery;
  Produto: TProduto;
begin
  with DataModule1 do
  begin
    try
      Qry:= TFDQuery.Create(nil);
      Qry.Close;
      Qry.Connection:= Conexao;
      Qry.SQL.Clear;
      Qry.SQL.Text:= 'SELECT P.*, C.MCL_CHAVE AS NCM FROM PRODUTO P LEFT JOIN MCL_GET_CHAVE C ON (C.GET_CHAVE = P.IDNCM AND C.TABELA = ''ncm'') ';
      Qry.Open;

      while not Qry.Eof do
      begin
        try
          Produto:= Produto.Add;
          Produto.Codigosite:= Qry.FieldByName('idproduto').AsString;
          Produto.NCM:= Qry.FieldByName('NCM').AsString;
          Produto.Nome:= Qry.FieldByName('NMPRODUTO').AsString;
          Produto.CodigoBarrasUPC:= Qry.FieldByName('codbarra').AsString;
          Produto.Status:= Qry.FieldByName('flgativo').AsString;
          Produto.PrecoCusto1:= Qry.FieldByName('precocusto').AsFloat;
          Produto.PrecoVenda1:= Qry.FieldByName('precovenda').AsFloat;
          AddProduto(Produto);
        finally
          FreeAndNil( Produto );
        end;
        qry.Next;
      end;
    finally
      FreeAndNil( Qry );
    end;
  end;
end;

end.

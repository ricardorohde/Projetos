unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, StrUtils;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    edtArquivo: TEdit;
    btnArquivo: TButton;
    OpenDialog1: TOpenDialog;
    Panel2: TPanel;
    btnOk: TButton;
    btnCancelar: TButton;
    Memo1: TMemo;
    procedure btnArquivoClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
//    FReg10 : TRegistro10;
//    FReg11 : TRegistro11;
//    FReg50 : TRegistro50;

    procedure LerArquivo();
    procedure LerRegistro10(plinha: string);
    procedure LerRegistro11(plinha: string);
    procedure LerRegistro50(plinha: string);
    procedure LerRegistro51(plinha: string);
    procedure LerRegistro60M(plinha: string);
    procedure LerRegistro60A(plinha: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses uInterfaceBase, uRegistro51, uRegistro60I, uRegistro60A, uRegistro60M,
     uListaInterfaceBase, uRegistro10, uRegistro11, uRegistro50;

{$R *.dfm}

procedure TForm1.btnArquivoClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edtArquivo.Text := OpenDialog1.FileName;
end;

procedure TForm1.LerArquivo();
var
  Arquivo : TextFile;
  lsLinha : string;
begin
  AssignFile(Arquivo, edtArquivo.Text);
  {$I-}
  Reset(Arquivo);
  {$I+}
//  Rewrite(arq) { arquivo não existe e será criado }
  while (not Eof(Arquivo)) do
  begin
    Readln(Arquivo, lsLinha);

    case StrToIntDef(Copy(lsLinha, 1, 2), -1) of
      10 : LerRegistro10(lsLinha);
      11 : LerRegistro11(lsLinha);
      50 : LerRegistro50(lsLinha);
      51 : LerRegistro51(lsLinha);
      60 :
          case AnsiIndexStr(UpperCase(Copy(lsLinha, 3, 1)), ['M', 'A', 'I']) of
            0 : LerRegistro60M(lsLinha);
            1 : LerRegistro60A(lsLinha);
//            2 : LerRegistro51(linha);
          end;
    end;
  end;
end;

procedure TForm1.LerRegistro10(plinha : string);
begin
  GetRegistro10.Prop['CNPJ']                           := Copy(plinha, 3,  14);
  GetRegistro10.Prop['INSCRICAO_ESTADUAL']             := Copy(plinha, 17, 14);
  GetRegistro10.Prop['NOME_CONTRIBUINTE']              := Copy(plinha, 31, 35);
  GetRegistro10.Prop['MUNICIPIO']                      := Copy(plinha, 66, 30);
  GetRegistro10.Prop['UNIDADE_FEDERACAO']              := Copy(plinha, 96, 2);
  GetRegistro10.Prop['FAX']                            := Copy(plinha, 98, 10);
  GetRegistro10.Prop['DATA_INICIAL']                   := Copy(plinha, 108, 8);
  GetRegistro10.Prop['DATA_FINAL']                     := Copy(plinha, 116, 8);
  GetRegistro10.Prop['IDENTIFICACAO_ARQUIVO']          := Copy(plinha, 124, 1);
  GetRegistro10.Prop['IDENTIFICACAO_CONVENIO']         := Copy(plinha, 124, 1);
  GetRegistro10.Prop['IDENTIFICACAO_NATUREZA_OPERACAO']:= Copy(plinha, 125, 1);
  GetRegistro10.Prop['CODIGO_FINALIDADE']              := Copy(plinha, 126, 1);
end;

procedure TForm1.LerRegistro11(plinha : string);
begin
  GetRegistro11.Prop['LOGRADOURO'  ] := Copy(plinha, 3,  34);
  GetRegistro11.Prop['NUMERO'      ] := Copy(plinha, 37, 5);
  GetRegistro11.Prop['COMPLEMENTO' ] := Copy(plinha, 42, 22);
  GetRegistro11.Prop['BAIRRO'      ] := Copy(plinha, 64, 15);
  GetRegistro11.Prop['CEP'         ] := Copy(plinha, 79, 8);
  GetRegistro11.Prop['NOME_CONTATO'] := Copy(plinha, 87, 28);
  GetRegistro11.Prop['TELEFONE'    ] := Copy(plinha, 115,12);
end;

procedure TForm1.LerRegistro50(plinha : string);
begin
  GetRegistro50.Prop['CNPJ'                ] := Copy(plinha, 3,   14);
  GetRegistro50.Prop['DATA_EMISSAO'        ] := Copy(plinha, 17,  14);
  GetRegistro50.Prop['INSCRICAO_ESTADUAL'  ] := Copy(plinha, 31,  8);
  GetRegistro50.Prop['UNIDADE_FEDERACAO'   ] := Copy(plinha, 39,  2);
  GetRegistro50.Prop['MODELO'              ] := Copy(plinha, 41,  2);
  GetRegistro50.Prop['SERIE'               ] := Copy(plinha, 43,  3);
  GetRegistro50.Prop['NUMERO'              ] := Copy(plinha, 46,  6);
  GetRegistro50.Prop['CFOP'                ] := Copy(plinha, 52,  4);
  GetRegistro50.Prop['EMITENTE'            ] := Copy(plinha, 56,  1);
  GetRegistro50.Prop['VALOR_TOTAL'         ] := Copy(plinha, 57,  13);
  GetRegistro50.Prop['BASE_CALCULO_ICMS'   ] := Copy(plinha, 70,  13);
  GetRegistro50.Prop['VALOR_ICMS '         ] := Copy(plinha, 83,  13);
  GetRegistro50.Prop['ISENTA_NAO_TRIBUTADA'] := Copy(plinha, 96,  13);
  GetRegistro50.Prop['OUTRAS_ICMS'         ] := Copy(plinha, 109, 13);
  GetRegistro50.Prop['ALIQUOTA'            ] := Copy(plinha, 122, 4);
  GetRegistro50.Prop['SITUACAO'            ] := Copy(plinha, 126, 1);
end;

procedure TForm1.LerRegistro51(plinha : string);
begin
  GetRegistro51.Prop['CNPJ'                ] := Copy(plinha, 3,   14);
  GetRegistro51.Prop['INSCRICAO_ESTADUAL'  ] := Copy(plinha, 17,  14);
  GetRegistro51.Prop['DATA_EMISSAO'        ] := Copy(plinha, 31,  8);
  GetRegistro51.Prop['UNIDADE_FEDERACAO'   ] := Copy(plinha, 39,  2);
  GetRegistro51.Prop['SERIE'               ] := Copy(plinha, 41,  3);
  GetRegistro51.Prop['NUMERO'              ] := Copy(plinha, 44,  6);
  GetRegistro51.Prop['CFOP'                ] := Copy(plinha, 50,  4);
  GetRegistro51.Prop['VALOR_TOTAL'         ] := Copy(plinha, 54,  13);
  GetRegistro51.Prop['VALOR_IPI'           ] := Copy(plinha, 67,  13);
  GetRegistro51.Prop['ISENTA_NAO_TRIBUTADA'] := Copy(plinha, 80,  13);
  GetRegistro51.Prop['OUTRAS_IPI'          ] := Copy(plinha, 93,  13);
  GetRegistro51.Prop['SITUACAO'            ] := Copy(plinha, 126, 1);
end;

procedure TForm1.LerRegistro60M(plinha : string);
begin
  GetRegistro51.Prop['DATA_EMISSAO'         ] := Copy(plinha, 4,  8);
  GetRegistro51.Prop['NUMERO_SERIE_FAB'     ] := Copy(plinha, 12, 20);
  GetRegistro51.Prop['NUMERO_ORDEM_SEQ'     ] := Copy(plinha, 32, 3);
  GetRegistro51.Prop['MODELO_DOCUMENTO'     ] := Copy(plinha, 35, 2);
  GetRegistro51.Prop['NUM_CONT_ORDEM_OP_INI'] := Copy(plinha, 37, 6);
  GetRegistro51.Prop['NUM_CONT_ORDEM_OP_FIM'] := Copy(plinha, 43, 6);
  GetRegistro51.Prop['NUM_CONT_REDUCAO_Z'   ] := Copy(plinha, 49, 6);
  GetRegistro51.Prop['CONTADOR_REINÍCIO_OP' ] := Copy(plinha, 55, 3);
  GetRegistro51.Prop['VLR_VENDA_BRUTA'      ] := Copy(plinha, 58, 16);
  GetRegistro51.Prop['VLR_TOTALIZADOR_EQUIP'] := Copy(plinha, 74, 16);
end;

procedure TForm1.LerRegistro60A(plinha : string);
begin
  GetRegistro60M.Prop['DATA_EMISSAO'            ] := Copy(plinha, 3,   14);
  GetRegistro60M.Prop['NUMERO_SERIE_FAB'        ] := Copy(plinha, 3,   14);
  GetRegistro60M.Prop['SITUACAO_TRIBUTARIA_ALIQ'] := Copy(plinha, 3,   14);
  GetRegistro60M.Prop['VALOR_ACUMULADO'         ] := Copy(plinha, 3,   14);
end;

procedure TForm1.btnOkClick(Sender: TObject);
var
//  lReg10           : TRegistro10;
  lListaRegistro10 : TListaInterfaceBase;
  i                : Integer;
begin
  if not FileExists(edtArquivo.Text) then
  begin
    ShowMessage('Arquivo não existe. Verifique!');
    Exit;
  end;

  LerArquivo();
//  lListaRegistro10 := TListaInterfaceBase.Create;
//  for i := 0 to 20 do
//  begin
//    lReg10 := TRegistro10.Create;
//    lReg10.Prop['TIPO']    := i;
//    lReg10.Prop['CNPJ'] := 'DESCRIÇÃO - '+ IntToStr(i);
//
//    lListaRegistro10.Adicionar(lReg10);
//  end;
//
  Memo1.Lines.Clear;
  for i := 0 to GetRegistro50.GetCountProp - 1 do
  begin
    Memo1.Lines.Add(GetRegistro50.GetNamePropByIndex(i) +' - '+ VarToStrDef(GetRegistro50.Prop[GetRegistro50.GetNamePropByIndex(i)], ''));
//    Memo1.Lines.Add(VarToStrDef(lListaRegistro10.Item[i].Prop['TIPO'], '') + ' - ' +
//                    VarToStrDef(lListaRegistro10.Item[i].Prop['CNPJ'], ''));

  end;
end;

procedure TForm1.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

end.

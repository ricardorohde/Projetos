unit uGIARN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Alterdata, DB, dxmdaset,
  AltSetupMemData, Grids, DBGrids;

type
  TfrmGIARN = class(TForm)
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    Label3: TLabel;
    edtArquivo: TEdit;
    btnArquivo: TButton;
    pgLayout: TPageControl;
    tbComercio: TTabSheet;
    tbIndustria: TTabSheet;
    OpenDialog1: TOpenDialog;
    btnGerar: TButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    SetupMemData1: TSetupMemData;
    DataSource1: TDataSource;
    SetupMemData1Campo: TStringField;
    SetupMemData1Valor: TStringField;
    procedure btnArquivoClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Processar;
    procedure IncluiNoMemData(pLabel, pValor : string);
  public
    { Public declarations }
  end;

var
  frmGIARN: TfrmGIARN;

const LabelsComercio : array[1..30] of String = ('01. Estoque Inicial de Mercadorias(1.1 + 1.2 + 1.3)',
                                                 '1.1. Estoque Inicial Tributado',
                                                 '1.2. Estoque Inicial Não Tributado/Isento',
                                                 '1.3. Estoque Inicial – Subst. Tributária',
                                                 '02. Compras e transferências no país de Mercadorias',
                                                 '03. Entradas do Exterior de Mercadorias',
                                                 '04. Apuradas mediante ação fiscal',
                                                 '05. Apuradas mediante denúncia espontânea',
                                                 '06. Sub-total (01 + 02 + 03 + 04 + 05)',
                                                 '07. Estoque Final de Mercadorias (7.1 + 7.2 + 7.3)',
                                                 '7.1. Estoque Final Tributado (Normal)',
                                                 '7.2. Estoque Final Não Tributado/Isento',
                                                 '7.3. Estoque Final – Subst. Tributária',
                                                 '08. Custo das Saídas (06 – 07)',
                                                 '09. Vendas e Transferências de merccadorias no País',
                                                 '10. Saídas de mercadorias para o Exterior',
                                                 '11. Apuradas mediante ação fiscal',
                                                 '12. Apuradas mediante denúncia espontânea',
                                                 '13. Total das Saídas (09 + 10+ 11 +12)',
                                                 '14. Itens (13 – 08)',
                                                 '15.1. Compras e transferências no país',
                                                 '15.2. Entradas do Exterior',
                                                 '15.3. Estoque Final de Ativo Fixo',
                                                 '16.1. Compras e transferências no país',
                                                 '16.2. Entradas do Exterior',
                                                 '16.3. Estoque Final de Materiais de Consumo',
                                                 '17.1. Energia, água e telefone',
                                                 '17.2. Aluquel',
                                                 '17.3. Folha de Pagamento(inclusive pró-labore e prestação de serviços)',
                                                 '17.4. Encargos, contribuições e despesas tributárias(inclusive ICMS)');


const LabelsIndustria : array[1..36] of String = ('01. Estoque Inicial(1.1 + 1.2)',
                                                  '1.1. Matéria prima e Demais Insumos (1.1.1 + 1.1.2)',
                                                  '1.1.1. Estoque Inicial Tributado',
                                                  '1.1.2. Estoque Inicial Não tributado/Isento',
                                                  '1.2. Produtos Acabados(1.2.1 + 1.2.2)',
                                                  '1.2.1. Estoque Inicial Tributado',
                                                  '1.2.2. Estoque Inicial Não Tributado/Isento',
                                                  '02. Estoque Final(2.1 + 2.2)',
                                                  '2.1. Matéria-Prima e Demais Insumos(2.1.1 + 2.1.2)',
                                                  '2.1.1. Estoque Final Tributado',
                                                  '2.1.2. Estoque Final Não Tributado/Isento',
                                                  '2.2. Produtos Acabados(2.2.1 + 2.2.2)',
                                                  '2.2.1. Estoque Final Tributado',
                                                  '2.2.2. Estoque Final Não Tributado/Isento',
                                                  '03. Compras e transferências no país de Matéria-Prima e Demais Insumos',
                                                  '04. Produção própria',
                                                  '05. Importações de Matéria-Prima e Demais Insumos',
                                                  '06. Apuradas mediante ação fiscal',
                                                  '07. Apuradas mediante denúncia espontânea',
                                                  '08. Total das Entradas(03 + 04 + 05 + 06 + 07)',
                                                  '09. Vendas e Transferências de mercadorias no País',
                                                  '10. Exportações',
                                                  '11. Apuradas mediante ação fiscal',
                                                  '12. Apuradas mediante denúncia espontânea',
                                                  '13. Total das Saídas (09 + 10+ 11 +12)',
                                                  '14. Itens (02 + 13 – 01 – 08)',
                                                  '15.1. Compras e transferências no país',
                                                  '15.2. Entradas do Exterior',
                                                  '15.3. Estoque Final de Ativo Fixo',
                                                  '16.1. Compras e transferências no país',
                                                  '16.2. Entradas do Exterior',
                                                  '16.3. Estoque Final de Materiais de Consumo',
                                                  '17.1. Energia, água e telefone',
                                                  '17.2. Aluquel',
                                                  '17.3. Folha de Pagamento(inclusive pró-labore e prestação de serviços)',
                                                  '17.4. Encargos, contribuições e despesas tributárias(inclusive ICMS)');


implementation

{$R *.dfm}

procedure TfrmGIARN.btnArquivoClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edtArquivo.text := OpenDialog1.FileName;
end;

procedure TfrmGIARN.RadioGroup1Click(Sender: TObject);
begin
  tbComercio.TabVisible  := RadioGroup1.ItemIndex = 0;
  tbComercio.Visible     := RadioGroup1.ItemIndex = 0;
  tbIndustria.TabVisible := RadioGroup1.ItemIndex = 1;
  tbIndustria.Visible    := RadioGroup1.ItemIndex = 1;
end;

procedure TfrmGIARN.btnGerarClick(Sender: TObject);
begin
  if Empty(edtArquivo.Text) or not FileExists(edtArquivo.Text) then
    begin
      ShowMessage('Arquivo inválido.Verifique!!!');
      edtArquivo.SetFocus();
      Abort();
    end;

  SetupMemData1.Close;
  SetupMemData1.Open;
  Processar;
end;

procedure TfrmGIARN.Processar;
var lStringList : TStringList;
    i, j, T : Integer;
begin
  lStringList := TStringList.Create;
  try
    lStringList.LoadFromFile(edtArquivo.Text);

    T := 30;
    if (RadioGroup1.ItemIndex = 1) then T := 36;

    for i := 0 to lStringList.Count - 1 do
      begin
        for j := 1 to T do
          if (RadioGroup1.ItemIndex = 0) then
            IncluiNoMemData(LabelsComercio[j], Copy(lStringList.Strings[i],((j-1) * 14) + 1,14))
          else
            IncluiNoMemData(LabelsIndustria[j], Copy(lStringList.Strings[i],((j-1) * 14) + 1,14));
      end;
  finally
    FreeAndNil(lStringList);
  end;
end;

procedure TfrmGIARN.IncluiNoMemData(pLabel, pValor: string);
begin
  SetupMemData1.Append;
  SetupMemData1Campo.AsString := pLabel;
  SetupMemData1Valor.AsString := pValor;
  SetupMemData1.Post;
end;

end.

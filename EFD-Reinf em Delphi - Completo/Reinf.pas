unit Reinf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, ReinfClientX_TLB;

type
  TForm1 = class(TForm)
    cbbCertificados: TComboBox;
    edtIDLote: TEdit;
    btnConfigurar: TButton;
    btnIncluir: TButton;
    btnExcluir: TButton;
    btnGerarXML: TButton;
    btnAssinar: TButton;
    btnEnviar: TButton;
    btnConsultar: TButton;
    mmXML: TMemo;
    spdReinfClientX1: TspdReinfClientX;
    procedure FormCreate(Sender: TObject);
    procedure btnConfigurarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGerarXMLClick(Sender: TObject);
    procedure btnAssinarClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Reinf: TspdReinfClientX;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnAssinarClick(Sender: TObject);
begin

  mmXML.Text := Reinf.AssinarEvento(mmXML.Text);

end;

procedure TForm1.btnConfigurarClick(Sender: TObject);
begin
  Reinf.CpfCnpjEmpregador := '18582206000132';
  Reinf.VersaoManual := vm13;
  Reinf.DiretorioTemplates :=
    'C:\Program Files\TecnoSpeed\Reinf\Arquivos\Templates\';
  Reinf.DiretorioEsquemas :=
    'C:\Program Files\TecnoSpeed\Reinf\Arquivos\Esquemas\';
  Reinf.Ambiente := akPreProducaoReais;
  Reinf.ConfigurarSoftwareHouse('12090234903',
    'GRk7PBfmzx5QaeJFHpMUI3GlyFaZIGDUQAkezoPb');
  Reinf.NomeCertificado := cbbCertificados.Text;
end;

procedure TForm1.btnConsultarClick(Sender: TObject);
var
  _Lote: IspdRetConsultarLote;
  _i, _j, _k: Integer;
begin

  _Lote := Reinf.ConsultarLoteEventos(edtIDLote.Text);

  mmXML.Lines.Clear;
  mmXML.Lines.Add('Lote:');
  mmXML.Lines.Add('    Número do Protocolo: ' + _Lote.NumeroProtocolo);
  mmXML.Lines.Add('    Mensagem de Retorno: ' + _Lote.Mensagem);
  mmXML.Lines.Add('    Status do Lote: ' + _Lote.Status);

  for _i := 0 to _Lote.Count - 1 do
  begin

    mmXML.Lines.Add('Evento ' + IntToStr(_i + 1) + ':');
    mmXML.Lines.Add('    Id Evento: ' + _Lote.Eventos[_i].IdEvento);
    mmXML.Lines.Add('    Número Recibo: ' + _Lote.Eventos[_i].NumeroRecibo);
    mmXML.Lines.Add('    Código de Status: ' + _Lote.Eventos[_i].cStat);
    mmXML.Lines.Add('    Mensagem: ' + _Lote.Eventos[_i].Mensagem);
    mmXML.Lines.Add('    Status do Evento: ' + _Lote.Eventos[_i].Status +
      #13#10);

    for _j := 0 to _Lote.Eventos[_i].Count - 1 do
    begin

      mmXML.Lines.Add('    Ocorrencia ' + IntToStr(_j + 1) + ':');
      mmXML.Lines.Add('    Código: ' +
        _Lote.Eventos[_i].Ocorrencias[_j].Codigo);
      mmXML.Lines.Add('    Descrição: ' +
        _Lote.Eventos[_i].Ocorrencias[_j].Descricao);

    end;

  end;

  for _k := 0 to _Lote.CountOcorrencias - 1 do
  begin

    mmXML.Lines.Add('Lote:');
    mmXML.Lines.Add('    Codigo: ' + _Lote.Ocorrencias[_k].Codigo);
    mmXML.Lines.Add('    Tipo: ' + _Lote.Ocorrencias[_k].Tipo);
    mmXML.Lines.Add('    Descrição: ' + _Lote.Ocorrencias[_k].Descricao);

  end;
end;

procedure TForm1.btnEnviarClick(Sender: TObject);
var
  _Retorno: IspdRetEnviarLoteEventos;
begin

  _Retorno := Reinf.EnviarLoteEventos(mmXML.Text);
  edtIDLote.Text := _Retorno.IdLote;

  mmXML.Lines.Clear;
  mmXML.Lines.Add('Retorno:');
  mmXML.Lines.Add('    ID Lote: ' + _Retorno.IdLote);
  mmXML.Lines.Add('    Mensagem: ' + _Retorno.Mensagem);

end;

procedure TForm1.btnExcluirClick(Sender: TObject);
begin

  mmXML.Lines.Text := 'EXCLUIRR1000';

  mmXML.Lines.Add('tpAmb_4=' + '2');
  mmXML.Lines.Add('procEmi_5=' + '1');
  mmXML.Lines.Add('verProc_6=' + '1.0');
  mmXML.Lines.Add('tpInsc_8=' + '1');
  mmXML.Lines.Add('nrInsc_9=' + '18582206000132');
  mmXML.Lines.Add('iniValid_13=' + '2018-03');
  mmXML.Lines.Add('fimValid_14=' + '');

  mmXML.Lines.Add('SALVARR1000');

end;

procedure TForm1.btnGerarXMLClick(Sender: TObject);
begin

  mmXML.Text := Reinf.GerarXMLporTx2(mmXML.Text);

end;

procedure TForm1.btnIncluirClick(Sender: TObject);
begin

  mmXML.Lines.Text := 'INCLUIRR1000';

  mmXML.Lines.Add('tpAmb_4=' + '2');
  mmXML.Lines.Add('procEmi_5=' + '1');
  mmXML.Lines.Add('verProc_6=' + '1.0');
  mmXML.Lines.Add('tpInsc_8=' + '1');
  mmXML.Lines.Add('nrInsc_9=' + '18582206000132');
  mmXML.Lines.Add('iniValid_13=' + '2018-03');
  mmXML.Lines.Add('fimValid_14=' + '');

  mmXML.Lines.Add('classTrib_16=' + '01');
  mmXML.Lines.Add('indEscrituracao_17=' + '0');
  mmXML.Lines.Add('indDesoneracao_18=' + '1');
  mmXML.Lines.Add('indAcordoIsenMulta_19=' + '0');
  mmXML.Lines.Add('indSitPJ_20=' + '0');
  mmXML.Lines.Add('nmCtt_22=' + 'Nome do Contato Teste');
  mmXML.Lines.Add('cpfCtt_23=' + '12345678909');
  mmXML.Lines.Add('foneFixo_24=' + '1123452345');
  mmXML.Lines.Add('foneCel_25=' + '');
  mmXML.Lines.Add('email_26=' + '');
  mmXML.Lines.Add('ideEFR_34=' + '');
  mmXML.Lines.Add('cnpjEFR_35=' + '');
  mmXML.Lines.Add('INCLUIRSOFTHOUSE_27');
  mmXML.Lines.Add('cnpjSoftHouse_28=' + '26764821000198');
  mmXML.Lines.Add('nmRazao_29=' + 'Nome Razao Teste');
  mmXML.Lines.Add('nmCont_30=' + 'Nome Teste');
  mmXML.Lines.Add('telefone_31=' + '1234567897');
  mmXML.Lines.Add('email_32=' + 'eamil.teste@gmail.com');
  mmXML.Lines.Add('SALVARSOFTHOUSE_27');
  mmXML.Lines.Add('SALVARR1000');

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  Reinf := TspdReinfClientX.Create(nil);

  cbbCertificados.Items.Text := Reinf.ListarCertificados(#13#10);

end;

end.


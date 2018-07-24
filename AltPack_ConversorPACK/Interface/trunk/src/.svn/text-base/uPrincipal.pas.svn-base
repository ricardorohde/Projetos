{-------------------------------------------------------------------------------
Alterdata Importador (sistema PROSOFT-Windows)
Processo: CONVPACK-359
Unit: uPrincipal
Criado por: Matheus.dsn
Data: 19/10/2012.
Descrição: Sistema responsável pelo gerenciamento dos pacotes de conversão para diversos concorrentes.
--------------------------------------------------------------------------------
CONVPACK-359 - 19/10/2012 - 5.13.10.1 - edson.dsn        Importação de registros com empresas com códigos alfanuméricos, para isso foi necessário
                                                         a modificação de diversos pontos nas bpl dos concorrentes e também nas interfaces as quais são herdadas
                                                         algumas funções.
CONVPACK-457 - 30/01/2013 - 5.13.10.1 - thiago.dsn.pack  Criada uma proteção para quando o banco de dados do concorrente é o SQL Server, pedindo a confirmação
                                                         do usuário antes de realizar o procedimento de Drop e Restoure database.
CONVPACK-476 - 22/02/2013 - 5.13.10.1 - thiago.dsn.pack  Quando todas as empresas vierem com código alfanumérico, agora o conversor começa a numerar a partir
                                                         1(um), antes era 0(zero).
}

unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxShellBrowserDialog, cxGroupBox,
  cxControls, cxContainer, cxEdit, cxCheckBox, DB, Grids, DBGrids,
  cxMemo, cxLabel, uInterfaceImportadorAlterdata, cxPC,
  cxGraphics, cxDropDownEdit, unxlayoutcontrol, UValidadorDeDados, Alterdata,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, DBClient, alterdata_skin,
  dxmdaset, AltSetupMemData, AltFStatus, Alterdata_nxskin, cxCheckGroup,
  Buttons, alt_HtmlHelpHook, uSplashScreen, acPNG, ActnList, uMapaEmpresa;

type
  TfrmImportador_Alterdata = class(TForm)
    PageControl: TcxPageControl;
    tsConfiguracoes: TcxTabSheet;
    tsTabelasImportadas: TcxTabSheet;
    tsLogImportacao: TcxTabSheet;
    pnlConfiguracaoBPL: TPanel;
    pnBottom: TPanel;
    btnAvancar: TcxButton;
    btnFechar: TcxButton;
    LayoutControl: TLayoutControl;
    pnConfig: TPanel;
    pnDbAlterdata: TPanel;
    mmLog: TMemo;
    grdSelecaoEmpresasDBTableView1: TcxGridDBTableView;
    grdSelecaoEmpresas: TcxGrid;
    pgcConfig: TcxPageControl;
    tsGeral: TcxTabSheet;
    tsWdp: TcxTabSheet;
    tsWphd: TcxTabSheet;
    btnConcluir: TcxButton;
    grdSelecaoEmpresasDBTableView1CheckEmpresa: TcxGridDBColumn;
    grdSelecaoEmpresasDBTableView1IdEmpresa: TcxGridDBColumn;
    grdSelecaoEmpresasDBTableView1NewIdEmpresa: TcxGridDBColumn;
    grdSelecaoEmpresasDBTableView1NmEmpresa: TcxGridDBColumn;
    tsWcont: TcxTabSheet;
    btnVoltar: TcxButton;
    grdSelecaoEmpresasTableView_Old: TcxGridTableView;
    grdSelecaoEmpresasTableView_OldStImporta: TcxGridColumn;
    grdSelecaoEmpresasTableView_OldCdEmpresa: TcxGridColumn;
    grdSelecaoEmpresasTableView_OldNovoCdEmpresa: TcxGridColumn;
    grdSelecaoEmpresasTableView_OldNmEmpresa: TcxGridColumn;
    grdSelecaoEmpresasDBTableView2: TcxGridDBTableView;
    grdSelecaoEmpresasDBTableView2Column1: TcxGridDBColumn;
    grdSelecaoEmpresasDBTableView2Column2: TcxGridDBColumn;
    grdSelecaoEmpresasDBTableView2Column3: TcxGridDBColumn;
    grdSelecaoEmpresasDBTableView2Column4: TcxGridDBColumn;
    cxStyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    dsSelectEmpresa: TDataSource;
    grdSelecaoEmpresasLevel: TcxGridLevel;
    grdSelecaoEmpresasDBTableView: TcxGridDBTableView;
    grdSelecaoEmpresasTableView1: TcxGridTableView;
    tblEmpTemp: TSetupMemData;
    tblEmpTempStImporta: TBooleanField;
    tblEmpTempCdEmpresaNew: TIntegerField;
    tblEmpTempNmEmpresa: TStringField;
    grdSelecaoEmpresasDBTableViewStImporta: TcxGridDBColumn;
    grdSelecaoEmpresasDBTableViewCdEmpresa: TcxGridDBColumn;
    grdSelecaoEmpresasDBTableViewCdEmpresaNew: TcxGridDBColumn;
    grdSelecaoEmpresasDBTableViewNmEmpresa: TcxGridDBColumn;
    grpWdpGeral: TcxGroupBox;
    chkSindicato: TcxCheckBox;
    chkFuncao: TcxCheckBox;
    chkHorario: TcxCheckBox;
    chkDepartamento: TcxCheckBox;
    chkBanco: TcxCheckBox;
    chkAgencia: TcxCheckBox;
    chkValeTransporte: TcxCheckBox;
    grpWdpPorEmpresa: TcxGroupBox;
    chkDependente: TcxCheckBox;
    chkAfastamento: TcxCheckBox;
    chkAcumulado: TcxCheckBox;
    chkFuncionario: TcxCheckBox;
    chkReajusteSalarial: TcxCheckBox;
    chkTrocaDeFuncao: TcxCheckBox;
    chkTrocaDeDepartamento: TcxCheckBox;
    grpSistemas: TcxGroupBox;
    chkWphd: TcxCheckBox;
    chkWdp: TcxCheckBox;
    chkWcont: TcxCheckBox;
    chkWfiscal: TcxCheckBox;
    chkWativo: TcxCheckBox;
    chkWinss: TcxCheckBox;
    tsWinss: TcxTabSheet;
    tsWfiscal: TcxTabSheet;
    tsWativo: TcxTabSheet;
    grpWinssGeral: TcxGroupBox;
    grpWphdGeral: TcxGroupBox;
    chkAutonomo: TcxCheckBox;
    grpWinssPorEmpresa: TcxGroupBox;
    chkInssAcumulado: TcxCheckBox;
    chkSocio: TcxCheckBox;
    chkEmpresa: TcxCheckBox;
    chkSelecionaEmpresas: TCheckBox;
    lblTotalEmpresa: TLabel;
    pnlGridEmpresa: TPanel;
    pnlConfigGridEmpresa: TPanel;
    dlgOpenEsq: TOpenDialog;
    dlgSaveEsq: TSaveDialog;
    grpEsquema: TcxGroupBox;
    btnLoadEsqEmpresa: TcxButton;
    btnSaveEsqEmpresa: TcxButton;
    chkBureau: TcxCheckBox;
    NxVclSkin: TAltNxVclSkin;
    btnGeralClear: TBitBtn;
    btnWPhdClear: TBitBtn;
    btnWDpGeralClear: TBitBtn;
    btnWDpPorEmpresaClear: TBitBtn;
    btnWInssGeralClear: TBitBtn;
    btnWInssPorEmpresaClear: TBitBtn;
    grpConfiguracaoBPL: TGroupBox;
    cbxConcorrente: TComboBox;
    cbxDBAlterdata: TComboBox;
    alt_HtmlHelpHook: Talt_HtmlHelpHook;
    btnHelp: TcxButton;
    grpWcontGeral: TcxGroupBox;
    grpWcontPorEmpresa: TcxGroupBox;
    chkHistoricoPadrao: TcxCheckBox;
    chkLancamentoAutomatico: TcxCheckBox;
    chkLancamentoTemporario: TcxCheckBox;
    btnWContGeralClear: TBitBtn;
    BitBtn2: TBitBtn;
    cxStyle3: TcxStyle;
    imgBackgorund01: TImage;
    imgBackgorund02: TImage;
    chkPlanoDeConta: TcxCheckBox;
    pnlLog: TPanel;
    dlgSaveLog: TSaveDialog;
    actlst: TActionList;
    actSaveLog: TAction;
    btnSaveLog: TcxButton;
    chkCentrodeCusto: TcxCheckBox;
    tblEmpTempCdEmpresa: TStringField;
    tblEmpTempCNPJ: TStringField;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAvancarClick(Sender: TObject);
    procedure btnConcluirClick(Sender: TObject);
    procedure chkWphdClick(Sender: TObject);
    procedure chkWdpClick(Sender: TObject);
    procedure chkWcontClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure chkSelecionaEmpresasClick(Sender: TObject);
    procedure chkWinssClick(Sender: TObject);
    procedure chkWfiscalClick(Sender: TObject);
    procedure chkWativoClick(Sender: TObject);
    procedure chkEmpresaClick(Sender: TObject);
    procedure btnLoadEsqEmpresaClick(Sender: TObject);
    procedure btnSaveEsqEmpresaClick(Sender: TObject);
    procedure btnWPhdClearClick(Sender: TObject);
    procedure btnGeralClearClick(Sender: TObject);
    procedure btnWDpGeralClearClick(Sender: TObject);
    procedure btnWDpPorEmpresaClearClick(Sender: TObject);
    procedure btnWInssGeralClearClick(Sender: TObject);
    procedure btnWInssPorEmpresaClearClick(Sender: TObject);
    procedure cbxDBAlterdataChange(Sender: TObject);
    procedure cbxConcorrenteChange(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure btnWContGeralClearClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure actSaveLogExecute(Sender: TObject);
    procedure btnSaveLogClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FListaEmpresa : TStringList;
    FEmpresaList  : array of string;

    function GridNotOk: Boolean;
    function BuscaPalavraNoComboBox(pPalvara: String; pComboBox: TComboBox): Boolean;
    procedure ControlaPageControl(pActivePageIndex: Integer);
    procedure CarregarEmpresas(DataSetEmp: TDataSet);

    procedure ImportaSistemaWPHD;
    procedure ImportaSistemaWDP;
    procedure ImportaSistemaWINSS;
    procedure ImportaSistemaWCONT;
    //procedure CriaFieldsDataSet;
  public
    { Public declarations }
  end;

var
  frmImportador_Alterdata: TfrmImportador_Alterdata;

const
  cNomePrograma : string = 'Conversor PACK';
  cVersao : string = '5.13.11.1';

implementation

uses StrUtils;

{$R *.dfm}

procedure TfrmImportador_Alterdata.btnFecharClick(Sender: TObject);
begin
//  Application.Terminate;
  Self.Close();
end;

procedure TfrmImportador_Alterdata.FormShow(Sender: TObject);
var
  lSplashScreen : TSplashScreen;
begin
  lSplashScreen := TSplashScreen.create(application);
  try
    lSplashScreen.Show;
    lSplashScreen.ShowSplashScreen;

    Caption := cNomePrograma + ' - ' + cVersao;
    Application.Title := cNomePrograma;

    // Primeira aba sempre ativa.
    ControlaPageControl(0);

    // Listar concorrentes.
    FillWithImportadoresDisponiveis(cbxConcorrente.Items);

    //Listar banco de dados.
    //LoadPackage(ExtractFilePath(Application.ExeName) + 'altpack_imp_validacoes_51310.bpl');
    FillWithConfiguradoresBD(cbxDBAlterdata.Items);
  finally
    lSplashScreen.Hide();
    lSplashScreen.Free();
  end;

  cbxConcorrente.SetFocus;
end;

procedure TfrmImportador_Alterdata.btnAvancarClick(Sender: TObject);
var
  vImportadorAlterdataBase : TImportadorAlterdataBase;
  i : Integer;
  TpSistema : TTipoArraySistema;
  TpTabelas : TTipoArrayTabelas;
  texto     : string;


begin
  texto := cbxConcorrente.Text;
  // Verificar se databases origem e destinos foram selecionados.
  if (cbxConcorrente.Text = 'Selecione o concorrente...') or (cbxConcorrente.Text = EmptyStr) then
    begin
      MessageBox(0, 'Informação de concorrente não foi informado!', 'Atenção', MB_ICONWARNING or MB_OK);
      cbxConcorrente.SetFocus;
      Exit;
    end;
  if (cbxDBAlterdata.Text = 'Selecione o DB Alterdata...') or (cbxDBAlterdata.Text = EmptyStr) then
    begin
      MessageBox(0, 'Informação de database Alterdata não foi informado!', 'Atenção', MB_ICONWARNING or MB_OK);
      cbxDBAlterdata.SetFocus;
      Exit;
    end;

  //CONVPACK-457 - 30/01/2013 - 5.13.10.1 - thiago.dsn.pack - Proteção que solicita confirmação do usuário antes de apagar o banco de dados.
  if (BuscaPalavraNoComboBox('SQL SERVER', cbxConcorrente)) then
    begin
      case MessageBox(0,'O(s) banco(s) de dados selecionado(s) será(ão) apagado(s), mas será(ão) restaurado(s) a partir do(s) Backup(s) escolhido(s). Deseja Continuar ?', 'Atenção', MB_ICONQUESTION OR MB_YESNO) of
          IDNO  : begin
                    cbxConcorrente.SetFocus;
                    Exit;
                  end;
      end
    end;

//  if (Copy(UpperCase(texto),1,22) = 'MASTERMAQ (SQL SERVER)') or (Copy(UpperCase(texto),1,20) = 'LEDWARE (SQL SERVER)') then
//    begin
//      case MessageBox(0,'Deseja realmente apagar o banco de dados e restaurar através do backup ?', 'Atenção', MB_ICONQUESTION OR MB_YESNO) of
//        IDNO  : begin
//                  cbxConcorrente.SetFocus;
//                  Exit;
//                end;
////        IDYES : ;
//      end;
//    end;

  // Cria o Objeto do Importador do Concorrente pela seleção no ComboBox
  vImportadorAlterdataBase := GetImportadorByCaption(cbxConcorrente.Text).Create;

  if not vImportadorAlterdataBase.InformationOk then
    Exit;

  try
    Repaint;
    try
      CarregarEmpresas(vImportadorAlterdataBase.GetDataSetImpConcorrente('WPHD.Empresa'));

      // Calculo do total de empresas.
      lblTotalEmpresa.Caption := 'Total de Empresas: ' + IntToStr(tblEmpTemp.RecordCount);

      TpSistema := vImportadorAlterdataBase.GetTpSistemaImportacao;

      for i := Low(TpSistema) to High(TpSistema) do
        begin
          if TpSistema[i] = 'WPHD' then
            begin
              tsWphd.TabVisible := True;
              chkWphd.Enabled := True;
              chkWphd.Checked := True;
            end;

          if TpSistema[i] = 'WDP' then
            begin
              tsWdp.TabVisible := True;
              chkWdp.Enabled := True;
              chkWdp.Checked := True;
            end;

          if TpSistema[i] = 'WINSS' then
            begin
              tsWinss.TabVisible := True;
              chkWinss.Enabled := True;
              chkWinss.Checked := True;
            end;

          if TpSistema[i] = 'WCONT' then
            begin
              tsWcont.TabVisible := True;
              chkWcont.Enabled := True;
              chkWcont.Checked := True;
            end;

          if TpSistema[i] = 'WFISCAL' then
            begin
              tsWfiscal.TabVisible := True;
              chkWfiscal.Enabled := True;
              chkWfiscal.Checked := True;
            end;

          if TpSistema[i] = 'WATIVO' then
            begin
              tsWativo.TabVisible := True;
              chkWativo.Enabled := True;
              chkWativo.Checked := True;
            end;
        end;

      TpTabelas := vImportadorAlterdataBase.GetTpTabelasImportacao;

      for i := Low(TpTabelas) to High(TpTabelas) do
        begin
          if TpTabelas[i] = 'Bureau' then
            begin
              chkBureau.Enabled := True;
              chkBureau.Checked := true;
            end;

          if TpTabelas[i] = 'Socio' then
            begin
              chkSocio.Enabled := True;
              chkSocio.Checked := true;
            end;

          if TpTabelas[i] = 'Sindicato' then
            begin
              chkSindicato.Enabled := True;
              chkSindicato.Checked := true;
            end;

          if TpTabelas[i] = 'Departamento' then
            begin
              chkDepartamento.Enabled := True;
              chkDepartamento.Checked := true;
            end;

          if TpTabelas[i] = 'Funcao' then
            begin
              chkFuncao.Enabled := True;
              chkFuncao.Checked := true;
            end;

          if TpTabelas[i] = 'Horario' then
            begin
              chkHorario.Enabled := True;
              chkHorario.Checked := true;
            end;

          if TpTabelas[i] = 'Banco' then
            begin
              chkBanco.Enabled := True;
              chkBanco.Checked := true;
            end;

          if TpTabelas[i] = 'Agencia' then
            begin
              chkAgencia.Enabled := True;
              chkAgencia.Checked := true;
            end;

          if TpTabelas[i] = 'ValeTransporte' then
            begin
              chkValeTransporte.Enabled := True;
              chkValeTransporte.Checked := true;
            end;

          if TpTabelas[i] = 'Funcionario' then
            begin
              chkFuncionario.Enabled := True;
              chkFuncionario.Checked := true;
            end;

          if TpTabelas[i] = 'Dependente' then
            begin
              chkDependente.Enabled := True;
              chkDependente.Checked := true;
            end;

          if TpTabelas[i] = 'Afastamento' then
            begin
              chkAfastamento.Enabled := True;
              chkAfastamento.Checked := true;
            end;

          if TpTabelas[i] = 'Acumulado' then
            begin
              chkAcumulado.Enabled := True;
              chkAcumulado.Checked := true;
            end;

          if TpTabelas[i] = 'ReajusteSalarial' then
            begin
              chkReajusteSalarial.Enabled := True;
              chkReajusteSalarial.Checked := true;
            end;

          if TpTabelas[i] = 'TrocaDeFuncao' then
            begin
              chkTrocaDeFuncao.Enabled := True;
              chkTrocaDeFuncao.Checked := true;
            end;

          if TpTabelas[i] = 'TrocaDeDepartamento' then
            begin
              chkTrocaDeDepartamento.Enabled := True;
              chkTrocaDeDepartamento.Checked := true;
            end;

          if TpTabelas[i] = 'Autonomo' then
            begin
              chkAutonomo.Enabled := True;
              chkAutonomo.Checked := true;
            end;

          if TpTabelas[i] = 'InssAcumulado' then
            begin
              chkInssAcumulado.Enabled := True;
              chkInssAcumulado.Checked := true;
            end;

          if TpTabelas[i] = 'PlanoDeConta' then
            begin
              chkPlanoDeConta.Enabled := True;
              chkPlanoDeConta.Checked := true;
            end;

          if TpTabelas[i] = 'HistoricoPadrao' then
            begin
              chkHistoricoPadrao.Enabled := True;
              chkHistoricoPadrao.Checked := true;
            end;

          if TpTabelas[i] = 'LancamentoAutomatico' then
            begin
              chkLancamentoAutomatico.Enabled := True;
              chkLancamentoAutomatico.Checked := true;
            end;

          if TpTabelas[i] = 'LancamentoTemporario' then
            begin
              chkLancamentoTemporario.Enabled := True;
              chkLancamentoTemporario.Checked := true;
            end;

          if TpTabelas[i] = 'CentrodeCusto' then
            begin
              chkCentrodeCusto.Enabled := True;
              chkCentrodeCusto.Checked := true;
            end;
        end;
    except
      on E : EImportadorAlterdataException do
        MessageDlg(E.Message, mtWarning, [mbOK], 0)
      else
        raise;
    end;
  finally
    ControlaPageControl(1);
    vImportadorAlterdataBase.Free();
  end;
end;

procedure TfrmImportador_Alterdata.CarregarEmpresas(DataSetEmp:TDataSet);
var
  Status              : TStatus;
  lStrRegisterEmpresa : TStringList;
  lLastCdEmpresa      : Integer;
begin
  Status := TStatus.Init(DataSetEmp.RecordCount,'Carregando Empresa...',True);
  lStrRegisterEmpresa := TStringList.Create;
  try
    tblEmpTemp.Close;
    tblEmpTemp.Open;
    tblEmpTemp.DisableControls;

//    CONVPACK-476 - 22/02/2013 - thiago.dsn.pack
    lLastCdEmpresa := 0;//-1;
    DataSetEmp.First;
    while not DataSetEmp.EOF do
      begin
        //pegar o ultimo código da empresa não alfanumérico
        if (StrToIntDef(DataSetEmp.FieldByName('CdEmpresa').AsString,-999999) > lLastCdEmpresa) then
          lLastCdEmpresa := DataSetEmp.FieldByName('CdEmpresa').AsInteger;

        DataSetEmp.Next;
      end;

    DataSetEmp.First;
    while not DataSetEmp.EOF do
      begin
        Status.Position := Status.Position + 1;

        tblEmpTemp.Append;
        tblEmpTempStImporta.AsBoolean := True;
        tblEmpTempNmEmpresa.AsString  := DataSetEmp.FieldByName('NmEmpresa').AsString;
        tblEmpTempCdEmpresa.AsString  := StrZero(DataSetEmp.FieldByName('CdEmpresa').AsString,5);
        tblEmpTempCNPJ.AsString       := DataSetEmp.FieldByName('NrCGC').AsString;

        //mexi aki
        if (StrToIntDef(DataSetEmp.FieldByName('CdEmpresa').AsString, -1) <> -1) then
          begin
            if (lStrRegisterEmpresa.IndexOf(DataSetEmp.FieldByName('CdEmpresa').AsString) > -1) then
              begin
                lLastCdEmpresa                   := lLastCdEmpresa + 1;
                tblEmpTempCdEmpresaNew.AsInteger := lLastCdEmpresa;
              end
            else
              lStrRegisterEmpresa.Add(DataSetEmp.FieldByName('CdEmpresa').AsString);
          end
        else
          begin
            tblEmpTempCdEmpresa.AsString     := DataSetEmp.FieldByName('CdEmpresa').AsString;
            lLastCdEmpresa                   := lLastCdEmpresa + 1;
            tblEmpTempCdEmpresaNew.AsInteger := lLastCdEmpresa;
          end;

        tblEmpTemp.Post;
        DataSetEmp.Next;
      end;

  finally
    tblEmpTemp.First;
    tblEmpTemp.EnableControls;
    FreeAndNil(Status);
    FreeAndNil(lStrRegisterEmpresa);
  end;
end;

procedure TfrmImportador_Alterdata.ControlaPageControl(pActivePageIndex: Integer);
begin
  // Controlador de abas.
  case pActivePageIndex of
    0:  begin
          PageControl.ActivePageIndex    := 0;
          tsConfiguracoes.TabVisible     := True;
          tsTabelasImportadas.TabVisible := False;
          tsLogImportacao.TabVisible     := False;
          pgcConfig.ActivePageIndex      := 0;
          mmLog.Clear;

          // CheckBox(Checked and Enabled) Default: Wphd
          chkWphd.Checked      := False;
            chkEmpresa.Checked := True;
            chkBureau.Checked  := False;
            chkSocio.Checked   := False;
          chkWphd.Enabled      := False;
            chkEmpresa.Enabled := True;
            chkBureau.Enabled  := False;
            chkSocio.Enabled   := False;

          // CheckBox(Checked and Enabled) Default: WDp
          chkWdp.Checked                   := False;
            chkSindicato.Checked           := False;
            chkFuncao.Checked              := False;
            chkHorario.Checked             := False;
            chkDepartamento.Checked        := False;
            chkBanco.Checked               := False;
            chkAgencia.Checked             := False;
            chkValeTransporte.Checked      := False;
            chkFuncionario.Checked         := False;
            chkDependente.Checked          := False;
            chkAfastamento.Checked         := False;
            chkAcumulado.Checked           := False;
            chkReajusteSalarial.Checked    := False;
            chkTrocaDeFuncao.Checked       := False;
            chkTrocaDeDepartamento.Checked := False;
          chkWdp.Enabled                   := False;
            chkSindicato.Enabled           := False;
            chkFuncao.Enabled              := False;
            chkHorario.Enabled             := False;
            chkDepartamento.Enabled        := False;
            chkBanco.Enabled               := False;
            chkAgencia.Enabled             := False;
            chkValeTransporte.Enabled      := False;
            chkFuncionario.Enabled         := False;
            chkDependente.Enabled          := False;
            chkAfastamento.Enabled         := False;
            chkAcumulado.Enabled           := False;
            chkReajusteSalarial.Enabled    := False;
            chkTrocaDeFuncao.Enabled       := False;
            chkTrocaDeDepartamento.Enabled := False;

          // CheckBox(Cheked and Enabled) Default: WInss
          chkWinss.Checked           := False;
            chkAutonomo.Checked      := False;
            chkInssAcumulado.Checked := False;
          chkWinss.Enabled           := False;
            chkAutonomo.Enabled      := False;
            chkInssAcumulado.Enabled := False;

          // CheckBox(Cheked and Enabled) Default: WCont
          chkWcont.Checked                  := False;
            chkPlanoDeConta.Checked         := False;
            chkHistoricoPadrao.Checked      := False;
            chkLancamentoAutomatico.Checked := False;
            chkLancamentoTemporario.Checked := False;
            chkCentrodeCusto.Checked        := False;
          chkWcont.Enabled                  := False;
            chkPlanoDeConta.Enabled         := False;
            chkHistoricoPadrao.Enabled      := False;
            chkLancamentoAutomatico.Enabled := False;
            chkLancamentoTemporario.Enabled := False;
            chkCentrodeCusto.Enabled        := False;

          // CheckBox(Cheked and Enabled) Default: WFiscal
          chkWfiscal.Checked := False;
          chkWfiscal.Enabled := False;

          // CheckBox(Cheked and Enabled) Default: WAtivo
          chkWativo.Checked := False;
          chkWativo.Enabled := False;

          btnVoltar.Enabled   := False;
          btnAvancar.Enabled  := True;
          btnConcluir.Enabled := False;
          btnSaveLog.Visible  := False;
        end;
    1:  begin
          PageControl.ActivePageIndex    := 1;
          tsConfiguracoes.TabVisible     := False;
          tsTabelasImportadas.TabVisible := True;
          tsLogImportacao.TabVisible     := False;

          btnVoltar.Enabled   := True;
          btnAvancar.Enabled  := False;
          btnConcluir.Enabled := True;
          btnSaveLog.Visible  := False;
        end;
    2:  begin
          PageControl.ActivePageIndex    := 2;
          tsConfiguracoes.TabVisible     := False;
          tsTabelasImportadas.TabVisible := False;
          tsLogImportacao.TabVisible     := True;

          btnVoltar.Enabled   := True;
          btnAvancar.Enabled  := False;
          btnConcluir.Enabled := False;
          btnSaveLog.Visible  := True;
        end;
  end;
end;

procedure TfrmImportador_Alterdata.chkWphdClick(Sender: TObject);
begin
  chkWphd.Checked := True;
  tsWphd.TabVisible := chkWphd.Checked;
end;

procedure TfrmImportador_Alterdata.chkWdpClick(Sender: TObject);
begin
  tsWdp.TabVisible := chkWdp.Checked;
end;

procedure TfrmImportador_Alterdata.chkWinssClick(Sender: TObject);
begin
  tsWinss.TabVisible := chkWinss.Checked;
end;

procedure TfrmImportador_Alterdata.chkWcontClick(Sender: TObject);
begin
  tsWcont.TabVisible := chkWcont.Checked;
end;

procedure TfrmImportador_Alterdata.chkWfiscalClick(Sender: TObject);
begin
 tsWfiscal.TabVisible := chkWfiscal.Checked;
end;

procedure TfrmImportador_Alterdata.chkWativoClick(Sender: TObject);
begin
  tsWativo.TabVisible := chkWativo.Checked;
end;

procedure TfrmImportador_Alterdata.chkEmpresaClick(Sender: TObject);
begin
  chkEmpresa.Checked := True;
end;

procedure TfrmImportador_Alterdata.btnVoltarClick(Sender: TObject);
begin
  // Volto a primeira página
  ControlaPageControl(0);
end;

procedure TfrmImportador_Alterdata.btnConcluirClick(Sender: TObject);
var
  vHoraInicio : TTime;
  lStrAux     : string;

  function FindCGCEmpresa(ACgc : String; AEmpresaList: array of string): boolean;
  var i           : Integer;
      lCont       : Integer;
      lCGCEmpresa : String;
  begin
    lCont := 0;

    for i := 0 to Length(AEmpresaList) -1 do
      begin
        lCGCEmpresa := Copy(AEmpresaList[i], Pos('|', AEmpresaList[i]) + 1, Length(AEmpresaList[i]));

        if (lCGCEmpresa = ACGC) then
          lCont := lCont + 1;
      end;

    result := (lCont > 1);
  end;

begin
  tblEmpTemp.DisableControls;
  vHoraInicio := Time;

  // Cria o Objeto do Importador do Concorrente pela seleção no ComboBox
  FListaEmpresa            := TStringList.Create();
  try
    // Verificar integridade do grid de empresas.
    if GridNotOk then
      begin
        tblEmpTemp.EnableControls;
        tblEmpTemp.First;
        Exit;
      end;

    tblEmpTemp.First;
    while not tblEmpTemp.Eof do
      begin
        if tblEmpTemp.FieldByName('StImporta').AsBoolean then
          begin
            SetLength(FEmpresaList, Length(FEmpresaList) + 1);
            FEmpresaList[High(FEmpresaList)] := tblEmpTemp.FieldByName('CdEmpresa').AsString + '|' + tblEmpTemp.FieldByName('CNPJ').AsString;
          end;
        tblEmpTemp.Next;
      end;

    // Montar lista de empresas
    tblEmpTemp.First;
    while not tblEmpTemp.Eof do
      begin
        lStrAux := '';

        if tblEmpTemp.FieldByName('StImporta').AsBoolean then
          begin
            lStrAux := lStrAux + 'CodigoAntigo='  + tblEmpTemp.FieldByName('CdEmpresa').AsString;
            lStrAux := lStrAux + '|CPFCNPJ='      + tblEmpTemp.FieldByName('CNPJ').AsString;

            if not Empty(tblEmpTemp.FieldByName('CNPJ').AsString)then
              lStrAux := lStrAux + '|CGCDuplicado=' + BoolToStr(FindCGCEmpresa(tblEmpTemp.FieldByName('CNPJ').AsString,FEmpresaList))
            else
              lStrAux := lStrAux + '|CGCDuplicado=' + BoolToStr(True);

            if not tblEmpTemp.FieldByName('CdEmpresaNew').IsNull then
              lStrAux := lStrAux + '|CodigoNovo='  + tblEmpTemp.FieldByName('CdEmpresaNew').AsString;

            FListaEmpresa.Add(lStrAux);
          end;

        tblEmpTemp.Next;
      end;

    try
      {* WPHD *}
      (*teste*)
      if chkWphd.Checked then
        ImportaSistemaWPHD;

      {* WDP *}
      if chkWdp.Checked then
        ImportaSistemaWDP;

      {* WCONT *}
      if chkWcont.Checked then
        ImportaSistemaWCONT;

    except
      on E : EImportadorAlterdataException do
        MessageDlg(E.Message, mtWarning, [mbOK], 0)
      else
        raise;
    end;
  finally
    mmLog.Lines.Add('');
    mmLog.Lines.Add('===========================');
    mmLog.Lines.Add('>> Tempo de Execução: ' + FormatDateTime('hh:mm:ss', Time - vHoraInicio));
    mmLog.Lines.Add('');

    tblEmpTemp.EnableControls;
    ControlaPageControl(2);
    FreeAndNil(FListaEmpresa);
   //vImportadorAlterdataBase.Free();
  end;
end;

procedure TfrmImportador_Alterdata.chkSelecionaEmpresasClick(Sender: TObject);
begin
  tblEmpTemp.DisableControls;

  tblEmpTemp.First;
  while not(tblEmpTemp.Eof) do
    begin
      tblEmpTemp.Edit;
      tblEmpTemp.FieldByName('StImporta').AsBoolean := chkSelecionaEmpresas.Checked;
      tblEmpTemp.Post;
      tblEmpTemp.Next;
    end;
  tblEmpTemp.First;
  
  tblEmpTemp.EnableControls;
end;

procedure TfrmImportador_Alterdata.btnLoadEsqEmpresaClick(Sender: TObject);
begin
  if dlgOpenEsq.Execute then
    tblEmpTemp.LoadFromTextFile(dlgOpenEsq.FileName);
end;

procedure TfrmImportador_Alterdata.btnSaveEsqEmpresaClick(Sender: TObject);
const
  cFileName: string = 'Empresa';
  cFormatFileName: string = ' (hh-mm - dd-mm-yyyy)';
var
  vArquivo : string;
begin
  dlgSaveEsq.FileName := cFileName + FormatDateTime(cFormatFileName, now);
  if dlgSaveEsq.Execute then
    begin
      vArquivo := ExtractFileName(dlgSaveEsq.FileName);
      if Pos('.',vArquivo) > 0 then
        tblEmpTemp.SaveToTextFile(Copy(vArquivo, 1, Pos('.',vArquivo) - 1) + dlgSaveEsq.DefaultExt)
      else
        tblEmpTemp.SaveToTextFile(vArquivo + dlgSaveEsq.DefaultExt);
    end;
end;

function TfrmImportador_Alterdata.GridNotOk : Boolean;
var
  vCodigoEmpresa  : String;
  vExistsRegister : TStringList;
begin
  // Inicialization of variables.
  vExistsRegister := TStringList.Create;
  try
    tblEmpTemp.First;
    while not tblEmpTemp.Eof do
      begin
        if tblEmpTemp.FieldByName('StImporta').AsBoolean then
          begin
            //mexi aki
            if tblEmpTemp.FieldByName('CdEmpresaNew').IsNull then
              vCodigoEmpresa := tblEmpTemp.FieldByName('CdEmpresa').AsString
            else
              vCodigoEmpresa := tblEmpTemp.FieldByName('CdEmpresaNew').AsString;

            if (vExistsRegister.IndexOf(vCodigoEmpresa) > -1) and
               Empty(tblEmpTemp.FieldByName('CdEmpresaNew').AsString) then
              begin
                MessageBox(0, PChar('O código de chamada ''' + vCodigoEmpresa + ''' está duplicado, verifique!'), 'Atenção', MB_ICONWARNING or MB_OK);
                Result := True;
                Exit;
              end
            else
              vExistsRegister.Add(vCodigoEmpresa);
          end;

        tblEmpTemp.Next;
      end;

    Result := False;
  finally
    vExistsRegister.Free;
  end;
end;

procedure TfrmImportador_Alterdata.btnWPhdClearClick(Sender: TObject);
begin
  chkEmpresa.Checked := False;
  chkSocio.Checked := False;
  chkBureau.Checked := False;
end;

procedure TfrmImportador_Alterdata.btnGeralClearClick(Sender: TObject);
begin
  chkWphd.Checked := False;
  chkWdp.Checked := False;
  chkWinss.Checked := False;
  chkWcont.Checked := False;
  chkWfiscal.Checked := False;
end;

procedure TfrmImportador_Alterdata.btnWDpGeralClearClick(Sender: TObject);
begin
  chkSindicato.Checked := False;
  chkFuncao.Checked := False;
  chkHorario.Checked := False;
  chkDepartamento.Checked := False;
  chkBanco.Checked := False;
  chkAgencia.Checked := False;
  chkValeTransporte.Checked := False;
end;

procedure TfrmImportador_Alterdata.btnWDpPorEmpresaClearClick(Sender: TObject);
begin
  chkFuncionario.Checked := False;
  chkDependente.Checked := False;
  chkAfastamento.Checked := False;
  chkAcumulado.Checked := False;
  chkReajusteSalarial.Checked := False;
  chkTrocaDeFuncao.Checked := False;
  chkTrocaDeDepartamento.Checked := False;
end;

procedure TfrmImportador_Alterdata.btnWContGeralClearClick(Sender: TObject);
begin
  chkHistoricoPadrao.Checked := False;
  chkLancamentoAutomatico.Checked := False;
end;

procedure TfrmImportador_Alterdata.BitBtn2Click(Sender: TObject);
begin
  chkPlanoDeConta.Checked := False;
  chkLancamentoTemporario.Checked := False;
  chkCentrodeCusto.Checked := False;
end;

procedure TfrmImportador_Alterdata.btnWInssGeralClearClick(Sender: TObject);
begin
  chkAutonomo.Checked := False;
end;

procedure TfrmImportador_Alterdata.btnWInssPorEmpresaClearClick(Sender: TObject);
begin
  chkInssAcumulado.Checked := False;
end;

procedure TfrmImportador_Alterdata.cbxDBAlterdataChange(Sender: TObject);
begin
  // Montar tela de configurações do servidor Alterdata.
  if (cbxDBAlterdata.Text <> 'Selecione o concorrente...') and (cbxDBAlterdata.Text <> EmptyStr) then
    UValidadorDeDados.ShowConfiguracao(cbxDBAlterdata.Text,pnDbAlterdata);
end;

procedure TfrmImportador_Alterdata.cbxConcorrenteChange(Sender: TObject);
begin
  if (cbxConcorrente.Text <> 'Selecione o concorrente...') and (cbxConcorrente.Text <> EmptyStr) then
    if cbxConcorrente.Items.IndexOf(cbxConcorrente.Text) >= 0 then
      GetImportadorByCaption(cbxConcorrente.Text).ShowConfiguracao(pnConfig)
    else
      begin
        MessageBox(0, 'Conversor solicitado não existe.', 'Atenção', MB_ICONWARNING or MB_OK);
        cbxConcorrente.Text := 'Selecione o concorrente...';
        cbxConcorrente.SelectAll();
      end;
end;

procedure TfrmImportador_Alterdata.btnHelpClick(Sender: TObject);
begin
  Application.HelpFile := ExtractFilePath(Application.ExeName) + 'Conversor_PACK.chm';
  Application.HelpJump('');
end;

procedure TfrmImportador_Alterdata.actSaveLogExecute(Sender: TObject);
begin
  mmLog.SelectAll;
end;

procedure TfrmImportador_Alterdata.btnSaveLogClick(Sender: TObject);
const
  cFileName       = 'Log';
  cFormatFileName = ' (hh-mm - dd-mm-yyyy)';
var
  vArquivo : string;
begin
  dlgSaveLog.FileName := cFileName + FormatDateTime(cFormatFileName, now);
  if dlgSaveLog.Execute then
    begin
      vArquivo := ExtractFileName(dlgSaveLog.FileName);
      if Pos('.',vArquivo) > 0 then
        mmLog.Lines.SaveToFile(Copy(vArquivo, 1, Pos('.',vArquivo) - 1) + dlgSaveLog.DefaultExt)
      else
        mmLog.Lines.SaveToFile(vArquivo + dlgSaveLog.DefaultExt);
    end;
end;

procedure TfrmImportador_Alterdata.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TfrmImportador_Alterdata.ImportaSistemaWPHD;
var lValidadorDeDados        : TValidadorDeDados;
    lStatus                  : TStatus;
    lDataSetTemp             : TDataSet;
    lCdEmpresa               : string;
    lCGCEmpresa              : string;
    lCdEmpresaOld            : String;
    i                        : Integer;
    lImportadorAlterdataBase : TImportadorAlterdataBase;
begin
  lImportadorAlterdataBase := GetImportadorByCaption(cbxConcorrente.Text).Create;
  try
    lValidadorDeDados := TValidadorDeDados.GetByCaption('WPHD').Create;
    lStatus           := TStatus.Init(3, 'Importação do WPHD: Geral', True);
    try
      lValidadorDeDados.MapaEmpresa.ListaEmpresa := FListaEmpresa;

      //vValidadorDeDados.MapaEmpresa.ListaEmpresa.Assign(lListaEmpresa);

    //          for i := 0 to lListaEmpresa.Count -1 do
    //            begin
    //              vValidadorDeDados.MapaEmpresa.ListaEmpresa.Add(lListaEmpresa.Strings[i]);
    //            end;

      // Conversão da tabela 'Empresa.nx1'.

      lDataSetTemp := lImportadorAlterdataBase.GetDataSetImpConcorrente('WPHD.Empresa');
      if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
        lValidadorDeDados.Validar('WPHD.Empresa', lDataSetTemp, mmLog.Lines);

      lStatus.Position := lStatus.Position + 1;

       // Conversão da tabela 'WPhd.nx1'.
      if chkBureau.Checked then
        begin
          lDataSetTemp := lImportadorAlterdataBase.GetDataSetImpConcorrente('WPHD.Bureau');
          if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
            lValidadorDeDados.Validar('WPHD.Bureau', lDataSetTemp, mmLog.Lines);
        end
      else
        lValidadorDeDados.Validar('WPHD.Bureau', nil, mmLog.Lines);

      lStatus.Position := lStatus.Position + 1;

      // Conversão da tabela 'Socios.nx1'.
      if chkSocio.Checked then
        begin
          lDataSetTemp := lImportadorAlterdataBase.GetDataSetImpConcorrente('WPHD.Socio');
          if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
            lValidadorDeDados.Validar('WPHD.Socio', lDataSetTemp, mmLog.Lines);

  //        lDataSetTemp := pImportadorAlterdataBase.GetDataSetImpConcorrente('WPHD.VinculoSocio');
  //        if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
  //          lValidadorDeDados.Validar('WPHD.VinculoSocio', lDataSetTemp, mmLog.Lines);
        end;

      if chkSocio.Checked then
        begin
          for i := 0 to Length(FEmpresaList) - 1 do
            begin
              // Alimentar 'vIdEmpresa' com o id da empresa atual.
              lCGCEmpresa   := Copy(FEmpresaList[i], Pos('|', FEmpresaList[i]) + 1, Length(FEmpresaList[i]));
              lCdEmpresaOld := Copy(FEmpresaList[i], 1, Pos('|', FEmpresaList[i]) - 1);

              if Empty(lCGCEmpresa) or lValidadorDeDados.MapaEmpresa.ObterEmpresa(lCGCEmpresa, toeCPFCNPJ).CGCDuplicado then
                lCdEmpresa := IntToStr(lValidadorDeDados.MapaEmpresa.ObterEmpresa(lCdEmpresaOld, toeCodigoAntigo).Codigo)
              else
                lCdEmpresa := IntToStr(lValidadorDeDados.MapaEmpresa.ObterEmpresa(lCGCEmpresa, toeCPFCNPJ).Codigo);

              // Conversão da tabela 'Socios.nx1'.
              //lDataSetTemp := lImportadorAlterdataBase.GetDataSetImpConcorrente('WPHD.VinculoSocio');

              lDataSetTemp := lImportadorAlterdataBase.GetDataSetImpConcorrente('WPHD.VinculoSocio', lCdEmpresaOld);

              if (lDataSetTemp = nil) then
                lDataSetTemp := lImportadorAlterdataBase.GetDataSetImpConcorrente('WPHD.VinculoSocio');

              if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
                lValidadorDeDados.Validar('WPHD.VinculoSocio', lCdEmpresa, lDataSetTemp, mmLog.Lines);
            end;
        end;

      lStatus.Position := lStatus.Position + 1;
    finally
      lValidadorDeDados.Free();
      FreeAndNIl(lStatus);
    end;

    if chkSocio.Checked and chkWdp.Checked then
      begin
        lStatus           := TStatus.Init(Length(FEmpresaList), 'Importação do WPHD: Por Empresa', True);
        lValidadorDeDados := TValidadorDeDados.GetByCaption('WINSS').Create;
        try
          lValidadorDeDados.MapaEmpresa.ListaEmpresa := FListaEmpresa;
          for i := 0 to Length(FEmpresaList) - 1 do
            begin
              // Alimentar 'vIdEmpresa' com o id da empresa atual.
              lCGCEmpresa   := Copy(FEmpresaList[i], Pos('|', FEmpresaList[i]) + 1, Length(FEmpresaList[i]));
              lCdEmpresaOld := Copy(FEmpresaList[i], 1, Pos('|', FEmpresaList[i]) - 1);

              if Empty(lCGCEmpresa) or lValidadorDeDados.MapaEmpresa.ObterEmpresa(lCGCEmpresa, toeCPFCNPJ).CGCDuplicado then
                lCdEmpresa := IntToStr(lValidadorDeDados.MapaEmpresa.ObterEmpresa(lCdEmpresaOld, toeCodigoAntigo).Codigo)
              else
                lCdEmpresa := IntToStr(lValidadorDeDados.MapaEmpresa.ObterEmpresa(lCGCEmpresa, toeCPFCNPJ).Codigo);

              // Conversão da tabela 'TB?????.nx1'.
              lDataSetTemp  := lImportadorAlterdataBase.GetDataSetImpConcorrente('WINSS.ContribuinteSocio', lCdEmpresaOld);
              if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
                lValidadorDeDados.Validar('WINSS.Contribuinte', lCdEmpresa, lDataSetTemp, mmLog.Lines);

              lStatus.Position := lStatus.Position + 1;
            end;
        finally
          FreeAndNIl(lStatus);
          //FreeAndNIl(lValidadorDeDados);
          lValidadorDeDados.Free();
        end;
      end;
  finally
    //FreeAndNil(lImportadorAlterdataBase);
    lImportadorAlterdataBase.Free();
  end;
end;

procedure TfrmImportador_Alterdata.ImportaSistemaWDP;
var lValidadorDeDados        : TValidadorDeDados;
    lStatus                  : TStatus;
    lDataSetTemp             : TDataSet;
    lCdEmpresa               : string;
    lCGCEmpresa              : string;
    lCdEmpresaOld            : String;
    i                        : Integer;
    lImportadorAlterdataBase : TImportadorAlterdataBase;
begin
  lImportadorAlterdataBase := GetImportadorByCaption(cbxConcorrente.Text).Create;
  lValidadorDeDados        := TValidadorDeDados.GetByCaption('WDP').Create;
  try
    lValidadorDeDados.MapaEmpresa.ListaEmpresa := FListaEmpresa;
    lStatus := TStatus.Init(6, 'Importação do WDP: Por Empresa', True);
    try
      { Importação Geral }
      // Conversão da tabela 'EmpDp.nx1'.
      lDataSetTemp := lImportadorAlterdataBase.GetDataSetImpConcorrente('WDP.Empresa');
      if lDataSetTemp <> nil then
        lValidadorDeDados.Validar('WDP.Empresa', lDataSetTemp, mmLog.Lines);

      lStatus.Position := lStatus.Position + 1;

      // Conversão da tabela 'Sind.nx1'.
      if chkSindicato.Checked then
        begin
          lDataSetTemp := lImportadorAlterdataBase.GetDataSetImpConcorrente('WDP.Sindicato');
          if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
            lValidadorDeDados.Validar('WDP.Sindicato', lDataSetTemp, mmLog.Lines);
        end;
      lStatus.Position := lStatus.Position + 1;

      // Conversão da tabela 'Horario.nx1'.
      if chkHorario.Checked then
        begin
          lDataSetTemp := lImportadorAlterdataBase.GetDataSetImpConcorrente('WDP.Horario');
          if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
            lValidadorDeDados.Validar('WDP.Horario', lDataSetTemp, mmLog.Lines);
        end;
      lStatus.Position := lStatus.Position + 1;

      // -> Conversão das tabelas 'FuncoesB.nx1' e 'FuncoesR.nx1'.
      if chkFuncao.Checked then
        begin
          lDataSetTemp := lImportadorAlterdataBase.GetDataSetImpConcorrente('WDP.Funcao');
          if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
            lValidadorDeDados.Validar('WDP.Funcao', lDataSetTemp, mmLog.Lines);
        end;
      lStatus.Position := lStatus.Position + 1;

      // Conversão da tabela 'Bancos.nx1'.
      if chkBanco.Checked then
        begin
          lDataSetTemp := lImportadorAlterdataBase.GetDataSetImpConcorrente('WDP.Banco');
          if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
            lValidadorDeDados.Validar('WDP.Banco', lDataSetTemp, mmLog.Lines);
        end;

      lStatus.Position := lStatus.Position + 1;
    finally
      FreeAndNIl(lStatus);
    end;

    { Importação Por Empresa }

    lStatus := TStatus.Init(Length(FEmpresaList), 'Importação do WDP: Geral', True);
    try
      // Vinculação de eventos
      if chkAcumulado.Checked then
        begin
          lDataSetTemp := lImportadorAlterdataBase.GetDataSetImpConcorrente('WDP.Evento');
          if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
            lValidadorDeDados.Validar('WDP.Evento', lDataSetTemp, mmLog.Lines);

          Repaint;
        end;

      // Vinculação de especiais
      if chkAfastamento.Checked then
        begin
          lDataSetTemp := lImportadorAlterdataBase.GetDataSetImpConcorrente('WDP.Especial');
          if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
            lValidadorDeDados.Validar('WDP.Especial', lDataSetTemp, mmLog.Lines);

          Repaint;
        end;

      for i := 0 to Length(FEmpresaList) - 1 do
        begin
          // Alimentar 'vIdEmpresa' com o id da empresa atual.
          lCGCEmpresa   := Copy(FEmpresaList[i], Pos('|', FEmpresaList[i]) + 1, Length(FEmpresaList[i]));
          lCdEmpresaOld := Copy(FEmpresaList[i], 1, Pos('|', FEmpresaList[i]) - 1);

          if Empty(lCGCEmpresa) or lValidadorDeDados.MapaEmpresa.ObterEmpresa(lCGCEmpresa, toeCPFCNPJ).CGCDuplicado then
            lCdEmpresa := IntToStr(lValidadorDeDados.MapaEmpresa.ObterEmpresa(lCdEmpresaOld, toeCodigoAntigo).Codigo)
          else
            lCdEmpresa := IntToStr(lValidadorDeDados.MapaEmpresa.ObterEmpresa(lCGCEmpresa, toeCPFCNPJ).Codigo);

          // Conversão da tabela 'Depto.nx1'.
          if chkDepartamento.Checked then
            begin
              lDataSetTemp  := lImportadorAlterdataBase.GetDataSetImpConcorrente('WDP.Departamento', lCdEmpresaOld);

              if (lDataSetTemp = nil) then
                lDataSetTemp := lImportadorAlterdataBase.GetDataSetImpConcorrente('WDP.Departamento');

              if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
                lValidadorDeDados.Validar('WDP.Departamento', lCdEmpresa, lDataSetTemp, mmLog.Lines);
            end;

          // -> Conversão das tabelas 'F?????.nx1'.
          if chkFuncionario.Checked then
            begin
              lDataSetTemp  := lImportadorAlterdataBase.GetDataSetImpConcorrente('WDP.Funcionario', lCdEmpresaOld);
              if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
                lValidadorDeDados.Validar('WDP.Funcionario', lCdEmpresa, lDataSetTemp, mmLog.Lines)
              else
                Continue;
            end;

          // -> Conversão das tabelas 'D?????.nx1'.
          if chkDependente.Checked then
            begin
              lDataSetTemp  := lImportadorAlterdataBase.GetDataSetImpConcorrente('WDP.Dependente', lCdEmpresaOld);
              if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
                lValidadorDeDados.Validar('WDP.Dependente', lCdEmpresa, lDataSetTemp, mmLog.Lines);
            end;

          // -> Conversão das tabelas 'A?????.nx1'.
          if chkAfastamento.Checked then
            begin
              lDataSetTemp := lImportadorAlterdataBase.GetDataSetImpConcorrente('WDP.Afastamento', lCdEmpresaOld);

              if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
                lValidadorDeDados.Validar('WDP.Afastamento', lCdEmpresa, lDataSetTemp, mmLog.Lines);

              lDataSetTemp := lImportadorAlterdataBase.GetDataSetImpConcorrente('WDP.Ferias', lCdEmpresaOld);
              if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
                lValidadorDeDados.Validar('WDP.Ferias', lCdEmpresa, lDataSetTemp, mmLog.Lines);
            end;

          // -> Conversão das tabelas 'R?????.nx1'.
          if chkAcumulado.Checked then
            begin
              lDataSetTemp := lImportadorAlterdataBase.GetDataSetImpConcorrente('WDP.Acumulado', lCdEmpresaOld);
              if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
                lValidadorDeDados.Validar('WDP.Acumulado', lCdEmpresa, lDataSetTemp, mmLog.Lines);
            end;

          // -> Conversão das tabelas 'L?????.nx1'.
          if chkReajusteSalarial.Checked then
            begin
              lDataSetTemp := lImportadorAlterdataBase.GetDataSetImpConcorrente('WDP.ReajusteSalarial', lCdEmpresaOld);
              if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
                lValidadorDeDados.Validar('WDP.ReajusteSalarial', lCdEmpresa, lDataSetTemp, mmLog.Lines);
            end;

          lStatus.Position := lStatus.Position + 1;
        end;
    finally
      FreeAndNIl(lStatus);
    end;
  finally
    lValidadorDeDados.Free();
    lImportadorAlterdataBase.Free();
  end;

  {* WINSS *}
  if chkWinss.Checked then
    ImportaSistemaWINSS;

  DeleteFiles(GetEnvironmentVariable('TEMP') + '\*.CPack');
end;

procedure TfrmImportador_Alterdata.ImportaSistemaWINSS;
var lValidadorDeDados        : TValidadorDeDados;
    lStatus                  : TStatus;
    lDataSetTemp             : TDataSet;
    lCdEmpresa               : string;
    lCGCEmpresa              : string;
    lCdEmpresaOld            : String;
    i                        : Integer;
    lImportadorAlterdataBase : TImportadorAlterdataBase;
begin
  lImportadorAlterdataBase := GetImportadorByCaption(cbxConcorrente.Text).Create;
  lImportadorAlterdataBase.Create;  
  lValidadorDeDados        := TValidadorDeDados.GetByCaption('WINSS').Create;
  try
    lValidadorDeDados.MapaEmpresa.ListaEmpresa := FListaEmpresa;
    lStatus := TStatus.Init(1, 'Importação do WINSS: Por Empresa', True);
    try
      // Vinculação de eventos
      if chkInssAcumulado.Checked then
        begin
          lDataSetTemp := lImportadorAlterdataBase.GetDataSetImpConcorrente('WINSS.Evento');
          if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
            lValidadorDeDados.Validar('WINSS.Evento', lDataSetTemp, mmLog.Lines);
          Repaint;
        end;

      // Conversão da tabela 'CadAuto.nx1'.
      if chkAutonomo.Checked then
        begin
          lDataSetTemp := lImportadorAlterdataBase.GetDataSetImpConcorrente('WINSS.Autonomo');
          if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
            lValidadorDeDados.Validar('WINSS.Autonomo', lDataSetTemp, mmLog.Lines);
        end;
      lStatus.Position := lStatus.Position + 1;
    finally
      FreeAndNIl(lStatus);
    end;

    lStatus := TStatus.Init(Length(FEmpresaList), 'Importação do WINSS: Geral', True);
    try
      for i := 0 to Length(FEmpresaList) - 1 do
        begin
          // Alimentar 'vIdEmpresa' com o id da empresa atual.
          lCGCEmpresa   := Copy(FEmpresaList[i], Pos('|', FEmpresaList[i]) + 1, Length(FEmpresaList[i]));
          lCdEmpresaOld := Copy(FEmpresaList[i], 1, Pos('|', FEmpresaList[i]) - 1);

          if Empty(lCGCEmpresa) or lValidadorDeDados.MapaEmpresa.ObterEmpresa(lCGCEmpresa, toeCPFCNPJ).CGCDuplicado then
            lCdEmpresa := IntToStr(lValidadorDeDados.MapaEmpresa.ObterEmpresa(lCdEmpresaOld, toeCodigoAntigo).Codigo)
          else
            lCdEmpresa := IntToStr(lValidadorDeDados.MapaEmpresa.ObterEmpresa(lCGCEmpresa, toeCPFCNPJ).Codigo);

          // Conversão da tabela 'TB?????.nx1'.
          if chkAutonomo.Checked then
            begin
              lDataSetTemp := lImportadorAlterdataBase.GetDataSetImpConcorrente('WINSS.ContribuinteAutonomo', lCdEmpresaOld);
              if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
                lValidadorDeDados.Validar('WINSS.Contribuinte', lCdEmpresa, lDataSetTemp, mmLog.Lines);
            end;

          // Conversão da tabela 'IR?????.nx1'.
          if chkInssAcumulado.Checked then
            begin
              lDataSetTemp := lImportadorAlterdataBase.GetDataSetImpConcorrente('WINSS.Acumulado', lCdEmpresaOld);
              if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
                lValidadorDeDados.Validar('WINSS.Acumulado', lCdEmpresa, lDataSetTemp, mmLog.Lines);
            end;

          lStatus.Position := lStatus.Position + 1;
        end;
    finally
      FreeAndNIl(lStatus);
    end;
  finally
    lValidadorDeDados.Free();
    lImportadorAlterdataBase.Free();
  end;
end;

procedure TfrmImportador_Alterdata.ImportaSistemaWCONT;
var lValidadorDeDados        : TValidadorDeDados;
    lStatus                  : TStatus;
    lDataSetTemp             : TDataSet;
    lCdEmpresa               : string;
    lCGCEmpresa              : string;
    lCdEmpresaOld            : String;
    i                        : Integer;
    lImportadorAlterdataBase : TImportadorAlterdataBase;
begin
  lImportadorAlterdataBase := GetImportadorByCaption(cbxConcorrente.Text).Create;
  lImportadorAlterdataBase.Create;  
  lValidadorDeDados        := TValidadorDeDados.GetByCaption('WCONT').Create;
  try
    lValidadorDeDados.MapaEmpresa.ListaEmpresa := FListaEmpresa;
    lStatus := TStatus.Init(2, 'Importação do WCONT: Por Empresa', True);
    try
      //vValidadorDeDados.MapaEmpresa.ListaEmpresa.Assign(lListaEmpresa);

      { Importação Geral }

      // Conversão da tabela 'EmpCont.nx1'.
      lDataSetTemp := lImportadorAlterdataBase.GetDataSetImpConcorrente('WCONT.Empresa');
      if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
        lValidadorDeDados.Validar('WCONT.Empresa', lDataSetTemp, mmLog.Lines);

      lStatus.Position := lStatus.Position + 1;

      // Conversão da tabela 'Hist.nx1'.
      if chkHistoricoPadrao.Checked then
        begin
          lDataSetTemp := lImportadorAlterdataBase.GetDataSetImpConcorrente('WCONT.HistoricoPadrao');
          if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
            lValidadorDeDados.Validar('WCONT.HistoricoPadrao', lDataSetTemp, mmLog.Lines);
        end;
      lStatus.Position := lStatus.Position + 1;

      // Conversão da tabela 'LAuto.nx1'.
      if chkHistoricoPadrao.Checked then
        begin
          lDataSetTemp := lImportadorAlterdataBase.GetDataSetImpConcorrente('WCONT.LancamentoAutomatico');
          if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
            lValidadorDeDados.Validar('WCONT.LancamentoAutomatico', lDataSetTemp, mmLog.Lines);
        end;
      lStatus.Position := lStatus.Position + 1;

      // Conversão da tabela 'PCont.nx1' e 'Contas.nx1'..
      if chkPlanoDeConta.Checked then
        begin
          lDataSetTemp := lImportadorAlterdataBase.GetDataSetImpConcorrente('WCONT.PlanoDeConta');
          if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
            lValidadorDeDados.Validar('WCONT.PlanoDeConta', lDataSetTemp, mmLog.Lines);

          lDataSetTemp := lImportadorAlterdataBase.GetDataSetImpConcorrente('WCONT.Conta');
          if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
            lValidadorDeDados.Validar('WCONT.Conta', lDataSetTemp, mmLog.Lines);
        end;
      lStatus.Position := lStatus.Position + 1;

      {TODO -o Edson.dsn -c VERIFICAR: Verificar comentário correto para esse ponto.}
      // Conversão da tabela 'PCont.nx1' e 'Contas.nx1'..
      if chkCentrodeCusto.Checked then
        begin
          lDataSetTemp := lImportadorAlterdataBase.GetDataSetImpConcorrente('WCONT.PlanoDeCentroDeCusto');
          if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
            lValidadorDeDados.Validar('WCONT.PlanoDeCentroDeCusto', lDataSetTemp, mmLog.Lines);

          lDataSetTemp := lImportadorAlterdataBase.GetDataSetImpConcorrente('WCONT.CentroDeCusto');
          if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
            lValidadorDeDados.Validar('WCONT.CentroDeCusto', lDataSetTemp, mmLog.Lines);
        end;
      lStatus.Position := lStatus.Position + 1;
    finally
      FreeAndNIl(lStatus);
    end;

    // -> Conversão das tabelas 'MV?????.txt'.
    if chkLancamentoTemporario.Checked then
      begin
        { Importação Por Empresa }
        lStatus := TStatus.Init(Length(FEmpresaList), 'Importação do WCONT: Geral', True);
        try
          for i := 0 to Length(FEmpresaList) - 1 do
            begin
              // Alimentar 'vIdEmpresa' com o id da empresa atual.
              lCGCEmpresa   := Copy(FEmpresaList[i], Pos('|', FEmpresaList[i]) + 1, Length(FEmpresaList[i]));
              lCdEmpresaOld := Copy(FEmpresaList[i], 1, Pos('|', FEmpresaList[i]) - 1);

              if Empty(lCGCEmpresa) or lValidadorDeDados.MapaEmpresa.ObterEmpresa(lCGCEmpresa, toeCPFCNPJ).CGCDuplicado then
                lCdEmpresa := IntToStr(lValidadorDeDados.MapaEmpresa.ObterEmpresa(lCdEmpresaOld, toeCodigoAntigo).Codigo)
              else
                lCdEmpresa := IntToStr(lValidadorDeDados.MapaEmpresa.ObterEmpresa(lCGCEmpresa, toeCPFCNPJ).Codigo);

              lDataSetTemp  := lImportadorAlterdataBase.GetDataSetImpConcorrente('WCONT.LancamentoTemporario', lCdEmpresaOld);
              if (lDataSetTemp <> nil) and (lDataSetTemp.RecordCount > 0) then
                lValidadorDeDados.Validar('WCONT.LancamentoTemporario', lCdEmpresa, lDataSetTemp, mmLog.Lines);

              lStatus.Position := lStatus.Position + 1;
            end;
        finally
          FreeAndNIl(lStatus);
        end;
      end;
  finally
    lValidadorDeDados.Free();
    lImportadorAlterdataBase.Free();
  end;
end;

procedure TfrmImportador_Alterdata.FormDestroy(Sender: TObject);
begin
  UValidadorDeDados.DestroyConfigurador;
  UnAssignImportadores();
end;

function TfrmImportador_Alterdata.BuscaPalavraNoComboBox(pPalvara: String; pComboBox: TComboBox): Boolean;
var
  i: Integer;
begin
  result := False;
//  if pComboBox.Items[pComboBox.ItemIndex] = AnsiContainsText(pPalvara);
  for i:= 0 to pComboBox.Items.Count - 1 do
    begin
      result := AnsiContainsText(pComboBox.Items[pComboBox.ItemIndex], pPalvara);
      if (result) then
        break;
    end;
end;

end.

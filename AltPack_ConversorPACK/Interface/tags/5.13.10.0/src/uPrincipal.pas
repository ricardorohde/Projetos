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
  Buttons;

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
    tblEmpTempCdEmpresa: TIntegerField;
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
    dlgOpen: TOpenDialog;
    dlgSave: TSaveDialog;
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
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
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
  private
    { Private declarations }
    function GridNotOk : Boolean;
    procedure ControlaPageControl(pActivePageIndex: Integer);
    procedure CarregarEmpresas(DataSetEmp:TDataSet);
    //procedure CriaFieldsDataSet;
  public
    { Public declarations }
  end;

var
  frmImportador_Alterdata: TfrmImportador_Alterdata;

const
  cNomePrograma : string = 'Importador Alterdata';
  cVersao : string = '5.13.10';

implementation

{$R *.dfm}

procedure TfrmImportador_Alterdata.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmImportador_Alterdata.FormShow(Sender: TObject);
begin
  Caption := cNomePrograma + ' - ' + cVersao;
  Application.Title := cNomePrograma;

  // Primeira aba sempre ativa.
  ControlaPageControl(0);

  // Listar concorrentes.
  FillWithImportadoresDisponiveis(cbxConcorrente.Items);

  //Listar banco de dados.
  LoadPackage(ExtractFilePath(Application.ExeName) + 'altpack_imp_validacoes_51310.bpl');
  FillWithConfiguradoresBD(cbxDBAlterdata.Items);
end;

procedure TfrmImportador_Alterdata.cxButton1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmImportador_Alterdata.btnAvancarClick(Sender: TObject);
var
  vImportadorAlterdataBase : TImportadorAlterdataBase;
  i : Integer;
  TpSistema : TTipoArraySistema;
  TpTabelas : TTipoArrayTabelas;
begin
  Repaint;
  try
    // Cria o Objeto do Importador do Concorrente pela seleção no ComboBox
    vImportadorAlterdataBase := GetImportadorByCaption(cbxConcorrente.Text).Create;
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
        end;
    except
      on E : EImportadorAlterdataException do
        MessageDlg(E.Message, mtWarning, [mbOK], 0)
      else
        raise;
    end;
  finally
    ControlaPageControl(1);
    vImportadorAlterdataBase.Destroy;
  end;
end;

procedure TfrmImportador_Alterdata.CarregarEmpresas(DataSetEmp:TDataSet);
var
  Status : TStatus;
  
begin
  Status := TStatus.Init(DataSetEmp.RecordCount,'Carregando Empresa...',True);
  try
    tblEmpTemp.Close;
    tblEmpTemp.Open;
    tblEmpTemp.DisableControls;

    DataSetEmp.First;
    while not DataSetEmp.EOF do
      begin
        Status.Position := Status.Position + 1;
        tblEmpTemp.Append;

        tblEmpTempStImporta.AsBoolean := True;
        tblEmpTempCdEmpresa.AsInteger := DataSetEmp.FieldByName('CdEmpresa').AsInteger;
        tblEmpTempNmEmpresa.AsString  := DataSetEmp.FieldByName('NmEmpresa').AsString;

        tblEmpTemp.Post;

        DataSetEmp.Next;
      end;

  finally
    tblEmpTemp.First;
    tblEmpTemp.EnableControls;
    Status.Free;
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

          // CheckBox(Checked and Enabled) Default: Wphd
          chkWphd.Checked := False;
            chkEmpresa.Checked := True;
            chkBureau.Checked := False;
            chkSocio.Checked := False;
          chkWphd.Enabled := False;
            chkEmpresa.Enabled := True;
            chkBureau.Enabled := False;
            chkSocio.Enabled := False;

          // CheckBox(Checked and Enabled) Default: WDp
          chkWdp.Checked := False;
            chkSindicato.Checked := False;
            chkFuncao.Checked := False;
            chkHorario.Checked := False;
            chkDepartamento.Checked := False;
            chkBanco.Checked := False;
            chkAgencia.Checked := False;
            chkValeTransporte.Checked := False;
            chkFuncionario.Checked := False;
            chkDependente.Checked := False;
            chkAfastamento.Checked := False;
            chkAcumulado.Checked := False;
            chkReajusteSalarial.Checked := False;
            chkTrocaDeFuncao.Checked := False;
            chkTrocaDeDepartamento.Checked := False;
          chkWdp.Enabled := False;
            chkSindicato.Enabled := False;
            chkFuncao.Enabled := False;
            chkHorario.Enabled := False;
            chkDepartamento.Enabled := False;
            chkBanco.Enabled := False;
            chkAgencia.Enabled := False;
            chkValeTransporte.Enabled := False;
            chkFuncionario.Enabled := False;
            chkDependente.Enabled := False;
            chkAfastamento.Enabled := False;
            chkAcumulado.Enabled := False;
            chkReajusteSalarial.Enabled := False;
            chkTrocaDeFuncao.Enabled := False;
            chkTrocaDeDepartamento.Enabled := False;

          // CheckBox(Cheked and Enabled) Default: WInss
          chkWinss.Checked := False;
            chkAutonomo.Checked := False;
            chkInssAcumulado.Checked := False;
          chkWinss.Enabled := False;
            chkAutonomo.Enabled := False;
            chkInssAcumulado.Enabled := False;

          // CheckBox(Cheked and Enabled) Default: WCont
          chkWcont.Checked := False;
          chkWcont.Enabled := False;

          // CheckBox(Cheked and Enabled) Default: WFiscal
          chkWfiscal.Checked := False;
          chkWfiscal.Enabled := False;
          
          // CheckBox(Cheked and Enabled) Default: WAtivo
          chkWativo.Checked := False;
          chkWativo.Enabled := False;

          btnVoltar.Enabled   := False;
          btnAvancar.Enabled  := True;
          btnConcluir.Enabled := False;
        end;
    1:  begin
          PageControl.ActivePageIndex    := 1;
          tsConfiguracoes.TabVisible     := False;
          tsTabelasImportadas.TabVisible := True;
          tsLogImportacao.TabVisible     := False;

          btnVoltar.Enabled   := True;
          btnAvancar.Enabled  := False;
          btnConcluir.Enabled := True;
        end;
    2:  begin
          PageControl.ActivePageIndex    := 2;
          tsConfiguracoes.TabVisible     := False;
          tsTabelasImportadas.TabVisible := False;
          tsLogImportacao.TabVisible     := True;

          btnVoltar.Enabled   := True;
          btnAvancar.Enabled  := False;
          btnConcluir.Enabled := False;
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
  i : Integer;
  vIdEmpresa : string;
  vEmpresaList : array of string;
  vHoraInicio : TTime;
  vDataSetTemp : TDataSet;
  vValidadorDeDados : TValidadorDeDados;
  vImportadorAlterdataBase : TImportadorAlterdataBase;

begin
  tblEmpTemp.DisableControls;

  // Verificar integridade do grid de empresas.
  if GridNotOk then
    begin
      tblEmpTemp.EnableControls;
      tblEmpTemp.First;
      Exit;
    end;

  // Montar lista de empresas
  tblEmpTemp.First;
  while not tblEmpTemp.Eof do
    begin
      if tblEmpTemp.FieldByName('StImporta').AsBoolean then
        begin
          SetLength(vEmpresaList, Length(vEmpresaList) + 1);
          if tblEmpTemp.FieldByName('CdEmpresaNew').IsNull then
            vEmpresaList[High(vEmpresaList)] := IntToStr(tblEmpTemp.FieldByName('CdEmpresa').AsInteger)
          else
            vEmpresaList[High(vEmpresaList)] := IntToStr(tblEmpTemp.FieldByName('CdEmpresa').AsInteger) + '|' + IntToStr(tblEmpTemp.FieldByName('CdEmpresaNew').AsInteger);
        end;
      tblEmpTemp.Next;
    end;

  try
    vHoraInicio := Time;

    // Cria o Objeto do Importador do Concorrente pela seleção no ComboBox
    vImportadorAlterdataBase := GetImportadorByCaption(cbxConcorrente.Text).Create;
      try

        {* WPHD *}

        if chkWphd.Checked then
          begin
            vValidadorDeDados := TValidadorDeDados.GetByCaption('WPHD').Create;

            // Conversão da tabela 'Empresa.nx1'.
            vDataSetTemp := vImportadorAlterdataBase.GetDataSetImpConcorrente('WPHD.Empresa');
            if vDataSetTemp <> nil then
              vValidadorDeDados.Validar('WPHD.Empresa', vEmpresaList, vDataSetTemp, mmLog.Lines);

             // Conversão da tabela 'WPhd.nx1'.
            if chkBureau.Checked then
              begin
                vDataSetTemp := vImportadorAlterdataBase.GetDataSetImpConcorrente('WPHD.Bureau');
                vValidadorDeDados.Validar('WPHD.Bureau', vDataSetTemp, mmLog.Lines);
              end
            else
              vValidadorDeDados.Validar('WPHD.Bureau', nil, mmLog.Lines);

            vValidadorDeDados.Free;
          end;

        {* WDP *}
        if chkWdp.Checked then
          begin
            vValidadorDeDados := TValidadorDeDados.GetByCaption('WDP').Create;

            { Importação Geral }

            // Conversão da tabela 'EmpDp.nx1'.
            vDataSetTemp := vImportadorAlterdataBase.GetDataSetImpConcorrente('WDP.Empresa');
            if vDataSetTemp <> nil then
              vValidadorDeDados.Validar('WDP.Empresa', vEmpresaList, vDataSetTemp, mmLog.Lines);

            // Conversão da tabela 'Sind.nx1'.
            if chkSindicato.Checked then
              begin
                vDataSetTemp := vImportadorAlterdataBase.GetDataSetImpConcorrente('WDP.Sindicato');
                if vDataSetTemp <> nil then
                  vValidadorDeDados.Validar('WDP.Sindicato', vDataSetTemp, mmLog.Lines);
              end;

            // -> Conversão das tabelas 'FuncoesB.nx1' e 'FuncoesR.nx1'.
            if chkFuncao.Checked then
              begin
                vDataSetTemp := vImportadorAlterdataBase.GetDataSetImpConcorrente('WDP.Funcao');
                if vDataSetTemp <> nil then
                  vValidadorDeDados.Validar('WDP.Funcao', vDataSetTemp, mmLog.Lines);
              end;

            { Importação Por Empresa }

            // Vinculação de eventos
            if chkAcumulado.Checked then
              begin
                vDataSetTemp := vImportadorAlterdataBase.GetDataSetImpConcorrente('WDP.Evento');
                if vDataSetTemp <> nil then
                  vValidadorDeDados.Validar('WDP.Evento', vDataSetTemp, mmLog.Lines);
                Repaint;
              end;

            for i := 0 to Length(vEmpresaList) - 1 do
              begin
                // Alimentar 'vIdEmpresa' com o id da empresa atual.
                if Pos('|', vEmpresaList[i]) > 0 then
                  vIdEmpresa := Copy(vEmpresaList[i], Pos('|', vEmpresaList[i]) + 1, Length(vEmpresaList[i]))
                else
                  vIdEmpresa := vEmpresaList[i];

                // -> Conversão das tabelas 'F?????.nx1'.
                if chkFuncionario.Checked then
                  begin
                    vDataSetTemp := vImportadorAlterdataBase.GetDataSetImpConcorrente('WDP.Funcionario', StrToInt(vIdEmpresa));
                    if vDataSetTemp <> nil then
                      vValidadorDeDados.Validar('WDP.Funcionario', StrToInt(vIdEmpresa), vDataSetTemp, mmLog.Lines);
                  end;

                // -> Conversão das tabelas 'D?????.nx1'.
                if chkDependente.Checked then
                  begin
                    vDataSetTemp := vImportadorAlterdataBase.GetDataSetImpConcorrente('WDP.Dependente', StrToInt(vIdEmpresa));
                    if vDataSetTemp <> nil then
                      vValidadorDeDados.Validar('WDP.Dependente', StrToInt(vIdEmpresa), vDataSetTemp, mmLog.Lines);
                  end;

                // -> Conversão das tabelas 'A?????.nx1'.
                if chkAfastamento.Checked then
                  begin
                    vDataSetTemp := vImportadorAlterdataBase.GetDataSetImpConcorrente('WDP.Afastamento', StrToInt(vIdEmpresa));
                    if vDataSetTemp <> nil then
                      vValidadorDeDados.Validar('WDP.Afastamento', StrToInt(vIdEmpresa), vDataSetTemp, mmLog.Lines);
                  end;

                // -> Conversão das tabelas 'R?????.nx1'.
                if chkAcumulado.Checked then
                  begin
                    vDataSetTemp := vImportadorAlterdataBase.GetDataSetImpConcorrente('WDP.Acumulado', StrToInt(vIdEmpresa));
                    if vDataSetTemp <> nil then
                      vValidadorDeDados.Validar('WDP.Acumulado', StrToInt(vIdEmpresa), vDataSetTemp, mmLog.Lines);
                  end;
              end;

              if FileExists(GetEnvironmentVariable('TEMP') + '\' + 'ImpAlt_EsqEvent.txt') then
                DeleteFiles(GetEnvironmentVariable('TEMP') + '\' + 'ImpAlt_EsqEvent.txt');

              vValidadorDeDados.Free;
          end;

        if chkWinss.Checked then
          begin
            vValidadorDeDados := TValidadorDeDados.GetByCaption('WINSS').Create;

            for i := 0 to Length(vEmpresaList) - 1 do
              begin
                // Alimentar 'vIdEmpresa' com o id da empresa atual.
                if Pos('|', vEmpresaList[i]) > 0 then
                  vIdEmpresa := Copy(vEmpresaList[i], Pos('|', vEmpresaList[i]) + 1, Length(vEmpresaList[i]))
                else
                  vIdEmpresa := vEmpresaList[i];

                 // Conversão da tabela 'CadAuto.nx1'.
                if chkAutonomo.Checked then
                  begin
                    vDataSetTemp := vImportadorAlterdataBase.GetDataSetImpConcorrente('WINSS.Autonomo', StrToInt(vIdEmpresa));
                    if vDataSetTemp <> nil then
                      vValidadorDeDados.Validar('WINSS.Autonomo', StrToInt(vIdEmpresa), vDataSetTemp, mmLog.Lines);
                  end;
              end;

            vValidadorDeDados.Free;  
          end;

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

    tblEmpTemp.EnableControls;
    ControlaPageControl(2);
    vImportadorAlterdataBase.Destroy;
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
  if dlgOpen.Execute then
    tblEmpTemp.LoadFromTextFile(dlgOpen.FileName);
end;

procedure TfrmImportador_Alterdata.btnSaveEsqEmpresaClick(Sender: TObject);
var
  vArquivo : string;
begin
  if dlgSave.Execute then
    begin
      vArquivo := ExtractFileName(dlgSave.FileName);
      if Pos('.',vArquivo) > 0 then
        tblEmpTemp.SaveToTextFile(Copy(vArquivo, 1, Pos('.',vArquivo) - 1) + dlgSave.DefaultExt)
      else
        tblEmpTemp.SaveToTextFile(vArquivo + dlgSave.DefaultExt);
    end;
end;

function TfrmImportador_Alterdata.GridNotOk : Boolean;
var
  vCodigoEmpresa : Integer;
  vExistsRegister : TStringList;
begin
  try
    // Inicialization of variables.
    vExistsRegister := TStringList.Create;

    tblEmpTemp.First;
    while not tblEmpTemp.Eof do
      begin
        if tblEmpTemp.FieldByName('StImporta').AsBoolean then
          begin
            if tblEmpTemp.FieldByName('CdEmpresaNew').IsNull then
              vCodigoEmpresa := tblEmpTemp.FieldByName('CdEmpresa').AsInteger
            else
              vCodigoEmpresa := tblEmpTemp.FieldByName('CdEmpresaNew').AsInteger;

            if vExistsRegister.IndexOf(IntToStr(vCodigoEmpresa)) > -1 then
              begin
                MessageBox(0, PChar('O código de chamada ''' + IntToStr(vCodigoEmpresa) + ''' está duplicado, verifique!'), 'Atenção', MB_ICONWARNING or MB_OK);
                Result := True;
                Exit;
              end
            else
              vExistsRegister.Add(IntToStr(vCodigoEmpresa));
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
  UValidadorDeDados.ShowConfiguracao(cbxDBAlterdata.Text,pnDbAlterdata);
end;

procedure TfrmImportador_Alterdata.cbxConcorrenteChange(Sender: TObject);
begin
  if (cbxConcorrente.Text <> 'Selecione o concorrente...') and (cbxConcorrente.Text <> '') then
    GetImportadorByCaption(cbxConcorrente.Text).ShowConfiguracao(pnConfig);
end;

end.

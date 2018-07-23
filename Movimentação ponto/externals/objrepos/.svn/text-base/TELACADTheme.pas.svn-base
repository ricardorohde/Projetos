{-------------------------------------------------------------------------------
 Alterdata Pack
 Repositório padrão para cadastros

================================================================================
 Processo    Data        Versão       Programador     Observações
================================================================================

 0011383030  01/02/2006               Alex@dsn        Em função da conversão dos botões de SpeedButton para BitBtn, foi necessário colocar o foco no Grid
 0003354068  23/10/2009  5.1011       Moises          Remoção de referências a NxSetupTable para utilização de ClientDataSets
 0003573673  04/02/2010  5.1210.1     Moises          Revertendo ação anterior
-------------------------------------------------------------------------------}

unit TELACADTheme;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Menus,
  DB, DBTables, Grids, DBGrids, ExtCtrls, QuickRpt, TelaEditTheme, ComCtrls,
  AltRepStd, DbCtrls, ToolWin, SetupTable, Buttons, StdCtrls, Alterdata, AlterdataTypes,
  Alterdata_consts, AlterdataDatabase, ImgList, AltSearch_lookup, SetupQuery;


type
  TfrmCadTheme = class(TForm)
    dtsTabela: TDataSource;
    RptTabela: TReportStd;
    Panel2: TPanel;
    StatusBar: TStatusBar;
    BarPadrao: TToolBar;
    btnNovo: TBitBtn;
    btnAbrir: TBitBtn;
    btnExcluir: TBitBtn;
    btnLocalizar: TBitBtn;
    btnImprimir: TBitBtn;
    btnVisualizar: TBitBtn;
    grdtabela: TDbGrid;
    btnSair: TBitBtn;
    btnAjuda: TBitBtn;
    TeThemePopupMenu1: TPopupMenu;
    mniPopupNovo: TMenuItem;
    mniPopupAlterar: TMenuItem;
    mniPopupExcluir: TMenuItem;
    CustomItem1: TMenuItem;
    mniPopupLocalizar: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    mnutabela: TMainMenu;
    mmiArquivo: TMenuItem;
    mniNovo: TMenuItem;
    mniEditar: TMenuItem;
    mniExcluir: TMenuItem;
    mniLocalizar: TMenuItem;
    mniBarra1: TMenuItem;
    mniImprimir: TMenuItem;
    mniVisualizarImpressao: TMenuItem;
    mniBarra2: TMenuItem;
    mniSair: TMenuItem;
    mniAjuda: TMenuItem;
    procedure btnAbrirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure dtsTabelaDataChange(Sender: TObject; Field: TField);
    procedure btnNovoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

    procedure Initialize( TableReference: TDataSet;
                          FrmEditaClass : TFormClass; var frmEditaReference );

    procedure PostError(Mensagem : String; Reference : TWinControl);

    procedure mPopupSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure mniImprimir_oldClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure grdTabelaKeyPress(Sender: TObject; var Key: Char);
    procedure mniAjuda_oldClick(Sender: TObject);
    procedure grdtabelaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FFrmEditaTheme     : TFrmEditaTheme;
    FOnProcura         : TNotifyEvent;
    FOnRelatorio       : TNotifyEvent;
    FOnVisualizar      : TNotifyEvent;

    FEnableRecordCount : Boolean;
    FTableCadastro     : TDataSet;
    FTitulo	       : String;
    FfrmEditaModal     : Boolean;
    procedure SetTableCadastro( Value: TDataSet );
  public
    { Public declarations }
    JumpID     : String;
    msgDetalhe : String;
  published
    property FrmEditaTheme: TfrmEditaTheme read FFrmEditaTheme     write FFrmEditaTheme;
    property TableCadastro: TDataSet 	   read FTableCadastro     write SetTableCadastro;
    property Titulo: String 		   read FTitulo 	   write FTitulo;
    property frmEditaModal : Boolean 	   read FfrmEditaModal     write FfrmEditaModal;

    property OnProcura: TNotifyEvent       read FOnProcura         write FOnProcura;
    property OnRelatorio: TNotifyEvent     read FOnRelatorio       write FOnRelatorio;
    property OnVisualizar: TNotifyEvent    read FOnVisualizar      write FOnVisualizar;
    property EnableRecordCount : Boolean   read FEnableRecordCount write FEnableRecordCount;
  end;
  // Função que abrirá o tela Edita permitindo a inclusão de um novo registro
  function NovoCadastro( Form: TFormClass; var ReferenceCad; var ReferenceEdit; ID: TCustomEdit; msg : String = '' ): String;

implementation

{$R *.DFM}

procedure TfrmCadTheme.Initialize( TableReference: TDataSet;
                              FrmEditaClass : TFormClass; var frmEditaReference );
begin
  //caption do form de edicao sera igual ao do form de cadastro
  Titulo := Caption;
  //Crio o form de edicao e atribuo sua refecencia no campo do form Cadastro.
  Application.CreateForm(FrmEditaClass,frmEditaReference);
  FFrmEditaTheme := TFrmEditaTheme(frmEditaReference);
  //Seto as tabelas nos dois formularios
  FTableCadastro       := TableReference;
  FfrmEditaTheme.TableEdita := TableReference;
  FfrmEditaTheme.JumpID     :=  JumpID;
end;

procedure TfrmCadTheme.PostError(Mensagem : String; Reference : TWinControl);
begin
  MessageDlg( Mensagem, mtError, [mbOk], 0);
  if Reference.CanFocus then
    Reference.SetFocus;
  Abort;
end;

procedure TfrmCadTheme.SetTableCadastro( Value: TDataSet );
begin
  if (FTableCadastro <> Value) then
  begin
    FTableCadastro := Value;
    DtsTabela.DataSet := Value;
  end;
end;

procedure TfrmCadTheme.btnNovoClick(Sender: TObject);
begin
  if (Assigned(frmEditaTheme)) and (btnNovo.Enabled) and (btnNovo.Visible) then
  begin
    frmEditaTheme.Caption := FTitulo + ' (Cadastramento)';
    FTableCadastro.Append;
    if FfrmEditaModal then begin
        frmEditaTheme.ShowModal;
        if Assigned(OnActivate) then OnActivate(self);
      end
    else frmEditaTheme.Show;
  end;

  // Processo 0011383030 - 01/02/2006 - Alex@dsn
  if (grdtabela.canfocus) and (Self.Showing) then
    grdtabela.SetFocus
  else
    ActiveControl := nil;  
end;

procedure TfrmCadTheme.btnAbrirClick(Sender: TObject);
begin
  if (Assigned(frmEditaTheme)) and (btnAbrir.Enabled) and (btnAbrir.Visible) then
  begin
    frmEditaTheme.Caption := FTitulo + ' (Alteração)';
    FTableCadastro.Edit;
    if FfrmEditaModal then
      begin
        frmEditaTheme.ShowModal;
        if Assigned(OnActivate) then
          OnActivate(self);
      end
    else frmEditaTheme.Show;
  end;

  // Processo 0011383030 - 01/02/2006 - Alex@dsn
  if (grdtabela.canfocus) and (Self.Showing) then
    grdtabela.SetFocus
  else
    ActiveControl := nil;  
end;

procedure TfrmCadTheme.btnExcluirClick(Sender: TObject);
begin
  if (Assigned(FTableCadastro)) and (FTableCadastro.Active) and
     (btnExcluir.Enabled) and (btnExcluir.Visible) then
    if (MessageDlg('Confirma a exclusão deste cadastro?',mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      FTableCadastro.Delete;

  // Processo 0011383030 - 01/02/2006 - Alex@dsn
  if (grdtabela.canfocus) and (Self.Showing) then
    grdtabela.SetFocus
  else
    ActiveControl := nil;      
end;

procedure TfrmCadTheme.btnVisualizarClick(Sender: TObject);
begin
  if Assigned(FOnVisualizar) then FOnVisualizar(Sender)
  else
    begin                            {acrescido o menu - Ney 31/01/06}
      if (Sender = btnVisualizar) or (Sender = mniVisualizarImpressao) then
        RptTabela.Preview
      else
        RptTabela.Print
    end;

  // Processo 0011383030 - 01/02/2006 - Alex@dsn
  if (grdtabela.canfocus) and (Self.Showing) then
    grdtabela.SetFocus
  else
    ActiveControl := nil;    
end;

procedure TfrmCadTheme.dtsTabelaDataChange(Sender: TObject; Field: TField);
//var
//  RecordCount: Integer;
begin
  if (Assigned(FTableCadastro)) then
  begin
    (*if FTableCadastro.Active then
      begin
        if FEnableRecordCount then
           RecordCount := FTableCadastro.RecordCount
        else
          begin
            if FTableCadastro.BOF and FTableCadastro.EOF then
              RecordCount := 0
            else
              RecordCount := 1;
          end;
      end
    else
      RecordCount := -1;*)

    mniNovo.Enabled                := (FTableCadastro.Active) and (Assigned(FfrmEditaTheme)); //(RecordCount >= 0)
    mniEditar.Enabled              := (not FTableCadastro.IsEmpty) and (Assigned(FfrmEditaTheme)); //(RecordCount > 0)
    mniExcluir.Enabled             := (not FTableCadastro.IsEmpty) and (Assigned(FfrmEditaTheme)); //(RecordCount > 0)
    mniImprimir.Enabled            := (not FTableCadastro.IsEmpty); //(RecordCount > 0)
    mniVisualizarImpressao.Enabled := (not FTableCadastro.IsEmpty); //(RecordCount > 0)
    mniLocalizar.Enabled           := (not FTableCadastro.IsEmpty); //(RecordCount > 0)

    btnNovo.Enabled       := mniNovo.Enabled;
    btnAbrir.Enabled      := mniEditar.Enabled;
    btnExcluir.Enabled    := mniExcluir.Enabled;
    btnImprimir.Enabled   := mniImprimir.Enabled;
    btnVisualizar.Enabled := mniVisualizarImpressao.Enabled;
    btnLocalizar.Enabled  := mniLocalizar.Enabled;

    mniPopupNovo.Visible     := mniNovo.Visible;
    mniPopupAlterar.Visible  := mniEditar.Visible;
    mniPopupExcluir.Visible  := mniExcluir.Visible;

    mniPopupNovo.Enabled     := mniNovo.Enabled;
    mniPopupAlterar.Enabled  := mniEditar.Enabled;
    mniPopupExcluir.Enabled  := mniExcluir.Enabled;

    (*if FEnableRecordCount and (RecordCount >= 0) then
      StatusBar.Panels[0].Text := 'Registros : ' + IntToStr(RecordCount)
    else*)
    StatusBar.Panels[0].Text := '';
  end;
end;

procedure TfrmCadTheme.FormActivate(Sender: TObject);
begin
  Application.OnHint := nil;
  //Comentei a linha abaixo pois o componente VCLTranslator que usa o este evento e parava de funcionar. - Cláudia - 20/04/2006
  //Screen.OnActiveFormChange := nil;

  //0003354068 23/10/2009 moises@dsn Removi um close desnecessário
  //0003573673 04/02/2010 moises@dsn Revertendo ação anterior
  if (Assigned(FTableCadastro)) and (FTableCadastro.Active) and
     ((FTableCadastro is TSetupTable) or (FTableCadastro is TSetupQuery)) then
    FTableCadastro.Refresh;
end;

procedure TfrmCadTheme.mPopupSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadTheme.FormCreate(Sender: TObject);
begin
  FfrmEditaModal      := True;
  FEnableRecordCount  := True;

  if (Assigned(FTableCadastro)) and (FTableCadastro is TSetupTable) and
     (TSetupTable(FTableCadastro).TableName <> '') then
    begin
      Screen.Cursor := crHourGlass;
      try
        if not (OpenTable(FTableCadastro as TSetupTable)) then
          Abort;
      finally
        Screen.Cursor := crDefault;
      end;
    end
  else
    if Assigned(FTableCadastro) and (FTableCadastro is TSetupQuery) and
       (TSetupQuery(FTableCadastro).SQL.Text <> '') then
    begin
      Screen.Cursor := crHourGlass;
      try
        TSetupQuery(FTableCadastro).Open;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
end;

procedure TfrmCadTheme.btnLocalizarClick(Sender: TObject);
begin
  if Assigned(FOnProcura) then
    FOnProcura(Sender)
  else
    AltSearch_lookup.SearchDlgLookup(FTableCadastro, Caption);

  // Processo 0011383030 - 01/02/2006 - Alex@dsn
  if (grdtabela.canfocus) and (Self.Showing) then
    grdtabela.SetFocus
  else
    ActiveControl := nil;
end;

procedure TfrmCadTheme.mniImprimir_oldClick(Sender: TObject);
begin
  //Chama a impressao do relatorio
  if (btnImprimir.Enabled) and (btnImprimir.Visible) then
    if Confirm('Confirma a impressão do relatório?') then
      if Assigned(FOnRelatorio) then
        FOnRelatorio(Sender)
      else RptTabela.Print;

  // Processo 0011383030 - 01/02/2006 - Alex@dsn
  if (grdtabela.canfocus) and (Self.Showing) then
    grdtabela.SetFocus
  else
    ActiveControl := nil;      
end;

procedure TfrmCadTheme.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

  //Fecho o form de edicao
  if (frmEditaTheme <> nil) then
    frmEditaTheme.Close;

  if (Assigned(FTableCadastro)) then
    FTableCadastro.Close;

  // Restaura os eventos
  //Comentei a linha abaixo pois o componente VCLTranslator que usa o este evento e parava de funcionar. - Cláudia - 20/04/2006
  //Screen.OnActiveFormChange := nil;
  Application.OnHint := nil;

  if Assigned(Application.MainForm.OnActivate) then
    Application.MainForm.OnActivate(self);
end;

procedure TfrmCadTheme.FormDestroy(Sender: TObject);
begin
  if not(Application.Terminated) and (frmEditaTheme <> nil) then
  begin
    frmEditaTheme.Close;
    frmEditaTheme.free;
  end;
end;

procedure TfrmCadTheme.grdTabelaKeyPress(Sender: TObject; var Key: Char);
begin
  //Se for precionado o enter chamo o telaedit.
  If Key = #13 then
    btnAbrirClick(Sender);
end;

// Função que irá abrir o Tela Edita para um novo cadastramento
function NovoCadastro( Form: TFormClass; var ReferenceCad; var ReferenceEdit; ID: TCustomEdit; msg : String = '' ): String;
begin
  if (msg = '') then
    msg := 'Código não encontrado no cadastro. Deseja incluir um novo agora?';

  if MessageDlg(msg, mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    Application.CreateForm(Form, ReferenceCad);
    TFrmCadTheme(ReferenceCad).dtsTabela.DataSet.Append;
    TFrmEditaTheme(ReferenceEdit).FirstField.Enabled := false;
    TFrmEditaTheme(ReferenceEdit).CloseAfterPost := true;
    TfrmEditaTheme(ReferenceEdit).Caption := TfrmCadTheme(ReferenceCad).Caption + ' (Cadastramento)';
    if (Id <> nil) and (TfrmEditaTheme(ReferenceEdit).FirstField <> nil) then
      if (TfrmEditaTheme(ReferenceEdit).FirstField is TDbEdit) or
         (TfrmEditaTheme(ReferenceEdit).FirstField is TDbEdit) then
        with TFrmCadTheme(ReferenceCad).dtsTabela.DataSet Do
          FieldByName(TDbEdit(TfrmEditaTheme(ReferenceEdit).FirstField).DataField).AsString := ID.Text
      else
         TCustomEdit( TfrmEditaTheme(ReferenceEdit).FirstField ).Text := ID.Text;
    TfrmEditaTheme(ReferenceEdit).ShowModal;
    if (TfrmEditaTheme(ReferenceEdit).modalresult = 2) then
       if (TfrmEditaTheme(ReferenceEdit).FirstField is TDbEdit) then
          Result := TFrmCadTheme(ReferenceCad).dtsTabela.DataSet.FieldByName(TDbEdit(TfrmEditaTheme(ReferenceEdit).FirstField).DataField).AsString
       else
          if ID.Text <> '' then
             Result := TCustomEdit( TfrmEditaTheme(ReferenceEdit).FirstField ).Text
          else
             Result := '';
    TFrmCadTheme(ReferenceCad).Free;
    TFrmCadTheme(ReferenceCad) := nil;
  end;
  if (ID <> nil) and (ID.CanFocus) then ID.SetFocus;
end;

procedure TfrmCadTheme.mniAjuda_oldClick(Sender: TObject);
begin
  Application.HelpJump( JumpID );

  // Processo 0011383030 - 01/02/2006 - Alex@dsn
  if (grdtabela.canfocus) and (Self.Showing) then
    grdtabela.SetFocus
  else
    ActiveControl := nil;  
end;

procedure TfrmCadTheme.grdtabelaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Screen.Cursor := crDefault;
end;

procedure TfrmCadTheme.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_INSERT then
    btnNovo.Click
  else if ( ssCtrl in Shift ) and (Key = 69) then // Ctrl + E
    btnAbrir.Click
  else if ( ssCtrl in Shift ) and (Key = 46) then // Ctrl + Del
    btnExcluir.Click
  else if ( ssCtrl in Shift ) and (Key = 70) then // Ctrl + F
    btnLocalizar.Click
  else if ( ssCtrl in Shift ) and (Key = 80) then // Ctrl + P
    btnImprimir.Click
  else if (Key = VK_F1) then // F1
    btnAjuda.Click
end;

procedure TfrmCadTheme.FormShow(Sender: TObject);
begin
  mniPopupNovo.Visible     := mniNovo.Visible;
  mniPopupAlterar.Visible  := mniEditar.Visible;
  mniPopupExcluir.Visible  := mniExcluir.Visible;

  mniPopupNovo.Enabled     := mniNovo.Enabled;
  mniPopupAlterar.Enabled  := mniEditar.Enabled;
  mniPopupExcluir.Enabled  := mniExcluir.Enabled;
end;

end.

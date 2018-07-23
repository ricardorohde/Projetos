
{ Processo 0011383030 - 01/02/2006 - Alex@dsn - Em função da conversão dos botões
                                                de SpeedButton para BitBtn, foi
                                                necessário colocar o foco no Grid.
}
unit telacad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Menus,
  DB, DBTables, Grids, DBGrids, ExtCtrls, QuickRpt, TelaEdit, ComCtrls, AltRepStd,
  DbCtrls, ToolWin, SetupTable, Buttons, StdCtrls, Alterdata, AlterdataTypes,
  Alterdata_consts, AlterdataDatabase, AltSearch_lookup, SetupQuery;

type
  TfrmCad = class(TForm)
    Panel2: TPanel;
    dtsTabela: TDataSource;
    mnuTabela: TMainMenu;
    mmiArquivo: TMenuItem;
    mniNovo: TMenuItem;
    mniEditar: TMenuItem;
    mniExcluir: TMenuItem;
    mniBarra1: TMenuItem;
    mniImprimir: TMenuItem;
    mniVisualizarImpressao: TMenuItem;
    StatusBar: TStatusBar;
    mniSair: TMenuItem;
    mniBarra2: TMenuItem;
    mniLocalizar: TMenuItem;
    RptTabela: TReportStd;
    BarPadrao: TToolBar;
    btnNovo: TBitBtn;
    btnAbrir: TBitBtn;
    btnExcluir: TBitBtn;
    btnLocalizar: TBitBtn;
    ToolButton1: TToolButton;
    btnImprimir: TBitBtn;
    btnVisualizar: TBitBtn;
    ToolButton200: TToolButton;
    grdTabela: TDBGrid;
    mniAjuda: TMenuItem;
    btnSair: TBitBtn;
    btnAjuda: TBitBtn;
    ToolButton300: TToolButton;
    TeThemePopupMenu1: TPopupMenu;
    mniPopupNovo: TMenuItem;
    mniPopupAlterar: TMenuItem;
    mniPopupExcluir: TMenuItem;
    CustomItem1: TMenuItem;
    mniPopupLocalizar: TMenuItem;
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
    procedure mniImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure grdTabelaKeyPress(Sender: TObject; var Key: Char);
    procedure mniAjudaClick(Sender: TObject);
    procedure btnAjudaClick(Sender: TObject);
  private
    { Private declarations }
    FFrmEdita          : TFrmEdita;
    FOnProcura         : TNotifyEvent;
    FOnRelatorio       : TNotifyEvent;
    FOnVisualizar      : TNotifyEvent;

    FEnableRecordCount : Boolean;
    FTableCadastro     : TDataSet;
    FTitulo	       : String;
    FfrmEditaModal 		 : Boolean;

    procedure SetTableCadastro( Value: TDataSet );
    procedure DisplayHint(Sender : TObject);
    procedure DisableHint(Sender : TObject);
  public
    { Public declarations }
    JumpID     : String;
    msgDetalhe : String;

  published
    property FrmEdita: TfrmEdita          read FFrmEdita          write FFrmEdita;
    property TableCadastro: TDataSet 		  read FTableCadastro     write SetTableCadastro;
    property Titulo: String 						  read FTitulo 			     	write FTitulo;
    property frmEditaModal : Boolean 		  read FfrmEditaModal     write FfrmEditaModal;

    property OnProcura: TNotifyEvent      read FOnProcura         write FOnProcura;
    property OnRelatorio: TNotifyEvent    read FOnRelatorio       write FOnRelatorio;
    property OnVisualizar: TNotifyEvent   read FOnVisualizar      write FOnVisualizar;
    property EnableRecordCount : Boolean	read FEnableRecordCount write FEnableRecordCount;
  end;

  // Função que abrirá o tela Edita permitindo a inclusão de um novo registro
  function NovoCadastro( Form: TFormClass; var ReferenceCad; var ReferenceEdit;
    ID: TCustomEdit; msg : String = '' ): String;

implementation

{$R *.DFM}

procedure TfrmCad.Initialize( TableReference: TDataSet;
                              FrmEditaClass : TFormClass; var frmEditaReference );
begin
  //caption do form de edicao sera igual ao do form de cadastro
  Titulo := Caption;

  //Crio o form de edicao e atribuo sua refecencia no campo do form Cadastro.
  Application.CreateForm(FrmEditaClass,frmEditaReference);
  FFrmEdita := TFrmEdita(frmEditaReference);

  //Seto as tabelas nos dois formularios
  FTableCadastro       := TableReference;
  FFrmEdita.TableEdita := TableReference;
  FFrmEdita.JumpID     :=  JumpID;
end;


procedure TfrmCad.DisplayHint(Sender : TObject);
begin
  //
  // Marcelo pediu para tirar o Hint da barra de Status pq quando colocava-se o mouse
  // sobre um componente de uma janela desabilitada, mostrava-se então o hint do mesmo.
  // Está assim temporariamente e vou tentar consertar usando o evento Application.OnShowHint
  // Leonardo
  //
  // Mostra os Hints na barra de Status
  //StatusBar.Panels[1].Text := Application.Hint;

end;

procedure TfrmCad.DisableHint(Sender : TObject);
begin
  // Restaura o Hint Anterior
  if Screen.ActiveForm.Name <> Name then
    begin
      Application.OnHint := nil;
      StatusBar.Panels[1].Text := '';
    end
  else
    begin
      Application.OnHint := DisplayHint;
      Screen.OnActiveFormChange := DisableHint;
    end;
end;

procedure TfrmCad.PostError(Mensagem : String; Reference : TWinControl);
begin
  // mostra a mensagem
  MessageDlg( Mensagem, mtError, [mbOk], 0);
  // Muda o foco

  if Reference.CanFocus then
    Reference.SetFocus;
  // Cancela o post
  Abort;
end;

procedure TfrmCad.SetTableCadastro( Value: TDataSet );
begin
  if (FTableCadastro <> Value) then
  begin
    FTableCadastro := Value;
    DtsTabela.DataSet := Value;
  end;
end;

procedure TfrmCad.btnNovoClick(Sender: TObject);
begin
  if Assigned(frmEdita) then
  begin
    frmEdita.Caption := FTitulo + ' (Cadastramento)';
    FTableCadastro.Append;

    if FfrmEditaModal then
      begin
        frmEdita.ShowModal;
        if Assigned(OnActivate) then
          OnActivate(self);
      end
    else frmEdita.Show;
  end;

  // Processo 0011383030 - 01/02/2006 - Alex@dsn
  if (grdtabela.canfocus) and (Self.Showing) then
    grdtabela.SetFocus
  else
    ActiveControl := nil;
end;

procedure TfrmCad.btnAbrirClick(Sender: TObject);
begin
  if Assigned(frmEdita) and btnAbrir.Enabled then
  begin
    frmEdita.Caption := FTitulo + ' (Alteração)';
    FTableCadastro.Edit;

    if FfrmEditaModal then
      begin
        frmEdita.ShowModal;
        if Assigned(OnActivate) then
          OnActivate(self);
      end
    else frmEdita.Show;
  end;

  // Processo 0011383030 - 01/02/2006 - Alex@dsn
  if (grdtabela.canfocus) and (Self.Showing) then
    grdtabela.SetFocus
  else
    ActiveControl := nil;  
end;

procedure TfrmCad.btnExcluirClick(Sender: TObject);
begin
  if Assigned(FTableCadastro) and (FTableCadastro.Active) then
    if (MessageDlg('Confirma a exclusão deste cadastro?',mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      FTableCadastro.Delete;

  // Processo 0011383030 - 01/02/2006 - Alex@dsn
  if (grdtabela.canfocus) and (Self.Showing) then
    grdtabela.SetFocus
  else
    ActiveControl := nil;      
end;

procedure TfrmCad.btnVisualizarClick(Sender: TObject);
begin
  //Chama a Visualizacao do relatorio
  If Assigned(FOnVisualizar) then
    FOnVisualizar(Sender)
  else RptTabela.Preview;

  // Processo 0011383030 - 01/02/2006 - Alex@dsn
  if (grdtabela.canfocus) and (Self.Showing) then
    grdtabela.SetFocus
  else
    ActiveControl := nil;  
end;

procedure TfrmCad.dtsTabelaDataChange(Sender: TObject; Field: TField);
//var
//  RecordCount: Integer;

begin
  If Assigned(FTableCadastro) then
  begin
    (*if FTableCadastro.Active then
      begin
        if FEnableRecordCount then
           RecordCount := FTableCadastro.RecordCount
        else
          begin
            if FTableCadastro.BOF and FTableCadastro.EOF then
              RecordCount := 0
            else RecordCount := 1;
          end;
      end
    else RecordCount := -1;*)

    mniNovo.Enabled                := (FTableCadastro.Active) and (Assigned(FfrmEdita)) (*(RecordCount >= 0)*);
    mniEditar.Enabled              := (not FTableCadastro.IsEmpty) and (Assigned(FfrmEdita)) (*(RecordCount > 0)*);
    mniExcluir.Enabled             := (not FTableCadastro.IsEmpty) and (Assigned(FfrmEdita)) (*(RecordCount > 0)*);
    mniImprimir.Enabled            := (not FTableCadastro.IsEmpty) (*(RecordCount > 0)*);
    mniVisualizarImpressao.Enabled := (not FTableCadastro.IsEmpty) (*(RecordCount > 0)*);
    mniLocalizar.Enabled           := (not FTableCadastro.IsEmpty) (*(RecordCount > 0)*);

    btnNovo.Enabled       := mniNovo.Enabled;
    btnAbrir.Enabled      := mniEditar.Enabled;
    btnExcluir.Enabled    := mniExcluir.Enabled;
    btnImprimir.Enabled   := mniImprimir.Enabled;
    btnVisualizar.Enabled := mniVisualizarImpressao.Enabled;
    btnLocalizar.Enabled  := mniLocalizar.Enabled;

    (*if FEnableRecordCount and (RecordCount >= 0) then
      StatusBar.Panels[0].Text := 'Registros : ' + IntToStr(RecordCount)
    else*)

    StatusBar.Panels[0].Text := '';
  end;
end;

procedure TfrmCad.FormActivate(Sender: TObject);
begin
  Application.OnHint        := nil;
  //Comentei a linha abaixo pois o componente VCLTranslator que usa o este evento e parava de funcionar. - Cláudia - 20/04/2006
  //Screen.OnActiveFormChange := nil;

  If Assigned(FTableCadastro) and FTableCadastro.Active then
    FTableCadastro.Refresh;
end;

procedure TfrmCad.mPopupSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCad.FormCreate(Sender: TObject);
begin
  FfrmEditaModal      := True;
  FEnableRecordCount  := True;

  if Assigned(FTableCadastro) and (FTableCadastro is TSetupTable) and
     (TSetupTable(FTableCadastro).TableName <> '') then
    begin
      Screen.Cursor := crHourGlass;
      try
        if not OpenTable( FTableCadastro as TSetupTable ) then
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

procedure TfrmCad.btnLocalizarClick(Sender: TObject);
begin
  if Assigned(FOnProcura) then
    FOnProcura(Sender)
  else
    SearchDlglookup(FTableCadastro, Caption);

  // Processo 0011383030 - 01/02/2006 - Alex@dsn
  if (grdtabela.canfocus) and (Self.Showing) then
    grdtabela.SetFocus
  else
    ActiveControl := nil;
end;

procedure TfrmCad.mniImprimirClick(Sender: TObject);
begin
  //Chama a impressao do relatorio
  if Confirm('Confirma a impressão do relatório?') then
   if Assigned(FOnRelatorio) then
     FOnRelatorio(Sender)
   else
     RptTabela.Print;

  // Processo 0011383030 - 01/02/2006 - Alex@dsn
  if (grdtabela.canfocus) and (Self.Showing) then
    grdtabela.SetFocus
  else
    ActiveControl := nil;     
end;

procedure TfrmCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

  //Fecho o form de edicao
  if frmEdita <> nil then frmEdita.Close;
  //
  // Alexandre estou fechando o frmEdita antes para ele poder cancelar as alterações
  //
  If Assigned(FTableCadastro) then
    FTableCadastro.Close;

  // Restaura os eventos
  Application.OnHint        := nil;
  //Comentei a linha abaixo pois o componente VCLTranslator que usa o este evento e parava de funcionar. - Cláudia - 20/04/2006
  //Screen.OnActiveFormChange := nil;
end;

procedure TfrmCad.FormDestroy(Sender: TObject);
begin
  if not(Application.Terminated) and (frmedita <> nil) then
  begin
    frmEdita.Close;
    frmEdita.free;
  end;
end;

procedure TfrmCad.grdTabelaKeyPress(Sender: TObject; var Key: Char);
begin
  //Se for precionado o enter chamo o telaedit.
  If Key = #13 then
    btnAbrirClick(Sender);
end;

function NovoCadastro( Form: TFormClass; var ReferenceCad; var ReferenceEdit;
  ID: TCustomEdit; msg : String = '' ): String;
begin
  if (msg = '') then
    msg := 'Código não encontrado no cadastro. Deseja incluir um novo agora?';

  if MessageDlg(msg, mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    { Crio o form de Cadastro }
    Application.CreateForm(Form, ReferenceCad);

    { Coloco a tabela em modo de Inserção }
    TFrmCad(ReferenceCad).dtsTabela.DataSet.Append;
    TFrmEdita(ReferenceEdit).FirstField.Enabled := False;
    TFrmEdita(ReferenceEdit).CloseAfterPost := True;

    { Coloco o nome na tela de edição }
    TfrmEdita(ReferenceEdit).Caption := TfrmCad(ReferenceCad).Caption + ' (Cadastramento)';

    //se for passado nil no ID (edit), deixa o código de chamada por conta da função
    //que tiver sido colocada no newRecord da tabela
    if (Id <> nil) and (TFrmEdita(ReferenceEdit).FirstField <> nil) then
      if TFrmEdita(ReferenceEdit).FirstField is TDbEdit then
        with TFrmCad(ReferenceCad).dtsTabela.DataSet do
          FieldByName(TDBEdit(TFrmEdita(ReferenceEdit).FirstField).DataField).AsString := ID.Text
      else
        TCustomEdit( TFrmEdita(ReferenceEdit).FirstField ).Text := ID.Text;

    { Mostro a Tela de Edição }
    TFrmEdita(ReferenceEdit).ShowModal;
    { Destruo o form de Cadastro }
    TfrmCad(ReferenceCad).Free;
    TfrmCad(ReferenceCad) := nil;
  end;
  // jogo o foco para o campo
  if (ID <> nil) and (ID.CanFocus) then ID.SetFocus;
end;

procedure TfrmCad.mniAjudaClick(Sender: TObject);
begin
  Application.HelpJump( JumpID );
end;

procedure TfrmCad.btnAjudaClick(Sender: TObject);
begin
  Application.HelpJump( JumpID );

  // Processo 0011383030 - 01/02/2006 - Alex@dsn
  if (grdtabela.canfocus) and (Self.Showing) then
    grdtabela.SetFocus
  else
    ActiveControl := nil;
end;

end.

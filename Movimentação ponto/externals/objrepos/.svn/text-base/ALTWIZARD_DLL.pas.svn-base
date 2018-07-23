{------------------------------------------------------------------------------
 Biblioteca de Componentes Alterdata
 unit AltWizard_dll.Pas

 Criada em 28/03/2003 por Gabriel@dsn
 Descrição: Wizard Padrão para dlls

 Observações:
   ATENÇÃO!!!

   O TabOrder do botão Voltar está fora da ordem para que o foco caia no botão
   Avançar assim que o usuário sair do Notebook.

0012230583 - Adoniram.dsn - 30.01.2008 - Ajuste na informação da versão   
 ------------------------------------------------------------------------------}
unit AltWizard_dll;

interface

uses
  ImgList, Forms, SysUtils, Classes, Controls, ExtCtrls, Windows, Graphics, Menus,
  RxGIF, ComCtrls, Db, SetupTable, Buttons, StdCtrls, Alterdata, AlterdataTypes,
  Alterdata_consts, AlterdataDatabase, GIFImage;

type
  TfrmWizard_dll = class(TForm)
    Bevel1: TBevel;
    btnAvancar: TBitBtn;
    btnFechar: TBitBtn;
    btnCancelar: TBitBtn;
    btnConcluir: TBitBtn;
    btnVoltar: TBitBtn;
    btnHelp: TBitBtn;
    ImageList: TImageList;
    PageControl: TPageControl;
    imgLogo: TImage;
    btnVersaoDoModulo: TSpeedButton;
    lblVersao: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnAvancarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnVersaoDoModuloClick(Sender: TObject);
  private
    { Private declarations }
    FNotebook      : TPageControl;
    FHasStatusPage : Boolean;
    FHasResultPage : Boolean;
    FIdxConcluir   : Byte;
    FStartPage     : TTabSheet;
    FNextPage      : Integer;
    FPriorPage     : Integer;
    FAnoDoModulo: String;
    FCaptionDaVersao: String;
    FVersaoDoModulo: String;
    procedure AdicionaImagensBotoes;

    procedure CloseTables;
    procedure FocusFirstControl;
    procedure SetVersaoDoModulo(const Value: String);
    procedure AlinharBotao();
  public
    { Public declarations }
    JumpID   	       : String;
    property Notebook  : TPageControl        read FNotebook  write FNotebook;
    property NextPage  : Integer             read FNextPage  write FNextPage;
    property PriorPage : Integer             read FPriorPage write FPriorPage;
    procedure Initialize( Notebk : TPageControl; StartPage : TTabSheet; HasStatusPage, HasResultPage : Boolean );
    procedure CarregaSessionName(SessionName: String);
    {Propriedades criadas para exibir a versão do módulo - Adoniram.dsn - processo 0012230583 - 30.01.2008}
    property AnoDoModulo:String read FAnoDoModulo write FAnoDoModulo;
    property VersaoDoModulo:String read FVersaoDoModulo write SetVersaoDoModulo;
    property CaptionDaVersao:String read FCaptionDaVersao write FCaptionDaVersao;
  end;

var
  frmWizard_dll: TfrmWizard_dll;

implementation

uses
  Dialogs;

{$R *.DFM}

{------------------------------------------------------------------------------}

procedure TfrmWizard_dll.Initialize( Notebk : TPageControl;
  StartPage : TTabSheet; HasStatusPage, HasResultPage : Boolean );
begin
  if Assigned( Notebk ) then
  begin
    NoteBook            := Notebk;
    NoteBook.ActivePage := StartPage;
    FStartPage          := StartPage;
    FHasStatusPage      := HasStatusPage;
    FHasResultPage      := HasResultPage;
    FNextPage           := -1;
    FPriorPage          := -1;

    //
    // Calculo o índice da página onde aparece o botão Concluir
    // O default é a última página
    FIdxConcluir        := NoteBook.PageCount - 1;
    //
    // Verifico se o Notebook tem pelo menos 3 páginas
    if NoteBook.PageCount >= 3 then
    begin
      //
      // Se tiver página de Status, diminuo mais uma página para o botão
      // Concluir
      if FHasStatusPage then
        Dec( FIdxConcluir );
      //
      // Se tiver página de Resultado, diminuo mais uma página para o botão
      // Concluir
      if FHasResultPage then
        Dec( FIdxConcluir );
    end;

    //
    // Habilita o botão Concluir caso a tela tenha apenas 3 páginas
    // no Notebook
    // Por Leonardo em 15/03/2000
    btnConcluir.Visible := NoteBook.ActivePage.PageIndex = FIdxConcluir;
    btnAvancar.Visible  := not btnConcluir.Visible;
  end;
end;
{------------------------------------------------------------------------------}

procedure TfrmWizard_dll.FocusFirstControl;
var
  Control : TWinControl;
begin
  Control := FindNextControl( Notebook, True, True, False );

  if Control.CanFocus then
    Control.SetFocus;
end;
{------------------------------------------------------------------------------}

procedure TfrmWizard_dll.FormShow(Sender: TObject);
begin
  FocusFirstControl;
  {0012293937 - Adoniram.dsn - 03.09.2008}
  btnVoltar.Enabled := False;
end;
{------------------------------------------------------------------------------}

procedure TfrmWizard_dll.btnVoltarClick(Sender: TObject);
begin
  if Assigned( Notebook ) then
  begin
    //
    // Se estiver na ultima página, volto para a primeira
    if NoteBook.ActivePage.PageIndex = ( NoteBook.PageCount - 1 ) then
      begin
        NoteBook.ActivePage := FStartPage;
        btnConcluir.Enabled := True;
        btnCancelar.Visible := True;
        btnFechar.Visible   := False;
      end
    else
      if FPriorPage = -1 then
        Notebook.ActivePage :=  Notebook.Pages[Notebook.ActivePage.PageIndex - 1]
      else
        begin
          Notebook.ActivePage :=  Notebook.Pages[FPriorPage];
          FPriorPage         := -1;
        end;

    btnVoltar.Enabled   := NoteBook.ActivePage.PageIndex > 0;
    btnConcluir.Visible := NoteBook.ActivePage.PageIndex = FIdxConcluir;
    btnAvancar.Visible  := not btnConcluir.Visible;

    FocusFirstControl;
  end;
end;
{------------------------------------------------------------------------------}

procedure TfrmWizard_dll.btnAvancarClick(Sender: TObject);
begin
  if Assigned( Notebook ) then
  begin
    if FNextPage = -1 then
      NoteBook.ActivePage := NoteBook.Pages[NoteBook.ActivePage.PageIndex + 1]
    else
      begin
        NoteBook.ActivePage := NoteBook.Pages[FNextPage];
        FNextPage          := -1;
      end;

    btnVoltar.Enabled   := NoteBook.ActivePage.PageIndex > 0;
    btnConcluir.Visible := NoteBook.ActivePage.PageIndex = FIdxConcluir;
    btnAvancar.Visible  := not btnConcluir.Visible;

    FocusFirstControl;
  end;
end;
{------------------------------------------------------------------------------}

procedure TfrmWizard_dll.btnConcluirClick(Sender: TObject);
begin
  if Assigned( Notebook ) then
  begin
    btnVoltar.Enabled    := False;
    btnConcluir.Enabled  := False;
    btnAvancar.Visible   := False;
    btnCancelar.Visible  := False;
    btnFechar.Visible    := True;

    //
    // Avanço mais uma página se houver página de Status ou de Resultado
    if FHasStatusPage or FHasResultPage then
      NoteBook.ActivePage := Notebook.Pages[NoteBook.ActivePage.PageIndex + 1];

    FocusFirstControl;
  end;
end;
{------------------------------------------------------------------------------}

procedure TfrmWizard_dll.btnCancelarClick(Sender: TObject);
begin
  Close;
end;
{------------------------------------------------------------------------------}

procedure TfrmWizard_dll.btnFecharClick(Sender: TObject);
begin
  Close;
end;
{------------------------------------------------------------------------------}

procedure TfrmWizard_dll.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
//var
//aux :String;
begin
  EnableEnter( Self, Key, Shift );
  //
  // Por Leonardo em 03/04/2000
  if Key = VK_NEXT then
  begin
    if btnAvancar.Visible and btnAvancar.Enabled then
      btnAvancar.Click
    else
      if btnConcluir.Visible and btnConcluir.Enabled then
        btnConcluir.Click;
  end;

  if ( Key = VK_PRIOR ) and btnVoltar.Enabled then
    btnVoltar.Click;

  if (kEY = VK_F1) then
    btnHelpClick(nil);  
end;
{------------------------------------------------------------------------------}

procedure TfrmWizard_dll.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CloseTables;
  Action := caFree;
end;
{------------------------------------------------------------------------------}

procedure TfrmWizard_dll.btnHelpClick(Sender: TObject);
begin
  Application.HelpJump( JumpID );
end;
{------------------------------------------------------------------------------}

procedure TfrmWizard_dll.FormCreate(Sender: TObject);
begin
  {by Gabriel@dsn
  Como esse form é usado em dlls quando ele é carregado o windows aparentemente
  o interpreta  como outra aplicação e por isso estava criando o botão de acesso
  a esse formulário na barra de tarefas do windows. O código abaixo remove o tal
  botão da barra de tarefas.}
  //SetWindowLong(Self.Handle, GWL_EXSTYLE, GetWindowLong(Application.Handle, GWL_EXSTYLE) or
  //  WS_EX_TOOLWINDOW and not WS_EX_APPWINDOW);
  // o procedimento abaixo insere os bitmaps nos botões deste formulário.
  AdicionaImagensBotoes;

  //Adoniram.dsn - 0012265346 - 02.09.2008
  imgLogo.Top    := PageControl.Top + 2;
  imgLogo.Height := PageControl.Height;//Bevel1.Top - 5;
  btnVersaoDoModulo.Visible := False;
end;
{------------------------------------------------------------------------------}

procedure TfrmWizard_dll.AdicionaImagensBotoes;
var
  i : Integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
  begin
    if (Components[i] is TBitBtn) then
      ImageList.GetBitmap(
        (Components[i] as TBitBtn).Tag - 1,
        (Components[i] as TBitBtn).Glyph);
  end;
end;
{------------------------------------------------------------------------------}

procedure TfrmWizard_dll.CloseTables;
var
  i : Integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
  begin
    if (Components[i] is TSetupTable) then
      (Components[i] as TSetupTable).Active := False;
  end;
end;

{------------------------------------------------------------------------------}

procedure TfrmWizard_dll.CarregaSessionName(SessionName: String);
//var
//  i : Integer;
begin
//Comentado por Rodrigo Mendes na conversão para Nexus
//  for i := 0 to Self.ComponentCount - 1 do
//  begin
//    if (Components[i] is TSetupTable) then
//      (Components[i] as TSetupTable).Schema:= SessionName;
//  end;
end;


procedure TfrmWizard_dll.SetVersaoDoModulo(const Value: String);
begin
  FVersaoDoModulo := Value;
  btnVersaoDoModulo.Visible := FVersaoDoModulo <> '';
  AlinharBotao();
end;


procedure TfrmWizard_dll.btnVersaoDoModuloClick(Sender: TObject);
var
  lTexto:String;
begin
  if FCaptionDaVersao <> '' then
    lTexto := FCaptionDaVersao + #13#10#13#10
  else
    lTexto := 'Versão do módulo ' + Caption + #13#10#13#10;

  if FAnoDoModulo <> '' then
    lTexto := lTexto + '     Ano: ' + FAnoDoModulo + #13#10;

  if FVersaoDoModulo <> '' then
    lTexto := lTexto + 'Versão: ' + FVersaoDoModulo + #13#10;

  MessageDlg(lTexto, mtInformation, [mbOK], 0);
end;

procedure TfrmWizard_dll.AlinharBotao;
begin
  btnVersaoDoModulo.Top :=  (PageControl.Top + PageControl.Height) - btnVersaoDoModulo.Height;
  imgLogo.Height := btnVersaoDoModulo.Top - 7;
end;

end.




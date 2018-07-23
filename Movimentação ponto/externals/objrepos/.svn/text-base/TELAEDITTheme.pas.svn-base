{-------------------------------------------------------------------------------
 Alterdata Pack
 Repositório padrão para edição de cadastros

================================================================================
 Processo    Data        Versão       Programador     Observações
================================================================================

 0003354068  23/10/2009  5.1011       Moises          Ajuste no foco do FirstField
-------------------------------------------------------------------------------}

unit TELAEDITTheme;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls,
  Db, ComCtrls, DBCtrls, Menus, Buttons, StdCtrls, Alterdata, AlterdataTypes,
  Alterdata_consts, AlterdataDatabase, Mask;

type
  TfrmEditaTheme = class(TForm)
    Panel1: TPanel;
    btnAjuda: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    panel2: TPanel;
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure btnAjudaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FTableEdita : TDataSet;

    {Primeiro campo usualmente o codigo }
    FFirstField : TWinControl;

    {Desabilita o primeiro campo quando a tabela estiver em modo de edicao }
    FFirstFieldDisableOnEdit : Boolean;

    {Quando sair da janela e a tabela estiver em modo de insercao ou edicao,
     pergunta se vai gravar as alteracoes }
    FCheckTableStateOnDeactivate : Boolean;

    {Possibilita a alteracao em Run Time da propriedade MaxLength dos objetos
     TField }
    FCanCheckMaxLength : Boolean;

    //Memo para descricao
    FDescricao         : TMemo;

    FDataSetStateOnFirstShow : TDataSetState;

    { Fecha a janela quando clicar no gravar o registro }
    FCloseAfterPost : Boolean;

    procedure SetTableEdita(Value: TDataSet);
    procedure CheckMaxLength(Sender: TObject);
    procedure DisplayHintTelaEdita(Sender: TObject);
    procedure SetFDescricao(Value: TMemo);
    procedure CheckCloseForm;
  public
    { Public declarations }
    JumpID : String;
    property TableEdita: TDataSet                   read FTableEdita                  write SetTableEdita;
    property FirstField: TWinControl                read FFirstField                  write FFirstField;
    property FirstFieldDisableOnEdit: boolean       read FFirstFieldDisableOnEdit     write FFirstFieldDisableOnEdit;
    property CheckTableStateOnDeactivate : Boolean  read FCheckTableStateOnDeactivate write FCheckTableStateOnDeactivate;
    property CanCheckMaxLength: Boolean             read FCanCheckMaxLength           write FCanCheckMaxLength;
    property Descricao: TMemo                   read FDescricao                   write SetFDescricao;
    property DataSetStateOnFirstShow: TDataSetState read FDataSetStateOnFirstShow;
    property CloseAfterPost : Boolean               read FCloseAfterPost              write FCloseAfterPost;
  end;

implementation

uses
  telacadTheme;

{$R *.DFM}

//************************************************
procedure TfrmEditaTheme.CheckCloseForm;
begin
  if (FCheckTableStateOnDeactivate) and
     (FTableEdita.State = dsEdit) then
  begin
    if MessageDlg('Gravar as alterações feitas neste cadastro?',
                  mtConfirmation, [mbYes, mbNo], 0 ) = mrYes then
      FTableEdita.Post
    else FTableEdita.Cancel;
  end;
end;

//************************************************
procedure TfrmEditaTheme.DisplayHintTelaEdita(Sender: TObject);
begin
  FDescricao.Lines.Clear;
  FDescricao.Lines.Add(GetLongHint(Application.Hint));
  ShowMessage(Application.hint);
end;

//************************************************
procedure TfrmEditaTheme.SetFDescricao(Value: TMemo);
begin
  if Value <> FDescricao then
    FDescricao := Value;

  Application.OnHint := DisplayHintTelaEdita;
end;

//************************************************
procedure TfrmEditaTheme.SetTableEdita( Value: TDataSet );
begin
  if FTableEdita <> Value then
    FTableEdita := Value;
end;

//************************************************
procedure TfrmEditaTheme.btnGravarClick(Sender: TObject);
var
  TableState : TDataSetState;

begin
  //Ativo o primero tabsheet
  //PageControl1.ActivePage := TabSheet1;

  TableState := FTableEdita.State;

  if TableState in [dsInsert,dsEdit] then
  begin
    FTableEdita.Post;

    if FCloseAfterPost then
      Close
    else
      if TableState = dsInsert then
        begin
          FTableEdita.Append;

          // Logo apos o append focaliza o componente setado para receber o focus.
          if Assigned(FFirstField) and (FFirstField.CanFocus) then
            FFirstField.SetFocus;
        end
      else Close;
  end;
end;

//************************************************
procedure TfrmEditaTheme.btnCancelarClick(Sender: TObject);
begin
  FTableEdita.Cancel;
  if Assigned(Sender) then Close;
end;

//************************************************
procedure TfrmEditaTheme.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FTableEdita.State in [dsInsert,dsEdit] then
    btnCancelarClick( nil );
end;

//************************************************
procedure TfrmEditaTheme.FormShow(Sender: TObject);
begin
  { Nao remover esta linha - 01/08/2000 - Alexandre Eduardo }
  btnAjuda.Visible := JumpID <> '';

  if btnAjuda.Visible then
  begin
    //btnAjuda.Left := btnGravar.Left - btnAjuda.Width - 5;
    btnAjuda.Left := 6;
    btnAjuda.Top  := btnGravar.Top;
  end;

  CheckMaxLength(Sender);

  {Guardo o estado da tabela no primeiro show para poder deletar o detalhe
   quando necessario for Alexandre 10/09/1998 }
  FDataSetStateOnFirstShow := FTableEdita.State;

  //0003354068 23/10/2009 moises@dsn Ajuste para não chamar o evento Exit do FirstField desnecessariamente
  if (Assigned(FFirstField)) then
    begin
      FirstField.Enabled := not ((FTableEdita.State = dsEdit) and (FFirstFieldDisableOnEdit));

      if (Firstfield is TDbEdit) then
        if (FirstField.Enabled) then
          TDbEdit(FirstField).Color := clWindow
        else
          TDBEdit(FirstField).Color := clBtnFace;

      if (FirstField.CanFocus) then
      begin
        if (Firstfield is TCustomEdit) then
          TCustomEdit(FFirstField).SelectAll;

        if (Firstfield is TCustomMaskEdit) then
          TCustomMaskEdit(FFirstField).SelectAll;

        FFirstField.SetFocus;
      end;
    end
  else
  begin
    MessageDlg('Variable ''FirstField'' might not have been initialized.', mtError, [mbOk], 0);
    Abort;
  end;
end;

//************************************************
procedure TfrmEditaTheme.FormActivate(Sender: TObject);
begin
//  PageControl1.ActivePage := TabSheet1;
end;

//************************************************
procedure TfrmEditaTheme.FormDestroy(Sender: TObject);
begin
  CheckCloseForm;
end;

//************************************************
procedure TfrmEditaTheme.FormDeactivate(Sender: TObject);
begin
//  CheckCloseForm;
  Application.OnHint := nil;
end;

//************************************************
procedure TfrmEditaTheme.CheckMaxLength( Sender: TObject );
var
  Index : Integer;
  Field : TField;

begin
  If FCanCheckMaxLength then
    for Index := 0 to ComponentCount -1 do
    begin
      if Components[Index] is TDbEdit then
      begin
        TDbEdit(Components[Index]).AutoSelect := true;
        Field := TDbEdit(Components[Index]).Field;

        if (Field <> nil) and (TDbEdit(Components[Index]).MaxLength = 0) then
          case Field.DataType of
            ftString  : TDbEdit(Components[Index]).MaxLength := Field.Size;
            ftInteger : TDbEdit(Components[Index]).MaxLength := 10;
            ftDate,
            ftDateTime,
            ftFloat     : TDbEdit(Components[Index]).MaxLength := Field.DisplayWidth;
          end; { Case }
      end; { if }
    end; { for }
end;

procedure TfrmEditaTheme.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CheckCloseForm;
  CanClose := true;
end;

procedure TfrmEditaTheme.FormCreate(Sender: TObject);
begin
  FCheckTableStateOnDeactivate := True;
  FCanCheckMaxLength           := True;
  FFirstFieldDisableOnEdit     := True;
  JumpID                       := '';
end;

procedure TfrmEditaTheme.btnAjudaClick(Sender: TObject);
begin
  Application.HelpJump( JumpID );
end;

procedure TfrmEditaTheme.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   EnableEnter( Self , Key , Shift );

   if Key = Vk_F1 then
      btnAjudaClick(Sender);
end;

end.


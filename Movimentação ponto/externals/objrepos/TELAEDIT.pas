
{ 07/01/2004 11:11:47 (GMT-3:00) > [CARREIRO@DSN on CARREIRO] checked in .  }
{ 15/12/2003 10:07:23 (GMT-3:00) > [CARREIRO@DSN on CARREIRO] checked
   in teste ok  }
{ 15/12/2003 10:06:03 (GMT-3:00) > [CARREIRO@DSN on CARREIRO] checked
   out /conversao de tela theme }
{*******************************************************}
{                                                       }
{   Form padrao de telas de cadastramento (Edita)       }
{                                                       }
{   Copyright (c) 1997 Alterdata Tecnologia             }
{                                                       }
{   Last Update Dec 10th 1998 by Alex                   }
{*******************************************************}

unit telaedit;

interface                    

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls,
  Db, ComCtrls, DBCtrls, Menus, Buttons, StdCtrls, Alterdata, AlterdataTypes,
  Alterdata_consts, AlterdataDatabase;

type
  TfrmEdita = class(TForm)
    Panel1: TPanel;
    btnGravar: TBitBtn;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel3: TPanel;
    gpxDados: TGroupBox;
    btnCancelar: TBitBtn;
    btnAjuda: TBitBtn;
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
    property Descricao: TMemo                       read FDescricao                   write SetFDescricao;
    property DataSetStateOnFirstShow: TDataSetState read FDataSetStateOnFirstShow;
    property CloseAfterPost : Boolean               read FCloseAfterPost              write FCloseAfterPost;
  end;

implementation

uses
  telacad;

{$R *.DFM}

//************************************************
procedure TFrmEdita.CheckCloseForm;
begin
  if (FCheckTableStateOnDeactivate) and
     (TableEdita.State = dsEdit) then
  begin
    if MessageDlg('Gravar as alterações feitas neste cadastro?',
                  mtConfirmation, [mbYes, mbNo], 0 ) = mrYes then
      TableEdita.Post
    else TableEdita.Cancel;
  end;
end;

//************************************************
procedure TFrmEdita.DisplayHintTelaEdita(Sender: TObject);
begin
  FDescricao.Lines.Clear;
  FDescricao.Lines.Add(GetLongHint(Application.Hint));
  ShowMessage(Application.hint);
end;

//************************************************
procedure TFrmEdita.SetFDescricao(Value: TMemo);
begin
  if Value <> FDescricao then
    FDescricao := Value;

  Application.OnHint := DisplayHintTelaEdita;
end;

//************************************************
procedure TFrmEdita.SetTableEdita( Value: TDataSet );
begin
  if FTableEdita <> Value then
    FTableEdita := Value;
end;

//************************************************
procedure TfrmEdita.btnGravarClick(Sender: TObject);
var
  TableState : TDataSetState;

begin
  //Ativo o primero tabsheet
  PageControl1.ActivePage := TabSheet1;

  TableState := TableEdita.State;

  if TableState in [dsInsert,dsEdit] then
  begin
    TableEdita.Post;

    if FCloseAfterPost then
      Close
    else
      if TableState = dsInsert then
        begin
          TableEdita.Append;

          // Logo apos o append focaliza o componente setado para receber o focus.
          if Assigned(FFirstField) and (FFirstField.CanFocus) then
            FFirstField.SetFocus;
        end
      else Close;
  end;
end;

//************************************************
procedure TfrmEdita.btnCancelarClick(Sender: TObject);
begin
  TableEdita.Cancel;
  if Assigned(Sender) then Close;
end;

//************************************************
procedure TfrmEdita.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if TableEdita.State in [dsInsert,dsEdit] then
    btnCancelarClick( nil );
end;

//************************************************
procedure TfrmEdita.FormShow(Sender: TObject);
var
  Control: TWinControl;

begin
  { Nao remover esta linha - 01/08/2000 - Alexandre Eduardo }
  btnAjuda.Visible := JumpID <> '';

  if btnAjuda.Visible then
  begin
    btnAjuda.Left := btnGravar.Left - btnAjuda.Width - 5;
    btnAjuda.Top  := btnGravar.Top;
  end;

  CheckMaxLength(Sender);

  {Guardo o estado da tabela no primeiro show para poder deletar o detalhe
   quando necessario for Alexandre 10/09/1998 }
  FDataSetStateOnFirstShow := FTableEdita.State;

  if Assigned(FFirstField) then
    begin
      PageControl1.ActivePage := TabSheet1;
      FirstField.Enabled := true;

      if Firstfield is TDBEdit then
        TDBEdit(FirstField).Color := clWindow;

      if (TableEdita.State = dsEdit) and (FFirstFieldDisableOnEdit) then
      begin
        if Firstfield is TDBEdit then
          TDBEdit(FirstField).Color := clBtnFace;

        FirstField.Enabled := false;
      end;

      if FirstField.CanFocus then
        FFirstField.SetFocus
      else
        begin
          Control := FindNextControl(FirstField, true, true, false);

          if Control.CanFocus then
            Control.SetFocus;
        end;
    end
  else
  begin
    MessageDlg('Variable ''FirstField'' might not have been initialized.', mtError, [mbOk], 0);
    Abort;
  end;
end;

//************************************************
procedure TfrmEdita.FormActivate(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
end;

//************************************************
procedure TfrmEdita.FormDestroy(Sender: TObject);
begin
  CheckCloseForm;
end;

//************************************************
procedure TfrmEdita.FormDeactivate(Sender: TObject);
begin
  CheckCloseForm;
  Application.OnHint := nil;
end;

//************************************************
procedure TfrmEdita.CheckMaxLength( Sender: TObject );
var
  Index : Integer;
  Field : TField;

begin
  If FCanCheckMaxLength then
    for Index := 0 to ComponentCount -1 do
    begin
      if Components[Index] is TDBEdit then
      begin
        TDBEdit(Components[Index]).AutoSelect := true;
        Field := TDBEdit(Components[Index]).Field;

        if (Field <> nil) and (TDBEdit(Components[Index]).MaxLength = 0) then
          case Field.DataType of
            ftString  : TDBEdit(Components[Index]).MaxLength := Field.Size;
            ftInteger : TDBEdit(Components[Index]).MaxLength := 10;
            ftDate,
            ftDateTime,
            ftFloat     : TDBEdit(Components[Index]).MaxLength := Field.DisplayWidth;
          end; { Case }
      end; { if }
    end; { for }
end;

procedure TfrmEdita.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CheckCloseForm;
  CanClose := true;
end;

procedure TfrmEdita.FormCreate(Sender: TObject);
begin
  FCheckTableStateOnDeactivate := True;
  FCanCheckMaxLength           := True;
  FFirstFieldDisableOnEdit     := True;
  JumpID                       := '';
end;

procedure TfrmEdita.btnAjudaClick(Sender: TObject);
begin
  Application.HelpJump( JumpID );
end;

procedure TfrmEdita.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_F1 then
    btnAjudaClick(Sender);
end;

end.
  

unit LookupEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, {CadVirtual,} declaraType,Buttons, dbTables, db, dbctrls, {uTool,}
  dbGrids,Variants{, ADODB};

type
  TListFields = record
    Caption   : string;
    FieldName : string;
    Retorno   : Boolean;
    Width     : Integer;
    Tipo      : string;
  end;

  TLookupParam = class(TObject)
  public
    FListFields : TStrings;
    FLookUpSQL  : TStrings;
    FRelations  : TStrings;
    FParams     : TStrings;
    FDataSource : TDataSource;

    vaFiltro    : aFiltro;
    vaDefault   : aDefault;
    vaParametro : aParametro;
    vaTitulo    : aTitulo;
//
    function MakeColumn(Grid : TDBGrid) : integer;
    procedure MakeFind(Frm : TWinControl; Grid : TDBGrid);
//
    constructor Create;
    destructor Destroy; override;
    function  GetFieldQuery(CharField : string; pbAlias : boolean = false ): string;
    procedure ParseField(Index : Integer);
    procedure valida_Parametros(psComplemento_Mensagem : string = '');

    procedure AddFiltro(psFiltro : String );overload;
    procedure AddFiltro(prFiltro : TReg_Filtro );overload;
    procedure AddFiltro(psFiltro : String; psParametro : String ; pValor : Variant);overload;

    procedure AddTitulo(psDescricao: String; pValor : Variant);virtual;
    procedure AddParametro(psNome: String;pValor : Variant);virtual;
    procedure AddDefault(psCampo : String;pValor : Variant; pbAlteravel : boolean = false );virtual;
  end;

  TResultEvent = procedure(Sender : TObject; var ResultFind : TStrings) of Object;
  TSearchEvent = procedure(Sender : TObject; LookupParam : TLookupParam; var CanSearch : boolean) of Object;
  TBeforeButtonEvent = procedure(Sender : TObject) of Object;


  TLookupEdit = class(TCustomMaskEdit)
  private
    { Private declarations }
    procedure WMDestroy(var Message: TWMSize); message WM_DESTROY;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
  protected
    { Protected declarations }
    FOnCalcFields: TDataSetNotifyEvent;
    FButton: TSpeedButton;
    FBtnControl: TWinControl;
    FLookUpAll : Boolean;
    FCaseSensitive : boolean;
    FFindResult : TStrings;
    FOnAfterButton: TResultEvent;
    FOnBeforeSearch: TSearchEvent;
    FOnLookUpChange: TNotifyEvent;
    FOnBeforeButton: TBeforeButtonEvent;    
    FFocused : Boolean;
    FAlignment: TAlignment;
    FParametro   : Tstrings;
    //
    FDatabaseName : String;
    FSessionName : String;
    //variavel para corrigir o comportamento do componente
    //quando colocado em um mdiform
    vbPesquisou : boolean;

    procedure setParametro( value : Tstrings );
    procedure ReturnForm(sender : TObject);
    procedure Pesquisa(vbForca_Pesquisa : boolean = false);
    procedure Change; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure Click; override;
    procedure DblClick; override;
   procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer);override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure Atualiza_Exibicao( Sender : TOBject );virtual;
    procedure setLinkValue(Value : Variant);
//    function GetDatabase: string;virtual;
//    procedure SetDatabase(const Value: string);virtual;
//    function GetSessionName: string;virtual;
//    procedure SetSessionName(const Value: string);virtual;
    function GetLookUpSQL: TStrings;
    function  GetAsString : string;
    procedure setAsString( Const value : string );
    procedure MakeCalc;virtual;abstract;
    procedure SetEditRect;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    function GetMinHeight: Integer;
    function GetRelation: TStrings;
    procedure SetRelation(Value: TStrings);
    function GetListFields: TStrings;
    procedure SetListFields(Value: TStrings);
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure KeyPress(var Key: Char); override;
    property Parametro:Tstrings read FParametro Write setParametro;
    function MontaFiltro( psValor, psNoCampoIgual, psNoCampoIgual2 ,psNoCampoLike : string; pFieldType : TFieldType ) : TReg_Filtro;
//    procedure WMPaint(var Message: TMessage); message WM_PAINT;
  public
    { Public declarations }

    FLinkValue : Variant;
    FLookupParam : TLookUpParam;
    constructor Create(AOwner: TComponent);override;
    destructor Destroy;override;

    //procedure MakeAssist( pDesigner : iDesigner);virtual;abstract;
    function isNull : Boolean;
    procedure DoClickButton;
    procedure SetLookUpSQL(const Value: TStrings);


//    property SessionName : string read GetSessionName write SetSessionName;
    property LookUpParam : TLookUpParam read FLookUpParam;
    property linkvalue : Variant read FLinkValue write setLinkValue;
    property AsString : string read GetAsString write setAsString;
  published
    { Published declarations }
    property OnBeforeSearch: TSearchEvent read FOnBeforeSearch write FOnBeforeSearch;
    property OnLookUpChange: TNotifyEvent read FOnLookUpChange write FOnLookUpChange;
    property OnAfterButton: TResultEvent read FOnAfterButton write FOnAfterButton;
    property OnBeforeButton: TBeforeButtonEvent read FOnBeforeButton write FOnBeforeButton;
    property OnCalcFields: TDataSetNotifyEvent read FOnCalcFields write FOnCalcFields;
    property LookUpSQL: TStrings read GetLookUpSQL write SetLookUpSQL;

    property Font;
    property CaseSensitive: Boolean read FCaseSensitive write FCaseSensitive;
    property LookUpAll: Boolean read FLookUpAll write FLookUpAll;
    property LookUpRelation: TStrings read GetRelation write SetRelation;
    property ListFields: TStrings read GetListFields write SetListFields;
    property TabOrder;
    property Enabled;
    property Charcase;
    property PopupMenu;
    property Visible;
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;

  end;

  TFindBtn = class(TSpeedButton)
  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
  end;

implementation

uses DBSearchEdit;

{TLookUpParam}

constructor TLookUpParam.Create;
begin
  inherited;
  FListFields := TStringList.Create;
  FLookUpSQL := TStringList.Create;
  FParams := TStringList.Create;
  FRelations := TStringList.Create;
end;

destructor TLookUpParam.Destroy;
begin
  FListFields.Free;
  FLookUpSQL.Free;
  FParams.Free;
  FRelations.Free;
end;

procedure TLookUpParam.valida_Parametros(psComplemento_Mensagem : string = '');
//var vsComplemento_Mensagem : string;
begin
//  if trim(psComplemento_Mensagem) <> '' then
//     vsComplemento_Mensagem := psComplemento_Mensagem +' - '
//  else
//     vsComplemento_Mensagem := '';
//
//  if ( trim(FLookUpSQL.text) = '') then
//     raise exception.create(vsComplemento_Mensagem+'SQL n?informado !')
//  else
//  if ( FdataSource <> nil ) and (trim(FRelations.text) = '')then
//     raise exception.create(vsComplemento_Mensagem+'N?Informados os campos de relacionamento')
//  else
//  if GetFieldQuery('=') = '' then
//     raise exception.create(vsComplemento_Mensagem+'N?Encontrado o Campo ''igual''(=).')
//  else
//  if GetFieldQuery('%') = '' then
//     raise exception.create(vsComplemento_Mensagem+'N?Encontrado o Campo ''like''(%).');

end;

function TLookUpParam.GetFieldQuery(CharField : string; pbAlias : boolean = false ): string;
var I : Integer;
    vbEncontrou : boolean;
begin
  Result := '';
  vbEncontrou := false;
  I := 0;
  while ( i < FListFields.Count) and not vbEncontrou do
  begin
    ParseField(I);
    if FParams[2] = CharField then
    begin
      if pbAlias then
         Result := Copy(FParams[0], Pos('>', FParams[0]) + 1, Length(FParams[0]))
      else
         Result := Copy(FParams[0], 0, Pos('>', FParams[0]) - 1);
      vbEncontrou := true;
    end;
    inc(i)
  end;
end;

procedure TLookUpParam.ParseField(Index : Integer);
var
  sAux : string;
begin
  with FParams do
  begin
    Clear;
    sAux := FListFields[Index];
    while Pos(';', sAux) > 0 do
    begin
      Add(Copy(sAux, 0, Pos(';', sAux) - 1));
      sAux := Copy(sAux, Pos(';', sAux) + 1, Length(sAux));
    end;
    Add(sAux);
  end;
end;

procedure TLookUpParam.AddTitulo(psDescricao: String;pValor : Variant);
begin
   setlength(vaTitulo,length(vaTitulo)+1);
   vaTitulo[high(vaTitulo)].Descricao := psDescricao;
   vaTitulo[high(vaTitulo)].Valor     := pValor;
end;

procedure TLookUpParam.AddParametro(psNome: String;pValor : Variant);
begin
   setlength(vaParametro,length(vaParametro)+1);
   vaParametro[high(vaParametro)].Nome := psNome;
   vaParametro[high(vaParametro)].Valor     := pValor;
end;

procedure TLookUpParam.AddDefault(psCampo : String;pValor : Variant; pbAlteravel : boolean = false );
begin
   setlength(vaDefault,length(vaDefault)+1);
   vaDefault[high(vaDefault)].NoCampo := psCampo;
   vaDefault[high(vaDefault)].Valor := pValor;
   vaDefault[high(vaDefault)].Alteravel := pbAlteravel;
end;

procedure TLookUpParam.AddFiltro(psFiltro : String);
begin
   AddFiltro(psFiltro,'',null);
end;

procedure TLookUpParam.AddFiltro(prFiltro : TReg_Filtro );
begin
   AddFiltro(prFiltro.Filtro,prFiltro.Parametro, prFiltro.Valor);
end;

procedure TLookUpParam.AddFiltro(psFiltro : String; psParametro : String; pValor : Variant);
begin
   if trim(psFiltro) <> '' then
   begin
      setlength(vaFiltro,length(vaFiltro)+1);
      vaFiltro[high(vaFiltro)].Filtro := psFiltro;
      vaFiltro[high(vaFiltro)].Parametro := psParametro;
      vaFiltro[high(vaFiltro)].Valor := pValor;
   end;
end;

procedure TLookUpParam.MakeFind(Frm : TWinControl; Grid: TDBGrid);
var
  I : Integer;
  viColWidth : Integer;
const
  DEF_INC_HEIGHT = 17;
  DEF_RUN_HEIGHT = 18;
  DEF_RUN_WIDTH = 22;
begin
  viColWidth := 0;
  for I := 0 to FListFields.Count - 1 do
  begin
    ParseField(I);
    viColWidth := viColWidth + MakeColumn(Grid);
  end;

  Frm.Width := viColWidth + (Frm.Width-grid.Width)+DEF_RUN_WIDTH;

  if (Grid.DataSource.DataSet.State = dsInactive) then Exit;

  if (Grid.DataSource.DataSet.RecordCount >= 5) then
     Frm.Height := (5 * DEF_INC_HEIGHT) + DEF_RUN_HEIGHT + (Frm.Height-grid.Height)
  else
     Frm.Height := (Grid.DataSource.DataSet.RecordCount * DEF_INC_HEIGHT) + DEF_RUN_HEIGHT + (Frm.Height-grid.Height)+3;
end;

function TLookUpParam.MakeColumn(Grid : TDBGrid) : integer;
var
  Col : TColumn;
begin
  result := 0;
  if FParams[3] = 'F' then Exit;
  Col := TColumn.Create(Grid.Columns);

  Col.Title.Caption := FParams[6];
  Col.Title.Font.Color := clWhite;
  if FParams[8] <> 'T'
  then Col.FieldName := Copy(FParams[0], 0, Pos('>',FParams[0]) - 1)
  else Col.FieldName := FParams[9];
  Col.Width := StrToInt(FParams[7]);
  result := Col.Width;
  case StrToInt(FParams[4]) of
    0: begin
         Col.Alignment := taCenter;
         Col.Title.Alignment := taCenter;
       end;
    1: begin
         Col.Alignment := taLeftJustify;
         Col.Title.Alignment := taLeftJustify;
       end;
    2: begin
         Col.Alignment := taRightJustify;
         Col.Title.Alignment := taRightJustify;
       end;
  end;
end;

{ TFindBtn }

procedure TFindBtn.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  TLookupEdit(Parent.Parent).DoClickButton;
end;

{ TLookupEdit }

constructor TLookupEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Height := 21;
  FLookUpAll := true;
  FCaseSensitive := true;
  FBtnControl := TWinControl.Create(Self);
  FBtnControl.Height := 17;
  FBtnControl.Width := 17;
  FBtnControl.Visible := True;
  FBtnControl.Parent := Self;
  FButton := TFindBtn.Create(Self);
  FButton.Font.Size := 8;
  FButton.Font.Name := 'Wingdings';
  FButton.Caption := 'ê';
  FButton.NumGlyphs := 1;
  FButton.SetBounds(0, 0, FBtnControl.Width , FBtnControl.Height);
  FButton.Visible := True;
  FButton.Parent := FBtnControl;
  FFindResult := TStringList.Create;
  FLookUpParam := TLookUpParam.Create;
  FParametro := TStringList.Create;
  vbPesquisou := false;
  inherited ReadOnly := False;
end;

destructor TLookupEdit.Destroy;
begin
  FButton.Free;
  FBtnControl.Free;
  FFindResult.Free;
  FLookUpParam.Free;
  FParametro.Free;
  inherited Destroy;
end;

procedure TLookupEdit.KeyPress(var Key: Char);
begin
  if ( ord(Key) = VK_RETURN ) then
    Key:=#0;

  FButton.Invalidate;

//  SendMessage(self.Handle, EM_GETRECT, 0, 20);
  inherited;
end;

procedure TLookupEdit.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  FButton.Invalidate;
end;

procedure TLookupEdit.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  //
end;

procedure TLookupEdit.WMDestroy(var message: TWMSize);
begin
//
end;

function TLookupEdit.isNull : Boolean;
begin
  result := VarIsEmpty(linkValue) or
            VarIsNull(linkValue) or
            ( ( varType(linkValue) = varString  ) and ( linkValue = '' ) ) or
            ( ( varType(linkValue) in [ varInteger,varSingle,varDouble] ) and ( linkValue = 0 ) ) ;
end;

procedure TLookupEdit.Change;
begin
   FlinkValue := unAssigned;
   vbPesquisou := false;
   inherited;
end;

procedure TLookupEdit.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if ((Key = vk_Insert) and (ssShift in Shift)) then Key := 0;

  if (Key = vk_return) then
  begin
    Pesquisa;
  end
  else inherited KeyDown(Key, Shift);
  FButton.Invalidate;
end;

procedure TLookupEdit.DoClickButton;
begin
  Pesquisa(true);
end;

procedure TLookupEdit.setLinkValue(Value : Variant);
var vsCampo_Chave,vsParametro : string;
//    vbCanSearch : boolean;
//    i : integer;
begin
//  vbCanSearch := true;
  LookUpParam.vaFiltro := nil;
  LookUpParam.vaDefault := nil;
  LookUpParam.vaTitulo := nil;
  LookUpParam.vaParametro := nil;

  vsCampo_Chave := LookUpParam.GetFieldQuery('=',true);
  vsParametro := LookUpParam.GetFieldQuery('=');
  FLinkValue := Value;
  if self.isnull then
    text := '';
//  else
//  begin
//    qy.Close;
////    qy.DatabaseName := MasterDataBase;
////    qy.SessionName  := SessionName;
//    qy.Connection := FConnection;
//    qy.SQL.Assign(LookUpParam.FLookUpSQL);
//    insertFilter(qy,vsCampo_Chave+ ' = :'+vsParametro,vsParametro,flinkvalue);
//
//    if Assigned(FOnCalcFields) then
//    begin
//       qy.OnCalcFields := OnCalcFields;
//       MakeCalc;
//    end;
//
//    if Assigned(FOnBeforeSearch) then OnBeforeSearch(self,LookUpParam, vbCanSearch);
//
//    if not vbCanSearch then
//    begin
//      clear;
//    end
//    else
//    begin
//      for i := low(LookUpParam.vaFiltro) to high(LookUpParam.vaFiltro) do
//        insertFilter(qy,LookUpParam.vaFiltro[i]);
//      qy.Open;
//      if qy.EOF then
//      begin
//        showmessage( 'Valor Invalido!' );
//        clear;
//      end
//      else
//      begin
//        Carrega_QueryResult(qy,FFindResult);
//        ReturnForm(self);
//      end;
//    end;
//  end;
end;

procedure TLookupEdit.SetLookUpSQL(const Value: TStrings);
begin
  if LookUpParam.FLookUpSQL.Text <> Value.Text then
    try
      begin
        LookUpParam.FLookUpSQL.BeginUpdate;
        LookUpParam.FLookUpSQL.Assign(Value);
      end;
    finally
      LookUpParam.FLookUpSQL.EndUpdate;
    end;
end;

function TLookupEdit.GetLookUpSQL : TStrings;
begin
   result := LookUpParam.FLookUpSQL
end;

function TLookupEdit.GetAsString : string;
begin
  result := Vartostr(linkvalue);
end;


procedure TLookupEdit.setAsString( Const value : string );
begin
  linkvalue := value;
end;

procedure TLookupEdit.Pesquisa(vbForca_Pesquisa : boolean = false);
//var viRecordCount : Integer;
//    FIndex : Integer;
//    vrfiltro : TReg_Filtro;
//    vbCanSearch : boolean ;
//    i : integer;
begin
//  vbCanSearch := false;

//  LookUpParam.valida_Parametros(name);
//  if ( self.isNull or vbForca_Pesquisa ) and Fbutton.Enabled then
//  begin
//     if ( not self.isNull ) and vbForca_Pesquisa then
//        self.clear;
//
//     if ( not FLookUpAll ) and ( Trim(Text) = '') then
//     begin
//       showmessage('?necess?o informar pelo menos um caracter para a pesquisa!');
//       setfocus;
//     end;
//
//     if FLookUpAll or (( Trim(Text) <> '') and self.isNull )  then
//     begin
//       vbCanSearch := true;
//     end;
//  end;

//  if vbCanSearch then
//  begin
//     LookUpParam.vaFiltro := nil;
//     LookUpParam.vaDefault := nil;
//     LookUpParam.vaTitulo := nil;
//     LookUpParam.vaParametro := nil;

//     qy.Close;
////     qy.DatabaseName := MasterDataBase;
////     qy.SessionName  := SessionName;
//     qy.Connection := FConnection;
//     qy.SQL.Assign(LookUpParam.FLookUpSQL);
//     GetFieldNames2(qy,LookUpParam.FParams);
//
//     if Assigned(FOnCalcFields) then
//     begin
//        qy.OnCalcFields := OnCalcFields;
//        MakeCalc;
//     end;
//
//     if ( trim(text) <> '' ) and self.isnull then
//     begin
//        FIndex := qy.FieldDefs.IndexOf(trim(LookUpParam.GetFieldQuery('=')));
//        vrfiltro := MontaFiltro( text, LookUpParam.GetFieldQuery('=',true),
//                                       LookUpParam.GetFieldQuery('=2',true),
//                                       LookUpParam.GetFieldQuery('%',true),
//                                       qy.FieldDefs.Items[FIndex].Datatype );
//
//        LookUpParam.addFiltro(vrFiltro);
//     end;
//
//     if Assigned(FOnBeforeSearch) then OnBeforeSearch(self,LookUpParam, vbCanSearch);
//
//     if vbCanSearch then
//     begin
//        vbPesquisou := true;
//        for i := low(LookUpParam.vaFiltro) to high(LookUpParam.vaFiltro) do
//           insertFilter(qy,LookUpParam.vaFiltro[i]);
//
//        qy.Open;
//
//        if qy.EOF then
//           viRecordCount := 0
//        else
//        begin
//          qy.Next;
//          if qy.EOF then
//             viRecordCount := 1
//          else
//          begin
//             viRecordCount := 2; // 2 ou mais registros
//             qy.Prior;
//          end;
//        end;
//
//        case viRecordCount of
//          0 : begin
//                FFindResult.Clear;
//                MessageDlg('Nenhum registro encontrado.', mtWarning, [mbOk], 0);
//                setfocus;
//              end;
//          1 : begin
//                Carrega_QueryResult(qy,FFindResult);
//                ReturnForm(self);
//              end;
//          2 : begin
//                 CriaFormPesquisa;
//              end;
//        end;
//     end;
//     invalidate;
//  end;

end;

procedure TLookupEdit.ReturnForm(sender : TObject);
begin
//   qy.close;
   if Assigned(FOnAfterButton) then OnAfterButton(Self, FFindResult);
   Atualiza_Exibicao(self);

//   Self.SetFocus;
end;

procedure TLookupEdit.Atualiza_Exibicao( Sender : TOBject ) ;
begin
    LookUpParam.valida_Parametros(name);

    Text := FFindResult.values[LookUpParam.GetFieldQuery('%')];
    FLinkValue := FFindResult.values[LookUpParam.GetFieldQuery('=')];

    if Assigned(FOnLookUpChange) then OnLookUpChange(Self);
end;

procedure TLookupEdit.SetEditRect;
var
  Rect: TRect;
begin
  Rect.Bottom := ClientHeight + 1;
  Rect.Right := FBtnControl.Left - 2;
  Rect.Top := 0;
  Rect.Left := 0;
  SendMessage(Handle, EM_SETRECTNP, 0, LongInt(@Rect));
end;

procedure TLookupEdit.setParametro( value : Tstrings );
begin
  if value.text <> FParametro.Text then
  begin
    try
      begin
        FParametro.BeginUpdate;
        FParametro.Assign(Value);
      end;
    finally
      FParametro.EndUpdate;
    end;
  end;
end;

procedure TLookupEdit.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  FButton.Enabled := Enabled;
end;

procedure TLookupEdit.WMSize(var message: TWMSize);
var
  MinHeight: Integer;
begin
  inherited;
  MinHeight := GetMinHeight;
  if Height < MinHeight then Height := MinHeight
  else begin
    if NewStyleControls then
      FBtnControl.SetBounds(ClientWidth - FButton.Width, 0, FButton.Width, ClientHeight)
    else
      FBtnControl.SetBounds(ClientWidth - FButton.Width, 1, FButton.Width, ClientHeight - 1);
    FButton.Height := FBtnControl.Height;
    SetEditRect;
  end;
end;

function TLookupEdit.GetMinHeight: Integer;
var
  DC: HDC;
  SaveFont: HFont;
  I, VTextMargin: Integer;
  SysMetrics, Metrics: TTextMetric;
begin
  DC := GetDC(0);
  GetTextMetrics(DC, SysMetrics);
  SaveFont := SelectObject(DC, Font.Handle);
  GetTextMetrics(DC, Metrics);
  SelectObject(DC, SaveFont);
  ReleaseDC(0, DC);
  I := SysMetrics.tmHeight;
  if I > Metrics.tmHeight then I := Metrics.tmHeight;
  vTextMargin := I div 4;
  Result := Metrics.tmHeight + vTextMargin + GetSystemMetrics(SM_CYBORDER) * 4 + 1;
end;

procedure TLookupEdit.CMFontChanged(var Message: TMessage);
begin
  inherited;
  GetMinHeight;
  FButton.Invalidate;
end;

function TLookupEdit.GetRelation: TStrings;
begin
  Result := LookUpParam.FRelations;
end;

procedure TLookupEdit.SetRelation(Value: TStrings);
begin
  if LookUpParam.FRelations.Text <> Value.Text then
    try
      begin
        LookUpParam.FRelations.BeginUpdate;
        LookUpParam.FRelations.Assign(Value);
      end;
    finally
      LookUpParam.FRelations.EndUpdate;
    end;
end;

function TLookupEdit.GetListFields: TStrings;
begin
  Result := LookUpParam.FListFields;
end;

procedure TLookupEdit.SetListFields(Value: TStrings);
begin
  if LookUpParam.FListFields.Text <> Value.Text then
    try
      begin
        LookUpParam.FListFields.BeginUpdate;
        LookUpParam.FListFields.Assign(Value);
      end;
    finally
      LookUpParam.FListFields.EndUpdate;
    end;
end;

procedure TLookUpEdit.CMExit(var message: TCMExit);
begin
   if ( self.IsNull ) and
      ( text <> ''  ) then
   begin
     if not vbPesquisou then
       Pesquisa;
   end;
  DoExit;
end;

function TLookupEdit.MontaFiltro( psValor, psNoCampoIgual, psNoCampoIgual2 ,psNoCampoLike : string; pFieldType : TFieldType ) : TReg_Filtro;
//var vsFiltroLike,vsValor : string;
//    vsNoCampoIgual, vsNoCampoLike : string;
//    vsDriver_Name,vsDbUpper : string;
begin
  // Tira o alias dos campos para dar nome aos parametros
//  if Pos('.', psNoCampoIgual) > 0 then
//    vsNoCampoIgual := Copy(psNoCampoIgual, Pos('.', psNoCampoIgual) + 1, length(psNoCampoIgual))
//  else
//    vsNoCampoIgual := psNoCampoIgual;
//
//  if Pos('.', psNoCampoLike) > 0 then
//    vsNoCampoLike := Copy(psNoCampoLike, Pos('.', psNoCampoLike) + 1, length(psNoCampoLike))
//  else
//    vsNoCampoLike := psNoCampoLike;
//
//  //
//  vsValor := trim(psValor);
//  result.Filtro := '';
//  result.Parametro := '';
//  result.Valor := null;
//  vsDriver_Name := FDriverName();
//  if vsValor <> '' then
//  begin
//    case pFieldType of
//      ftString :
//        begin
//          result.Filtro := PsNoCampoIgual + ' = ' + quotedStr(vsValor);
//          if psNoCampoIgual2 <> '' then
//            result.Filtro := result.Filtro + ' OR ' + PsNoCampoIgual2 + ' = ' + quotedStr(vsValor);
//        end;
//      ftSmallint, ftInteger, ftWord, ftBCD :
//        begin
//          try
//            StrToInt(vsValor);
//            result.Filtro := PsNoCampoIgual + ' = ' + vsValor;
//            if psNoCampoIgual2 <> '' then
//              result.Filtro := result.Filtro + ' OR ' + PsNoCampoIgual2 + ' = ' + vsValor;
//          except
//          end;
//        end;
//      ftCurrency :
//        begin
//          try
//            result.Valor     :=  StrToCurr(vsValor);
//            result.Filtro    := PsNoCampoIgual + ' = :' + vsNoCampoIgual;
//            if psNoCampoIgual2 <> '' then
//              result.Filtro := result.Filtro + ' OR ' + PsNoCampoIgual2 + ' = :' + vsNoCampoIgual;
//            result.Parametro := vsNoCampoIgual;
//          except
//          end;
//        end;
//      ftFloat :
//        begin
//          try
//            result.Valor     :=  StrToFloat(vsValor);
//            result.Filtro    := PsNoCampoIgual + ' = :' + vsNoCampoIgual;
//            if psNoCampoIgual2 <> '' then
//              result.Filtro := result.Filtro + ' OR ' + PsNoCampoIgual2 + ' = :' + vsNoCampoIgual;
//            result.Parametro := vsNoCampoIgual;
//          except
//          end;
//        end;
//      ftDate, ftDateTime :
//        begin
//          try
//            result.Valor     :=  StrToDate(vsValor);
//            result.Filtro    := PsNoCampoIgual + ' = :' + vsNoCampoIgual;
//            if psNoCampoIgual2 <> '' then
//              result.Filtro := result.Filtro + ' OR ' + PsNoCampoIgual2 + ' = :' + vsNoCampoIgual;
//            result.Parametro := vsNoCampoIgual;
//          except
//          end;
//        end;
//    end;
//    // Monta Filtro Like
//    if trim(psNoCampoLike) <> '' then
//    begin
//      vsDbUpper := FDb_upper(vsDriver_Name);
//      if CaseSensitive then
//      begin
//        if vsDriver_Name = csDriver_Name_ACCESS then
//          vsFiltroLike := psNoCampoLike + ' LIKE ' + quotedStr(vsValor+'*')
//        else
//          vsFiltroLike := psNoCampoLike + ' LIKE ' + quotedStr(vsValor+'%');
//      end
//      else
//      begin
//        if vsDriver_Name = csDriver_Name_ACCESS then
//          vsFiltroLike := vsDbUpper+'('+psNoCampoLike + ') LIKE ' + vsDbUpper+'('+quotedStr(vsValor+'*')+')'
//        else
//          vsFiltroLike := vsDbUpper+'('+psNoCampoLike + ') LIKE ' + vsDbUpper+'('+quotedStr(vsValor+'%')+')';
//      end;
//      AddStrtoList(vsFiltroLike, result.Filtro, ' OR ' );
//    end;
//    if result.Filtro <> '' then
//      result.Filtro := '('+result.Filtro+')';
//  end;
end;

//function TLookupEdit.GetDatabase: string;
//begin
//  if (FDatabaseName <> '') then
//  begin
//    result := FDatabaseName;
//  end
//  else
//    try
//       result := TADOQuery(LookUpParam.FDataSource.Dataset).DatabaseName;
//    except
//       result := '';
//    end;
//  //
//end;

//procedure TLookupEdit.SetConnection(const Value: TADOConnection);
//begin
//  FConnection := Value;
//end;

//procedure TLookupEdit.SetDataBase(const Value: string);
//begin
//  FDataBaseName := Value;
//end;

//function TLookupEdit.GetSessionName: string;
//begin
//  if (FSessionName <> '') then
//  begin
//    Result := FSessionName;
//  end
//  else
//    try
//      result := TADOQuery(LookUpParam.FDataSource.Dataset).SessionName;
//    except
//      result := '';
//    end;
//   //
//end;

//procedure TLookupEdit.SetSessionName(const Value: string);
//begin
//  FSessionName := Value;
//end;

procedure TLookupEdit.Click;
begin
  FButton.Invalidate;
//  Self.FButton.Enabled := True;
  inherited;
end;

procedure TLookupEdit.DblClick;
begin
//  Self.FButton.Enabled := True;
  FButton.Invalidate;
  inherited;
end;

procedure TLookupEdit.MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer);
begin
  FButton.Invalidate;
  inherited;
end;

//procedure TLookupEdit.WMPaint(var Message: TMessage);
//begin
//  if (self is TDBSearchEdit) then { 7/18/00 }
//  begin
//    FButton.Invalidate;
////    if ShowButton then
////       TwwComboDlgButton(FButton).Paint;
//  end
//  else begin
//    FButton.Invalidate;
//    FButton.Update; { 9/2/98 }
//  end
//end;

procedure TLookupEdit.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
//  FButton.Invalidate;
  inherited;
end;

procedure TLookupEdit.MouseUp(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
//  FButton.Invalidate;
  inherited;

end;

end.

unit uPass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, ComCtrls,
  ToolWin, DB, DBTables;{, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxmdaset, AltSetupMemData, DBClient,
  MemDS, DBAccess, Uni, SetupTable, alterdataconnection, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, AlterdataSelecaoDeRtm, AlterdataHints,
   StrUtils, Grids, DBGrids, Menus, cxCheckBox, cxGridBandedTableView,
  cxGridDBBandedTableView, cxDBLookupComboBox, cxCalc, cxSpinEdit, DataBaseStart,
  SetupQuery;}

type
  TResult = record

  Login : string;
  Senha : string;
  DatabaseSel : string;
  Database : TStringList;

  Servidor : string;
  Cancelou : Boolean;
end;


type
  TPrompt = record
  Caption1 : string;
  Caption2 : string;
  Caption3 : string;
  Caption4 : string;
end;

type
  TForm1 = class(TForm)
    dbConDbf: TDatabase;
    qryDbf: TQuery;
    Session: TSession;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function InputBoxPass(const ACaption : string; APrompt : TPrompt; const ADefault: TResult) : TResult;

    function InputSenha(const ACaption : string; APrompt : TPrompt; var Value: TResult): Boolean;

    function GetAveCharSize(Canvas: TCanvas): TPoint;
    procedure ConectarDbf;
    procedure SelecionarDataBases(pComboBox: TStringList);

//    procedure RealizaProcedimentoBase;

//    procedure ProcessaEmpresa(pis: string; Empresa_de,Empresa_Para : Integer);
//    procedure ProcessaInsercaoTabela(IdFuncionarioold,IdFuncionarioNew: string; Empresa_de,Empresa_Para : Integer; NmTabela : string);
//
//    procedure ProcessaInsercaoJustific(IdFuncionarioold,IdFuncionarioNew: string; Empresa_de,Empresa_Para : Integer; NmTabela : string);
//    procedure ProcessaInsercaoSMarca(IdFuncionarioold,IdFuncionarioNew: string; Empresa_de,Empresa_Para : Integer; NmTabela : string);
//    procedure ProcessaInsercaoVisita(IdFuncionarioold,IdFuncionarioNew: string; Empresa_de,Empresa_Para : Integer; NmTabela : string);
//    procedure ProcessaInsercaoJustificLegal(IdFuncionarioold,IdFuncionarioNew: string; Empresa_de,Empresa_Para : Integer; NmTabela : string);
//
//    procedure ProcessaInsercaoHorario(IdFuncionarioold,IdFuncionarioNew: string; Empresa_de,Empresa_Para : Integer; NmTabela,schema : string);

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

//  const PisEmpresa205para231 : array[0..205] of String = ('12892245607','16135176804','12919879628','12694576712','13278867547',
//                                                          '16230071127','13314129601','16200094048','16037077860','12675183603',
//                                                          '13018929623','13548582450','13188423569','12372692633','12716598608',
//                                                          '12988576604','13323721623','16210259821','12883260585','16574078920',
//                                                          '12505379140','20993284072','13386276546','12945105456','12802175582',
//                                                          '16223898593','20655877619','12774405620','20766912404','13205717545',
//                                                          '12877124586','12821116626','12942038545','12729478622','12174087822',
//                                                          '12906672566','13047833604','12447882876','13026862605','12079831994',
//                                                          '13037208626','20766915594','12813432581','16557900200','12710858624',
//                                                          '12766691601','13189517605','20766913389','20701801160','12934648542',
//                                                          '13116721601','21007343690','13141780586','12339654353','12973787582',
//                                                          '12737573620','12562853549','12793739156','12795132526','12819245600',
//                                                          '13362718581','13046337603','21050309164','12602744583','12682010859',
//                                                          '20701803074','12785984562','20952292127','12870967626','12883473562',
//                                                          '12492612904','16384372496','13019762609','12885926580','12788135620',
//                                                          '13034397541','20727887224','12650211549','12682970623','12733269544',
//                                                          '12505416720','12565861585','12696323811','12890142541','10119859383',
//                                                          '12838050607','13349577562','12664148585','12858604772','12882247542',
//                                                          '13141393566','20713691713','12821567563','12936496545','12985093815',
//                                                          '12769554567','16224157740','12678697624','12844234560','12894923602',
//                                                          '12884920546','12461893421','12741465624','12990102606','21050309881',
//                                                          '21007345537','12928362543','12792060605','20701814548','20766916094',
//                                                          '20952304265','13129560601','20775341821','20766873301','12492609059',
//                                                          '12974670603','20108849419','12985366560','20193809960','20681317374',
//                                                          '12925268546','12600520580','12991699584','13134832606','13352832543',
//                                                          '12630779124','12926584565','20952305520','20662732108','13282024583',
//                                                          '20944720972','12557815561','20089061602','16397558143','20952299334',
//                                                          '21007339383','20952304281','20713702359','21050326441','20388508390',
//                                                          '20992558144','20662733910','12742631587','20958567918','12765317560',
//                                                          '12975987589','12524819630','13380990778','20998312147','13373978601',
//                                                          '13295211565','13289286583','21050278803','20707838406','20992552537',
//                                                          '20766913990','21007318513','13091208582','20127289121','12820140248',
//                                                          '12643797606','12911512547','20681313441','16606758433','12472060914',
//                                                          '20118139368','13169494936','20366443563','20471764374','12844106546',
//                                                          '13073896588','21050325976','20762473872','20714377478','21007359929',
//                                                          '13210788609','13100743600','20992549625','12846655628','12524818278',
//                                                          '20340106799','12456404868','21050322284','21007371236','16621218150',
//                                                          '20466238538','20958567896','19041841000','13212412606','12640989628',
//                                                          '20992552545','20707833676','20363532549','13296941567','20958562568',
//                                                          '20106154154','13361234580','17053861617','20713683230','12556784565',
//                                                          '20127291185','12831638609','12752411229','20713680886','13007372622',
//                                                          '20089063362');
//
//  const PisEmpresa227para236 : array[0..6] of String = ('13163087344','13213957347','13168485518',
//                                                        '20460398010','12323098952','12134679834',
//                                                        '20089994641');
//
//  const PisEmpresa227para237 : array[0..0] of String = ('12627635184');
//
//  const PisEmpresa229para230 : array[0..0] of String = ('12665407509');

const
  DATABASE_NAME  = 'TESTE';
  DRIVE_NAME     = 'STANDARD';

implementation

uses uTeste;

{$R *.dfm}
function TForm1.InputSenha(const ACaption : string; APrompt : TPrompt; var Value: TResult): Boolean;
var
  i : Integer;
  Form: TForm;

  Prompt1,
  Prompt2,
  Prompt3,
  Prompt4 : TLabel;

  Edit1,
  Edit2,
  Edit3{
  Edit4}   : TEdit;

  ComboBox : TComboBox;
  DialogUnits: TPoint;

  ButtonTop, ButtonWidth, ButtonHeight: Integer;

//  lA : TTeste;
begin

  Result := False;

  Form := TForm.Create(Application);

  with Form do
  try
    Canvas.Font := Font;

    DialogUnits := GetAveCharSize(Canvas);

    BorderStyle := bsDialog;

    Caption := ACaption;

    ClientWidth := MulDiv(180, DialogUnits.X, 4);

    ClientHeight := MulDiv(100, DialogUnits.Y, 8);
//    ClientHeight := MulDiv(140, DialogUnits.Y, 8);

    Position := poMainformcenter;

    with TLabel.Create(Form) do
    begin
      Parent := Form;

      AutoSize := True;

      Left := MulDiv(8, DialogUnits.X, 4);

      Top := MulDiv(8, DialogUnits.Y, 8);

      Caption := APrompt.Caption1;
    end;

    Edit1 := TEdit.Create(Form);
    with Edit1 do
    begin
      Parent := Form;

      Left := MulDiv(8, DialogUnits.X, 4);

      Top := MulDiv(19, DialogUnits.Y, 8);

      Width := MulDiv(164, DialogUnits.X, 4);

      CharCase := ecUpperCase;

      {} MaxLength := 20;

      //{} Passwordchar := '*';

      {} Font.Color := clBlue;

      Text := Value.Login;

      SelectAll;
    end;

//    with TLabel.Create(Form) do
//    begin
//      Parent := Form;
//
//      AutoSize := True;
//
//      Left := MulDiv(8, DialogUnits.X, 4);
//
//      Top := MulDiv(35, DialogUnits.Y, 8);
//
//      Caption := APrompt.Caption2;
//    end;
//
//    with TEdit.Create(Form) do
//    begin
//
//      Parent := Form;
//
//      Left := MulDiv(8, DialogUnits.X, 4);
//
//      Top := MulDiv(45, DialogUnits.Y, 8);
//
//      Width := MulDiv(164, DialogUnits.X, 4);
//
//      {} MaxLength := 20;
//
//      {} Passwordchar := '*';
//
//      {} Font.Color := clBlue;
//
//      Text := Value.Senha;
//
//      SelectAll;
//
//    end;

//    with TLabel.Create(Form) do
//    begin
//      Parent := Form;
//
//      AutoSize := True;
//
//      Left := MulDiv(8, DialogUnits.X, 4);
//
//      Top := MulDiv(62, DialogUnits.Y, 8);
//
//      Caption := APrompt.Caption3;
//    end;
//
//    with TEdit.Create(Form) do
//    begin
//      Parent := Form;
//
//      Left := MulDiv(8, DialogUnits.X, 4);
//
//      Top := MulDiv(70, DialogUnits.Y, 8);
//
//      Width := MulDiv(164, DialogUnits.X, 4);
//
//      CharCase := ecUpperCase;
//
//      {} MaxLength := 20;
//
//      //{} Passwordchar := '*';
//
//      {} Font.Color := clBlue;
//
//      Text := Value.Servidor;
//
//      SelectAll;
//    end;

    with TLabel.Create(Form) do
    begin
      Parent := Form;

      AutoSize := True;

      Left := MulDiv(8, DialogUnits.X, 4);

      Top := MulDiv(35, DialogUnits.Y, 8);

      Caption := APrompt.Caption4;
    end;

    ComboBox := TComboBox.Create(Form);
    with ComboBox do
    begin
      Parent := Form;

      Left := MulDiv(8, DialogUnits.X, 4);

      Top := MulDiv(45, DialogUnits.Y, 8);

      Width := MulDiv(164, DialogUnits.X, 4);

//      CharCase := ecUpperCase;

//      {} MaxLength := 20;

      //{} Passwordchar := '*';

      {} Font.Color := clBlue;
      for i := 0 to Value.Database.Count -1 do
        Items.Add(Value.Database.Strings[i]);
        
//      Text := Value.Database;

//      SelectAll;
    end;

//    Edit4 := TEdit.Create(Form);
//    with Edit4 do
//    begin
//      Parent := Form;
//
//      Left := Prompt1.Left;
//
//      Top := MulDiv(97, DialogUnits.Y, 8);
//
//      Width := MulDiv(164, DialogUnits.X, 4);
//
//      CharCase := ecUpperCase;
//
//      {} MaxLength := 20;
//
//      //{} Passwordchar := '*';
//
//      {} Font.Color := clBlue;
//
//      Text := Value.Database;
//
//      SelectAll;
//    end;


    ButtonTop := MulDiv(120, DialogUnits.Y, 8);

    ButtonWidth := MulDiv(50, DialogUnits.X, 4);

    ButtonHeight := MulDiv(14, DialogUnits.Y, 8);

    with TButton.Create(Form) do
    begin

      Parent := Form;

      Caption := 'Ok';

      ModalResult := mrOk;

      Default := True;

      SetBounds(MulDiv(66, DialogUnits.X, 4), ButtonTop, ButtonWidth, ButtonHeight);
    end;

    with TButton.Create(Form) do
    begin
      Parent := Form;

      Caption := 'Cancelar';

      ModalResult := mrCancel;

      Cancel := True;

      SetBounds(MulDiv(120, DialogUnits.X, 4), ButtonTop, ButtonWidth,ButtonHeight);
    end;

    if ShowModal = mrOk then
      begin
//        lA := TTeste.Create;
        Value.Login := Edit1.Text;
//        Value.Senha := Edit2.Text;
//        Value.Servidor := Edit3.Text;
        Value.DatabaseSel := ComboBox.Text;
        Result := True;
      end;
  finally
    //lA.Teste(Value.Login,Value.Senha);
//    lA.Free;
    Form.Free;
  end;
end;

function TForm1.GetAveCharSize(Canvas: TCanvas): TPoint;
var
  I: Integer;

  Buffer: array[0..51] of Char;
begin

  for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));

  for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));

  GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));

  Result.X := Result.X div 52;

end;

function TForm1.InputBoxPass(const ACaption : string; APrompt : TPrompt; const ADefault: TResult) : TResult;
begin

  Result := ADefault;

  Result.Cancelou := not InputSenha(ACaption, APrompt, Result);
end;

procedure TForm1.FormShow(Sender: TObject);
var
  lresult : TResult;
  lPrompt : TPrompt;
  lCancelou : Boolean;
begin
  ConectarDbf();
  //lresult := InputBoxPass('Login', 'Digite o login', 'Digite a senha', lresult);
  lresult.Login := '';
  lresult.Senha := '';
  lPrompt.Caption1 := 'Digite o login';
  lPrompt.Caption2 := 'Digite a senha';
  lPrompt.Caption3 := 'Digite o servidor';
  lPrompt.Caption4 := 'Informe o Database';
  lresult.Servidor := '';
  lresult.DatabaseSel := '';
  lresult.Cancelou := False;

  while (lresult.Login = '') or
//        (lresult.Senha = '') or
//        (lresult.Servidor = '')
        (lresult.DatabaseSel = '') do
  begin
    lresult.Database := TStringList.Create;
    try
      SelecionarDataBases(lresult.Database);

      lCancelou := False;
      if lresult.Cancelou then
      begin
        lCancelou := True;
        Break;
      end;

      lresult := InputBoxPass('Login',lPrompt, lresult);
    finally
      FreeAndNil(lresult.Database);
    end;
  end;

  if lCancelou then
    Close;
//  try
//    DataBaseStart.Connect(AlterdataConnection1,'sql server',lresult.Servidor,lresult.Database,lresult.Login,lresult.Senha);
//
//    if not AlterdataConnection1.Connected then
//      begin
//        showMessage('Não foi possível realizar a conexão com o banco de dados.Verifique!!!');
//      end
//    else
//      begin
//        RealizaProcedimentoBase;
//        showMessage('Procedimento realizado com sucesso!!!');
//        Close;
//      end;
//  except
//    close;
//  end;
end;

procedure TForm1.ConectarDbf();
begin
  if (dbConDbf.Connected) then
    Exit;

//  Session.PrivateDir := ExtractFileDir(Application.ExeName)+ '\CONEXAO';
  dbConDbf.Close;
//  dbConDbf.KeepConnection := False;
//  dbConDbf.ReadOnly       := True;
//  dbConDbf.TransIsolation := tiDirtyRead;
  dbConDbf.DatabaseName := 'TESTE' + FormatDateTime('YYYYMMDDHHMM', Now);
  dbConDbf.DriverName   := DRIVE_NAME;
  dbConDbf.Params.Add('PATH='+ ExtractFileDir(Application.ExeName)+ '\CONEXAO');
end;

procedure TForm1.SelecionarDataBases(pComboBox : TStringList);
begin
  pComboBox.Clear;
  try
    qryDbf.Close;
    qryDbf.DatabaseName   := dbConDbf.DatabaseName;
    qryDbf.SQL.Clear;
    qryDbf.SQL.Add('SELECT NOCONEXAO');
    qryDbf.SQL.Add('FROM Conexao.dbf');
    qryDbf.Open;

    if not qryDbf.IsEmpty then
    begin
      while not qryDbf.Eof do
      begin
        pComboBox.Add(qryDbf.Fields.FieldByName('NOCONEXAO').AsString);
        qryDbf.Next;
      end;
    end;
  except on e: Exception do
    begin
      ShowMessage(e.Message);
      qryDbf.Close;
    end;
  end;
end;

end.

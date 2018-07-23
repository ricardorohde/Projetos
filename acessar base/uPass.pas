unit uPass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, uEditFormat, Buttons, ExtCtrls, ComCtrls,
  ToolWin, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxmdaset, AltSetupMemData, DBClient,
  MemDS, DBAccess, Uni, SetupTable, alterdataconnection, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, AlterdataSelecaoDeRtm, AlterdataHints,
  Alterdata, StrUtils, Grids, DBGrids, Menus, cxCheckBox, cxGridBandedTableView,
  cxGridDBBandedTableView, cxDBLookupComboBox, cxCalc, cxSpinEdit, DataBaseStart,
  SetupQuery, DASQLMonitor, UniSQLMonitor;

type
  TResult = record

  Login : string;
  Senha : string;
  Database : string;
  Servidor : string;
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
    AlterdataConnection1: TAlterdataConnection;
    UniSQLMonitor1: TUniSQLMonitor;
    Memo1: TMemo;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    SetupQuery1: TSetupQuery;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    function InputBoxPass(const ACaption : string; APrompt : TPrompt; const ADefault: TResult) : TResult;

    function InputSenha(const ACaption : string; APrompt : TPrompt; var Value: TResult): Boolean;

    function GetAveCharSize(Canvas: TCanvas): TPoint;

    procedure RealizaProcedimentoBase;

    procedure ProcessaEmpresa(pis: string; Empresa_de,Empresa_Para : Integer);
    procedure ProcessaInsercaoTabela(IdFuncionarioold,IdFuncionarioNew: string; Empresa_de,Empresa_Para : Integer; NmTabela : string);

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

  const PisEmpresa205para231 : array[0..205] of String = ('12892245607','16135176804','12919879628','12694576712','13278867547',
                                                          '16230071127','13314129601','16200094048','16037077860','12675183603',
                                                          '13018929623','13548582450','13188423569','12372692633','12716598608',
                                                          '12988576604','13323721623','16210259821','12883260585','16574078920',
                                                          '12505379140','20993284072','13386276546','12945105456','12802175582',
                                                          '16223898593','20655877619','12774405620','20766912404','13205717545',
                                                          '12877124586','12821116626','12942038545','12729478622','12174087822',
                                                          '12906672566','13047833604','12447882876','13026862605','12079831994',
                                                          '13037208626','20766915594','12813432581','16557900200','12710858624',
                                                          '12766691601','13189517605','20766913389','20701801160','12934648542',
                                                          '13116721601','21007343690','13141780586','12339654353','12973787582',
                                                          '12737573620','12562853549','12793739156','12795132526','12819245600',
                                                          '13362718581','13046337603','21050309164','12602744583','12682010859',
                                                          '20701803074','12785984562','20952292127','12870967626','12883473562',
                                                          '12492612904','16384372496','13019762609','12885926580','12788135620',
                                                          '13034397541','20727887224','12650211549','12682970623','12733269544',
                                                          '12505416720','12565861585','12696323811','12890142541','10119859383',
                                                          '12838050607','13349577562','12664148585','12858604772','12882247542',
                                                          '13141393566','20713691713','12821567563','12936496545','12985093815',
                                                          '12769554567','16224157740','12678697624','12844234560','12894923602',
                                                          '12884920546','12461893421','12741465624','12990102606','21050309881',
                                                          '21007345537','12928362543','12792060605','20701814548','20766916094',
                                                          '20952304265','13129560601','20775341821','20766873301','12492609059',
                                                          '12974670603','20108849419','12985366560','20193809960','20681317374',
                                                          '12925268546','12600520580','12991699584','13134832606','13352832543',
                                                          '12630779124','12926584565','20952305520','20662732108','13282024583',
                                                          '20944720972','12557815561','20089061602','16397558143','20952299334',
                                                          '21007339383','20952304281','20713702359','21050326441','20388508390',
                                                          '20992558144','20662733910','12742631587','20958567918','12765317560',
                                                          '12975987589','12524819630','13380990778','20998312147','13373978601',
                                                          '13295211565','13289286583','21050278803','20707838406','20992552537',
                                                          '20766913990','21007318513','13091208582','20127289121','12820140248',
                                                          '12643797606','12911512547','20681313441','16606758433','12472060914',
                                                          '20118139368','13169494936','20366443563','20471764374','12844106546',
                                                          '13073896588','21050325976','20762473872','20714377478','21007359929',
                                                          '13210788609','13100743600','20992549625','12846655628','12524818278',
                                                          '20340106799','12456404868','21050322284','21007371236','16621218150',
                                                          '20466238538','20958567896','19041841000','13212412606','12640989628',
                                                          '20992552545','20707833676','20363532549','13296941567','20958562568',
                                                          '20106154154','13361234580','17053861617','20713683230','12556784565',
                                                          '20127291185','12831638609','12752411229','20713680886','13007372622',
                                                          '20089063362');

  const PisEmpresa227para236 : array[0..6] of String = ('13163087344','13213957347','13168485518',
                                                        '20460398010','12323098952','12134679834',
                                                        '20089994641');

  const PisEmpresa227para237 : array[0..0] of String = ('12627635184');

  const PisEmpresa229para230 : array[0..0] of String = ('12665407509');

implementation

uses uTeste;

{$R *.dfm}
function TForm1.InputSenha(const ACaption : string; APrompt : TPrompt; var Value: TResult): Boolean;
var

  Form: TForm;

  Prompt1,
  Prompt2,
  Prompt3,
  Prompt4 : TLabel;

  Edit1,
  Edit2,
  Edit3,
  Edit4   : TEdit;

  DialogUnits: TPoint;

  ButtonTop, ButtonWidth, ButtonHeight: Integer;

  lA : TTeste;
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

    //ClientHeight := MulDiv(63, DialogUnits.Y, 8);
    ClientHeight := MulDiv(140, DialogUnits.Y, 8);

    Position := poMainformcenter;

    Prompt1 := TLabel.Create(Form);
    with Prompt1 do
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

      Left := Prompt1.Left;

      Top := MulDiv(19, DialogUnits.Y, 8);

      Width := MulDiv(164, DialogUnits.X, 4);

      CharCase := ecUpperCase;

      {} MaxLength := 20;

      //{} Passwordchar := '*';

      {} Font.Color := clBlue;

      Text := Value.Login;

      SelectAll;
    end;


    Prompt2 := TLabel.Create(Form);

    with Prompt2 do
    begin
      Parent := Form;

      AutoSize := True;

      Left := MulDiv(8, DialogUnits.X, 4);

      Top := MulDiv(35, DialogUnits.Y, 8);

      Caption := APrompt.Caption2;
    end;
    Edit2 := TEdit.Create(Form);

    with Edit2 do
    begin

      Parent := Form;

      Left := Prompt2.Left;

      Top := MulDiv(45, DialogUnits.Y, 8);

      Width := MulDiv(164, DialogUnits.X, 4);

      {} MaxLength := 20;

      {} Passwordchar := '*';

      {} Font.Color := clBlue;

      Text := Value.Senha;

      SelectAll;

    end;

    Prompt3 := TLabel.Create(Form);
    with Prompt3 do
    begin
      Parent := Form;

      AutoSize := True;

      Left := MulDiv(8, DialogUnits.X, 4);

      Top := MulDiv(62, DialogUnits.Y, 8);

      Caption := APrompt.Caption3;
    end;

    Edit3 := TEdit.Create(Form);
    with Edit3 do
    begin
      Parent := Form;

      Left := Prompt1.Left;

      Top := MulDiv(70, DialogUnits.Y, 8);

      Width := MulDiv(164, DialogUnits.X, 4);

      CharCase := ecUpperCase;

      {} MaxLength := 20;

      //{} Passwordchar := '*';

      {} Font.Color := clBlue;

      Text := Value.Servidor;

      SelectAll;
    end;


    Prompt4 := TLabel.Create(Form);
    with Prompt4 do
    begin
      Parent := Form;

      AutoSize := True;

      Left := MulDiv(8, DialogUnits.X, 4);

      Top := MulDiv(89, DialogUnits.Y, 8);

      Caption := APrompt.Caption4;
    end;

    Edit4 := TEdit.Create(Form);
    with Edit4 do
    begin
      Parent := Form;

      Left := Prompt1.Left;

      Top := MulDiv(97, DialogUnits.Y, 8);

      Width := MulDiv(164, DialogUnits.X, 4);

      CharCase := ecUpperCase;

      {} MaxLength := 20;

      //{} Passwordchar := '*';

      {} Font.Color := clBlue;

      Text := Value.Database;

      SelectAll;
    end;


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
        lA := TTeste.Create;
        Value.Login := Edit1.Text;
        Value.Senha := Edit2.Text;
        Value.Servidor := Edit3.Text;
        Value.Database := Edit4.Text;
        Result := True;
      end;
  finally
    lA.Teste(Value.Login,Value.Senha);
    lA.Free;
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

  InputSenha(ACaption, APrompt, Result);
end;

//procedure TForm1.RealizaProcedimentoBase;
//var lQryHrCompWdp,
//    lQryHrCompWPonto : TSetupQuery;
//    i : integer;
//begin
//  lQryHrCompWdp := TSetupQuery.Create('WDP');
//  try
//    lQryHrCompWdp.SQL.Add('select * from wdp.HrComp');
//    lQryHrCompWdp.Open;
//    if not lQryHrCompWdp.IsEmpty then
//      begin
//        lQryHrCompWPonto := TSetupQuery.Create('WPONTO');
//        try
//          lQryHrCompWdp.First;
//          while not lQryHrCompWdp.Eof do
//            begin
//              lQryHrCompWPonto.Close;
//              lQryHrCompWPonto.SQL.Clear;
//              lQryHrCompWPonto.SQL.Add('select * from wponto.HrComp');
//              lQryHrCompWPonto.SQL.Add('where CdEmpresa = ' + lQryHrCompWdp.Fields.fieldByName('CdEmpresa').AsString);
//              lQryHrCompWPonto.SQL.Add('      and IdFuncionario = ' + QuotedStr(lQryHrCompWdp.Fields.fieldByName('IdFuncionario').AsString));
//              lQryHrCompWPonto.SQL.Add('      and TpPessoa = ' + QuotedStr(lQryHrCompWdp.Fields.fieldByName('TpPessoa').AsString));
//              lQryHrCompWPonto.SQL.Add('      and NrDiaSemana = ' + lQryHrCompWdp.Fields.fieldByName('NrDiaSemana').AsString);
//              lQryHrCompWPonto.SQL.Add('      and DtAlteracao = {Date ' + QuotedStr(formatDateTime('yyyy-mm-dd',lQryHrCompWdp.Fields.fieldByName('DtAlteracao').AsDateTime))+ '}');
//              lQryHrCompWPonto.Open;
//
//              if lQryHrCompWPonto.IsEmpty then
//                begin
//                  lQryHrCompWPonto.Append;
//
//                  for i := 0 to lQryHrCompWdp.FieldCount - 1 do
//                    lQryHrCompWPonto.Fields[i].Value := lQryHrCompWdp.Fields[i].Value;
//
//                  lQryHrCompWPonto.Post;
//                end;
//
//              lQryHrCompWdp.Next;
//            end;
//          lQryHrCompWdp.Close;
//        finally
//          FreeAndNIl(lQryHrCompWPonto);
//        end;
//      end;
//  finally
//    FreeAndNil(lQryHrCompWdp);
//  end;
//end;

procedure TForm1.FormShow(Sender: TObject);
var lteste : string;
    lresult : TResult;
    lPrompt : TPrompt;
begin
  //lresult := InputBoxPass('Login', 'Digite o login', 'Digite a senha', lresult);
  lresult.Login := 'ESTELLA.ADM';
  lresult.Senha := '';
  lPrompt.Caption1 := 'Digite o login';
  lPrompt.Caption2 := 'Digite a senha';
  lPrompt.Caption3 := 'Digite o servidor';
  lPrompt.Caption4 := 'Digite o database';
  lresult.Servidor := 'NT02';
  lresult.Database := 'PRIME';

  while (lresult.Login = '') or
        (lresult.Senha = '') or
        (lresult.Servidor = '') or
        (lresult.Database = '') do
    lresult := InputBoxPass('Login',lPrompt, lresult);

  try
    DataBaseStart.Connect(AlterdataConnection1,'sql server',lresult.Servidor,lresult.Database,lresult.Login,lresult.Senha);

    if not AlterdataConnection1.Connected then
      begin
        showMessage('Não foi possível realizar a conexão com o banco de dados.Verifique!!!');
      end;
  except
    close;
  end;
end;

procedure TForm1.RealizaProcedimentoBase;
var i : Integer;
begin
  for i := Low(PisEmpresa205para231) to (High(PisEmpresa205para231)-1) do
    begin
      ProcessaEmpresa(PisEmpresa205para231[i],205,231);
    end;

  for i := Low(PisEmpresa227para236) to (High(PisEmpresa227para236)-1) do
    begin
      ProcessaEmpresa(PisEmpresa227para236[i],227,236);
    end;

  for i := Low(PisEmpresa227para237) to High(PisEmpresa227para237) do
    begin
      ProcessaEmpresa(PisEmpresa227para237[i],227,237);
    end;

  for i := Low(PisEmpresa229para230) to High(PisEmpresa229para230) do
    begin
      ProcessaEmpresa(PisEmpresa229para230[i],229,230);
    end;
end;

procedure TForm1.ProcessaEmpresa(pis: string; Empresa_de,Empresa_Para : Integer);
var lQryFuncionario : TSetupQuery;
begin
  lQryFuncionario := TSetupQuery.Create('WDP');
  try
//    lQryFuncionario.sql.add('select IdFuncionario');
//    lQryFuncionario.sql.add('from wdp.F'+ Strzero(Empresa_de,5));
//    lQryFuncionario.sql.add('where NrPisPasep = '+ QuotedStr(pis));
    lQryFuncionario.sql.add('select F1.IdFuncionario as IdFuncionarioold,');
    lQryFuncionario.sql.add('       F2.IdFuncionario as IdFuncionarioNew');
    lQryFuncionario.sql.add('from wdp.F'+ Strzero(Empresa_de,5)+ ' F1');
    lQryFuncionario.sql.add('left join wdp.F'+ Strzero(Empresa_Para,5)+ ' F2 on (F2.NrPISPASEP = '+ QuotedStr(pis)+ ')');
    lQryFuncionario.sql.add('where F1.NrPISPASEP = '+ QuotedStr(pis));


    lQryFuncionario.Open;

    if not lQryFuncionario.IsEmpty then
      begin
//        ProcessaInsercaoTabela(lQryFuncionario.Fields.fieldByName('IdFuncionarioold').AsString,
//                               lQryFuncionario.Fields.fieldByName('IdFuncionarionew').AsString,
//                              Empresa_de,Empresa_Para,'Movimen');
        ProcessaInsercaoTabela(lQryFuncionario.Fields.fieldByName('IdFuncionarioold').AsString,
                               lQryFuncionario.Fields.fieldByName('IdFuncionarionew').AsString,
                               Empresa_de,Empresa_Para,'Justific');
        ProcessaInsercaoTabela(lQryFuncionario.Fields.fieldByName('IdFuncionarioold').AsString,
                               lQryFuncionario.Fields.fieldByName('IdFuncionarionew').AsString,
                               Empresa_de,Empresa_Para,'JustificLegal');
        ProcessaInsercaoTabela(lQryFuncionario.Fields.fieldByName('IdFuncionarioold').AsString,
                               lQryFuncionario.Fields.fieldByName('IdFuncionarionew').AsString,
                               Empresa_de,Empresa_Para,'Visita');
        ProcessaInsercaoTabela(lQryFuncionario.Fields.fieldByName('IdFuncionarioold').AsString,
                               lQryFuncionario.Fields.fieldByName('IdFuncionarionew').AsString,
                               Empresa_de,Empresa_Para,'SMarca');
      end;
  finally
    FreeAndNil(lQryFuncionario);
  end;
end;

procedure TForm1.ProcessaInsercaoTabela(IdFuncionarioold,IdFuncionarioNew: string;
  Empresa_de,Empresa_Para : Integer; NmTabela : string);
var lQrySeleciona : TSetupQuery;
    lQryInsere : TSetupQuery;
    i : integer;
begin
  lQrySeleciona := TSetupQuery.Create('WPONTO');
  try
    lQrySeleciona.sql.add('select * ');
    lQrySeleciona.sql.add('from wponto.'+ NmTabela);
    lQrySeleciona.sql.add('where CdEmpresa = '+ IntToStr(Empresa_Para));
    lQrySeleciona.sql.add('and  IdFuncionario = '+ QuotedStr(IdFuncionarioNew));
    lQrySeleciona.sql.add('and  TpPessoa = ''F''');
    lQrySeleciona.sql.add('and DtMovimentacao >= {date '+ QuotedSTr(FormatDateTime('yyyy-mm-dd',StrToDate('20/05/2012'))));
    lQrySeleciona.Open;
    if not lQrySeleciona.IsEmpty then
      begin
        lQryInsere := TSetupQuery.Create('WPONTO');
        try
          lQrySeleciona.First;
          while not lQrySeleciona.Eof do
            begin
              lQrySeleciona.Edit;
              lQrySeleciona.Fields.FieldByName('IdFuncionario').AsString := IdFuncionarioNew;
              lQrySeleciona.Post;

//              lQryInsere.Close;
//              lQryInsere.sql.Clear;
//              lQryInsere.sql.add('select * ');
//              lQryInsere.sql.add('from wponto.'+ NmTabela);
//              lQryInsere.sql.add('where CdEmpresa = '+ IntToStr(Empresa_Para));
//              lQryInsere.sql.add('and  IdFuncionario = '+ QuotedStr(IdFuncionario));
//              lQryInsere.sql.add('and  TpPessoa = ''F''');
//              lQryInsere.sql.add('and DtMovimentacao = {date '+ QuotedStr(FormatDateTime('yyyy-mm-dd',lQrySeleciona.Fields.fieldByName('DtMovimentacao').AsDateTime)));
//              lQryInsere.Open;
//
//              if lQryInsere.IsEmpty then
//                begin
//                  lQryInsere.Append;
//
//                  for i := 0 to lQrySeleciona.FieldCount - 1 do
//                    begin
//                      // Ser for autoinc continua o for
//                      if (lQrySeleciona.Fields[i].DataType = ftAutoInc) then
//                        continue;
//                      // Ser for autoinc continua o for
//                      if (lQrySeleciona.Fields[i].DataType = ftInteger) and
//                         (lQrySeleciona.Fields[i].AutoGenerateValue = arAutoInc) then
//                         continue;
//
//                      if (lQrySeleciona.Fields[i].FieldName <> 'CdEmpresa') then
//                        lQryInsere.Fields.FieldByName(lQrySeleciona.Fields[i].FieldName).Value := lQrySeleciona.Fields.FieldByName(lQrySeleciona.Fields[i].FieldName).Value
//                      else
//                        lQryInsere.Fields.FieldByName(lQrySeleciona.Fields[i].FieldName).Value := Empresa_Para;
//                    end;
//
//                  lQryInsere.Post;
//                end
//              lQrySeleciona.Delete;
              lQrySeleciona.Next;
            end;
        except
          FreeAndNil(lQryInsere);
        end; 
      end;
  finally
    FreeAndNil(lQrySeleciona);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  SetupQuery1.Close;
  SetupQuery1.SQL.clear;
  SetupQuery1.SQL.Add(Memo1.Lines.Text);
  SetupQuery1.Schema := 'wponto';

  if (pos('SELECT',Uppercase(Memo1.Lines.Text)) <> 0) then
    SetupQuery1.Open
  else
    SetupQuery1.ExecSQL;
end;

end.

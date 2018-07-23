unit uAFD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DB, DBClient, Grids, DBGrids,
  cxShellBrowserDialog,FileCtrl,StrUtils, alterdata_skin, alterdata_nxskin;

type
  TfrmAFD = class(TForm)
    Panel1: TPanel;
    btnArquivo: TButton;
    edtArquivo: TEdit;
    OpenDialog1: TOpenDialog;
    btnGerar: TButton;
    Shape1: TShape;
    edtDtIni: TMaskEdit;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    client: TClientDataSet;
    dtsAFD: TDataSource;
    clientDtMovimentacao: TStringField;
    clientHrMovimentacao1: TStringField;
    clientHrMovimentacao2: TStringField;
    clientHrMovimentacao3: TStringField;
    clientHrMovimentacao4: TStringField;
    clientHrMovimentacao5: TStringField;
    clientHrMovimentacao6: TStringField;
    clientPIS: TStringField;
    clientHrMovimentacao7: TStringField;
    clientHrMovimentacao8: TStringField;
    clientHrMovimentacao9: TStringField;
    clientHrMovimentacao10: TStringField;
    edtPIS: TEdit;
    edtDtFim: TMaskEdit;
    chkMultiplos: TCheckBox;
    shlGetDirectory: TcxShellBrowserDialog;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblRegistros: TLabel;
    AltFFVclSkin1: TAltNxVclSkin;
    btnGerarArquivo: TButton;
    clientNSR1: TStringField;
    clientNSR2: TStringField;
    clientNSR3: TStringField;
    clientNSR4: TStringField;
    clientNSR5: TStringField;
    clientNSR6: TStringField;
    clientNSR7: TStringField;
    clientNSR8: TStringField;
    clientNSR9: TStringField;
    clientNSR10: TStringField;
    Button1: TButton;
    btnExcluirMov: TButton;
    btnPonteirar: TButton;
    procedure btnArquivoClick(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure chkMultiplosClick(Sender: TObject);
    procedure edtPISExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnGerarArquivoClick(Sender: TObject);
    procedure dtsAFDDataChange(Sender: TObject; Field: TField);
    procedure Button1Click(Sender: TObject);
    procedure btnExcluirMovClick(Sender: TObject);
    procedure btnPonteirarClick(Sender: TObject);
  private
    { Private declarations }
    FDtIni,
    FDtFim : string;

    FStringList : TStringList;

    FHeader : string;
    
    function PreencheDados(pDtIni,pDataFim : String):boolean;
    procedure PreencheDadosPeriodo;
    procedure PreencheDadosData;
    procedure PreencheDadosPIS;
    procedure PreencheDadosPIS_Data;
    procedure PreencheDadosPIS_Periodo;
    procedure PreencheDados_semFiltro;
    procedure InsereNOClient(pData,pHora,pNSR,pPIS : string);
    function between(pHorario, pIntervaloIni, pIntervaloFim: TDateTime): Boolean;
    procedure PreencheStringList;
  public
    { Public declarations }
    function StrZero(Zeros:string;Quant:integer):String;
  end;

var
  frmAFD: TfrmAFD;

implementation

uses uAdicionarMov;

{$R *.dfm}

procedure TfrmAFD.btnArquivoClick(Sender: TObject);
begin
  if not chkMultiplos.Checked then
    begin
      if OpenDialog1.Execute then
        edtArquivo.Text := OpenDialog1.FileName;
    end
  else
    begin
      if shlGetDirectory.Execute then
        edtArquivo.Text := shlGetDirectory.Path;
    end;
end;

procedure TfrmAFD.btnGerarClick(Sender: TObject);
begin
  client.Close;
  FDtIni := trim(StringReplace(edtDtIni.Text,'/','',[rfReplaceAll]));
  FDtFim := trim(StringReplace(edtDtFim.Text,'/','',[rfReplaceAll]));

  if not PreencheDados(FDtIni,FDtFim) then
    ShowMessage('Informações incompletas.Verifique!');
end;

function TfrmAFD.PreencheDados(pDtIni,pDataFim: String): boolean;
var lcstr : TStringList;
begin
  Result := (edtArquivo.Text <> '') and (FileExists(edtArquivo.Text)or DirectoryExists(edtArquivo.Text));

  FStringList := TStringList.Create;
  try
    if Result then
    begin
      if chkMultiplos.Checked then
        PreencheStringList
      else
        FStringList.LoadFromFile(edtArquivo.Text);

      if (pDtIni = '')then
        begin
          if (edtPIS.Text = '') then
            PreencheDados_semFiltro
          else
            PreencheDadosPIS;

          client.IndexName := 'IdxPrimario';
          client.First;
        end
      else
        begin
          if (pDataFim = '') then
            begin
              if (edtPIS.Text = '') then
                PreencheDadosData
              else
                PreencheDadosPIS_Data;
            end
          else
            begin
              if (edtPIS.Text = '') then
                PreencheDadosPeriodo
              else
                PreencheDadosPIS_Periodo;
            end;

          client.IndexName := 'IdxPrimario';
          client.First;
        end;

      lblRegistros.Caption := 'Quantidade de Registros: '+ IntTostr(client.RecordCount);
    end;
  finally
    FreeAndNil(FStringList);
  end;
end;

procedure TfrmAFD.PreencheDadosData;
var i : Integer;
    lcData,
    lcHora,
    lcPIS,
    lcLinha,
    lcNSR  :string;
begin
  client.CreateDataSet;
  //começo de 1 pra não Mostrar o header
  for i := 0 to  FStringList.Count - 1 do
  begin
    lcLinha := FStringList.Strings[i];

    //alimento o header
    if Length(lcLinha) > 230 then
      FHeader := lcLinha;

    if Length(lcLinha) <= 35 then
    begin
      lcNSR  := Copy(lcLinha,1,9);
      lcData := Copy(lcLinha,11,2) + '/'+ Copy(lcLinha,13,2) + '/' + Copy(lcLinha,15,4);
      lcHora := Copy(lcLinha,19,2) + ':'+ Copy(lcLinha,21,2);
      lcPIS  := Copy(lcLinha,23,12);
      if (pos(FDtIni,lcLinha) > 0) then
        InsereNOClient(lcData,lcHora,lcNSR,lcPIS);
    end;
  end;
end;

procedure TfrmAFD.PreencheDadosPeriodo;
var i : Integer;
    lcData,
    lcHora,
    lcPIS,
    lcLinha,
    lcNSR  :string;

    lcDataIni,
    lcDataFim,
    lcDataMov : TDateTime;
begin
  lcDataIni := StrToDate(edtDtIni.Text);
  lcDataFim := StrToDate(edtDtFim.Text);

  client.CreateDataSet;
  //começo de 1 pra não Mostrar o header
  for i := 0 to  FStringList.Count - 1 do
  begin
    lcLinha := FStringList.Strings[i];

    //alimento o header
    if Length(lcLinha) > 230 then
      FHeader := lcLinha;

    if Length(lcLinha) <= 35 then
    begin
      lcData := Copy(lcLinha,11,2) + '/'+ Copy(lcLinha,13,2) + '/' + Copy(lcLinha,15,4);
      lcHora := Copy(lcLinha,19,2) + ':'+ Copy(lcLinha,21,2);
      lcPIS  := Copy(lcLinha,23,12);
      lcDataMov := StrToDate(lcData);
      lcNSR  := Copy(lcLinha,1,9);

      if between(lcDataMov,lcDataIni,lcDataFim) then
        InsereNOClient(lcData,lcHora,lcNSR,lcPIS);
    end;
  end;
end;

procedure TfrmAFD.PreencheDadosPIS;
var i : Integer;
    lcData,
    lcHora,
    lcPIS,
    lcLinha,
    lcNSR  :string;
begin
  client.CreateDataSet;
  //começo de 1 pra não Mostrar o header
  for i := 0 to  FStringList.Count - 1 do
  begin
    lcLinha := FStringList.Strings[i];

    //alimento o header
    if Length(lcLinha) > 230 then
      FHeader := lcLinha;

    if Length(lcLinha) <= 35 then
    begin
      lcData := Copy(lcLinha,11,2) + '/'+ Copy(lcLinha,13,2) + '/' + Copy(lcLinha,15,4);
      lcHora := Copy(lcLinha,19,2) + ':'+ Copy(lcLinha,21,2);
      lcNSR  := Copy(lcLinha,1,9);
      lcPIS  := Copy(lcLinha,23,12);
      //if (pos(lcPIS,lcLinha) > 0) then

      {if (lcPIS = '012995405240') then
        showMessage('Achei');}

      if (lcPIS = edtPIS.Text) then
        InsereNOClient(lcData,lcHora,lcNSR,lcPIS);
    end;
  end;
end;

procedure TfrmAFD.PreencheDadosPIS_Data;
var i : Integer;
    lcData,
    lcHora,
    lcPIS,
    lcLinha,
    lcNSR  :string;
begin
  client.CreateDataSet;
  //começo de 1 pra não Mostrar o header
  for i := 0 to  FStringList.Count - 1 do
  begin
    lcLinha := FStringList.Strings[i];

    //alimento o header
    if Length(lcLinha) > 230 then
      FHeader := lcLinha;

    if Length(lcLinha) <= 35 then
    begin
      lcData := Copy(lcLinha,11,2) + '/'+ Copy(lcLinha,13,2) + '/' + Copy(lcLinha,15,4);
      lcHora := Copy(lcLinha,19,2) + ':'+ Copy(lcLinha,21,2);
      lcNSR  := Copy(lcLinha,1,9);
      lcPIS  := Copy(lcLinha,23,12);
      if (lcPIS = edtPIS.Text) and
         (FDtIni = Copy(lcLinha,11,8)) then
        InsereNOClient(lcData,lcHora,lcNSR,lcPIS);
    end;
  end;
end;

procedure TfrmAFD.PreencheDadosPIS_Periodo;
var i : Integer;
    lcData,
    lcHora,
    lcPIS,
    lcLinha,
    lcNSR  :string;

    lcDataIni,
    lcDataFim,
    lcDataMov : TDateTime;
begin
  lcDataIni := StrToDate(edtDtIni.Text);
  lcDataFim := StrToDate(edtDtFim.Text);

  client.CreateDataSet;
  //começo de 1 pra não Mostrar o header
  for i := 0 to  FStringList.Count - 1 do
  begin
    lcLinha := FStringList.Strings[i];

    //alimento o header
    if Length(lcLinha) > 230 then
      FHeader := lcLinha;

    if Length(lcLinha) <= 35 then
    begin
      lcData := Copy(lcLinha,11,2) + '/'+ Copy(lcLinha,13,2) + '/' + Copy(lcLinha,15,4);
      lcHora := Copy(lcLinha,19,2) + ':'+ Copy(lcLinha,21,2);
      lcPIS  := Copy(lcLinha,23,12);
      lcNSR  := Copy(lcLinha,1,9);

      lcDataMov := StrToDate(lcData);
       if (lcPIS = edtPIS.Text) and
          between(lcDataMov,lcDataIni,lcDataFim) then
        InsereNOClient(lcData,lcHora,lcNSR,lcPIS);
    end;
  end;
end;

procedure TfrmAFD.PreencheDados_semFiltro;
var  i : Integer;
     lcData,
     lcHora,
     lcPIS,
     lcLinha,
     lcNSR  :string;
begin
  client.CreateDataSet;
  //começo de 1 pra não Mostrar o header
  for i := 0 to  FStringList.Count - 1 do
  begin
    lcLinha := FStringList.Strings[i];

    //alimento o header
    if Length(lcLinha) > 230 then
      FHeader := lcLinha;

    if Length(lcLinha) <= 35 then
    begin
      lcData := Copy(lcLinha,11,2) + '/'+ Copy(lcLinha,13,2) + '/' + Copy(lcLinha,15,4);
      lcHora := Copy(lcLinha,19,2) + ':'+ Copy(lcLinha,21,2);
      lcPIS  := Copy(lcLinha,23,12);
      lcNSR  := Copy(lcLinha,1,9);

      InsereNOClient(lcData,lcHora,lcNSR,lcPIS);
    end;
  end;
end;


procedure TfrmAFD.InsereNOClient(pData,pHora,pNSR,pPIS : string);
var i : Integer;

  function UltimaMarcacaoInserida : Integer;
  var j : Integer;
  begin
    result := 0;
    for j := 1 to 10 do
    begin
      if (client.FieldByName('HrMovimentacao'+ IntToStr(j)).AsString <> '') then
        result := J + 1;
    end;
  end;
begin
  if client.Locate('PIS;DtMovimentacao',varArrayOf([pPIS,pData]),[]) then
    begin
      i := UltimaMarcacaoInserida;
      client.Edit;
      client.FieldByName('HrMovimentacao'+ IntToStr(i)).AsString := pHora;
      client.FieldByName('NSR'+ IntToStr(i)).AsString := pNSR;
      client.Post;
    end
  else
    begin
      client.Append;
      clientDtMovimentacao.AsString := pData;
      clientPIS.AsString := pPIS;
      clientHrMovimentacao1.AsString := pHora;
      clientNSR1.AsString := pNSR;
      client.Post;
    end;
end;

function TfrmAFD.between(pHorario, pIntervaloIni,
  pIntervaloFim: TDateTime): Boolean;
begin
  Result := (pHorario >= pIntervaloIni) and (pHorario <= pIntervaloFim);
end;

procedure TfrmAFD.PreencheStringList;
var lcStringList  : TStringList;
    lcFileLisBox  : TFileListBox;
    lcLinha,
    lcArquivo   : string;
    i,j : Integer;
begin
  lcFileLisBox       := TFileListBox.Create(self);
  lcStringList       := TStringList.Create;
  try
    lcFileLisBox.Parent := Self;
    lcFileLisBox.Mask := '*.txt';
    lcFileLisBox.Visible := False;
    lcFileLisBox.ApplyFilePath(edtArquivo.Text);

    for i := 0 to lcFileLisBox.Items.Count - 1 do
    begin
      lcStringList.Clear;
      lcArquivo := edtArquivo.Text + '\' + lcFileLisBox.Items.Strings[i];
      lcStringList.LoadFromFile(lcArquivo);
      for j := 0 to lcStringList.Count - 1 do
      begin
        lcLinha := lcStringList.Strings[j];

        //alimento o header
        if Length(lcLinha) > 230 then
          FHeader := lcLinha;
        //alimento a stringlist com todos os arquivos
        if Length(lcLinha) <= 35 then
          FStringList.Add(lcLinha);
      end;
    end;
  finally
    FreeandNil(lcFileLisBox);
    FreeandNil(lcStringList);
  end;
end;

procedure TfrmAFD.chkMultiplosClick(Sender: TObject);
begin
  edtArquivo.clear;
end;

function TfrmAFD.StrZero(Zeros: string; Quant: integer): String;
var
  I,Tamanho:integer;
  aux: string;
begin
  aux     := zeros;
  Tamanho := length(ZEROS);
  ZEROS   := '';
  for I:=1 to quant-tamanho do ZEROS := ZEROS + '0';
    aux     := zeros + aux;
  StrZero := aux;
end;

procedure TfrmAFD.edtPISExit(Sender: TObject);
begin
  if (edtPIS.Text <> '') and (Length(edtPIS.Text)< 12) then
    edtPIS.Text := StrZero(edtPIS.Text,12);
end;

procedure TfrmAFD.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = chr(13) then
  begin
    if not (activeControl is TMemo) then
    begin
      selectnext(activeControl,true,true);
      Key := chr(0);
    end;
  end;
end;

procedure TfrmAFD.btnGerarArquivoClick(Sender: TObject);
var lcStringList : TStringList;
    i : integer;
    lcLinha,
    lcArquivo : string;
begin
  if (client.RecordCount > 0) then
  begin
    lcStringList := TStringList.Create;
    lcStringList.Add(FHeader);
    try
      client.First;
      while not client.Eof do
      begin
        for i := 1 to 10 do
        begin
          lcLinha := '';
          if (client.FieldByName('HrMovimentacao' + IntToStr(i)).AsString <> '') then
          begin
            lcLinha := client.FieldByName('NSR' + IntToStr(i)).AsString;
            lcLinha := lcLinha + '3';
            lcLinha := lcLinha + StringReplace(client.FieldByName('DtMovimentacao').AsString,'/','',[rfReplaceAll]);
            lcLinha := lcLinha + StringReplace(client.FieldByName('HrMovimentacao' + IntToStr(i)).AsString,':','',[rfReplaceAll]);
            lcLinha := lcLinha + client.FieldByName('PIS').AsString;
            lcStringList.Add(lcLinha);
          end;
        end;
        client.Next;
      end;
    finally
      lcArquivo := StringReplace(ExtractFileName(edtArquivo.Text),'.txt','',[rfReplaceAll]);
      lcStringList.SaveToFile(ExtractFilePath(edtArquivo.Text)+ lcArquivo + 'new.txt');
      showMessage('Arquivo gerado com sucesso!!!');
      client.First;
      FreeAndNil(lcStringList);
    end;
  end;
end;

procedure TfrmAFD.dtsAFDDataChange(Sender: TObject; Field: TField);
begin
  btnGerarArquivo.Enabled := client.RecordCount > 0;
end;

procedure TfrmAFD.Button1Click(Sender: TObject);
begin
  frmAdicionarMov := TfrmAdicionarMov.Create(self);
  frmAdicionarMov.ShowModal;
end;

procedure TfrmAFD.btnExcluirMovClick(Sender: TObject);
begin
  client.Delete;
end;

procedure TfrmAFD.btnPonteirarClick(Sender: TObject);
begin
  if (edtPis.Text <> '') and client.Active then
    client.Locate('PIS',edtPIS.Text,[]);
end;

end.

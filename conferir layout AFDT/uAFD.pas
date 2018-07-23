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
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    client: TClientDataSet;
    dtsAFD: TDataSource;
    clientDtMovimentacao: TStringField;
    clientPIS: TStringField;
    chkMultiplos: TCheckBox;
    shlGetDirectory: TcxShellBrowserDialog;
    Label4: TLabel;
    lblRegistros: TLabel;
    AltFFVclSkin1: TAltNxVclSkin;
    clientMarcacao: TStringField;
    clientNREP: TStringField;
    clientTipo_Marcacao: TStringField;
    clientNum_Marcacao: TStringField;
    clientTipo_Reg: TStringField;
    clientMotivo: TStringField;
    Panel3: TPanel;
    btnGerar: TButton;
    edtPIS: TEdit;
    Label3: TLabel;
    Label2: TLabel;
    edtDtFim: TMaskEdit;
    edtDtIni: TMaskEdit;
    Label1: TLabel;
    procedure btnArquivoClick(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure chkMultiplosClick(Sender: TObject);
    procedure edtPISExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dtsAFDDataChange(Sender: TObject; Field: TField);
    procedure Button1Click(Sender: TObject);
    procedure btnExcluirMovClick(Sender: TObject);
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

    function LimpaString(pValue : string) :string;
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
var  i : Integer;
     lData,
     lMarcacao,
     lPIS,
     lLinha,
     lNREP,
     lTipo_Marcacao,
     lNum_Marcacao,
     lTipo_Reg,
     lMotivo  :string;
     lDataIni,
     lDataFim,
     lDataMov : TDateTime;
begin
  if (LimpaString(edtDtIni.Text) <> '') then
    lDataIni := StrToDate(edtDtIni.Text)
  else
    lDataIni := 0;

  if (LimpaString(edtDtfim.Text) <> '') then
    lDataFim := StrToDate(edtDtFim.Text)
  else
    lDataFim := 0;

    
  client.CreateDataSet;
  //começo de 1 pra não Mostrar o header
  for i := 0 to  FStringList.Count - 1 do
  begin
    lLinha := FStringList.Strings[i];

    //alimento o header
    if Length(lLinha) > 230 then
      FHeader := lLinha;

    if (Length(lLinha) > 10) and (Length(lLinha) <= 156) then
    begin
      lData          := Copy(lLinha,11,2) + '/'+ Copy(lLinha,13,2) + '/' + Copy(lLinha,15,4);
      lMarcacao      := Copy(lLinha,19,2) + ':'+ Copy(lLinha,21,2);
      lPIS           := Copy(lLinha,23,12);
      lNREP          := Copy(lLinha,35,17);
      lTipo_Marcacao := Copy(lLinha,52,1);
      lNum_Marcacao  := Copy(lLinha,53,2);
      lTipo_Reg      := Copy(lLinha,55,1);
      lMotivo        := Copy(lLinha,56,100);

      if (LimpaString(lData) <> '') then
        lDataMov := StrToDate(lData);

      if (pos(FDtIni,lLinha) > 0) and (Length(lLinha) <= 156) then
      begin
        client.Append;
        clientDtMovimentacao.AsString := lData;
        clientMarcacao.AsString       := lMarcacao;
        clientPIS.AsString            := lPIS;
        clientNREP.AsString           := lNREP;

        case  AnsiIndexStr(UpperCase(lTipo_Marcacao), ['E', 'S','D'])  of
          0 : clientTipo_Marcacao.AsString := 'Entrada';
          1 : clientTipo_Marcacao.AsString := 'Saida';
          2 : clientTipo_Marcacao.AsString := 'Desconsiderada';
        end;

        clientNum_Marcacao.AsString   := lNum_Marcacao;
        case  AnsiIndexStr(UpperCase(lTipo_Reg), ['O', 'I','P'])  of
          0 : clientTipo_Reg.AsString := 'Original';
          1 : clientTipo_Reg.AsString := 'Incluida';
          2 : clientTipo_Reg.AsString := 'Pré-Assinalada';
        end;

        clientMotivo.AsString         := lMotivo;
        client.post;
      end;
    end;
  end;
end;

procedure TfrmAFD.PreencheDadosPeriodo;
var  i : Integer;
     lData,
     lMarcacao,
     lPIS,
     lLinha,
     lNREP,
     lTipo_Marcacao,
     lNum_Marcacao,
     lTipo_Reg,
     lMotivo  :string;
     lDataIni,
     lDataFim,
     lDataMov : TDateTime;
begin
  if (LimpaString(edtDtIni.Text) <> '') then
    lDataIni := StrToDate(edtDtIni.Text)
  else
    lDataIni := 0;

  if (LimpaString(edtDtFim.Text) <> '') then
    lDataFim := StrToDate(edtDtFim.Text)
  else
    lDataFim := 0;

  client.CreateDataSet;
  //começo de 1 pra não Mostrar o header
  for i := 0 to  FStringList.Count - 1 do
  begin
    lLinha := FStringList.Strings[i];

    //alimento o header
    if Length(lLinha) > 230 then
      FHeader := lLinha;

    if (Length(lLinha) > 10) and (Length(lLinha) <= 156) then
    begin
      lData          := Copy(lLinha,11,2) + '/'+ Copy(lLinha,13,2) + '/' + Copy(lLinha,15,4);
      lMarcacao      := Copy(lLinha,19,2) + ':'+ Copy(lLinha,21,2);
      lPIS           := Copy(lLinha,23,12);
      lNREP          := Copy(lLinha,35,17);
      lTipo_Marcacao := Copy(lLinha,52,1);
      lNum_Marcacao  := Copy(lLinha,53,2);
      lTipo_Reg      := Copy(lLinha,55,1);
      lMotivo        := Copy(lLinha,56,100);

      if (LimpaString(lData) <> '') then
        lDataMov := StrToDate(lData);


      if between(lDataMov,lDataIni,lDataFim) and (Length(lLinha) <= 156) then
      begin
        client.Append;
        clientDtMovimentacao.AsString := lData;
        clientMarcacao.AsString       := lMarcacao;
        clientPIS.AsString            := lPIS;
        clientNREP.AsString           := lNREP;

        case  AnsiIndexStr(UpperCase(lTipo_Marcacao), ['E', 'S','D'])  of
          0 : clientTipo_Marcacao.AsString := 'Entrada';
          1 : clientTipo_Marcacao.AsString := 'Saida';
          2 : clientTipo_Marcacao.AsString := 'Desconsiderada';
        end;

        clientNum_Marcacao.AsString   := lNum_Marcacao;
        case  AnsiIndexStr(UpperCase(lTipo_Reg), ['O', 'I','P'])  of
          0 : clientTipo_Reg.AsString := 'Original';
          1 : clientTipo_Reg.AsString := 'Incluida';
          2 : clientTipo_Reg.AsString := 'Pré-Assinalada';
        end;

        clientMotivo.AsString         := lMotivo;
        client.post;
      end;
    end;
  end;
end;

procedure TfrmAFD.PreencheDadosPIS;
var  i : Integer;
     lData,
     lMarcacao,
     lPIS,
     lLinha,
     lNREP,
     lTipo_Marcacao,
     lNum_Marcacao,
     lTipo_Reg,
     lMotivo  :string;
     lDataIni,
     lDataFim,
     lDataMov : TDateTime;
begin
  if (LimpaString(edtDtIni.Text) <> '') then
    lDataIni := StrToDate(edtDtIni.Text)
  else
    lDataIni := 0;

  if (LimpaString(edtDtFim.Text) <> '') then
    lDataFim := StrToDate(edtDtFim.Text)
  else
    lDataFim := 0;


  client.CreateDataSet;
  //começo de 1 pra não Mostrar o header
  for i := 0 to  FStringList.Count - 1 do
  begin
    lLinha := FStringList.Strings[i];

    //alimento o header
    if Length(lLinha) > 230 then
      FHeader := lLinha;

    if (Length(lLinha) > 10) and (Length(lLinha) <= 156) then
    begin
      lData          := Copy(lLinha,11,2) + '/'+ Copy(lLinha,13,2) + '/' + Copy(lLinha,15,4);
      lMarcacao      := Copy(lLinha,19,2) + ':'+ Copy(lLinha,21,2);
      lPIS           := Copy(lLinha,23,12);
      lNREP          := Copy(lLinha,35,17);
      lTipo_Marcacao := Copy(lLinha,52,1);
      lNum_Marcacao  := Copy(lLinha,53,2);
      lTipo_Reg      := Copy(lLinha,55,1);
      lMotivo        := Copy(lLinha,56,100);


      if (LimpaString(lData) <> '') then
        lDataMov := StrToDate(lData);


      if (lPIS = edtPIS.Text) and (Length(lLinha) <= 156) then
      begin
        client.Append;
        clientDtMovimentacao.AsString := lData;
        clientMarcacao.AsString       := lMarcacao;
        clientPIS.AsString            := lPIS;
        clientNREP.AsString           := lNREP;

        case  AnsiIndexStr(UpperCase(lTipo_Marcacao), ['E', 'S','D'])  of
          0 : clientTipo_Marcacao.AsString := 'Entrada';
          1 : clientTipo_Marcacao.AsString := 'Saida';
          2 : clientTipo_Marcacao.AsString := 'Desconsiderada';
        end;

        clientNum_Marcacao.AsString   := lNum_Marcacao;
        case  AnsiIndexStr(UpperCase(lTipo_Reg), ['O', 'I','P'])  of
          0 : clientTipo_Reg.AsString := 'Original';
          1 : clientTipo_Reg.AsString := 'Incluida';
          2 : clientTipo_Reg.AsString := 'Pré-Assinalada';
        end;

        clientMotivo.AsString         := lMotivo;
        client.post;
      end;
    end;
  end;
end;

procedure TfrmAFD.PreencheDadosPIS_Data;
var  i : Integer;
     lData,
     lMarcacao,
     lPIS,
     lLinha,
     lNREP,
     lTipo_Marcacao,
     lNum_Marcacao,
     lTipo_Reg,
     lMotivo  :string;
     lDataIni,
     lDataFim,
     lDataMov : TDateTime;
begin
  if (LimpaString(edtDtIni.Text) <> '') then
    lDataIni := StrToDate(edtDtIni.Text)
  else
    lDataIni := 0;

  if (LimpaString(edtDtFim.Text) <> '') then
    lDataFim := StrToDate(edtDtFim.Text)
  else
    lDataFim := 0;


  client.CreateDataSet;
  //começo de 1 pra não Mostrar o header
  for i := 0 to  FStringList.Count - 1 do
  begin
    lLinha := FStringList.Strings[i];

    //alimento o header
    if Length(lLinha) > 230 then
      FHeader := lLinha;

    if (Length(lLinha) > 10) and (Length(lLinha) <= 156) then
    begin
      lData          := Copy(lLinha,11,2) + '/'+ Copy(lLinha,13,2) + '/' + Copy(lLinha,15,4);
      lMarcacao      := Copy(lLinha,19,2) + ':'+ Copy(lLinha,21,2);
      lPIS           := Copy(lLinha,23,12);
      lNREP          := Copy(lLinha,35,17);
      lTipo_Marcacao := Copy(lLinha,52,1);
      lNum_Marcacao  := Copy(lLinha,53,2);
      lTipo_Reg      := Copy(lLinha,55,1);
      lMotivo        := Copy(lLinha,56,100);

      if (LimpaString(lData) <> '') then
        lDataMov := StrToDate(lData);

      if (lPIS = edtPIS.Text) and
         (FDtIni = Copy(lLinha,11,8)) then
      begin
        client.Append;
        clientDtMovimentacao.AsString := lData;
        clientMarcacao.AsString       := lMarcacao;
        clientPIS.AsString            := lPIS;
        clientNREP.AsString           := lNREP;

        case  AnsiIndexStr(UpperCase(lTipo_Marcacao), ['E', 'S','D'])  of
          0 : clientTipo_Marcacao.AsString := 'Entrada';
          1 : clientTipo_Marcacao.AsString := 'Saida';
          2 : clientTipo_Marcacao.AsString := 'Desconsiderada';
        end;

        clientNum_Marcacao.AsString   := lNum_Marcacao;
        case  AnsiIndexStr(UpperCase(lTipo_Reg), ['O', 'I','P'])  of
          0 : clientTipo_Reg.AsString := 'Original';
          1 : clientTipo_Reg.AsString := 'Incluida';
          2 : clientTipo_Reg.AsString := 'Pré-Assinalada';
        end;

        clientMotivo.AsString         := lMotivo;
        client.post;
      end;
    end;
  end;
end;

procedure TfrmAFD.PreencheDadosPIS_Periodo;
var  i : Integer;
     lData,
     lMarcacao,
     lPIS,
     lLinha,
     lNREP,
     lTipo_Marcacao,
     lNum_Marcacao,
     lTipo_Reg,
     lMotivo  :string;
     lDataIni,
     lDataFim,
     lDataMov : TDateTime;
begin
  if (LimpaString(edtDtIni.Text) <> '') then
    lDataIni := StrToDate(edtDtIni.Text)
  else
    lDataIni := 0;

  if (LimpaString(edtDtIni.Text) <> '') then
    lDataFim := StrToDate(edtDtFim.Text)
  else
    lDataFim := 0;

    
  client.CreateDataSet;
  //começo de 1 pra não Mostrar o header
  for i := 0 to  FStringList.Count - 1 do
  begin
    lLinha := FStringList.Strings[i];

    //alimento o header
    if Length(lLinha) > 230 then
      FHeader := lLinha;

    if (Length(lLinha) > 10) and (Length(lLinha) <= 156) then
    begin
      lData          := Copy(lLinha,11,2) + '/'+ Copy(lLinha,13,2) + '/' + Copy(lLinha,15,4);
      lMarcacao      := Copy(lLinha,19,2) + ':'+ Copy(lLinha,21,2);
      lPIS           := Copy(lLinha,23,12);
      lNREP          := Copy(lLinha,35,17);
      lTipo_Marcacao := Copy(lLinha,52,1);
      lNum_Marcacao  := Copy(lLinha,53,2);
      lTipo_Reg      := Copy(lLinha,55,1);
      lMotivo        := Copy(lLinha,56,100);

      if (LimpaString(lData) <> '') then
        lDataMov := StrToDate(lData);

      if (lPIS = edtPIS.Text) and
          between(lDataMov,lDataIni,lDataFim) then
      begin
        client.Append;
        clientDtMovimentacao.AsString := lData;
        clientMarcacao.AsString       := lMarcacao;
        clientPIS.AsString            := lPIS;
        clientNREP.AsString           := lNREP;

        case  AnsiIndexStr(UpperCase(lTipo_Marcacao), ['E', 'S','D'])  of
          0 : clientTipo_Marcacao.AsString := 'Entrada';
          1 : clientTipo_Marcacao.AsString := 'Saida';
          2 : clientTipo_Marcacao.AsString := 'Desconsiderada';
        end;

        clientNum_Marcacao.AsString   := lNum_Marcacao;
        case  AnsiIndexStr(UpperCase(lTipo_Reg), ['O', 'I','P'])  of
          0 : clientTipo_Reg.AsString := 'Original';
          1 : clientTipo_Reg.AsString := 'Incluida';
          2 : clientTipo_Reg.AsString := 'Pré-Assinalada';
        end;

        clientMotivo.AsString         := lMotivo;
        client.post;
      end;
    end;
  end;
end;

procedure TfrmAFD.PreencheDados_semFiltro;
var  i : Integer;
     lData,
     lMarcacao,
     lPIS,
     lLinha,
     lNREP,
     lTipo_Marcacao,
     lNum_Marcacao,
     lTipo_Reg,
     lMotivo  :string;
begin
  client.CreateDataSet;
  //começo de 1 pra não Mostrar o header
  for i := 0 to  FStringList.Count - 1 do
  begin
    lLinha := FStringList.Strings[i];

    //alimento o header
    if Length(lLinha) > 230 then
      FHeader := lLinha;

    if (Length(lLinha) > 10) and (Length(lLinha) <= 156) then
    begin
      lData          := Copy(lLinha,11,2) + '/'+ Copy(lLinha,13,2) + '/' + Copy(lLinha,15,4);
      lMarcacao      := Copy(lLinha,19,2) + ':'+ Copy(lLinha,21,2);
      lPIS           := Copy(lLinha,23,12);
      lNREP          := Copy(lLinha,35,17);
      lTipo_Marcacao := Copy(lLinha,52,1);
      lNum_Marcacao  := Copy(lLinha,53,2);
      lTipo_Reg      := Copy(lLinha,55,1);
      lMotivo        := Copy(lLinha,56,100);

      client.Append;
      clientDtMovimentacao.AsString := lData;
      clientMarcacao.AsString       := lMarcacao;
      clientPIS.AsString            := lPIS;
      clientNREP.AsString           := lNREP;

      case  AnsiIndexStr(UpperCase(lTipo_Marcacao), ['E', 'S','D'])  of
        0 : clientTipo_Marcacao.AsString := 'Entrada';
        1 : clientTipo_Marcacao.AsString := 'Saida';
        2 : clientTipo_Marcacao.AsString := 'Desconsiderada';
      end;

      clientNum_Marcacao.AsString   := lNum_Marcacao;
      case  AnsiIndexStr(UpperCase(lTipo_Reg), ['O', 'I','P'])  of
        0 : clientTipo_Reg.AsString := 'Original';
        1 : clientTipo_Reg.AsString := 'Incluida';
        2 : clientTipo_Reg.AsString := 'Pré-Assinalada';
      end;

      clientMotivo.AsString         := lMotivo;
      client.post;
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
  {if client.Locate('PIS;DtMovimentacao',varArrayOf([pPIS,pData]),[]) then
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
    end;}
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

procedure TfrmAFD.dtsAFDDataChange(Sender: TObject; Field: TField);
begin
  //btnGerarArquivo.Enabled := client.RecordCount > 0;
end;

procedure TfrmAFD.Button1Click(Sender: TObject);
begin
{  frmAdicionarMov := TfrmAdicionarMov.Create(self);
  frmAdicionarMov.ShowModal;}
end;

procedure TfrmAFD.btnExcluirMovClick(Sender: TObject);
begin
//  client.Delete;
end;


function TfrmAFD.LimpaString(pValue: string): string;
begin
  Result := StringReplace(pValue,'/','',[rfReplaceAll]);
  Result := StringReplace(Result,'-','',[rfReplaceAll]);
  Result := StringReplace(Result,'.','',[rfReplaceAll]);
  Result := StringReplace(Result,'*','',[rfReplaceAll]);
  Result := StringReplace(Result,'&','',[rfReplaceAll]);
  Result := StringReplace(Result,'(','',[rfReplaceAll]);
  Result := StringReplace(Result,')','',[rfReplaceAll]);
  Result := StringReplace(Result,'#','',[rfReplaceAll]);
  Result := StringReplace(Result,'@','',[rfReplaceAll]);
  Result := StringReplace(Result,'!','',[rfReplaceAll]);
  Result := StringReplace(Result,'%','',[rfReplaceAll]);
  Result := StringReplace(Result,'{','',[rfReplaceAll]);
  Result := StringReplace(Result,'}','',[rfReplaceAll]);
  Result := StringReplace(Result,':','',[rfReplaceAll]);
  Result := StringReplace(Result,',','',[rfReplaceAll]);
  Result := StringReplace(Result,'<','',[rfReplaceAll]);
  Result := StringReplace(Result,'>','',[rfReplaceAll]);
  Result := StringReplace(Result,'+','',[rfReplaceAll]);
  Result := StringReplace(Result,'-','',[rfReplaceAll]);
  Result := StringReplace(Result,'=','',[rfReplaceAll]);
  Result := StringReplace(Result,'[','',[rfReplaceAll]);
  Result := StringReplace(Result,']','',[rfReplaceAll]);
  Result := StringReplace(Result,#13,'',[rfReplaceAll]);
  Result := StringReplace(Result,';','',[rfReplaceAll]);
  Result := StringReplace(Result,'\','',[rfReplaceAll]);
  Result := StringReplace(Result,'|','',[rfReplaceAll]);
  Result := StringReplace(Result,'?','',[rfReplaceAll]);
  Result := StringReplace(Result,'ª','',[rfReplaceAll]);
  Result := StringReplace(Result,'º','',[rfReplaceAll]);
  Result := StringReplace(Result,' ','',[rfReplaceAll]);
end;
end.

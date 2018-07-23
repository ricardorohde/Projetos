unit uHoraExtra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DB, DBClient, Grids, DBGrids,
  cxShellBrowserDialog,FileCtrl,StrUtils;

type
  TAFD = record
    DtMovimentacao : TDateTime;
    HrMovimentacao : TTime;
  end;
  TfrmhoraExtra = class(TForm)
    Panel1: TPanel;
    edtArquivo: TEdit;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    edtPIS: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    btnExecutar: TButton;
    Shape1: TShape;
    GroupBox1: TGroupBox;
    edtLogin: TEdit;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    rbHoraExtra: TRadioButton;
    rbAtraso: TRadioButton;
    rbFalta: TRadioButton;
    edtHrSaida: TMaskEdit;
    Label4: TLabel;
    mmoMotivo: TMemo;
    Label5: TLabel;
    edtAutorizado: TEdit;
    Label6: TLabel;
    chkMultiplos: TCheckBox;
    shlGetDirectory: TcxShellBrowserDialog;
    edtDataIni: TMaskEdit;
    edtDataFim: TMaskEdit;
    Label7: TLabel;
    Label8: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    FStringList : TStringList;
    
    { Private declarations }
    function LerAFD(Arquivo : string):boolean;
    procedure PreencheStringList;
    procedure PreencheLayOut(pStringList : TStringList);
    function retornaInfAFD(pLinha : string): TAFD;
    Function HoraParaMin(Hora: TTime): Integer;
    function MinutosEmHoras(Minutos: Integer): TDateTime;
    function between(pHorario, pIntervaloIni, pIntervaloFim: TDateTime): Boolean;
  public
    { Public declarations }
  end;

var
  frmhoraExtra: TfrmhoraExtra;

implementation

{$R *.dfm}

procedure TfrmhoraExtra.Button1Click(Sender: TObject);
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

procedure TfrmhoraExtra.btnExecutarClick(Sender: TObject);
begin
  if (edtPIS.Text <> '') then
    begin
      if not LerAFD(edtArquivo.Text)then
        ShowMessage('Arquivo Invalido.Verifique!')
      else
        ShowMessage('Sucesso!!!');
    end
  else
    ShowMessage('Campo de Pis não preenchido.Verifique!');
end;

function TfrmhoraExtra.HoraParaMin(Hora: TTime): Integer;
var lcHora : string;
begin
  lcHora := FormatDateTime('hhnn',hora);
  Result := 0;
  if (lcHora <> '') then
    Result := (StrToInt(Copy(lcHora,1,2))*60) + StrToInt(Copy(lcHora,3,2));
end;

function TfrmhoraExtra.LerAFD(Arquivo: string): Boolean;
var //lcStringList,
    lcStringListResult : TStringList;
    lcData,
    lcDtIni,
    lcDtFim : TDateTime;
    lcLinha,lcPis : string;
    i : Integer;
begin
  Result := false;

  FStringList := TStringList.Create;

  if (Arquivo <> '') then
  begin
    lcPis := edtPIS.Text;
    //lcStringList       := TStringList.Create;
    if (StringReplace(edtDataIni.Text,'/','',[rfReplaceAll]) <> '') and
       (StringReplace(edtDataFim.Text,'/','',[rfReplaceAll]) <> '') then
    begin
      result := true;
      lcStringListResult := TStringList.Create;
      try
        //lcStringList.LoadFromFile(Arquivo);
        if chkMultiplos.Checked then
          PreencheStringList
        else
          FStringList.LoadFromFile(edtArquivo.Text);

        for i := 0 to FStringList.Count - 1 do
        begin
          lcLinha := FStringList.Strings[i];
          if (Pos(lcPis,lcLinha)> 0) and (Length(lcLinha)<= 35) then
          begin
            lcData  := strTodate(copy(lcLinha,11,2)+ '/'+ copy(lcLinha,13,2) + '/' + copy(lcLinha,15,4));
            lcDtIni := strTodate(edtDataIni.Text);
            lcDtFim := strTodate(edtDataFim.Text);

            if between(lcData,lcDtIni,lcDtFim) then
              lcStringListResult.Add(lcLinha);
          end;
        end;
        PreencheLayOut(lcStringListResult);
      finally
        FreeAndNil(lcStringListResult);
        //FreeAndNil(lcStringList);
      end;
    end;
  end;
end;

function TfrmhoraExtra.MinutosEmHoras(Minutos: Integer): TDateTime;
var
  HoraDecimal, HH, MM: String;
begin
  if Minutos > 1440 then
    Minutos := Minutos - 1440;

  HoraDecimal := FormatFloat( '00.00', Minutos / 60 );
  HH := Copy( HoraDecimal, 1 , 2 );

  if Copy( HoraDecimal, 4, 5 )[1] = '0' then
    MM := '0' + IntToStr( Round( ( StrToInt( Copy( HoraDecimal, 4, 5 ) ) * 60 ) /100 ) )
  else
    MM := IntToStr( Round( ( StrToInt( Copy( HoraDecimal, 4, 5 ) ) * 60 ) /100 ) );

  Result := StrToTime(HH+ ':' + MM);
end;

procedure TfrmhoraExtra.PreencheLayOut(pStringList: TStringList);
var i : Integer;
    lcHrSaida : TTime;
    lcInfAFD : TAFD;
    lcLinha : string;
    lcStringList : TStringList;
    lcArquivoSaida : string;
   function retornaOcorrencia : string;
   begin
     Result := '';
     if rbHoraExtra.Checked then
       Result := 'Ocorrência: (  ) ATRASO  ( X ) HORA EXTRA  (  ) FALTA';
     if rbAtraso.Checked then
       Result := 'Ocorrência: ( X ) ATRASO  (  ) HORA EXTRA  (  ) FALTA';
     if rbFalta.Checked then
       Result := 'Ocorrência: (  ) ATRASO  (  ) HORA EXTRA  ( X ) FALTA';
   end;
begin
  lcHrSaida := StrToTime(edtHrSaida.Text);
  lcStringList := TStringList.Create;
  try
    for i := 0 to pStringList.Count - 1 do
    begin
      lcLinha := pStringList.Strings[i];
      lcInfAFD := retornaInfAFD(lcLinha);
      if (lcInfAFD.HrMovimentacao > (lcHrSaida + StrToTime('00:30'))) then
      begin
        lcStringList.Add('Funcionário/Login: '+ edtLogin.Text);
        lcStringList.Add('Data da ocorrência: '+ FormatDateTime('DD/MM/YYYY',lcInfAFD.DtMovimentacao));
        lcStringList.Add(retornaOcorrencia);
        lcStringList.Add('De que horas até que horas: '+ edtHrSaida.Text + 'h a '+ FormatDateTime('hh:nn',lcInfAFD.HrMovimentacao)+ 'h');
        lcStringList.Add('Total em Minutos: '+ IntToStr(HoraParaMin(lcInfAFD.HrMovimentacao - lcHrSaida)));
        lcStringList.Add('Total em Horas: ' + FormatDateTime('hh:nn',lcInfAFD.HrMovimentacao - lcHrSaida));
        lcStringList.Add('Motivo da Ocorrência/justificativa: ');
        lcStringList.Add(mmoMotivo.Text);
        lcStringList.Add('Autorizado por: ' + edtAutorizado.Text);
        lcStringList.Add('');
      end;
    end;
  finally
    lcArquivoSaida := ExtractFilePath(edtArquivo.Text) + 'HoraExtra'+FormatDateTime('DDMMYYYY',date)+'.txt' ;
    lcStringList.SaveToFile(lcArquivoSaida);
    FreeAndNil(lcStringList);
  end;
end;

function TfrmhoraExtra.retornaInfAFD(pLinha: string): TAFD;
var dia,
    Mes,
    Ano,
    Hora,
    Minuto : string;
begin
  dia    := Copy(pLinha,11,2);
  Mes    := Copy(pLinha,13,2);
  Ano    := Copy(pLinha,15,4);
  Hora   := Copy(pLinha,19,2);
  Minuto := Copy(pLinha,21,2);
  Result.DtMovimentacao := StrToDate(dia + '/' + Mes + '/' + Ano);
  result.HrMovimentacao := StrToTime(Hora + ':' + Minuto);
end;

procedure TfrmhoraExtra.PreencheStringList;
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
      for j := 1 to lcStringList.Count - 1 do
      begin
        lcLinha := lcStringList.Strings[j];
        if Length(lcLinha) <= 35 then
          FStringList.Add(lcLinha);
      end;
    end;
  finally
    FreeandNil(lcFileLisBox);
    FreeandNil(lcStringList);
  end;
end;

function TfrmhoraExtra.between(pHorario, pIntervaloIni,
  pIntervaloFim: TDateTime): Boolean;
begin
  Result := (pHorario >= pIntervaloIni) and (pHorario <= pIntervaloFim);
end;

procedure TfrmhoraExtra.FormKeyPress(Sender: TObject; var Key: Char);
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

end.

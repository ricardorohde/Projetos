unit Versao;

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
  SetupQuery, DASQLMonitor, UniSQLMonitor, IniFiles;

type
  TForm1 = class(TForm)
    edtNome: TEdit;
    Label1: TLabel;
    edtSenha: TEdit;
    Label2: TLabel;
    edtServidor: TEdit;
    Label3: TLabel;
    edtBase: TEdit;
    Label4: TLabel;
    Panel1: TPanel;
    edtVersao: TEdit;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label6: TLabel;
    cboTipo: TComboBox;
    AlterdataConnection1: TAlterdataConnection;
    UniSQLMonitor1: TUniSQLMonitor;
    SetupQuery1: TSetupQuery;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure MudarVersao;

    procedure LerConfiguracao;
    procedure GravarConfiguracao;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  try
    DataBaseStart.Connect(AlterdataConnection1, cboTipo.Text ,edtServidor.Text,edtBase.Text,edtNome.text,edtSenha.Text);

    if not AlterdataConnection1.Connected then
      showMessage('Não foi possível realizar a conexão com o banco de dados.Verifique!!!')
    else
      begin
        MudarVersao;
        GravarConfiguracao;
      end;
  except
    close;
  end;
end;

procedure TForm1.MudarVersao;
begin
  SetupQuery1.Close;
  SetupQuery1.SQL.Clear;
  SetupQuery1.Schema := 'WFISCAL';
  SetupQuery1.SQL.Add('UPDATE wfiscal.wfiscal set');
  SetupQuery1.SQL.Add('  value = &Value');
  SetupQuery1.SQL.Add('where ident like ''%UltimaVersao%''');
  SetupQuery1.MacroByName('Value').AsString := edtVersao.Text;
  SetupQuery1.ExecSQL;

  showMessage('Sucesso!!!' + #10 + 'Rows affecteds: ' + IntToStr(SetupQuery1.RowsAffected));
end;

procedure TForm1.LerConfiguracao;
var
  lConfiguracao : TIniFile;
begin
  if FileExists( ExtractFilePath(Application.ExeName) + 'ConfiguracaoVersao.ini' ) then
    begin
      lConfiguracao := TInifile.Create( ExtractFilePath(Application.ExeName) + 'ConfiguracaoVersao.ini' );
      try
        cboTipo.ItemIndex := lConfiguracao.ReadInteger('Configuracao','Tipo', -1);
        edtNome.Text      := lConfiguracao.ReadString('Configuracao','Nome', '');
        edtSenha.Text     := lConfiguracao.ReadString('Configuracao','Senha', '');
        edtServidor.Text  := lConfiguracao.ReadString('Configuracao','Servidor', '');
        edtBase.Text      := lConfiguracao.ReadString('Configuracao','Base', '');
        edtVersao.Text    := lConfiguracao.ReadString('Configuracao','Versao', '');
      finally
        FreeandNil(lConfiguracao);
      end; {try}
    end;
end;

procedure TForm1.GravarConfiguracao;
var
  lConfiguracao : TIniFile;
begin
  lConfiguracao := TInifile.Create( ExtractFilePath(Application.ExeName) + 'ConfiguracaoVersao.ini' );
  try
    lConfiguracao.WriteInteger('Configuracao','Tipo', cboTipo.ItemIndex);
    lConfiguracao.WriteString('Configuracao','Nome', edtNome.Text);
    lConfiguracao.WriteString('Configuracao','Senha', edtSenha.Text);
    lConfiguracao.WriteString('Configuracao','Servidor', edtServidor.Text);
    lConfiguracao.WriteString('Configuracao','Base', edtBase.Text);
    lConfiguracao.WriteString('Configuracao','Versao', edtVersao.Text);
  finally
    FreeandNil(lConfiguracao);
  end; {try}
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  LerConfiguracao;
end;

end.

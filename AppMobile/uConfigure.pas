unit uConfigure;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, Mask, DBCtrls, DateUtils, uTypes, uLibrary,
  ExtCtrls;

type
  TfrmConfigure = class(TForm)
    cdsMobile: TClientDataSet;
    dtsMobile: TDataSource;
    cdsMobileLOG_PATH: TStringField;
    cdsMobileACTIVED: TStringField;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    dbedtActived: TDBEdit;
    dbedtLogPath: TDBEdit;
    Panel1: TPanel;
    btnConfirmar: TButton;
    btnFechar: TButton;
    cdsMobilePORTA: TIntegerField;
    Button1: TButton;
    sdgLog: TSaveDialog;
    cdsMobileEMPRESA: TStringField;
    cdsMobileFILIAL: TStringField;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    cdsMobileSTATE: TStringField;
    cdsMobileHORAPRECO: TTimeField;
    cdsMobileATUALIZAESTOQUE: TIntegerField;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    cdsMobilePRIMEIRAEXECUCAO: TBooleanField;
    dbchkPrimeiraExecucao: TDBCheckBox;
    cdsMobileHORAINICIOIMPORTACAO: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtsMobileDataChange(Sender: TObject; Field: TField);
    procedure cdsMobileACTIVEDValidate(Sender: TField);
    procedure btnConfirmarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cdsMobileLOG_PATHValidate(Sender: TField);
    procedure cdsMobilePORTAValidate(Sender: TField);
    procedure cdsMobileEMPRESAValidate(Sender: TField);
    procedure cdsMobileFILIALValidate(Sender: TField);
  private
    Schedule: TSchedule;
    procedure ShowFields;
  public
    { Public declarations }
  end;

var
  frmConfigure: TfrmConfigure;

implementation

{$R *.dfm}

procedure TfrmConfigure.btnConfirmarClick(Sender: TObject);
begin
  Schedule.Actived:= cdsMobileACTIVED.AsString;
  Schedule.LogPath:= cdsMobileLOG_PATH.AsString;
  Schedule.Port:= cdsMobilePORTA.AsInteger;
  Schedule.company:= cdsMobileEMPRESA.AsString;
  Schedule.branch:= cdsMobileFILIAL.AsString;
  Schedule.State:= cdsMobileSTATE.AsString;
  Schedule.HoraPreco:= cdsMobileHORAPRECO.AsDateTime;
  Schedule.AtualizarEstoque:= cdsMobileATUALIZAESTOQUE.AsInteger;
  Schedule.DataHoraInicioImportacao:= cdsMobileHORAINICIOIMPORTACAO.AsDateTime;
  Schedule.PrimeiraExecucao:= cdsMobilePRIMEIRAEXECUCAO.AsBoolean;
  TSuperClass.GetInstance.Config.Save(Schedule);
end;

procedure TfrmConfigure.Button1Click(Sender: TObject);
begin
  if sdgLog.Execute then
    cdsMobileLOG_PATH.AsString := sdgLog.FileName;
end;

procedure TfrmConfigure.cdsMobileACTIVEDValidate(Sender: TField);
begin
  Schedule.Actived := Sender.AsString;
end;

procedure TfrmConfigure.cdsMobileEMPRESAValidate(Sender: TField);
begin
  Schedule.company := Sender.AsString;
end;

procedure TfrmConfigure.cdsMobileFILIALValidate(Sender: TField);
begin
  Schedule.branch := Sender.AsString;
end;

procedure TfrmConfigure.cdsMobileLOG_PATHValidate(Sender: TField);
begin
  Schedule.LogPath := Sender.AsString;
end;

procedure TfrmConfigure.cdsMobilePORTAValidate(Sender: TField);
begin
  Schedule.Port := Sender.AsInteger;
end;

procedure TfrmConfigure.dtsMobileDataChange(Sender: TObject; Field: TField);
begin
  ShowFields;
end;

procedure TfrmConfigure.FormCreate(Sender: TObject);
begin
  TSuperClass.GetInstance.Config.Load(Schedule);
end;

procedure TfrmConfigure.FormShow(Sender: TObject);
begin
  cdsMobile.Close;
  cdsMobile.CreateDataSet;
  try
    cdsMobile.Insert;
    cdsMobileACTIVED.AsString := Schedule.Actived;
    cdsMobileLOG_PATH.AsString := Schedule.LogPath;
    cdsMobilePORTA.AsInteger := Schedule.Port;
    cdsMobileEMPRESA.AsString := Schedule.company;
    cdsMobileFILIAL.AsString := Schedule.branch;
    cdsMobileSTATE.AsString := Schedule.State;
    cdsMobileHORAPRECO.AsDateTime := Schedule.HoraPreco;
    cdsMobileATUALIZAESTOQUE.AsInteger := Schedule.AtualizarEstoque;
    cdsMobileHORAINICIOIMPORTACAO.AsDateTime:= Schedule.DataHoraInicioImportacao;
    cdsMobilePRIMEIRAEXECUCAO.AsBoolean:= Schedule.PrimeiraExecucao;
    cdsMobile.Post;
    cdsMobile.Edit;
  finally

  end;
end;

procedure TfrmConfigure.ShowFields;
begin

end;

end.

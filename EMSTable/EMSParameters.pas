unit EMSParameters;

interface

uses
  SysUtils, Classes, Controls, DB;

type
  TEMSParameters = class(TComponent)
  private
    FListFieldsPesquisa : TStrings;
    FListDataSet: TStrings;
    FFieldCampoCodigo: string;
    FCampoCodigo: TWinControl;
    FMasterSource: TDataSource;
    FMasterCampoCodigo: string;
    FMasterDescricaoField: string;
    FMasterCampoID: string;
    FFieldCampoID: string;
    FTableName: string;

//    FListDataSets       : TStrings;
    procedure SetListFieldsPesquisa(const Value: TStrings);
    procedure SetListDataSet(const Value: TStrings);
    procedure SetFieldCampoCodigo(const Value: string);
    procedure SetCampoCodigo(const Value: TWinControl);
    procedure SetMasterSource(const Value: TDataSource);
    procedure SetMasterCampoCodigo(const Value: string);
    procedure SetMasterDescricaoField(const Value: string);
    procedure SetMasterCampoID(const Value: string);
    procedure SetFieldCampoID(const Value: string);
    procedure SetTableName(const Value: string);
    { Private declarations }
  protected
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent);override;
    { Public declarations }
  published
    { Published declarations }
    property ListFieldsPesquisa   : TStrings    read FListFieldsPesquisa   write SetListFieldsPesquisa;
    property ListDataSet          : TStrings    read FListDataSet          write SetListDataSet;
    property TableName            : string      read FTableName            write SetTableName;
    property FieldCampoCodigo     : string      read FFieldCampoCodigo     write SetFieldCampoCodigo;
    property FieldCampoID         : string      read FFieldCampoID         write SetFieldCampoID;
    property CampoCodigo          : TWinControl read FCampoCodigo          write SetCampoCodigo;

    property MasterSource         : TDataSource read FMasterSource         write SetMasterSource;
    property MasterCampoID        : string      read FMasterCampoID        write SetMasterCampoID;
    property MasterCampoCodigo    : string      read FMasterCampoCodigo    write SetMasterCampoCodigo;
    property MasterDescricaoField : string      read FMasterDescricaoField write SetMasterDescricaoField;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('EMS', [TEMSParameters]);
end;

{ TEMSParameters }

procedure TEMSParameters.SetListFieldsPesquisa(const Value: TStrings);
begin
  if FListFieldsPesquisa.Text <> Value.Text then
    try
      begin
        FListFieldsPesquisa.BeginUpdate;
        FListFieldsPesquisa.Assign(Value);
      end;
    finally
      FListFieldsPesquisa.EndUpdate;
    end;
end;

constructor TEMSParameters.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FListFieldsPesquisa := TStringList.Create;
  FListDataSet        := TStringList.Create;
end;

procedure TEMSParameters.SetListDataSet(const Value: TStrings);
begin
  if FListDataSet.Text <> Value.Text then
    try
      begin
        FListDataSet.BeginUpdate;
        FListDataSet.Assign(Value);
      end;
    finally
      FListDataSet.EndUpdate;
    end;
end;

procedure TEMSParameters.SetFieldCampoCodigo(const Value: string);
begin
  FFieldCampoCodigo := Value;
end;

procedure TEMSParameters.SetCampoCodigo(const Value: TWinControl);
begin
  FCampoCodigo := Value;
end;

procedure TEMSParameters.SetMasterSource(const Value: TDataSource);
begin
  FMasterSource := Value;
end;


procedure TEMSParameters.SetMasterCampoCodigo(const Value: string);
begin
  FMasterCampoCodigo := Value;
end;

procedure TEMSParameters.SetMasterDescricaoField(const Value: string);
begin
  FMasterDescricaoField := Value;
end;
procedure TEMSParameters.SetMasterCampoID(const Value: string);
begin
  FMasterCampoID := Value;
end;

procedure TEMSParameters.SetFieldCampoID(const Value: string);
begin
  FFieldCampoID := Value;
end;

procedure TEMSParameters.SetTableName(const Value: string);
begin
  FTableName := Value;
end;

end.


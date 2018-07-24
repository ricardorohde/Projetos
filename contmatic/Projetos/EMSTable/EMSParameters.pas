unit EMSParameters;

interface

uses
  SysUtils, Classes, Controls;

type
  TEMSParameters = class(TComponent)
  private
    FListFieldsPesquisa : TStrings;
    FListDataSet: TStrings;
    FFieldCampoCodigo: string;
    FCampoCodigo: TWinControl;
//    FListDataSets       : TStrings;
    procedure SetListFieldsPesquisa(const Value: TStrings);
    procedure SetListDataSet(const Value: TStrings);
    procedure SetFieldCampoCodigo(const Value: string);
    procedure SetCampoCodigo(const Value: TWinControl);
    { Private declarations }
  protected
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent);override;
    { Public declarations }
  published
    { Published declarations }
    property ListFieldsPesquisa : TStrings    read FListFieldsPesquisa  write SetListFieldsPesquisa;
    property ListDataSet        : TStrings    read FListDataSet         write SetListDataSet;
    property FieldCampoCodigo   : string      read FFieldCampoCodigo    write SetFieldCampoCodigo;
    property CampoCodigo        : TWinControl read FCampoCodigo         write SetCampoCodigo;
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

end.


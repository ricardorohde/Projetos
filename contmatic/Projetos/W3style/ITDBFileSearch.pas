unit ITDBFileSearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ITDBSearch,db,ItValida,Variants;

type
  TITDBFileSearch = class(TITDBSearch)
  FOpenDialog: TOpenDialog;
  private
    { Private declarations }
  protected
    { Protected declarations }
    function GetFilter : string;
    procedure SetFilter ( value : string );
    function GetDefaultExt :string;
    procedure SetDefaultExt ( value : string );
    function GetDialogTitle :string;
    procedure SetDialogTitle ( value : string );
    function GetOpenOptions :TOpenOptions;
    procedure SetOpenOptions ( value : TOpenOptions);
    procedure BtnClick(Sender: TObject);override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);override;
  published
    { Published declarations }
    property Filter :string  read GetFilter write SetFilter;
    property DefaultExt: string read GetDefaultExt write SetDefaultExt;
    property DialogTitle: string read GetDialogTitle write SetDialogTitle;
    property Options: TOpenOptions read GetOpenOptions write SetOpenOptions;
  end;

procedure Register;

implementation

{$R ITDBFileSearch}

constructor TITDBFileSearch.Create(AOwner: TComponent);
begin
  inherited CreateIcon(AOwner,'ARQUIVO');
  valida_Sistema(self);
  FOpenDialog:= TOpenDialog.create(self);
end;

function TITDBFileSearch.GetFilter : string;
begin
   result := FOpenDialog.Filter;
end;

procedure TITDBFileSearch.SetFilter ( value : string );
begin
  if (value<>FOpenDialog.Filter) then
  begin
    FOpenDialog.Filter:=value
  end;
end;

function TITDBFileSearch.GetDefaultExt : string;
begin
   result := FOpenDialog.DefaultExt;
end;

procedure TITDBFileSearch.SetDefaultExt ( value : string );
begin
  if (value<>FOpenDialog.DefaultExt) then
  begin
    FOpenDialog.DefaultExt:=value
  end;
end;

function TITDBFileSearch.GetDialogTitle : string;
begin
   result := FOpenDialog.Title;
end;

procedure TITDBFileSearch.SetDialogTitle ( value : string );
begin
  if (value<>FOpenDialog.Title) then
  begin
    FOpenDialog.Title:=value
  end;
end;

function TITDBFileSearch.GetOpenOptions :TOpenOptions;
begin
   result := FOpenDialog.Options;
end;

procedure TITDBFileSearch.SetOpenOptions ( value : TOpenOptions);
begin
  if (value<>FOpenDialog.Options) then
  begin
    FOpenDialog.Options:=value
  end;
end;

procedure TITDBFileSearch.BtnClick(Sender: TObject);
begin
  FOpenDialog.FileName:=ExtractFileName(vartostr(self.Datasource.dataset.fieldbyname(DataField).Value));
  FOpenDialog.InitialDir:=ExtractFileDir(vartostr(self.Datasource.dataset.fieldbyname(DataField).Value));
  if(FOpenDialog.Execute)then
    self.Datasource.dataset.fieldbyname(DataField).Value:=FOpenDialog.FileName;
end;

procedure Register;
begin
  RegisterComponents('W3Style', [TITDBFileSearch]);
end;

end.

unit ITDBDirectorySearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ITDBSearch,DirectoryDialog,db,ITValida,Variants;

type
  TITDBDirectorySearch = class(TITDBSearch)                          
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure BtnClick(Sender: TObject);override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);override;
  published
    { Published declarations }
  end;

procedure Register;

implementation

{$R ITDBDirectorySearch}

constructor TITDBDirectorySearch.Create(AOwner: TComponent);
begin
  inherited CreateIcon(AOwner,'PASTA');
  valida_Sistema(self);
end;

procedure TITDBDirectorySearch.BtnClick(Sender: TObject);
begin
  self.Datasource.dataset.fieldbyname(DataField).Value:=TfmDirectoryDialog.Execute(vartostr(self.Datasource.dataset.fieldbyname(DataField).Value));
end;

procedure Register;
begin
  RegisterComponents('W3Style', [TITDBDirectorySearch]);
end;

end.

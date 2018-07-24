unit uDbGridtoCsv;

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  childPadrao, ExtCtrls, Grids, DBGrids, Buttons, StdCtrls, Mask,utool,DB;

  procedure DbGridtoCsv(pdbGrid:TdbGrid;psArquivo:TStrings;psNoArquivo:String);

implementation

procedure DbGridtoCsv(pdbGrid:TdbGrid;psArquivo:TStrings;psNoArquivo:String);
var vsLinha:string;
    vBookMark:TBookmark;
    i:integer;
begin
  vsLinha:='';

  //adiciono uma linha com o titulo das colunas
  for i:=0 to pDbGrid.columns.Count-1 do
    AddStrtoList(pDbGrid.columns.Items[i].Title.Caption,vsLinha,';');
  psArquivo.Add(vsLinha+';');

  if(pDbGrid.DataSource <> nil) and (pDbGrid.DataSource.DataSet <> nil)then
  begin
    with pDbGrid.DataSource.DataSet do
    begin
      //adiciono uma linha p/ cada registro do grid
      vBookMark:= GetBookmark;
      DisableControls;
      First;
      while not eof do
      begin
        vsLinha:='';

        for i:=0 to pDbGrid.columns.Count-1 do
          AddStrtoList(FieldByName(pDbGrid.columns.Items[i].FieldName).AsString,vsLinha,';');

        Next;
        psArquivo.Add(vsLinha+';');
      end;

      GotobookMark(vBookMark);
      enablecontrols;
    end;
  end;

  psArquivo.SaveToFile(psNoArquivo);
end;

end.

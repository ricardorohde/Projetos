unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Db, IBCustomDataSet, IBTable, IBquery,
  rsPropSaver, rsProperties, rsStorage, rsRegData, StdActns, ActnList,
  Menus, wwdblook, Registry, wwdbdatetimepicker, ImgList,
  Mask, DBCtrls, DBGrids, Wwdbgrid, wwDBNavigator, DBClient, Variants;

type
  TForm1 = class(TForm)
    wwDBDateTimePicker1: TwwDBDateTimePicker;
    wwDBDateTimePicker2: TwwDBDateTimePicker;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1CODIGO: TIntegerField;
    ClientDataSet1NOME: TStringField;
    DataSource1: TDataSource;
    rsRegData: TrsRegData;
    rsPropSaver: TrsPropSaver;
    PopupMenu: TPopupMenu;
    MnuEditar: TMenuItem;
    MnuDesfazer: TMenuItem;
    N1: TMenuItem;
    MnuRecortar: TMenuItem;
    MnuCopiar: TMenuItem;
    MnuColar: TMenuItem;
    N2: TMenuItem;
    Selecionartudo1: TMenuItem;
    N3: TMenuItem;
    MnuPropriedades: TMenuItem;
    MnuPropriedadeLer: TMenuItem;
    MnuLerPropriedades0: TMenuItem;
    MnuLerPropriedades1: TMenuItem;
    MnuLerPropriedades2: TMenuItem;
    MnuLerPropriedades3: TMenuItem;
    MnuLerPropriedades4: TMenuItem;
    MnuLerPropriedades5: TMenuItem;
    MnuLerPropriedades6: TMenuItem;
    MnuLerPropriedades7: TMenuItem;
    MnuLerPropriedades8: TMenuItem;
    MnuLerPropriedades9: TMenuItem;
    MnuPropriedadeGravar: TMenuItem;
    MnuGravarPropriedades0: TMenuItem;
    MnuGravarPropriedades1: TMenuItem;
    MnuGravarPropriedades2: TMenuItem;
    MnuGravarPropriedades3: TMenuItem;
    MnuGravarPropriedades4: TMenuItem;
    MnuGravarPropriedades5: TMenuItem;
    MnuGravarPropriedades6: TMenuItem;
    MnuGravarPropriedades7: TMenuItem;
    MnuGravarPropriedades8: TMenuItem;
    MnuGravarPropriedades9: TMenuItem;
    N4: TMenuItem;
    MnuPropriedadeApagar: TMenuItem;
    MnuApagarPropriedades0: TMenuItem;
    MnuApagarPropriedades1: TMenuItem;
    MnuApagarPropriedades2: TMenuItem;
    MnuApagarPropriedades3: TMenuItem;
    MnuApagarPropriedades4: TMenuItem;
    MnuApagarPropriedades5: TMenuItem;
    MnuApagarPropriedades6: TMenuItem;
    MnuApagarPropriedades7: TMenuItem;
    MnuApagarPropriedades8: TMenuItem;
    MnuApagarPropriedades9: TMenuItem;
    N5: TMenuItem;
    MnuApagarTodasPropriedades: TMenuItem;
    N6: TMenuItem;
    MnuPararTab: TMenuItem;
    MnuPararTabDesabilitar: TMenuItem;
    MnuPararTabHabilitar: TMenuItem;
    Customizar: TMenuItem;
    Propriedades1: TMenuItem;
    Desabilitar1: TMenuItem;
    Habilitar1: TMenuItem;
    N7: TMenuItem;
    Salvarformulrio1: TMenuItem;
    Desabilitarformulrio1: TMenuItem;
    Habilitarformulrio1: TMenuItem;
    rsStorage: TrsStorage;
    rsCustomProperties: TrsCustomProperties;
    procedure FormShow(Sender: TObject);
    procedure MnuGravarPropriedades0Click(Sender: TObject);
    procedure MnuLerPropriedades0Click(Sender: TObject);
    procedure MnuApagarPropriedades0Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rsCustomPropertiesProperties0GetProperty(Sender,
      Instance: TObject; var Value: Variant);
    procedure rsCustomPropertiesProperties0SetProperty(Sender,
      Instance: TObject; var Value: Variant);
  private
    { Private declarations }

    FrmRootPath: string;
    function IsDate(stDate: string): Boolean;
    function LimpaString(Str, Texto: string): string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  FrmRootPath:= 'Software\Base Software\' + ChangeFileExt(ExtractFileName(Application.ExeName), '') + '\' + copy(ClassName, 2, Length(ClassName)) + '\';

  rsPropSaver.Properties.Clear;
  for I:= 0 to ComponentCount - 1 do
  begin
    if Components[I].Tag <> 99 then
    begin
      if (Components[I] is TwwDblookupCombo) then
        (Components[I] as TwwDblookupCombo).SearchDelay:= 50;
      if (Components[I] is TCustomEdit) then
      begin
        if (((Components[I] as TCustomEdit).Enabled = true) and
          ((Components[I] as TCustomEdit).Visible = true)) then
        begin
          rsPropSaver.Properties.Add(Components[I].Name + '.TabStop');
          rsPropSaver.Properties.Add(Components[I].Name + '.Text,ECD');
          if (Components[I] is TwwDBLookupCombo) or
            (Components[I] is TwwDBLookupCombo) then
            rsPropSaver.Properties.Add(Components[I].Name + '.Value,ECD');
        end;
      end
      else if (Components[i] is TCheckBox) then
      begin
        if (((Components[i] as TCheckBox).Enabled = true) and
          ((Components[i] as TCheckBox).Visible = true)) then
        begin
          rsPropSaver.Properties.Add(Components[i].Name + '.TabStop');
          rsPropSaver.Properties.Add(Components[i].Name + '.Checked');
        end;
      end
      else if (Components[i] is TRadioGroup) then
      begin
        if (((Components[i] as TRadioGroup).Enabled = true) and
          ((Components[i] as TRadioGroup).Visible = true)) then
        begin
          rsPropSaver.Properties.Add(Components[i].Name + '.TabStop');
          rsPropSaver.Properties.Add(Components[i].Name + '.ItemIndex');
        end;
      end
      else if (Components[i] is TwwDBDateTimePicker) then
      begin
        if (((Components[i] as TwwDBDateTimePicker).Enabled = true) and
          ((Components[i] as TwwDBDateTimePicker).Visible = true)) then
        begin
          rsPropSaver.Properties.Add(Components[i].Name + '.TabStop');
          rsPropSaver.Properties.Add(Components[i].Name + '.Date');
        end;
      end
      else if (Components[i] is TRadioButton) then
      begin
        if (((Components[i] as TRadioButton).Enabled = true) and
          ((Components[i] as TRadioButton).Visible = true)) then
        begin
          rsPropSaver.Properties.Add(Components[i].Name + '.TabStop');
          rsPropSaver.Properties.Add(Components[i].Name + '.Checked');
        end;
      end
      else if (Components[i] is TwwDBGrid) then
      begin
        if (((Components[i] as TwwDBGrid).Enabled = true) and
          ((Components[i] as TwwDBGrid).Visible = true)) then
        begin
          rsPropSaver.Properties.Add(Components[i].Name + '.SelectedList.Items');
        end;
      end;
    end;
  end;
  rsCustomProperties.Properties[0].OnGetProperty:= rsCustomPropertiesProperties0GetProperty;
  rsCustomProperties.Properties[0].OnSetProperty:= rsCustomPropertiesProperties0SetProperty;
  //  rsCustomProperties.Properties[1].OnGetProperty := rsCustomPropertiesProperties1GetProperty;
  //  rsCustomProperties.Properties[1].OnSetProperty := rsCustomPropertiesProperties1SetProperty;
end;

procedure TForm1.rsCustomPropertiesProperties0GetProperty(Sender,
  Instance: TObject; var Value: Variant);
begin
  Value:= (Instance as TCustomEdit).Text;
end;

function TForm1.LimpaString(Str, Texto: string): string;
var
  i: integer;
begin
  Result := '';
  if Texto = '' then
    exit;
  for i := 1 to Length(Texto) do
    if Pos(Texto[i], Str)=0 then
      Result := Result + Texto[i];
end;
function TForm1.IsDate(stDate: string): Boolean;
var
  dtValue: TDateTime;
begin
  IsDate:= True;
  if Trim(LimpaString(' /', stDate)) = EmptyStr then
    Exit;
  try
    if Length(stDate)<= 4 then
      dtValue:= StrToDateTime('01/'+ stDate)
    else
      dtValue:= StrToDateTime(stDate);
  except
    on EConvertError do
      IsDate:= False;
  end;
end;

procedure TForm1.rsCustomPropertiesProperties0SetProperty(Sender,
  Instance: TObject; var Value: Variant);
begin
  if Instance is TwwDBDateTimePicker then
    begin
      if (VarToStrDef(Value, '') <> '') and IsDate(VarToStrDef(Value, '')) then
        (Instance as TwwDBDateTimePicker).Date:= StrToDate(VarToStrDef(Value, ''));
    end
  else
    (Instance as TCustomEdit).Text:= Value;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  rsStorage.Clear;
  rsRegData.RootPath:= FrmRootPath + IntToStr(0);
  rsStorage.Load;
  rsPropSaver.LoadValues;

  //  ClientDataSet1.Close;
  //  ClientDataSet1.CreateDataSet;
  //  for I := 0 to 10 do
  //    ClientDataSet1.AppendData([i, 'Teste - '+ IntToStr(i)]);

end;

procedure TForm1.MnuApagarPropriedades0Click(Sender: TObject);
begin
  with TRegistry.Create do
    try
      RootKey:= HKEY_CURRENT_USER;
      if (Sender as TMenuItem).Tag = 10 then
        DeleteKey(FrmRootPath)
      else
        DeleteKey(FrmRootPath + IntToStr((Sender as TMenuItem).Tag) + '\');
      if (Sender as TMenuItem).Tag = 0 then
      begin
        rsPropSaver.Active:= False;
        rsStorage.Active:= False;
      end;
    finally
      free;
    end;
end;

procedure TForm1.MnuGravarPropriedades0Click(Sender: TObject);
begin
  rsStorage.Clear;
  rsRegData.RootPath:= FrmRootPath + IntToStr((Sender as TMenuItem).Tag);
  rsPropSaver.SaveValues;
  rsStorage.Save;
end;

procedure TForm1.MnuLerPropriedades0Click(Sender: TObject);
begin
  rsStorage.Clear;
  rsRegData.RootPath:= FrmRootPath + IntToStr((Sender as TMenuItem).Tag);
  rsStorage.Load;
  rsPropSaver.LoadValues;
end;

end.


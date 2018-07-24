{
 --------------------------------------
 Projeto..........: Folha.dpr
 Autor............: TASB
 Data Criação.....: 31/05/2000
 Comentários......: implementação dos Componentes : FormController e TabToEnter
                    Atribuição do Hint automático para o statusbar.

 Atualizações.....:
 --------------------------------------
}

unit ClsflCustomForm;

interface

uses MaskUtils, 
  uDadosConexao, 
  uDmPostgres, uADStanIntf, uADStanOption, uADStanParam,
  uADStanError, uADDatSManager, uADPhysIntf, uADDAptIntf, uADStanAsync,
  uADDAptManager, uADCompDataSet, uADCompClient, tbTableNew,

  Windows, Messages, Variants, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls,
  stdctrls,
  wwDbLook,
  wwDbComb,
  wwDbDlg,
  wwDbDateTimePicker,
  wwDotDot;

type
  TflCustomForm = class(TForm)
    StatusBar: TStatusBar;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    OldOnActiveControlChange : TNotifyEvent;
    OldOnHint: TNotifyEvent;
    procedure NewOnActiveControlChange(Sender: TObject);
    procedure NewOnHint(Sender: TObject);
  protected
    procedure ContainerControls(Enabled: Boolean; pContainer : TWinControl);
    procedure FirstControlContainer( pContainer: TWinControl);
  public
  end;
{
var
  flCustomForm: TflCustomForm;
}
implementation

{$R *.DFM}

procedure TflCustomForm.ContainerControls(Enabled: Boolean; pContainer: TWinControl);
var
  I: Integer;
begin
  for I := 0 to pContainer.ControlCount -1 do
    if pContainer.Controls[I] is TWinControl then
      TWinControl(pContainer.Controls[I]).Enabled := Enabled;
end;

procedure TflCustomForm.FirstControlContainer(pContainer: TWinControl);
var
  I: Integer;
  LSTcontrols: TList;
begin
  LSTcontrols := TList.Create;
  try
    pContainer.GetTabOrderList(LSTcontrols);
    for I := 0 to LSTcontrols.Count -1 do
      if TControl(LSTcontrols.Items[I]) is TWinControl then
        if TWinControl(LSTcontrols.Items[I]).CanFocus then
        begin
          try
            TWinControl(LSTcontrols.Items[I]).SetFocus;
            Break;
          except end;
        end;
  finally
    LSTcontrols.Free;
  end;
end;

procedure TflCustomForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( Key = VK_RETURN ) then
  begin
    if ( ssCtrl in Shift ) then
    begin
      if Self.ActiveControl is TComboBox then
      begin
        TComboBox(Self.ActiveControl).DroppedDown:=True;
        Key := 0;
      end;

      if Self.ActiveControl is TwwDbLookUpCombo then
      begin
         TwwDbLookUpCombo(Self.ActiveControl).DropDown;
        Key := 0;
      end;

      if Self.ActiveControl is TwwDbComboBox then
      begin
         TwwDbComboBox(Self.ActiveControl).DropDown;
        Key := 0;
      end;

      if Self.ActiveControl is TwwDbLookUpComboDlg then
      begin
         TwwDbLookUpComboDlg(Self.ActiveControl).DropDown;
        Key := 0;
      end;

      if Self.ActiveControl is TwwDbComboDlg then
      begin
         TwwDbComboDlg(Self.ActiveControl).DropDown;
        Key := 0;
      end;

      if Self.ActiveControl is TwwDBCustomDateTimePicker then
      begin
         TwwDBCustomDateTimePicker(Self.ActiveControl).DropDown;
        Key := 0;
      end;

    end;
  end;
end;

procedure TflCustomForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    if not (Self.ActiveControl is TCustomMemo) then
    begin
      if (GetKeyState(VK_SHIFT) and 128)=128 then
         Self.Perform(WM_NEXTDLGCTL, -1, 0)
      else
         Self.Perform(WM_NEXTDLGCTL, 0, 0);
      Key:=#0;
    end;
  end;
end;

procedure TflCustomForm.NewOnActiveControlChange(Sender:TObject);
var
  I : Integer;
begin
  if Assigned(Screen.ActiveForm) then
  begin
    with Screen.ActiveForm do
    begin
      for I := 0 to ComponentCount-1 do
      begin
        if (Components[I] is TLabel) And Assigned(TLabel(Components[I]).FocusControl) then begin
           if TLabel(Components[I]).FocusControl=Screen.ActiveForm.ActiveControl then begin
               TLabel(Components[I]).Font.Color:=clRed;
               TLabel(Components[I]).Font.Style:= TLabel(Components[I]).Font.Style;
           end
           else begin
               TLabel(Components[I]).Font.Color:=clBlack;
               TLabel(Components[I]).Font.Style:= TLabel(Components[I]).Font.Style;
           end;
        end;
      end;
    end;
  end;
  if Assigned(OldOnActiveControlChange) then OldOnActiveControlChange(Sender);
end;

//---- Constructor e Destructor
procedure TflCustomForm.FormCreate(Sender: TObject);
begin
  OldOnActiveControlChange:=Screen.OnActiveControlChange;
  Screen.OnActiveControlChange:=NewOnActiveControlChange;

  OldOnHint := Application.OnHint;
  Application.OnHint := NewOnHint;
end;

procedure TflCustomForm.NewOnHint(Sender: TObject);
begin
  Application.ProcessMessages;
  StatusBar.Panels[1].Text := GetShortHint(Application.Hint);
end;

procedure TflCustomForm.FormDestroy(Sender: TObject);
begin
  Application.OnHint := OldOnHint;
  Screen.OnActiveControlChange:=OldOnActiveControlChange;
end;

end.

unit Assistente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, ComCtrls,contnrs;

type
  TfmAssistente = class(TForm)
    paTitulo: TPanel;
    paBotoes: TPanel;
    sbOk: TSpeedButton;
    sbCancelar: TSpeedButton;
    sbAnterior: TSpeedButton;
    sbProximo: TSpeedButton;
    pcPrincipal: TPageControl;
    procedure Atualiza;
    procedure FormCreate(Sender: TObject);
    procedure sbAnteriorClick(Sender: TObject);
    procedure sbProximoClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure Posiciona_Botoes(Assistente:TfmAssistente;pbOk,pbCancelar,pbAnterior,pbProximo:boolean);
  private
    { Private declarations }
  public
    class function Assistente(pbOk,pbCancelar,pbAnterior,pbProximo,pbShow:boolean):TfmAssistente;
    { Public declarations }
  end;

var
  fmAssistente: TfmAssistente;

implementation

{$R *.DFM}

class function TfmAssistente.Assistente(pbOk,pbCancelar,pbAnterior,pbProximo,pbShow:boolean):TfmAssistente;
var vAssistente:TfmAssistente;
begin
  vAssistente := create(application);
  vAssistente.Posiciona_Botoes(vAssistente,pbOk,pbCancelar,pbAnterior,pbProximo);
  if pbShow then
    vAssistente.showModal;
  Result:=vAssistente;
end;

procedure TfmAssistente.Posiciona_Botoes(Assistente:TfmAssistente;pbOk,pbCancelar,pbAnterior,pbProximo:boolean);
var viMargem,i :integer;
    vObjectList  : TObjectList;
begin
  viMargem:=paBotoes.Width - 5 ;
  vObjectList := TObjectList.Create;
  vObjectList.OwnsObjects:=false;

  Assistente.sbOk.Visible       := pbOk;
  Assistente.sbCancelar.Visible := pbCancelar;
  Assistente.sbAnterior.Visible := pbAnterior;
  Assistente.sbProximo.Visible  := pbProximo;

  if(pbOk      ) then vObjectList.Add(Assistente.sbOk      );
  if(pbCancelar) then vObjectList.Add(Assistente.sbCancelar);
  if(pbAnterior) then vObjectList.Add(Assistente.sbAnterior);
  if(pbProximo ) then vObjectList.Add(Assistente.sbProximo );

  for i:= 0 to (vObjectList.Count-1) do
  begin
    TSpeedButton(vObjectList.Items[i]).Rigth := viMargem;
    viMargem:=viMargem-TSpeedButton(vObjectList.Items[i]).width;
  end;
end;

procedure TfmAssistente.Atualiza;
begin
  sbAnterior.Enabled:= (pcPrincipal.ActivePageIndex >0);
  sbProximo.Enabled:= (pcPrincipal.ActivePageIndex +1 < pcPrincipal.PageCount);
  if(pcPrincipal.ActivePageIndex>=0)then
    paTitulo.Caption:='  '+pcPrincipal.ActivePage.Caption;
end;

procedure TfmAssistente.FormCreate(Sender: TObject);
begin
  if(pcPrincipal.ActivePageIndex>0)then
    pcPrincipal.ActivePageIndex:=0;
  Atualiza;
end;

procedure TfmAssistente.sbAnteriorClick(Sender: TObject);
var AllowChange:boolean;
begin
  AllowChange:=true;
  if (assigned(pcprincipal.OnChanging)) then
    pcprincipal.OnChanging(pcprincipal,AllowChange);

  if(AllowChange)then
  begin
    pcPrincipal.ActivePage:=pcPrincipal.FindNextPage(pcPrincipal.ActivePage,False,False);
    Atualiza;
    if (assigned(pcprincipal.OnChange)) then
      pcprincipal.OnChange(pcprincipal);
  end;
end;

procedure TfmAssistente.sbProximoClick(Sender: TObject);
var AllowChange:boolean;
begin
  AllowChange:=true;
  if (assigned(pcprincipal.OnChanging)) then
    pcprincipal.OnChanging(pcprincipal,AllowChange);

  if(AllowChange)then
  begin
    pcPrincipal.ActivePage:=pcPrincipal.FindNextPage(pcPrincipal.ActivePage,True,False);
    Atualiza;
    if (assigned(pcprincipal.OnChange)) then
      pcprincipal.OnChange(pcprincipal);
  end;
end;

procedure TfmAssistente.sbCancelarClick(Sender: TObject);
begin
  Close;
end;

end.

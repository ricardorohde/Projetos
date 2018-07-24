unit CadVirtual;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     DeclaraType, Extctrls, Contnrs, Stdctrls,dbtables,dbgrids,Variants, ADODB;

type
  { TCadStatus :
       csNormal     = chamada normal do menu
       csInclusao   = chamada somente para insercao
       csManutencao = chamada de um ou mais registros, mas não permite inclusao / exclusao
       csPesquisa   = equivalente ao normal, so que vindo de componentes de pesquisa
       csConsulta   = chamada somente para consulta (sem inclusão manutencao ou alteracao)}

  TCadStatus = (csNormal, csInclusao, csManutencao, csPesquisa, csConsulta );

  TTituloStilo = (tsCad, tschildPadrao);

  TFmCadVirtual = class(TForm)
  private
    { Private declarations }
  protected
    { Protected declarations }
    FParentForm : TForm;
    FStatus : TCadStatus;
    FRetorno : TStrings;
    FProcRetorno : TNotifyEvent;

    //Arrays que armazenam os parametros vindo de outra tela
    vaFiltro    : aFiltro;
    vaDefault   : aDefault;
    vaParametro : aParametro;
    vaTitulo    : aTitulo;

    procedure Prepara_Exibicao;virtual;abstract;
    Function ValorParametro(psNoParametro : String ) : Variant;overload;
    Function ValorParametro(psNoParametro : String; pvValor_Padrao : variant ) : Variant;overload;
    procedure CriaTitulo(pPanel:TPanel;pTituloStilo:TTituloStilo);
    procedure CriaTitulo_ChildPadrao(pPanel:TPanel);
    procedure CriaTitulo_Cad(pPanel:TPanel);
    procedure Filtrar(qy:TADOQuery);
    function Tem_Filtro:boolean;
    procedure Prepara_Grid(pdbGrid:TDBGrid);
    function Cria_Label(piTop,piLeft:integer;psCaption:string;pParent:TPanel;pCor:TColor;piSize:integer=8;pStyle:TFontStyles=[]):integer;
    procedure Cria_Edit(piTop,piLeft,piwidth:Integer;psValor:string;pParent:TPanel;pCor:TColor);
    function ValorDefault(psNoCampo:string;pvValor_Padrao : variant) : Variant;
    procedure RefreshForm;virtual;
  public
    { Public declarations }
    class function CriaInstancia(Owner : TComponent) : TFmCadVirtual;virtual;
    procedure ExibeForm( pParentForm : TForm = nil; pStatus : TCadStatus = csNormal;
                         pRetorno : Tstrings = nil; pProcRetorno : TNotifyEvent = nil);
    function ExibeForm_Modal( pStatus : TCadStatus = csNormal; pRetorno : Tstrings = nil ):TModalResult;

    procedure doClose(var Action: TCloseAction); override;

    procedure AddFiltro(psFiltro : String );overload;
    procedure AddFiltro(prFiltro : TReg_Filtro );overload;
    procedure AddFiltro(psFiltro : String; psParametro : String ; pValor : Variant);overload;

    procedure AddTitulo(psDescricao: String);overload;//virtual;
    procedure AddTitulo(psDescricao: String; pValor : Variant;pCampos:String='');overload;//virtual;
    procedure AddTitulo( psDescricao : String; pValor  : Variant;
                         psDescricao2: String; pValor2 : Variant;pCampos:String='');overload;//virtual;

    procedure AddParametro(psNome: String;pValor : Variant);virtual;
    procedure AddDefault(psCampo : String;pValor : Variant; pbAlteravel : boolean = false );virtual;

    procedure PassaFiltro(paFiltro: aFiltro);
    procedure PassaTitulo(paTitulo: aTitulo);
    procedure PassaParametro(paParametro: aParametro);
    procedure PassaDefault(paDefault: aDefault);

  published
    { Published declarations }
    property ParentForm : TForm read FParentForm write FParentForm ;
    property Retorno : TStrings read FRetorno write FRetorno;
    property Status : TCadStatus read FStatus write FStatus;
  end;

  TClassFmCadVirtual = class of TFmCadVirtual;

implementation
uses uTool;

procedure TFmCadVirtual.doClose(var Action: TCloseAction);
begin
   inherited;
   if Assigned(ParentForm) then
   begin
      ParentForm.enabled := true;
      if( ParentForm is TFmCadVirtual)then
        TFmCadVirtual(ParentForm).RefreshForm;
   end;
   if Assigned(FProcRetorno) and ( ModalResult = mrOk ) then
   begin
      if Assigned(ParentForm) then
         ParentForm.show;
      FProcRetorno(self);
   end;
end;

procedure TFmCadVirtual.RefreshForm;
begin
//
end;

class function TFmCadVirtual.CriaInstancia(Owner : TComponent) : TFmCadVirtual;
begin
   result := create(Owner);
end;

procedure TFmCadVirtual.ExibeForm( pParentForm : TForm = nil; pStatus : TCadStatus = csNormal;
                                   pRetorno : Tstrings = nil; pProcRetorno : TNotifyEvent = nil);
begin
   Status := pStatus;
   if Assigned( pRetorno ) then
   begin
     Retorno := pRetorno;
     Retorno.clear;
   end;
   FProcRetorno := pProcRetorno;
   ParentForm := pParentForm;
   // Desabilita o Form Chamador
   if Assigned(ParentForm) and ((ParentForm <> Application.MainForm) or (self.FormStyle <> fsMDIChild)) then
   begin
     ParentForm.enabled := false;
     self.top := ParentForm.Top + (ParentForm.Height - ParentForm.ClientHeight);
   end;
   modalResult := mrNone;

   Prepara_Exibicao;
   //Pode-se alterar o modalresult da tela no prepara_exibicao
   //para que a tela não seja exibida
   if modalResult = mrNone then
   begin
     //pode-se chamar uma outra tela no prepara_exibicao
     //não sendo necessario chamar o metodo "show" desta tela
     if self.enabled then
       self.Show;
   end
   else
     self.close;
end;

function TFmCadVirtual.ExibeForm_Modal( pStatus : TCadStatus = csNormal; pRetorno : Tstrings = nil ):TModalResult;
begin
   Status := pStatus;
   self.FormStyle:=fsNormal;
   self.Visible:=false;

   if Assigned( pRetorno ) then
   begin
     Retorno := pRetorno;
     Retorno.clear;
   end;

   modalResult := mrNone;
   Prepara_Exibicao;

   //Pode-se alterar o modalresult da tela no prepara_exibicao
   //para que a tela não seja exibida
   if modalResult = mrNone then
     self.ShowModal
   else
     self.close;
   result:=modalResult;
end;

procedure TFmCadVirtual.AddTitulo(psDescricao: String);
begin
  setlength(vaTitulo,length(vaTitulo)+1);
  vaTitulo[high(vaTitulo)].Descricao := psDescricao;
  vaTitulo[high(vaTitulo)].NrColunas := 0;
end;

procedure TFmCadVirtual.AddTitulo(psDescricao: String; pValor : Variant;pCampos:String='');
begin
   setlength(vaTitulo,length(vaTitulo)+1);
   vaTitulo[high(vaTitulo)].Descricao := psDescricao;
   vaTitulo[high(vaTitulo)].Valor     := pValor;
   vaTitulo[high(vaTitulo)].Campos    := pCampos;
   vaTitulo[high(vaTitulo)].NrColunas := 1;
end;

procedure TFmCadVirtual.AddTitulo( psDescricao : String; pValor  : Variant;
                                   psDescricao2: String; pValor2 : Variant;
                                   pCampos:String='');
begin
   setlength(vaTitulo,length(vaTitulo)+1);
   vaTitulo[high(vaTitulo)].Descricao  := psDescricao;
   vaTitulo[high(vaTitulo)].Valor      := pValor;
   vaTitulo[high(vaTitulo)].Descricao2 := psDescricao2;
   vaTitulo[high(vaTitulo)].Valor2     := pValor2;
   vaTitulo[high(vaTitulo)].Campos     := pCampos;
   vaTitulo[high(vaTitulo)].NrColunas  := 2;
end;

procedure TFmCadVirtual.PassaTitulo(paTitulo: aTitulo);
var i:integer;
begin
  for i:=low(paTitulo) to high (paTitulo)do
  begin
    if(paTitulo[i].NrColunas=1)then
      AddTitulo(paTitulo[i].Descricao,paTitulo[i].Valor)
    else
      AddTitulo(paTitulo[i].Descricao,paTitulo[i].Valor,paTitulo[i].Descricao2,paTitulo[i].Valor2);
  end;
end;

procedure TFmCadVirtual.AddParametro(psNome: String;pValor : Variant);
begin
   setlength(vaParametro,length(vaParametro)+1);
   vaParametro[high(vaParametro)].Nome  := TRIM(psNome);
   vaParametro[high(vaParametro)].Valor := pValor;
end;

procedure TFmCadVirtual.PassaParametro(paParametro: aParametro);
var i:integer;
begin
  for i:=low(paParametro) to high (paParametro)do
    AddParametro(paParametro[i].Nome,paParametro[i].Valor);
end;

Function TFmCadVirtual.ValorParametro(psNoParametro : String; pvValor_Padrao : variant ) : Variant;
var vbEncontrado : boolean;
    i : integer;
begin
  vbEncontrado := false;
  i:=low(vaParametro);
  while not vbEncontrado and ( i <= high(vaParametro))do
  begin
    if (Uppercase(vaParametro[i].Nome)= TRIM(Uppercase(psNoParametro)))then
    begin
       vbEncontrado := true;
       ValorParametro := vaParametro[i].Valor;
    end
    else
       inc(i);
  end;
  if not vbEncontrado then
     result := pvValor_Padrao
end;

Function TFmCadVirtual.ValorParametro(psNoParametro : String ) : variant;
var vbEncontrado : boolean;
    i : integer;
begin
  vbEncontrado := false;
  i:=low(vaParametro);
  while not vbEncontrado and ( i <= high(vaParametro) ) do
  begin
    if (Uppercase(vaParametro[i].Nome)= TRIM(Uppercase(psNoParametro)))then
    begin
       vbEncontrado := true;
       ValorParametro := vaParametro[i].Valor;
    end
    else
       inc(i);
  end;
  if not vbEncontrado then
     raise eParametro_Invalido.Create('Parametro "'+psNoParametro+'" não encontrado ');
end;

procedure TFmCadVirtual.AddDefault(psCampo : String;pValor : Variant; pbAlteravel : boolean = false );
begin
   setlength(vaDefault,length(vaDefault)+1);
   vaDefault[high(vaDefault)].NoCampo := TRIM(psCampo);
   vaDefault[high(vaDefault)].Valor := pValor;
   vaDefault[high(vaDefault)].Alteravel := pbAlteravel;
end;

function TFmCadVirtual.ValorDefault(psNoCampo:string;pvValor_Padrao : variant) : Variant;
var vbEncontrado :boolean;
    i:integer;
begin
  vbEncontrado:=false;
  i := low(vaDefault);
  while (not vbEncontrado) and (i <= high(vaDefault))  do
  begin
    if (vaDefault[i].NoCampo=psNoCampo) then
    begin
      vbEncontrado := true;
      result := vaDefault[i].Valor;
    end
    else
      inc(i);
  end;

  if not vbEncontrado then
     result := pvValor_Padrao
end;

procedure TFmCadVirtual.PassaDefault(paDefault: aDefault);
var i:integer;
begin
  for i:=low(paDefault) to high (paDefault)do
    AddDefault(paDefault[i].NoCampo,paDefault[i].Valor,paDefault[i].Alteravel);
end;

procedure TFmCadVirtual.AddFiltro(psFiltro : String);
begin
   AddFiltro(psFiltro,'',null);
end;

procedure TFmCadVirtual.AddFiltro(prFiltro : TReg_Filtro );
begin
   AddFiltro(prFiltro.Filtro,prFiltro.Parametro, prFiltro.Valor);
end;

procedure TFmCadVirtual.AddFiltro(psFiltro : String; psParametro : String; pValor : Variant);
begin
   if trim(psFiltro) <> '' then
   begin
      setlength(vaFiltro,length(vaFiltro)+1);
      vaFiltro[high(vaFiltro)].Filtro := psFiltro;
      vaFiltro[high(vaFiltro)].Parametro := psParametro;
      vaFiltro[high(vaFiltro)].Valor := pValor;
   end;
end;

procedure TFmCadVirtual.PassaFiltro(paFiltro: aFiltro);
var i:integer;
begin
  for i:=low(paFiltro) to high (paFiltro)do
    AddFiltro(paFiltro[i].Filtro,paFiltro[i].Parametro,paFiltro[i].Valor);
end;

procedure TFmCadVirtual.Filtrar(qy:TADOQuery);
var i:integer;
begin
  for i := low(vaFiltro) to high(vaFiltro) do
    insertFilter(qy,vaFiltro[i]);
end;

function TFmCadVirtual.Tem_Filtro:boolean;
begin
  result:=length(vaFiltro)>0;
end;

procedure TFmCadVirtual.Prepara_Grid(pdbGrid:TDBGrid);
var i,j,k:integer;
    vaCampos:aString;
begin
  vaCampos:= nil;
  for i := low(vaTitulo) to ( high(vaTitulo) ) do
  begin
    vaCampos:= StrtoArray(vaTitulo[i].Campos,';');

    for j := 0 to pdbGrid.Columns.Count -1 do
    begin

      for k:=low(vaCampos)to( high(vaCampos) ) do
      begin
        if(( vaCampos[k]<>'') and (vaCampos[k]=pdbGrid.Columns[j].FieldName) )then
          pdbGrid.Columns[j].Visible:=False;

      end;
    end;
  end;
end;

procedure TFmCadVirtual.CriaTitulo(pPanel:TPanel;pTituloStilo:TTituloStilo);
begin
  if(pTituloStilo = tsCad)then
    CriaTitulo_Cad(pPanel)
  else
  if(pTituloStilo = tschildPadrao )then
    CriaTitulo_ChildPadrao(pPanel)
end;

procedure TFmCadVirtual.CriaTitulo_Cad(pPanel:TPanel);
var i : integer;
    viTam_Label      : integer;
    viTam_Label_Col1 : integer;
    viTam_Label_Col2 : integer;
    viLargura_Edit   : integer;
    viLeft_Edit      : integer;
    viTop : integer;
    viIni_Col1 : integer;
    viIni_Col2 : integer;
const ciEspaco            = 2;//espaço entre os edits
      ciAltura_Edit       = 21;
      ciMargem_lateral    = 10;
      ciMargem_Superior   = 2;
      ciMargem_Inferior   = 2;
begin
  if length(vaTitulo) > 0 then
  begin
    viTam_Label_Col1 :=0;
    viTam_Label_Col2 :=0;

    pPanel.Height := ( ciMargem_Superior + ciMargem_Inferior ) +
                     ( ciEspaco * (length(vaTitulo)-1))+ //espaços entre os edits
                     ( ciAltura_Edit * length(vaTitulo));

    viIni_Col1  := pPanel.Left + ciMargem_lateral;
    viIni_Col2  := trunc((pPanel.Width+ciMargem_lateral)/2);

    self.height := self.height + pPanel.Height;

    viTop := ciMargem_Superior+4;

    //crio todos os labels e gardo o tamanho do maior (para alinhar os edites)
    for i := low(vaTitulo) to ( high(vaTitulo) ) do
    begin
      if(vaTitulo[i].NrColunas=0)then //nrColunas = 0 é só o Label
        Cria_Label(viTop,viIni_Col1,vaTitulo[i].Descricao,pPanel,clNavy,10,[fsBold])
      else
      begin
        //cria label da coluna1
        viTam_Label:=Cria_Label(viTop,viIni_Col1,vaTitulo[i].Descricao,pPanel,clNavy);
        if(viTam_Label >viTam_Label_Col1)then
          viTam_Label_Col1 :=viTam_Label;

        //cria label da coluna2
        if(vaTitulo[i].NrColunas=2)then
        begin
          viTam_Label:=Cria_Label(viTop,viIni_Col2,vaTitulo[i].Descricao2,pPanel,clNavy);
          if(viTam_Label >viTam_Label_Col2)then
            viTam_Label_Col2 :=viTam_Label;
        end;
        viTop := viTop + ciAltura_Edit + ciEspaco;
      end;
    end;

    viTop := ciMargem_Superior;
    for i := low(vaTitulo) to ( high(vaTitulo) ) do
    begin
      if(vaTitulo[i].NrColunas=1)then
      begin
        viLeft_Edit      :=viIni_Col1 + viTam_Label_Col1 + ciMargem_lateral;
        viLargura_Edit   :=pPanel.Width - ( viLeft_Edit+ ciMargem_lateral);
        Cria_Edit(viTop,viLeft_Edit,viLargura_Edit,vaTitulo[i].Valor,pPanel,clNavy);
      end
      else
      if(vaTitulo[i].NrColunas=2)then
      begin
        viLeft_Edit      :=viIni_Col1 + viTam_Label_Col1 + ciMargem_lateral;
        viLargura_Edit   :=(pPanel.Width - ( viLeft_Edit+ ciMargem_lateral))-viIni_Col2;
        Cria_Edit(viTop,viLeft_Edit,viLargura_Edit,vaTitulo[i].Valor,pPanel,clNavy);

        viLeft_Edit      :=viIni_Col2 + viTam_Label_Col2 + ciMargem_lateral;
        viLargura_Edit   :=pPanel.Width - ( viLeft_Edit+ ciMargem_lateral);
        Cria_Edit(viTop,viLeft_Edit,viLargura_Edit,vaTitulo[i].Valor2,pPanel,clNavy);
      end;

      viTop := viTop + ciAltura_Edit + ciEspaco;
    end;
  end;
end;

procedure TFmCadVirtual.CriaTitulo_ChildPadrao(pPanel:TPanel);
var i : integer;
    viLargura_Edit   : integer;
    viTop_label : integer;
    viTop_Edit  : integer;
    viIni_Col1  : integer;
    viIni_Col2  : integer;

const ciEspaco            = 2;//espaço entre os componentes
      ciAltura_Edit       = 21;
      ciAltura_Label      = 13;
      ciMargem            = 10;
begin
  if length(vaTitulo) > 0 then
  begin
    pPanel.BevelInner := bvLowered;
    pPanel.BevelOuter := bvRaised;
    pPanel.Height := ( ciMargem * 2) +
                     ( ciEspaco * (length(vaTitulo)-1)* 2 )+ //espaços entre os componentes
                     ( ciAltura_Edit * length(vaTitulo))+
                     ( ciAltura_Label * length(vaTitulo));

    self.height := self.height + pPanel.Height;

    viIni_Col1  := pPanel.Left + ciMargem;
    viIni_Col2  := trunc((pPanel.Width+ciMargem)/2);

    viTop_Label := ciMargem;
    viTop_Edit  := ciMargem + ciAltura_Label + ciEspaco;

    //crio todos os labels
    for i := low(vaTitulo) to ( high(vaTitulo) ) do
    begin
      if(vaTitulo[i].NrColunas=0)then //nrColunas = 0 é só o Label
        raise exception.create('Não implementado o "Titulo sem colunas" para Child Padrao')
      else
      begin
        //cria label da coluna1
        Cria_Label(viTop_label,viIni_Col1,vaTitulo[i].Descricao,pPanel,clBlack);

         viLargura_Edit   := pPanel.Width - ( viIni_Col1 + ciMargem);

         if(vaTitulo[i].NrColunas=2)then
           viLargura_Edit   :=(viLargura_Edit+ ciMargem) - viIni_Col2;

         //cria  Edit da coluna1
         Cria_Edit(viTop_Edit,viIni_Col1,viLargura_Edit,vaTitulo[i].Valor,pPanel,clBlack);

        //cria label e edit da coluna2
        if(vaTitulo[i].NrColunas=2)then
        begin
          Cria_Label(viTop_label,viIni_Col2,vaTitulo[i].Descricao2,pPanel,clBlack);
          Cria_Edit(viTop_Edit,viIni_Col2,viLargura_Edit,vaTitulo[i].Valor2,pPanel,clBlack);
        end;

        viTop_label := viTop_label + ciAltura_Label + ciEspaco + ciAltura_Edit + ciEspaco;
        viTop_Edit  := viTop_Edit  + ciAltura_Label + ciEspaco + ciAltura_Edit + ciEspaco;
      end;
    end;
  end;
end;

function TFmCadVirtual.Cria_Label(piTop,piLeft:integer;psCaption:string;pParent:TPanel;
                                  pCor:TColor;piSize:integer=8;pStyle:TFontStyles=[]):integer;
begin
  with TLabel.Create(self) do
  begin
    top        := piTop;
    left       := piLeft;
    caption    := psCaption;
    parent     := pParent;
    font.color := pCor;
    font.Size  := piSize;
    font.style := font.style+pStyle;
    AutoSize   := true;
    result     := width;
  end;
end;

procedure TFmCadVirtual.Cria_Edit(piTop,piLeft,piwidth:Integer;psValor:string;pParent:TPanel;pCor:TColor);
begin
  with TEdit.Create(self) do
  begin
    top        := piTop;
    left       := piLeft;
    width      := piwidth;
    text       := '  '+psValor;
    parent     := pParent;
    readOnly   := true;
    TabStop    := false;
    color      := clbtnFace;
    font.color := pCor;
  end;
end;

{
initialization
   RegisterClass(TfmCadVirtual);
}
end.

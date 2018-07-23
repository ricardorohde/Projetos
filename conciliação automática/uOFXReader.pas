unit uOFXReader;

interface

uses classes, SysUtils, Controls;

type
  TOFXItem = class
    MovType : string;
    MovDate : TDate;
    Value : double;
    ID : string;
    Document : string;
    Desc : string;
  end;

  TYMOFXReader = class(TComponent)
  public
    BancoID : integer;
    ContaID : string;
    TipoConta : string;
    SaldoInicial : double;
    SaldoFinal : double;
    constructor Create( AOwner: TComponent ); override;
    destructor Destroy; override;
    function Process: boolean;
    function Get(iIndex: integer): TOFXItem;
    function Count: integer;
  private
    FOFXFile : string;
    FListItems : TList;
    procedure Clear;
    procedure Delete( iIndex: integer );
    function Add: TOFXItem;
    function PrepareFloat( sString : string ) : string;
    function InfLine ( sLine : string ): string;
    function FindString ( sSubString, sString : string ): boolean;
    function ReplaceString(sString: string; sOld: string; sNew: string; bInsensitive : boolean = true): string;
  protected

  public
    property OFXFile: string read FOFXFile write FOFXFile;
  end;

implementation

{ TYMOFXReader }

function TYMOFXReader.Add: TOFXItem;
var
  oItem : TOFXItem;
begin
  oItem := TOFXItem.Create;
  FListItems.Add(oItem);
  Result := oItem;
end;

procedure TYMOFXReader.Clear;
//var
//  i: integer;
//  oPointer : Pointer;
begin
  while FListItems.Count > 0 do
    Delete(0);
  FListItems.Clear;
end;

function TYMOFXReader.Count: integer;
begin
  Result := FListItems.Count;
end;

constructor TYMOFXReader.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FListItems := TList.Create;
end;

procedure TYMOFXReader.Delete(iIndex: integer);
begin
  TOFXItem(FListItems.Items[iIndex]).Free;
  FListItems.Delete( iIndex );
end;

destructor TYMOFXReader.Destroy;
begin
  FListItems.Free;
  inherited Destroy;
end;

function TYMOFXReader.FindString(sSubString, sString: string): boolean;
begin
  Result := Pos(UpperCase(sSubString), UpperCase(sString)) > 0;
end;

function TYMOFXReader.Get(iIndex: integer): TOFXItem;
begin
  Result := TOFXItem(FListItems.Items[iIndex]);
end;

function TYMOFXReader.InfLine(sLine: string): string;
var
  iTemp : integer;
begin
  Result := '';
  sLine := Trim(sLine);
  if FindString('>', sLine) then
  begin
    sLine := Trim(sLine);
    iTemp := Pos('>', sLine);
    Result := copy(sLine, iTemp+1, Length(sLine)-iTemp+1);
  end;
end;

function TYMOFXReader.PrepareFloat(sString: string): string;
begin
  Result := sString;
  Result := ReplaceString(Result, '.', DecimalSeparator);
  Result := ReplaceString(Result, ',', DecimalSeparator);
end;

function TYMOFXReader.Process: boolean;
var
  loFile : TStringList;
  i : integer;
  lbOFX : boolean;
  loItem : TOFXItem;
  lsLine : string;
  ldBalance : double;
begin
  Result := false;
  Clear;
  lbOFX := false;
  if not FileExists(FOFXFile) then
    exit;
  loFile := TStringList.Create;
  loFile.LoadFromFile(FOFXFile);
  ldBalance := 0;
  i := 0;
  while i < loFile.Count do
  begin
    lsLine := loFile.Strings[i];
    if FindString('<OFX>', lsLine) then
      lbOFX := true;
    if lbOFX then
    begin
      // -----------------------------------------------------------------------
      // BankID
      if FindString('<BANKID>', lsLine) then
        BancoID := StrToIntDef(InfLine(lsLine), 0);
      // -----------------------------------------------------------------------
      // AccountID
      if FindString('<ACCTID>', lsLine) then
        ContaID := InfLine(lsLine);
      // -----------------------------------------------------------------------
      // AccountType
      if FindString('<ACCTTYPE>', lsLine) then
        TipoConta := InfLine(lsLine);
      // -----------------------------------------------------------------------
      // FinalBalance
      if FindString('<LEDGER>', lsLine) then
        SaldoFinal := StrToFloat(PrepareFloat(InfLine(lsLine)));

      if FindString('<LEDGERBAL>', lsLine) then
      begin
        Inc(i);
        lsLine := loFile.Strings[i];
        if FindString('<BALAMT>', lsLine) then
          SaldoFinal := StrToFloat(PrepareFloat(InfLine(lsLine)));
      end;
      // -----------------------------------------------------------------------
      // Moviment
      if FindString('<STMTTRN>', lsLine) then
      begin
        loItem := Add;
        Inc(i);
        lsLine := loFile.Strings[i];
        if FindString('<TRNTYPE>', lsLine) then
          loItem.MovType := InfLine(lsLine);
        Inc(i);
        lsLine := loFile.Strings[i];
        if FindString('<DTPOSTED>', lsLine) then
          loItem.MovDate := EncodeDate(StrToIntDef(copy(InfLine(lsLine),1,4), 0),
                                      StrToIntDef(copy(InfLine(lsLine),5,2), 0),
                                      StrToIntDef(copy(InfLine(lsLine),7,2), 0));
        Inc(i);
        lsLine := loFile.Strings[i];
        if FindString('<TRNAMT>', lsLine) then
        begin
          loItem.Value := StrToFloat(PrepareFloat(InfLine(lsLine)));
          ldBalance := ldBalance - loItem.Value;
        end;
        Inc(i);
        lsLine := loFile.Strings[i];
        if FindString('<FITID>', lsLine) then
          loItem.ID := InfLine(lsLine);
        Inc(i);
        lsLine := loFile.Strings[i];

        if FindString('<CHKNUM>', lsLine) or FindString('<CHECKNUM>', lsLine) then
          loItem.Document := InfLine(lsLine);
        Inc(i);
        lsLine := loFile.Strings[i];

        if FindString('<MEMO>', lsLine) then
          loItem.Desc := InfLine(lsLine);
//        end;
      end;
      // -----------------------------------------------------------------------
    end;
    Inc(i);
  end;
  SaldoInicial := SaldoFinal + ldBalance;
  Result := lbOFX;
end;

function TYMOFXReader.ReplaceString(sString, sOld, sNew: string;
  bInsensitive: boolean): string;
var
   liPosition: integer ;
   lsTempNew: string ;
begin
   liPosition := 1;
   lsTempNew := '';
   while (liPosition > 0) do
   begin
      if bInsensitive then
        liPosition := AnsiPos(UpperCase(sOld),UpperCase(sString))
      else
        liPosition := AnsiPos(sOld,sString);
      if (liPosition > 0) then
      begin
         lsTempNew := lsTempNew + copy(sString, 1, liPosition - 1) + sNew;
         sString := copy(sString, liPosition + Length(sOld), Length(sString) );
      end;
   end;
   lsTempNew := lsTempNew + sString;
   Result := (lsTempNew);
end;

end.

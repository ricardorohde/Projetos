unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ComCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    pgPrincipal: TPageControl;
    pgDimimui: TTabSheet;
    pgConvert: TTabSheet;
    btnConverter: TButton;
    edtHora: TMaskEdit;
    rbHoraToDouble: TRadioButton;
    rbDoubleToHora: TRadioButton;
    edtdouble: TEdit;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    btnConverterMinHora: TButton;
    btnHoraMin: TButton;
    edtHoras: TMaskEdit;
    edtMinutos: TEdit;
    TabSheet3: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    edtHorasoma1: TMaskEdit;
    edtHorasoma2: TMaskEdit;
    btnCalcularsoma: TButton;
    pnlResultado: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Hora1: TLabel;
    Label1: TLabel;
    edtHora1: TMaskEdit;
    edtHora2: TMaskEdit;
    btnCalcular: TButton;
    btnCalcularDouble: TButton;
    edtDouble1: TEdit;
    edtDouble2: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    procedure btnCalcularClick(Sender: TObject);
    procedure rbHoraToDoubleClick(Sender: TObject);
    procedure rbDoubleToHoraClick(Sender: TObject);
    procedure btnConverterClick(Sender: TObject);
    procedure btnConverterMinHoraClick(Sender: TObject);
    procedure btnHoraMinClick(Sender: TObject);
    procedure btnCalcularsomaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtDouble1KeyPress(Sender: TObject; var Key: Char);
    procedure btnCalcularDoubleClick(Sender: TObject);
  private
    { Private declarations }
    function MinutosEmHoras(Minutos: Integer): TDateTime;
    Function HoraParaMin(Hora: String): Integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCalcularClick(Sender: TObject);
var lcHora1,
    lcHora2,
    lcResultado : TTime;
begin
  lcHora1     := StrToTime(edtHora1.Text);
  lcHora2     := StrToTime(edtHora2.Text);
  lcResultado := lcHora1 - lcHora2;

  pnlResultado.Caption := 'Resultado: ' + FormatDateTime('HH:MM:SS',lcResultado);
  ShowMessage('Resultado: ' + FormatDateTime('HH:MM:SS',lcResultado));  
end;

procedure TForm1.rbHoraToDoubleClick(Sender: TObject);
begin
  edtHora.Visible   := rbHoraToDouble.Checked;
  edtdouble.Visible := not rbHoraToDouble.Checked;
end;

procedure TForm1.rbDoubleToHoraClick(Sender: TObject);
begin
  edtHora.Visible   := not rbDoubleToHora.Checked;
  edtdouble.Visible := rbDoubleToHora.Checked;
end;

procedure TForm1.btnConverterClick(Sender: TObject);
var lAux : TDateTime;
begin
  if rbDoubleToHora.Checked then
    begin
      lAux := StrToFloat(edtdouble.Text);
      if (lAux >= 1) then
        begin
          pnlResultado.Caption := 'Resultado: ' + FormatDateTime('DD/MM/YYYY HH:MM:ZZ',lAux);
          ShowMessage('Resultado: '  + FormatDateTime('DD/MM/YYYY HH:MM:ZZZ',lAux));
        end
      else
        begin
          pnlResultado.Caption := 'Resultado: ' + FormatDateTime('HH:MM:zz',lAux);
          ShowMessage('Resultado: ' + FormatDateTime('HH:MM:zz',lAux));
        end;
    end
  else
    begin
      pnlResultado.Caption := 'Resultado: ' + FormatFloat('#######00.00000000000',StrToDateTime(edtHora.Text));
      ShowMessage('Resultado: ' + FormatFloat('#######00.00000000000',StrToDateTime(edtHora.Text)));
    end;
end;

procedure TForm1.btnConverterMinHoraClick(Sender: TObject);
begin
  pnlResultado.Caption := 'Resultado: ' + FormatDatetime('hh:nn',MinutosEmHoras(StrToInt(edtMinutos.text)));
  ShowMessage('Resultado: '  + FormatDatetime('hh:nn',MinutosEmHoras(StrToInt(edtMinutos.text))));
end;


{-------------------------------------------------------------------
*  Objetivo : Transformar minutos em Horas
*  Autor    : edson.dsn.pack
*  Data     : 28/04/2011
-------------------------------------------------------------------}
function TForm1.MinutosEmHoras(Minutos: Integer): TDateTime;
var
  HoraDecimal, HH, MM: String;
begin
  result := 0;
  if (Minutos > 0) then
  begin
    if (Minutos > 1440) then
      Minutos := Minutos - 1440;

    HoraDecimal := FormatFloat( '00.00', Minutos / 60 );
    HH := Copy( HoraDecimal, 1 , 2 );

    if Copy( HoraDecimal, 4, 5 )[1] = '0' then
      MM := '0' + IntToStr( Round( ( StrToInt( Copy( HoraDecimal, 4, 5 ) ) * 60 ) /100 ) )
    else
      MM := IntToStr( Round( ( StrToInt( Copy( HoraDecimal, 4, 5 ) ) * 60 ) /100 ) );

    Result := StrToTime(HH+ ':' + MM);
  end;
end;

{-------------------------------------------------------------------
*  Objetivo : Transformar Horas em Minutos
*  Autor    : edson.dsn.pack
*  Data     : 28/04/2011
-------------------------------------------------------------------}
Function TForm1.HoraParaMin(Hora: String): Integer;
begin
  Result := 0;
  if not (Hora = '') then
    Result := (StrToInt(Copy(Hora,1,2))*60) + StrToInt(Copy(Hora,4,2));
end;

procedure TForm1.btnHoraMinClick(Sender: TObject);
//var data : TDateTime;
begin
  //data := StrToDate(edtHoras.text);
  pnlResultado.Caption := 'Resultado: ' + IntToStr(HoraParaMin(edtHoras.text));
  ShowMessage('Resultado: ' + IntToStr(HoraParaMin(edtHoras.text)));
end;

procedure TForm1.btnCalcularsomaClick(Sender: TObject);
var lcHora1,
    lcHora2,
    lcResultado : Integer;
begin
  lcHora1     := HoraParaMin(edtHorasoma1.Text);
  lcHora2     := HoraParaMin(edtHorasoma2.Text);
  lcResultado := lcHora1 + lcHora2;
  pnlResultado.Caption := 'Resultado: ' + FormatDateTime('HH:MM:SS',MinutosEmHoras(lcResultado));
  ShowMessage('Resultado: '  + FormatDateTime('HH:MM:SS',MinutosEmHoras(lcResultado)));
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  pgPrincipal.ActivePageIndex := 0;
end;

procedure TForm1.edtDouble1KeyPress(Sender: TObject; var Key: Char);
begin
  //OnlyNumber
  //if not (Key in['0'..'9',Chr(8)]) then Key:= #0;
end;

procedure TForm1.btnCalcularDoubleClick(Sender: TObject);
var lcHora1,
    lcHora2,
    lcResultado : Double;
begin
  lcHora1     := StrToFloat(edtdouble1.Text);
  lcHora2     := StrToFloat(edtdouble2.Text);
  lcResultado := lcHora1 - lcHora2;
  if (lcResultado < 1)then
    begin
      pnlResultado.Caption := 'Resultado: ' + FormatDateTime('HH:MM:SS',lcResultado);
      ShowMessage('Resultado: '  + FormatDateTime('HH:MM:SS',lcResultado));
    end
  else
    begin
      pnlResultado.Caption := 'Resultado: ' + FormatDateTime('DD/MM/YYYY HH:MM:SS',lcResultado);
      ShowMessage('Resultado: ' + FormatDateTime('DD/MM/YYYY HH:MM:SS',lcResultado));
    end;
end;

end.

unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm3 = class(TForm)
    edtNome: TEdit;
    edtNota1: TEdit;
    edtNota2: TEdit;
    edtNota3: TEdit;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnCarregar: TBitBtn;
    edtPesquisaNome: TEdit;
    edtPesquisarArquivo: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    btnPesquisar: TBitBtn;
    dlgOpen: TOpenDialog;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCarregarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

 uses
   Unit1;

procedure TForm3.btnCancelarClick(Sender: TObject);
begin
  Self.Close();
end;

procedure TForm3.btnCarregarClick(Sender: TObject);
var
  linha,nome,teste,checarExt                 : string;
  i                                          : integer;
  arq                                        : TextFile;
  nota1,nota2,nota3                          : Real;
begin
//  teste := dlgOpen.FileName;
  teste := edtPesquisarArquivo.Text;
  AssignFile(arq, teste);
  if(not FileExists(teste) or (teste = '') ) then
    ShowMessage('Arquivo não encontrado, verifique o diretório')
  else
    try
//      lst1.Items.LoadFromFile(edt1.Text);
      checarExt := Copy(teste,Pos('.',teste),4);
      if(not AnsiSameText(checarExt,'.txt')) then
        begin
          ShowMessage('Somente arquivos (.txt) e conforme Layout');
          Exit;
        end
      else
      Reset(arq);
      while(not eof(arq)) do                    // leitura do txt com esse layout para notas
        begin
          Readln(arq,linha);

          i    := Pos('|',linha);
          nome := Copy(linha,1,i-1);
          if AnsiSameText(nome,edtPesquisaNome.Text) then
            begin

              i    := Pos('|',linha);
              nome := Copy(linha,1,i-1);
              delete(linha,1,i); // deleta valor de linha, começando de 1 até i

              i     := Pos('|',linha);
              nota1 := StrToFloat(Copy(linha,1,i-1));
              delete(linha,1,i);

              i     := Pos('|',linha);
              nota2 := StrToFloat(Copy(linha,1,i-1));
              delete(linha,1,i);

              i     := Pos('|',linha);
              nota3 := StrToFloat(Copy(linha,1,i-1));

            //  media := (nota1 + nota2 + nota3) / 3;
            //  MediaFormatada := FormatFloat(',.00',media);

              edtNome.Text  := nome;
              edtNota1.Text := FloatToStr(nota1);
              edtNota2.Text := FloatToStr(nota2);
              edtNota3.Text := FloatToStr(nota3);
            end;
        end;
    except
      begin
        ShowMessage('Não foi possível abrir o arquivo, verificar o caminho');
      end;
      CloseFile(arq);
      Append(arq);
    end;
end;

procedure TForm3.btnSalvarClick(Sender: TObject);
var
  arquivo : TextFile;                                   // só está salvando e não alterando
begin
  try
    if ((edtNome.Text <> '') or (edtNota1.Text <> '') or (edtNota2.Text <> '') or (edtNota3.Text <> '')) then
      begin
        AssignFile(arquivo,edtPesquisarArquivo.Text);
        Append(arquivo);
        Writeln(arquivo,edtNome.Text, '|' ,edtNota1.Text, '|' ,edtNota2.Text, '|' ,edtNota3.Text, '|');
        edtPesquisaNome.Clear();
        edtNome.Clear();
        edtNota1.Clear();
        edtNota2.Clear();
        edtNota3.Clear();
      end
    else
      ShowMessage('Preencher todos os campos');
  finally
    CloseFile(arquivo);
//    Append(arquivo);
  end;
end;

procedure TForm3.btnPesquisarClick(Sender: TObject);
var
  diretorio : string;
begin
  if dlgOpen.Execute then
    begin
//      dlgOpen.Filter := 'Text files (*.txt)|*.txt';
      diretorio                := dlgOpen.FileName;
      edtPesquisarArquivo.Text := diretorio;
    end;

end;

end.



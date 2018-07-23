unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, Unit2, Unit3;

type
  TForm1 = class(TForm)
    pb1: TProgressBar;
    btnDirParaEsqAll: TButton;
    lst1: TListBox;
    btnAdicionar: TButton;
    edt1: TEdit;
    lst2: TListBox;
    btnApagar: TButton;
    btnCarregar: TButton;
    dlgOpen: TOpenDialog;
    btnPesquisar: TBitBtn;
    btnDirParaEsqSimples: TButton;
    btnEsqParaDirSimples: TButton;
    btnEsqParaDirAll: TButton;
    btnEditar: TButton;
    btnEditarNovo: TButton;
    procedure btnDirParaEsqAllClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnCarregarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnDirParaEsqSimplesClick(Sender: TObject);
    procedure btnEsqParaDirSimplesClick(Sender: TObject);
    procedure btnEsqParaDirAllClick(Sender: TObject);
    procedure btnEditarNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    passaTexto : string;

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnDirParaEsqAllClick(Sender: TObject);
var
  i: Integer;
begin
//  tmr1.Enabled := not tmr1.Enabled;

  pb1.Max := lst1.Count;

  for i := 0 to lst1.Count - 1 do
    begin
      lst2.Items.Add(lst1.Items[i]);
      pb1.Position := pb1.Position + 1;
      Self.Repaint();
      Sleep(200);
    end;

  pb1.Position := 0;
  lst1.Clear();
end;



procedure TForm1.btnAdicionarClick(Sender: TObject);
begin
  lst1.Items.Add(edt1.Text);
  edt1.Text := '';
  edt1.SetFocus();
end;

procedure TForm1.btnApagarClick(Sender: TObject);
begin
  lst1.Clear();
  lst2.Clear();
  edt1.Clear();
end;

procedure TForm1.btnCarregarClick(Sender: TObject);
var
  linha,nome,teste,checarExt                 : string;
  i                                          : integer;
  arq                                        : TextFile;
  nota1,nota2,nota3                          : Real;
begin
  lst1.Clear;
  passaTexto := edt1.Text;
  dlgOpen.DefaultExt := '.txt';
  teste := edt1.Text;
  AssignFile(arq, teste);
  if(not FileExists(teste) or (edt1.Text = '') ) then
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

          lst1.Items.Add('Aluno.: ' + nome);
          lst1.Items.Add('Nota1.: ' + FloatToStr(nota1));
          lst1.Items.Add('Nota2.: ' + FloatToStr(nota2));
          lst1.Items.Add('Nota3.: ' + FloatToStr(nota3));
        //  lst1.Items.Add('Média.: ' + MediaFormatada);
          lst1.Items.Add('');
        //  passaTexto := lst1.Items.Text;
        end;
    except
      begin
        lst1.Clear;
        lst1.Items.Add('Não foi possível abrir o arquivo, verificar o caminho');
      end;
      CloseFile(arq);
      Append(arq);
    end;
end;

procedure TForm1.btnPesquisarClick(Sender: TObject);
var
  diretorio : string;
begin
  if dlgOpen.Execute then
    begin
//      dlgOpen.Filter := 'Text files (*.txt)|*.txt';
      diretorio := dlgOpen.FileName;
      edt1.Text := diretorio;
    end;

end;

procedure TForm1.btnDirParaEsqSimplesClick(Sender: TObject);
var
  i : integer;

begin
  for i := lst1.Items.Count -1 downto 0 do
    begin
      if (lst1.Selected[i]) then
        begin
          lst2.Items.Add(lst1.Items[i]);
          lst1.Items.Delete(i);
        end;
    end;
//  for i := 0 to lst1.Count - 1 do
//    begin
//      If (lst1.Selected[i]) then
//        for j := 0 to lst1.Count -1 do
//          begin
//            if (lst1.Selected[j] and (lst2.Items.IndexOf(lst1.Items[j]) = -1)) then
//              begin
//                lst2.Items.Add(lst1.Items.Strings[i]);
//                lst1.Items.Delete(i);   // dando list index out of bounds aqui - verificar
//              end;
//          end;
//    end;

end;

procedure TForm1.btnEsqParaDirSimplesClick(Sender: TObject);
var
  i : integer;   
begin

  for i := lst2.Items.Count -1 downto 0 do
    begin
      if (lst2.Selected[i]) then
        begin
          lst1.Items.Add(lst2.Items[i]);
          lst2.Items.Delete(i);
        end;
    end;

//  for i := 0 to lst2.Count - 1 do
//    begin
//      If (lst2.Selected[i]) then
//        for j := 0 to lst2.Count -1 do
//          begin
//            if (lst2.Selected[j] and (lst1.Items.IndexOf(lst2.Items[j]) = -1)) then
//              lst1.Items.Add(lst2.Items[i]);
//              lst2.Items.Delete(i);
//          end;
//    end;

end;

procedure TForm1.btnEsqParaDirAllClick(Sender: TObject);
var
  i : integer;
begin

  pb1.Max := lst2.Count;


  for i := 0 to lst2.Count - 1 do
    begin
      lst1.Items.Add(lst2.Items[i]);
      pb1.Position := pb1.Position + 1;
      Self.Repaint();
      Sleep(200);
    end;

  pb1.Position := 0;
  lst2.Clear();
end;



procedure TForm1.btnEditarNovoClick(Sender: TObject);
begin
// if not Assigned(Form3) then
//   begin
//     Form3 := TForm3.Create(Self);
     Form3.ShowModal();
//   end;
end;

end.

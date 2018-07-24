unit uSplashScreen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls;

type
  TSplashScreen = class(TForm)
    imgSplashScreen: TImage;
    aniSplasScreen: TAnimate;
    lblSplashScreen: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowSplashScreen;
  end;

implementation

{$R *.dfm}
{$R Resource.res}

{ TSplashScreen }

procedure TSplashScreen.FormShow(Sender: TObject);
begin
  with aniSplasScreen do
    begin
      ResName := 'rcAnimate';
      ResHandle := HInstance;
      Active := True
    end;
end;

procedure TSplashScreen.ShowSplashScreen;
begin
  Repaint;
  Sleep(7000);
end;

end.

unit envicupom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxGIF, ExtCtrls, StdCtrls, Buttons, funcoesdav, func;

type
  TForm58 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SIM: TBitBtn;
    NAO: TBitBtn;
    Timer1: TTimer;
    segundosres: TLabel;
    segn: TTimer;
    BitBtn1: TBitBtn;
    timerThread: TTimer;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure SIMClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure segnTimer(Sender: TObject);
    procedure timerThreadTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }

  public
    segundos, cont : integer;
    threadDesbloqueio : TTWThreadVerificaPagamento;
    procedure abrePIX;
    { Public declarations }
  end;

var
  Form58: TForm58;

implementation

{$R *.dfm}

uses qrcodePIX;


procedure TForm58.abrePIX;
begin
  //form84 := form84.Create(Application);
  form84.Show;
  //form84.Free;
end;

procedure TForm58.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_f4 then
    abort;

  if key=VK_F2 then begin
    abrePIX;
  end;
end;

procedure TForm58.FormShow(Sender: TObject);
begin
  NAO.SetFocus;
  Timer1.Enabled := false;
  Timer1.Enabled := true;
  timerThread.Enabled := true;
  segn.Enabled   := false;
  segn.Enabled   := true;
  nao.Enabled := false;
  sim.Enabled := false;
  segundos    := 10;
  cont        := 1;

  segundosres.Caption := '01/' + IntToStr(segundos) + ' Segundos Restantes';
end;

procedure TForm58.SIMClick(Sender: TObject);
begin
  if form84.Showing then form84.Close;
  
  CLOSE;
end;

procedure TForm58.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  segn.Enabled   := false;
  sim.Enabled    := true;
  nao.Enabled    := true;
  nao.SetFocus;
end;

procedure TForm58.timerThreadTimer(Sender: TObject);
begin
  timerThread.Enabled := false;
  threadDesbloqueio := TTWThreadVerificaPagamento.Create(true);
  threadDesbloqueio.Start;
end;

procedure TForm58.segnTimer(Sender: TObject);
begin
  cont := cont + 1;
  segundosres.Caption := strzero(cont, 2)+'/' + IntToStr(segundos) + ' Segundos Restantes';
end;

end.

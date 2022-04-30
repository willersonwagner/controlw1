unit qrcodePIX;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ACBrDelphiZXingQRCode, RLReport,
  Vcl.StdCtrls, Vcl.ExtCtrls, ACBrImage;

type
  TForm84 = class(TForm)
    image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PrintDialog1: TPrintDialog;
    Timer1: TTimer;
    Button1: TButton;
    Timer2: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public

    txid : String;
    cont : integer;
    { Public declarations }
  end;

var
  Form84: TForm84;

implementation

{$R *.dfm}

uses principal, func;

procedure TForm84.Button1Click(Sender: TObject);
var
  ret : String;
begin
  form22.Button3.Click;
  ret := form22.beneNome;

  ret := funcoes.PIXConsulta(txid);
  //ret := consultarPIX(txid);
  if ret = '' then Label3.Caption := 'AGUARDANDO PAGAMENTO...';

  Label3.Caption := ret;

  if trim(ret) = 'CONCLUIDA' then begin
    Label3.Caption := 'Recebimento Concluido com Sucesso!';
   
    //sleep(3000);
  end;
end;

procedure TForm84.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer1.Enabled := false;
  Timer2.Enabled := false;
end;

procedure TForm84.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (UpCase(Chr(Key)) = 'P') then begin
    PrintDialog1.Execute(self.Handle);
    self.Print;
  end;
end;

procedure TForm84.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
  
end;

procedure TForm84.FormShow(Sender: TObject);
begin
  if cont = 3 then begin
    Timer1.Enabled := true;
    Timer2.Enabled := true;
  end;


  if form22.qrcodePIX = '' then funcoes.ajustaHoraPelaInternet(form22.datamov);
  PintarQRCode(form22.qrcodePIX, Image1.Picture.Bitmap, qrAuto);

  if cont = 3 then exit;

  if form22.beneNome = '' then begin
    Label3.Caption := 'Nenhuma Conta Cadastrada para esse ' + #13 + 'CNPJ ' + form22.beneCNPJ;
    Label3.Font.Color := 250;
  end
  else begin
    Label3.Caption := 'Beneficiário' + #13 + #13 + 'Nome: ' + form22.beneNome + #13 +
    'CNPJ : ' + form22.beneCNPJ + #13 +
    'Fone : ' + form22.beneFone;
  end;
end;

procedure TForm84.Timer1Timer(Sender: TObject);
var
  ret : String;
begin
  Timer1.Enabled := false;

  ret := funcoes.PIXConsulta(txid);
  Label2.Caption := 'Estado: ' + ret;

  if trim(ret) = 'CONCLUIDA' then Label3.Caption := 'Recebimento Concluido com Sucesso!';

  Timer1.Enabled:=true;
end;

procedure TForm84.Timer2Timer(Sender: TObject);
begin
  if Label3.Caption = 'Recebimento Concluido com Sucesso!' then begin
    Timer2.Enabled := false;
    Timer1.Enabled := false;
    close;
  end;


  if Label3.Caption = 'Aguardando Pagamento' then begin
    Label3.Caption := 'Aguardando Pagamento.';
    exit;
  end;

  if Label3.Caption = 'Aguardando Pagamento.' then begin
    Label3.Caption := 'Aguardando Pagamento..';
    exit;
  end;

  if Label3.Caption = 'Aguardando Pagamento..' then begin
    Label3.Caption := 'Aguardando Pagamento...';
    exit;
  end;

  if Label3.Caption = 'Aguardando Pagamento...' then begin
    Label3.Caption := 'Aguardando Pagamento';
    exit;
  end;
end;

end.

unit Unit1;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Vcl.ExtCtrls, Vcl.AppEvnts, uClasses, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.FB, FireDAC.Phys.FBDef;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Label2: TLabel;
    TrayIcon1: TTrayIcon;
    ApplicationEvents1: TApplicationEvents;
    Memo1: TMemo;
    IBDatabase1: TFDConnection;
    IBQuery1: TFDQuery;
    IBQuery2: TFDQuery;
    IBQuery3: TFDQuery;
    IBTransaction1: TFDTransaction;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
  private
    lista : TlistaProdutos;
    PastaExecCaminhoComBarraNoFinal : String;
    Simbolos : array [0..4] of String;
    function conectar() : boolean;
    function formataCNPJ(Const cnpj : String) : String;
    { Private declarations }
  public
    function DesCriptografar(wStri: String): String;
    function insereClienteRetornaCodigo(const cliente : Tcliente; var nome : String; var errro : integer) : integer;
    function Incrementa_Generator(Gen_name : string; valor_incremento : integer) : string;
    function CompletaOuRepete(const valorParaCompletar:AnsiString;const ValorFinal:AnsiString;valorParaRepetir:string;contadorDeRepeticao:integer):string;
    procedure adicionaMemo(const msg : String);
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
uses ServerContainerUnit1;

procedure tform1.adicionaMemo(const msg : String);
begin
  Memo1.Lines.Add(msg);
end;

function tform1.CompletaOuRepete(const valorParaCompletar:AnsiString;const ValorFinal:AnsiString;valorParaRepetir:string;contadorDeRepeticao:integer):string;
var i:integer;
var acc:string;
  begin
    if length(valorParaCompletar+ValorFinal)<=contadorDeRepeticao then
    begin
    i:=length(ValorFinal);
    acc:='';
    if valorParaCompletar='' then
      begin
        while i < contadorDeRepeticao do
          begin
            try
            acc:=acc+valorParaRepetir;
            except
            end;
            i:=i+1;
            end;
          if ValorFinal<>'' then result:=acc+ValorFinal
             else result:=acc;
      end
    else
      begin
         i := length(valorParaCompletar)+length(ValorFinal);
         acc:=valorParaCompletar;
         while i < contadorDeRepeticao do
          begin
            i:=i+1;
            try
              acc:=acc+valorParaRepetir;
            except
            end;
            end;
          if ValorFinal<>'' then result:=acc+ValorFinal
             else result := acc;
      end;
    end
      else
        begin
          acc := CompletaOuRepete('', '', '*', contadorDeRepeticao);//'*****';
          ///acc := valorParaCompletar + acc + ValorFinal;
          i := length(acc);
          while i < contadorDeRepeticao do
          begin
            i:=i+1;
            try
              acc:=acc+valorParaRepetir;
            except
            end;
            end;
          Result := acc;
        end;
  end;

function tform1.Incrementa_Generator(Gen_name : string; valor_incremento : integer) : string;
begin
  IBQuery1.Close;
  IBQuery1.SQL.Clear;
  IBQuery1.SQL.Add('select gen_id('+ Gen_name +','+ IntToStr(valor_incremento) +') as venda from rdb$database');
  IBQuery1.Open;

  Result := '';
  Result := IBQuery1.fieldbyname('venda').AsString;

  IBQuery1.Close;
end;

function tform1.formataCNPJ(Const cnpj : String) : String;
begin
  Result := '';
  Result := Copy(cnpj,1,2) + '.' + Copy(cnpj,3,3) + '.' + Copy(cnpj,6,3) + '/' + Copy(cnpj, 9, 4) + '-' + Copy(cnpj, 13, 2);
end;

function tform1.insereClienteRetornaCodigo(const cliente : Tcliente; var nome : String; var errro : integer) : integer;
var
  cnpj : String;
begin
  Result := 0;
  cnpj := cliente.cnpj;
  if (Pos('-', cnpj) = 0) or (Pos('\', cnpj) = 0) then
    begin
      cnpj := formataCNPJ(cnpj);
    end;

  IBQuery1.Close;
  IBQuery1.SQL.Text := 'select cod, cnpj, nome from cliente where cnpj = :cnpj';
  IBQuery1.ParamByName('cnpj').AsString := cnpj;
  IBQuery1.Open;

  if not IBQuery1.IsEmpty  then
    begin
      nome   := IBQuery1.FieldByName('nome').AsString;
      Result := IBQuery1.FieldByName('cod').AsInteger;
      IBQuery1.Close;
      exit;
    end;

  Result := StrToIntDef(Incrementa_Generator('cliente', 1), 1);
  //Result := Result + 1;

  IBQuery1.Close;
  IBQuery1.SQL.Text := 'insert into cliente(cod, nome, cnpj, ende, bairro, cid, est, tipo, ies ' +
  ', telcom, telres) values(:cod, :nome, :cnpj, :ende, :bairro, :cid, :est, :tipo, :ies ' +
  ', :telcom, :telres)';
  IBQuery1.ParamByName('cod').AsInteger   := Result;
  IBQuery1.ParamByName('nome').AsString   := copy(cliente.nome, 1, 40);
  IBQuery1.ParamByName('cnpj').AsString   := copy(cliente.cnpj, 1, 22);
  IBQuery1.ParamByName('ende').AsString   := copy(cliente.ende, 1, 34);
  IBQuery1.ParamByName('bairro').AsString := copy(cliente.bairro, 1, 18);
  IBQuery1.ParamByName('cid').AsString    := copy(cliente.cid, 1, 18);
  IBQuery1.ParamByName('est').AsString    := copy(cliente.est, 1, 2);
  IBQuery1.ParamByName('tipo').AsInteger  := cliente.tipo;
  IBQuery1.ParamByName('ies').AsString    := copy(cliente.ies, 1, 14);
  IBQuery1.ParamByName('telcom').AsString := copy(cliente.telcom, 1, 13);
  IBQuery1.ParamByName('telres').AsString := copy(cliente.telres, 1, 13);
  try
   IBQuery1.ExecSQL;
  except
    on e:exception do
      begin
        Memo1.Lines.Add('ERRO: ' + e.Message + #13 + 'Inserção de cliente: ' + IntToStr(Result));
        errro := 1;
      end;
  end;
  nome   := cliente.nome;
end;

function tform1.DesCriptografar(wStri: String): String;
var  x , posicao            : Integer;
sim1 : string;
begin
 sim1 := Simbolos[1];
 Result := '';
 for x := 1 to Length(wStri) do
   begin
     posicao := pos(wStri[x],simbolos[2]);
     Result := Result + sim1[posicao];
   end;
end;

function TForm1.conectar() : boolean;
var
  i : integer;
begin
  Result := false;


  try
    ServerContainerUnit1.ServerContainer1.DSServer1.Start;   //inicia o servidor DataSnap
    IBDatabase1.ConnectionName := edit1.Text;
    IBDatabase1.Params.Values['Database'] := edit1.Text;
    //if edit1.Text <> '' then IBDatabase1.Connected  := true;

    i := 0;
    while true do begin
      i := i + 1;
      try
        IBDatabase1.Connected  := true;
        Result := IBDatabase1.Connected;
        Memo1.Lines.Add('BD Conectado com Sucesso: '+IBDatabase1.ConnectionName);
        break;
      except
        on e:exception do begin
          //Memo1.Lines.Add(e.Message);
          IBDatabase1.Params.Values['Password'] := 'SYSTEMA1';
        end;
      end;
    end;
    //Memo1.Lines.Add('Servidor Firebird Conectado!');
  except
    on e:exception do
      begin
        Memo1.Lines.Add(e.Message);
      end;
  end;
end;

procedure TForm1.ApplicationEvents1Minimize(Sender: TObject);
begin
  self.Hide();
  TrayIcon1.Visible := true;
  TrayIcon1.Animate := true;
  TrayIcon1.ShowBalloonHint;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  if conectar() then Label1.Caption := 'Servidor Conectado';
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  try
    ServerContainerUnit1.ServerContainer1.DSServer1.Stop; //para o servidor DataSnap
    IBDatabase1.Connected := false;
    Label1.Caption := 'Servidor Desconectado';
  finally

  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Simbolos[1] := 'ABCDEFGHIJLMNOPQRSTUVXZYWK abcdefghijlmnopqrstuvxzywk1234567890-+=_?/.,<>;:)(*&^%$#@!~áäà';
  Simbolos[2] := 'ÂÀ©Øû×ƒçêùÿ5Üø£úñÑªº¿®¬¼ëèïÙýÄÅÉæÆôÁáâäàåíóÇüé¾¶§÷ÎÏ-+ÌÓß¸°¨·¹³²Õµþîì¡«½WDX2U3BHJKMSZDTQ4';
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  PastaExecCaminhoComBarraNoFinal := ExtractFileDir(ParamStr(0)) + '\';
  Edit1.Text := '';

  if FileExists(PastaExecCaminhoComBarraNoFinal + 'BD.FDB') then
    begin
      edit1.Text := PastaExecCaminhoComBarraNoFinal + 'BD.FDB';
    end;

  if ParamStr(1) <> '' then
    begin
      edit1.Text := ParamStr(1);
    end;

  if Edit1.Text <> '' then IBDatabase1.ConnectionName := edit1.Text
    else edit1.Text := IBDatabase1.ConnectionName;

  conectar;



  Label1.Caption := 'Servidor Conectado';
end;

procedure TForm1.TrayIcon1DblClick(Sender: TObject);
begin
  show();
  TrayIcon1.Visible := false;
  Application.BringToFront;
end;

end.


unit JsEditNumero1;

interface

uses
  SysUtils, Classes, Controls, StdCtrls, JsEdit1, Dialogs,forms, funcoesdav;

type
  JsEditNumero = class(JsEdit)
  private
    cont, c1 : integer;
    procedure novo;
    { Private declarations }
  protected
    { Protected declarations }
  public
    decimal : integer;
    deci : boolean;
    procedure DoEnter(); override;
    procedure setDecimais(decimais : integer);
    function GeraCompleto(valorx : integer) : string;
    procedure EscreveNumero(Value: Integer);
    function GeraDecimais : String;
    function GeraDecimaisComParametros(decimal1 : integer) : String;
    constructor Create(AOwner: TComponent);override;
    procedure KeyPress(var Key: Char); override;
    procedure KeyDown(var Key: Word; shift : TShiftState);override;
    procedure FormataNumero(VKey : char);
    Function ConverteNumerico(valor:string):string;
    function getValor : currency;
    procedure setValor(valor : currency);
  published
    property CasasDecimais :integer read decimal write EscreveNumero ;
  end;

procedure Register;

implementation

constructor JsEditNumero.Create(AOwner: TComponent);
begin
   Inherited Create(AOwner);
   if (decimal = 0) then decimal := 2;
   Text := '0'+GeraDecimais;
   deci := false;
   cont := 1;
   self.TipoDeDado := teNumero;
end;


procedure JsEditNumero.novo;
begin
  text :='0'+GeraDecimais;
  deci := false;
end;

procedure JsEditNumero.setDecimais(decimais : integer);
begin
  decimal := decimais;
  self.Text := '0'+GeraDecimais;
  deci := false;
end;

function JsEditNumero.getValor : currency;
begin
  Result := 0;
  if ((Text <> '') and (Text <> '0.00')) then
    Result := StrToFloatDef(ConverteNumerico(Text), 0);
end;

procedure JsEditNumero.setValor(valor : currency);
begin
  Text := FormatCurr('#,###,###0.' + STRZERO('0', decimal), valor);
end;


procedure Register;
begin
  RegisterComponents('JsEdit', [JsEditNumero]);
end;

procedure JsEditNumero.EscreveNumero(Value: Integer);
begin
 decimal := Value;
 text := '0'+GeraDecimais;
end;

function JsEditNumero.GeraDecimaisComParametros(decimal1 : integer) : String;
var cont : integer;
begin
  Result := '';
  if decimal1 = 0 then
  else
   begin
    Result := ',';
    for cont := 1 to decimal1 do
     begin
      Result := Result + '0';
     end;
   end;
end;

function JsEditNumero.GeraCompleto(valorx : integer) : string;
begin
  result := '0'+GeraDecimaisComParametros(valorx);
end;

function JsEditNumero.GeraDecimais : String;
var cont : integer;
begin
  Result := '';
  if decimal=0 then
  else
   begin
    Result := ',';
    for cont := 1 to decimal do
     begin
      Result := Result + '0';
     end;
   end;
end;

Function JsEditNumero.ConverteNumerico(valor:string):string;
var i:integer;
begin
  //valor:=FormatCurr('##.###0.00',strtocurr(valor));
  if (valor<>'') then begin
  for i:=1 to length(valor) do
  begin
    if (valor[i]='.') and not ( (i=length(valor)-1) or (i=length(valor)-2) or (i=length(valor)-3)) then  delete(valor,i,1);
    if (valor[i]='.') and ( (i=length(valor)-1) or (i=length(valor)-2) or (i=length(valor)-3)) then valor[i]:=',';
  end;
  result:=valor;
  end
   else result:='0';
end;

procedure JsEditNumero.DoEnter();
begin
  Inherited;
  deci := false;
  cont := 1;
  self.SelectAll;
end;

procedure JsEditNumero.KeyPress(var Key: Char);
begin
  Inherited KeyPress(Key);
  if not(Key in['0'..'9',',','.','-','+', #8,#46, #13, #27]) then Key := #0;
  FormataNumero(Key);
{if self.func then
 begin
  if ((Key = #27) and (self <> JsEdit.GetPrimeiroCampo(self.Owner.Name)) ) then
     LimpaCampos(self.form);
 end;      }
  Key := #0;
end;

procedure JsEditNumero.FormataNumero(VKey : char);
Var valor,decimais : String;
i: integer;
begin
if decimal = 0 then decimal := 2;
//se foi teclado ponto, troca por virgula
if vkey='.' then vkey:=',';


if ((vkey = ',') and (GetSelLength = Length(text))) then begin
  novo;
end;

if vkey = #13 then
 begin
  if text='' then text := '0'+GeraDecimais
  //se nao encontrar a virgular � pq nao existe decimais entao gera os decimais
  else if pos(',',text) <= 0 then  text := Text  + GeraDecimais
  //se existir virgula entao confere se esta ok se nao formata
  else if pos(',',text) > 0 then
     begin
       valor := copy(text,0,pos(',',text)-1);
       decimais := copy(text,pos(',',text)+1,length(text));
       if length(valor)<=0 then valor := '0';
       if length(decimais) < decimal then
         begin
           //completa os decimais com 0 ate chegar ao numero de decimais
           for i:= length(decimais) to decimal-1 do
            begin
              decimais := decimais + '0';
            end;
         end;
       text := valor + ',' + decimais;
     end;
    if StrToCurr(ConverteNumerico(text))=0 then text := '0'+GeraDecimais;
 end;


//Se for pressionado DELETE o texto do componente � igual a zero
if (vkey=#46) or (vkey=#8) then
  begin
    novo();
  end;

if (vkey = ',')  then
 begin
  SelStart := pos(',',text);
  deci := true;
  c1 := 1;
  VKey := #0;
 end
else
 begin
 if (vkey = '-') or (vkey = '+') then
  begin
    if (pos('-',text) = 0) and (vkey = '-') then text := '-' + text;
    if (pos('-',text) > 0) and (vkey = '+') then text := copy(text,2,length(text));//Delete(text, pos('-',text) ,1 );
  end;
  //se deci for verdadeiro entao vai alterar so os decimais
 if vkey in ['0'..'9'] then
  begin
    //se o cursor estiver prox da virgula entao altera tudo novamente
    if deci and (SelStart = Pos(',', text)) then begin
      c1 := 1;
    end;


    if GetSelLength = Length(text) then
      begin
        novo();
      end;

    valor := copy(text,0,pos(',',text)-1);
    decimais := copy(text,pos(',',text)+1,length(text));
    if deci then
      begin
        decimais[c1] := vkey;
        if c1 = decimal then c1 := decimal
         else
           begin
             c1 := c1 + 1;
           end;

        SelStart := (pos(',',text)-1) + c1 - 1;
        SelLength := (pos(',',text)-1) + c1;
      end
    else

     if StrToFloat(ConverteNumerico(valor)) = 0 then
      begin
       if Length(valor) > 1 then valor := '-'+VKey
       else valor := vkey;
      end
     else valor := valor + vkey;
     // se os decimais for igual a zero entao formata os inteiro e  escreve senao so escreve o valor

     if not deci then  text := FormatCurr('###,###,##0',StrToCurr(ConverteNumerico(valor)))+','+decimais
      else text := valor+','+ decimais;

   if deci then begin
     SelStart := pos(',',text) + c1 -1;
     SelLength := 1;
   end
   else
     begin
       SelStart := pos(',',text)-1;
       cont := 1;
     end;
  end;

end;
{Texto := Text;
if ( VKey = #8) then Texto := '000';
if (VKey in['0'..'9']) then Texto := Texto + VKey;
if (Texto = '') then Texto := '000';
vChar := Texto;
tam := length(vChar);
While ( pos( ',', vChar ) > 0 ) or ( pos( '.', vChar ) > 0 ) do
  begin
    Delete( vChar, pos( '.', vChar ), 1 );
 t   Delete( vChar, pos( ',', vChar ), 1 );
  end;
vDiv := '1';
For I := 1 to decimal do vDiv := vDiv + '0';
MaxLength := tam - 1;
Text := Format('%*.*n',[tam, decimal, StrToFloat(vChar)/StrToInt(vDiv)]);
SelStart := length(text) + 1;
}end;

procedure JsEditNumero.KeyDown(var Key: Word; shift : TShiftState);
begin
  if key=46 then
    begin
      text := '0'+GeraDecimais;
      deci := false;
      key:=0;
    end;
  Inherited;
end;

end.

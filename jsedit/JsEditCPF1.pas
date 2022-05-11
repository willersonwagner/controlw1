unit JsEditCPF1;

interface

uses
  SysUtils, Classes, Controls, StdCtrls, Graphics, Windows, Messages, Forms, contnrs,
  Dialogs, Buttons, Mask, JsEdit1;

type
  JsEditCPF = class(TMaskEdit)
   private
    valida : boolean;
    function strnum(num : string) : string;
  protected
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent);override;
    procedure KeyPress(var Key: Char);override;
    procedure KeyDown(var Key: Word; shift : TShiftState);override;
    function ValidaCPF() : boolean;
    function CompletaString(parcial : string) : string;
  published
    property ValidaCampo :boolean read valida write valida default false;
  end;

procedure Register;

implementation
var lista : TObjectList; primeiroCampo : TObject;

procedure Register;
begin
  RegisterComponents('JsEdit', [JsEditCPF]);
end;

constructor JsEditCPF.Create(AOwner: TComponent);
begin
  Inherited;
  JsEdit.AdicionaComponente(Self);
  Self.EditMask := '!999.999.999-99;1;_';
  lista := JsEdit.GetLista();
end;

procedure JsEditCPF.KeyPress(var Key: Char);
var ok : boolean;
begin
  inherited KeyPress(Key);
  if (Key = #27) then
    begin
      JsEdit.LimpaCampos(self.Owner.Name);
    end;


  //if ((Key <> #13) and (Key <> #27)) then
     //inherited KeyPress(Key);
  {if Key = #8 then
     begin
       Text := '___.___.___-__';
       ReformatText(EditMask);
       key := #0;
     end;}

  if (Key = #13) then
     begin
       //ShowMessage('1');
       ok := false;
       if (Self.Text = '___.___.___-__') then
          begin
            //se valida campo, n�o deixa passar em branco
            if (Self.valida) then
               begin
                 ok := false;
                 ShowMessage('Campo de preenchimento obrigat�rio');
                 Self.SetFocus;
               end;
          end
        else
          if self.valida then
            begin
              if (validaCPF = false) then
                 begin
                   MessageDlg('CPF Inv�lido!', mtError, [mbOK], 1);
                   Self.SelectAll;
                   Self.SetFocus;
                   ok := false;
                   Key := #0;
                 end
               else ok := true;  
            end
          else ok := true;  
            
       if ok then
          PostMessage((Owner as TWinControl).Handle, WM_NEXTDLGCTL, 0, 0)

  end;

  if ((Key = #27) and (self <> lista.First) ) then
     JsEdit.LimpaCampos(self.Owner.Name);

end;

function JsEditCPF.validaCPF() : boolean;
var i:integer;
    Want:char;
    Wvalid:boolean;
    Wdigit1,Wdigit2:integer;
    cpf : String;
begin
  cpf := strnum(Text);
  Result := false;
  if length(cpf) <> 11 then exit;

    Wdigit1:=0;
    Wdigit2:=0;
    Want:=cpf[1];//variavel para testar se o cpf � repetido como 111.111.111-11
    Delete(cpf,ansipos('.',cpf),1);  //retira as mascaras se houver
    Delete(cpf,ansipos('.',cpf),1);
    Delete(cpf,ansipos('-',cpf),1);

   //testar se o cpf � repetido como 111.111.111-11
   for i:=1 to length(cpf) do
     begin
       if cpf[i] <> Want then
         begin
            Wvalid:=true;  // se o cpf possui um digito diferente ele passou no primeiro teste
            break
         end;
     end;
       // se o cpf � composto por numeros repetido retorna falso
     if not Wvalid then
       begin
          result:=false;
          exit;
       end;

     //executa o calculo para o primeiro verificador
     for i:=1 to 9 do
       begin
          wdigit1:=Wdigit1+(strtoint(cpf[10-i])*(I+1));
       end;
        Wdigit1:= ((11 - (Wdigit1 mod 11))mod 11) mod 10;
        {formula do primeiro verificador
            soma=1�*2+2�*3+3�*4.. at� 9�*10
            digito1 = 11 - soma mod 11
            se digito > 10 digito1 =0
          }

         //verifica se o 1� digito confere
        if IntToStr(Wdigit1) <> cpf[10] then
          begin
             result:=false;
             exit;
          end;


         for i:=1 to 10 do
       begin
          wdigit2:=Wdigit2+(strtoint(cpf[11-i])*(I+1));
       end;
       Wdigit2:= ((11 - (Wdigit2 mod 11))mod 11) mod 10;
         {formula do segundo verificador
            soma=1�*2+2�*3+3�*4.. at� 10�*11
            digito1 = 11 - soma mod 11
            se digito > 10 digito1 =0
          }

       // confere o 2� digito verificador
       if IntToStr(Wdigit2) <> cpf[11] then
          begin
             result:=false;
             exit;
          end;

   //se chegar at� aqui o cpf � valido
   result:=true;
end;

procedure JsEditCPF.KeyDown(var Key: Word; shift : TShiftState);
begin
    if Key = 46 then
       begin
         Text := '___.___.___-__';
         ReformatText(EditMask);
         key := 0;
       end;
    //teclas PgUp e PgDown - passam o foco para o �primeiro bot�o
    if ((Key = 33) or (Key = 34)) then
       JsEdit.SetFocusNoPrimeiroBotao;
    //seta acima - sobe at� o primeiro componente
    if (Key = 38) then
       begin
         if TEdit(lista.First).Enabled then primeiroCampo := lista.First else
            primeiroCampo := lista.Items[1];
         if (self <> primeiroCampo) then
            PostMessage((Owner as TWinControl).Handle, WM_NEXTDLGCTL, 1, 0);
       end;
    //seta abaixo - n�o passa do primeiro e nem do �ltimo para baixo
    if ((Key = 40) and (self <> lista.Last)) then
        PostMessage((Owner as TWinControl).Handle, WM_NEXTDLGCTL, 0, 0);

  inherited KeyDown(key, shift);      
end;

function JsEditCPF.CompletaString(parcial : string) : string;
var ini : integer; atual, ret : string;
begin
   atual := datetostr(date);
   ret := '';
   for ini := 1 to length(atual) do
     begin
       if (copy(parcial, ini, 1) = ' ') then
          ret := ret + copy(atual, ini, 1)
         else
          ret := ret + copy(parcial, ini, 1);
     end;
   result := ret;
end;

function JsEditCPF.strnum(num : string) : string;
var
  cont : integer;
begin
  Result := '';
  for cont := 1 to length(num) do
    begin
      if pos(num[cont], '1234567890') > 0 then Result := Result + num[cont];
    end;
  if Result = '' then Result := '0';
end;


end.



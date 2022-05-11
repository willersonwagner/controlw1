
unit JsEditData1;

interface

uses
  SysUtils, Classes, Controls, StdCtrls, Graphics, Windows, Messages, Forms, contnrs,
  Dialogs, Buttons, Mask, JsEdit1;

type
  JsEditData = class(TMaskEdit)
  private
    FOldBackColor : TColor;
    FColorOnEnter : TColor;
    valida, compData : boolean;
    property OldBackColor : TColor read FOldBackColor write FOldBackColor;
  protected
    FAlignment: TAlignment;
    procedure DoEnter; override;
    procedure DoExit; override;

    { Protected declarations }
  public
    constructor Create(AOwner: TComponent);override;
    procedure KeyPress(var Key: Char);override;
    procedure KeyDown(var Key: Word; shift : TShiftState);override;
    function PosFinal(substr:string;Texto:string):integer;
    function ValidaData() : boolean;
    function CompletaString(parcial : string) : string;
    function getData() : TDate;
  published
    property ValidaCampo :boolean read valida write valida default true;
    property CompletaData :boolean read compData write compData default true ;
    property ColorOnEnter :TColor read FColorOnEnter write FColorOnEnter default clInactiveCaption;
  end;

procedure Register;

implementation
var lista : TObjectList; primeiroCampo : TObject;

procedure Register;
begin
  RegisterComponents('JsEdit', [JsEditData]);
end;

constructor JsEditData.Create(AOwner: TComponent);
begin
  FColorOnEnter := clInactiveCaption;
  Inherited;
  JsEdit.AdicionaComponente(Self);
  Self.EditMask := '!99/99/0000;1;_';
  lista := JsEdit.GetLista();

end;

procedure JsEditData.DoEnter;
begin
  OldBackColor := Color;
  Color := FColorOnEnter;
  inherited;
end;

procedure JsEditData.DoExit;
begin
  Color := OldBackColor;
  inherited;
end;


function JsEditData.PosFinal(substr:string;Texto:string):integer;
var a,b:integer;
var retorno:string;
begin
 b:=0;
 Result := 0;
 for a:=length(Texto) downto 1 do
   begin
     if (texto[a]=substr) and (b=0) then
      begin
       result:=a;
       b:=1;
      end;
   end;
end;

procedure JsEditData.KeyPress(var Key: Char);
var ok : boolean;
begin
  if Key = #8 then
    begin
      //self.SelectAll;
    end;
 // ok := true;
  if (Key = #13) then
    begin
      ok := true;
      if not(compData) then begin
         Text := CompletaString(Text);
      end;
      if (Text = '  /  /    ') then
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
            if (not validaData) then
              begin
                ShowMessage('Data Inv�lida, favor digitar novamente');
                Self.SelectAll;
                Self.SetFocus;
                ok := false;
                Key := #0;
              end;

    if ok then
      begin
        PostMessage((Owner as TWinControl).Handle, WM_NEXTDLGCTL, 0, 0);
      end;
  end;
  if (Self.Text = '') then Self.Text := '  /  /    ';
  if (Key = #27)  then JsEdit.LimpaCampos(self.Owner.Name);
  //if pos(key, #8+#13) = 0 then Inherited KeyPress(Key);
  //key := #0;

  inherited KeyPress(Key);
end;

function JsEditData.validaData() : boolean;
var data : TDateTime;
begin
  Result := false;
  {try
    ShowMessage(text);
    StrToDate(Text);
    Result := true;
  except
  end;}
  result := TryStrToDate(Text, data);
end;

procedure JsEditData.KeyDown(var Key: Word; shift : TShiftState);
begin
    //teclas PgUp e PgDown - passam o foco para o �primeiro bot�o
    if ((Key = 33) or (Key = 34)) then
       JsEdit.SetFocusNoPrimeiroBotao;
    //seta acima - sobe at� o primeiro componente
    if (Key = 38) then
       begin
         if jsedit(JsEdit.GetPrimeiroCampo(self.Owner.Name)).Enabled then primeiroCampo := jsedit(JsEdit.GetPrimeiroCampo(self.Owner.Name))
          else
            primeiroCampo := JsEdit.GetPrimeiroCampo(self.Owner.Name);
         if (self <> JsEdit.GetLista.Items[jsedit.RetornaIndiceDoPrimeiroCampo(self.Owner.Name)]) then
            PostMessage((Owner as TWinControl).Handle, WM_NEXTDLGCTL, 1, 0);
            //ShowMessage(JsEdit.ConteudoDelimitado(self));
       end;
    //seta abaixo - n�o passa do primeiro e nem do �ltimo para baixo
    if ((Key = 40) and (self <> jsedit.GetLista.Items[jsedit.RetornaIndiceDoUltimoCampo(self.Owner.Name)])) then
        PostMessage((Owner as TWinControl).Handle, WM_NEXTDLGCTL, 0, 0);

  inherited KeyDown(key, shift);       
end;

function JsEditData.CompletaString(parcial : string) : string;
var ini : integer; atual, ret,acc: string;
begin
   atual := FormatDateTime('dd/mm/yyyy',date);
   ret := '';
   acc := '';

 if Length(Trim(parcial))<>10 then
  begin
   if (Length(Trim(parcial))>7) and (Length(parcial)<=10) and (parcial<>'  /  /    ') then
    begin
     ret := copy(parcial,PosFinal('/',parcial)+1,length(parcial));
     Delete(parcial,length(parcial)-3,length(parcial));
    //parcial := parcial + copy(atual,PosFinal('/',atual)+1,PosFinal('/',atual)+3);
     acc := copy(atual,PosFinal('/',atual)+1,PosFinal('/',atual)+3);
     acc := acc[1]+ acc[2];
     parcial := parcial +acc+ ret;
     ret := parcial;
    end;

  for ini := 1 to length(atual) do
   begin
     if parcial[ini] = ' ' then
       ret := ret + copy(atual, ini, 1)
     else
       ret := ret + copy(parcial, ini, 1);
   end;
   result := ret;
 end
else result := parcial;

end;

function JsEditData.getData() : TDate;
begin
  Result := StrToDateDef(Text, now);
end;

end.

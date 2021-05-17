//
// Created by the DataSnap proxy generator.
// 21/07/2014 19:06:17
//

unit Unit2;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, uClasses, Data.DBXJSONReflect;

type
  TServerMethods1Client = class(TDSAdminClient)
  private
    FinsereVendasCommand: TDBXCommand;
    FgetProdutosCommand: TDBXCommand;
    FgetProdutos1Command: TDBXCommand;
    FgetFormasCommand: TDBXCommand;
    FgetUsuariosCommand: TDBXCommand;
    FEchoStringCommand: TDBXCommand;
    FReverseStringCommand: TDBXCommand;
    FexecSqlCommand: TDBXCommand;
    FsomaCommand: TDBXCommand;
    FRecordCountProdutosIntegerCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function insereVendas(lista: TlistaVendas; usuario: string): string;
    function getProdutos: TJSONValue;
    function getProdutos1: TlistaProdutos;
    function getFormas: TlistaFormas;
    function getUsuarios: TlistaUsuario;
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    procedure execSql(sql: string);
    function soma(v1: Currency; v2: Currency): TJSONValue;
    function RecordCountProdutosInteger: Integer;
  end;

implementation

function TServerMethods1Client.insereVendas(lista: TlistaVendas; usuario: string): string;
begin
  if FinsereVendasCommand = nil then
  begin
    FinsereVendasCommand := FDBXConnection.CreateCommand;
    FinsereVendasCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FinsereVendasCommand.Text := 'TServerMethods1.insereVendas';
    FinsereVendasCommand.Prepare;
  end;
  if not Assigned(lista) then
    FinsereVendasCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FinsereVendasCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FinsereVendasCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(lista), True);
      if FInstanceOwner then
        lista.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FinsereVendasCommand.Parameters[1].Value.SetWideString(usuario);
  FinsereVendasCommand.ExecuteUpdate;
  Result := FinsereVendasCommand.Parameters[2].Value.GetWideString;
end;

function TServerMethods1Client.getProdutos: TJSONValue;
begin
  if FgetProdutosCommand = nil then
  begin
    FgetProdutosCommand := FDBXConnection.CreateCommand;
    FgetProdutosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FgetProdutosCommand.Text := 'TServerMethods1.getProdutos';
    FgetProdutosCommand.Prepare;
  end;
  FgetProdutosCommand.ExecuteUpdate;
  Result := TJSONValue(FgetProdutosCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.getProdutos1: TlistaProdutos;
begin
  if FgetProdutos1Command = nil then
  begin
    FgetProdutos1Command := FDBXConnection.CreateCommand;
    FgetProdutos1Command.CommandType := TDBXCommandTypes.DSServerMethod;
    FgetProdutos1Command.Text := 'TServerMethods1.getProdutos1';
    FgetProdutos1Command.Prepare;
  end;
  FgetProdutos1Command.ExecuteUpdate;
  if not FgetProdutos1Command.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDBXClientCommand(FgetProdutos1Command.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TlistaProdutos(FUnMarshal.UnMarshal(FgetProdutos1Command.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FgetProdutos1Command.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.getFormas: TlistaFormas;
begin
  if FgetFormasCommand = nil then
  begin
    FgetFormasCommand := FDBXConnection.CreateCommand;
    FgetFormasCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FgetFormasCommand.Text := 'TServerMethods1.getFormas';
    FgetFormasCommand.Prepare;
  end;
  FgetFormasCommand.ExecuteUpdate;
  if not FgetFormasCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDBXClientCommand(FgetFormasCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TlistaFormas(FUnMarshal.UnMarshal(FgetFormasCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FgetFormasCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.getUsuarios: TlistaUsuario;
begin
  if FgetUsuariosCommand = nil then
  begin
    FgetUsuariosCommand := FDBXConnection.CreateCommand;
    FgetUsuariosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FgetUsuariosCommand.Text := 'TServerMethods1.getUsuarios';
    FgetUsuariosCommand.Prepare;
  end;
  FgetUsuariosCommand.ExecuteUpdate;
  if not FgetUsuariosCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDBXClientCommand(FgetUsuariosCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TlistaUsuario(FUnMarshal.UnMarshal(FgetUsuariosCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FgetUsuariosCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.EchoString(Value: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FDBXConnection.CreateCommand;
    FEchoStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEchoStringCommand.Text := 'TServerMethods1.EchoString';
    FEchoStringCommand.Prepare;
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.ExecuteUpdate;
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.ReverseString(Value: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FDBXConnection.CreateCommand;
    FReverseStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FReverseStringCommand.Text := 'TServerMethods1.ReverseString';
    FReverseStringCommand.Prepare;
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.ExecuteUpdate;
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

procedure TServerMethods1Client.execSql(sql: string);
begin
  if FexecSqlCommand = nil then
  begin
    FexecSqlCommand := FDBXConnection.CreateCommand;
    FexecSqlCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FexecSqlCommand.Text := 'TServerMethods1.execSql';
    FexecSqlCommand.Prepare;
  end;
  FexecSqlCommand.Parameters[0].Value.SetWideString(sql);
  FexecSqlCommand.ExecuteUpdate;
end;

function TServerMethods1Client.soma(v1: Currency; v2: Currency): TJSONValue;
begin
  if FsomaCommand = nil then
  begin
    FsomaCommand := FDBXConnection.CreateCommand;
    FsomaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FsomaCommand.Text := 'TServerMethods1.soma';
    FsomaCommand.Prepare;
  end;
  FsomaCommand.Parameters[0].Value.AsCurrency := v1;
  FsomaCommand.Parameters[1].Value.AsCurrency := v2;
  FsomaCommand.ExecuteUpdate;
  Result := TJSONValue(FsomaCommand.Parameters[2].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.RecordCountProdutosInteger: Integer;
begin
  if FRecordCountProdutosIntegerCommand = nil then
  begin
    FRecordCountProdutosIntegerCommand := FDBXConnection.CreateCommand;
    FRecordCountProdutosIntegerCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRecordCountProdutosIntegerCommand.Text := 'TServerMethods1.RecordCountProdutosInteger';
    FRecordCountProdutosIntegerCommand.Prepare;
  end;
  FRecordCountProdutosIntegerCommand.ExecuteUpdate;
  Result := FRecordCountProdutosIntegerCommand.Parameters[0].Value.GetInt32;
end;


constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TServerMethods1Client.Destroy;
begin
  FinsereVendasCommand.DisposeOf;
  FgetProdutosCommand.DisposeOf;
  FgetProdutos1Command.DisposeOf;
  FgetFormasCommand.DisposeOf;
  FgetUsuariosCommand.DisposeOf;
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FexecSqlCommand.DisposeOf;
  FsomaCommand.DisposeOf;
  FRecordCountProdutosIntegerCommand.DisposeOf;
  inherited;
end;

end.


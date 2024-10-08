unit Menus.Model.Conexoes.Zeos.Conexao;

interface

uses
  Menus.Model.Conexoes.Interfaces,
  System.Classes,
  System.SysUtils,
  FMX.Layouts,
  Data.DB,
  ZAbstractConnection,
  ZConnection;

type
  TModelConexaoZeos = class(TInterfacedObject, iModelConexao, iModelConexaoParametros)
  private
    FConexao: TZConnection;
    FDatabase: String;
    FUserName: String;
    FPassword: String;
    FDriverID: String;
    FServer: String;
    FPorta: Integer;
    Procedure LerParametros;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelConexao;
    function EndConexao: TComponent;
    function Parametros: iModelConexaoParametros;
    function Database(Value: String): iModelConexaoParametros;
    function UserName(Value: String): iModelConexaoParametros;
    function Password(Value: String): iModelConexaoParametros;
    function DriverID(Value: String): iModelConexaoParametros;
    function Server(Value: String): iModelConexaoParametros;
    function Porta(Value: Integer): iModelConexaoParametros;
    function EndParametros: iModelConexao;
    function Conectar: iModelConexao;
  end;

implementation

{ TModelConexaoZeos }

function TModelConexaoZeos.Conectar: iModelConexao;
begin
  Result := Self;
  LerParametros;
  FConexao.Connected := true;
end;

constructor TModelConexaoZeos.Create;
begin
  FConexao := TZConnection.Create(nil);
end;

function TModelConexaoZeos.Database(Value: String): iModelConexaoParametros;
begin
  Result := Self;
  FDatabase := Value;
end;

destructor TModelConexaoZeos.Destroy;
begin
  FConexao.Free;
  inherited;
end;

function TModelConexaoZeos.DriverID(Value: String): iModelConexaoParametros;
begin
  Result := Self;
  FDriverID := Value;
end;

function TModelConexaoZeos.EndConexao: TComponent;
begin
  Result := FConexao;
end;

function TModelConexaoZeos.EndParametros: iModelConexao;
begin
  Result := Self;
end;

procedure TModelConexaoZeos.LerParametros;
begin
  FConexao.HostName := FServer;
  FConexao.Port := FPorta;
  FConexao.Database := FDatabase;
  FConexao.User := FUserName;
  FConexao.Password := FPassword;
  FConexao.Protocol := FDriverID;
end;

class function TModelConexaoZeos.New: iModelConexao;
begin
  Result := Self.Create;
end;

function TModelConexaoZeos.Parametros: iModelConexaoParametros;
begin
  Result := Self;
end;

function TModelConexaoZeos.Password(Value: String): iModelConexaoParametros;
begin
  Result := Self;
  FPassword := Value;
end;

function TModelConexaoZeos.Porta(Value: Integer): iModelConexaoParametros;
begin
  Result := Self;
  FPorta := Value;
end;

function TModelConexaoZeos.Server(Value: String): iModelConexaoParametros;
begin
  Result := Self;
  FServer := Value;
end;

function TModelConexaoZeos.UserName(Value: String): iModelConexaoParametros;
begin
  Result := Self;
  FUserName := Value;
end;

end.

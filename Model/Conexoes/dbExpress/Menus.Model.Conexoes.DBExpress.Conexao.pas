unit Menus.Model.Conexoes.DBExpress.Conexao;

interface

uses
  Menus.Model.Conexoes.Interfaces,
  System.Classes,
  System.SysUtils,
  FMX.Layouts,
  Data.DB,
  Data.DBXFirebird,
  Data.FMTBcd,
  Data.SqlExpr;

type
  TModelConexaoDBExpress = class(TInterfacedObject, iModelConexao, iModelConexaoParametros)
  private
    FConexao: TSQLConnection;
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

{ TModelConexaoDBExpress }

function TModelConexaoDBExpress.Conectar: iModelConexao;
begin
  Result := Self;
  LerParametros;
  FConexao.Connected := true;
end;

constructor TModelConexaoDBExpress.Create;
begin
  FConexao := TSQLConnection.Create(nil);
end;

function TModelConexaoDBExpress.Database(Value: String): iModelConexaoParametros;
begin
  Result := Self;
  FDatabase := Value;
end;

destructor TModelConexaoDBExpress.Destroy;
begin
  FConexao.Free;
  inherited;
end;

function TModelConexaoDBExpress.DriverID(Value: String): iModelConexaoParametros;
begin
  Result := Self;
  FDriverID := Value;
end;

function TModelConexaoDBExpress.EndConexao: TComponent;
begin
  Result := FConexao;
end;

function TModelConexaoDBExpress.EndParametros: iModelConexao;
begin
  Result := Self;
end;

procedure TModelConexaoDBExpress.LerParametros;
begin
  FConexao.Close;
  FConexao.DriverName := 'Firebird';
  FConexao.LibraryName := 'dbxfb.dll';
  FConexao.VendorLib := 'fbclient.dll';
  FConexao.GetDriverFunc := 'getSQLDriverINTERBASE';
  FConexao.Params.Values['Database'] := FDatabase;
  FConexao.Params.Values['User_Name'] :=FUserName;
  FConexao.Params.Values['Password'] := FPassword;
  FConexao.Params.Values['ServerCharSet'] := 'WIN1252'; // opcional, dependendo do charset do seu banco
  //FConexao.Params.Values['SQLDialect'] := '3';
  //FConexao.Params.Values['RoleName'] := 'RoleName'; // se aplicável, ou deixe em branco
  FConexao.Params.Values['HostName'] := FServer;
  FConexao.Params.Values['Port'] := IntToStr(FPorta);
end;

class function TModelConexaoDBExpress.New: iModelConexao;
begin
  Result := Self.Create;
end;

function TModelConexaoDBExpress.Parametros: iModelConexaoParametros;
begin
  Result := Self;
end;

function TModelConexaoDBExpress.Password(Value: String): iModelConexaoParametros;
begin
  Result := Self;
  FPassword := Value;
end;

function TModelConexaoDBExpress.Porta(Value: Integer): iModelConexaoParametros;
begin
  Result := Self;
  FPorta := Value;
end;

function TModelConexaoDBExpress.Server(Value: String): iModelConexaoParametros;
begin
  Result := Self;
  FServer := Value;
end;

function TModelConexaoDBExpress.UserName(Value: String): iModelConexaoParametros;
begin
  Result := Self;
  FUserName := Value;
end;

end.

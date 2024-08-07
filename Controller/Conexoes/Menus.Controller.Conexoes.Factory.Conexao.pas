unit Menus.Controller.Conexoes.Factory.Conexao;

interface

uses
  Menus.Controller.Conexoes.Interfaces,
  Menus.Model.Conexoes.Interfaces,
  Menus.Model.Conexoes.Factory.Conexao,
  System.SysUtils;

type
  TControllerConexoesFactoryConexao = class(TInterfacedObject, iControllerFactoryConexao)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerFactoryConexao;
    function Conexao: iModelConexao;
  end;

implementation

{ TControllerConexoesFactoryConexao }

function TControllerConexoesFactoryConexao.Conexao: iModelConexao;
begin
{$IFDEF FIREDAC}
  Result := TModelConexoesFactoryConexao.New
    .ConexaoFiredac
    .Parametros
    .Database('D:\Delphi\Estudo\MVC\MVCDelphiSystem\bd\base_mvc.fdb')
    .UserName('SYSDBA')
    .Password('masterkey')
    .DriverID('FB')
    .Server('localhost')
    .porta(3050)
    .EndParametros
    .Conectar;
{$ENDIF}
{$IFDEF ZEOS}
  Result := TModelConexoesFactoryConexao.New
    .ConexaoZeos
    .Parametros
    .Database('D:\Delphi\Estudo\MVC\MVCDelphiSystem\bd\base_mvc.fdb')
    .UserName('SYSDBA')
    .Password('masterkey')
    .DriverID('firebird')
    .Server('localhost')
    .porta(3050)
    .EndParametros
    .Conectar;
{$ENDIF}
{$IFDEF DBEXPRESS}
  Result := TModelConexoesFactoryConexao.New
    .ConexaoDBExpress
    .Parametros
    .Database('D:\Delphi\Estudo\MVC\MVCDelphiSystem\bd\base_mvc.fdb')
    .UserName('SYSDBA')
    .Password('masterkey')
    .DriverID('firebird')
    .Server('localhost')
    .porta(3050)
    .EndParametros
    .Conectar;
{$ENDIF}
end;

constructor TControllerConexoesFactoryConexao.Create;
begin

end;

destructor TControllerConexoesFactoryConexao.Destroy;
begin

  inherited;
end;

class function TControllerConexoesFactoryConexao.New: iControllerFactoryConexao;
begin
  Result := Self.Create;
end;

end.

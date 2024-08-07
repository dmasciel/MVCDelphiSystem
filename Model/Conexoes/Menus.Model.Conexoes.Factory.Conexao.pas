unit Menus.Model.Conexoes.Factory.Conexao;

interface

uses
{$IFDEF FIREDAC}
  Menus.Model.Conexoes.Firedac.Conexao,
{$ENDIF}
{$IFDEF ZEOS}
  Menus.Model.Conexoes.Zeos.Conexao,
{$ENDIF}
{$IFDEF DBEXPRESS}
  Menus.Model.Conexoes.DBExpress.Conexao,
{$ENDIF}
  Menus.Model.Conexoes.Interfaces;

type
  TModelConexoesFactoryConexao = class(TInterfacedObject, iModelFactoryConexao)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelFactoryConexao;
    function ConexaoFiredac: iModelConexao;
    function ConexaoZeos: iModelConexao;
    function ConexaoDBExpress: iModelConexao;
  end;

implementation

{ TModelConexoesFactoryConexao }

function TModelConexoesFactoryConexao.ConexaoFiredac: iModelConexao;
begin
{$IFDEF FIREDAC}
  Result := TModelConexaoFiredac.New;
{$ENDIF}
end;

function TModelConexoesFactoryConexao.ConexaoDBExpress: iModelConexao;
begin
{$IFDEF DBEXPRESS}
  Result := TModelConexaoDBExpress.New;
{$ENDIF}
end;

function TModelConexoesFactoryConexao.ConexaoZeos: iModelConexao;
begin
{$IFDEF ZEOS}
  Result := TModelConexaoZeos.New;
{$ENDIF}
end;

constructor TModelConexoesFactoryConexao.Create;
begin

end;

destructor TModelConexoesFactoryConexao.Destroy;
begin

  inherited;
end;

class function TModelConexoesFactoryConexao.New: iModelFactoryConexao;
begin
  Result := Self.Create;
end;

end.

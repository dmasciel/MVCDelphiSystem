unit Menus.Controller.Entity.Produtos;

interface

uses
  Menus.Controller.Entity.Interfaces,
  Menus.Model.Conexoes.Interfaces,
  Menus.Controller.Conexoes.Factory.Conexao,
  Menus.Controller.Conexoes.Factory.DataSet,
  Menus.Model.Entity.Interfaces,
  Menus.Model.Entity.Factory,
  Data.DB;

type
  TControllerEntityProduto = class(TInterfacedObject, iControllerEntity)
  private
    FConexao: iModelConexao;
    FDataSet: iModelDataSet;
    FEntity: iModelEntity;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerEntity;
    function Listar(aDataSource: TDataSource): iControllerEntity;
  end;

implementation

{ TControllerEntityProduto }

constructor TControllerEntityProduto.Create;
begin
  FConexao := TControllerConexoesFactoryConexao.New.Conexao;
  FDataSet := TControllerConexoesFactoryDataSet.New.DataSet(FConexao);
  FEntity := TModelEntityFactory.New.Produtos(FDataSet);
end;

destructor TControllerEntityProduto.Destroy;
begin

  inherited;
end;

function TControllerEntityProduto.Listar(
  aDataSource: TDataSource): iControllerEntity;
begin
  Result := Self;
  aDataSource.DataSet := TDataSet(FEntity.Listar);
end;

class function TControllerEntityProduto.New: iControllerEntity;
begin
  Result := Self.Create;
end;

end.

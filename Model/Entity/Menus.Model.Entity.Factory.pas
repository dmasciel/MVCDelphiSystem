unit Menus.Model.Entity.Factory;

interface

uses Menus.Model.Entity.Interfaces, Menus.Model.Conexoes.Interfaces;

type
  TModelEntityFactory = class(TInterfacedObject, iModelEntityFactory)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelEntityFactory;
    function Produtos(DataSet: iModelDataSet): iModelEntity;
    function Cliente(DataSet: iModelDataSet): iModelEntity;
  end;

implementation

{ TModelEntityFactory }

uses Menus.Model.Entity.Produto, Menus.Model.Entity.Cliente;

constructor TModelEntityFactory.Create;
begin

end;

destructor TModelEntityFactory.Destroy;
begin

  inherited;
end;

class function TModelEntityFactory.New: iModelEntityFactory;
begin
  Result := Self.Create;
end;

function TModelEntityFactory.Produtos(DataSet: iModelDataSet): iModelEntity;
begin
  Result := TModelEntityProduto.New(DataSet);
end;

function TModelEntityFactory.Cliente(DataSet: iModelDataSet): iModelEntity;
begin
  Result := TModelEntityCliente.New(DataSet);
end;
end.

unit Menus.Model.Entity.Produto;

interface

uses
  Menus.Model.Entity.Interfaces,
  System.Classes,
  Menus.Model.Conexoes.Interfaces;

type
  TModelEntityProduto = class(TInterfacedObject, iModelEntity)
  private
    FDataSet: iModelDataSet;
  public
    constructor Create(DataSet: iModelDataSet);
    destructor Destroy; override;
    class function New(DataSet: iModelDataSet): iModelEntity;
    function Listar: TComponent;
  end;

implementation

const
  FTABLENAME = 'PRODUTO';

{ TModelEntityProduto }

constructor TModelEntityProduto.Create(DataSet: iModelDataSet);
begin
  FDataSet := DataSet;
end;

destructor TModelEntityProduto.Destroy;
begin

  inherited;
end;

function TModelEntityProduto.Listar: TComponent;
begin
  Result := FDataSet.Open(FTABLENAME).EndDataSet;

end;

class function TModelEntityProduto.New(DataSet: iModelDataSet): iModelEntity;
begin
  Result := Self.Create(DataSet);
end;



end.

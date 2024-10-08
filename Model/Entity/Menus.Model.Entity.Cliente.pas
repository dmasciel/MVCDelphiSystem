unit Menus.Model.Entity.Cliente;

interface

uses
  Menus.Model.Entity.Interfaces,
  System.Classes,
  Menus.Model.Conexoes.Interfaces;

type
  TModelEntityCliente = class(TInterfacedObject, iModelEntity)
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
  FTABLENAME = 'CLIENTE';

{ TModelEntityCliente }

constructor TModelEntityCliente.Create(DataSet: iModelDataSet);
begin
  FDataSet := DataSet;
end;

destructor TModelEntityCliente.Destroy;
begin

  inherited;
end;

function TModelEntityCliente.Listar: TComponent;
begin
  Result := FDataSet.Open(FTABLENAME).EndDataSet;

end;

class function TModelEntityCliente.New(DataSet: iModelDataSet): iModelEntity;
begin
  Result := Self.Create(DataSet);
end;



end.

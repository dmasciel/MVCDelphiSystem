unit Menus.Model.Conexoes.DBExpress.DataSet;

interface

uses
  Menus.Model.Conexoes.Interfaces,
  Data.DBXFirebird,
  Data.FMTBcd,
  Data.SqlExpr,
  System.Classes;

type
  TModelConexoesDBExpressDataSet = class(TInterfacedObject, iModelDataSet)
  private
    FTable: TSQLTable;
  public
    constructor Create(Conexao: iModelConexao);
    destructor Destroy; override;
    class function New(Conexao: iModelConexao): iModelDataSet;
    function Open(aTable: String): iModelDataSet;
    function EndDataSet: TComponent;
  end;

implementation

{ TModelConexoesDBExpressDataSet }

constructor TModelConexoesDBExpressDataSet.Create(Conexao: iModelConexao);
begin
  FTable := TSQLTable.Create(nil);
  FTable.SQLConnection := (Conexao.EndConexao as TSQLConnection);
end;

destructor TModelConexoesDBExpressDataSet.Destroy;
begin
  FTable.Free;
  inherited;
end;

function TModelConexoesDBExpressDataSet.EndDataSet: TComponent;
begin
  Result := FTable;
end;

class function TModelConexoesDBExpressDataSet.New(Conexao: iModelConexao): iModelDataSet;
begin
  Result := Self.Create(Conexao);
end;

function TModelConexoesDBExpressDataSet.Open(aTable: String): iModelDataSet;
begin
  Result := Self;
  FTable.TableName := aTable;
  FTable.Open;
end;

end.

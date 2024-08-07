unit Menus.Model.Conexoes.Firedac.DataSet;

interface

uses
  Menus.Model.Conexoes.Interfaces,
  FireDAC.Comp.Client,
  System.Classes;

type
  TModelConexoesFiredacDataSet = class(TInterfacedObject, iModelDataSet)
  private
    FTable: TFDTable;
  public
    constructor Create(Conexao: iModelConexao);
    destructor Destroy; override;
    class function New(Conexao: iModelConexao): iModelDataSet;
    function Open(aTable: String): iModelDataSet;
    function EndDataSet: TComponent;
  end;

implementation

{ TModelConexoesFiredacDataSet }

constructor TModelConexoesFiredacDataSet.Create(Conexao: iModelConexao);
begin
  FTable := TFDTable.Create(nil);
  FTable.Connection := (Conexao.EndConexao as TFDConnection);
end;

destructor TModelConexoesFiredacDataSet.Destroy;
begin
  FTable.Free;
  inherited;
end;

function TModelConexoesFiredacDataSet.EndDataSet: TComponent;
begin
  Result := FTable;
end;

class function TModelConexoesFiredacDataSet.New(Conexao: iModelConexao): iModelDataSet;
begin
  Result := Self.Create(Conexao);
end;

function TModelConexoesFiredacDataSet.Open(aTable: String): iModelDataSet;
begin
  Result := Self;
  FTable.Open(aTable);
end;

end.

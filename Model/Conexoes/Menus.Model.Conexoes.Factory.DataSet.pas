unit Menus.Model.Conexoes.Factory.DataSet;

interface

uses
{$IFDEF FIREDAC}
  Menus.Model.Conexoes.Firedac.DataSet,
{$ENDIF}
{$IFDEF ZEOS}
  Menus.Model.Conexoes.Zeos.DataSet,
{$ENDIF}
{$IFDEF DBEXPRESS}
  Menus.Model.Conexoes.DBExpress.DataSet,
{$ENDIF}
  Menus.Model.Conexoes.Interfaces;

type
  TModelConexoesFactoryDataSet = class(TInterfacedObject, iModelFactoryDataSet)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelFactoryDataSet;
    function DataSetFiredac(Conexao: iModelConexao): iModelDataSet;
    function DataSetZeos(Conexao: iModelConexao) : iModelDataSet;
    function DataSetDBExpress(Conexao: iModelConexao) : iModelDataSet;
  end;

implementation

{ TModelConexoesFactoryDataSet }

constructor TModelConexoesFactoryDataSet.Create;
begin

end;

function TModelConexoesFactoryDataSet.DataSetFiredac(Conexao: iModelConexao): iModelDataSet;
begin
{$IFDEF FIREDAC}
  Result := TModelConexoesFiredacDataSet.New(Conexao);
{$ENDIF}
end;

function TModelConexoesFactoryDataSet.DataSetDBExpress(
  Conexao: iModelConexao): iModelDataSet;
begin
{$IFDEF DBEXPRESS}
  Result := TModelConexoesDBExpressDataSet.New(Conexao);
{$ENDIF}
end;

function TModelConexoesFactoryDataSet.DataSetZeos(
  Conexao: iModelConexao): iModelDataSet;
begin
{$IFDEF ZEOS}
  Result := TModelConexoesZeosDataSet.New(Conexao);
{$ENDIF}
end;

destructor TModelConexoesFactoryDataSet.Destroy;
begin

  inherited;
end;

class function TModelConexoesFactoryDataSet.New: iModelFactoryDataSet;
begin
  Result := Self.Create;
end;

end.

unit Menus.Model.Conexoes.Interfaces;

interface

uses
  System.Classes;

type
  iModelConexaoParametros = interface;

  iModelConexao = interface
    ['{A20040E8-1DBB-4000-89C4-C22F063F1C27}']
    function Conectar : iModelConexao;
    function EndConexao: TComponent;
    function Parametros: iModelConexaoParametros;
  end;

  iModelConexaoParametros = interface
    ['{C9F68957-B76A-4247-8189-EA40170679D9}']
    function Database(Value: String): iModelConexaoParametros;
    function UserName(Value: String): iModelConexaoParametros;
    function Password(Value: String): iModelConexaoParametros;
    function DriverID(Value: String): iModelConexaoParametros;
    function Server(Value: String): iModelConexaoParametros;
    function Porta(Value: Integer): iModelConexaoParametros;
    function EndParametros: iModelConexao;
  end;

  iModelDataSet = interface
    ['{D1EA0219-64FF-4BB5-8B91-5A7E7EAAACBB}']
    function Open(aTable: String): iModelDataSet;
    function EndDataSet: TComponent;
  end;

  iModelFactoryConexao = interface
    ['{591C6B1F-3542-43F3-8512-4CB57D7FC330}']
    function ConexaoFiredac: iModelConexao;
    function ConexaoZeos: iModelConexao;
    function ConexaoDBExpress: iModelConexao;
  end;

  iModelFactoryDataSet = interface
    ['{28CA9F1E-DFAE-4819-951C-44A8C23BA85A}']
    function DataSetFiredac(Conexao: iModelConexao) : iModelDataSet;
    function DataSetZeos(Conexao: iModelConexao) : iModelDataSet;
    function DataSetDBExpress(Conexao: iModelConexao) : iModelDataSet;
  end;

implementation

end.

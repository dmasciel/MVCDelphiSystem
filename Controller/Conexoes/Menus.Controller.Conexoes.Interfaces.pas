unit Menus.Controller.Conexoes.Interfaces;

interface

uses
  Menus.Model.Conexoes.Interfaces;

type
  iControllerFactoryConexao = interface
    ['{BCCF7450-BF95-4D74-A644-A3E97D1F9A80}']
    function Conexao: iModelConexao;
  end;

  iControllerFactoryDataSet = interface
    ['{F1BD5439-4F5B-4AB0-B1B9-A08CD354B08F}']
    function DataSet(Conexao: iModelConexao): iModelDataSet;
  end;

implementation

end.

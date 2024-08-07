unit Menus.Controller.Entity.Interfaces;

interface

uses
  Data.DB;

type
  iControllerEntity = interface
    ['{90EA1592-CAC0-48E1-9B48-F620564D1554}']
    function Listar(aDataSource: TDataSource): iControllerEntity;
  end;

  iControllerEntityFactory = interface
    ['{E1ACC974-CC27-4BB3-A1B4-F45C9FF3823A}']
    function Produto: iControllerEntity;
    function Cliente: iControllerEntity;
  end;

implementation

end.

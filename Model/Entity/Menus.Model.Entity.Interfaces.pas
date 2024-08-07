unit Menus.Model.Entity.Interfaces;

interface

uses
  System.Classes, Menus.Model.Conexoes.Interfaces;

type
  iModelEntity = interface
    ['{8C954479-B86C-465A-9DB6-5C4CBBC6EA54}']
    function Listar: TComponent;
  end;

  iModelEntityFactory = interface
    ['{3B70A4F8-5E02-4ADB-8133-331A11141B25}']
    function Produtos(DataSet: iModelDataSet): iModelEntity;
    function Cliente(DataSet: iModelDataSet): iModelEntity;
  end;

implementation

end.

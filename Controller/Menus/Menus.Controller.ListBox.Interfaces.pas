unit Menus.Controller.ListBox.Interfaces;

interface

uses
  System.Classes,
  FMX.Types;

type
  iControllerListBoxItensDefault = interface;
  iControllerListBoxDefault = interface;

  iControllerListBoxItemForm = interface
    ['{98A95092-B315-4F33-A42E-D91F62513FE1}']
    function Show: TFmxObject;
  end;

  iControllerListBoxMenu = interface
    ['{2CF13C60-F6C9-47B0-94C7-6A4384C666A9}']
    procedure Exibir;
  end;

  iControllerListBoxItensFactory = interface
    ['{86A5DE56-1890-4155-A0FF-A8D90AD5FC5E}']
    function Default: iControllerListBoxItensDefault;
    function Produto: iControllerListBoxItemForm;
    function Cliente: iControllerListBoxItemForm;
  end;

  iControllerListBoxFactory = interface
    ['{D7014524-D619-49EB-9C80-27F5D5274066}']
    function Default(Container: TComponent): iControllerListBoxDefault;
    function Principal(Container: TComponent): iControllerListBoxMenu;
    function Produto(Container: TComponent): iControllerListBoxMenu;
    function Cliente(Container: TComponent): iControllerListBoxMenu;
  end;

  iControllerListBoxItensDefault = interface
    ['{06066AFE-19C4-405E-8948-D57085A45B76}']
    function Name(Value: String): iControllerListBoxItensDefault;
    function Text(Value: String): iControllerListBoxItensDefault;
    function StyleLookup(Value: String): iControllerListBoxItensDefault;
    function onClick(Value: TNotifyEvent): iControllerListBoxItensDefault;
    function Item: TFmxObject;
  end;

  iControllerListBoxDefault = interface
    ['{D564B39E-693C-41F8-BD90-6AEF68EFF367}']
    function Name(Value: String): iControllerListBoxDefault;
    function Align(Value: TAlignLayout): iControllerListBoxDefault;
    function ItemHeight(Value: Integer): iControllerListBoxDefault;
    function AddItem(Value: TFmxObject): iControllerListBoxDefault;
    function Lista: TFmxObject;
    procedure Exibir;
  end;

implementation

end.

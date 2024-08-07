unit Menus.Controller.ListBox.Produto;

interface

uses
  Menus.Controller.ListBox.Interfaces,
  System.Classes;

type
  TControllerListBoxProduto = class(TInterfacedObject, iControllerListBoxMenu)
  private
    FContainer: TComponent;
  public
    constructor Create(Container: TComponent);
    destructor Destroy; override;
    class function New(Container: TComponent): iControllerListBoxMenu;
    procedure Exibir;
  end;

implementation

{ TControllerListBoxProduto }

uses
  Menus.Controller.ListBox.Itens.Factory,
  Menus.Controller.ListBox.Factory;

constructor TControllerListBoxProduto.Create(Container: TComponent);
begin
  FContainer := Container;
end;

destructor TControllerListBoxProduto.Destroy;
begin

  inherited;
end;

procedure TControllerListBoxProduto.Exibir;
begin
  TControllerListBoxFactory.New
    .Default(FContainer)
    .AddItem(TControllerListBoxItensFactory.New.Cliente.Show)
    .Exibir;
end;

class function TControllerListBoxProduto.New(
  Container: TComponent): iControllerListBoxMenu;
begin
  Result := Self.Create(Container);
end;

end.

unit Menus.Controller.ListBox.Principal;

interface

uses
  Menus.Controller.ListBox.Interfaces,
  System.Classes;

type
  TControllerListBoxPrincipal = class(TInterfacedObject, iControllerListBoxMenu)
  private
    FContainer: TComponent;
  public
    constructor Create(Container: TComponent);
    destructor Destroy; override;
    class function New(Container: TComponent): iControllerListBoxMenu;
    procedure Exibir;
  end;

implementation

{ TControllerListBoxPrincipal }

uses
  Menus.Controller.ListBox.Itens.Factory,
  Menus.Controller.ListBox.Factory;

constructor TControllerListBoxPrincipal.Create(Container: TComponent);
begin
  FContainer := Container;
end;

destructor TControllerListBoxPrincipal.Destroy;
begin

  inherited;
end;

procedure TControllerListBoxPrincipal.Exibir;
begin
  TControllerListBoxFactory.New
    .Default(FContainer)
    .AddItem(TControllerListBoxItensFactory.New.Produto.Show)
    .AddItem(TControllerListBoxItensFactory.New.Cliente.Show)
    .Exibir;
end;

class function TControllerListBoxPrincipal.New(
  Container: TComponent): iControllerListBoxMenu;
begin
  Result := Self.Create(Container);
end;

end.

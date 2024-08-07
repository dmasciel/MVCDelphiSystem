unit Menus.Controller.ListBox.Itens.Cliente;

interface

uses
  Menus.Controller.ListBox.Interfaces,
  FMX.Types;

type
  TControllerListBoxItensCliente = class(TInterfacedObject, iControllerListBoxItemForm)
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerListBoxItemForm;
    function Show: TFmxObject;
    procedure onClick(Sender: TObject);

  end;

implementation

{ TControllerListBoxItensCliente }

uses
  Menus.Controller.ListBox.Itens.Factory, Menus.Controller.Forms.Default;

constructor TControllerListBoxItensCliente.Create;
begin

end;

destructor TControllerListBoxItensCliente.Destroy;
begin
  inherited;
end;

class function TControllerListBoxItensCliente.New: iControllerListBoxItemForm;
begin
  Result := Self.Create;
end;

procedure TControllerListBoxItensCliente.onClick(Sender: TObject);
begin
  TControllerFormsDefault.CreateForm('TfrmCliente');
end;

function TControllerListBoxItensCliente.Show: TFmxObject;
begin
  Result := TControllerListBoxItensFactory.New
    .Default
    .Name('btnCliente')
    .Text('Cliente')
    .onClick(onClick)
    .Item;
end;

end.

unit Menus.View.Cliente;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.Layouts,
  FMX.Edit,
  System.Rtti,
  FMX.Grid.Style,
  FMX.ScrollBox,
  FMX.Grid,
  Data.DB,
  Data.Bind.EngExt,
  FMX.Bind.DBEngExt,
  FMX.Bind.Grid,
  System.Bindings.Outputs,
  FMX.Bind.Editors,
  Data.Bind.Components,
  Data.Bind.DBScope,
  Menus.Controller.Entity.Interfaces,
  Menus.Controller.Entity.Factory,
  Data.Bind.Grid;

type
  TfrmCliente = class(TForm)
    ToolBar1: TToolBar;
    Label1: TLabel;
    Layout1: TLayout;
    Layout2: TLayout;
    edCodigo: TEdit;
    edNome: TEdit;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnSalvar: TButton;
    btnNovo: TButton;
    StringGrid1: TStringGrid;
    DataSource1: TDataSource;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindSourceDB1: TBindSourceDB;
    procedure FormCreate(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    FEntity: iControllerEntity;
    FUpdatingData: Boolean;
    procedure preencherDados;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCliente: TfrmCliente;

implementation

{$R *.fmx}


uses
  Menus.Controller.ListBox.Factory;

procedure TfrmCliente.btnEditarClick(Sender: TObject);
begin
  DataSource1.DataSet.Edit;
end;

procedure TfrmCliente.btnExcluirClick(Sender: TObject);
begin
  DataSource1.DataSet.Delete;
end;

procedure TfrmCliente.btnNovoClick(Sender: TObject);
begin
  DataSource1.DataSet.Append;
end;

procedure TfrmCliente.btnSalvarClick(Sender: TObject);
begin
  preencherDados;
  DataSource1.DataSet.Post;
end;

procedure TfrmCliente.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  if not FUpdatingData then
  begin
      edCodigo.Text := DataSource1.DataSet.FieldByName('ID').AsString;
    edNome.Text := DataSource1.DataSet.FieldByName('NOME').AsString;
  end;
end;

procedure TfrmCliente.FormCreate(Sender: TObject);
begin
  TControllerListBoxFactory.New
    .Cliente(Layout1).Exibir;

  FEntity := TControllerEntityFactory.New.Cliente;
  FEntity.Listar(DataSource1);
end;

procedure TfrmCliente.preencherDados;
begin
  // Desative o evento DataChange temporariamente
  FUpdatingData := True;
  try
    DataSource1.DataSet.FieldByName('ID').Value := edCodigo.Text;
    DataSource1.DataSet.FieldByName('NOME').Value := edNome.Text;
  finally
    // Reative o evento DataChange
      FUpdatingData := False;
  end;
end;

initialization

RegisterFmxClasses([TfrmCliente]);

end.

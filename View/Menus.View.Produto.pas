unit Menus.View.Produto;

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
  Data.Bind.Grid,
  Data.Bind.DBScope,
  Menus.Controller.Entity.Interfaces,
  Menus.Controller.Entity.Factory,
  FMX.Edit;

type
  TfrmProduto = class(TForm)
    ToolBar1: TToolBar;
    Label1: TLabel;
    Layout1: TLayout;
    DataSource1: TDataSource;
    StringGrid1: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Layout2: TLayout;
    edCodigo: TEdit;
    edNome: TEdit;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnSalvar: TButton;
    btnNovo: TButton;
    procedure FormCreate(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    FEntity: iControllerEntity;
    FUpdatingData: Boolean;
    procedure preencherDados;
  public
    { Public declarations }
  end;

var
  frmProduto: TfrmProduto;

implementation

{$R *.fmx}


uses
  Menus.Controller.ListBox.Factory;

procedure TfrmProduto.btnEditarClick(Sender: TObject);
begin
  DataSource1.DataSet.Edit;
end;

procedure TfrmProduto.btnExcluirClick(Sender: TObject);
begin
  DataSource1.DataSet.Delete;
end;

procedure TfrmProduto.btnNovoClick(Sender: TObject);
begin
  DataSource1.DataSet.Append;
end;

procedure TfrmProduto.btnSalvarClick(Sender: TObject);
begin
  preencherDados;
  DataSource1.DataSet.Post;
end;

procedure TfrmProduto.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  if not FUpdatingData then
  begin
      edCodigo.Text := DataSource1.DataSet.FieldByName('ID').AsString;
    edNome.Text := DataSource1.DataSet.FieldByName('DESCRICAO').AsString;
  end;
end;

procedure TfrmProduto.FormCreate(Sender: TObject);
begin
  TControllerListBoxFactory.New
    .Produto(Layout1).Exibir;
  FEntity := TControllerEntityFactory.New.Produto;
  FEntity.Listar(DataSource1);
end;

procedure TfrmProduto.preencherDados;
begin
  // Desative o evento DataChange temporariamente
  FUpdatingData := True;
  try
    DataSource1.DataSet.FieldByName('ID').Value := edCodigo.Text;
    DataSource1.DataSet.FieldByName('DESCRICAO').Value := edNome.Text;
  finally
    // Reative o evento DataChange
      FUpdatingData := False;
  end;
end;

initialization

RegisterFmxClasses([TfrmProduto]);

end.

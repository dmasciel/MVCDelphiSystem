unit Menus.View.Principal;

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
  FMX.Layouts,
  FMX.Controls.Presentation,
  FMX.StdCtrls, Data.FMTBcd, Data.DB, Data.SqlExpr;

type
  TfrmPrincipal = class(TForm)
    Layout1: TLayout;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}


uses
  Menus.Controller.ListBox.Factory;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
{$IFDEF FIREDAC}
  Label1.Text := 'Conectado via Firedac';
{$ENDIF}
{$IFDEF ZEOS}
  Label1.Text := 'Conectado via Zeos';
{$ENDIF}
{$IFDEF DBEXPRESS}
  Label1.Text := 'Conectado via DBExpress';
{$ENDIF}
  TControllerListBoxFactory.New
    .Principal(Layout1)
    .Exibir;
end;

end.

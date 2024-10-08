unit Menus.Model.Conexoes.Firedac.Conexao;

interface

uses
  Menus.Model.Conexoes.Interfaces,
  System.Classes,
  System.SysUtils,
  FMX.Layouts,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.FMXUI.Wait,
  FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase,
  FireDAC.Phys.FB,
  FireDAC.Comp.UI,
  FireDAC.DApt;

type
  TModelConexaoFiredac = class(TInterfacedObject, iModelConexao, iModelConexaoParametros)
  private
    FConexao: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDatabase: String;
    FUserName: String;
    FPassword: String;
    FDriverID: String;
    FServer: String;
    FPorta: Integer;
    Procedure LerParametros;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelConexao;
    function EndConexao: TComponent;
    function Parametros: iModelConexaoParametros;
    function Database(Value: String): iModelConexaoParametros;
    function UserName(Value: String): iModelConexaoParametros;
    function Password(Value: String): iModelConexaoParametros;
    function DriverID(Value: String): iModelConexaoParametros;
    function Server(Value: String): iModelConexaoParametros;
    function Porta(Value: Integer): iModelConexaoParametros;
    function EndParametros: iModelConexao;
    function Conectar: iModelConexao;
  end;

implementation

{ TModelConexaoFiredac }

function TModelConexaoFiredac.Conectar: iModelConexao;
begin
  Result := Self;
  LerParametros;
  FConexao.Connected := true;
end;

constructor TModelConexaoFiredac.Create;
begin
  FConexao := TFDConnection.Create(nil);
  FDGUIxWaitCursor1 := TFDGUIxWaitCursor.Create(nil);
  FDPhysFBDriverLink1 := TFDPhysFBDriverLink.Create(nil);
end;

function TModelConexaoFiredac.Database(Value: String): iModelConexaoParametros;
begin
  Result := Self;
  FDatabase := Value;
end;

destructor TModelConexaoFiredac.Destroy;
begin
  FConexao.Free;
  FDGUIxWaitCursor1.Free;
  FDPhysFBDriverLink1.Free;
  inherited;
end;

function TModelConexaoFiredac.DriverID(Value: String): iModelConexaoParametros;
begin
  Result := Self;
  FDriverID := Value;
end;

function TModelConexaoFiredac.EndConexao: TComponent;
begin
  Result := FConexao;
end;

function TModelConexaoFiredac.EndParametros: iModelConexao;
begin
  Result := Self;
end;

procedure TModelConexaoFiredac.LerParametros;
begin
  FConexao.Params.Database := FDatabase;
  FConexao.Params.UserName := FUserName;
  FConexao.Params.Password := FPassword;
  FConexao.Params.DriverID := FDriverID;
  FConexao.Params.Add('Server=' + FServer);
  FConexao.Params.Add('Port=' + IntToStr(FPorta));
end;

class function TModelConexaoFiredac.New: iModelConexao;
begin
  Result := Self.Create;
end;

function TModelConexaoFiredac.Parametros: iModelConexaoParametros;
begin
  Result := Self;
end;

function TModelConexaoFiredac.Password(Value: String): iModelConexaoParametros;
begin
  Result := Self;
  FPassword := Value;
end;

function TModelConexaoFiredac.Porta(Value: Integer): iModelConexaoParametros;
begin
  Result := Self;
  FPorta := Value;
end;

function TModelConexaoFiredac.Server(Value: String): iModelConexaoParametros;
begin
  Result := Self;
  FServer := Value;
end;

function TModelConexaoFiredac.UserName(Value: String): iModelConexaoParametros;
begin
  Result := Self;
  FUserName := Value;
end;

end.

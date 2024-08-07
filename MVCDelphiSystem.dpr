program MVCDelphiSystem;

uses
  System.StartUpCopy,
  FMX.Forms,
  Menus.View.Principal in 'View\Menus.View.Principal.pas' {frmPrincipal} ,
  Menus.Controller.ListBox.Interfaces in 'Controller\Menus\Menus.Controller.ListBox.Interfaces.pas',
  Menus.Controller.ListBox.Itens.Factory in 'Controller\Menus\Menus.Controller.ListBox.Itens.Factory.pas',
  Menus.Controller.ListBox.Factory in 'Controller\Menus\Menus.Controller.ListBox.Factory.pas',
  Menus.Controller.ListBox.Itens.Default in 'Controller\Menus\Menus.Controller.ListBox.Itens.Default.pas',
  Menus.Controller.ListBox.Default in 'Controller\Menus\Menus.Controller.ListBox.Default.pas',
  Menus.Controller.ListBox.Itens.Produto in 'Controller\Menus\Menus.Controller.ListBox.Itens.Produto.pas',
  Menus.Controller.ListBox.Principal in 'Controller\Menus\Menus.Controller.ListBox.Principal.pas',
  Menus.Controller.ListBox.Itens.Cliente in 'Controller\Menus\Menus.Controller.ListBox.Itens.Cliente.pas',
  Menus.View.Produto in 'View\Menus.View.Produto.pas' {frmProduto} ,
  Menus.View.Cliente in 'View\Menus.View.Cliente.pas' {frmCliente} ,
  Menus.Controller.ListBox.Produto in 'Controller\Menus\Menus.Controller.ListBox.Produto.pas',
  Menus.Controller.ListBox.Cliente in 'Controller\Menus\Menus.Controller.ListBox.Cliente.pas',
  Menus.Controller.Forms.Default in 'Controller\Forms\Menus.Controller.Forms.Default.pas',
  Menus.Model.Conexoes.Interfaces in 'Model\Conexoes\Menus.Model.Conexoes.Interfaces.pas',
//{$IFDEF FIREDAC}
  Menus.Model.Conexoes.Firedac.Conexao in 'Model\Conexoes\Firedac\Menus.Model.Conexoes.Firedac.Conexao.pas',
  Menus.Model.Conexoes.Firedac.DataSet in 'Model\Conexoes\Firedac\Menus.Model.Conexoes.Firedac.DataSet.pas',
//{$ENDIF }
//{$IFDEF ZEOS}
  Menus.Model.Conexoes.Zeos.Conexao in 'Model\Conexoes\Zeos\Menus.Model.Conexoes.Zeos.Conexao.pas',
  Menus.Model.Conexoes.Zeos.DataSet in 'Model\Conexoes\Zeos\Menus.Model.Conexoes.Zeos.DataSet.pas',
//{$ENDIF }
//{$IFDEF DBEXPRESS}
  Menus.Model.Conexoes.DBExpress.Conexao in 'Model\Conexoes\dbExpress\Menus.Model.Conexoes.DBExpress.Conexao.pas',
  Menus.Model.Conexoes.DBExpress.DataSet in 'Model\Conexoes\dbExpress\Menus.Model.Conexoes.DBExpress.DataSet.pas',
//{$ENDIF }
  Menus.Model.Conexoes.Factory.Conexao in 'Model\Conexoes\Menus.Model.Conexoes.Factory.Conexao.pas',
  Menus.Model.Conexoes.Factory.DataSet in 'Model\Conexoes\Menus.Model.Conexoes.Factory.DataSet.pas',
  Menus.Model.Entity.Interfaces in 'Model\Entity\Menus.Model.Entity.Interfaces.pas',
  Menus.Model.Entity.Produto in 'Model\Entity\Menus.Model.Entity.Produto.pas',
  Menus.Model.Entity.Factory in 'Model\Entity\Menus.Model.Entity.Factory.pas',
  Menus.Controller.Conexoes.Interfaces in 'Controller\Conexoes\Menus.Controller.Conexoes.Interfaces.pas',
  Menus.Controller.Conexoes.Factory.Conexao in 'Controller\Conexoes\Menus.Controller.Conexoes.Factory.Conexao.pas',
  Menus.Controller.Conexoes.Factory.DataSet in 'Controller\Conexoes\Menus.Controller.Conexoes.Factory.DataSet.pas',
  Menus.Controller.Entity.Interfaces in 'Controller\Entity\Menus.Controller.Entity.Interfaces.pas',
  Menus.Controller.Entity.Produtos in 'Controller\Entity\Menus.Controller.Entity.Produtos.pas',
  Menus.Controller.Entity.Factory in 'Controller\Entity\Menus.Controller.Entity.Factory.pas',
  Menus.Controller.Entity.Cliente in 'Controller\Entity\Menus.Controller.Entity.Cliente.pas',
  Menus.Model.Entity.Cliente in 'Model\Entity\Menus.Model.Entity.Cliente.pas';

{$R *.res}


begin
    Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;

end.

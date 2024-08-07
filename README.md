## MVC Delphi System

Este projeto é um sistema MVC (Model-View-Controller) desenvolvido em Delphi com FireMonkey, com o objetivo de facilitar a manutenção do CRUD através da padronização de menus e botões especializados em suas classes, seguindo o princípio da responsabilidade única. Oferece suporte a três opções de conexões: FireDAC, Zeos e dbExpress, permitindo que qualquer uma delas seja utilizada conforme as diretrizes de compilação condicional.

### Features

* **Arquitetura MVC:** Separação clara entre Model, View e Controller.
* **FireMonkey:** Desenvolvido utilizando o framework FireMonkey.
* **Padronização:** Facilita a manutenção do CRUD com padronização de menus e botões, especializados em suas classes.
* **Princípio da Responsabilidade Única:** Cada classe possui uma única responsabilidade.
* **Formulários Abstratos:** Abstração de formulários de cadastro de produtos e clientes.
* **ListBox Reutilizável:** Utilização de um ListBox para facilitar a reutilização do código.
* **Suporte a Múltiplas Conexões:** Compatível com FireDAC, Zeos e dbExpress, ignorando units não instaladas através de diretrizes de compilação condicional.

### Pré-requisitos

* Delphi instalado (versão recomendada: Delphi 10.4 Sydney ou superior)
* Firebird 5 instalado

### Instalação

1. Clone o repositório para o seu ambiente local:
   ```bash
   git clone https://github.com/seu-usuario/nome-do-repositorio.git
   ```
2. Abra o Delphi e carregue o projeto MVCDelphiSystem.dproj.

### Configuração

#### Base de Dados

A base de dados foi criada para o Firebird 5:

o Script está em bd\SCRIPT_SQL.sql

* Database: D:\MVC\bd\base_mvc.fdb
* UserName: SYSDBA
* Password: masterkey
* DriverID: FB
* Server: localhost
* Porta: 3050

#### Selecionando a Conexão

No arquivo Config.pas, selecione a conexão desejada utilizando as diretrizes de compilação condicional:

```delphi
{FIREDAC}  // Para utilizar FireDAC
{ZEOS}  // Para utilizar Zeos
{DBEXPRESS}  // Para utilizar dbExpress
```

### Estrutura do Projeto

#### View

* **Menus.View.Principal:** Formulário principal.
* **Menus.View.Produto:** Formulário de cadastro de produtos.
* **Menus.View.Cliente:** Formulário de cadastro de clientes.

#### Controller

* **Menus.Controller.ListBox.Interfaces:** Interfaces para o ListBox.
* **Menus.Controller.ListBox.Itens.Factory:** Fábrica de itens do ListBox.
* **Menus.Controller.ListBox.Factory:** Fábrica do ListBox.
* **Menus.Controller.ListBox.Itens.Default:** Implementação padrão de itens do ListBox.
* **Menus.Controller.ListBox.Default:** Implementação padrão do ListBox.
* **Menus.Controller.ListBox.Itens.Produto:** Itens do ListBox específicos para produtos.
* **Menus.Controller.ListBox.Principal:** Controlador principal do ListBox.
* **Menus.Controller.ListBox.Itens.Cliente:** Itens do ListBox específicos para clientes.
* **Menus.Controller.Forms.Default:** Implementação padrão dos formulários.
* **Menus.Controller.Conexoes.Interfaces:** Interfaces das conexões.
* **Menus.Controller.Conexoes.Factory.Conexao:** Fábrica de conexões.
* **Menus.Controller.Conexoes.Factory.DataSet:** Fábrica de datasets.
* **Menus.Controller.Entity.Interfaces:** Interfaces das entidades.
* **Menus.Controller.Entity.Produtos:** Controlador de produtos.
* **Menus.Controller.Entity.Factory:** Fábrica de entidades.
* **Menus.Controller.Entity.Cliente:** Controlador de clientes.

#### Model

* **Menus.Model.Conexoes.Interfaces:** Interfaces das conexões.
* **Menus.Model.Conexoes.Firedac.Conexao:** Conexão FireDAC (condicional).
* **Menus.Model.Conexoes.Firedac.DataSet:** DataSet FireDAC (condicional).
* **Menus.Model.Conexoes.Zeos.Conexao:** Conexão Zeos (condicional).
* **Menus.Model.Conexoes.DBExpress.Conexao:** Conexão dbExpress (condicional).
* **Menus.Model.Conexoes.Factory.Conexao:** Fábrica de conexões.
* **Menus.Model.Conexoes.Factory.DataSet:** Fábrica de datasets.
* **Menus.Model.Entity.Interfaces:** Interfaces das entidades.
* **Menus.Model.Entity.Produto:** Entidade Produto.
* **Menus.Model.Entity.Factory:** Fábrica de entidades.
* **Menus.Model.Entity.Cliente:** Entidade Cliente.

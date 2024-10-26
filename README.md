# CadastroEE - Sistema de Cadastro de Produtos com Jakarta EE

Este projeto é uma aplicação corporativa Java utilizando Jakarta EE e SQL Server para realizar o cadastro de produtos. 

A aplicação foi desenvolvida com NetBeans e utiliza GlassFish como servidor de aplicação.

O [relatório de práticas](https://github.com/user-attachments/files/17532160/projeto4.mundo3.pdf) foi confeccionado em formato PDF e produzido em conjunto com o desenvolvimento do projeto.

## Pré-requisitos

- **NetBeans** com suporte a Jakarta EE
- **GlassFish Server** 6.2.1 ou superior
- **Microsoft SQL Server**
- Driver JDBC do SQL Server ([Download](https://learn.microsoft.com/pt-br/sql/connect/jdbc/download-microsoft-jdbc-driver-for-sql-server?view=sql-server-ver16))
- Framework **Bootstrap** para melhorar o design das interfaces

## Estrutura do Projeto

O projeto é dividido em três módulos:

1. **CadastroEE** (módulo principal)
2. **CadastroEE-ejb** (encapsula lógica de negócio e persistência)
3. **CadastroEE-war** (projeto web)

## Configuração do Ambiente

### 1. Configuração do Driver JDBC e Pool de Conexões

1. **Adicionar Driver JDBC**:
   - Adicione o driver `mssql-jdbc-12.2.0.jre8.jar` no NetBeans na aba de serviços.
   - Defina uma nova conexão usando:
     ```
     jdbc:sqlserver://localhost:1433;databaseName=nome_do_banco_de_dados;encrypt=true;trustServerCertificate=true;
     ```
   - Teste a conexão.

2. **Configurar Pool de Conexões no GlassFish**:
   - No prompt `asadmin`, crie o pool com:
     ```shell
     create-jdbc-connection-pool --datasourceclassname=com.microsoft.sqlserver.jdbc.SQLServerDataSource --restype=javax.sql.DataSource --property driverClassName=com.microsoft.sqlserver.jdbc.SQLServerDriver:portNumber=1433:password=sua_senha:user=seu_user:serverName=localhost:databaseName=nome_do_banco_de_dados:trustServerCertificate=true SQLServerPool
     ```
   - Teste o pool com:
     ```shell
     ping-connection-pool SQLServerPool
     ```
   - Crie o recurso JDBC:
     ```shell
     create-jdbc-resource --connectionpoolid SQLServerPool jdbc/Loja
     ```

## Estrutura do Banco de Dados

A aplicação utiliza o banco de dados `Loja`, configurado no SQL Server com as seguintes tabelas:

- **Produto**: Contém informações sobre os produtos cadastrados, como `idProduto`, `nome`, `quantidade`, e `precoVenda`.

## Interface do Usuário

1. **ProdutoLista.jsp**:
   - Exibe uma lista de produtos com opções para incluir, alterar e excluir.
2. **ProdutoDados.jsp**:
   - Permite o cadastro e edição de produtos.

### Exemplo de URL

- Listar produtos:
  ```
  http://localhost:8080/CadastroEE-war/ServletProdutoFC?acao=listar
  ```

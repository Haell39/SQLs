-- Criação do banco de dados
--create database ComércioEletrônicoTest;

-- Criação da tabela cliente com suas colunas e restrições
--create table cliente(
--Id_cliente int not null,           -- Identificador único do cliente, não pode ser nulo
--Nome varchar(50) not null,          -- Nome do cliente, máximo 50 caracteres, não pode ser nulo
--CPF char(11)  unique not null,      -- CPF do cliente, 11 caracteres, deve ser único e não pode ser nulo
--Email varchar(50) unique not null,  -- Email do cliente, máximo 50 caracteres, deve ser único e não pode ser nulo
--Endereco varchar(50) not null,      -- Endereço do cliente, máximo 50 caracteres, não pode ser nulo
--primary key(Id_cliente)             -- Define Id_cliente como chave primária
--);

-- Inserção de dados na tabela cliente
--insert into cliente 
--(Id_cliente, Nome, CPF, Email, Endereco)
--values
--(100 , 'Marcelo Azevêdo da Silva'    , '32145698764' , 'marceloazvd@email.com'  , 'Pernambuco'),
-- ... (outros clientes)

-- Criação da tabela NFC (Nota Fiscal de Compra)
--create table NFC(
--Id_NFC int not null,                  -- Identificador único da nota fiscal
--Id_cliente int not null,               -- Identificador do cliente que fez a compra
--DataPedido date not null,              -- Data do pedido
--Descricao varchar(100),                -- Descrição da compra
--primary key(Id_NFC),                   -- Define Id_NFC como chave primária
--foreign key(Id_cliente) references cliente(Id_cliente)  -- Chave estrangeira ligando à tabela cliente
--);

-- Inserção de dados na tabela NFC
--insert into NFC
--(Id_NFC, Id_Cliente, DataPedido, Descricao)
--values
--(400 , 100 , '20/03/2024' , 'Compra de um iPhone 15 feita por Marcelo Azevedo da Silva'), 
-- ... (outros registros de compra)

-- Criação da tabela pagamento
--create table pagamento(
--Cd_Pagamento int not null,             -- Código único de pagamento
--Id_NFC int not null,                   -- Identificador da nota fiscal
--Data date not null,                    -- Data do pagamento
--Valor money not null check (Valor >= 0),  -- Valor do pagamento (deve ser maior ou igual a zero)
--primary key(Cd_Pagamento),              -- Define Cd_Pagamento como chave primária
--foreign key(Id_NFC) references NFC(Id_NFC)  -- Chave estrangeira ligando à tabela NFC
--);

-- Inserção de dados na tabela pagamento
--insert into pagamento (Cd_Pagamento, Id_NFC, Data, Valor)
--values
--(50 , 400 , '21/03/2024' , 5600.00),                  
-- ... (outros registros de pagamento)

-- Criação da tabela pix
--create table pix(
--Id_pix int not null,                   -- Identificador único do pagamento PIX
--Cd_Pagamento int not null,             -- Código de pagamento
--Nome varchar(50) not null,             -- Nome do titular da conta PIX
--Chave varchar(50) not null,            -- Chave PIX
--primary key(Id_pix),                   -- Define Id_pix como chave primária
--foreign key(Cd_Pagamento) references pagamento(Cd_Pagamento)  -- Chave estrangeira ligando à tabela pagamento
--);

-- Inserção de dados na tabela pix
--insert into pix (Id_pix, Cd_Pagamento, Nome, Chave)
--values
--(60 , 50 , 'Marcelo Azevêdo da Silva'    , '321.456.987-64'),
-- ... (outros registros PIX)

-- Criação da tabela cartao
--create table cartao(
--Id_Cartao int not null,                -- Identificador único do cartão
--Cd_Pagamento int not null,             -- Código de pagamento
--Nr_Cartao varchar(16) not null check (len(Nr_Cartao) = 16),  -- Número do cartão (exatamente 16 dígitos)
--Cd_seguranca char(3) not null check (len(Cd_seguranca) = 3),  -- Código de segurança (exatamente 3 dígitos)
--Nome varchar(50) not null,             -- Nome do titular do cartão
--Validade date not null,                -- Data de validade do cartão
--Nr_Parcela int not null default 1,     -- Número de parcelas (padrão 1)
--primary key(Id_Cartao),                -- Define Id_Cartao como chave primária
--foreign key(Cd_Pagamento) references pagamento(Cd_Pagamento)  -- Chave estrangeira ligando à tabela pagamento
--);

-- Inserção de dados na tabela cartao
--insert into cartao (Id_Cartao, Cd_Pagamento, Nr_Cartao, Cd_seguranca, Nome, Validade, Nr_Parcela)
--values
--(70 , 50 , '3221213232433325' , '213' , 'Marcelo A. da Silva'      , '10/05/2027', 7), 
-- ... (outros registros de cartão)

-- Criação da tabela boleto
--create table boleto(
--Id_boleto int not null,                -- Identificador único do boleto
--Cd_Pagamento int not null,             -- Código de pagamento
--Cd_digitavel char(47) not null,        -- Código digitável do boleto
--primary key(Id_boleto),                -- Define Id_boleto como chave primária
--foreign key(Cd_Pagamento) references pagamento(Cd_Pagamento)  -- Chave estrangeira ligando à tabela pagamento
--);

-- Inserção de dados na tabela boleto
--insert into boleto (Id_boleto, Cd_Pagamento, Cd_Digitavel)
--values
--(80 , 50 , '31415926535897932384626433832795028841971693993'),
-- ... (outros registros de boleto)

-- Criação da tabela Categoria
--create table Categoria(
--Cd_Categoria int not null,             -- Código único da categoria
--Descricao varchar(50),                 -- Descrição da categoria
--primary key(Cd_Categoria)              -- Define Cd_Categoria como chave primária
--);

-- Inserção de dados na tabela Categoria
--insert into Categoria (Cd_Categoria, Descricao)
--values
--(20 , 'Eletrônicos'),
-- ... (outras categorias)

-- Criação da tabela Produto
--create table Produto(
--Id_Produto int not null,               -- Identificador único do produto
--Cd_Categoria int not null,             -- Código da categoria do produto
--Nome varchar(50) not null,             -- Nome do produto
--Descricao varchar(100),                -- Descrição do produto
--primary key(Id_Produto),               -- Define Id_Produto como chave primária
--foreign key(Cd_Categoria) references Categoria(Cd_Categoria)  -- Chave estrangeira ligando à tabela Categoria
--);

-- Inserção de dados na tabela Produto
--insert into produto (Id_Produto, Cd_Categoria, Nome, Descricao)
--values
--(30 , 20 , 'iPhone'             , ' Apple iPhone 15 com (128 GB)-Branco'),
-- ... (outros produtos)

-- Criação da tabela Fornecedor
--create table Fornecedor(
--Id_Fornecedor int not null,            -- Identificador único do fornecedor
--CNPJ char(14) unique not null,         -- CNPJ do fornecedor (único)
--Nome varchar(50) not null,             -- Nome do fornecedor
--Telefone char(11) unique not null,     -- Telefone do fornecedor (único)
--Endereco varchar(50) not null,         -- Endereço do fornecedor
--Email varchar(50) unique not null,     -- Email do fornecedor (único)
--primary key(Id_Fornecedor)             -- Define Id_Fornecedor como chave primária
--);

-- Inserção de dados na tabela Fornecedor
--insert into Fornecedor (Id_Fornecedor, CNPJ, Nome, Telefone, Endereco, Email)
--values
--(90 , '12345678000190' , 'Apple Store'        , '987654471' , 'São Paulo'      , 'apple.store@email.com'), 
-- ... (outros fornecedores)

-- Alterações posteriores na estrutura da tabela NFC
--------------------------------------------------------
-- Remover coluna de produto (se existir)
--SELECT COLUMN_NAME
--FROM INFORMATION_SCHEMA.COLUMNS
--WHERE TABLE_NAME = 'NFC';

-- Adicionar coluna Id_Produto à tabela NFC
--ALTER TABLE NFC DROP COLUMN Id_Produto;
--ALTER TABLE NFC
--ADD Id_Produto INT NULL;

-- Adicionar chave estrangeira para a tabela Produto
--ALTER TABLE NFC
--ADD CONSTRAINT FK_NFC_Produto FOREIGN KEY (Id_Produto) REFERENCES Produto(Id_Produto);

-- Atualizar os produtos correspondentes para os pedidos existentes
--UPDATE NFC SET Id_Produto = 30 WHERE Id_NFC = 400; -- iPhone
-- ... (atualizações para outros produtos)

--------------------------------------------------------
-- Consultas de exemplo para verificar os dados das tabelas
--select * from cliente
--select * from NFC
--select * from pagamento
--select * from pix
--select * from cartao
--select * from boleto
--select * from Categoria
--select * from Produto
--select * from Fornecedor
----------------------------------------------------------

-- Consulta para mostrar o total de compras e valor gasto por cliente
--SELECT 
--    c.Nome AS "Nome do Cliente", 
--    COUNT(n.Id_NFC) AS "Total de Compras", 
--    SUM(p.Valor) AS "Total Gasto"
--FROM 
--    cliente AS c
--JOIN 
--    NFC AS n ON c.Id_cliente = n.Id_cliente
--JOIN 
--    pagamento AS p ON n.Id_NFC = p.Id_NFC
--GROUP BY 
--    c.Nome;
----------------------------------------------------------

-- Consulta para calcular estatísticas de gastos por cliente
--SELECT 
--    c.Nome AS "Nome do Cliente", 
--    ROUND(AVG(p.Valor), 1) AS "Valor Médio Gasto", 
--    MAX(p.Valor) AS "Maior Valor Gasto", 
--    MIN(p.Valor) AS "Menor Valor Gasto"
--FROM 
--    cliente AS c
--JOIN 
--    NFC AS n ON c.Id_cliente = n.Id_cliente
--JOIN 
--    pagamento AS p ON n.Id_NFC = p.Id_NFC
--GROUP BY 
--    c.Nome;
----------------------------------------------------------

-- Consulta para calcular o valor total gasto por todos os clientes
--SELECT 
--    SUM(p.Valor) AS "Valor Total Gasto por Todos os Clientes"
--FROM 
--    pagamento AS p;
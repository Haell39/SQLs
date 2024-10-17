Vamos para o **tópico 4: Comandos SQL**, abordando cada uma das categorias de comandos SQL com explicações detalhadas e exemplos práticos para que você possa testar e entender a funcionalidade de cada um. Os principais tipos de comandos SQL são:

- **DDL (Data Definition Language)** – Definição de dados.
- **DML (Data Manipulation Language)** – Manipulação de dados.
- **DCL (Data Control Language)** – Controle de acesso.
- **DQL (Data Query Language)** – Consultas de dados.
- **DTL (Data Transaction Language)** – Transações de dados.

### 1. **DDL – Data Definition Language (Linguagem de Definição de Dados)**

Os comandos **DDL** são usados para definir e modificar a estrutura dos objetos de banco de dados, como tabelas, índices e visões (views). Aqui estão os principais comandos DDL:

#### a) **CREATE**: Cria novos objetos no banco de dados (tabelas, bancos, índices, etc.).
- **Exemplo**: Criar um banco de dados e uma tabela.

```sql
CREATE DATABASE MeuBanco;
USE MeuBanco;

CREATE TABLE Clientes (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    CPF CHAR(11),
    Email VARCHAR(100)
);
```

#### b) **ALTER**: Altera a estrutura de um objeto existente, como adicionar ou modificar colunas em uma tabela.
- **Exemplo**: Adicionar uma coluna "Endereço" à tabela "Clientes".

```sql
ALTER TABLE Clientes
ADD Endereco VARCHAR(200);
```

- **Exemplo**: Modificar o tipo de dados da coluna "CPF".

```sql
ALTER TABLE Clientes
ALTER COLUMN CPF CHAR(14);
```

#### c) **DROP**: Remove completamente objetos do banco de dados, como tabelas ou índices.
- **Exemplo**: Excluir a tabela "Clientes".

```sql
DROP TABLE Clientes;
```

#### d) **TRUNCATE**: Remove todos os registros de uma tabela, mas mantém a estrutura da tabela intacta.
- **Exemplo**: Apagar todos os dados da tabela "Clientes".

```sql
TRUNCATE TABLE Clientes;
```

#### e) **RENAME**: Renomeia um objeto no banco de dados.
- **Exemplo**: Renomear a tabela "Clientes" para "ClientesVIP".

```sql
ALTER TABLE Clientes RENAME TO ClientesVIP;
```

---

### 2. **DML – Data Manipulation Language (Linguagem de Manipulação de Dados)**

Os comandos **DML** são usados para manipular dados dentro de tabelas. São utilizados para inserir, atualizar, excluir e consultar dados.

#### a) **INSERT**: Insere novos registros (linhas) em uma tabela.
- **Exemplo**: Inserir dados na tabela "Clientes".

```sql
INSERT INTO Clientes (ID, Nome, CPF, Email)
VALUES (1, 'João Silva', '12345678900', 'joao@example.com');
```

#### b) **UPDATE**: Atualiza os dados de registros existentes.
- **Exemplo**: Atualizar o endereço de um cliente.

```sql
UPDATE Clientes
SET Email = 'novoemail@example.com'
WHERE ID = 1;
```

#### c) **DELETE**: Remove registros de uma tabela.
- **Exemplo**: Excluir o cliente com `ID = 1`.

```sql
DELETE FROM Clientes
WHERE ID = 1;
```

---

### 3. **DCL – Data Control Language (Linguagem de Controle de Dados)**

Os comandos **DCL** são usados para controlar os privilégios e permissões de acesso aos objetos do banco de dados.

#### a) **GRANT**: Concede permissões a usuários para realizar ações no banco de dados.
- **Exemplo**: Conceder permissão a um usuário para selecionar dados de uma tabela.

```sql
GRANT SELECT ON Clientes TO Usuario;
```

#### b) **REVOKE**: Revoga permissões concedidas anteriormente.
- **Exemplo**: Revogar a permissão de selecionar dados.

```sql
REVOKE SELECT ON Clientes FROM Usuario;
```

---

### 4. **DQL – Data Query Language (Linguagem de Consulta de Dados)**

O comando **DQL** consiste basicamente no comando **SELECT**, usado para realizar consultas no banco de dados.

#### a) **SELECT**: Consulta dados de uma ou mais tabelas.
- **Exemplo**: Selecionar todos os dados da tabela "Clientes".

```sql
SELECT * FROM Clientes;
```

- **Exemplo**: Selecionar apenas os campos "Nome" e "Email".

```sql
SELECT Nome, Email FROM Clientes;
```

- **Exemplo**: Usar cláusula `WHERE` para filtrar dados.

```sql
SELECT * FROM Clientes
WHERE CPF = '12345678900';
```

#### b) **Operadores SQL na cláusula WHERE**:
   - Operadores lógicos e relacionais podem ser usados para refinar as consultas:
     - **=, >, <, >=, <=, <>**: Comparação básica.
     - **BETWEEN**: Para filtrar dentro de um intervalo.
     - **LIKE**: Para buscas parciais com caracteres curinga (`%` e `_`).
     - **IN**: Verifica se um valor está dentro de uma lista de valores.

- **Exemplo**: Selecionar clientes cujo nome comece com "J".

```sql
SELECT * FROM Clientes
WHERE Nome LIKE 'J%';
```

- **Exemplo**: Selecionar clientes com ID entre 1 e 100.

```sql
SELECT * FROM Clientes
WHERE ID BETWEEN 1 AND 100;
```

#### c) **Cláusula GROUP BY**: Agrupa dados com base em uma ou mais colunas.
- **Exemplo**: Contar o número de clientes por domínio de email.

```sql
SELECT SUBSTRING(Email, CHARINDEX('@', Email)+1, LEN(Email)) AS DominioEmail,
       COUNT(*) AS Quantidade
FROM Clientes
GROUP BY SUBSTRING(Email, CHARINDEX('@', Email)+1, LEN(Email));
```

#### d) **Cláusula HAVING**: Filtra os dados após o agrupamento (usado com `GROUP BY`).
- **Exemplo**: Mostrar apenas domínios de email com mais de 1 cliente.

```sql
SELECT SUBSTRING(Email, CHARINDEX('@', Email)+1, LEN(Email)) AS DominioEmail,
       COUNT(*) AS Quantidade
FROM Clientes
GROUP BY SUBSTRING(Email, CHARINDEX('@', Email)+1, LEN(Email))
HAVING COUNT(*) > 1;
```

#### e) **Cláusula ORDER BY**: Ordena o resultado da consulta.
- **Exemplo**: Ordenar clientes pelo nome, de forma ascendente.

```sql
SELECT * FROM Clientes
ORDER BY Nome ASC;
```

---

### 5. **DTL – Data Transaction Language (Linguagem de Transações de Dados)**

Os comandos **DTL** são usados para controlar transações, garantindo que uma série de operações de banco de dados sejam executadas de forma atômica (tudo ou nada).

#### a) **BEGIN TRANSACTION**: Inicia uma transação.
#### b) **COMMIT**: Confirma as alterações feitas pela transação.
#### c) **ROLLBACK**: Desfaz as alterações realizadas pela transação.

- **Exemplo**: Exemplo de transação que insere dados em duas tabelas e, se houver erro, desfaz as inserções.

```sql
BEGIN TRANSACTION;

INSERT INTO Clientes (ID, Nome, CPF, Email)
VALUES (2, 'Maria Silva', '98765432100', 'maria@example.com');

INSERT INTO Pedidos (PedidoID, ClienteID, Data)
VALUES (1001, 2, '2024-10-10');

-- Se não houver erros, confirma as mudanças
COMMIT;

-- Se houver erros, desfaz as mudanças
ROLLBACK;
```

---

### Recapitulando

- **DDL**: Usado para definir e modificar estruturas (tabelas, bancos de dados).
- **DML**: Manipula dados (inserção, atualização, exclusão).
- **DCL**: Controla permissões de acesso ao banco de dados.
- **DQL**: Realiza consultas (SELECT) e filtros de dados.
- **DTL**: Controla transações de forma segura e confiável.

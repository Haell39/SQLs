## Exercícios Práticos

Aqui estão alguns exercícios práticos que abrangem a criação e manipulação de bancos e tabelas, inserção, atualização e exclusão de dados, além do uso de triggers e procedures.

### 1. Criação e Manipulação de Bancos e Tabelas

**Exercício 1**: Criar um banco de dados chamado "Banco".

```sql
CREATE DATABASE Banco;
```

**Exercício 2**: Posicionar no banco criado.

```sql
USE Banco;
```

**Exercício 3**: Renomear o banco para "Agenda".

```sql
ALTER DATABASE Banco MODIFY NAME = 'Agenda';
```

**Exercício 4**: Criar uma tabela chamada "Pessoal" com os campos especificados.

```sql
CREATE TABLE Pessoal (
    Matricula INTEGER,
    Nome VARCHAR(50),
    Nascimento DATE,
    Sexo CHAR(1),
    Salario MONEY
);
```

**Exercício 5**: Adicionar o campo "Observacao" à tabela "Pessoal".

```sql
ALTER TABLE Pessoal ADD Observacao VARCHAR(200);
```

**Exercício 6**: Alterar o tamanho do campo "Observacao" para 150.

```sql
ALTER TABLE Pessoal ALTER COLUMN Observacao VARCHAR(150);
```

**Exercício 7**: Excluir o campo "Observacao".

```sql
ALTER TABLE Pessoal DROP COLUMN Observacao;
```

**Exercício 8**: Excluir a tabela "Pessoal".

```sql
DROP TABLE Pessoal;
```

### 2. Inserção, Atualização e Exclusão de Dados

**Exercício 1**: Inserir dados na tabela "Departamento".

```sql
INSERT INTO Departamento (Numero, Nome, Local, Orcamento)
VALUES (70, 'Producao', 'Recife', 10000);
```

**Exercício 2**: Alterar o departamento de "Producao" para "Pessoal".

```sql
UPDATE Departamento 
SET Nome = 'Pessoal' 
WHERE Nome = 'Producao';
```

**Exercício 3**: Excluir os dados da tabela "Departamento" onde o nome for igual a "Pessoal".

```sql
DELETE FROM Departamento 
WHERE Nome = 'Pessoal';
```

### 3. Uso de Triggers e Procedures em Exemplos Práticos

#### Triggers

**Exercício com Trigger**: Criar uma trigger que registre em uma tabela de log sempre que um novo funcionário for inserido na tabela "Funcionarios".

```sql
CREATE TABLE LogFuncionarios (
    FuncionarioID INTEGER,
    Acao VARCHAR(50),
    Data DATETIME
);

CREATE TRIGGER AtualizaLog
AFTER INSERT ON Funcionarios
FOR EACH ROW
BEGIN
    INSERT INTO LogFuncionarios (FuncionarioID, Acao, Data)
    VALUES (NEW.ID, 'Inserido', NOW());
END;
```

#### Stored Procedures

**Exercício com Procedure**: Criar uma stored procedure que insira um novo funcionário na tabela "Funcionarios".

```sql
CREATE PROCEDURE InserirFuncionario 
    @Nome VARCHAR(50),
    @Salario MONEY,
    @DeptID INTEGER
AS
BEGIN
    INSERT INTO Funcionarios (Nome, Salario, DeptID)
    VALUES (@Nome, @Salario, @DeptID);
END;
```

Para executar a procedure:

```sql
EXEC InserirFuncionario @Nome = 'Carlos', @Salario = 3000, @DeptID = 101;
```

### Conclusão

Esses exercícios práticos cobrem a criação e manipulação de bancos de dados e tabelas, além da inserção, atualização e exclusão de dados. Além disso, incluem exemplos de uso de triggers e stored procedures para automatizar processos dentro do banco de dados. Esses conceitos são fundamentais para qualquer desenvolvedor que trabalhe com SQL e bancos de dados relacionais.

Citations:

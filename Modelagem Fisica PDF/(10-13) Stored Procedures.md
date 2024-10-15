## Stored Procedures (Procedimentos Armazenados)

As **stored procedures** são conjuntos de instruções SQL que podem ser armazenadas no banco de dados e executadas sob demanda. Elas ajudam a encapsular a lógica de negócios, facilitando a manutenção e a reutilização do código.

### **** Sintaxe e Exemplos de Procedures

A sintaxe básica para criar uma stored procedure é:

```sql
CREATE PROCEDURE NomeDaProcedure
AS
BEGIN
    -- Instruções SQL
END;
```

**Exemplo**:
```sql
CREATE PROCEDURE ListarFuncionarios
AS
BEGIN
    SELECT * FROM Funcionarios;
END;
```

Para executar a stored procedure:
```sql
EXEC ListarFuncionarios;
```

### **** Utilizando Parâmetros

As stored procedures podem aceitar parâmetros, permitindo que você passe valores durante a execução.

**Sintaxe com Parâmetros**:
```sql
CREATE PROCEDURE NomeDaProcedure @param1 Tipo, @param2 Tipo
AS
BEGIN
    -- Instruções SQL usando @param1 e @param2
END;
```

**Exemplo**:
```sql
CREATE PROCEDURE BuscarFuncionarioPorID @ID INTEGER
AS
BEGIN
    SELECT * FROM Funcionarios WHERE ID = @ID;
END;
```

Para executar a procedure com um parâmetro:
```sql
EXEC BuscarFuncionarioPorID @ID = 1;
```

### **** Estrutura Condicional (IF, ELSE)

Dentro de uma stored procedure, você pode usar estruturas condicionais para controlar o fluxo de execução.

**Exemplo com IF e ELSE**:
```sql
CREATE PROCEDURE VerificaSalario @ID INTEGER
AS
BEGIN
    DECLARE @Salario MONEY;

    SELECT @Salario = Salario FROM Funcionarios WHERE ID = @ID;

    IF @Salario IS NULL
    BEGIN
        PRINT 'Funcionário não encontrado.';
    END
    ELSE IF @Salario < 2000
    BEGIN
        PRINT 'Salário abaixo do esperado.';
    END
    ELSE 
    BEGIN
        PRINT 'Salário adequado.';
    END
END;
```

### **** Estruturas de Repetição (WHILE)

As stored procedures também podem incluir estruturas de repetição, como o **WHILE**, para executar um bloco de código várias vezes.

**Exemplo com WHILE**:
```sql
CREATE PROCEDURE ContarFuncionarios
AS
BEGIN
    DECLARE @Contador INTEGER = 0;

    WHILE @Contador < (SELECT COUNT(*) FROM Funcionarios)
    BEGIN
        SET @Contador = @Contador + 1;
        PRINT 'Funcionário número: ' + CAST(@Contador AS VARCHAR);
    END;
END;
```

### Exercícios Práticos

1. **Criar uma Stored Procedure Simples**: Crie uma stored procedure que retorne todos os registros da tabela `Departamentos`.

   ```sql
   CREATE PROCEDURE ListarDepartamentos AS 
   BEGIN 
       SELECT * FROM Departamentos; 
   END;
   ```

2. **Stored Procedure com Parâmetro**: Crie uma stored procedure que aceite um parâmetro para buscar funcionários por nome.

   ```sql
   CREATE PROCEDURE BuscarFuncionarioPorNome @Nome VARCHAR(50) 
   AS 
   BEGIN 
       SELECT * FROM Funcionarios WHERE Nome LIKE '%' + @Nome + '%'; 
   END;
   ```

3. **Usar Estrutura Condicional**: Crie uma stored procedure que verifique se um funcionário existe e imprima uma mensagem correspondente.

4. **Usar Estruturas de Repetição**: Crie uma stored procedure que some os salários de todos os funcionários e retorne o total.

Esses conceitos e exemplos oferecem uma base sólida para entender como as stored procedures funcionam em SQL, incluindo o uso de parâmetros, estruturas condicionais e repetitivas.

Citations:
[1] https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/18390563/3299da26-a3ee-45eb-86c3-5d64839b84c7/7-Modelagem-Fisica-SQL-Server.pdf
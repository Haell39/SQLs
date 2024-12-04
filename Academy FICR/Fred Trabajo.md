Vamos começar com a **TRIGGER** e a **FUNCTION**. Aqui estão as implementações baseadas no contexto do seu projeto.

---

### 1. **TRIGGER**: Atualizar Data e Hora de Modificação na Tabela de Produtos

Criamos uma **trigger** para registrar a última modificação na tabela `Produto` sempre que algum dado for alterado. Isso é útil para rastrear mudanças nos produtos.

#### Código SQL:
```sql
-- Adicionando a coluna para armazenar a data e hora da última modificação
ALTER TABLE Produto
ADD UltimaModificacao DATETIME;

-- Criando a trigger para atualizar a coluna UltimaModificacao
CREATE TRIGGER AtualizaProdutoModificacao
ON Produto
AFTER UPDATE
AS
BEGIN
    -- Atualiza a data e hora de modificação
    UPDATE Produto
    SET UltimaModificacao = GETDATE()
    WHERE Id_Produto IN (SELECT Id_Produto FROM inserted);
END;
```

#### Funcionamento:
- Sempre que um `UPDATE` for feito na tabela `Produto`, a coluna `UltimaModificacao` será atualizada com a data e hora atuais.

---

### 2. **FUNCTION**: Calcular o Total de Gastos de um Cliente

Criamos uma **function** que recebe o ID de um cliente e retorna o total gasto por ele em todas as compras realizadas.

#### Código SQL:
```sql
-- Criando a função para calcular o total de gastos de um cliente
CREATE FUNCTION TotalGastoCliente(@IdCliente INT)
RETURNS MONEY
AS
BEGIN
    DECLARE @TotalGasto MONEY;

    -- Calcula o total gasto pelo cliente
    SELECT @TotalGasto = SUM(p.Valor)
    FROM NFC AS n
    JOIN Pagamento AS p ON n.Id_NFC = p.Id_NFC
    WHERE n.Id_Cliente = @IdCliente;

    RETURN @TotalGasto;
END;
```

#### Funcionamento:
- Chamada da função:
```sql
SELECT dbo.TotalGastoCliente(100) AS TotalGasto;
```
- Substitua `100` pelo ID do cliente desejado.

---

### Testando as Rotinas

#### Para a **Trigger**:
```sql
-- Atualizando um produto para testar a trigger
UPDATE Produto
SET Nome = 'iPhone 15 Pro'
WHERE Id_Produto = 30;

-- Verificando a data de modificação
SELECT * FROM Produto WHERE Id_Produto = 30;
```

#### Para a **Function**:
```sql
-- Calculando o total gasto por um cliente específico
SELECT dbo.TotalGastoCliente(100) AS TotalGasto;
```

---

Essas implementações ajudam na automação e monitoramento dos dados no banco de dados. Quando quiser, podemos avançar para a **STORED PROCEDURE** e o **INDEX**!

Agora vamos implementar a **STORED PROCEDURE** e o **INDEX** com base no seu projeto.

---

### 3. **STORED PROCEDURE**: Registrar uma Nova Compra

Criamos uma **stored procedure** para registrar uma nova compra no banco de dados, incluindo os dados na tabela `NFC` e na tabela `Pagamento`.

#### Código SQL:
```sql
CREATE PROCEDURE RegistrarCompra
    @IdCliente INT,
    @DataPedido DATE,
    @Descricao VARCHAR(100),
    @Valor MONEY,
    @DataPagamento DATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Insere a compra na tabela NFC
    DECLARE @IdNFC INT;
    INSERT INTO NFC (Id_Cliente, DataPedido, Descricao)
    VALUES (@IdCliente, @DataPedido, @Descricao);

    SET @IdNFC = SCOPE_IDENTITY(); -- Recupera o ID gerado automaticamente

    -- Insere o pagamento na tabela Pagamento
    INSERT INTO Pagamento (Id_NFC, Data, Valor)
    VALUES (@IdNFC, @DataPagamento, @Valor);

    PRINT 'Compra registrada com sucesso!';
END;
```

#### Funcionamento:
- Chamada da stored procedure:
```sql
EXEC RegistrarCompra 
    @IdCliente = 100, 
    @DataPedido = '2024-10-01', 
    @Descricao = 'Compra de uma Smart TV', 
    @Valor = 3000.00, 
    @DataPagamento = '2024-10-02';
```

---

### 4. **INDEX**: Otimizar Consultas na Tabela de Pagamentos

Criamos um **index** na tabela `Pagamento` para otimizar consultas baseadas no campo `Valor`, que pode ser usado em filtros e cálculos frequentes.

#### Código SQL:
```sql
-- Criando um índice na tabela Pagamento para o campo Valor
CREATE INDEX IDX_Valor_Pagamento
ON Pagamento (Valor);
```

#### Funcionamento:
- Este índice melhora o desempenho de consultas que envolvem o campo `Valor` na tabela `Pagamento`, como:
```sql
SELECT *
FROM Pagamento
WHERE Valor > 1000;
```

---

### Testando as Rotinas

#### Para a **Stored Procedure**:
```sql
EXEC RegistrarCompra 
    @IdCliente = 110, 
    @DataPedido = '2024-11-01', 
    @Descricao = 'Compra de um Notebook Gamer', 
    @Valor = 7000.00, 
    @DataPagamento = '2024-11-02';

-- Verificando os dados nas tabelas
SELECT * FROM NFC;
SELECT * FROM Pagamento;
```

#### Para o **Index**:
```sql
-- Consultas otimizadas pelo índice
SELECT *
FROM Pagamento
WHERE Valor > 5000;

-- Exibindo informações do índice
EXEC sp_helpindex 'Pagamento';
```

---

### Conclusão

Com estas implementações:
1. A **stored procedure** facilita o registro de novas compras, automatizando as inserções nas tabelas relacionadas.
2. O **index** otimiza consultas na tabela de maior volume de dados, melhorando o desempenho do sistema.

Se precisar revisar ou adicionar mais funcionalidades, é só pedir! 🚀
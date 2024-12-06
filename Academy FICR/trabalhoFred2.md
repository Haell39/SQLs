````markdown
# Consultas SELECT

## 1. Primeira Consulta

```sql
SELECT
    c.Nome AS "Nome do Cliente",
    COUNT(n.Id_NFC) AS "Total de Compras",
    SUM(p.Valor) AS "Total Gasto"
FROM
    cliente AS c
JOIN
    NFC AS n ON c.Id_cliente = n.Id_cliente
JOIN
    pagamento AS p ON n.Id_NFC = p.Id_NFC
GROUP BY
    c.Nome;
```
````

**Objetivo:** Mostrar o total de compras e o total gasto por cada cliente.

### Detalhes:

- `COUNT(n.Id_NFC)`: Conta o número de notas fiscais (ou compras) do cliente.
- `SUM(p.Valor)`: Soma o valor total gasto pelo cliente.
- `GROUP BY c.Nome`: Agrupa os resultados por cliente para calcular os totais.

---

## 2. Segunda Consulta

```sql
SELECT
    c.Nome AS "Nome do Cliente",
    ROUND(AVG(p.Valor), 1) AS "Valor Médio Gasto",
    MAX(p.Valor) AS "Maior Valor Gasto",
    MIN(p.Valor) AS "Menor Valor Gasto"
FROM
    cliente AS c
JOIN
    NFC AS n ON c.Id_cliente = n.Id_cliente
JOIN
    pagamento AS p ON n.Id_NFC = p.Id_NFC
GROUP BY
    c.Nome;
```

**Objetivo:** Exibir métricas estatísticas (média, maior e menor valor) por cliente.

### Detalhes:

- `ROUND(AVG(p.Valor), 1)`: Calcula o valor médio gasto arredondado a uma casa decimal.
- `MAX(p.Valor)`: Determina o maior valor gasto.
- `MIN(p.Valor)`: Determina o menor valor gasto.

---

## 3. Terceira Consulta

```sql
SELECT
    SUM(p.Valor) AS "Valor Total Gasto por Todos os Clientes"
FROM
    pagamento AS p;
```

**Objetivo:** Somar todos os valores gastos por todos os clientes.

---

# Trigger para Atualizar a Data de Modificação

```sql
CREATE TRIGGER AtualizaPagamentoModificacao
ON Pagamento
AFTER UPDATE
AS
BEGIN
    -- Atualiza a coluna UltimaModificacao com a data e hora atuais
    UPDATE Pagamento
    SET UltimaModificacao = GETDATE()
    WHERE Cd_Pagamento IN (SELECT Cd_Pagamento FROM inserted);
END;
```

**Objetivo:** Automatizar a atualização da coluna `UltimaModificacao` toda vez que um registro na tabela `Pagamento` for alterado.

### Detalhes:

- `AFTER UPDATE`: A trigger é disparada após uma atualização na tabela.
- `GETDATE()`: Obtém a data e hora atuais.
- `inserted`: Uma tabela especial que contém os registros recém-atualizados.

---

## Exemplo de Atualização e Consulta

```sql
UPDATE Pagamento
SET Valor = 5600.00
WHERE Id_NFC = 400;

SELECT * FROM Pagamento WHERE Id_NFC = 400;
```

**Objetivo:** Atualizar o valor de um pagamento específico (`Id_NFC = 400`) e consultar os dados relacionados.

---

# Função Definida pelo Usuário

## Função para Calcular o Total Gasto por Cliente

```sql
CREATE FUNCTION TotalGastoCliente(@IdCliente INT)
RETURNS MONEY
AS
BEGIN
    DECLARE @TotalGasto MONEY;

    SELECT @TotalGasto = SUM(p.Valor)
    FROM NFC AS n
    JOIN Pagamento AS p ON n.Id_NFC = p.Id_NFC
    WHERE n.Id_Cliente = @IdCliente;

    RETURN @TotalGasto;
END;
```

**Objetivo:** Calcular e retornar o total gasto por um cliente específico.

### Como funciona:

- O ID do cliente (`@IdCliente`) é usado como parâmetro.
- A função soma os valores na tabela `Pagamento` para todas as notas fiscais associadas ao cliente.

### Uso:

```sql
SELECT dbo.TotalGastoCliente(100) AS TotalGasto;
```

---

# Índices

## Criação de Índice na Coluna `Valor` da Tabela `Pagamento`

```sql
CREATE INDEX IDX_Valor_Pagamento
ON Pagamento (Valor);
```

**Objetivo:** Melhorar o desempenho de consultas que filtram ou ordenam pelos valores na tabela `Pagamento`.

### Exemplo de Uso:

```sql
SELECT * FROM Pagamento WHERE Valor > 1000;
```

### Verificação de Índices:

```sql
EXEC sp_helpindex 'Pagamento';
```

---

# Stored Procedure

## Inserir um Novo Cliente

```sql
CREATE PROCEDURE InserirCliente
    @Id_Cliente INT,
    @Nome NVARCHAR(100),
    @CPF NVARCHAR(11),
    @Email NVARCHAR(100),
    @Endereco NVARCHAR(255)
AS
BEGIN
    INSERT INTO Cliente (Id_Cliente, Nome, CPF, Email, Endereco)
    VALUES (@Id_Cliente, @Nome, @CPF, @Email, @Endereco);
END;
```

**Objetivo:** Facilitar a inserção de novos clientes com parâmetros fornecidos pelo usuário.

### Como usar:

```sql
EXEC InserirCliente
    @Id_Cliente = 1,
    @Nome = 'João Silva',
    @CPF = '12345678901',
    @Email = 'joao.silva@email.com',
    @Endereco = 'Rua Principal, 456';
```

Após executar, os dados do cliente são adicionados à tabela `Cliente`.

---

# Resumo

Este código cobre os principais conceitos de SQL em um ambiente realista:

- **Consultas SELECT:** Para análises detalhadas de dados.
- **Triggers:** Para automação de atualizações.
- **Funções Definidas pelo Usuário:** Para cálculos específicos.
- **Índices:** Para otimização de desempenho.
- **Stored Procedures:** Para manipulação de dados parametrizada.

```

```

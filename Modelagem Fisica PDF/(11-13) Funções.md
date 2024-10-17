## Funções (Functions)

As funções em SQL permitem encapsular lógica que pode ser reutilizada em diferentes partes de um banco de dados. Existem diferentes tipos de funções, incluindo **funções escalares**, **funções que retornam tabelas** e **funções condicionais e de cálculo**.

### **** Funções Escalares

As **funções escalares** retornam um único valor com base em uma entrada. Elas podem ser usadas em consultas SQL para realizar cálculos ou manipulações de dados.

**Exemplo**:
Uma função que calcula o salário anual de um funcionário a partir do salário mensal:

```sql
CREATE FUNCTION CalcularSalarioAnual(@SalarioMensal MONEY)
RETURNS MONEY
AS
BEGIN
    RETURN @SalarioMensal * 12;
END;
```

Para usar essa função:
```sql
SELECT Nome, dbo.CalcularSalarioAnual(Salario) AS SalarioAnual
FROM Funcionarios;
```

### **** Funções que Retornam Tabelas

As **funções que retornam tabelas** (também conhecidas como funções de tabela) retornam um conjunto de registros. Elas podem ser usadas como se fossem tabelas em consultas.

**Exemplo**:
Uma função que retorna todos os funcionários de um determinado departamento:

```sql
CREATE FUNCTION ObterFuncionariosPorDepto(@DeptID INTEGER)
RETURNS TABLE
AS
RETURN (
    SELECT * FROM Funcionarios WHERE DeptID = @DeptID
);
```

Para usar essa função em uma consulta:
```sql
SELECT * FROM ObterFuncionariosPorDepto(101);
```

### **** Funções Condicionais e de Cálculo

As **funções condicionais** permitem realizar operações lógicas dentro das consultas. Exemplos incluem `CASE` e `COALESCE`. As **funções de cálculo** são usadas para realizar operações matemáticas.

#### Exemplo de Função Condicional (CASE):
```sql
SELECT Nome,
       CASE 
           WHEN Salario < 2000 THEN 'Baixo'
           WHEN Salario BETWEEN 2000 AND 5000 THEN 'Médio'
           ELSE 'Alto'
       END AS FaixaSalarial
FROM Funcionarios;
```

#### Exemplo de Função de Cálculo:
A função `SUM` pode ser usada para calcular o total dos salários:
```sql
SELECT SUM(Salario) AS TotalSalarios FROM Funcionarios;
```

### Exercícios Práticos

1. **Criar uma Função Escalar**: Crie uma função que calcule o imposto sobre o salário, considerando uma alíquota fixa de 15%.

   ```sql
   CREATE FUNCTION CalcularImposto(@Salario MONEY)
   RETURNS MONEY
   AS
   BEGIN
       RETURN @Salario * 0.15;
   END;
   ```

2. **Criar uma Função que Retorna Tabelas**: Crie uma função que retorne todos os funcionários cujo salário é maior que um valor fornecido como parâmetro.

   ```sql
   CREATE FUNCTION ObterFuncionariosComSalarioMaior(@Valor MONEY)
   RETURNS TABLE
   AS
   RETURN (
       SELECT * FROM Funcionarios WHERE Salario > @Valor
   );
   ```

3. **Usar Função Condicional**: Crie uma consulta que utilize a função `CASE` para classificar os funcionários com base em suas faixas salariais.

4. **Usar Função de Cálculo**: Crie uma consulta que calcule a média dos salários dos funcionários.

   ```sql
   SELECT AVG(Salario) AS MediaSalarial FROM Funcionarios;
   ```

Esses conceitos e exemplos fornecem uma base sólida para compreender as funções em SQL, incluindo como criar e utilizar funções escalares, funções que retornam tabelas e funções condicionais e de cálculo.

Citations:
[1] https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/18390563/3299da26-a3ee-45eb-86c3-5d64839b84c7/7-Modelagem-Fisica-SQL-Server.pdf
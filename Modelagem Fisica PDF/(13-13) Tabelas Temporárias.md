## Tabelas Temporárias

As **tabelas temporárias** são estruturas de dados que podem ser criadas e utilizadas durante uma sessão de banco de dados. Elas são úteis para armazenar dados temporários que não precisam ser persistidos após a sessão ou conexão ser encerrada.

### Criação de Tabelas Temporárias

Para criar uma tabela temporária, utiliza-se a palavra-chave `#` antes do nome da tabela. Tabelas temporárias podem ser locais (disponíveis apenas na sessão atual) ou globais (disponíveis para todas as sessões).

**Exemplo de Criação de Tabela Temporária**:
```sql
CREATE TABLE #TempFuncionarios (
    ID INTEGER,
    Nome VARCHAR(50),
    Salario MONEY
);
```

### Inserção de Dados em Tabelas Temporárias

Os dados podem ser inseridos em tabelas temporárias da mesma forma que em tabelas permanentes, utilizando o comando `INSERT`.

**Exemplo de Inserção**:
```sql
INSERT INTO #TempFuncionarios (ID, Nome, Salario)
VALUES (1, 'Pedro', 3000),
       (2, 'Maria', 2500),
       (3, 'Carlos', 4000);
```

### Utilização e Manipulação de Tabelas Temporárias em Consultas

As tabelas temporárias podem ser utilizadas em consultas SQL como qualquer outra tabela. Você pode realizar seleções, atualizações e exclusões.

**Exemplo de Seleção**:
```sql
SELECT * FROM #TempFuncionarios;
```

**Exemplo de Atualização**:
```sql
UPDATE #TempFuncionarios
SET Salario = Salario * 1.10; -- Aumenta 10% no salário
```

**Exemplo de Exclusão**:
```sql
DELETE FROM #TempFuncionarios WHERE Nome = 'Carlos';
```

### Limpeza e Exclusão de Tabelas Temporárias

As tabelas temporárias são automaticamente excluídas quando a sessão é encerrada. No entanto, você também pode excluí-las manualmente.

**Exemplo de Exclusão Manual**:
```sql
DROP TABLE #TempFuncionarios;
```

### Exercícios Práticos

1. **Criar uma Tabela Temporária**: Crie uma tabela temporária chamada `#Produtos` com os campos `ID`, `Nome` e `Preco`.

   ```sql
   CREATE TABLE #Produtos (
       ID INTEGER,
       Nome VARCHAR(50),
       Preco DECIMAL(10, 2)
   );
   ```

2. **Inserir Dados na Tabela Temporária**: Insira pelo menos três produtos na tabela `#Produtos`.

   ```sql
   INSERT INTO #Produtos (ID, Nome, Preco)
   VALUES (1, 'Produto A', 10.50),
          (2, 'Produto B', 20.00),
          (3, 'Produto C', 15.75);
   ```

3. **Selecionar Dados da Tabela Temporária**: Realize uma consulta para selecionar todos os produtos da tabela `#Produtos`.

   ```sql
   SELECT * FROM #Produtos;
   ```

4. **Atualizar Dados da Tabela Temporária**: Aumente o preço do `Produto B` em 5%.

   ```sql
   UPDATE #Produtos SET Preco = Preco * 1.05 WHERE Nome = 'Produto B';
   ```

5. **Excluir Dados da Tabela Temporária**: Exclua o produto com o nome `Produto A`.

   ```sql
   DELETE FROM #Produtos WHERE Nome = 'Produto A';
   ```

6. **Excluir a Tabela Temporária Manualmente**: Exclua a tabela `#Produtos`.

   ```sql
   DROP TABLE #Produtos;
   ```

Esses conceitos e exercícios fornecem uma base sólida para entender como criar e manipular tabelas temporárias em SQL, facilitando operações que requerem armazenamento transitório de dados durante uma sessão de banco de dados.

Citations:
[1] https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/18390563/3299da26-a3ee-45eb-86c3-5d64839b84c7/7-Modelagem-Fisica-SQL-Server.pdf
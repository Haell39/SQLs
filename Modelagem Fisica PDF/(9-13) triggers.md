## Triggers (Gatilhos)

As **triggers** (ou gatilhos) são procedimentos armazenados que são automaticamente executados (ou "disparados") em resposta a eventos específicos em uma tabela, como inserções, atualizações ou exclusões. Elas são úteis para manter a integridade dos dados e automatizar processos.

### **** Conceito de Triggers

Uma trigger é um conjunto de instruções SQL que é executado automaticamente em resposta a um evento em uma tabela. Elas podem ser usadas para:

- Validar dados antes de uma operação.
- Atualizar outras tabelas.
- Registrar mudanças em uma tabela de log.
- Impedir operações indesejadas.

### **** Tipos de Triggers

Existem dois tipos principais de triggers:

- **AFTER Trigger**: Executa após a operação de inserção, atualização ou exclusão ser concluída. É útil para ações que devem ocorrer somente se a operação principal for bem-sucedida.

  **Exemplo**:
  ```sql
  CREATE TRIGGER AtualizaLog
  AFTER INSERT ON Funcionarios
  FOR EACH ROW
  BEGIN
      INSERT INTO LogFuncionarios (FuncionarioID, Acao, Data)
      VALUES (NEW.ID, 'Inserido', NOW());
  END;
  ```

- **INSTEAD OF Trigger**: Substitui a operação padrão. É útil quando você deseja modificar o comportamento padrão de uma operação de inserção, atualização ou exclusão.

  **Exemplo**:
  ```sql
  CREATE TRIGGER SubstituiInsercao
  INSTEAD OF INSERT ON Funcionarios
  FOR EACH ROW
  BEGIN
      -- Lógica personalizada para inserir dados
      INSERT INTO FuncionariosTemporarios (Nome, Salario)
      VALUES (NEW.Nome, NEW.Salario);
  END;
  ```

### **** Tabelas Temporárias em Triggers

As **tabelas temporárias** podem ser utilizadas dentro de triggers para armazenar dados temporariamente durante a execução da trigger. Elas são úteis para realizar operações intermediárias sem afetar diretamente as tabelas principais.

**Exemplo**:
```sql
CREATE TRIGGER ExemploTrigger
AFTER INSERT ON Vendas
FOR EACH ROW
BEGIN
    CREATE TEMPORARY TABLE TempVendas AS 
    SELECT * FROM Vendas WHERE ID = NEW.ID;

    -- Realizar operações com TempVendas

    DROP TABLE TempVendas; -- Limpar após uso
END;
```

### Exercícios Práticos

1. **Criar uma trigger AFTER**: Crie uma trigger que registre em uma tabela de log sempre que um novo funcionário for inserido na tabela `Funcionarios`.

2. **Criar uma trigger INSTEAD OF**: Crie uma trigger que redirecione as inserções na tabela `Produtos` para uma tabela temporária chamada `ProdutosTemporarios`.

3. **Usar tabelas temporárias**: Crie uma trigger que utilize uma tabela temporária para calcular o total de vendas após cada nova venda ser inserida na tabela `Vendas`.

Esses conceitos e exemplos ajudam a entender como as triggers funcionam e como podem ser aplicadas para automatizar e controlar o fluxo de dados em um banco de dados relacional.

Citations:
[1] https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/18390563/3299da26-a3ee-45eb-86c3-5d64839b84c7/7-Modelagem-Fisica-SQL-Server.pdf
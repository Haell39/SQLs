## Álgebra Relacional

A álgebra relacional é uma linguagem formal para manipulação de dados em bancos de dados relacionais. Ela fornece operações que podem ser aplicadas a relações (tabelas) para produzir novas relações. Vamos explorar as operações básicas: **Seleção (σ)**, **Projeção (π)**, e as operações de **União**, **Interseção**, **Diferença** e **Produto Cartesiano**.

### Seleção (σ) e Projeção (π)

- **Seleção (σ)**: Filtra linhas de uma tabela com base em uma condição. A operação σ é usada para selecionar registros que atendem a um critério específico.

  **Exemplo**:
  Se tivermos uma tabela chamada `Funcionarios`:
  | ID | Nome   | Cargo   | Salario |
  |----|--------|---------|---------|
  | 1  | Pedro  | Gerente | 3000    |
  | 2  | Maria  | Analista| 2500    |
  | 3  | Paulo  | Gerente | 3200    |

  Para selecionar todos os gerentes:
  $$\sigma_{Cargo = 'Gerente'}(Funcionarios)$$
  
  O resultado seria:
  | ID | Nome   | Cargo   | Salario |
  |----|--------|---------|---------|
  | 1  | Pedro  | Gerente | 3000    |
  | 3  | Paulo  | Gerente | 3200    |

- **Projeção (π)**: Extrai colunas específicas de uma tabela, eliminando duplicatas.

  **Exemplo**:
  
  Para projetar apenas os nomes e salários dos funcionários:
  
  $$\pi_{Nome, Salario}(Funcionarios)$$
  
  O resultado seria:
  
  | Nome   | Salario |
  |--------|---------|
  | Pedro  | 3000    |
  | Maria  | 2500    |
  | Paulo  | 3200    |

### Operações de União, Interseção, Diferença e Produto Cartesiano

- **União (∪)**: Combina duas tabelas, eliminando duplicatas. Ambas as tabelas devem ter o mesmo número de colunas e tipos compatíveis.

  **Exemplo**:
  
   Se tivermos duas tabelas `FuncionariosA` e `FuncionariosB`, a união seria:
   
   $$FuncionariosA ∪ FuncionariosB$$

- **Interseção (∩)**: Retorna registros que estão em ambas as tabelas.

   **Exemplo**:
   
   Para encontrar funcionários que estão nas duas tabelas:
   
   $$FuncionariosA ∩ FuncionariosB$$

- **Diferença (-)**: Retorna registros que estão na primeira tabela, mas não na segunda.

   **Exemplo**:
   
   Para encontrar funcionários que estão em `FuncionariosA`, mas não em `FuncionariosB`:
   
   $$FuncionariosA - FuncionariosB$$

- **Produto Cartesiano (×)**: Combina todas as linhas de uma tabela com todas as linhas de outra tabela.

   **Exemplo**:
   
   Se tivermos `Tabela1` e `Tabela2`, o produto cartesiano seria:

   $$Tabela1 × Tabela2$$

### Exercícios Práticos

1. **Seleção**: Crie uma consulta para selecionar todos os funcionários com salário maior que R$2500.
   
   ```sql
   SELECT * FROM Funcionarios WHERE Salario > 2500;
   ```

2. **Projeção**: Crie uma consulta para projetar apenas os nomes dos funcionários.
   
   ```sql
   SELECT Nome FROM Funcionarios;
   ```

3. **União**: Suponha que você tenha outra tabela chamada `Estagiarios`. Crie uma consulta para unir os dados dos funcionários e estagiários.
   
   ```sql
   SELECT Nome FROM Funcionarios
   UNION
   SELECT Nome FROM Estagiarios;
   ```

4. **Interseção**: Crie uma consulta para encontrar funcionários que também são estagiários.
   
   ```sql
   SELECT Nome FROM Funcionarios
   INTERSECT
   SELECT Nome FROM Estagiarios;
   ```

5. **Diferença**: Crie uma consulta para encontrar funcionários que não são estagiários.
   
   ```sql
   SELECT Nome FROM Funcionarios
   EXCEPT
   SELECT Nome FROM Estagiarios;
   ```

6. **Produto Cartesiano**: Crie uma consulta para combinar todos os funcionários com todas as posições disponíveis em uma tabela chamada `Posicoes`.
   
   ```sql
   SELECT * FROM Funcionarios, Posicoes;
   ```

Esses conceitos e exercícios ajudarão a consolidar seu entendimento sobre álgebra relacional e suas operações fundamentais no contexto do SQL.

Citations:
[1] https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/18390563/3299da26-a3ee-45eb-86c3-5d64839b84c7/7-Modelagem-Fisica-SQL-Server.pdf
# Comandos Específicos de SQL

### Comandos de Criação e Alteração & Consultas e Filtros

Para entender os comandos SQL, vamos dividir em duas partes: **Comandos de Criação e Alteração** e **Consultas e Filtros**.

### **** Comandos de Criação e Alteração (DDL)

Os comandos DDL (Data Definition Language) são usados para definir a estrutura do banco de dados. Os principais comandos são:

- **CREATE**: Cria um novo banco de dados ou tabela.
- **ALTER**: Modifica a estrutura de um banco de dados ou tabela existente.
- **DROP**: Exclui um banco de dados ou tabela.

#### Exemplos Práticos

1. **Criar um Banco de Dados**
   ```sql
   CREATE DATABASE MeuBanco;
   ```

2. **Usar o Banco de Dados Criado**
   ```sql
   USE MeuBanco;
   ```

3. **Criar uma Tabela**
   ```sql
   CREATE TABLE Pessoal (
       Matricula INTEGER PRIMARY KEY,
       Nome VARCHAR(50),
       Nascimento DATE,
       Sexo CHAR(1),
       Salario MONEY
   );
   ```

4. **Alterar uma Tabela (Adicionar um Campo)**
   ```sql
   ALTER TABLE Pessoal ADD Observacao VARCHAR(200);
   ```

5. **Alterar uma Tabela (Modificar um Campo)**
   ```sql
   ALTER TABLE Pessoal ALTER COLUMN Observacao VARCHAR(150);
   ```

6. **Excluir uma Tabela**
   ```sql
   DROP TABLE Pessoal;
   ```

### **** Consultas e Filtros (DQL)

Os comandos DQL (Data Query Language) são usados para consultar dados no banco de dados. Os principais comandos incluem:

- **SELECT**: Seleciona dados de uma tabela.
- **WHERE**: Filtra registros com base em uma condição.
- **GROUP BY**: Agrupa registros que têm valores iguais em colunas especificadas.
- **HAVING**: Filtra grupos formados pelo GROUP BY.
- **ORDER BY**: Ordena os resultados.

#### Exemplos Práticos

1. **Selecionar Todos os Dados**
   ```sql
   SELECT * FROM Pessoal;
   ```

2. **Selecionar Dados com Filtro**
   ```sql
   SELECT * FROM Pessoal WHERE Sexo = 'M';
   ```

3. **Agrupar Dados**
   ```sql
   SELECT Sexo, COUNT(*) AS Total FROM Pessoal GROUP BY Sexo;
   ```

4. **Filtrar Grupos**
   ```sql
   SELECT Sexo, COUNT(*) AS Total 
   FROM Pessoal 
   GROUP BY Sexo 
   HAVING COUNT(*) > 1;
   ```

5. **Ordenar Resultados**
   ```sql
   SELECT * FROM Pessoal ORDER BY Nascimento DESC;
   ```

### **** Exercícios Práticos

Para praticar, siga os exercícios abaixo:

1. Crie um banco de dados chamado "TesteDB".
   
2. Crie uma tabela chamada "Funcionarios" com os campos:
    - ID (INTEGER, PRIMARY KEY)
    - Nome (VARCHAR(100))
    - Cargo (VARCHAR(50))
    - Salario (DECIMAL)

3. Insira pelo menos três registros na tabela "Funcionarios".

4. Selecione todos os funcionários que têm salário maior que 2000.

5. Altere o cargo de um funcionário específico.

6. Exclua um registro da tabela "Funcionarios".

Esses exemplos e exercícios devem ajudar a solidificar seu entendimento sobre os comandos SQL básicos e suas aplicações práticas no gerenciamento de bancos de dados.

Citations:
[1] https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/18390563/3299da26-a3ee-45eb-86c3-5d64839b84c7/7-Modelagem-Fisica-SQL-Server.pdf
[2] https://awari.com.br/passo-a-passo-aprenda-como-criar-tabelas-no-sql-e-organize-seus-dados-de-forma-eficiente/
[3] https://www.bosontreinamentos.com.br/bancos-de-dados/comandos-dml-sql-e-sua-sintaxe/
[4] https://www.treinaweb.com.br/blog/principais-comandos-sql
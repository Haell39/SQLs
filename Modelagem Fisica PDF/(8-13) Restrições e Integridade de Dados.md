## Restrições e Integridade de Dados

As restrições de integridade são regras aplicadas a colunas em uma tabela para garantir a precisão e a validade dos dados. As principais restrições incluem **NOT NULL**, **DEFAULT**, **CHECK**, **PRIMARY KEY** e **FOREIGN KEY**.

### Restrições NOT NULL, DEFAULT e CHECK

- **NOT NULL**: Impede que uma coluna aceite valores nulos. Essa restrição é usada quando um campo deve sempre ter um valor.

  **Exemplo**:
  ```sql
  CREATE TABLE Funcionarios (
      ID INTEGER NOT NULL,
      Nome VARCHAR(50) NOT NULL,
      Salario MONEY
  );
  ```

- **DEFAULT**: Define um valor padrão para uma coluna quando nenhum valor é especificado durante a inserção.

  **Exemplo**:
  ```sql
  CREATE TABLE Produtos (
      ID INTEGER PRIMARY KEY,
      Nome VARCHAR(50) NOT NULL,
      Estoque INTEGER DEFAULT 0
  );
  ```

- **CHECK**: Impõe uma condição que os valores em uma coluna devem satisfazer. É útil para garantir que os dados estejam dentro de um intervalo específico ou atendam a critérios específicos.

  **Exemplo**:
  ```sql
  CREATE TABLE Vendas (
      ID INTEGER PRIMARY KEY,
      Valor DECIMAL(10,2) CHECK (Valor > 0)
  );
  ```

### Chave Primária (PRIMARY KEY)

A **chave primária** é uma coluna ou conjunto de colunas que identifica exclusivamente cada registro em uma tabela. Não pode haver valores duplicados ou nulos na chave primária.

**Exemplo**:
```sql
CREATE TABLE Clientes (
    ClienteID INTEGER PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE
);
```

### Chave Estrangeira (FOREIGN KEY)

A **chave estrangeira** é uma coluna ou conjunto de colunas que estabelece um vínculo entre os registros de duas tabelas. Ela refere-se à chave primária de outra tabela, garantindo a integridade referencial.

**Exemplo**:
```sql
CREATE TABLE Pedidos (
    PedidoID INTEGER PRIMARY KEY,
    ClienteID INTEGER,
    Data DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);
```

### Exercícios Práticos

1. **Criar uma tabela com restrições NOT NULL e DEFAULT**:
   - Crie uma tabela chamada `Estudantes` com os campos `ID`, `Nome` (não pode ser nulo), e `Idade` (com valor padrão de 18).

   ```sql
   CREATE TABLE Estudantes (
       ID INTEGER PRIMARY KEY,
       Nome VARCHAR(50) NOT NULL,
       Idade INTEGER DEFAULT 18
   );
   ```

2. **Adicionar uma restrição CHECK**:
   - Adicione um campo `Nota` à tabela `Estudantes` que deve estar entre 0 e 10.

   ```sql
   ALTER TABLE Estudantes ADD Nota DECIMAL(3,1) CHECK (Nota >= 0 AND Nota <= 10);
   ```

3. **Criar tabelas com chaves primárias e estrangeiras**:
   - Crie uma tabela `Cursos` com `CursoID` como chave primária e outra tabela `Matriculas` que tenha `MatriculaID` como chave primária e `CursoID` como chave estrangeira referenciando a tabela `Cursos`.

   ```sql
   CREATE TABLE Cursos (
       CursoID INTEGER PRIMARY KEY,
       Nome VARCHAR(100) NOT NULL
   );

   CREATE TABLE Matriculas (
       MatriculaID INTEGER PRIMARY KEY,
       CursoID INTEGER,
       FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID)
   );
   ```

Esses conceitos e exercícios ajudam a entender como as restrições e as chaves funcionam em SQL, garantindo a integridade dos dados dentro de um banco de dados relacional.

Citations:
[1] https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/18390563/3299da26-a3ee-45eb-86c3-5d64839b84c7/7-Modelagem-Fisica-SQL-Server.pdf
-- ========================================
-- GUIA POSTGRESQL PARA DESENVOLVEDORES JÚNIOR
-- ========================================

-- 1. CRIAÇÃO E MANIPULAÇÃO DE TABELAS
-- ----------------------------------------

-- Criar uma tabela
CREATE TABLE funcionarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    departamento_id INTEGER,
    salario DECIMAL(10,2),
    data_contratacao DATE DEFAULT CURRENT_DATE
);

CREATE TABLE departamentos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    localizacao VARCHAR(100)
);

-- Adicionar uma coluna
ALTER TABLE funcionarios ADD COLUMN telefone VARCHAR(20);

-- Remover uma coluna
ALTER TABLE funcionarios DROP COLUMN telefone;

-- 2. INSERÇÃO DE DADOS
-- ----------------------------------------

-- Inserir um único registro
INSERT INTO departamentos (nome, localizacao)
VALUES ('TI', 'São Paulo');

-- Inserir múltiplos registros
INSERT INTO funcionarios (nome, email, departamento_id, salario)
VALUES 
    ('João Silva', 'joao@empresa.com', 1, 5000.00),
    ('Maria Santos', 'maria@empresa.com', 1, 6000.00),
    ('Pedro Souza', 'pedro@empresa.com', 1, 4500.00);

-- 3. CONSULTAS BÁSICAS
-- ----------------------------------------

-- Selecionar todos os registros
SELECT * FROM funcionarios;

-- Selecionar colunas específicas
SELECT nome, email, salario FROM funcionarios;

-- Usar WHERE para filtrar
SELECT * FROM funcionarios 
WHERE salario > 5000.00;

-- Ordenar resultados
SELECT nome, salario 
FROM funcionarios 
ORDER BY salario DESC;

-- 4. JOINS
-- ----------------------------------------

-- INNER JOIN
SELECT f.nome, d.nome as departamento
FROM funcionarios f
INNER JOIN departamentos d ON f.departamento_id = d.id;

-- LEFT JOIN
SELECT f.nome, d.nome as departamento
FROM funcionarios f
LEFT JOIN departamentos d ON f.departamento_id = d.id;

-- 5. FUNÇÕES DE AGREGAÇÃO
-- ----------------------------------------

-- Contar registros
SELECT COUNT(*) FROM funcionarios;

-- Média salarial
SELECT AVG(salario) as media_salarial FROM funcionarios;

-- Soma de salários por departamento
SELECT d.nome, SUM(f.salario) as total_salarios
FROM funcionarios f
INNER JOIN departamentos d ON f.departamento_id = d.id
GROUP BY d.nome;

-- 6. FILTRAGEM AVANÇADA
-- ----------------------------------------

-- Usando LIKE
SELECT * FROM funcionarios
WHERE nome LIKE 'Jo%';

-- Usando IN
SELECT * FROM funcionarios
WHERE departamento_id IN (1, 2);

-- Usando BETWEEN
SELECT * FROM funcionarios
WHERE salario BETWEEN 4000 AND 6000;

-- 7. ATUALIZAÇÕES
-- ----------------------------------------

-- Atualizar um registro
UPDATE funcionarios
SET salario = salario * 1.1
WHERE departamento_id = 1;

-- 8. EXCLUSÃO
-- ----------------------------------------

-- Excluir registros específicos
DELETE FROM funcionarios
WHERE id = 1;

-- 9. SUBCONSULTAS
-- ----------------------------------------

-- Encontrar funcionários com salário acima da média
SELECT nome, salario
FROM funcionarios
WHERE salario > (SELECT AVG(salario) FROM funcionarios);

-- 10. ÍNDICES
-- ----------------------------------------

-- Criar índice para melhorar performance
CREATE INDEX idx_funcionarios_email ON funcionarios(email);

-- 11. VIEWS
-- ----------------------------------------

-- Criar uma view para relatório comum
CREATE VIEW vw_funcionarios_departamentos AS
SELECT 
    f.nome as funcionario,
    d.nome as departamento,
    f.salario
FROM funcionarios f
INNER JOIN departamentos d ON f.departamento_id = d.id;

-- 12. CONSTRAINTS
-- ----------------------------------------

-- Adicionar constraint de chave estrangeira
ALTER TABLE funcionarios
ADD CONSTRAINT fk_departamento
FOREIGN KEY (departamento_id) 
REFERENCES departamentos(id);

-- 13. FUNÇÕES DE DATA
-- ----------------------------------------

-- Calcular tempo de empresa
SELECT 
    nome,
    data_contratacao,
    AGE(CURRENT_DATE, data_contratacao) as tempo_empresa
FROM funcionarios;
-- Tutorial de SQL Básico: Desde CREATE TABLE até JOIN e UNION
-- Este script é um guia comentado para aprender os fundamentos de SQL,
-- cobrindo criação de tabelas, inserção, atualização, exclusão, consultas,
-- agrupamentos, ordenação, joins e união de resultados.
-- Contexto: Vamos simular um sistema de uma loja de livros.

-- --------------------------------------
-- 1. CRIANDO O BANCO DE DADOS
-- --------------------------------------
-- Cria um banco de dados chamado 'bookstore'
CREATE DATABASE IF NOT EXISTS bookstore;
-- Seleciona o banco para uso
USE bookstore;

-- --------------------------------------
-- 2. CRIANDO TABELAS
-- --------------------------------------
-- Tabela 'authors': armazena informações sobre autores
CREATE TABLE authors (
    author_id INT PRIMARY KEY, -- Chave primária, identifica cada autor
    first_name VARCHAR(50) NOT NULL, -- Nome do autor, não pode ser nulo
    last_name VARCHAR(50) NOT NULL, -- Sobrenome, não pode ser nulo
    country VARCHAR(50) -- País de origem, pode ser nulo
);

-- Tabela 'books': armazena informações sobre livros
CREATE TABLE books (
    book_id INT PRIMARY KEY, -- Chave primária
    title VARCHAR(100) NOT NULL, -- Título do livro
    author_id INT, -- Chave estrangeira, liga ao autor
    price DECIMAL(10, 2) NOT NULL, -- Preço com 2 casas decimais
    publication_year INT, -- Ano de publicação
    FOREIGN KEY (author_id) REFERENCES authors(author_id) -- Relaciona com 'authors'
);

-- Tabela 'sales': armazena vendas dos livros
CREATE TABLE sales (
    sale_id INT PRIMARY KEY, -- Chave primária
    book_id INT, -- Chave estrangeira, liga ao livro
    sale_date DATE NOT NULL, -- Data da venda
    quantity INT NOT NULL, -- Quantidade vendida
    FOREIGN KEY (book_id) REFERENCES books(book_id) -- Relaciona com 'books'
);

-- --------------------------------------
-- 3. INSERINDO DADOS
-- --------------------------------------
-- Inserindo dados na tabela 'authors'
INSERT INTO authors (author_id, first_name, last_name, country)
VALUES 
    (1, 'Jane', 'Austen', 'United Kingdom'),
    (2, 'Gabriel', 'García Márquez', 'Colombia'),
    (3, 'J.K.', 'Rowling', 'United Kingdom');

-- Inserindo dados na tabela 'books'
INSERT INTO books (book_id, title, author_id, price, publication_year)
VALUES 
    (101, 'Pride and Prejudice', 1, 15.99, 1813),
    (102, 'One Hundred Years of Solitude', 2, 19.99, 1967),
    (103, 'Harry Potter and the Sorcerer''s Stone', 3, 24.99, 1997),
    (104, 'Sense and Sensibility', 1, 14.99, 1811);

-- Inserindo dados na tabela 'sales'
INSERT INTO sales (sale_id, book_id, sale_date, quantity)
VALUES 
    (1001, 101, '2025-01-15', 5),
    (1002, 102, '2025-01-16', 3),
    (1003, 101, '2025-02-01', 2),
    (1004, 103, '2025-02-10', 10);

-- --------------------------------------
-- 4. CONSULTANDO DADOS (SELECT)
-- --------------------------------------
-- Selecionar todos os autores
-- O asterisco (*) retorna todas as colunas
SELECT * FROM authors;

-- Selecionar colunas específicas dos livros
SELECT title, price, publication_year 
FROM books;

-- Filtrar livros com preço maior que 15
SELECT title, price 
FROM books 
WHERE price > 15;

-- Filtrar livros publicados após 1900
SELECT title, publication_year 
FROM books 
WHERE publication_year > 1900;

-- --------------------------------------
-- 5. ORDENANDO RESULTADOS (ORDER BY)
-- --------------------------------------
-- Ordenar livros por preço (crescente)
SELECT title, price 
FROM books 
ORDER BY price ASC;

-- Ordenar livros por ano de publicação (decrescente)
SELECT title, publication_year 
FROM books 
ORDER BY publication_year DESC;

-- --------------------------------------
-- 6. AGRUPANDO DADOS (GROUP BY)
-- --------------------------------------
-- Contar quantos livros cada autor tem
SELECT 
    a.last_name AS autor, 
    COUNT(b.book_id) AS total_livros
FROM 
    authors a
LEFT JOIN 
    books b ON a.author_id = b.author_id
GROUP BY 
    a.last_name
ORDER BY 
    total_livros DESC;

-- Calcular o total de livros vendidos por livro
SELECT 
    b.title, 
    SUM(s.quantity) AS total_vendido
FROM 
    books b
LEFT JOIN 
    sales s ON b.book_id = s.book_id
GROUP BY 
    b.title
ORDER BY 
    total_vendido DESC;

-- --------------------------------------
-- 7. ATUALIZANDO DADOS (UPDATE)
-- --------------------------------------
-- Aumentar o preço de todos os livros em 10%
UPDATE books 
SET price = price * 1.10;

-- Atualizar o país de um autor específico
UPDATE authors 
SET country = 'England'
WHERE author_id = 1;

-- --------------------------------------
-- 8. EXCLUINDO DADOS (DELETE)
-- --------------------------------------
-- Excluir vendas antes de fevereiro de 2025
DELETE FROM sales 
WHERE sale_date < '2025-02-01';

-- Excluir um livro específico (cuidado com chaves estrangeiras!)
-- Certifique-se de que não há vendas associadas
DELETE FROM sales WHERE book_id = 104;
DELETE FROM books WHERE book_id = 104;

-- --------------------------------------
-- 9. JUNÇÕES (JOIN)
-- --------------------------------------
-- INNER JOIN: Listar livros com seus autores
SELECT 
    b.title, 
    CONCAT(a.first_name, ' ', a.last_name) AS autor
FROM 
    books b
INNER JOIN 
    authors a ON b.author_id = a.author_id;

-- LEFT JOIN: Incluir todos os autores, mesmo sem livros
SELECT 
    CONCAT(a.first_name, ' ', a.last_name) AS autor, 
    b.title
FROM 
    authors a
LEFT JOIN 
    books b ON a.author_id = b.author_id;

-- RIGHT JOIN: Incluir todos os livros, mesmo sem autor associado
SELECT 
    b.title, 
    CONCAT(a.first_name, ' ', a.last_name) AS autor
FROM 
    books b
RIGHT JOIN 
    authors a ON b.author_id = a.author_id;

-- --------------------------------------
-- 10. UNIÃO DE RESULTADOS (UNION)
-- --------------------------------------
-- Combinar listas de nomes de autores e títulos de livros
SELECT 
    CONCAT(first_name, ' ', last_name) AS nome
FROM 
    authors
UNION
SELECT 
    title AS nome
FROM 
    books;

-- UNION ALL: Incluir duplicatas (se houver)
SELECT 
    country AS local
FROM 
    authors
WHERE 
    country IS NOT NULL
UNION ALL
SELECT 
    'Store' AS local
FROM 
    sales;

-- --------------------------------------
-- 11. BOAS PRÁTICAS
-- --------------------------------------
-- - Use aliases (ex.: 'b' para 'books') para legibilidade.
-- - Comente o código para explicar o propósito.
-- - Sempre verifique chaves estrangeiras antes de excluir.
-- - Teste SELECT antes de UPDATE ou DELETE para evitar erros.
-- - Use WHERE em UPDATE e DELETE para não afetar todas as linhas.

-- --------------------------------------
-- 12. LIMPEZA (Opcional)
-- --------------------------------------
-- Para remover as tabelas e o banco (cuidado ao executar!)
/*
DROP TABLE sales;
DROP TABLE books;
DROP TABLE authors;
DROP DATABASE bookstore;
*/
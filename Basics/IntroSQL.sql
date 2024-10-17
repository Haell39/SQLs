-- Syntax and structure

SELECT column1, column2
FROM table_name
WHERE condition;

-- SELECT specifies the columns you want to retrieve from the table.
-- FROM specifies the table you want to retrieve data from.
-- WHERE (optional) specifies the conditions for filtering the data.

SELECT column1, column2
FROM table_name
WHERE condition
ORDER BY column1, column2
LIMIT number;

-- Querying data

SELECT column1, column2
FROM table_name;
--This statement retrieves the values from column1 and column2 in the table_name table.

-- Filtering data

SELECT column1, column2
FROM table_name
WHERE condition;
--The condition can be a comparison between columns or values using operators like =, <>, <, >, <=, >=. You can also use logical operators like AND, OR, NOT to combine multiple conditions.

-- Sorting data

SELECT column1, column2
FROM table_name
ORDER BY column1 ASC, column2 DESC;
--This statement sorts the data in ascending order based on column1 and descending order based on column2.

-- Modifying data
INSERT INTO table_name (column1, column2, ...)
VALUES (value1, value2, ...);
--This statement inserts a new row into table_name with the specified values for column1, column2, and so on.

-- Updating data
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
--This statement updates the values of column1, column2, and so on in table_name that match the specified condition.

-- Deleting data
DELETE FROM table_name
WHERE condition;
-- This statement updates the values of column1, column2, and so on in table_name that match the specified condition.

-- Data Types and Constraints

-- Data Types
-- INTEGER: 
-- FLOAT
-- VARCHAR
-- DATE
-- BOOLEAN

-- Constraints
-- Primary Key: Ensures the uniqueness of a column's value in a table, typically used to uniquely identify each row.
-- Foreign Key: Establishes a relationship between two tables, enforcing referential integrity.
-- Unique Constraint: Ensures the uniqueness of values in one or more columns.
-- Check Constraint: Defines a condition that must be true for a row to be valid.

-- Joins and Relationships

-- Relationships in Databases
-- There are three common types of relationships in databases:

-- One-to-One: A relationship where each record in one table is associated with at most one record in another table.
-- One-to-Many: A relationship where each record in one table can be associated with multiple records in another table.
-- Many-to-Many: A relationship where records in both tables can be associated with multiple records in the other table.
-- Establishing proper relationships between tables helps organize and structure the data effectively.

-- JOIN Statements

-- INNER JOIN: Retrieves rows that have matching values in both tables being joined.

-- LEFT JOIN: Retrieves all rows from the left table and matching rows from the right table (if any).

-- RIGHT JOIN: Retrieves all rows from the right table and matching rows from the left table (if any).

-- FULL JOIN: Retrieves all rows from both tables, including matching and non-matching rows.

-- Aggregation and Grouping

-- SUM: Calculates the sum of a column's values.
-- AVG: Calculates the average of a column's values.
-- COUNT: Returns the number of rows in a group.
-- MIN: Retrieves the minimum value from a column.
-- MAX: Retrieves the maximum value from a column.

-- Grouping data

SELECT column1, aggregate_function(column2)
FROM table_name
GROUP BY column1
--This statement groups the rows based on column1 and applies the aggregate function to each group.

--Subqueries and Views


-- A subquery is a query embedded within another query. It can be used in the WHERE or FROM clause of the outer query to retrieve data based on intermediate results. Subqueries allow you to break down complex problems into smaller, more manageable parts.

-- Views

-- Views are saved queries that act as virtual tables. They can be created using a SELECT statement and provide an abstraction layer over the underlying tables. Views simplify data retrieval by encapsulating complex queries into a single, reusable entity.

-- Indexing and Performance Optimization

--Indexes are data structures that provide quick access to specific data within a table

--Creating Indexes:

CREATE INDEX idx_name ON table_name (column1, column2);
--Creating indexes on appropriate columns can significantly speed up query execution

-- SEE MARDOWN FILE FOR MORE UNDERSTANDING AND INFO;



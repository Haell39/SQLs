--WORKING WITH DATABASES

CREATE DATABASE someDB;
DROP DATABASE someDB;

SHOW DATABASES;

USE someDB; --USING EXISTING DATABASE

SELECT * FROM departments; --SHOWING TABLES

SELECT * FROM dpt_no,
    dpt_name FROM departments; --SHOWING TABLES BUT WITH SPECIFIC COLUMNS

SELECT dept_name FROM departments WHERE dept_name LIKE '%eng%';
-- Retrieve dept_name column values from the departments
-- table where the dept_name value has the substring 'en'.

SELECT * FROM departments WHERE dept_name LIKE 'S____';
-- Retrieve all columns from the departments table where the dept_name
-- column starts with an 'S' and has exactly 4 characters after it.

SELECT DISTINCT title FROM titles; --SHOWS TITLE VALUES FROM TITLES TABLE BUT WITHOUT DUPLICATES

SELECT DISTINCT title FROM titlesORDER BY title ASC; --SHOWS TITLE VALUES FROM TITLES TABLE BUT WITHOUT DUPLICATES AND SORTED IN ASCENDING ORDER

-- -- USING the comparison operators -- --

SELECT * FROM departments WHERE dept_no = 'd001' OR dept_no = 'd002';

SELECT * FROM departments WHERE dept_no IN ('d001', 'd002');

SELECT * FROM departments WHERE dept_no NOT IN ('d001', 'd002');

SELECT * FROM departments WHERE dept_no BETWEEN 'd001' AND 'd002';



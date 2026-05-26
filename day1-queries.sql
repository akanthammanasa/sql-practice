--Day 1 SQL Practice-May 25
--Topics: SELECT,FROM,ORDER BY,LIMIT

--Show all columns from Fruits Store table
SELECT * FROM Fruits Store;

--shows only specific columns
SELECT FirstName, LastName, Country FROM Fruits Store;

--Filter by country
SELECT FirstName, LastName, Country
FROM Fruits Store
WHERE country = 'USA'

--Sort results
SELECT FirstName, LastName, Country
FROM Fruits Store
WHERE country = 'USA'
ORDER BY LastName;

--shows only 5 rows
SELECT * FROM Fruits Store LIMIT 5;
--Day 2 SQL Practice-May 26
--Topics: DISTINCT, Aggregate Functions, AS, GROUP BY, HAVING


--Without DISTINCT - Shows repeated countries
SELECT country FROM Fruits Store;

--With DISTINCT - Shows only unique countries
SELECT DISTINCT country FROM Fruits Store;


--COUNT : how many rows in the exists
SELECT COUNT(*) FROM Fruits Store;

--SUM : add up all values in a column
SELECT SUM(sales) FROM orders;

--AVG: calculate average 
SELECT AVG(profits) FROM orders;

--MAX: find highest value
SELECT MAX(sales) FROM orders;

--MIN: find lowest value
SELECT MIN(sales) FROM orders;

--We can combine them together
SELECT  COUNT(*), SUM(sales), AVG(profits), MAX(sales), MIN(sales) FROM orders;


--Without AS - column header shows as "SUM(sales)" which looks ugly
SELECT SUM(sales) FROM orders;

--With AS - column header shows as "Total_Sales" which looks clean
SELECT SUM(sales) AS Total_Sales FROM orders;
SELECT COUNT(*) AS Total_Orders, SUM(sales) AS Total_Sales, AVG(profits) AS Average_Profits, MAX(sales) AS Highest_Sales, MIN(sales) AS Lowest_Sales FROM orders;


--GROUP BY: total sales for the ENTIRE table (one number)
SELECT  SUM(sales) AS Total_Customers FROM orders;

--GROUP BY: total sales for each country (one number per region)
SELECT country, SUM(sales) AS Total_Sales FROM orders GROUP BY country;

--Count of orders for each category
SELECT category, COUNT(*) AS Order_Count FROM orders GROUP BY category;

--Average profits for EACH city
SELECT city, AVG(profits) AS Average_Profits FROM orders GROUP BY city;

--Multiple aggregates per group
SELECT country, COUNT(*) AS Total_Orders, SUM(sales) AS Total_Sales, AVG(profits) AS Average_Profits FROM orders GROUP BY country;

--WHERE filters rows before grouping, HAVING filters groups after grouping
--WHERE: filters individual rows first
SELECT country, SUM(sales) AS Total_Sales FROM orders WHERE category = 'Fruits' GROUP BY country;

--HAVING: filters groups after calculations
SELECT country, SUM(sales) AS Total_Sales FROM orders GROUP BY country HAVING SUM(sales) > 1000;

--Both together
SELECT country, SUM(sales) AS Total_Sales FROM orders WHERE category = 'Fruits' GROUP BY country HAVING SUM(sales) > 1000;
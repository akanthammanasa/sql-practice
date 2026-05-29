# Day 5 SQL Notes — May  29
## Topics Covered
Subqueries, CASE WHEN and String Functions


## What I Learned 

## Subqueries

### What is a Subquery
A query inside another query.
Inner query runs first → result used by outer query.
Always written inside brackets ( ).

### 3 Types
1. Subquery in WHERE → filter based on inner result
2. Subquery in SELECT → calculate a value per row
3. Subquery in FROM → use inner result as a table

### My Example
SELECT FirstName FROM customer
WHERE CustomerId IN (
    SELECT CustomerId FROM invoice
    WHERE Total > (SELECT AVG(Total) FROM invoice)
)

### Real World Use
Finding customers above average spending.
Finding products below average rating.


## CASE WHEN

### What it does
Creates a new column based on conditions.
Like Excel IF formula but with multiple conditions.

### Syntax
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ELSE default_result
END AS column_name

### My Example
CASE
    WHEN Total > 10 THEN 'High'
    WHEN Total > 5  THEN 'Medium'
    ELSE 'Low'
END AS invoice_category

### Excel Equivalent
=IF(D2>10,"High",IF(D2>5,"Medium","Low"))

### Real World Use
Segmenting customers into tiers.
Categorising products by price range.
Grouping countries into regions.


## String Functions

|  Function |     What It Does      |          Example             |
|-----------|-----------------------|------------------------------|
| UPPER()   | Converts to uppercase | UPPER('manasa') = 'MANASA'   | 
| LOWER()   | Converts to lowercase | LOWER('MANASA') = 'manasa'   |
| LENGTH()  | Counts characters     | LENGTH('Manasa') = 6         |
| SUBSTR()  | Extracts part of text | SUBSTR('Manasa',1,3) = 'Man' |
| REPLACE() | Replaces text         | REPLACE(email,'.com','.in')  |
| TRIM()    | Removes spaces        | TRIM(' Manasa ') = 'Manasa'  |
| \|\|      | Joins two strings     | FirstName\|\|' '\|\|LastName |

### Most Used in Real Work
UPPER() and LOWER() — for consistent comparisons
LENGTH() — for data validation
\|\| — for combining name columns
LIKE with % — for searching partial text



## Combined Query — Everything Together
SELECT UPPER(c.FirstName||' '||c.LastName) AS full_name,
       SUM(i.Total) AS total_spent,
       CASE
           WHEN SUM(i.Total) > 40 THEN 'Premium'
           ELSE 'Regular'
       END AS customer_tier
FROM customer AS c
INNER JOIN invoice AS i
ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
ORDER BY total_spent DESC

This uses: JOIN + GROUP BY + String Functions + CASE WHEN together.



## Exercises Completed
1. Subquery: invoices above average
2. Subquery: highest single purchase customer
3. CASE WHEN: label invoice values
4. CASE WHEN: count customers by continent
5. CASE WHEN + JOIN: customer tiers
6. String: full names in uppercase
7. String: find gmail customers
8. String: city codes with SUBSTR
9. Combined: all concepts in one query



## What Confused Me Today
While Learning and Practising queries are easy,but when solving query questions I got confused more in where to use which in Subqueries topic.

## Tomorrow's Topics
SQL Mini Project — Superstore Analysis
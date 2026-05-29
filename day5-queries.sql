-- Day 5 SQL Practice May 29
-- Topics:SUBQUERIES, CASE WHEN  and STRING FUNCTIONS


--- SUBQUERIES


-- Invoices above average
SELECT InvoiceId, Total
FROM invoice
WHERE Total > (SELECT AVG(Total) FROM invoice)

-- Customer with highest single purchase
SELECT FirstName, LastName
FROM customer
WHERE CustomerId = (
    SELECT CustomerId
    FROM invoice
    ORDER BY Total DESC
    LIMIT 1
)

-- Show invoice with average comparison
SELECT InvoiceId,
       Total,
       ROUND((SELECT AVG(Total) FROM invoice),2) AS avg_total
FROM invoice
ORDER BY Total DESC


--- CASE WHEN


-- Label invoices by value
SELECT InvoiceId,
       Total,
       CASE
           WHEN Total >= 10 THEN 'High Value'
           WHEN Total >= 5  THEN 'Medium Value'
           ELSE 'Low Value'
       END AS value_category
FROM invoice
ORDER BY Total DESC

-- Count customers by continent
SELECT 
    CASE
        WHEN Country IN ('USA','Canada') THEN 'North America'
        WHEN Country IN ('Brazil','Argentina','Chile') THEN 'South America'
        WHEN Country IN ('Germany','France','UK','Italy') THEN 'Europe'
        ELSE 'Other'
    END AS continent,
    COUNT(*) AS customer_count
FROM customer
GROUP BY continent
ORDER BY customer_count DESC

-- Customer tiers with JOIN
SELECT c.FirstName,
       c.LastName,
       SUM(i.Total) AS total_spent,
       CASE
           WHEN SUM(i.Total) > 40 THEN 'Premium Customer'
           WHEN SUM(i.Total) > 20 THEN 'Regular Customer'
           ELSE 'New Customer'
       END AS customer_tier
FROM customer AS c
INNER JOIN invoice AS i
ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
ORDER BY total_spent DESC


--- STRING FUNCTIONS


-- Full names uppercase
SELECT UPPER(FirstName || ' ' || LastName) AS full_name_upper,
       Email
FROM customer

-- Find gmail customers
SELECT FirstName, LastName, Email
FROM customer
WHERE Email LIKE '%gmail%'

-- City codes
SELECT BillingCity,
       SUBSTR(BillingCity, 1, 3) AS city_code,
       COUNT(*) AS invoice_count
FROM invoice
GROUP BY BillingCity
ORDER BY invoice_count DESC


--- COMBINED: JOIN + GROUP BY + CASE + STRING

SELECT UPPER(c.FirstName) || ' ' || UPPER(c.LastName) AS full_name,
       LENGTH(c.FirstName) AS name_length,
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
LIMIT 10
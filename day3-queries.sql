--Day 3 SQL Practice-May 27
--Topic: ORDER BY Advanced


-- 1. Display all employees by salary ascending

SELECT *
FROM employees
ORDER BY salary ASC;


-- 2. Display all employees by salary descending

SELECT *
FROM employees
ORDER BY salary DESC;


-- 3. Sort employees alphabetically by name

SELECT *
FROM employees
ORDER BY emp_name;


-- 4. Show IT employees by highest salary

SELECT *
FROM employees
WHERE department = 'IT'
ORDER BY salary DESC;


-- 5. Sort employees by department and salary

SELECT *
FROM employees
ORDER BY department ASC, salary DESC;


-- 6. Show top 3 highest paid employees

SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 3;


-- 7. Show departments by average salary

SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC;


-- 8. Show employees from Hyderabad sorted by name

SELECT *
FROM employees
WHERE city = 'Hyderabad'
ORDER BY emp_name;


-- 9. Display lowest paid employee

SELECT *
FROM employees
ORDER BY salary ASC
LIMIT 1;


-- 10. Display employees sorted by city

SELECT *
FROM employees
ORDER BY city ASC;
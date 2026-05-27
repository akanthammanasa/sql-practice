# Day 3 SQL - May 27

## Topics Coverd
ORDER BY Advance

## What I Learned 
### Definition:
ORDER BY is used to sort query results
in ascending or descending order.

### Default:
Ascending order (ASC)

### Syntax:
SELECT column_name
FROM table_name
ORDER BY column_name ASC;

### Descending:
ORDER BY column_name DESC;

#### ORDER BY SINGLE COLUMN
ASC - Sorts salary in ascending order.
Lowest salary appears first.

DESC - Highest salary appears first.

#### ORDER BY MULTIPLE COLUMNS
First sorts by department.
Then sorts salary within department.

#### ORDER BY COLUMN POSITION
2 refers to second selected column.
Not recommended in large queries.

#### ORDER BY TEXT VALUES
Sorts in Alphabetical order.

#### ORDER BY WITH WHERE
Filters IT employees,
then sorts by salary.

#### ORDER BY WITH LIMIT
Sorts Top 3 highest salaries.

#### ORDER BY AGGREGATE FUNCTIONS
Sort departments by average salary.

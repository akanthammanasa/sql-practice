# Day 4 SQL Notes - May 28

## Topics Covered
JOINs

## What I Learned

### Why JOINs Exist
To combine related data from different tables.

### INNER JOIN
Returns only matching rows from both tables.

### LEFT JOIN
Returns all rows from left table.
Non-matching rows show NULL.

### INNER JOIN vs LEFT JOIN
INNER JOIN - only matching rows 
LEFT JOIN - all left rows + matching right rows

### Table Aliases
Short nicknames for table names.
customers AS c, orderd AS o.

## What Confused Me Today
 while solving queries on INNER JOIN I got confused more because of duplicated rows appeared.After watching tutorials on youtube and with help of google, I got to know that this usually happens when
 - the joining column contains repeated values 
 OR
 - the wrong column is used in the ON condition.
## Tomorrow's Topics
- Subqueries
- CASE Statements
- String Functions
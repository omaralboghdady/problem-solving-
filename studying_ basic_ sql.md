#               ============SQL NOTES============
## " SELECT " used to retrieve choosen coulmns from choosen table 
``` sql 
    
    SELECT id 
    FROM customers
```
## " DISTINCIT " used to avoid duplicates in a coulmn 
``` sql
   
    SELECT  DISTINCT country 
    FROM customers

```
## " ORDER BY " used to order selected rows in asc and desc
```sql
    
    SELECT * 
    FROM customers
    ORDER BY score ASC ; 

```
***!!! you can replace the name of the column by its order in the table*** 

**WARNNING !!!** :  avoid using this method 
```sql
   
    SELECT * 
    FROM customers
    ORDER BY  4 ASC ,5 DESC; 

```
## " WHERE " clause is used to implement conditions 
``` sql 

    SELECT * 
    FROM customers 
    WHERE country = 'Germany';

```
## " IN " return true if a value  is in alist of values 
``` sql
    
    SELECT * 
    FROM customers 
    WHERE customer_id IN (1,2,5)

```
## " LIKE " return true of a value matches a pattern 
( **%** )  It matches anything

( **_** ) It matches one character

`Examples` 

find names begin with 'M' -----> M%

find names end with 'N' -----> %N

find names containing 'R' somewhere ----->%r%

find names that have 'F' in 3rd place ----->_ _ F%
``` sql 
    
    SELECT * 
    FROM customers 
    WHERE first_name LIKE 'M%';

```
###### ------------------------------------
```sql
    SELECT * 
    FROM customers 
    WHERE first_name LIKE '__r%';
```
## joining tables 
###      1- INNER JOIN ( only common rows )
###      2- LEFT JOIN  ( rows of the first table + common rows )
###      3- RIGHT JOIN ( rows of the seconde table + common rows )
###      4- FULL JOIN  ( all the rows of both tables )
# 
### 1 - INNER JOIN 

``` sql
SELECT 
	c.customer_id ,
	c.first_name,
	o.order_id,
	o.quantity 
FROM customers 
AS c 
INNER JOIN orders 
AS o
ON c.customer_id = o.customer_id
```

### 2- LEFT JOIN 

```sql
SELECT 
	c.customer_id ,
	c.first_name,
	o.order_id,
	o.quantity 
FROM customers 
AS c 
LEFT JOIN orders 
AS o
ON c.customer_id = o.customer_id
```

### 3- RIGHT JOIN 

```sql
SELECT 
	o.customer_id ,
	c.first_name,
	o.order_id,
	o.quantity 
FROM customers 
AS c 
RIGHT JOIN orders 
AS o
ON c.customer_id = o.customer_id
```

### 4- FULL JOIN

***!!! warning  -->> Avoid using it in big tables***

***" MY SQL " doesn't support " FULL OUTER JOIIN , we use " UNION " between the " LEFT JOIN " and " RIGHT JOIN "***
```sql
SELECT 
	c.customer_id ,
	c.first_name,
	o.order_id,
	o.quantity 
FROM customers 
AS c 
FULL JOIN orders 
AS o
ON c.customer_id = o.customer_id
```
### 5- UNION
```sql
SELECT 
    c.customer_id,
    c.first_name,
    o.order_id,
    o.quantity 
FROM customers AS c 
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id;
UNION
SELECT 
    c.customer_id,
    c.first_name,
    o.order_id,
    o.quantity 
FROM customers AS c 
RIGHT JOIN orders AS o
ON c.customer_id = o.customer_id;
```
## " UNION - UNION ALL " are used to combine the rows of columns with the same name 
### " UNION " it removes duplicates 
### " "UNION ALL " it keeps the duplicates 
***the first query controls the naming of the columns*** 
***to union two queries it must have the same datatype and the same number of columns***  
##### UNION 
```sql
SELECT 
first_name ,
last_name ,
country 
FROM customers
UNION 
SELECT 
first_name,
last_name ,
emp_country
FROM employees
```
##### UNION ALL
```sql
SELECT 
first_name ,
last_name ,
country 
FROM customers
UNION ALL
SELECT 
first_name,
last_name ,
emp_country
FROM employees
```
##      _____ Aggregate functions _____
#
#### " COUNT( ) " returns the number of all raws in the table using ' * ' or number of all rows    in                  a column 
```sql
SELECT 
COUNT(*) AS 'all rows',
COUNT(score) AS score
FROM customers
```            
#### " SUM( )" returns the sunm of all numbers in a coulmn 
```sql
SELECT 
SUM(quantity)
FROM orders
```
#### " MAX ( ) " returns the maximum value in a coulmn 
```sql
SELECT 
MAX(score) AS MAX_SCORE 
FROM customers 
```
#### " MIN ( ) "  returns the minimum value in a coulmn 
```sql
SELECT 
MIN(score) AS MIN_SCORE 
FROM customers 
```
##                    _____ string function ____
#### " CONCAT( ) " returns the combination of two string column 
```sql
SELECT 
CONCAT(first_name,' ',last_name) AS Full_Name
FROM customers
```
#### " UPPER( ) "," LOWER ( ) " change the string into lower and upper case
```sql
SELECT 
LOWER(CONCAT(first_name,' ',last_name) ) AS Full_Name
FROM customers
```
#### " LTRIM( ) " , " RTRIM ( ) " , " TRIM ( ) " used to remove white spaces 
``` sql
SELECT 
-- LTRIM(last_name) AS trimmed_lastname
-- RTRIM(last_name) AS trimmed_lastname
-- TRIM(last_name) AS trimmed_lastname
FROM customers
```
#### " LENGTH ( ) " return the length of the string 
```sql
SELECT 
LENGTH(TRIM(last_name)) AS length_lastname
FROM customers
```
#### " SUBSTRING (coulmn,start,end) " slice strings in a column
```sql
SELECT 
SUBSTRING(last_name, 2, 3) AS substrings 
FROM customers
```
##  " GROUP BY " used to arrange rows in coulmns into groups 
***the aggregation function is applied after grouping***
```sql
SELECT 
SUM(score),country
FROM customers 
GROUP BY country ;
```
## 👉 In SQL, every column in the SELECT list must be:

**1- Part of the GROUP BY clause, OR**

**2- Wrapped in an aggregate function (COUNT, SUM, AVG…)**
## " HAVING " used to filter the query after grouping 

```sql
SELECT 
COUNT(customer_id),
country
FROM customers 
GROUP BY country 
HAVING COUNT(customer_id)>1
```
##          ____ SUBqueries ____

***simple nested query***

***!!! always give the subquery an alias***
```sql
SELECT * 
FROM 
(
SELECT quantity 
FROM orders 
) AS sub 
```
#### " EXISTS " 
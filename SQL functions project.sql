

SELECT * FROM products;


----  AGGREGATE FUNCTIONS ----


--Total quantity avaliable of all product ---- use SUM()
SELECT SUM (quantity) AS total_quantity
FROM products;



--Total quantity of Electronics product whose price is greater than or equal to 20000 
SELECT SUM (quantity) AS total_quantity
FROM products
WHERE category = 'Electronics' AND price >= 20000;


--Find total number of products---- COUNT
SELECT COUNT (*) AS total_product
FROM products;


---Find AVG price of product ---- AVG
SELECT AVG (price) AS total_product
FROM products;


--- find MAX price and MAX quantity from price and quantity ---- MAX
SELECT MAX (price) AS maximum_price,
		MAX (quantity) AS maximum_qty
FROM products;


--- find MIN price and MIN quantity from price and quantity ---- MIN
 SELECT MIN (price) AS minimum_price,
		MIN (quantity) AS minimum_qty
FROM products;


---- STRING FUNCTIONS ----


-- Get all the category in UPPER case --- UPPER 
SELECT UPPER (category) AS capital_category
FROM products;


-- Get all the category in LOWER case --- LOWER
SELECT LOWER (category) AS samall_category
FROM products;

--- Join product name and categroy with hyphen --- CONCAT
SELECT CONCAT (product_name,'-',category) AS product_category
FROM products;


--- Extract the first 5 characters from product name --- SUBSTRING
SELECT SUBSTRING (product_name,1,5) AS short_name
FROM products;


--- Count LENGTH of products from product name --- LENGTH
SELECT LENGTH (product_name) AS product_name_count
FROM products;

--- Remove leading & trailing or unwanted spaces from string --- TRIM
SELECT TRIM ('    Monitor                  ') AS trimmred_name;


---REPLACE the word "phone" with "device" in product name --- REPLACE 
SELECT REPLACE (product_name, 'phone', 'device') AS updated_name
FROM products;


---Get first 3 character from category --- LEFT
SELECT LEFT (category, 3) AS first_3
FROM products;

---Get last 3 character from category --- RIGHT
SELECT RIGHT (category, 3) AS first_3
FROM products;


SELECT * FROM products;

--- Date Functions---

--- Get current date and time --- NOW()
SELECT NOW () AS current_date_time; 


--- Get current date --- CURRENT_DATE
SELECT CURRENT_DATE AS current_datee;


--- Get days difference from 2 date like current date and added_date
SELECT added_date, CURRENT_DATE ,(CURRENT_DATE - added_date) 
AS days_difference
FROM products;


--- Extract the year, month, day from added_date column --- EXTRACT
SELECT product_name,
	EXTRACT (YEAR FROM added_date) AS year,
	EXTRACT (MONTH FROM added_date) AS month,
	EXTRACT (DAY FROM added_date) AS day
	FROM products;


--- Calculate AGE between dates 
             ---OR 
---calculate the time difference between added_date and today's date--- AGE 
SELECT product_name,
AGE (CURRENT_DATE,added_date) AS age_difference
FROM products;


---Format change added_date in a custom format (DD-MON-YYYY) --- TO_CHAR
SELECT product_name,
TO_CHAR (added_date,'DD-MON-YYYY') AS formated_date
FROM products;


--- Extract the day of week from added_date -column ---  DATE_PART
SELECT product_name,added_date,
DATE_PART ('isodow', added_date) AS day_of_week,
DATE_PART ('year', added_date) AS year,
DATE_PART ('month', added_date) AS month,
DATE_PART ('day', added_date) AS day,
DATE_PART ('hour', added_date) AS hour,
DATE_PART ('minute', added_date) AS minute,
DATE_PART ('second', added_date) AS second,
DATE_PART ('week', added_date) AS week,
DATE_PART ('quarter', added_date) AS quarter,
DATE_PART ('decade', added_date) AS decade,
DATE_PART ('millennium', added_date) AS millennium,
DATE_PART ('epoch', added_date) AS epoch
FROM products;


--- Truncate added_date to start of the week --- DATE_TRUNC
SELECT product_name, added_date,
DATE_TRUNC ('week', added_date) AS week_start,
DATE_TRUNC('year', added_date) AS year_start,
DATE_PART ('isodow', added_date) AS day_of_week
FROM products
WHERE category = 'Electronics' AND price >= 2000 ORDER BY product_id ASC;


---Add or Substract Time INTERVAL / Add 6 month to the added_date --- INTERVAL
SELECT product_name, added_date,
added_date + INTERVAL '6month' AS new_month
FROM products;


---Retrive only current time --- CURRENT TIME
SELECT CURRENT_TIME AS currenttime;


--- Convert a string to a date format--- TO DATE
SELECT TO_DATE('23-10-2026','DD-MM-YYYY') AS CONVERTED_DATE; 



--- CONDITIONAL FUNCTIONS ---

/* Expensive if there price is greater than or equal 
 Moderate if the price is between 10000 to 49999
Affordable if the price is less than 10000
---    Use CASE   --- */

SELECT product_name, category, price,
CASE
WHEN price>=50000 THEN 'Expensive'
WHEN price>=10000 AND price<=49999 THEN 'Moderate'
WHEN price<10000 AND price >=5000 THEN 'Affordable'
ELSE 'Cheap' END AS price_category
FROM products;


SELECT * FROM products ORDER BY category ASC;

---Assignment 1 on CASE ---
/* In stock if quantity is 40 or more
   Limited stock if quantity is between 20 to 39
   Out of stock soon if quantity is less than 20
   ------ Use CASE ----- */


   
SELECT product_name, price, quantity,category,
CASE
WHEN quantity>=40 THEN 'In Stock'
WHEN quantity<40 AND quantity>=20 THEN 'Limited Stock'
ELSE 'Out of stock soon' END AS Avaliable_quantity
FROM products; 



---Assignment 2 on CASE ---
/*Check if the category name contains "Electronic item" 
   or "Furniture item" or "Accessory item" using LIKE
   -------Use CASE --------*/

SELECT product_name, price, quantity,category,
CASE
WHEN category = 'Electronics' THEN 'Electronic item'
WHEN category = 'Furniture' THEN 'Furniture item'
ELSE 'Accessory item' END AS updated_category
FROM products; 



--- using IN in case
SELECT *,
CASE 
WHEN price IN (75000.50,45000.99,12000.99) Then 'Very Good'
WHEN price IN (9500,8000,7500,6500,5500) THEN 'Good'
ELSE 'Bad' END AS Rank
FROM products;




---
SELECT *,
CASE 
WHEN price>=10000 Then 'Nice'
WHEN price>=5000 AND price <10000 THEN 'Good'
ELSE 'Bad' END AS Rank
FROM products;



SELECT * FROM products  ORDER BY product_id ASC;


--- Adding a new column name discount_price in products_table
ALTER TABLE products
ADD COLUMN discount_price NUMERIC (10,2);



--- Retrive new price after 10% discount on every product except laptop and desk

UPDATE products
SET discount_price = price*90/100
WHERE product_name NOT IN ('Laptop', 'Desk');



--- Remove discount price from laptop and desk 
UPDATE products
SET discount_price = NULL
WHERE product_name IN ('Laptop', 'Desk');


--- Retrive product name and their final price --- USE COALESCE
SELECT product_name,
COALESCE (discount_price,price) AS final_price
FROM products;



SELECT * FROM products;


---- WINDUW FUNCTION ----


--Assign a unique ROW_NUMBER to each product witn in the same category --- ROW NUMBER

SELECT product_name,category,price,
 ROW_NUMBER () OVER (PARTITION BY category ORDER BY price DESC)
AS row_number
FROM products;


--- Assign a unique ROW_NUMBER to each product witn in the same category --- DENSE_RANK

SELECT product_name,category,price,
 DENSE_RANK () OVER (PARTITION BY category ORDER BY price DESC)
AS ranking
FROM products;


--- Do sum by category and show their running total
SELECT product_name,category,price,
 SUM (price) OVER (PARTITION BY category ORDER BY price DESC)
AS running_total
FROM products;



--- Do avg by category and show their running total
SELECT product_name,category,price,
 AVG (price) OVER (PARTITION BY category ORDER BY price DESC)
AS running_total
FROM products;


--- Find highest price & product by category --- ROW_NUMBER or RANK or DENSE_RANK
--- ROW_NUMBER ()
SELECT product_name, category,price FROM(
SELECT product_name,category,price,
 ROW_NUMBER () OVER (PARTITION BY category ORDER BY price DESC)
AS ranking
FROM products) AS highest
WHERE ranking = 1;



--- RANK ()
SELECT product_name, category,price FROM(
SELECT product_name,category,price,
 RANK () OVER (PARTITION BY category ORDER BY price DESC)
AS ranking
FROM products) AS highest
WHERE ranking = 1;



--- DENSE_RANK ()
SELECT product_name, category,price FROM(
SELECT product_name,category,price,
 DENSE_RANK () OVER (PARTITION BY category ORDER BY price DESC)
AS ranking
FROM products) AS highest
WHERE ranking = 1;


--- Know previous product price --- LAG

SELECT product_name, category,price,
LAG (price) OVER (ORDER BY price DESC)
AS prv_pdt_price
FROM products;


--- Know next product price --- LEAD


SELECT product_name, category,price,
LEAD (price) OVER (ORDER BY price DESC)
AS prv_pdt_price
FROM products;









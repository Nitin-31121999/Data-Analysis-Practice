USE zomato;
-- Count number of rows
SELECT count(*) FROM users;

-- Return n number records
SELECT * FROM users order by rand() LIMIT 5;

-- Find null values
SELECT * FROM orders where restaurant_rating is null;

-- Find orders placed by each customer
SELECT t2.name,count(*) AS "Num_Of_Orders" FROM orders t1 LEFT JOIN users t2 
ON t1.user_id=t2.user_id 
GROUP BY t2.name;

-- To replace null values with zero
update orders set restaurant_rating = 0 where restaurant_rating is null;

-- Find restaurant with most number of menu items
SELECT r_name,count(menu_id) AS "Menu_items" FROM menu t1 LEFT JOIN restaurants t2
ON t1.r_id=t2.r_id GROUP BY t2.r_name;

-- Find number of votes and average rating for all restaurants
SELECT r_name,count(*) AS"Votes" ,round(avg(restaurant_rating),2) AS "Average rating" FROM orders t1 
LEFT JOIN restaurants t2 ON
t1.r_id=t2.r_id GROUP BY t2.r_name;

-- Find the food that is being sold at most number of restaurants
SELECT t1.f_name,count(*) AS "number" FROM food t1 JOIN 
menu t2 ON t1.f_id=t2.f_id GROUP BY t1.f_name ORDER BY number DESC LIMIT 1;

-- Find restaurant with maximum revenue 
SELECT t1.r_name,sum(price) AS "Price"  FROM restaurants t1
JOIN menu t2 ON t1.r_id=t2.r_id GROUP BY r_name ORDER BY price DESC LIMIT 1 ;

-- Find restaurant with maximum revenue in given month
-- SELECT r_id,MONTHNAME(DATE(date)) AS "Month" FROM orders 
SELECT t2.r_name, SUM(amount) AS 'revenue'
FROM orders t1
JOIN restaurants t2 ON t1.r_id = t2.r_id
WHERE MONTHNAME(DATE(date)) = 'June'
GROUP BY t2.r_name, t1.r_id ORDER BY revenue DESC limit 1;

-- Find restaurants with sales>1500
SELECT t2.r_name,sum(amount) AS "Amount" FROM orders t1 JOIN
restaurants t2 ON t1.r_id = t2. r_id 
GROUP BY t2.r_name Having Amount>1500;

-- Find customers who have never ordered
SELECT user_id FROM users
EXCEPT 
SELECT user_id FROM orders 







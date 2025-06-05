-- Find all the movies that have a rating higher than the average rating of movies in the same genre 
 SELECT * FROM movies m1
 where score > (SELECT avg(score) FROM movies m2 where m2.genre=m1.genre);
 
-- Get the percentage of votes for each movie compared to the total number of votes
SELECT name,((votes)/ (select sum(votes) FROM movies))*100 AS "Percentage of votes"  FROM movies;

-- Display all movie name,genre,score and avg(score) of genre
SELECT name,score,genre,
(select avg(score) from movies m2 where m1.genre=m2.genre)
from movies m1;

-- Write a solution to find the ids of products that are both low fat and recyclable.
SELECT product_id FROM Products where low_fats="Y" AND recyclable ="Y";

-- Find the names of the customer that are not referred by the customer with id = 2
SELECT name FROM Customer where referee_id <>2  OR referee_id is null;

-- A country is big if: it has an area of at least three million (i.e., 3000000 km2), or
-- it has a population of at least twenty-five million (i.e., 25000000).
-- Write a solution to find the name, population, and area of the big countries.
SELECT name,population,area FROM World where area>=3000000 OR population>=25000000;

-- Write a solution to find all the authors that viewed at least one of their own articles.
SELECT distinct(author_id) AS "id" FROM Views where author_id=viewer_id ORDER BY id ASC;

-- Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.
SELECT t2.unique_id,t1.name FROM Employees t1
LEFT JOIN EmployeeUNI t2  
ON t1.id=t2.id;

-- Write a solution to report the product_name, year, and price for each sale_id in the Sales table.
SELECT t2.product_name,t1.year,t1.price FROM Sales t1 
JOIN Product t2
ON t1.product_id=t2.product_id;

-- Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.
SELECT customer_id,count(*) AS "count_no_trans" FROM Visits
where visit_id  NOT IN 
(SELECT distinct(visit_id) FROM Transactions)
GROUP BY customer_id;

-- Write a solution to report the name and bonus amount of each employee with a bonus less than 1000
SELECT name,bonus  FROM Employee t1
LEFT JOIN Bonus t2
on t1.empId=t2.empId
where bonus is null or bonus<1000;

-- Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".
SELECT * FROM cinema 
where description <> "boring" 
AND id%2<>0
order by rating DESC;

-- Write a solution to calculate the number of unique subjects each teacher teaches in the university.
SELECT teacher_id,count(distinct(subject_id)) As "cnt" FROM Teacher GROUP BY teacher_id;

-- Write a solution to find all sales that occurred in the first year each product was sold.
-- For each product_id, identify the earliest year it appears in the Sales table.
-- Return all sales entries for that product in that year.
SELECT product_id,min(year) AS "First_year",quantity,price FROM Sales GROUP BY product_id;


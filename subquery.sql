SELECT * FROM movies;
USE movies;
-- Find the movie with highest rating
SELECT * FROM movies
where score = (SELECT max(score) AS "highest_rating" FROM movies);

-- Indeopendent Subquery (Scalar)
-- Find the movie with highest profit 
SELECT * FROM movies
where gross- budget =(SELECT max(gross-budget) FROM movies);

-- Find how many movies  have a rating >the avg of all the movies ratings(Find the count of above average movies)
select count(*) AS "Count" from movies
where score > (SELECT avg(score) AS "Average_Rating" from movies);
 
 -- Find the highest rated movies of 2000
 SELECT * FROM movies 
 where year = 2000 and score = (SELECT MAX(score) FROM movies where year=2000);
 
 -- Find the highest rated movie among all movie whose number of votes are > the dataset avg votes
 SELECT * FROM movies 
 where score =(SELECT max(score) FROM movies
 where votes > (select avg(votes) FROM movies));
 
USE zomato;
-- Find all users who have never ordered
select * from users where user_id NOT IN (SELECT distinct(user_id) from orders);

-- Find all the movies made by top 3 directors (in terms of total gross income)
SELECT * FROM movies  where director in (SELECT director FROM movies
group by director order by sum(gross) DESC LIMIT 3);

-- Find all movies of all those actors whose filmography avg rating>8.5 (take 25000 votes as cutoff)
SELECT * FROM movies
where star IN (SELECT star FROM movies
where votes>25000
Group BY star
having avg(score)>8.5);

-- Find the most profitable movie of each year
SELECT name FROM movies
Group by year;


	


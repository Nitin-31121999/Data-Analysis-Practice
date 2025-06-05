CREATE DATABASE subject;
CREATE TABLE marks (
  student_id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255),
  branch VARCHAR(255),
  marks INTEGER
);

INSERT INTO marks (name, branch, marks) VALUES
('Nitish', 'EEE', 82),
('Rishabh', 'EEE', 91),
('Anukant', 'EEE', 69),
('Rupesh', 'EEE', 55),
('Shubham', 'CSE', 78),
('Ved', 'CSE', 43),
('Deepak', 'CSE', 98),
('Arpan', 'CSE', 95),
('Vinay', 'ECE', 95),
('Ankit', 'ECE', 88),
('Anand', 'ECE', 81),
('Rohit', 'ECE', 95),
('Prashant', 'MECH', 75),
('Amit', 'MECH', 69),
('Sunny', 'MECH', 39),
('Gautam', 'MECH', 51);
SELECT * FROM marks;
SELECT *,avg(marks) over(partition by branch) AS "average" FROM marks;

SELECT *,
MIN(marks) over() AS "Overall_min_marks",
max(marks) over() AS "Overall_max_marks",
min(marks) over(partition by branch) AS "min_marks_branch",
max(marks) over(partition by branch) AS "max_marks-branch"
from marks
order by student_id;

select * FRom (SELECT *,avg(marks) over(partition by branch) AS "avg_marks" FROM marks)t
where t.marks>t.avg_marks;

SELECT *,
dense_rank() over(partition by branch order by marks desc)
from marks;
 
 SELECT *,
 concat(branch,"-",ROW_NUMBER() over(partition by branch))
 from marks;
 
 Select * from zomato.orders;
 use zomato;

 select * from (select monthname(date),user_id,sum(amount),
 rank() over(partition by monthname(date) order by sum(amount) desc) AS "rank"
 from orders 
 group by monthname(date),user_id
 order by monthname(date) desc)t
 where t.rank<3;
 
 use subject;
 SELECT *,
 first_value(name) over(partition by branch order by marks desc)
 from marks;
 
 SELECT *,
 last_value(name) over(partition by branch order by marks asc)
 from marks;
SELECT * FROM marks;
SELECT *,
first_value(marks) over (partition by branch order by marks desc) AS "Topper_marks"
FROM marks;
 
 SELECT *,
last_value(marks) over (partition by branch order by marks desc
rows between unbounded preceding and unbounded following) AS "lowest_marks"
FROM marks;

 SELECT *,
nth_value(marks,2) over (partition by branch order by marks desc
rows between unbounded preceding and unbounded following) AS "second_marks"
FROM marks;    

SELECT *,
lag(marks) over(partition by branch order by marks),
lead(marks) over(partition by branch order by marks)
from marks;

 USE zomato;
 Select * from orders;
 
 
 
 
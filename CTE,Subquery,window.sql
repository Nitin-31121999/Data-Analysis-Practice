USE data_science;
Select year(current_date()) from sal;
SELECT * FROM sal;
SELECT count(*) AS "Number Of rows" FROM sal;

-- Countries who give work fully remotely, for the title 'managers’ Paying salaries Exceeding $90,000 USD
SELECT distinct(company_location) FROM sal where remote_ratio=100 and  job_title like "%Manager%" and salary_in_usd>90000;

-- Identifying top 5 Country Having greatest count of large (company size) number of companies.
SELECT company_location,count(*) AS "cnt" FROM 
(SELECT * from sal where experience_level="EN" and company_size="L")t
group by company_location
order by cnt DESC
LIMIT 5;

-- Who enjoy fully remote roles WITH salaries Exceeding $100,000 USD, Shedding light ON the attractiveness of high-paying remote positions IN today's job market.
set@total=(SELECT count(*) FROM sal where salary_in_usd>100000);
set@count=(SELECT count(*) FROM sal where salary_in_usd>100000 and remote_ratio=100);
set@percentage=round((select @count)/(select @total)*100,2);
select @percentage As "Percentage";

-- Your Task is to identify the Locations where entry-level average salaries exceed the average salary for that job title IN market for entry level 
select t.job_title,t.Average_Salary,m.company_location,m.Average_Salary_Country from 
(Select job_title,avg(salary_in_usd) AS "Average_Salary" FROM sal 
group by job_title)t
join 
(Select company_location,job_title,avg(salary_in_usd) AS "Average_Salary_Country" FROM sal 
group by job_title,company_location)m
on t.job_title=m.job_title
where Average_Salary_Country > Average_Salary;

-- Your job is to Find out for each job title which. Country pays the maximum average salary. This helps you to place your candidates IN those countries.
Select * from (Select *,dense_rank()
over(partition by job_title order by Average_Salary desc)  AS "num" from
(SELECT company_location,job_title,avg(salary_in_usd)  as "Average_Salary" FROM sal
group by company_location,job_title)t
)m
where num =1;  

-- Your goal is to Pinpoint Locations WHERE the average salary Has consistently Increased over the Past few years 
-- (Countries WHERE data is available for 3 years Only(present year and past two years) providing Insights into Locations experiencing Sustained salary growth.
select * from sal 
where company_location in 
(Select company_location from
(Select company_location,avg(salary_in_usd) as "Average_Salary",count(distinct(work_year)) as "cnt"  from sal 
where work_year >= (year(current_date())-3)
group by company_location
having cnt=3)t
)




 
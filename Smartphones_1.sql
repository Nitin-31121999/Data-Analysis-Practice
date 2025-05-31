-- Find Top 5 Samsung phones with biggest scrren size
Select model,screen_size FROM nitin.smartphones where brand_name="samsung" 
ORDER BY screen_size DESC LIMIT 5 ;

-- Sort all the phones in descending order of number of total cameras
SELECT *,num_rear_cameras+num_front_cameras AS "Total_Cameras" FROM nitin.smartphones
ORDER BY Total_Cameras DESC;

-- Sort data on the basis of ppi in descending order
SELECT*,round(sqrt(resolution_height* resolution_height + resolution_width+resolution_width)/screen_size)
 AS ppi FROM nitin.smartphones order by ppi DESC;

-- Find the phone with second largest battery
SELECT brand_name,model,battery_capacity FROM nitin.smartphones
ORDER BY battery_capacity DESC LIMIT 1,1;

-- Find the name and rating of worst rated apple phone
SELECT * FROM nitin.smartphones where brand_name ="apple"
ORDER BY rating ASC LIMIT 1;

-- Sort phones alphabetically and then on the basis of price in asc order
SELECT * FROM nitin.smartphones ORDER BY brand_name ASC ,price ASC;

-- Sort phones alphabetically and then on the basis of rating in DESC order
SELECT * FROM nitin.smartphones ORDER BY brand_name ASC ,rating DESC;

-- Group smartphones by brand and get the count, average price, max rating, avg screen size and avg battery capacity
SELECT brand_name,count(*) AS "Num_Phones",
round(avg(price)) AS "Average_Price",
max(rating) AS "Max_Rating",
round(avg(screen_size)) AS"Avg_Screen_Size",
round(avg(battery_capacity)) AS "Avg_Battery_Capacity"
FROM nitin.smartphones 
GROUP BY brand_name ORDER BY NUM_Phones DESC LIMIT 5;

-- Group smartphone by whether they have an NFC and get the average price and rating
SELECT has_nfc,round(avg(price)) AS "Average_Price",
round(avg(rating)) AS "Average Rating" FROM nitin.smartphones GROUP BY has_nfc;

-- Group smartphones by the extended memory available and get the average price
SELECT extended_memory_available, round(avg(price)) AS "Avg_Price" FROM nitin.smartphones
GROUP BY extended_memory_available;

-- Find the top 5 most costly phone brands 
SELECT brand_name,count(*) AS "Num_Of_Phones",avg(price) AS "Average_Price" FROM nitin.smartphones 
GROUP BY brand_name
HAVING count(*)>20
order by Average_Price DESC;

-- Which brand makes the smallest screen smarrtphones
SELECT brand_name,round(avg(screen_size)) As "Screen_Size" FROM 
nitin.smartphones GROUP BY brand_name ORDER BY Screen_Size ASC LIMIT 1;

-- Avg price of 5g vs Avg price of non 5g phones
SELECT has_5g,round(avg(price)) AS "Average Price" FROM nitin.smartphones GROUP BY has_5g;

-- Group smartphones by the brand and find the brand with the highest number of models that have both nfc and an IR blaster
SELECT brand_name,count(*) As "Num_of_Models" FROM nitin.smartphones where has_nfc=True AND has_ir_blaster=True GROUP BY brand_name;

-- Find all samsung smartphones and find out the average price for NFC and NFC phones
SELECT has_nfc,round(avg(price)) AS "Average Price" FROM nitin.smartphones where brand_name="samsung"  GROUP BY has_nfc;

-- Find the avg rating of smartphones which as more than 20 phones
SELECT brand_name,count(*) As "Num Of_Phones",round(avg(rating)) AS "Average_Rating" 
FROM nitin.smartphones
group by brand_name
having count(*)>20;

 -- Find the top 3 brands with the highest avg ram that have a refresh rate of at least 90 Hz and fast charging available 
 -- and don't consider brands which have less than 10 phones
SELECT brand_name,round(avg(ram_capacity)) AS "Average_Ram_Capacity" ,count(*) AS "Num_Of_Phones" FROM nitin.smartphones  
where refresh_rate>=90 AND fast_charging_available=1
Group by brand_name having count(*)>=10 ORDER BY Average_Ram_Capacity DESC limit 3 ;

SELECT * FROM nitin.ipl;

-- IPL
-- Find the Top 5 batsman in the ipl
SELECT batter,sum(batsman_run) AS "Runs" FROM nitin.ipl GROUP BY batter ORDER BY RUNS DESC LIMIT 5;

-- Find the 2nd highest six hitter in IPL?
SELECT batter,count(batsman_run) AS "Total_Six" FROM nitin.ipl 
where batsman_run=6
GROUP BY batter  order by Total_Six DESC LIMIT 1,1;

-- Find Virat Kohli performance against all bowler
SELECT bowler,batter,sum(batsman_run) AS "Total_Runs"  FROM nitin.ipl 
where batter="V kohli" GROUP BY bowler ORDER BY Total_Runs DESC;

-- Find the top ten batsman with centuries in IPL
SELECT ID,batter,sum(batsman_run) AS "Runs" FROM nitin.ipl GROUP BY ID ,BATTER having sum(batsman_run)>=100 order by batter DESC;











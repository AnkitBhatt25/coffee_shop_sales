SELECT * FROM coffee_shop_sales;

UPDATE coffee_shop_sales
SET transaction_date = str_to_date(transaction_date, '%d-%m-%Y' );

ALTER TABLE coffee_shop_sales
MODIFY COLUMN transaction_date DATE;
DESCRIBE coffee_shop_sales;

UPDATE coffee_shop_sales
SET transaction_time = str_to_date(transaction_time, '%H:%i:%s' );

ALTER TABLE coffee_shop_sales
MODIFY COLUMN transaction_time TIME;

ALTER TABLE coffee_shop_sales
CHANGE COLUMN ï»¿transaction_id  transaction_id INT;

SELECT round(sum(transaction_qty * unit_price)) AS total_sales FROM coffee_shop_sales  

WHERE month(transaction_date) = 3;

SELECT 
    MONTH(transaction_date) AS month,
    ROUND(SUM(unit_price * transaction_qty)) AS total_sales,
    (SUM(unit_price * transaction_qty) - LAG(SUM(unit_price * transaction_qty), 1)
    OVER (ORDER BY MONTH(transaction_date))) / LAG(SUM(unit_price * transaction_qty), 1) 
    OVER (ORDER BY MONTH(transaction_date)) * 100 AS mom_increase_percentage
FROM 
    coffee_shop_sales
WHERE 
    MONTH(transaction_date) IN (4, 5) -- for months of April and May
GROUP BY 
    MONTH(transaction_date)
ORDER BY 
    MONTH(transaction_date);
    
    ------
    
    SELECT COUNT(transaction_id) as Total_Orders
FROM coffee_shop_sales 
WHERE MONTH (transaction_date)= 5; -- for month of (CM-May)
 

SELECT
    MONTH(transaction_date) AS month,
    ROUND(COUNT(transaction_id)) AS total_orders,
    (COUNT(transaction_id) - LAG(COUNT(transaction_id), 1) 
    OVER (ORDER BY MONTH(transaction_date))) / LAG(COUNT(transaction_id), 1) 
    OVER (ORDER BY MONTH(transaction_date)) * 100 AS mom_increase_percentage
FROM 
    coffee_shop_sales
WHERE 
    MONTH(transaction_date) IN (4, 5) -- for April and May
GROUP BY 
    MONTH(transaction_date)
ORDER BY 
    MONTH(transaction_date);


----

SELECT SUM(transaction_qty) as Total_Quantity_Sold
FROM coffee_shop_sales 
WHERE MONTH(transaction_date) = 5;     -- for may


SELECT 
    MONTH(transaction_date) AS month,
    ROUND(SUM(transaction_qty)) AS total_quantity_sold,
    (SUM(transaction_qty) - LAG(SUM(transaction_qty), 1) 
    OVER (ORDER BY MONTH(transaction_date))) / LAG(SUM(transaction_qty), 1) 
    OVER (ORDER BY MONTH(transaction_date)) * 100 AS mom_increase_percentage
FROM 
    coffee_shop_sales
WHERE 
    MONTH(transaction_date) IN (4, 5)   -- for April and May
GROUP BY 
    MONTH(transaction_date)
ORDER BY 
    MONTH(transaction_date);
    ---
    
    
    SELECT
		concat(round(sum(transaction_qty * unit_price)/1000 , 1) , 'K') as total_sales,
        concat(round(count(transaction_id)/1000 , 1), 'K') as total_orders,
        concat(round(sum(transaction_qty)/1000, 1), 'K') as tatal_qty_sold
        
     FROM coffee_shop_sales
     WHERE
		transaction_date = '2023-05-18';
        
	--
    
    SELECT 
    CASE 
        WHEN DAYOFWEEK(transaction_date) IN (1, 7) THEN 'Weekends'
        ELSE 'Weekdays'
    END AS day_type,
    concat(ROUND(SUM(unit_price * transaction_qty)/1000,2),'K') AS total_sales
FROM 
    coffee_shop_sales
WHERE 
    MONTH(transaction_date) = 5  -- Filter for May
GROUP BY 
    CASE 
        WHEN DAYOFWEEK(transaction_date) IN (1, 7) THEN 'Weekends'
        ELSE 'Weekdays'
    END;
    
    --
    
    SELECT store_location,
			concat(round(sum(transaction_qty * transaction_qty)/1000,1), 'K') as total_sales
            from coffee_shop_sales
            
            group by store_location
            order by concat(round(sum(transaction_qty * transaction_qty)/1000,1), 'K') desc;
            
            --
            
            SELECT CONCAT(ROUND(AVG(total_sales)/1000,1) , 'k') as avg_sales
            FROM 
				(select sum(transaction_qty * unit_price) as total_sales
                from  coffee_shop_sales
                where month(transaction_date) = 5 -- may
                group by transaction_date
                ) as internal_query;
                
       SELECT   
		day(transaction_date) AS day_of_month,
        concat(round(sum(unit_price * transaction_qty)/1000,1), 'K') as total_sales
	
      FROM coffee_shop_sales
      where month(transaction_date) = 5 -- may
      group by transaction_date
      order by transaction_date;
      --
      
      SELECT 
    day_of_month,
    CASE 
        WHEN total_sales > avg_sales THEN 'Above Average'
        WHEN total_sales < avg_sales THEN 'Below Average'
        ELSE 'Average'
    END AS sales_status,
    total_sales
FROM (
    SELECT 
        DAY(transaction_date) AS day_of_month,
        SUM(unit_price * transaction_qty) AS total_sales,
        AVG(SUM(unit_price * transaction_qty)) OVER () AS avg_sales
    FROM 
        coffee_shop_sales
    WHERE 
        MONTH(transaction_date) = 5  -- Filter for May
    GROUP BY 
        DAY(transaction_date)
) AS sales_data
ORDER BY 
    day_of_month;
    
    -- productwise analysis
    
    select product_category,
			sum(transaction_qty * unit_price) as total_sales
	from coffee_shop_sales
    where month(transaction_date) = 5 
    group by product_category
    order by sum(transaction_qty * unit_price) ;
    
    -- top 10
    
    select product_type,
			sum(transaction_qty * unit_price) as total_sales
	from coffee_shop_sales
    where month(transaction_date) = 5 
    group by product_type
    order by sum(transaction_qty * unit_price) desc
    limit 10;
    
    -- sales by day & hour
    
    SELECT 
    ROUND(SUM(unit_price * transaction_qty)) AS Total_Sales,
    SUM(transaction_qty) AS Total_Quantity,
    COUNT(*) AS Total_Orders
FROM 
    coffee_shop_sales
WHERE 
    DAYOFWEEK(transaction_date) = 3 -- Filter for Tuesday 
    AND HOUR(transaction_time) = 8 -- Filter for hour number 8
    AND MONTH(transaction_date) = 5; -- Filter for May )
    --

select hour(transaction_time),
     concat(round(sum(unit_price * transaction_qty)/1000,1), 'K') as total_sales
     from coffee_shop_sales
     where month(transaction_date) = 5
     group by hour(transaction_time)
     order by hour(transaction_time);
     
     -- sales value from monday to sunday
     
     SELECT 
    CASE 
        WHEN DAYOFWEEK(transaction_date) = 2 THEN 'Monday'
        WHEN DAYOFWEEK(transaction_date) = 3 THEN 'Tuesday'
        WHEN DAYOFWEEK(transaction_date) = 4 THEN 'Wednesday'
        WHEN DAYOFWEEK(transaction_date) = 5 THEN 'Thursday'
        WHEN DAYOFWEEK(transaction_date) = 6 THEN 'Friday'
        WHEN DAYOFWEEK(transaction_date) = 7 THEN 'Saturday'
        ELSE 'Sunday'
    END AS Day_of_Week,
    ROUND(SUM(unit_price * transaction_qty)) AS Total_Sales
FROM 
    coffee_shop_sales
WHERE 
    MONTH(transaction_date) = 5 -- Filter for May (month number 5)
GROUP BY 
    CASE 
        WHEN DAYOFWEEK(transaction_date) = 2 THEN 'Monday'
        WHEN DAYOFWEEK(transaction_date) = 3 THEN 'Tuesday'
        WHEN DAYOFWEEK(transaction_date) = 4 THEN 'Wednesday'
        WHEN DAYOFWEEK(transaction_date) = 5 THEN 'Thursday'
        WHEN DAYOFWEEK(transaction_date) = 6 THEN 'Friday'
        WHEN DAYOFWEEK(transaction_date) = 7 THEN 'Saturday'
        ELSE 'Sunday'
    END;


































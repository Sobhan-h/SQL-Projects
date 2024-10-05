WITH average_height AS (
SELECT item_no,"operator", height,
           AVG(height) OVER (PARTITION BY "operator" order by item_no rows between 4 preceding and current row) 		AS avg_height,
           STDDEV(height) OVER (PARTITION BY "operator" order by item_no rows between 4 preceding and current 		    row) AS stddev_height,
		   count(*) OVER (PARTITION BY "operator" order by item_no rows between 4 preceding and current row) as 		"row_count",
		   ROW_NUMBER() OVER (PARTITION BY "operator" order by item_no) as "row_number"
FROM manufacturing_parts
),
control_limits as (SELECT item_no, "operator", height, avg_height, stddev_height, "row_count","row_number", 
       (avg_height + (3 * stddev_height / SQRT(5))) AS ucl,
       (avg_height - (3 * stddev_height / SQRT(5))) AS lcl	   
FROM average_height
)
Select "operator", height, avg_height, stddev_height, ucl, lcl, "row_number",
		Case when height > ucl or height < lcl then true 
			else false 
			 end as alert
		from control_limits 
			 where "row_count" = 5
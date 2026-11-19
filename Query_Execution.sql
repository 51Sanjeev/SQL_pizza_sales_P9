-- Retrieve the total number of order placed
SELECT COUNT(order_id) as Total_orders FROM orders;

-- Calculate the total revenue generated from pizza sales
SELECT 
    ROUND(SUM(o.quantity * p.price), 2) AS Total_revenue
FROM
    order_details AS o
        JOIN
    pizzas AS p USING (pizza_id);

-- Identify the highest price pizza
SELECT 
    pt.name, p.price
FROM
    pizza_types AS pt
        JOIN
    pizzas AS p USING (pizza_type_id)
ORDER BY p.price DESC
LIMIT 1;

-- Identify the most common pizza type ordered
SELECT 
    p.size, COUNT(o.order_details_id) as Order_count
FROM
    pizzas AS p
        JOIN
    order_details AS o USING (pizza_id)
GROUP BY p.size;

-- List top 5 most ordered pizza types along with their quantities.
SELECT pt.name, SUM(o.quantity) AS quantity 
FROM order_details as o
JOIN pizzas as p
ON o.pizza_id = p.pizza_id
JOIN pizza_types as pt
ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY quantity DESC
LIMIT 5;

-- Join the necessary table to find the total quantity of each pizza category ordered.
SELECT 
    pt.category, SUM(o.quantity) AS quantity
FROM
    pizzas AS p
        JOIN
    order_details AS o ON p.pizza_id = o.pizza_id
        JOIN
    pizza_types AS pt ON pt.pizza_type_id = p.pizza_type_id
GROUP BY (pt.category)
ORDER BY quantity DESC;

-- Determine the distribution orders by hours of the day.
SELECT 
    HOUR(order_time) AS Hour_of_day,
    COUNT(order_id) AS Hourly_orders
FROM
    orders
GROUP BY Hour_of_day
ORDER BY Hourly_orders DESC;

-- Join relevant tables to find the category wise distribution of pizzas.
SELECT pt.category, COUNT(p.pizza_id) as distribution  -- Same pizza available in different sizes.
FROM pizzas AS p
JOIN pizza_types AS pt
USING (pizza_type_id)
GROUP BY pt.category;

-- Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT 
    ROUND(AVG(quantity)) AS Avg_pizza_quantity_per_day
FROM
    (SELECT 
        o.order_date, SUM(od.quantity) AS quantity
    FROM
        orders AS o
    JOIN order_details AS od USING (order_id)
    GROUP BY o.order_date) AS order_data;
    
-- Determine the top 3 most ordered pizzas based on the revenue.
SELECT 
    pt.name, SUM(p.price * o.quantity) AS revenue
FROM
    pizzas AS p
        JOIN
    order_details AS o USING (pizza_id)
        JOIN
    pizza_types AS pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY revenue DESC
LIMIT 3;

-- Calculagte the percentage contribution of each pizza type revenue.

SELECT 
    pt.category,
    ROUND((SUM(p.price * o.quantity) / (SELECT 
                    SUM(p.price * o.quantity)
                FROM
                    order_details AS o
                        JOIN
                    pizzas AS p USING (pizza_id))) * 100,
            2) AS Revenue
FROM
    order_details AS o
        JOIN
    pizzas AS p USING (pizza_id)
        JOIN
    pizza_types AS pt USING (pizza_type_id)
GROUP BY pt.category;


-- Calculagte the percentage contribution of each pizza name revenue.
WITH Total_Revenue AS
(SELECT SUM(p.price*o.quantity) as total
FROM order_details as o
JOIN pizzas as p
USING (pizza_id)
)
SELECT pt.name, 
	CONCAT(ROUND((SUM(p.price*o.quantity)/MAX(tr.total))*100,2),'%') AS Revenue_pr_pizza
FROM order_details AS o
JOIN pizzas AS p
USING (pizza_id)
JOIN pizza_types as pt
USING(pizza_type_id)
CROSS JOIN Total_Revenue AS tr
GROUP BY pt.name;

-- Analyze the cumulative revenue generated over time
SELECT 
	order_date, 
    revenue, 
    SUM(revenue) OVER(ORDER BY order_date) as Cum_revenue 
FROM
	(SELECT o.order_date, ROUND(SUM(p.price*od.quantity),2) as revenue
		FROM order_details as od
		JOIN pizzas AS p
		USING (pizza_id)
		JOIN orders AS o
		USING (order_id)
	GROUP BY o.order_date) AS pr_day_revenue;

-- Determine the top 3 most ordered pizza types based on revenue  for each pizza category
SELECT category,name,revenue,R_rank FROM
(SELECT category,name,revenue,
DENSE_RANK() OVER(PARTITION BY category ORDER BY revenue DESC) AS R_rank
FROM
(SELECT pt.category,pt.name,ROUND(SUM(p.price*o.quantity),2) AS revenue
FROM order_details AS o
JOIN pizzas AS p
USING (pizza_id)
JOIN pizza_types AS pt
USING (pizza_type_id)
GROUP BY pt.category,pt.name) AS a) AS B
WHERE R_rank<=3;

/*---------------OR------------------------- USING CTE*/

WITH Pizza_Revenue AS 
(
	SELECT pt.category,pt.name, ROUND(SUM(p.price*o.quantity),2) AS revenue
    FROM order_details AS o
    JOIN pizzas AS p
    USING (pizza_id)
    JOIN pizza_types as pt
	USING (pizza_type_id)
	GROUP BY pt.category, pt.name
),
Pizza_Rank AS(
	SELECT 
		category,
        name,
        revenue,
        DENSE_RANK() OVER(PARTITION BY category ORDER BY revenue DESC) AS R_rank
	FROM Pizza_Revenue
)
SELECT * FROM Pizza_Rank WHERE R_rank<=3;
 

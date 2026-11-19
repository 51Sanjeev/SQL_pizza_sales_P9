CREATE DATABASE pizzahut;
USE pizzahut;
select COUNT(order_id) FROM orders;
CREATE TABLE orders (
order_id int PRIMARY KEY,
order_date Date NOT NULL,
order_tiem TIME NOT NULL);

ALTER TABLE orders RENAME COLUMN order_tiem TO order_time;
SHOW GLOBAL VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE "E:/MYSQL/Pizz_sales_P9/orders.csv"
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 ROWS
(order_id,order_date,order_time);


CREATE TABLE order_details(
order_details_id INT PRIMARY KEY,
order_id INT NOT NULL,
pizza_id TEXT NOT NULL,
quantity INT NOT NULL);

SET GLOBAL local_infile = 0;
SHOW GLOBAL VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
SHOW GLOBAL VARIABLES LIKE 'local_infile';

LOAD DATA LOCAL INFILE "E:\\MYSQL\\Pizz_sales_P9\\order_details.csv"
INTO TABLE order_details
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_details_id,order_id,pizza_id,quantity);

SET GLOBAL local_infile = 0;






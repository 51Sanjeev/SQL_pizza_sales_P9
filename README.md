# 🍕 Pizza Sales Analysis using SQL

## 📌 Project Overview

This project focuses on analyzing pizza sales data using **MySQL** to extract meaningful business insights and understand sales performance.

The analysis explores key business metrics such as total orders, revenue, popular pizza types, category-wise sales, hourly order distribution, and cumulative revenue.

The project demonstrates practical SQL skills by solving real-world business questions using joins, aggregate functions, subqueries, CTEs, and window functions.

## 🎯 Project Objectives

- Calculate the total number of orders and revenue generated.
- Identify the highest-priced and most popular pizzas.
- Analyze pizza sales across different categories and sizes.
- Understand order distribution throughout the day.
- Identify top-performing pizzas based on quantity and revenue.
- Calculate revenue contribution by pizza category and pizza type.
- Analyze daily and cumulative revenue trends.
- Find the top 3 revenue-generating pizzas within each category.

## 🛠️ Tools & Technologies

- **Database:** MySQL
- **IDE:** MySQL Workbench
- **Language:** SQL
- **Dataset:** Pizza Sales Dataset (CSV files)

## 📂 Project Structure

```text
Pizza-Sales-SQL-Analysis/
│
├── Dataset/
│   ├── orders.csv
│   ├── order_details.csv
│   ├── pizzas.csv
│   ├── pizza_types.csv
│
├── SQL/
│   └── Schema.sql
|   └── Query_Execution.sql
│
└── README.md
```

## 🗄️ Database Setup & Data Import

1. Created a database named `pizzahut`.
2. Created the required tables using appropriate data types and constraints.
3. Imported CSV datasets into MySQL using `LOAD DATA LOCAL INFILE`.
4. Configured the `local_infile` variable to enable CSV data loading.
5. Used primary keys and table relationships to organize the data.

## 📊 SQL Analysis & Business Questions

### 1. Basic Sales Analysis
- Retrieved the total number of orders placed.
- Calculated total revenue generated from pizza sales.
- Identified the highest-priced pizza.
- Analyzed the most commonly ordered pizza sizes.

### 2. Pizza Performance Analysis
- Identified the top 5 most ordered pizza types by quantity.
- Calculated the total quantity of pizzas ordered in each category.
- Identified the top 3 pizzas based on revenue.

### 3. Order Trends Analysis
- Analyzed hourly order distribution throughout the day.
- Calculated the average number of pizzas ordered per day.
- Examined daily sales patterns.

### 4. Revenue Analysis
- Calculated the percentage contribution of each pizza category to total revenue.
- Calculated the percentage contribution of individual pizza types to total revenue.
- Analyzed cumulative revenue generated over time.

### 5. Advanced SQL Analysis
- Used `DENSE_RANK()` with `PARTITION BY` to identify the top 3 revenue-generating pizzas within each category.
- Implemented the same analysis using both subqueries and Common Table Expressions (CTEs).

## 💡 SQL Concepts & Techniques Used

| SQL Concept | Application |
|---|---|
| DDL & DML | Database and table creation |
| Data Import | `LOAD DATA LOCAL INFILE` |
| Aggregate Functions | `SUM()`, `COUNT()`, `AVG()`, `ROUND()` |
| Joins | Combining multiple related tables |
| GROUP BY & ORDER BY | Grouping and sorting sales data |
| Subqueries | Calculating total revenue and filtering results |
| CTEs | Organizing complex SQL queries |
| Window Functions | Cumulative revenue analysis |
| DENSE_RANK() | Ranking pizzas within categories |
| Date & Time Functions | Analyzing daily and hourly order trends |

## 📈 Key Business Insights

This analysis helps understand:

- Overall sales performance through total orders and revenue.
- Which pizza types and categories contribute the most to sales.
- Customer ordering patterns based on pizza sizes and order hours.
- Revenue distribution across different pizza products.
- Daily revenue trends and cumulative business growth.
- Best-performing pizzas within each category.

## 🚀 What I Learned

Through this project, I strengthened my understanding of SQL and gained practical experience in:

- Importing and managing real-world CSV datasets in MySQL.
- Writing complex SQL queries involving multiple table joins.
- Performing business analysis using aggregate functions.
- Using subqueries and CTEs to simplify complex queries.
- Applying window functions for ranking and cumulative calculations.
- Translating business questions into SQL queries and meaningful insights.

Aspiring Data Analyst | SQL | Python | Excel | Power BI

[GitHub Profile](https://github.com/51Sanjeev)

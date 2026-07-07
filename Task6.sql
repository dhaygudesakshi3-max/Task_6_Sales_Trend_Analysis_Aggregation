USE sales_analysis;
drop table online_sales;
CREATE TABLE online_sales (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    product_id INT,
    category VARCHAR(50),
    city VARCHAR(50),
    quantity INT,
    unit_price DECIMAL(10,2),
    amount DECIMAL(10,2),
    payment_method VARCHAR(50)
);
select * from online_sales_extended;
SELECT COUNT(*) FROM online_sales_extended;


-- Monthly Revenue Analysis --

SELECT
    YEAR(order_date) AS Year,
    MONTH(order_date) AS Month,
    SUM(amount) AS Monthly_Revenue,
    COUNT(DISTINCT order_id) AS Order_Volume
FROM online_sales_extended
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY Year, Month;


-- Monthly Order Volume --

SELECT
    YEAR(order_date) AS Year,
    MONTH(order_date) AS Month,
    COUNT(DISTINCT order_id) AS Order_Volume
FROM online_sales_extended
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY Year, Month;

-- Monthly Revenue + Order Volume --

SELECT
    YEAR(order_date) AS Year,
    MONTH(order_date) AS Month,
    SUM(amount) AS Revenue,
    COUNT(DISTINCT order_id) AS Order_Volume
FROM online_sales_extended
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY Year, Month;

-- Top 3 Months by Revenue --
SELECT
    YEAR(order_date) AS Year,
    MONTH(order_date) AS Month,
    SUM(amount) AS Revenue
FROM online_sales_extended
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY Revenue DESC
LIMIT 3;

-- Revenue by Category --

SELECT
    category,
    SUM(amount) AS Total_Revenue
FROM online_sales_extended
GROUP BY category
ORDER BY Total_Revenue DESC;

-- Revenue by City --

SELECT
    city,
    SUM(amount) AS Total_Revenue
FROM online_sales_extended
GROUP BY city
ORDER BY Total_Revenue DESC;

-- Payment Method Analysis --

SELECT
    payment_method,
    COUNT(order_id) AS Total_Orders,
    SUM(amount) AS Total_Revenue
FROM online_sales_extended
GROUP BY payment_method
ORDER BY Total_Revenue DESC;

-- Average Order Value --
SELECT
    AVG(amount) AS Average_Order_Value
FROM online_sales_extended;

-- Highest and lowest order value --
SELECT
    MAX(amount) AS Highest_Order,
    MIN(amount) AS Lowest_Order
FROM online_sales_extended;

-- Total Revenue --
SELECT
    SUM(amount) AS Total_Revenue
FROM online_sales_extended;

-- Total Orders --
SELECT
    COUNT(DISTINCT order_id) AS Total_Orders
FROM online_sales_extended;



















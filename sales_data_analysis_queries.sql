
SELECT * FROM sales_data;

-- 1. Top 5 States Generating the Highest Revenue
SELECT 
    "ship-state" AS state,
    SUM(Amount) AS total_revenue
FROM 
    sales_data
GROUP BY 
    "ship-state"
ORDER BY 
    total_revenue DESC
LIMIT 5;

-- 2. Order Distribution Across Different Order Statuses
SELECT 
    Status,
    COUNT("Order ID") AS order_count,
    ROUND(100.0 * COUNT("Order ID") / SUM(COUNT("Order ID")) OVER(), 2) AS percentage_share
FROM 
    sales_data
GROUP BY 
    Status;

-- 3. Order Distribution Across Age Groups and Genders
SELECT 
    "Age Group",
    Gender,
    COUNT("Order ID") AS order_count
FROM 
    sales_data
GROUP BY 
    "Age Group", Gender
ORDER BY 
    "Age Group", Gender;

-- 4. Platforms Contributing Most to Overall Sales Revenue
SELECT 
    Channel,
    SUM(Amount) AS total_revenue
FROM 
    sales_data
GROUP BY 
    Channel
ORDER BY 
    total_revenue DESC;

-- 5. Order Distribution Across Various E-commerce Platforms
SELECT 
    Channel,
    COUNT("Order ID") AS order_count
FROM 
    sales_data
GROUP BY 
    Channel
ORDER BY 
    order_count DESC;

-- 6. Monthly Average Order Value (AOV) Trend
SELECT 
    Month,
    ROUND(SUM(Amount) / COUNT(DISTINCT "Order ID"), 2) AS avg_order_value
FROM 
    sales_data
GROUP BY 
    Month
ORDER BY 
    Month;

-- 7. Monthly Sales and Order Volumes Comparison
SELECT 
    Month,
    SUM(Amount) AS total_sales,
    COUNT("Order ID") AS total_orders
FROM 
    sales_data
GROUP BY 
    Month
ORDER BY 
    Month;

-- 8. Sales Share Comparison Between Male and Female Customers
SELECT 
    Gender,
    SUM(Amount) AS total_sales,
    ROUND(100.0 * SUM(Amount) / SUM(SUM(Amount)) OVER(), 2) AS percentage_share
FROM 
    sales_data
GROUP BY 
    Gender;

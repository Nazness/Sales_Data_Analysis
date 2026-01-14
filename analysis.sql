-- =========================
-- Sales Data Analysis
-- =========================

-- Data Cleaning
DELETE FROM Orders
WHERE "Quantity Ordered" IS NULL
   OR "Price Each" IS NULL
   OR "Order Date" IS NULL;

-- Data Transformation
CREATE TABLE CleanOrders AS
SELECT
  "Order ID" AS order_id,
  Product AS product,
  CAST("Quantity Ordered" AS INTEGER) AS quantity,
  CAST("Price Each" AS REAL) AS price,
  DATE("Order Date") AS order_date,
  "Purchase Address" AS address
FROM Orders;

-- Analysis

-- Total Revenue
SELECT SUM(quantity * price) AS total_revenue
FROM CleanOrders;

-- Top 5 Products by Revenue
SELECT product,
       SUM(quantity * price) AS revenue
FROM CleanOrders
GROUP BY product
ORDER BY revenue DESC
LIMIT 5;

-- Daily Sales Performance
SELECT order_date,
       SUM(quantity * price) AS daily_revenue
FROM CleanOrders
GROUP BY order_date
ORDER BY order_date;

-- Average Order Value
SELECT AVG(quantity * price) AS avg_order_value
FROM CleanOrders;

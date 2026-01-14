# Sales_Data_Analysis
Sales Data Analysis

## Project Overview
This project demonstrates an end-to-end data analysis workflow using SQL.
The goal was to analyze sales data, clean raw records, transform the dataset into analytical form, and extract meaningful business insights.

## Dataset
Source: Public sales dataset (CSV format)

Columns:
- Order ID
- Product
- Quantity Ordered
- Price Each
- Order Date
- Purchase Address

## Tools & Technologies
- SQLite
- DB Browser for SQLite
- SQL
- GitHub

## Data Cleaning
The dataset contained missing and invalid records.

Steps performed:
- Removed incomplete records
- Converted text fields to numeric and date formats

Example:
```sql
DELETE FROM Orders
WHERE "Quantity Ordered" IS NULL
   OR "Price Each" IS NULL
   OR "Order Date" IS NULL;
```

## Data Transformation
Created a clean analytical table with proper data types.

```sql
CREATE TABLE CleanOrders AS
SELECT
  "Order ID" AS order_id,
  Product AS product,
  CAST("Quantity Ordered" AS INTEGER) AS quantity,
  CAST("Price Each" AS REAL) AS price,
  DATE("Order Date") AS order_date,
  "Purchase Address" AS address
FROM Orders;
```

## Analysis & Insights

### Total Revenue
```sql
SELECT SUM(quantity * price) AS total_revenue
FROM CleanOrders;
```

### Top 5 Products by Revenue
```sql
SELECT product,
       SUM(quantity * price) AS revenue
FROM CleanOrders
GROUP BY product
ORDER BY revenue DESC
LIMIT 5;
```

### Daily Sales Performance
```sql
SELECT order_date,
       SUM(quantity * price) AS daily_revenue
FROM CleanOrders
GROUP BY order_date
ORDER BY order_date;
```

### Average Order Value
```sql
SELECT AVG(quantity * price) AS avg_order_value
FROM CleanOrders;
```

## Key Findings
- A small number of products generate the majority of total revenue
- Sales volume fluctuates significantly across days
- Average order value remains relatively stable

## Project Structure
```
sales-data-analysis/
├── data/
│   └── sales.csv
├── sql/
│   └── analysis.sql
├── screenshots/
└── README.md
```

## Skills Demonstrated
- SQL querying and aggregation
- Data cleaning and transformation
- Analytical thinking
- Business insight extraction


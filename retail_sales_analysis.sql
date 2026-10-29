
-- RETAIL SALES ANALYTICS USING DATABRICKS
-- Table: Innomatics.default.sales_data

-- 1. OVERALL SALES PERFORMANCE
SELECT
    COUNT(*) AS total_records,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    SUM(Quantity) AS total_quantity_sold,
    COUNT(DISTINCT Product_ID) AS distinct_products
FROM Innomatics.default.sales_data;


-- 2. REGIONAL SALES ANALYSIS
SELECT
    Region,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    SUM(Quantity) AS quantity_sold,
    COUNT(*) AS total_records
FROM Innomatics.default.sales_data
GROUP BY Region
ORDER BY total_revenue DESC;


-- 3. MONTHLY SALES TREND ANALYSIS
SELECT
    DATE_FORMAT(Date, 'yyyy-MM') AS sales_month,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    SUM(Quantity) AS quantity_sold
FROM Innomatics.default.sales_data
GROUP BY DATE_FORMAT(Date, 'yyyy-MM')
ORDER BY sales_month;


-- 4. PRODUCT CATEGORY ANALYSIS
SELECT
    Product_Category,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    ROUND(
        SUM(Revenue) * 100.0 /
        SUM(SUM(Revenue)) OVER (),
        2
    ) AS revenue_share_percentage
FROM Innomatics.default.sales_data
GROUP BY Product_Category
ORDER BY total_revenue DESC;


-- 5. TOP FIVE PRODUCTS BY REVENUE
SELECT
    Product_ID,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    SUM(Quantity) AS quantity_sold
FROM Innomatics.default.sales_data
GROUP BY Product_ID
ORDER BY total_revenue DESC
LIMIT 5;


-- 6. SALES CHANNEL ANALYSIS
SELECT
    Sales_Channel,
    ROUND(SUM(Revenue), 2) AS total_revenue,
    SUM(Quantity) AS quantity_sold,
    COUNT(*) AS total_records
FROM Innomatics.default.sales_data
GROUP BY Sales_Channel
ORDER BY total_revenue DESC;

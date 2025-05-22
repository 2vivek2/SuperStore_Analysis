-- Shipping time

WITH ShippingTimes AS (
    SELECT 
        `Order ID`,
        `Ship Mode`,
        DATEDIFF(`Ship Date`, `Order Date`) AS Shipping_time
    FROM sales_data
)
SELECT 
    `Ship Mode`,
        count(`Order ID`) AS NoOfOrders,
    CONCAT(ROUND(AVG(Shipping_time), 0), " Days") AS AvgShippingTime
FROM ShippingTimes
GROUP BY `Ship Mode`
ORDER BY AvgShippingTime;

-- Top 10 Customers

SELECT 
      `Customer ID`,
      `Customer Name`,
      Segment,
      City,
      State,
      Region,
      ROUND(SUM(Sales),2) AS Top10Customer
      FROM sales_data
      GROUP BY `Customer ID`,`Customer Name`,Segment, City, State, Region
      ORDER BY Top10Customer DESC LIMIT 10;
      
      -- Avg Order Value

SELECT 
      ROUND(SUM(Sales)/ COUNT(`Order ID`),2) AS Avg_Order_value
      FROM sales_data;

-- Sales by Region/State/City

WITH sales_by_region AS (
    SELECT 
        City,
        Region,
        State,
        ROUND(SUM(Sales), 2) AS Region_total_sales
    FROM sales_data
    GROUP BY City, Region, State
),
total_sales AS (
    SELECT ROUND(SUM(Sales), 2) AS OverallSales
    FROM sales_data
)
SELECT 
    r.City,
    r.Region,
    r.State,
    r.Region_total_sales,
    t.OverallSales,
    CONCAT(ROUND((r.Region_total_sales / t.OverallSales) * 100, 2), '%') AS PerctOfOverallSales
FROM sales_by_region r
CROSS JOIN total_sales t
ORDER BY (r.Region_total_sales / t.OverallSales) DESC;

-- Category Wise Sales

WITH Category_wise AS(
SELECT 
     category,
     `Sub-Category`,
     ROUND(SUM(Sales) OVER(partition by category,`Sub-Category` ),2) AS Category_total_sales,
     ROUND(sum(Sales) OVER(),2) AS OverallSales
     FROM sales_data)
     SELECT 
       DISTINCT category,
     `Sub-Category`,
     Category_total_sales,
     OverallSales,
    CONCAT(ROUND(((Category_total_sales/ OverallSales)*100),2),'%') AS PerctOfOverallSales
     FROM Category_wise;

-- Category Wise Sales
SELECT 
  Category,
  SUM(Sales) 
     FROM sales_data
     GROUP BY Category;

SELECT 
     category,
     `Sub-Category`,
     SUM(Sales) OVER(partition by category,`Sub-Category` ) AS Category_total_sales
     FROM sales_data;

-- Monthly, Quarterly and YEarly Analysis

SELECT 
    YEAR(`Order Date`) AS yearly,
    QUARTER(`Order Date`) AS quarterly,
    MONTH(`Order Date`) AS month_num,
    DATE_FORMAT(`Order Date`, '%b') AS month_name,
    ROUND(SUM(Sales), 2) AS total_sale
FROM sales_data
GROUP BY yearly, quarterly, month_num, month_name
ORDER BY yearly, quarterly, month_num;

-- Miscellaneous 

SELECT ROUND(SUM(Sales),2) AS Total_sales FROM sales_data;
SELECT ROUND(SUM(Sales),2) FROM sales_data;
SELECT SUM(Sales) FROM sales_data;

-- NUmber Of Total Unique Customers And Total Customers

SELECT 
      COUNT(`Row ID`) AS Total_Order,
      COUNT(DISTINCT `Customer ID`) AS Unique_Customers
      FROM sales_data;

-- Total Sales Based On Segments, Total Order Based On Each Segments

WITH SalesBySegment AS (
SELECT 
      distinct Segment,
      COUNT(`Order ID`) OVER(partition by Segment) AS Total_Order_By_Segments,
      ROUND(SUM(Sales) OVER(partition by Segment),2) AS Sales_by_segment,
      ROUND(SUM(Sales) OVER(),2) AS OverallSales
      FROM sales_data
      )
      SELECT 
            distinct Segment,
            Total_Order_By_Segments,
            Sales_by_segment,
            OverallSales,
			CONCAT(ROUND((Sales_by_segment/ OverallSales) *100 ,2),'%') AS Perct_of_sales_By_Segments
            FROM SalesBySegment;
            
            
  -- top Selling Products
  
  SELECT 
        Category,
        ROUND(SUM(Sales),2) AS Total_Sales
        FROM sales_data
        GROUP BY Category
        ORDER BY Total_sales DESC;
     
     -- Product Performance By Region
     
     SELECT 
        DISTINCT Region,
        Category,
        ROUND(SUM(Sales) OVER(partition by Region, Category ORDER BY Region),2) AS Total_sales,
        ROUND(SUM(Sales) OVER(),2) AS Overall_Sales,
        CONCAT(ROUND((SUM(Sales) OVER(partition by Region, Category ORDER BY Region)/SUM(Sales) OVER()*100),2),' %') AS perct_Overall_sales
        FROM sales_data;
        
        
        -- Inventory Optimization
        -- Identify high-demand and low-demand products.
        
      WITH CTE AS (
    SELECT
        Category,
        `Sub-Category`,
        ROUND(SUM(Sales), 2) AS Total_sales_by_Sub_category
    FROM sales_data
    GROUP BY Category, `Sub-Category`
)
SELECT 
    Category,
    `Sub-Category`,
    Total_sales_by_Sub_category,
    DENSE_RANK() OVER(PARTITION BY Category ORDER BY Total_sales_by_Sub_category DESC) AS rn
FROM CTE;

        -- Are there regions with longer delivery times?
        
        
WITH RankedCities AS (
    SELECT 
        State,
        City,
        CONCAT(ROUND(AVG(DATEDIFF(`Ship Date`, `Order Date`)), 0),' Days') AS AvgDelivery_Time
    FROM sales_data
    GROUP BY State, City
),
Ranked AS (
    SELECT 
         State,
        City,
        AvgDelivery_Time,
        DENSE_RANK() OVER(partition by State ORDER BY AvgDelivery_Time  ) AS RankBasedOnTime
    FROM RankedCities
)
SELECT * 
FROM Ranked
ORDER BY AvgDelivery_Time;


        
        
        
        
        
        
        
        
        
        